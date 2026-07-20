# Copyright: 2025 Roberto Calabrese a.k.a. Kicka
#
# This file is part of "Mustang", a GUI toolkit for Tcl/Tk 9.0 and later
# (https://codeberg.org/kicka/Mustang).
#
# The author hereby grant permission to use, copy, modify, distribute,
# and license this software and its documentation for any purpose, provided
# that existing copyright notices are retained in all copies and that this
# notice is included verbatim in any distributions. No written agreement,
# license, or royalty fee is required for any of the authorized uses.
# Modifications to this software may be copyrighted by their authors
# and need not follow the licensing terms described here, provided that
# the new terms are clearly indicated on the first page of each file where
# they apply.
#
# IN NO EVENT SHALL THE AUTHOR OR DISTRIBUTORS BE LIABLE TO ANY PARTY
# FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
# ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
# DERIVATIVES THEREOF, EVEN IF THE AUTHOR HAVE BEEN ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# THE AUTHOR AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
# IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHOR AND DISTRIBUTORS HAVE
# NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
# MODIFICATIONS.
#
# GOVERNMENT USE: If you are acquiring this software on behalf of the
# U.S. government, the Government shall have only "Restricted Rights"
# in the software and related documentation as defined in the Federal
# Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
# are acquiring the software on behalf of the Department of Defense, the
# software shall be classified as "Commercial Computer Software" and the
# Government shall have only "Restricted Rights" as defined in Clause
# 252.227-7013 (c) (1) of DFARs.  Notwithstanding the foregoing, the
# author grant the U.S. Government and others acting in its behalf
# permission to use and distribute the software in accordance with the
# terms specified in this license.

# Symbols meanings that may be used by the command synopsis:
#
#   *option*             --> A mandatory parameter that must be substituted with a proper value.
#   **option**           --> The command name or a mandatory parameter that must be written verbatim.
#
#   ?*option*?           --> An optional parameter that must be substituted with a proper value.
#   ?**option**?         --> An optional parameter that must be written verbatim.
#
#   ?*option* *value*?   --> An optional 'key-value' parameter that must be substituted with proper values.
#   ?**option** *value*? --> An optional 'key-value' parameter where the former must be written verbatim and
#                            the latter must be substituted with a proper value.

# Symbols meanings that may be used by the command infos:
#
#   *text*               --> Italic.
#   **text**             --> Bold.
#   ***text***           --> Italic-bold
#
#   ## text              --> Title.
#   #### text            --> Chapter.
#   ###### text          --> Sub-chapter.
#
#   [text](https:\\...)  --> Link to an internet page.
#   [text](/wiki/...)    --> Link to another file in the wiki.
package provide ::ms::style 0.1

# Create the mustang **style** package.
namespace eval ::ms::style {}

# Rename the original Tk **ttk::style** command.
rename ttk::style _ttk_style

# Create aliases for the mustang **style** command.
interp alias {} style      {} ::ms::style::Command
interp alias {} ttk::style {} ::ms::style::Command

