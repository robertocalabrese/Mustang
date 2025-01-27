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
# fallback    Optional, should be a string that specifies the fallback value to return if the color provided is invalid.
#             If not provided, defaults to 'INVALID'.
#
# Return the validated color in its hexadecimal longform or its fallback value.
proc ::_CHECK_COLORNAME { colorname hextype { fallback INVALID } } {
    # Check if the colorname provided is known by Mustang.
    set index [lsearch -exact -nocase $::TABLE(ALL,all) $colorname]
    switch -- $index {
        -1      { return $fallback }
        default { set colorname [lindex $::TABLE(ALL,all) $index] }
    }

    # Return the correct hexadecimal value of the colorname provided.
    switch -nocase -- $hextype {
        HEX8    { return $::TABLE(ALL,$colorname,8) }
        HEX12   { return $::TABLE(ALL,$colorname,12) }
        HEX16   { return $::TABLE(ALL,$colorname,16) }
        HEXA8   { return [string cat $::TABLE(ALL,$colorname,8) "ff"] }
        HEXA12  { return [string cat $::TABLE(ALL,$colorname,12) "fff"] }
        HEXA16  { return [string cat $::TABLE(ALL,$colorname,16) "ffff"] }
        default { return $fallback }
    }
}