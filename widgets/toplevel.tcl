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

# Symbols meanings that may be used by the widget synopsis:
#
# *option*             --> A mandatory parameter that must be substituted with a proper value.
# **option**           --> The command name or a mandatory parameter that must be written verbatim.
#
# ?*option*?           --> An optional parameter that must be substituted with a proper value.
# ?**option**?         --> An optional parameter that must be written verbatim.
#
# ?*option* *value*?   --> An optional 'key-value' parameter that must be substituted with proper values.
# ?**option** *value*? --> An optional 'key-value' parameter where the former must be written verbatim and
#                          the latter must be substituted with a proper value.

# Symbols meanings that may be used by the widget infos:
#
# *text*               --> Italic.
# **text**             --> Bold.
# ***text***           --> Italic-bold
#
# ## text              --> Title.
# #### text            --> Chapter.
# ###### text          --> Sub-chapter.
#
# [text](https:\\...)  --> Link to an internet page.
# [text](/wiki/...)    --> Link to another file in the wiki.

## toplevel
#
#### DESCRIPTION:
#
# Create and manipulate *toplevel* main and popup window widgets.
# The toplevel command creates a new toplevel widget (given by the *window* argument).
#
# The toplevel command returns the pathname of the new window.
#
# A toplevel is similar to a frame except that it is created as a top-level window: its **X** parent is the root window
# of a screen rather than the logical parent from its pathname.
# The primary purpose of a toplevel is to serve as a container for dialog boxes and other collections of widgets.
# The only visible features of a toplevel are its background and an optional three-dimensional border to make the toplevel
# appear raised or sunken.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname.
#         *Window* may be provided either as a short or as a real address.
#         Toplevels have their real addresses equals to their short addresses, this means that the address returned is
#         at the same time the toplevel real address and the toplevel short address.
#
# Note 2: Be aware that bindings on toplevels may receive events from subwidgets.
#
# Note 3: The address '.' is a special toplevel preconstructed by Tk that will act, look and feel as any other toplevel.
#
# Nota 4: The toplevel is one of the few containers that do not support the scrollbar system, at least not directly.
#         If you need a scrollable toplevel, put a scrollable frame inside a toplevel.
#         See the examples at the end.
#
# Additional options, described below, may be specified on the command line to configure aspects of the toplevel.
#
#### SYNOPSIS:
#
#   **toplevel**  *window* ?*option* *value*? ... ?*option* *value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-background**        It's a list that specifies the color to use as background.
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: This is a stylable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                       If there isn't one, the **-background** of the **Toplevel** style
#                                                       will be used instead.
#                                                       The **-background** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
# **-backgroundimage**   This specifies an image to display on the toplevel's background within the border of the toplevel
#                        (i.e., the image will be clipped by the toplevel's highlight ring and border, if either are present)
#                        on top of the background; subwidgets of the toplevel will be drawn on top.
#                        The image must have been created with the image create command.
#                        If specified as the empty string, no image will be displayed.
#
#                        Note: This is a stylable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-backgroundimage** specified in its style.
#                                                       If there isn't one, the **-backgroundimage** of the **Toplevel** style
#                                                       will be used instead.
#                                                       The **-backgroundimage** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget 'dynamic' state changes.
#
#                        If not provided, defaults to the empty string.
#
#                        See also **-tile** in this section.
#
# **-bordercolor**       It's a list that specifies the color to use as bordercolor.
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: It's only meaningful for widgets with a **solid** or **flat** relief.
#
#                        Note: This is a stylable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                       If there isn't one, the **-bordercolor** of the **Toplevel** style
#                                                       will be used instead.
#                                                       The **-bordercolor** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
#                        See also **-borderwidth** and **-relief** in this section.
#
# **-borderwidth**       Specifies the width of the three-dimensional border to draw around the outside of the widget,
#                        if such a border is being drawn.
#                        The **-relief** option typically determines this.
#
#                        The value may also be used when drawing three-dimensional effects in the widget's interior.
#                        The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                        (pixels, points, inches, millimeters or centimeters).
#
#                        Note: A value of **0** means no border.
#
#                        Note: Only working with reliefs that are not *flat*.
#
#                        Note: This is a stylable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-borderwidth** specified in its style.
#                                                       If there isn't one, the **-borderwidth** of the **Toplevel** style
#                                                       will be used instead.
#                                                       The **-borderwidth** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget 'dynamic' state changes.
#
#                        See also **-bordercolor** and **-relief** in this section.
#
# **-class**             Specifies a class for the widget.
#                        It is mainly used to make bindings for widgets that have the same class.
#
#                        Note: This option may only be provided while creating the widget.
#                              Attempts to change this value after the widget is created by using the **configure** command,
#                              will be ignored by mustang.
#
#                        Note: The point widget is already created by Tk.
#                              This means that its *-class* option cannot be set, only retrieved.
#
#                        If not provided, defaults to **Toplevel**.
#
# **-cmenu**             Specifies the contextual menu address that will be assigned to the widget.
#                        If the *cmenu* value is the empty string or invalid, nothing will happen.
#
#                        If not provided, defaults to the empty string.
#
# **-colormap**          Specifies a colormap to use for the window. The value may be either **new**, in which case a new colormap is
#                        created for the window and its children, or the name of another window (which must be on the same screen and
#                        have the same visual as *window*), in which case the new window will use the colormap from the specified window.
#                        If the **-colormap** option is not specified, the new window uses the default colormap of its screen.
#
#                        Note: This option may only be provided while creating the widget.
#                              Attempts to change this value after the widget is created by using the **configure** command,
#                              will be ignored by mustang.
#
#                        Note: The point widget is already created by Tk.
#                              This means that its *-colormap* option cannot be set, only retrieved.
#
#                        If not provided, defaults to the empty string.
#
#                        See also **-visual** in this section.
#
# **-container**         The value must be a boolean. If true, it means that this window will be used as a container in which some
#                        other application will be embedded (for example, a Tk toplevel can be embedded using the **-use** option).
#                        The window will support the appropriate window manager protocols for things like geometry requests.
#                        The window should not have any children of its own in this application.
#
#                        Note: This option may only be provided while creating the widget.
#                              Attempts to change this value after the widget is created by using the **configure** command,
#                              will be ignored by mustang.
#
#                        Note: The point widget is already created by Tk.
#                              This means that its *-container* option cannot be set, only retrieved.
#
#                        If not provided, defaults to **0**.
#
#                        See also **-use** in this section.
#
# **-cursor**            Specifies the mouse cursor to be used for the widget.
#                        If an empty string is specified, it indicates that the widget should defer to it's parent for
#                        cursor specification.
#
#                        See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                       If there isn't one, the **-cursor** of the *Toplevel* style
#                                                       will be used instead.
#                                                       The **-cursor** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget 'dynamic' state changes.
#
# **-height**            Specifies the desired height for the widget in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                        (pixels, points, inches, millimeters or centimeters).
#
#                        If this option is **0** then the widget will assume the minimum height possible that can accomodate
#                        it's content height. Negative values will be ignored.
#
#                        Note: "WINDOW MANAGERS"
#
#                                  Any toplevel is managed by the *window manager*.
#                                  Any widget's program-requested height may cause it's toplevel to change it's height as well.
#                                  If the toplevel program-requested height is ignored (by the window manager),
#                                  then any widget's program-requested height is ignored too (by Tk that follows the istructions
#                                  received by the 'window manager').
#
#                                  Some window managers ignores any toplevel program-requested height and demands only to the
#                                  user to manually change the toplevel's height.
#
#                                  Some window managers allows any toplevel program-requested height until the user will
#                                  manually change the toplevel's height.
#                                  Once the user has manually changed the toplevel's height, any subsequent toplevel program-requested
#                                  height will be ignored.
#
#                                  Others window managers allows any toplevel program-requested height in any circumstances.
#
#                              "Tk"
#
#                                  Tk ignores any widget's program-requested height if the **grid** or **pack** geometry manager is used
#                                  within the widget, since these geometry managers will override the widget's height in those cases.
#
#                        If not provided, defaults to **0**.
#
#                        See also **-width** in this section.
#
# **-menu**              Specifies a menu widget to be used as a menubar.
#                        On the Macintosh, the menubar will be displayed across the top of the main monitor.
#                        On Microsoft Windows and all UNIX platforms, the menu will appear across the toplevel window as part of
#                        the window dressing maintained by the window manager.
#
#                        If not provided, defaults to the empty string.
#
# **-padding**           Specifies the internal padding for the widget.
#                        The padding is normally a list of up to four length specifications.
#
#                        The values must be in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                        (pixels, points, inches, millimeters or centimeters).
#
#                        Toplevel, text and crate paddings differs from any other widget paddings.
#                        A list of two values specifies the horizontal and the vertical padding.
#                        A single value specifies the same padding all the way around the widget.
#                        The third and forth values, if present, will be silently ignored.
#                        If the '::DEBUG' variable is enabled a communication will be displayed in the stdout channel.
#
#                        When computing how large a window it needs, the widget will add this amount to the width it would
#                        normally need (as determined by the width of the things displayed in the widget).
#                        If the geometry manager can satisfy this request, the widget will end up with extra internal space
#                        to the left and/or right of what it displays inside.
#                        Most widgets only use this option for padding text: if they are displaying a bitmap or image,
#                        then they usually ignore padding options.
#
#                        Note: This is a stylable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-padding** specified in its style.
#                                                       If there isn't one, the **-padding** of the **Toplevel** style
#                                                       will be used instead.
#                                                       The **-padding** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget 'dynamic' state changes.
#
# **-relief**            Specifies the three-dimensional effect desired for the widget.
#                        The value indicates how the widget's interior should appear relative to its exterior.
#                        For example, *raised* means the widget's interior should appear to protrude from the screen,
#                        relative to the exterior of the widget.
#
#                        The widget will accept as relief any of the following values:
#                           **flat**,
#                           **groove**,
#                           **raised**,
#                           **ridge**,
#                           **solid**,
#                           **sunken**.
#
#                        Note: This is a stylable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-relief** specified in its style.
#                                                       If there isn't one, the **-relief** of the **Toplevel** style
#                                                       will be used instead.
#                                                       The **-relief** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget 'dynamic' state changes.
#
#                        See also **-bordercolor** and **-borderwidth** in this section.
#
# **-screen**            Specifies the screen on which to place the new widget.
#                        Any valid screen name may be used, even one associated with a different display.
#
#                        If specified as the empty string, its parent screen will be used.
#
#                        Note: This option may be provided while creating the widget.
#                              Attempts to change this value after the widget was created by using the **configure** command,
#                              will be ignored by mustang.
#
#                        Note: The point widget is already created by Tk.
#                              This means that the *-screen* option cannot be set but only retrieved.
#
#                        If not provided, defaults to the empty string.
#
# **-state**             Specifies the 'physical' state for the widget.
#
#                        Note: Toplevels have only the **normal** state.
#
#                        Note: This option will be ignored if provided while creating the widget.
#                              Attempts to change this value after the widget was created, by using the **configure** command,
#                              will be ignored by mustang.
#                              This option can only be retrieved.
#
#                        It's set to **normal**.
#
# **-style**             Specifies a custom widget style.
#                        If not provided, defaults to **Toplevel**.
#
#                        See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**         Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                        and **Shift-Tab**).
#
#                        Before setting the focus to a widget, the traversal scripts consult the value of the *-takefocus* option.
#                           **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                           **1** --> It means that the widget should receive the input focus as long as it is viewable and
#                                     all of its ancestors are mapped.
#
#                        Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                        If not provided, defaults to **0**.
#
# **-tile**              It's a boolean value that specifies how to draw the background image on the toplevel.
#                        If true, the image will be tiled to fill the whole toplevel, with the origin of the first copy of the
#                        image being the top left of the interior of the toplevel.
#                        If false, the image will be centered within the toplevel.
#
#                        Note: This is a stylable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-tile** specified in its style.
#                                                       If there isn't one, the **-tile** of the **Toplevel** style
#                                                       will be used instead.
#                                                       The **-tile** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget 'dynamic' state changes.
#
#                        If not provided, defaults to **0** (false).
#
#                        See also **-backgroundimage** in this section.
#
# **-title**             Specifies the desired string to use as the toplevel title (the window manager should display this string
#                        in the widget's title bar). If not provided, defaults to the toplevel address.
#
# **-use**               This option is used for embedding. If the value is not an empty string, it must be the window identifier
#                        of a container window, specified as a hexadecimal string like the ones returned by the [winfo id](/wiki/commands/winfo.md) command.
#                        The toplevel widget will be created as a child of the given container instead of the root window for the screen.
#                        If the container window is in a Tk application, it must be a frame or toplevel widget for which the **-container**
#                        option was specified.
#
#                        Note: This option may only be provided while creating the widget.
#                              Attempts to change this value after the widget is created by using the **configure** command,
#                              will be ignored by mustang.
#
#                        Note: The point widget is already created by Tk.
#                              This means that its *-use* option cannot be set, only retrieved.
#
#                        See also **-container** in this section.
#
#                        If not provided, defaults to the empty string.
#
# **-visual**            Specifies visual information for the new window in any of the following forms:
#
#                           string   --> The string consists of a *class* name followed by an integer *depth*, with any amount of white
#                                        space in between.
#
#                                        *Class* selects what sort of visual is desired and must be one of **directcolor**, **grayscale**,
#                                        **greyscale**, **pseudocolor**, **staticcolor**, **staticgray**, **staticgrey**, or **truecolor**.
#
#                                        *Depth* specifies how many bits per pixel are needed for the visual.
#
#                           default  --> Use the default visual for *tkwin*'s screen.
#
#                           pathName --> Use the visual for the window given by *pathName*.
#                                        *pathName* must be the name of a window on the same screen as *tkwin*.
#
#                           number   --> Use the visual whose X identifier is number.
#
#                        If this option is not specified, the new window will use the default visual for its screen.
#
#                        Note: This option may only be provided while creating the widget.
#                              Attempts to change this value after the widget is created by using the **configure** command,
#                              will be ignored by mustang.
#
#                        Note: The point widget is already created by Tk.
#                              This means that its *-visual* option cannot be set, only retrieved.
#
#                        If not provided, defaults to the empty string.
#
#                        See also **-colormap** in this section.
#
# **-width**             Specifies the desired width for the widget in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                        (pixels, points, inches, millimeters or centimeters).
#
#                        If this option is **0** then the widget will assume the minimum width possible that can accomodate
#                        it's content width. Negative values will be ignored.
#
#                        Note: "WINDOW MANAGERS"
#
#                                  Any toplevel is managed by the *window manager*.
#                                  Any widget's program-requested width may cause it's toplevel to change it's width as well.
#                                  If the toplevel program-requested width is ignored (by the window manager),
#                                  then any widget's program-requested width is ignored too (by Tk that follows the istructions
#                                  received by the window manager).
#
#                                  Some window managers ignores any toplevel program-requested width and demands only to the
#                                  user to manually change the toplevel's width.
#
#                                  Some window managers allows any toplevel program-requested width until the user will
#                                  manually change the toplevel's width.
#                                  Once the user has manually changed the toplevel's width, any subsequent toplevel program-requested
#                                  width will be ignored.
#
#                                  Others window managers allows any toplevel program-requested width in any circumstances.
#
#                              "Tk"
#
#                                  Tk ignores any widget's program-requested width if the **grid** or **pack** geometry manager is used
#                                  within the widget, since these geometry managers will override the widget's width in those cases.
#
#                        If not provided, defaults to **0**.
#
#                        See also **-height** in this section.
#
#### WIDGET COMMAND:
#
# The toplevel command creates a new command whose name is the same as the pathname of the toplevel's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the toplevel widget's pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for toplevel widgets:
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the toplevel command (See **WIDGET OPTIONS**).
#
#   *window* **configure** ?*option*? ?*value*? ?*option* *value*? ... ?*option* *value*?
#     Query or modify the configuration options of the widget.
#
#     If no options are specified, returns a list describing all of the available options with their
#     default and current values.
#
#     If a single *option* is specified with no *value*, then the command returns a list describing its default
#     and current values.
#
#     If one or more *option value* pairs are specified, then the command modifies the given widget option(s)
#     to have the given value(s) and the command returns an empty string.
#
#     Some options can only be setted at creation time.
#     See **WIDGET OPTIONS** to know which one is configurable and which one is not.
#
#   *window* **identify** **element** *x* *y*
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if the mouse pointer does
#     not lie within any element. *X* and *y* are pixel coordinates relative to the widget.
#
#   *window* **instate** *statespec* ?*script*?
#     Test the widget's state.
#     If *script* is not specified, returns **1** if the widget state matches *statespec* and **0** otherwise.
#     If *script* is specified it's equivalent to:
#
#        if { [*window* **instate** *stateSpec*] } *script*
#
#     See the [mustang intro](/wiki/commands/intro.md) wiki page to know the names of the allowed dynamic states.
#
#   *window* **state** ?*statespec*?
#     Modify or inquire widget state.
#     If *statespec* is present       --> Sets the widget dynamic state.
#                                         For each flag in *statespec*, sets the corresponding flag or clears it
#                                         if prefixed by an exclamation point.
#                                         Returns a new *statespec* indicating which flags were changed.
#
#     If *statespec* is not specified --> Returns a list of the currently enabled dynamic states.
#
#     See the [mustang intro](/wiki/commands/intro.md) wiki page to know the names of the allowed dynamic states.
#
#   *window* **style**
#     Return the style used by the widget.
#
#### STATES:
#
# The toplevel widget supports only the **normal** 'physical' state.
#
#### STYLING OPTIONS:
#
# Default style name: **Toplevel**
#
# Every toplevel styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang ot Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the toplevels in order to facilitate the developer work and augment the
# user experience at the same time.
#
###### INTERNAL MECHANISM:
#
# 1.  If the widget styleable options **-borderwidth** and **-bordercolor** allows it, everytime the mouse cursor enters the
#     widget it will illuminate its borders to visually indicate that the user is inside the widget.
#
# 2.  **ContextMenu** events will display the contextual menu associated with the widget.
#     See the **-cmenu** option for more details.
#
# There are other bindings in place for internal mechanism like **Activate/Deactivate**, **Configure**, **Destroy**,
# **Enter/Leave** and **FocusIn/FocusOut**.
#
#### COLOR OPTIONS:
#
# Each color option accepts colors provided in one of the following forms:
#
#   **hexadecimal colors**  --> These colors needs to be specified at **8**, **12** or **16** bits, without an *alpha*
#                               channel (transparency), in shortform (three hexadecimals) or longform (six, nine or twelve
#                               hexadecimals), with or without the **#**.
#
#                               In this form, the list should have only one or two elements.
#                               The first element indicates the color to validate and the second one (optional) indicates
#                               the hexadecimal color model (**HEX8**, **HEX12** or **HEX16**) in which the color will be
#                               translated. If only one element is provided (the hexadecimal color) its color model will be
#                               assumed to be **HEX8**.
#
#                               Note that **HEX8** can be shortened into **HEX**.
#
#                               After its validation, the color will be returned translated in its equivalent hexadecimal
#                               longform (in lowercase characters and with the **#** symbol) for the color model provided.
#
#                               See the [color model](/wiki/colormodels/index.md) wiki page to know more about color models.
#
#                               Note: Hexadecimal colors and color models are case insensitive.
#
#                               Some examples:
#
#                                    "#FFF"            --> The hexadecimal color is "#FFF".
#                                                          The color model is **HEX8**.
#
#                                                          The hexadecimal color is translated to '#ffffff'.
#
#                                    "#F0F hex12"      --> The hexadecimal color is "#F0F".
#                                                          The color model is **HEX12**.
#
#                                                          The hexadecimal color is translated to '#FFF000FFF'.
#
#                                    "#FF0000"         --> The hexadecimal color is "#FF0000".
#                                                          The color model is **HEX8**.
#
#                                                          The hexadecimal color is translated to '#ff0000'.
#
#                                    "#00FF00 hex16"   --> The hexadecimal color is "#00FF00".
#                                                          The color model is **HEX16**.
#
#                                                          The hexadecimal color is translated to '#0000ffff0000'.
#
#                                    "#000000FFF hex"  --> The hexadecimal color is "#000000FFF".
#                                                          The color model is **HEX8**.
#
#                                                          The hexadecimal color is translated to '#0000ff'.
#
#                                    "FFFF00"          --> The hexadecimal color is "FFFF00".
#                                                          The color model is **HEX8**.
#
#                                                          The hexadecimal color is translated to '#ffff00'.
#
#   **textual color names** --> These colors needs to be specified in textual form like *Azure*, *Brown*, *Dark Red*,
#                               *Magenta*, or *Light Steel Blue*.
#
#                               In this form, the list should have at least one element. More precisely:
#
#                                    colorname   --> It's the textual color name that specifies the color.
#                                                    Should always be written first. It can take more than one element of
#                                                    the list depending on how many words are needed to define it.
#
#                                                    The only color names known by mustang are specified in its palettes.
#                                                    See the [palette](/wiki/palettes/index.md) wiki page to know more about
#                                                    the allowed color names for the default **mustang** palette.
#
#                                    palette     --> Optional. Should be the name of the palette that contains the color name.
#                                                    If present, it should always be the last element of the list if the color model
#                                                    is not present, or the last but one if the color model is present.
#
#                                                    Allowed values are any palette name loaded into mustang.
#                                                    If not provided, defaults to **mustang** or return the fallback value
#                                                    if the **mustang** palette was not loaded.
#
#                                                    See the [palette](/wiki/palettes/index.md) wiki page to know more about
#                                                    the mustang palettes.
#
#                                    colormodel  --> Optional. Should be the hexadecimal color model in which the color name
#                                                    will be translated.
#                                                    If present, the color model should always be the last element of the list.
#
#                                                    Allowed values are **HEX8**, **HEX12** and **HEX16**.
#                                                    If not provided, defaults to **HEX8**.
#
#                                                    Note that **HEX8** can be shortened into **HEX**.
#
#                                                    See the [color model](/wiki/colormodels/index.md) wiki page to know more
#                                                    about color models.
#
#                               Note: Colornames, palettes and color models are case insensitive.
#
#                               Some examples:
#
#                                    "teal"                --> The color name is *teal*.
#                                                              The palette name is **mustang**.
#                                                              The color model is **HEX8**.
#
#                                                              The color name is translated to "#008080"
#
#                                    "medium violet red"   --> The color name is *medium violet red*.
#                                                              The palette name is **mustang**.
#                                                              The color model is **HEX8**.
#
#                                                              The color name is translated to "#c71585"
#
#                                    "sepia MyPalette"     --> The color name is *sepia*.
#                                                              The palette name is **MyPalette**.
#                                                              The color model is **HEX8**.
#
#                                                              Note that in this example **MyPalette** is a fictional
#                                                              palette name that have been loaded into mustang.
#
#                                                              The color name is translated to the hexadecimal color at 8 bit
#                                                              associated to the 'sepia' colorname in the palette 'MyPalette'.
#
#                                    "light coral hex16"   --> The color name is *light coral*.
#                                                              The color model is **HEX16**.
#                                                              The palette name is **mustang**.
#
#                                                              The color name is translated to "#f0f080808080"
#
#                                    "caribbean green pearl mustang hex8" --> The color name is *caribbean green pearl*.
#                                                                             The palette name is **mustang**.
#                                                                             The color model is **HEX8**.
#
#                                                                             The color name is translated to "#6ada8e"
#
#                               After its validation, the color name will be returned translated in its hexadecimal longform
#                               equivalent (in lowercase characters and with the **#** symbol) for the color model specified.
#
#   **theme color names**   --> These colors needs to be specified in textual form like like *Accent*, *Invalid*, *Highlight*,
#                               *HighlightAlternate* or *PlaceholderText*.
#
#                               In this form, the list should have only one or two elements.
#                               The first element indicates the theme color name to validate and the second one (optional)
#                               indicates the hexadecimal color model (**HEX8**, **HEX12** or **HEX16**) in which the color
#                               will be translated. If only one element is provided (the theme color name) its color model
#                               will be assumed to be **HEX8**.
#
#                               Note that **HEX8** can be shortened into **HEX**.
#
#                               After its validation, the color will be returned translated in its equivalent hexadecimal
#                               longform (in lowercase characters and with the **#** symbol) for the color model provided.
#
#                               See the [theme color](/wiki/theme_colors/index.md) wiki page to know which
#                               theme color names are allowed.
#
#                               Note: Theme colors are case sensitive.
#
#### EXAMPLES:
#
###### FIRST EXAMPLE - Make "." a scrollable toplevel.
#
#   # Create the scrollable frame:
#   frame .main          -background [. cget -background] \
#               -backgroundstructure [. cget -background] \
#                       -borderwidth 0 \
#                            -height 800
#                         -scrollbar xy \
#                            -relief flat \
#                             -width 600;
#
#   # Pack the scrollable frame and expand it in both directions:
#   pack .main -anchor nw \
#              -expand true \
#                -fill both \
#                -padx [list 0 0] \
#                -pady [list 0 0] \
#                -side top;
#
#   # You can also use 'grid' instead of 'pack'.
#   # If this is the case, comment the pack lines and comment out the grid lines.
#   # If this is not the case, leave the pack and grid lines as they are.
#
#   ## Grid the scrollable frame and expand it in both directions.
#   #grid .main -column 0 \
#   #             -padx [list 0 0] \
#   #             -pady [list 0 0] \
#   #              -row 0 \
#   #           -sticky nsew;
#
#   ## Configure the point rows and columns.
#   #grid rowconfigure    . [list 0] -weight 1
#   #grid columnconfigure . [list 0] -weight 1
#
###### SECOND EXAMPLE - Create a scrollable toplevel.
#
#   # Create the toplevel and the scrollable frame:
#   toplevel .toplevel -background gray
#
#   frame .toplevel.main          -background gray \
#                        -backgroundstructure gray \
#                                -borderwidth 0 \
#                                     -height 800
#                                  -scrollbar xy \
#                                     -relief flat \
#                                      -width 600;
#
#   # Pack the scrollable frame and expand it in both directions:
#   pack .toplevel.main -anchor nw \
#                       -expand true \
#                         -fill both \
#                         -padx [list 0 0] \
#                         -pady [list 0 0] \
#                         -side top;
#
#   # You can also use 'grid' instead of 'pack'.
#   # If this is the case, comment the pack lines and comment out the grid lines.
#   # If this is not the case, leave the pack and grid lines as they are.
#
#   ## Grid the scrollable frame and expand it in both directions.
#   #grid .toplevel.main -column 0 \
#   #                      -padx [list 0 0] \
#   #                      -pady [list 0 0] \
#   #                       -row 0 \
#   #                    -sticky nsew;
#
#   ## Configure the toplevel rows and columns.
#   #grid rowconfigure    .toplevel [list 0] -weight 1
#   #grid columnconfigure .toplevel [list 0] -weight 1
package provide ::ms::toplevel 0.1

