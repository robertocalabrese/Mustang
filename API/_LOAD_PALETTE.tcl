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

    # Load the palette file.
    try {
        open [file nativename $filepath] r
    } on error {} {
        chan puts stdout "Unable to load the '$palette' palette. Ignoring."
    } on ok { channel } {
        # Read the entire file.
        set file_content [split [chan read $channel] "\n"]
        chan close $channel
    }
}