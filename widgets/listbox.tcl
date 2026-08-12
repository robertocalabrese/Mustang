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

## listbox
#
#### DESCRIPTION:
#
# The listbox command creates a new window (given by the *window* argument) and makes it into a listbox widget.
# A listbox is a widget that displays a list of strings, one per line. When first created, a new listbox has no elements.
# Elements may be added or deleted using widget commands described below. In addition, one or more elements may be selected as described below.
# If a listbox is exporting its selection (see -exportselection option), then it will observe the standard X11 protocols for handling the selection.
# Listbox selections are available as type **STRING**; the value of the selection will be the text of the selected elements, with newlines separating
# the elements.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname,
#         but the pathname's parents must exists.
#         *Window* may be provided either as a short or as a real address, the address returned will be:
#            - A short address, if the *window* provided as input is a short address.
#            - A real address, if the *window* provided as input is a real address.
#
# Note 2: The mustang listbox widget is a megawidget composed by an hull object (the megawidget container), a listbox object and
#         two scrollbar objects (displayed only when needed).
#
# Additional options, described below, may be specified on the command line to configure aspects of the listbox.
#
#### SYNOPSIS:
#
#   **listbox**  *window* ?*option value*? ... ?*option value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-activestyle**            It's a string that specifies the style in which to draw the active element.
#                             Allowed values:
#                                **dotbox**    --> Show a focus ring around the active element.
#                                **none**      --> No special indication.
#                                **underline** --> Underline the active element.
#
#                             The active element represent the cursor current location.
#                             The active style will be visible only upon selected items, otherwise the cursor location
#                             will be represented by the preselection color.
#                             See the **BINDING** section to know more about preselected items.
#
#                             If not provided, defaults to **underline**.
#
# **-background**             It's a list that specifies the color to use as background.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                            If there isn't one, the **-background** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-background** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-shellbackground** and **-foreground**.
#
# **-bordercolor**            It's a list that specifies the color to use as bordercolor.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: It's only meaningful for widgets with a **solid** relief.
#
#                             Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                            If there isn't one, the **-bordercolor** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-bordercolor** will always abide by its mapping values, if any.
#                                                            Styles, mappings and states events are allowed to change its value.
#
#                             See also **-borderwidth** and **-relief**.
#
# **-borderwidth**            Specifies the width of the three-dimensional border to draw around the outside of the widget,
#                             if such a border is being drawn.
#                             The **-relief** option typically determines this.
#
#                             The value may also be used when drawing three-dimensional effects in the widget's interior.
#                             The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                             (pixels, points, inches, millimeters or centimeters).
#
#                             Note: **0** is not accepted as a valid value, listboxes will always be bordered.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-borderwidth** specified in its style.
#                                                            If there isn't one, the **-borderwidth** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-borderwidth** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-bordercolor** and **-relief**.
#
# **-class**                  Specifies a class for the widget.
#                             It is mainly used to make bindings for widgets that have the same class.
#
#                             Note: This option may only be provided while creating the widget.
#                                   Attempts to change this value after the widget is created by using the **configure** command,
#                                   will be ignored by mustang.
#
#                             If not provided, defaults to **Listbox**.
#
# **-cmenu**                  Specifies the contextual menu address that will be assigned to the widget.
#
#                             The contextual menu will be assign to the *listbox* and *border* objects of the megawidget.
#                             If the *cmenu* value is the empty string or invalid, nothing will happen.
#
#                             The *hull* object will rather use the contextual menu of the widget's toplevel, if any.
#                             If the developer needs a different contextual menu for it, a variable called
#                             '::ms::data($short_addr,cmenu,shell)' can be set with a valid contextual menu address in
#                             order to be used instead of the toplevel one.
#
#                             Note: '$short_addr' must be the short address of the text widget.
#                                   See the [tk](/wiki/commands/tk.md) command to know more about short and real address.
#
#                             If '::ms::data($short_addr,cmenu,shell)' is set with an empty string or with an invalid contextual menu
#                             address, it will be ignored and the contextual menu of the widget's toplevel (if any) will be used.
#                             If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                             The *scrollbar* objects are not supposed to have a contextual menu and will not be link with any.
#
#                             Note: If '::ms::data($short_addr,cmenu,shell)' is set for a simple listbox widget, it will be silently ignored.
#
#                             If not provided, defaults to the empty string.
#
# **-columns**                Specifies the desired columns for the window in units of characters in the font given by the **-font** option.
#                             If the font does not have a uniform width then the width of the character **0** is used in translating from
#                             character units to screen units.
#                             If zero or less, then the desired height for the window is made just large enough to hold all the elements in the listbox.
#
#                             See also **-rows**.
#
# **-cursor**                 Specifies the mouse cursor to be used inside the widget.
#                             If an empty string is specified, it indicates that the widget should defer to it's parent for
#                             cursor specification.
#
#                             See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                            If there isn't one, the **-cursor** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-cursor** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
# **-disabledforeground**     It's a list that specifies the color to use as foreground color to use when drawing a disabled element.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: It's only meaningful for widgets with a relief that is not **flat** or **solid**.
#
#                             Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-disabledforeground** specified in its style.
#                                                            If there isn't one, the **-disabledforeground** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-disabledforeground** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-foreground**.
#
# **-exportselection**        Specifies whether or not a selection in the widget should also be the X selection.
#                             The value may have any of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html),
#                             such as **true**, **false**, **0**, **1**, **yes**, or **no**.
#                             If the selection is exported, then selecting in the widget deselects the current X selection, selecting outside the
#                             widget deselects any widget selection, and the widget will respond to selection retrieval requests when it has a selection.
#
#                             If not provided, defaults to **0**.
#
# **-font**                   Specifies the font to use for the elements displayed by the widget.
#                             The widget will accept as fontname any font created with the **font** command, including any Tk
#                             defaults fonts, the new mustang fonts (**BiggestFont**, **BiggerFont**, **NormalFont**, **SmallerFont**,
#                             **SmallestFont** and **MonospaceFont**) or fonts defined by the developer itself.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-font** specified in its style.
#                                                            If there isn't one, the **-font** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-font** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-foreground**.
#
# **-foreground**             It's a list that specifies the color to use as foreground.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-foreground** specified in its style.
#                                                            If there isn't one, the **-foreground** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-foreground** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-background** and **-font**.
#
# **-preselectbackground**    It's a list that specifies the color to use as preselected background.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-preselectbackground** specified in its style.
#                                                            If there isn't one, the **-preselectbackground** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-preselectbackground** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-selectbackground**.
#
# **-preselectforeground**    It's a list that specifies the color to use as preselected foreground.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-preselectforeground** specified in its style.
#                                                            If there isn't one, the **-preselectforeground** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-preselectforeground** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-selectforeground**.
#
# **-relief**                 Specifies the three-dimensional effect desired for the widget.
#                             The value indicates how the widget's interior should appear relative to its exterior.
#                             For example, *raised* means the widget's interior should appear to protrude from the screen,
#                             relative to the exterior of the widget.
#
#                             The widget will accept as relief any of the following values:
#                                **flat**,
#                                **groove**,
#                                **raised**,
#                                **ridge**,
#                                **solid**,
#                                **sunken**.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-relief** specified in its style.
#                                                            If there isn't one, the **-relief** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-relief** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-bordercolor** and **-borderwidth**.
#
# **-rows**                   Specifies the desired rows for the window, in units of characters in the font given by the **-font** option.
#                             If the font does not have a uniform height then the height of the character **0** is used in translating from
#                             character units to screen units.
#                             If zero or less, then the desired width for the window is made just large enough to hold all the elements in the listbox.
#
#                             See also **-columns**.
#
# **-selectbackground**       It's a list that specifies the background color to use when displaying selected items.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-selectbackground** specified in its style.
#                                                            If there isn't one, the **-selectbackground** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-selectbackground** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-selectforeground** and **-insertborderwidth**.
#
# **-selectborderwidth**      Specifies a non-negative value indicating the width of the 3-D border to draw around selected items.
#                             The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#
#                             Note: A value of **0** means no border.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-selectborderwidth** specified in its style.
#                                                            If there isn't one, the **-selectborderwidth** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-selectborderwidth** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-selectbackground** and **-selectforeground**.
#
# **-selectforeground**       It's a list that specifies the foreground color to use when displaying selected items.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-selectforeground** specified in its style.
#                                                            If there isn't one, the **-selectforeground** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-selectforeground** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-selectbackground** and **-selectborderwidth**.
#
# **-selectmode**             Specifies one of several styles for manipulating the selection.
#                             Allowed values are **single**, **browse**, **multiple** or **extended**.
#                             See the **BINDING** section to know more about the selectmode option.
#
#                             If not provided, defaults to **browse**.
#
# **-setgrid**                Specifies a boolean value that determines whether this widget controls the resizing grid for its top-level window.
#                             This option is typically used in text widgets, where the information in the widget has a natural size (the size of
#                             a character) and it makes sense for the window's dimensions to be integral numbers of these units.
#                             These natural window sizes form a grid.
#                             If the **-setgrid** option is set to true then the widget will communicate with the window manager so that when the user
#                             interactively resizes the top-level window that contains the widget, the dimensions of the window will be displayed to the
#                             user in grid units and the window size will be constrained to integral numbers of grid units.
#                             See the section **GRIDDED GEOMETRY MANAGEMENT** in the [wm](/wiki/commands/wm.md) manual entry for more details.
#
# **-shellbackground**        It's a list that specifies the color to use as background structure.
#                             This color will be used in the interspaces between the mustang objects that compose the listbox and should reflects
#                             the widget's parent background.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-shellbackground** specified in its style.
#                                                            If there isn't one, the **-shellbackground** of the **Listbox** style
#                                                            will be used instead.
#                                                            The **-shellbackground** will always abide by its mapping values, if any.
#                                                            Styles, mappings and states events are allowed to change its value.
#
#                                                            Note: The **-shellbackground** should change rarely, for example upon
#                                                                  an **Activate**/**Deactivate** event.
#
#                             See also **-background** and **-foreground**.
#
# **-state**                  Specifies the state for the widget.
#                             The listbox widget state acts differently than the other widgets states, because it's a classic widget
#                             and do not support natively any dynamic states.
#                             Changes to the widget 'physical' state affects it's dynamic state.
#                             Allowed states values are **normal** and **disabled**.
#
#                             If the listbox is disabled then items may not be inserted or deleted, items are drawn in the **-disabledforeground** color,
#                             and selection cannot be modified and is not shown (though selection information is retained).
#
#                             If not provided, defaults to **normal**.
#
# **-style**                  Specifies a custom widget style.
#                             If not provided, defaults to **Listbox**.
#
#                             Style should be already exists at the time the widget is created.
#
#                             See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**              Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                             and **Shift-Tab**).
#
#                             Before setting the focus to a widget, the traversal scripts consult the value of the
#                             *-takefocus* option.
#                                **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                                **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                          and all of its ancestors are mapped.
#
#                             Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                             Note: Widgets will ignore any takefocus values while in the **disabled** state.
#                                   The moment the widget becomes **normal** the takefocus specified will be taken into consideration.
#
#                             If not provided, defaults to **0**.
#
# **-values**                 It's a list that specifies the items to display inside the widget.
#                             If *values* changes, the widget will automatically update itself to reflect the new data.
#
#                             If not provided, defaults to the empty string (meaning no items will be displayed inside the widget).
#
#### WIDGET COMMAND:
#
# The listbox command creates a new command whose name is the same as the pathname of the listbox's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the listbox widget's pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for listbox widgets:
#
#   *window* **activate** *index*
#     Sets the active element to the one indicated by *index*.
#     If *index* is outside the range of elements in the listbox then the closest element is activated.
#     The active element is drawn as specified by **-activestyle** when the widget has the input focus, and its index may be retrieved
#     with the index **active**.
#
#   *window* **bbox** *index*
#     Returns a list of four numbers describing the bounding box of the text in the element given by *index*.
#     The first two elements of the list give the x and y coordinates of the upper-left corner of the screen area covered by the text
#     (specified in pixels relative to the widget) and the last two elements give the width and height of the area, in pixels.
#     If no part of the element given by *index* is visible on the screen, or if *index* refers to a non-existent element,
#     then the result is an empty string; if the element is partially visible, the result gives the full area of the element,
#     including any parts that are not visible.
#
#   *window* **cget** *option*
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the listbox command (See **WIDGET OPTIONS**).
#
#   *window* **configure** ?*option*? ?*value*? ?*option* *value*? ... ?*option* *value*?
#     Query or modify the configuration options of the widget.
#
#     If no 'option' is specified, returns a list describing all of the available options with their current theme values and current values.
#
#     If an 'option' is specified with no value, then the command returns a list describing the one named option.
#     This list will be identical to the corresponding sublist of the value returned if no option is specified.
#
#     If one or more 'option value' pairs are specified, then the command modifies the given widget option(s)
#     to have the given value(s) and the command returns an empty string.
#
#     Some options are not configurable, some can only be setted at creation time.
#     See 'WIDGET OPTIONS' to know which one is configurable and which one is not.
#
#   *window* **curselection**
#     Returns a list containing the numerical indices of all of the elements in the listbox that are currently selected.
#     If there are no elements selected in the listbox then an empty string is returned.
#
#   *window* **delete** *first* ?*last*?
#     Deletes one or more elements of the listbox. *First* and *last* are indices specifying the first and last elements in the range to delete.
#     If *last* is not specified it defaults to *first*, i.e. a single element is deleted.
#
#   *window* **get** *first* ?*last*?
#     If *last* is omitted, returns the contents of the listbox element indicated by *first*, or an empty string if first refers to a non-existent element.
#     If *last* is specified, the command returns a list whose elements are all of the listbox elements between *first* and *last*, inclusive.
#     Both *first* and *last* may have any of the standard forms for indices.
#
#   *window* **identify** **element** *x* *y*
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if the mouse pointer does not lie within any element.
#     *X* and *y* are pixel coordinates relative to the widget.
#
#   *window* **index** *index*
#     Returns the integer index value that corresponds to *index*.
#     If *index* is end the return value is a count of the number of elements in the listbox (not the index of the last element).
#
#   *window* **insert** *index* ?*element* *element* ... *element*?
#     Inserts zero or more new elements in the list just before the element given by *index*.
#     If *index* is specified as end then the new elements are added to the end of the list.
#     Returns an empty string.
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
#   *window* **see** *index*
#     Adjust the view in the listbox so that the element given by index is visible.
#     If the element is already visible then the command has no effect; if the element is near one edge of the window then the
#     listbox scrolls to bring the element into view at the edge; otherwise the listbox scrolls to center the element.
#
#     Returns an empty string.
#
#   *window* **itemcget** *index* *option*
#     Returns the current value of the item configuration option given by *option*.
#     *Option* may have any of the values accepted by the itemconfigure command.
#
#   *window* **itemconfigure** *index* ?*option*? ?*value*? ?*option value* ... *option value*?
#     Query or modify the configuration options of an item in the listbox.
#     If no option is specified, returns a list describing all of the available options for the item (see Tk_ConfigureInfo
#     for information on the format of this list).
#     If *option* is specified with no value, then the command returns a list describing the one named option (this list will be identical
#     to the corresponding sublist of the value returned if no option is specified).
#     If one or more option-value pairs are specified, then the command modifies the given widget option(s) to have the given value(s);
#     in this case the command returns an empty string.
#     The following options are currently supported for items:
#
#        **-background** *color*
#            Color specifies the background color to use when displaying the item.
#            It may have any of the forms accepted by mustang.
#
#        **-foreground** *color*
#            Color specifies the foreground color to use when displaying the item.
#            It may have any of the forms accepted by mustang.
#
#        **-selectbackground** *color*
#            color specifies the background color to use when displaying the item while it is selected.
#            It may have any of the forms accepted by mustang.
#
#        **-selectforeground** *color*
#            color specifies the foreground color to use when displaying the item while it is selected.
#            It may have any of the forms accepted by mustang.
#
#   *window* **nearest** *y*
#     Given a y-coordinate within the listbox window, this command returns the index of the (visible) listbox element nearest to that y-coordinate.
#
#   *window* **scan** *option* *args*
#     This command is used to implement scanning on listboxes.
#     It has two forms, depending on option:
#
#        *window* **scan** **mark** *x* *y*
#            Records x and y and the current view in the listbox window; used in conjunction with later scan dragto commands.
#            Typically this command is associated with a mouse button press in the widget.
#            It returns an empty string.
#
#        *window* **scan** **dragto** *x* *y*.
#            This command computes the difference between its x and y arguments and the x and y arguments to the last scan mark command for the widget.
#            It then adjusts the view by 10 times the difference in coordinates.
#            This command is typically associated with mouse motion events in the widget, to produce the effect of dragging the list at high speed through the window.
#            The return value is an empty string.
#
#   *window* **selection** *option* *arg*
#     This command is used to adjust the selection within a listbox.
#     It has several forms, depending on option:
#
#        *window* **selection** **anchor** *index*
#            Sets the selection anchor to the element given by *index*.
#            If *index* refers to a non-existent element, then the closest element is used.
#            The selection anchor is the end of the selection that is fixed while dragging out a selection with the mouse.
#            The index **anchor** may be used to refer to the anchor element.
#
#        *window* **selection** **clear** *first* ?*last*?
#            If any of the elements between *first* and *last* (inclusive) are selected, they are deselected.
#            The selection state is not changed for elements outside this range.
#
#        *window* **selection** **includes** *index*
#            Returns **1** if the element indicated by *index* is currently selected, **0** if it is not.
#
#        *window* **selection** **set** *first* ?*last*?
#            Selects all of the elements in the range between *first* and *last*, inclusive, without affecting the selection state
#            of elements outside that range.
#
#   *window* **size**
#     Returns a decimal string indicating the total number of elements in the listbox.
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
#   *window* **xview** ?args?
#     *window* **xview**
#        Returns a list containing two elements.
#        Each element is a real fraction between **0** and **1.0**; together they describe the horizontal span
#        that is visible in the window.
#
#     *window* **xview** *index*
#        Adjusts the view in the window so that the character position given by *index* is displayed at the left edge of the window.
#        Character positions are defined by the width of the character **0**.
#
#     *window* **xview** **moveto** *fraction*
#        Adjusts the view in the window so that *fraction* of the total width of the widget is off-screen to the left.
#        *Fraction* must be a fraction between **0** and **1.0**.
#
#     *window* **xview** **scroll** *number* *what*
#        This command shifts the view in the window left or right according to *number* and *what*.
#
#        *Number* must be an integer or a float, but not **0**.
#        If *number* is negative then information farther to the left becomes visible, if it is positive then information
#        farther to the right becomes visible.
#        If **0** is provided, the command will be ignored by mustang.
#
#        *what* must be either **pages** or **units**.
#        If *what* is **pages** then the view adjusts in units of nine-tenths of the *window*'s width.
#        If *what* is **units** then if *xscrollincrement* is greater than **0**, the horizontal view adjusts in units
#        of *xscrollincrement*; if *xscrollincrement* is lesser than or equal to **0**, the horizontal view adjusts in
#        units of one-tenths of the *window*'s width.
#
#   *window* **yview** ?args?
#     *window* **yview**
#        Returns a list containing two elements.
#        Each element is a real fraction between **0** and **1.0**; together they describe the vertical span that
#        is visible in the window.
#
#     *window* **yview** *index*
#        Adjusts the view in the window so that the element given by *index* is displayed at the top of the window.
#
#     *window* **yview** **moveto** *fraction*
#        Adjusts the view in the window so that *fraction* of the total height of the widget is off-screen to the top.
#        *Fraction* must be a fraction between **0** and **1.0**.
#
#     *window* **yview** **scroll** *number* *what*
#        This command shifts the view in the window up or down according to *number* and *what*.
#
#        *Number* must be an integer or a float, but not **0**.
#        If *number* is negative higher information becomes visible, if it is positive then lower information becomes visible.
#        If **0** is provided, the command will be ignored by mustang.
#
#        *what* must be either **pages** or **units**.
#        If *what* is **pages** then the view adjusts in units of nine-tenths of the *window*'s height.
#        If *what* is **units** then if *yscrollincrement* is greater than **0**, the vertical view adjusts in units
#        of *yscrollincrement*; if *yscrollincrement* is lesser than or equal to **0**, the vertical view adjusts in
#        units of one-tenths of the *window*'s height.
#
#### INDICES:
#
# Many of the widget commands for listboxes take one or more indices as arguments.
# An index specifies a particular element of the listbox, in any of the following ways:
#
#   number
#     Specifies the element as a numerical index, where **0** corresponds to the first element in the listbox.
#
#   active
#     Indicates the element that has the location cursor.
#     This element will be displayed as specified by **-activestyle** when the listbox has the keyboard focus,
#     and it is specified with the activate widget command.
#
#   anchor
#     Indicates the anchor point for the selection, which is set with the selection anchor widget command.
#
#   end
#     Indicates the end of the listbox. For most commands this refers to the last element in the listbox,
#     but for a few commands such as index and insert it refers to the element just after the last one.
#
#   @x,y
#     Indicates the element that covers the point in the listbox window specified by x and y (in pixel coordinates).
#     If no element covers that point, then the closest element to that point is used.
#
# Indexes support the same simple interpretation as for the command string index, with simple integer index arithmetic and indexing relative to end.
# In the widget command descriptions below, arguments named index, first, and last always contain text indices in one of the above forms.
#
#### STATES:
#
# The listbox widget supports only the **normal** and **disabled** states.
#
#### STYLING OPTIONS:
#
# Default style name: **Listbox**
#
# Every listbox styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the listboxs in order to facilitate the developer work and
# augment the user experience at the same time.
#
# Much of the behavior of a listbox is determined by its **-selectmode** option, which selects one of four ways
# of dealing with the selection.
#
# In every selection modes, clicking button 1 on a preselected element will select the element while clicking on
# a selected element will deselect it. The same action can be achived using the keyboard by hitting the spacebar,
# return or KP_Enter keys.
#
# If the selection mode is *single* or *browse*, at most one element can be selected in the listbox at once.
# In *browse* mode it is also possible to drag the selection with button 1.
# Clicking button 1 inside a listbox will also give it focus if it has a normal state.
#
# If the selection mode is *multiple* or *extended*, any number of elements may be selected at once, including
# discontiguous ranges. Dragging the mouse with button 1 down extends the selection to include all the elements between
# the anchor and the element under the mouse, inclusive.
#
# Most people will probably want to use *browse* mode for single selections and *extended* mode for multiple selections;
# the other modes appear to be useful only in special situations.
#
# Any time the set of selected item(s) in the listbox is updated by the user through the keyboard or mouse, the virtual
# event **ListboxSelect** will be generated. This virtual event will not be generated when adjusting the selection
# with the **window selection** command.
# It is easiest to bind to this event to be made aware of any user changes to listbox selection.
#
###### SCROLLING
#
# The following behavior will happen if the mouse pointer is over the widget (no matter if it has the focus or not).
#
# Note: A *unit* is 1/10 of a scrollable widget visible zone relative axis or, if a scrollincrement is provided, a multiple of it.
#       See '-xscrollincrement' and '-yscrollincrement' of the relative scrollable widget for more info.
#
#       A *page* is 9/10 of a scrollable widget visible zone relative axis.
#
# Note: Belows, when we talk about the widget's parents, we talk about it recursively.
#       Mustang will iterate all widget's parents in search of one that is scrollable and has the proper scrollbar active
#       for the relative key combination examined. If mustang finds a suitable parent, it will scroll that widget scrollbar,
#       otherwise nothing will happen.
#
# Note: In Linux, **TouchpadScroll** events abide by the same rules of the **MouseWheel** for the X axis and the **Shift-MouseWheel**
#       for the Y axis, while **Control-TouchpadScroll** events abide by the same rules of the **Control-MouseWheel** for the X axis
#       and the **Control-Shift-MouseWheel** for the Y axis.
#
# 1.  If the widget have an active vertical scrollbar, **MouseWheel** events will scroll one unit towards the top or the bottom of
#     the widget (depending on the direction of the mousewheel event).
#
#     If the widget doesn't have an active vertical scrollbar, **MouseWheel** events will try to find the innermost widget scrollable
#     parent with an active vertical scrollbar and move that scrollbar by one unit up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 2.  If the widget have an active horizontal scrollbar, **Shift-MouseWheel** events will scroll one unit towards the left or the right
#     of the widget (depending on the direction of the mousewheel event).
#
#     If the widget doesn't have an active horizontal scrollbar, **Shift-MouseWheel** events will try to find the innermost widget
#     scrollable parent with an active horizontal scrollbar and move that scrollbar by one unit left or right (depending on the
#     mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 3.  If the widget have an active vertical scrollbar, **Control-MouseWheel** events will scroll one page towards the top or the
#     bottom of the widget (depending on the direction of the mousewheel event).
#
#     If the widget doesn't have an active vertical scrollbar, **Control-MouseWheel** events will try to find the innermost widget
#     scrollable parent with an active vertical scrollbar and move that scrollbar by one page up or down (depending on the mousewheel
#     direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 4.  If the widget have an active horizontal scrollbar, **Control-Shift-MouseWheel** events will scroll one page towards the left or
#     the right of the widget (depending on the direction of the mousewheel event).
#
#     If the widget doesn't have an active horizontal scrollbar, **Control-Shift-MouseWheel** events will try to find the innermost widget
#     scrollable parent with an active horizontal scrollbar and move that scrollbar by one page left or right (depending on the mousewheel
#     direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#        1 - If the widget have an active horizontal scrollbar, **TouchpadScroll** events along the X axis will try will scroll the widget
#            scrollbar one unit towards the left or the right (depending on the direction of the touchpad event).
#
#            If the widget does not have an active horizontal scrollbar, **TouchpadScroll** events along the X axis will try to find the
#            innermost widget scrollable parent with an active horizontal scrollbar and move that scrollbar by one unit towards the left
#            or the right (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - If the widget have an active vertical scrollbar, **TouchpadScroll** events along the Y axis will try will scroll the widget
#            scrollbar one unit towards the top or the bottom (depending on the direction of the touchpad event).
#
#            If the widget does not have an active vertical scrollbar, **TouchpadScroll** events along the Y axis will try to find the
#            innermost widget scrollable parent with an active vertical scrollbar and move that scrollbar by one unit towards the top
#            or the bottom (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 6.  **Control-TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#        1 - If the widget have an active horizontal scrollbar, **Control-TouchpadScroll** events along the X axis will try will scroll the
#            widget scrollbar one page towards the left or the right (depending on the direction of the touchpad event).
#
#            If the widget does not have an active horizontal scrollbar, **Control-TouchpadScroll** events along the X axis will try to find
#            the innermost widget scrollable parent with an active horizontal scrollbar and move that scrollbar by one page towards the left
#            or the right (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - If the widget have an active vertical scrollbar, **Control-TouchpadScroll** events along the Y axis will try will scroll the
#            widget scrollbar one page towards the top or the bottom (depending on the direction of the touchpad event).
#
#            If the widget does not have an active vertical scrollbar, **Control-TouchpadScroll** events along the Y axis will try to find
#            the innermost widget scrollable parent with an active vertical scrollbar and move that scrollbar by one page towards the top
#            or the bottom (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 7.  **ContextMenu** events will display the contextual menu associated with the widget.
#     See the **-cmenu** option for more details.
#
###### INTERNAL MECHANISM:
#
# The following behavior will happen either if the widget does or does not have the focus.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  If the current theme follows the **clam** engine (like the 'Halo' theme) and the widget styleable options (**-borderwidth** and
#     **-bordercolor**) allows it, everytime the mouse cursor enters the widget it will illuminate its borders to visually indicate that
#     the user is inside the widget.
#
# 2.  In *extended* mode, the selected range can be adjusted by pressing the left mouse button with the Shift key down:
#     this modifies the selection to consist of the elements between the anchor and the element under the mouse, inclusive.
#     The un-anchored end of this new selection can also be dragged with the button down.
#     The same action can be achived with the keyboard by pressing **Shift-Up** and **Shift-Down**.
#
# 3.  In *extended* and *multiple* mode, **Control-a** and **Control-/** (**Command-a** in macOS) selects every element of the listbox.
#
# 4.  If the mouse is over a listbox row that is not selected, the related row element will be illuminated. In mustang, this action is
#     called preselection. A preselection is only a graphical effect to aid the user and have nothing to do with the actual
#     *selection* of a listbox element.
#
#     The **-activestyle** option will determine the visual aid for selected rows.
#
# 5.  If the mouse leaves the listbox window with the left mouse button pressed, the window scrolls away from the mouse, making information
#     visible that used to be off-screen on the side of the mouse.
#     The scrolling continues until the mouse re-enters the window, the button is released, or the end of the listbox is reached.
#
# 6.  The middle mouse button may be used for scanning. If it is pressed and dragged over the listbox, the contents
#     of the listbox drag at high speed in the direction the mouse moves.
#
# The following behavior will happen if the listbox widget has the focus.
#
# 7.  The **Up** or **Down** arrow key, will cause the preselection to move up or down by one element for each keypress.
#
# 8.  The **Left** and **Right** keys move the listbox view left and right by the width of the character 0 for each keypress.
#
# 9.  The **Prior** and **Next** keys scrolls the listbox view up and down by one page (the height of the window) for each keypress.
#
# 10. The **Control-Prior** and **Control-Next** keys scrolls the listbox view left and right by one page (the width of the window)
#     for each keypress.
#
# 11. The **Home** key scrolls the listbox view to the far left of the entire horizontal viewport.
#
# 12. The **End** key scrolls the listbox view to the far right of the entire horizontal viewport.
#
# 13. The **Control-Home** keys will position the preselected item to the very first item.
#
# 14. The **Control-End** keys will position the preselected item to to the very last item.
#
# 15. The **Shift-Home** keys selects all the rows from the active item to the very first element, and deselects everything else in
#     the listbox.
#     Note that the cursor location will not change with this movement.
#
# 16. The **Shift-End** keys selects all the rows from the active item to the very last element, and deselects everything else in
#     the listbox.
#     Note that the cursor location will not change with this movement.
#
# 17. The **Escape** key removes every selection.
#
# 18. The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the previous
#     focussable widget.
#
# There are other bindings in place for internal mechanism on the widget like **Activate/Deactivate**, **Configure**, **Destroy**,
# **Enter/Leave**, **FocusIn/FocusOut** and **Motion**, as well as **ButtonPress-1**, **B1-Motion** and **ButtonRelease-1** on
# its scrollbar objects.
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
#   # Create a listbox 10x10.
#   listbox .l   -activestyle underline \
#                -borderwidth 2 \
#                    -columns 20 \
#                     -cursor arrow \
#                     -relief solid \
#                       -rows 10 \
#                 -selectmode extended \
#                      -state normal \
#                      -style Listbox \
#                  -takefocus true \
#                     -values [list item1 \
#                                   item2 \
#                                   item3 \
#                                   item4 \
#                                   item5 \
#                                   item6 \
#                                   item7 \
#                                   item8 \
#                                   item9 \
#                                   item10 \
#                                   item11 \
#                                   item12 \
#                                   item13 \
#                                   item14 \
#                                   item15 \
#                                   item16 \
#                                   item17 \
#                                   item18 \
#                                   item19 \
#                                   item20];
#
#   # Pack the listbox and expand it in both directions.
#   pack .l  -anchor nw \
#            -expand true \
#              -fill both \
#              -padx [list 15 15] \
#              -pady [list 15 15] \
#              -side top;
#
#   # Focus the listbox.
#   focus .l
#
#   # Select the first item of the listbox.
#   .l activate 0
#   .l selection set 0
#   .l selection anchor 0
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
package provide ::ms::listbox 0.1

