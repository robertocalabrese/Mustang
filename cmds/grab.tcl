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

## grab - Confine pointer and keyboard events to a window sub-tree
#
#### SYNOPSIS:
#
# **grab** ?*-global*? *window*
# **grab** **current** *window*
# **grab** **release** *window*
# **grab** **set** ?*-global*? *window*
# **grab** **status** *window*
#
#### DESCRIPTION:
#
# This command implements simple pointer and keyboard grabs for Tk.
# Tk's grabs are different than the grabs described in the **Xlib** documentation.
# When a grab is set for a particular window, Tk restricts all pointer events to the grab window and its descendants in Tk's window hierarchy.
# Whenever the pointer is within the grab window's subtree, the pointer will behave exactly the same as if there had been no grab at all
# and all events will be reported in the normal fashion.
# When the pointer is outside window's tree, button presses and releases and mouse motion events are reported to window,
# and window entry and window exit events are ignored.
# The grab subtree **owns** the pointer: windows outside the grab subtree will be visible on the screen but they will be insensitive
# until the grab is released.
# The tree of windows underneath the grab window can include top-level windows, in which case all of those top-level windows
# and their descendants will continue to receive mouse events during the grab.
#
# Two forms of grabs are possible: **local** and **global**.
# A *local* grab affects only the grabbing application: events will be reported to other applications as if the grab had never occurred.
# Grabs are local by default.
# A *global* grab locks out all applications on the screen, so that only the given subtree of the grabbing application will be
# sensitive to pointer events (mouse button presses, mouse button releases, pointer motions, window entries, and window exits).
# During global grabs the window manager will not receive pointer events either.
#
# During local grabs, keyboard events (key presses and key releases) are delivered as usual: the window manager controls which application
# receives keyboard events, and if they are sent to any window in the grabbing application then they are redirected to the focus window.
# During a global grab Tk grabs the keyboard so that all keyboard events are always sent to the grabbing application.
# The focus command is still used to determine which window in the application receives the keyboard events.
# The keyboard grab is released when the grab is released.
#
# On macOS a global grab affects all windows created by one Tk process.
# No window in that process other than the grab window can even be focused, hence no other window receives key or mouse events.
# A local grab on macOS affects all windows created by one Tcl interpreter.
# It is possible to focus any window belonging to the Tk process during a local grab but the grab window is the only window created
# by its interpreter which receives key or mouse events.
# Windows belonging to the same process but created by different interpreters continue to receive key and mouse events normally.
#
# Grabs apply to particular displays.
# If an application has windows on multiple displays then it can establish a separate grab on each display.
# The grab on a particular display affects only the windows on that display.
# It is possible for different applications on a single display to have simultaneous local grabs, but only one application
# can have a global grab on a given display at once.
#
# Note: *window* must be a short or real address.
#
#### COMMAND:
#
# The grab command can take any of the following forms:
#
#   **grab** ?*-global*? *window*
#      Same as grab set, described below.
#
#   **grab** **current** *window*
#      Returns the name of the current grab window in this application for *window*'s display, or an empty string if there is no such window.
#
#      ATTENTION! Differently than others mustang commands, the **grab current** command will **always**
#                 return real addresses, even if a short address was provided as input.
#
#                 You can always ask if an address is a short or real address with **tk get addr**.
#                 You can always translate a real address into a short address using the **tk get short**
#                 command or a short address into a real address using the **tk get real** command.
#
#   **grab** **release** *window*
#      Releases the grab on *window* if there is one, otherwise does nothing.
#      Returns an empty string.
#
#   **grab** **set** ?*-global*? *window*
#      Sets a grab on *window*. If *-global* is specified then the grab is global, otherwise it is local.
#      If a grab was already in effect for this application on *window*'s display then it is automatically released.
#      If there is already a grab on window and it has the same global/local form as the requested grab, then the command does nothing.
#      Returns an empty string.
#
#   **grab** **status** *window*
#      Returns **none** if no grab is currently set on *window*, **local** if a local grab is set on *window*, and **global** if a global grab is set.
package provide ::ms::grab 0.1

# Create the mustang **grab** package.
namespace eval ::ms::grab {}

# Rename the original Tk **grab** command.
rename grab _grab

# Create an alias for the mustang **grab** command.
interp alias {} grab {} ::ms::grab::Command

## Command
#
# Replace the Tk **grab** command.
#
# Where:
#
# args   Should be the arguments of the **grab** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::grab::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **grab** ?*-global*? *window*
    # **grab** **current** *window*
    # **grab** **release** *window*
    # **grab** **set** ?*-global*? *window*
    # **grab** **status** *window*

    # Separate the 'action' from the actual 'args'.
    set action [lindex   $args 0]
    set args   [lreplace $args 0 0]
    switch -- $action {
        current {
            # ATTENTION! Differently than others mustang commands, the **grab current** command will **always**
            #            return real addresses, even if a short address was provided as input.
            #
            #            You can always ask if an address is a short or real address with **tk get addr**.
            #            You can always translate a real address into a short address using the **tk get short**
            #            command or a short address into a real address using the **tk get real** command.

            # Synopsis:
            #
            # **grab** **current** *window*
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Check if the 'window' is a valid address or not.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Execute the command.
                    return [_grab current $w]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        set {
            # Synopsis:
            #
            # **grab** **set** ?*-global*? *window*
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Check if 'window' is a valid address or not.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]

                            # Check the 'window' type.
                            switch -- $type {
                                real  { return [_grab set $w] }
                                short { return [_grab set $::ms::addr($w,widget)] }
                            }
                        }
                    }
                }
                2   {
                    set option [lindex $args 0]
                    set window [lindex $args 1]

                    # Check 'option'.
                    switch -- $option {
                        -global {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Check if 'window' is a valid address or not.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]

                            # Check the 'window' type.
                            switch -- $type {
                                real  { return [_grab set -global $w] }
                                short { return [_grab set -global $::ms::addr($w,widget)] }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        release -
        status  {
            # Synopsis:
            #
            # **grab** **release** *window*
            # **grab** **status** *window*
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Check if 'window' is a valid address or not.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]

                            # Check the 'window' type.
                            switch -- $type {
                                real  { return [_grab $action $w] }
                                short { return [_grab $action $::ms::addr($w,widget)] }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        default {
            # Synopsis:
            #
            # **grab** ?*-global*? *window*
            switch -- [llength $args] {
                0   {
                    set window $action

                    # Check if 'window' is a valid address or not.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]

                            # Check the 'window' type.
                            switch -- $type {
                                real  { return [_grab set $w] }
                                short { return [_grab set $::ms::addr($w,widget)] }
                            }
                        }
                    }
                }
                1   {
                    set option $action
                    set window $args

                    # Check 'option'.
                    switch -- $option {
                        -global {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Check if 'window' is a valid address or not.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]

                            # Check the 'window' type.
                            switch -- $type {
                                real  { return [_grab set -global $w] }
                                short { return [_grab set -global $::ms::addr($w,widget)] }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
    }
}

#*EOF*