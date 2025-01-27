# _LOAD_PALETTE
#
# Load a palette file.
#
# Where:
#
# filepath   Should be the absolute path of the palette file.
#
# It doesn't return anything.
proc ::_LOAD_PALETTE { filepath } {
    # Get the palette name.
    set palette [file rootname [file tail $filepath]]

}