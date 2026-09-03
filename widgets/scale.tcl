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
#   *option*             --> A mandatory parameter that must be substituted with a proper value.
#   **option**           --> The command name or a mandatory parameter that must be written verbatim.
#
#   ?*option*?           --> An optional parameter that must be substituted with a proper value.
#   ?**option**?         --> An optional parameter that must be written verbatim.
#
#   ?*option* *value*?   --> An optional 'key-value' parameter that must be substituted with proper values.
#   ?**option** *value*? --> An optional 'key-value' parameter where the former must be written verbatim and
#                            the latter must be substituted with a proper value.

# Symbols meanings that may be used by the widget infos:
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

## scale
#
#### DESCRIPTION:
#
# A scale widget is typically used to control the numeric value of a linked variable that varies uniformly over some range.
# A scale displays a slider that can be moved along over a trough, with the relative position of the slider over the trough
# indicating the value of the variable.
#
# Note: At the time this command is invoked, there must not exist a window with the same pathname,
#       but the pathname's parents must exists.
#       *Window* may be provided either as a short or as a real address, the address returned will be:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
# Additional options, described below, may be specified on the command line to configure aspects of the scale.
#
#### SYNOPSIS:
#
#   **scale**  *window* ?*option* *value*? ... ?*option* *value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-background**     It's a list that specifies the color to use as background.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: If the current theme uses the 'default' engine, the **-background** is used to color the widget
#                           zone that is outside the trough object, if any.
#                           In any other engine, the **-background** is used to coloring the entire thumb object.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                    If there isn't one, the **-background** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-background** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
# **-bordercolor**    It's a list that specifies the color to use as bordercolor.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: It's only meaningful for widgets with a **solid** relief.
#
#                     Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                    If there isn't one, the **-bordercolor** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-bordercolor** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-borderwidth**.
#
# **-borderwidth**    Specifies the width of the three-dimensional border to draw around the outside of the widget,
#                     if such a border is being drawn.
#                     The **-relief** option typically determines this.
#
#                     The value may also be used when drawing three-dimensional effects in the widget's interior.
#                     The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                     (pixels, points, inches, millimeters or centimeters).
#
#                     Note: A value of **0** means no border.
#
#                     Note: Only working with reliefs that are not *flat*.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-borderwidth** specified in its style.
#                                                    If there isn't one, the **-borderwidth** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-borderwidth** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-bordercolor**.
#
# **-class**          Specifies a class for the widget.
#                     It is mainly used to make bindings for widgets that have the same class.
#
#                     Note: This option may only be provided while creating the widget.
#                           Attempts to change this value after the widget is created by using the **configure** command,
#                           will be ignored by mustang.
#
#                     If not provided, defaults to **TScale**.
#
# **-cmenu**          Specifies the contextual menu address that will be assigned to the widget.
#                     If the *cmenu* value is the empty string or invalid, nothing will happen.
#
#                     If not provided, defaults to the empty string.
#
# **-command**        Specifies a Tcl script (or procedure) to evaluate whenever the widget is invoked.
#                     An empty string means 'no Tcl script or procedure will be evaluated when the widget is invoked'.
#
#                     Note: The Tcl script (or procedure) will be executed at top-level (only global variables will be visible).
#
#                     If not provided, defaults to the empty string.
#
# **-cursor**         Specifies the mouse cursor to be used for the widget.
#                     If an empty string is specified, it indicates that the widget should defer to it's parent for
#                     cursor specification.
#
#                     See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                    If there isn't one, the **-cursor** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-cursor** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
# **-darkcolor**      It's a list that specifies the color to use as darkcolor.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: It's only meaningful for widgets with a relief that is not **flat** or **solid**.
#
#                     Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-darkcolor** specified in its style.
#                                                    If there isn't one, the **-darkcolor** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-darkcolor** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-lightcolor**.
#
# **-from**           A real value corresponding to the left or top end of the scale (depending on the widget orientation).
#
#                     If not provided, defaults to **0**.
#
# **-gripsize**       Specifies the size of the grip on the thumb object.
#
#                     Note: A value of **0** means no grip on the thumb object.
#
#                     Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-gripsize** specified in its style.
#                                                    If there isn't one, the **-gripsize** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-gripsize** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
# **-increment**      Should be an integer or floating point number that indicates the increment of the mousewheel, touchpad
#                     and keyboard navigation. It cannot be zero or a negative number.
#
#                     If not provided, defaults to **1**.
#
# **-innercolor**     It's a list that specifies the color to use as innercolor.
#                     The innercolor is the color of the internal circle of the thumb object.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: It's only meaningful for themes that use the 'default' engine.
#                           In any other engine, the **-background** is used to coloring the entire thumb object.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-innercolor** specified in its style.
#                                                    If there isn't one, the **-innercolor** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-innercolor** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-background** and **-outercolor**.
#
# **-length**         Specifies the desired long dimension of the scale in screen units (i.e. any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)).
#                     For vertical scales this is the scale's height; for horizontal scales it is the scale's width.
#
#                     If not provided, defaults to **200**.
#
# **-lightcolor**     It's a list that specifies the color to use as lightcolor.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: It's only meaningful for widgets with a relief that is not **flat** or **solid**.
#
#                     Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-lightcolor** specified in its style.
#                                                    If there isn't one, the **-lightcolor** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-lightcolor** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-darkcolor**.
#
# **-orient**         Specifies the orientation of the widget (**horizontal** or **vertical**).
#
#                     Note: This option may only be provided while creating the widget.
#                           Attempts to change this value after the widget is created by using the **configure** command,
#                           will be ignored by mustang.
#
#                     If not provided, defaults to **horizontal**.
#
# **-outercolor**     It's a list that specifies the color to use as outercolor.
#                     The outercolor is the color of the external circle of the thumb object.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: It's only meaningful for themes that use the 'default' engine.
#                           In any other engine, the **-background** is used to coloring the entire thumb object.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-outercolor** specified in its style.
#                                                    If there isn't one, the **-outercolor** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-outercolor** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-background** and **-innercolor**.
#
# **-state**          Specifies the state for the widget.
#                     Setting it changes the widget **physical** state and not the widget *look* (the state widget command does that).
#                     Allowed states values are **normal** and **disabled**.
#
#                     If the scale is disabled then its thumb will not be be draggable.
#
#                     If not provided, defaults to **normal**.
#
# **-style**          Specifies a custom widget style.
#                     If not provided, defaults to **TScale**.
#
#                     The *style* provided should already exists at the time the widget is created.
#
#                     See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**      Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                     and **Shift-Tab**).
#
#                     Before setting the focus to a widget, the traversal scripts consult the value of the
#                     *-takefocus* option.
#                        **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                        **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                  and all of its ancestors are mapped.
#
#                     Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                     Note: It is not possible to set a takefocus of **1** to widgets in the disabled state.
#
#                     If not provided, defaults to **0**.
#
# **-thumbrelief**    Specifies the three-dimensional effect desired for the widget's thumb.
#                     The value indicates how the widget's interior's thumb should appear relative to its exterior.
#                     For example, *raised* means the widget's interior's thumb should appear to protrude from the screen,
#                     relative to the exterior of the widget.
#
#                     The widget will accept as thumbrelief any of the following values:
#                        **flat**,
#                        **groove**,
#                        **raised**,
#                        **ridge**,
#                        **solid**,
#                        **sunken**.
#
#                     Note: It's only meaningful for themes that use the 'classic' or 'alt' engine.
#                           In any other engine, the **-thumbrelief** is ignored.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-thumbrelief** specified in its style.
#                                                    If there isn't one, the **-thumbrelief** of the **TScale** style
#                                                    will be used instead.
#                                                    The '*-thumbrelief*' will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-troughrelief**.
#
# **-thickness**      Specifies the desired short dimension of the scale in screen units (i.e. any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)).
#                     For vertical scales this is the scale's width; for horizontal scales it is the scale's height.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-thickness** specified in its style.
#                                                    If there isn't one, the **-thickness** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-thickness** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-length**.
#
# **-to**             Specifies a real value corresponding to the right or bottom end of the scale.
#                     This value may be either less than or greater than the **-from** option.
#
#                     If not provided, defaults to **1.0**.
#
#
# **-troughcolor**    It's a list that specifies the color to use as troughcolor.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-troughcolor** specified in its style.
#                                                    If there isn't one, the **-troughcolor** of the **TScale** style
#                                                    will be used instead.
#                                                    The **-troughcolor** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-background**, **-darkcolor** and **-lightcolor**.
#
# **-troughrelief**   Specifies the three-dimensional effect desired for the widget trough.
#                     The value indicates how the widget's interior trough should appear relative to its exterior.
#                     For example, *raised* means the widget's interior trough should appear to protrude from the screen,
#                     relative to the exterior of the widget trough.
#
#                     The widget will accept as troughrelief any of the following values:
#                        **flat**,
#                        **groove**,
#                        **raised**,
#                        **ridge**,
#                        **solid**,
#                        **sunken**.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-troughrelief** specified in its style.
#                                                    If there isn't one, the **-troughrelief** of the **TLabel** style
#                                                    will be used instead.
#                                                    The '*-troughrelief*' will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-thumbrelief**.
#
# **-value**          Specifies the current floating-point value of the variable.
#                     If **-variable** is set to an existing variable, specifying **-value** has no effect (the variable
#                     value takes precedence).
#
#                     If not provided, defaults to **0**.
#
# **-variable**       Specifies the name of a global variable to link to the scale.
#                     Whenever the value of the variable changes, the scale will update to reflect this value.
#                     Whenever the scale is manipulated interactively, the variable will be modified to reflect the scale's new value.
#
#                     If not provided, defaults to the empty string.
#
#### WIDGET COMMAND:
#
# The scale command creates a new command whose name is the same as the pathname of the scale's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the scale widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for scale widgets:
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the scale command (See **WIDGET OPTIONS**).
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
#   *window* **coords** ?*value*?
#     Get the coordinates corresponding to value, or the coordinates corresponding to the current value of the
#     **-value** option if value is omitted.
#
#   *window* **get** ?*x* *y*?
#     Get the current value of the **-value** option, or the value corresponding to the coordinates *x*,*y*
#     if they are specified. *X* and *y* are pixel coordinates relative to the scale widget origin.
#
#   *window* **identify** **element** *x* *y*
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if the mouse pointer
#     does not lie within any element. *X* and *y* are pixel coordinates relative to the widget.
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
#   *window* **set** *value*
#     Set the value of the widget (i.e. the **-value** option) to value.
#     The value will be clipped to the range given by the **-from** and **-to** options.
#     Note that setting the linked variable (i.e. the variable named in the **-variable** option) does not cause such clipping.
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
# The scale widget supports the **normal** and **disabled** state.
# In the **disabled** state the scale thumb will not be draggable.
#
#### STYLING OPTIONS:
#
# Default style name: **TScale**
#
# Every scale styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the scales in order to facilitate the developer work and
# augment the user experience at the same time.
#
###### SCROLLING:
#
# The following behavior will happen if the scale is disabled and the mouse pointer is over it.
#
# Note: A *unit* is 1/10 of a scrollable widget visible zone relative axis or, if a scrollincrement is provided, a multiple of it.
#       See '-xscrollincrement' and '-yscrollincrement' of the relative scrollable widget for more info.
#
#       A *page* is 9/10 of a scrollable widget visible zone relative axis.
#
# Note: Belows, when we talk about the widget's parents, we talk about it recursively.
#       Mustang will iterate all widget's parents in search of one that is scrollable and has the proper scrollbar active for
#       the relative key combination examined. If mustang finds a suitable parent, it will scroll that widget scrollbar,
#       otherwise nothing will happen.
#
# Note: In Linux, **TouchpadScroll** events abide by the same rules of the **MouseWheel** for the X axis and the **Shift-MouseWheel**
#       for the Y axis, while **Control-TouchpadScroll** events abide by the same rules of the **Control-MouseWheel** for the X axis
#       and the **Control-Shift-MouseWheel** for the Y axis.
#
# 1.  **MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar and move
#     that scrollbar by one unit up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 2.  **Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#     and move that scrollbar by one unit left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 3.  **Control-MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar
#     and move that scrollbar by one page up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 4.  **Control-Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal
#     scrollbar and move that scrollbar by one page left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad direction.
#
#        1 - **TouchpadScroll** events along the X axis will try to find the innermost widget's scrollable parent with an active
#            horizontal scrollbar and move that scrollbar by one unit left or right (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - **TouchpadScroll** events along the Y axis will try to find the innermost widget's scrollable parent with an active
#            vertical scrollbar and move that scrollbar by one unit up or down (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 6.  **Control-TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad direction.
#
#        1 - **Control-TouchpadScroll** events along the X axis will try to find the innermost widget's scrollable parent with an
#            active horizontal scrollbar and move that scrollbar by one page left or right (depending on the direction of the touchpad
#            event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - **Control-TouchpadScroll** events along the Y axis will try to find the innermost widget's scrollable parent with an
#            active vertical scrollbar and move that scrollbar by one page up or down (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 7.  **ContextMenu** events will display the contextual menu associated with the widget.
#     See the **-cmenu** option for more details.
#
# The following behavior will happen if the widget is not disabled and it has the focus. Mustang will try to find the innermost widget's
# scrollable parent with an active vertical or horizontal scrollbar and scroll that scrollbar.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  - **Prior**         Scrolls one page towards the top of the widget's parent vertical scrollbar.
#     - **Next**          Scrolls one page towards the bottom of the widget's parent vertical scrollbar.
#     - **Control-Prior** Scrolls one page towards the right of the widget's parent horizontal scrollbar.
#     - **Control-Next**  Scrolls one page towards the left of the widget's parent horizontal scrollbar.
#
# If none of the widget's parents meets the required conditions, nothing will happen.
#
###### INTERNAL MECHANISM:
#
# The following behavior will happen if the widget is not disabled and the mouse pointer is over it (no matter if it has the focus or not).
#
# Note: In Linux, **TouchpadScroll** events abide by the same rules of the **MouseWheel** and the **Shift-MouseWheel**, while
#       **Control-TouchpadScroll** events abide by the same rules of the **Control-MouseWheel** and the **Control-Shift-MouseWheel**.
#
# 1.  **MouseWheel** and **Shift-MouseWheel** events will move the scale's thumb towards its top/bottom (vertical oriented scales) or
#     towards its left/right (horizontal oriented scales). The movement will happen at **1x** speed (one *increment* for each keypress).
#
# 2.  **Control-MouseWheel** **Control-Shift-MouseWheel** events will move the scale's thumb towards its top/bottom (vertical oriented
#     scales) or towards its left/right (horizontal oriented scales). The movement will happen at **2x** speed (two times the *increment*s
#     for each keypress).
#
# 3.  **TouchpadScroll** events (two finger gestures) will move the widget's thumb towards its top/bottom (vertical oriented scales) or
#     towards its left/right (horizontal oriented scales). The movement will happen at **1x** speed (one *increment* for each keypress).
#
# 4.  **Control-TouchpadScroll** events will move the widget's thumb towards its top/bottom (vertical oriented scales) or towards its
#     left/right (horizontal oriented scales). The movement will happen at **2x** speed (two times the *increment*s for each keypress).
#
# The following behavior will happen if the scale widget is not disabled and it has the focus.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the
#     previous focussable widget.
#
# 2.  In horizontal oriented scales:
#       - **Left**           Decrements the thumb position by one *increment* for each keypress (1x speed).
#       - **Right**          Increments the thumb position by one *increment* for each keypress (1x speed).
#       - **Control-Left**   Decrements the thumb position by two times the *increment* for each keypress (2x speed).
#       - **Control-Right**  Increments the thumb position by two times the *increment* for each keypress (2x speed).
#       - **Home**           Puts the thumb at its beginning.
#       - **End**            Puts the thumb at its end.
#
# 3.  In vertical oriented scales:
#       - **Down**                       Decrements the thumb position by one *increment* for each keypress (1x speed).
#       - **Up**                         Increments the thumb position by one *increment* for each keypress (1x speed).
#       - **Control-Down**               Decrements the thumb position by two times the *increment* for each keypress (2x speed).
#       - **Control-Up**                 Increments the thumb position by two times the *increment* for each keypress (2x speed).
#       - **Control-Home** and **Home**  Puts the thumb at its bottom.
#       - **Control-End** and **End**    Puts the thumb at its top.
#
# There are other bindings in place for internal mechanism like **Activate/Deactivate**, **Destroy**, **Enter/Leave** and
# **FocusIn/FocusOut**.
#
###### ALTERNATIVE BINDINGS:
#
# Check the [event](/wiki/commands/event.md) wiki page to see alternative keystrokes in case some keys are not present in the user
# keyboard like the *Delete*, *Arrows*, *Home*, *End*, *PageUp* or *PageDown* keys.
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
#### EXAMPLE:
#
#   # Create an horizontal scale.
#   scale .scale   -from 0 \
#                -length 300 \
#                -orient horizontal \
#                    -to 500.0 \
#                 -value 250.0;
#
#   # Pack it.
#   pack .scale -padx 20 \
#               -pady 20 \
#               -side top;
#
#   # After 3 seconds, change the accent color.
#   after 3000 [list set ::ms::accent orange]
#
#   # After 6 seconds, change the colorscheme.
#   switch -- [tk windowingsystem] {
#       aqua {
#           switch -- [wm attributes . -isdark] {
#               0   { after 6000 [list set ::ms::colorscheme dark]  }
#               1   { after 6000 [list set ::ms::colorscheme light] }
#           }
#       }
#       default { after 6000 [list set ::ms::colorscheme dark] }
#   }
package provide ::ms::scale 0.1

