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
package provide ::ms::HSI_HSL 0.1

# Create the mustang **HSI_HSL** package.
namespace eval ::ms::HSI_HSL {}

# Create an alias for the mustang **HSI_HSL** conversion command.
interp alias {} ::HSI_HSL {} ::ms::HSI_HSL::Conversion

## Conversion
#
# Transform **HSI** colors into **HSL** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **HSI** colors to convert.
#            Each **HSI** color needs to be represented by 3 channels values in the following order and ranges:
#                H --> Hue        [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#                S --> Saturation [0,100.0]
#                I --> Intensity  [0,100.0]
#
#            Note that for hues, '360.0' is not included.
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **HSI** color:
#                    color    --> [list 120 50 50]
#                    channels --> [list 120 50 50]
#
#                Two input **HSI** colors:
#                    color1   --> [list 120 50 50]
#                    color2   --> [list 57  80 80]
#                    channels --> [list 120 50 50 57 80 80] <-- all colors channels should be flattened together.
#
#                Three input **HSI** colors:
#                    color1   --> [list 120 50 50]
#                    color2   --> [list 57  80 80]
#                    color3   --> [list 270 20 90]
#                    channels --> [list 120 50 50 57 80 80 270 20 90] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Some pre-computation have been made in order to increase the performance:
#   1 / 100 = 0.01
#   π / 180 = 0.017453292519943295
#
#   1.0471975511965976 = 60  degrees expressed in radians.
#   2.0943951023931953 = 120 degrees expressed in radians.
#   3.141592653589793  = 180 degrees expressed in radians.
#   4.1887902047863905 = 240 degrees expressed in radians.
#   5.235987755982989  = 300 degrees expressed in radians.
#
# Return a list containing the resulting **HSL** colors channels flattened together.
# Each **HSL** color will be represented by 3 channels values in the following order and ranges:
#   H --> Hue        [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#   S --> Saturation [0,100.0]
#   L --> Lightness  [0,100.0]
#
# Note that for hues, '360.0' is not included.
#
# Examples:
#
#   One output **HSL** color:
#       color    --> [list 120 50 50]
#       results  --> [list 120 50 50]
#
#   Two output **HSL** colors:
#       color1   --> [list 120 50 50]
#       color2   --> [list 57  80 80]
#       results  --> [list 120 50 50 57 80 80] <-- all colors channels will be flattened together.
#
#   Three output **HSL** colors:
#       color1   --> [list 120 50 50]
#       color2   --> [list 57  80 80]
#       color3   --> [list 270 20 90]
#       results  --> [list 120 50 50 57 80 80 270 20 90] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::HSI_HSL::Conversion { channels } {
    foreach { hue saturation intensity } $channels {
        # Check if it's a gray.
        switch -nocase -- $hue {
            UNDEF {
                # It's a gray.
                lappend results UNDEF 0 $intensity
            }
            default {
                set s  [expr { $saturation*0.01 }]; # range [0,1.0]
                set i  [expr { $intensity*0.01 }];  # range [0,1.0]

                set k0 [expr { $i*$s }]
                set k1 [expr { $i-$k0 }]
                set k2 [expr { 2.0*$k0 }]

                # Compute the rgb values [0,1.0].
                if { $hue == 0 } {
                    set r [expr { $i+$k2 }]
                    set g $k1
                    set b $k1
                } elseif { $hue < 120.0 } {
                    # Transform the hue from degrees to radians.
                    set hue [expr { $hue*0.017453292519943295 }]

                    # Compute the interim hue [-1.0,1.0].
                    set interim_hue [expr { cos($hue)/cos(1.0471975511965976-$hue) }]

                    set r [expr { $i+($k2*$interim_hue) }]
                    set g [expr { $i-($k0*(1.0-$interim_hue)) }]
                    set b $k1
                } elseif { $hue == 120.0 } {
                    set r $k1
                    set g [expr { $i+$k2 }]
                    set b $k1
                } elseif { $hue < 240.0 } {
                    # Transform the hue from degrees to radians.
                    set hue [expr { $hue*0.017453292519943295 }]

                    # Compute the interim hue [-1.0,1.0].
                    set interim_hue [expr { cos($hue-2.0943951023931953)/cos(3.141592653589793-$hue) }]

                    set r $k1
                    set g [expr { $i+($k2*$interim_hue) }]
                    set b [expr { $i-($k0*(1.0-$interim_hue)) }]
                } elseif { $hue == 240.0 } {
                    set r $k1
                    set g $k1
                    set b [expr { $i+$k2 }]
                } else {
                    # hue < 360.0

                    # Transform the hue from degrees to radians.
                    set hue [expr { $hue*0.017453292519943295 }]

                    # Compute the interim hue [-1.0,1.0].
                    set interim_hue [expr { cos($hue-4.1887902047863905)/cos(5.235987755982989-$hue) }]

                    set r [expr { $i-($k0*(1.0-$interim_hue)) }]
                    set g $k1
                    set b [expr { $i+($k2*$interim_hue) }]
                }

                # Compute the max and min value among r, g and b.
                set min [expr { min($r,$g,$b) }]
                set max [expr { max($r,$g,$b) }]

                # Compute the sum and difference between max and min.
                set sum  [expr { $max+$min }]
                set diff [expr { $max-$min }]

                # Compute the lightness [0,100.0].
                set lightness [expr { $sum*50.0 }]

                # Compute the saturation [0,100.0].
                if { $lightness >= 50.0 } {
                    set saturation [expr { ($diff/(2.0-$sum))*100.0 }]
                } else {
                    set saturation [expr { ($diff/$sum)*100.0 }]
                }

                lappend results $hue $saturation $lightness
            }
        }
    }

    return $results
}

#*EOF*