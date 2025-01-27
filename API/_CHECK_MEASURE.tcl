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
proc ::_CHECK_MEASURE { measure { fallback INVALID } } {}