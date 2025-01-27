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
}