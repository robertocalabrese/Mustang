# Copyright: 2025 Roberto Calabrese a.k.a. Kicka
#
# This file is part of "Mustang", a GUI toolkit for Tcl/Tk 9.0 and later
# (https://github.com/robertocalabrese/Mustang).
#
# The author hereby grant permission to use, copy, modify, distribute,
# and license this software and its documentation for any purpose, provided
# that existing copyright notices are retained in all copies and that this
# notice is included verbatim in any distributions. No written agreement,
# license, or royalty fee is required for any of the authorized uses.
# Modifications to this software may be copyrighted by their authors
# and need not follow the licensing terms described here, provided that
# the new terms are clearly indicated on the first page of each file where
# they apply.
#
# IN NO EVENT SHALL THE AUTHOR OR DISTRIBUTORS BE LIABLE TO ANY PARTY
# FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
# ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
# DERIVATIVES THEREOF, EVEN IF THE AUTHOR HAVE BEEN ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# THE AUTHOR AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
# IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHOR AND DISTRIBUTORS HAVE
# NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
# MODIFICATIONS.
#
# GOVERNMENT USE: If you are acquiring this software on behalf of the
# U.S. government, the Government shall have only "Restricted Rights"
# in the software and related documentation as defined in the Federal
# Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
# are acquiring the software on behalf of the Department of Defense, the
# software shall be classified as "Commercial Computer Software" and the
# Government shall have only "Restricted Rights" as defined in Clause
# 252.227-7013 (c) (1) of DFARs.  Notwithstanding the foregoing, the
# author grant the U.S. Government and others acting in its behalf
# permission to use and distribute the software in accordance with the
# terms specified in this license.

# Symbols meanings that may be used by the command infos:
#
#   *text*               --> Italic.
#   **text**             --> Bold.
#   ***text***           --> Italic-bold
#
#   ## text              --> Title.
#   #### text            --> Chapter.
#   ###### text          --> Sub-chapter.
#
#   [text](https:\\...)  --> Link to an internet page.
#   [text](/wiki/...)    --> Link to another file in the wiki.
package provide ::ms::LCHuv_Luv 0.1

# Create the mustang **LCHuv_Luv** package.
namespace eval ::ms::LCHuv_Luv {}

# Create an alias for the mustang **LCHuv_Luv** conversion command.
interp alias {} ::LCHuv_Luv {} ::ms::LCHuv_Luv::Conversion

## Conversion
#
# Transform **LCHuv** colors into **Luv** colors, both in the PCS D50 space.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **LCHuv** colors to convert.
#            Each **LCHuv** color needs to be represented by 3 channels values in the following order and ranges:
#                L   --> Lightness [0,100.0]
#                C   --> Chroma    [0,260.76809620810593]
#                Huv --> Huv       [0,360.0[
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One output **LCHuv** color:
#                    color    --> [list 40 100 80]
#                    results  --> [list 40 100 80]
#
#                Two output **LCHuv** colors:
#                    color1   --> [list 40 100 80]
#                    color2   --> [list 50 40  60]
#                    results  --> [list 40 100 80 50 40 60] <-- all colors channels will be flattened together.
#
#                Three output **LCHuv** colors:
#                    color1   --> [list 40 100 80]
#                    color2   --> [list 50 40  60]
#                    color3   --> [list 80 140 240]
#                    results  --> [list 40 100 80 50 40 60 80 140 240] <-- all colors channels will be flattened together.
#
#                and so on and so forth...
#
# Note:  For info about **LCHuv** to **Luv** conversions visit [BruceLindbloom](http://www.brucelindbloom.com).
#
# Return a list containing the resulting **Luv** colors channels flattened together.
# Each **Luv** color will be represented by 3 channels values in the following order and ranges:
#   L --> Lightness [0,100.0]
#   u --> u         [-134.0,220.0]
#   v --> v         [-140.0,122.0]
#
# Examples:
#
#   One output **Luv** color:
#       color    --> [list 100 -50 50]
#       channels --> [list 100 -50 50]
#
#   Two output **Luv** colors:
#       color1   --> [list 100 -50 50]
#       color2   --> [list 57   80 80]
#       channels --> [list 100 -50 50 57 80 80] <-- all colors channels should be flattened together.
#
#   Three output **Luv** colors:
#       color1   --> [list 100 -50 50]
#       color2   --> [list 57   80 80]
#       color3   --> [list 23   20 12]
#       channels --> [list 100 -50 50 57 80 80 23 20 12] <-- all colors channels should be flattened together.
#
#   and so on and so forth...
proc ::ms::LCHuv_Luv::Conversion { channels } {
    set results [list ]
    foreach { L C Huv } $channels {
        # Convert 'Huv' from degrees to radians.
        set Huv [expr { $Huv*0.017453292519943295 }]

        # Compute 'u' and 'v'
        set u [expr { $C*cos($Huv) }]
        set v [expr { $C*sin($Huv) }]

        lappend results $L $u $v
    }

    return $results
}

#*EOF*