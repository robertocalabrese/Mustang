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
    }
}