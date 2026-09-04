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

## notebook
#
#### DESCRIPTION:
#
# The notebook command creates a new window (given by the *window* argument) and makes it into a notebook widget.
# A notebook widget manages a collection of subwindows (tabs) and displays a single one at a time.
# Each subwindows is associated with a tab, which the user may select to change the currently-displayed window.
#
# Each tabs should be created as direct children of the notebook widget.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname,
#         but the pathname's parents must exists.
#         *Window* may be provided either as a short or as a real address, the address returned will be:
#            - A short address, if the *window* provided as input is a short address.
#            - A real address, if the *window* provided as input is a real address.
#
# Nota 2: The notebook is one of the few containers that do not support the scrollbar system, at least not directly.
#         If you need scrollable tabs, put two or more scrollable frames (the tabs) inside the notebook.
#         See the example at the end.
#
#
# Additional options, described below, may be specified on the command line to configure aspects of the notebook.
#
#### SYNOPSIS:
#
# **notebook**  *window* ?*option value*? ... ?*option value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-background**    It's a list that specifies the color to use as background.
#                    See the **COLOR OPTION** section to know how this list should be composed.
#
#                    Note: This is a styleable option.
#
#                          If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                   Only the developer can.
#
#                          If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                   If there isn't one, the **-background** of the **TNotebook** style
#                                                   will be used instead.
#                                                   The **-background** will always abide by its mapping values, if any.
#                                                   Styles, mappings and states events are allowed to change its value.
#
# **-bordercolor**   It's a list that specifies the color to use as bordercolor.
#                    See the **COLOR OPTION** section to know how this list should be composed.
#
#                    Note: It's only meaningful for widgets with a **solid** or **flat** relief.
#
#                    Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                    Note: This is a styleable option.
#
#                          If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                   Only the developer can.
#
#                          If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                   If there isn't one, the **-bordercolor** of the **TNotebook** style
#                                                   will be used instead.
#                                                   The **-bordercolor** will always abide by its mapping values, if any.
#                                                   Styles, mappings and states events are allowed to change its value.
#
#                    See also **-borderwidth** and **-relief**.
#
# **-class**         Specifies a class for the widget.
#                    It is mainly used to make bindings for widgets that have the same class.
#
#                    Note: This option may only be provided while creating the widget.
#                          Attempts to change this value after the widget is created by using the **configure** command,
#                          will be ignored by mustang.
#
#                    If not provided, defaults to **TNotebook**.
#
# **-cmenu**         Specifies the contextual menu address that will be assigned to the widget.
#                    If the *cmenu* value is the empty string or invalid, the contextual menu of the widget's toplevel (if any)
#                    will be used. If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                    If not provided, defaults to the empty string.
#
# **-cursor**        Specifies the mouse cursor to be used inside the widget.
#                    If an empty string is specified, it indicates that the widget should defer to it's parent for
#                    cursor specification.
#
#                    See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                    Note: This is a styleable option.
#
#                          If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                   Only the developer can.
#
#                          If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                   If there isn't one, the **-cursor** of the **TNotebook** style
#                                                   will be used instead.
#                                                   The **-cursor** will not abide by its mapping values, if any.
#                                                   It is not supposed to change when the widget state changes.
#
# **-darkcolor**     It's a list that specifies the color to use as darkcolor.
#                    See the **COLOR OPTION** section to know how this list should be composed.
#
#                    Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                    Note: This is a styleable option.
#
#                          If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                   Only the developer can.
#
#                          If it's not provided --> The widget will follow the **-darkcolor** specified in its style.
#                                                   If there isn't one, the **-darkcolor** of the **TNotebook** style
#                                                   will be used instead.
#                                                   The **-darkcolor** will always abide by its mapping values, if any.
#                                                   Styles, mappings and states events are allowed to change its value.
#
#                    See also **-lightcolor**.
#
# **-height**        Specifies the desired height for the widget in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                    (pixels, points, inches, millimeters and centimeters).
#
#                    If this option is **0** then the widget will assume the minimum height possible that can accomodate
#                    it's content height. Negative values will be ignored.
#
#                    Note: "WINDOW MANAGERS"
#
#                        Any toplevel is managed by the *window manager*.
#                        Any widget's program-requested height may cause it's toplevel to change it's height as well.
#                        If the toplevel program-requested height is ignored (by the window manager),
#                        then any widget's program-requested height is ignored too (by Tk that follows the istructions
#                        received by the 'window manager').
#
#                        Some window managers ignores any toplevel program-requested height and demands only to the
#                        user to manually change the toplevel's height.
#
#                        Some window managers allows any toplevel program-requested height until the user will
#                        manually change the toplevel's height.
#                        Once the user has manually changed the toplevel's height, any subsequent toplevel program-requested
#                        height will be ignored.
#
#                        Others window managers allows any toplevel program-requested height in any circumstances.
#
#                    "Tk"
#
#                        Tk ignores any widget's program-requested height if the **grid** or **pack** geometry manager is used
#                        within the widget, since these geometry managers will override the widget's height in those cases.
#
#                    If not provided, defaults to **0**.
#
#                    See also **-width**.
#
# **-lightcolor**    It's a list that specifies the color to use as lightcolor.
#                    See the **COLOR OPTION** section to know how this list should be composed.
#
#                    Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                    Note: This is a styleable option.
#
#                          If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                   Only the developer can.
#
#                          If it's not provided --> The widget will follow the **-lightcolor** specified in its style.
#                                                   If there isn't one, the **-lightcolor** of the **TNotebook** style
#                                                   will be used instead.
#                                                   The **-lightcolor** will always abide by its mapping values, if any.
#                                                   Styles, mappings and states events are allowed to change its value.
#
#                    See also **-darkcolor**.
#
# **-state**         Specifies the state for the widget.
#
#                    Note: Notebooks have only the **normal** state.
#
#                    Note: This option will be ignored if provided while creating the widget.
#                          Attempts to change this value after the widget was created, by using the **configure** command,
#                          will be ignored by mustang.
#                          This option can only be retrieved.
#
#                    It's set to **normal**.
#
# **-style**         Specifies a custom widget style.
#                    If not provided, defaults to **TNotebook**.
#
#                    The *style* provided should already exists at the time the widget is created.
#
#                    See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-tabposition**   Specifies the position of the tab row or column as a string of length 1 or 2.
#                    The first character indicates the side as **n**, **s**, **w**, or **e**, while the second character (if present)
#                    is the sticky bit (specified as **w**, **e**, **n**, or **s**) within the tab position.
#
#                    Note: This is a styleable option.
#
#                          If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                   Only the developer can.
#
#                          If it's not provided --> The widget will follow the **-tabposition** specified in its style.
#                                                   If there isn't one, the **-tabposition** of the **TNotebook** style
#                                                   will be used instead.
#                                                   The **-tabposition** will not abide by its mapping values, if any.
#                                                   It is not supposed to change when the widget state changes.
#
# **-takefocus**     Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                    and **Shift-Tab**).
#
#                    Before setting the focus to a widget, the traversal scripts consult the value of the
#                    *-takefocus* option.
#                       **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                       **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                 and all of its ancestors are mapped.
#
#                    Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                    If not provided, defaults to **0**.
#
# **-width**         Specifies the desired width for the widget in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                    (pixels, points, inches, millimeters and centimeters).
#
#                    If this option is **0** then the widget will assume the minimum width possible that can accomodate
#                    it's content width. Negative values will be ignored.
#
#                    Note: "WINDOW MANAGERS"
#
#                              Any toplevel is managed by the *window manager*.
#                              Any widget's program-requested width may cause it's toplevel to change it's width as well.
#                              If the toplevel program-requested width is ignored (by the window manager),
#                              then any widget's program-requested width is ignored too (by Tk that follows the istructions
#                              received by the window manager).
#
#                              Some window managers ignores any toplevel program-requested width and demands only to the
#                              user to manually change the toplevel's width.
#
#                              Some window managers allows any toplevel program-requested width until the user will
#                              manually change the toplevel's width.
#                              Once the user has manually changed the toplevel's width, any subsequent toplevel program-requested
#                              width will be ignored.
#
#                              Others window managers allows any toplevel program-requested width in any circumstances.
#
#                          "Tk"
#
#                              Tk ignores any widget's program-requested width if the **grid** or **pack** geometry manager is used
#                              within the widget, since these geometry managers will override the widget's width in those cases.
#
#                    If not provided, defaults to **0**.
#
#                    See also **-height**.
#
#### WIDGET COMMAND:
#
# The notebook command creates a new command whose name is the same as the pathname of the notebook's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the notebook widget's pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for notebook widgets:
#
#   *window* **add** *subwindow* ?*option* *value*? ... ?*option* *value*?
#     Adds a new tab (the *subwindow*) to the notebook.
#     See **TAB OPTIONS** for the list of available options.
#     If *subwindow* is currently managed by the notebook but hidden, it is restored to its previous position.
#
#   *window* **cget** *option*
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the notebook command (See **WIDGET OPTIONS**).
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
#   *window* **forget** *tabid*
#     Removes the tab specified by *tabid*, unmaps and unmanages the associated subwindow.
#     Any *tabid* option previously specified will be removed.
#
#   *window* **hide** *tabid*
#     Hides the tab specified by *tabid* (and it's related tab).
#     The tab will not be displayed, but the associated window remains managed by the notebook and its configuration remembered.
#     Hidden tabs may be restored with the **add** command.
#     Any *tabid* option previously specified will not be removed.
#
#   *window* **identify** *component* *x* *y*
#     Returns the name of the element under the point given by *x* and *y*, or the empty string if no component is present at that location.
#     The following subcommands are supported:
#
#        *window* **identify** **element** *x* *y*
#          Returns the name of the element at the specified location.
#
#        *window* **identify** **tab** *x* *y*
#          Returns the index of the tab at the specified location.
#
#   *window* **index** *tabid*
#     Returns the numeric index of the tab specified by *tabid*, or the total number of tabs if tabid is the string **end**.
#
#   *window* **insert** *pos* *subwindow* ?*option* *value*? ... ?*option* *value*?
#     Inserts a tab (the *subwindow*) at the specified position.
#     *Pos* is either the string **end**, an integer index, or the name of a managed subwindow.
#     If *subwindow* is already managed by the notebook, moves it to the specified position.
#     See **TAB OPTIONS** for the list of available options.
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
#   *window* **select** ?*tabid*?
#     Selects the specified tab. The associated tab (the subwindow associated with the tab specified by *tabid*) will be displayed,
#     and the previously-selected tab (if different) is unmapped.
#     If *tabid* is omitted, returns the address of the currently selected tab.
#
#   *window* **state** ?*statespec*?
#     Modify or inquire the widget state.
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
#   *window* **tab** *tabid* ?*option*? ?*value*? ?*option* *value*? ... ?*option* *value*?
#     Query or modify the options of the tab specified by *tabid*.
#     If no *-option* is specified, returns a dictionary of the *tabid* option values.
#     If one *-option* is specified, returns the *tabid* value of that option.
#     Otherwise, sets the *tabid* *-options* to the corresponding values.
#     See TAB OPTIONS for the available options.
#
#   *window* **tabs**
#     Returns the list of tabs managed by the notebook, in the index order of their associated tabs.
#
#### TAB OPTIONS:
#
# The following options may be specified for individual notebook tabs:
#
#   **-compound**
#      Specifies how to display the image relative to the text, in the case both **-text** and **-image** are present.
#
#      Allowed values:
#         **text**                      --> Display the text only.
#         **image**                     --> Display the image only.
#         **center**                    --> Display the text centered on top of the image.
#         **top**                       --> Display the image above the text.
#         **bottom**                    --> Display the image below the text.
#         **left**                      --> Display the image before the text.
#         **right**                     --> Display the image after the text.
#         **none** or the empty string  --> Display the image if present, otherwise the text.
#
#      If not provided, defaults to the empty string.
#
#   **-image**
#      Specifies an image to display in the tab.
#      This is a list of one or more elements.
#      The first element is the default image name. The rest of the list is a sequence of statespec/value pairs as per
#      style map, specifying different images to use when the tab is in a particular state or combination of states.
#
#      Note that all images in the list should have the same size.
#
#      If an empty string is specified, it indicates that the tab has no image to display.
#      The image specified should have been already created at this option is specified.
#
#      If not provided, defaults to the empty string.
#
#   **-padding**
#      Specifies the amount of extra space to add between the notebook and this tab.
#      The padding is a list of up to four length specifications.
#      The values must be in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#      (pixels, points, inches, millimeters or centimeters).
#
#      A list of four values specifies the left, top, right and bottom padding.
#      A list of three values specifies the left, vertical, and right padding.
#      A list of two values specifies the horizontal and the vertical padding
#      A single value specifies the same padding all the way around the widget.
#
#      If not provided, defaults to **0**.
#
#   **-posthook**
#      Specifies a custom procedure name (fully qualified) to execute after a tab deselection is performed.
#      This procedure will be launched with one parameter, the associated tab address.
#
#      If not provided, defaults to the empty string, meaning no custom procedures will be executed after a tab deselection is performed.
#
#   **-prehook**
#      Specifies a custom procedure name (fully qualified) to execute before a tab selection is performed.
#      This procedure will be launched with one parameter, the associated tab address.
#
#      If not provided, defaults to the empty string, meaning no custom procedures will be executed before a tab selection is performed.
#
#   **-state**
#      Either **normal**, **disabled** or **hidden**.
#      If *disabled*, then the tab is not selectable.
#      If *hidden*, then the tab is not shown.
#
#      If not provided, defaults to **normal**.
#
#   **-sticky**
#      Specifies how the subwindow is positioned within the tab area.
#      Value is a string containing zero or more of the characters **n**, **s**, **e**, or **w**.
#      Each letter refers to a side (north, south, east, or west) that the content window will "stick" to, as per the grid geometry manager.
#
#      If not provided, defaults to **nsew**.
#
#   **-text**
#      Specifies a string to be displayed in the tab.
#
#      If not provided, defaults to the empty string.
#
#   **-underline**
#      If set, specifies the index of a character to underline in the text string.
#      The underlined character is used for mnemonic activation.
#
#      If not provided, defaults to **-1** (meaning no underline or mnemonic activation will be performed for that tab).
#
#### TAB IDENTIFIERS:
#
# The *tabid* argument to the widget commands may take any of the following forms:
#
#  - An integer between zero and the number of tabs.
#  - The address of a subwindow (tab).
#  - A positional specification of the form **@x,y**, which identifies the tab.
#  - The literal string **current**, which identifies the currently-selected tab.
#  - The literal string **end**, which returns the number of tabs (only valid for the "*window* **index**" command).
#
# Indexes support the same simple interpretation as for the command string index, with simple integer index arithmetic and
# indexing relative to end.
#
#### VIRTUAL EVENTS:
#
# The notebook widget generates a **NotebookTabChanged** virtual event after a new tab is selected.
#
#### STATES:
#
# The notebook widget supports only the **normal** state.
#
#### STYLING OPTIONS:
#
# Default style name: **TNotebook**
#
# An optional style **TNotebook.Tab** is used to configure the notebook tabs.
#
# Every notebook styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# The following **TNotebook.Tab** options are supported and configurable with the [style](/wiki/commands/style.md) command:
#
#   **-background** *color*
#   **-bordercolor** *color*
#   **-compound** *compound*
#   **-cursor** *cursor*
#   **-focuscolor** *color*
#   **-focussolid** *0* (dotted line) or *1* (straight line)
#   **-font** *font*
#   **-foreground** *color*
#
# Note: Some options are only available for specific themes.
#
# The **Notebook.Tab** padding is managed by the current theme and can only be changed by changing the theme.
#
# If you use a different style for your notebook (for example **MyStyle**) than **TNotebook**, you should provide a tab style as
# well (**MyStyle.Tab**), otherwise the **TNotebook.Tab** will be used to style your notebook's tabs.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the notebooks in order to facilitate the developer work and
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
# 7.  **ContextMenu** events will display the contextual menu associated with the widget.
#     See the **-cmenu** option for more details.
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
# The following behavior will happen if the widget has the focus or if one of its children has the focus but do not have a direct
# binding action setted for the key involved.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the previous
#     focussable widget.
#
# 2.  **Control-Tab** will scroll the widget's tabs towards the right or the bottom (depending on the widget tab position) while
#     **Control-Shift-Tab** will scroll the widget's tabs towards the left or the top (again, depending on the widget tab position).
#     Note that on macOS, **Control-Shift-Tab** will behave like **Control-Tab**.
#
# The following behavior will happen if the mouse pointer is over a widget's tab (no matter if it has the focus or not).
#
# 1.  If a **ButtonPress-1** event happens over any widget's tab, it will select that tab.
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
#### EXAMPLE:
#
#   # Create an notebook of 800x400 with 3 scrollable tabs.
#   notebook .nb     -class TNotebook \
#                   -height 400 \
#                    -state normal \
#                    -style TNotebook \
#                -takefocus 0 \
#                    -width 800;
#
#   # Create the scrollable tabs:
#   # tab1
#   frame .nb.f1 -borderwidth 2 \
#                     -height 600 \
#                     -relief solid \
#                  -scrollbar xy \
#                      -style TFrame \
#                  -takefocus 0 \
#                      -width 300;
#
#   # tab2
#   frame .nb.f2 -borderwidth 2 \
#                     -height 600 \
#                     -relief solid \
#                  -scrollbar xy \
#                      -style TFrame \
#                  -takefocus 0 \
#                      -width 300;
#
#   # tab3
#   frame .nb.f3 -borderwidth 2 \
#                     -height 600 \
#                     -relief solid \
#                  -scrollbar xy \
#                      -style TFrame \
#                  -takefocus 0 \
#                      -width 300;
#
#   # Create 120 labels in each tab, the labels will be positioned in two columns.
#   foreach tab [list f1 f2 f3] {
#       set row 0
#       set i 0
#       while { $i < 120 } {
#           label .nb.$tab.l$i -text [list "Label $i"]
#
#           grid .nb.$tab.l$i -column 0 \
#                               -padx [list 15 15] \
#                               -pady [list 15 15] \
#                                -row $row \
#                             -sticky we;
#
#           incr i
#
#           label .nb.$tab.l$i -text [list "Label $i"]
#
#           grid .nb.$tab.l$i -column 2 \
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
#   # Add the tabs to the notebook.
#   .nb add .nb.f1 -text " First Tab " -padding [list 5m 5m 2m 5m]
#   .nb add .nb.f2 -text " Second Tab" -padding [list 5m 5m 2m 5m]
#   .nb add .nb.f3 -text " Third Tab " -padding [list 5m 5m 2m 5m]
#
#   # Pack the notebook and expand it in both directions.
#   pack .nb -anchor nw \
#            -expand true \
#              -fill both \
#              -padx [list 15 15] \
#              -pady [list 15 15] \
#              -side top;
#
#   # Focus the first tab.
#   focus .nb.f1
#
#   # After 3 seconds, positions the viewpoint of the first tab so that label 39 is visible.
#   after 3000 [list .nb.f1 see .nb.f1.l39]
#
#   # After 6 seconds, positions the viewpoint of the second tab so that label 52 is visible.
#   after 6000 [list .nb.f2 see .nb.f2.l52]
#
#   # After 9 seconds, change the accent color to orange.
#   after 9000 [list set ::ms::accent orange]
#
#   # After 12 seconds, invert the colorscheme.
#   switch -- [tk windowingsystem] {
#       aqua {
#           switch -- [wm attributes . -isdark] {
#               0   { after 12000 [list set ::ms::colorscheme dark]  }
#               1   { after 12000 [list set ::ms::colorscheme light] }
#           }
#       }
#       default { after 12000 [list set ::ms::colorscheme dark] }
#   }
package provide ::ms::notebook 0.1

