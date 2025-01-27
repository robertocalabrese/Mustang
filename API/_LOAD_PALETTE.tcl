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

        # Scan the file content line by line.
        foreach line $file_content {
            # Skip any empty or commented lines.
            switch -- [string index [string trim $line] 0] {
                ""      -
                "#"     { continue }
                default {
                    # Get the color data.
                    set colorname   [string trim [lindex $line 0]]
                    set color_8bit  [lindex $line 1]
                    set color_12bit [lindex $line 2]
                    set color_16bit [lindex $line 3]
                    set family      [string tolower [lindex $line 4]]

                    # Check that colorname is not allready known or an empty string.
                    if { ($colorname in $::TABLE(ALL,all)) || ($colorname eq "") } {
                        # Skip the entire line.
                        continue
                    }

                    # Check the colorname hexadecimal value at 8bit.
                    set value [::_CHECK_HEX $color_8bit HEX8]
                    switch -- $value {
                        INVALID {
                            # Skip the entire line.
                            continue
                        }
                        default { set color_8bit $value }
                    }
                }
            }
        }
    }
}