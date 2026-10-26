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
package provide ::ms::LCHab_Lab 0.1

# Create the mustang **LCHab_Lab** package.
namespace eval ::ms::LCHab_Lab {}

# Create an alias for the mustang **LCHab_Lab** conversion command.
interp alias {} ::LCHab_Lab {} ::ms::LCHab_Lab::Conversion

## Conversion
#
# Transform **LCHab** colors into **Lab** colors, both in the PCS D50 space.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **LCHab** colors to convert.
#            Each **LCHab** color needs to be represented by 3 channels values in the following order and ranges:
#                L   --> Lightness [0,100.0]
#                C   --> Chroma    [0,181.01933598375618]
#                Hab --> Hab       [0,360.0[
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **LCHab** color:
#                    color    --> [list 40 100 80]
#                    results  --> [list 40 100 80]
#
#                Two input **LCHab** colors:
#                    color1   --> [list 40 100 80]
#                    color2   --> [list 50 40  60]
#                    results  --> [list 40 100 80 50 40 60] <-- all colors channels will be flattened together.
#
#                Three input **LCHab** colors:
#                    color1   --> [list 40 100 80]
#                    color2   --> [list 50 40  60]
#                    color3   --> [list 80 140 240]
#                    results  --> [list 40 100 80 50 40 60 80 140 240] <-- all colors channels will be flattened together.
#
#                and so on and so forth...
#
# Note:  For info about **LCHab** to **Lab** conversions visit [BruceLindbloom](http://www.brucelindbloom.com).
#
# Return a list containing the resulting **Lab** colors channels flattened together.
# Each **Lab** color will be represented by 3 channels values in the following order and ranges:
#   L --> Lightness [0,100.0]
#   a --> a         [-128.0,127.0]
#   b --> b         [-128.0,127.0]
#
# Examples:
#
#   One output **Lab** color:
#       color    --> [list 100 -50 50]
#       channels --> [list 100 -50 50]
#
#   Two output **Lab** colors:
#       color1   --> [list 100 -50 50]
#       color2   --> [list 57   80 80]
#       channels --> [list 100 -50 50 57 80 80] <-- all colors channels should be flattened together.
#
#   Three output **Lab** colors:
#       color1   --> [list 100 -50 50]
#       color2   --> [list 57   80 80]
#       color3   --> [list 23   20 12]
#       channels --> [list 100 -50 50 57 80 80 23 20 12] <-- all colors channels should be flattened together.
#
#   and so on and so forth...
proc ::ms::LCHab_Lab::Conversion { channels } {
    set results [list ]
    foreach { L C Hab } $LCHabs {
        # Convert 'Hab' from degrees to radians.
        set Hab [expr { $Hab*0.017453292519943295 }]

        # Compute 'a' and 'b'.
        set a [expr { $C*cos($Hab) }]
        set b [expr { $C*sin($Hab) }]

        lappend results $L $a $b
    }

    return $results
}

#*EOF*