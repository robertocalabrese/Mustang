# _REMOVE_ALPHA_CHANNEL
#
# Remove the alpha channel from the colors provided.
#
# Where:
#
# colors       Should be a list containing all the colors involved.
#
# colormodel   Should be a string indicating the color model in which the colors are provided.
#              Allowed color models are all the Mustang supported color model that do have an alpha channel, in other words:
#                  HEXA or HEXA8
#                  HEXA12
#                  HEXA16
#                  RGBA or RGBA8
#                  RGBA12
#                  RGBA16
#                  HSBA
#                  HSIA
#                  HSLA
#                  HSPA
#                  XYZA
#                  xyYA
#                  LabA
#                  LuvA
#
# Return a list with two elements.
# The first element contains all the resulting colors (without alpha channels) while
# the second element is the new color model in which they are expressed.
proc ::_REMOVE_ALPHA_CHANNEL { colors colormodel } {
    switch -- $colormodel {
        HEXA  -
        HEXA8 {
            foreach color $colors {
                lappend results [string range $color 0 end-2]
            }
            return [list $results HEX8]
        }
        HEXA12 {
            foreach color $colors {
                lappend results [string range $color 0 end-3]
            }
            return [list $results HEX12]
        }
        HEXA16 {
            foreach color $colors {
                lappend results [string range $color 0 end-4]
            }
            return [list $results HEX16]
        }
        RGBA  -
        RGBA8 {
            foreach { red green blue alpha } $colors {
                lappend results $red $green $blue
            }
            return [list $results RGB8]
        }
        RGBA12 {
            foreach { red green blue alpha } $colors {
                lappend results $red $green $blue
            }
            return [list $results RGB12]
        }
        RGBA16 {
            foreach { red green blue alpha } $colors {
                lappend results $red $green $blue
            }
            return [list $results RGB16]
        }
        HSBA {
            foreach { hue saturation brightness alpha } $colors {
                lappend results $hue $saturation $brightness
            }
            return [list $results HSB]
        }
        HSIA {
            foreach { hue saturation intensity alpha } $colors {
                lappend results $hue $saturation $intensity
            }
            return [list $results HSI]
        }
        HSLA {
            foreach { hue saturation lightness alpha } $colors {
                lappend results $hue $saturation $lightness
            }
            return [list $results HSL]
        }
        HSPA {
            foreach { hue saturation perceived_brightness alpha } $colors {
                lappend results $hue $saturation $perceived_brightness
            }
            return [list $results HSP]
        }
        XYZA {
            foreach { X Y Z A } $colors {
                lappend results $X $Y $Z
            }
            return [list $results XYZ]
        }
        xyYA {
            foreach { x y Y A } $colors {
                lappend results $x $y $Y
            }
            return [list $results xyY]
        }
    }
}