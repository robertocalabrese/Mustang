## _TRAVERSE_IN
#
# Manages the <TraverseIn> event.
#
# Where:
#
# w   Should be the widget's address involved.
#
# It doesn't return anything.
proc ::_TRAVERSE_IN { w } {
    try {
        $w instate !disabled
    } on error {} {
        switch -nocase -- [lindex [$w configure -state] end] {
            disabled { return }
        }
        $w icursor end
    } on ok { result } {
        switch -- $result {
            1   { $w icursor end }
        }
    }
}