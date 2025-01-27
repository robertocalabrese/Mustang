# _ADD_ALPHA_CHANNEL
#
# Adds the alpha channel to the colors provided.
#
# Where:
#
# colors        Should be a list containing all the colors involved.
#
# colormodel    Should be a string indicating the color model in which the color are provided.
#               Allowed color models are all the Mustang supported color model that do not have an alpha channel, in other words:
#                   HEX8
#                   HEX12
#                   HEX16
#                   RGB8
#                   RGB12
#                   RGB16
#                   HSB
#                   HSI
#                   HSL
#                   HSP
#                   XYZ
#                   xyY
#                   Lab
#                   Luv
#
# Returns a list with two elements.
# The first element contains all the resulting colors (with alpha channels) while
# the second element is the new color model in which they are expressed.
proc ::_ADD_ALPHA_CHANNEL { colors colormodel } {
    switch -- $colormodel {
        HEX8 {
            foreach color $colors {
                lappend results [string cat $color "ff"]
            }
            return [list $results HEXA8]
        }
        HEX12 {
            foreach color $colors {
                lappend results [string cat $color "fff"]
            }
            return [list $results HEXA12]
        }
        HEX16 {
            foreach color $colors {
                lappend results [string cat $color "ffff"]
            }
            return [list $results HEXA16]
        }
        RGB8 {
            foreach { red green blue } $colors {
                lappend results $red $green $blue 255
            }
            return [list $results RGBA8]
        }
        RGB12 {
            foreach { red green blue } $colors {
                lappend results $red $green $blue 4095
            }
            return [list $results RGBA12]
        }
        RGB16 {
            foreach { red green blue } $colors {
                lappend results $red $green $blue 65535
            }
            return [list $results RGBA16]
        }
        HSB {
            foreach { hue saturation brightness } $colors {
                lappend results $hue $saturation $brightness 100.0
            }
            return [list $results HSBA]
        }
    }
}