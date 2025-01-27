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

    # Check the measure provided and extract its unit.
    set unit [string index $measure end]
    switch -- $unit {
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
            set from "pixels"

            switch -- [string is integer -strict $measure] {
                0   { return $fallback }
            }

            if { $measure < 0 } {
                return $fallback
            }
        }
        c   -
        i   -
        m   -
        p   {
            # The measure have a valid unit, retrieve its value and unit type.
            switch -- $unit {
                c   { set from "centimeters" }
                i   { set from "inches"      }
                m   { set from "millimeters" }
                p   { set from "points"      }
            }

            set measure [string range $measure 0 end-1]
            switch -- [string is double -strict $measure] {
                0   { return $fallback }
            }

            if { $measure < 0 } {
                return $fallback
            }
        }
        default { return $fallback }
    }

    # Execute the conversion.
    switch -- $from {
        centimeters {
            switch -- $to {
                centimeters { return [string cat $measure "c"] }
                inches      { return [string cat [expr { $measure*0.39370078740157477 }] "i"] }
                millimeters { return [string cat [expr { $measure*10 }] "m"] }
                points      { return [string cat [expr { $measure*28.3464566929133850 }] "p"] }
                pixels      { return [expr { round($measure*[_tk scaling]*28.346456692913385) }] }
            }
        }
        inches {
            switch -- $to {
                centimeters { return [string cat [expr { $measure*2.54 }] "c"] }
                inches      { return [string cat $measure "i"] }
                millimeters { return [string cat [expr { $measure*25.4 }] "m"] }
                points      { return [string cat [expr { $measure*72.0 }] "p"] }
                pixels      { return [expr { round($measure*[_tk scaling]*72.0) }] }
            }
        }
        millimeters {
            switch -- $to {
                centimeters { return [string cat [expr { $measure*0.1 }] "c"] }
                inches      { return [string cat [expr { $measure*0.03937007874015748 }] "i"] }
                millimeters { return [string cat $measure "m"] }
                points      { return [string cat [expr { $measure*2.83464566929133900 }] "p"] }
                pixels      { return [expr { round($measure*[_tk scaling]*2.834645669291339) }] }
            }
        }
        pixels {
            switch -- $to {
                centimeters { return [string cat [expr { ($measure/[_tk scaling])*0.035277777777777776 }] "c"] }
                inches      { return [string cat [expr { ($measure/[_tk scaling])*0.013888888888888888 }] "i"] }
                millimeters { return [string cat [expr { ($measure/[_tk scaling])*0.352777777777777750 }] "m"] }
                points      { return [string cat [expr { ($measure/[_tk scaling]) }] "p"] }
                pixels      { return [expr { round($measure) }] }
            }
        }
    }
}