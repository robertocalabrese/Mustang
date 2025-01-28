# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

# ::_rgb_RGB12
#
# Transform rgb colors (without alpha channel) into RGB values at 12 bit (without alpha channel).
#
# Where:
#
# channels      Should be a list that specifies all the channels (flattened together) of the rgb colors to convert.
#               Each rgb color needs to be rappresented by 3 channels values in the following order and ranges:
#                   r --> red   [0,1.0]
#                   g --> green [0,1.0]
#                   b --> blue  [0,1.0]
#
#               Attention, the input and output colors will not be checked.
#               Please, take the appropriate steps before and after using this procedure or use the color command instead.
#
#               Examples:
#
#                   One color:
#                       color    --> [list 0.4 0.5 0.2]
#                       channels --> [list 0.4 0.5 0.2]
#
#                   Two colors:
#                       color1   --> [list 0.4 0.5 0.2]
#                       color2   --> [list 0.5 0.4 0.6]
#                       channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6] <-- all colors channels must be flattened together.
#
#                   Three colors:
#                       color1   --> [list 0.4 0.5 0.2]
#                       color2   --> [list 0.5 0.4 0.6]
#                       color3   --> [list 0.2 0.2 0.1]
#                       channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6 0.2 0.2 0.1] <-- all colors channels must be flattened together.
#
#                   and so on and so forth...
#
# Return a list containing the resulting RGB colors channels (flattened together) at 12 bit.
# Each RGB color will be rappresented by 3 channels values in the following order and ranges:
#   R --> Red   [0,4095]
#   G --> Green [0,4095]
#   B --> Blue  [0,4095]
proc ::_rgb_RGB12 { channels } {
    foreach { r g b } $channels {
        set red12   [expr { round($r*4095.0) }]
        set green12 [expr { round($g*4095.0) }]
        set blue12  [expr { round($b*4095.0) }]

        lappend results $red12 $green12 $blue12
    }

    return $results
}

#*EOF*