###############################
##                           ##
##     _LISTBOX BINDINGS     ##
##                           ##
###############################

# Activate/Deactivate
_bind _Listbox <Activate>   { ::ms::listbox::Pathname_Cmd %W state !background; break }
_bind _Listbox <Deactivate> { ::ms::listbox::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Listbox <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Listbox <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Listbox <Destroy> { ::ms::listbox::Destroy %W; break }

# Enter/Leave
_bind _Listbox <Enter> { ::ms::listbox::Hover %W %X %Y; break }
_bind _Listbox <Leave> { ::ms::listbox::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Listbox <FocusIn>  { ::ms::listbox::FocusIn  %W; break }
_bind _Listbox <FocusOut> { ::ms::listbox::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Listbox <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Listbox <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Listbox <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Listbox <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Listbox <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Listbox <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **listbox** package.
namespace eval ::ms::listbox {
    # Set the 'non-styleable' listbox option list.
    set ::ms::listbox(non_styleable,options) [list activestyle \
                                                   class \
                                                   cmenu \
                                                   exportselection \
                                                   selectmode \
                                                   setgrid \
                                                   state \
                                                   style \
                                                   takefocus \
                                                   values];

    # Set the 'styleable' listbox option list.
    set ::ms::listbox(styleable,options) [list background \
                                               bordercolor \
                                               borderwidth \
                                               columns \
                                               cursor \
                                               disabledforeground \
                                               font \
                                               foreground \
                                               justify \
                                               preselectbackground \
                                               preselectforeground \
                                               relief \
                                               rows \
                                               selectbackground \
                                               selectborderwidth \
                                               selectforeground \
                                               shellbackground];

    # Set the default 'non-styleable' listbox options values.
    set ::ms::default(listbox,activestyle)     underline
    set ::ms::default(listbox,class)           Listbox
    set ::ms::default(listbox,cmenu)           {}
    set ::ms::default(listbox,exportselection) 0
    set ::ms::default(listbox,selectmode)      browse
    set ::ms::default(listbox,setgrid)         0
    set ::ms::default(listbox,state)           normal
    set ::ms::default(listbox,style)           Listbox
    set ::ms::default(listbox,takefocus)       1
    set ::ms::default(listbox,values)          {}

    # Note: The default 'styleable' listbox options values are always defined inside the current theme.
}

# Rename the original Tk **listbox** command.
rename listbox _listbox

# Create an alias for the mustang **listbox** command.
interp alias {} listbox {} ::ms::listbox::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **listbox** widget command.
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
proc ::ms::listbox::Command { window { args "" } } {
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
            set ::ms::default($w,activestyle)     $::ms::default(listbox,activestyle)
            set ::ms::default($w,class)           $::ms::default(listbox,class)
            set ::ms::default($w,cmenu)           $::ms::default(listbox,cmenu)
            set ::ms::default($w,exportselection) $::ms::default(listbox,exportselection)
            set ::ms::default($w,selectmode)      $::ms::default(listbox,selectmode)
            set ::ms::default($w,setgrid)         $::ms::default(listbox,setgrid)
            set ::ms::default($w,state)           $::ms::default(listbox,state)
            set ::ms::default($w,style)           $::ms::default(listbox,style)
            set ::ms::default($w,takefocus)       $::ms::default(listbox,takefocus)
            set ::ms::default($w,values)          $::ms::default(listbox,values)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,activestyle)     $::ms::default(listbox,activestyle)
            set ::ms::current($w,class)           $::ms::default(listbox,class)
            set ::ms::current($w,cmenu)           $::ms::default(listbox,cmenu)
            set ::ms::current($w,exportselection) $::ms::default(listbox,exportselection)
            set ::ms::current($w,selectmode)      $::ms::default(listbox,selectmode)
            set ::ms::current($w,setgrid)         $::ms::default(listbox,setgrid)
            set ::ms::current($w,state)           $::ms::default(listbox,state)
            set ::ms::current($w,style)           $::ms::default(listbox,style)
            set ::ms::current($w,takefocus)       $::ms::default(listbox,takefocus)
            set ::ms::current($w,values)          $::ms::default(listbox,values)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)         listbox
            set ::ms::data($w,listvariable)      {}
            set ::ms::data($w,preselected_index) ""
            set ::ms::data($w,statespec)         $::ms::data(statespec,normal)
            set ::ms::data($w,scrollx)           off
            set ::ms::data($w,scrolly)           off

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
            #       To make a listbox styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **listbox** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)          Tk
            set ::ms::managed_by($w,bordercolor)         Tk
            set ::ms::managed_by($w,borderwidth)         Tk
            set ::ms::managed_by($w,columns)             Tk
            set ::ms::managed_by($w,cursor)              Tk
            set ::ms::managed_by($w,disabledforeground)  Tk
            set ::ms::managed_by($w,font)                Tk
            set ::ms::managed_by($w,foreground)          Tk
            set ::ms::managed_by($w,justify)             Tk
            set ::ms::managed_by($w,preselectbackground) Tk
            set ::ms::managed_by($w,preselectforeground) Tk
            set ::ms::managed_by($w,relief)              Tk
            set ::ms::managed_by($w,rows)                Tk
            set ::ms::managed_by($w,selectbackground)    Tk
            set ::ms::managed_by($w,selectborderwidth)   Tk
            set ::ms::managed_by($w,selectforeground)    Tk
            set ::ms::managed_by($w,shellbackground)     Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -activestyle {
                        set value [string tolower $value]
                        switch -- $value {
                            dotbox    -
                            none      -
                            underline { set ::ms::current($w,activestyle) $value }
                        }
                    }
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
                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                            set ::ms::current($w,cmenu) $value
                        }
                    }
                    -columns {
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,columns)    $value
                                set ::ms::managed_by($w,columns) developer
                            }
                        }
                    }
                    -cursor {
                        set value [string tolower $value]
                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                            set ::ms::current($w,cursor)    $value
                            set ::ms::managed_by($w,cursor) developer
                        }
                    }
                    -disabledforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,disabledforeground)    $value
                        set ::ms::managed_by($w,disabledforeground) developer
                    }
                    -exportselection {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,exportselection) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,exportselection) 1 }
                        }
                    }
                    -font {
                        if { $value in [font names] } {
                            set ::ms::current($w,font)    $value
                            set ::ms::managed_by($w,font) developer
                        }
                    }
                    -foreground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,foreground)    $value
                        set ::ms::managed_by($w,foreground) developer
                    }
                    -justify {
                        set value [string tolower $value]
                        switch -- $value {
                            center -
                            left   -
                            right  {
                                set ::ms::current($w,justify)    $value
                                set ::ms::managed_by($w,justify) developer
                            }
                        }
                    }
                    -preselectbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,preselectbackground)    $value
                        set ::ms::managed_by($w,preselectbackground) developer
                    }
                    -preselectforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,preselectforeground)    $value
                        set ::ms::managed_by($w,preselectforeground) developer
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
                    -rows {
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,rows)    $value
                                set ::ms::managed_by($w,rows) developer
                            }
                        }
                    }
                    -selectbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,selectbackground)    $value
                        set ::ms::managed_by($w,selectbackground) developer
                    }
                    -selectborderwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,selectborderwidth)    $value
                        set ::ms::managed_by($w,selectborderwidth) developer
                    }
                    -selectforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,selectforeground)    $value
                        set ::ms::managed_by($w,selectforeground) developer
                    }
                    -selectmode {
                        set value [string tolower $value]
                        switch -- $value {
                            browse   -
                            extended -
                            multiple -
                            single   { set ::ms::current($w,selectmode) $value }
                        }
                    }
                    -setgrid {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,setgrid) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,setgrid) 1 }
                        }
                    }
                    -shellbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,shellbackground)    $value
                        set ::ms::managed_by($w,shellbackground) developer
                    }
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            disabled {
                                set ::ms::current($w,state) disabled

                                # Set the widget dynamic state to 'disabled'
                                set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) 3 3 "disabled"]
                            }
                            normal { set ::ms::current($w,state) normal }
                        }
                    }
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
                    -values {
                        set value [string trim $value]

                        set ::ms::current($w,values)    $value
                        set ::ms::data($w,listvariable) $value
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::listbox(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Listbox,$option)

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

            # Note: 'background', 'borderwidth', 'columns', 'cursor', 'disabledforeground', 'font', 'foreground',
            #       'justify', 'preselectbackground', 'preselectforeground', 'relief', 'rows', 'selectbackground'
            #       and 'selectforeground' are not allowed to change if the statespec changes.

            ##################
            ##              ##
            ##     HULL     ##
            ##              ##
            ##################

            # Set the hull object style name.
            set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                 ".TFrame"];

            # If needed, create the hull object style name.
            if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,shellbackground)

                # Add the hull object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
            }

            # Initialize the hull object mapping.
            set mapping [list ]

            # shellbackground
            switch -- $::ms::managed_by($w,shellbackground) {
                developer { lappend mapping -background [list pressed $::ms::current($w,shellbackground)] }
                Tk  {
                    # Check if a 'shellbackground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground)] {
                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground) }
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

            # Create the hull object.
            _ttk_frame $w -borderwidth 0 \
                                -class TFrame \
                               -cursor arrow \
                               -height 0 \
                              -padding 0 \
                               -relief flat \
                                -style $::ms::style($w,hull) \
                            -takefocus 0 \
                                -width 0;

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            #####################
            ##                 ##
            ##     LISTBOX     ##
            ##                 ##
            #####################

            # Note: Tk listboxes don't understands styles, at least not natively.
            #       No internal styles needs to be created.

            # bordercolor
            switch -- $::ms::managed_by($w,bordercolor) {
                developer { set bordercolor $::ms::current($w,bordercolor) }
                Tk        { set bordercolor [_ttk_style lookup $stylename -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
            }

            # Set the listbox options.
            set listbox_options [list         -activestyle $::ms::current($w,activestyle) \
                                               -background $::ms::current($w,background) \
                                                   -cursor $cursor \
                                          -exportselection $::ms::current($w,exportselection) \
                                       -disabledforeground $::ms::current($w,disabledforeground) \
                                                     -font $::ms::current($w,font) \
                                               -foreground $::ms::current($w,foreground) \
                                                   -height $::ms::current($w,rows) \
                                                  -justify $::ms::current($w,justify) \
                                             -listvariable ::ms::data($w,listvariable) \
                                         -selectbackground $::ms::current($w,selectbackground) \
                                        -selectborderwidth $::ms::current($w,selectborderwidth) \
                                         -selectforeground $::ms::current($w,selectforeground) \
                                               -selectmode $::ms::current($w,selectmode) \
                                                  -setgrid $::ms::current($w,setgrid) \
                                                    -state $::ms::current($w,state) \
                                                -takefocus $takefocus \
                                                    -width $::ms::current($w,columns) \
                                           -xscrollcommand [list $w.x set] \
                                           -yscrollcommand [list $w.y set]];

            # Note: The '-bordercolor' option is not understanded by Tk listboxes, but is made available trough
            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
            #       like it behaves in other widgets that understands the bordercolor.

            # Check the 'relief' type.
            switch -- $::ms::current($w,relief) {
                flat  -
                solid {
                    lappend listbox_options         -borderwidth 0 \
                                            -highlightbackground $bordercolor \
                                                 -highlightcolor $bordercolor \
                                             -highlightthickness $::ms::current($w,borderwidth) \
                                                         -relief flat;
                }
                default {
                    lappend listbox_options         -borderwidth $::ms::current($w,borderwidth) \
                                            -highlightbackground $::ms::current($w,background) \
                                                 -highlightcolor $::ms::current($w,background) \
                                             -highlightthickness 0 \
                                                         -relief $::ms::current($w,relief);
                }
            }

            # Create the widget.
            _listbox $w.listbox {*}$listbox_options

            # Grid the listbox object.
            _grid $w.listbox -column 0 \
                               -padx 0 \
                               -pady 0 \
                                -row 0 \
                             -sticky nesw;

            # Check if the widget has values.
            switch -- $::ms::current($w,values) {
                ""      {}
                default {
                    # Select the first index of the listbox.
                    $w.listbox selection set 0

                    # Set the selection anchor to the first index.
                    $w.listbox selection anchor 0

                    # Activate the selected index.
                    $w.listbox activate 0
                }
            }

            #######################
            ##                   ##
            ##     SCROLLBAR     ##
            ##                   ##
            #######################

            # Create the horizontal scrollbar address.
            _ttk_scrollbar $w.x     -class TScrollbar \
                                  -command [list $w.listbox xview] \
                                   -cursor arrow \
                                   -orient horizontal \
                                    -style TScrollbar \
                                -takefocus 0;

            # Create the vertical scrollbar address.
            _ttk_scrollbar $w.y     -class TScrollbar \
                                  -command [list $w.listbox yview] \
                                   -cursor arrow \
                                   -orient vertical \
                                    -style TScrollbar \
                                -takefocus 0;

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Note: Differently than most other widgets, the listbox widget doesn't have a '-class' option in Tk.
            #       If a different class than 'Listbox' is provided, we need to adapt the bindtags.

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                Listbox { bindtags $w [list $w _Listbox Listbox $::ms::addr($w,toplevel) all] }
                default { bindtags $w [list $w $::ms::current($w,class) _Listbox Listbox $::ms::addr($w,toplevel) all] }
            }

            # ButtonPress-1
            _bind $w.listbox <B1-Motion>     { ::ms::listbox::B1_Motion    [_winfo parent %W] %x %y; break }
            _bind $w.listbox <ButtonPress-1> { ::ms::listbox::Begin_Select [_winfo parent %W] %x %y; break }

            _bind $w.x <B1-Motion>       { ::ms::listbox::Scrollbar_Drag        [_winfo parent %W] horizontal %x %y; break }
            _bind $w.x <ButtonPress-1>   { ::ms::listbox::Scrollbar_ButtonPress [_winfo parent %W] horizontal %x %y; break }
            _bind $w.x <ButtonRelease-1> { ::ms::listbox::Scrollbar_ButtonRelease; break }

            _bind $w.y <B1-Motion>       { ::ms::listbox::Scrollbar_Drag        [_winfo parent %W] vertical %x %y; break }
            _bind $w.y <ButtonPress-1>   { ::ms::listbox::Scrollbar_ButtonPress [_winfo parent %W] vertical %x %y; break }
            _bind $w.y <ButtonRelease-1> { ::ms::listbox::Scrollbar_ButtonRelease; break }

            # Contextual menu
            _bind $w.listbox <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

            # Configure
            _bind $w.listbox <Configure> { ::ms::listbox::Configure [_winfo parent %W]; break }

            # Enter/Leave
            _bind $w.listbox <Enter> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.x       <Enter> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.y       <Enter> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }

            _bind $w.listbox <Leave> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.x       <Leave> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.y       <Leave> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }

            # FocusIn/FocusOut
            _bind $w.listbox <FocusIn>  { ::ms::listbox::FocusIn  [_winfo parent %W]; break }
            _bind $w.listbox <FocusOut> { ::ms::listbox::FocusOut [_winfo parent %W]; break }

            # If the widget state is normal or the listbox has no values, move the active row item to the very
            # first item, otherwise don't do anything.
            _bind $w.listbox <<LineTop>>   { ::ms::listbox::Home [_winfo parent %W]; break }
            _bind $w.listbox <<LineStart>> { ::ms::listbox::Home [_winfo parent %W]; break }

            # If the widget state is normal or the listbox has no values, move the active row item to the very
            # last item, otherwise don't do anything.
            _bind $w.listbox <<LineBottom>> { ::ms::listbox::End [_winfo parent %W]; break }
            _bind $w.listbox <<LineEnd>>    { ::ms::listbox::End [_winfo parent %W]; break }

            # Motion
            _bind $w.listbox <Motion> { ::ms::listbox::Motion [_winfo parent %W] %x %y; break }

            # If the widget state is normal, move back or forward the active row item by one row (note that row cycling is active).
            # In any other cases, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one unit towards the top or bottom.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<NextLine>> { ::ms::listbox::ArrowDown [_winfo parent %W]; break }
            _bind $w.listbox <<PrevLine>> { ::ms::listbox::ArrowUp   [_winfo parent %W]; break }

            # If the widget state is normal and the widget has an active horizontal scrollbar, move one unit towards the
            # right or left.
            # In any other cases, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one unit towards the right or left.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<NextChar>> { ::ms::listbox::NextChar [_winfo parent %W]; break }
            _bind $w.listbox <<PrevChar>> { ::ms::listbox::PrevChar [_winfo parent %W]; break }

            # If the widget state is normal and the widget has an active horizontal scrollbar, move one page towards the
            # left, right, top or bottom.
            # In any other cases, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one page towards the left, right, top or bottom.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<PageLeft>>  { ::ms::listbox::PageLeft  [_winfo parent %W]; break }
            _bind $w.listbox <<PageRight>> { ::ms::listbox::PageRight [_winfo parent %W]; break }
            _bind $w.listbox <<PageUp>>    { ::ms::listbox::PageUp    [_winfo parent %W]; break }
            _bind $w.listbox <<PageDown>>  { ::ms::listbox::PageDown  [_winfo parent %W]; break }

            # Scan
            _bind $w.listbox <<ScanMark>>    { ::ms::Scan_Mark [_winfo parent %W] %x %y; break }
            _bind $w.listbox <<ScanDrag>>    { ::ms::Scan_Drag [_winfo parent %W] %x %y; break }
            _bind $w.listbox <<ScanRelease>> { ::ms::Scan_Release; break }

            # Select/Unselect all items.
            _bind $w.listbox <<SelectAll>>   { ::ms::listbox::Select_All   [_winfo parent %W]; break }
            _bind $w.listbox <<SelectNone>>  { ::ms::listbox::Unselect_All [_winfo parent %W]; break }

            # If the widget state is normal, start selecting from the active item row towards the top or bottom.
            _bind $w.listbox <<SelectNextLine>> { ::ms::listbox::Extend [_winfo parent %W]  1; break }
            _bind $w.listbox <<SelectPrevLine>> { ::ms::listbox::Extend [_winfo parent %W] -1; break }

            # If the widget state is normal, start selecting from the active item row to the very first or last item.
            _bind $w.listbox <<SelectLineBottom>> { ::ms::listbox::Extend_Home_End [_winfo parent %W] end; break }
            _bind $w.listbox <<SelectLineTop>>    { ::ms::listbox::Extend_Home_End [_winfo parent %W] home; break }

            # Select/Unselect one item.
            _bind $w.listbox <<ToggleSelection>> { ::ms::listbox::Select [_winfo parent %W]; break }

            # Disable the following bindings to prevent Tk to fire them up:
            _bind $w.listbox <<Copy>>                 { break }
            _bind $w.listbox <Control-KeyPress-space> { break }
            _bind $w.listbox <<NextWord>>             { break }
            _bind $w.listbox <<PrevWord>>             { break }

            # Mousewheel and Touchpad

            # If the widget's vertical scrollbar is active, move the listbox object by one unit up or down
            # (depending on the mousewheel direction).
            # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }
            _bind $w.y       <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

            # If the widget's horizontal scrollbar is active, move the listbox object by one unit left or right
            # (depending on the mousewheel direction).
            # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
            _bind $w.x       <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

            # If the widget's vertical scrollbar is active, move the listbox object by one page up or down
            # (depending on the mousewheel direction).
            # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one page up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }
            _bind $w.y       <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

            # If the widget's horizontal scrollbar is active, move the listbox object by one page left or right
            # (depending on the mousewheel direction).
            # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one page left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
            _bind $w.x       <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

            # Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
            #       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

            # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
            # These two planes may involve different widgets depending on the active scrollbars on them and on the
            # touchpad direction.
            #   1 - If the widget's horizontal scrollbar is active, move the listbox object by one unit left or right
            #       (depending on the touchpad direction).
            #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            #       and move that scrollbar by one unit left or right (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
            #
            #   2 - If the widget's vertical scrollbar is active, move the listbox object by one unit up or down
            #       (depending on the touchpad direction).
            #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            #       and move that scrollbar by one unit up or down (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
            _bind $w.listbox <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }
            _bind $w.x       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }
            _bind $w.y       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }

            # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
            # These two planes may involve different widgets depending on the active scrollbars on them and on the
            # touchpad direction.
            #   1 - If the widget's horizontal scrollbar is active, move the listbox object by one page left or right
            #       (depending on the touchpad direction).
            #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            #       and move that scrollbar by one page left or right (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
            #
            #   2 - If the widget's vertical scrollbar is active, move the listbox object by one page up or down
            #       (depending on the touchpad direction).
            #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            #       and move that scrollbar by one page up or down (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
            _bind $w.listbox <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }
            _bind $w.x       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }
            _bind $w.y       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Configure the internal widget rows and columns.
            _grid rowconfigure    $w [list 0] -weight 1
            _grid columnconfigure $w [list 0] -weight 1

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::listbox::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::listbox::Pathname_Cmd $w]
            }

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short addresses relative to its real address, 'w'.
            # They will all point to the widget hull object short address.
            set ::ms::addr($w,short)         $short_addr
            set ::ms::addr($w.listbox,short) $short_addr
            set ::ms::addr($w.x,short)       $short_addr
            set ::ms::addr($w.y,short)       $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals) $w \
                                      $w.listbox \
                                      $w.x \
                                      $w.y;

            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the listbox widgets real address list.
            lappend ::ms::addr(listbox) $w

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w.listbox

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w.listbox

            # Set the structure addresses.
            # Is important to note that the scrollbar addresses must not be included.
            set ::ms::addr($w,structure) [list $w \
                                               $w.listbox];

            # Add the widget address to the listbox classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),listbox,addrs) $w

            # Add the widget address to the listbox classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),listbox,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the listbox classtype.
            if { $::ms::current($w,style) ni $::ms::style(listbox,classtype) } {
                lappend ::ms::style(listbox,classtype) $::ms::current($w,style)
            }

            # Add the widget address to the megawidget addresses list.
            lappend ::ms::addr(megawidgets) $w

            # Add the widget address to the scrollable megawidget addresses list.
            lappend ::ms::addr(megawidgets,scrollable) $w

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
proc ::ms::listbox::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        activate {
            # Synopsis:
            #
            # *window* **activate** *index*

            # Check if there are items associated to the listbox.
            switch -- $::ms::current($w,values) {
                ""   { return "" }
            }

            try {
                $w.listbox activate $args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                # Register the new preselected index.
                set ::ms::data($w,preselected_index) $args

                return $result
            }
        }
        bbox         -
        curselection -
        delete       -
        get          -
        index        -
        insert       -
        itemcget     -
        nearest      -
        scan         -
        see          -
        size         {
            # Synopsis:
            #
            # *window* **bbox** *index*
            # *window* **curselection**
            # *window* **delete** *first* ?*last*?
            # *window* **get** *first* ?*last*?
            # *window* **index** *index*
            # *window* **insert** *index* ?*element* ... *element*?
            # *window* **itemcget** *index* *option*
            # *window* **nearest** *y*
            # *window* **scan** *option* *args*
            #    *window* **scan** **mark** *x* *y*
            #    *window* **scan** **dragto** *x* *y*
            # *window* **see** *index*
            # *window* **size**
            try {
                $w.listbox $cmd {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
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
                    if { ($option in $::ms::listbox(non_styleable,options)) || ($option in $::ms::listbox(styleable,options))} {
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
                    foreach option $::ms::listbox(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::listbox(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::listbox(non_styleable,options)) || ($option in $::ms::listbox(styleable,options)) } {
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

                            # Set a variable indicating if a new set of values have been provided.
                            set new_values false

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the remaining widget's options, if any.
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -activestyle {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            dotbox    -
                                            none      -
                                            underline { set ::ms::current($w,activestyle) $value }
                                        }
                                    }
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
                                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                                            set ::ms::current($w,cmenu) $value
                                        }
                                    }
                                    -columns {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                set ::ms::current($w,columns)    $value
                                                set ::ms::managed_by($w,columns) developer
                                            }
                                        }
                                    }
                                    -cursor {
                                        set value [string tolower $value]
                                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                                            set ::ms::current($w,cursor)    $value
                                            set ::ms::managed_by($w,cursor) developer
                                        }
                                    }
                                    -disabledforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,disabledforeground)    $value
                                        set ::ms::managed_by($w,disabledforeground) developer
                                    }
                                    -exportselection {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,exportselection) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,exportselection) 1 }
                                        }
                                    }
                                    -font {
                                        if { $value in [font names] } {
                                            set ::ms::current($w,font)    $value
                                            set ::ms::managed_by($w,font) developer
                                        }
                                    }
                                    -foreground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,foreground)    $value
                                        set ::ms::managed_by($w,foreground) developer
                                    }
                                    -justify {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            center  -
                                            left    -
                                            right   {
                                                set ::ms::current($w,justify)    $value
                                                set ::ms::managed_by($w,justify) developer
                                            }
                                        }
                                    }
                                    -preselectbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,preselectbackground)    $value
                                        set ::ms::managed_by($w,preselectbackground) developer
                                    }
                                    -preselectforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,preselectforeground)    $value
                                        set ::ms::managed_by($w,preselectforeground) developer
                                    }
                                    -relief {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            flat    -
                                            groove  -
                                            raised  -
                                            ridge   -
                                            solid   -
                                            sunken  {
                                                set ::ms::current($w,relief)    $value
                                                set ::ms::managed_by($w,relief) developer
                                            }
                                        }
                                    }
                                    -rows {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                set ::ms::current($w,rows)    $value
                                                set ::ms::managed_by($w,rows) developer
                                            }
                                        }
                                    }
                                    -selectbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,selectbackground)    $value
                                        set ::ms::managed_by($w,selectbackground) developer
                                    }
                                    -selectborderwidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,selectborderwidth)    $value
                                        set ::ms::managed_by($w,selectborderwidth) developer
                                    }
                                    -selectforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,selectforeground)    $value
                                        set ::ms::managed_by($w,selectforeground) developer
                                    }
                                    -selectmode {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            browse   -
                                            extended -
                                            multiple -
                                            single   { set ::ms::current($w,selectmode) $value }
                                        }
                                    }
                                    -setgrid {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,setgrid) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,setgrid) 1 }
                                        }
                                    }
                                    -shellbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,shellbackground)    $value
                                        set ::ms::managed_by($w,shellbackground) developer
                                    }
                                    -state {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            disabled {
                                                set ::ms::current($w,state) disabled

                                                # Set the widget dynamic state to 'disabled'
                                                set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) 3 3 "disabled"]
                                            }
                                            normal {
                                                set ::ms::current($w,state) normal

                                                # Set the widget dynamic state to '!disabled'
                                                set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) 3 3 "!disabled"]
                                            }
                                        }
                                    }
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Remove the widget address from the listbox real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),listbox,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),listbox,addrs) [lremove $::ms::style($::ms::current($w,style),listbox,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,listbox,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the listbox classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),listbox,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(listbox,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(listbox,classtype) [lremove $::ms::style(listbox,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the listbox classtype.
                                            if { $value ni $::ms::style(listbox,classtype) } {
                                                lappend ::ms::style(listbox,classtype) $value
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
                                    -values {
                                        set value [string trim $value]

                                        set ::ms::current($w,values)    $value
                                        set ::ms::data($w,listvariable) $value

                                        set new_values true
                                    }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::listbox(styleable,options) {
                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            # Check the widget state and set the cursor, statespec and takefocus accordingly.
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

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'background', 'borderwidth', 'columns', 'cursor', 'disabledforeground', 'font', 'foreground',
                            #       'justify', 'preselectbackground', 'preselectforeground', 'relief', 'rows', 'selectbackground'
                            #       and 'selectforeground' are not allowed to change if the statespec changes.

                            ##################
                            ##              ##
                            ##     HULL     ##
                            ##              ##
                            ##################

                            # Set the hull object style name.
                            set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                                 ".TFrame"];

                            # If needed, create the hull object style name.
                            if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,shellbackground)

                                # Add the hull object style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
                            }

                            # Initialize the hull object mapping.
                            set mapping [list ]

                            # shellbackground
                            switch -- $::ms::managed_by($w,shellbackground) {
                                developer { lappend mapping -background [list pressed $::ms::current($w,shellbackground)] }
                                Tk  {
                                    # Check if a 'shellbackground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground)] {
                                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground) }
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
                            interp invokehidden {} $w configure -style $::ms::style($w,hull)

                            #####################
                            ##                 ##
                            ##     LISTBOX     ##
                            ##                 ##
                            #####################

                            # Note: Tk listboxes don't understands styles, at least not natively.
                            #       No internal styles needs to be created.

                            # bordercolor
                            switch -- $::ms::managed_by($w,bordercolor) {
                                developer { set bordercolor $::ms::current($w,bordercolor) }
                                Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
                            }

                            # Set the listbox options.
                            set listbox_options [list        -activestyle $::ms::current($w,activestyle) \
                                                              -background $::ms::current($w,background) \
                                                                  -cursor $cursor \
                                                         -exportselection $::ms::current($w,exportselection) \
                                                      -disabledforeground $::ms::current($w,disabledforeground) \
                                                                    -font $::ms::current($w,font) \
                                                              -foreground $::ms::current($w,foreground) \
                                                                  -height $::ms::temp($w,rows) \
                                                                 -justify $::ms::current($w,justify) \
                                                        -selectbackground $::ms::current($w,selectbackground) \
                                                       -selectborderwidth $::ms::current($w,selectborderwidth) \
                                                        -selectforeground $::ms::current($w,selectforeground) \
                                                              -selectmode $::ms::current($w,selectmode) \
                                                                 -setgrid $::ms::current($w,setgrid) \
                                                                   -state $::ms::current($w,state) \
                                                               -takefocus $takefocus \
                                                                   -width $::ms::temp($w,columns)];

                            # Note: The '-bordercolor' option is not understanded by Tk listboxes, but is made available trough
                            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                            #       like it behaves in other widgets that understands the bordercolor.

                            # Check the 'relief' type.
                            switch -- $::ms::current($w,relief) {
                                flat  -
                                solid {
                                    lappend listbox_options         -borderwidth 0 \
                                                            -highlightbackground $bordercolor \
                                                                 -highlightcolor $bordercolor \
                                                             -highlightthickness $::ms::current($w,borderwidth) \
                                                                         -relief flat;
                                }
                                default {
                                    lappend listbox_options         -borderwidth $::ms::current($w,borderwidth) \
                                                            -highlightbackground $::ms::current($w,background) \
                                                                 -highlightcolor $::ms::current($w,background) \
                                                             -highlightthickness 0 \
                                                                         -relief $::ms::current($w,relief);
                                }
                            }

                            # Apply the changes.
                            $w.listbox configure {*}$listbox_options

                            # Check if there are any items associated to the listbox.
                            switch -- $::ms::current($w,values) {
                                ""  {
                                    # Clear the selection, if any.
                                    $w.listbox selection clear 0 end
                                }
                                default {
                                    # Recolor any index with the new default colors (background and foreground).
                                    set index 0
                                    while { $index < [$w.listbox size] } {
                                        $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                                        -foreground $::ms::current($w,foreground);

                                        incr index
                                    }

                                    # Check if a new set of values was provided.
                                    switch -- $new_values {
                                        false {
                                            # Recolor any previously selected indexes with the new selected colors (selectedbackground and selectedforeground).
                                            set selected_indexes [$w.listbox curselection]
                                            foreach index $selected_indexes {
                                                $w.listbox selection set $index
                                            }

                                            # Check if there is a preselected index.
                                            switch -- $::ms::data($w,preselected_index) {
                                                ""      {}
                                                default {
                                                    # If the preselected index is not also a selected index, recolor it with the new preselected colors
                                                    # (preselectedbackground and preselectedforeground).
                                                    if { $::ms::data($w,preselected_index) ni $selected_indexes } {
                                                        $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                                                                   -foreground $::ms::current($w,preselectforeground);

                                                        # Remove the active style.
                                                        $w.listbox configure -activestyle none
                                                    } else {
                                                        # Be sure that the active style is the one chosen by the developer.
                                                        $w.listbox configure -activestyle $::ms::current($w,activestyle)

                                                        # Activate the preselected index.
                                                        $w.listbox activate $::ms::data($w,preselected_index)
                                                    }
                                                }
                                            }
                                        }
                                        true {
                                            # Select the first index of the listbox.
                                            $w.listbox selection clear 0 end
                                            $w.listbox selection set 0

                                            # Set the selection anchor to the first index.
                                            $w.listbox selection anchor 0

                                            # Activate the selected index.
                                            $w.listbox activate 0

                                            # Adjust the listbox viewport.
                                            $w.listbox see 0
                                        }
                                    }
                                }
                            }

                            ########################
                            ##                    ##
                            ##     SCROLLBARS     ##
                            ##                    ##
                            ########################

                            # Update the scrollbars.
                            ::ms::listbox::Scrollbar_Update $w

                            ##################################################
                            ##                                              ##
                            ##     IF NEEDED, UPDATE THE WIDGET'S STATE     ##
                            ##                                              ##
                            ##################################################

                            # Note: There is no need to update the listbox object, it's a classic widget and
                            #       it was already been taking care of.

                            switch -- $::ms::current($w,state) {
                                disabled { interp invokehidden {} $w state [list disabled]  }
                                normal   { interp invokehidden {} $w state [list !disabled] }
                            }

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

                    # Return the name of the object, or an empty string if there are no listbox objects at the coordinates provided.
                    if { $widget eq $w } {
                        return "Listbox.hull"
                    } elseif { $widget eq "$w.listbox" } {
                        return "Listbox.listbox"
                    } elseif { $widget eq "$w.x" } {
                        return "Listbox.hscrollbar"
                    } elseif { $widget eq "$w.y" } {
                        return "Listbox.vscrollbar"
                    } else {
                        return ""
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
                        eval $script
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        itemconfigure {
            # Synopsis:
            #
            # *window* **itemconfigure** *index* ?*option*? ?*value*? ?*option value* ... *option value*?
            set index  [lindex  $args 0]
            set args   [lremove $args 0]

            switch -- [llength $args] {
                0   -
                1   {
                    try {
                        $w.listbox itemconfigure $index {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default {
                    # Check that the remaining 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            ######################################################
                            ##                                                  ##
                            ##     CHECK THE ITEMCONFIGURE OPTIONS PROVIDED     ##
                            ##                                                  ##
                            ######################################################

                            # Check the remaining widget's options, if any.
                            set new_args [list ]
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -background       -
                                    -foreground       -
                                    -selectbackground -
                                    -selectforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                            default { lappend new_args $option $value }
                                        }
                                    }
                                    default { ::ms::Error "Invalid itemconfigure option, '$option'." $caller_info }
                                }
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }

                    # Execute the command.
                    try {
                        $w.listbox itemconfigure $index {*}$new_args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return ""
                    }
                }
            }
        }
        selection {
            # Synopsis:
            #
            # *window* **selection** *option* *arg*
            #    *window* **selection** **anchor** *index*
            #    *window* **selection** **clear** *first* ?*last*?
            #    *window* **selection** **includes** *index*
            #    *window* **selection** **set** *first* ?*last*?

            # Check if there are items associated to the listbox.
            switch -- $::ms::current($w,values) {
                ""  { return "" }
            }

            try {
                $w.listbox selection {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                set subcommand [lindex  $args 0]
                set args       [lremove $args 0]

                switch -- $subcommand {
                    set {
                        # Set the new preselected index.
                        switch -- [llength $args] {
                            1   { set ::ms::data($w,preselected_index) [lindex $args 0] }
                            2   { set ::ms::data($w,preselected_index) [lindex $args 1] }
                        }
                    }
                    clear {
                        # Deselect the preselection of the indexes provided.
                        switch -- [llength $args] {
                            1   {
                                $w.listbox itemconfigure [lindex $args 0] -background $::ms::current($w,background) \
                                                                          -foreground $::ms::current($w,foreground);
                            }
                            2   {
                                set index [lindex $args 0]
                                while { $index < [expr { [lindex $args 1]+1 }] } {
                                    $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                                    -foreground $::ms::current($w,foreground);

                                    incr index
                                }
                            }
                        }
                    }
                }

                return $result
            }
        }
        state {
            # Synopsis:
            #
            # *window* **state** ?*statespec*?
            switch -- [llength $args] {
                0   { return [lsort -increasing -dictionary $::ms::data($w,statespec)] }
                1   {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { set statespec disabled }
                        normal {
                            # Check the 'statespec' provided.
                            set statespec $args
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

                    #####################################
                    ##                                 ##
                    ##     UPDATE THE WIDGET STATE     ##
                    ##                                 ##
                    #####################################

                    # Note: 'background', 'borderwidth', 'columns', 'cursor', 'disabledforeground', 'font', 'foreground',
                    #       'justify', 'preselectbackground', 'preselectforeground', 'relief', 'rows', 'selectbackground'
                    #       and 'selectforeground' are not allowed to change if the statespec changes.

                    # Check the widget state and propagate the new statespec to the widget's hull and border objects..
                    interp invokehidden {} $w state $::ms::data($w,statespec)

                    # Note: Tk listboxes don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # bordercolor
                    switch -- $::ms::managed_by($w,bordercolor) {
                        developer { set bordercolor $::ms::current($w,bordercolor) }
                        Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
                    }

                    # Note: The '-bordercolor' option is not understanded by Tk listboxes, but is made available trough
                    #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                    #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                    #       like it behaves in other widgets that understands the bordercolor.

                    # Check the 'relief' type.
                    switch -- $::ms::current($w,relief) {
                        flat  -
                        solid {
                            set listbox_options [list -highlightbackground $bordercolor \
                                                           -highlightcolor $bordercolor];
                        }
                        default {
                            set listbox_options [list -highlightbackground $::ms::current($w,background) \
                                                           -highlightcolor $::ms::current($w,background)];
                        }
                    }

                    # Configure the listbox object.
                    $w.listbox configure {*}$listbox_options

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
        xview {
            # Synopsis:
            #
            # *window* **xview**
            # *window* **xview** *index*
            # *window* **xview** **moveto** *fraction*
            # *window* **xview** **scroll** *number* *what*

            # Check if the widget has an active horizontal scrollbar.
            switch -- $::ms::data($w,scrollx) {
                on  {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    switch -nocase -- $subcommand {
                        ""     { return [$w.listbox xview] }
                        moveto {
                            # Check the number of arguments provided (after the 'moveto' word).
                            switch -- [llength $args] {
                                1       {}
                                default { return "" }
                            }

                            # Check the fraction provided.
                            set fraction $args
                            switch -- [string is double -strict $fraction] {
                                0   { return "" }
                            }

                            # Check that fraction is inside its limits [0,1.0].
                            if { $fraction < 0 } {
                                set fraction 0
                            } elseif { $fraction > 1.0 } {
                                set fraction 1.0
                            }

                            # Move the content object horizontally.
                            $w.listbox xview moveto $fraction

                            return ""
                        }
                        scroll {
                            # Check the number of arguments provided (after the 'scroll' word).
                            switch -- [llength $args] {
                                2       {}
                                default { return "" }
                            }

                            # Check the 'number'.
                            set number [lindex $args 0]
                            switch -- [string is double -strict $number] {
                                0   { return "" }
                            }

                            # Check the 'what'.
                            switch -nocase -- [lindex $args 1] {
                                pages {
                                    set what   "pages"
                                    set number [expr { int($number) }]
                                }
                                pixels { set what "pixels" }
                                units {
                                    set what   "units"
                                    set number [expr { int($number) }]
                                }
                                default { return "" }
                            }

                            # Move the content object horizontally.
                            $w.listbox xview scroll $number $what

                            return ""
                        }
                        default {
                            set index $subcommand

                            # Move the content object horizontally.
                            try {
                                $w.listbox xview $index
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return ""
                            }
                        }
                    }
                }
            }
        }
        yview {
            # Synopsis:
            #
            # *window* **yview**
            # *window* **yview** *index*
            # *window* **yview** **moveto** *fraction*
            # *window* **yview** **scroll** *number* *what*

            # Check if the widget has an active vertical scrollbar.
            switch -- $::ms::data($w,scrolly) {
                on  {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    switch -nocase -- $subcommand {
                        ""     { return [$w.listbox yview] }
                        moveto {
                            # Check the number of arguments provided (after the 'moveto' word).
                            switch -- [llength $args] {
                                1       {}
                                default { return "" }
                            }

                            # Check the fraction provided.
                            set fraction $args
                            switch -- [string is double -strict $fraction] {
                                0   { return "" }
                            }

                            # Check that fraction is inside its limits [0,1.0].
                            if { $fraction < 0 } {
                                set fraction 0
                            } elseif { $fraction > 1.0 } {
                                set fraction 1.0
                            }

                            # Move the content object vertically.
                            $w.listbox yview moveto $fraction

                            return ""
                        }
                        scroll {
                            # Check the number of arguments provided (after the 'scroll' word).
                            switch -- [llength $args] {
                                2       {}
                                default { return "" }
                            }

                            # Check the 'number'.
                            set number [lindex $args 0]
                            switch -- [string is double -strict $number] {
                                0   { return "" }
                            }

                            # Check the 'what'.
                            switch -nocase -- [lindex $args 1] {
                                pages {
                                    set what   "pages"
                                    set number [expr { int($number) }]
                                }
                                pixels { set what "pixels" }
                                units {
                                    set what   "units"
                                    set number [expr { int($number) }]
                                }
                                default { return "" }
                            }

                            # Move the content object vertically.
                            $w.listbox yview scroll $number $what

                            return ""
                        }
                        default {
                            set index $subcommand

                            # Move the content object vertically.
                            try {
                                $w.listbox yview $index
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return ""
                            }
                        }
                    }
                }
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
# Update any listbox widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::listbox::Style_Update { stylename caller_info } {
    # Update all the listbox widgets that have stylename as a style.
    foreach w $::ms::style($stylename,listbox,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::listbox(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Listbox,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        # Check the widget state and set the cursor accordingly.
        switch -- $::ms::current($w,state) {
            disabled { set cursor arrow }
            normal   { set cursor $::ms::current($w,cursor) }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'background', 'borderwidth', 'columns', 'cursor', 'disabledforeground', 'font', 'foreground',
        #       'justify', 'preselectbackground', 'preselectforeground', 'relief', 'rows', 'selectbackground'
        #       and 'selectforeground' are not allowed to change if the statespec changes.

        ##################
        ##              ##
        ##     HULL     ##
        ##              ##
        ##################

        # Set the hull object style name.
        set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                             ".TFrame"];

        # If needed, create the hull object style name.
        if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,shellbackground)

            # Add the hull object style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
        }

        # Initialize the hull object mapping.
        set mapping [list ]

        # shellbackground
        switch -- $::ms::managed_by($w,shellbackground) {
            developer { lappend mapping -background [list pressed $::ms::current($w,shellbackground)] }
            Tk  {
                # Check if a 'shellbackground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground)] {
                    1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground) }
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
        interp invokehidden {} $w configure -style $::ms::style($w,hull)

        #####################
        ##                 ##
        ##     LISTBOX     ##
        ##                 ##
        #####################

        # Note: Tk listboxes don't understands styles, at least not natively.
        #       No internal styles needs to be created.

        # bordercolor
        switch -- $::ms::managed_by($w,bordercolor) {
            developer { set bordercolor $::ms::current($w,bordercolor) }
            Tk        { set bordercolor [_ttk_style lookup $stylename -bordercolor $statespec $::ms::default($w,bordercolor)] }
        }

        # Set the listbox options.
        set listbox_options [list            -background $::ms::current($w,background) \
                                                 -cursor $cursor \
                                     -disabledforeground $::ms::current($w,disabledforeground) \
                                                   -font $::ms::current($w,font) \
                                             -foreground $::ms::current($w,foreground) \
                                                 -height $::ms::current($w,rows) \
                                                -justify $::ms::current($w,justify) \
                                       -selectbackground $::ms::current($w,selectbackground) \
                                      -selectborderwidth $::ms::current($w,selectborderwidth) \
                                       -selectforeground $::ms::current($w,selectforeground) \
                                                  -width $::ms::current($w,columns)];

        # Note: The '-bordercolor' option is not understanded by Tk listboxes, but is made available trough
        #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
        #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
        #       like it behaves in other widgets that understands the bordercolor.

        # Check the 'relief' type.
        switch -- $::ms::current($w,relief) {
            flat  -
            solid {
                lappend listbox_options         -borderwidth 0 \
                                        -highlightbackground $bordercolor \
                                             -highlightcolor $bordercolor \
                                         -highlightthickness $::ms::current($w,borderwidth) \
                                                     -relief flat;
            }
            default {
                lappend listbox_options         -borderwidth $::ms::current($w,borderwidth) \
                                        -highlightbackground $::ms::current($w,background) \
                                             -highlightcolor $::ms::current($w,background) \
                                         -highlightthickness 0 \
                                                     -relief $::ms::current($w,relief);
            }
        }

        # Apply the changes.
        $w.listbox configure {*}$listbox_options

        # Check if there are any items associated to the listbox.
        switch -- $::ms::current($w,values) {
            ""      {}
            default {
                # Recolor any index with the new default colors (background and foreground).
                set index 0
                while { $index < [$w.listbox size] } {
                    $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                    -foreground $::ms::current($w,foreground);

                    incr index
                }

                # Recolor any previously selected indexes with the new selected colors (selectedbackground and selectedforeground).
                set selected_indexes [$w.listbox curselection]
                foreach index $selected_indexes {
                    $w.listbox selection set $index
                }

                # Check if there is a preselected index.
                switch -- $::ms::data($w,preselected_index) {
                    ""      {}
                    default {
                        # If the preselected index is not also a selected row, recolor it with the new preselected colors
                        # (preselectedbackground and preselectedforeground).
                        if { $::ms::data($w,preselected_index) ni $selected_indexes } {
                            $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                                       -foreground $::ms::current($w,preselectforeground);

                            # Remove the active style.
                            $w.listbox configure -activestyle none
                        } else {
                            # Be sure that the active style is the one chosen by the developer.
                            $w.listbox configure -activestyle $::ms::current($w,activestyle)

                            # Activate the preselected index.
                            $w.listbox activate $::ms::data($w,preselected_index)
                        }
                    }
                }
            }
        }

        ########################
        ##                    ##
        ##     SCROLLBARS     ##
        ##                    ##
        ########################

        # Update the scrollbars.
        ::ms::listbox::Scrollbar_Update $w
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

## ArrowDown
#
# Moves the preselection down by one element.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::ArrowDown { w } {
    # Note: This procedure was inspired by the listbox procedure 'ListboxUpDown'.
    #       The procedure have been slighty modified to work with mustang.
    #       All credits goes to the original author/s.

    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    switch -- $::ms::current($w,state) {
        normal {
            # Check if there is a preselected index.
            set preselected_index $::ms::data($w,preselected_index)
            switch -- $preselected_index {
                ""  { set preselected_index 0 }
            }

            # Set the new preselect index.
            set preselected_index [expr { $preselected_index+1 }]

            # Check the scrollstopper ('disabled' or 'enabled').
            set size [$w.listbox size]
            switch -- $::ms::scrollstopper {
                disabled {
                    # If 'preselected_index' reaches its size, cycle trough.
                    if { $preselected_index == $size } {
                        set preselected_index 0
                    }
                }
                enabled {
                    # If 'preselected_index' reaches its size, stop the movement.
                    if { $preselected_index == $size } {
                        return ""
                    }
                }
            }

            # Register the new preselected index.
            set ::ms::data($w,preselected_index) $preselected_index

            # Deselect any preselected index.
            set index 0
            while { $index < $size } {
                $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                -foreground $::ms::current($w,foreground);

                incr index
            }

            # If the preselect index is not a selected index, preselect it.
            if { $::ms::data($w,preselected_index) ni [$w.listbox curselection] } {
                $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                           -foreground $::ms::current($w,preselectforeground);

                # Remove the activestyle.
                $w.listbox configure -activestyle none
            } else {
                # Be sure that the active style is the one chosen by the developer.
                $w.listbox configure -activestyle $::ms::current($w,activestyle)

                # Activate the preselected index.
                $w.listbox activate $::ms::data($w,preselected_index)
            }

            # Adjust the listbox viewport.
            $w.listbox see $::ms::data($w,preselected_index)
        }
    }

    return ""
}

## ArrowUp
#
# Moves the preselection up by one element.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::ArrowUp { w } {
    # Note: This procedure was inspired by the listbox procedure 'ListboxUpDown'.
    #       The procedure have been slighty modified to work with mustang.
    #       All credits goes to the original author/s.

    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    switch -- $::ms::current($w,state) {
        normal {
            # Check if there is a preselected index.
            set preselected_index $::ms::data($w,preselected_index)
            switch -- $preselected_index {
                ""  { set preselected_index 0 }
            }

            # Set the new preselect index.
            set preselected_index [expr { $preselected_index-1 }]

            # Get the listbox size.
            set size [$w.listbox size]

            # Check the scrollstopper ('disabled' or 'enabled').
            switch -- $::ms::scrollstopper {
                disabled {
                    # If 'preselected_index' reaches -1, cycle trough.
                    if { $preselected_index < 0 } {
                        set preselected_index [expr { $size-1 }]
                    }
                }
                enabled {
                    # If 'preselected_index' reaches -1, stop the movement.
                    if { $preselected_index < 0 } {
                        return ""
                    }
                }
            }

            # Register the new preselected index.
            set ::ms::data($w,preselected_index) $preselected_index

            # Deselect any preselected index.
            set index 0
            while { $index < $size } {
                $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                -foreground $::ms::current($w,foreground);

                incr index
            }

            # If the preselect index is not a selected index, preselect it.
            if { $::ms::data($w,preselected_index) ni [$w.listbox curselection] } {
                $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                           -foreground $::ms::current($w,preselectforeground);

                # Remove the activestyle.
                $w.listbox configure -activestyle none
            } else {
                # Be sure that the active style is the one chosen by the developer.
                $w.listbox configure -activestyle $::ms::current($w,activestyle)

                # Activate the preselected index.
                $w.listbox activate $::ms::data($w,preselected_index)
            }

            # Adjust the listbox viewport.
            $w.listbox see $::ms::data($w,preselected_index)
        }
    }

    return ""
}

# B1_Motion
#
# Manage the **B1-Motion** event on the widget.
# It moves or extends the current selection, if the widget's selection mode is **browse** or **extended**.
# It does nothing if the selection mode is **single** or **multiple**.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#        These values should be provided by the **ButtonPress-1** event.
#
# It doesn't return anything.
proc ::ms::listbox::B1_Motion { w x y } {
    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    # Check the widget state.
    switch -- $::ms::current($w,state) {
        normal {
            # Set the closest index near the mouse pointer coordinates where the 'ButtonPress' happened.
            set index [$w.listbox index @$x,$y]

            if { $index == $::tk::Priv(listboxPrev) } {
                return ""
            } else {
                # Set the preselected index as 'index'.
                set ::ms::data($w,preselected_index) $index
            }

            # Check the selection mode.
            switch -- $::ms::current($w,selectmode) {
                browse {
                    # Select the preselected index.
                    $w.listbox selection clear 0 end
                    $w.listbox selection set $::ms::data($w,preselected_index)

                    # Activate the preselected index.
                    $w.listbox activate $::ms::data($w,preselected_index)

                    set ::tk::Priv(listboxPrev) $::ms::data($w,preselected_index)

                    # Fire up the selection event.
                    ::tk::FireListboxSelectEvent $w.listbox
                }
                extended {
                    set index $::tk::Priv(listboxPrev)
                    if { $index < 0 } {
                        set index $::ms::data($w,preselected_index)
                        $w.listbox selection set $::ms::data($w,preselected_index)
                    }

                    # Get the current anchor index.
                    set anchor [$w.listbox index anchor]

                    # Check if the current selection includes the anchor index.
                    switch -- [$w.listbox selection includes anchor] {
                        0   {
                            $w.listbox selection clear $index $::ms::data($w,preselected_index)
                            $w.listbox selection clear anchor $::ms::data($w,preselected_index)
                        }
                        1   {
                            $w.listbox selection clear $index $::ms::data($w,preselected_index)
                            $w.listbox selection set anchor $::ms::data($w,preselected_index)
                        }
                    }

                    switch -- [info exists ::tk::Priv(listboxSelection)] {
                        0   { set ::tk::Priv(listboxSelection) [$w.listbox curselection] }
                    }

                    while { ($index < $::ms::data($w,preselected_index)) && ($index < $anchor) } {
                        if { $index in $::tk::Priv(listboxSelection) } {
                            $w.listbox selection set $index
                        }
                        incr index
                    }

                    while { ($index > $::ms::data($w,preselected_index)) && ($index > $anchor) } {
                        if { $index in $::tk::Priv(listboxSelection) } {
                            $w.listbox selection set $index
                        }
                        incr index -1
                    }

                    set ::tk::Priv(listboxPrev) $::ms::data($w,preselected_index)

                    # Fire up the selection event.
                    ::tk::FireListboxSelectEvent $w.listbox
                }
            }
        }
    }

    return ""
}

## Begin_Select
#
# Manage the **ButtonPress-1** event on the widget.
# It begins the process of making a selection in the widget.
# Its exact behavior depends on the selection mode currently in effect for the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#        These values should be provided by the **ButtonPress-1** event.
#
# It doesn't return anything.
proc ::ms::listbox::Begin_Select { w x y } {
    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    # Check the widget state.
    switch -- $::ms::current($w,state) {
        normal {
            # Set the preselected index as the closest index near the mouse pointer coordinates where the 'ButtonPress' happened.
            set ::ms::data($w,preselected_index) [$w.listbox index @$x,$y]

            # Check the 'selectmode'.
            switch -- $::ms::current($w,selectmode) {
                browse -
                single {
                    # Check if the current preselected index is included in the current selection.
                    switch -- [$w.listbox selection includes $::ms::data($w,preselected_index)] {
                        0   {
                            # Select the preselected index.
                            $w.listbox selection clear 0 end
                            $w.listbox selection set $::ms::data($w,preselected_index)

                            # Activate the preselected index.
                            $w.listbox activate $::ms::data($w,preselected_index)

                            set ::tk::Priv(listboxPrev)      $::ms::data($w,preselected_index)
                            set ::tk::Priv(listboxSelection) {}
                        }
                    }
                }
                extended {
                    # Register if the current selection includes the preselected index or not.
                    set includes [$w.border.listbox selection includes $::ms::data($w,preselected_index)]

                    # Clear the current selection, if any.
                    $w.border.listbox selection clear 0 end

                    # Check if the current preselected index is included in the current selection.
                    switch -- $includes {
                        0   {
                            # Select the preselected index.
                            $w.listbox selection set $::ms::data($w,preselected_index)
                            $w.listbox selection anchor $::ms::data($w,preselected_index)

                            # Activate the preselected index.
                            $w.listbox activate $::ms::data($w,preselected_index)

                            set ::tk::Priv(listboxPrev)      $::ms::data($w,preselected_index)
                            set ::tk::Priv(listboxSelection) {}
                        }
                        1   {
                            # Unselect the preselected index.
                            $w.listbox selection clear $::ms::data($w,preselected_index)

                            # Preselect the preselected index.
                            $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                                       -foreground $::ms::current($w,preselectforeground);
                        }
                    }
                }
                multiple {
                    # Check if the current preselected index is included in the current selection.
                    switch -- [$w.listbox selection includes $::ms::data($w,preselected_index)] {
                        0   {
                            # Select the preselected index.
                            $w.listbox selection set $::ms::data($w,preselected_index)

                            # Activate the preselected index.
                            $w.listbox activate $::ms::data($w,preselected_index)
                        }
                        1   {
                            # Unselect the preselected index.
                            $w.listbox selection clear $::ms::data($w,preselected_index)

                            # Preselect the preselected index.
                            $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                                       -foreground $::ms::current($w,preselectforeground);
                        }
                    }
                }
            }

            # Fire up the selection event.
            ::tk::FireListboxSelectEvent $w.listbox

            # Check if the widget have the focus.
            switch -- [::ms::listbox::Pathname_Cmd $w instate focus] {
                0   {
                    # Focus the listbox.
                    _focus -force $w.listbox

                    # Change the widget dynamic state to 'focus'
                    ::ms::listbox::Pathname_Cmd $w state focus
                }
            }
        }
    }

    return ""
}

## Configure
#
# Manage the **Configure** event on a widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::Configure { w } {
    # Update the scrollbars.
    ::ms::listbox::Scrollbar_Update $w

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
proc ::ms::listbox::Destroy { w } {
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

    # Remove the widget address from the listbox widgets real address list.
    set index [lsearch -exact $::ms::addr(listbox) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(listbox) [lremove $::ms::addr(listbox) $index] }
    }

    # Remove all the objects real addresses from the list of all available real addresses.
    foreach object [list $w \
                         $w.listbox \
                         $w.x \
                         $w.y] {
        set index [lsearch -exact $::ms::addr(reals) $object]
        switch -- $index {
            -1      {}
            default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
        }
    }

    # Remove the widget address from the listbox classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),listbox,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),listbox,addrs) [lremove $::ms::class($::ms::current($w,class),listbox,addrs) $index] }
    }

    # Remove the widget address from the listbox classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),listbox,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),listbox,addrs) [lremove $::ms::style($::ms::current($w,style),listbox,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the listbox classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),listbox,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(listbox,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(listbox,classtype) [lremove $::ms::style(listbox,classtype) $index] }
            }
        }
    }

    # Remove the widget address from the megawidget real address list.
    set index [lsearch -exact $::ms::addr(megawidgets) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(megawidgets) [lremove $::ms::addr(megawidgets) $index] }
    }

    # Remove the widget address from the megawidget scrollable real address list.
    set index [lsearch -exact $::ms::addr(megawidgets,scrollable) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(megawidgets,scrollable) [lremove $::ms::addr(megawidgets,scrollable) $index] }
    }

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short) \
                         ::ms::addr($w.listbox,short) \
                         ::ms::addr($w.x,short) \
                         ::ms::addr($w.y,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,activestyle) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,columns) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,disabledforeground) \
                         ::ms::current($w,exportselection) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,justify) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,rows) \
                         ::ms::current($w,selectbackground) \
                         ::ms::current($w,selectborderwidth) \
                         ::ms::current($w,selectforeground) \
                         ::ms::current($w,selectmode) \
                         ::ms::current($w,setgrid) \
                         ::ms::current($w,shellbackground) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,values);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,listvariable) \
                         ::ms::data($w,preselected_index) \
                         ::ms::data($w,scrollx) \
                         ::ms::data($w,scrolly) \
                         ::ms::data($w,statespec) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,activestyle) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,columns) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,disabledforeground) \
                         ::ms::default($w,exportselection) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,justify) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,rows) \
                         ::ms::default($w,selectbackground) \
                         ::ms::default($w,selectborderwidth) \
                         ::ms::default($w,selectforeground) \
                         ::ms::default($w,selectmode) \
                         ::ms::default($w,setgrid) \
                         ::ms::default($w,shellbackground) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,values);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,columns) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,disabledforeground) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,justify) \
                         ::ms::managed_by($w,relief) \
                         ::ms::managed_by($w,rows) \
                         ::ms::managed_by($w,selectbackground) \
                         ::ms::managed_by($w,selectborderwidth) \
                         ::ms::managed_by($w,selectforeground) \
                         ::ms::managed_by($w,shellbackground);

    unset -nocomplain -- ::ms::style($w,hull)

    return ""
}

