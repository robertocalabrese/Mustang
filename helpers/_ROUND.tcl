# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

## _ROUND
#
# Rounds a value at a specific decimal digit.
#
# Where:
#
# value   Specifies the floating point value that needs to be rounded.
#
# digit   Optional, specifies an integer value that indicates the decimal digit
#         where the rounding should be done [0,17].
#         If not provided, defaults to '0'.
#
## Examples:
#
#   _ROUND 1234.567890   --> 1235
#   _ROUND 1234.567890 0 --> 1235
#   _ROUND 1234.567890 1 --> 1234.6
#   _ROUND 1234.567890 2 --> 1234.57
#   _ROUND 1234.567890 3 --> 1234.568
#   _ROUND 1234.567890 4 --> 1234.5679
#
# Return the rounded value.
proc _ROUND { value { digit 0 } } {
    # Check the 'value' provided.
    switch -- [string is double -strict $value] {
        0   {
            # Safeguard.
            # If 'value' is an integer, return it as is.
            switch -- [string is integer -strict $value] {
                0   { dialog error [list "%s: Invalid value, '%s'." _ROUND $value] }
                1   { return $value }
            }
        }
    }

    # Check the 'digit' provided
    if { ([string is integer -strict $digit] == 0) || ($digit < 0) } {
        dialog error [list "%s: Invalid decimal digit, '%s'." _ROUND $digit]
    }

    # Execute the command.
    switch -- $digit {
        0   { return [expr { round($value) }] }
        1   -
        2   -
        3   -
        4   -
        5   -
        6   -
        7   -
        8   -
        9   -
        10  -
        11  -
        12  -
        13  -
        14  -
        15  -
        16  {
            set pow10 [expr { pow(10,$digit) }]
            return    [expr { (round($pow10*$value))/$pow10 }]
        }
        default { return $value }
    }
}

#*EOF*