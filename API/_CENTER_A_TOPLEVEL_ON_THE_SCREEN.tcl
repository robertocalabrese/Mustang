## _CENTER_A_TOPLEVEL_ON_THE_SCREEN
#
# Center a toplevel address 'w' on the screen.
#
# Where:
#
# w   Should be the toplevel address to be centered.
#
# It doesn't return anything.
proc ::_CENTER_A_TOPLEVEL_ON_THE_SCREEN { w } {
    # Check that w is a toplevel.
    if { $w ni $::ADDRESS(classtype,TOPLEVEL) } {
        return
    } else {
        update
    }

    # Get the toplevel top-left corner position.
    set width  [_winfo width  $w]
    set height [_winfo height $w]

    # Get the screen dimension.
    set screenwidth  [_winfo screenwidth  $w]
    set screenheight [_winfo screenheight $w]

    # Compute the new toplevel coordinates.
    set x [expr { round(ceil(($screenwidth-$width)*0.5)) }]
    set y [expr { round(ceil(($screenheight-$height)*0.5)) }]
}