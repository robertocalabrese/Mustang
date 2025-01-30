# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

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
#                HEX or HEX8   --> Hexadecimal at 8  bit with 3 channels (red, green and blue)
#                HEX12         --> Hexadecimal at 12 bit with 3 channels (red, green and blue)
#                HEX16         --> Hexadecimal at 16 bit with 3 channels (red, green and blue)
#                HEXA or HEXA8 --> Hexadecimal at 8  bit with 4 channels (red, green,blue and alpha)
#                HEXA12        --> Hexadecimal at 12 bit with 4 channels (red, green,blue and alpha)
#                HEXA16        --> Hexadecimal at 16 bit with 4 channels (red, green,blue and alpha)
#
#            If an hexadecimal color is specified with a number of channels different than the hextype
#            provided (but '3' or '4' nonetheless), the alpha channel will be added or subtracted,
#            to reflect the hextype specified.
#
# fallback   Optional, should be a string that specifies the fallback value to return if the color provided is invalid.
#            If not provided, defaults to 'INVALID'.
#
# Return the validated color in its hexadecimal longform or its fallback value.
proc ::_CHECK_HEX { color hextype { fallback INVALID } } {
    # Check if color is expressed in hexadecimal format.
    set color [string tolower [string trimleft $color "#"]]
    switch -- [string is xdigit -strict $color] {
        0   { return $fallback }
    }

    switch -nocase -- $hextype {
        HEX  -
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
        HEXA  -
        HEXA8 {
            switch -- [string length $color] {
                3   {
                    # Color is expressed as shortform without any alpha channel.
                    set red   [string index $color 0]
                    set green [string index $color 1]
                    set blue  [string index $color 2]

                    # Return the color longform with an added alpha channel ('ff').
                    return [string cat "#" \
                                       $red   $red \
                                       $green $green \
                                       $blue  $blue \
                                       "ff"];
                }
                4   {
                    # Color is expressed as shortform with alpha channel.
                    set red   [string index $color 0]
                    set green [string index $color 1]
                    set blue  [string index $color 2]
                    set alpha [string index $color 3]

                    # Return the color longform with its alpha channel.
                    return [string cat "#" \
                                       $red   $red \
                                       $green $green \
                                       $blue  $blue \
                                       $alpha $alpha];

                }
                6   {
                    # Return the color longform with an added alpha channel ('ff').
                    return [string cat "#" $color "ff"]
                }
                8   {
                    # Return the color longform as is, with its alpha channel.
                    return [string cat "#" $color]
                }
                default { return $fallback }
            }
        }
        HEXA12 {
            switch -- [string length $color] {
                3   {
                    # Color is expressed as shortform without any alpha channel.
                    set red   [string index $color 0]
                    set green [string index $color 1]
                    set blue  [string index $color 2]

                    # Return the color longform with an added alpha channel ('fff').
                    return [string cat "#" \
                                       $red   $red   $red  \
                                       $green $green $green \
                                       $blue  $blue  $blue \
                                       "fff"];
                }
                4   {
                    # Color is expressed as shortform with alpha channel.
                    set red   [string index $color 0]
                    set green [string index $color 1]
                    set blue  [string index $color 2]
                    set alpha [string index $color 3]

                    # Return the color longform with its alpha channel.
                    return [string cat "#" \
                                       $red   $red   $red  \
                                       $green $green $green \
                                       $blue  $blue  $blue \
                                       $alpha $alpha $alpha];

                }
                9   {
                    # Return the color longform with an added alpha channel ('fff').
                    return [string cat "#" $color "fff"]
                }
                12  {
                    # Return the color longform as is, with its alpha channel.
                    return [string cat "#" $color]
                }
                default { return $fallback }
            }
        }
        HEXA16 {
            switch -- [string length $color] {
                3   {
                    # Color is expressed as shortform without any alpha channel.
                    set red   [string index $color 0]
                    set green [string index $color 1]
                    set blue  [string index $color 2]

                    # Return the color longform with an added alpha channel ('ffff').
                    return [string cat "#" \
                                       $red   $red   $red   $red  \
                                       $green $green $green $green \
                                       $blue  $blue  $blue  $blue \
                                       "ffff"];
                }
                4   {
                    # Color is expressed as shortform with alpha channel.
                    set red   [string index $color 0]
                    set green [string index $color 1]
                    set blue  [string index $color 2]
                    set alpha [string index $color 3]

                    # Return the color longform with its alpha channel.
                    return [string cat "#" \
                                       $red   $red   $red   $red  \
                                       $green $green $green $green \
                                       $blue  $blue  $blue  $blue \
                                       $alpha $alpha $alpha $alpha];

                }
                12  {
                    # Return the color longform with an added alpha channel ('ffff').
                    return [string cat "#" $color "ffff"]
                }
                16  {
                    # Return the color longform as is, with its alpha channel.
                    return [string cat "#" $color]
                }
                default { return $fallback }
            }
        }
        default { return $fallback }
    }
}

#*EOF*