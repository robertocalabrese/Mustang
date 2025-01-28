# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

# ::_HEXA12_RGBA12
#
# Transform hexadecimal colors at 12 bit (with alpha channel) into RGB values at 12 bit (with alpha channel).
#
# Where:
#
# hexadecimals   Should be a list that specifies all the hexadecimal colors at 12 bit to convert.
#                Each hexadecimal color needs to be rappresented by twelve hexadecimals values in the range [#000000000000,#ffffffffffff]
#                that specifies the 4 channels values in the following order and ranges:
#                    first three hedadecimals --> red   [000,fff]
#                    next  three hedadecimals --> green [000,fff]
#                    next  three hedadecimals --> blue  [000,fff]
#                    last  three hedadecimals --> alpha [000,fff]
#
#                Attention:
#                    - Each hexadecimal color must start with the '#' symbol.
#                    - Each hexadecimal letter must be lowercase.
#                    - Shortforms are not allowed.
#                    - Textual or system colornames are not allowed.
#                    - For performance reasons, the input and output colors will not be checked.
#
#                Please, take the appropriate steps before and after using this procedure or use the color command instead.
#
#                Examples:
#
#                    One color:
#                        color        --> #ffffff000fff
#                        hexadecimals --> [list #ffffff000fff] or just #ffffff000fff
#
#                    Two colors:
#                        color1       --> #000000000fff
#                        color2       --> #ffffffffffff
#                        hexadecimals --> [list #000000000fff #ffffffffffff]
#
#                    Three colors:
#                        color1       --> #fff000000fff
#                        color2       --> #000fff000fff
#                        color3       --> #000000ffffff
#                        hexadecimals --> [list #fff000000fff #000fff000fff #000000ffffff]
#
#                    and so on and so forth...
#
# Return a list containing the resulting RGB colors channels (flattened together) at 12 bit.
# Each RGB color will be rappresented by 4 channels values in the following order and ranges:
#   R --> Red   [0,4095]
#   G --> Green [0,4095]
#   B --> Blue  [0,4095]
#   A --> Alpha [0,4095]
proc ::_HEXA12_RGBA12 { hexadecimals } {
    foreach hexadecimal $hexadecimals {
        scan $hexadecimal "#%03x%03x%03x%03x" red12 green12 blue12 alpha12
        lappend results $red12 $green12 $blue12 $alpha12
    }

    return $results
}

#*EOF*