#############################
##                         ##
##     _SCALE BINDINGS     ##
##                         ##
#############################

# Activate/Deactivate
_bind _Scale <Activate>   { interp invokehidden {} %W [list !background]; break }
_bind _Scale <Deactivate> { interp invokehidden {} %W [list  background]; break }

# Buttonpress-1
_bind _Scale <ButtonPress-1> { ::ms::scale::ButtonPress %W %x %y; break }

# Contextual menu
_bind _Scale <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Scale <Destroy> { ::ms::scale::Destroy %W; break }

# Enter/Leave
_bind _Scale <Enter> { interp invokehidden {} %W [list  hover]; break }
_bind _Scale <Leave> { interp invokehidden {} %W [list !hover]; break }

# FocusIn/FocusOut
_bind _Scale <FocusIn>  { interp invokehidden {} %W [list focus]; break }
_bind _Scale <FocusOut> { ::ms::scale::FocusOut %W; break }

# PrevChar/NextChar
_bind _Scale <<PrevChar>> { ::ms::scale::Increment %W -1 1x; break }
_bind _Scale <<NextChar>> { ::ms::scale::Increment %W +1 1x; break }

# PrevLine/NextLine
_bind _Scale <<PrevLine>> { ::ms::scale::Increment %W -1 1x; break }
_bind _Scale <<NextLine>> { ::ms::scale::Increment %W +1 1x; break }

