# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

# ::_RGB8_rgb
#
# Transform RGB colors at 8 bit (without alpha channel) into rgb colors (without alpha channel).
#
# Where:
#
# channels      Should be a list that specifies all the channels (flattened together) of the RGB colors at 8 bit to convert.
#               Each RGB color needs to be rappresented by 3 channels values in the following order and ranges:
#                   R --> Red   [0,255]
#                   G --> Green [0,255]
#                   B --> Blue  [0,255]
#
#               Attention, the input and output colors will not be checked.
#               Please, take the appropriate steps before and after using this procedure or use the color command instead.
#
#               Examples:
#
#                   One color:
#                       color    --> [list 40 172 212]
#                       channels --> [list 40 172 212]
#
#                   Two colors:
#                       color1   --> [list 40 172 212]
#                       color2   --> [list 57 65  65 ]
#                       channels --> [list 40 172 212 57 65 65] <-- all colors channels must be flattened together.
#
#                   Three colors:
#                       color1   --> [list 40 172 212]
#                       color2   --> [list 57 65  65 ]
#                       color3   --> [list 23 212 120]
#                       channels --> [list 40 172 212 57 65 65 23 212 120] <-- all colors channels must be flattened together.
#
#                   and so on and so forth...
#
# A pre-computation has been made in order to increase the performance:
#   1 / 255 = 0.00392156862745098
#
# Return a list containing the resulting rgb colors channels (flattened together).
# Each rgb color will be rappresented by 3 channels values in the following order and ranges:
#   r --> red   [0,1.0]
#   g --> green [0,1.0]
#   b --> blue  [0,1.0]
proc ::_RGB8_rgb { channels } {
    foreach { red8 green8 blue8 } $channels {
        set r [expr { $red8*0.00392156862745098   }]
        set g [expr { $green8*0.00392156862745098 }]
        set b [expr { $blue8*0.00392156862745098  }]

        lappend results $r $g $b
    }

    return $results
}

#*EOF*
