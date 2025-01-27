## _CHECK_MEASURE
#
# Validate a measure.
#
# Where:
#
# measure    Should be a string (or an integer in case of pixels) that specifies the measure to convert and its unit.
#            Allowed units are:
#                c --> centimeters
#                i --> inches
#                m --> millimeters
#                p --> points
#            If there is no unit, the measure will be assumed to be in pixels.
#
# fallback   Optional. Should be a string that specifies the fallback value to return if the measure provided is invalid.
#            If not provided, defaults to 'INVALID'.
#
# Return the checked measure or the fallback value.
proc ::_CHECK_MEASURE { measure { fallback INVALID } } {
    # Check the last digit of the measure provided.
    switch -- [string index $measure end] {
        0   -
        1   -
        2   -
        3   -
        4   -
        5   -
        6   -
        7   -
        8   -
        9   {
            # The measure have no unit, its value is assumed to be in pixels.
            set unit ""
        }
        c   -
        i   -
        m   -
        p   {
            # The measure have a valid unit, separate its value from its unit.
            set measure [string range $measure 0 end-1]
            set unit    [string index $measure end]
        }
        default { return $fallback }
    }
}