## End
#
# Select the last item of the list.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::End { w } {
    # Note: This procedure was inspired by the listbox binding <Control-End>.
    #       The procedure have been slighty modified to work with mustang.
    #       All credits goes to the original author/s.

    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    switch -- $::ms::current($w,state) {
        normal {
            # Select the last index of the listbox.
            $w.listbox selection clear 0 end
            $w.listbox selection set end

            # Set the selection anchor to the last index.
            $w.listbox selection anchor end

            # Activate the preselected index.
            $w.listbox activate end

            # Adjust the listbox viewport.
            $w.listbox see end

            # Register the new preselected index.
            set ::ms::data($w,preselected_index) [$w.listbox index active]

            # Be sure that the active style is the one chosen by the developer.
            $w.listbox configure -activestyle $::ms::current($w,activestyle)

            # Fire up the selection event.
            ::tk::FireListboxSelectEvent $w.listbox
        }
    }

    return ""
}

## Extend
#
# Moves the location cursor up or down by one element, and extends the selection to that point.
#
# Where:
#
# w        Should be the widget real address involved.
#
# amount   Should be an integer that specifies the amount of the movement (in rows).
#          Generally **+1** to move down one item, **-1** to move up one item.
#
# It doesn't return anything.
proc ::ms::listbox::Extend { w amount } {
    # Note: This procedure was inspired by the listbox procedure 'ListboxExtendUpDown'.
    #       The procedure have been slighty modified to work with mustang.
    #       All credits goes to the original author/s.

    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    switch -- $::ms::current($w,state) {
        normal {
            # Check the listbox selectmode.
            switch -- $::ms::current($w,selectmode) {
                extended {
                    # Get the listbox item size.
                    set size [$w.listbox size]

                    # Check if there is a preselected index.
                    switch -- $::ms::data($w,preselected_index) {
                        ""  { set ::ms::data($w,preselected_index) 0 }
                    }

                    # Deselect any preselected index.
                    set index 0
                    while { $index < $size } {
                        $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                        -foreground $::ms::current($w,foreground);

                        incr index
                    }

                    # Check if there is a selection already.
                    switch -- [$w.listbox curselection] {
                        ""  {
                            # No selection.

                            # Select the current preselected index.
                            $w.listbox selection set $::ms::data($w,preselected_index)
                            $w.listbox selection anchor $::ms::data($w,preselected_index)

                            # Activate the preselected index.
                            $w.listbox activate $::ms::data($w,preselected_index)
                        }
                        default {
                            # Move the preselected index by amount.
                            set ::ms::data($w,preselected_index) [expr { $::ms::data($w,preselected_index)+$amount }]

                            # Check that the preselected index didn't go out of its bounds.
                            set limit [expr { $size-1 }]
                            if { $::ms::data($w,preselected_index) < 0 } {
                                set ::ms::data($w,preselected_index) 0
                            } elseif { $::ms::data($w,preselected_index) > $limit } {
                                set ::ms::data($w,preselected_index) $limit
                            }

                            # Be sure that the active style is the one chosen by the developer.
                            $w.listbox configure -activestyle $::ms::current($w,activestyle)

                            # Activate the preselected index.
                            $w.listbox activate $::ms::data($w,preselected_index)

                            # Adjust the listbox viewport.
                            $w.listbox see $::ms::data($w,preselected_index)

                            # Call the 'ListboxMotion' procedure.
                            ::tk::ListboxMotion $w.listbox $::ms::data($w,preselected_index)

                            # Bug correction.
                            # Sometimes when deselecting items comes a point when the are only 2 items selected.
                            # If these items are the first and second row (with the first one being the anchored one), further
                            # deselection won't do anything except moving the cursor location.
                            # The correct way is to always deselect every row that is not the anchored one everytime the 'anchor'
                            # and the 'active' index refers to the same row.
                            if { [$w index anchor] == [$w index active] } {
                                $w.listbox selection clear 0 end
                                $w.listbox selection set anchor anchor
                            }
                        }
                    }
                }
            }
        }
    }

    return ""
}

