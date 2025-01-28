# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

# ::_HSBA_HSIA
#
# Transform HSB colors (with alpha channel) into HSI colors (with alpha channel).
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the HSB colors to convert.
#            Each HSB color needs to be rappresented by 4 channels values in the following order and ranges:
#                H --> Hue        [0,360.0[ --> Note: '360.0' is not included.
#                S --> Saturation [0,100.0]
#                B --> Brightness [0,100.0]
#                A --> Alpha      [0,100.0]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the color command instead.
#
#            Examples:
#
#                One color:
#                    color    --> [list 120 50 50 78]
#                    channels --> [list 120 50 50 78]
#
#                Two colors:
#                    color1   --> [list 120 50 50 78]
#                    color2   --> [list 57  80 80 23]
#                    channels --> [list 120 50 50 78 57 80 80 23] <-- all colors channels must be flattened together.
#
#                Three colors:
#                    color1   --> [list 120 50 50 78]
#                    color2   --> [list 57  80 80 23]
#                    color3   --> [list 270 20 90 50]
#                    channels --> [list 120 50 50 78 57 80 80 23 270 20 90 50] <-- all colors channels must be flattened together.
#
#                and so on and so forth...
#
# Some pre-computation have been made in order to increase the performance:
#   1 / 3   = 0.3333333333333333
#   1 / 6   = 0.16666666666666666
#   1 / 100 = 0.01
#
# Return a list containing the resulting HSI colors channels (flattened together).
# Each HSI color will be rappresented by 4 channels values in the following order and ranges:
#   H --> Hue        [0,360.0[ --> Note: '360.0' is not included.
#   S --> Saturation [0,100.0]
#   I --> Intensity  [0,100.0]
#   A --> Alpha      [0,100.0]
proc ::_HSBA_HSIA { channels } {
    foreach { hue saturation brightness alpha } $channels {
        set s [expr { $saturation*0.01 }]; # range [0,1.0]
        set b [expr { $brightness*0.01 }]; # range [0,1.0]

        set h [expr { round(floor($hue*0.016666666666666666)%6) }]
        set f [expr { ($hue*0.016666666666666666)-$h }]
        set p [expr { $b*(1.0-$s) }]

        # Compute the rgb values [0,1.0].
        switch -- $h {
            0   {
                set k [expr { 1.0-((1.0-$f)*$s) }]
                set r $b
                set g [expr { $b*$k }]
                set b $p
            }
            1   {
                set k [expr { 1.0-($f*$s) }]
                set r [expr { $b*$k }]
                set g $b
                set b $p
            }
            2   {
                set k [expr { 1.0-((1.0-$f)*$s) }]
                set r $p
                set g $b
                set b [expr { $b*$k }]
            }
            3   {
                set k [expr { 1.0-($f*$s) }]
                set r $p
                set g [expr { $b*$k }]
                set b $b
            }
            4   {
                set k [expr { 1.0-((1.0-$f)*$s) }]
                set r [expr { $b*$k }]
                set g $p
                set b $b
            }
            5   {
                set k [expr { 1.0-($f*$s) }]
                set r $b
                set g $p
                set b [expr { $b*$k }]
            }
        }

        # Compute the intensity [0,100.0].
        set i         [expr { ($r+$g+$b)*0.3333333333333333 }]; # range [0,1.0]
        set intensity [expr { $i*100.0 }]

        # Compute the saturation [0,100.0].
        if { $r == $g && $r == $b } {
            # It's a gray...
            set hue        0
            set saturation 0
        } else {
            set min        [expr { min($r,$g,$b) }]
            set saturation [expr { (1.0-($min/$i))*100.0 }]
        }

        lappend results $hue $saturation $intensity $alpha
    }

    return $results
}

#*EOF*
