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

        chan puts $channel "# COLORSCHEME"
        chan puts $channel "#"
        chan puts $channel "# It's a string that specifies the current colorscheme."
        chan puts $channel "#"
        chan puts $channel "# \['light' or 'dark'\]"
        chan puts $channel "COLORSCHEME: $::COLORSCHEME"
        chan puts $channel ""

        chan puts $channel "# DEPTH"
        chan puts $channel "#"
        chan puts $channel "# It's an integer that specifies the current color depth."
        chan puts $channel "#"
        chan puts $channel "# \['8', '12' or '16'\]"
        chan puts $channel "DEPTH: $::DEPTH"
        chan puts $channel ""

        chan puts $channel "# DPI"
        chan puts $channel "#"
        chan puts $channel "# It's an integer that specifies the number of pixels per inch of the screen"
        chan puts $channel "# where the application is initially placed."
        chan puts $channel "DPI: $::DPI"
        chan puts $channel ""

        chan puts $channel "# ::FOCUS_MODEL"
        chan puts $channel "#"
        chan puts $channel "# Change the focus model for the application."
        chan puts $channel "#"
        chan puts $channel "# Implicit method:"
        chan puts $channel "#    Whenever the mouse enters a window, Mustang will automatically give it the input focus."
        chan puts $channel "#    The focus command may be used to move the focus to a window other than the one under the mouse,"
        chan puts $channel "#    but as soon as the mouse moves into a new window the focus will jump to that window."
        chan puts $channel "#"
        chan puts $channel "# Explicit method."
        chan puts $channel "#    The 'User' has to click on a window to give it the focus."
        chan puts $channel "#"
        chan puts $channel "# \['implicit' or 'explicit'\]"
        chan puts $channel "FOCUS_MODEL: $::FOCUS_MODEL"
        chan puts $channel ""
    }
}