## Extend_Home_End
#
# Moves the location cursor to the begin or end of the elements, and extends the selection to that point.
#
# Where:
#
# w     Should be the widget real address involved.
#
# key   Should be a string that specifies the key pressed ('home' or 'end').
#
# It doesn't return anything.
proc ::ms::listbox::Extend_Home_End { w key } {
    # Note: This procedure was inspired by the listbox procedure 'ListboxExtendUpDown'.
    #       The procedure have been slighty modified to work with mustang.
    #       All credits goes to the original author/s.

    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    switch -- $::ms::current($w,state) {
        normal {
            # Check the listbox selectmode.
            switch -- $::ms::current($w,selectmode) {
                extended {
                    # Check if there is a preselected index.
                    switch -- $::ms::data($w,preselected_index) {
                        ""  { set ::ms::data($w,preselected_index) 0 }
                    }

                    # Check if there is a selection already.
                    switch -- [$w.listbox curselection] {
                        ""  { return "" }
                    }

                    # Clear the selection.
                    $w.listbox selection clear 0 end

                    # Do the selection.
                    switch -nocase -- $key {
                        home {
                            # Select from the first index till the preselected index.
                            $w.listbox selection set 0 $::ms::data($w,preselected_index)
                        }
                        default {
                            # Select from the preselected index till the last index.
                            $w.listbox selection set $::ms::data($w,preselected_index) [$w.listbox index end]
                        }
                    }

                    # Be sure that the active style is the one chosen by the developer.
                    $w.listbox configure -activestyle $::ms::current($w,activestyle)

                    # Adjust the listbox viewport.
                    $w.listbox see $::ms::data($w,preselected_index)
                }
            }
        }
    }

    return ""
}

