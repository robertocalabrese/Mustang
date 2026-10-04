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

## event - Miscellaneous event facilities: define virtual events and generate events.
#
#### SYNOPSIS:
#
# **event** **add** *virtual* *sequence* ?*sequence*? ... ?*sequence*?
# **event** **delete** *virtual* ?*sequence*? ... ?*sequence*?
# **event** **generate** *window* *event* ?*-option* *value*? ... ?*-option* *value*?
# **event** **info** ?*virtual*?
#
#### DESCRIPTION:
#
# The event command provides several facilities for dealing with window system events, such as defining virtual events and synthesizing events.
# The command has several different forms, determined by the first argument.
#
# The following forms are currently supported:
#
#   **event** **add** *virtual* *sequence* ?*sequence*? ... ?*sequence*?
#      Associates the virtual event *virtual* with the physical event sequence(s) given by the *sequence* arguments,
#      so that the virtual event will trigger whenever any one of the sequences occurs.
#      *Virtual* may be any string value and sequence may have any of the values allowed for the sequence argument to the bind command.
#      If *virtual* is already defined, the new physical event sequences add to the existing sequences for the event.
#
#   **event** **delete** *virtual* ?*sequence*? ... ?*sequence*?
#      Deletes each of the sequences from those associated with the virtual event given by *virtual*.
#      *Virtual* may be any string value and sequence may have any of the values allowed for the *sequence* argument to the bind command.
#      Any sequences not currently associated with *virtual* are ignored.
#      If no *sequence* argument is provided, all physical event sequences are removed for *virtual*, so that the virtual event
#      will not trigger anymore.
#
#   **event** **generate** *window* *event* ?*-option* *value*? ... ?*-option* *value*?
#      Generates a window event and arranges for it to be processed just as if it had come from the window system.
#      *Window* gives the path name of the window for which the event will be generated; it may also be an identifier
#      (such as returned by **winfo** *id*) as long as it is for a window in the current application.
#      If window is a path name, it must be a short or real address, see 'mustang.tcl' **REAL AND SHORT ADDRESSES** section to know what
#      they are and how to use them.
#
#      *Event* provides a basic description of the event, such as **Shift-Button-2** or **Paste**.
#      If *window* is empty the whole screen is meant, and coordinates are relative to the screen.
#      *Event* may have any of the forms allowed for the sequence argument of the bind command except that it must consist of a
#      single event pattern, not a sequence.
#
#      *Option/value* pairs may be used to specify additional attributes of the event, such as the *x* and *y* mouse position.
#      See the **EVENT FIELDS** below.
#
#      If the *when* option is not specified, the event is processed immediately: all of the handlers for the event will complete
#      before the event generate command returns.
#      If the *when* option is specified then it determines when the event is processed.
#      Certain events, such as key events, require that the window has focus to receive the event properly.
#
#   **event** **info** ?*virtual*?
#      Returns information about virtual events.
#      If the *virtual* argument is omitted, the return value is a list of all the virtual events that are currently defined.
#      If *virtual* is specified then the return value is a list whose elements are the physical event sequences currently
#      defined for the given virtual event; if the virtual event is not defined then an empty string is returned.
#
#      Note that virtual events that are not bound to physical event sequences are not returned by event info.
#
#### EVENT FIELDS:
#
# The following options are supported for the event generate command.
# These correspond to the **%** expansions allowed in binding scripts for the bind command.
#
#   **-above** *window*
#       *Window* specifies the *above* field for the event, either as a window path name or as an integer window id.
#       Valid for **Configure** events.
#       Corresponds to the **%a** substitution for binding scripts.
#
#   **-borderwidth** *size*
#       *Size* must be a screen distance; it specifies the *borderwidth* field for the event.
#       Valid for 'Configure' events.
#       Corresponds to the **%B** substitution for binding scripts.
#
#   **-button** *number*
#       *Number* must be an integer; it specifies the *detail* field for a Button or ButtonRelease event,
#       overriding any button number provided in the base event argument.
#       Corresponds to the **%b** substitution for binding scripts.
#
#   **-count** *number*
#       *Number* must be an integer; it specifies the *count* field for the event.
#       Valid for 'Expose' events.
#       Corresponds to the **%c** substitution for binding scripts.
#
#   **-data** *string*
#       *String* may be any value; it specifies the *user_data* field for the event.
#       Only valid for virtual events.
#       Corresponds to the **%d** substitution for virtual events in binding scripts.
#
#   **-delta** *number*
#       *Number* must be an integer; it specifies the delta field for the **MouseWheel** event.
#       The delta refers to the direction and magnitude the mouse wheel was rotated.
#       Note the value is not a screen distance but are units of motion in the mouse wheel.
#       Typically these values are multiples of '120'.
#       For example, **120** should scroll the text widget up 4 lines and **-240** would scroll the text widget down 8 lines.
#       Of course, other widgets may define different behaviors for mouse wheel motion.
#       This field corresponds to the **%D** substitution for binding scripts.
#
#   **-detail** *detail*
#      *Detail* specifies the *detail* field for the event and must be one of the following:
#         *NotifyAncestor*
#         *NotifyDetailNone*
#         *NotifyInferior*
#         *NotifyNonlinear*
#         *NotifyNonlinearVirtual*
#         *NotifyPointer*
#         *NotifyPointerRoot*
#         *NotifyVirtual*
#
#      Valid for **Enter**, **Leave**, **FocusIn** and **FocusOut** events.
#      Corresponds to the **%d** substitution for binding scripts.
#
#   **-focus** *boolean*
#      *Boolean* must be a boolean value; it specifies the *focus* field for the event.
#      Valid for **Enter** and **Leave** events.
#      Corresponds to the **%f** substitution for binding scripts.
#
#   **-height** *size*
#      *Size* must be a screen distance; it specifies the *height* field for the event.
#      Valid for **Configure** events.
#      Corresponds to the **%h** substitution for binding scripts.
#
#   **-keycode** *number*
#      *Number* must be an integer; it specifies the *keycode* field for the event.
#      Valid for **Key** and **KeyRelease** events.
#      Corresponds to the **%k** substitution for binding scripts.
#
#   **-keysym** *name*
#      *Name* must be the name of a valid keysym, such as **g**, **space**, or **Return**;
#      its corresponding keycode value is used as the keycode field for event, overriding any detail specified in the base event argument.
#      Valid for **Key** and **KeyRelease** events.
#      Corresponds to the **%K** substitution for binding scripts.
#
#   **-mode** *notify*
#      *Notify* specifies the *mode* field for the event and must be one of **NotifyNormal**, **NotifyGrab**, **NotifyUngrab**, or **NotifyWhileGrabbed**.
#      Valid for **Enter**, **Leave**, **FocusIn**, and **FocusOut** events.
#      Corresponds to the **%m** substitution for binding scripts.
#
#   **-override** *boolean*
#      *Boolean* must be a boolean value; it specifies the *override_redirect* field for the event.
#      Valid for **Map**, **Reparent**, and **Configure** events.
#      Corresponds to the **%o** substitution for binding scripts.
#
#   **-place** *where*
#      *Where* specifies the *place* field for the event; it must be either **PlaceOnTop** or **PlaceOnBottom**.
#      Valid for **Circulate** events.
#      Corresponds to the **%p** substitution for binding scripts.
#
#   **-root** *window*
#      *Window* must be either a window path name or an integer window identifier; it specifies the *root* field for the event.
#      Valid for **Key**, **KeyRelease**, **Button**, **ButtonRelease**, **Enter**, **Leave**, and **Motion** events.
#      Corresponds to the **%R** substitution for binding scripts.
#
#   **-rootx** *coord*
#      *Coord* must be a screen distance; it specifies the *x_root* field for the event.
#      Valid for **Key**, **KeyRelease**, **Button**, **ButtonRelease**, **Enter**, **Leave**, and **Motion** events.
#      Corresponds to the **%X** substitution for binding scripts.
#
#   **-rooty** *coord*
#      *Coord* must be a screen distance; it specifies the *y_root* field for the event.
#      Valid for **Key**, **KeyRelease**, **Button**, **ButtonRelease**, **Enter**, **Leave**, and **Motion** events.
#      Corresponds to the **%Y** substitution for binding scripts.
#
#   **-sendevent** *boolean*
#      *Boolean* must be a boolean value; it specifies the *send_event* field for the event.
#      Valid for all events.
#      Corresponds to the **%E** substitution for binding scripts.
#
#   **-serial** *number*
#      *Number* must be an integer; it specifies the *serial* field for the event.
#      Valid for all events.
#      Corresponds to the **%#** substitution for binding scripts.
#
#   **-state** *state*
#      *State* specifies the *state* field for the event.
#      For **Key**, **KeyRelease**, **Buttons**, **ButtonRelease**, **Enter**, **Leave**, and **Motion** events it must be an integer value.
#      For **Visibility** events it must be one of **VisibilityUnobscured**, **VisibilityPartiallyObscured**, or **VisibilityFullyObscured**.
#      This option overrides any modifiers such as **Meta** or **Control** specified in the base event.
#      Corresponds to the **%s** substitution for binding scripts.
#
#   **-subwindow** *window*
#      *Window* specifies the *subwindow* field for the event, either as a path name for a mustang widget or as an integer window identifier.
#      Valid for **Key**, **KeyRelease**, **Button**, **ButtonRelease**, **Enter**, **Leave**, and **Motion** events.
#      Similar to **%S** substitution for binding scripts.
#
#   **-time** *integer*
#      *Integer* must be an integer value; it specifies the *time* field for the event.
#      Additonally the special value current is allowed, this value will be substituted by the current event time.
#      Valid for **Key**, **KeyRelease**, **Button**, **ButtonRelease**, **Enter**, **Leave**, **Motion**, and **Property** events.
#      Corresponds to the **%t** substitution for binding scripts.
#
#   **-warp** *boolean*
#      *Boolean* must be a boolean value; it specifies whether the screen pointer should be warped as well.
#      Valid for **Key**, **KeyRelease**, **Button**, **ButtonRelease**, and **Motion** events.
#      The pointer will only warp to a window if it is mapped.
#
#   **-width** *size*
#      *Size* must be a screen distance; it specifies the *width* field for the event.
#      Valid for **Configure** events.
#      Corresponds to the **%w** substitution for binding scripts.
#
#   **-when** *when*
#      *When* determines when the event will be processed; it must have one of the following values:
#         *now*    Process the event immediately, before the command returns.
#                  This also happens if the *when* option is omitted.
#
#         *tail*   Place the event on Tcl's event queue behind any events already queued for this application.
#
#         *head*   Place the event at the front of Tcl's event queue, so that it will be handled before any other events already queued.
#
#         *mark*   Place the event at the front of Tcl's event queue but behind any other events already queued with *when* mark.
#                  This option is useful when generating a series of events that should be processed in order but at the front of the queue.
#
#   **-x** *coord*
#      *Coord* must be a screen distance; it specifies the *x* field for the event.
#      Valid for **Key**, **KeyRelease**, **Button**, **ButtonRelease**, **Motion**, **Enter**, **Leave**, **Expose**, **Configure**, **Gravity**,
#      and **Reparent** events.
#      Corresponds to the **%x** substitution for binding scripts.
#      If window is empty the coordinate is relative to the screen, and this option corresponds to the **%X** substitution for binding scripts.
#
#   **-y** *coord*
#      *Coord* must be a screen distance; it specifies the *y* field for the event.
#      Valid for **Key**, **KeyRelease**, **Button**, **ButtonRelease**, **Motion**, **Enter**, **Leave**, **Expose**, **Configure**, **Gravity**,
#      and **Reparent** events.
#      Corresponds to the **%y** substitution for binding scripts.
#      If window is empty the coordinate is relative to the screen, and this option corresponds to the '%Y' substitution for binding scripts.
#
# Any options that are not specified when generating an event are filled with the value **0**, except for *serial*,
# which is filled with the next **X** event serial number.
#
#### REDEFINED VIRTUAL EVENTS:
#
# Mustang defines the following virtual events for the purposes of notification:
#
#   **AltUnderlined**    This is sent to widget to notify it that the letter it has underlined (as an accelerator indicator) with
#                        the **underline** option has been pressed in combination with the **Alt** key.
#                        The usual response to this is to either focus into the widget (or some related widget) or to invoke the widget.
#
#   **Invoke**           This can be sent to some widgets (e.g. button, listbox, menu) as an alternative to **space**.
#
#   **LanguageChanged**  This is sent to all widgets when the language of the application changed.
#                        The mustang widgets listen to this event and redisplay themselves when it fires.
#
#   **ListboxSelect**    This is sent to a listbox when the set of selected item(s) in the listbox is updated.
#
#   **MenuSelect**       This is sent to a menu when the currently selected item in the menu changes.
#                        It is intended for use with context-sensitive help systems.
#
#   **Modified**         This is sent to a text widget when the contents of the widget are changed.
#
#   **Selection**        This is sent to a text widget when the selection in the widget is changed.
#
#   **ThemeChanged**     This is sent to all widgets when the ttk theme changed.
#                        The mustang widgets listen to this event and redisplay themselves when it fires.
#
#   **TraverseIn**       This is sent to a widget when the focus enters the widget because of a user-driven *tab to widget* action.
#
#   **TraverseOut**      This is sent to a widget when the focus leaves the widget because of a user-driven *tab to widget* action.
#
#   **UndoStack**        This is sent to a text widget when its undo stack or redo stack becomes empty or unempty.
#
#   **WidgetViewSync**   This is sent to a text widget when its internal data become obsolete, and again when these internal data are back in
#                        sync with the widget view.
#                        The *detail* field (**%d** substitution) is either true (when the widget is in sync) or false (when it is not).
#
# Mustang defines the following virtual events for the purposes of unifying bindings across multiple platforms.
# Users expect them to behave in the following way:
#
#   **Clear**            Delete the currently selected widget contents.
#
#   **Copy**             Copy the currently selected widget contents to the clipboard.
#
#   **Cut**              Move the currently selected widget contents to the clipboard.
#
#   **Paste**            Replace the currently selected widget contents with the contents of the clipboard.
#
#   **PasteSelection**   Insert the contents of the selection at the mouse location. (This event has meaningful **%x** and **%y** substitutions).
#
#   **ToggleSelection**  Toggle the selection.
#
#   **ContextMenu**      Display the widget context menu.
#
#   **DeleteChar**       Delete the character to the right of the current insert position.
#
#   **DeleteWord**       Delete the word located on the current insert position (or on its right if the insert position is at the start of the word).
#
#   **NextWindow**       Traverse to the next window.
#
#   **PrevWindow**       Traverse to the previous window.
#
#   **NextChar**         Move to the next item (i.e., visible character) in the current widget while deselecting any selected contents.
#
#   **NextLine**         Move to the next line in the current widget while deselecting any selected contents.
#
#   **NextPara**         Move to the next paragraph in the current widget while deselecting any selected contents.
#
#   **NextWord**         Move to the next group of items (i.e., visible word) in the current widget while deselecting any selected contents.
#
#   **PrevChar**         Move to the previous item (i.e., visible character) in the current widget while deselecting any selected contents.
#
#   **PrevLine**         Move to the previous line in the current widget while deselecting any selected contents.
#
#   **PrevPara**         Move to the previous paragraph in the current widget while deselecting any selected contents.
#
#   **PrevWord**         Move to the previous group of items (i.e., visible word) in the current widget while deselecting any selected contents.
#
#   **LineTop**          Move to the top of the document in the current widget while deselecting any selected contents.
#
#   **LineBottom**       Move to the bottom of the document in the current widget while deselecting any selected contents.
#
#   **LineStart**        Move to the start of the line in the current widget while deselecting any selected contents.
#
#   **LineEnd**          Move to the end of the line in the current widget while deselecting any selected contents.
#
#   **PageUp**           Scroll the widget (or its parent) one page up.
#
#   **PageDown**         Scroll the widget (or its parent) one page down.
#
#   **PageLeft**         Scroll the widget (or its parent) one page left.
#
#   **PageRight**        Scroll the widget (or its parent) one page right.
#
#   **Redo**             Redo one undone action.
#
#   **Undo**             Undo the last action.
#
#   **ScanMark**         Mark the starting of a *drag* action.
#
#   **ScanDrag**         Perform a *drag* action.
#
#   **ScanRelease**      Stop the *drag* action.
#
#   **SelectAll**        Set the range of selected contents to the complete widget.
#
#   **SelectNone**       Reset the range of selected contents to be empty.
#
#   **SelectLineTop**    Move to the top of the document in the current widget while extending the range of selected contents.
#
#   **SelectLineBottom** Move to the bottom of the document in the current widget while extending the range of selected contents.
#
#   **SelectLineStart**  Move to the start of the line in the current widget while extending the range of selected contents.
#
#   **SelectLineEnd**    Move to the end of the line in the current widget while extending the range of selected contents.
#
#   **SelectNextChar**   Move to the next item (i.e., visible character) in the current widget while extending the range of selected contents.
#
#   **SelectNextLine**   Move to the next line in the current widget while extending the range of selected contents.
#
#   **SelectNextPara**   Move to the next paragraph in the current widget while extending the range of selected contents.
#
#   **SelectNextWord**   Move to the next group of items (i.e., visible word) in the current widget while extending the range of selected contents.
#
#   **SelectPrevChar**   Move to the previous item (i.e., visible character) in the current widget while extending the range of selected contents.
#
#   **SelectPrevLine**   Move to the previous line in the current widget while extending the range of selected contents.
#
#   **SelectPrevPara**   Move to the previous paragraph in the current widget while extending the range of selected contents.
#
#   **SelectPrevWord**   Move to the previous group of items (i.e., visible word) in the current widget while extending the range
#                        of selected contents.
#
#### EXAMPLES:
#
###### MAPPING KEYS TO VIRTUAL EVENTS:
#
# In order for a virtual event binding to trigger, two things must happen.
# First, the virtual event must be defined with the event add command.
# Second, a binding must be created for the virtual event with the bind command.
# Consider the following virtual event definitions:
#
#   event add <<Paste>> <Control-y>
#   event add <<Paste>> <Button-2>
#   event add <<Save>> <Control-X><Control-S>
#   event add <<Save>> <Shift-F12>
#
#   switch -- [tk windowingsystem] {
#       aqua { event add <<Save>> <Command-s> }
#   }
#
# In the bind command, a virtual event can be bound like any other builtin event type as follows:
#
#   bind Entry <<Paste>> { %W insert [selection get] }
#
# The double angle brackets are used to specify that a virtual event is being bound.
# If the user types *Control-y* or presses button **2**, or if a **Paste** virtual event is synthesized with event generate, then the **Paste** binding will be invoked.
#
# If a virtual binding has the exact same sequence as a separate physical binding, then the physical binding will take precedence.
# Consider the following example:
#
#   event add <<Paste>> <Control-y> <Meta-Control-y>
#   bind Entry <Control-y> { puts Control-y }
#   bind Entry <<Paste>> { puts Paste }
#
# When the user types *Control-y* the **Control-y** binding will be invoked, because a physical event is considered more specific than a virtual event,
# all other things being equal. However, when the user types *Meta-Control-y* the **Paste** binding will be invoked, because the **Meta** modifier in
# the physical pattern associated with the virtual binding is more specific than the **Control-y** sequence for the physical event.
#
# Bindings on a virtual event may be created before the virtual event exists.
# Indeed, the virtual event never actually needs to be defined, for instance, on platforms where the specific virtual event would be meaningless or ungeneratable.
#
# When a definition of a virtual event changes at run time, all windows will respond immediately to the new definition. Starting from the preceding example,
# if the following code is executed:
#
#   bind Entry <Control-y> {}
#   event add <<Paste>> <F6>
#
# the behavior will change such in two ways.
# First, the shadowed **Paste** binding will emerge.
# Typing *Control-y* will no longer invoke the **Control-y** binding, but instead invoke the virtual event **Paste**.
# Second, pressing the *F6* key will now also invoke the **Paste** binding.
#
###### MOVING THE MOUSE POINTER:
#
# Sometimes it is useful to be able to really move the mouse pointer.
# For example, if you have some software that is capable of demonstrating directly to the user how to use the program.
# To do this, you need to *warp* the mouse around by using event generate, like this:
#
# for {set xy 0} {$xy < 200} {incr xy} {
#     event generate . <Motion> -x $xy -y $xy -warp 1
#     update
#     after 50
# }
#
# Note that it is usually considered bad style to move the mouse pointer for the user because it removes control from them.
# Therefore this technique should be used with caution.
# Also note that it is not guaranteed to function on all platforms.
package provide ::ms::event 0.1

