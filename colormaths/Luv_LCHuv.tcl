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
package provide ::ms::Luv_LCHuv 0.1

# Create the mustang **Luv_LCHuv** package.
namespace eval ::ms::Luv_LCHuv {}

# Create an alias for the mustang **Luv_LCHuv** conversion command.
interp alias {} ::Luv_LCHuv {} ::ms::Luv_LCHuv::Conversion

## Conversion
#
# Transform **Luv** colors into **LCHuv** colors, both in the PCS D50 space.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **Luv** colors to convert.
#            Each **Luv** color needs to be represented by 3 channels values in the following order and ranges:
#                L --> Lightness [0,100.0]
#                u --> u         [-134.0,220.0]
#                v --> v         [-140.0,122.0]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **Luv** color:
#                    color    --> [list 100 -50 50]
#                    channels --> [list 100 -50 50]
#
#                Two input **Luv** colors:
#                    color1   --> [list 100 -50 50]
#                    color2   --> [list 57   80 80]
#                    channels --> [list 100 -50 50 57 80 80] <-- all colors channels should be flattened together.
#
#                Three input **Luv** colors:
#                    color1   --> [list 100 -50 50]
#                    color2   --> [list 57   80 80]
#                    color3   --> [list 23   20 12]
#                    channels --> [list 100 -50 50 57 80 80 23 20 12] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Note:  For info about **Luv** to **LCHuv** conversions visit [BruceLindbloom](http://www.brucelindbloom.com).
#
# Note:  If the **Luv** color rappresents a gray ( *u* and *v* are both **0** ), the *Hab* is irrelevant because *C* will be achromatic ( *C* is **0** ).
#        See 'https://en.wikipedia.org/wiki/CIELAB_color_space' for more info.
#
# Note:  Tcl uses internally the **C** language **atan2** function.
#        It will return domain error if *u* and *v* are both zero (well, it depends also by the processor of the machine...)
#        See 'https://en.wikipedia.org/wiki/Atan2' and 'https://blog.tcl.tk/1547' for more info.
#
# Note:  If both *u* and *v* are zero we will make the same assumption of the **atan2** function of the **C#** language, **0**.
#        See 'https://www.geeksforgeeks.org/c-sharp-math-atan2-method/' for more info.
#
# Note:  [expr {hypot($u,$v)}] == [expr {sqrt(($u*$u)+($v*$v))}]
#        but **hypot** handles cases where *u* or *v* are extremely large or extremely small without getting overflow or underflow.
#
# Return a list containing the resulting **LCHuv** colors channels flattened together.
# Each **LCHuv** color will be represented by 3 channels values in the following order and ranges:
#   L   --> Lightness [0,100.0]
#   C   --> Chroma    [0,260.76809620810593]
#   Huv --> Huv       [0,360.0[
#
# Examples:
#
#   One output **LCHuv** color:
#       color    --> [list 40 100 80]
#       results  --> [list 40 100 80]
#
#   Two output **LCHuv** colors:
#       color1   --> [list 40 100 80]
#       color2   --> [list 50 40  60]
#       results  --> [list 40 100 80 50 40 60] <-- all colors channels will be flattened together.
#
#   Three output **LCHuv** colors:
#       color1   --> [list 40 100 80]
#       color2   --> [list 50 40  60]
#       color3   --> [list 80 140 240]
#       results  --> [list 40 100 80 50 40 60 80 140 240] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::Luv_LCHuv::Conversion { channels } {
    set results [list ]
    foreach { L u v } $channels {
        if { ($u == 0) && ($v == 0) } {
            set Huv 0
            set C   0
        } else {
            # Compute the arctangent (in radians).
            set arcTan [expr { atan2($v,$u) }]

            # Convert the angle returned by the arctangent in degrees.
            set Huv [expr { $arcTan*57.29577951308232 }]

            # Check if 'Huv' exceeds its limits.
            if { $Huv < 0 } {
                set Huv [expr { $Huv+360.0 }]
            } elseif { $Huv >= 360.0 } {
                set Huv [expr { $Huv-360.0 }]
            }

            set C [expr { hypot($u,$v) }]
        }

        lappend results $L $C $Huv
    }

    return $results
}

#*EOF*