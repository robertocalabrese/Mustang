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
proc ::_CHECK_HEX { color hextype { fallback INVALID } } {
    # Check if color is expressed in hexadecimal format.
    set color [string tolower [string trimleft $color "#"]]
    switch -- [string is xdigit -strict $color] {
        0   { return $fallback }
    }

    switch -nocase -- $hextype {
        HEX8 {
            switch -- [string length $color] {
                3   -
                4   {
                    # Color is expressed as shortform with (4) or without (3) alpha channel.
                    set red   [string index $color 0]
                    set green [string index $color 1]
                    set blue  [string index $color 2]

                    # Return the color longform without alpha channel.
                    return [string cat "#" \
                                       $red   $red \
                                       $green $green \
                                       $blue  $blue];

                }
                6   {
                    # Return the color as is (without alpha channel).
                    return [string cat "#" $color]
                }
                8   {
                    # Return the color as is but with its alpha channel removed (last two digits).
                    return [string cat "#" [string range $color 0 end-2]]
                }
                default { return $fallback }
            }
        }
        HEX12 {
            switch -- [string length $color] {
                3   -
                4   {
                    # Color is expressed as shortform with (4) or without (3) alpha channel.
                    set red   [string index $color 0]
                    set green [string index $color 1]
                    set blue  [string index $color 2]

                    # Return the color longform without alpha channel.
                    return [string cat "#" \
                                       $red   $red   $red \
                                       $green $green $green \
                                       $blue  $blue  $blue];

                }
                9   {
                    # Return the color as is (without alpha channel).
                    return [string cat "#" $color]
                }
                12  {
                    # Return the color as is but with its alpha channel removed (last three digits).
                    return [string cat "#" [string range $color 0 end-3]]
                }
                default { return $fallback }
            }
        }
        HEX16 {
            switch -- [string length $color] {
                3   -
                4   {
                    # Color is expressed as shortform with (4) or without (3) alpha channel.
                    set red   [string index $color 0]
                    set green [string index $color 1]
                    set blue  [string index $color 2]

                    # Return the color longform without alpha channel.
                    return [string cat "#" \
                                       $red   $red   $red   $red \
                                       $green $green $green $green \
                                       $blue  $blue  $blue  $blue];

                }
                12  {
                    # Return the color as is (without alpha channel).
                    return [string cat "#" $color]
                }
                16  {
                    # Return the color as is but with its alpha channel removed (last four digits).
                    return [string cat "#" [string range $color 0 end-4]]
                }
                default { return $fallback }
            }
        }
    }
}