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

## focus
#
#### SYNOPSIS:
#
# **focus**
# **focus** **-displayof** *window*
# **focus** **-force** *window*
# **focus** **-lastfor** *window*
# **focus** **-next** *window*
# **focus** **-prev** *window*
# **focus** *window*
#
#### DESCRIPTION:
#
# The focus command is used to manage the mustang input focus.
# At any given time, one window on each display is designated as the focus window; any key press or key release events
# for the display are sent to that window.
#
# It is normally up to the window manager to redirect the focus among the toplevel windows of a display.
# For example, some window managers automatically set the input focus to a toplevel window whenever the mouse enters it;
# others redirect the input focus only when the user clicks on a window.
#
# Usually the window manager will set the focus only to toplevel windows, leaving it up to the application to
# redirect the focus among the children of the toplevel.
#
# Mustang remembers one focus window for each toplevel (the most recent descendant of that toplevel to receive the focus);
# when the window manager gives the focus to a toplevel, mustang automatically redirects it to the remembered window.
# The developer can change the focus model through the **::ms::focusmodel** variable (allowed values are *explicit* or *implicit*).
# The default focus model is **explicit**.
# In an **explicit** focus model the focus changes only when a widget decides explicitly to claim the focus (e.g., because
# of a button click), or when the user types a key such as **Tab** or **Shift-Tab** that moves the focus.
# In an **implicit** focus model instead, the focus changes everytime the mouse enters a focussable widget.
#
# The **focus -next** and **focus -prev** commands implement a focus order among the windows of a toplevel;
# they are used in the default bindings for **Tab** and **Shift-Tab**, among other things.
#
# The *focus* command can have any of several forms, depending on the *action* argument.
# The *action* argument is always the first argument after the command itself.
#
# Note: Each *window* pathname involved may be provided either as a short or as a real address.
#       *Action*s that gives as a result a window pathname, will always return the address as a real address.
#       You can always convert a real address into a short address through the **tk get short** command.
#
# The legal forms are:
#
#   **focus** ?**short**?
#      Returns the pathname of the focus window on the display containing the application's main window,
#      or an empty string if no window in this application has the focus on that display.
#
#      Note: It is better to specify the display explicitly using **-displayof** (see below) so that the code will work
#            in applications using multiple displays.
#
#      If the *short* option is provided the address returned will be a short address, otherwise it will be a real address.
#
#   **focus** *window*
#      If the application currently has the input focus on *window*'s display, this command resets the input focus for *window*'s display
#      to *window* and returns an empty string.
#      If the application does not currently have the input focus on *window*'s display, *window* will be remembered as the focus for its
#      toplevel; the next time the focus arrives at the toplevel, mustang will redirect it to *window*.
#      If *window* is an empty string then the command does nothing. Returns an empty string.
#
#   **focus** ?**short**? **-displayof** *window*
#      Returns the pathname of the focus window on the display containing *window*.
#      If the focus window for *window*'s display is not in this application, the return value is an empty string.
#
#      If the *short* option is provided the address returned will be a short address, otherwise it will be a real address.
#      If provided, the *short* option must be located just after the *focus* command.
#
#   **focus** **-force** *window*
#      Sets the focus of *window*'s display to *window*, even if the application does not currently have the input focus for the display.
#      This command should be used sparingly, if at all. In normal usage, an application should not claim the focus for itself;
#      instead, it should wait for the window manager to give it the focus.
#      If *window* is an empty string then the command does nothing. Returns an empty string.
#
#   **focus** ?**short**? **-lastfor** *window*
#      Returns the pathname of the most recent window to have the input focus among all the windows in the same toplevel as *window*.
#      If no window in that toplevel has ever had the input focus, or if the most recent focus window has been deleted,
#      then the pathname of the toplevel is returned.
#      The return value is the window that will receive the input focus the next time the window manager gives the focus to the toplevel.
#
#      If the *short* option is provided the address returned will be a short address, otherwise it will be a real address.
#      If provided, the *short* option must be located just after the *focus* command.
#
#   **focus** **next** ?**-displayof** *window*?
#      This command is used for keyboard traversal. It focus the *next* window after the one currently focussed on the same screen as *window*
#      in focus order.
#
#      The focus order is determined by the stacking order of windows and the structure of the *window* hierarchy.
#      Among siblings, the focus order is the same as the stacking order, with the lowest window being first.
#      If a window has children, the window is visited first, followed by its children (recursively), followed by its next sibling.
#
#      Note that toplevel windows other than the *window* toplevel are skipped, so that **focus next** never returns a window in a different
#      toplevel from *window*.
#
#      If the **-displayof** option is not provided, the command will focus the next window after the one currently focussed on the same
#      screen as the main application ('.').
#
#   **focus** **prev** ?**-displayof** *window*?
#      **focus prev** is similar to **focus next** except that it focus the pathname of the window just before the one currently focussed
#      on the same screen as *window*.
#
#      If the **-displayof** option is not provided, the command will focus the previous window after the one currently focussed on the same
#      screen as the main application ('.').
#
#### QUIRKS:
#
# When an internal window receives the input focus, mustang does not actually set the X focus to that window; as far as X is concerned,
# the focus will stay on the toplevel window containing the window with the focus. However, mustang generates **FocusIn** and **FocusOut**
# events just as if the X focus were on the internal window.
#
# This approach gets around a number of problems that would occur if the X focus were actually moved; the fact that the X focus is on the
# toplevel is invisible unless you use C code to query the X server directly.
package provide ::ms::focus 0.1

