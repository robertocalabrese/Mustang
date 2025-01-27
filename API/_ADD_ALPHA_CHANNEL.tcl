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
proc ::_ADD_ALPHA_CHANNEL { colors colormodel } {}