## Command
#
# Replace the Tk **ttk::style** command.
#
# Where:
#
# args   Should be the arguments of the **style** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::style::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        configure {
            switch -- [llength $args] {
                0   { ::ms::Error "Invalid number of arguments." $caller_info }
                1   {
                    set style [lindex $args 0]

                    # Check if the style provided exists (in the current theme).
                    switch -- [info exists ::ms::styleopt($::ms::theme,$style)] {
                        0   { return "" }
                        1   { return $::ms::styleopt($::ms::theme,$style) }
                    }
                }
                2   {
                    set style  [lindex $args 0]
                    set option [string trimleft [lindex $args 1] "-"]

                    # Check if the style option provided exists (in the current theme).
                    switch -- [info exists ::ms::styleopt($::ms::theme,$style,$option)] {
                        0   { return "" }
                        1   { return $::ms::styleopt($::ms::theme,$style,$option) }
                    }
                }
                default {
                    set style [lindex  $args 0]
                    set args  [lremove $args 0]

                    # Check that 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Register (as is) the 'style' options provided.
                            set ::ms::styleopt($::ms::theme,$style) $args

                            # Check the options provided.
                            set style_options [list ]
                            foreach { option value } $args {
                                # Check the option value.
                                set value [::ms::style::Check_Option $option $value]
                                switch -- $value {
                                    invalid { ::ms::Error "Invalid option for '$style', '$option $value'." $caller_info }
                                    default { lappend style_options $option $value }
                                }

                                # Remove the '-' from option.
                                set option [string trimleft $option "-"]

                                # Register the current option value for 'style' in the 'styleopt' options array for the current theme.
                                set ::ms::styleopt($::ms::theme,$style,$option) $value
                            }

                            # Execute the command.
                            _ttk_style configure $style {*}$style_options

                            # If needed, add the style into the style list for the current theme.
                            if { $style ni $::ms::style($::ms::theme) } {
                                lappend ::ms::style($::ms::theme) $style
                            }

                            # Update each classtype real address that have 'style' as a style.
                            foreach classtype $::ms::data(classtypes) {
                                if { $style in $::ms::style($classtype) } {
                                    [string cat "::ms::" $classtype "::Style_Update"] $style $caller_info
                                }
                            }

                            return ""
                        }
                        default { ::ms::Error "Invalid number of options for '$style'." $caller_info }
                    }
                }
            }
        }
        element {
            # Separate the 'subcommand' from its 'args'.
            set subcommand [lindex  $args 0]
            set args       [lremove $args 0]
            switch -- $subcommand {
                create {
                    switch -- [llength $args] {
                        0       -
                        1       { ::ms::Error "Invalid number of arguments." $caller_info }
                        default {
                            # Execute the command.
                            try {
                                _ttk_style element create {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                    }
                }
                names {
                    switch -- [llength $args] {
                        0   {
                            # Execute the command.
                            return [_ttk_style element names]
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                options {
                    switch -- [llength $args] {
                        1   {
                            # Execute the command.
                            try {
                                _ttk_style element options $args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid option, '$subcommand'." $caller_info }
            }
        }
        layout {
            # Note: Canvas, Listbox, Menu, Text and Toplevel widgets does not understands layouts
            #       due to their classic nature.
            #       Trying to associate a layout to one of these widget will be ignored by mustang.
            #       The layout will be created but never applied.

            switch -- [llength $args] {
                0   { ::ms::Error "Invalid number of arguments." $caller_info }
                1   {
                    set layout_name [lindex $args 0]

                    # Check if the layout name provided exists in the 'stylelayout' array for the current theme.
                    switch -- [info exists ::ms::stylelayout($::ms::theme,$layout_name)] {
                        0   { return "" }
                        1   { return $::ms::stylelayout($::ms::theme,$layout_name) }
                    }
                }
                default {
                    set layout_name [lindex $args 0]
                    set layout_spec [string trim {*}[lremove $args 0]]

                    # Check the layout spec provided.
                    switch -- [::ms::style::Check_Layout $layout_spec] {
                        invalid { ::ms::Error "Invalid layout spec." $caller_info }
                    }

                    # Register the layout into the style layout dictionary.
                    set ::ms::stylelayout($::ms::theme,$layout_name) $layout_spec

                    # Execute the command.
                    _ttk_style layout $layout_name $layout_spec

                    # If needed, add the layout name into the layout list.
                    switch -- [info exists ::ms::layouts($::ms::theme)] {
                        0   { set ::ms::layouts($::ms::theme) [list $layout_name] }
                        1   {
                            if { $layout_name ni $::ms::layouts($::ms::theme) } {
                                lappend ::ms::layouts($::ms::theme) $layout_name
                            }
                        }
                    }

                    return ""
                }
            }
        }
        lookup {
            # Execute the command.
            try {
                _ttk_style lookup {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        map {
            switch -- [llength $args] {
                0   { ::ms::Error "Invalid number of arguments." $caller_info }
                1   {
                    set style [lindex $args 0]

                    # Check if exists a mapping for the style provided (in the current theme).
                    switch -- [info exists ::ms::stylemap($::ms::theme,$style)] {
                        0   { return "" }
                        1   { return $::ms::stylemap($::ms::theme,$style) }
                    }
                }
                2   {
                    set style  [lindex $args 0]
                    set option [string trimleft [lindex $args 1] "-"]

                    # Check if the style map option provided exists (in the current theme).
                    switch -- [info exists ::ms::stylemap($::ms::theme,$style,$option)] {
                        0   { return "" }
                        1   { return $::ms::stylemap($::ms::theme,$style,$option) }
                    }
                }
                default {
                    set style [lindex  $args 0]
                    set args  [lremove $args 0]

                    # Note: The following check is making mustang active differently than Tk.
                    #         Tk      --> If the style doesn't exists when the map command is issued,
                    #                     it will be created by Tk.
                    #
                    #         Mustang --> The style must allready exists before issuing the map command.

                    # Check if the relative style is allready created.
                    if { $style ni $::ms::style($::ms::theme) } {
                        ::ms::Error "'$style' mapping data must be created after the '$style' style creation, not before." $caller_info
                    }

                    # Check that 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Register (as is) the 'style' mapping provided.
                            set ::ms::stylemap($::ms::theme,$style) $args

                            # Check and translate the mapping options values.
                            set mapping [::ms::style::Check_Mapping $style {*}$::ms::stylemap($::ms::theme,$style)]
                            switch -- $mapping {
                                invalid { ::ms::Error "Invalid mapping data for '$style'." $caller_info }
                            }

                            # Execute the command.
                            _ttk_style map $style {*}$mapping

                            # Update each classtype real address that have 'style' as a style.
                            foreach classtype $::ms::data(classtypes) {
                                if { $style in $::ms::style($classtype) } {
                                    [string cat "::ms::" $classtype "::Style_Update"] $style $caller_info
                                }
                            }

                            return ""
                        }
                        default { ::ms::Error "Invalid number of mappings for '$style'." $caller_info }
                    }
                }
            }
        }
        theme {
            # Separate the 'subcommand' from its 'args'.
            set subcommand [lindex  $args 0]
            set args       [lremove $args 0]
            switch -- $subcommand {
                create   -
                settings {}
                names {}
                styles {}
                use {}
                default { ::ms::Error "Invalid option, '$subcommand'." $caller_info }
            }
        }
    }
}

#*EOF*