# PrevWord/NextWord
_bind _Scale <<PrevWord>> { ::ms::scale::Increment %W -1 2x; break }
_bind _Scale <<NextWord>> { ::ms::scale::Increment %W +1 2x; break }

# PrevPara/NexPara
_bind _Scale <<PrevPara>> { ::ms::scale::Increment %W -1 2x; break }
_bind _Scale <<NextPara>> { ::ms::scale::Increment %W +1 2x; break }

# Scan
_bind _Scale <<ScanMark>>    { ::ttk::scale::Jump    %W %x %y; break }
_bind _Scale <<ScanDrag>>    { ::ttk::scale::Drag    %W %x %y; break }
_bind _Scale <<ScanRelease>> { ::ttk::scale::Release %W %x %y; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scale <MouseWheel> { ::ms::scale::MouseWheel %W %D Y units 1x; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scale <Shift-MouseWheel> { ::ms::scale::MouseWheel %W %D X units 1x; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scale <Control-MouseWheel> { ::ms::scale::MouseWheel %W %D Y pages 2x; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scale <Control-Shift-MouseWheel> { ::ms::scale::MouseWheel %W %D X pages 2x; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scale <TouchpadScroll> { ::ms::scale::Touchpad %W %# %D units 1x; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scale <Control-TouchpadScroll> { ::ms::scale::Touchpad %W %# %D pages 2x; break }

# Create the mustang **scale** package.
namespace eval ::ms::scale {
    # Set the 'non styleable' scale option list.
    set ::ms::scale(non_styleable,options) [list class \
                                                 cmenu \
                                                 command \
                                                 from \
                                                 increment \
                                                 length \
                                                 orient \
                                                 state \
                                                 style \
                                                 takefocus \
                                                 to \
                                                 value \
                                                 variable];

    # Set the 'styleable' scale option list.
    set ::ms::scale(styleable,options) [list background \
                                             bordercolor \
                                             borderwidth \
                                             cursor \
                                             darkcolor \
                                             gripsize \
                                             innercolor \
                                             lightcolor \
                                             outercolor \
                                             thickness \
                                             thumbrelief \
                                             troughcolor \
                                             troughrelief];

    # Set the default 'non-styleable' scale options values.
    set ::ms::default(scale,class)     TScale
    set ::ms::default(scale,cmenu)     {}
    set ::ms::default(scale,command)   {}
    set ::ms::default(scale,from)      0
    set ::ms::default(scale,increment) 1
    set ::ms::default(scale,length)    200
    set ::ms::default(scale,orient)    horizontal
    set ::ms::default(scale,state)     normal
    set ::ms::default(scale,style)     TScale
    set ::ms::default(scale,takefocus) 1
    set ::ms::default(scale,to)        1.0
    set ::ms::default(scale,value)     0
    set ::ms::default(scale,variable)  {}

    # Note: The default 'styleable' scale options values are always defined inside the current theme.
}

# Rename the original Tk **scale** and **ttk::scale** commands.
rename scale      _scale
rename ttk::scale _ttk_scale

# Create aliases for the mustang **scale** command.
interp alias {} scale      {} ::ms::scale::Command
interp alias {} ttk::scale {} ::ms::scale::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::scale** widget command.
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
proc ::ms::scale::Command { window { args "" } } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the 'window' address and set its real and short addresses.
    set addresses  [::ms::Check_Widget_Address $window $caller_info]
    set w          [lindex $addresses 0]
    set short_addr [lindex $addresses 1]

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
            set ::ms::default($w,class)     $::ms::default(scale,class)
            set ::ms::default($w,cmenu)     $::ms::default(scale,cmenu)
            set ::ms::default($w,command)   $::ms::default(scale,command)
            set ::ms::default($w,from)      $::ms::default(scale,from)
            set ::ms::default($w,increment) $::ms::default(scale,increment)
            set ::ms::default($w,length)    $::ms::default(scale,length)
            set ::ms::default($w,orient)    $::ms::default(scale,orient)
            set ::ms::default($w,state)     $::ms::default(scale,state)
            set ::ms::default($w,style)     $::ms::default(scale,style)
            set ::ms::default($w,takefocus) $::ms::default(scale,takefocus)
            set ::ms::default($w,to)        $::ms::default(scale,to)
            set ::ms::default($w,value)     $::ms::default(scale,value)
            set ::ms::default($w,variable)  $::ms::default(scale,variable)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)     $::ms::default(scale,class)
            set ::ms::current($w,cmenu)     $::ms::default(scale,cmenu)
            set ::ms::current($w,command)   $::ms::default(scale,command)
            set ::ms::current($w,from)      $::ms::default(scale,from)
            set ::ms::current($w,increment) $::ms::default(scale,increment)
            set ::ms::current($w,length)    $::ms::default(scale,length)
            set ::ms::current($w,orient)    $::ms::default(scale,orient)
            set ::ms::current($w,state)     $::ms::default(scale,state)
            set ::ms::current($w,style)     $::ms::default(scale,style)
            set ::ms::current($w,takefocus) $::ms::default(scale,takefocus)
            set ::ms::current($w,to)        $::ms::default(scale,to)
            set ::ms::current($w,value)     $::ms::default(scale,value)
            set ::ms::current($w,variable)  $::ms::default(scale,variable)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) scale

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
            #       To make a scale styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **scale** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)   Tk
            set ::ms::managed_by($w,bordercolor)  Tk
            set ::ms::managed_by($w,borderwidth)  Tk
            set ::ms::managed_by($w,cursor)       Tk
            set ::ms::managed_by($w,darkcolor)    Tk
            set ::ms::managed_by($w,gripsize)     Tk
            set ::ms::managed_by($w,innercolor)   Tk
            set ::ms::managed_by($w,lightcolor)   Tk
            set ::ms::managed_by($w,outercolor)   Tk
            set ::ms::managed_by($w,thickness)    Tk
            set ::ms::managed_by($w,thumbrelief)  Tk
            set ::ms::managed_by($w,troughcolor)  Tk
            set ::ms::managed_by($w,troughrelief) Tk

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
                    -command { set ::ms::current($w,command) $value }
                    -cursor {
                        set value [string tolower $value]
                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                            set ::ms::current($w,cursor)    $value
                            set ::ms::managed_by($w,cursor) developer
                        }
                    }
                    -darkcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,darkcolor)    $value
                        set ::ms::managed_by($w,darkcolor) developer
                    }
                    -from {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,from) $value
                    }
                    -gripsize {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,gripsize)    $value
                        set ::ms::managed_by($w,gripsize) developer
                    }
                    -increment {
                        switch -- [string is double -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,increment) $value
                                }
                            }
                        }
                    }
                    -innercolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,innercolor)    $value
                        set ::ms::managed_by($w,innercolor) developer
                    }
                    -length {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,length) $value
                    }
                    -lightcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,lightcolor)    $value
                        set ::ms::managed_by($w,lightcolor) developer
                    }
                    -orient {
                        set value [string tolower $value]
                        switch -- $value {
                            horizontal -
                            vertical   { set ::ms::current($w,orient) $value }
                        }
                    }
                    -outercolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,outercolor)    $value
                        set ::ms::managed_by($w,outercolor) developer
                    }
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            disabled -
                            normal   { set ::ms::current($w,state) $value }
                        }
                    }
                    -style {
                        if { $value ni $::ms::style($::ms::theme) } {
                            continue
                        }

                        set ::ms::current($w,style) $value
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
                    -thickness {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,thickness)    $value
                        set ::ms::managed_by($w,thickness) developer
                    }
                    -thumbrelief {
                        set value [string tolower $value]
                        switch -- $value {
                            flat   -
                            groove -
                            raised -
                            ridge  -
                            solid  -
                            sunken {
                                set ::ms::current($w,thumbrelief)    $value
                                set ::ms::managed_by($w,thumbrelief) developer
                            }
                        }
                    }
                    -to {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,to) $value
                    }
                    -troughcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,troughcolor)    $value
                        set ::ms::managed_by($w,troughcolor) developer
                    }
                    -troughrelief {
                        set value [string tolower $value]
                        switch -- $value {
                            flat   -
                            groove -
                            raised -
                            ridge  -
                            solid  -
                            sunken {
                                set ::ms::current($w,troughrelief)    $value
                                set ::ms::managed_by($w,troughrelief) developer
                            }
                        }
                    }
                    -value {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,value) $value
                    }
                    -variable {
                        switch -- [info exists $value] {
                            1   { set ::ms::current($w,variable) $value }
                        }
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::scale(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TScale,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            # Check the widget state and set the takefocus and cursor accordingly.
            switch -- $::ms::current($w,state) {
                disabled {
                    set cursor    arrow
                    set takefocus 0
                }
                normal {
                    set cursor    $::ms::current($w,cursor)
                    set takefocus $::ms::current($w,takefocus)
                }
            }

            # Check if the style provided has children.
            set orient [string totitle $::ms::current($w,orient)]
            set index  [string last "." $::ms::current($w,style)]
            switch -- $index {
                -1      { set parent_style [string cat $orient "." $::ms::current($w,style)] }
                default {
                    # Check if the style child positioned at 'end-1' corresponds to the word 'Horizontal' or 'Vertical'.
                    set children [split $::ms::current($w,style) "."]
                    if { [lindex $children end-1] eq $orient } {
                        set parent_style [string cat $orient "." [lindex $children end]]
                    } else {
                        set parent_style $orient
                        foreach word $children {
                            switch -nocase -- $word {
                                Horizontal -
                                Vertical   { ::ms::Error "Invalid style name, '$::ms::current($w,style)'." $caller_info }
                                default    { set parent_style [string cat $parent_style "." $word] }
                            }
                        }
                    }
                }
            }

            # If the parent style layout is not known by mustang, set it as the current theme layout orientation.
            if { $parent_style ni $::ms::layouts($::ms::theme) } {
                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TScale]]
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'borderwidth', 'cursor', 'thumbrelief' and 'troughrelief' are not allowed to change if the statespec changes.

            ###################
            ##               ##
            ##     SCALE     ##
            ##               ##
            ###################

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                   "_gs="  $::ms::current($w,gripsize) \
                                                   "_ic="  $::ms::current($w,innercolor) \
                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                   "_oc="  $::ms::current($w,outercolor) \
                                                   "_tn="  $::ms::current($w,thickness) \
                                                   "_thr=" $::ms::current($w,thumbrelief) \
                                                   "_tc="  $::ms::current($w,troughcolor) \
                                                   "_tr="  $::ms::current($w,troughrelief) \
                                                   "." $parent_style];

            # If needed, create the widget style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)       -arrowsize $::ms::current($w,thickness) \
                                                                  -background $::ms::current($w,background) \
                                                                 -bordercolor $::ms::current($w,bordercolor) \
                                                                   -darkcolor $::ms::current($w,darkcolor) \
                                                                    -gripsize $::ms::current($w,gripsize) \
                                                                 -groovewidth $::ms::current($w,thickness) \
                                                                  -innercolor $::ms::current($w,innercolor) \
                                                                  -lightcolor $::ms::current($w,lightcolor) \
                                                                  -outercolor $::ms::current($w,outercolor) \
                                                                -sliderrelief $::ms::current($w,thumbrelief) \
                                                             -sliderthickness $::ms::current($w,thickness) \
                                                                 -troughcolor $::ms::current($w,troughcolor) \
                                                                -troughrelief $::ms::current($w,troughrelief);

                # Add the widget style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
            }

            # Initialize the widget mapping.
            set mapping [list ]

            # background
            switch -- $::ms::managed_by($w,background) {
                developer { lappend mapping -background [list pressed $::ms::current($w,background)] }
                Tk  {
                    # Check if a 'background' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),background)] {
                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),background) }
                    }
                }
            }

            # bordercolor
            switch -- $::ms::managed_by($w,bordercolor) {
                developer { lappend mapping -bordercolor [list pressed $::ms::current($w,bordercolor)] }
                Tk  {
                    # Check if a 'bordercolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor)] {
                        1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor) }
                    }
                }
            }

            # darkcolor
            switch -- $::ms::managed_by($w,darkcolor) {
                developer { lappend mapping -darkcolor [list pressed $::ms::current($w,darkcolor)] }
                Tk  {
                    # Check if a 'darkcolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor)] {
                        1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor) }
                    }
                }
            }

            # innercolor
            switch -- $::ms::managed_by($w,innercolor) {
                developer { lappend mapping -innercolor [list pressed $::ms::current($w,innercolor)] }
                Tk  {
                    # Check if a 'innercolor' mapping exists for 'stylename'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),innercolor)] {
                        1   { lappend mapping -innercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),innercolor) }
                    }
                }
            }

            # lightcolor
            switch -- $::ms::managed_by($w,lightcolor) {
                developer { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
                Tk  {
                    # Check if a 'lightcolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor)] {
                        1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor) }
                    }
                }
            }

            # outercolor
            switch -- $::ms::managed_by($w,outercolor) {
                developer { lappend mapping -outercolor [list pressed $::ms::current($w,outercolor)] }
                Tk  {
                    # Check if a 'outercolor' mapping exists for 'stylename'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),outercolor)] {
                        1   { lappend mapping -outercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),outercolor) }
                    }
                }
            }

            # troughcolor
            switch -- $::ms::managed_by($w,troughcolor) {
                developer { lappend mapping -troughcolor [list pressed $::ms::current($w,troughcolor)] }
                Tk  {
                    # Check if a 'troughcolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),troughcolor)] {
                        1   { lappend mapping -troughcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),troughcolor) }
                    }
                }
            }

            # If needed, create the widget mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,widget) {*}$mapping

                # Add the widget mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the scale widget.
            _ttk_scale $w     -class $::ms::current($w,class) \
                            -command $::ms::current($w,command) \
                             -cursor $cursor \
                               -from $::ms::current($w,from) \
                             -length $::ms::current($w,length) \
                             -orient $::ms::current($w,orient) \
                              -state $::ms::current($w,state) \
                              -style $::ms::style($w,widget) \
                          -takefocus $takefocus \
                                 -to $::ms::current($w,to) \
                              -value $::ms::current($w,value) \
                           -variable $::ms::current($w,variable);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TScale  { _bindtags $w [list $w _Scale TScale $::ms::addr($w,toplevel) all] }
                default { _bindtags $w [list $w $::ms::current($w,class) _Scale TScale $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::scale::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::scale::Pathname_Cmd $w]
            }

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w

            # Set the structure addresses.
            set ::ms::addr($w,structure) [list $w]

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short address relative to its real address, 'w'.
            set ::ms::addr($w,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals)  $w
            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the scale widgets real address list.
            lappend ::ms::addr(scale) $w

            # Add the widget address to the scale classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),scale,addrs) $w

            # Add the widget address to the scale classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),scale,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the scale classtype.
            if { $::ms::current($w,style) ni $::ms::style(scale,classtype) } {
                lappend ::ms::style(scale,classtype) $::ms::current($w,style)
            }

            # Depending on the address type provided, return the widget real or short address.
            switch -- $type {
                real  { return $w }
                short { return $short_addr }
            }
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
proc ::ms::scale::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::scale(non_styleable,options)) || ($option in $::ms::scale(styleable,options)) } {
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
                    foreach option $::ms::scale(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::scale(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::scale(non_styleable,options)) || ($option in $::ms::scale(styleable,options)) } {
                        return [list $::ms::default($w,$option) $::ms::current($w,$option)]
                    } else {
                        ::ms::Error "Invalid configure option, '$args'." $caller_info
                    }
                }
                default {
                    # Check that the command's 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
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
                                    -command { set ::ms::current($w,command) $value }
                                    -cursor {
                                        set value [string tolower $value]
                                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                                            set ::ms::current($w,cursor)    $value
                                            set ::ms::managed_by($w,cursor) developer
                                        }
                                    }
                                    -darkcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,darkcolor)    $value
                                        set ::ms::managed_by($w,darkcolor) developer
                                    }
                                    -from {
                                        switch -- [string is double -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,from) $value
                                    }
                                    -gripsize {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,gripsize)    $value
                                        set ::ms::managed_by($w,gripsize) developer
                                    }
                                    -increment {
                                        switch -- [string is double -strict $value] {
                                            1   {
                                                if { $value > 0 } {
                                                    set ::ms::current($w,increment) $value
                                                }
                                            }
                                        }
                                    }
                                    -innercolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,innercolor)    $value
                                        set ::ms::managed_by($w,innercolor) developer
                                    }
                                    -length {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,length) $value
                                    }
                                    -lightcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,lightcolor)    $value
                                        set ::ms::managed_by($w,lightcolor) developer
                                    }
                                    -orient {}
                                    -outercolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,outercolor)    $value
                                        set ::ms::managed_by($w,outercolor) developer
                                    }
                                    -state {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            disabled -
                                            normal   { set ::ms::current($w,state) $value }
                                        }
                                    }
                                    -style {
                                        if { $value ni $::ms::style($::ms::theme) } {
                                            continue
                                        }

                                        # Remove the widget address from the scale classtype real address list that contains all the
                                        # widgets addresses with style '::ms::current($w,style)'.
                                        set index [lsearch -exact $::ms::style($::ms::current($w,style),scale,addrs) $w]
                                        switch -- $index {
                                            -1      {}
                                            default { set ::ms::style($::ms::current($w,style),scale,addrs) [lremove $::ms::style($::ms::current($w,style),scale,addrs) $index] }
                                        }

                                        # Add the widget address to the address list that contains all the
                                        # widgets addresses with style 'value'.
                                        lappend ::ms::style($value,scale,addrs) $w

                                        # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                        # for the scale classtype.
                                        switch -- [llength $::ms::style($::ms::current($w,style),scale,addrs)] {
                                            0   {
                                                set index [lsearch -exact $::ms::style(scale,classtype) $::ms::current($w,style)]
                                                switch -- $index {
                                                    -1      {}
                                                    default { set ::ms::style(scale,classtype) [lremove $::ms::style(scale,classtype) $index] }
                                                }
                                            }
                                        }

                                        # If needed, add 'value' to the available styles for the scale classtype.
                                        if { $value ni $::ms::style(scale,classtype) } {
                                            lappend ::ms::style(scale,classtype) $value
                                        }

                                        # Update the current style associated with the widget with 'value'.
                                        set ::ms::current($w,style) $value
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
                                    -thickness {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,thickness)    $value
                                        set ::ms::managed_by($w,thickness) developer
                                    }
                                    -thumbrelief {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            flat   -
                                            groove -
                                            raised -
                                            ridge  -
                                            solid  -
                                            sunken {
                                                set ::ms::current($w,thumbrelief)    $value
                                                set ::ms::managed_by($w,thumbrelief) developer
                                            }
                                        }
                                    }
                                    -to {
                                        switch -- [string is double -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,to) $value
                                    }
                                    -troughcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,troughcolor)    $value
                                        set ::ms::managed_by($w,troughcolor) developer
                                    }
                                    -troughrelief {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            flat   -
                                            groove -
                                            raised -
                                            ridge  -
                                            solid  -
                                            sunken {
                                                set ::ms::current($w,troughrelief)    $value
                                                set ::ms::managed_by($w,troughrelief) developer
                                            }
                                        }
                                    }
                                    -value {
                                        switch -- [string is double -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,value) $value
                                    }
                                    -variable {
                                        switch -- [info exists $value] {
                                            1   { set ::ms::current($w,variable) $value }
                                        }
                                    }
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TScale,$option)

                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            # Check the widget state and set the takefocus and cursor accordingly.
                            switch -- $::ms::current($w,state) {
                                disabled {
                                    set cursor    arrow
                                    set takefocus 0
                                }
                                normal {
                                    set cursor    $::ms::current($w,cursor)
                                    set takefocus $::ms::current($w,takefocus)
                                }
                            }

                            # Check if the style provided has children.
                            set orient [string totitle $::ms::current($w,orient)]
                            set index  [string last "." $::ms::current($w,style)]
                            switch -- $index {
                                -1      { set parent_style [string cat $orient "." $::ms::current($w,style)] }
                                default {
                                    # Check if the style child positioned at 'end-1' corresponds to the word 'Horizontal' or 'Vertical'.
                                    set children [split $::ms::current($w,style) "."]
                                    if { [lindex $children end-1] eq $orient } {
                                        set parent_style [string cat $orient "." [lindex $children end]]
                                    } else {
                                        set parent_style $orient
                                        foreach word $children {
                                            switch -nocase -- $word {
                                                Horizontal -
                                                Vertical   { ::ms::Error "Invalid style name, '$::ms::current($w,style)'." $caller_info }
                                                default    { set parent_style [string cat $parent_style "." $word] }
                                            }
                                        }
                                    }
                                }
                            }

                            # If the parent style layout is not known by mustang, set it as the current theme layout orientation.
                            if { $parent_style ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TScale]]
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'borderwidth', 'cursor', 'thumbrelief' and 'troughrelief' are not allowed to change if the statespec changes.

                            ###################
                            ##               ##
                            ##     SCALE     ##
                            ##               ##
                            ###################

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                                   "_gs="  $::ms::current($w,gripsize) \
                                                                   "_ic="  $::ms::current($w,innercolor) \
                                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                                   "_oc="  $::ms::current($w,outercolor) \
                                                                   "_thr=" $::ms::current($w,thumbrelief) \
                                                                   "_tn="  $::ms::current($w,thickness) \
                                                                   "_tc="  $::ms::current($w,troughcolor) \
                                                                   "_tr="  $::ms::current($w,troughrelief) \
                                                                   "." $parent_style];

                            # If needed, create the widget style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)       -arrowsize $::ms::current($w,thickness) \
                                                                                  -background $::ms::current($w,background) \
                                                                                 -bordercolor $::ms::current($w,bordercolor) \
                                                                                   -darkcolor $::ms::current($w,darkcolor) \
                                                                                    -gripsize $::ms::current($w,gripsize) \
                                                                                  -innercolor $::ms::current($w,innercolor) \
                                                                                  -lightcolor $::ms::current($w,lightcolor) \
                                                                                  -outercolor $::ms::current($w,outercolor) \
                                                                                -sliderrelief $::ms::current($w,thumbrelief) \
                                                                             -sliderthickness $::ms::current($w,thickness) \
                                                                                 -troughcolor $::ms::current($w,troughcolor) \
                                                                                -troughrelief $::ms::current($w,troughrelief);

                                # Add the widget style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
                            }

                            # Initialize the widget mapping.
                            set mapping [list ]

                            # background
                            switch -- $::ms::managed_by($w,background) {
                                developer { lappend mapping -background [list pressed $::ms::current($w,background)] }
                                Tk  {
                                    # Check if a 'background' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),background)] {
                                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),background) }
                                    }
                                }
                            }

                            # bordercolor
                            switch -- $::ms::managed_by($w,bordercolor) {
                                developer { lappend mapping -bordercolor [list pressed $::ms::current($w,bordercolor)] }
                                Tk  {
                                    # Check if a 'bordercolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor)] {
                                        1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor) }
                                    }
                                }
                            }

                            # darkcolor
                            switch -- $::ms::managed_by($w,darkcolor) {
                                developer { lappend mapping -darkcolor [list pressed $::ms::current($w,darkcolor)] }
                                Tk  {
                                    # Check if a 'darkcolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor)] {
                                        1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor) }
                                    }
                                }
                            }

                            # innercolor
                            switch -- $::ms::managed_by($w,innercolor) {
                                developer { lappend mapping -innercolor [list pressed $::ms::current($w,innercolor)] }
                                Tk  {
                                    # Check if a 'innercolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),innercolor)] {
                                        1   { lappend mapping -innercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),innercolor) }
                                    }
                                }
                            }

                            # lightcolor
                            switch -- $::ms::managed_by($w,lightcolor) {
                                developer { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
                                Tk  {
                                    # Check if a 'lightcolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor)] {
                                        1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor) }
                                    }
                                }
                            }

                            # outercolor
                            switch -- $::ms::managed_by($w,outercolor) {
                                developer { lappend mapping -outercolor [list pressed $::ms::current($w,outercolor)] }
                                Tk  {
                                    # Check if a 'outercolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),outercolor)] {
                                        1   { lappend mapping -outercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),outercolor) }
                                    }
                                }
                            }

                            # troughcolor
                            switch -- $::ms::managed_by($w,troughcolor) {
                                developer { lappend mapping -troughcolor [list pressed $::ms::current($w,troughcolor)] }
                                Tk  {
                                    # Check if a 'troughcolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),troughcolor)] {
                                        1   { lappend mapping -troughcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),troughcolor) }
                                    }
                                }
                            }

                            # If needed, create the widget mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,widget) {*}$mapping

                                # Add the widget mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure   -command $::ms::current($w,command) \
                                                                   -cursor $cursor \
                                                                     -from $::ms::current($w,from) \
                                                                   -length $::ms::current($w,length) \
                                                                    -state $::ms::current($w,state) \
                                                                    -style $::ms::style($w,widget) \
                                                                -takefocus $takefocus \
                                                                       -to $::ms::current($w,to) \
                                                                    -value $::ms::current($w,value) \
                                                                 -variable $::ms::current($w,variable);

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        coords -
        get    -
        set    {
            # Synopsis:
            #
            # *window* **coords** ?*value*?
            # *window* **get** ?*x* *y*?
            # *window* **set** *value*

            # Execute the command.
            try {
                interp invokehidden {} $w $cmd {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        identify {
            # Synopsis:
            #
            # *window* **identify** *x* *y*
            # *window* **identify** **element** *x* *y*
            switch -- [llength $args] {
                2   {
                    set x [lindex $args 0]
                    set y [lindex $args 1]
                }
                3   {
                    # Check that the first argument of 'args' is the word "element".
                    switch -- [lindex $args 0] {
                        element {}
                        default { ::ms::Error "Invalid option, '$args'." $caller_info }
                    }

                    set x [lindex $args 1]
                    set y [lindex $args 2]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check that the (x,y) relative coordinates provided are valid.
            switch -- [string is integer -strict $x] {
                0   { return "" }
                1   {
                    # Check that the 'x' coordinate is a positive integer ('0' included).
                    if { $x < 0 } {
                        return ""
                    }
                }
            }

            switch -- [string is integer -strict $y] {
                0   { return "" }
                1   {
                    # Check that the 'y' coordinate is a positive integer ('0' included).
                    if { $y < 0 } {
                        return ""
                    }
                }
            }

            # Check if the coordinates provided falls upon the widget.
            try {
                interp invokehidden {} $w identify element $x $y
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                switch -- $result {
                    Scale.slider { return "Scale.slider" }
                    default      { return "Scale.trough" }
                }
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

                    # Execute the command.
                    try {
                        interp invokehidden {} $w instate $statespec
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
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

                    # Execute the command.
                    try {
                        interp invokehidden {} $w instate $statespec $script
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
                0   { return [interp invokehidden {} $w state] }
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

                    #######################################
                    ##                                   ##
                    ##     UPDATE THE WIDGET'S STATE     ##
                    ##                                   ##
                    #######################################

                    return [interp invokehidden {} $w state $statespec]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        style {
            # Synopsis:
            #
            # *window* **style**
            switch -- [llength $args] {
                0   {
                    switch -- [string last "." $::ms::current($w,style)] {
                        -1      { return [string cat [string totitle $::ms::current($w,orient)] "." $::ms::current($w,style)] }
                        default { return $::ms::current($w,style) }
                    }
                }
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
# Update any scale widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::scale::Style_Update { stylename caller_info } {
    # Check if exists the horizontal and vertical layout for 'stylename'.
    foreach orient [list horizontal vertical] {
        # Check if 'stylename' has style children.
        set dir   [string totitle $orient]
        set index [string last "." $stylename]
        switch -- $index {
            -1      { set parent_style($orient) [string cat $dir "." $stylename] }
            default {
                # Check if the style child positioned at 'end-1' corresponds to the word 'Horizontal' or 'Vertical'.
                set children [split $stylename "."]
                if { [lindex $children end-1] eq $dir } {
                    set parent_style($orient) [string cat $dir "." [lindex $children end]]
                } else {
                    set parent_style($orient) $dir
                    foreach word $children {
                        switch -nocase -- $word {
                            Horizontal -
                            Vertical   { ::ms::Error "Invalid style name, '$stylename'." $caller_info }
                            default    { set parent_style($orient) [string cat $parent_style($orient) "." $word] }
                        }
                    }
                }
            }
        }

        # If the parent style layout is not known by mustang, set it as the current theme layout '$orient.TProgressbar'.
        if { $parent_style($orient) ni $::ms::layouts($::ms::theme) } {
            _ttk_style layout $parent_style($orient) [_ttk_style layout [string cat $dir "." TProgressbar]]
        }
    }

    # Update all the scale widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,scale,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::scale(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TScale,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        # Check the widget state and set the relative cursor.
        switch -- $::ms::current($w,state) {
            disabled { set cursor arrow }
            normal   { set cursor $::ms::current($w,cursor) }
        }

        #######################################
        ##                                   ##
        ##     UPDATE THE WIDGET'S STYLE     ##
        ##                                   ##
        #######################################

        # Note: 'borderwidth', 'cursor', 'thumbrelief' and 'troughrelief' are not allowed to change if the statespec changes.

        ###################
        ##               ##
        ##     SCALE     ##
        ##               ##
        ###################

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                               "_bc="  $::ms::current($w,bordercolor) \
                                               "_dc="  $::ms::current($w,darkcolor) \
                                               "_gs="  $::ms::current($w,gripsize) \
                                               "_ic="  $::ms::current($w,innercolor) \
                                               "_lc="  $::ms::current($w,lightcolor) \
                                               "_oc="  $::ms::current($w,outercolor) \
                                               "_thr=" $::ms::current($w,thumbrelief) \
                                               "_tn="  $::ms::current($w,thickness) \
                                               "_tc="  $::ms::current($w,troughcolor) \
                                               "_tr="  $::ms::current($w,troughrelief) \
                                               "." $parent_style($::ms::current($w,orient))];

        # If needed, create the widget style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)       -arrowsize $::ms::current($w,thickness) \
                                                              -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                                -gripsize $::ms::current($w,gripsize) \
                                                             -groovewidth $::ms::current($w,thickness) \
                                                              -innercolor $::ms::current($w,innercolor) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                              -outercolor $::ms::current($w,outercolor) \
                                                            -sliderrelief $::ms::current($w,thumbrelief) \
                                                         -sliderthickness $::ms::current($w,thickness) \
                                                             -troughcolor $::ms::current($w,troughcolor) \
                                                            -troughrelief $::ms::current($w,troughrelief);

            # Add the widget style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
        }

        # Initialize the widget mapping.
        set mapping [list ]

        # background
        switch -- $::ms::managed_by($w,background) {
            developer { lappend mapping -background [list pressed $::ms::current($w,background)] }
            Tk  {
                # Check if a 'background' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,background)] {
                    1   { lappend mapping -background $::ms::stylemap($::ms::theme,$stylename,background) }
                }
            }
        }

        # bordercolor
        switch -- $::ms::managed_by($w,bordercolor) {
            developer { lappend mapping -bordercolor [list pressed $::ms::current($w,bordercolor)] }
            Tk  {
                # Check if a 'bordercolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,bordercolor)] {
                    1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$stylename,bordercolor) }
                }
            }
        }

        # darkcolor
        switch -- $::ms::managed_by($w,darkcolor) {
            developer { lappend mapping -darkcolor [list pressed $::ms::current($w,darkcolor)] }
            Tk  {
                # Check if a 'darkcolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,darkcolor)] {
                    1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$stylename,darkcolor) }
                }
            }
        }

        # innercolor
        switch -- $::ms::managed_by($w,innercolor) {
            developer { lappend mapping -innercolor [list pressed $::ms::current($w,innercolor)] }
            Tk  {
                # Check if a 'innercolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,innercolor)] {
                    1   { lappend mapping -innercolor $::ms::stylemap($::ms::theme,$stylename,innercolor) }
                }
            }
        }

        # lightcolor
        switch -- $::ms::managed_by($w,lightcolor) {
            developer { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
            Tk  {
                # Check if a 'lightcolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,lightcolor)] {
                    1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$stylename,lightcolor) }
                }
            }
        }

        # outercolor
        switch -- $::ms::managed_by($w,outercolor) {
            developer { lappend mapping -outercolor [list pressed $::ms::current($w,outercolor)] }
            Tk  {
                # Check if a 'outercolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,outercolor)] {
                    1   { lappend mapping -outercolor $::ms::stylemap($::ms::theme,$stylename,outercolor) }
                }
            }
        }

        # troughcolor
        switch -- $::ms::managed_by($w,troughcolor) {
            developer { lappend mapping -troughcolor [list pressed $::ms::current($w,troughcolor)] }
            Tk  {
                # Check if a 'troughcolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,troughcolor)] {
                    1   { lappend mapping -troughcolor $::ms::stylemap($::ms::theme,$stylename,troughcolor) }
                }
            }
        }

        # If needed, create the widget mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,widget) {*}$mapping

            # Add the widget mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        interp invokehidden {} $w configure -cursor $cursor \
                                             -style $::ms::style($w,widget);
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