# Create the mustang **focus** package.
namespace eval ::ms::focus {}

# Rename the original Tk **focus** command.
rename focus _focus

# Create an alias for the mustang **focus** command.
interp alias {} focus {} ::ms::focus::Command

## Command
#
# Replace the Tk **focus** command.
#
# Where:
#
# args   Should be the arguments of the **focus** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::focus::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **focus** ?**short**?
    # **focus** *window*
    # **focus** ?**short**? **-displayof** *window*
    # **focus** **-force** *window*
    # **focus** ?**short**? **-lastfor** *window*
    # **focus** **next** ?**-displayof** *window*?
    # **focus** **prev** ?**-displayof** *window*?
    switch -- [llength $args] {
        0   {
            # Synopsis:
            #
            # **focus**

            # Execute the command.
            return [_focus]
        }
        1   {
            # Synopsis:
            #
            # **focus** **short**
            # **focus** **next**
            # **focus** **prev**
            # **focus** *window*
            switch -- $args {
                short {
                    # Get the current real address in focus
                    set w [_focus]

                    # Check if exists a short address for 'w'.
                    switch -- [info exists ::ms::addr($w,short)] {
                        0   { return $w }
                        1   { return $::ms::addr($w,short) }
                    }
                }
                next {
                    # Synopsis:
                    #
                    # **focus** **next**

                    # Get the current widget in focus in the same display as '.'.
                    set current [_focus -displayof .]
                    switch -- $current {
                        ""  {
                            # There are no widget in focus in the same display as '.'.
                            # Do nothing.
                        }
                        default {
                            # Get the next address relative to 'current'.
                            set w [::tk_focusNext $current]

                            # Focus the next address relative to 'current'.
                            _focus $::ms::addr($w,widget)
                        }
                    }

                    return ""
                }
                prev {
                    # Synopsis:
                    #
                    # **focus** **prev**

                    # Get the current widget in focus in the same display as '.'.
                    set current [_focus -displayof .]
                    switch -- $current {
                        ""  {
                            # There are no widget in focus in the same display as '.'.
                            # Do nothing.
                        }
                        default {
                            # Get the previous address relative to 'current'.
                            set w [::tk_focusPrev $current]

                            # Focus the previous address relative to 'current'.
                            _focus $::ms::addr($w,widget)
                        }
                    }

                    return ""
                }
                default {
                    # Synopsis:
                    #
                    # **focus** *window*
                    set window $args

                    # Check if 'window' is a valid address or not.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Check the widget's focussability.
                    switch -- [::ms::Check_Focussability $w] {
                        1   {
                            # Check if exists '::ms::addr($w,widget)'.
                            switch -- [info exists ::ms::addr($w,widget)] {
                                0   { _focus $w }
                                1   { _focus $::ms::addr($w,widget) }
                            }
                        }
                    }

                    return ""
                }
            }
        }
        2   {
            # Synopsis:
            #
            # **focus** **-displayof** *window*
            # **focus** **-force** *window*
            # **focus** **-lastfor** *window*
            set action [lindex $args 0]
            set window [lindex $args 1]

            # Check the 'action' value.
            switch -- $action {
                -displayof -
                -lastfor   {
                    # Synopsis:
                    #
                    # **focus** **-displayof** *window*
                    # **focus** **-lastfor** *window*

                    # Check if 'window' is a valid address or not.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    return [_focus $action $w]
                }
                -force {
                    # Synopsis:
                    #
                    # **focus** **-force** *window*

                    # Check the widget's focussability.
                    switch -- [::ms::Check_Focussability $w] {
                        1   {
                            # Check if exists '::ms::addr($w,widget)'.
                            switch -- [info exists ::ms::addr($w,widget)] {
                                0   { _focus -force $w }
                                1   { _focus -force $::ms::addr($w,widget) }
                            }
                        }
                    }

                    return ""
                }
                default { ::ms::Error "Invalid action, '$action'." $caller_info }
            }
        }
        3   {
            # Synopsis:
            #
            # **focus** **short** **-displayof** *window*
            # **focus** **short** **-lastfor** *window*
            # **focus** **next**  **-displayof** *window*
            # **focus** **prev**  **-displayof** *window*
            set action [lindex  $args 0]
            set args   [lremove $args 0]

            # Check the 'action' value.
            switch -- $action {
                short {
                    # Synopsis:
                    #
                    # **focus** **short** **-displayof** *window*
                    # **focus** **short** **-lastfor** *window*
                    set option [lindex $args 0]

                    # Check if a '-displayof' or '-lastfor' option was provided.
                    switch -- $option {
                        -displayof -
                        -lastfor   {
                            set window [lindex $args 1]

                            # Check if 'window' is a valid address or not.
                            set w [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }

                            set addr [_focus $option $w]

                            # Check if exists a short address for 'addr'.
                            switch -- [info exists ::ms::addr($addr,short)] {
                                0   { return $addr }
                                1   { return $::ms::addr($addr,short) }
                            }
                        }
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }
                }
                next {
                    # Synopsis:
                    #
                    # **focus** **next** **-displayof** *window*
                    set option [lindex $args 0]

                    # Check if a '-displayof' option was provided.
                    switch -- $option {
                        -displayof {
                            set addr [lindex $args 1]

                            # Check if 'addr' is a valid address or not.
                            set w [::ms::Check_Pathname $addr invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                            }

                            # Get the current widget in focus in the same display as 'w'.
                            set current [_focus -displayof $w]
                            switch -- $current {
                                ""  {
                                    # There are no widget in focus in the same display as 'w'.
                                    # Do nothing.
                                }
                                default {
                                    # Get the next address relative to 'current'.
                                    set addr [::tk_focusNext $current]

                                    # Focus the next address relative to 'current'.
                                    _focus $::ms::addr($addr,widget)
                                }
                            }

                            return ""
                        }
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }
                }
                prev {
                    # Synopsis:
                    #
                    # **focus** **prev** **-displayof** *window*
                    set option [lindex $args 0]

                    # Check if a '-displayof' option was provided.
                    switch -- $option {
                        -displayof {
                            set addr [lindex $args 1]

                            # Check if 'addr' is a valid address or not.
                            set w [::ms::Check_Pathname $addr invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                            }

                            # Get the current widget in focus in the same display as 'w'.
                            set current [_focus -displayof $w]
                            switch -- $current {
                                ""  {
                                    # There are no widget in focus in the same display as 'w'.
                                    # Do nothing.
                                }
                                default {
                                    # Get the previous address relative to 'current'.
                                    set addr [::tk_focusPrev $current]

                                    # Focus the previous address relative to 'current'.
                                    _focus $::ms::addr($addr,widget)
                                }
                            }

                            return ""
                        }
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid action, '$action'." $caller_info }
            }
        }
        default { ::ms::Error "Invalid number of arguments." $caller_info }
    }

    return ""
}


## Check_Focussability
#
# Check the focussability of the address provided.
#
# Where:
#
# w   Should be the widget real address involved.
#
# Return a boolean value ('0' or '1') indicating if the address provided is focussable ('1') or not ('0').
proc ::ms::Check_Focussability { w } {
    # Check the widget's physical state.
    try {
        $w cget -state
    } on error {} {
        # Check if the variable '::ms::current($w,state)' exists.
        switch -- [info exists ::ms::current($w,state)] {
            1   {
                # Check if the current state is disabled.
                switch -- $::ms::current($w,state) {
                    disabled { return 0 }
                }
            }
        }
    } on ok { state } {
        # Check if the current state is disabled.
        switch -- $state {
            disabled { return 0 }
        }
    }

    # Check the widget's takefocus option.
    try {
        $w cget -takefocus
    } on error {} {
        # Check if the variable '::ms::current($w,takefocus)' exists.
        switch -- [info exists ::ms::current($w,takefocus)] {
            1   {
                # Check if the widget allow the focus.
                switch -- $::ms::current($w,takefocus) {
                    0   { return 0 }
                }
            }
        }
    } on ok { takefocus } {
        # Check if the widget allow the focus.
        switch -- $takefocus {
            0   { return 0 }
        }
    }

    # Check if 'w' is viewable.
    return [_winfo viewable $w]
}

###########################
##                       ##
##     TK PROCEDURES     ##
##                       ##
###########################

# Note: The following procedure were inspired by their Tk equivalent.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## Implicit (from the Tk 'focus.tcl' file, '::tk_focusFollowsMouse')
#
# Enforce the **implicit** focus model.
#
# Where:
#
# w        Should be the widget real address involved.
#
# detail   The *detail* field from the event.
#          For **FocusIn** and **FocusOut** events, the string can be one of the following:
#
#             NotifyAncestor
#             NotifyNonlinearVirtual
#             NotifyDetailNone
#             NotifyPointer
#             NotifyInferior
#             NotifyPointerRoot
#             NotifyNonlinear
#             NotifyVirtual
#
# It doesn't return anything.
proc ::ms::focus::Implicit { w detail } {
    switch -- $detail {
        NotifyAncestor  -
        NotifyNonlinear -
        NotifyInferior  {
            # Check the widget's focussability.
            switch -- [::ms::Check_Focussability $w] {
                1   {
                    # Check if exists '::ms::addr($w,widget)'.
                    switch -- [info exists ::ms::addr($w,widget)] {
                        0   { _focus -force $w }
                        1   { _focus -force $::ms::addr($w,widget) }
                    }
                }
            }
        }
    }

    return ""
}

## tk_focusNext (from the Tk 'focus.tcl' file)
#
# This procedure returns the name of the next window after 'w' in 'focus order'
# (the window that should receive the focus next if Tab is typed in w).
# 'Next' is defined by a pre-order search of a top-level and its non-top-level
# descendants, with the stacking order determining the order of siblings.
# The **-takefocus** options on windows determine whether or not they should be skipped.
#
# Where:
#
# w   Should be the widget short or real address involved.
#
# Return the real address of the 'next' window after 'w' that can take the keyboard focus.
proc ::tk_focusNext { w } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check if 'w' is a valid address or not.
    set addr [::ms::Check_Pathname $w invalid]
    switch -- $addr {
        invalid { ::ms::Error "Invalid address, '$w'." $caller_info }
        default { set w $addr }
    }

    # Check if the widget is a megawidget or not.
    if { $w in $::ms::addr(megawidgets) } {
        # Check if its a checkbutton, palette or radiobutton.
        switch -- $::ms::data($w,classtype) {
            checkbutton -
            palette     -
            radiobutton {
                # Collect information about the current window's position among its siblings.
                set parent   [_winfo parent $w]
                set children [_winfo children $parent]
                set index    [lsearch -exact $children $w]

                # Substitute 'w' with the next widget in its parent children list or
                # the widget's parent if there are no more child after 'w' in the children list.
                set last_index [expr { [llength $children]-1 }]
                if { $index < $last_index } {
                    set w [lindex $children $index+1]
                } else {
                    set w $parent
                }
            }
        }
    }

    set current $w
    while { 1 } {
        # Descend to just before the first child of the currentrent widget.
        set parent   $current
        set children [_winfo children $current]

        set i -1

        # Look for the next sibling that isn't a top-level.
        while { 1 } {
            incr i
            if { $i < [llength $children] } {
                set current [lindex $children $i]

                if { [_winfo toplevel $current] eq $current } {
                    continue
                } else {
                    break
                }
            }

            # No more siblings, so go to the currentrent widget's parent.
            # If it's a top-level, break out of the loop, otherwise
            # look for its next sibling.

            set current $parent

            if { [_winfo toplevel $current] eq $current } {
                break
            }
            set parent   [_winfo parent $parent]
            set children [_winfo children $parent]

            set i [lsearch -exact $children $current]
        }

        # Check if 'current' is equal to the initial address 'w'.
        if { $w eq $current } {
            return $current
        }

        # Check the widget's focussability.
        switch -- [::ms::Check_Focussability $current] {
            1   {
                # Check if exists '::ms::addr($w,widget)'.
                switch -- [info exists ::ms::addr($w,widget)] {
                    1   { return $current }
                }
            }
        }
    }
}

