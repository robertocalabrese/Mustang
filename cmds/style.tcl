# Copyright: 2025 Roberto Calabrese a.k.a. Kicka
#
# This file is part of "Mustang", a GUI toolkit for Tcl/Tk 9.0 and later
# (https://github.com/robertocalabrese/Mustang).
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

## style - Manipulate the style database.
#
#### SYNOPSIS
#
# **style** **configure** *style* ?**option**? ?*value*? ?**option** *value*? ... ?**option** *value*?
# **style** **element** **create** *elementName* *type ?*arg* ... *arg*?
# **style** **element** **names**
# **style** **element** **options** *element*
# **style** **layout** *style*
# **style** **lookup** *style* *option* ?*state*? ?*default*?
# **style** **map** *style* ?*option* {*statespec* *value* ... ?*statespec* *value*?}? ... ?*option* {*statespec* *value* ... ?*statespec* *value*?}?
# **style** **theme** **create** *themeName* ?**-parent** *basedon*? ?**-settings** *script*?
# **style** **theme** **names**
# **style** **theme** **settings** *themeName* *script*
# **style** **theme** **styles**
# **style** **theme** **use** ?*MustangTheme*?
#
#### DEFINITIONS
#
# At each widget is assigned a *style*, which specifies the set of elements making up the widget and how
# they are arranged, along with dynamic and default settings for element options.
# By default, the style name is the same as the widget's class; this may be overridden by the *-style* option.
#
# A *theme* is a collection of elements and styles which controls the overall look and feel of an application.
# The mustang default theme is called *Halo*, a cross platform dynamic theme based on the *clam* engine.
#
#### DESCRIPTION
#
# The *style* command can have any of several forms, depending on the *action* argument.
# The *action* argument is always the first argument after the command itself.
# The legal forms are:
#
#   **style** **configure** *style* ?**option**? ?*value*? ?**option** *value*? ... ?**option** *value*?
#       Sets the default value of the specified option(s) in *style*.
#
#       If *style* does not exist, it is created.
#       If only *style* and *option* are specified, get the default value for option *option* of style *style*.
#       If only *style* is specified, get the default value for all options of style *style*.
#
#   **style** **element** **create** *elementName* *type ?*arg* ... *arg*?
#       Creates a new element in the current theme of type *type*.
#       The only cross-platform built-in element type is *image* (see [ttk_image](https://www.tcl-lang.org/man/tcl9.0/TkCmd/ttk_image.html))
#       but themes may define other element types (see **Ttk_RegisterElementFactory**).
#       On suitable versions of Windows an element factory is registered to create Windows theme elements
#       (see [ttk_vsapi](https://www.tcl-lang.org/man/tcl9.0/TkCmd/ttk_vsapi.html)).
#
#   **style** **element** **names**
#       Returns the list of elements defined in the current theme.
#
#   **style** **element** **options** *element*
#       Returns the list of *element*'s options.
#
#   **style** **layout** *style*
#       Return the layout specification for style *style*.
#
#       Note: Canvas, Listbox, Menu, Text and Toplevel widgets does not understands layouts due to their classic nature.
#             Trying to associate a layout to one of these widget will be ignored by mustang; the layout will be created
#             but never applied.
#
#   **style** **lookup** *style* *option* ?*state*? ?*default*?
#       Returns the value specified for *option* in style *style* in state *state*, using the standard lookup rules
#       for element options.
#
#       *State* is a list of state names; if omitted, it defaults to all bits off (the *normal* state).
#       The *normal* state can be specified as an empty string or with the word 'normal'.
#
#       If the *default* argument is present, it is used as a fallback value in case no specification for *option* is found.
#       If *style* does not exist, it is created.
#
#   **style** **map** *style* ?*option* {*statespec* *value* ... ?*statespec* *value*?}? ... ?*option* {*statespec* *value* ... ?*statespec* *value*?}?
#       Sets dynamic (state dependent) values of the specified option(s) in *style*.
#       Each *statespec*/*value* pair is examined in order; the value corresponding to the first matching *statespec* is used.
#
#       If *style* does not exist, an error will be returned. Mappings can be created only if their related style allready exists.
#       If only *style* and *option* are specified, get the dynamic values for option *option* of style *style*.
#       If only *style* is specified, get the dynamic values for all options of style *style*.
#
#   **style** **theme** **create** *themeName* ?**-parent** *basedon*? ?**-settings** *script*?
#       Creates a new theme. It is an error if *themeName* already exists.
#       If *-parent* is specified, the new theme will inherit styles, elements, and layouts from the parent theme *basedon*.
#       If *-settings* is present, *script* is evaluated in the context of the new theme as per **style theme settings**.
#
#   **style** **theme** **names**
#       Returns all the available themes.
#
#   **style** **theme** **settings** *themeName* *script*
#       Temporarily sets the current theme to *themeName*, evaluate *script*, then restore the previous theme.
#       Typically *script* simply defines styles and elements, though arbitrary Tcl code may appear.
#
#       Each time a new theme is selected by the user, mustang will try to recreate each missing style in the new theme, adapting them
#       for the new theme colors, accent colors and colorscheme, if possible.
#       Using this command, will stop this mustang functionality for every style specified in *script*.
#
#       In order for mustang to adapt the styles in the new theme, every style color option should contain theme color names
#       instead of pure hexadecimals values. This will allow mustang to translate them using the theme colors of the current theme.
#
#   **style** **theme** **styles**
#       Returns a list of all the styles created.
#
#   **style** **theme** **use** ?*themeName*?
#       Without an argument the result is the name of the current mustang theme. Otherwise this command sets the current theme
#       to *themeName*, and refreshes all widgets.
#
#### LAYOUTS
#
# A *layout* specifies a list of elements, each followed by one or more options specifying how to arrange the element.
# The layout mechanism uses a simplified version of the [pack](/wiki/commands/pack.md) geometry manager: given an initial cavity,
# each element is allocated a parcel.
# Then the parcel actually used by the element is adjusted within the allocated parcel.
# Valid options are:
#
#   **-children** { *sublayout...* }
#       Specifies a list of elements to place inside the element.
#
#   **-expand** *boolean*
#       Specifies whether the allocated parcel is the entire cavity.
#       If so, simultaneous specification of *-side* is ignored.
#       Defaults to 0.
#
#   **-side** *side*
#       Specifies which side of the cavity to place the element.
#       Allowed values are one of **left**, **right**, **top** or **bottom**.
#       For instance, **-side top** allocates the parcel along the top of the cavity having width and height respectively
#       the width of the cavity and the height of the element.
#       If omitted, the allocated parcel is the entire cavity (same effect as **-expand** 1).
#
#   **-sticky** [*nswe*]
#       Specifies the actual parcel position and size inside the allocated parcel.
#       If specified as an empty string then the actual parcel is centered in the allocated parcel.
#       Default is **nswe**.
#
# For example:
#
#   ttk::style layout Horizontal.TScrollbar {
#       Scrollbar.trough -children {
#           Scrollbar.leftarrow -side left \
#           Scrollbar.rightarrow -side right \
#           Horizontal.Scrollbar.thumb -side left -sticky ew
#       }
#   }
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
                settings {
                    # Execute the command.
                    try {
                        _ttk_style theme $subcommand {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                names { return $::ms::themes }
                styles {
                    switch -- [llength $args] {
                        0       { return $::ms::style($::ms::theme) }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                use {
                    switch -- [llength $args] {
                        0   { return $::ms::theme }
                        1   {
                            if { $args in $::ms::themes } {
                                # Change the current theme.
                                set ::ms::theme $args

                                # Disable the user to iteract with the application while mustang is updating the theme.
                                foreach w $::ms::addr(toplevel,classtype) {
                                    _tk busy hold $w
                                    _tk busy configure $w -cursor watch
                                }

                                #########################
                                ##                     ##
                                ##     UPDATE THEME    ##
                                ##                     ##
                                #########################

                                # Note: The command could be either a refresh of the accent color and/or colorscheme, or a theme change.

                                # Automatically load all the '::ms::theme' svg images (if any) and re-color them relative to the current
                                # accent color and colorscheme.
                                ::ms::Load_SVG_Images $::ms::theme

                                # Refresh/Load the current theme.
                                _ttk_style theme use $::ms::theme

                                # Update the theme accent color and colorscheme in every style.
                                foreach style $::ms::style($::ms::theme) {
                                    ##############################################
                                    ##                                          ##
                                    ##     UPDATE EVERY THEME STYLE OPTIONS     ##
                                    ##                                          ##
                                    ##############################################

                                    # Re-translate all the theme style options.
                                    set style_options [list ]
                                    foreach { option value } $::ms::styleopt($::ms::theme,$style) {
                                        # Check and eventually re-translate the option value.
                                        set value [::ms::style::Check_Option $option $value]

                                        # Register the current option and its value into the 'styleopt' array for the current theme.
                                        lappend style_options $option $value

                                        # Remove the '-' from 'option'.
                                        set option [string trimleft $option "-"]

                                        # Register the option value in the 'styleopt' array for the current theme.
                                        set ::ms::styleopt($::ms::theme,$style,$option) $value
                                    }

                                    # Update the theme style options.
                                    _ttk_style configure $style {*}$style_options

                                    ######################################################
                                    ##                                                  ##
                                    ##     UPDATE/CREATE EVERY THEME STYLE MAPPINGS     ##
                                    ##                                                  ##
                                    ######################################################

                                    # Note: Not every style has a mapping state.

                                    # If exists a 'stylemap' array for the current theme and style, re-translate it.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$style)] {
                                        1   {
                                            # Check and eventually re-translate the mapping options values.
                                            set mapping [::ms::style::Check_Mapping $style {*}$::ms::stylemap($::ms::theme,$style)]

                                            # Update the theme mapping states.
                                            _ttk_style map $style {*}$mapping
                                        }
                                    }
                                }

                                ########################################
                                ##                                    ##
                                ##     UPDATE ALL WIDGETS CREATED     ##
                                ##                                    ##
                                ########################################

                                # Refresh all widgets option (for each classtype) that are not managed directly by Tk.
                                foreach classtype $::ms::data(classtypes) {
                                    foreach style $::ms::style($classtype) {
                                        [string cat "::ms::" $classtype "::Style_Update"] $style $caller_info
                                    }
                                }

                                # Enable the user to iteract again with the application.
                                foreach w $::ms::addr(toplevel,classtype) {
                                    _tk busy forget $w
                                }

                                update
                            }

                            # Notify the developer that the theme, the accent color or the colorscheme has changed.
                            _event generate . <<ThemeChanged>>

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid option, '$subcommand'." $caller_info }
            }
        }
    }
}

####################
##                ##
##     CHECKS     ##
##                ##
####################

# Check_Layout
#
# Check the style layout spec provided.
#
# Where:
#
# layout_spec   Should be the style layout spec to validate.
#
# Return the word 'OK' if the style layout spec is validated, or the word 'invalid' if its not.
proc ::ms::style::Check_Layout { layout_spec } {
    set index 0
    while { $index < [llength $layout_spec] } {
        set layout_item [lindex $layout_spec $index]
        switch -- $layout_item {
            -border {
                set value [lindex $layout_spec $index+1]
                switch -- [string is integer -strict $value] {
                    0   { return invalid }
                }

                incr index +2
            }
            -children {
                set value [lindex $layout_spec $index+1]
                switch -- $value {
                    ""      { return invalid }
                    default { tailcall ::ms::style::Check_Layout $value }
                }

                incr index +2
            }
            -expand {
                switch -- [lindex $layout_spec $index+1] {
                    0        -
                    no       -
                    off      -
                    false    -
                    disabled -
                    1        -
                    yes      -
                    on       -
                    true     -
                    enabled  {}
                    default  { return invalid }
                }

                incr index +2
            }
            -side {
                switch -- [lindex $layout_spec $index+1] {
                    bottom  -
                    left    -
                    right   -
                    top     {}
                    default { return invalid }
                }

                incr index +2
            }
            -sticky {
                set value  [lindex $layout_spec $index+1]
                set length [string length $value]
                switch -- $length {
                    0   {}
                    1   -
                    2   -
                    4   {
                        set char_index 0
                        while { $char_index < $length } {
                            set char [string index $value $char_index]
                            switch -- $char {
                                n       -
                                s       -
                                e       -
                                w       {}
                                default { return invalid }
                            }

                            incr char_index
                        }
                    }
                    default { return invalid }
                }

                incr index +2
            }
            default {
                switch -- [string index $layout_item 0] {
                    "-"     { return invalid }
                    default { incr index }
                }
            }
        }
    }

    return "OK"
}

# Check_Mapping
#
# Check the style mapping data provided.
#
# Where:
#
# style   Should be the style name of the style mapping data to analyze.
#
# args    Should be the style mapping data to analyze.
#
# Return the data if the style mapping provided is validated, or the word 'invalid' if its not.
proc ::ms::style::Check_Mapping { style args } {
    set stylemap [list ]
    foreach { option mapping } $args {
        set option_states_values [list ]
        foreach { states value } $mapping {
            # Check the states.
            foreach state $states {
                switch -- [::ms::Check_State $state] {
                    invalid { return invalid }
                }
            }

            # Check the states option value.
            set result [::ms::style::Check_Option $option $value]
            switch -- $result {
                invalid { return invalid }
                default { lappend option_states_values $states $result }
            }
        }

        # Add the option and the option states values to 'stylemap'.
        lappend stylemap $option $option_states_values

        # Remove the '-' from option.
        set option [string trimleft $option "-"]

        # Register the option states values in the 'stylemap' array.
        set ::ms::stylemap($::ms::theme,$style,$option) $option_states_values
    }

    return $stylemap
}

# Check_Option
#
# Validate the style option value provided.
#
# Where:
#
# option   Should be the style option name to validate (like *-background*, *-borderwidth* or *-padding*).
#
# value    Should be the style value to validate related to the style option provided.
#
# Return the data if the 'option' and 'value' provided are validated, or the word 'invalid' if they are not.
proc ::ms::style::Check_Option { option value } {
    switch -- $option {
        -anchor {
            set value [string tolower $value]
            switch -- $value {
                center  -
                e       -
                n       -
                ne      -
                nw      -
                s       -
                se      -
                sw      -
                w       { return $value }
                default { return invalid }
            }
        }
        -arrowcolor               -
        -background               -
        -bordercolor              -
        -darkcolor                -
        -disabledforeground       -
        -fieldbackground          -
        -focuscolor               -
        -focusfill                -
        -foreground               -
        -highlightcolor           -
        -indicatorbackground      -
        -indicatorcolor           -
        -indicatorforeground      -
        -innercolor               -
        -insertbackground         -
        -insertcolor              -
        -lightcolor               -
        -linecolor                -
        -outercolor               -
        -placeholderforeground    -
        -preselectbackground      -
        -preselectforeground      -
        -troughcolor              -
        -selectbackground         -
        -selectforeground         -
        -shellbackground          -
        -stripedbackground        {
            set value [::ms::Check_Color $value invalid]
            switch -- $value {
                invalid { return invalid }
                default { return $value }
            }
        }
        -arrowpadding     -
        -expand           -
        -handlepad        -
        -indicatormargin  -
        -indicatormargins -
        -labelmargins     -
        -padding          -
        -postoffset       -
        -sashpad          -
        -tabmargins       {
            switch -- [llength $value] {
                1   {
                    set value [::ms::Check_Measure $value invalid]
                    switch -- $value {
                        invalid { return invalid }
                    }

                    return $value
                }
                2   {
                    set pad1 [::ms::Check_Measure [lindex $value 0] invalid]
                    switch -- $pad1 {
                        invalid { return invalid }
                    }

                    set pad2 [::ms::Check_Measure [lindex $value 1] invalid]
                    switch -- $pad2 {
                        invalid { return invalid }
                    }

                    return [list $pad1 $pad2]
                }
                3   {
                    set pad1 [::ms::Check_Measure [lindex $value 0] invalid]
                    switch -- $pad1 {
                        invalid { return invalid }
                    }

                    set pad2 [::ms::Check_Measure [lindex $value 1] invalid]
                    switch -- $pad2 {
                        invalid { return invalid }
                    }

                    set pad3 [::ms::Check_Measure [lindex $value 2] invalid]
                    switch -- $pad3 {
                        invalid { return invalid }
                    }

                    return [list $pad1 $pad2 $pad3]
                }
                4   {
                    set pad1 [::ms::Check_Measure [lindex $value 0] invalid]
                    switch -- $pad1 {
                        invalid { return invalid }
                    }

                    set pad2 [::ms::Check_Measure [lindex $value 1] invalid]
                    switch -- $pad2 {
                        invalid { return invalid }
                    }

                    set pad3 [::ms::Check_Measure [lindex $value 2] invalid]
                    switch -- $pad3 {
                        invalid { return invalid }
                    }

                    set pad4 [::ms::Check_Measure [lindex $value 3] invalid]
                    switch -- $pad4 {
                        invalid { return invalid }
                    }

                    return [list $pad1 $pad2 $pad3 $pad4]
                }
                default { return invalid }
            }
        }
        -arrowsize            -
        -barsize              -
        -borderwidth          -
        -columnseparatorwidth -
        -insertborderwidth    -
        -focussolid           -
        -focusthickness       -
        -focuswidth           -
        -gripcount            -
        -gripsize             -
        -groovewidth          -
        -handlesize           -
        -height               -
        -highlightthickness   -
        -indent               -
        -indicatorsize        -
        -insertwidth          -
        -rowheight            -
        -rowwidth             -
        -sashpad              -
        -sashthickness        -
        -selectborderwidth    -
        -sliderlength         -
        -sliderthickness      -
        -spacer               -
        -thickness            -
        -width                {
            set value [::ms::Check_Measure $value invalid]
            switch -- $value {
                invalid { return invalid }
                default { return $value }
            }
        }
        -charwidth {
            switch -- [string is integer -strict $value] {
                0   { return invalid }
                1   { return $value }
            }
        }
        -columns -
        -rows    {
            switch -- [string is integer -strict $value] {
                0   { return invalid }
                1   {
                    if { $value < 1 } {
                        return invalid
                    } else {
                        return $value
                    }
                }
            }
        }
        -compound {
            set value [string tolower $value]
            switch -- $value {
                bottom  -
                center  -
                image   -
                left    -
                none    -
                right   -
                text    -
                top     { return $value }
                default { return invalid }
            }
        }
        -cursor {
            set value [string tolower $value]
            if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                return $value
            } else {
                return invalid
            }
        }
        -embossed     -
        -labeloutside {
            switch -nocase -- $value {
                0        -
                no       -
                off      -
                false    -
                disabled { set value 0 }
                1        -
                yes      -
                on       -
                true     -
                enabled  { set value 1 }
                default  { return invalid }
            }

            return $value
        }
        -font {
            if { $value in [_font names] } {
                return $value
            } else {
                return invalid
            }
        }
        -image {
            switch -- [::ms::Check_Image $value] {
                invalid { return invalid }
                default { return $value }
            }
        }
        -inactiveselectbackground {
            switch -- $value {
                ""      {}
                default {
                    set value [::ms::Check_Color $value invalid]
                    switch -- $value {
                        invalid { return invalid }
                    }
                }
            }

            return $value
        }
        -insertofftime -
        -insertontime  {
            switch -- [string is integer -strict $value] {
                0   { return invalid }
                1   {
                    if { $value < 0 } {
                        return invalid
                    } else {
                        return $value
                    }
                }
            }
        }
        -justify {
            set value [string tolower $value]
            switch -- $value {
                center  -
                left    -
                right   { return $value }
                default { return invalid }
            }
        }
        -shiftrelief {
            switch -- [string is integer -strict $value] {
                0   { return invalid }
                1   { return $value }
            }
        }
        -indicatorrelief -
        -relief          -
        -pbarrelief      -
        -sashrelief      -
        -sliderrelief    -
        -thumbrelief     -
        -troughrelief    {
            set value [string tolower $value]
            switch -- $value {
                flat    -
                groove  -
                raised  -
                ridge   -
                solid   -
                sunken  { return $value }
                default { return invalid }
            }
        }
        -tabposition {
            set value [string tolower $value]
            switch -- $value {
                e       -
                en      -
                es      -
                n       -
                ne      -
                nw      -
                s       -
                se      -
                sw      -
                w       -
                wn      -
                ws      { return $value }
                default { return invalid }
            }
        }
        -wraplength {
            # Check the last digit of the measure provided.
            switch -- [string index $value end] {
                0   -
                1   -
                2   -
                3   -
                4   -
                5   -
                6   -
                7   -
                8   -
                9   {
                    if { [string is integer -strict $value] } {
                        return $value
                    } else {
                        return invalid
                    }
                }
                c   -
                i   -
                m   -
                p   {
                    # The measure have a valid unit, separate its value from its unit.
                    set value [string range $value 0 end-1]
                    set unit  [string index $value end]

                    switch -- $value {
                        0       { return 0 }
                        default {
                            if { [string is double -strict $value] } {
                                return [string cat $value $unit]
                            } else {
                                return invalid
                            }
                        }
                    }
                }
                default { return invalid }
            }
        }
        default { return invalid }
    }
}

#*EOF*