## ButtonPress
#
# Manage the **ButtonPress** event upon the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the mouse pointer (x,y) relative coordinates.
#        These value should be provided by the **ButtonPress** event.
#
# It doesn't return anything.
proc ::ms::scale::ButtonPress { w x y } {
    # Note: This procedure was inspired by the ttk::scale procedure 'Press'.
    #       The procedure have been slighty modified to work with mustang.
    #       All credits goes to the original author/s.

    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is focussable or not.
    switch -- [::ms::Is_Focussable $w] {
        0   { return "" }
    }

    # Check if the widget is already focussed.
    switch -- [interp invokehidden {} $w instate [list !focus]] {
        0   {
            # Change the widget dynamic state to 'pressed'.
            interp invokehidden {} $w state [list pressed]
        }
        1   {
            # Focus the widget.
            _focus -force $w

            # Change the widget dynamic state to 'pressed focus'.
            interp invokehidden {} $w state [list pressed focus]
        }
    }

    set ::ttk::scale::State(dragging) 0

    # Set the current trough position.
    set current_pos [interp invokehidden {} $w get]

    # Check the scale element where the buttonpress happened.
    switch -glob -- [interp invokehidden {} $w identify element $x $y] {
        *track  -
        *trough {
            # Get the trough position indicated by x and y.
            set new_pos [interp invokehidden {} $w get $x $y]

            # Check the '::ms::clickaction' variable.
            switch -- $::ms::clickaction {
                jump {
                    # Jump to the new coordinates.
                    interp invokehidden {} $w set $new_pos

                    set ::ttk::scale::State(dragging) 1
                    set ::ttk::scale::State(initial)  [$w get]
                }
                scroll {
                    # Scroll the widget's thumb towards the new coordinates.
                    if { ($new_pos <= $current_pos) || ($::ms::current($w,from) > $::ms::current($w,to)) } {
                        ::ttk::Repeatedly ::ms::scale::Increment $w -1 1x
                    } else {
                        ::ttk::Repeatedly ::ms::scale::Increment $w +1 1x
                    }
                }
            }
        }
        *slider {
            # Register the draging initial position.
            set ::ttk::scale::State(dragging) 1
            set ::ttk::scale::State(initial)  $current_pos
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
proc ::ms::scale::Destroy { w } {
    # Get the short address related to the widget real address.
    set short_addr $::ms::addr($w,short)

    # Destroy the aliased widget pathcommands.
    foreach token $::ms::data($w,token) {
        interp alias {} $token {}
    }

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

    # Remove the widget address from the scale widgets real address list.
    set index [lsearch -exact $::ms::addr(scale) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(scale) [lremove $::ms::addr(scale) $index] }
    }

    # Remove the widget address from the scale classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),scale,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),scale,addrs) [lremove $::ms::class($::ms::current($w,class),scale,addrs) $index] }
    }

    # Remove the widget address from the scale classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),scale,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),scale,addrs) [lremove $::ms::style($::ms::current($w,style),scale,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the scale classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),scale,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(scale,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(scale,classtype) [lremove $::ms::style(scale,classtype) $index] }
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
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,command) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,from) \
                         ::ms::current($w,gripsize) \
                         ::ms::current($w,increment) \
                         ::ms::current($w,innercolor) \
                         ::ms::current($w,length) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,orient) \
                         ::ms::current($w,outercolor) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,thickness) \
                         ::ms::current($w,thumbrelief) \
                         ::ms::current($w,to) \
                         ::ms::current($w,troughcolor) \
                         ::ms::current($w,troughrelief) \
                         ::ms::current($w,value) \
                         ::ms::current($w,variable);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,command) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,from) \
                         ::ms::default($w,gripsize) \
                         ::ms::default($w,increment) \
                         ::ms::default($w,innercolor) \
                         ::ms::default($w,length) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,orient) \
                         ::ms::default($w,outercolor) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,thickness) \
                         ::ms::default($w,thumbrelief) \
                         ::ms::default($w,to) \
                         ::ms::default($w,troughcolor) \
                         ::ms::default($w,troughrelief) \
                         ::ms::default($w,value) \
                         ::ms::default($w,variable);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,gripsize) \
                         ::ms::managed_by($w,innercolor) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,outercolor) \
                         ::ms::managed_by($w,thickness) \
                         ::ms::managed_by($w,thumbrelief) \
                         ::ms::managed_by($w,troughcolor) \
                         ::ms::managed_by($w,troughrelief);

    unset -nocomplain -- ::ms::style($w,widget)

    return ""
}