## FocusIn
#
# Manage the <FocusIn> event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::listbox::Pathname_Cmd $w state focus

    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    # Register the current rows selected.
    set ::ms::temp($w,selected_rows) [$w.listbox curselection]
    switch -- [llength $::ms::temp($w,selected_rows)] {
        0   { set ::ms::temp($w,selected_rows) [list 0] }
    }

    return ""
}

## FocusOut
#
# Manage the <FocusOut> event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::FocusOut { w } {
    # Check the contextual menu relative to this widget, if any.
    switch -- $::ms::current($w,cmenu) {
        ""      {}
        default {
            # If the contextual menu of the widget is open do not loose the focus (graphically).
            switch -- [_winfo exists $::ms::current($w,cmenu)] {
                1   { return "" }
            }
        }
    }

    # Check if there is at least one selected row.
    switch -- [$w.listbox curselection] {
        ""  {
            foreach index $::ms::temp($w,selected_rows) {
                $w.listbox selection set $index
            }
        }
    }

    unset -nocomplain -- ::ms::temp($w,selected_rows)

    # Change the widget dynamic state to '!focus'.
    ::ms::listbox::Pathname_Cmd $w state !focus

    return ""
}

## Home
#
# Select the first item of the list.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::Home { w } {
    # Note: This procedure was inspired by the listbox binding <Control-Home>.
    #       The procedure have been slighty modified to work with mustang.
    #       All credits goes to the original author/s.

    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    switch -- $::ms::current($w,state) {
        normal {
            # Select the first index of the listbox.
            $w.listbox selection clear 0 end
            $w.listbox selection set 0

            # Set the selection anchor to the first item.
            $w.listbox selection anchor 0

            # Activate the preselected index.
            $w.listbox activate 0

            # Adjust the listbox viewport.
            $w.listbox see 0

            # Register the new preselected index.
            set ::ms::data($w,preselected_index) 0

            # Be sure that the active style is the one chosen by the developer.
            $w.listbox configure -activestyle $::ms::current($w,activestyle)

            # Fire up the selection event.
            ::tk::FireListboxSelectEvent $w.listbox
        }
    }

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
proc ::ms::listbox::Hover { w X Y } {
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
        ::ms::listbox::Pathname_Cmd $w state !hover

        # Check if there are items associated to the listbox.
        switch -- $::ms::current($w,values) {
            ""      {}
            default {
                # Recolor any index with the default colors (background and foreground).
                set index 0
                while { $index < [$w.listbox size] } {
                    $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                    -foreground $::ms::current($w,foreground);

                    incr index
                }
            }
        }
    } else {
        # The mouse cursor is inside the widget acting as a border object.

        # Change the widget dynamic state to 'hover'.
        ::ms::listbox::Pathname_Cmd $w state hover
    }

    return ""
}

