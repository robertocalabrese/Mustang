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

## wm - Communicate with the window manager
#
#### SYNOPSIS
#
# **wm** **aspect** *window* ?*minNumer* *minDenom* *maxNumer* *maxDenom*?
# **wm** **attributes** *window*
# **wm** **attributes** *window* ?*option*?
# **wm** **attributes** *window* ?*option* *value*? ... ?*option* *value*?
# **wm** **client** *window* ?*name*?
# **wm** **colormapwindows** *window* ?*windowList*?
# **wm** **command** *window* ?*value*?
# **wm** **deiconify** *window*
# **wm** **focusmodel** *window* ?**active**|**passive**?
# **wm** **forget** *window*
# **wm** **frame** *window*
# **wm** **geometry** *window* ?*newGeometry*?
# **wm** **grid** *window* ?*baseWidth* *baseHeight* *widthInc* *heightInc*?
# **wm** **group** *window* ?*pathname*?
# **wm** **iconbitmap** *window* ?*bitmap*?
# **wm** **iconbitmap** *window* ?**-default**? ?*image*?
# **wm** **iconify** *window*
# **wm** **iconmask** *window* ?*bitmap*?
# **wm** **iconname** *window* ?*newName*?
# **wm** **iconphoto** *window* ?**-default**? *image1* ?*image2*? ... ?*imageN*? ?
# **wm** **iconposition** *window* ?*x* *y*?
# **wm** **iconwindow** *window* ?*pathname*?
# **wm** **manage** *window*
# **wm** **maxsize** *window* ?*width* *height*?
# **wm** **minsize** *window* ?*width* *height*?
# **wm** **overrideredirect** *window* ?*boolean*?
# **wm** **positionfrom** *window* ?*who*?
# **wm** **protocol** *window* ?*name*? ?*command*?
# **wm** **resizable** *window* ?*width* *height*?
# **wm** **sizefrom** *window* ?*who*?
# **wm** **stackorder** *window* ?**isabove**|**isbelow** *window*?
# **wm** **state** *window* ?*newstate*?
# **wm** **title** *window* ?*string*?
# **wm** **transient** *window* ?*container*?
# **wm** **withdraw** *window*
#
# Note: Each *window* pathname involved may be provided either as a short or as a real address.
#       *Action*s that gives as a result a window pathname (or more than one), will always return the address as:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
#### DESCRIPTION
#
# The **wm** command is used to interact with window managers in order to control such things as the title for a window,
# its geometry, or the increments in terms of which it may be resized.
# The *wm* command can have any of several forms, depending on the *action* argument.
# The *action* argument is always the first argument after the command itself.
# All of the forms expect at least one additional argument, *window*, which must be the pathname of a top-level window.
# The legal forms are:
#
#   **wm** **aspect** *window* ?*minNumer* *minDenom* *maxNumer* *maxDenom*?
#      If *minNumer*, *minDenom*, *maxNumer*, and *maxDenom* are all specified, then they will be passed to the window manager
#      and the window manager should use them to enforce a range of acceptable aspect ratios for *window*.
#
#      The aspect ratio of window (width/length) will be constrained to lie between *minNumer*/*minDenom* and *maxNumer*/*maxDenom*.
#
#      If *minNumer* etc. are all specified as empty strings, then any existing aspect ratio restrictions are removed.
#
#      If *minNumer* etc. are specified, then the command returns an empty string.
#
#      Otherwise, it returns a Tcl list containing four elements, which are the current values of *minNumer*, *minDenom*, *maxNumer*,
#      and *maxDenom* (if no aspect restrictions are in effect, then an empty string is returned).
#
#   **wm** **attributes** *window*
#   **wm** **attributes** *window* ?*option*?
#   **wm** **attributes** *window* ?*option* *value*? ... ?*option* *value*?
#      This subcommand returns or sets platform specific attributes associated with *window*.
#
#      The first form returns a list of the platform specific flags and their values.
#      The second form returns the value for the specific option.
#      The third form sets one or more of the values.
#
#      The values are as follows:
#
#         All platforms support the following attributes (though X11 users should see the notes below):
#
#            **-alpha**
#               Specifies the alpha transparency level of the toplevel.
#               It accepts a value from **0.0** (fully transparent) to **1.0** (opaque).
#               Values outside that range will be constrained.
#               Where not supported, the **-alpha** value remains at **1.0**.
#
#            **-fullscreen**
#               Places the window in a mode that takes up the entire screen, has no borders, and covers
#               the general use area (i.e. Start menu and taskbar on Windows, dock and menubar on OSX, general window decorations on X11).
#
#            **-topmost**
#               Specifies whether this is a topmost window (displays above all other windows).
#
#         On Windows, the following attributes may be set.
#
#            **-disabled**
#               Specifies whether the window is in a disabled state.
#
#            **-toolwindow**
#               Specifies a toolwindow style window (as defined in the MSDN).
#
#            **-transparentcolor**
#               Specifies the transparent color index of the toplevel.
#
#               It takes any color value accepted by [Tk_GetColor](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetColor.html).
#               If the empty string is specified (default), no transparent color is used.
#
#               This is supported on Windows 2000/XP+. Where not supported, the **-transparentcolor** value remains at **{}**.
#
#         On Mac OS X, the following attributes may be set.
#
#            **-appearance**
#               Specifies whether the window is rendered in "dark mode". Allowed values are **auto**, **aqua** and **darkaqua**.
#               If the setting is auto then the appearance of the window is controlled by the System Settings.
#
#            **-class**
#               Specifies whether the underlying Aqua window for a toplevel is an object of the NSWindow class or the NSPanel class.
#               The two allowed values for this option are **nswindow** and **nspanel**.
#
#               It is not possible to change the class of the underlying Aqua window once that window has been instantiated,
#               and attempting to do that is an error.
#               However it is allowed to set this option for a pathname that does not correspond to an existing window.
#               Doing that causes the class name to be cached for later use.
#
#               When a toplevel with that pathname is eventually created, the cached class name will determine which class is used
#               for the underlying Aqua window.
#
#            **-isdark**
#               Returns a boolean value which is true if the window is currently in dark mode.
#
#            **-modified**
#               Specifies the modification state of the window (determines whether the window close widget
#               contains the modification indicator and whether the proxy icon is draggable).
#
#            **-notify**
#               Specifies process notification state (bouncing of the application dock icon).
#
#            **-stylemask**
#               Specifies an integer to be assigned as the styleMask of the underlying Aqua window.
#               See the Apple documentation for styleMask property of the NSWindow class.
#
#               The value of this option should be a list of bitnames.
#               Each bit named in the list will be set to **1**, and all other bits will be set to **0**.
#
#               The allowed bitnames are: **titled**, **closable**, **miniaturizable**, **resizable**, **fullsizecontentview**,
#               **docmodal**, **utility**, **nonactivatingpanel**, and **HUDwindow**.
#
#               Note that a side effect of setting the fullsizecontentview bit is that the window title bar becomes transparent.
#
#            **-tabbingid**
#               Controls how tabbed toplevel windows are grouped together. Two tabs in the same group must correspond to
#               toplevels with the same tabbingid, which can be an arbitrary UTF8 string.
#
#               In the Tk implementation, changing the tabbingid of a toplevel in a tab group will cause it to be moved into
#               a different group, in which all tabs have the new tabbingid or, if the new tabbingid is unique, to become
#               a normal non-tabbed toplevel.
#
#               It is allowed to set the tabbingid before the toplevel is created.
#
#               If the pathname provided in the command does not correspond to a toplevel, the value will be cached and used
#               later when the toplevel is actually created.
#
#            **-tabbingmode**
#               Controls whether a toplevel can be opened as a tab within a tab group.
#
#               The allowed values are **auto**, **preferred** or **disallowed**.
#
#               A toplevel can be opened as a tab in exactly two situations: if its tabbingmode is **preferred**; or if its
#               tabbingmode is **auto** and the user has selected "prefer tabs when opening documents" in the Desktop and Dock panel
#               of the System Settings application.
#
#               It is allowed to set the tabbingmode before the toplevel is created.
#
#               If the pathname provided in the command does not correspond to a toplevel, the value will be cached and used
#               later when the toplevel is actually created.
#
#            **-titlepath**
#               Specifies the path of the file referenced as the window proxy icon (which can be dragged and dropped
#               in lieu of the file's finder icon).
#
#            **-transparent**
#               Makes the window content area transparent and turns off the window shadow.
#               For the transparency to be effective, the toplevel background needs to be set to a color with some alpha,
#               e.g. "systemTransparent".
#
#         On X11, the following attributes may be set.
#         These are not supported by all window managers, and will have no effect under older WMs.
#
#            **-type**
#               Requests that the window should be interpreted by the window manager as being of the specified type(s).
#
#               This may cause the window to be decorated in a different way or otherwise managed differently,
#               though exactly what happens is entirely up to the window manager.
#
#               A list of types may be used, in order of preference.
#
#               The following values are mapped to constants defined in the EWMH specification
#               (using others is possible, but not advised):
#
#                  **desktop**
#                      indicates a desktop feature.
#
#                  **dock**
#                      indicates a dock/panel feature.
#
#                  **toolbar**
#                      indicates a toolbar window that should be acting on behalf of another window,
#                      as indicated with **wm transient**.
#
#                  **menu**
#                      indicates a torn-off menu that should be acting on behalf of another window,
#                      as indicated with **wm transient**.
#
#                  **utility**
#                      indicates a utility window (e.g., palette or toolbox) that should be acting on
#                      behalf of another window, as indicated with **wm transient**.
#
#                  **splash**
#                      indicates a splash screen, displayed during application start up.
#
#                  **dialog**
#                      indicates a general dialog window, that should be acting on behalf of another window,
#                      as indicated with **wm transient**.
#
#                  **dropdown_menu**
#                      indicates a menu summoned from a menu bar, which should usually also be set to be
#                      override-redirected (with **wm overrideredirect**).
#
#                  **popup_menu**
#                      indicates a popup menu, which should usually also be set to be override-redirected
#                      (with **wm overrideredirect**).
#
#                  **tooltip**
#                      indicates a tooltip window, which should usually also be set to be override-redirected
#                      (with **wm overrideredirect**).
#
#                  **notification**
#                      indicates a window that provides a background notification of some event, which should
#                      usually also be set to be override-redirected (with **wm overrideredirect**).
#
#                  **combo**
#                      indicates the drop-down list of a combobox widget, which should usually also be set
#                      to be override-redirected (with **wm overrideredirect**).
#
#                  **dnd**
#                      indicates a window that represents something being dragged, which should usually also
#                      be set to be override-redirected (with **wm overrideredirect**).
#
#                  **normal**
#                      indicates a window that has no special interpretation.
#
#            **-zoomed**
#               Requests that the window should be maximized.
#               This is the same as **wm state zoomed** on Windows and Mac OS X.
#
#            On X11, changes to window attributes are performed asynchronously.
#            Querying the value of an attribute returns the current state, which will not be the same as the value most
#            recently set if the window manager has not yet processed the request or if it does not support the attribute.
#
#   **wm** **client** *window* ?*name*?
#      If *name* is specified, this command stores *name* (which should be the name of the host on which the application
#      is executing) in *window*'s **WM_CLIENT_MACHINE** property for use by the window manager or session manager.
#
#      The command returns an empty string in this case.
#
#      If *name* is not specified, the command returns the last name set in a **wm client** command for *window*.
#      If *name* is specified as an empty string, the command deletes the WM_CLIENT_MACHINE property from *window*.
#
#   **wm** **colormapwindows** *window* ?*windowList*?
#      This command is used to manipulate the **WM_COLORMAP_WINDOWS** property, which provides information to the
#      window managers about windows that have private colormaps.
#
#      If *windowList* is not specified, the command returns a list whose elements are the names of the windows in
#      the WM_COLORMAP_WINDOWS property.
#
#      If *windowList* is specified, it consists of a list of window pathnames; the command overwrites the
#      **WM_COLORMAP_WINDOWS** property with the given windows and returns an empty string.
#
#      The **WM_COLORMAP_WINDOWS** property should normally contain a list of the internal windows within *window*
#      whose colormaps differ from their parents.
#
#      The order of the windows in the property indicates a priority order: the window manager will attempt to
#      install as many colormaps as possible from the head of this list when window gets the colormap focus.
#
#      If *window* is not included among the windows in *windowList*, Tk implicitly adds it at the end of
#      the **WM_COLORMAP_WINDOWS** property, so that its colormap is lowest in priority.
#
#      If **wm colormapwindows** is not invoked, Tk will automatically set the property for each top-level window
#      to all the internal windows whose colormaps differ from their parents, followed by the top-level itself;
#      the order of the internal windows is undefined.
#
#      See the ICCCM documentation for more information on the **WM_COLORMAP_WINDOWS** property.
#
#   **wm** **command** *window* ?*value*?
#      If *value* is specified, this command stores value in *window*'s **WM_COMMAND** property for use
#      by the window manager or session manager and returns an empty string.
#
#      *Value* must have proper list structure; the elements should contain the words of the command used
#      to invoke the application.
#      If *value* is not specified then the command returns the last value set in a **wm command** command for *window*.
#      If *value* is specified as an empty string, the command deletes the **WM_COMMAND** property from *window*.
#
#   **wm** **deiconify** *window*
#      Arrange for *window* to be displayed in normal (non-iconified) form. This is done by mapping the window.
#
#      If the window has never been mapped then this command will not map the window, but it will ensure that
#      when the window is first mapped it will be displayed in de-iconified form.
#
#      On Windows, a deiconified window will also be raised and be given the focus (made the active window).
#
#      Returns an empty string.
#
#   **wm** **focusmodel** *window* ?**active**|**passive**?
#      If **active** or **passive** is supplied as an optional argument to the command, then it specifies the
#      focus model for *window*. In this case the command returns an empty string.
#      If no additional argument is supplied, then the command returns the current focus model for *window*.
#
#      An **active** focus model means that *window* will claim the input focus for itself or its descendants,
#      even at times when the focus is currently in some other application.
#
#      A **passive** focus model means that *window* will never claim the focus for itself: the window manager
#      should give the focus to *window* at appropriate times.
#      However, once the focus has been given to window or one of its descendants, the application may re-assign
#      the focus among *window*'s descendants.
#
#      The focus model defaults to **passive**, and Tk's focus command assumes a passive model of focusing.
#
#   **wm** **forget** *window*
#      *Pathname* will be unmapped from the screen and will no longer be managed by wm.
#      Windows created with the toplevel command will be treated like frame windows once they are no longer
#      managed by wm.
#
#   **wm** **frame** *window*
#      If *window* has been reparented by the window manager into a decorative frame, the command returns
#      the platform specific window identifier for the outermost frame that contains *window* (the window whose
#      parent is the root or virtual root).
#      If *window* has not been reparented by the window manager then the command returns the platform specific
#      window identifier for *window*.
#
#   **wm** **geometry** *window* ?*newGeometry*?
#      If *newGeometry* is specified, then the geometry of *window* is changed and an empty string is returned.
#      Otherwise the current geometry for window is returned (this is the most recent geometry specified either
#      by manual resizing or in a **wm geometry** command).
#
#      *NewGeometry* has the form **=***width***x***height***±***x***±***y*, where any of **=**, *width***x***height*,
#      or **±***x***±***y* may be omitted.
#
#      *Width* and *height* are positive integers specifying the desired dimensions of *window*.
#      If *window* is gridded (see **GRIDDED GEOMETRY MANAGEMENT** below) then the dimensions are specified in
#      grid units; otherwise they are specified in pixel units.
#
#      *X* and *y* specify the desired location of *window* on the screen, in pixels.
#
#      If *x* is preceded by **+**, it specifies the number of pixels between the left edge of the screen and the left
#      edge of *window*'s border; if preceded by **-** then *x* specifies the number of pixels between the right edge of
#      the screen and the right edge of *window*'s border.
#
#      If *y* is preceded by **+** then it specifies the number of pixels between the top of the screen and the top of
#      *window*'s border; if *y* is preceded by **-** then it specifies the number of pixels between the bottom of
#      *window*'s border and the bottom of the screen.
#
#      If *newGeometry* is specified as an empty string then any existing user-specified geometry for *window* is
#      cancelled, and the window will revert to the size requested internally by its widgets.
#
#      Note that this is related to **winfo geometry**, but not the same.
#      That can only query the geometry, and always reflects Tk's current understanding of the actual size and location
#      of *window*, whereas wm geometry allows both setting and querying of the window manager's understanding of the
#      size and location of the *window*.
#      This can vary significantly, for example to reflect the addition of decorative elements to window such as
#      title bars, and window managers are not required to precisely follow the requests made through this command.
#
#   **wm** **grid** *window* ?*baseWidth* *baseHeight* *widthInc* *heightInc*?
#      This command indicates that *window* is to be managed as a gridded window.
#      It also specifies the relationship between grid units and pixel units.
#
#      *BaseWidth* and *baseHeight* specify the number of grid units corresponding to the pixel dimensions requested
#      internally by *window* using [Tk_GeometryRequest](https://www.tcl-lang.org/man/tcl9.0/TkLib/GeomReq.html).
#
#      *WidthInc* and *heightInc* specify the number of pixels in each horizontal and vertical grid unit.
#
#      These four values determine a range of acceptable sizes for *window*, corresponding to grid-based widths
#      and heights that are non-negative integers.
#
#      Tk will pass this information to the window manager; during manual resizing, the window manager will restrict
#      the *window*'s size to one of these acceptable sizes.
#
#      Furthermore, during manual resizing the window manager will display the *window*'s current size in terms of
#      grid units rather than pixels.
#
#      If *baseWidth* etc. are all specified as empty strings, then *window* will no longer be managed as a gridded window.
#      If *baseWidth* etc. are specified then the return value is an empty string.
#
#      Otherwise the return value is a Tcl list containing four elements corresponding to the current *baseWidth*,
#      *baseHeight*, *widthInc*, and *heightInc*; if *window* is not currently gridded, then an empty string is returned.
#
#      Note: This command should not be needed very often, since the [Tk_SetGrid](https://www.tcl-lang.org/man/tcl9.0/TkLib/SetGrid.html)
#            library procedure and the **setGrid** option provide easier access to the same functionality.
#
#   **wm** **group** *window* ?*pathname*?
#      If *pathname* is specified, it gives the pathname for the leader of a group of related windows.
#
#      The window manager may use this information, for example, to unmap all of the windows in a group when the
#      group's leader is iconified.
#
#      *Pathname* may be specified as an empty string to remove *window* from any group association.
#      If *pathname* is specified then the command returns an empty string; otherwise it returns the pathname of
#      *window*'s current group leader, or an empty string if *window* is not part of any group.
#
#   **wm** **iconbitmap** *window* ?*bitmap*?
#      If *bitmap* is specified, then it names a bitmap in the standard forms accepted by Tk (see the [Tk_GetBitmap](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetBitmap.html)
#      manual entry for details).
#
#      This bitmap is passed to the window manager to be displayed in *window*'s icon, and the command returns an empty string.
#      If an empty string is specified for *bitmap*, then any current icon bitmap is cancelled for *window*.
#      If bitmap is specified then the command returns an empty string.
#      Otherwise it returns the name of the current icon bitmap associated with *window*, or an empty string if *window*
#      has no icon bitmap. On the Windows operating system, an additional flag is supported:
#
#         **wm** **iconbitmap** *window* ?**-default**? ?*image*?
#            If the **-default** flag is given, the icon is applied to all toplevel windows (existing and future) to which
#            no other specific icon has yet been applied.
#
#            In addition to bitmap image types, a full path specification to any file which contains a valid Windows icon
#            is also accepted (usually .ico or .icr files), or any file for which the shell has assigned an icon.
#
#            Tcl will first test if the file contains an icon, then if it has an assigned icon, and finally, if that fails,
#            test for a bitmap.
#
#   **wm** **iconify** *window*
#      Arrange for *window* to be iconified.
#      It *window* has not yet been mapped for the first time, this command will arrange for it to appear in the iconified
#      state when it is eventually mapped.
#
#   **wm** **iconmask** *window* ?*bitmap*?
#      If *bitmap* is specified, then it names a bitmap in the standard forms accepted by Tk (see the [Tk_GetBitmap](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetBitmap.html)
#      manual entry for details).
#
#      This bitmap is passed to the window manager to be used as a mask in conjunction with the iconbitmap option: where
#      the mask has zeroes no icon will be displayed; where it has ones, the bits from the icon bitmap will be displayed.
#
#      If an empty string is specified for *bitmap* then any current icon mask is cancelled for *window* (this is equivalent
#      to specifying a bitmap of all ones).
#      If bitmap is specified then the command returns an empty string.
#      Otherwise it returns the name of the current icon mask associated with *window*, or an empty string if no mask is in effect.
#
#   **wm** **iconname** *window* ?*newName*?
#      If *newName* is specified, then it is passed to the window manager; the window manager should display *newName*
#      inside the icon associated with *window*.
#      In this case an empty string is returned as result.
#
#      If *newName* is not specified then the command returns the current icon name for *window*, or an empty string
#      if no icon name has been specified (in this case the window manager will normally display the *window*'s title,
#      as specified with the **wm title** command).
#
#   **wm** **iconphoto** *window* ?*-default*? *image1* ?*image2*? ... ?*imageN*? ?
#      Sets the titlebar icon for *window* based on the named photo images.
#
#      If **-default** is specified, this is applied to all future created toplevels as well.
#
#      The data in the images is taken as a snapshot at the time of invocation.
#      If the images are later changed, this is not reflected to the titlebar icons.
#
#      Multiple images are accepted to allow different images sizes (e.g., 16x16 and 32x32) to be provided.
#      The window manager may scale provided icons to an appropriate size.
#
#      On Windows, the images are packed into a Windows icon structure.
#      This will override an ico specified to **wm iconbitmap**, and vice versa.
#
#      On X, the images are arranged into the **_NET_WM_ICON** X property, which most modern window managers support.
#      A **wm iconbitmap** may exist simultaneously.
#      It is recommended to use not more than 2 icons, placing the larger icon first.
#
#      On Macintosh, the first image called is loaded into an OSX-native icon format, and becomes the application icon
#      in dialogs, the Dock, and other contexts.
#      At the script level the command will accept only the first image passed in the parameters as support for multiple
#      sizes/resolutions on macOS is outside Tk's scope.
#      Developers should use the largest icon they can support (preferably 512 pixels) to ensure smooth rendering on the Mac.
#
#   **wm** **iconposition** *window* ?*x* *y*?
#      If *x* and *y* are specified, they are passed to the window manager as a hint about where to position the
#      icon for *window*. In this case an empty string is returned.
#
#      If *x* and *y* are specified as empty strings then any existing icon position hint is cancelled.
#
#      If neither *x* nor *y* is specified, then the command returns a Tcl list containing two values, which are the
#      current icon position hints (if no hints are in effect then an empty string is returned).
#
#   **wm** **iconwindow** *window* ?*pathname*?
#      If *pathname* is specified, it is the pathname for a window to use as icon for *window*: when *window* is iconified
#      then *pathname* will be mapped to serve as icon, and when window is de-iconified then *pathname* will be unmapped again.
#
#      If *pathname* is specified as an empty string then any existing icon window association for *window* will be cancelled.
#
#      If the *pathname* argument is specified then an empty string is returned.
#      Otherwise the command returns the path name of the current icon window for *window*, or an empty string if there is
#      no icon window currently specified for *window*.
#
#      Button press events are disabled for *window* as long as it is an icon window; this is needed in order to allow
#      window managers to "own" those events.
#
#      Note: Not all window managers support the notion of an icon window, and the concept is entirely meaningless
#            on non-X11 platforms.
#
#   **wm** **manage** *widget*
#      The *widget* pathname specified will become a stand alone top-level window.
#      The window will be decorated with the window managers title bar, etc.
#
#      Only frame, labelframe and toplevel widgets can be used with this command.
#
#      Attempting to pass any other widget type will raise an error.
#      Attempting to manage a toplevel widget is benign and achieves nothing.
#      See also the sections on geometry management below.
#
#   **wm** **maxsize** *window* ?*width* *height*?
#      If *width* and *height* are specified, they give the maximum permissible dimensions for *window*.
#      For gridded windows the dimensions are specified in grid units; otherwise they are specified in pixel units.
#      The window manager will restrict the *window*'s dimensions to be less than or equal to *width* and *height*.
#
#      If *width* and *height* are specified, then the command returns an empty string.
#      Otherwise it returns a Tcl list with two elements, which are the maximum width and height currently in effect.
#
#      The maximum size defaults to the size of the screen.
#      See the sections on geometry management below for more information.
#
#   **wm** **minsize** *window* ?*width* *height*?
#      If *width* and *height* are specified, they give the minimum permissible dimensions for *window*.
#      For gridded windows the dimensions are specified in grid units; otherwise they are specified in pixel units.
#      The window manager will restrict the *window*'s dimensions to be greater than or equal to *width* and *height*.
#
#      If *width* and *height* are specified, then the command returns an empty string.
#      Otherwise it returns a Tcl list with two elements, which are the minimum width and height currently in effect.
#
#      The minimum size defaults to one pixel in each dimension.
#      See the sections on geometry management below for more information.
#
#   **wm** **overrideredirect** *window* ?*boolean*?
#      If *boolean* is specified, it must have a proper boolean form and the override-redirect flag for *window*
#      is set to that value.
#
#      If *boolean* is not specified then **1** or **0** is returned to indicate whether or not the override-redirect
#      flag is currently set for *window*.
#
#      Setting the override-redirect flag for a window causes it to be ignored by the window manager; among other things,
#      this means that the window will not be reparented from the root window into a decorative frame and the user will
#      not be able to manipulate the window using the normal window manager mechanisms.
#
#      Note that the override-redirect flag is only guaranteed to be taken notice of when the window is first mapped or when mapped
#      after the state is changed from withdrawn to normal.
#      Some, but not all, platforms will take notice at additional times.
#
#   **wm** **positionfrom** *window* ?*who*?
#      If *who* is specified, it must be either **program** or **user**, or an abbreviation of one of these two.
#      It indicates whether *window*'s current position was requested by the program or by the user.
#
#      Many window managers ignore program-requested initial positions and ask the user to manually position the *window*;
#      if user is specified then the window manager should position the window at the given place without asking the user
#      for assistance.
#
#      If *who* is specified as an empty string, then the current position source is cancelled.
#      If *who* is specified, then the command returns an empty string.
#      Otherwise it returns **user** or **program** to indicate the source of the *window*'s current position,
#      or an empty string if no source has been specified yet.
#
#      Most window managers interpret "no source" as equivalent to **program**.
#      Tk will automatically set the position source to **user** when a **wm geometry** command is invoked, unless
#      the source has been set explicitly to **program**.
#
#   **wm** **protocol** *window* ?*name*? ?*command*?
#      This command is used to manage window manager protocols such as **WM_DELETE_WINDOW**.
#
#      **Name** is the name of an atom corresponding to a window manager protocol, such as **WM_DELETE_WINDOW** or
#      **WM_SAVE_YOURSELF** or **WM_TAKE_FOCUS**.
#
#      If both *name* and *command* are specified, then *command* is associated with the protocol specified by *name*.
#      **Name** will be added to *window*'s **WM_PROTOCOLS** property to tell the window manager that the application
#      has a protocol handler for *name*, and *command* will be invoked in the future whenever the window manager sends
#      a message to the client for that protocol.
#      In this case the command returns an empty string.
#
#      If *name* is specified but *command* is not, then the current command for *name* is returned, or an empty string
#      if there is no handler defined for *name*.
#
#      If *command* is specified as an empty string then the current handler for *name* is deleted and it is removed
#      from the **WM_PROTOCOLS** property on *window*; an empty string is returned.
#
#      Lastly, if neither *name* nor *command* is specified, the command returns a list of all the protocols for which
#      handlers are currently defined for *window*.
#
#      Tk always defines a protocol handler for **WM_DELETE_WINDOW**, even if you have not asked for one with **wm protocol**.
#      If a **WM_DELETE_WINDOW** message arrives when you have not defined a handler, then Tk handles the message by destroying
#      the *window* for which it was received.
#
#   **wm** **resizable** *window* ?*width* *height*?
#      This command controls whether or not the user may interactively resize a top-level window.
#
#      If *width* and *height* are specified, they are boolean values that determine whether the width and height of
#      *window* may be modified by the user. In this case the command returns an empty string.
#
#      If *width* and *height* are omitted then the command returns a list with two 0/1 elements that indicate whether
#      the width and height of *window* are currently resizable. By default, windows are resizable in both dimensions.
#
#      If resizing is disabled, then the *window*'s size will be the size from the most recent interactive resize
#      or **wm geometry** command. If there has been no such operation then the *window*'s natural size will be used.
#
#   **wm** **sizefrom** *window* ?*who*?
#      If *who* is specified, it must be either **program** or **user**, or an abbreviation of one of these two.
#      It indicates whether *window*'s current size was requested by the program or by the user.
#
#      Some window managers ignore program-requested sizes and ask the user to manually size the window; if **user** is
#      specified then the window manager should give the window its specified size without asking the user for assistance.
#
#      If *who* is specified as an empty string, then the current size source is cancelled.
#
#      If *who* is specified, then the command returns an empty string.
#
#      Otherwise it returns **user** or **window** to indicate the source of the *window*'s current size, or an
#      empty string if no source has been specified yet. Most window managers interpret "no source" as equivalent to **program**.
#
#   **wm** **stackorder** *window* ?**isabove**|**isbelow** *window*?
#      The **stackorder** command returns a list of toplevel windows in stacking order, from lowest to highest.
#
#      When a single toplevel window is passed, the returned list recursively includes all of the *window*'s children
#      that are toplevels. Only those toplevels that are currently mapped to the screen are returned.
#
#      The **stackorder** command can also be used to determine if one toplevel is positioned above or below a second toplevel.
#
#      When *window* is specified preceded by **isabove** or **isbelow**, a boolean result indicates whether or not
#      *window* is currently above or below the *window* in the stacking order.
#
#   **wm** **state** *window* ?*newstate*?
#      If *newstate* is specified, the window will be set to the new state, otherwise it returns the current state
#      of *window*: either **normal**, **iconic**, **withdrawn**, **icon**, or (Windows and Mac OS X only) **zoomed**.
#
#      The difference between **iconic** and **icon** is that **iconic** refers to a window that has been iconified
#      (e.g., with the **wm iconify** command) while **icon** refers to a window whose only purpose is to serve as the icon
#      for some other window (via the **wm iconwindow** command).
#
#      The icon state cannot be set.
#
#   **wm** **title** *window* ?*string*?
#      If *string* is specified, then it will be passed to the window manager for use as the title for *window*
#      (the window manager should display this string in *window*'s title bar).
#      In this case the command returns an empty string.
#
#      If *string* is not specified then the command returns the current title for the *window*.
#      The title for a window defaults to its name.
#
#   **wm** **transient** *window* ?*container*?
#      If *container* is specified, then the window manager is informed that *window* is a transient window
#      (e.g. pull-down menu) working on behalf of *container* (where *container* is the pathname for a top-level window).
#
#      If *container* is specified as an empty string then *window* is marked as not being a transient window any more.
#      Otherwise the command returns the path name of *window*'s current container, or an empty string if *window*
#      is not currently a transient window.
#
#      A transient window will mirror state changes in the container and inherit the state of the container when
#      initially mapped. The directed graph with an edge from each transient to its container must be acyclic.
#      In particular, it is an error to attempt to make a window a transient of itself.
#
#      The window manager may also decorate a transient window differently, removing some features normally present
#      (e.g., minimize and maximize buttons) though this is entirely at the discretion of the window manager.
#
#   **wm** **withdraw** *window*
#      Arranges for *window* to be withdrawn from the screen. This causes *window* to be unmapped and forgotten
#      about by the window manager.
#
#      If *window* has never been mapped, then this command causes *window* to be mapped in the withdrawn state.
#
#      Not all window managers appear to know how to handle windows that are mapped in the withdrawn state.
#
#      Note: It sometimes seems to be necessary to withdraw a window and then re-map it (e.g. with **wm deiconify**)
#            to get some window managers to pay attention to changes in *window* attributes such as group.
#
#### GEOMETRY MANAGEMENT
#
# By default a top-level window appears on the screen in its natural size, which is the one determined internally by
# its widgets and geometry managers.
# If the natural size of a top-level window changes, then the window's size changes to match.
#
# A top-level window can be given a size other than its natural size in two ways.
# First, the user can resize the window manually using the facilities of the window manager, such as resize handles.
# Second, the application can request a particular size for a top-level window using the **wm geometry** command.
#
# These two cases are handled identically by Tk; in either case, the requested size overrides the natural size.
# You can return the window to its natural by invoking **wm geometry** with an empty *geometry* string.
#
# Normally a top-level window can have any size from one pixel in each dimension up to the size of its screen.
# However, you can use the **wm minsize** and **wm maxsize** commands to limit the range of allowable sizes.
# The range set by **wm minsize** and **wm maxsize** applies to all forms of resizing, including the *window*'s
# natural size as well as manual resizes and the **wm geometry** command.
# You can use any value accepted by [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#
# You can also use the command **wm resizable** to completely disable interactive resizing in one or both dimensions.
#
# The **wm manage** and **wm forget** commands may be used to perform undocking and docking of windows.
# After a widget is managed by **wm manage** command, all other **wm subcommands** may be used with the widget.
#
# A toplevel widget may be used as a frame and managed with any of the other geometry managers after
# using the **wm forget** command.
#
# All custom bindtags for widgets in a subtree that have their top-level widget changed via a **wm manage**
# or **wm forget** command, must be redone to adjust any top-level widget path in the bindtags.
# Bindtags that have not been customized do not have to be redone.
#
#### GRIDDED GEOMETRY MANAGEMENT
#
# Gridded geometry management occurs when one of the widgets of an application supports a range of useful sizes.
# This occurs, for example, in a text editor where the scrollbars, menus, and other adornments are fixed in size
# but the edit widget can support any number of lines of text or characters per line.
#
# In this case, it is usually desirable to let the user specify the number of lines or characters-per-line,
# either with the **wm geometry** command or by interactively resizing the window.
#
# In the case of text, and in other interesting cases also, only discrete sizes of the window make sense,
# such as integral numbers of lines and characters-per-line; arbitrary pixel sizes are not useful.
#
# Gridded geometry management provides support for this kind of application.
# Tk (and the window manager) assume that there is a grid of some sort within the application and that the application
# should be resized in terms of grid units rather than pixels.
#
# Gridded geometry management is typically invoked by turning on the **setGrid** option for a widget;
# it can also be invoked with the **wm grid** command or by calling [Tk_SetGrid](https://www.tcl-lang.org/man/tcl9.0/TkLib/SetGrid.html).
# In each of these approaches the particular widget (or sometimes code in the application as a whole) specifies the
# relationship between integral grid sizes for the window and pixel sizes.
# To return to non-gridded geometry management, invoke **wm grid** with empty argument strings.
#
# When gridded geometry management is enabled then all the dimensions specified in **wm minsize**, **wm maxsize**,
# and **wm geometry** commands are treated as grid units rather than pixel units.
# Interactive resizing is also carried out in even numbers of grid units rather than pixels.
#
#### BUGS
#
# Most existing window managers appear to have bugs that affect the operation of the **wm command**.
# For example, some changes will not take effect if *window* is already active: *window* will have to be withdrawn
# and de-iconified in order to make the change happen.
#
#### EXAMPLES
#
# A fixed-size window that says that it is fixed-size too:
#
#   toplevel .fixed
#   wm title     .fixed "Fixed-size Window"
#   wm resizable .fixed 0 0
#
# A simple dialog-like window, centered on the screen:
#
#   # Create and arrange the dialog contents.
#
#   toplevel .msg
#   label  .msg.l  -text "This is a very simple dialog demo."
#   button .msg.ok -text OK -default active -command {destroy .msg}
#   pack .msg.ok -side bottom -fill x
#   pack .msg.l  -expand 1    -fill both
#
#   # Now set the widget up as a centered dialog.
#
#   # But first, we need the geometry managers to finish setting
#   # up the interior of the dialog, for which we need to run the
#   # event loop with the widget hidden completely...
#
#   wm withdraw .msg
#   update
#   set x [expr {([winfo screenwidth .] - [winfo width .msg]) / 2}]
#   set y [expr {([winfo screenheight .] - [winfo height .msg]) / 2}]
#   wm geometry  .msg +$x+$y
#   wm transient .msg .
#   wm title     .msg "Dialog demo"
#   wm deiconify .msg
package provide ::ms::wm 0.1

