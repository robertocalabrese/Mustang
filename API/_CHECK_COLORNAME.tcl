## _CHECK_COLORNAME
#
# Validate a color expressed in textual form (like red, green, blue, purple, orange,...).
#
# Where:
#
# colorname   Should be the color to validate, expressed in textual form.
#             See the 'Palettes' wiki page to know which palette colornames are allowed.
#
# hextype     Should be a string that specifies the color model in which the color will be returned.
#             Allowed values are:
#                 HEX8   --> Hexadecimal at 8  bit with 3 channels (red, green and blue)
#                 HEX12  --> Hexadecimal at 12 bit with 3 channels (red, green and blue)
#                 HEX16  --> Hexadecimal at 16 bit with 3 channels (red, green and blue)
#                 HEXA8  --> Hexadecimal at 8  bit with 4 channels (red, green,blue and alpha)
#                 HEXA12 --> Hexadecimal at 12 bit with 4 channels (red, green,blue and alpha)
#                 HEXA16 --> Hexadecimal at 16 bit with 4 channels (red, green,blue and alpha)
#
# fallback    Should be a string that specifies the fallback value to return if the color provided is invalid.
#             If not provided, defaults to INVALID.
#
# Return the validated color in its hexadecimal longform or its fallback value.
proc ::_CHECK_COLORNAME { colorname hextype { fallback INVALID } } {}