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
package provide ::ms::rgb_HSI 0.1

# Create the mustang **rgb_HSI** package.
namespace eval ::ms::rgb_HSI {}

# Create an alias for the mustang **rgb_HSI** conversion command.
interp alias {} ::rgb_HSI {} ::ms::rgb_HSI::Conversion

## Conversion
#
# Transform **rgb** colors into **HSI** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **rgb** colors to convert.
#            Each **rgb** color needs to be represented by 3 channels values in the following order and ranges:
#                r --> red   [0,1.0]
#                g --> green [0,1.0]
#                b --> blue  [0,1.0]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **rgb** color:
#                    color    --> [list 0.4 0.5 0.2]
#                    channels --> [list 0.4 0.5 0.2]
#
#                Two input **rgb** colors:
#                    color1   --> [list 0.4 0.5 0.2]
#                    color2   --> [list 0.5 0.4 0.6]
#                    channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6] <-- all colors channels should be flattened together.
#
#                Three input **rgb** colors:
#                    color1   --> [list 0.4 0.5 0.2]
#                    color2   --> [list 0.5 0.4 0.6]
#                    color3   --> [list 0.2 0.2 0.1]
#                    channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6 0.2 0.2 0.1] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Some pre-computation have been made in order to increase the performance:
#   1 / 3   = 0.3333333333333333
#   180 / π = 57.29577951308232
#
# Return a list containing the resulting **HSI** colors channels flattened together.
# Each **HSI** color will be represented by 3 channels values in the following order and ranges:
#   H --> Hue        [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#   S --> Saturation [0,100.0]
#   I --> Intensity  [0,100.0]
#
# Note that for hues, '360.0' is not included.
#
# Examples:
#
#   One output **HSI** color:
#       color    --> [list 120 50 50]
#       results  --> [list 120 50 50]
#
#   Two output **HSI** colors:
#       color1   --> [list 120 50 50]
#       color2   --> [list 57  80 80]
#       results  --> [list 120 50 50 57 80 80] <-- all colors channels will be flattened together.
#
#   Three output **HSI** colors:
#       color1   --> [list 120 50 50]
#       color2   --> [list 57  80 80]
#       color3   --> [list 270 20 90]
#       results  --> [list 120 50 50 57 80 80 270 20 90] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::rgb_HSI::Conversion { channels } {
    foreach { r g b } $channels {
        if { $r == $g && $r == $b } {
            # It's a gray.
            lappend results UNDEF 0 [expr { $r*100.0 }]
        } else {
            # Compute the intensity [0,100.0]
            set i [expr { ($r+$g+$b)*0.3333333333333333 }]; # range [0,1.0]
            set intensity [expr { $i*100.0 }]

            # Compute the saturation [0,100.0]
            set min        [expr { min($r,$g,$b) }]
            set saturation [expr { (1.0-($min/$i))*100.0 }]

            # Compute the interim hue [-1.0,1.0].
            set denominator [expr { sqrt(($r*$r)+($g*$g)+($b*$b)-($r*$g)-($r*$b)-($g*$b)) }]
            set numerator   [expr { $r-($g*0.5)-($b*0.5) }]
            set interim     [expr { $numerator/$denominator }]
            if { $interim_hue < -1.0 } {
                set interim_hue -1.0
            } elseif { $interim_hue > 1.0 } {
                set interim_hue 1.0
            }

            # Compute the arc cosine in degrees.
            set arccos [expr { (acos($interim_hue))*57.29577951308232 }]
            if { $arccos < 0 } {
                set arccos [expr { $arccos+360.0 }]
            }

            # Compute the hue [0,360.0[.
            # Note that 360.0 is not included.
            if { $g < $b } {
                set hue [expr { 360.0-$arccos }]
            } else {
                # g >= b
                set hue $arccos
            }

            lappend results $hue $saturation $intensity
        }
    }

    return $results
}

#*EOF*