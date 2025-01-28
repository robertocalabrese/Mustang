# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

# ::_rgba_HSIA
#
# Transform rgb colors (with alpha channel) into HSI colors (with alpha channel).
#
# Where:
#
# channels      Should be a list that specifies all the channels (flattened together) of the rgb colors to convert.
#               Each rgb color needs to be rappresented by 4 channels values in the following order and ranges:
#                   r --> red   [0,1.0]
#                   g --> green [0,1.0]
#                   b --> blue  [0,1.0]
#                   a --> alpha [0,1.0]
#
#               Attention, the input and output colors will not be checked.
#               Please, take the appropriate steps before and after using this procedure or use the color command instead.
#
#               Examples:
#
#                   One color:
#                       color    --> [list 0.4 0.5 0.2 0.7]
#                       channels --> [list 0.4 0.5 0.2 0.7]
#
#                   Two colors:
#                       color1   --> [list 0.4 0.5 0.2 0.7]
#                       color2   --> [list 0.5 0.4 0.6 0.2]
#                       channels --> [list 0.4 0.5 0.2 0.7 0.5 0.4 0.6 0.2] <-- all colors channels must be flattened together.
#
#                   Three colors:
#                       color1   --> [list 0.4 0.5 0.2 0.7]
#                       color2   --> [list 0.5 0.4 0.6 0.2]
#                       color3   --> [list 0.2 0.2 0.1 0.5]
#                       channels --> [list 0.4 0.5 0.2 0.7 0.5 0.4 0.6 0.2 0.2 0.2 0.1 0.5] <-- all colors channels must be flattened together.
#
#                   and so on and so forth...
#
# Some pre-computation have been made in order to increase the performance:
#   1 / 3   = 0.3333333333333333
#   180 / π = 57.29577951308232
#
# Return a list containing the resulting HSI colors channels (flattened together).
# Each HSI color will be rappresented by 4 channels values in the following order and ranges:
#   H --> Hue        [0,360.0[ --> Note: '360.0' is not included.
#   S --> Saturation [0,100.0]
#   I --> Intensity  [0,100.0]
#   A --> Alpha      [0,100.0]
proc ::_rgba_HSIA { channels } {
    foreach { r g b a } $channels {
        # Compute alpha [0,100.0].
        set alpha [expr { $a*100.0 }]

        # Compute the intensity [0,100.0].
        set i         [expr { ($r+$g+$b)*0.3333333333333333 }]; # range [0,1.0]
        set intensity [expr { $i*100.0 }]

        if { $r == $g && $r == $b } {
            # It's a gray...
            set hue        0
            set saturation 0
        } else {
            # Compute the saturation [0,100.0].
            set min        [expr { min($r,$g,$b) }]
            set saturation [expr { (1.0-($min/$i))*100.0 }]

            # Compute the interim hue [-1.0,1.0].
            set interim [expr { ($r-($g*0.5)-($b*0.5))/(sqrt(($r*$r)+($g*$g)+($b*$b)-($r*$g)-($r*$b)-($g*$b))) }]
            if { $interim < -1.0 } {
                set interim -1.0
            } elseif { $interim > 1.0 } {
                set interim 1.0
            }

            # Compute the arc cosine in degrees.
            set arccos [expr { (acos($interim))*57.29577951308232 }]
            if { $arccos < 0 } {
                set arccos [expr { $arccos+360.0 }]
            }

            # Compute the hue.
            if { $g < $b } {
                set hue [expr { 360.0-$arccos }]
            } else {
                set hue $arccos
            }
        }

        lappend results $hue $saturation $intensity $alpha
    }

    return $results
}

#*EOF*