################################
##                            ##
##     _NOTEBOOK BINDINGS     ##
##                            ##
################################

# Activate/Deactivate
_bind _Notebook <Activate>   { interp invokehidden {} %W state [list !background]; break  }
_bind _Notebook <Deactivate> { interp invokehidden {} %W state [list  background]; break  }

# ButtonPress-1
_bind _Notebook <ButtonPress-1> { ::ms::notebook::Select_Tab %W %x %y; break  }

# Configure
_bind _Notebook <Configure> { ::ms::notebook::Configure %W; break  }

# Contextual menu
_bind _Notebook <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break  }

# Cursor Management
_bind _Notebook <Motion> { ::ms::notebook::Set_Cursor   %W %x %y; break  }
_bind _Notebook <Enter>  { ::ms::notebook::Reset_Cursor %W; break  }
_bind _Notebook <Leave>  { ::ms::notebook::Reset_Cursor %W; break  }

# Destroy
_bind _Notebook <Destroy> { ::ms::notebook::Destroy %W; break  }

# Enter/Leave
_bind _Notebook <Enter> [list +::ms::Hover %W %X %Y]
_bind _Notebook <Leave> [list +::ms::Hover %W %X %Y]

# FocusIn/FocusOut
_bind _Notebook <FocusIn>  { interp invokehidden {} %W state [list focus]; break }
_bind _Notebook <FocusOut> { ::ms::notebook::FocusOut %W; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Notebook <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Notebook <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Notebook <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Notebook <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Notebook <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Notebook <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **notebook** package.
namespace eval ::ms::notebook {
    # Set the 'non-styleable' notebook option list.
    set ::ms::notebook(non_styleable,options) [list class \
                                                    cmenu \
                                                    height \
                                                    state \
                                                    style \
                                                    takefocus \
                                                    width];

    # Set the 'styleable' notebook option list.
    set ::ms::notebook(styleable,options) [list background \
                                                bordercolor \
                                                cursor \
                                                darkcolor \
                                                lightcolor \
                                                tabposition];

    # Set the default 'non-styleable' notebook options values.
    set ::ms::default(notebook,class)     TNotebook
    set ::ms::default(notebook,cmenu)     {}
    set ::ms::default(notebook,height)    0
    set ::ms::default(notebook,state)     normal
    set ::ms::default(notebook,style)     TNotebook
    set ::ms::default(notebook,takefocus) 0
    set ::ms::default(notebook,width)     0

    # Note: The default 'styleable' notebook options values are always defined inside the current theme.
}

# Rename the original Tk **ttk::notebook** command.
rename ttk::notebook _ttk_notebook

# Create aliases for the mustang **notebook** command.
interp alias {} notebook      {} ::ms::notebook::Command
interp alias {} ttk::notebook {} ::ms::notebook::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::notebook** widget command.
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
proc ::ms::notebook::Command { window { args "" } } {
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
            set ::ms::default($w,class)     $::ms::default(notebook,class)
            set ::ms::default($w,cmenu)     $::ms::default(notebook,cmenu)
            set ::ms::default($w,height)    $::ms::default(notebook,height)
            set ::ms::default($w,state)     $::ms::default(notebook,state)
            set ::ms::default($w,style)     $::ms::default(notebook,style)
            set ::ms::default($w,takefocus) $::ms::default(notebook,takefocus)
            set ::ms::default($w,width)     $::ms::default(notebook,width)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)     $::ms::default(notebook,class)
            set ::ms::current($w,cmenu)     $::ms::default(notebook,cmenu)
            set ::ms::current($w,height)    $::ms::default(notebook,height)
            set ::ms::current($w,state)     $::ms::default(notebook,state)
            set ::ms::current($w,style)     $::ms::default(notebook,style)
            set ::ms::current($w,takefocus) $::ms::default(notebook,takefocus)
            set ::ms::current($w,width)     $::ms::default(notebook,width)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) notebook
            set ::ms::data($w,cursor)    ""

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
            #       To make a notebook styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **notebook** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)  Tk
            set ::ms::managed_by($w,bordercolor) Tk
            set ::ms::managed_by($w,cursor)      Tk
            set ::ms::managed_by($w,darkcolor)   Tk
            set ::ms::managed_by($w,lightcolor)  Tk
            set ::ms::managed_by($w,tabposition) Tk

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
                    -class { set ::ms::current($w,class) $value }
                    -cmenu {
                        set value [string trim $value]
                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
                            set ::ms::current($w,cmenu) $value
                        }
                    }
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
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
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
                    -state {}
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TNotebook' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TNotebook]
                            }

                            set ::ms::current($w,style) $value
                        }
                    }
                    -tabposition {
                        set value [string tolower $value]
                        switch -- $value {
                            e   -
                            en  -
                            es  -
                            n   -
                            ne  -
                            nw  -
                            s   -
                            se  -
                            sw  -
                            w   -
                            wn  -
                            ws  {
                                set ::ms::current($w,tabposition)    $value
                                set ::ms::managed_by($w,tabposition) developer
                            }
                            default { continue }
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
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,width) $value
                    }
                }
            }

            # Set the default value for each of the notebook styleable options and if the option is managed by Tk, set also its current value.
            foreach option $::ms::notebook(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TNotebook,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: The notebook client 'background' and 'cursor' are not allowed to change if the statespec changes.

            # Note: The notebook tabs 'compound', 'cursor', 'focuscolor', 'focussolid' and 'font' are not allowed
            #       to change if the statespec changes.

            ######################
            ##                  ##
            ##     NOTEBOOK     ##
            ##                  ##
            ######################

            set background  $::ms::styleopt($::ms::theme,TNotebook.Tab,background)
            set bordercolor $::ms::styleopt($::ms::theme,TNotebook.Tab,bordercolor)
            set compound    $::ms::styleopt($::ms::theme,TNotebook.Tab,compound)
            set cursor      $::ms::styleopt($::ms::theme,TNotebook.Tab,cursor)
            set focuscolor  $::ms::styleopt($::ms::theme,TNotebook.Tab,focuscolor)
            set focussolid  $::ms::styleopt($::ms::theme,TNotebook.Tab,focussolid)
            set font        $::ms::styleopt($::ms::theme,TNotebook.Tab,font)
            set foreground  $::ms::styleopt($::ms::theme,TNotebook.Tab,foreground)

            # Check if '::ms::current($w,style).Tab' exists among the styles known by the current theme.
            set notebook_tab_style [string cat $::ms::current($w,style) ".Tab"]
            if { ($notebook_tab_style in $::ms::style($::ms::theme)) && ($notebook_tab_style ne "TNotebook.Tab") } {
                # Check if a layout exists for '::ms::current($w,style).Tab'.
                # If not, create one by mirroring the 'TNotebook.Tab' layout for the current theme.
                if { $notebook_tab_style ni $::ms::layouts($::ms::theme) } {
                    _ttk_style layout $notebook_tab_style [_ttk_style layout TNotebook.Tab]
                }

                # Get the notebook tabs style extra options, if any.
                foreach option [list  background \
                                     bordercolor \
                                        compound \
                                          cursor \
                                      focuscolor \
                                      focussolid \
                                            font \
                                      foreground] {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$notebook_tab_style,$option)] {
                        1   { set $option $::ms::styleopt($::ms::theme,$notebook_tab_style,$option) }
                    }
                }
            }

            # Register the tab cursor.
            set ::ms::data($w,cursor) $cursor

            # Set the notebook style name.
            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                                   "_bgt=" $background \
                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                   "_bct=" $bordercolor \
                                                   "_cm="  $compound \
                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                   "_fc="  $focuscolor \
                                                   "_fs="  $focussolid \
                                                   "_fn="  $font \
                                                   "_fg="  $foreground \
                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                   "_tp="  $::ms::current($w,tabposition) \
                                                   "." $::ms::current($w,style)];

            # If needed, create the notebook style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                             -tabposition $::ms::current($w,tabposition);

                # Add the widget style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
            }

            # Initialize the notebook mapping.
            set mapping [list ]

            # bordercolor
            # Check if a 'bordercolor' mapping exists for '::ms::current($w,style)'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor)] {
                0   { lappend mapping -bordercolor [list pressed $::ms::current($w,bordercolor)] }
                1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor) }
            }

            # darkcolor
            # Check if a 'darkcolor' mapping exists for '::ms::current($w,style)'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor)] {
                0   { lappend mapping -darkcolor [list pressed $::ms::current($w,darkcolor)] }
                1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor) }
            }

            # lightcolor
            # Check if a 'lightcolor' mapping exists for '::ms::current($w,style)'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor)] {
                0   { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
                1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor) }
            }

            # If needed, create the notebook mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,widget) {*}$mapping

                # Add the notebook mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the notebook object.
            _ttk_notebook $w     -class $::ms::current($w,class) \
                                -cursor $::ms::current($w,cursor) \
                                -height $::ms::current($w,height) \
                               -padding 0 \
                                 -style $::ms::style($w,widget) \
                             -takefocus $::ms::current($w,takefocus) \
                                 -width $::ms::current($w,width);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ##########################
            ##                      ##
            ##     NOTEBOOK.TAB     ##
            ##                      ##
            ##########################

            # Set the notebook tabs style name.
            set ::ms::style($w,tabs) [string cat $::ms::style($w,widget) ".Tab"]

            # If needed, create the notebook tabs style name.
            if { $::ms::style($w,tabs) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,tabs)  -background $background \
                                                           -bordercolor $bordercolor \
                                                              -compound $compound \
                                                            -focuscolor $focuscolor \
                                                            -focussolid $focussolid \
                                                                  -font $font \
                                                            -foreground $foreground;

                # Add the notebook tabs style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,tabs)
            }

            # Initialize the notebook tabs mapping.
            set mapping [list ]

            # background
            # Check if a 'background' mapping exists for 'notebook_tab_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,background)] {
                0   { lappend mapping -background [list pressed $background] }
                1   { lappend mapping -background $::ms::stylemap($::ms::theme,$notebook_tab_style,background) }
            }

            # bordercolor
            # Check if a 'bordercolor' mapping exists for 'notebook_tab_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,bordercolor)] {
                0   { lappend mapping -bordercolor [list pressed $bordercolor] }
                1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$notebook_tab_style,bordercolor) }
            }

            # foreground
            # Check if a 'foreground' mapping exists for 'notebook_tab_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,foreground)] {
                0   { lappend mapping -foreground [list pressed $foreground] }
                1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$notebook_tab_style,foreground) }
            }

            # If needed, create the notebook tabs mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,tabs) {*}$mapping

                # Add the notebook tabs mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Configure the tab fills for the tabposition specified in the relative Tab style
            # associated to '::ms::style($w,widget)', for the current theme.
            [string cat "::ms::" $::ms::theme "_NotebookTab_Fills"] $::ms::style($w,widget)

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TNotebook { _bindtags $w [list $w _Notebook TNotebook $::ms::addr($w,toplevel) all] }
                default   { _bindtags $w [list $w $::ms::current($w,class) _Notebook TNotebook $::ms::addr($w,toplevel) all] }
            }

            # Add the notebook to the related toplevel keyboard pages navigation bindings.
            ::ms::Enable_Traversal $w

            # Add the notebook to the related toplevel keyboard Tab and mnemonics navigation bindings.
            ::ms::notebook::Enable_Traversal $w

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::notebook::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::notebook::Pathname_Cmd $w]
            }

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w

            # Set the structure addresses.
            set ::ms::addr($w,structure) [list $w]

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short addresses relative to its real address, 'w'.
            # They will all point to the widget hull object short address.
            set ::ms::addr($w,short)      $short_addr
            set ::ms::addr($w.tabs,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals)  $w
            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the notebook widgets real address list.
            lappend ::ms::addr(notebook) $w

            # Add the widget address to the notebook classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),notebook,addrs) $w

            # Add the widget address to the notebook classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),notebook,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the notebook classtype.
            if { $::ms::current($w,style) ni $::ms::style(notebook,classtype) } {
                lappend ::ms::style(notebook,classtype) $::ms::current($w,style)
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
proc ::ms::notebook::Pathname_Cmd { w cmd args } {
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

            # Check that the 'subwindow' provided is a direct child of the notebook widget.
            if { [_winfo parent $subwindow] ne $w } {
                return ""
            }

            # Check that the command 'args' forms a valid 'option/value' list.
            switch -- [expr { [llength $args]%2 }] {
                0       {}
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Register and remove the '-prehook' and '-posthook' tab options, if any.
            foreach word [list -posthook \
                                -prehook] {
                set option [string range $word 1 end]
                set index  [lsearch -exact $args $word]
                switch -- $index {
                    -1      { set ::ms::data($subwindow,$option) "" }
                    default {
                        set ::ms::data($subwindow,$option) [lindex $args $index+1]
                        set args [lremove $args $index $index+1]
                    }
                }
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
                    set option [string tolower [string range $args 1 end]]
                    if { ($option in $::ms::notebook(non_styleable,options)) || ($option in $::ms::notebook(styleable,options)) } {
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
                    foreach option $::ms::notebook(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::notebook(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::notebook(non_styleable,options)) || ($option in $::ms::notebook(styleable,options)) } {
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
                            #       Their registration (if any) is done in the '::ms::notebook::Configure' event procedure.
                            set ::ms::temp($w,height) $::ms::current($w,height)
                            set ::ms::temp($w,width)  $::ms::current($w,width)

                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

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
                                    -class {}
                                    -cmenu {
                                        set value [string trim $value]
                                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
                                            set ::ms::current($w,cmenu) $value
                                        }
                                    }
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
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
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
                                    -state {}
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Check if exists a layout for the style provided.
                                            # If not, create one by mirroring the current theme 'TNotebook' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TNotebook]
                                            }

                                            # Remove the widget address from the notebook classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),notebook,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),notebook,addrs) [lremove $::ms::style($::ms::current($w,style),notebook,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,notebook,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the notebook classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),notebook,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(notebook,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(notebook,classtype) [lremove $::ms::style(notebook,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the notebook classtype.
                                            if { $value ni $::ms::style(notebook,classtype) } {
                                                lappend ::ms::style(notebook,classtype) $value
                                            }

                                            # Configure the tab fills for the tabposition specified in the relative Tab style
                                            # associated to 'value', for the current theme.
                                            [string cat "::ms::" $::ms::theme "_NotebookTab_Fills"] $value

                                            # Update the current style associated with the widget with 'value'.
                                            set ::ms::current($w,style) $value
                                        }
                                    }
                                    -tabposition {}
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
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TNotebook,$option)

                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            ###############################
                            ##                           ##
                            ##     CONFIGURE THE WIDGET  ##
                            ##                           ##
                            ###############################

                            # Note: The notebook client 'background' and 'cursor' are not allowed to change if the statespec changes.

                            # Note: The notebook tabs 'compound', 'cursor', 'focuscolor', 'focussolid' and 'font' are not allowed
                            #       to change if the statespec changes.

                            ######################
                            ##                  ##
                            ##     NOTEBOOK     ##
                            ##                  ##
                            ######################

                            set background  $::ms::styleopt($::ms::theme,TNotebook.Tab,background)
                            set bordercolor $::ms::styleopt($::ms::theme,TNotebook.Tab,bordercolor)
                            set compound    $::ms::styleopt($::ms::theme,TNotebook.Tab,compound)
                            set cursor      $::ms::styleopt($::ms::theme,TNotebook.Tab,cursor)
                            set focuscolor  $::ms::styleopt($::ms::theme,TNotebook.Tab,focuscolor)
                            set focussolid  $::ms::styleopt($::ms::theme,TNotebook.Tab,focussolid)
                            set font        $::ms::styleopt($::ms::theme,TNotebook.Tab,font)
                            set foreground  $::ms::styleopt($::ms::theme,TNotebook.Tab,foreground)

                            # Check if '::ms::current($w,style).Tab' exists among the styles known by the current theme.
                            set notebook_tab_style [string cat $::ms::current($w,style) ".Tab"]
                            if { ($notebook_tab_style in $::ms::style($::ms::theme)) && ($notebook_tab_style ne "TNotebook.Tab") } {
                                # Check if a layout exists for '::ms::current($w,style).Tab'.
                                # If not, create one by mirroring the 'TNotebook.Tab' layout for the current theme.
                                if { $notebook_tab_style ni $::ms::layouts($::ms::theme) } {
                                    _ttk_style layout $notebook_tab_style [_ttk_style layout TNotebook.Tab]
                                }

                                # Get the notebook tabs style extra options, if any.
                                foreach option [list  background \
                                                     bordercolor \
                                                        compound \
                                                          cursor \
                                                      focuscolor \
                                                      focussolid \
                                                            font \
                                                      foreground] {
                                    switch -- [info exists ::ms::styleopt($::ms::theme,$notebook_tab_style,$option)] {
                                        1   { set $option $::ms::styleopt($::ms::theme,$notebook_tab_style,$option) }
                                    }
                                }
                            }

                            # Register the tab cursor.
                            set ::ms::data($w,cursor) $cursor

                            # Set the notebook style name.
                            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                                                   "_bgt=" $background \
                                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                                   "_bct=" $bordercolor \
                                                                   "_cm="  $compound \
                                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                                   "_fc="  $focuscolor \
                                                                   "_fs="  $focussolid \
                                                                   "_fn="  $font \
                                                                   "_fg="  $foreground \
                                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                                   "_tp="  $::ms::current($w,tabposition) \
                                                                   "." $::ms::current($w,style)];

                            # If needed, create the notebook style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                                             -tabposition $::ms::current($w,tabposition);

                                # Add the widget style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
                            }

                            # Initialize the notebook mapping.
                            set mapping [list ]

                            # bordercolor
                            # Check if a 'bordercolor' mapping exists for '::ms::current($w,style)'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor)] {
                                0   { lappend mapping -bordercolor [list pressed $::ms::current($w,bordercolor)] }
                                1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor) }
                            }

                            # darkcolor
                            # Check if a 'darkcolor' mapping exists for '::ms::current($w,style)'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor)] {
                                0   { lappend mapping -darkcolor [list pressed $::ms::current($w,darkcolor)] }
                                1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor) }
                            }

                            # lightcolor
                            # Check if a 'lightcolor' mapping exists for '::ms::current($w,style)'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor)] {
                                0   { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
                                1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor) }
                            }

                            # If needed, create the notebook mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,widget) {*}$mapping

                                # Add the notebook mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            interp invokehidden {} $w configure    -cursor $::ms::current($w,cursor) \
                                                                   -height $::ms::temp($w,height) \
                                                                    -style $::ms::style($w,widget) \
                                                                -takefocus $::ms::current($w,takefocus) \
                                                                    -width $::ms::temp($w,width);

                            # Set the widget toplevel.
                            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

                            ##########################
                            ##                      ##
                            ##     NOTEBOOK.TAB     ##
                            ##                      ##
                            ##########################

                            # Set the notebook tabs style name.
                            set ::ms::style($w,tabs) [string cat $::ms::style($w,widget) ".Tab"]

                            # If needed, create the notebook tabs style name.
                            if { $::ms::style($w,tabs) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,tabs)  -background $background \
                                                                           -bordercolor $bordercolor \
                                                                              -compound $compound \
                                                                            -focuscolor $focuscolor \
                                                                            -focussolid $focussolid \
                                                                                  -font $font \
                                                                            -foreground $foreground;

                                # Add the notebook tabs style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,tabs)
                            }

                            # Initialize the notebook tabs mapping.
                            set mapping [list ]

                            # background
                            # Check if a 'background' mapping exists for 'notebook_tab_style'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,background)] {
                                0   { lappend mapping -background [list pressed $background] }
                                1   { lappend mapping -background $::ms::stylemap($::ms::theme,$notebook_tab_style,background) }
                            }

                            # bordercolor
                            # Check if a 'bordercolor' mapping exists for 'notebook_tab_style'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,bordercolor)] {
                                0   { lappend mapping -bordercolor [list pressed $bordercolor] }
                                1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$notebook_tab_style,bordercolor) }
                            }

                            # foreground
                            # Check if a 'foreground' mapping exists for 'notebook_tab_style'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,foreground)] {
                                0   { lappend mapping -foreground [list pressed $foreground] }
                                1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$notebook_tab_style,foreground) }
                            }

                            # If needed, create the notebook tabs mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,tabs) {*}$mapping

                                # Add the notebook tabs mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Configure the tab fills for the tabposition specified in the relative Tab style
                            # associated to '::ms::style($w,widget)', for the current theme.
                            [string cat "::ms::" $::ms::theme "_NotebookTab_Fills"] $::ms::style($w,widget)

                            # Note: If width and/or height were provided by the developer, and these values were accepted by Tk,
                            #       then a configure event will be invoked by Tk ('::ms::notebook::Configure').
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
            # *window* **forget** *tabid*

            # Check if the 'tabid' provided is a tab index.
            switch -- [string is integer -strict $args] {
                0   {
                    # Check if the 'tabid' provided is the word 'current'.
                    switch -nocase -- $args {
                        current { set tabid "current" }
                        default {
                            # Check if the 'tabid' provided is a short address.
                            set result [::ms::Check_Pathname $args invalid]
                            switch -- $result {
                                invalid {
                                    # Check if the 'tabid' provided is a positional specification of the form '@x,y'.
                                    switch -- [lindex $args 0] {
                                        "@" {
                                            set position [split [string range $args 1 end] ","]
                                            foreach coordinate $position {
                                                switch -- [string is integer -strict $coordinate] {
                                                    0   { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                                }
                                            }

                                            set tabid $args
                                        }
                                        default { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                    }
                                }
                                default { set tabid [lindex $result 0] }
                            }
                        }
                    }
                }
                1   { set tabid $args }
            }

            # Get the tabid address.
            set tabid_index [interp invokehidden {} $w index $tabid]
            set tabid_addr  [lindex [interp invokehidden {} $w tabs] $tabid_index]

            # Remove the '-posthook' and '-prehook' options.
            unset -nocomplain -- ::ms::data($tabid_addr,posthook) \
                                 ::ms::data($tabid_addr,prehook);

            # Execute the command.
            try {
                interp invokehidden {} $w forget $tabid
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        hide {
            # Synopsis:
            #
            # *window* **hide** *tabid*

            # Check if the 'tabid' provided is a tab index.
            switch -- [string is integer -strict $args] {
                0   {
                    # Check if the 'tabid' provided is the word 'current'.
                    switch -nocase -- $args {
                        current { set tabid "current" }
                        default {
                            # Check if the 'tabid' provided is a short address.
                            set result [::ms::Check_Pathname $args invalid]
                            switch -- $result {
                                invalid {
                                    # Check if the 'tabid' provided is a positional specification of the form '@x,y'.
                                    switch -- [lindex $args 0] {
                                        "@" {
                                            set position [split [string range $args 1 end] ","]
                                            foreach coordinate $position {
                                                switch -- [string is integer -strict $coordinate] {
                                                    0   { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                                }
                                            }

                                            set tabid $args
                                        }
                                        default { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                    }
                                }
                                default { set tabid [lindex $result 0] }
                            }
                        }
                    }
                }
                1   { set tabid $args }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w hide $tabid
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
            #    *window* **identify** **tab** *x* *y*
            try {
                interp invokehidden {} $w identify {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                # Check the subcommand provided.
                switch -- [lindex $args 0] {
                    element {
                        switch -- $result {
                            label   { set result "Notebook.tab" }
                            default { set result "Notebook.client" }
                        }
                    }
                }

                return $result
            }
        }
        index {
            # Synopsis:
            #
            # *window* **index** *tabid*

            # Check if the 'tabid' provided is a tab index.
            switch -- [string is integer -strict $args] {
                0   {
                    # Check if the 'tabid' provided is the word 'end' or 'current'.
                    switch -nocase -- $args {
                        end     { set tabid "end" }
                        current { set tabid "current" }
                        default {
                            # Check if the 'tabid' provided is a short address.
                            set result [::ms::Check_Pathname $args invalid]
                            switch -- $result {
                                invalid {
                                    # Check if the 'tabid' provided is a positional specification of the form '@x,y'.
                                    switch -- [lindex $args 0] {
                                        "@" {
                                            set position [split [string range $args 1 end] ","]
                                            foreach coordinate $position {
                                                switch -- [string is integer -strict $coordinate] {
                                                    0   { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                                }
                                            }

                                            set tabid $args
                                        }
                                        default { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                    }
                                }
                                default { set tabid [lindex $result 0] }
                            }
                        }
                    }
                }
                1   { set tabid $args }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w index $tabid
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        insert {
            # Synopsis:
            #
            # *window* **insert** *pos* *subwindow* ?*option value*? ... ?*option value*?
            set pos       [lindex  $args 0]
            set subwindow [lindex  $args 1]
            set args      [lremove $args 0 1]

            # Check the tab position provided.
            switch -- [string is integer -strict $pos] {
                0   {
                    # Check if the 'pos' provided is the word 'end'.
                    switch -nocase -- $pos {
                        end     { set pos "end" }
                        default {
                            # Check if the 'pos' provided is a short address.
                            set result [::ms::Check_Pathname $pos invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid tab option, '$pos'." $caller_info }
                                default {
                                    # Check if the pos real address is an already managed subwindow.
                                    if { [lindex $result 0] ni [interp invokehidden {} $w tabs] } {
                                        ::ms::Error "Invalid tab option, '$pos'." $caller_info
                                    } else {
                                        set pos [lindex $result 0]
                                    }
                                }
                            }
                        }
                    }
                }
                1   {
                    if { $pos < 0 } {
                        ::ms::Error "Invalid tab option, '$pos'." $caller_info
                    }
                }
            }

            # Get the 'subwindow' real address.
            set result [::ms::Check_Pathname $subwindow invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$subwindow'." $caller_info }
                default { set subwindow [lindex $result 0] }
            }

            # Check that the 'subwindow' provided is a direct child of the notebook widget.
            if { [_winfo parent $subwindow] ne $w } {
                return ""
            }

            # Check that the command 'args' forms a valid 'option/value' list.
            switch -- [expr { [llength $args]%2 }] {
                0       {}
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Register and remove the '-prehook' and '-posthook' tab options, if any.
            foreach word [list -posthook \
                                -prehook] {
                set option [string range $word 1 end]
                set index  [lsearch -exact $args $word]
                switch -- $index {
                    -1      { set ::ms::data($subwindow,$option) "" }
                    default {
                        set ::ms::data($subwindow,$option) [lindex $args $index+1]
                        set args [lremove $args $index $index+1]
                    }
                }
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
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        select {
            # Synopsis:
            #
            # *window* **select** ?*tabid*?
            switch -- [llength $args] {
                0   { return [interp invokehidden {} $w select] }
                1   {
                    # Check if the 'tabid' provided is a tab index.
                    switch -- [string is integer -strict $args] {
                        0   {
                            # Check if the 'tabid' provided is the word 'current'.
                            switch -nocase -- $args {
                                current { set tabid "current" }
                                default {
                                    # Check if the 'tabid' provided is a short address.
                                    set result [::ms::Check_Pathname $args invalid]
                                    switch -- $result {
                                        invalid {
                                            # Check if the 'tabid' provided is a positional specification of the form '@x,y'.
                                            switch -- [lindex $args 0] {
                                                "@" {
                                                    set position [split [string range $args 1 end] ","]
                                                    foreach coordinate $position {
                                                        switch -- [string is integer -strict $coordinate] {
                                                            0   { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                                        }
                                                    }

                                                    set tabid $args
                                                }
                                                default { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                            }
                                        }
                                        default { set tabid [lindex $result 0] }
                                    }
                                }
                            }
                        }
                        1   { set tabid $args }
                    }

                    # Execute the command.
                    try {
                        interp invokehidden {} $w select $tabid
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
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
                0       { return $::ms::current($w,style) }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        tab {
            # Synopsis:
            #
            # *window* **tab** *tabid* ?*option*? ?*value*? ?*option value*? ... ?*option value*?
            set tabid [lindex  $args 0]
            set args  [lremove $args 0]

            # Check if the 'tabid' provided is a tab index.
            switch -- [string is integer -strict $tabid] {
                0   {
                    # Check if the 'tabid' provided is the word 'current'.
                    switch -nocase -- $tabid {
                        current { set tabid "current" }
                        default {
                            # Check if the 'tabid' provided is a short address.
                            set result [::ms::Check_Pathname $tabid invalid]
                            switch -- $result {
                                invalid {
                                    # Check if the 'tabid' provided is a positional specification of the form '@x,y'.
                                    switch -- [lindex $tabid 0] {
                                        "@" {
                                            set position [split [string range $tabid 1 end] ","]
                                            foreach coordinate $position {
                                                switch -- [string is integer -strict $coordinate] {
                                                    0   { ::ms::Error "Invalid tabid, '$tabid'." $caller_info }
                                                }
                                            }
                                        }
                                        default { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                    }
                                }
                                default { set tabid [lindex $result 0] }
                            }
                        }
                    }
                }
            }

            # Get the tabid address.
            set tabid_index [interp invokehidden {} $w index $tabid]
            set tabid_addr  [lindex [interp invokehidden {} $w tabs] $tabid_index]

            switch -- [llength $args] {
                0   {
                    # case: Return all the tabid options/values.

                    try {
                        interp invokehidden {} $w tab $tabid
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        # Add the 'prehook' and 'posthook' options.
                        lappend result "-posthook" "$::ms::data($tabid_addr,posthook)" \
                                        "-prehook" "$::ms::data($tabid_addr,prehook)";

                        # Return the sorted result.
                        return [lsort -dictionary -increasing -stride 2 -index 0 $result]
                    }
                }
                1   {
                    # case: Return the tabid option value requested.

                    switch -nocase -- $args {
                        -posthook { return $::ms::data($tabid_addr,posthook) }
                        -prehook  { return $::ms::data($tabid_addr,prehook) }
                        default {
                            try {
                                interp invokehidden {} $w tab $tabid $args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                    }
                }
                default {
                    # case: Set all the tabid options/values provided.

                    # Check that the command 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0       {}
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }

                    # Register and remove the '-prehook' and '-posthook' tab options, if any.
                    foreach word [list -posthook \
                                        -prehook] {
                        set option [string range $word 1 end]
                        set index  [lsearch -exact $args $word]
                        switch -- $index {
                            -1      {}
                            default {
                                set ::ms::data($tabid_addr,$option) [lindex $args $index+1]
                                set args [lremove $args $index $index+1]
                            }
                        }
                    }

                    # Set the other Tk tab options provided.
                    try {
                        interp invokehidden {} $w tab $tabid {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
            }
        }
        tabs {
            # Synopsis:
            #
            # *window* **tabs**
            switch -- [llength $args] {
                0   {
                    # Execute the command.
                    try {
                        interp invokehidden {} $w tabs {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
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
# Update any notebook widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::notebook::Style_Update { stylename caller_info } {
    # Configure the tab fills for the tabposition specified in the relative tab style
    # associated to 'stylename', for the current theme.
    [string cat "::ms::" $::ms::theme "_NotebookTab_Fills"] $stylename

    ##############################################
    ##                                          ##
    ##     GET THE WIDGET TAB STYLE OPTIONS     ##
    ##                                          ##
    ##############################################

    set background  $::ms::styleopt($::ms::theme,TNotebook.Tab,background)
    set bordercolor $::ms::styleopt($::ms::theme,TNotebook.Tab,bordercolor)
    set compound    $::ms::styleopt($::ms::theme,TNotebook.Tab,compound)
    set cursor      $::ms::styleopt($::ms::theme,TNotebook.Tab,cursor)
    set focuscolor  $::ms::styleopt($::ms::theme,TNotebook.Tab,focuscolor)
    set focussolid  $::ms::styleopt($::ms::theme,TNotebook.Tab,focussolid)
    set font        $::ms::styleopt($::ms::theme,TNotebook.Tab,font)
    set foreground  $::ms::styleopt($::ms::theme,TNotebook.Tab,foreground)

    # Check if 'stylename.Tab' exists among the styles known by the current theme.
    set notebook_tab_style [string cat $stylename ".Tab"]
    if { ($notebook_tab_style in $::ms::style($::ms::theme)) && ($notebook_tab_style ne "TNotebook.Tab") } {
        # Check if a layout exists for 'stylename.Tab'.
        # If not, create one by mirroring the 'TNotebook.Tab' layout for the current theme.
        if { $notebook_tab_style ni $::ms::layouts($::ms::theme) } {
            _ttk_style layout $notebook_tab_style [_ttk_style layout TNotebook.Tab]
        }

        # Get the notebook tabs style extra options, if any.
        foreach option [list  background \
                             bordercolor \
                                compound \
                                  cursor \
                              focuscolor \
                              focussolid \
                                    font \
                              foreground] {
            switch -- [info exists ::ms::styleopt($::ms::theme,$notebook_tab_style,$option)] {
                1   { set $option $::ms::styleopt($::ms::theme,$notebook_tab_style,$option) }
            }
        }
    }

    # Update all the notebook widgets that have stylename as a style.
    foreach w $::ms::style($stylename,notebook,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::notebook(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TNotebook,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        # Register the tab cursor.
        set ::ms::data($w,cursor) $cursor

        #######################################
        ##                                   ##
        ##     UPDATE THE WIDGET'S STYLE     ##
        ##                                   ##
        #######################################

        # Note: The notebook client 'background' and 'cursor' are not allowed to change if the statespec changes.

        # Note: The notebook tabs 'compound', 'cursor', 'focuscolor', 'focussolid' and 'font' are not allowed
        #       to change if the statespec changes.

        ######################
        ##                  ##
        ##     NOTEBOOK     ##
        ##                  ##
        ######################

        # Set the notebook style name.
        set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                               "_bgt=" $background \
                                               "_bc="  $::ms::current($w,bordercolor) \
                                               "_bct=" $bordercolor \
                                               "_cm="  $compound \
                                               "_dc="  $::ms::current($w,darkcolor) \
                                               "_fc="  $focuscolor \
                                               "_fs="  $focussolid \
                                               "_fn="  $font \
                                               "_fg="  $foreground \
                                               "_lc="  $::ms::current($w,lightcolor) \
                                               "_tp="  $::ms::current($w,tabposition) \
                                               "." $stylename];

        # If needed, create the notebook style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                         -bordercolor $::ms::current($w,bordercolor) \
                                                           -darkcolor $::ms::current($w,darkcolor) \
                                                          -lightcolor $::ms::current($w,lightcolor) \
                                                         -tabposition $::ms::current($w,tabposition);

            # Add the widget style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
        }

        # Initialize the notebook mapping.
        set mapping [list ]

        # bordercolor
        # Check if a 'bordercolor' mapping exists for 'stylename'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,bordercolor)] {
            0   { lappend mapping -bordercolor [list pressed $::ms::current($w,bordercolor)] }
            1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$stylename,bordercolor) }
        }

        # darkcolor
        # Check if a 'darkcolor' mapping exists for 'stylename'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,darkcolor)] {
            0   { lappend mapping -darkcolor [list pressed $::ms::current($w,darkcolor)] }
            1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$stylename,darkcolor) }
        }

        # lightcolor
        # Check if a 'lightcolor' mapping exists for 'stylename'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,lightcolor)] {
            0   { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
            1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$stylename,lightcolor) }
        }

        # If needed, create the notebook mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,widget) {*}$mapping

            # Add the notebook mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        interp invokehidden {} $w configure -cursor $::ms::current($w,cursor) \
                                             -style $stylename;

        ##########################
        ##                      ##
        ##     NOTEBOOK.TAB     ##
        ##                      ##
        ##########################

        # Set the notebook tabs style name.
        set ::ms::style($w,tabs) [string cat $::ms::style($w,widget) ".Tab"]

        # If needed, create the notebook tabs style name.
        if { $::ms::style($w,tabs) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,tabs)  -background $background \
                                                       -bordercolor $bordercolor \
                                                          -compound $compound \
                                                        -focuscolor $focuscolor \
                                                        -focussolid $focussolid \
                                                              -font $font \
                                                        -foreground $foreground;

            # Add the notebook tabs style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,tabs)
        }

        # Initialize the notebook tabs mapping.
        set mapping [list ]

        # background
        # Check if a 'background' mapping exists for 'notebook_tab_style'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,background)] {
            0   { lappend mapping -background [list pressed $background] }
            1   { lappend mapping -background $::ms::stylemap($::ms::theme,$notebook_tab_style,background) }
        }

        # bordercolor
        # Check if a 'bordercolor' mapping exists for 'notebook_tab_style'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,bordercolor)] {
            0   { lappend mapping -bordercolor [list pressed $bordercolor] }
            1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$notebook_tab_style,bordercolor) }
        }

        # foreground
        # Check if a 'foreground' mapping exists for 'notebook_tab_style'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,foreground)] {
            0   { lappend mapping -foreground [list pressed $foreground] }
            1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$notebook_tab_style,foreground) }
        }

        # If needed, create the notebook tabs mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,tabs) {*}$mapping

            # Add the notebook tabs mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }
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
proc ::ms::notebook::Configure { w } {
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
proc ::ms::notebook::Destroy { w } {
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

    # Remove the widget real address from the list of all available real addresses.
    set index [lsearch -exact $::ms::addr(reals) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
    }

    # Remove the widget address from the notebook widgets real address list.
    set index [lsearch -exact $::ms::addr(notebook) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(notebook) [lremove $::ms::addr(notebook) $index] }
    }

    # Remove the widget address from the notebook classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),notebook,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),notebook,addrs) [lremove $::ms::class($::ms::current($w,class),notebook,addrs) $index] }
    }

    # Remove the widget address from the notebook classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),notebook,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),notebook,addrs) [lremove $::ms::style($::ms::current($w,style),notebook,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the notebook classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),notebook,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(notebook,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(notebook,classtype) [lremove $::ms::style(notebook,classtype) $index] }
            }
        }
    }

    # Destroy the bindings for the widget real address in its related toplevel.
    ::ms::notebook::Clean_Up $w

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,class) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,height) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,tabposition) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,width);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,cursor);

    unset -nocomplain -- ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,class) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,height) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,tabposition) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,width);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,tabposition);

    unset -nocomplain -- ::ms::style($w,tabs) \
                         ::ms::style($w,widget);

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
proc ::ms::notebook::FocusOut { w } {
    # Check if a contextual menu was assigned to the widget.
    # If not, use the contextual menu of the widget's toplevel.
    set cmenu $::ms::current($w,cmenu)
    switch -- $cmenu {
        ""  { set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu) }
    }

    # If 'cmenu' exists (meaning it's open), do not loose the focus (graphically).
    switch -- [_winfo exists $cmenu] {
        0   { ::ms::canvas::Pathname_Cmd $w state [list !focus] }
        1   { ::ms::canvas::Pathname_Cmd $w state [list  focus] }
    }

    return ""
}