## Motion
#
# Manage the **Motion** event on the widget by graphically preselecting the item under the mouse pointer.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#        These values should be provided by the **Motion** event.
#
# It doesn't return anything.
proc ::ms::listbox::Motion { w x y } {
    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    # If needed, deselect the current preselected index.
    switch -- $::ms::data($w,preselected_index) {
        ""      {}
        default {
            $w.border.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,background) \
                                                                              -foreground $::ms::current($w,foreground);
        }
    }

    # Set the new preselect index.
    set ::ms::data($w,preselected_index) [$w.listbox index @$x,$y]

    # If the preselect index is not a selected index, preselect it.
    if { $::ms::data($w,preselected_index) ni [$w.listbox curselection] } {
        $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                   -foreground $::ms::current($w,preselectforeground);

        # Remove the activestyle.
        $w.listbox configure -activestyle none
    } else {
        # Be sure that the active style is the one chosen by the developer.
        $w.listbox configure -activestyle $::ms::current($w,activestyle)

        # Activate the preselected index.
        $w.listbox activate $::ms::data($w,preselected_index)
    }

    # Adjust the listbox viewport.
    $w.listbox see $::ms::data($w,preselected_index)

    return ""
}

## NextChar
#
# Scroll the listbox horizontally by one unit towards the right.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::NextChar { w } {
    switch -- $::ms::current($w,state) {
        normal {
            switch -- $::ms::data($w,scrollx) {
                on  { $w.listbox xview scroll 1 units }
            }
        }
    }

    return ""
}

