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

## bind - Arrange for X events to invoke Tcl scripts.
#
#### SYNOPSIS
#
# **bind** *tag*
# **bind** *tag* *sequence*
# **bind** *tag* *sequence*  {}
# **bind** *tag* *sequence*  *action*
# **bind** *tag* *sequence* -*action*
# **bind** *tag* *sequence* +*action*
#
#### DESCRIPTION
#
# The bind command associates Tcl scripts with X events.
# If all three arguments are specified, bind will arrange for *action* to be evaluated whenever the event(s) given by
# sequence occur in the window(s) identified by *tag*.
#
# Note that the order in which any binding is executed depends on which binding was setted first and which one is more specific.
#
#   *tag*
#      The *tag* argument determines which window(s) the binding applies to.
#      If *tag* begins with a dot, as in ".a.b.c", then it must be the path name for a window;
#      otherwise it may be an arbitrary string.
#      If *tag* is a path name for a window it must be a short or real address.
#      Each window has an associated list of tags, and a binding applies to a particular window if its *tag* is among
#      those specified for the window.
#
#      Although the **[bindtags](/wiki/commands/bindtags.md)** command may be used to assign an arbitrary set
#      of binding tags to a window, the default binding tags provide the following behavior:
#
#          - If a *tag* is the name of an internal window the binding applies to that window.
#          - If the *tag* is the name of a toplevel window the binding applies to the toplevel window and all its internal windows.
#          - If the *tag* is the name of a class of widgets, such as **Button**, the binding applies to all widgets in that class.
#          - If *tag* has the value **all**, the binding applies to all windows in the application.
#
#   ?*sequence*?
#      The *sequence* argument specifies a sequence of one or more event patterns, with optional whitespace between the patterns,
#      see **EVENT PATTERNS** for more info.
#
#   ?*+/-*??*action*?
#      The action, command or Tcl procedure to execute when the *sequence* occurs.
#
#      If *action* is prefixed with a "**+**", then it is appended to any existing binding for the *sequence* provided.
#      If *action* is prefixed with a "**-**", then it is removed from any existing binding for the *sequence* provided.
#      If *action* is not prefixed by "**+**" or "**-**", it replaces any existing binding.
#      If *action* is an empty string then the current binding for *sequence* is destroyed, leaving *sequence* unbound.
#
# In all of the cases where a *action* argument is provided, bind returns an empty string.
# If *sequence* is specified without a *action*, then the *action* currently bound to *sequence* is returned,
# or an empty string is returned if there is no binding for *sequence*.
# If neither *sequence* nor *action* is specified, then the return value is a list whose elements are all the sequences
# for which there exist bindings for *tag*.
#
###### EVENT PATTERNS
#
# Each event pattern may take one of three forms.
#
# **First form**:
#   In the simplest case it is a single printing ASCII character, such as "a" or "[".
#   The character may not be a space character or the character "<".
#   This form of pattern matches a **Key** event for the particular character.
#
# **Second form**:
#   The second form of pattern is longer but more general.
#   It has the following syntax:
#
#      *<modifier-modifier-type-detail>*
#
#   The entire event pattern is surrounded by angle brackets.
#   Inside the angle brackets are zero or more modifiers, an event type, and an extra piece of information (detail)
#   identifying a particular button or keysym.
#   Any of the fields may be omitted, as long as at least one of type and detail is present.
#   The fields must be separated by whitespace or dashes.
#
# **Third form**:
#   The third form of pattern is used to specify a user-defined, named '*virtual event*'.
#   It has the following syntax:
#
#      *<<name>>*
#
#   The entire virtual event pattern is surrounded by double angle brackets.
#   Inside the angle brackets is the user-defined *name* of the virtual event.
#   Modifiers, such as **Shift** or **Control**, may not be combined with a virtual event to modify it.
#   Bindings on a virtual event may be created before the virtual event is defined, and if the definition of a
#   virtual event changes dynamically, all windows bound to that virtual event will respond immediately to the new definition.
#
# Some widgets (e.g. **[text](/wiki/widgets/text.md)**) issue virtual events when their internal state is updated in some ways.
# Please see the wiki page for each widget for details.
#
###### MODIFIERS
#
# Modifiers consist of any of the following values:
#
#   *Alt*         *Meta*, *M*              *Button1*, *B1*
#   *Control*     *Mod1*, *M1, *Command*   *Button2*, *B2*
#   *Shift*       *Mod2*, *M2, *Option*    *Button3*, *B3*
#   *Lock*        *Mod3*, *M3*             *Button4*, *B4*
#   *Extended*    *Mod4*, *M4*             *Button5*, *B5*
#                 *Mod5*, *M5*             *Button6*, *B6*
#   *Double*                               *Button7*, *B7*
#   *Triple*                               *Button8*, *B8*
#   *Quadruple*                            *Button9*, *B9*
#
# Where more than one value is listed, separated by commas, the values are equivalent.
# Most of the modifiers have the obvious X meanings.
# For example, **Button1** and **B1** requires that button 1 be depressed when the event occurs.
# For a binding to match a given event, the modifiers in the event must include all of those specified in the event pattern.
#
# An event may also contain additional modifiers not specified in the binding.
# For example, if **Button1** is pressed while the shift and control keys are down, the pattern *<Control-Button-1>* will match the event,
# but *<Mod1-Button-1>* will not.
# If no modifiers are specified, then any combination of modifiers may be present in the event.
#
# **Meta** and **M** refer to whichever of the **M1** through **M5** modifiers is associated with the meta key(s)
# on the keyboard (keysyms **Meta_R** and **Meta_L**).
# If there are no meta keys, or if they are not associated with any modifiers, then **Meta** and **M** will not match any events.
# Similarly, the **Alt** modifier refers to whichever modifier is associated with the alt key(s) on the keyboard
# (keysyms **Alt_L** and **Alt_R**).
#
# The **Double**, **Triple** or **Quadruple** modifiers are a convenience for specifying double mouse clicks and other repeated events.
# They cause a particular event pattern to be repeated 2, 3 or 4 times, and also place a time and space requirement on the sequence.
# For a sequence of events to match a **Double**, **Triple** or **Quadruple** pattern, all of the events must occur close together
# in time and without substantial mouse motion in between.
# For example, **Double-Button-1** is equivalent to **Button-1*+*Button-1** with the extra time and space requirement.
#
# The **Command** and **Option** modifiers are equivalents of **Mod1** resp. **Mod2**, they correspond to Macintosh-specific modifier keys.
# The **Extended** modifier is, at present, specific to Windows.
# It appears on events that are associated with the keys on the *extended keyboard*.
#
# On a US keyboard, the extended keys include the **Alt** and **Control** keys at the right of the keyboard, the cursor keys in the cluster
# to the left of the numeric pad, the **NumLock** key, the **Break** key, the **PrintScreen** key, and the **/** and **Enter** keys in
# the numeric keypad.
#
###### EVENT TYPES
#
# The *type* field may be any of the standard X event types, with a few extra abbreviations.
# The type field will also accept a couple non-standard X event types that were added to better support the Macintosh and Windows platforms.
#
# Below is a list of all the valid types; where two names appear together, they are synonyms.
#
#   Activate              ConfigureRequest   FocusOut        Motion
#   Button, ButtonPress   Create             Gravity         MouseWheel
#   ButtonRelease         Deactivate         Key, KeyPress   Property
#   Circulate             Destroy            KeyRelease      Reparent
#   CirculateRequest      Enter              Leave           ResizeRequest
#   Colormap              Expose             Map             Unmap
#   Configure             FocusIn            MapRequest      Visibility
#
# Most of the above events have the same fields and behaviors as events in the X Windowing system.
#
# You can find more detailed descriptions of these events in any X window programming book.
# A couple of the events are extensions to the X event system to support features unique to the Macintosh and Windows platforms.
#
#   **Activate**, **Deactivate**:
#      These two events are sent to every sub-window of a toplevel when they change state.
#      In addition to the focus window, the Macintosh and Windows platforms have a notion of an active window
#      (which often has but is not required to have the focus). On the Macintosh, widgets in the active window have a
#      different appearance than widgets in deactive windows.
#
#      The **Activate** event is sent to all the sub-windows in a toplevel when it changes from being deactive to active.
#      The **Deactive** event is sent when the window's state changes from active to deactive.
#
#      There are no useful percent substitutions you would make when binding to these events.
#
#   **Button**, **ButtonRelease**, **Motion**:
#      The **Button** and **ButtonRelease** events are generated when the user presses or releases a mouse button.
#      **Motion** events are generated whenever the pointer is moved.
#      **Button**, **ButtonRelease** and **Motion** events are normally sent to the window containing the pointer.
#
#      When a mouse button is pressed, the window containing the pointer automatically obtains a temporary pointer grab.
#      Subsequent **Button**, **ButtonRelease** and **Motion** events will be sent to that window, regardless of which window
#      contains the pointer, until all buttons have been released.
#
#   **Colormap**:
#      A **Colormap** event is generated whenever the colormap associated with a window has been changed, installed, or uninstalled.
#      Widgets may be assigned a private colormap by specifying a *-colormap* option; the window manager is responsible for
#      installing and uninstalling colormaps as necessary.
#
#      Note that Tk provides no useful details for this event type.
#
#   **Configure**:
#      A **Configure** event is sent to a window whenever its size, position, or border width changes,
#      and sometimes when it has changed position in the stacking order.
#
#   **Destroy**:
#      A **Destroy** event is delivered to a window when it is destroyed.
#
#      When the **Destroy** event is delivered to a widget, it is in a *half-dead* state: the widget still exists,
#      but operations that involve it may return invalid result, or return an error.
#
#   **Enter**, **Leave**:
#      An **Enter** event is sent to a window when the pointer enters that window, and a **Leave** event is sent when the
#      pointer leaves it. If there is a pointer grab in effect, **Enter** and **Leave** events are only delivered to the
#      window owning the grab.
#
#      In addition, when the pointer moves between two windows, **Enter** and **Leave** *virtual crossing* events are sent to
#      intermediate windows in the hierarchy in the same manner as for **FocusIn** and **FocusOut** events.
#
#   **Expose**:
#      An **Expose** event is generated whenever all or part of a window should be redrawn (for example, when a window is
#      first mapped or if it becomes unobscured).
#      It is normally not necessary for client applications to handle **Expose** events, since Tk handles them internally.
#
#   **FocusIn**, **FocusOut**:
#      The **FocusIn** and **FocusOut** events are generated whenever the keyboard focus changes.
#      A **FocusOut** event is sent to the old focus window, and a **FocusIn** event is sent to the new one.
#
#      In addition, if the old and new focus windows do not share a common parent, *virtual crossing* focus events
#      are sent to the intermediate windows in the hierarchy. Thus a **FocusIn** event indicates that the target window or
#      one of its descendants has acquired the focus, and a **FocusOut** event indicates that the focus has been changed to
#      a window outside the target window's hierarchy.
#
#      The keyboard focus may be changed explicitly by a call to focus, or implicitly by the window manager.
#
#   **Gravity**, **Reparent**, **Circulate**:
#      The events **Gravity** and **Reparent** are not normally delivered to Tk applications.
#      They are included for completeness.
#
#      A **Circulate** event indicates that the window has moved to the top or to the bottom of the stacking order as a result
#      of an **XCirculateSubwindows** protocol request.
#
#      Note that the stacking order may be changed for other reasons which do not generate a **Circulate** event, and that Tk
#      does not use **XCirculateSubwindows()** internally.
#
#      This event type is included only for completeness; there is no reliable way to track changes to a window's position in
#      the stacking order.
#
#   **Key**, **KeyRelease**:
#      The **Key** and **KeyRelease** events are generated whenever a key is pressed or released.
#      **Key** and **KeyRelease** events are sent to the window which currently has the keyboard focus.
#
#   **KeyPress**, **KeyRelease**:
#      The **KeyPress** and **KeyRelease** events are generated whenever a key is pressed or released.
#      **KeyPress** and **KeyRelease** events are sent to the window which currently has the keyboard focus.
#
#   **Map**, **Unmap**:
#      The **Map** and **Unmap** events are generated whenever the mapping state of a window changes.
#
#      Windows are created in the unmapped state.
#      Toplevel windows become mapped when they transition to the *normal* state, and are unmapped in the *withdrawn*
#      and *iconic* states.
#      Other windows become mapped when they are placed under control of a geometry manager (for example
#      **[pack](/wiki/commands/pack.md)** or **[grid](/wiki/commands/grid.md)**).
#
#      A window is *viewable* only if it and all of its ancestors are mapped. Note that geometry managers typically do not map
#      their children until they have been mapped themselves, and unmap all children when they become unmapped;
#      hence in Tk **Map** and **Unmap** events indicate whether or not a window is viewable.
#
#   **MapRequest**, **CirculateRequest**, **ResizeRequest**, **ConfigureRequest**, **Create**:
#      These events are not normally delivered to Tk applications.
#      They are included for completeness, to make it possible to write X11 window managers in Tk.
#
#      These events are only delivered when a client has selected **SubstructureRedirectMask** on a window;
#      the Tk core does not use this mask.
#
#   **MouseWheel**:
#      Many contemporary mice support a mouse wheel, which is used for scrolling documents without using the scrollbars.
#
#      By rolling the wheel, the system will generate **MouseWheel** events that the application can use to scroll.
#      The event is routed to the window currently under the mouse pointer.
#
#      When the event is received you can use the **%D** substitution to get the delta field for the event, which is an
#      integer value describing how the mouse wheel has moved.
#      The smallest value for which the system will report is defined by the OS.
#      The sign of the value determines which direction your widget should scroll.
#      Positive values should scroll up and negative values should scroll down.
#
#      Horizontal scrolling can be emulated by holding the shift key and scrolling vertically (**Shift-MouseWheel** events),
#      with positive **%D** delta substitution indicating left scrolling and negative right scrolling.
#      Horizontal scrolling events may fire from many different hardware units such as tilt wheels or touchpads.
#
#   **Property**:
#      A **Property** event is sent to a window whenever an X property belonging to that window is changed or deleted.
#      **Property** events are not normally delivered to Tk applications as they are handled by the Tk core.
#
#   **Visibility**:
#      A window is said to be obscured when another window above it in the stacking order fully or partially overlaps it.
#      **Visibility** events are generated whenever a window's obscurity state changes; the state field (**%s**) specifies the new state.
#
###### EVENT DETAILS
#
# The last part of a long event specification is *detail*.
# In the case of a **Button** or **ButtonRelease** event, it is the number of a button (from 1 trough 9 for Tcl 9.0,
# from 1 trough 5 for Tcl 8.6).
# If a button number is given, then only an event on that particular button will match.
# If no button number is given, then an event on any button will match.
#
# Giving a specific button number is different than specifying a button modifier; in the first case, it refers to a button being pressed
# or released, while in the second it refers to some other button that is already depressed when the matching event occurs.
# If a button number is given then type may be omitted: if will default to **Button**.
# For example, the specifier *<1>* is equivalent to *<Button-1>*.
#
# If the event type is **Key** or **KeyRelease**, then *detail* may be specified in the form of an X keysym.
# Keysyms are textual specifications for particular keys on the keyboard; they include all the alphanumeric ASCII characters
# (e.g. "a" is the keysym for the ASCII character "a"), plus descriptions for non-alphanumeric characters
# (e.g. "comma" is the keysym for the comma character), plus descriptions for all the non-ASCII keys on the keyboard
# (e.g. "Shift_L" is the keysym for the left shift key, and "F1" is the keysym for the F1 function key, if it exists).
#
# The complete list of keysyms is not presented here; it is available in other X documentation and may vary from system to system.
# If necessary, you can use the **%K** notation described below to print out the keysym name for a particular key.
# If a keysym detail is given, then the type field may be omitted; it will default to **Key**.
# For example, *<Control-comma>* is equivalent to *<Control-Key-comma>*.
#
#### BINDING SCRIPTS AND SUBSTITUTIONS
#
# The *action* argument to bind is a Tcl script, called 'binding action', which will be executed whenever the given event sequence occurs.
# Command will be executed in the same interpreter that the bind command was executed in, and it will run at global level
# (only global variables will be accessible).
#
# If *action* contains any **%** characters, then the *action* will not be executed directly.
# Instead, a new *action* will be generated by replacing each **%**, and the character following it, with information from the current event.
#
# The replacement depends on the character following the **%**, as defined in the list below.
# Unless otherwise indicated, the replacement string is the decimal value of the given field from the current event.
# Some of the substitutions are only valid for certain types of events; if they are used for other types of events the value
# substituted is undefined.
#
#   **%%**:
#      Replaced with a single percent.
#
#   **%#**:
#      The number of the last client request processed by the server (the serial field from the event).
#      Valid for all event types.
#
#   **%a**:
#      The above field from the event, formatted as a hexadecimal number.
#      Indicates the sibling window immediately below the receiving window in the stacking order,
#      or **0** if the receiving window is at the bottom.
#      Valid only for **Configure** events.
#
#   **%b**:
#       The number of the button that was pressed or released.
#       Valid only for **Button** and **ButtonRelease** events.
#
#   **%c**:
#      The count field from the event.
#      Indicates that there are count pending **Expose** events which have not yet been delivered to the window.
#      Valid only for **Expose** events.
#
#   **%d**:
#      The detail or user_data field from the event.
#      The **%d** is replaced by a string identifying the detail.
#
#      For **Enter**, **Leave**, **FocusIn** and **FocusOut** events, the string will be one of the following:
#
#         *NotifyAncestor*     *NotifyNonlinearVirtual*
#         *NotifyDetailNone*   *NotifyPointer*
#         *NotifyInferior*     *NotifyPointerRoot*
#         *NotifyNonlinear*    *NotifyVirtual*
#
#      For **ConfigureRequest** events, the string will be one of:
#
#         *Above*      *None*
#         *Below*      *Opposite*
#         *BottomIf*   *TopIf*
#
#      For virtual events, the string will be whatever value is stored in the *user_data* field when the event was created
#      (typically with '**[event](/wiki/commands/event.md)** *generate*'), or the empty string if the field is NULL.
#
#      Virtual events corresponding to key sequence presses (see '**[event](/wiki/commands/event.md)** *add*' for details)
#      set the *user_data* to NULL. For events other than these, the substituted string is undefined.
#
#   **%f**:
#      The focus field from the event.
#      **1** if the receiving window is the focus window or a descendant of the focus window, **0** otherwise.
#      Valid only for **Enter** and **Leave** events.
#
#   **%h**:
#      The height field from the event.
#      Indicates the new or requested height of the window.
#      Valid for the **Configure**, **ConfigureRequest**, **Create**, **ResizeRequest** and **Expose** events.
#
#   **%i**:
#      The window field from the event, represented as a hexadecimal integer.
#      Valid for all event types.
#
#   **%k**:
#      The keycode field from the event.
#      Valid only for **Key** and **KeyRelease** events.
#
#   **%m**:
#      The mode field from the event. The substituted string is one of:
#
#         *NotifyNormal*
#         *NotifyGrab*
#         *NotifyUngrab*
#         *NotifyWhileGrabbed*
#
#      Valid only for **Enter**, **FocusIn**, **FocusOut** and **Leave** events.
#
#   **%o**:
#      The override_redirect field from the event.
#      Valid only for **Map**, **Reparent** and **Configure** events.
#
#   **%p**:
#      The place field from the event. The substituted string is one of:
#
#          PlaceOnTop
#          PlaceOnBottom
#
#      Valid only for **Circulate** and **CirculateRequest** events.
#
#   **%s**:
#      The state field from the event.
#      For **Button**, **ButtonRelease**, **Enter**, **Key**, **KeyRelease**, **Leave** and **Motion** events,
#      a decimal string is substituted.
#      For **Property** events, the substituted string is one of:
#
#          NewValue --> indicating that the property has been created or modified
#          Delete   --> indicating that the property has been removed.
#
#      For **Visibility** events, the substituted string is one of:
#
#         VisibilityUnobscured
#         VisibilityPartiallyObscured
#         VisibilityFullyObscured
#
#   **%t**:
#      The time field from the event.
#      This is the X server timestamp (typically the time since the last server reset) in milliseconds, when the event occurred.
#      Valid for most events.
#
#   **%w**:
#      The width field from the event.
#      Indicates the new or requested width of the window.
#      Valid only for **Configure**, **ConfigureRequest**, **Create**, **ResizeRequest** and **Expose** events.
#
#   **%x**, **%y**:
#      The *x* and *y* fields from the event.
#      For **Button**, **ButtonRelease**, **Motion**, **Key**, **KeyRelease** and **MouseWheel** events,
#      **%x** and **%y** indicate the position of the mouse pointer relative to the receiving window.
#      For **Key** events on the Macintosh these are the coordinates of the mouse at the moment when an X11 KeyEvent is sent to Tk,
#      which could be slightly later than the time of the physical press or release.
#      For **Enter** and **Leave** events, the position where the mouse pointer crossed the window, relative to the receiving window.
#      For **Configure** and **Create** requests, the x and y coordinates of the window relative to its parent window.
#
#   **%A**:
#      Substitutes the UNICODE character corresponding to the event, or the empty string if the event does not correspond
#      to a UNICODE character (e.g. the shift key was pressed).
#      On X11, **XmbLookupString** (or **XLookupString** when input method support is turned off) does all the work of
#      translating from the event to a UNICODE character.
#      On X11, valid only for **Key** event.
#      On Windows and macOS/aqua, valid only for **Key** and **KeyRelease** events.
#
#   **%B**:
#      The border_width field from the event.
#      Valid only for **Configure**, **ConfigureRequest** and **Create** events.
#
#   **%D**:
#      This reports the delta value of a **MouseWheel** event.
#      The delta value represents the rotation units the mouse wheel has been moved.
#      The sign of the value represents the direction the mouse wheel was scrolled.
#
#      On Tcl 8.6 in an X11 environment the **MouseWheel** event is substituted by **Button-4** and **Button-5**.
#
#   **%E**:
#      The send_event field from the event.
#      **0** indicates that this is a "normal" event.
#      **1** indicates that it is a "synthetic" event generated by **SendEvent**.
#      Valid for all event types.
#
#   **%K**:
#      The keysym corresponding to the event, substituted as a textual string.
#      Valid only for **Key** and **KeyRelease** events.
#
#   **%M**:
#       The number of script-based binding patterns matched so far for the event.
#       Valid for all event types.
#
#   **%N**:
#      The keysym corresponding to the event, substituted as a decimal number.
#      Valid only for **Key** and **KeyRelease** events.
#
#   **%P**:
#      The name of the property being updated or deleted (which may be converted to an XAtom using
#      '**[winfo](/wiki/commands/winfo.md)** *atom*').
#      Valid only for **Property** events.
#
#   **%R**:
#      The root window identifier from the event.
#      Valid only for events containing a root field.
#
#   **%S**:
#      The subwindow window identifier from the event, formatted as a hexadecimal number.
#      Valid only for events containing a subwindow field.
#
#   **%T**:
#      The type field from the event.
#      Valid for all event types.
#
#   **%W**:
#      The path name of the window (always as a real address) to which the event was reported (the window field from the event).
#      Valid for all event types.
#
#   **%X**, **%Y**:
#      The *x-root* and *y-root* fields from the event.
#      If a virtual-root window manager is being used then the substituted values are the corresponding x-coordinate
#      and y-coordinate in the virtual root.
#      Same meaning as **%x** and **%y**, except relative to the (virtual) root window.
#      Valid only for **Button**, **ButtonRelease**, **Enter**, **Key**, **KeyRelease**, **Leave** and **Motion** events.
#
# The replacement string for a %-replacement is formatted as a proper Tcl list element.
# This means that spaces or special characters such as "$" and "{" may be preceded by backslashes.
# This guarantees that the string will be passed through the Tcl parser when the binding action is evaluated.
#
# Most replacements are numbers or well-defined strings such as **Above**; for these replacements no special formatting is ever necessary.
# The most common case where reformatting occurs is for the **%A** substitution.
# For example, if *action* is
#
#   insert %A
#
# and the character typed is an open square bracket, then the action actually executed will be
#
#   insert \[
#
# This will cause the insert to receive the original replacement string (open square bracket) as its first argument.
# If the extra backslash had not been added, Tcl would not have been able to parse the action correctly.
#
#### MULTIPLE MATCHES
#
# It is possible for several bindings to match a given X event.
# If the bindings are associated with different tag's, then each of the bindings will be executed, in order.
# By default, a binding for the widget will be executed first, followed by a class binding, a binding for its toplevel, and an all binding.
# The **[bindtags](/wiki/commands/bindtags.md)** command may be used to change this order for a particular window or to associate
# additional binding tags with the window.
#
# If **continue** is invoked within a binding action, then this binding action, including all other "**+**" or "**-**" appended actions,
# is terminated but Tk will continue processing binding actions associated with other tag's.
#
# If the **break** command is invoked within a binding action, then that action terminates and no other actions will be invoked
# for the event.
#
# Within a action called from the binding action, '**[return](https://www.tcl.tk/man/tcl9.0/TclCmd/return.html)** *-code ok*' may be used
# to continue processing (including "**+**" or "**-**" appended actions), or '**[return](https://www.tcl.tk/man/tcl9.0/TclCmd/return.html)** *-code break*'
# may be used to stop processing all other binding actions.
#
# If more than one binding matches a particular event and they have the same tag, then the most specific binding is chosen and
# its action is evaluated.
# The following tests are applied, in order, to determine which of several matching sequences is more specific:
#
#   1. An event pattern that specifies a specific button or key is more specific than one that does not.
#   2. A sequence with the most highest-ordered patterns (in term of highest repetition count) is more specific than a
#      sequence with less highest-ordered patterns.
#   3. If the modifiers specified in one pattern are a subset of the modifiers in another pattern, then the pattern with
#      more modifiers is more specific.
#   4. A virtual event whose physical pattern matches the sequence is less specific than the same physical pattern that
#      is not associated with a virtual event.
#   5. Given a sequence that matches two or more virtual events, one of the virtual events will be chosen, but the order is undefined.
#
# If the matching sequences contain more than one event, then tests 3, 4 and 5 are applied in order from the most recent event
# to the least recent event in the sequences.
# If these tests fail to determine a winner, then the most recently registered sequence is the winner.
#
# If there are two (or more) virtual events that are both triggered by the same sequence, and both of those virtual events are bound
# to the same window tag, then only one of the virtual events will be triggered, and it will be picked at random:
#
#   event add  <<Paste>>  <Control-y>
#   event add  <<Paste>>  <Button-2>
#   event add  <<Scroll>> <Button-2>
#
#   bind Entry <<Paste>>  {chan puts Paste}
#   bind Entry <<Scroll>> {chan puts Scroll}
#
# If the user presses both the "Control" and "y" keys, the *<<Paste>>* binding will be invoked, but if the user presses
# "button 2" then one of either the *<<Paste>>* or the *<<Scroll>>* bindings will be invoked, but exactly which one gets
# invoked is undefined.
#
# If an X event does not match any of the existing bindings, then the event is ignored.
# An unbound event is not considered to be an error.
#
#### MULTI-EVENT SEQUENCES AND IGNORED EVENTS
#
# When a *sequence* specified in a bind command contains more than one event pattern, then its *action* is executed whenever
# the recent events (leading up to and including the current event) match the given sequence.
# This means, for example, that if "button 1" is clicked repeatedly the sequence *<Double-Button-1>* will match each
# button press but the first.
#
# If extraneous events that would prevent a match occur in the middle of an event sequence then the extraneous events are ignored
# unless they are **Key** or **Button** events.
# For example, *<Double-Button-1>* will match a sequence of presses of "button 1", even though there will be **ButtonRelease** events
# (and possibly **Motion** events) between the **Button** events.
#
# Furthermore, a **Key** event may be preceded by any number of other **Key** events for modifier keys without the
# modifier keys preventing a match.
# For example, the event sequence "aB" will match a press of the "a" key, a release of the "a" key, a press of the shift key,
# and a press of the "b" key: the press of the shift key is ignored because it is a modifier key.
#
# Finally, if several **Motion** events occur in a row, only the last one is used for purposes of matching binding sequences.
#
#### ERRORS
#
# If an error occurs in executing the action for a binding then the bgerror mechanism is used to report the error.
# The bgerror command will be executed at global level (outside the context of any Tcl procedure).
#
#### EXAMPLES
#
#   bind .f                             --> Returns every bindings sequence upon the tag (.f) provided.
#   bind .f <FocusIn>                   --> Returns every bindings actions upon the tag (.f), for the sequence (<FocusIn>) provided.
#   bind .f <FocusIn> {}                --> Removes every binding ever applied for the tag (.f) and sequence (<FocusIn>) provided.
#
#   bind .f <FocusIn> [list  MyProc %W] --> Removes every binding ever applied for the tag (.f) and sequence (<FocusIn>) provided,
#                                           and applies a new binding for the tag (.f), sequence (<FocusIn>)
#                                           and action ([list MyProc %W]) provided.
#   bind .f <FocusIn> [list -MyProc %W] --> Removes the binding previously applied for the tag (.f), sequence (<FocusIn>)
#                                           and action ([list MyProc %W]) provided.
#                                           If the binding is not found, then this command will be ignored.
#   bind .f <FocusIn> [list +MyProc %W] --> Appends a new binding with the tag (.f), sequence (<FocusIn>)
#                                           and action ([list MyProc %W]) provided, to whatever binding that allready exists
#                                           for the tag (.f) and sequence (<FocusIn>) provided.
package provide ::ms::bind 0.1

