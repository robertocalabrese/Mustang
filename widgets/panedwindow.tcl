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

## panedwindow
#
#### DESCRIPTION:
#
# The panedwindow command creates a new window (given by the *window* argument) and makes it into a panedwindow widget.
# A panedwindow widget displays a number of subwindows (called *panes*), stacked either vertically or horizontally depending on
# the **-orient** option provided. The user may adjust the relative sizes of the subwindows by dragging the sash between panes.
#
# Panes should be created as direct children of the panedwindow widget.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname,
#         but the pathname's parents must exists.
#         *Window* may be provided either as a short or as a real address, the address returned will be:
#            - A short address, if the *window* provided as input is a short address.
#            - A real address, if the *window* provided as input is a real address.
#
# Nota 2: The panedwindow is one of the few containers that do not support the scrollbar system, at least not directly.
#         If you need scrollable panes, put two or more scrollable frames (the panes) inside the panedwindow.
#         See the example at the end.
#
# Note 3: Panedwindows are available only on Linux and BSD systems. See the KNOWN ISSUES section at the end to know more.
#
# Note 4: The mustang panedwindow widget (either scrollable or not) is a megawidget.
#         The simple panedwindow is composed by an hull object (the megawidget container) that acts also as a border object and a panedwindow object.
#
# Additional options, described below, may be specified on the command line to configure aspects of the panedwindow.
#
#### SYNOPSIS:
#
# **panedwindow**  *window* ?*option value*? ... ?*option value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-background**      It's a list that specifies the color to use as background.
#                      See the **COLOR OPTION** section to know how this list should be composed.
#
#                      Note: This is a styleable option.
#
#                            If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                     Only the developer can.
#
#                            If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                     If there isn't one, the **-background** of the **TPanedwindow** style
#                                                     will be used instead.
#                                                     The **-background** will always abide by its mapping values, if any.
#                                                     Styles, mappings and states events are allowed to change its value.
#
# **-bordercolor**     It's a list that specifies the color to use as bordercolor.
#                      See the **COLOR OPTION** section to know how this list should be composed.
#
#                      Note: It's only meaningful for widget with a **solid** or **flat** relief.
#
#                      Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                      Note: This is a styleable option.
#
#                            If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                     Only the developer can.
#
#                            If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                     If there isn't one, the **-bordercolor** of the **TPanedwindow** style
#                                                     will be used instead.
#                                                     The **-bordercolor** will always abide by its mapping values, if any.
#                                                     Styles, mappings and states events are allowed to change its value.
#
#                      See also **-borderwidth** and **-relief**.
#
# **-borderwidth**     Specifies the width of the three-dimensional border to draw around the outside of the widget,
#                      if such a border is being drawn.
#                      The **-relief** option typically determines this.
#
#                      The value may also be used when drawing three-dimensional effects in the widget's interior.
#                      The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                      (pixels, points, inches, millimeters or centimeters).
#
#                      Note: A value of **0** means no border.
#
#                      Note: Only working with reliefs that are not *flat*.
#
#                      Note: This is a styleable option.
#
#                            If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                     Only the developer can.
#
#                            If it's not provided --> The widget will follow the **-borderwidth** specified in its style.
#                                                     If there isn't one, the **-borderwidth** of the **TPanedwindow** style
#                                                     will be used instead.
#                                                     The **-borderwidth** will not abide by its mapping values, if any.
#                                                     It is not supposed to change when the widget state changes.
#
#                      See also **-bordercolor** and **-relief**.
#
# **-class**           Specifies a class for the widget.
#                      It is mainly used to make bindings for widgets that have the same class.
#
#                      Note: This option may only be provided while creating the widget.
#                            Attempts to change this value after the widget is created by using the **configure** command,
#                            will be ignored by mustang.
#
#                      If not provided, defaults to **TPanedwindow**.
#
# **-cursor**          Specifies the mouse cursor to be used for the widget.
#                      If an empty string is specified, it indicates that the widget should defer to it's parent for
#                      cursor specification.
#
#                      See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                      Note: This is a styleable option.
#
#                            If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                     Only the developer can.
#
#                            If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                     If there isn't one, the **-cursor** of the **TPanedwindow** style
#                                                     will be used instead.
#                                                     The **-cursor** will not abide by its mapping values, if any.
#                                                     It is not supposed to change when the widget state changes.
#
# **-darkcolor**       It's a list that specifies the color to use as darkcolor.
#                      See the **COLOR OPTION** section to know how this list should be composed.
#
#                      Note: It's only meaningful for widgets with a relief that is not **flat** or **solid**.
#
#                      Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                      Note: This is a styleable option.
#
#                            If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                     Only the developer can.
#
#                            If it's not provided --> The widget will follow the **-darkcolor** specified in its style.
#                                                     If there isn't one, the **-darkcolor** of the **TPanedwindow** style
#                                                     will be used instead.
#                                                     The **-darkcolor** will always abide by its mapping values, if any.
#                                                     Styles, mappings and states events are allowed to change its value.
#
#                      See also **-lightcolor**.
#
# **-height**          Specifies the desired height of the widget in pixels.
#                      If **0**, the requested height is determined by the height of the managed windows.
#
#                      If not provided, defaults to **0**.
#
#                      See also **-width**.
#
# **-lightcolor**      It's a list that specifies the color to use as lightcolor.
#                      See the **COLOR OPTION** section to know how this list should be composed.
#
#                      Note: It's only meaningful for widgets with a relief that is not **flat** or **solid**.
#
#                      Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                      Note: This is a styleable option.
#
#                            If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                     Only the developer can.
#
#                            If it's not provided --> The widget will follow the **-lightcolor** specified in its style.
#                                                     If there isn't one, the **-lightcolor** of the **TPanedwindow** style
#                                                     will be used instead.
#                                                     The **-lightcolor** will always abide by its mapping values, if any.
#                                                     Styles, mappings and states events are allowed to change its value.
#
#                      See also **-darkcolor**.
#
# **-orient**          Specifies the orientation of the window.
#                      If **vertical**, subpanes are stacked top-to-bottom; if **horizontal**, subpanes are stacked left-to-right.
#
#                      Note: This option may only be provided while creating the widget.
#                            Attempts to change this value after the widget is created by using the **configure** command,
#                            will be ignored by mustang.
#
#                      If not provided, defaults to **horizontal**.
#
# **-relief**          Specifies the three-dimensional effect desired for the widget.
#                      The value indicates how the widget's interior should appear relative to its exterior.
#                      For example, *raised* means the widget's interior should appear to protrude from the screen,
#                      relative to the exterior of the widget.
#
#                      The widget will accept as relief any of the following values:
#                         **flat**,
#                         **groove**,
#                         **raised**,
#                         **ridge**,
#                         **solid**,
#                         **sunken**.
#
#                      Note: This is a styleable option.
#
#                            If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                     Only the developer can.
#
#                            If it's not provided --> The widget will follow the **-relief** specified in its style.
#                                                     If there isn't one, the **-relief** of the **TPanedwindow** style
#                                                     will be used instead.
#                                                     The '*-relief*' will not abide by its mapping values, if any.
#                                                     It is not supposed to change when the widget state changes.
#
#                      See also **-bordercolor** and **-borderwidth**.
#
# **-state**           Setting it changes the widget **physical** state and not the widget *look* (the state widget command does that).
#                      Allowed states values are **normal** and **disabled**.
#
#                      If the panedwindow is disabled then its sash will not be be draggable.
#
#                      If not provided, defaults to **normal**.
#
# **-style**           Specifies a custom widget style.
#                      If not provided, defaults to **TPanedwindow**.
#
#                      The *style* provided should already exists at the time the widget is created.
#
#                      See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**       Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                      and **Shift-Tab**).
#
#                      Before setting the focus to a widget, the traversal scripts consult the value of the
#                      *-takefocus* option.
#                         **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                         **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                   and all of its ancestors are mapped.
#
#                      Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                      If not provided, defaults to **0**.
#
# **-width**           Specifies the desired width of the widget in pixels.
#                      If **0**, the requested width is determined by the width of the managed windows.
#
#                      If not provided, defaults to **0**.
#
#                      See also **-height**.
#
#
#### WIDGET COMMAND:
#
# The panedwindow command creates a new command whose name is the same as the pathname of the panedwindow's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the panedwindow widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for panedwindow widgets:
#
#   *window* **add** *subwindow* ?*option* *value* ... *option* *value*?
#     Adds a new pane to the window.
#     Each pane should be created as a child of the panedwindow in which will be attached.
#     See **PANE OPTIONS** section below for the list of available options.
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the panedwindow command (See **WIDGET OPTIONS**).
#
#   *window* **configure** ?*option*? ?*value*? ?*option* *value* ... *option* *value*?
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
#   *window* **forget** *pane*
#     Removes the specified subpane from the widget.
#     *Pane* is either an integer index or the name of a managed subwindow.
#
#   *window* **identify** *component* *x* *y*
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if no *component* is present at that location.
#     *X* and *y* are pixel coordinates relative to the widget.
#     *Component* may be **element** or *sash**
#
#        *window* **identify** **element** *x* *y*
#          Returns the name of the element at the specified location.
#
#        *window* **identify** **sash** *x* *y*
#          Returns the index of the sash at the specified location.
#
#   *window* **insert** *pos* *subwindow* ?*option* *value* ... *option* *value*?
#     Inserts a pane at the specified position.
#     *Pos* is either the string **end**, an integer index, or the name of a managed subwindow.
#     If *subwindow* is already managed by the paned window, moves it to the specified position.
#     See **PANE OPTIONS** section below for the list of available options.
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
#   *window* **pane** *pane* *option* ?*value*? ?*option* *value* ... *option* *value*?
#     Query or modify the options of the specified pane, where *pane* is either an integer index or the name of a managed subwindow.
#     If no *option* is specified, returns a dictionary of the pane option values.
#     If one *option* is specified, returns the value of that option.
#     Otherwise, sets the *option*s to the corresponding values.
#
#   *window* **panes**
#     Returns the list of all windows managed by the widget, in the index order of their associated panes.
#
#   *window* **sashpos** *index* ?*newpos*?
#     If *newpos* is specified, sets the position of sash number *index*.
#     May adjust the positions of adjacent sashes to ensure that positions are monotonically increasing.
#     Sash positions are further constrained to be between **0** and the total size of the widget.
#     Returns the new position of sash number index.
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
#### PANE OPTIONS:
#
# The following options may be specified for each pane:
#
#   **-weight** *amount*
#      *Amount* should be an integer specifying the relative stretchability of the pane.
#      When the paned window is resized, the extra space is added or subtracted to each pane proportionally to its weight *amount*.
#
#### VIRTUAL EVENTS:
#
# The panedwindow widget generates an **EnteredChild** virtual event on **LeaveNotify**/**NotifyInferior** events.
#
#### STATES:
#
# The panedwindow widget supports the **normal** and **disabled** states.
# In the **disabled** state the panedwindow sash will not be draggable.
#
#### STYLING OPTIONS:
#
# Default style name: **TPanedwindow**
#
# Every panedwindow styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# The sash is managed by the **Sash** style (The sash class is also **Sash**).
# The following sash options are supported and configurable with the [style](/wiki/commands/style.md) command:
#
#   **-background** *color*
#   **-bordercolor** *color*
#   **-darkcolor** *color*
#   **-gripsize** *size* (number of screen units)
#   **-handlepad** *amount*
#   **-handlesize** *amount*
#   **-lightcolor** *color*
#   **-sashpad** *amount*
#   **-sashrelief** *relief*
#   **-sashthickness** *amount*
#
# Note: Some options are only available for specific themes.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the panedwindows in order to facilitate the developer work and
# augment the user experience at the same time.
#
###### SCROLLING
#
# The following behavior will happen if the mouse pointer is over the widget (no matter if it has the
# focus or not).
#
# Note: A *unit* is 1/10 of a scrollable widget visible zone relative axis or, if a scrollincrement is provided, a multiple of it.
#       See '-xscrollincrement' and '-yscrollincrement' of the relative scrollable widget for more info.
#
#       A *page* is 9/10 of a scrollable widget visible zone relative axis.
#
# Note: Belows, when we talk about the widget's parents, we talk about it recursively.
#       Mustang will iterate all widget's parents in search of one that is scrollable and has the proper scrollbar
#       active for the relative key combination examined. If mustang finds a suitable parent, it will scroll that
#       widget scrollbar, otherwise nothing will happen.
#
# Note: In Linux, **TouchpadScroll** events abide by the same rules of the **MouseWheel** for the X axis and the
#       **Shift-MouseWheel** for the Y axis, while **Control-TouchpadScroll** events abide by the same rules of the
#       **Control-MouseWheel** for the X axis and the **Control-Shift-MouseWheel** for the Y axis.
#
# 1.  **MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar
#     and move that scrollbar by one unit up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 2.  **Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal
#     scrollbar and move that scrollbar by one unit left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 3.  **Control-MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical
#     scrollbar and move that scrollbar by one page up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 4.  **Control-Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active
#     horizontal scrollbar and move that scrollbar by one page left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad
#     direction.
#
#        1 - **TouchpadScroll** events along the X axis will try to find the innermost widget's scrollable parent with
#            an active horizontal scrollbar and move that scrollbar by one unit left or right (depending on the direction
#            of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - **TouchpadScroll** events along the Y axis will try to find the innermost widget's scrollable parent with
#            an active vertical scrollbar and move that scrollbar by one unit up or down (depending on the direction of
#            the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 6.  **Control-TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad
#     direction.
#
#        1 - **Control-TouchpadScroll** events along the X axis will try to find the innermost widget's scrollable parent
#            with an active horizontal scrollbar and move that scrollbar by one page left or right (depending on the
#            direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - **Control-TouchpadScroll** events along the Y axis will try to find the innermost widget's scrollable parent
#            with an active vertical scrollbar and move that scrollbar by one page up or down (depending on the direction
#            of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# The following behavior will happen if the widget has the focus or if one of its children has the focus but do not have a
# direct binding action setted for the key involved. Mustang will try to find the innermost widget's scrollable parent with an
# active vertical/horizontal scrollbar and scroll that scrollbar.
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
# 1.  If the current theme follows the **clam** engine (like the 'Halo' theme) and the widget styleable options (**-borderwidth**
#     and **-bordercolor**) allows it, everytime the mouse cursor enters the widget it will illuminate its borders to visually
#     indicate that the user is inside the widget.
#
# The following behavior will happen if the widget has the focus or if one of its children has the focus but do not have a direct
# binding action setted for the key involved.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the previous
#     focussable widget.
#
# The following behavior will happen if the mouse pointer is over a panedwindow's sash (no matter if the widget has the focus or not).
#
# 1.  Holding **ButtonPress-1** and moving the mouse will move the sash.
#
# There are other bindings in place for internal mechanism like **Activate/Deactivate**, **Configure**, **Destroy**, **Enter/Leave** and
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
#### KNOWN ISSUES:
#
# In Windows and macOS, when scrollable widget are attached to a panedwindow (as panes), graphical glitches will happen
# everytime the sash is dragged. This is due to several factors like:
#    - How the panedwindow updates its panes when one of its sash is dragged.
#    - How the mustang scrollable widgets auto-updates their scrollbars when their widget dimensions changes.
#    - How the Windows and macOS window manager works.
#    - ...
#
# To me these glitches are simply not acceptable because they make any application look and feel very unprofessional.
# Not using scrollable widgets inside a panedwindow is also unacceptable due to how sashs works.
# I tried everything within my knowledge to address these issues but without any luck.
# Until these problems will be resolved the panedwindows will not be available on Windows and macOS.
# I'm opened to suggestions on how to proceed.
#
# All the above problematics do not exists on Linux and BSD systems where panedwindows works flawlessy in any contexts.
#
#### EXAMPLE:
#
#   # Create an horizontal panedwindow of 800x400 with 3 horizontal scrollable panes inside.
#   panedwindow .p    -height 400 \
#                     -orient horizontal \
#                     -relief solid \
#                      -state normal \
#                      -style TPanedwindow \
#                  -takefocus 0 \
#                      -width 800;
#
#   # Create the scrollable panes:
#   # pane1
#   frame .p.f1 -borderwidth 0 \
#                    -height 600 \
#                    -relief solid \
#                -scrollable true \
#                     -style TFrame \
#                 -takefocus 1 \
#                     -width 300;
#
#   # pane2
#   frame .p.f2 -borderwidth 0 \
#                    -height 600 \
#                    -relief solid \
#                -scrollable true \
#                     -style TFrame \
#                 -takefocus 1 \
#                     -width 300;
#
#   # pane3
#   frame .p.f3 -borderwidth 0 \
#                    -height 600 \
#                    -relief solid \
#                -scrollable true \
#                     -style TFrame \
#                 -takefocus 1 \
#                     -width 300;
#
#   # Create 20 labels in each pane, the labels will be positioned in two columns.
#   foreach pane [list f1 f2 f3] {
#       set row 0
#       set i 0
#       while { $i < 120 } {
#           label .p.$pane.l$i -text [list "Label $i"]
#
#           grid .p.$pane.l$i -column 0 \
#                               -padx [list 15 15] \
#                               -pady [list 15 15] \
#                                -row $row \
#                             -sticky we;
#
#           incr i
#
#           label .p.$pane.l$i -text [list "Label $i"]
#
#           grid .p.$pane.l$i -column 2 \
#                               -padx [list 15 15] \
#                               -pady [list 15 15] \
#                                -row $row \
#                             -sticky we;
#
#           incr row
#           incr i
#       }
#   }
#
#   # Add the panes to the horizontal panedwindow.
#   .p add .p.f1
#   .p add .p.f2
#   .p add .p.f3
#
#   # Pack the horizontal panedwindow and expand it only along the x axis.
#   pack .p -anchor nw \
#           -expand true \
#             -fill x \
#             -padx [list 15 15] \
#             -pady [list 15 15] \
#             -side top;
#
#
#   # Focus the first pane
#   focus .p.f1
#
#   # After 3 seconds, change the accent color to orange.
#   after 3000 [list set ::ms::accent orange]
#
#   # After 6 seconds, invert the colorscheme.
#   switch -- [tk windowingsystem] {
#       aqua {
#           switch -- [wm attributes . -isdark] {
#               0   { after 6000 [list set ::ms::colorscheme dark]  }
#               1   { after 6000 [list set ::ms::colorscheme light] }
#           }
#       }
#       default { after 6000 [list set ::ms::colorscheme dark] }
#   }
package provide ::ms::panedwindow 0.1