## Select_Tab
#
# Manage the **ButtonPress-1** event on a notebook tabs by selecting that tab.
#
# Where:
#
# w    Should be the widget real address involved.
#
# x,
# y    Should be the coordinates of the event relative to the widget.
#
# It doesn't return anything.
proc ::ms::notebook::Select_Tab { w x y } {
    set index     [interp invokehidden {} $w index @$x,$y]
    set tabs_addr [interp invokehidden {} $w tabs]

    # Check if the index is the empty string.
    switch -- $index {
        ""  { return "" }
    }

    # Get the current tab index and address.
    set current_index    [interp invokehidden {} $w index current]
    set current_tab_addr [lindex $tabs_addr $current_index]

    # Check the tab state (the one that was selected).
    switch -- [interp invokehidden {} $w tab $index -state] {
        disabled { return "" }
    }

    # Check if 'index' is different than 'current_index'.
    if { $current_index != $index } {
        # Launch the current tab address 'posthook', if any.
        switch -- $::ms::data($current_tab_addr,posthook) {
            ""      {}
            default {
                try {
                    {*}$::ms::data($current_tab_addr,posthook) $current_tab_addr
                } on error { errortext errorcode } {
                    ::ms::Error "$errortext" ""
                }
            }
        }

        # Get the index tab address.
        set index_addr [lindex $tabs_addr $index]

        # Launch the soon to be selected tab address 'prehook', if any.
        switch -- $::ms::data($index_addr,prehook) {
            ""      {}
            default {
                try {
                    {*}$::ms::data($index_addr,prehook) $index_addr
                } on error { errortext errorcode } {
                    ::ms::Error "$errortext" ""
                }
            }
        }

        # Register the focussed widget for the current tab.
        set current_tab [interp invokehidden {} $w select]
        set ::ms::temp($w,$current_tab,focussed_widget) [_focus]

        # Select the 'index' tab.
        ::ms::notebook::Activate_Tab $w $index
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
# Reset the cursor shape on a notebook.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::notebook::Reset_Cursor { w } {
    # Check if the cursor is different than the '::ms::current($w,cursor)' provided.
    if { [interp invokehidden {} $w cget -cursor] ne $::ms::current($w,cursor) } {
        interp invokehidden {} $w configure -cursor $::ms::current($w,cursor)
    }

    return ""
}

## Set_Cursor
#
# Set the cursor shape on a notebook tab.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates of the event.
#        These values should be provided by the <Motion> event.
#
# It doesn't return anything.
proc ::ms::notebook::Set_Cursor { w x y } {
    # Check if the is over a notebook tab.
    switch -- [interp invokehidden {} $w identify tab $x $y] {
        ""  {
            # The cursor is over the notebook client.

            # Check if the cursor is different than the '::ms::current($w,cursor)' provided.
            if { [interp invokehidden {} $w cget -cursor] ne $::ms::current($w,cursor) } {
                interp invokehidden {} $w configure -cursor $::ms::current($w,cursor)
            }
        }
        default {
            # The cursor is over a notebook tab.

            # Check if the cursor is different than '::ms::data($w,cursor)'.
            if { [interp invokehidden {} $w cget -cursor] ne $::ms::data($w,cursor) } {
                interp invokehidden {} $w configure -cursor $::ms::data($w,cursor)
            }
        }
    }

    return ""
}

################################
##                            ##
##     KEYBOARD TRAVERSAL     ##
##                            ##
################################

# Note: The following procedures were inspired by the ttk::notebook mechanism for traverse bindings.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## Activate_Tab
#
# Select the specified tab and set focus.
#
# Desired behavior:
#   + take focus when reselecting the currently-selected tab;
#   + keep focus if the notebook already has it;
#   + otherwise set focus to the first traversable widget in the newly-selected tab;
#   + do not leave the focus in a deselected tab.
#
# Where:
#
# w     Should be the widget real address involved.
#
# tab   Should be the tab address to activate.
#
# It doesn't return anything.
proc ::ms::notebook::Activate_Tab { w tab } {
    # Get the current selected tab.
    set old_tab [interp invokehidden {} $w select]

    # Select the new tab
    interp invokehidden {} $w select $tab

    # Get the new selected tab.
    # NOTE: might not be $tab, if $tab is disabled.
    set new_tab [interp invokehidden {} $w select]

    # Check if 'new_tab' have been previously selected.
    switch -- [info exists ::ms::temp($w,$new_tab,focussed_widget)] {
        1   {
            # Re-establish the focus on the last focussed widget for 'new_tab'.
            ::ttk::traverseTo $::ms::temp($w,$new_tab,focussed_widget)

            return ""
        }
    }

    if { [_focus] eq $w } {
        return ""
    }

    if { $new_tab eq $old_tab } {
        _focus -force $w

        return ""
    }

    # Needed so that the focus logic sees the correct mapped states.
    update idletasks

    set focus_widget [::ttk::focusFirst $new_tab]
    switch -- $focus_widget {
        ""      { _focus -force $w }
        default { ::ttk::traverseTo $focus_widget }
    }

    return ""
}

## Clean_Up
#
# <Destroy> binding for notebooks.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::notebook::Clean_Up { w } {
    # Get the toplevel related to 'w'.
    set toplevel [_winfo toplevel $w]

    switch -- [info exists ::ms::notebook(traversal,$toplevel)] {
        1   {
            set index [lsearch -exact $::ms::notebook(traversal,$toplevel) $w]
            set ::ms::notebook(traversal,$toplevel) [lreplace $::ms::notebook(traversal,$toplevel) $index $index]
        }
    }

    return ""
}

