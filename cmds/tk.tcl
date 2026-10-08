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

### tk - Manipulate Tk internal state
#
## SYNOPSIS:
#
# **tk** **appname** ?*newName*?
# **tk** **busy** *window* ?*options*?
# **tk** **busy** **cget** *window* *option*
# **tk** **busy** **configure** *window* ?*-option* *value*? ... ?*-option* *value*?
# **tk** **busy** **current** ?*pattern*?
# **tk** **busy** **forget** *window* ?*window*? ... ?*window*?
# **tk** **busy** **hold** *window* ?*-option* *value*? ... ?*-option* *value*?
# **tk** **busy** **status** *window*
# **tk** **caret** *window* ?**-x** *x*? ?**-y** *y*? ?**-height** *height*?
# **tk** **fontchooser**
# **tk** **get** **addresstype** *window*
# **tk** **get** **short** *window*
# **tk** **get** **real** *window*
# **tk** **inactive** ?**-displayof** *window*? ?**reset**?
# **tk** **print** *window*
# **tk** **scaling** ?**-displayof** *window*? ?*number*?
# **tk** **sysnotify** *title* *message*
# **tk** **systray** **configure** ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
# **tk** **systray** **create** **-image** *image* ?**-text** *text*? ?**-button1** *callback*? ?**-button3** *callback*?
# **tk** **systray** **destroy**
# **tk** **systray** **exists**
# **tk** **useinputmethods** ?**-displayof** *window*? ?*boolean*?
# **tk** **windowingsystem**
#
# Note: Each *window* pathname involved may be provided either as a short or as a real address.
#
## DESCRIPTION:
#
# The **tk** command provides access to miscellaneous elements of Tk's internal state.
# Most of the information manipulated by this command pertains to the application as a whole, or to a screen or display,
# rather than to a particular window.
#
#### COMMAND:
#
# The *tk* command can have any of several forms, depending on the *action* argument.
# The *action* argument is the first argument after the command itself.
# The legal forms are:
#
#   **tk** **appname** ?*newName*?
#      If *newName* is not specified, this command returns the name of the application (the name that may be used in **send** commands
#      to communicate with the application).
#      If *newName* is specified, then the name of the application is changed to *newName*.
#      If the given name is already in use, then a suffix of the form ** #2** or ** #3** is appended in order to make the name unique.
#      The command's result is the name actually chosen.
#
#      *NewName* should not start with a capital letter.
#      This will interfere with option processing, since names starting with capitals are assumed to be classes;
#      as a result, Tk may not be able to find some options for the application.
#
#      If sends have been disabled by deleting the **send** command, this command will reenable them and recreate the **send** command.
#
#   **tk** **busy** *window* ?*-option* *value*? ... ?*-option* *value*?
#      Shortcut for **busy hold** command.
#
#   **tk** **busy** **busywindow** window
#      Returns the pathname of the busy window (i.e. the transparent window shielding the window appearing busy) created by
#      the **busy hold** command for *window*, or the empty string if *window* is not busy.
#
#   **tk** **busy** **cget** window option
#      Queries the **busy** command configuration options for *window*.
#      *Window* must be the pathname of a widget previously made busy by the **hold** operation.
#      *Option* may have any of the values accepted by the **hold** operation.
#
#      The command returns the current value of the specified *option*.
#
#   **tk** **busy** **configure** *window* ?*-option* *value*? ... ?*-option* *value*?
#      Queries or modifies the **busy** command configuration options for *window*.
#      *Window* must be the pathname of a widget previously made busy by the **hold** operation.
#      *Option* may have any of the values accepted by the **hold** operation.
#
#      If no *option*s are specified, a list describing all of the available options for *window* (see [Tk_ConfigureInfo](https://www.tcl-lang.org/man/tcl9.0/TkLib/ConfigWidg.html) for information
#      on the format of this list) is returned.
#
#      If *option* is specified with no value, then the command returns a list describing the one named option (this list will be
#      identical to the corresponding sublist of the value returned if no *option* is specified).
#
#      If one or more *option value* pairs are specified, then the command modifies the given widget option(s) to have the given value(s);
#      in this case the command returns the empty string.
#
#      Please note that the **option database** is referenced through window.
#      For example, if the widget *.frame* is to be made busy, the busy cursor can be specified for it by either **option** command:
#
#         option add *frame.busyCursor gumby
#         option add *Frame.BusyCursor gumby
#
#   **tk** **busy** **current** ?*pattern*?
#      Returns the pathnames of all widgets that are currently busy.
#      If a *pattern* is given, only the path names of busy widgets matching pattern are returned.
#
#   **tk** **busy** **forget** *window* ?*window*? ... ?*window*?
#      Releases resources allocated by the **busy** command for *window*, including the transparent window.
#      User events will again be received by *window*.
#      Resources are also released when *window* is destroyed.
#      *Window* must be the name of a widget specified in the **hold** operation, otherwise an error is reported.
#
#   **tk** **busy** **hold** *window* ?*-option* *value*? ... ?*-option* *value*?
#      Makes the specified *window* (and its descendants in the Tk window hierarchy) appear busy.
#      *Window* must be a valid pathname of a Tk widget.
#
#      A transparent window is put in front of the specified window. This transparent window is mapped the next time idle tasks are processed,
#      and the specified window and its descendants will be blocked from user interactions.
#      Normally, **update** should be called immediately afterward to insure that the **hold** operation is in effect before the application
#      starts its processing.
#
#      The following configuration options are valid:
#
#      **-cursor** *cursorName*
#          Specifies the cursor to be displayed when the widget is made busy.
#          *CursorName* can be in any form accepted by [Tk_GetCursor](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetCursor.html).
#
#          The default cursor is *wait* on **Windows** and *watch* on other platforms.
#
#      The command returns the pathname of the busy window that was created (i.e. the transparent window shielding the window appearing busy).
#
#   **tk** **busy** **status** *window*
#      Returns the status of a widget *window*.
#      If *window* presently can not receive user interactions, **1** is returned, otherwise **0**.
#
#   **tk** **caret** *window* ?**-x** *x*? ?**-y** *y*? ?**-height** *height*?
#      Sets and queries the *caret* location for the display of the specified Tk window *window*.
#
#      The *caret* is the per-display cursor location used for indicating global focus (e.g. to comply with **Microsoft Accessibility** guidelines),
#      as well as for location of the over-the-spot **XIM** (**X** Input Methods) or **Windows IME** windows.
#
#      If no *option*s are specified, the last values used for setting the caret are return in option-value pair format.
#      *-x* and *-y* represent window-relative coordinates, and *-height* is the height of the current cursor location,
#      or the height of the specified window if none is given.
#
#   **tk** **fontchooser**
#      This command is deprecated by mustang.
#      Please use **dialog font** instead.
#
#   **tk** **get** **addresstype** *window*
#      Returns the type of the *window* address provided (the word **real** or **short**) or the word **invalid** if the address provided is invalid.
#
#   **tk** **get** **real** *window*
#      Trasform the *window* address provided into a *real* address.
#      Return the real address associated to the *window* address provided or the word **invalid** if the address provided is invalid.
#
#   **tk** **get** **short** *window*
#      Trasform the *window* address provided into a *short* address.
#      Return the short address associated to the *window* address provided or the word **invalid** if the address provided is invalid.
#
#   **tk** **inactive** ?**-displayof** *window*? ?**reset**?
#      Returns a positive integer that indicates the number of milliseconds since the last time the user interacted with the system.
#      If the *-displayof* option is given then the return value refers to the display of *window*; otherwise it refers to the display
#      of the application's main window ('.').
#
#      If querying the user inactive time is not supported by the system, and in safe interpreters, **tk inactive** will return **-1**.
#
#      If the literal string *reset* is given as an additional argument, the timer is reset and an empty string is returned.
#      Resetting the inactivity time is forbidden in safe interpreters and will throw an error if tried.
#
#   **tk** **print**
#      This command is deprecated by mustang.
#      Please use **dialog print** instead.
#
#   **tk** **scaling** ?**-displayof** *window*? ?*number*?
#      Sets and queries the current scaling factor used by Tk to convert between physical units (for example, points, inches, or millimeters) and pixels.
#      The *number* argument is a floating point number that specifies the number of pixels per point on *window*'s display.
#      If the *window* argument is omitted, it defaults to the main window ('.').
#      If the *number* argument is omitted, the current value of the scaling factor is returned.
#
#      A *point* is a unit of measurement equal to 1/72 inch.
#      A scaling factor of **1.0** corresponds to **1** pixel per point, which is equivalent to a standard **72** dpi monitor.
#      A scaling factor of **1.25** would mean **1.25** pixels per point, which is the setting for a **90** dpi monitor;
#      setting the scaling factor to **1.25** on a **72** dpi monitor would cause everything in the application to be displayed **1.25** times
#      as large as normal.
#      The initial value for the scaling factor is set when the application starts, based on properties of the installed monitor,
#      but it can be changed at any time.
#      Measurements made after the scaling factor is changed will use the new scaling factor, but it is undefined whether existing
#      widgets will resize themselves dynamically to accommodate the new scaling factor.
#
#   **tk** **sysnotify** *title* *message*
#      The **tk sysnotify** command creates a platform-specific system notification alert.
#      Its intent is to provide a brief, unobtrusive notification to the user by popping up a window that briefly appears
#      in a corner of the screen.
#
#      Here is an example of the **tk sysnotify** code:
#
#          tk sysnotify "Alert" "This is just a test of the Tk System Notification Code."
#
#      The **macOS** and **Windows** versions are native implementations using system API's.
#      The **X11** version has a conditional dependency on libnotify, and falls back to a Tcl-only implementation if *libnotify* is not installed.
#      On each platform the notification includes a platform-specific default image to accompany the text.
#
#      **macOS**
#          The macOS version will request permission from the user to authorize notifications.
#          This must be activated in **Apple's System Preferences Notifications** section.
#          If deploying an application using the standalone version of **Wish.app**, setting the bundle *ID* in the applications
#          *Info.plist* file to begin with *com* seems necessary for notifications to work.
#          Using a different prefix for the bundle *ID*, such as something like *tk.tcl.tkchat*, will cause notifications to silently fail.
#
#      **Windows**
#          The image is taken from the system tray, i.e., sysnotify can only be called when a systray was installed.
#
#   **tk** **systray** **configure** ?option? ?value option value ...?
#      The **tk systray configure** command sets one or more options of the systray icon.
#      Configurable options are the same as for the **create** subcommand.
#      When a single *option* name is given, the command returns the current value of this option.
#      When no *option* is given this command returns the list of all options and their current value.
#
#      Note: The existing tray icon can be modified with different images and strings to indicate the app state.
#
#   **tk** **systray** **create** **-image** *image* ?**-text** *text*? ?**-button1** *callback*? ?**-button3** *callback*?
#      The **tk systray create** command creates an icon in the platform-specific tray.
#      The widget is configured with a Tk image for the icon display, an optional string for display in a tooltip,
#      and optional callbacks that are bound to **Button-1** and **Button-3** events.
#
#      Note: From a user-interface standpoint, only one icon per interpreter is supported.
#            Attempts to create additional icons will return an error.
#            Loading additional interpreters into a running instance of **Wish** will allow additional icons to be displayed.
#
#      Note: The **X11** implementation is supported on a *best efforts* basis because it is dependent on the window manager.
#            The *text* flag, which is implemented as a tooltip, does not always display if the **WM** does not support such features.
#            The systray *icon* itself may not even display with some window managers.
#
#      Note: On **Windows**, the Tk image provided in the **-image** option must be a photo image.
#            On other platforms either a bitmap image or a photo image may be provided.
#
#   **tk** **systray** **destroy**
#      The **tk systray destroy** command removes the icon from display and deallocates it.
#
#   **tk** **systray** **exists**
#      The **tk systray exists** command checks whether a systray icon was created.
#      It returns a boolean.
#
#   **tk** **useinputmethods** ?**-displayof** *window*? ?*boolean*?
#      Sets and queries the state of whether Tk should use **XIM** (**X** Input Methods) for filtering events.
#      The resulting state is returned.
#      **XIM** is used in some locales (i.e., Japanese, Korean), to handle special input devices.
#      This feature is only significant on **X**.
#      If **XIM** support is not available, this will always return **0**.
#      If the *window* argument is omitted, it defaults to the main window ('.').
#      If the *boolean* argument is omitted, the current state is returned.
#      This is turned on by default for the main display.
#
#   **tk** **windowingsystem**
#      Returns the current windowing system (**aqua**, **win32** or **x11**).
package provide ::ms::tk 0.1

