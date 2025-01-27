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

                    # Check the colorname hexadecimal value at 12bit.
                    set value [::_CHECK_HEX $color_12bit HEX12]
                    switch -- $value {
                        INVALID {
                            # Skip the entire line.
                            continue
                        }
                        default { set color_12bit $value }
                    }

                    # Check the colorname hexadecimal value at 16bit.
                    set value [::_CHECK_HEX $color_16bit HEX16]
                    switch -- $value {
                        INVALID {
                            # Skip the entire line.
                            continue
                        }
                        default { set color_16bit $value }
                    }

                    # Check the colorname family value.
                    switch -- $family {
                        gray        -
                        red         -
                        orange      -
                        yellow      -
                        yellowgreen -
                        green       -
                        greencyan   -
                        cyan        -
                        cyanblue    -
                        blue        -
                        bluepurple  -
                        purple      -
                        purplered   {}
                        default     {
                            # Skip the entire line.
                            continue
                        }
                    }

                    # Register the colorname data for the current palette.
                    set ::TABLE($palette,$colorname,8)      $color_8bit
                    set ::TABLE($palette,$colorname,12)     $color_12bit
                    set ::TABLE($palette,$colorname,16)     $color_16bit
                    set ::TABLE($palette,$colorname,family) $family

                    lappend ::TABLE($palette,all)     $colorname
                    lappend ::TABLE($palette,$family) $colorname

                    # Register the colorname data for all the available palettes.
                    set ::TABLE(ALL,$colorname,8)      $color_8bit
                    set ::TABLE(ALL,$colorname,12)     $color_12bit
                    set ::TABLE(ALL,$colorname,16)     $color_16bit
                    set ::TABLE(ALL,$colorname,family) $family

                    lappend ::TABLE(ALL,all)     $colorname
                    lappend ::TABLE(ALL,$family) $colorname
                }
            }
        }
    }

    # Check if all the colorname specified in the palette file were ignored.
    switch -- [info exists ::TABLE($palette,all)] {
        0   { return }
    }
}