# Create the mustang **bind** package.
namespace eval ::ms::bind {}

# Rename the original Tk **bind** command.
rename bind _bind

# Create an alias for the mustang **bind** command.
interp alias {} bind {} ::ms::bind::Command

## Command
#
# Replace the Tk **bind** command.
#
# Where:
#
# args   Should be the arguments of the **bind** command.
#
# Depending on the number of arguments provided, the return value/s may vary.
proc ::ms::bind::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **bind** *tag*
    # **bind** *tag* *sequence*
    # **bind** *tag* *sequence*  {}
    # **bind** *tag* *sequence*  *action*
    # **bind** *tag* *sequence* -*action*
    # **bind** *tag* *sequence* +*action*

    set tags [list ]
    switch -- [llength $args] {
        1   {
            # Synopsis:
            #
            # **bind** *tag*
            set tag $args

            # Check if the 'tag' provided is a valid class.
            if { $tag in $::ms::data(classes) } {
                # 'tag' is a class.

                # Append to 'tags' all the meaningful object for each address with class 'tag'.
                set tags [list ]
                foreach w $::ms::class($tag,addrs) {
                    if { $w eq $::ms::addr($w,widget) } {
                        # Append to 'tags' the address 'w'.
                        lappend tags $w
                    } else {
                        # Append to 'tags' the address 'w' and the meaningful object for 'w'.
                        lappend tags $w $::ms::addr($w,widget)
                    }
                }
            } else {
                # Check if 'tag' is a valid address or an actual tag.
                switch -- [string index $tag 0] {
                    "." {
                        set result [::ms::Check_Pathname $tag invalid]
                        switch -- $result {
                            invalid {
                                # 'tag' could be an actual tag.
                                set tags [list $tag]
                            }
                            default {
                                # 'tag' is a valid address.
                                set tags [list [lindex $result 0]]
                            }
                        }
                    }
                    default {
                        # 'tag' could be an actual tag.
                        set tags [list $tag]
                    }
                }
            }

            # Execute the command.
            foreach w $tags {
                try {
                    _bind $w
                } on error {} {
                    return ""
                } on ok { data } {
                    lappend result [split $data \n]
                }
            }

            # Remove any doubles.
            return [lsort -dictionary -increasing -unique $result]
        }
        2   {
            # Synopsis:
            #
            # **bind** *tag* *sequence*
            set tag      [lindex $args 0]
            set sequence [lindex $args 1]

            # Check if the 'tag' provided is a valid class.
            if { $tag in $::ms::data(classes) } {
                # 'tag' is a class.

                # Check the 'sequence' provided.
                switch -glob -- $sequence {
                    "<*B*>"              -
                    "<*Button-*>"        -
                    "<*ButtonPress-*>"   -
                    "<*ButtonRelease-*>" -
                    "<Enter>"            -
                    "<Leave>"            -
                    "<FocusIn>"          -
                    "<FocusOut>"         -
                    "<*Key*>"            -
                    "<*MouseWheel*>"     -
                    "<*TouchpadScroll>"  {
                        # Append to 'tags' all the meaningful object for each address with class 'tag'.
                        set tags [list ]
                        foreach w $::ms::class($tag,addrs) {
                            lappend tags $::ms::addr($w,widget)
                        }
                    }
                    default {
                        # Append to 'tags' all the containers objects of each address with class 'tag'.
                        set tags $::ms::class($tag,addrs)
                    }
                }
            } else {
                # Check if 'tag' is a valid address or an actual tag.
                switch -- [string index $tag 0] {
                    "." {
                        set result [::ms::Check_Pathname $tag invalid]
                        switch -- $result {
                            invalid {
                                # 'tag' could be an actual tag.
                                set tags [list $tag]
                            }
                            default {
                                # 'tag' is a valid address.
                                set w [lindex $result 0]

                                # Check the 'sequence' provided.
                                switch -glob -- $sequence {
                                    "<*B*>"              -
                                    "<*Button-*>"        -
                                    "<*ButtonPress-*>"   -
                                    "<*ButtonRelease-*>" -
                                    "<Enter>"            -
                                    "<Leave>"            -
                                    "<FocusIn>"          -
                                    "<FocusOut>"         -
                                    "<*Key*>"            -
                                    "<*MouseWheel*>"     -
                                    "<*TouchpadScroll>"  {
                                        # Set 'tags' with the meaningful object for 'w' instead of 'w'.
                                        set tags [list $::ms::addr($w,widget)]
                                    }
                                    default {
                                        # Set 'tags' with 'w'.
                                        set tags [list $w]
                                     }
                                }
                            }
                        }
                    }
                    default {
                        # 'tag' could be an actual tag.
                        set tags [list $tag]
                    }
                }
            }

            # Execute the command.
            foreach w $tags {
                try {
                    _bind $w $sequence
                } on error {} {
                    continue
                } on ok { data } {
                    lappend result [split $data \n]
                }
            }

            return [lsort -increasing -dictionary -unique $result]
        }
        3   {
            # Synopsis:
            #
            # **bind** *tag* *sequence*  {}
            # **bind** *tag* *sequence*  *action*
            # **bind** *tag* *sequence* +*action*
            # **bind** *tag* *sequence* -*action*
            set tag      [lindex $args 0]
            set sequence [lindex $args 1]
            set action   [lindex $args 2]

            # Check if the 'tag' provided is a valid class.
            if { $tag in $::ms::data(classes) } {
                # 'tag' is a class.

                # Check the 'sequence' provided.
                switch -glob -- $sequence {
                    "<*B*>"              -
                    "<*Button-*>"        -
                    "<*ButtonPress-*>"   -
                    "<*ButtonRelease-*>" -
                    "<Enter>"            -
                    "<Leave>"            -
                    "<FocusIn>"          -
                    "<FocusOut>"         -
                    "<*Key*>"            -
                    "<*MouseWheel*>"     -
                    "<*TouchpadScroll>"  {
                        # Append to 'tags' all the meaningful object for each address with class 'tag'.
                        set tags [list ]
                        foreach w $::ms::class($tag,addrs) {
                            lappend tags $::ms::addr($w,widget)
                        }
                    }
                    default {
                        # Append to 'tags' all the containers objects of each address with class 'tag'.
                        set tags $::ms::class($tag,addrs)
                    }
                }
            } else {
                # Check if 'tag' is a valid address or an actual tag.
                switch -- [string index $tag 0] {
                    "." {
                        set result [::ms::Check_Pathname $tag invalid]
                        switch -- $result {
                            invalid {
                                # 'tag' could be an actual tag.
                                set tags [list $tag]
                            }
                            default {
                                # 'tag' is a valid address.
                                set w [lindex $result 0]

                                # Check the 'sequence' provided.
                                switch -glob -- $sequence {
                                    "<*B*>"              -
                                    "<*Button-*>"        -
                                    "<*ButtonPress-*>"   -
                                    "<*ButtonRelease-*>" -
                                    "<Enter>"            -
                                    "<Leave>"            -
                                    "<FocusIn>"          -
                                    "<FocusOut>"         -
                                    "<*Key*>"            -
                                    "<*MouseWheel*>"     -
                                    "<*TouchpadScroll>"  {
                                        # Set 'tags' with the meaningful object for 'w' instead of 'w'.
                                        set tags [list $::ms::addr($w,widget)]
                                    }
                                    default {
                                        # Set 'tags' with 'w'.
                                        set tags [list $w]
                                    }
                                }
                            }
                        }
                    }
                    default {
                        # 'tag' could be an actual tag.
                        set tags [list $tag]
                    }
                }
            }

            # Check the 'action' provided.
            switch -- [string index $action 0] {
                -   {
                    # Synopsis:
                    #
                    # **bind** *tag* *sequence* -*action*

                    # Set the action to remove (i.e. the provided action without the minus sign).
                    set action_to_remove [string range $action 1 end]

                    # For each address in 'tags':
                    #
                    #   - We retrieve all the bindings for the address 'w' and sequence 'sequence' and we put the result
                    #     in a list called 'actions_currently_implemented'.
                    #   - We create a new list called 'action_to_reimplement', with all the actions retrieved (in the same order)
                    #     except the action that needs to be removed.
                    #   - We remove all the bindings for the address 'w' and sequence 'sequence'.
                    #   - We recreate all the bindings for the address 'w' for the sequence 'sequence' that needs to be reimplemented, if any.
                    foreach w $tags {
                        # Retrieve all the bindings for the address 'w' and sequence 'sequence'.
                        try {
                            _bind $w $sequence
                        } on error {} {
                            continue
                        } on ok { result } {
                            # Split the result so that each 'actions_currently_implemented' element will correspond to an 'action'.
                            set actions_currently_implemented [split $result \n]

                            # Check each element (i.e. action) of the 'actions_currently_implemented' list.
                            set actions_to_reimplement [list ]
                            foreach action $actions_currently_implemented {
                                # Check if the action examined is the action to be removed or not.
                                if { $action ne $action_to_remove } {
                                    # We found an action that is not the one to be removed.
                                    lappend actions_to_reimplement $action
                                }
                            }

                            # Remove any binding previously setted for the address 'w' and sequence 'sequence'.
                            _bind $w $sequence {}

                            # Recreate all the bindings for the address 'w' and sequence 'sequence' that needs to be reimplemented, if any.
                            foreach action $actions_to_reimplement {
                                set action [string cat "+" $action]

                                try {
                                    _bind $w $sequence $action
                                } on error {} {
                                    continue
                                }
                            }
                        }
                    }

                    return ""
                }
                default {
                    # Synopsis:
                    #
                    # **bind** *tag* *sequence*  {}
                    # **bind** *tag* *sequence*  *action*
                    # **bind** *tag* *sequence* +*action*
                    foreach w $tags {
                        try {
                            _bind $w $sequence $action
                        } on error {} {
                            continue
                        }
                    }

                    return ""
                }
            }
        }
        default { ::ms::Error "Invalid number of arguments." $caller_info }
    }
}

#*EOF*