## Cycle_Tab
#
# Select the next/previous tab in the list.
#
# Where:
#
# w        Should be the widget real address involved.
#
# dir      Should be the amount of the movement.
#          Its sign determines the direction to take (**+120.0** or **-120.0).
#
# factor   Should be a double.
#          It's used as dividend of the amount provided.
#          If not provided, **1.0** will be used.
#
# It doesn't return anything.
proc ::ms::notebook::Cycle_Tab { w dir { factor 1.0 } } {
    set current [interp invokehidden {} $w index current]
    if { $current >= 0 } {
        set tab_count [interp invokehidden {} $w index end]
        set d         [expr { $dir/$factor }]
        set d         [expr { int($d > 0 ? ceil($d) : floor($d)) }]
        set select    [expr { ($current+$d) % $tab_count }]
        set step      [expr { $d > 0 ? 1 : -1 }]

        while { [interp invokehidden {} $w tab $select -state] ne "normal" && ($select != $current) } {
            set select [expr { ($select + $step) % $tab_count }]
        }

        if {$select != $current} {
            # Register the focussed widget for the current tab.
            set current_tab [interp invokehidden {} $w select]
            set ::ms::temp($w,$current_tab,focussed_widget) [_focus]

            # Activate the new tab.
            ::ms::notebook::Activate_Tab $w $select
        }
    }

    return ""
}

