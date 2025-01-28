# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

# ::_xyY_XYZ
#
# Transform xyY colors (without alpha channel) into XYZ colors (without alpha channel).
# Both in the PCS D50 space.
#
# Where:
#
# channels      Should be a list that specifies all the channels (flattened together) of the xyY colors to convert.
#               Each xyY color needs to be rappresented by 3 channels values in the following order and ranges:
#                   x --> x [0,1.0]
#                   y --> y [0,1.0]
#                   Y --> Y [0,1.0]
#
#               Attention, the input and output colors will not be checked.
#               Please, take the appropriate steps before and after using this procedure or use the color command instead.
#
#               Examples:
#
#                   One color:
#                       color    --> [list 1.0 0.5 0.7]
#                       channels --> [list 1.0 0.5 0.7]
#
#                   Two colors:
#                       color1   --> [list 1.0 0.5 0.7]
#                       color2   --> [list 0.5 0.8 0.8]
#                       channels --> [list 1.0 0.5 0.7 0.5 0.8 0.8] <-- all colors channels must be flattened together.
#
#                   Three colors:
#                       color1   --> [list 1.0 0.5 0.7]
#                       color2   --> [list 0.5 0.8 0.8]
#                       color3   --> [list 0.2 0.2 0.1]
#                       channels --> [list 1.0 0.5 0.7 0.5 0.8 0.8 0.2 0.2 0.1] <-- all colors channels must be flattened together.
#
#                   and so on and so forth...
#
# Note:  For info about xyY to XYZ conversions visit 'http://www.brucelindbloom.com'.
#
# Return a list containing the resulting XYZ colors channels (flattened together).
# Each XYZ color will be rappresented by 3 channels values in the following order and ranges:
#   X --> X [0,$::sRGB(PCS,X)]
#   Y --> Y [0,$::sRGB(PCS,Y)]
#   Z --> Z [0,$::sRGB(PCS,Z)]
proc ::_xyY_XYZ { channels } {
    foreach { x y Y } $channels {
        if { $y == 0 } {
            set X 0
            set Y 0
            set Z 0
        } else {
            # Compute X [0,$::sRGB(PCS,X)].
            set X [expr { ($x*$Y)/$y }]

            # Compute Z [0,$::sRGB(PCS,Z)].
            set Z [expr { ((1.0-$x-$y)*$Y)/$y }]
        }

        lappend results $X $Y $Z
    }

    return $results
}

#*EOF*