## FocusOut
#
# Manage the **FocusOut** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::scale::FocusOut { w } {
    # If '$::ms::current($w,cmenu)' exists (meaning it's open), do not loose the focus (graphically).
    switch -- [_winfo exists $::ms::current($w,cmenu)] {
        0   { interp invokehidden {} $w state [list !focus] }
        1   { interp invokehidden {} $w state [list  focus] }
    }

    return ""
}

## Increment
#
# Move the widget's thumb by the increment specified for the widget.
#
# Where:
#
# w           Should be the widget real address involved.
#
# direction   Should be the direction of the movement.
#             Allowed values are **-1** or **+1**.
#                -1  --> Means towards the left for horizontal scales or towards the top for vertical scales.
#                +1  --> Means towards the right for horizontal scales or towards the bottom for vertical scales.
#
# speed       Should be the scroll speed (1x, 2x, 3x ...).
#             If not provided, defaults to **1x**.
#
# It doesn't return anything.
proc ::ms::scale::Increment { w direction { speed 1x } } {
    # Note: This procedure was inspired by the ttk::scale procedure 'Increment'.
    #       The procedure have been slighty modified to work with mustang.
    #       All credits goes to the original author/s.

    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Set 'increment' based on the direction of the movement.
    switch -- $direction {
        -1  { set increment [expr { -1.0*$::ms::current($w,increment) }] }
        +1  { set increment $::ms::current($w,increment) }
    }

    # Augment 'increment' by 'speed'.
    set speed [string range $speed 0 end-1]
    switch -- [string is integer -strict $speed] {
        1   { set increment [expr { $increment*$speed }] }
    }

    # Move the widget's thumb.
    interp invokehidden {} $w set [expr { [interp invokehidden {} $w get]+$increment }]

    return ""
}