## Enable_Traversal
#
# Enable Tab and mnemonic keyboard traversal for a notebook widget by adding bindings to the containing toplevel window.
#
# '::ms::notebook(traversal,$toplevel)' keeps track of the list of all traversal-enabled notebooks
# contained in the toplevel.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::notebook::Enable_Traversal { w } {
    # Check if exists the notebook traversal variable for the toplevel of 'w'.
    switch -- [info exists ::ms::notebook(traversal,$::ms::addr($w,toplevel))] {
        0   {
            ############################################################
            ##                                                        ##
            ##     AUGMENT THE NOTEBOOK RELATED TOPLEVEL BINDINGS     ##
            ##                                                        ##
            ############################################################

            # Destroy
            _bind $::ms::addr($w,toplevel) <Destroy> [list +::ms::notebook::Traverse_Clean_Up %W]

            # Mnemonic key navigation.
            switch -- [_tk windowingsystem] {
                aqua    { _bind $::ms::addr($w,toplevel) <Option-KeyPress> [list +::ms::notebook::Mnemonic_Activation $::ms::addr($w,toplevel) %K] }
                default { _bind $::ms::addr($w,toplevel) <Alt-KeyPress>    [list +::ms::notebook::Mnemonic_Activation $::ms::addr($w,toplevel) %K] }
            }

            # Tab navigation.
            _bind $::ms::addr($w,toplevel) <Control-KeyPress-Tab> [list +::ms::notebook::Traverse_Cycle_Tab %W -1.0]

            switch -- [_tk windowingsystem] {
                win32   { _bind $::ms::addr($w,toplevel) <Control-Shift-KeyPress-Tab> [list +::ms::notebook::Traverse_Cycle_Tab %W 1.0] }
                default {
                    # Note: Some OS's define a goofy <Control-Shift-Tab> keysym.

                    # This is needed for XFree86 systems and macOS.
                    try {
                        _bind $::ms::addr($w,toplevel) <Control-KeyPress-ISO_Left_Tab> [list +::ms::notebook::Traverse_Cycle_Tab %W 1.0]
                    } on error {} {
                        # Do Nothing
                    }

                    # This seems to be correct on *some* HP systems.
                    try {
                        _bind $::ms::addr($w,toplevel) <Control-KeyPress-hpBackTab> [list +::ms::notebook::Traverse_Cycle_Tab %W 1.0]
                    } on error {} {
                        # Do Nothing
                    }
                }
            }
        }
    }

    # Add the notebook real address to the list of the traversal notebooks for its related toplevel.
    lappend ::ms::notebook(traversal,$::ms::addr($w,toplevel)) $w

    return ""
}

