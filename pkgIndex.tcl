# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

# Load the Mustang version.
try {
    open [file join $dir "version.txt"] r
} on error {} {
    chan puts stdout "Missing version."
    exit 1
} on ok { channel } {
    # Read the entire file.
    set file_content [split [chan read $channel] "\n"]
    chan close $channel

    # Scan the file content line by line.
    set ::MUSTANG_VERSION ""
    foreach line $file_content {
        # Skip any empty or commented lines.
        switch -- [string index [string trim $line] 0] {
            "#"     -
            ""      { continue }
            default {
                # Check if the line starts with 'VERSION:'.
                # If not, skip the line.
                switch -nocase -- [lindex $line 0] {
                    "VERSION:" {
                        set ::MUSTANG_VERSION [lindex $line 1]
                        break
                    }
                }
            }
        }
    }

    # Check if a version was found.
    switch -- $::MUSTANG_VERSION {
        ""  {
            chan puts stdout "Invalid version."
            exit 1
        }
    }
}

# Set the Mustang package folder.
set ::MUSTANG_DIR $dir

# Instruct Tcl on how to deliver the Mustang package.
package ifneeded Mustang $::MUSTANG_VERSION [list source [file join $dir "mustang.tcl"]]

#*EOF*