## MouseWheel
#
# Scroll the widget's thumb vertically with the mousewheel.
#
# Where:
#
# w        Should be the widget real address involved.
#
# delta    Should be the delta of the scroll.
#
# axis     Should be the axis of the scroll.
#          Allowed values are **X** or **Y**.
#
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#          If not provided, defaults to **units**.
#
# speed    Should be the scroll speed (1x, 2x, 3x ...).
#          If not provided, defaults to **1x**.
#
# It doesn't return anything.
proc ::ms::scale::MouseWheel { w delta axis { what units } { speed 1x } } {
    switch -- $::ms::current($w,state) {
        disabled {
            # Check the axis provided.
            switch -nocase -- $axis {
                X       { ::ms::Scroll_Parent_X $w $delta $what }
                default { ::ms::Scroll_Parent_Y $w $delta $what }
            }
        }
        default {
            # Set 'increment' based on the direction of the movement.
            if { $delta > 0 } {
                set increment [expr { -1.0*$::ms::current($w,increment) }]
            } else {
                set increment $::ms::current($w,increment)
            }

            # Adjust 'increment' based on the mouse scrollmode ('natural' or 'classic').
            switch -- $::ms::scrollmode {
                natural { set increment [expr { -1.0*$increment }] }
            }

            # Augment 'increment' by 'speed'.
            set speed [string range $speed 0 end-1]
            switch -- [string is integer -strict $speed] {
                1   { set increment [expr { $increment*$speed }] }
            }

            # Move the widget's thumb.
            interp invokehidden {} $w set [expr { [interp invokehidden {} $w get]+$increment }]
        }
    }

    return ""
}