## PageDown
#
# Scroll the listbox horizontally by one page towards the bottom.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::PageDown { w } {
    switch -- $::ms::current($w,state) {
        normal {
            switch -- $::ms::data($w,scrolly) {
                on  { $w.listbox yview scroll 1 pages }
            }
        }
    }

    return ""
}

## PageLeft
#
# Scroll the listbox horizontally by one page towards the left.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::PageLeft { w } {
    switch -- $::ms::current($w,state) {
        normal {
            switch -- $::ms::data($w,scrollx) {
                on  { $w.listbox xview scroll -1 pages }
            }
        }
    }

    return ""
}

## PageRight
#
# Scroll the listbox horizontally by one page towards the left.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::PageRight { w } {
    switch -- $::ms::current($w,state) {
        normal {
            switch -- $::ms::data($w,scrollx) {
                on  { $w.listbox xview scroll 1 pages }
            }
        }
    }

    return ""
}

## PageUp
#
# Scroll the listbox horizontally by one page towards the top.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::PageUp { w } {
    switch -- $::ms::current($w,state) {
        normal {
            switch -- $::ms::data($w,scrolly) {
                on  { $w.listbox yview scroll -1 pages }
            }
        }
    }

    return ""
}

## PrevChar
#
# Scroll the listbox horizontally by one unit towards the left.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::PrevChar { w } {
    switch -- $::ms::current($w,state) {
        normal {
            switch -- $::ms::data($w,scrollx) {
                on  { $w.listbox xview scroll -1 units }
            }
        }
    }

    return ""
}