## Enclosing_Notebook
#
# Return the nearest traversal-enabled notebook widget that contains 'w'.
#
# Where:
#
# w   Should be the widget real address involved.
#
# BUGS: This routine should follow the geometry manager hierarchy, not window ancestry,
#       but that information is not available in Tk.
#
# Returns the nearest traversal enabled notebook address or an empty string is none is found.
proc ::ms::notebook::Enclosing_Notebook { w } {
    # Check if exists the notebook traversal variable for the toplevel of 'w'.
    switch -- [info exists ::ms::notebook(traversal,$::ms::addr($w,toplevel))] {
        0   { return "" }
    }

    while { $w ne $::ms::addr($w,toplevel) && $w ne "" } {
        switch -- [lsearch -exact $::ms::notebook(traversal,$::ms::addr($w,toplevel)) $w] {
            -1      {}
            default { return $w }
        }

        set w [_winfo parent $w]
    }

    return ""
}

## Mnemonic_Activation
#
# Alt-Key binding procedure for mnemonic activation.
# Scan all notebooks in specified toplevel for a tab with the specified mnemonic.
#
# Where:
#
# toplevel   Should be the toplevel related to the widget real address involved.
#
# key        Should be the mnemonic key to search for.
#
# If a tab with the specific mnemonic is found, activate it and return a TCL_BREAK,
# otherwise return an empty string.
proc ::ms::notebook::Mnemonic_Activation { toplevel key } {
    foreach w $::ms::notebook(traversal,$toplevel) {
        set tab [::ms::notebook::Mnemonic_Tab $w $key]
        switch -- $tab {
            ""      {}
            default {
                # Register the focussed widget for the current tab.
                set current_tab [interp invokehidden {} $w select]
                set ::ms::temp($w,$current_tab,focussed_widget) [_focus]

                # Activate the new tab.
                ::ms::notebook::Activate_Tab $w [interp invokehidden {} $w index $tab]

                return -code break
            }
        }
    }

    return ""
}

