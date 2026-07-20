# Copyright: 2025 Roberto Calabrese a.k.a. Kicka
#
# This file is part of "Mustang", a GUI toolkit for Tcl/Tk 9.0 and later
# (https://codeberg.org/kicka/Mustang).
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
package provide ::ms::HSB_HSI 0.1

# Create the mustang **HSB_HSI** package.
namespace eval ::ms::HSB_HSI {}

# Create an alias for the mustang **HSB_HSI** conversion command.
interp alias {} ::HSB_HSI {} ::ms::HSB_HSI::Conversion

## Conversion
#
# Transform **HSB** colors into **HSI** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **HSB** colors to convert.
#            Each **HSB** color needs to be represented by 3 channels values in the following order and ranges:
#                H --> Hue        [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#                S --> Saturation [0,100.0]
#                B --> Brightness [0,100.0]
#
#            Note that for hues, '360.0' is not included.
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **HSB** color:
#                    color    --> [list 120 50 50]
#                    channels --> [list 120 50 50]
#
#                Two input **HSB** colors:
#                    color1   --> [list 120 50 50]
#                    color2   --> [list 57  80 80]
#                    channels --> [list 120 50 50 57 80 80] <-- all colors channels should be flattened together.
#
#                Three input **HSB** colors:
#                    color1   --> [list 120 50 50]
#                    color2   --> [list 57  80 80]
#                    color3   --> [list 270 20 90]
#                    channels --> [list 120 50 50 57 80 80 270 20 90] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Some pre-computation have been made in order to increase the performance:
#   1 / 3   = 0.3333333333333333
#   6 / 360 = 0.016666666666666666
#   1 / 100 = 0.01
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
proc ::ms::HSB_HSI::Conversion { channels } {
    foreach { hue saturation brightness } $channels {
        # Check if it's a gray.
        switch -nocase -- $hue {
            UNDEF {
                # It's a gray.
                lappend results UNDEF 0 $brightness
            }
            default {
                set s [expr { $saturation*0.01 }]; # range [0,1.0]
                set b [expr { $brightness*0.01 }]; # range [0,1.0]

                # Transform the hue in sixtieths [0,6.0[.
                # Note that 6.0 is not included.
                set h [expr { $hue*0.016666666666666666 }]

                # Compute the hue sector [0,5].
                set sector [expr { int(floor($h)) }]

                # Compute the fractional part of the hue sector [0,1.0[.
                # Note that 1.0 is not included.
                set f [expr { $h-$sector }]

                # Check if the sector is an even number.
                switch -- $sector {
                    0   -
                    2   -
                    4   { set f [expr { 1.0-$f }] }
                }

                set m [expr { $b*(1.0-$s) }]
                set n [expr { $b*(1.0-($f*$s)) }]

                # Compute the rgb values [0,1.0].
                switch -- $sector {
                    0   {
                        # hue < 60.0

                        set r $b
                        set g $n
                        set b $m
                    }
                    1   {
                        # hue < 120.0

                        set r $n
                        set g $b
                        set b $m
                    }
                    2   {
                        # hue < 180.0

                        set r $m
                        set g $b
                        set b $n
                    }
                    3   {
                        # hue < 240.0

                        set r $m
                        set g $n
                        set b $b
                    }
                    4   {
                        # hue < 300.0

                        set r $n
                        set g $m
                        set b $b
                    }
                    5   {
                        # hue < 360.0

                        set r $b
                        set g $m
                        set b $n
                    }
                }

                # Compute the intensity [0.1.0].
                set i [expr { ($r+$g+$b)*0.3333333333333333 }]

                # Compute the saturation [0,100.0].
                set min        [expr { min($r,$g,$b) }]
                set saturation [expr { (1.0-($min/$i))*100.0 }]

                lappend results $hue $saturation [expr { $i*100.0 }]
            }
        }
    }

    return $results
}

#*EOF*