########################
##                    ##
##     SELECTIONS     ##
##                    ##
########################

# Note: The following procedures were inspired by the listbox mechanism for selections.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## Select
#
# Manage the **space**, **Return**, **KP_Enter** and **Control-ButtonPress** events on the widget by toggling the selection.
#
# If selectmode is *browse* or *single*     --> It will select the preselected index.
#                                               If the preselected index is already selected it will stay selected.
#
# If selectmode is *extended* or *multiple* --> It will select the preselected index.
#                                               If the preselected index is already selected it will be unselected.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::Select { w } {
    # Check if there is a preselected index.
    switch -- $::ms::data($w,preselected_index) {
        ""  { set ::ms::data($w,preselected_index) 0 }
    }

    # Check the 'selectmode'.
    switch -- $::ms::current($w,selectmode) {
        browse -
        single {
            switch -- [$w.listbox selection includes $::ms::data($w,preselected_index)] {
                0   {
                    # Select the preselected index.
                    $w.listbox selection clear 0 end
                    $w.listbox selection set $::ms::data($w,preselected_index)

                    # Activate the preselected index.
                    $w.listbox activate $::ms::data($w,preselected_index)

                    set ::tk::Priv(listboxPrev)      $::ms::data($w,preselected_index)
                    set ::tk::Priv(listboxSelection) {}
                }
            }
        }
        extended {
            switch -- [$w.listbox selection includes $::ms::data($w,preselected_index)] {
                0   {
                    # Select the preselected index.
                    $w.listbox selection set $::ms::data($w,preselected_index)
                    $w.listbox selection anchor $::ms::data($w,preselected_index)

                    # Activate the preselected index.
                    $w.listbox activate $::ms::data($w,preselected_index)

                    set ::tk::Priv(listboxPrev)      $::ms::data($w,preselected_index)
                    set ::tk::Priv(listboxSelection) {}
                }
                1   {
                    # Unselect the preselected index.
                    $w.listbox selection clear $::ms::data($w,preselected_index)

                    # Preselect the preselected index.
                    $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                               -foreground $::ms::current($w,preselectforeground);
                }
            }
        }
        default {
            # multiple
            switch -- [$w.listbox selection includes $::ms::data($w,preselected_index)] {
                0   {
                    # Select the preselected index.
                    $w.listbox selection set $::ms::data($w,preselected_index)

                    # Activate the preselected index.
                    $w.listbox activate $::ms::data($w,preselected_index)
                }
                1   {
                    # Unselect the preselected index.
                    $w.listbox selection clear $::ms::data($w,preselected_index)

                    # Preselect the preselected index.
                    $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                               -foreground $::ms::current($w,preselectforeground);
                }
            }
        }
    }

    # Adjust the listbox viewport.
    $w.listbox see $::ms::data($w,preselected_index)

    # Fire up the selection event.
    ::tk::FireListboxSelectEvent $w.listbox

    # If needed, focus the listbox (for buttonpress events).
    if { ([_winfo exists $w.listbox] == 1) && ($::ms::current($w,state) eq "normal") && ([_focus] ne "$w.listbox)") } {
        _focus $w.listbox
    }

    return ""
}

## Select_All
#
# This procedure is invoked to handle the "select all" operation.
# For extended and multiple selectmode, it selects everything in the widget.
# Otherwise, nothing will happen.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::Select_All { w } {
    # Check the 'selectmode'.
    switch -- $::ms::current($w,selectmode) {
        extended -
        multiple {
            # Check if there are items associated to the listbox.
            switch -- $::ms::current($w,values) {
                ""  { return "" }
            }

            # Check if there is a preselected index.
            switch -- $::ms::data($w,preselected_index) {
                ""  { set ::ms::data($w,preselected_index) 0 }
            }

            # Deselect any previously selected index.
            $w.listbox selection clear 0 end

            # Select all indexes.
            $w.listbox selection set 0 end

            # Be sure that the active style is the one chosen by the developer.
            $w.listbox configure -activestyle $::ms::current($w,activestyle)

            # Activate the preselected index.
            $w.listbox activate $::ms::data($w,preselected_index)

            # Fire up the selection event.
            ::tk::FireListboxSelectEvent $w.listbox
        }
    }

    return ""
}

## Unselect_All
#
# Manage the **Escape** event inside the widget by clearing all previously selected indexes.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::Unselect_All { w } {
    set ::tk::Priv(listboxPrev)      {}
    set ::tk::Priv(listboxSelection) {}

    # Check if there are items associated to the listbox.
    switch -- $::ms::current($w,values) {
        ""  { return "" }
    }

    # Deselect any previously selected index.
    $w.listbox selection clear 0 end

    # Preselect the current active row.
    $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                               -foreground $::ms::current($w,preselectforeground);

    # Remove the activestyle.
    $w.listbox configure -activestyle none

    # Fire up the selection event.
    ::tk::FireListboxSelectEvent $w.listbox

    return ""
}

#######################
##                   ##
##     SCROLLBAR     ##
##                   ##
#######################

## Scrollbar_ButtonPress
#
# Manage the **ButtonPress** event on the widget's internal scrollbars.
#
# Where:
#
# w        Should be the widget real address involved.
#
# orient   Specifies a string (**horizontal** or **vertical**) indicating
#          the orientation of the scrollbar.
#
# x, y     Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#          These values should be provided by the **ButtonPress** event.
#
# It doesn't return anything.
proc ::ms::listbox::Scrollbar_ButtonPress { w orient x y }  {
    set ::ms::temp(xpress) $x
    set ::ms::temp(ypress) $y

    switch -nocase -- $orient {
        horizontal {
            switch -nocase -glob -- [$w.x identify $x $y] {
                "*leftarrow"  { ::ms::Scroll_Widget_X $w +120 units }
                "*rightarrow" { ::ms::Scroll_Widget_X $w -120 units }
                "*grip"  -
                "*thumb" {
                    set ::ms::temp(drag_allowed) yes

                    set xviews [$w.x get]
                    set xview1 [lindex $xviews 0]
                    set xview2 [lindex $xviews 1]

                    # Compute the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [expr { ($xview2+$xview1)*0.5 }]
                }
                "*trough" {
                    # Get the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [$w.x fraction $x $y]

                    # Check if 'parent' has an active horizontal scrollbar linked to it.
                    switch -- $::ms::data($w,scrollx) {
                        on  {
                            switch -nocase -- $::ms::clickaction {
                                jump {
                                    # Jump to the location on the scrollbar that was clicked.
                                    ::ms::listbox::Pathname_Cmd $w xview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set xviews [$w.x get]
                                    set xview1 [lindex $xviews 0]
                                    set xview2 [lindex $xviews 1]

                                    if { $::ms::temp(fraction) < $xview1 } {
                                        # The User has click on the left trough.

                                        # Scroll the thumb by one page towards the left.
                                        ::ms::listbox::Pathname_Cmd $w xview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $xview2 } {
                                        # The User has click on the right trough.

                                        # Scroll the thumb by one page towards the right.
                                        ::ms::listbox::Pathname_Cmd $w xview scroll 1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } else {
                                        # The User has click on the thumb (???).

                                        set ::ms::temp(drag_allowed) no
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        vertical {
            switch -nocase -glob -- [$w.y identify $x $y] {
                "*uparrow"   { ::ms::Scroll_Widget_Y $w +120 units }
                "*downarrow" { ::ms::Scroll_Widget_Y $w -120 units }
                "*grip"  -
                "*thumb" {
                    set ::ms::temp(drag_allowed) yes

                    set yviews [$w.y get]
                    set yview1 [lindex $yviews 0]
                    set yview2 [lindex $yviews 1]

                    # Compute the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [expr { ($yview2+$yview1)*0.5 }]
                }
                "*trough" {
                    # Get the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [$w.y fraction $x $y]

                    # Check if 'parent' has an active vertical scrollbar linked to it.
                    switch -- $::ms::data($w,scrolly) {
                        on  {
                            switch -nocase -- $::ms::clickaction {
                                jump {
                                    # Jump to the location on the scrollbar that was clicked.
                                    ::ms::listbox::Pathname_Cmd $w yview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set yviews [$w.y get]
                                    set yview1 [lindex $yviews 0]
                                    set yview2 [lindex $yviews 1]

                                    if { $::ms::temp(fraction) < $yview1 } {
                                        # The User has click on the top trough.

                                        # Scroll the thumb by one page towards the top.
                                        ::ms::listbox::Pathname_Cmd $w yview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $yview2 } {
                                        # The User has click on the bottom trough.

                                        # Scroll the thumb by one page towards the bottom.
                                        ::ms::listbox::Pathname_Cmd $w yview scroll 1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } else {
                                        # The User has click on the thumb (???).
                                        set ::ms::temp(drag_allowed) no
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    return ""
}

## Scrollbar_ButtonRelease
#
# Manage the **ButtonRelease** event on the widget's internal scrollbars.
#
# It doesn't return anything.
proc ::ms::listbox::Scrollbar_ButtonRelease {} {
    unset -nocomplain -- ::ms::temp(drag_allowed) \
                         ::ms::temp(fraction) \
                         ::ms::temp(xpress) \
                         ::ms::temp(ypress);

    return ""
}

## Scrollbar_Drag
#
# Manage the **B1-Motion** event on the widget's internal scrollbars.
#
# Where:
#
# w        Should be the widget real address involved.
#
# orient   Specifies a string (**horizontal** or **vertical**) indicating
#          the orientation of the scrollbar.
#
# x, y     Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#          These values should be provided by the **B1-Motion** event.
#
# It doesn't return anything.
proc ::ms::listbox::Scrollbar_Drag { w orient x y } {
    # Safeguard.
    # Check if the 'Scrollbar_Drag' operation is allowed or not.
    switch -- [info exists ::ms::temp(drag_allowed)] {
        0   { return "" }
        1   {
            switch -- $::ms::temp(drag_allowed) {
                no  { return "" }
            }
        }
    }

    # Compute 'delta_x' and 'delta_y'.
    set delta_x [expr { $x-$::ms::temp(xpress) }]
    set delta_y [expr { $y-$::ms::temp(ypress) }]

    # Check the orientation.
    switch -nocase -- $orient {
        horizontal {
            # Compute the 'fraction' after the drag movement.
            set delta    [$w.x delta $delta_x $delta_y]
            set fraction [expr { $::ms::temp(fraction)+$delta }]

            # Move the horizontal scrollbar to 'fraction'.
            ::ms::listbox::Pathname_Cmd $w xview moveto $fraction
        }
        vertical {
            # Compute the 'fraction' after the drag movement.
            set delta    [$w.y delta $delta_x $delta_y]
            set fraction [expr { $::ms::temp(fraction)+$delta }]

            # Move the vertical scrollbar to 'fraction'.
            ::ms::listbox::Pathname_Cmd $w yview moveto $fraction
        }
    }

    return ""
}

## Scrollbar_Update
#
# Manage the widget's scrollbars movements and displays.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::listbox::Scrollbar_Update { w } {
    update

    ##################################
    ##                              ##
    ##     HORIZONTAL SCROLLBAR     ##
    ##                              ##
    ##################################

    # Get 'xview1' and 'xview2'.
    set xviews [$w.x get]
    set xview1 [lindex $xviews 0]
    set xview2 [lindex $xviews 1]

    if { ($xview1 == 0) && ($xview2 == 1.0) } {
        # Check if the horizontal scrollbar is currently displayed.
        switch -- $::ms::data($w,scrollx) {
            on  {
                # Hide the horizontal scrollbar.
                _grid remove $w.x

                # Set the horizontal scrollbar status to 'off'.
                set ::ms::data($w,scrollx) off
            }
        }
    } else {
        # Check if the horizontal scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrollx) {
            off {
                # Display the horizontal scrollbar.
                _grid $w.x -column 0 \
                             -padx [list 0  0] \
                             -pady [list 8p 0] \
                              -row 1 \
                           -sticky we;

                # Set the horizontal scrollbar status to 'on'.
                set ::ms::data($w,scrollx) on
            }
        }
    }

    ################################
    ##                            ##
    ##     VERTICAL SCROLLBAR     ##
    ##                            ##
    ################################

    # Get 'yview1' and 'yview2'.
    set yviews [$w.y get]
    set yview1 [lindex $yviews 0]
    set yview2 [lindex $yviews 1]

    if { ($yview1 == 0) && ($yview2 == 1.0) } {
        # Check if the vertical scrollbar is currently displayed.
        switch -- $::ms::data($w,scrolly) {
            on  {
                # Hide the vertical scrollbar.
                _grid remove $w.y

                # Set the vertical scrollbar status to 'off'.
                set ::ms::data($w,scrolly) off
            }
        }
    } else {
        # Check if the vertical scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrolly) {
            off {
                # Display the vertical scrollbar.
                _grid $w.y -column 1 \
                             -padx [list 8p 0] \
                             -pady [list 0  0] \
                              -row 0 \
                           -sticky ns;

                # Set the vertical scrollbar status to 'on'.
                set ::ms::data($w,scrolly) on
            }
        }
    }

    update idletasks

    return ""
}

#*EOF*