# Create the mustang **event** package.
namespace eval ::ms::event {}

# Rename the original Tk **event** command.
rename event _event

# Create an alias for the mustang **event** command.
interp alias {} event {} ::ms::event::Command

## Command
#
# Replace the Tk **event** command.
#
# Where:
#
# args   Should be the arguments of the **event** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::event::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **event** **add** *virtual* *sequence* ?*sequence*? ... ?*sequence*?
    # **event** **delete** *virtual* ?*sequence*? ... ?*sequence*?
    # **event** **generate** *window* *event* ?*-option* *value*? ... ?*-option* *value*?
    # **event** **info** ?*virtual*?

    # Check if 'args' is an empty string.
    switch -- $args {
        ""  { ::ms::Error "Missing action." $caller_info }
    }

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        add {
            # Synopsis:
            #
            # **event** **add** *virtual* *sequence* ?*sequence*? ... ?*sequence*?
            switch -- [llength $args] {
                0       -
                1       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    # Execute the command.
                    try {
                        _event add {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
            }
        }
        delete {
            # Synopsis:
            #
            # **event** **delete** *virtual* ?*sequence*? ... ?*sequence*?
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    # Execute the command.
                    try {
                        _event delete {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
            }
        }
        info {
            # Synopsis:
            #
            # **event** **info** ?*virtual*?
            switch -- [llength $args] {
                0   -
                1   {
                    # Execute the command.
                    try {
                        _event info {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        generate {
            # Synopsis:
            #
            # **event** **generate** *window* *event* ?*-option* *value*? ... ?*-option* *value*?
            switch -- [llength $args] {
                0       -
                1       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    set window [lindex  $args 0]

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set args [lreplace $args 0 0 $w] }
                    }

                    # Check if the '-above', '-root' or '-subwindow' options were provided.
                    foreach optionName [list "-above" "-root" "-subwindow"] {
                        set index [lsearch -exact $args $optionName]
                        switch -- $index {
                            -1      {}
                            default {
                                # Get the 'optionName' window provided.
                                set window [lindex $args $index+1]
                                switch -- $window {
                                   ""  { ::ms::Error "Missing address for '$optionName'." $caller_info }
                                }

                                # Get the 'window' real address.
                                set w [::ms::Check_Pathname $window invalid]
                                switch -- $w {
                                    invalid { ::ms::Error "Invalid address for '$optionName', '$window'." $caller_info }
                                    default { set args [lreplace $args $index+1 $index+1 $w] }
                                }
                            }
                        }
                    }

                    # Execute the command.
                    try {
                        _event generate {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
            }
        }
        default { ::ms::Error "Invalid action, '$action'." $caller_info }
    }
}

##############################################################################################
##                                                                                          ##
##     DEFINE/REDEFINE/REMOVE SOME TK VIRTUAL EVENTS BINDINGS ACROSS MULTIPLE PLATFORMS     ##
##                                                                                          ##
##############################################################################################

# Remove some virtual events previously defined by Tk.
_event delete <<Cut>>
_event delete <<Copy>>
_event delete <<Paste>>
_event delete <<PasteSelection>>

_event delete <<ToggleSelection>>

_event delete <<Undo>>
_event delete <<Redo>>

_event delete <<ContextMenu>>

_event delete <<PrevChar>>
_event delete <<NextChar>>

_event delete <<PrevWord>>
_event delete <<NextWord>>

_event delete <<PrevLine>>
_event delete <<NextLine>>

_event delete <<PrevPara>>
_event delete <<NextPara>>

_event delete <<LineStart>>
_event delete <<LineEnd>>

_event delete <<SelectAll>>
_event delete <<SelectNone>>

_event delete <<SelectPrevChar>>
_event delete <<SelectNextChar>>

_event delete <<SelectPrevWord>>
_event delete <<SelectNextWord>>

_event delete <<SelectPrevLine>>
_event delete <<SelectNextLine>>

_event delete <<SelectPrevPara>>
_event delete <<SelectNextPara>>

_event delete <<SelectLineStart>>
_event delete <<SelectLineEnd>>

# Define the new virtual events that will be present in mustang.
switch -- [tk windowingsystem] {
    "aqua" {
        # Note: On Darwin/Aqua, mouse buttons from left to right are 1,3,2.
        #       See https://support.apple.com/en-us/HT201236

        _event add <<Cut>>             <Command-KeyPress-x> <Command-KeyPress-X> <F2>
        _event add <<Copy>>            <Command-KeyPress-c> <Command-KeyPress-C> <F3>
        _event add <<Paste>>           <Command-KeyPress-v> <Command-KeyPress-V> <F4>
        _event add <<PasteSelection>>  <ButtonRelease-3>
        _event add <<ToggleSelection>> <ButtonPress-1> <Control-ButtonPress-1> <space> <Return> <KP_Enter>

        _event add <<Delete_Char>> <Fn-BackSpace>        <Control-KeyPress-d> <Control-KeyPress-D>
        _event add <<Delete_Word>> <Fn-Option-BackSpace> <Option-KeyPress-d>  <Option-KeyPress-D>

        _event add <<Undo>> <Command-KeyPress-z>       <Command-KeyPress-Z>
        _event add <<Redo>> <Shift-Command-KeyPress-z> <Shift-Command-KeyPress-Z>

        _event add <<ContextMenu>> <ButtonPress-2>

        _event add <<Scan_Mark>>    <ButtonPress-3>
        _event add <<Scan_Drag>>    <B3-Motion>
        _event add <<Scan_Release>> <ButtonRelease-3>

        _event add <<SelectAll>>  <Command-KeyPress-a>       <Command-KeyPress-A>
        _event add <<SelectNone>> <Command-Shift-KeyPress-a> <Command-Shift-KeyPress-A> <Clear>

        _event add <<PrevLine>>       <KeyPress-Up>       <Control-KeyPress-p>       <Control-KeyPress-P>
        _event add <<SelectPrevLine>> <Shift-KeyPress-Up> <Control-Shift-KeyPress-p> <Control-Shift-KeyPress-P>

        _event add <<NextLine>>       <KeyPress-Down>       <Control-KeyPress-n>       <Control-KeyPress-N>
        _event add <<SelectNextLine>> <Shift-KeyPress-Down> <Control-Shift-KeyPress-n> <Control-Shift-KeyPress-N>

        _event add <<PrevChar>>       <KeyPress-Left>       <Control-KeyPress-b>       <Control-KeyPress-B>
        _event add <<SelectPrevChar>> <Shift-KeyPress-Left> <Control-Shift-KeyPress-b> <Control-Shift-KeyPress-B>

        _event add <<NextChar>>       <KeyPress-Right>       <Control-KeyPress-f>       <Control-KeyPress-F>
        _event add <<SelectNextChar>> <Shift-KeyPress-Right> <Control-Shift-KeyPress-f> <Control-Shift-KeyPress-F>

        _event add <<PrevPara>>       <Option-KeyPress-Up>       <Option-Control-KeyPress-p>       <Option-Control-KeyPress-P>
        _event add <<SelectPrevPara>> <Option-Shift-KeyPress-Up> <Option-Control-Shift-KeyPress-p> <Option-Control-Shift-KeyPress-P>

        _event add <<NextPara>>       <Option-KeyPress-Down>       <Option-Control-KeyPress-n>       <Option-Control-KeyPress-N>
        _event add <<SelectNextPara>> <Option-Shift-KeyPress-Down> <Option-Control-Shift-KeyPress-n> <Option-Control-Shift-KeyPress-N>

        _event add <<PrevWord>>       <Option-KeyPress-Left>       <Option-Control-KeyPress-b>       <Option-Control-KeyPress-B>
        _event add <<SelectPrevWord>> <Option-Shift-KeyPress-Left> <Option-Control-Shift-KeyPress-b> <Option-Control-Shift-KeyPress-B>

        _event add <<NextWord>>       <Option-KeyPress-Right>       <Option-Control-KeyPress-f>       <Option-Control-KeyPress-F>
        _event add <<SelectNextWord>> <Option-Shift-KeyPress-Right> <Option-Control-Shift-KeyPress-f> <Option-Control-Shift-KeyPress-F>

        _event add <<LineTop>>       <Command-KeyPress-Home>       <Command-KeyPress-Up>       <Command-Control-KeyPress-a>       <Command-Control-KeyPress-A>
        _event add <<SelectLineTop>> <Command-Shift-KeyPress-Home> <Command-Shift-KeyPress-Up> <Command-Control-Shift-KeyPress-a> <Command-Control-Shift-KeyPress-A>

        _event add <<LineBottom>>       <Command-KeyPress-End>       <Command-KeyPress-Down>       <Command-Control-KeyPress-e>       <Command-Control-KeyPress-E>
        _event add <<SelectLineBottom>> <Command-Shift-KeyPress-End> <Command-Shift-KeyPress-Down> <Command-Control-Shift-KeyPress-e> <Command-Control-Shift-KeyPress-E>

        _event add <<LineStart>>       <KeyPress-Home>       <Command-KeyPress-Left>       <Control-KeyPress-a>       <Control-KeyPress-A>
        _event add <<SelectLineStart>> <Shift-KeyPress-Home> <Command-Shift-KeyPress-Left> <Control-Shift-KeyPress-a> <Control-Shift-KeyPress-A>

        _event add <<LineEnd>>       <KeyPress-End>       <Command-KeyPress-Right>       <Control-KeyPress-e>       <Control-KeyPress-E>
        _event add <<SelectLineEnd>> <Shift-KeyPress-End> <Command-Shift-KeyPress-Right> <Control-Shift-KeyPress-e> <Control-Shift-KeyPress-E>

        _event add <<PageUp>>    <KeyPress-Prior>         <Command-Control-KeyPress-Up>    <Command-KeyPress-p> <Command-KeyPress-P>
        _event add <<PageDown>>  <KeyPress-Next>          <Command-Control-KeyPress-Down>  <Command-KeyPress-n> <Command-KeyPress-N>
        _event add <<PageLeft>>  <Control-KeyPress-Prior> <Command-Control-KeyPress-Left>  <Command-KeyPress-b> <Command-KeyPress-B>
        _event add <<PageRight>> <Control-KeyPress-Next>  <Command-Control-KeyPress-Right> <Command-KeyPress-f> <Command-KeyPress-F>
    }
    "win32" {
        # Note: On Windows, mouse buttons from left to right are 1,2,3.

        _event add <<Cut>>             <Control-KeyPress-x> <Control-KeyPress-X> <F20>
        _event add <<Copy>>            <Control-KeyPress-c> <Control-KeyPress-C> <F16>
        _event add <<Paste>>           <Control-KeyPress-v> <Control-KeyPress-V> <F18>
        _event add <<PasteSelection>>  <ButtonRelease-2>
        _event add <<ToggleSelection>> <ButtonPress-1> <Control-ButtonPress-1> <space> <Return> <KP_Enter>

        _event add <<DeleteChar>> <Meta-KeyPress-d>       <Control-KeyPress-d>       <Control-KeyPress-D>
        _event add <<DeleteWord>> <Meta-Shift-KeyPress-d> <Control-Shift-KeyPress-d> <Control-Shift-KeyPress-D>

        _event add <<Undo>> <Control-KeyPress-z>       <Control-KeyPress-Z>
        _event add <<Redo>> <Control-Shift-KeyPress-z> <Control-Shift-KeyPress-Z>

        _event add <<ContextMenu>> <ButtonPress-3>

        _event add <<ScanMark>>    <ButtonPress-2>
        _event add <<ScanDrag>>    <B2-Motion>
        _event add <<ScanRelease>> <ButtonRelease-2>

        _event add <<SelectAll>>  <Control-KeyPress-a>       <Control-KeyPress-A>
        _event add <<SelectNone>> <Control-Shift-KeyPress-a> <Control-Shift-KeyPress-A> <Clear>

        _event add <<PrevLine>>       <KeyPress-Up>       <Control-KeyPress-h>       <Control-KeyPress-H>
        _event add <<SelectPrevLine>> <Shift-KeyPress-Up> <Control-Shift-KeyPress-h> <Control-Shift-KeyPress-H>

        _event add <<NextLine>>       <KeyPress-Down>       <Control-KeyPress-l>       <Control-KeyPress-L>
        _event add <<SelectNextLine>> <Shift-KeyPress-Down> <Control-Shift-KeyPress-l> <Control-Shift-KeyPress-L>

        _event add <<PrevChar>>       <KeyPress-Left>       <Control-KeyPress-j>       <Control-KeyPress-J>
        _event add <<SelectPrevChar>> <Shift-KeyPress-Left> <Control-Shift-KeyPress-j> <Control-Shift-KeyPress-J>

        _event add <<NextChar>>       <KeyPress-Right>       <Control-KeyPress-k>       <Control-KeyPress-K>
        _event add <<SelectNextChar>> <Shift-KeyPress-Right> <Control-Shift-KeyPress-k> <Control-Shift-KeyPress-K>

        _event add <<PrevPara>>       <Control-KeyPress-Up>       <Alt-KeyPress-h>       <Alt-KeyPress-H>
        _event add <<SelectPrevPara>> <Control-Shift-KeyPress-Up> <Alt-Shift-KeyPress-h> <Alt-Shift-KeyPress-H>

        _event add <<NextPara>>       <Control-KeyPress-Down>       <Alt-KeyPress-l>       <Alt-KeyPress-L>
        _event add <<SelectNextPara>> <Control-Shift-KeyPress-Down> <Alt-Shift-KeyPress-l> <Alt-Shift-KeyPress-L>

        _event add <<PrevWord>>       <Control-KeyPress-Left>       <Alt-KeyPress-j>       <Alt-KeyPress-J>
        _event add <<SelectPrevWord>> <Control-Shift-KeyPress-Left> <Alt-Shift-KeyPress-j> <Alt-Shift-KeyPress-J>

        _event add <<NextWord>>       <Control-KeyPress-Right>       <Alt-KeyPress-k>       <Alt-KeyPress-K>
        _event add <<SelectNextWord>> <Control-Shift-KeyPress-Right> <Alt-Shift-KeyPress-k> <Alt-Shift-KeyPress-K>

        _event add <<LineTop>>       <Control-KeyPress-Home>       <Alt-KeyPress-o>       <Alt-KeyPress-O>
        _event add <<SelectLineTop>> <Control-Shift-KeyPress-Home> <Alt-Shift-KeyPress-o> <Alt-Shift-KeyPress-O>

        _event add <<LineBottom>>       <Control-KeyPress-End>       <Alt-KeyPress-e>       <Alt-KeyPress-E>
        _event add <<SelectLineBottom>> <Control-Shift-KeyPress-End> <Alt-Shift-KeyPress-e> <Alt-Shift-KeyPress-E>

        _event add <<LineStart>>       <KeyPress-Home>       <Control-KeyPress-o>       <Control-KeyPress-O>
        _event add <<SelectLineStart>> <Shift-KeyPress-Home> <Control-Shift-KeyPress-o> <Control-Shift-KeyPress-O>

        _event add <<LineEnd>>       <KeyPress-End>       <Control-KeyPress-e>       <Control-KeyPress-E>
        _event add <<SelectLineEnd>> <Shift-KeyPress-End> <Control-Shift-KeyPress-e> <Control-Shift-KeyPress-E>

        _event add <<PageUp>>    <KeyPress-Prior>         <Control-KeyPress-Up>    <Control-Alt-KeyPress-Up>    <Control-Shift-KeyPress-h> <Control-Shift-KeyPress-H>
        _event add <<PageDown>>  <KeyPress-Next>          <Control-KeyPress-Down>  <Control-Alt-KeyPress-Down>  <Control-Shift-KeyPress-l> <Control-Shift-KeyPress-L>
        _event add <<PageLeft>>  <Control-KeyPress-Prior> <Control-KeyPress-Left>  <Control-Alt-KeyPress-Left>  <Control-Shift-KeyPress-j> <Control-Shift-KeyPress-J>
        _event add <<PageRight>> <Control-KeyPress-Next>  <Control-KeyPress-Right> <Control-Alt-KeyPress-Right> <Control-Shift-KeyPress-k> <Control-Shift-KeyPress-K>
    }
    default {
        # Note: On BSD, Linux and Darwin/X11 (the latter with recent XQuartz as the X server), mouse buttons
        #       from left to right are 1,2,3. Other X servers may differ.

        _event add <<Cut>>             <Control-KeyPress-x> <Control-KeyPress-X> <F20>
        _event add <<Copy>>            <Control-KeyPress-c> <Control-KeyPress-C> <F16>
        _event add <<Paste>>           <Control-KeyPress-v> <Control-KeyPress-V> <F18>
        _event add <<PasteSelection>>  <ButtonRelease-2>
        _event add <<ToggleSelection>> <ButtonPress-1> <Control-ButtonPress-1> <space> <Return> <KP_Enter>

        _event add <<DeleteChar>> <Meta-KeyPress-d>       <Meta-KeyPress-D>       <Control-KeyPress-d>       <Control-KeyPress-D>
        _event add <<DeleteWord>> <Meta-Shift-KeyPress-d> <Meta-Shift-KeyPress-D> <Control-Shift-KeyPress-d> <Control-Shift-KeyPress-D>

        _event add <<Undo>> <Control-KeyPress-z>       <Control-KeyPress-Z>
        _event add <<Redo>> <Control-Shift-KeyPress-z> <Control-Shift-KeyPress-Z>

        _event add <<ContextMenu>> <ButtonPress-3>

        _event add <<ScanMark>>    <ButtonPress-2>
        _event add <<ScanDrag>>    <B2-Motion>
        _event add <<ScanRelease>> <ButtonRelease-2>

        _event add <<SelectAll>>  <Control-KeyPress-a>       <Control-KeyPress-A>
        _event add <<SelectNone>> <Control-Shift-KeyPress-a> <Control-Shift-KeyPress-A> <Clear>

        _event add <<PrevLine>>       <KeyPress-Up>       <Control-KeyPress-h>       <Control-KeyPress-H>
        _event add <<SelectPrevLine>> <Shift-KeyPress-Up> <Control-Shift-KeyPress-h> <Control-Shift-KeyPress-H>

        _event add <<NextLine>>       <KeyPress-Down>       <Control-KeyPress-l>       <Control-KeyPress-L>
        _event add <<SelectNextLine>> <Shift-KeyPress-Down> <Control-Shift-KeyPress-l> <Control-Shift-KeyPress-L>

        _event add <<PrevChar>>       <KeyPress-Left>       <Control-KeyPress-j>       <Control-KeyPress-J>
        _event add <<SelectPrevChar>> <Shift-KeyPress-Left> <Control-Shift-KeyPress-j> <Control-Shift-KeyPress-J>

        _event add <<NextChar>>       <KeyPress-Right>       <Control-KeyPress-k>       <Control-KeyPress-K>
        _event add <<SelectNextChar>> <Shift-KeyPress-Right> <Control-Shift-KeyPress-k> <Control-Shift-KeyPress-K>

        _event add <<PrevPara>>       <Control-KeyPress-Up>       <Alt-KeyPress-h>       <Alt-KeyPress-H>
        _event add <<SelectPrevPara>> <Control-Shift-KeyPress-Up> <Alt-Shift-KeyPress-h> <Alt-Shift-KeyPress-H>

        _event add <<NextPara>>       <Control-KeyPress-Down>       <Alt-KeyPress-l>       <Alt-KeyPress-L>
        _event add <<SelectNextPara>> <Control-Shift-KeyPress-Down> <Alt-Shift-KeyPress-l> <Alt-Shift-KeyPress-L>

        _event add <<PrevWord>>       <Control-KeyPress-Left>       <Alt-KeyPress-j>       <Alt-KeyPress-J>
        _event add <<SelectPrevWord>> <Control-Shift-KeyPress-Left> <Alt-Shift-KeyPress-j> <Alt-Shift-KeyPress-J>

        _event add <<NextWord>>       <Control-KeyPress-Right>       <Alt-KeyPress-k>       <Alt-KeyPress-K>
        _event add <<SelectNextWord>> <Control-Shift-KeyPress-Right> <Alt-Shift-KeyPress-k> <Alt-Shift-KeyPress-K>

        _event add <<LineTop>>       <Control-KeyPress-Home>       <Alt-KeyPress-o>       <Alt-KeyPress-O>
        _event add <<SelectLineTop>> <Control-Shift-KeyPress-Home> <Alt-Shift-KeyPress-o> <Alt-Shift-KeyPress-O>

        _event add <<LineBottom>>       <Control-KeyPress-End>       <Alt-KeyPress-e>       <Alt-KeyPress-E>
        _event add <<SelectLineBottom>> <Control-Shift-KeyPress-End> <Alt-Shift-KeyPress-e> <Alt-Shift-KeyPress-E>

        _event add <<LineStart>>       <KeyPress-Home>       <Control-KeyPress-o>       <Control-KeyPress-O>
        _event add <<SelectLineStart>> <Shift-KeyPress-Home> <Control-Shift-KeyPress-o> <Control-Shift-KeyPress-O>

        _event add <<LineEnd>>       <KeyPress-End>       <Control-KeyPress-e>       <Control-KeyPress-E>
        _event add <<SelectLineEnd>> <Shift-KeyPress-End> <Control-Shift-KeyPress-e> <Control-Shift-KeyPress-E>

        _event add <<PageUp>>    <KeyPress-Prior>         <Control-KeyPress-Up>    <Control-Alt-KeyPress-Up>    <Control-Shift-KeyPress-h> <Control-Shift-KeyPress-H>
        _event add <<PageDown>>  <KeyPress-Next>          <Control-KeyPress-Down>  <Control-Alt-KeyPress-Down>  <Control-Shift-KeyPress-l> <Control-Shift-KeyPress-L>
        _event add <<PageLeft>>  <Control-KeyPress-Prior> <Control-KeyPress-Left>  <Control-Alt-KeyPress-Left>  <Control-Shift-KeyPress-j> <Control-Shift-KeyPress-J>
        _event add <<PageRight>> <Control-KeyPress-Next>  <Control-KeyPress-Right> <Control-Alt-KeyPress-Right> <Control-Shift-KeyPress-k> <Control-Shift-KeyPress-K>
    }
}

#*EOF*