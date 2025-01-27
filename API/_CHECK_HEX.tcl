## _CHECK_HEX
#
# Validate a color expressed in hexadecimal form.
#
# Where:
#
# color      Should be the hexadecimal color to validate, with or without the '#'.
#            Alpha channels are supported.
#
# hextype    Should be a string that specifies the color model in which the color is provided.
#            Allowed values are:
#                HEX8   --> Hexadecimal at 8  bit with 3 channels (red, green and blue)
#                HEX12  --> Hexadecimal at 12 bit with 3 channels (red, green and blue)
#                HEX16  --> Hexadecimal at 16 bit with 3 channels (red, green and blue)
#                HEXA8  --> Hexadecimal at 8  bit with 4 channels (red, green,blue and alpha)
#                HEXA12 --> Hexadecimal at 12 bit with 4 channels (red, green,blue and alpha)
#                HEXA16 --> Hexadecimal at 16 bit with 4 channels (red, green,blue and alpha)
#
#            If an hexadecimal color is specified with a number of channels different than the hextype
#            provided (but '3' or '4' nonetheless), the alpha channel will be added or subtracted,
#            to reflect the hextype specified.
#
# fallback   Should be a string that specifies the fallback value to return if the color provided is invalid.
#            If not provided, defaults to INVALID.
#
# Return the validated color in its hexadecimal longform or its fallback value.
proc ::_CHECK_HEX { color hextype { fallback INVALID } } {}