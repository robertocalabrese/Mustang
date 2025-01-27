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

        chan puts $channel "# LANGUAGE"
        chan puts $channel "#"
        chan puts $channel "# It's a string that specifies the current language."
        chan puts $channel "# It must follow the 'ISO 639-1' specifications."
        chan puts $channel "LANGUAGE: $::LANGUAGE"
        chan puts $channel ""

        chan puts $channel "# MONOSPACE_FONT"
        chan puts $channel "#"
        chan puts $channel "# It's a list that specifies the monospace font to use (both family and size)."
        chan puts $channel "# If the size argument is a positive number, it is interpreted as a size in points."
        chan puts $channel "# If size is a negative number, its absolute value is interpreted as a size in pixels."
        chan puts $channel "# If a font cannot be displayed at the specified size, a nearby size will be chosen."
        chan puts $channel "MONOSPACE_FONT: $::FONT(Monospace,family) $::FONT(Monospace,size)"
        chan puts $channel ""

        chan puts $channel "# NORMAL_FONT"
        chan puts $channel "#"
        chan puts $channel "# It's a list that specifies the general font to use (both family and size)."
        chan puts $channel "# If the size argument is a positive number, it is interpreted as a size in points."
        chan puts $channel "# If size is a negative number, its absolute value is interpreted as a size in pixels."
        chan puts $channel "# If a font cannot be displayed at the specified size, a nearby size will be chosen."
        chan puts $channel "NORMAL_FONT: $::FONT(Normal,family) $::FONT(Normal,size)"
        chan puts $channel ""

        chan puts $channel "# NOTIFICATIONS"
        chan puts $channel "#"
        chan puts $channel "# It's a boolean that specifies the notifications state."
        chan puts $channel "#"
        chan puts $channel "# \['enabled' or 'disabled'\]"
        chan puts $channel "NOTIFICATIONS: $::NOTIFICATIONS"
        chan puts $channel ""

        chan puts $channel "# POPUPS"
        chan puts $channel "#"
        chan puts $channel "# It's a boolean that specifies the popups state."
        chan puts $channel "#"
        chan puts $channel "# \['enabled' or 'disabled'\]"
        chan puts $channel "POPUPS: $::POPUPS"
        chan puts $channel ""

        chan puts $channel "# SCALING"
        chan puts $channel "#"
        chan puts $channel "# It's a percentage that specifies the scaling factor of the screen."
        chan puts $channel "# It can be provided with or without the '%' symbol."
        chan puts $channel "#"
        chan puts $channel "# \[25.0%,300.0%\]"
        chan puts $channel "SCALING: $::SCALING"
        chan puts $channel ""

        chan puts $channel "# SCROLLBAR_ACTION"
        chan puts $channel "#"
        chan puts $channel "# It's a string that specifies how each scrollbar reacts when a click happens on the trough."
        chan puts $channel "#    jump --> The thumb will jump to the selected location."
        chan puts $channel "#    page --> The thumb will scroll one page down, up, left or right."
        chan puts $channel "#"
        chan puts $channel "# \['jump' or 'page'\]"
        chan puts $channel "SCROLLBAR_ACTION: $::SCROLLBAR_ACTION"
        chan puts $channel ""

        chan puts $channel "# SCROLLSPEED"
        chan puts $channel "#"
        chan puts $channel "# It's an integer that specifies how big is a scroll unit."
        chan puts $channel "# A scroll unit rappresents the distance to travel (in pixels) for a single tick of the mouse wheel."
        chan puts $channel "#"
        chan puts $channel "# \[1,100\]"
        chan puts $channel "SCROLLSPEED: $::SCROLLSPEED"
        chan puts $channel ""

        chan puts $channel "# SMALLEST_FONT"
        chan puts $channel "#"
        chan puts $channel "# It's a list that specifies the smallest font to use (both family and size)."
        chan puts $channel "# If the size argument is a positive number, it is interpreted as a size in points."
        chan puts $channel "# If size is a negative number, its absolute value is interpreted as a size in pixels."
        chan puts $channel "# If a font cannot be displayed at the specified size, a nearby size will be chosen."
        chan puts $channel "SMALLEST_FONT: $::FONT(Smallest,family) $::FONT(Smallest,size)"
        chan puts $channel ""

        chan puts $channel "# THEME"
        chan puts $channel "#"
        chan puts $channel "# It's a string that specifies the current theme name."
        chan puts $channel "THEME: $::THEME"
        chan puts $channel ""

        switch -- $::UNION {
            " " { set union space }
            "-" { set union "-"   }
            "+" { set union "+"   }
        }

        chan puts $channel "# UNION"
        chan puts $channel "#"
        chan puts $channel "# It's a character that specifies the current union symbol inside a shortcut that links two"
        chan puts $channel "# or more keys together (like 'Ctrl+C', 'Ctrl-C' or 'Ctrl C' for copy)."
        chan puts $channel "# It's used inside menus popups and/or contextual menus."
        chan puts $channel "#"
        chan puts $channel "# \['+', '-' or 'space'\]"
        chan puts $channel "UNION: $union"

        chan flush $channel
        chan close $channel

        return "success"
    }
}