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
    }
}