## Touchpad
#
# Scroll the widget's thumb with the touchpad.
#
# Where:
#
# w         Should be the widget real address involved.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# delta     Should be the delta of the scroll.
#
# what      Should be a string that specifies the unit type.
#           Allowed values are the word **units** or **pages**.
#           If not provided, defaults to **units**.
#
# speed     Should be the scroll speed (1x, 2x, 3x ...)
#
# It doesn't return anything.
proc ::ms::scale::Touchpad { w counter delta { what units } { speed 1x } } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { ::ms::TouchpadScroll_Parent $w $counter $delta $what }
        default  {
            # <TouchpadScroll> events can be generated about 60 times per second
            # during a two-finger gesture.
            # This allow the binding script to respond to every 5th <TouchpadScroll> event
            # by testing is the 'counter' is divisible by 5.
            set counter [expr { $counter%5 }]
            if { $counter != 0 } {
                # Set 'increment' based on the direction of the movement.
                if { $delta > 0 } {
                    set increment [expr { -1.0*$::ms::current($w,increment) }]
                } else {
                    set increment $::ms::current($w,increment)
                }

                # Adjust 'increment' based on the mouse scrollmode ('natural' or 'classic').
                switch -- $::ms::scrollmode {
                    natural { set increment [expr { -1.0*$increment }] }
                }

                # Augment 'increment' by 'speed'.
                set speed [string range $speed 0 end-1]
                switch -- [string is integer -strict $speed] {
                    1   { set increment [expr { $increment*$speed }] }
                }

                # Move the widget's thumb.
                interp invokehidden {} $w set [expr { [interp invokehidden {} $w get]+$increment }]
            }
        }
    }

    return ""
}

#*EOF*