## Mnemonic_Tab
#
# Scan all tabs in the specified notebook for one with the specified mnemonic.
#
# Where:
#
# w     Should be the widget real address involved.
#
# key   Should be the mnemonic key to search for.
#
# If a mnemonic is found, returns the path name of tab, otherwise returns the empty string.
proc ::ms::notebook::Mnemonic_Tab { w key } {
    set key [string toupper $key]
    foreach tab [interp invokehidden {} $w tabs] {
        set label     [interp invokehidden {} $w tab $tab -text]
        set underline [interp invokehidden {} $w tab $tab -underline]

        if { $underline >= 0 } {
            set mnemonic [string toupper [string index $label $underline]]
            if { $mnemonic eq $key } {
                return $tab
            }
        }
    }

    return ""
}

## Traverse_Clean_Up
#
# <Destroy> binding for traversal-enabled toplevels.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::notebook::Traverse_Clean_Up { w } {
    unset -nocomplain -- ::ms::notebook(traversal,$w)

    return ""
}

## Traverse_Cycle_Tab
#
# Toplevel binding procedure for **Control-Tab** and **Control-Shift-Tab**.
# Select the next/previous tab in the nearest ancestor notebook.
#
# Where:
#
# w     Should be the widget real address involved.
#
# dir   Should be the amount of the movement.
#       Its sign determines the direction to take (**+1.0** or **-1.0).
#
# If a suitable notebook is found, cycle the tab and return a TCL_BREAK, otherwise return an empty string.
proc ::ms::notebook::Traverse_Cycle_Tab { w dir } {
    set notebook_addr [::ms::notebook::Enclosing_Notebook $w]
    switch -- $notebook_addr {
        ""      { return "" }
        default {
            ::ms::notebook::Cycle_Tab $notebook_addr $dir -1.0
            return -code break
        }
    }
}

#*EOF*