################################
##                            ##
##     _TOPLEVEL BINDINGS     ##
##                            ##
################################

# Activate/Deactivate
_bind _Toplevel <Activate>   { interp invokehidden {} %W state [list !background]; break }
_bind _Toplevel <Deactivate> { interp invokehidden {} %W state [list  background]; break }

# ButtonPress-1
_bind _Toplevel <ButtonPress-1> { ::ms::toplevel::Focus_Toplevel %W; break }

# Configure
_bind _Toplevel <Configure> { ::ms::toplevel::Configure %W; break }

# Contextual menu
_bind _Toplevel <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Toplevel <Destroy> { ::ms::toplevel::Destroy %W; break }

# Enter/Leave
_bind _Toplevel <Enter> { ::ms::toplevel::Hover %W %X %Y; break }
_bind _Toplevel <Leave> { ::ms::toplevel::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Toplevel <FocusIn>  { interp invokehidden {} %W state [list focus]; break }
_bind _Toplevel <FocusOut> { ::ms::toplevel::FocusOut %W; break }

# Create the mustang **toplevel** package.
namespace eval ::ms::toplevel {
    # Set the 'non-styleable' toplevel option list.
    set ::ms::toplevel(non_styleable,options) [list class \
                                                    cmenu \
                                                    colormap \
                                                    container \
                                                    height \
                                                    menu \
                                                    screen \
                                                    state \
                                                    style \
                                                    takefocus \
                                                    title \
                                                    use \
                                                    visual \
                                                    width];

    # Set the 'styleable' toplevel option list.
    set ::ms::toplevel(styleable,options) [list background \
                                                backgroundimage \
                                                bordercolor \
                                                borderwidth \
                                                cursor \
                                                padding \
                                                relief \
                                                tile];

    # Set the default 'non-styleable' toplevel options values.
    set ::ms::default(toplevel,class)     Toplevel
    set ::ms::default(toplevel,cmenu)     {}
    set ::ms::default(toplevel,colormap)  {}
    set ::ms::default(toplevel,container) 0
    set ::ms::default(toplevel,height)    0
    set ::ms::default(toplevel,menu)      {}
    set ::ms::default(toplevel,screen)    {}
    set ::ms::default(toplevel,state)     normal
    set ::ms::default(toplevel,style)     Toplevel
    set ::ms::default(toplevel,takefocus) 0
    set ::ms::default(toplevel,title)     [string totitle [tk appname]]
    set ::ms::default(toplevel,use)       {}
    set ::ms::default(toplevel,visual)    {}
    set ::ms::default(toplevel,width)     0

    # Note: The default 'styleable' toplevel options values are always defined inside the current theme.
}

# Rename the original Tk **toplevel** command.
rename toplevel _toplevel

# Create an alias for the mustang **toplevel** command.
interp alias {} toplevel {} ::ms::toplevel::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **toplevel** widget command.
#
# Where:
#
# window   Should be the widget pathname address to create.
#          This address should be unique and all the parents addresses should exists already.
#          *Window* can either be a real or short address.
#
# args     Should be one or more option-value pairs to configure various aspects of the widget.
#          Any acceptable widget options may be specified.
#          See 'WIDGET OPTIONS' above for more info.
#
# Returns the pathname of the new window created.
proc ::ms::toplevel::Command { window { args "" } } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Set the widget real and short addresses.
    # Toplevels have their short address always equal to their real address.
    set w          $window
    set short_addr $window

    # Check that the widget's 'args' forms a valid 'option/value' list.
    switch -- [expr { [llength $args]%2 }] {
        0   {
            # Remove any duplicated options (retain only the last ones).
            set args [lsort -increasing -stride 2 -index 0 -unique $args]

            ###############################################
            ##                                           ##
            ##     INITIALIZE THE WIDGET'S VARIABLES     ##
            ##                                           ##
            ###############################################

            # Set the default widget (not styleable) options.
            set ::ms::default($w,class)     $::ms::default(toplevel,class)
            set ::ms::default($w,cmenu)     $::ms::default(toplevel,cmenu)
            set ::ms::default($w,colormap)  $::ms::default(toplevel,colormap)
            set ::ms::default($w,height)    $::ms::default(toplevel,height)
            set ::ms::default($w,menu)      $::ms::default(toplevel,menu)
            set ::ms::default($w,screen)    $::ms::default(toplevel,screen)
            set ::ms::default($w,state)     $::ms::default(toplevel,state)
            set ::ms::default($w,style)     $::ms::default(toplevel,style)
            set ::ms::default($w,takefocus) $::ms::default(toplevel,takefocus)
            set ::ms::default($w,title)     $::ms::default(toplevel,title)
            set ::ms::default($w,visual)    $::ms::default(toplevel,visual)
            set ::ms::default($w,width)     $::ms::default(toplevel,width)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)     $::ms::default(toplevel,class)
            set ::ms::current($w,cmenu)     $::ms::default(toplevel,cmenu)
            set ::ms::current($w,colormap)  $::ms::default(toplevel,colormap)
            set ::ms::current($w,height)    $::ms::default(toplevel,height)
            set ::ms::current($w,menu)      $::ms::default(toplevel,menu)
            set ::ms::current($w,screen)    $::ms::default(toplevel,screen)
            set ::ms::current($w,state)     $::ms::default(toplevel,state)
            set ::ms::current($w,style)     $::ms::default(toplevel,style)
            set ::ms::current($w,takefocus) $::ms::default(toplevel,takefocus)
            set ::ms::current($w,title)     $::ms::default(toplevel,title)
            set ::ms::current($w,visual)    $::ms::default(toplevel,visual)
            set ::ms::current($w,width)     $::ms::default(toplevel,width)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) toplevel
            set ::ms::data($w,statespec) $::ms::data(statespec,normal)

            # Set each styleable option to be managed by Tk.
            #
            # Note: developer --> The 'option' will be managed directly by the developer and will not follow
            #                     the relative style indications, mappings included.
            #
            #       Tk        --> The 'option' will be managed directly by Tk by following the relative
            #                     style indications, mappings included (unless stated otherwise in the 'option' info).
            #
            #       Each styleable option will always start as managed by Tk.
            #
            #       Once a styleable option is set to be managed by the developer, it will not be possible
            #       to change it back to be managed by Tk.
            #
            #       To make a toplevel styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **toplevel** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)      Tk
            set ::ms::managed_by($w,backgroundimage) Tk
            set ::ms::managed_by($w,bordercolor)     Tk
            set ::ms::managed_by($w,borderwidth)     Tk
            set ::ms::managed_by($w,cursor)          Tk
            set ::ms::managed_by($w,padding)         Tk
            set ::ms::managed_by($w,relief)          Tk
            set ::ms::managed_by($w,tile)            Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -background {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,background)    $value
                        set ::ms::managed_by($w,background) developer
                    }
                    -backgroundimage {
                        if { ($value eq "") || ($value in [image names]) } {
                            set ::ms::current($w,backgroundimage)    $value
                            set ::ms::managed_by($w,backgroundimage) developer
                        }
                    }
                    -bordercolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,bordercolor)    $value
                        set ::ms::managed_by($w,bordercolor) developer
                    }
                    -borderwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,borderwidth)    $value
                        set ::ms::managed_by($w,borderwidth) developer
                    }
                    -class { set ::ms::current($w,class) $value }
                    -cmenu {
                        set value [string trim $value]
                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
                            set ::ms::current($w,cmenu) $value
                        }
                    }
                    -colormap {
                        switch -nocase -- $value {
                            ""      -
                            "new"   {}
                            default {
                                switch -- [winfo exists $value] {
                                    0   { continue }
                                }
                            }
                        }

                        set ::ms::current($w,colormap) $value
                    }
                    -container {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,container) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,container) 1 }
                        }
                    }
                    -cursor {
                        set value [string tolower $value]
                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                            set ::ms::current($w,cursor)    $value
                            set ::ms::managed_by($w,cursor) developer
                        }
                    }
                    -height {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,height) $value
                    }
                    -menu {
                        if { $value eq "" } {
                            set ::ms::current($w,menu) $value
                        } elseif { ($value in $::ms::addr(menu)) && ([_winfo toplevel $value] eq $w) } {
                            set ::ms::current($w,menu) $value
                        }
                    }
                    -padding {
                        switch -- [llength $value] {
                            1   {
                                set value [::ms::Check_Measure $value invalid]
                                switch -- $value {
                                    invalid { continue }
                                }

                                set ::ms::current($w,padding) [list $value]
                            }
                            2   {
                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                switch -- $pad_horizontal {
                                    invalid { continue }
                                }

                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                switch -- $pad_vertical {
                                    invalid { continue }
                                }

                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
                            }
                            3   {
                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                switch -- $pad_horizontal {
                                    invalid { continue }
                                }

                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                switch -- $pad_vertical {
                                    invalid { continue }
                                }

                                # If the '::DEBUG' variable is enabled, display the notificafion for the padding value ignored.
                                switch -nocase -- $::DEBUG {
                                    1       -
                                    on      -
                                    true    -
                                    active  -
                                    enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
                                }

                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
                            }
                            4   {
                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                switch -- $pad_horizontal {
                                    invalid { continue }
                                }

                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                switch -- $pad_vertical {
                                    invalid { continue }
                                }

                                # If the '::DEBUG' variable is enabled, display the notificafion for the padding values ignored.
                                switch -nocase -- $::DEBUG {
                                    1       -
                                    on      -
                                    true    -
                                    active  -
                                    enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
                                }

                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
                            }
                            default { continue }
                        }

                        set ::ms::managed_by($w,padding) developer
                    }
                    -relief {
                        set value [string tolower $value]
                        switch -- $value {
                            flat   -
                            groove -
                            raised -
                            ridge  -
                            solid  -
                            sunken {
                                set ::ms::current($w,relief)    $value
                                set ::ms::managed_by($w,relief) developer
                            }
                        }
                    }
                    -screen { set ::ms::current($w,screen) $value }
                    -state {}
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            set ::ms::current($w,style) $value
                        }
                    }
                    -takefocus {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,takefocus) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,takefocus) 1 }
                        }
                    }
                    -tile {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,tile) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,tile) 1 }
                        }
                    }
                    -title { set ::ms::current($w,title) $value }
                    -use {
                        set value [string tolower $value]
                        switch -- $value {
                            ""      {}
                            default {
                                set prefix [string range $value 0 1]
                                set hex    [string range $value 2 end]

                                switch -- $prefix {
                                    "0x"    {}
                                    default { continue }
                                }

                                switch -- [string is xdigit -strict $hex] {
                                    0   { continue }
                                }
                            }
                        }

                        set ::ms::current($w,use) $value
                    }
                    -visual {
                        set value [string tolower $value]

                        # Check if it's the empty string.
                        switch -- $value {
                            ""  {
                                set ::ms::current($w,visual) ""
                                continue
                            }
                        }

                        # Check if it's the word 'default'.
                        if { $value eq "default" } {
                            set ::ms::current($w,visual) default
                            continue
                        }

                        # Check if it's an integer.
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,visual) $value
                                continue
                            }
                        }

                        # Check if it's a class name with depth.
                        switch -- [llength $value] {
                            2   {
                                # Check the class name.
                                switch -- [lindex $value 0] {
                                    directcolor -
                                    grayscale   -
                                    greyscale   -
                                    pseudocolor -
                                    staticcolor -
                                    staticgray  -
                                    staticgrey  -
                                    truecolor   {
                                        # Check the depth.
                                        switch -- [lindex $value 1] {
                                            1   -
                                            2   -
                                            4   -
                                            8   -
                                            16  -
                                            32  -
                                            64  {
                                                set ::ms::current($w,visual) $value
                                                continue
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    -width {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,width) $value
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::toplevel(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Toplevel,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            # Set the internal '-padding' option to always show the horizontal and vertical padding.
            switch -- [llength $::ms::current($w,padding)] {
                1       { set ::ms::data($w,padding) [list $::ms::current($w,padding) $::ms::current($w,padding)] }
                default { set ::ms::data($w,padding) $::ms::current($w,padding) }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            ######################
            ##                  ##
            ##     TOPLEVEL     ##
            ##                  ##
            ######################

            # Note: Tk Toplevels don't understands styles, at least not natively.
            #       No internal styles needs to be created.

            # Note: 'backgroundimage', 'borderwidth', 'cursor', 'padding', 'relief' and 'tile' are not allowed to change
            #       if the statespec changes.

            # Set the toplevel options.
            set toplevel_options [list      -background $::ms::current($w,background) \
                                       -backgroundimage $::ms::current($w,backgroundimage) \
                                                 -class $::ms::current($w,class) \
                                              -colormap $::ms::current($w,colormap) \
                                             -container $::ms::current($w,container) \
                                                -cursor $::ms::current($w,cursor) \
                                                -height $::ms::current($w,height) \
                                                  -menu $::ms::current($w,menu) \
                                                  -padx [lindex $::ms::data($w,padding) 0] \
                                                  -pady [lindex $::ms::data($w,padding) 1] \
                                                -screen $::ms::current($w,screen) \
                                             -takefocus $::ms::current($w,takefocus) \
                                                  -tile $::ms::current($w,tile) \
                                                   -use $::ms::current($w,use) \
                                                -visual $::ms::current($w,visual) \
                                                 -width $::ms::current($w,width)];

            # Note: The '-bordercolor' option is not understanded by Tk toplevels, but is made available trough
            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
            #       like it behaves in other widgets that understands the bordercolor.

            # Check the 'relief' type.
            switch -- $::ms::current($w,relief) {
                flat  -
                solid {
                    lappend toplevel_options         -borderwidth 0 \
                                             -highlightbackground $::ms::current($w,bordercolor) \
                                                  -highlightcolor $::ms::current($w,bordercolor) \
                                              -highlightthickness $::ms::current($w,borderwidth) \
                                                          -relief flat;
                }
                default {
                    lappend toplevel_options         -borderwidth $::ms::current($w,borderwidth) \
                                             -highlightbackground $::ms::current($w,background) \
                                                  -highlightcolor $::ms::current($w,background) \
                                              -highlightthickness 0 \
                                                          -relief $::ms::current($w,relief);
                }
            }

            # Create the widget.
            _toplevel $w {*}$toplevel_options

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) $w

            # Set the toplevel title, if any.
            switch -- $::ms::current($w,title) {
                ""      {}
                default { _wm title $w [::msgcat::mc "$::ms::current($w,title)"] }
            }

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                Toplevel { _bindtags $w [list $w _Toplevel Toplevel $::ms::addr($w,toplevel) all] }
                default  { _bindtags $w [list $w $::ms::current($w,class) _Toplevel Toplevel $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the toplevel real address pathcommand.
            interp hide {} $w

            # Create an alias for the toplevel real pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::toplevel::Pathname_Cmd $w]

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short address relative to its real address, 'w'.
            set ::ms::addr($w,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals)  $w
            lappend ::ms::addr(shorts) $short_addr

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address.
            set ::ms::addr($w,widget) $w

            # Set the structure address.
            set ::ms::addr($w,structure) [list $w];

            # Add the widget address to the toplevel widgets real address list.
            lappend ::ms::addr(toplevel) $w

            # Add the widget address to the toplevel classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),toplevel,addrs) $w

            # Add the widget address to the toplevel classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),toplevel,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the toplevel classtype.
            if { $::ms::current($w,style) ni $::ms::style(toplevel,classtype) } {
                lappend ::ms::style(toplevel,classtype) $::ms::current($w,style)
            }

            # Toplevel short address are always equal to their real address.
            return $w
        }
        default { ::ms::Error "Invalid number of arguments." $caller_info }
    }
}

#####################################
##                                 ##
##     WIDGET PATHNAME COMMAND     ##
##                                 ##
#####################################

## Pathname_Cmd
#
# This procedure replaces the Tk widget address command.
#
# Where:
#
# w      Should be the widget real address involved.
#
# cmd    Should be the widget command to use.
#        The aliased command will provided this data.
#
# args   Contains the options needed by the 'cmd', if any.
#        The aliased command will provided this data.
#
# Returned values depends on the 'cmd' provided.
proc ::ms::toplevel::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        cget {
            # Synopsis:
            #
            # *window* **cget** *option*
            switch -- [llength $args] {
                0   { ::ms::Error "Missing cget option." $caller_info }
                1   {
                    # Check if the option provided is a valid 'styleable' or 'non-styleable' option.
                    set option [string tolower [string range $args 1 end]]
                    if { ($option in $::ms::toplevel(non_styleable,options)) || ($option in $::ms::toplevel(styleable,options)) } {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid option, '$args'." $caller_info }
            }
        }
        configure {
            # Synopsis:
            #
            # *window* **configure**
            # *window* **configure** *option*
            # *window* **configure** *option* *value*
            # *window* **configure** *option* *value* ... ?*option* *value*?
            switch -- [llength $args] {
                0   {
                    # 'non-styleable' options.
                    foreach option $::ms::toplevel(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::toplevel(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::toplevel(non_styleable,options)) || ($option in $::ms::toplevel(styleable,options)) } {
                        return [list $::ms::default($w,$option) $::ms::current($w,$option)]
                    } else {
                        ::ms::Error "Invalid configure option, '$args'." $caller_info
                    }
                }
                default {
                    # Check that the command's 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Note: The widget new dimensions will be updated only if they phisically change
                            #       after the configure command was issued.
                            #
                            #       Their registration (if any) is done in the '::ms::toplevel::Configure' event procedure.
                            set ::ms::temp($w,height) $::ms::current($w,height)
                            set ::ms::temp($w,width)  $::ms::current($w,width)

                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the widget options provided.
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -background {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,background)    $value
                                        set ::ms::managed_by($w,background) developer
                                    }
                                    -backgroundimage {
                                        if { ($value eq "") || ($value in [image names]) } {
                                            set ::ms::current($w,backgroundimage)    $value
                                            set ::ms::managed_by($w,backgroundimage) developer
                                        }
                                    }
                                    -bordercolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,bordercolor)    $value
                                        set ::ms::managed_by($w,bordercolor) developer
                                    }
                                    -borderwidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,borderwidth)    $value
                                        set ::ms::managed_by($w,borderwidth) developer
                                    }
                                    -class {}
                                    -cmenu {
                                        set value [string trim $value]
                                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
                                            set ::ms::current($w,cmenu) $value
                                        }
                                    }
                                    -colormap  -
                                    -container {}
                                    -cursor {
                                        set value [string tolower $value]
                                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                                            set ::ms::current($w,cursor)    $value
                                            set ::ms::managed_by($w,cursor) developer
                                        } else {
                                            continue
                                        }
                                    }
                                    -height {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::temp($w,height) $value
                                    }
                                    -menu {
                                        if { $value eq "" } {
                                            set ::ms::current($w,menu) $value
                                        } elseif { ($value in $::ms::addr(menu)) && ([_winfo toplevel $value] eq $w) } {
                                            set ::ms::current($w,menu) $value
                                        }
                                    }
                                    -padding {
                                        switch -- [llength $value] {
                                            1   {
                                                set value [::ms::Check_Measure $value invalid]
                                                switch -- $value {
                                                    invalid { continue }
                                                }

                                                set ::ms::current($w,padding) [list $value $value]
                                            }
                                            2   {
                                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                                switch -- $pad_horizontal {
                                                    invalid { continue }
                                                }

                                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                                switch -- $pad_vertical {
                                                    invalid { continue }
                                                }

                                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
                                            }
                                            3   {
                                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                                switch -- $pad_horizontal {
                                                    invalid { continue }
                                                }

                                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                                switch -- $pad_vertical {
                                                    invalid { continue }
                                                }

                                                # If the '::DEBUG' variable is enabled, display the notificafion for the padding value ignored.
                                                switch -nocase -- $::DEBUG {
                                                    1       -
                                                    on      -
                                                    true    -
                                                    active  -
                                                    enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
                                                }

                                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
                                            }
                                            4   {
                                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                                switch -- $pad_horizontal {
                                                    invalid { continue }
                                                }

                                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                                switch -- $pad_vertical {
                                                    invalid { continue }
                                                }

                                                # If the '::DEBUG' variable is enabled, display the notificafion for the padding values ignored.
                                                switch -nocase -- $::DEBUG {
                                                    1       -
                                                    on      -
                                                    true    -
                                                    active  -
                                                    enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
                                                }

                                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
                                            }
                                            default { continue }
                                        }

                                        set ::ms::managed_by($w,padding) developer
                                    }
                                    -relief {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            flat   -
                                            groove -
                                            raised -
                                            ridge  -
                                            solid  -
                                            sunken {
                                                set ::ms::current($w,relief)    $value
                                                set ::ms::managed_by($w,relief) developer
                                            }
                                        }
                                    }
                                    -screen -
                                    -state  {}
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Remove the widget address from the toplevel classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),toplevel,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),toplevel,addrs) [lremove $::ms::style($::ms::current($w,style),toplevel,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,toplevel,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the toplevel classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),toplevel,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(toplevel,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(toplevel,classtype) [lremove $::ms::style(toplevel,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the toplevel classtype.
                                            if { $value ni $::ms::style(toplevel,classtype) } {
                                                lappend ::ms::style(toplevel,classtype) $value
                                            }

                                            # Update the current style associated with the widget with 'value'.
                                            set ::ms::current($w,style) $value
                                        }
                                    }
                                    -takefocus {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,takefocus) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,takefocus) 1 }
                                        }
                                    }
                                    -tile {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,tile) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,tile) 1 }
                                        }
                                    }
                                    -title {
                                        set ::ms::current($w,title) $value

                                        _wm title $w [::msgcat::mc "$::ms::current($w,title)"]
                                    }
                                    -visual -
                                    -use    {}
                                    -width {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::temp($w,width) $value
                                    }
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Toplevel,$option)

                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            # Set the internal '-padding' option to always show the horizontal and vertical padding.
                            switch -- [llength $::ms::current($w,padding)] {
                                1       { set ::ms::data($w,padding) [list $::ms::current($w,padding) $::ms::current($w,padding)] }
                                default { set ::ms::data($w,padding) $::ms::current($w,padding) }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            ######################
                            ##                  ##
                            ##     TOPLEVEL     ##
                            ##                  ##
                            ######################

                            # Note: Toplevels don't understands styles natively.
                            #       No internal styles needs to be created.

                            # Note: 'backgroundimage', 'borderwidth', 'cursor', 'padding', 'relief' and 'tile' are not allowed to change
                            #       if the statespec changes.

                            # background
                            switch -- $::ms::managed_by($w,background) {
                                developer { set background $::ms::current($w,background) }
                                Tk        { set background [_ttk_style lookup $::ms::current($w,style) -background $::ms::data($w,statespec) $::ms::default($w,background)] }
                            }

                            # bordercolor
                            switch -- $::ms::managed_by($w,bordercolor) {
                                developer { set bordercolor $::ms::current($w,bordercolor) }
                                Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
                            }

                            # Configure the toplevel options.
                            set toplevel_options [list      -background $background \
                                                       -backgroundimage $::ms::current($w,backgroundimage) \
                                                                -cursor $::ms::current($w,cursor) \
                                                                -height $::ms::temp($w,height) \
                                                                  -menu $::ms::current($w,menu) \
                                                                  -padx [lindex $::ms::data($w,padding) 0] \
                                                                  -pady [lindex $::ms::data($w,padding) 1] \
                                                             -takefocus $::ms::current($w,takefocus) \
                                                                  -tile $::ms::current($w,tile) \
                                                                 -width $::ms::temp($w,width)];

                            # Check the 'relief' type
                            switch -- $::ms::current($w,relief) {
                                flat  -
                                solid {
                                    lappend toplevel_options         -borderwidth 0 \
                                                             -highlightbackground $bordercolor \
                                                                  -highlightcolor $bordercolor \
                                                              -highlightthickness $::ms::current($w,borderwidth) \
                                                                          -relief flat;
                                }
                                default {
                                    lappend toplevel_options         -borderwidth $::ms::current($w,borderwidth) \
                                                             -highlightbackground $background \
                                                                  -highlightcolor $background \
                                                              -highlightthickness 0 \
                                                                          -relief $::ms::current($w,relief);
                                }
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure {*}$toplevel_options

                            # Note: If width and/or height were provided by the developer, and these values were accepted by Tk,
                            #       then a configure event will be invoked by Tk ('::ms::toplevel::Configure').
                            #       After this event, their values will be registered.

                            update

                            # Cleaning.
                            unset -nocomplain -- ::ms::temp($w,height) \
                                                 ::ms::temp($w,width);

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        identify {
            # Synopsis:
            #
            # *window* **identify** **element** *x* *y*
            switch -- [llength $args] {
                3   {
                    # Check that the first argument of 'args' is the word "element".
                    switch -- [lindex $args 0] {
                        element {}
                        default { ::ms::Error "Invalid option, '$args'." $caller_info }
                    }

                    set x [lindex $args 1]
                    set y [lindex $args 2]

                    # Check that the coordinates provided are valid.
                    switch -- [string is integer -strict $x] {
                        0   { ::ms::Error "Invalid coordinate, '$x'." $caller_info }
                    }

                    switch -- [string is integer -strict $y] {
                        0   { ::ms::Error "Invalid coordinate, '$y'." $caller_info }
                    }

                    # Get the root coordinates of the north-west corner of the container ('$w').
                    set rootx [_winfo rootx $w]
                    set rooty [_winfo rooty $w]

                    # Transform the relative coordinates provided into root coordinates.
                    set X [expr { $rootx+$x }]
                    set Y [expr { $rooty+$y }]

                    # Get the widget address containing the point given by the root coordinates calculated.
                    set widget [_winfo containing -display $w $X $Y]

                    if { $widget eq $w } {
                        return "Toplevel.area"
                    } else {
                        ::ms::Error "Invalid coordinates." $caller_info
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        instate {
            # Synopsis:
            #
            # *window* **instate** *statespec* ?*script*?
            switch -- [llength $args] {
                0   { ::ms::Error "Missing statespec." $caller_info }
                1   {
                    set statespec $args

                    # Check the 'statespec' provided.
                    switch -- $statespec {
                        ""      -
                        normal  { set statespec $::ms::data(statespec,normal) }
                        default {
                            foreach state $statespec {
                                switch -- [::ms::Check_State $state] {
                                    invalid { ::ms::Error "Invalid statespec, '$state'." $caller_info }
                                }
                            }
                        }
                    }

                    # Compare the statespec provided with the current statespec of the widget.
                    set boolean 1
                    foreach state $statespec {
                        if { $state ni $::ms::data($w,statespec) } {
                            set boolean 0
                            break
                        }
                    }

                    return $boolean
                }
                2   {
                    set statespec [lindex $args 0]
                    set script    [lindex $args 1]

                    # Check the 'statespec' provided.
                    switch -- $statespec {
                        ""      -
                        normal  { set statespec $::ms::data(statespec,normal) }
                        default {
                            foreach state $statespec {
                                switch -- [::ms::Check_State $state] {
                                    invalid { ::ms::Error "Invalid statespec, '$state'." $caller_info }
                                }
                            }
                        }
                    }

                    # Compare the statespec provided with the current statespec of the widget.
                    foreach state $statespec {
                        if { $state ni $::ms::data($w,statespec) } {
                            return ""
                        }
                    }

                    # Execute the script.
                    try {
                        eval {*}$script
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        state {
            # Synopsis:
            #
            # *window* **state** ?*statespec*?
            switch -- [llength $args] {
                0   { return [lsort -increasing -dictionary $::ms::data($w,statespec)] }
                1   {
                    set statespec $args

                    # Check the 'statespec' provided.
                    switch -- $statespec {
                        ""      -
                        normal  { set statespec $::ms::data(statespec,normal) }
                        default {
                            foreach state $statespec {
                                switch -- [::ms::Check_State $state] {
                                    invalid { ::ms::Error "Invalid statespec, '$state'." $caller_info }
                                }
                            }
                        }
                    }

                    # Change the statespec and register the states that have changed.
                    set states_that_have_changed [list ]
                    foreach state $statespec {
                        if { $state ni $::ms::data($w,statespec) } {
                            # Note: The state analized is different than its equivalent currently active (old state).
                            #       For example 'disabled' (state) and '!disabled' (old state).

                            # Get the old state as the inverse of the new state.
                            switch -glob -- $state {
                                "!*"    { set old_state [string trimleft $state "!"] }
                                default { set old_state [string cat      "!" $state] }
                            }

                            # Update the current statespec old state with the new state.
                            set index [lsearch -exact $::ms::data($w,statespec) $old_state]

                            # No need to check if 'index' is '-1'.
                            set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) $index $index $state]

                            # Add the old state to the list containing the states that have changed.
                            lappend states_that_have_changed $old_state
                        }
                    }

                    #######################################
                    ##                                   ##
                    ##     UPDATE THE WIDGET'S STATE     ##
                    ##                                   ##
                    #######################################

                    # Note: Toplevels don't understands styles natively.
                    #       No internal styles needs to be created.

                    # Note: 'backgroundimage', 'borderwidth', 'cursor', 'padding', 'relief' and 'tile' are not allowed to change
                    #       if the statespec changes.

                    # background
                    switch -- $::ms::managed_by($w,background) {
                        developer { set background $::ms::current($w,background) }
                        Tk        { set background [_ttk_style lookup $::ms::current($w,style) -background $::ms::data($w,statespec) $::ms::default($w,background)] }
                    }

                    # bordercolor
                    switch -- $::ms::managed_by($w,bordercolor) {
                        developer { set bordercolor $::ms::current($w,bordercolor) }
                        Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
                    }

                    # Set the toplevel options.
                    set toplevel_options [list -background $background]

                    # Note: The '-bordercolor' option is not understanded by Tk toplevels, but is made available trough
                    #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                    #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                    #       like it behaves in other widgets that understands the bordercolor.

                    # Check the 'relief' type.
                    switch -- $::ms::current($w,relief) {
                        flat  -
                        solid {
                            lappend toplevel_options         -borderwidth 0 \
                                                     -highlightbackground $bordercolor \
                                                          -highlightcolor $bordercolor \
                                                      -highlightthickness $::ms::current($w,borderwidth) \
                                                                  -relief flat;
                        }
                        default {
                            lappend toplevel_options         -borderwidth $::ms::current($w,borderwidth) \
                                                     -highlightbackground $background \
                                                          -highlightcolor $background \
                                                      -highlightthickness 0 \
                                                                  -relief $::ms::current($w,relief);
                        }
                    }

                    # Apply the changes.
                    interp invokehidden {} $w configure {*}$toplevel_options

                    return $states_that_have_changed
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        style {
            # Synopsis:
            #
            # *window* **style**
            switch -- [llength $args] {
                0       { return $::ms::current($w,style) }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        default { ::ms::Error "Invalid option, '$cmd'." $caller_info }
    }
}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any toplevel widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::toplevel::Style_Update { stylename caller_info } {
    # Check the stylename padding, if any.
    set index [lsearch -exact $::ms::styleopt($::ms::theme,$stylename) "-padding"]
    switch -- $index {
        -1      {}
        default {
            switch -- [llength $::ms::styleopt($::ms::theme,$stylename,padding)] {
                3   -
                4   {
                    # Update the stylename padding option for the current theme.
                    set ::ms::styleopt($::ms::theme,$stylename)         [lreplace $::ms::styleopt($::ms::theme,$stylename) $index+1 $index+1 $::ms::styleopt($::ms::theme,$stylename,padding)]
                    set ::ms::styleopt($::ms::theme,$stylename,padding) [list [lindex $::ms::styleopt($::ms::theme,$stylename,padding) 0] [lindex $::ms::styleopt($::ms::theme,$stylename,padding) 1]]
                }
            }
        }
    }

    # Update all the toplevel widgets that have stylename as a style.
    foreach w $::ms::style($stylename,toplevel,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::toplevel(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Toplevel,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                    }
                }
            }
        }

        # Set the internal '-padding' option to always show the horizontal and vertical padding.
        switch -- [llength $::ms::current($w,padding)] {
            1       { set ::ms::data($w,padding) [list $::ms::current($w,padding) $::ms::current($w,padding)] }
            default { set ::ms::data($w,padding) $::ms::current($w,padding) }
        }

        #######################################
        ##                                   ##
        ##     UPDATE THE WIDGET'S STYLE     ##
        ##                                   ##
        #######################################

        # Note: Toplevels don't understands styles natively.
        #       No internal styles needs to be created.

        # Note: 'backgroundimage', 'borderwidth', 'cursor', 'padding', 'relief' and 'tile' are not allowed to change
        #       if the statespec changes.

        # background
        switch -- $::ms::managed_by($w,background) {
            developer { set background $::ms::current($w,background) }
            Tk        { set background [_ttk_style lookup $stylename -background $::ms::data($w,statespec) $::ms::default($w,background)] }
        }

        # bordercolor
        switch -- $::ms::managed_by($w,bordercolor) {
            developer { set bordercolor $::ms::current($w,bordercolor) }
            Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
        }

        # Set the toplevel cli options.
        set toplevel_options [list      -background $background \
                                   -backgroundimage $::ms::current($w,backgroundimage) \
                                            -cursor $::ms::current($w,cursor) \
                                              -padx [lindex $::ms::data($w,padding) 0] \
                                              -pady [lindex $::ms::data($w,padding) 1] \
                                              -tile $::ms::current($w,tile)];

         # Note: The '-bordercolor' option is not understanded by Tk toplevels, but is made available trough
         #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
         #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
         #       like it behaves in other widgets that understands the bordercolor.

        # Check the 'relief' type.
        switch -- $::ms::current($w,relief) {
            flat  -
            solid {
                lappend toplevel_options         -borderwidth 0 \
                                         -highlightbackground $bordercolor \
                                              -highlightcolor $bordercolor \
                                          -highlightthickness $::ms::current($w,borderwidth) \
                                                      -relief flat;
            }
            default {
                lappend toplevel_options         -borderwidth $::ms::current($w,borderwidth) \
                                         -highlightbackground $background \
                                              -highlightcolor $background \
                                          -highlightthickness 0 \
                                                      -relief $::ms::current($w,relief);
            }
        }

        # Apply the changes.
        interp invokehidden {} $w configure {*}$toplevel_options
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

## Configure
#
# Manage the **Configure** event on a widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::toplevel::Configure { w } {
    # Check if we are here due to a widget configure command or not.
    switch -- [info exists ::ms::temp($w,height)] {
        1   {
            set ::ms::current($w,height) $::ms::temp($w,height)
            set ::ms::current($w,width)  $::ms::temp($w,width)
        }
    }

    return ""
}

## Destroy
#
# Manage the **Destroy** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::toplevel::Destroy { w } {
    # Toplevels may receive events from their subwidgets (a <Destroy> event in this case).
    # Check if the toplevel was really destroyed or not.
    switch -- [_winfo exists $w] {
        0   {
            # Check if the toplevel variables were already destoyed.
            switch -- [info exists ::ms::current($w,class)] {
                0   { return "" }
            }

            # Get the short address related to the widget real address.
            set short_addr $w

            # Destroy the aliased command.
            interp alias {} $::ms::data($w,token) {}

            # Remove the widget real address from the widgets real address list.
            set index [lsearch -exact $::ms::addr(reals) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
            }

            # Remove the widget short address from the widgets short address list.
            set index [lsearch -exact $::ms::addr(shorts) $short_addr]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(shorts) [lremove $::ms::addr(shorts) $index] }
            }

            # Remove the widget address from the toplevel widgets real address list.
            set index [lsearch -exact $::ms::addr(toplevel) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(toplevel) [lremove $::ms::addr(toplevel) $index] }
            }

            # Remove the widget address from the toplevel classtype real address list with class '::ms::current($w,class)'.
            set index [lsearch -exact $::ms::class($::ms::current($w,class),toplevel,addrs) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::class($::ms::current($w,class),toplevel,addrs) [lremove $::ms::class($::ms::current($w,class),toplevel,addrs) $index] }
            }

            # Remove the widget address from the toplevel classtype real address list with style '::ms::current($w,style)'.
            set index [lsearch -exact $::ms::style($::ms::current($w,style),toplevel,addrs) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::style($::ms::current($w,style),toplevel,addrs) [lremove $::ms::style($::ms::current($w,style),toplevel,addrs) $index] }
            }

            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the toplevel classtype.
            switch -- [llength $::ms::style($::ms::current($w,style),toplevel,addrs)] {
                0   {
                    set index [lsearch -exact $::ms::style(toplevel,classtype) $::ms::current($w,style)]
                    switch -- $index {
                        -1      {}
                        default { set ::ms::style(toplevel,classtype) [lremove $::ms::style(toplevel,classtype) $index] }
                    }
                }
            }

            # Destroy every widget's variables previously created.
            unset -nocomplain -- ::ms::addr($short_addr,real) \
                                 ::ms::addr($w,short);

            unset -nocomplain -- ::ms::addr($w,border) \
                                 ::ms::addr($w,structure) \
                                 ::ms::addr($w,toplevel) \
                                 ::ms::addr($w,widget);

            unset -nocomplain -- ::ms::current($w,background) \
                                 ::ms::current($w,backgroundimage) \
                                 ::ms::current($w,bordercolor) \
                                 ::ms::current($w,borderwidth) \
                                 ::ms::current($w,class) \
                                 ::ms::current($w,colormap) \
                                 ::ms::current($w,container) \
                                 ::ms::current($w,cursor) \
                                 ::ms::current($w,height) \
                                 ::ms::current($w,menu) \
                                 ::ms::current($w,padding) \
                                 ::ms::current($w,relief) \
                                 ::ms::current($w,screen) \
                                 ::ms::current($w,state) \
                                 ::ms::current($w,style) \
                                 ::ms::current($w,takefocus) \
                                 ::ms::current($w,tile) \
                                 ::ms::current($w,title) \
                                 ::ms::current($w,use) \
                                 ::ms::current($w,visual) \
                                 ::ms::current($w,width);

            unset -nocomplain -- ::ms::data($w,classtype) \
                                 ::ms::data($w,padding) \
                                 ::ms::data($w,statespec) \
                                 ::ms::data($w,token);

            unset -nocomplain -- ::ms::default($w,background) \
                                 ::ms::default($w,backgroundimage) \
                                 ::ms::default($w,bordercolor) \
                                 ::ms::default($w,borderwidth) \
                                 ::ms::default($w,class) \
                                 ::ms::default($w,colormap) \
                                 ::ms::default($w,container) \
                                 ::ms::default($w,cursor) \
                                 ::ms::default($w,height) \
                                 ::ms::default($w,menu) \
                                 ::ms::default($w,padding) \
                                 ::ms::default($w,relief) \
                                 ::ms::default($w,screen) \
                                 ::ms::default($w,state) \
                                 ::ms::default($w,style) \
                                 ::ms::default($w,takefocus) \
                                 ::ms::default($w,tile) \
                                 ::ms::default($w,title) \
                                 ::ms::default($w,use) \
                                 ::ms::default($w,visual) \
                                 ::ms::default($w,width);

            unset -nocomplain -- ::ms::managed_by($w,background) \
                                 ::ms::managed_by($w,backgroundimage) \
                                 ::ms::managed_by($w,bordercolor) \
                                 ::ms::managed_by($w,borderwidth) \
                                 ::ms::managed_by($w,cursor) \
                                 ::ms::managed_by($w,padding) \
                                 ::ms::managed_by($w,relief) \
                                 ::ms::managed_by($w,tile);
        }
    }
}

## FocusOut
#
# Manage the **FocusOut** event on the widget.
#
# Where:
#
# w   should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::toplevel::FocusOut { w } {
    # Check the contextual menu relative to this widget, if any.
    switch -- $::ms::current($w,cmenu) {
        ""      {}
        default {
            # If the contextual menu of the widget or a menu popdown are open, do not loose the focus (graphically).
            switch -- [_winfo exists $::ms::current($w,cmenu)] {
                1   { return "" }
            }
        }
    }

    # Re-establish the original toplevel takefocus to '0' in case it was momentarily changed by the 'Focus_Toplevel' procedure.
    if { ($::ms::current($w,takefocus) == 0) && ([interp invokehidden {} $w cget -takefocus] == 1) } {
        interp invokehidden {} $w configure -takefocus 0
    }

    # Change the widget dynamic state to '!focus'.
    ::ms::toplevel::Pathname_Cmd $w state !focus

    return ""
}

## Focus_Toplevel
#
# Focus the toplevel after a **ButtonPress-1** event on the widget.
#
# Where:
#
# w   Should be the real address on the widget involved.
#
# It doesn't return anything.
proc ::ms::toplevel::Focus_Toplevel { w } {
    # Check the widget takefocus.
    switch -- $::ms::current($w,takefocus) {
        0   {
            # Momentarily set the takefocus to '1'.
            # We will re-establish its original takefocus value later, during its 'FocusOut' event.
            interp invokehidden {} $::ms::addr($w,toplevel) configure -takefocus 1
        }
    }

    # Focus the toplevel.
    _focus -force $::ms::addr($w,toplevel)

    return ""
}

## Hover
#
# Manage the **Enter** and **Leave** event on the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# X, Y   Should be the mouse pointer (X,Y) root coordinates.
#        These value are provided directly by the **Enter** or **Leave** event.
#
# It doesn't return anything.
proc ::ms::toplevel::Hover { w X Y } {
    # Get the dimensions of the widget that acts as a border object.
    set height [_winfo height $::ms::addr($w,border)]
    set width  [_winfo width  $::ms::addr($w,border)]

    # Get the north-west (nw) root coordinates of the widget that acts as a border object.
    set X_nw [_winfo rootx $::ms::addr($w,border)]
    set Y_nw [_winfo rooty $::ms::addr($w,border)]

    # Get the widget south-east (se) root coordinates of the widget that acts as a border object.
    set X_se [expr { $X_nw+$width }]
    set Y_se [expr { $Y_nw+$height }]

    # Check if the mouse pointer coordinates are inside or outside the widget acting as a border object.
    if { ($X <= $X_nw) || ($X >= $X_se) || ($Y <= $Y_nw) || ($Y >= $Y_se) } {
        # The mouse cursor is outside the widget acting as a border object.

        # Change the widget dynamic state to '!hover'.
        ::ms::text::Pathname_Cmd $w state !hover
    } else {
        # The mouse cursor is inside the widget acting as a border object.

        # Change the widget dynamic state to 'hover'.
        ::ms::text::Pathname_Cmd $w state hover
    }

    return ""
}

#*EOF*