###################################
##                               ##
##     _PANEDWINDOW BINDINGS     ##
##                               ##
###################################

# Activate/Deactivate
_bind _Panedwindow <Activate>   { ::ms::panedwindow::Pathname_Cmd %W state !background; break }
_bind _Panedwindow <Deactivate> { ::ms::panedwindow::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Panedwindow <ButtonPress-1>   { ::ms::panedwindow::Sash_ButtonPress   %W %x %y; break }
_bind _Panedwindow <B1-Motion>       { ::ms::panedwindow::Sash_Drag          %W %x %y; break }
_bind _Panedwindow <ButtonRelease-1> { ::ms::panedwindow::Sash_ButtonRelease %W; break }

# Configure
_bind _Panedwindow <Configure> { ::ms::panedwindow::Configure %W }

# Cursor Management
_bind _Panedwindow <Motion> { ::ms::panedwindow::Set_Cursor   %W %x %y; break }
_bind _Panedwindow <Enter>  { ::ms::panedwindow::Reset_Cursor %W; break }
_bind _Panedwindow <Leave>  { ::ms::panedwindow::Reset_Cursor %W; break }

# Enter/Leave
_bind _Panedwindow <Enter> [list +::ms::panedwindow::Hover %W %X %Y]
_bind _Panedwindow <Leave> [list +::ms::panedwindow::Hover %W %X %Y]

# FocusIn/FocusOut
_bind _Panedwindow <FocusIn>  { ::ms::panedwindow::Pathname_Cmd %W state  focus; break }
_bind _Panedwindow <FocusOut> { ::ms::panedwindow::Pathname_Cmd %W state !focus; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Panedwindow <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Panedwindow <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Panedwindow <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Panedwindow <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Panedwindow <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Panedwindow <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **panedwindow** package.
namespace eval ::ms::panedwindow {
    # Set the 'non-styleable' panedwindow option list.
    set ::ms::panedwindow(non_styleable,options) [list class \
                                                       height \
                                                       orient \
                                                       state \
                                                       style \
                                                       takefocus \
                                                       width];

    # Set the 'styleable' panedwindow option list.
    set ::ms::panedwindow(styleable,options) [list background \
                                                   bordercolor \
                                                   borderwidth \
                                                   cursor \
                                                   darkcolor \
                                                   lightcolor \
                                                   relief];

    # Set the default 'non-styleable' panedwindow options values.
    set ::ms::default(panedwindow,class)     TPanedwindow
    set ::ms::default(panedwindow,height)    0
    set ::ms::default(panedwindow,orient)    horizontal
    set ::ms::default(panedwindow,state)     normal
    set ::ms::default(panedwindow,style)     TPanedwindow
    set ::ms::default(panedwindow,takefocus) 0
    set ::ms::default(panedwindow,width)     0

    # Note: The default 'styleable' panedwindow options values are always defined inside the current theme.
}

# Rename the original Tk **panedwindow** and **ttk::panedwindow** commands.
rename panedwindow      _panedwindow
rename ttk::panedwindow _ttk_panedwindow

# Create aliases for the mustang **panedwindow** command.
interp alias {} panedwindow      {} ::ms::panedwindow::Command
interp alias {} ttk::panedwindow {} ::ms::panedwindow::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **panedwindow** and **ttk::panedwindow** widgets commands.
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
proc ::ms::panedwindow::Command { window { args "" } } {
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
            set ::ms::default($w,class)     $::ms::default(panedwindow,class)
            set ::ms::default($w,height)    $::ms::default(panedwindow,height)
            set ::ms::default($w,orient)    $::ms::default(panedwindow,orient)
            set ::ms::default($w,state)     $::ms::default(panedwindow,state)
            set ::ms::default($w,style)     $::ms::default(panedwindow,style)
            set ::ms::default($w,takefocus) $::ms::default(panedwindow,takefocus)
            set ::ms::default($w,width)     $::ms::default(panedwindow,width)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)     $::ms::default(panedwindow,class)
            set ::ms::current($w,height)    $::ms::default(panedwindow,height)
            set ::ms::current($w,orient)    $::ms::default(panedwindow,orient)
            set ::ms::current($w,state)     $::ms::default(panedwindow,state)
            set ::ms::current($w,style)     $::ms::default(panedwindow,style)
            set ::ms::current($w,takefocus) $::ms::default(panedwindow,takefocus)
            set ::ms::current($w,width)     $::ms::default(panedwindow,width)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) panedwindow

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
            #       To make a panedwindow styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **panedwindow** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)  Tk
            set ::ms::managed_by($w,bordercolor) Tk
            set ::ms::managed_by($w,borderwidth) Tk
            set ::ms::managed_by($w,cursor)      Tk
            set ::ms::managed_by($w,darkcolor)   Tk
            set ::ms::managed_by($w,lightcolor)  Tk
            set ::ms::managed_by($w,relief)      Tk

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
                    -height {
                        switch -- [string is integer -strict $value] {
                            0   {
                                set value [::ms::Check_Measure $value invalid]
                                switch -- $value {
                                    invalid { continue }
                                }
                            }
                            1   {
                                if { $value < 0 } {
                                    set value 0
                                }
                            }
                        }

                        set ::ms::current($w,height) $value
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
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            normal   -
                            disabled { set ::ms::current($w,state) $value }
                        }
                    }
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TPanedwindow' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TPanedwindow]
                            }

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
                    -width {
                        switch -- [string is integer -strict $value] {
                            0   {
                                set value [::ms::Check_Measure $value invalid]
                                switch -- $value {
                                    invalid { continue }
                                }
                            }
                            1   {
                                if { $value < 0 } {
                                    set value 0
                                }
                            }
                        }

                        set ::ms::current($w,width) $value
                    }
                }
            }

            # Set the default value for each of the panedwindow styleable options and if the option is managed by Tk, set also its current value.
            foreach option $::ms::panedwindow(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TPanedwindow,$option)

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

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'borderwidth', 'cursor' and 'relief' are not allowed to change if the statespec changes.

            #########################
            ##                     ##
            ##     PANEDWINDOW     ##
            ##                     ##
            #########################

            # Set the panedwindow object style name.
            set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                   "_bw=" $::ms::current($w,borderwidth) \
                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                   "_rl=" $::ms::current($w,relief) \
                                                   "." $::ms::current($w,style)];

            # If needed, create the panedwindow object style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                             -borderwidth $::ms::current($w,borderwidth) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                                  -relief $::ms::current($w,relief);

                # Add the widget style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
            }

            # Initialize the hull object mapping.
            set mapping [list ]

            # background
            switch -- $::ms::managed_by($w,background) {
                developer { lappend mapping -background [list pressed $::ms::current($w,background)] }
                Tk  {
                    # Check if a 'bordercolor' mapping exists for '::ms::current($w,style)'.
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

            # If needed, create the hull object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,hull) {*}$mapping

                # Add the hull object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the widget.
            _ttk_panedwindow $w     -class $::ms::current($w,class) \
                                   -cursor $cursor \
                                   -height $::ms::current($w,height) \
                                   -orient $::ms::current($w,orient) \
                                    -style $::ms::style($w,widget) \
                                -takefocus $takefocus \
                                    -width $::ms::current($w,width);

            # Pack the panedwindow object.
            _pack $w -anchor nw \
                     -expand true \
                       -fill both \
                       -padx 0 \
                       -pady 0 \
                       -side top;

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TPanedwindow { bindtags $w [list $w _Panedwindow TPanedwindow $::ms::addr($w,toplevel) all] }
                default      { bindtags $w [list $w $::ms::current($w,class) _Panedwindow TPanedwindow $::ms::addr($w,toplevel) all] }
            }

            # Add the panedwindow to the related toplevel keyboard pages navigation bindings.
            ::ms::Enable_Traversal $w

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::panedwindow::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::panedwindow::Pathname_Cmd $w]
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
            lappend ::ms::addr(reals) $w

            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the megawidget addresses list.
            lappend ::ms::addr(megawidgets) $w

            # Add the widget address to the megawidget container addresses list.
            lappend ::ms::addr(megawidgets,containers) $w

            # Add the widget address to the panedwindow widgets real address list.
            lappend ::ms::addr(panedwindow) $w

            # Add the widget address to the panedwindow classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),panedwindow,addrs) $w

            # Add the widget address to the panedwindow classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),panedwindow,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the panedwindow classtype.
            if { $::ms::current($w,style) ni $::ms::style(panedwindow,classtype) } {
                lappend ::ms::style(panedwindow,classtype) $::ms::current($w,style)
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
proc ::ms::panedwindow::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        add {
            # Synopsis:
            #
            # *window* **add** *subwindow* ?*option value*? ... ?*option value*?
            set subwindow [lindex  $args 0]
            set args      [lremove $args 0]

            # Get the 'subwindow' real address.
            set result [::ms::Check_Pathname $subwindow invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$subwindow'." $caller_info }
                default { set subwindow [lindex $result 0] }
            }

            # Check that the 'subwindow' provided is a direct child of the panedwindow widget.
            if { [_winfo parent $subwindow] ne "$w" } {
                return ""
            }

            # Check that the command 'args' forms a valid 'option/value' list.
            switch -- [expr { [llength $args]%2 }] {
                0       {}
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w add $subwindow {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        cget {
            # Synopsis:
            #
            # *window* **cget** *option*
            switch -- [llength $args] {
                0   { ::ms::Error "Missing cget option." $caller_info }
                1   {
                    # Check if the option provided is a valid 'styleable' or 'non-styleable' option.
                    set option [string range $args 1 end]
                    if { ($option in $::ms::panedwindow(non_styleable,options)) || ($option in $::ms::panedwindow(styleable,options))} {
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
                    foreach option $::ms::panedwindow(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::panedwindow(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::panedwindow(non_styleable,options)) || ($option in $::ms::panedwindow(styleable,options)) } {
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
                            #       Their registration (if any) is done in the '::ms::panedwindow::Configure' event procedure.
                            set ::ms::temp($w,height) $::ms::current($w,height)
                            set ::ms::temp($w,width)  $::ms::current($w,width)

                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the remaining widget's options, if any.
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
                                    -height {
                                        switch -- [string is integer -strict $value] {
                                            0   {
                                                set value [::ms::Check_Measure $value invalid]
                                                switch -- $value {
                                                    invalid { continue }
                                                }
                                            }
                                            1   {
                                                if { $value < 0 } {
                                                    set value 0
                                                }
                                            }
                                        }

                                        set ::ms::temp($w,height) $value
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
                                    -state {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            normal   -
                                            disabled { set ::ms::current($w,state) $value }
                                        }
                                    }
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Check if exists a layout for the style provided.
                                            # If not, create one by mirroring the current theme 'TPanedwindow' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TPanedwindow]
                                            }

                                            # Remove the widget address from the panedwindow real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),panedwindow,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),panedwindow,addrs) [lremove $::ms::style($::ms::current($w,style),panedwindow,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,panedwindow,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the panedwindow classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),panedwindow,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(panedwindow,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(panedwindow,classtype) [lremove $::ms::style(panedwindow,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the panedwindow classtype.
                                            if { $value ni $::ms::style(panedwindow,classtype) } {
                                                lappend ::ms::style(panedwindow,classtype) $value
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
                                    -width {
                                        switch -- [string is integer -strict $value] {
                                            0   {
                                                set value [::ms::Check_Measure $value invalid]
                                                switch -- $value {
                                                    invalid { continue }
                                                }
                                            }
                                            1   {
                                                if { $value < 0 } {
                                                    set value 0
                                                }
                                            }
                                        }

                                        set ::ms::temp($w,width) $value
                                    }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::panedwindow(styleable,options) {
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

                            #################################
                            ##                             ##
                            ##     COFIGURE THE WIDGET     ##
                            ##                             ##
                            #################################

                            # Note: 'borderwidth', 'cursor' and 'relief' are not allowed to change if the statespec changes.

                            #########################
                            ##                     ##
                            ##     PANEDWINDOW     ##
                            ##                     ##
                            #########################

                            # Set the panedwindow object style name.
                            set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                                   "_bw=" $::ms::current($w,borderwidth) \
                                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                                   "_rl=" $::ms::current($w,relief) \
                                                                   "." $::ms::current($w,style)];

                            # If needed, create the panedwindow object style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                                             -borderwidth $::ms::current($w,borderwidth) \
                                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                                                  -relief $::ms::current($w,relief);

                                # Add the widget style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
                            }

                            # Initialize the hull object mapping.
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

                            # If needed, create the hull object mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,hull) {*}$mapping

                                # Add the hull object mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure    -cursor $cursor \
                                                                   -height $::ms::temp($w,height) \
                                                                   -orient $::ms::current($w,orient) \
                                                                    -style $::ms::style($w,widget) \
                                                                -takefocus $takefocus \
                                                                    -width $::ms::temp($w,width);

                            # Note: If width and/or height were provided by the developer, and these values were accepted by Tk,
                            #       then a configure event will be invoked by Tk ('::ms::panedwindow::Configure').
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
        forget {
            # Synopsis:
            #
            # *window* **forget** *pane*

            # Check the 'pane' provided.
            switch -- [string is integer -strict $args] {
                0   {
                    # Get the 'pane' real address.
                    set result [::ms::Check_Pathname $args invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$args'." $caller_info }
                        default {
                            # Check if the pane real address is an already managed subwindow.
                            if { [lindex $result 0] ni [interp invokehidden {} $w panes] } {
                                ::ms::Error "Invalid pane option, '$args'." $caller_info
                            } else {
                                set pane [lindex $result 0]
                            }
                        }
                    }
                }
                1   {
                    if { $args < 0 } {
                        ::ms::Error "Invalid pane option, '$args'." $caller_info
                    } else {
                        set pane $args
                    }
                }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w forget $pane
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        identify {
            # Synopsis:
            #
            # *window* **identify** *component* *x* *y*
            #    *window* **identify** **element** *x* *y*
            #    *window* **identify** **sash** *x* *y*
            switch -- [llength $args] {
                3   {
                    # Check that the first argument of 'args' is the word 'element' or 'sash'.
                    switch -- [lindex $args 0] {
                        element -
                        sash    {}
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

                    # Check if the coordinates provided falls upon the widget's sash.
                    try {
                        interp invokehidden {} $w identify sash $x $y
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        # Check the subcommand provided.
                        switch -- [lindex $args 0] {
                            element {
                                switch -- $result {
                                    ""   { set result "Panedwindow.client" }
                                    sash { set result "Panedwindow.sash"   }
                                }
                            }
                        }

                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        insert {
            # Synopsis:
            #
            # *window* **insert** *pos* *subwindow* ?*option value*? ... ?*option value*?
            set pos       [lindex  $args 0]
            set subwindow [lindex  $args 1]
            set args      [lremove $args 0 1]

            # Check the pane position provided.
            switch -- [string is integer -strict $pos] {
                0   {
                    # Check if the 'pos' provided is the word 'end'.
                    switch -nocase -- $pos {
                        end     { set pos "end" }
                        default {
                            # Check if the 'pos' provided is a short address.
                            set result [::ms::Check_Pathname $pos invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid pane option, '$pos'." $caller_info }
                                default {
                                    # Check if the pos real address is an already managed subwindow.
                                    if { [lindex $result 0] ni [interp invokehidden {} $w panes] } {
                                        ::ms::Error "Invalid pane option, '$pos'." $caller_info
                                    }
                                }
                            }
                        }
                    }
                }
                1   {
                    if { $pos < 0 } {
                        ::ms::Error "Invalid pane option, '$pos'." $caller_info
                    }
                }
            }

            # Get the 'subwindow' real address.
            set result [::ms::Check_Pathname $subwindow invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$subwindow'." $caller_info }
                default { set subwindow [lindex $result 0] }
            }

            # Check that the 'subwindow' provided is a direct child of the panedwindow widget.
            if { [_winfo parent $subwindow] ne "$w" } {
                return ""
            }

            # Check that the command 'args' forms a valid 'option/value' list.
            switch -- [expr { [llength $args]%2 }] {
                0       {}
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w insert $pos $subwindow {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
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
                    return [interp invokehidden {} $w instate $statespec]
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
                        ::ms::Error "Invalid script." $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        pane {
            # Synopsis:
            #
            # *window* **pane** *pane* *option* ?*value*?
            set pane [lindex  $args 0]
            set args [lremove $args 0]

            # Check the 'pane' provided.
            switch -- [string is integer -strict $pane] {
                0   {
                    # Get the 'pane' real address.
                    set result [::ms::Check_Pathname $pane invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$pane'." $caller_info }
                        default {
                            # Check if the pane real address is an already managed subwindow.
                            if { [lindex $result 0] ni [interp invokehidden {} $w panes] } {
                                ::ms::Error "Invalid pane option, '$pane'." $caller_info
                            } else {
                                set pane [lindex $result 0]
                            }
                        }
                    }
                }
                1   {
                    if { $pane < 0 } {
                        ::ms::Error "Invalid pane option, '$pane'." $caller_info
                    }
                }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w pane $pane {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        panes {
            # Synopsis:
            #
            # *window* **panes**
            switch -- [llength $args] {
                0       { return [interp invokehidden {} $w panes] }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        sashpos {
            # Synopsis:
            #
            # *window* **sashpos** *index* ?*newpos*?
            switch -- [llength $args] {
                1   -
                2   {
                    # Execute the command.
                    try {
                        interp invokehidden {} $w $cmd {*}$args
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

                    #####################################
                    ##                                 ##
                    ##     UPDATE THE WIDGET STATE     ##
                    ##                                 ##
                    #####################################

                    # Propagate the new statespec to the hull and panedwindow objects.
                    interp invokehidden {} $w state $statespec

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
# Update any panedwindow widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::panedwindow::Style_Update { stylename caller_info } {
    # Update all the panedwindow widgets that have stylename as a style.
    foreach w $::ms::style($stylename,panedwindow,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::panedwindow(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TPanedwindow,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'borderwidth', 'cursor' and 'relief' are not allowed to change if the statespec changes.

        #########################
        ##                     ##
        ##     PANEDWINDOW     ##
        ##                     ##
        #########################

        # Set the panedwindow object style name.
        set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                               "_bc=" $::ms::current($w,bordercolor) \
                                               "_dc=" $::ms::current($w,darkcolor) \
                                               "_lc=" $::ms::current($w,lightcolor) \
                                               "." $::ms::current($w,style)];

        # If needed, create the panedwindow object style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                         -bordercolor $::ms::current($w,bordercolor) \
                                                           -darkcolor $::ms::current($w,darkcolor) \
                                                          -lightcolor $::ms::current($w,lightcolor);

            # Add the widget style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
        }

        # Initialize the hull object mapping.
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

        # If needed, create the hull object mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,hull) {*}$mapping

            # Add the hull object mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes
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

## Configure
#
# Manage the **Configure** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::panedwindow::Configure { w } {
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
proc ::ms::panedwindow::Destroy { w } {
    # Get the short address related to the widget real address.
    set short_addr $::ms::addr($w,short)

    # Destroy the aliased widget pathcommands.
    foreach token $::ms::data($w,token) {
        interp alias {} $token {}
    }

    # Remove the widget short address from the list of all available short addresses.
    set index [lsearch -exact $::ms::addr(shorts) $short_addr]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(shorts) [lremove $::ms::addr(shorts) $index] }
    }

    # Remove the widget address from the panedwindow widgets real address list.
    set index [lsearch -exact $::ms::addr(panedwindow) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(panedwindow) [lremove $::ms::addr(panedwindow) $index] }
    }

    # Remove the object real address from the list of all available real addresses.
    set index [lsearch -exact $::ms::addr(reals) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
    }

    # Remove the widget address from the panedwindow classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),panedwindow,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),panedwindow,addrs) [lremove $::ms::class($::ms::current($w,class),panedwindow,addrs) $index] }
    }

    # Remove the widget address from the panedwindow classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),panedwindow,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),panedwindow,addrs) [lremove $::ms::style($::ms::current($w,style),panedwindow,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the palette classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),palette,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(palette,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(palette,classtype) [lremove $::ms::style(palette,classtype) $index] }
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
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,height) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,orient) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,width);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,height) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,orient) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,width);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,relief);

    unset -nocomplain -- ::ms::style($w,widget)

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
proc ::ms::panedwindow::Hover { w X Y } {
    # Get the dimensions of the widget that acts as a border object.# Get the border object dimensions.
    set height [_winfo height $::ms::addr($w,border)]
    set width  [_winfo width  $::ms::addr($w,border)]

    # Get the north-west (nw) root coordinates of the widget that acts as a border object.# Get the border object north-west (nw) root coordinates.
    set X_nw [_winfo rootx $::ms::addr($w,border)]
    set Y_nw [_winfo rooty $::ms::addr($w,border)]

    # Get the widget south-east (se) root coordinates of the widget that acts as a border object.# Get the address south-east (se) root coordinates.
    set X_se [expr { $X_nw+$width }]
    set Y_se [expr { $Y_nw+$height }]

    # Check if the mouse pointer coordinates are inside or outside the widget acting as a border object.
    if { ($X <= $X_nw) || ($X >= $X_se) || ($Y <= $Y_nw) || ($Y >= $Y_se) } {
        # The mouse cursor is outside the widget acting as a border object.

        # Change the widget dynamic state to '!hover'.
        ::ms::panedwindow::Pathname_Cmd $w state !hover
    } else {
        # The mouse cursor is inside the widget acting as a border object.

        # Change the widget dynamic state to 'hover'.
        ::ms::panedwindow::Pathname_Cmd $w state hover
    }

    return ""
}

###############################
##                           ##
##     CURSOR MANAGEMENT     ##
##                           ##
###############################

# Note: The following procedures were inspired by the ttk::panedwindow cursor management.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## Reset_Cursor
#
# Reset the cursor shape on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::panedwindow::Reset_Cursor { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Safeguard
    switch -- [info exists ::ms::temp(sash,state)] {
        0   {
            # Check if the cursor is different than the '::ms::current($w,cursor)' provided.
            if { [interp invokehidden {} $w cget -cursor] ne $::ms::current($w,cursor) } {
                interp invokehidden {} $w configure -cursor $::ms::current($w,cursor)
            }
        }
    }

    return ""
}

## Set_Cursor
#
# Set the cursor shape on the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates of the event.
#        These values should be provided by the <Motion> event.
#
# It doesn't return anything.
proc ::ms::panedwindow::Set_Cursor { w x y } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Safeguard
    switch -- [info exists ::ms::temp(sash,state)] {
        0   {
            # Check if the is over a panedwindow sash.
            switch -- [interp invokehidden {} $w identify sash $x $y] {
                ""  {
                    # The cursor is not over a panedwindow sash.

                    # Check if the cursor is different than the '::ms::current($w,cursor)' provided.
                    if { [interp invokehidden {} $w cget -cursor] ne $::ms::current($w,cursor) } {
                        interp invokehidden {} $w configure -cursor $::ms::current($w,cursor) }
                    }
                default {
                    # The cursor is over a panedwindow sash.

                    # Check if the cursor is the '::ms::current($w,cursor)' provided.
                    if { [interp invokehidden {} $w cget -cursor] eq $::ms::current($w,cursor) } {
                        switch -- $::ms::current($w,orient) {
                            horizontal { interp invokehidden {} $w configure -cursor [ttk::cursor hresize] }
                            vertical   { interp invokehidden {} $w configure -cursor [ttk::cursor vresize] }
                        }
                    }
                }
            }
        }
    }

    return ""
}

#######################
##                   ##
##     SASH DRAG     ##
##                   ##
#######################

## Sash_ButtonPress
#
# Manage the **ButtonPress** event on the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates of the event.
#        These values should be provided by the **ButtonPress** event.
#
# It doesn't return anything.
proc ::ms::panedwindow::Sash_ButtonPress { w x y } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # If needed, focus the widget.
    ::ms::Focus_The_Widget_Or_Its_Toplevel

    # Check if the ButtonPress happened over the widget's sash.
    set sash [interp invokehidden {} $w identify sash $x $y]
    switch -- $sash {
        ""      {}
        default {
            switch -- $::ms::current($w,takefocus) {
                1   {
                    set ::ms::temp(sash,state) enabled
                    set ::ms::data(sash,index) $sash
                    set ::ms::data(sash,pos)   [interp invokehidden {} $w sashpos $sash]
                    set ::ms::data(sash,x)     $x
                    set ::ms::data(sash,y)     $y
                }
            }
        }
    }

    return ""
}

## Sash_ButtonRelease
#
# Manage the **ButtonRelease** event on the widget.
#
# Where:
#
# w        Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::panedwindow::Sash_ButtonRelease { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    unset -nocomplain -- ::ms::temp(sash,state)

    # Reset cursor.
    interp invokehidden {} $w configure -cursor $::ms::current($w,cursor)

    return ""
}

## Sash_Drag
#
# Manage the **B1-Motion** event on the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates of the event.
#        These values should be provided by the **B1-Motion** event.
#
# It doesn't return anything.
proc ::ms::panedwindow::Sash_Drag { w x y } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Safeguard
    switch -- [info exists ::ms::temp(sash,state)] {
        1   {
            switch -- $::ms::current($w,orient) {
                horizontal { set delta [expr { $x-$::ms::data(sash,x) }] }
                vertical   { set delta [expr { $y-$::ms::data(sash,y) }] }
            }

            # Place '::ms::data(sash,index)' under the mouse pointer.
            $w sashpos $::ms::data(sash,index) [expr { $::ms::data(sash,pos)+$delta }]
        }
    }

    return ""
}

#*EOF*