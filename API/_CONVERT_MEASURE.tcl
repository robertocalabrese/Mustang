## _CONVERT_MEASURE
#
# Convert a measure.
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
# to         Should be a string that specifies the new unit in which the result needs to be expressed.
#            Allowed values:
#                centimeter or centimeters
#                inch or inches
#                millimeter or millimeters
#                pixel or pixels
#                point or points
#            If not provided, defaults to 'pixels'.
#
# fallback   Optional, should be a string that specifies the fallback value to return if the measure provided is invalid.
#            If not provided, defaults to 'INVALID'.
#
# Note: 2.54/72.0 = 0.035277777777777776
#       25.4/72.0 = 0.35277777777777775
#       72.0/2.54 = 28.346456692913385
#       72.0/25.4 = 2.834645669291339
#       1/72.0    = 0.013888888888888888
#       1/2.54    = 0.39370078740157477
#       1/25.4    = 0.03937007874015748
#
# Return the converted measure or the fallback value.
proc ::_CONVERT_MEASURE { measure to { fallback INVALID } } {
    # Check the 'to' value.
    switch -- $to {
        centimeter  -
        centimeters { set to pixels }
        inch        -
        inches      { set to inches }
        millimeter  -
        millimeters { set to millimeters }
        pixel       -
        pixels      { set to pixels }
        point       -
        points      { set to points }
        default     { return $fallback }
    }
}