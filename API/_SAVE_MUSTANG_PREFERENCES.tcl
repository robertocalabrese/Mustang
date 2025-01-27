# _SAVE_MUSTANG_PREFERENCES
#
# Save the Mustang configuration file.
#
# Return the word 'success' or a text string describing what went wrong.
proc ::_SAVE_MUSTANG_PREFERENCES {} {
    try {
        open [file join $::CONFIG_DIR mustang mustang.conf] w
    } on error { errortext errorcode } {
        return $errortext
    } on ok { channel } {
        chan puts $channel "# Mustang $::MUSTANG_VERSION configuration file."
        chan puts $channel "#"
        chan puts $channel "# [clock format [clock seconds] -format [list %d %B %Y - %H:%M:%S]]"
        chan puts $channel ""

        chan puts $channel "# ACCENT"
        chan puts $channel "#"
        chan puts $channel "# It's a string that specifies the current accent color."
        chan puts $channel "#"
        chan puts $channel "# \['blue', 'cyan', 'green', 'orange', 'purple', 'red', 'yellow' or 'custom'\]"
        chan puts $channel "ACCENT: $::ACCENT"
        chan puts $channel ""

        chan puts $channel "# BIGGEST_FONT"
        chan puts $channel "#"
        chan puts $channel "# It's a list that specifies the biggest font to use (both family and size)."
        chan puts $channel "# If the size argument is a positive number, it is interpreted as a size in points."
        chan puts $channel "# If size is a negative number, its absolute value is interpreted as a size in pixels."
        chan puts $channel "# If a font cannot be displayed at the specified size, a nearby size will be chosen."
        chan puts $channel "BIGGEST_FONT: $::FONT(Biggest,family) $::FONT(Biggest,size)"
        chan puts $channel ""

        chan puts $channel "# CIE"
        chan puts $channel "#"
        chan puts $channel "# It's a string that specifies the current CIE standard."
        chan puts $channel "# This value is used in color model conversions like XYZ-->RGB, RGB-->XYZ, ..."
        chan puts $channel "#"
        chan puts $channel "# \['standard' or 'intent'\]"
        chan puts $channel "CIE: $::CIE"
        chan puts $channel ""
    }
}