# Create the mustang **tk** package.
namespace eval ::ms::tk {}

# Rename the original Tk **tk** command.
rename tk _tk

# Create an alias for the mustang **tk** command.
interp alias {} tk {} ::ms::tk::Command

# Get the windowingsystem in which mustang is currently running.
set ::ms::data(windowingsystem) [_tk windowingsystem]

## Command
#
# Replace the Tk **tk** command.
#
# Where:
#
# args   Should be the arguments of the **tk** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::tk::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **tk** **appname** ?*newName*?
    # **tk** **busy** *window* ?*-option* *value*? ... ?*-option* *value*?
    # **tk** **busy** **cget** *window* *option*
    # **tk** **busy** **configure** *window* ?*-option* *value*? ... ?*-option* *value*?
    # **tk** **busy** **current** ?*pattern*?
    # **tk** **busy** **forget** *window* ?*window*? ... ?*window*?
    # **tk** **busy** **hold** *window* ?*-option* *value*? ... ?*-option* *value*?
    # **tk** **busy** **status** *window*
    # **tk** **caret** *window* ?**-x** *x*? ?**-y** *y*? ?**-height** *height*?
    # **tk** **fontchooser**
    # **tk** **get** **addresstype** *window*
    # **tk** **get** **real** *window*
    # **tk** **get** **short** *window*
    # **tk** **inactive** ?**-displayof** *window*? ?**reset**?
    # **tk** **print**
    # **tk** **scaling** ?**-displayof** *window*? ?*number*?
    # **tk** **sysnotify** *title* *message*
    # **tk** **systray** **configure** ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
    # **tk** **systray** **create** **-image** *image* ?**-text** *text*? ?**-button1** *callback*? ?**-button3** *callback*?
    # **tk** **systray** **destroy**
    # **tk** **systray** **exists**
    # **tk** **useinputmethods** ?**-displayof** *window*? ?*boolean*?
    # **tk** **windowingsystem**

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        appname {
            # Synopsis:
            #
            # **tk** **appname**
            # **tk** **appname** *newName*
            switch -- [llength $args] {
                0   {
                    # Synopsis:
                    #
                    # **tk** **appname**

                    # Execute the command.
                    return [_tk appname]
                }
                1   {
                    # Synopsis:
                    #
                    # **tk** **appname** *newName*

                    # Execute the command.
                    try {
                        _tk appname $args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        windowingsystem {
            # Synopsis:
            #
            # **tk** **windowingsystem**
            switch -- [llength $args] {
                0       { return $::ms::data(windowingsystem) }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        busy {
            # Synopsis:
            #
            # **tk** **busy**               *window* ?*-option* *value*? ... ?*-option* *value*?
            # **tk** **busy** **cget**      *window* *option*
            # **tk** **busy** **configure** *window* ?*-option* *value*? ... ?*-option* *value*?
            # **tk** **busy** **current**   ?*pattern*?
            # **tk** **busy** **forget**    *window* ?*window*? ... ?*window*?
            # **tk** **busy** **hold**      *window* ?*-option* *value*? ... ?*-option* *value*?
            # **tk** **busy** **status**    *window*

            # Note: The 'tk busy' command does not currently have any effect on macOS when Tk is built using 'aqua' support.

            # Check the windowing system.
            switch -- $::ms::data(windowingsystem) {
                aqua { return "" }
            }

            # Separate the subcommand from the actual 'args'.
            set subcommand [lindex  $args 0]
            set args       [lremove $args 0]
            switch -- $subcommand {
                cget {
                    # Synopsis:
                    #
                    # **tk** **busy** **cget** *window* *option*
                    switch -- [llength $args] {
                        2   {
                            set window [lindex $args 0]
                            set option [lindex $args 1]

                            # Check if 'window' is a valid address or not.
                            set w [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }

                            # Execute the command.
                            try {
                                _tk busy cget $w $option
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                configure -
                hold      {
                    # Synopsis:
                    #
                    # **tk** **busy** **configure** *window*
                    # **tk** **busy** **configure** *window* ?*-option* *value*? ... ?*-option* *value*?
                    #
                    # **tk** **busy** **hold**      *window*
                    # **tk** **busy** **hold**      *window* ?*-option* *value*? ... ?*-option* *value*?
                    switch -- [llength $args] {
                        0   { ::ms::Error "Invalid number of arguments." $caller_info }
                        1   {
                            # Synopsis:
                            #
                            # **tk** **busy** **configure** *window*
                            # **tk** **busy** **hold**      *window*
                            set window $args

                            # Check if 'window' is a valid address or not.
                            set w [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }

                            return [_tk busy $subcommand $w]
                        }
                        default {
                            # Synopsis:
                            #
                            # **tk** **busy** **configure** *window* ?*-option* *value*? ... ?*-option* *value*?
                            # **tk** **busy** **hold**      *window* ?*-option* *value*? ... ?*-option* *value*?
                            set window [lindex  $args 0]
                            set args   [lremove $args 0]

                            # Check if 'window' is a valid address or not.
                            set w [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }

                            # Check that the command's 'args' forms a valid 'option/value' list.
                            switch -- [expr { [llength $args]%2 }] {
                                0   {
                                    # Execute the command.
                                    try {
                                        _tk busy $subcommand $w {*}$args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return $result
                                    }
                                }
                                default { ::ms::Error "Invalid number of arguments." $caller_info }
                            }
                        }
                    }
                }
                current {
                    # Synopsis:
                    #
                    # **tk** **busy** **current**
                    # **tk** **busy** **current** *pattern*
                    switch -- [llength $args] {
                        0   {
                            # Synopsis:
                            #
                            # **tk** **busy** **current**

                            # Execute the command.
                            return [_tk busy current]
                        }
                        1   {
                            # Synopsis:
                            #
                            # **tk** **busy** **current** *pattern*

                            # Execute the command.
                            try {
                                _tk busy current $args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                forget {
                    # Synopsis:
                    #
                    # **tk** **busy** **forget** *window*
                    # **tk** **busy** **forget** *window* ?*window*? ... ?*window*?
                    switch -- [llength $args] {
                        0   { ::ms::Error "Invalid number of arguments." $caller_info }
                    }

                    foreach window $args {
                        # Check if 'window' is a valid address or not.
                        set w [::ms::Check_Pathname $window invalid]
                        switch -- $w {
                            invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        }

                        # Execute the command.
                        try {
                            _tk busy forget $w
                        } on error { errortext errorcode } {
                            ::ms::Error "$errortext" $caller_info
                        }
                    }

                    return ""
                }
                status {
                    # Synopsis:
                    #
                    # **tk** **busy** **status** *window*
                    switch -- [llength $args] {
                        1   {
                            set window $args

                            # Check if 'window' is a valid address or not.
                            set w [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }

                            # Execute the command.
                            try {
                                _tk busy status $addr
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                default {
                    # Synopsis:
                    #
                    # **tk** **busy** *window*
                    # **tk** **busy** *window* *-option* *value* ?*-option* *value*? ... ?*-option* *value*?
                    switch -- [llength $args] {
                        0   { ::ms::Error "Invalid number of arguments." $caller_info }
                        1   {
                            # Synopsis:
                            #
                            # **tk** **busy** *window*
                            set window $subcommand

                            # Check if 'window' is a valid address or not.
                            set w [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }

                            return [_tk busy $w]
                        }
                        default {
                            # Synopsis:
                            #
                            # **tk** **busy** *window* *-option* *value* ?*-option* *value*? ... ?*-option* *value*?
                            set window $subcommand

                            # Check if 'window' is a valid address or not.
                            set w [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }

                            # Check that the command's 'args' forms a valid 'option/value' list.
                            switch -- [expr { [llength $args]%2 }] {
                                0   {
                                    # Execute the command.
                                    try {
                                        _tk busy $w {*}$args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return $result
                                    }
                                }
                                default { ::ms::Error "Invalid number of arguments." $caller_info }
                            }
                        }
                    }
                }
            }
        }
        caret {
            # Synopsis:
            #
            # **tk** **caret** *window*
            #
            # **tk** **caret** *window* **-x** *x*
            # **tk** **caret** *window* **-y** *y*
            # **tk** **caret** *window* **-height** *height*
            #
            # **tk** **caret** *window* **-x** *x* **-y** *y*
            # **tk** **caret** *window* **-x** *x* **-height** *height*
            # **tk** **caret** *window* **-y** *y* **-height** *height*
            #
            # **tk** **caret** *window* **-x** *x* **-y** *y* **-height** *height*
            switch -- [llength $args] {
                1   {
                    # Synopsis:
                    #
                    # **tk** **caret** *window*
                    set window $args
                }
                3   -
                5   -
                7   {
                    # Synopsis:
                    #
                    # **tk** **caret** *window* **-x** *x*
                    # **tk** **caret** *window* **-y** *y*
                    # **tk** **caret** *window* **-height** *height*
                    #
                    # **tk** **caret** *window* **-x** *x* **-y** *y*
                    # **tk** **caret** *window* **-x** *x* **-height** *height*
                    # **tk** **caret** *window* **-y** *y* **-height** *height*
                    #
                    # **tk** **caret** *window* **-x** *x* **-y** *y* **-height** *height*
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check if 'window' is a valid address or not.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Check that the command's 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Execute the command.
                            try {
                                _tk caret $w {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        inactive        -
        scaling         -
        useinputmethods {
            # Synopsis:
            #
            # **tk** **inactive**
            # **tk** **scaling**
            # **tk** **useinputmethods**
            #
            # **tk** **inactive**        **reset**
            # **tk** **scaling**         *number*
            # **tk** **useinputmethods** *boolean*
            #
            # **tk** **inactive**        **-displayof** *window*
            # **tk** **scaling**         **-displayof** *window*
            # **tk** **useinputmethods** **-displayof** *window*
            #
            # **tk** **inactive**        **-displayof** *window* **reset**
            # **tk** **scaling**         **-displayof** *window* *number*
            # **tk** **useinputmethods** **-displayof** *window* *boolean*
            switch -- [llength $args] {
                0   {
                    # Synopsis:
                    #
                    # **tk** **inactive**
                    # **tk** **scaling**
                    # **tk** **useinputmethods**

                    return [_tk $action]
                }
                1   {
                    # Synopsis:
                    #
                    # **tk** **inactive**        **reset**
                    # **tk** **scaling**         *number*
                    # **tk** **useinputmethods** *boolean*

                    # Execute the command.
                    try {
                        _tk $action $args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                2   {
                    # Synopsis:
                    #
                    # **tk** **inactive**        **-displayof** *window*
                    # **tk** **scaling**         **-displayof** *window*
                    # **tk** **useinputmethods** **-displayof** *window*

                    # Check that a '-displayof' option was provided.
                    set option [lindex $args 0]
                    switch -- $option {
                        -displayof {
                            # Check if the '-displayof' address provided is a valid address or not.
                            set window [lindex $args 1]
                            set w    [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }
                        }
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _tk $action -displayof $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                3   {
                    # Synopsis:
                    #
                    # **tk** **inactive**        **-displayof** *window* **reset**
                    # **tk** **scaling**         **-displayof** *window* *number*
                    # **tk** **useinputmethods** **-displayof** *window* *boolean*

                    # Check if a '-displayof' option was provided.
                    set index [lsearch -exact $args "-displayof"]
                    switch -- $index {
                        -1      { ::ms::Error "Invalid option, '$args'." $caller_info }
                        default {
                            # Check if the '-displayof' address provided is a short or real address.
                            set window [lindex $args $index+1]
                            set w    [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                default { set args [lreplace $args $index+1 $index+1 $w] }
                            }
                        }
                    }

                    # Execute the command.
                    try {
                        _tk $action {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        fontchooser {
            # Synopsis:
            #
            # **tk** **fontchooser**
            chan puts stdout "The 'tk fontchooser' command has been deprecated by Mustang."
            chan puts stdout "Please use 'dialog font' instead."
            chan puts stdout ""
            chan puts stdout "Additional infos:"
            chan puts stdout ""
            chan puts stdout "$caller_info"
            chan puts stdout ""

            return ""
        }
        get {
            # Synopsis:
            #
            # **tk** **get** **addresstype** *window*
            # **tk** **get** **real**        *window*
            # **tk** **get** **short**       *window*
            switch -- [llength $args] {
                2   {
                    set subcommand [lindex $args 0]
                    set window     [lindex $args 1]

                    # Check the 'subcommand'.
                    switch -- $subcommand {
                        addresstype {
                            # Synopsis:
                            #
                            # **tk** **get** **addresstype** *window*

                            # Check if 'window' is a short address.
                            if { $window in $::ms::addr(shorts) } {
                                return "short"
                            } else {
                                # Check if 'window' exists.
                                switch -- [_winfo exists $window] {
                                    0   { return "invalid" }
                                    1   { return "real" }
                                }
                            }
                        }
                        real {
                            # Synopsis:
                            #
                            # **tk** **get** **real** *window*

                            # Check if 'window' is a short address.
                            if { $window in $::ms::addr(shorts) } {
                                return $::ms::addr($window,real)
                            } else {
                                # Check if 'window' exists.
                                switch -- [_winfo exists $window] {
                                    0   { return "invalid" }
                                    1   { return $window }
                                }
                            }
                        }
                        short {
                            # Synopsis:
                            #
                            # **tk** **get** **short** *window*

                            # Check if exists a short address related to 'window'.
                            switch -- [info exists ::ms::addr($window,short)] {
                                0   {
                                    # Check if 'window' exists.
                                    switch -- [_winfo exists $window] {
                                        0   { return "invalid" }
                                        1   { return $window }
                                    }
                                }
                                1   { return $::ms::addr($window,short) }
                            }
                        }
                        default { ::ms::Error "Invalid option, '$subcommand'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        print {
            # Synopsis:
            #
            # **tk** **print**
            chan puts stdout "The 'tk print' command has been deprecated by Mustang."
            chan puts stdout "Please use 'dialog print' instead."
            chan puts stdout ""
            chan puts stdout "Additional infos:"
            chan puts stdout ""
            chan puts stdout "$caller_info"
            chan puts stdout ""

            return ""
        }
        sysnotify {
            # Synopsis:
            #
            # **tk** **sysnotify** *title* *message*
            switch -- [llength $args] {
                2   {
                    # Execute the command.
                    try {
                        _tk sysnotify {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        systray {
            # Synopsis:
            #
            # **tk** **systray** **configure** ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
            # **tk** **systray** **create** **-image** *image* ?**-text** *text*? ?**-button1** *callback*? ?**-button3** *callback*?
            # **tk** **systray** **destroy**
            # **tk** **systray** **exists**

            # Separate the 'subcommand' from the actual 'args'.
            set subcommand [lindex  $args 0]
            set args       [lremove $args 0]
            switch -- $subcommand {
                configure {
                    # Synopsis:
                    #
                    # **tk** **systray** **configure** *-option*
                    # **tk** **systray** **configure** *-option* *value*
                    # **tk** **systray** **configure** *-option* *value* ?*-option* *value*? ... ?*-option* *value*?
                    switch -- [llength $args] {
                        0   {
                            # Synopsis:
                            #
                            # **tk** **systray** **configure**

                            # Execute the command.
                            return [_tk systray configure]
                        }
                        1   {
                            # Synopsis:
                            #
                            # **tk** **systray** **configure** *-option*

                            # Execute the command.
                            try {
                                _tk systray configure $args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default {
                            # Synopsis:
                            #
                            # **tk** **systray** **configure** *-option* *value* ?*-option* *value*? ... ?*-option* *value*?

                            # Check that the command's 'args' forms a valid 'option/value' list.
                            switch -- [expr { [llength $args]%2 }] {
                                0   {
                                    # Execute the command.
                                    try {
                                        _tk systray configure {*}$args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return $result
                                    }
                                }
                                default { ::ms::Error "Invalid number of arguments." $caller_info }
                            }
                        }
                    }
                }
                create {
                    # Synopsis:
                    #
                    # **tk** **systray** **create** **-image** *image*
                    #
                    # **tk** **systray** **create** **-image** *image* ?**-text** *text*?
                    # **tk** **systray** **create** **-image** *image* ?**-button1** *callback*?
                    # **tk** **systray** **create** **-image** *image* ?**-button3** *callback*?
                    #
                    # **tk** **systray** **create** **-image** *image* ?**-text** *text*? ?**-button1** *callback*?
                    # **tk** **systray** **create** **-image** *image* ?**-text** *text*? ?**-button3** *callback*?
                    # **tk** **systray** **create** **-image** *image* ?**-button1** *callback*? ?**-button3** *callback*?
                    #
                    # **tk** **systray** **create** **-image** *image* ?**-text** *text*? ?**-button1** *callback*? ?**-button3** *callback*?

                    # Check that the command's 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Execute the command.
                            try {
                                _tk systray create {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                destroy {
                    # Synopsis:
                    #
                    # **tk** **systray** **destroy**
                    switch -- [llength $args] {
                        0   {
                            _tk systray destroy

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                exists {
                    # Synopsis:
                    #
                    # **tk** **systray** **exists**
                    switch -- [llength $args] {
                        0       { return [_tk systray exists] }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid option, '$subcommand'." $caller_info }
            }
        }
        default { ::ms::Error "Invalid action, '$action'." $caller_info }
    }
}

#*EOF*