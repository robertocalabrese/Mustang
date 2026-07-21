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
package provide ::ms::HWB_HSB 0.1

# Create the mustang **HWB_HSB** package.
namespace eval ::ms::HWB_HSB {}

# Create an alias for the mustang **HWB_HSB** conversion command.
interp alias {} ::HWB_HSB {} ::ms::HWB_HSB::Conversion

## Conversion
#
# Transform **HWB** colors into **HSB** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **HWB** colors to convert.
#            Each **HWB** color needs to be represented by 3 channels values in the following order and ranges:
#                H --> Hue       [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#                W --> Whiteness [0,100.0]
#                B --> Blackness [0,100.0]
#
#            Note that for hues, '360.0' is not included.
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **HWB** color:
#                    color    --> [list 120 50 50]
#                    channels --> [list 120 50 50]
#
#                Two input **HWB** colors:
#                    color1   --> [list 120 50 50]
#                    color2   --> [list 57  80 80]
#                    channels --> [list 120 50 50 57 80 80] <-- all colors channels should be flattened together.
#
#                Three input **HWB** colors:
#                    color1   --> [list 120 50 50]
#                    color2   --> [list 57  80 80]
#                    color3   --> [list 270 20 90]
#                    channels --> [list 120 50 50 57 80 80 270 20 90] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# A pre-computation have been made in order to increase the performance:
#   1 / 100 = 0.01
#
# Note:  For info about the **HWB** color system visit [HWB](http://alvyray.com/Papers/CG/HWB_JGTv208.pdf).
#
# Return a list containing the resulting **HSB** colors channels flattened together.
# Each **HSB** color will be represented by 3 channels values in the following order and ranges:
#   H --> Hue        [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#   S --> Saturation [0,100.0]
#   B --> Brightness [0,100.0]
#
# Note that for hues, '360.0' is not included.
#
# Examples:
#
#   One output **HSB** color:
#       color    --> [list 120 50 50]
#       results  --> [list 120 50 50]
#
#   Two output **HSB** colors:
#       color1   --> [list 120 50 50]
#       color2   --> [list 57  80 80]
#       results  --> [list 120 50 50 57 80 80] <-- all colors channels will be flattened together.
#
#   Three output **HSB** colors:
#       color1   --> [list 120 50 50]
#       color2   --> [list 57  80 80]
#       color3   --> [list 270 20 90]
#       results  --> [list 120 50 50 57 80 80 270 20 90] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::HWB_HSB::Conversion { channels } {
    foreach { hue whiteness blackness } $channels {
        # Compute the brightness [0,100.0].
        set brightness [expr { 100.0-$blackness }]

        # Check if it's a gray.
        switch -nocase -- $hue {
            UNDEF {
                # It's a gray.
                lappend results UNDEF 0 $brightness
            }
            default {
                set w [expr { $whiteness*0.01 }]; # range [0,1.0]
                set b [expr { $blackness*0.01 }]; # range [0,1.0]

                lappend results $hue [expr { (1.0-($w/(1.0-$b)))*100.0 }] $brightness
            }
        }
    }

    return $results
}

#*EOF*