## tk_focusPrev (from the Tk 'focus.tcl' file)
#
# This procedure returns the name of the previous window before 'w' in 'focus order'
# (the window that should receive the focus next if Shift-Tab is typed in w).
# 'Previous' is defined by a pre-order search of a top-level and its non-top-level
# descendants, with the stacking order determining the order of siblings.
# The **-takefocus** options on windows determine whether or not they should be skipped.
#
# Where:
#
# w   Should be the widget short or real address involved.
#
# Return the the real address of the 'previous' window after 'w' that can take the keyboard focus.
proc ::tk_focusPrev { w } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Get the 'w' real address.
    set addr [::ms::Check_Pathname $w invalid]
    switch -- $addr {
        invalid { ::ms::Error "Invalid address, '$w'." $caller_info }
        default { set current $addr }
    }

    while { 1 } {
        # Collect information about the currentrent window's position
        # among its siblings.  Also, if the window is a top-level,
        # then reposition to just after the last child of the window.

        if { [_winfo toplevel $current] eq $current }  {
            set parent   $current
            set children [_winfo children $current]

            set i [llength $children]
        } else {
            set parent   [_winfo parent $current]
            set children [_winfo children $parent]

            set i [lsearch -exact $children $current]
        }

        # Go to the previous sibling, then descend to its last descendant
        # (highest in stacking order.  While doing this, ignore top-levels
        # and their descendants.  When we run out of descendants, go up
        # one level to the parent.

        while { $i > 0 } {
            incr i -1
            set current [lindex $children $i]
            if { [_winfo toplevel $current] eq $current } {
                continue
            }
            set parent   $current
            set children [_winfo children $parent]

            set i [llength $children]
        }

        set current $parent

        # Check if 'current' is equal to the initial address 'w'.
        if { $w eq $current } {
            return $current
        }

        # Check the widget's focussability.
        switch -- [::ms::Check_Focussability $current] {
            1   {
                # Check if exists '::ms::addr($w,widget)'.
                switch -- [info exists ::ms::addr($w,widget)] {
                    1   { return $current }
                }
            }
        }
    }
}

############################
##                        ##
##     TTK PROCEDURES     ##
##                        ##
############################

# Note: The following procedure is inspired by its ttk equivalent.
#       The procedure have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## clickToFocus (from the ttk 'utils.tcl' file)
#
# Utility routine, used in **Button-1** bindings.
# Assign keyboard focus to the specified widget if **-takefocus** is enabled.
#
# Where:
#
# w   Should be the widget short or real address involved.
#
# It doesn't return anything.
proc ::ttk::clickToFocus { w } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Get the 'w' real address.
    set w [::ms::Check_Pathname $w invalid]
    switch -- $result {
        invalid { ::ms::Error "Invalid address, '$w'." $caller_info }
    }

    # Check the widget's focussability.
    switch -- [::ms::Check_Focussability $w] {
        1   {
            # Check if exists '::ms::addr($w,widget)'.
            switch -- [info exists ::ms::addr($w,widget)] {
                0   { _focus $w }
                1   { _focus $::ms::addr($w,widget) }
            }
        }
    }

    return ""
}

#*EOF*