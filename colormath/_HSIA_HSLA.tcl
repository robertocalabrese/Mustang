# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

# ::_HSIA_HSLA
#
# Transform HSI colors (with alpha channel) into HSL colors (with alpha channel).
#
# Where:
#
# channels      Should be a list that specifies all the channels (flattened together) of the HSI colors to convert.
#               Each HSI color needs to be rappresented by 4 channels values in the following order and ranges:
#                   H --> Hue        [0,360.0[ --> Note: '360.0' is not included.
#                   S --> Saturation [0,100.0]
#                   I --> Intensity  [0,100.0]
#                   A --> Alpha      [0,100.0]
#
#               Attention, the input and output colors will not be checked.
#               Please, take the appropriate steps before and after using this procedure or use the color command instead.
#
#               Examples:
#
#                   One color:
#                       color    --> [list 120 50 50 78]
#                       channels --> [list 120 50 50 78]
#
#                   Two colors:
#                       color1   --> [list 120 50 50 78]
#                       color2   --> [list 57  80 80 23]
#                       channels --> [list 120 50 50 78 57 80 80 23] <-- all colors channels must be flattened together.
#
#                   Three colors:
#                       color1   --> [list 120 50 50 78]
#                       color2   --> [list 57  80 80 23]
#                       color3   --> [list 270 20 90 50]
#                       channels --> [list 120 50 50 78 57 80 80 23 270 20 90 50] <-- all colors channels must be flattened together.
#
#                   and so on and so forth...
#
# Some pre-computation have been made in order to increase the performance:
#   1 / 100 = 0.01
#   π / 180 = 0.017453292519943295
#
#   1.0471975511965976 = 60  degrees expressed in radians.
#   2.0943951023931953 = 120 degrees expressed in radians.
#   3.141592653589793  = 180 degrees expressed in radians.
#   4.1887902047863905 = 240 degrees expressed in radians.
#   5.235987755982989  = 300 degrees expressed in radians.
#
# Return a list containing the resulting HSL colors channels (flattened together).
# Each HSL color will be rappresented by 4 channels values in the following order and ranges:
#   H --> Hue        [0,360.0[ --> Note: '360.0' is not included.
#   S --> Saturation [0,100.0]
#   L --> Lightness  [0,100.0]
#   A --> Alpha      [0,100.0]
proc ::_HSIA_HSLA { channels } {
    foreach { hue saturation intensity alpha } $channels {
        set s [expr { $saturation*0.01 }]; # range [0,1.0]
        set i [expr { $intensity*0.01  }]; # range [0,1.0]

        set k0 [expr { $i*$s }]
        set k1 [expr { $i-$k0 }]
        set k2 [expr { 2.0*$k0 }]

        # Compute the rgb values [0,1.0].
        if { $hue == 0 } {
            set r [expr { $i+$k2 }]
            set g $k1
            set b $k1
        } elseif { $hue < 120.0 } {
            # Transform the hue from degrees to radians.
            set hue     [expr { $hue*0.017453292519943295 }]
            set interim [expr { cos($hue)/cos(1.0471975511965976-$hue) }]

            set r [expr { $i+($k2*$interim) }]
            set g [expr { $i-($k0*(1.0-$interim)) }]
            set b $k1
        } elseif { $hue == 120.0 } {
            set r $k1
            set g [expr { $i+$k2 }]
            set b $k1
        } elseif { $hue < 240.0 } {
            # Transform the hue from degrees to radians.
            set hue     [expr { $hue*0.017453292519943295 }]
            set interim [expr { cos($hue-2.0943951023931953)/cos(3.141592653589793-$hue) }]

            set r $k1
            set g [expr { $i+($k2*$interim) }]
            set b [expr { $i-($k0*(1.0-$interim)) }]
        } elseif { $hue == 240.0 } {
            set r $k1
            set g $k1
            set b [expr { $i+$k2 }]
        } else {
            # Transform the hue from degrees to radians.
            set hue     [expr { $hue*0.017453292519943295 }]
            set interim [expr { cos($hue-4.1887902047863905)/cos(5.235987755982989-$hue) }]

            set r [expr { $i-($k0*(1.0-$interim)) }]
            set g $k1
            set b [expr { $i+($k2*$interim) }]
        }

        set min  [expr { min($r,$g,$b) }]
        set max  [expr { max($r,$g,$b) }]
        set sum  [expr { $max+$min }]
        set diff [expr { $max-$min }]

        # Compute the lightness [0,100.0].
        set lightness [expr { $sum*50.0 }]

        # Compute the saturation [0,100.0].
        switch -- $diff {
            0   {
                # It's a gray...
                set hue        0
                set saturation 0
            }
            default {
                if { $lightness >= 50.0 } {
                    set saturation [expr { ($diff/(2.0-$sum))*100.0 }]
                } else {
                    set saturation [expr { ($diff/$sum)*100.0 }]
                }
            }
        }

        lappend results $hue $saturation $lightness $alpha
    }

    return $results
}

#*EOF*