# Create the mustang **wm** package.
namespace eval ::ms::wm {}

# Rename the original Tk **wm** command.
rename wm _wm

# Create an alias for the mustang **wm** command.
interp alias {} wm {} ::ms::wm::Command

## Command
#
# Replace the Tk **wm** command.
#
# Where:
#
# args   Should be the arguments of the **wm** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::wm::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        colormapwindows {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]
                        }
                    }

                    # Execute the command.
                    try {
                        _wm colormapwindows $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        # Check the initial address type provided (short or real).
                        switch -- $type {
                            short {
                                set short_result [list ]
                                foreach w $result {
                                    if { $w in $::ms::addr(reals) } {
                                        # 'w' is the real address of a widget created by mustang.
                                        lappend short_result $::ms::addr($w,short)
                                    } else {
                                        # 'w' is the real address of a widget not created by mustang.
                                        lappend short_result [::ms::Get_Short $w]
                                    }
                                }

                                # Remove any doubles.
                                set result [lsort -unique $short_result]
                            }
                        }

                        return $result
                    }
                }
                2   {
                    set window     [lindex $args 0]
                    set windowList [lindex $args 1]

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Iterate the 'windowList' list to substitute any window short address with their long counterpart.
                    set real_windowList [list ]
                    foreach window $windowList {
                        # Get the real address associated with 'window'.
                        set result [::ms::Check_Pathname $window invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            default { lappend real_windowList [lindex $result 0] }
                        }
                    }

                    # Execute the command.
                    try {
                        _wm colormapwindows $w $real_windowList
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        group      -
        iconwindow -
        transient  {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]
                        }
                    }

                    # Execute the command.
                    try {
                        _wm $action $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { pathname } {
                        switch -- $pathname {
                            ""      { return "" }
                            default {
                                # Check the initial address type provided (short or real).
                                switch -- $type {
                                    short {
                                        if { $pathname in $::ms::addr(reals) } {
                                            # 'pathname' is the real address of a widget created by mustang.
                                            return $::ms::addr($pathname,short)
                                        } else {
                                            # 'pathname' is the real address of a widget not created by mustang.
                                            return [::ms::Get_Short $pathname]
                                        }
                                    }
                                }

                                return $pathname
                            }
                        }
                    }
                }
                2   {
                    set window   [lindex $args 0]
                    set pathname [lindex $args 1]

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    switch -- $pathname {
                        ""      {}
                        default {
                            # Get the real address associated with 'pathname'.
                            set result [::ms::Check_Pathname $pathname invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid address, '$pathname'." $caller_info }
                                default { set pathname [lindex $result 0] }
                            }
                        }
                    }

                    # Execute the command.
                    try {
                        _wm $action $w $pathname
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        manage {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Execute the command.
                    try {
                        _wm manage $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _wm manage {*}$args
            } on error {} {
                ::ms::Error "Invalid address, '$window'." $caller_info
            } on ok { result } {
                return $result
            }
        }
        stackorder {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Execute the command.
                    try {
                        _wm stackorder $w
                    } on error {} {
                        ::ms::Error "Invalid address, '$window'." $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                3   {
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    set option [lindex $args 0]
                    switch -- $option {
                        "isabove" -
                        "isbelow" {
                            set toplevel [lindex $args 1]

                            # Get the real address associated with 'toplevel'.
                            set result [::ms::Check_Pathname $toplevel invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid address, '$toplevel'." $caller_info }
                                default { set args [lreplace $args 1 1 [lindex $result 0]] }
                            }
                        }
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _wm stackorder $w {*}$args
                    } on error {} {
                        ::ms::Error "Invalid address, '$window'." $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
            }

            # Execute the command.
            try {
                _wm stackorder $w {*}$args
            } on error {} {
                ::ms::Error "Invalid address, '$widget' is not a frame, labelframe, or toplevel widget." $caller_info
            } on ok { result } {
                return $result
            }
        }
        aspect           -
        attribute        -
        attributes       -
        client           -
        command          -
        deiconify        -
        focusmodel       -
        forget           -
        frame            -
        geometry         -
        grid             -
        iconbitmap       -
        iconbitmap       -
        iconify          -
        iconmask         -
        iconname         -
        iconphoto        -
        iconposition     -
        maxsize          -
        minsize          -
        overrideredirect -
        positionfrom     -
        protocol         -
        resizable        -
        sizefrom         -
        state            -
        title            -
        withdraw         {
            set window [lindex  $args 0]
            set args   [lremove $args 0]

            # Get the real address associated with 'window'.
            set result [::ms::Check_Pathname $window invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                default { set w [lindex $result 0] }
            }

            # Execute the command.
            try {
                _wm $action $w {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        default { ::ms::Error "Invalid option, '$action'." $caller_info }
    }
}

#*EOF*