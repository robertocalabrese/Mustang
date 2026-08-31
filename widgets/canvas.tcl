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

## canvas
#
#### DESCRIPTION:
#
# Create and manipulate 'canvas' hypergraphics drawing surface widgets.
# The canvas command creates a new window (given by the *window* argument) and makes it into a canvas widget.
#
# Canvas widgets implement structured graphics. A canvas displays any number of items, which may be things like rectangles,
# circles, lines, and text.
# Items may be manipulated (e.g. moved or re-colored) and commands may be associated with items in much the same way that
# the bind command allows commands to be bound to widgets.
# For example, a particular command may be associated with the **ButtonPress-1** event so that the command is invoked
# whenever button 1 is pressed with the mouse cursor over an item.
# This means that items in a canvas can have behaviors defined by the Tcl scripts bound to them.
#
# The canvas command returns the pathname of the new window.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname,
#         but the pathname's parents must exists.
#         *Window* may be provided either as a short or as a real address, the address returned will be:
#            - A short address, if the *window* provided as input is a short address.
#            - A real address, if the *window* provided as input is a real address.
#
# Note 2: Depending on the **-scrollable** option value, two kinds of canvas structures are possible.
#         The mustang simple canvas (**-scrollable** false) is a single canvas widget.
#         The mustang scrollable canvas (**-scrollable** true) is a megawidget composed by an hull object (the megawidget container),
#         a canvas object, two scrollbar objects (displayed only when needed) and two fake scrollbar objects (displayed only when needed).
#
# Additional options, described below, may be specified on the command line to configure aspects of the canvas.
#
#### SYNOPSIS:
#
#   **canvas** *window* ?*option value*? ... ?*option value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-background**          It's a list that specifies the color to use as background.
#                          See the **COLOR OPTION** section to know how this list should be composed.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                         Only the developer can.
#
#                                If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                         If there isn't one, the **-background** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-background** will always abide by its mapping values, if any.
#                                                         Styles, mappings and states events are allowed to change its value.
#
#                          See also **-shellbackground**.
#
# **-bordercolor**         It's a list that specifies the color to use as bordercolor.
#                          See the **COLOR OPTION** section to know how this list should be composed.
#
#                          Note: It's only meaningful for widgets with a **solid** or **flat** relief.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                         Only the developer can.
#
#                                If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                         If there isn't one, the **-bordercolor** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-bordercolor** will always abide by its mapping values, if any.
#                                                         Styles, mappings and states events are allowed to change its value.
#
#                          See also **-borderwidth** and **-relief**.
#
# **-borderwidth**         Specifies the width of the three-dimensional border to draw around the outside of the widget,
#                          if such a border is being drawn.
#                          The **-relief** option typically determines this.
#
#                          The value may also be used when drawing three-dimensional effects in the widget's interior.
#                          The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                          (pixels, points, inches, millimeters or centimeters).
#
#                          Note: A value of **0** means no border.
#
#                          Note: Only working with reliefs that are not *flat*.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                         Only the developer can.
#
#                                If it's not provided --> The widget will follow the **-borderwidth** specified in its style.
#                                                         If there isn't one, the **-borderwidth** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-borderwidth** will not abide by its mapping values, if any.
#                                                         It is not supposed to change when the widget state changes.
#
#                          See also **-bordercolor** and **-relief**.
#
# **-class**               Specifies a class for the widget.
#                          It is mainly used to make bindings for widgets that have the same class.
#
#                          Note: This option may only be provided while creating the widget.
#                                Attempts to change this value after the widget is created by using the **configure** command,
#                                will be ignored by mustang.
#
#                          If not provided, defaults to **Canvas**.
#
# **-closeenough**         Specifies a floating-point value indicating how close the mouse cursor must be to an item before it is
#                          considered to be "inside" the item.
#
#                          If not provided, defaults to 1.0.
#
# **-cmenu**               Specifies the contextual menu address that will be assigned to the widget.
#
#                          The contextual menu will be assign to the *content* object of the megawidget.
#                          If the *cmenu* value is the empty string or invalid, the contextual menu of the widget's
#                          toplevel (if any) will be used instead. If the widget's toplevel doesn't have a contextual menu,
#                          nothing will happen.
#
#                          The *hull* and *fake scrollbar* objects will use the contextual menu of the widget's toplevel, if any.
#                          If the developer needs a different contextual menu for them, a variable called
#                          '::ms::data($short_addr,cmenu,shell)' can be set with a valid contextual menu address in
#                          order to be used instead of the toplevel one.
#
#                          Note: '$short_addr' must be the short address of the canvas widget.
#                                See the [tk](/wiki/commands/tk.md) command to know more about short and real address.
#
#                          If '::ms::data($short_addr,cmenu,shell)' is set with an empty string or with an invalid contextual menu
#                          address, it will be ignored and the contextual menu of the widget's toplevel (if any) will be used.
#                          If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                          The *scrollbar* objects are not supposed to have a contextual menu and will not be link with any.
#
#                          Note: If '::ms::data($short_addr,cmenu,shell)' is set for a simple canvas widget, it will be silently ignored.
#
#                          If not provided, defaults to the empty string.
#
# **-confine**             Specifies a boolean value that indicates whether or not it should be allowable to set the canvas's
#                          view outside the region defined by the **scrollregion** argument.
#
#                          If not provided, defaults to true, which means that the view will be constrained within the scroll region.
#
# **-cursor**              Specifies the mouse cursor to be used inside the canvas area.
#                          If an empty string is specified, it indicates that the widget should defer to it's parent for
#                          cursor specification.
#
#                          See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                         Only the developer can.
#
#                                If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                         If there isn't one, the **-cursor** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-cursor** will not abide by its mapping values, if any.
#                                                         It is not supposed to change when the widget state changes.
#
# **-height**              Specifies the desired height for the widget in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                          (pixels, points, inches, millimeters and centimeters).
#
#                          If this option is **0** then the widget will assume the minimum height possible that can accomodate
#                          it's content height. Negative values will be ignored.
#
#                          Note that canvases will ignore height of '0'.
#                          This restriction is not necessary on Linux (or BSD), but in order to have the same behavior across
#                          operating systems a height value of '0' will not be accepted for canvases.
#
#                          Note: "WINDOW MANAGERS"
#
#                              Any toplevel is managed by the *window manager*.
#                              Any widget's program-requested height may cause it's toplevel to change it's height as well.
#                              If the toplevel program-requested height is ignored (by the window manager),
#                              then any widget's program-requested height is ignored too (by Tk that follows the istructions
#                              received by the 'window manager').
#
#                              Some window managers ignores any toplevel program-requested height and demands only to the
#                              user to manually change the toplevel's height.
#
#                              Some window managers allows any toplevel program-requested height until the user will
#                              manually change the toplevel's height.
#                              Once the user has manually changed the toplevel's height, any subsequent toplevel
#                              program-requested height will be ignored.
#
#                              Others window managers allows any toplevel program-requested height in any circumstances.
#
#                          "Tk"
#
#                              Tk ignores any widget's program-requested height if the **grid** or **pack** geometry manager
#                              is used within the widget, since these geometry managers will override the widget's height in
#                              those cases.
#
#                          If not provided, defaults to **7** centimeters.
#
#                          See also **-width**.
#
# **-insertbackground**    It's a list that specifies color to use as background in the area covered by the insertion cursor.
#                          This color will normally override either the normal background for the widget (or the selection
#                          background if the insertion cursor happens to fall in the selection).
#                          See the **COLOR OPTION** section to know how this list should be composed.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                         Only the developer can.
#
#                                If it's not provided --> The widget will follow the **-insertbackground** specified in its style.
#                                                         If there isn't one, the **-insertbackground** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-insertbackground** will always abide by its mapping values, if any.
#                                                         Styles, mappings and states events are allowed to change its value.
#
#                          See also **-selectbackground** and **-insertborderwidth**.
#
# **-insertborderwidth**   It's a list that specifies a non-negative value indicating the width of the 3-D border to draw around
#                          the insertion cursor.
#                          The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#
#                          Note: A value of **0** means no border.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                         Only the developer can.
#
#                                If it's not provided --> The widget will follow the **-insertborderwidth** specified in its style.
#                                                         If there isn't one, the **-insertborderwidth** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-insertborderwidth** will not abide by its mapping values, if any.
#                                                         It is not supposed to change when the widget state changes.
#
#                          See also **-selectborderwidth**.
#
# **-insertofftime**       Specifies a non-negative integer value indicating the number of milliseconds the insertion cursor
#                          should remain "off" in each blink cycle.
#                          If this option is zero then the cursor does not blink: it is on all the time.
#
#                          If not provided, defaults to **300** milliseconds.
#
#                          See also **-insertontime**.
#
# **-insertontime**        Specifies a non-negative integer value indicating the number of milliseconds the insertion cursor
#                          should remain "on" in each blink cycle.
#
#                          If not provided, defaults to **600** milliseconds.
#
#                          See also **-insertofftime**.
#
# **-insertwidth**         Specifies a non-negative value indicating the total width of the insertion cursor.
#                          The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#                          If a border has been specified for the insertion cursor (using the *-insertborderwidth* option),
#                          the border will be drawn inside the width specified by the *-insertwidth* option.
#
#                          If not provided, defaults to **2**.
#
# **-relief**              Specifies the three-dimensional effect desired for the widget.
#                          The value indicates how the widget's interior should appear relative to its exterior.
#                          For example, *raised* means the widget's interior should appear to protrude from the screen,
#                          relative to the exterior of the widget.
#
#                          The widget will accept as relief any of the following values:
#                             **flat**,
#                             **groove**,
#                             **raised**,
#                             **ridge**,
#                             **solid**,
#                             **sunken**.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                         Only the developer can.
#
#                                If it's not provided --> The widget will follow the **-relief** specified in its style.
#                                                         If there isn't one, the **-relief** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-relief** will not abide by its mapping values, if any.
#                                                         It is not supposed to change when the widget state changes.
#
#                          See also **-bordercolor** and **-borderwidth**.
#
# **-scrollable**          Specifies a boolean value indicating wheter or not the widget should be scrollable.
#                          If **true**, a megawidget structure (with two scrollbars) will be constructed instead of a single canvas widget.
#
#                          The scrollbars will be automatically managed by Tk with the following rules:
#                             The horizontal scrollbar is defined to be *needed* each time the widget *content* width is bigger then
#                             the widget *viewport* width and *not needed* when it's not.
#
#                             The vertical scrollbar is defined to be *needed* each time the widget *content* height is bigger then
#                             the widget *viewport* height and *not needed* when it's not.
#
#                             If a scrollbar is currently needed, then it will be displayed (if it's not already displayed) and it's related
#                             fake scrollbar will be removed.
#                             If a scrollbar is not currently needed, then it will not be displayed (or removed if it was
#                             already displayed) and it's related fake scrollbar will be displayed.
#
#                          Note: This option may be provided while creating the widget.
#                                Attempts to change this value after the widget was created by using the **configure** command,
#                                will be ignored by mustang.
#
#                          If not provided, defaults to **false** (meaning no scrollbar).
#
# **-scrollregion**        Specifies a list with four coordinates describing the left, top, right, and bottom coordinates
#                          of a rectangular region. This region is used for scrolling purposes and is considered to be the
#                          boundary of the information in the canvas.
#                          Each of the coordinates may be specified in any of the forms given in the **COORDINATES** section below.
#
#                          If not provided, defaults to the empty string, meaning no scrolling available.
#
# **-selectbackground**    It's a list that specifies the background color to use when displaying selected items.
#                          See the **COLOR OPTION** section to know how this list should be composed.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                         Only the developer can.
#
#                                If it's not provided --> The widget will follow the **-selectbackground** specified in its style.
#                                                         If there isn't one, the **-selectbackground** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-selectbackground** will always abide by its mapping values, if any.
#                                                         Styles, mappings and states events are allowed to change its value.
#
#                          See also **-selectforeground** and **-insertborderwidth**.
#
# **-selectborderwidth**   Specifies a non-negative value indicating the width of the 3-D border to draw around selected items.
#                          The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#
#                          Note: A value of **0** means no border.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                         Only the developer can.
#
#                                If it's not provided --> The widget will follow the **-selectborderwidth** specified in its style.
#                                                         If there isn't one, the **-selectborderwidth** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-selectborderwidth** will not abide by its mapping values, if any.
#                                                         It is not supposed to change when the widget state changes.
#
#                          See also **-selectbackground** and **-selectforeground**.
#
# **-selectforeground**    It's a list that specifies the foreground color to use when displaying selected items.
#                          See the **COLOR OPTION** section to know how this list should be composed.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events are not allowed to change its value.
#                                                         Only the developer is allowed to do it.
#
#                                If it's not provided --> The widget will follow the **-selectforeground** specified in its style.
#                                                         If there isn't one, the **-selectforeground** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-selectforeground** will always abide by its mapping values, if any.
#                                                         Styles, mappings and states events are allowed to change its value.
#
#                          See also **-selectbackground** and **-selectborderwidth**.
#
# **-shellbackground**     It's a list that specifies the color to use as background structure.
#                          This color will be used in the interspaces between the mustang objects that compose the widget and should
#                          reflects the widget's parent background.
#                          See the **COLOR OPTION** section to know how this list should be composed.
#
#                          Note: The *-shellbackground* is meaningless and will be ignored for canvas that are not scrollable.
#
#                          Note: This is a styleable option.
#
#                                If it's provided     --> Styles, mappings and states events are not allowed to change its value.
#                                                         Only the developer is allowed to do it.
#
#                                If it's not provided --> The widget will follow the **-shellbackground** specified in its style.
#                                                         If there isn't one, the **-shellbackground** of the **Canvas** style
#                                                         will be used instead.
#                                                         The **-shellbackground** will always abide by its mapping values, if any.
#                                                         Styles, mappings and states events are allowed to change its value.
#
#                                                         Note: The **-shellbackground** should change rarely, for example upon
#                                                               an **Activate**/**Deactivate** event.
#
#                          See also **-background**.
#
# **-state**               Specifies the state for the widget.
#                          The canvas widget state acts differently than the other widgets states, because it's a classic widget
#                          and do not support natively any dynamic states.
#                          Changes to the widget 'physical' state affects it's dynamic state.
#                          Allowed states values are **normal** and **disabled**.
#
#                          Canvas items which are disabled will not react to canvas bindings.
#
#                          If not provided, defaults to **normal**.
#
# **-style**               Specifies a custom widget style.
#                          If not provided, defaults to **Canvas**.
#
#                          The *style* provided should already exists at the time the widget is created.
#
#                          See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**           Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                          and **Shift-Tab**).
#
#                          Before setting the focus to a widget, the traversal scripts consult the value of the
#                          *-takefocus* option.
#                             **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                             **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                       and all of its ancestors are mapped.
#
#                          Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                          Note: Widgets will ignore any takefocus values while in the **disabled** state.
#                                The moment the widget becomes **normal** the takefocus specified will be taken into consideration.
#
#                          If not provided, defaults to **0**.
#
# **-width**               Specifies the desired width for the widget in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                          (pixels, points, inches, millimeters and centimeters).
#
#                          If this option is **0** then the widget will assume the minimum width possible that can accomodate
#                          it's content width. Negative values will be ignored.
#
#                          Note that canvases will ignore width of '0'.
#                          This restriction is not necessary on Linux (or BSD), but in order to have the same behavior across
#                          operating systems a width value of '0' will not be accepted for canvases.
#
#                          Note: "WINDOW MANAGERS"
#
#                                    Any toplevel is managed by the *window manager*.
#                                    Any widget's program-requested width may cause it's toplevel to change it's width as well.
#                                    If the toplevel program-requested width is ignored (by the window manager),
#                                    then any widget's program-requested width is ignored too (by Tk that follows the istructions
#                                    received by the window manager).
#
#                                    Some window managers ignores any toplevel program-requested width and demands only to the
#                                    user to manually change the toplevel's width.
#
#                                    Some window managers allows any toplevel program-requested width until the user will
#                                    manually change the toplevel's width.
#                                    Once the user has manually changed the toplevel's width, any subsequent toplevel
#                                    program-requested width will be ignored.
#
#                                    Others window managers allows any toplevel program-requested width in any circumstances.
#
#                                "Tk"
#
#                                    Tk ignores any widget's program-requested width if the **grid** or **pack** geometry manager
#                                    is used within the widget, since these geometry managers will override the widget's width in
#                                    those cases.
#
#                          If not provided, defaults to **10** centimeters.
#
#                          See also **-height**.
#
# **-xscrollcommand**      Specifies the prefix for a command used to communicate with horizontal scrollbars.
#                          When the view in the widget's window changes (or whenever anything else occurs that could change the display
#                          in a scrollbar, such as a change in the total size of the widget's contents), the widget will generate a
#                          Tcl command by concatenating the scroll command and two numbers.
#                          Each of the numbers is a fraction between **0** and **1.0**, which indicates a position in the document.
#                          **0** indicates the beginning of the document, **1.0** indicates the end, **0.333** indicates a position
#                          one third the way through the document, and so on.
#                          The first fraction indicates the first information in the document that is visible in the window, and the
#                          second fraction indicates the information just after the last portion that is visible.
#                          The command is then passed to the Tcl interpreter for execution.
#                          Typically the **-xscrollcommand** option consists of the path name of a scrollbar widget followed by **set**,
#                          e.g. **.x_scrollbar set**: this will cause the scrollbar to be updated whenever the view in the window changes.
#                          If this option is not specified, then no command will be executed.
#
#                          Note: This option is ignored for scrollable canvas (**-scrollable true**) where its value is set to the empty string.
#
#                          If not specified defaults to the empty string.
#
#                          See also **-yscrollcommand**, **-xscrollincrement**, **-yscrollincrement** and **-scrollable**.
#
# **-xscrollincrement**    Specifies an integer indicating the increment for horizontal scrolling.
#                          If the value of this option is greater than zero, the horizontal view in the widget will be constrained
#                          so that the widget *x* coordinate at the left edge of the widget is always an even multiple of
#                          **xScrollIncrement**; furthermore, the units for scrolling (e.g., the change in view when the left and
#                          right arrows of a scrollbar are selected) will also be **xScrollIncrement**. If the value of this option
#                          is zero, then horizontal scrolling is unconstrained.
#
#                          See also **-xscrollcommand**, **-yscrollcommand**, **-yscrollincrement** and **-scrollable**.
#
#                          If not provided, defaults to **0**.
#
# **-yscrollcommand**      Specifies the prefix for a command used to communicate with vertical scrollbars.
#                          When the view in the widget's window changes (or whenever anything else occurs that could change the display
#                          in a scrollbar, such as a change in the total size of the widget's contents), the widget will generate a
#                          Tcl command by concatenating the scroll command and two numbers.
#                          Each of the numbers is a fraction between **0** and **1.0**, which indicates a position in the document.
#                          **0** indicates the beginning of the document, **1.0** indicates the end, **0.333** indicates a position
#                          one third the way through the document, and so on.
#                          The first fraction indicates the first information in the document that is visible in the window, and the
#                          second fraction indicates the information just after the last portion that is visible.
#                          The command is then passed to the Tcl interpreter for execution.
#                          Typically the **-yscrollcommand** option consists of the path name of a scrollbar widget followed by **set**,
#                          e.g. **.y_scrollbar set**: this will cause the scrollbar to be updated whenever the view in the window changes.
#                          If this option is not specified, then no command will be executed.
#
#                          Note: This option is ignored for scrollable canvas (**-scrollable true**) where its value is set to the empty string.
#
#                          If not specified defaults to the empty string.
#
#                          See also **-xscrollcommand**, **-xscrollincrement**, **-yscrollincrement** and **-scrollable**.
#
# **-yscrollincrement**    Specifies an integer indicating the increment for vertical scrolling.
#                          If the value of this option is greater than zero, the vertical view in the widget will be constrained
#                          so that the widget *y* coordinate at the left edge of the widget is always an even multiple of
#                          **xScrollIncrement**; furthermore, the units for scrolling (e.g., the change in view when the top and
#                          bottom arrows of a scrollbar are selected) will also be **yScrollIncrement**. If the value of this option
#                          is zero, then vertical scrolling is unconstrained.
#
#                          See also **-xscrollcommand**, **-yscrollcommand**, **-xscrollincrement** and **-scrollable**.
#
#                          If not provided, defaults to **0**.
#
#### WIDGET COMMAND:
#
# The canvas command creates a new command whose name is the same as the pathname of the canvas's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the canvas widget's pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for canvas widgets:
#
#   *window* **addtag** *tag* *searchSpec* ?*arg* ... *arg*?
#     For each item that meets the constraints specified by searchSpec and the args, add tag to the list of tags associated
#     with the item if it is not already present on that list.
#
#     It is possible that no items will satisfy the constraints given by searchSpec and args, in which case the command has
#     no effect. This command returns an empty string as result.
#
#     *SearchSpec* and arg's may take any of the following forms:
#
#        **above** *tagOrId*
#           Selects the item just after (above) the one given by *tagOrId* in the display list.
#           If *tagOrId* denotes more than one item, then the last (topmost) of these items in the display list is used.
#
#        **all**
#           Selects all the items in the canvas.
#
#        **below** *tagOrId*
#           Selects the item just before (below) the one given by *tagOrId* in the display list.
#           If *tagOrId* denotes more than one item, then the first (lowest) of these items in the display list is used.
#
#        **closest** *x* *y* ?**halo**? ?**start**?
#           Selects the item closest to the point given by *x* and *y*.
#           If more than one item is at the same closest distance (e.g. two items overlap the point), then the top-most of
#           these items (the last one in the display list) is used.
#           If *halo* is specified, then it must be a non-negative value. Any item closer than *halo* to the point is considered
#           to overlap it.
#
#           The *start* argument may be used to step circularly through all the closest items.
#           If *start* is specified, it names an item using a tag or id (if by tag, it selects the first item in the display list
#           with the given tag).
#           Instead of selecting the topmost closest item, this form will select the topmost closest item that is below *start*
#           in the display list; if no such item exists, then the selection behaves as if the start argument had not been specified.
#
#        **enclosed** *x1* *y1* *x2* *y2*
#           Selects all the items completely enclosed within the rectangular region given by *x1*, *y1*, *x2*, and *y2*.
#           *X1* must be no greater than *x2* and *y1* must be no greater than *y2*.
#
#        **overlapping** *x1* *y1* *x2* *y2*
#           Selects all the items that overlap or are enclosed within the rectangular region given by *x1*, *y1*, *x2*, and *y2*.
#           *X1* must be no greater than *x2* and *y1* must be no greater than *y2*.
#
#        **withtag** *tagOrId*
#           Selects all the items given by *tagOrId*.
#
#   *window* **bbox** *tagOrId* ?*tagOrId* ... *tagOrId*?
#     Returns a list with four elements giving an approximate bounding box for all the items named by the *tagOrId* arguments.
#     The list has the form "x1 y1 x2 y2" such that the drawn areas of all the named elements are within the region bounded by
#     *x1* on the left, *x2* on the right, *y1* on the top, and *y2* on the bottom.
#
#     The return value may overestimate the actual bounding box by a few pixels.
#
#     If no items match any of the *tagOrId* arguments or if the matching items have empty bounding boxes (i.e. they have nothing
#     to display) then an empty string is returned.
#
#   *window* **bind** *tagOrId* ?*sequence*? ?*command*?
#     This command associates command with all the items given by *tagOrId* such that whenever the event sequence given by sequence
#     occurs for one of the items the command will be invoked.
#
#     This widget command is similar to the [bind](/wiki/commands/bind.md) command except that it operates on items in a canvas rather
#     than entire widgets.
#     See the **bind** manual entry for complete details on the syntax of sequence and the substitutions performed on command before
#     invoking it.
#
#     If all arguments are specified then a new binding is created, replacing any existing binding for the same sequence and *tagOrId*
#     (if the first character of command is "**+**" then command augments an existing binding rather than replacing it).
#     In this case the return value is an empty string.
#
#     If command is omitted then the command returns the command associated with tagOrId and sequence (an error occurs if there is no
#     such binding). If both command and sequence are omitted then the command returns a list of all the sequences for which bindings
#     have been defined for *tagOrId*.
#
#     The only events for which bindings may be specified are those related to the mouse and keyboard (such as **Enter**, **Leave**,
#     **Button**, **Motion**, and **Key**) or virtual events. The handling of events in canvases uses the current item defined in
#     **ITEM IDS AND TAGS** section below.
#
#     **Enter** and **Leave** events trigger for an item when it becomes the current item or ceases to be the current item; note that
#     these events are different than **Enter** and **Leave** events for windows.
#
#     Mouse-related events are directed to the current item, if any.
#
#     Keyboard-related events are directed to the focus item, if any (see the focus widget command below for more on this).
#     If a virtual event is used in a binding, that binding can trigger only if the virtual event is defined by an underlying mouse-related
#     or keyboard-related event.
#
#     It is possible for multiple bindings to match a particular event.
#     This could occur, for example, if one binding is associated with the item's id and another is associated with one of the item's tags.
#     When this occurs, all of the matching bindings are invoked.
#     A binding associated with the **all** tag is invoked first, followed by one binding for each of the item's *tags* (in order),
#     followed by a binding associated with the item's *id*.
#     If there are multiple matching bindings for a single tag, then only the most specific binding is invoked.
#     A continue command in a binding script terminates that script, and a break command terminates that script and skips any remaining
#     scripts for the event, just as for the bind command.
#
#     If bindings have been created for a canvas window using the bind command, then they are invoked in addition to bindings created for the
#     canvas's items using the bind widget command.
#     The bindings for items will be invoked before any of the bindings for the window as a whole.
#
#   *window* **canvasx** *screenx* ?*gridspacing*?
#     Given a window x-coordinate in the canvas screenx, this command returns the canvas x-coordinate that is displayed at that location.
#     If *gridspacing* is specified, then the canvas coordinate is rounded to the nearest multiple of gridspacing units.
#
#   *window* **canvasy** *screeny* ?*gridspacing*?
#     Given a window y-coordinate in the canvas screeny this command returns the canvas y-coordinate that is displayed at that location.
#     If *gridspacing* is specified, then the canvas coordinate is rounded to the nearest multiple of gridspacing units.
#
#   *window* **cget** option
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the canvas command (See **WIDGET OPTIONS**).
#
#   *window* **configure** **configure** ?*option*? ?*value*? ?*option* *value*? ... ?*option* *value*?
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
#   *window* **coords** *tagOrId* ?*coordList*?
#     Query or modify the coordinates that define an item.
#     If no coordinates are specified, this command returns a list whose elements are the coordinates of the item named by *tagOrId*.
#     If coordinates are specified, then they replace the current coordinates for the named item.
#     If *tagOrId* refers to multiple items, then the first one in the display list is used.
#
#     Note that for rectangles, ovals and arcs the returned list of coordinates has a fixed order, namely the left, top, right and bottom
#     coordinates, which may not be the order originally given.
#     Also the coordinates are always returned in screen units with no units (that is, in pixels).
#     pixels. So if the original coordinates were specified for instance in centimeters or inches, the returned values will nevertheless be in
#
#   *window* **create** *type* *coordList* ?*option* *value*? ... ?*option* *value*?
#     Create a new item in *window* of type *type*.
#     The exact format of the arguments after type depends on type, but usually they consist of the coordinates for one or more points,
#     followed by specifications for zero or more item options.
#     See the subsections on individual item types below for more on the syntax of this command.
#     This command returns the *id* for the new item.
#
#   *window* **dchars** *tagOrId* *first* ?*last*?
#     For each item given by *tagOrId*, delete the characters, or coordinates, in the range given by first and last, inclusive.
#     If some of the items given by *tagOrId* do not support indexing operations then they ignore this operation.
#     Text items interpret first and last as indices to a character, line and polygon items interpret them as indices to a coordinate
#     (an x,y pair).
#     Indices are described in **INDICES** section below. If *last* is omitted, it defaults to **first**.
#     This command returns an empty string.
#
#   *window* **delete** ?*tagOrId* ... *tagOrId*?
#     Delete each of the items given by each *tagOrId*, and return an empty string.
#
#   *window* **dtag** *tagOrId* ?*tagToDelete*?
#     For each of the items given by *tagOrId*, delete the tag given by *tagToDelete* from the list of those associated with the item.
#     If an item does not have the tag *tagToDelete* then the item is unaffected by the command.
#     If *tagToDelete* is omitted then it defaults to *tagOrId*.
#     This command returns an empty string.
#
#   *window* **find** *searchCommand* ?*arg* ... *arg*?
#     This command returns a list consisting of all the items that meet the constraints specified by *searchCommand* and *arg*'s.
#     *SearchCommand* and *arg*s have any of the forms accepted by the **addtag** command.
#     The items are returned in stacking order, with the lowest item first.
#
#   *window* **focus** ?*tagOrId*?
#     Set the keyboard focus for the canvas widget to the item given by *tagOrId*.
#     If *tagOrId* refers to several items, then the focus is set to the first such item in the display list that supports the insertion
#     cursor.
#     If *tagOrId* does not refer to any items, or if none of them support the insertion cursor, then the focus is not changed.
#     If *tagOrId* is an empty string, then the focus item is reset so that no item has the focus.
#     If *tagOrId* is not specified then the command returns the id for the item that currently has the focus, or an empty string if no
#      item has the focus.
#
#     Once the focus has been set to an item, the item will display the insertion cursor and all keyboard events will be directed to
#     that item. The focus item within a canvas and the focus window on the screen (set with the [focus](/wiki/commands/focus.md) command)
#     are totally independent: a given item does not actually have the input focus unless (a) its canvas is the focus window and (b) the
#     item is the focus item within the canvas. In most cases it is advisable to follow the focus widget command with the focus command
#     to set the focus window to the canvas (if it was not there already).
#
#   *window* **gettags** *tagOrId*
#     Return a list whose elements are the tags associated with the item given by *tagOrId*.
#     If *tagOrId* refers to more than one item, then the tags are returned from the first such item in the display list.
#     If *tagOrId* does not refer to any items, or if the item contains no tags, then an empty string is returned.
#
#   *window* **icursor** *tagOrId* *index*
#     Set the position of the insertion cursor for the item(s) given by *tagOrId* to just before the character whose position is given
#     by *index*.
#     If some or all of the items given by *tagOrId* do not support an insertion cursor then this command has no effect on them.
#     See **INDICES** section below for a description of the legal forms for index.
#
#     Note that the insertion cursor is only displayed in an item if that item currently has the keyboard focus (see the focus widget
#     command, above), but the cursor position may be set even when the item does not have the focus.
#
#     This command returns an empty string.
#
#   *window* **identify** **element** *x* *y*
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if the mouse pointer does not
#     lie within any element.
#     *X* and *y* are pixel coordinates relative to the widget.
#
#   *window* **image** *imagename* ?*subsample*? ?*zoom*?
#     Draw the canvas into the Tk photo image named *imagename*.
#     If a *-scrollregion* has been defined then this will be the boundaries of the canvas region drawn and the final size of the
#     photo image.
#     Otherwise the widget width and height with an origin of **0,0** will be the size of the canvas region drawn and the final size
#     of the photo image.
#     Optionally an integer *subsample* factor may be given and the photo image will be reduced in size.
#
#     In addition to the *subsample* an integer *zoom* factor can also be given and the photo image will be enlarged.
#     The image background will be filled with the canvas background colour.
#     The canvas widget does not need to be mapped for this widget command to work, but at least one of it's ancestors must be mapped.
#
#     This command returns an empty string.
#
#   *window* **imove** *tagOrId* *index* *x* *y*
#     This command causes the index'th coordinate of each of the items indicated by *tagOrId* to be relocated to the location (*x*,*y*).
#     Each item interprets index independently according to the rules described in **INDICES** section below.
#     Out of the standard set of items, only line and polygon items may have their coordinates relocated this way.
#
#   *window* **index** *tagOrId* *index*
#     This command returns a decimal string giving the numerical index within *tagOrId* corresponding to *index*.
#     *Index* gives a textual description of the desired position as described in **INDICES** section below.
#     Text items interpret index as an index to a character, line and polygon items interpret it as an index to a coordinate
#     (an x,y pair).
#
#     The return value is guaranteed to lie between 0 and the number of characters, or coordinates, within the item, inclusive.
#     If *tagOrId* refers to multiple items, then the index is processed in the first of these items that supports indexing operations
#     (in display list order).
#
#   *window* **insert** *tagOrId* *beforeThis* *string*
#     For each of the items given by *tagOrId*, if the item supports text or coordinate, insertion then string is inserted into the
#     item's text just before the character, or coordinate, whose index is **beforeThis**.
#     Text items interpret *beforeThis* as an index to a character, line and polygon items interpret it as an index to a coordinate
#     (an x,y pair).
#     For lines and polygons the string must be a valid coordinate sequence.
#
#     See **INDICES** section below for information about the forms allowed for *beforeThis*.
#
#     This command returns an empty string.
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
#   *window* **itemcget** *tagOrId* *option*
#     Returns the current value of the configuration option for the item given by *tagOrId* whose name is *option*.
#     This command is similar to the **cget** widget command except that it applies to a particular item rather than the widget
#     as a whole.
#     *Option* may have any of the values accepted by the create widget command when the item was created.
#     If *tagOrId* is a tag that refers to more than one item, the first (lowest) such item is used.
#
#   *window* **itemconfigure** *tagOrId* ?*option*? ?*value*? ?*option* *value*? ... ?*option* *value*?
#     This command is similar to the configure widget command except that it modifies item-specific options for the items given
#     by *tagOrId* instead of modifying options for the overall canvas widget.
#     If no option is specified, returns a list describing all of the available options for the first item given by *tagOrId*
#     (see [Tk_ConfigureInfo](https://www.tcl-lang.org/man/tcl9.0/TkLib/ConfigWidg.html) for information on the format of this list).
#     If *option* is specified with no value, then the command returns a list describing the one named *option* (this list will be
#     identical to the corresponding sublist of the value returned if no option is specified).
#     If one or more option-value pairs are specified, then the command modifies the given widget option(s) to have the given value(s)
#     in each of the items given by tagOrId; in this case the command returns an empty string.
#     The options and values are the same as those permissible in the create widget command when the item(s) were created; see the
#     sections describing individual item types below for details on the legal options.
#
#   *window* **lower** *tagOrId* ?*belowThis*?
#     Move all of the items given by *tagOrId* to a new position in the display list just before the item given by *belowThis*.
#     If *tagOrId* refers to more than one item then all are moved but the relative order of the moved items will not be changed.
#     *BelowThis* is a tag or id; if it refers to more than one item then the first (lowest) of these items in the display list is
#     used as the destination location for the moved items.
#     Note that this command has no effect on window items.
#     Window items always obscure other item types, and the stacking order of window items is determined by the raise command and
#     lower command, not the raise widget command and lower widget command for canvases.
#
#     This command returns an empty string.
#
#   *window* **move** *tagOrId* *xAmount* *yAmount*
#     Move each of the items given by *tagOrId* in the canvas coordinate space by adding *xAmount* to the x-coordinate of each point
#     associated with the item and *yAmount* to the y-coordinate of each point associated with the item.
#
#     This command returns an empty string.
#
#   *window* **moveto** *tagOrId* *xPos* *yPos*
#     Move the items given by *tagOrId* in the canvas coordinate space so that the first coordinate pair (the upper-left corner of
#     the bounding box) of the first item (the lowest in the display list) with tag *tagOrId* is located at position (*xPos*,*yPos*).
#     *xPos* and *yPos* may be the empty string, in which case the corresponding coordinate will be unchanged.
#     All items matching *tagOrId* remain in the same positions relative to each other.
#
#     This command returns an empty string.
#
#   *window* **postscript** ?*option* *value*? ... ?*option* *value*?
#     Generate a Postscript representation for part or all of the canvas.
#     If the **-file** option is specified then the Postscript is written to a file and an empty string is returned; otherwise the
#     Postscript is returned as the result of the command.
#     If the interpreter that owns the canvas is marked as safe, the operation will fail because safe interpreters are not allowed
#     to write files.
#     If the **-channel** option is specified, the argument denotes the name of a channel already opened for writing.
#     The Postscript is written to that channel, and the channel is left open for further writing at the end of the operation.
#     The Postscript is created in Encapsulated Postscript form using version 3.0 of the Document Structuring Conventions.
#
#     Note: by default Postscript is only generated for information that appears in the canvas's window on the screen.
#           If the canvas is freshly created it may still have its initial size of 1x1 pixel so nothing will appear in the Postscript.
#           To get around this problem either invoke the update command to wait for the canvas window to reach its final size, or
#           else use the **-width** and **-height** options to specify the area of the canvas to print.
#           The option-value argument pairs provide additional information to control the generation of Postscript.
#
#     The following options are supported:
#
#         **-channel** *channelName*
#           Specifies the name of the channel to which to write the Postscript.
#           If this option and the **-file** option are not specified then the Postscript is returned as the result of the command.
#
#         **-colormap** *varName*
#           *VarName* must be the name of an array variable that specifies a color mapping to use in the Postscript.
#           Each element of *varName* must consist of Postscript code to set a particular color value (e.g. “1.0 1.0 0.0 setrgbcolor”).
#           When outputting color information in the Postscript, Tk checks to see if there is an element of varName with the same name
#           as the color. If so, Tk uses the value of the element as the Postscript command to set the color.
#
#           If this option has not been specified, or if there is no entry in *varName* for a given color, then Tk uses the red, green,
#           and blue intensities from the X color.
#
#         **-colormode** *mode*
#           Specifies how to output color information. *Mode* must be either **color** (for full color output), **gray** (convert all
#           colors to their gray-scale equivalents) or **mono** (convert all colors to black or white).
#
#         **-file** *fileName*
#           Specifies the name of the file in which to write the Postscript.
#           If this option and the **-channel** option are not specified then the Postscript is returned as the result of the command.
#
#         **-fontmap** *varName*
#           *VarName* must be the name of an array variable that specifies a font mapping to use in the Postscript.
#           Each element of *varName* must consist of a Tcl list with two elements, which are the name and point size of a Postscript
#           font.
#           When outputting Postscript commands for a particular font, Tk checks to see if varName contains an element with the same
#           name as the font. If there is such an element, then the font information contained in that element is used in the Postscript.
#           Otherwise Tk attempts to guess what Postscript font to use.
#           Tk's guesses generally only work for well-known fonts such as Times and Helvetica and Courier, and only if the X font name
#           does not omit any dashes up through the point size.
#
#           For example, -*-Courier-Bold-R-Normal--*-120-* will work but *Courier-Bold-R-Normal*120* will not; Tk needs the dashes to
#           parse the font name).
#
#         **-height** *size*
#           Specifies the height of the area of the canvas to print.
#           Defaults to the height of the canvas window.
#
#         **-pageanchor** *anchor*
#           Specifies which point of the printed area of the canvas should appear over the positioning point on the page (which is given
#           by the **-pagex** and **-pagey** options).
#
#           For example, **-pageanchor n** means that the top center of the area of the canvas being printed (as it appears in the canvas
#           window) should be over the positioning point.
#
#           Defaults to **center**.
#
#         **-pageheight** *size*
#           Specifies that the Postscript should be scaled in both x and y so that the printed area is size high on the Postscript page.
#           *Size* consists of a floating-point number followed by **c** for centimeters, **i** for inches, **m** for millimeters, or **p**
#           or nothing for printer's points (1/72 inch).
#           Defaults to the height of the printed area on the screen.
#           If both **-pageheight** and **-pagewidth** are specified then the scale factor from **-pagewidth** is used (non-uniform scaling
#           is not implemented).
#
#         **-pagewidth** *size*
#           Specifies that the Postscript should be scaled in both x and y so that the printed area is size wide on the Postscript page.
#           *Size* has the same form as for **-pageheight**.
#           Defaults to the width of the printed area on the screen.
#           If both **-pageheight** and **-pagewidth** are specified then the scale factor from **-pagewidth** is used (non-uniform scaling
#           is not implemented).
#
#         **-pagex** *position*
#           *Position* gives the x-coordinate of the positioning point on the Postscript page, using any of the forms allowed for
#           **-pagewidth**. Used in conjunction with the **-pagey** and **-pageanchor** options to determine where the printed area
#           appears on the Postscript page.
#
#           Defaults to the center of the page.
#
#         **-pagey** *position*
#           *Position* gives the y-coordinate of the positioning point on the Postscript page, using any of the forms allowed for
#           **-pageheight**. Used in conjunction with the **-pagex** and **-pageanchor** options to determine where the printed area
#           appears on the Postscript page.
#
#           Defaults to the center of the page.
#
#         **-rotate** *boolean*
#           *Boolean* specifies whether the printed area is to be rotated 90 degrees.
#           In non-rotated output the x-axis of the printed area runs along the short dimension of the page ("portrait" orientation);
#           in rotated output the x-axis runs along the long dimension of the page ("landscape" orientation).
#
#           Defaults to non-rotated.
#
#         **-width** *size*
#           Specifies the width of the area of the canvas to print.
#           Defaults to the width of the canvas window.
#
#         **-x** *position*
#           Specifies the x-coordinate of the left edge of the area of the canvas that is to be printed, in canvas coordinates, not
#           window coordinates.
#           Defaults to the coordinate of the left edge of the window.
#
#         **-y** *position*
#           Specifies the y-coordinate of the top edge of the area of the canvas that is to be printed, in canvas coordinates, not
#           window coordinates.
#           Defaults to the coordinate of the top edge of the window.
#
#   *window* **raise** *tagOrId* ?*aboveThis*?
#     Move all of the items given by *tagOrId* to a new position in the display list just after the item given by *aboveThis*.
#     If *tagOrId* refers to more than one item then all are moved but the relative order of the moved items will not be changed.
#     *AboveThis* is a tag or id; if it refers to more than one item then the last (topmost) of these items in the display list
#     is used as the destination location for the moved items.
#
#     This command returns an empty string.
#
#     Note this this command has no effect on window items.
#     Window items always obscure other item types, and the stacking order of window items is determined by the raise command and
#     lower command, not the raise widget command and lower widget command for canvases.
#
#   *window* **rchars** *tagOrId* *first* *last* *string*
#     This command causes the text or coordinates between *first* and *last* for each of the items indicated by *tagOrId* to be
#     replaced by string.
#     Each item interprets *first* and *last* independently according to the rules described in **INDICES** section below.
#     Out of the standard set of items, text items support this operation by altering their text as directed, and line and polygon
#     items support this operation by altering their coordinate list (in which case string should be a list of coordinates to use
#     as a replacement).
#     The other items ignore this operation.
#
#   *window* **rotate** *tagOrId* *xOrigin* *yOrigin* *angle*
#     Rotate the coordinates of all of the items given by *tagOrId* in canvas coordinate space.
#     *XOrigin* and *yOrigin* identify the origin for the rotation operation and angle identifies the amount to rotate the coordinates
#     anticlockwise, in degrees (negative values rotate clockwise).
#
#     This command returns an empty string.
#
#     Implementation note: not all item types work the same with rotations. In particular, bitmap, image, text and window items only
#     rotate their anchor points and do not rotate the items themselves about those points, and the arc, oval and rectangle types
#     rotate about a computed center point instead of moving the bounding box coordinates directly.
#
#     Some items (currently arc and text) have angles in their options; this command does not affect those options.
#
#   *window* **scale** *tagOrId* *xOrigin* *yOrigin* *xScale* *yScale*
#     Rescale the coordinates of all of the items given by *tagOrId* in canvas coordinate space.
#     *XOrigin* and *yOrigin* identify the origin for the scaling operation and *xScale* and *yScale* identify the scale factors for
#     x- and y-coordinates, respectively (a scale factor of 1.0 implies no change to that coordinate).
#     For each of the points defining each item, the x-coordinate is adjusted to change the distance from *xOrigin* by a factor of
#     *xScale*. Similarly, each y-coordinate is adjusted to change the distance from *yOrigin* by a factor of *yScale*.
#
#     This command returns an empty string.
#
#     Note that some items have only a single pair of coordinates (e.g., text, images and windows) and so scaling of them by this
#     command can only move them around.
#
#   *window* **scan** *option* *args*
#     This command is used to implement scanning on canvases. It has two forms, depending on option:
#
#       *window* **scan** **mark** *x* *y*
#         Records x and y and the canvas's current view; used in conjunction with later scan dragto commands.
#         Typically this command is associated with a mouse button press in the widget and *x* and *y* are the coordinates of the mouse.
#         It returns an empty string.
#
#       *window* **scan** **dragto** *x* *y* ?*gain*?
#         This command computes the difference between its *x* and *y* arguments (which are typically mouse coordinates) and the x and
#          y arguments to the last **scan mark** command for the widget.
#         It then adjusts the view by gain times the difference in coordinates, where gain defaults to **10**.
#         This command is typically associated with mouse motion events in the widget, to produce the effect of dragging the canvas at
#         high speed through its window.
#         The return value is an empty string.
#
#   *window* **select** *option* ?*tagOrId* *arg*?
#     Manipulates the selection in one of several ways, depending on option.
#     The command may take any of the forms described below.
#     In all of the descriptions below, *tagOrId* must refer to an item that supports indexing and selection; if it refers to multiple
#     items then the first of these that supports indexing and the selection is used.
#     Index gives a textual description of a position within *tagOrId*, as described in **INDICES** section below.
#
#       *window* **select** **adjust** *tagOrId* *index*
#         Locate the end of the selection in *tagOrId* nearest to the character given by *index*, and adjust that end of the selection
#         to be at *index* (i.e. including but not going beyond *index*).
#         The other end of the selection is made the anchor point for future select to commands.
#         If the selection is not currently in *tagOrId* then this command behaves the same as the select to widget command.
#         Returns an empty string.
#
#       *window* **select** **clear**
#         Clear the selection if it is in this widget.
#         If the selection is not in this widget then the command has no effect.
#         Returns an empty string.
#
#       *window* **select** **from** *tagOrId* *index*
#         Set the selection anchor point for the widget to be just before the character given by *index* in the item given by *tagOrId*.
#         This command does not change the selection; it just sets the fixed end of the selection for future select to commands.
#         Returns an empty string.
#
#       *window* **select** **item**
#         Returns the *id* of the selected item, if the selection is in an item in this canvas.
#         If the selection is not in this canvas then an empty string is returned.
#
#       *window* **select** **to** *tagOrId* *index*
#         Set the selection to consist of those characters of *tagOrId* between the selection anchor point and *index*.
#         The new selection will include the character given by *index*; it will include the character given by the anchor point only
#         if index is greater than or equal to the anchor point.
#         The anchor point is determined by the most recent select adjust or select from command for this widget.
#         If the selection anchor point for the widget is not currently in *tagOrId*, then it is set to the same character given by index.
#         Returns an empty string.
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
#   *window* **type** *tagOrId*
#     Returns the type of the item given by *tagOrId*, such as rectangle or text.
#     If *tagOrId* refers to more than one item, then the type of the first item in the display list is returned.
#     If *tagOrId* does not refer to any items at all then an empty string is returned.
#
#   *window* **xview** ?args?
#     *window* **xview**
#         Returns a list containing two elements.
#         Each element is a real fraction between **0** and **1.0**; together they describe the horizontal span
#         that is visible in the window.
#
#      *window* **xview** **moveto** *fraction*
#         Adjusts the view in the window so that *fraction* of the total width of the widget is off-screen to the left.
#         *Fraction* must be a fraction between **0** and **1.0**.
#
#      *window* **xview** **scroll** *number* *what*
#         This command shifts the view in the window left or right according to *number* and *what*.
#
#         *Number* must be an integer or a float, but not **0**.
#         If *number* is negative then information farther to the left becomes visible, if it is positive then information
#         farther to the right becomes visible.
#         If **0** is provided, the command will be ignored by mustang.
#
#         *what* must be either **pages** or **units**.
#         If *what* is **pages** then the view adjusts in units of nine-tenths of the *window*'s width.
#         If *what* is **units** then if *xscrollincrement* is greater than **0**, the horizontal view adjusts in units
#         of *xscrollincrement*; if *xscrollincrement* is lesser than or equal to **0**, the horizontal view adjusts in
#         units of one-tenths of the *window*'s width.
#
#   *window* **yview** ?args?
#     *window* **yview**
#        Returns a list containing two elements.
#        Each element is a real fraction between **0** and **1.0**; together they describe the vertical span that
#        is visible in the window.
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
#### DISPLAY LIST:
#
# The items in a canvas are ordered for purposes of display, with the first item in the display list being displayed first,
# followed by the next item in the list, and so on.
# Items later in the display list obscure those that are earlier in the display list and are sometimes referred to as being
# "on top" of earlier items.
# When a new item is created it is placed at the end of the display list, on top of everything else.
# Widget commands may be used to re-arrange the order of the display list.
#
# Window items are an exception to the above rules.
# The underlying window systems require them always to be drawn on top of other items.
# In addition, the stacking order of window items is not affected by any of the canvas widget commands; you must use the Tk
# raise command and lower command instead.
#
##### ITEM IDS AND TAGS:
#
# Items in a canvas widget may be named in either of two ways: by *id* or by *tag*.
# Each item has a unique identifying number, which is assigned to that item when it is created.
# The *id* of an item never changes and id numbers are never re-used within the lifetime of a canvas widget.
#
# Each item may also have any number of tags associated with it.
# A *tag* is just a string of characters, and it may take any form except that of an integer.
# For example, "x123" is OK but "123" is not. The same tag may be associated with many different items.
# This is commonly done to group items in various interesting ways; for example, all selected items might be given the tag
# "selected".
#
# The tag **all** is implicitly associated with every item in the canvas; it may be used to invoke operations on all the
# items in the canvas.
#
# The tag **current** is managed automatically by Tk; it applies to the *current item*, which is the topmost item whose
# drawn area covers the position of the mouse cursor (different item types interpret this in varying ways; see the individual
# item type documentation for details).
# If the mouse is not in the canvas widget or is not over an item, then no item has the current tag.
#
# When specifying items in canvas widget commands, if the specifier is an integer then it is assumed to refer to the single
# item with that id. If the specifier is not an integer, then it is assumed to refer to all of the items in the canvas that
# have a tag matching the specifier. The symbol *tagOrId* is used below to indicate that an argument specifies either an id
# that selects a single item or a tag that selects zero or more items.
#
# *tagOrId* may contain a logical expressions of tags by using operators: "**&&**", "**||**", "**^**", "**!**", and parenthesized
# subexpressions. For example:
#
#    .c find withtag {(a&&!b)||(!a&&b)}
#
# or equivalently:
#
#    .c find withtag {a^b}
#
# will find only those items with either "a" or "b" tags, but not both.
#
# Some widget commands only operate on a single item at a time; if *tagOrId* is specified in a way that names multiple items,
# then the normal behavior is for the command to use the first (lowest) of these items in the display list that is suitable
# for the command. Exceptions are noted in the widget command descriptions below.
#
#### COORDINATES:
#
# All coordinates related to canvases are stored as floating-point numbers.
# Coordinates and distances are specified in screen units, which are floating-point numbers optionally followed by one of
# several letters.
# If no letter is supplied then the distance is in pixels. If the letter is **m** then the distance is in millimeters on
# the screen; if it is **c** then the distance is in centimeters; **i** means inches, and **p** means printers points (1/72 inch).
# Larger y-coordinates refer to points lower on the screen; larger x-coordinates refer to points farther to the right.
# Coordinates can be specified either as an even number of parameters, or as a single list parameter containing an even number
# of x and y coordinate values.
#
#### TRANSFORMATIONS:
#
# Normally the origin of the canvas coordinate system is at the upper-left corner of the window containing the canvas.
# It is possible to adjust the origin of the canvas coordinate system relative to the origin of the window using the xview and
# yview widget commands; this is typically used for scrolling.
# Canvases do not support scaling or rotation of the canvas coordinate system relative to the window coordinate system.
#
# Individual items may be moved, scaled or rotated using widget commands described below.
#
# Note that the default origin of the canvas's visible area is coincident with the origin for the whole window as that makes
# bindings using the mouse position easier to work with; you only need to use the **canvasx** and **canvasy** widget commands
# if you adjust the origin of the visible area.
# However, this also means that any window border (as controlled by the **-borderwidth** option) must be taken into account
# before you get to the visible area of the canvas.
#
#### INDICES:
#
# Text items support the notion of an index for identifying particular positions within the item.
# In a similar fashion, line and polygon items support index for identifying, inserting and deleting subsets of their coordinates.
# Indices are used for commands such as inserting or deleting a range of characters or coordinates, and setting the insertion
# cursor position. An index may be specified in any of a number of ways, and different types of items may support different forms
# for specifying indices.
# Text items support the following forms for an index; if you define new types of text-like items, it would be advisable to support
# as many of these forms as practical.
# Note that it is possible to refer to the character just after the last one in the text item; this is necessary for such tasks
# as inserting new text at the end of the item.
# Lines and Polygons do not support the insertion cursor and the selection.
# Their indices are supposed to be even always, because coordinates always appear in pairs.
#
#   *number*
#       A decimal number giving the position of the desired character within the text item.
#       **0** refers to the first character, **1** to the next character, and so on.
#       If indexes are odd for lines and polygons, they will be automatically decremented by one.
#       A negative number is treated as if it were zero, and a number greater than the length of the text item is treated as if
#       it were equal to the length of the text item.
#       For polygons, negative numbers or numbers greater than the length of the coordinate list will be adjusted by adding or
#       subtracting the length until the result is between zero and the length, inclusive.
#
#   **end**
#       Refers to the character or coordinate just after the last one in the item (same as the number of characters or coordinates
#       in the item).
#
#   **insert**
#       Refers to the character just before which the insertion cursor is drawn in this item.
#       Not valid for lines and polygons.
#
#   **sel.first**
#       Refers to the first selected character in the item.
#       If the selection is not in this item then this form is illegal.
#
#   **sel.last**
#       Refers to the last selected character in the item.
#       If the selection is not in this item then this form is illegal.
#
#   **@***x,y*
#       Refers to the character or coordinate at the point given by *x* and *y*, where x and y are specified in the coordinate system
#       of the canvas. If x and y lie outside the coordinates covered by the text item, then they refer to the first or last character
#       in the line that is closest to the given point.
#
#### DASH PATTERNS:
#
# Many items support the notion of a dash pattern for outlines.
# The first possible syntax is a list of integers. Each element represents the number of pixels of a line segment.
# Only the odd segments are drawn using the "outline" color. The other segments are drawn transparent.
#
# The second possible syntax is a character list containing only 5 possible characters "**.,-_ **".
# The space can be used to enlarge the space between other line elements, and cannot occur as the first position in the string.
# Some examples:
#
#    -dash .     → -dash {2 4}
#    -dash -     → -dash {6 4}
#    -dash -.    → -dash {6 4 2 4}
#    -dash -..   → -dash {6 4 2 4 2 4}
#    -dash {. }  → -dash {2 8}
#    -dash ,     → -dash {4 4}
#
# The main difference of this syntax with the previous is that it is shape-conserving.
# This means that all values in the dash list will be multiplied by the line width before display.
# This assures that "." will always be displayed as a dot and "-" always as a dash regardless of the line width.
#
# On systems which support only a limited set of dash patterns, the dash pattern will be displayed as the closest dash pattern that
# is available. For example, on Windows only the first 4 of the above examples are available. The last 2 examples will be displayed
# identically to the first one.
#
#### OVERVIEW OF ITEM TYPES:
#
# The sections below describe the various types of items supported by canvas widgets.
# Each item type is characterized by two things: first, the form of the create command used to create instances of the type; and
# second, a set of configuration options for items of that type, which may be used in the create and itemconfigure widget commands.
# Most items do not support indexing or selection or the commands related to them, such as index and insert.
# Where items do support these facilities, it is noted explicitly in the descriptions below.
# At present, text, line and polygon items provide this support.
# For lines and polygons the indexing facility is used to manipulate the coordinates of the item.
#
###### COMMON ITEM OPTIONS:
#
# Many items share a common set of options.
# These options are explained here, and then referred to be each widget type for brevity.
#
#   **-anchor** *anchorPos*
#     AnchorPos tells how to position the item relative to the positioning point for the item; it may have any of the forms accepted
#     by [Tk_GetAnchor](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetAnchor.html).
#     For example, if *anchorPos* is **center** then the item is centered on the point; if *anchorPos* is **n** then the item will be
#     drawn so that its top center point is at the positioning point.
#     This option defaults to **center**.
#
#   **-dash**         *pattern*
#   **-activedash**   *pattern*
#   **-disableddash** *pattern*
#       These options specify dash patterns for the normal, active state, and disabled state of an item.
#       *Pattern* may have any of the forms accepted by [Tk_GetDash](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetDash.html).
#       If the dash options are omitted then the default is a solid outline.
#       See **DASH PATTERNS** for more information.
#
#   **-dashoffset** *offset*
#       The starting offset in pixels into the pattern provided by the **-dash** option.
#       **-dashoffset** is ignored if there is no **-dash** pattern.
#       The *offset* may have any of the forms described in the **COORDINATES** section above.
#
#   **-fill**         *color*
#   **-activefill**   *color*
#   **-disabledfill** *color*
#       These options specify the color to be used to fill item's area.
#       In its normal, active, and disabled states. The even-odd fill rule is used.
#       *Color* may have any of the forms accepted by mustang.
#       For the line item, it specifies the color of the line drawn.
#       For the text item, it specifies the foreground color of the text.
#       If *color* is an empty string (the default for all canvas items except line and text), then the item will not be filled.
#
#   **-outline**         *color*
#   **-activeoutline**   *color*
#   **-disabledoutline** *color*
#       These options specify the color that should be used to draw the outline of the item in its normal, active and disabled states.
#       *Color* may have any of the forms accepted by mustang.
#       If *color* is specified as an empty string then no outline is drawn for the item.
#
#   **-offset** *offset*
#       Specifies the offset of stipples. The *offset* value can be of the form **x**,**y** or *side*, where side can be **n**, **ne**,
#       **e**, **se**, **s**, **sw**, **w**, **nw**, or **center**.
#       In the first case the origin is the origin of the toplevel of the current window.
#       For the canvas itself and canvas objects the origin is the canvas origin, but putting **#** in front of the coordinate pair
#       indicates using the toplevel origin instead.
#       For canvas objects, the **-offset** option is used for stippling as well.
#       For the line and polygon canvas items you can also specify an index as argument, which connects the stipple origin to one
#       of the coordinate points of the line/polygon.
#       *Note that stipple offsets are only supported on X11; they are silently ignored on other platforms*.
#
#   **-outlinestipple**         *bitmap*
#   **-activeoutlinestipple**   *bitmap*
#   **-disabledoutlinestipple** *bitmap*
#       These options specify stipple patterns that should be used to draw the outline of the item in its normal, active and disabled
#       states.
#       Indicates that the outline for the item should be drawn with a stipple pattern; *bitmap* specifies the stipple pattern to use,
#       in any of the forms accepted by [Tk_GetBitmap](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetBitmap.html).
#       If the **-outline** option has not been specified then this option has no effect.
#       If *bitmap* is an empty string (the default), then the outline is drawn in a solid fashion.
#       *Note that stipples are not well supported on platforms that do not use X11 as their drawing API*.
#
#   **-outlineoffset** *offset*
#       Specifies the *offset* of the stipple pattern used for outlines, in the same way that the **-outline** option controls fill
#       stipples (see the **-outline** option for a description of the syntax of offset).
#
#   **-stipple**         *bitmap*
#   **-activestipple**   *bitmap*
#   **-disabledstipple** *bitmap*
#       These options specify stipple patterns that should be used to fill the item in its normal, active and disabled states.
#       *Bitmap* specifies the stipple pattern to use, in any of the forms accepted by [Tk_GetBitmap](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetBitmap.html).
#       If the **-fill** option has not been specified then this option has no effect.
#       If *bitmap* is an empty string (the default), then filling is done in a solid fashion.
#       For the text item, it affects the actual text.
#       *Note that stipples are not well supported on platforms that do not use X11 as their drawing API*.
#
#   **-state** *state*
#       This allows an item to override the canvas widget's global state option.
#       Allowed values are: *normal*, *disabled* or *hidden*.
#
#   **-tags** *tagList*
#       Specifies a set of tags to apply to the item. TagList consists of a list of tag names, which replace any existing tags for
#       the item. *TagList* may be an empty list.
#
#   **-width**         *outlineWidth*
#   **-activewidth**   *outlineWidth*
#   **-disabledwidth** *outlineWidth*
#       These options specify the width of the outline to be drawn around the item's region, in its normal, active and disabled
#       states.
#       *OutlineWidth* may be in any of the forms described in the **COORDINATES** section above.
#       If the **-outline** option has been specified as an empty string then this option has no effect.
#       This option defaults to **1.0**. For arcs, wide outlines will be drawn centered on the edges of the arc's region.
#
#### STANDARD ITEM TYPES:
#
###### ARC ITEMS:
#
# Items of type arc appear on the display as arc-shaped regions.
# An arc is a section of an oval delimited by two angles (specified by either the **-start** and **-extent** options or the
# **-height** option) and displayed in one of several ways (specified by the -style option).
# Arcs are created with the following form:
#
#    *window* **create** **arc** *coordList* ?*option* *value*? ... ?*option* *value*?
#
# The argument *coordList* give the coordinates of two diagonally opposite corners of a rectangular region enclosing the oval
# that defines the arc (except when **-height** is specified - see below).
# After the coordinates there may be any number of option-value pairs, each of which sets one of the configuration options
# for the item.
# These same option-value pairs may be used in itemconfigure widget commands to change the item's configuration.
# An arc item becomes the current item when the mouse pointer is over any part that is painted or (when fully transparent)
# that would be painted if both the **-fill** and **-outline** options were non-empty.
#
# The following standard options are supported by arcs:
#
#   -dash
#   -activedash
#   -disableddash
#   -dashoffset
#   -fill
#   -activefill
#   -disabledfill
#   -offset
#   -outline
#   -activeoutline
#   -disabledoutline
#   -outlineoffset
#   -outlinestipple
#   -activeoutlinestipple
#   -disabledoutlinestipple
#   -stipple
#   -activestipple
#   -disabledstipple
#   -state
#   -tags
#   -width
#   -activewidth
#   -disabledwidth
#
# The following extra options are supported for arcs:
#
#   **-extent** *degrees*
#       Specifies the size of the angular range occupied by the arc.
#       The arc's range extends for degrees *degrees* counter-clockwise from the starting angle given by the **-start** option.
#       *Degrees* may be negative.
#       If it is greater than 360 or less than -360, then *degrees* modulo 360 is used as the extent.
#
#   **-start** *degrees*
#       Specifies the beginning of the angular range occupied by the arc.
#       *Degrees* is given in units of degrees measured counter-clockwise from the 3-o'clock position; it may be either positive
#       or negative.
#
#   **-height** *distance*
#       Provides a shortcut for creating a circular arc segment by defining the distance of the mid-point of the arc from its chord.
#       When this option is used the coordinates are interpreted as the start and end coordinates of the chord, and the options
#       **-start** and **-extent** are ignored. The value of *distance* has the following meaning:
#
#           distance > 0 creates a clockwise arc
#           distance < 0 creates an counter-clockwise arc
#           distance = 0 creates an arc as if this option had not been specified
#
#       If you want the arc to have a specific radius, r, use the formula:
#
#           distance = r ± sqrt(r**2 - (chordLength / 2)**2)
#
#       choosing the minus sign for the minor arc and the plus sign for the major arc.
#
#       Note that **itemcget -height** always returns **0** so that introspection code can be kept simple.
#
#   **-style** *type*
#       Specifies how to draw the arc. If type is **pieslice** (the default) then the arc's region is defined by a section of the
#       oval's perimeter plus two line segments, one between the center of the oval and each end of the perimeter section.
#       If type is **chord** then the arc's region is defined by a section of the oval's perimeter plus a single line segment
#       connecting the two end points of the perimeter section.
#       If type is **arc** then the arc's region consists of a section of the perimeter alone.
#       In this last case the **-fill** option is ignored.
#
###### BITMAP ITEMS:
#
# Items of type bitmap appear on the display as images with two colors, foreground and background.
# Bitmaps are created with the following form:
#
#    *window* **create** **bitmap** *coordList* ?*option* *value*? ... ?*option* *value*?
#
# The argument *coordList* (which must have two elements) specify the coordinates of a point used to position the bitmap on the
# display, as controlled by the **-anchor** option.
# After the coordinates there may be any number of option-value pairs, each of which sets one of the configuration options
# for the item.
# These same option-value pairs may be used in itemconfigure widget commands to change the item's configuration.
# A bitmap item becomes the current item when the mouse pointer is over any part of its bounding box.
#
# The following standard options are supported by bitmaps:
#
#   -anchor
#   -state
#   -tags
#
# The following extra options are supported for bitmaps:
#
#   **-background**         *color*
#   **-activebackground**   *color*
#   **-disabledbackground** *color*
#       Specifies the color to use for each of the bitmap's "0" valued pixels in its normal, active and disabled states.
#       *Color* may have any of the forms accepted by mustang.
#       If this option is not specified, or if it is specified as an empty string, then nothing is displayed where the
#       bitmap pixels are 0; this produces a transparent effect.
#
#   **-bitmap**         *bitmap*
#   **-activebitmap**   *bitmap*
#   **-disabledbitmap** *bitmap*
#       These options specify the bitmaps to display in the item in its normal, active and disabled states.
#       *Bitmap* may have any of the forms accepted by [Tk_GetBitmap](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetBitmap.html).
#
#   **-foreground**         *color*
#   **-activeforeground**   *color*
#   **-disabledforeground** *color*
#       These options specify the color to use for each of the bitmap's "1" valued pixels in its normal, active and disabled
#       states.
#       *Color* may have any of the forms accepted by mustang.
#
###### IMAGE ITEMS:
#
# Items of type image are used to display images on a canvas.
# Images are created with the following form:
#
#    *window* **create** **image** *coordList* ?*option* *value*? ... ?*option* *value*?
#
# The argument *coordList* specify the coordinates of a point used to position the image on the display, as controlled by the
# *-anchor* option.
# After the coordinates there may be any number of option-value pairs, each of which sets one of the configuration options
# for the item.
# These same option-value pairs may be used in itemconfigure widget commands to change the item's configuration.
# An image item becomes the current item when the mouse pointer is over any part of its bounding box.
#
# The following standard options are supported by images:
#
#   -anchor
#   -state
#   -tags
#
# The following extra options are supported for images:
#
#   **-image**         *name*
#   **-activeimage**   *name*
#   **-disabledimage** *name*
#       Specifies the name of the images to display in the item in is normal, active and disabled states.
#       This image must have been created previously with the image create command.
#
###### LINE ITEMS:
#
# Items of type line appear on the display as one or more connected line segments or curves.
# Line items support coordinate indexing operations using the dchars, index and insert widget commands.
# Lines are created with the following form:
#
#    *window* **create** **line** *coordList* ?*option* *value*? ... ?*option* *value*?
#
# The argument *coordList* give the coordinates for a series of two or more points that describe a series of connected
# line segments.
# After the coordinates there may be any number of option-value pairs, each of which sets one of the configuration options
# for the item.
# These same option-value pairs may be used in itemconfigure widget commands to change the item's configuration.
# A line item is the current item whenever the mouse pointer is over any segment of the line, whether drawn or not and
# whether or not the line is smoothed.
#
# The following standard options are supported by lines:
#
#   -dash
#   -activedash
#   -disableddash
#   -dashoffset
#   -fill
#   -activefill
#   -disabledfill
#   -stipple
#   -activestipple
#   -disabledstipple
#   -state
#   -tags
#   -width
#   -activewidth
#   -disabledwidth
#
# The following extra options are supported for lines:
#
#   **-arrow** *where*
#       Indicates whether or not arrowheads are to be drawn at one or both ends of the line.
#       *Where* must have one of the values **none** (for no arrowheads), **first** (for an arrowhead at the first point
#       of the line), **last** (for an arrowhead at the last point of the line), or **both** (for arrowheads at both ends).
#
#       This option defaults to **none**.
#
#       When requested to draw an arrowhead, Tk internally adjusts the corresponding line end point so that the rendered line
#       ends at the neck of the arrowhead rather than at its tip so that the line doesn't extend past the edge of the arrowhead.
#       This may trigger a Leave event if the mouse is hovering this line end.
#       Conversely, when removing an arrowhead Tk adjusts the corresponding line point the other way round, which may trigger an
#       **Enter** event.
#
#   **-arrowshape** *shape*
#       This option indicates how to draw arrowheads.
#       The *shape* argument must be a list with three elements, each specifying a distance in any of the forms described in the
#       **COORDINATES** section above.
#       The first element of the list gives the distance along the line from the neck of the arrowhead to its tip.
#       The second element gives the distance along the line from the trailing points of the arrowhead to the tip, and the third
#       element gives the distance from the outside edge of the line to the trailing points.
#       If this option is not specified then Tk picks a "reasonable" shape.
#
#   **-capstyle** *style*
#       Specifies the ways in which caps are to be drawn at the endpoints of the line.
#       *Style* may have any of the forms accepted by [Tk_GetCapStyle](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetCapStyl.html)
#       (**butt**, **projecting**, or **round**).
#       If this option is not specified then it defaults to **butt**.
#       Where arrowheads are drawn the cap style is ignored.
#
#   **-joinstyle** *style*
#       Specifies the ways in which joints are to be drawn at the vertices of the line.
#       *Style* may have any of the forms accepted by [Tk_GetJoinStyle](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetJoinStl.html)
#       (**bevel**, **miter**, or **round**).
#       If this option is not specified then it defaults to **round**.
#       If the line only contains two points then this option is irrelevant.
#
#   **-smooth** *smoothMethod*
#       *smoothMethod* must have one of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html)
#       or a line smoothing method.
#       Only **true** and **raw** are supported in the core (with bezier being an alias for true), but more can be added at runtime.
#       If a boolean false value or empty string is given, no smoothing is applied.
#       A boolean truth value assumes *true* smoothing.
#
#       If the smoothing method is *true*, this indicates that the line should be drawn as a curve, rendered as a set of quadratic
#        splines: one spline is drawn for the first and second line segments, one for the second and third, and so on.
#       Straight-line segments can be generated within a curve by duplicating the end-points of the desired line segment.
#
#       If the smoothing method is *raw*, this indicates that the line should also be drawn as a curve but where the list of coordinates
#       is such that the first coordinate pair (and every third coordinate pair thereafter) is a knot point on a cubic Bezier curve,
#       and the other coordinates are control points on the cubic Bezier curve.
#       Straight line segments can be generated within a curve by making control points equal to their neighbouring knot points.
#       If the last point is a control point and not a knot point, the point is repeated (one or two times) so that it also becomes
#       a knot point.
#
#   **-splinesteps** *number*
#       Specifies the degree of smoothness desired for curves: each spline will be approximated with number line segments.
#       This option is ignored unless the **-smooth** option is **true** or **raw**.
#
###### OVAL ITEMS:
#
# Items of type oval appear as circular or oval regions on the display.
# Each oval may have an outline, a fill, or both.
# Ovals are created with the following form:
#
#    *window* **create** **oval** *coordList* ?*option* *value*? ... ?*option* *value*?
#
# The argument *coordList* give the coordinates of two diagonally opposite corners of a rectangular region enclosing the oval.
# The oval will include the top and left edges of the rectangle not the lower or right edges.
# If the region is square then the resulting oval is circular; otherwise it is elongated in shape.
# After the coordinates there may be any number of option-value pairs, each of which sets one of the configuration options for
# the item.
# These same option-value pairs may be used in itemconfigure widget commands to change the item's configuration.
# An oval item becomes the current item when the mouse pointer is over any part that is painted or (when fully transparent)
# that would be painted if both the **-fill** and **-outline** options were non-empty.
#
# The following standard options are supported by ovals:
#
#   -dash
#   -activedash
#   -disableddash
#   -dashoffset
#   -fill
#   -activefill
#   -disabledfill
#   -offset
#   -outline
#   -activeoutline
#   -disabledoutline
#   -outlineoffset
#   -outlinestipple
#   -activeoutlinestipple
#   -disabledoutlinestipple
#   -stipple
#   -activestipple
#   -disabledstipple
#   -state
#   -tags
#   -width
#   -activewidth
#   -disabledwidth
#
# There are no oval-specific options.
#
###### POLYGON ITEMS:
#
# Items of type polygon appear as polygonal or curved filled regions on the display.
# Polygon items support coordinate indexing operations using the dchars, index and insert widget commands.
# Polygons are created with the following form:
#
#    *window* **create** **polygon** *coordList* ?*option* *value*? ... ?*option* *value*?
#
# The argument *coordList* specify the coordinates for three or more points that define a polygon.
# The first point should not be repeated as the last to close the shape; Tk will automatically close the periphery between
# the first and last points.
# After the coordinates there may be any number of option-value pairs, each of which sets one of the configuration options
# for the item.
# These same option-value pairs may be used in itemconfigure widget commands to change the item's configuration.
# A polygon item is the current item whenever the mouse pointer is over any part of the polygon, whether drawn or not and
# whether or not the outline is smoothed.
#
# The following standard options are supported by polygons:
#
#   -dash
#   -activedash
#   -disableddash
#   -dashoffset
#   -fill
#   -activefill
#   -disabledfill
#   -offset
#   -outline
#   -activeoutline
#   -disabledoutline
#   -outlineoffset
#   -outlinestipple
#   -activeoutlinestipple
#   -disabledoutlinestipple
#   -stipple
#   -activestipple
#   -disabledstipple
#   -state
#   -tags
#   -width
#   -activewidth
#   -disabledwidth
#
# The following extra options are supported for polygons:
#
#   **-joinstyle** *style*
#     Specifies the ways in which joints are to be drawn at the vertices of the outline.
#     *Style* may have any of the forms accepted by [Tk_GetJoinStyle](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetJoinStl.html)
#     (**bevel**, **miter**, or **round**).
#     If this option is not specified then it defaults to round.
#
#   **-smooth** *boolean*
#     *Boolean* must have one of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html)
#     or a line smoothing method.
#     Only **true** and **raw** are supported in the core (with bezier being an alias for true), but more can be added at runtime.
#     If a boolean false value or empty string is given, no smoothing is applied.
#     A boolean truth value assumes *true* smoothing.
#
#     If the smoothing method is *true*, this indicates that the polygon should be drawn as a curve, rendered as a set of quadratic
#     splines: one spline is drawn for the first and second line segments, one for the second and third, and so on.
#     Straight-line segments can be generated within a curve by duplicating the end-points of the desired line segment.
#
#     If the smoothing method is *raw*, this indicates that the polygon should also be drawn as a curve but where the list of coordinates
#     is such that the first coordinate pair (and every third coordinate pair thereafter) is a knot point on a cubic Bezier curve, and
#     the other coordinates are control points on the cubic Bezier curve.
#     Straight line segments can be generated within a curve by making control points equal to their neighbouring knot points.
#     If the last point is not the second point of a pair of control points, the point is repeated (one or two times) so that it also
#     becomes the second point of a pair of control points (the associated knot point will be the first control point).
#
#   **-splinesteps** *number*
#     Specifies the degree of smoothness desired for curves: each spline will be approximated with *number* line segments.
#     This option is ignored unless the **-smooth** option is true or raw.
#
# Polygon items are different from other items such as rectangles, ovals and arcs in that interior points are considered to be "inside"
# a polygon (e.g. for purposes of the find closest and find overlapping widget commands) even if it is not filled.
# For most other item types, an interior point is considered to be inside the item only if the item is filled or if it has neither a
# fill nor an outline.
# If you would like an unfilled polygon whose interior points are not considered to be inside the polygon, use a line item instead.
#
###### RECTANGLE ITEMS:
#
# Items of type rectangle appear as rectangular regions on the display.
# Each rectangle may have an outline, a fill, or both.
# Rectangles are created with the following form:
#
#    *window* **create** **rectangle** *coordList* ?*option* *value*? ... ?*option* *value*?
#
# The argument *coordList* (which must have four elements) give the coordinates of two diagonally opposite corners of the rectangle
# (the rectangle will include its upper and left edges but not its lower or right edges).
# After the coordinates there may be any number of option-value pairs, each of which sets one of the configuration options for the item.
# These same option-value pairs may be used in itemconfigure widget commands to change the item's configuration.
# A rectangle item becomes the current item when the mouse pointer is over any part that is painted or (when fully transparent) that
# would be painted if both the **-fill** and **-outline** options were non-empty.
#
# The following standard options are supported by rectangles:
#
#   -dash
#   -activedash
#   -disableddash
#   -dashoffset
#   -fill
#   -activefill
#   -disabledfill
#   -offset
#   -outline
#   -activeoutline
#   -disabledoutline
#   -outlineoffset
#   -outlinestipple
#   -activeoutlinestipple
#   -disabledoutlinestipple
#   -stipple
#   -activestipple
#   -disabledstipple
#   -state
#   -tags
#   -width
#   -activewidth
#   -disabledwidth
#
# There are no rectangle-specific options.
#
###### TEXT ITEMS:
#
# A text item displays a string of characters on the screen in one or more lines.
# Text items support indexing, editing and selection through the dchars widget command, the focus widget command, the icursor widget
# command, the index widget command, the insert widget command, and the select widget command.
# Text items are created with the following form:
#
#    *window* **create** **text** *coordList* ?*option* *value*? ... ?*option* *value*?
#
# The argument *coordList* (which must have two elements) specify the coordinates of a point used to position the text on the display
# (see the options below for more information on how text is displayed).
# After the coordinates there may be any number of option-value pairs, each of which sets one of the configuration options for the item.
# These same option-value pairs may be used in itemconfigure widget commands to change the item's configuration.
# A text item becomes the current item when the mouse pointer is over any part of its bounding box.
#
# The following standard options are supported by text items:
#
#   -anchor
#   -fill
#   -activefill
#   -disabledfill
#   -stipple
#   -activestipple
#   -disabledstipple
#   -state
#   -tags
#
# The following extra options are supported for text items:
#
#   **-angle** *rotationDegrees*
#     *RotationDegrees* tells how many degrees to rotate the text anticlockwise about the positioning point for the text; it may have
#     any floating-point value from **0.0** to **360.0**.
#     For example, if rotationDegrees is **90**, then the text will be drawn vertically from bottom to top.
#     This option defaults to **0.0**.
#
#   **-font** *fontName*
#     Specifies the font to use for the text item. *FontName* may be any string acceptable to [Tk_GetFont](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetFont.html).
#     If this option is not specified, it defaults to a system-dependent font.
#
#   **-justify** *how*
#     Specifies how to justify the text within its bounding region. How must be one of the values **left**, **right**, or **center**.
#     This option will only matter if the text is displayed as multiple lines.
#     If the option is omitted, it defaults to left.
#
#   **-text** *string*
#     **String** specifies the characters to be displayed in the text item. Newline characters cause line breaks.
#     The characters in the item may also be changed with the insert and delete widget commands.
#     This option defaults to an empty string.
#
#   **-underline** *number*
#     Specifies the integer index of a character within the text to be underlined.
#     **0** corresponds to the first character of the text displayed, **1** to the next character, and so on.
#     **-1** means that no underline should be drawn (if the whole text item is to be underlined, the appropriate font should be
#     used instead).
#
#   **-width** *lineLength*
#     Specifies a maximum line length for the text, in any of the forms described in the **COORDINATES** section above.
#     If this option is zero (the default) the text is broken into lines only at newline characters.
#     However, if this option is non-zero then any line that would be longer than lineLength is broken just before a space
#     character to make the line shorter than lineLength; the space character is treated as if it were a newline character.
#
###### WINDOW ITEMS:
#
# Items of type window cause a particular window to be displayed at a given position on the canvas.
# Window items are created with the following form:
#
#    *window* **create** **window** *coordList* ?*option* *value*? ... ?*option* *value*?
#
# The argument *coordList* (which must have two elements) specify the coordinates of a point used to position the window on
# the display, as controlled by the **-anchor** option.
# After the coordinates there may be any number of option-value pairs, each of which sets one of the configuration options
# for the item.
# These same option-value pairs may be used in itemconfigure widget commands to change the item's configuration.
# Theoretically, a window item becomes the current item when the mouse pointer is over any part of its bounding box,
# but in practice this typically does not happen because the mouse pointer ceases to be over the canvas at that point.
#
# The following standard options are supported by window items:
#
#   -anchor
#   -state
#   -tags
#
# The following extra options are supported for window items:
#
#   **-height** *pixels*
#     Specifies the height to assign to the item's window.
#     *Pixels* may have any of the forms described in the **COORDINATES** section above.
#     If this option is not specified, or if it is specified as zero, then the window is given whatever height it requests
#     internally.
#
#   **-width** *pixels*
#     Specifies the width to assign to the item's window.
#     *Pixels* may have any of the forms described in the **COORDINATES** section above.
#     If this option is not specified, or if it is specified as zero, then the window is given whatever width it requests
#     internally.
#
#   **-window** *pathName*
#     Specifies the window to associate with this item.
#     The window specified by *pathName* must either be a child of the canvas widget or a child of some ancestor of the
#     canvas widget.
#     *PathName* may not refer to a top-level window and can be a short or real address.
#
# Note that, due to restrictions in the ways that windows are managed, it is not possible to draw other graphical items
# (such as lines and images) on top of window items.
# A window item always obscures any graphics that overlap it, regardless of their order in the display list.
# Also note that window items, unlike other canvas items, are not clipped for display by their containing canvas's border,
# and are instead clipped by the parent widget of the window specified by the **-window** option; when the parent widget is
# the canvas, this means that the window item can overlap the canvas's border.
#
#### APPLICATION-DEFINED ITEM TYPES:
#
# It is possible for individual applications to define new item types for canvas widgets using C code.
# See the documentation for Tk_CreateItemType.
#
#### STATES:
#
# The canvas widget supports only the **normal** and **disabled** states.
# In the **disabled** state the canvas will not react to any bindings.
#
#### STYLING OPTIONS:
#
# Default style name: **Canvas**
#
# Every canvas styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the canvases in order to facilitate the developer work and augment the
# user experience at the same time.
#
###### SCROLLING
#
# The following behavior will happen if the mouse pointer is over the widget (no matter if it has the focus or not).
#
# Note: A *unit* is 1/10 of a scrollable widget visible zone relative axis or, if a scrollincrement is provided,
#       a multiple of it. See '-xscrollincrement' and '-yscrollincrement' of the relative scrollable widget for more info.
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
######## SIMPLE CANVAS:
#
# 1.  **MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that scrollbar
#     by one unit up or down (depending on the mousewheel direction). If none of the widget's parents meets the required condition,
#     nothing will happen.
#
# 2.  **Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that
#     scrollbar by one unit left or right (depending on the mousewheel direction). If none of the widget's parents meets the required condition,
#     nothing will happen.
#
# 3.  **Control-MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that
#     scrollbar by one page up or down (depending on the mousewheel direction). If none of the widget's parents meets the required condition,
#     nothing will happen.
#
# 4.  **Control-Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal scrollbar and
#     move that scrollbar by one page left or right (depending on the mousewheel direction). If none of the widget's parents meets the required
#     condition, nothing will happen.
#
# 5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#        1 - **TouchpadScroll** events along the X axis will try to find the innermost widget's scrollable parent with an active horizontal
#            scrollbar and move that scrollbar by one unit towards the left or the right (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - **TouchpadScroll** events along the Y axis will try to find the innermost widget's scrollable parent with an active vertical
#            scrollbar and move that scrollbar by one unit towards the top or the bottom (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 6.  **Control-TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#        1 - **Control-TouchpadScroll** events along the X axis will try to find the innermost widget's scrollable parent with an active horizontal
#            scrollbar and move that scrollbar by one page towards the left or the right (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - **Control-TouchpadScroll** events along the Y axis will try to find the innermost widget's scrollable parent with an active vertical
#            scrollbar and move that scrollbar by one page towards the top or the bottom (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 7.  **ContextMenu** events will display the contextual menu associated with the widget.
#     See the **-cmenu** option for more details.
#
######## SCROLLABLE CANVAS:
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
#     If the widget doesn't have an active horizontal scrollbar, **Shift-MouseWheel** events will try to find the innermost widget's
#     scrollable parent with an active horizontal scrollbar and move that scrollbar by one unit left or right (depending on the
#     mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 3.  If the widget have an active vertical scrollbar, **Control-MouseWheel** events will scroll one page towards the top or the
#     bottom of the widget (depending on the direction of the mousewheel event).
#
#     If the widget doesn't have an active vertical scrollbar, **Control-MouseWheel** events will try to find the innermost widget's
#     scrollable parent with an active vertical scrollbar and move that scrollbar by one page up or down (depending on the mousewheel
#     direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 4.  If the widget have an active horizontal scrollbar, **Control-Shift-MouseWheel** events will scroll one page towards the left or
#     the right of the widget (depending on the direction of the mousewheel event).
#
#     If the widget doesn't have an active horizontal scrollbar, **Control-Shift-MouseWheel** events will try to find the innermost widget's
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
#            innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar by one unit towards the left
#            or the right (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - If the widget have an active vertical scrollbar, **TouchpadScroll** events along the Y axis will try will scroll the widget
#            scrollbar one unit towards the top or the bottom (depending on the direction of the touchpad event).
#
#            If the widget does not have an active vertical scrollbar, **TouchpadScroll** events along the Y axis will try to find the
#            innermost widget's scrollable parent with an active vertical scrollbar and move that scrollbar by one unit towards the top
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
#            the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar by one page towards the left
#            or the right (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - If the widget have an active vertical scrollbar, **Control-TouchpadScroll** events along the Y axis will try will scroll the
#            widget scrollbar one page towards the top or the bottom (depending on the direction of the touchpad event).
#
#            If the widget does not have an active vertical scrollbar, **Control-TouchpadScroll** events along the Y axis will try to find
#            the innermost widget's scrollable parent with an active vertical scrollbar and move that scrollbar by one page towards the top
#            or the bottom (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 7.  Pressing and holding the mousewheel button and moving the mouse, will scroll the content in every direction.
#
# 8.  **ContextMenu** events will display the contextual menu associated with the widget.
#     See the **-cmenu** option for more details.
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
# 2.  If the widget vertical scrollbar is active:
#       - **Prior** Scrolls one page towards the top of the widget.
#       - **Next**  Scrolls one page towards the bottom of the widget.
#     If the widget vertical scrollbar is not active, mustang will try to find the innermost widget's scrollable parent with an
#     active vertical scrollbar and scroll that scrollbar. If none of the widget's parents meets the required conditions,
#     nothing will happen.
#
# 3.  If the widget horizontal scrollbar is active:
#       - **Control-Prior** Scrolls one page towards the right of the widget.
#       - **Control-Next**  Scrolls one page towards the left of the widget.
#     If the widget horizontal scrollbar is not active, mustang will try to find the innermost widget's scrollable parent with an
#     active horizontal scrollbar and scroll that scrollbar. If none of the widget's parents meets the required conditions,
#     nothing will happen.
#
# There are other bindings in place for internal mechanism on the widget like **Activate/Deactivate**, **Configure**, **Destroy**,
# **Enter/Leave** and **FocusIn/FocusOut**, as well as **ButtonPress-1**, **B1-Motion** and **ButtonRelease-1** on its scrollbar objects.
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
#   # Create a scrollable canvas 800x600.
#   canvas .c      -borderwidth 2 \
#                       -height 600 \
#                       -relief solid \
#                   -scrollable true \
#                 -scrollregion [list 0 0 2000 2000] \
#                        -style Canvas \
#                    -takefocus true \
#                        -width 800 \
#             -xscrollincrement -2 \
#             -yscrollincrement -2;
#
#   # Focus the scrollable canvas.
#   focus .c
#
#   # Pack the scrollable canvas and expand it in both directions.
#   pack .c  -anchor nw \
#            -expand true \
#              -fill both \
#              -padx [list 15 15] \
#              -pady [list 15 15] \
#              -side top;
#
#   # Create a rectangle inside the scrollable canvas.
#   .c create rectangle [list 10 10 700 700] -fill SelectedTextBackgroundColor
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
#
#### CREDITS:
#
# Tk's canvas widget is a blatant ripoff of ideas from Joel Bartlett's ezd program.
# Ezd provides structured graphics in a Scheme environment and preceded canvases by a year or two.
# Its simple mechanisms for placing and animating graphical objects inspired the functions of canvases.
package provide ::ms::canvas 0.1

#####################################
##                                 ##
##     _SIMPLE_CANVAS BINDINGS     ##
##                                 ##
#####################################

# Activate/Deactivate
_bind _Simple_Canvas <Activate>   { ::ms::canvas::Pathname_Cmd %W state !background; break }
_bind _Simple_Canvas <Deactivate> { ::ms::canvas::Pathname_Cmd %W state  background; break }

# Configure
_bind _Simple_Canvas <Configure> { ::ms::canvas::Configure %W; break }

# Contextual menu
_bind _Simple_Canvas <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Simple_Canvas <Destroy> { ::ms::canvas::Destroy %W; break }

# Enter/Leave
_bind _Simple_Canvas <Enter> { ::ms::canvas::Pathname_Cmd %W state  hover; break }
_bind _Simple_Canvas <Leave> { ::ms::canvas::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Simple_Canvas <FocusIn>  { ::ms::canvas::Pathname_Cmd %W state %W focus; break }
_bind _Simple_Canvas <FocusOut> { ::ms::canvas::FocusOut     %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Canvas <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Canvas <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Canvas <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Canvas <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Simple_Canvas <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Simple_Canvas <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

#########################################
##                                     ##
##     _SCROLLABLE_CANVAS BINDINGS     ##
##                                     ##
#########################################

# Activate/Deactivate
_bind _Simple_Canvas <Activate>   { ::ms::canvas::Pathname_Cmd [_winfo parent %W] state !background; break }
_bind _Simple_Canvas <Deactivate> { ::ms::canvas::Pathname_Cmd [_winfo parent %W] state  background; break }

# Contextual menu
_bind _Scrollable_Canvas <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

# Configure
_bind _Scrollable_Canvas <Configure> { ::ms::canvas::Configure [_winfo parent [_winfo parent %W]]; break }

# Enter/Leave
_bind _Scrollable_Canvas <Enter> { ::ms::Hover [_winfo parent %W] %X %Y; break }
_bind _Scrollable_Canvas <Leave> { ::ms::Hover [_winfo parent %W] %X %Y; break }

# FocusIn/FocusOut
_bind _Scrollable_Canvas <FocusIn>  { ::ms::canvas::Pathname_Cmd [_winfo parent %W] state hover; break }
_bind _Scrollable_Canvas <FocusOut> { ::ms::canvas::FocusOut     [_winfo parent %W]; break }

# Scan
_bind _Scrollable_Canvas <<ScanMark>>    { ::ms::ScanMark [_winfo parent %W] %x %y; break }
_bind _Scrollable_Canvas <<ScanDrag>>    { ::ms::ScanDrag [_winfo parent %W] %x %y; break }
_bind _Scrollable_Canvas <<ScanRelease>> { ::ms::ScanRelease; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the canvas object by one unit up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Canvas <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's horizontal scrollbar is active, move the canvas object by one unit left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Canvas <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the canvas object by one page up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Canvas <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

# If the widget's horizontal scrollbar is active, move the canvas object by one page left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Canvas <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the canvas object by one unit left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the canvas object by one unit up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scrollable_Canvas <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the canvas object by one page left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the canvas object by one page up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scrollable_Canvas <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }

###################################
##                               ##
##     _HULL_CANVAS BINDINGS     ##
##                               ##
###################################

# Activate/Deactivate
_bind _Hull_Canvas <Activate>   { ::ms::canvas::Pathname_Cmd %W state !background; break }
_bind _Hull_Canvas <Deactivate> { ::ms::canvas::Pathname_Cmd %W state  background; break }

# Contextual menu
_bind _Hull_Canvas <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Hull_Canvas <Destroy> { ::ms::canvas::Destroy %W; break }

# Enter/Leave
_bind _Hull_Canvas <Enter> { ::ms::Hover %W %X %Y; break }
_bind _Hull_Canvas <Leave> { ::ms::Hover %W %X %Y; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Canvas <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Canvas <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Canvas <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Canvas <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Hull_Canvas <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Hull_Canvas <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

##########################################
##                                      ##
##     _X_SCROLLBAR_CANVAS BINDINGS     ##
##                                      ##
##########################################

# ButtonPress
_bind _X_Scrollbar_Canvas <ButtonPress-1>   { ::ms::canvas::Scrollbar_ButtonPress  [_winfo parent %W] horizontal %x %y; break }
_bind _X_Scrollbar_Canvas <B1-Motion>       { ::ms::canvas::Scrollbar_Drag         [_winfo parent %W] horizontal %x %y; break }
_bind _X_Scrollbar_Canvas <ButtonRelease-1> { ::ms::canvas::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _X_Scrollbar_Canvas <Enter> { ::ms::Hover [_winfo parent %W] %X %Y; break }
_bind _X_Scrollbar_Canvas <Leave> { ::ms::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's horizontal scrollbar is active, move the canvas object by one unit left or right
# (depending on the mousewheel direction).
_bind _X_Scrollbar_Canvas <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
_bind _X_Scrollbar_Canvas <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# If the widget's horizontal scrollbar is active, move the canvas object by one page left or right
# (depending on the mousewheel direction).
_bind _X_Scrollbar_Canvas <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
_bind _X_Scrollbar_Canvas <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the canvas object by one unit left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _X_Scrollbar_Canvas <TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the canvas object by one page left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _X_Scrollbar_Canvas <Control-TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D pages; break }

##########################################
##                                      ##
##     _Y_SCROLLBAR_CANVAS BINDINGS     ##
##                                      ##
##########################################

# ButtonPress
_bind _Y_Scrollbar_Canvas <ButtonPress-1>   { ::ms::canvas::Scrollbar_ButtonPress  [_winfo parent %W] horizontal %x %y; break }
_bind _Y_Scrollbar_Canvas <B1-Motion>       { ::ms::canvas::Scrollbar_Drag         [_winfo parent %W] horizontal %x %y; break }
_bind _Y_Scrollbar_Canvas <ButtonRelease-1> { ::ms::canvas::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _Y_Scrollbar_Canvas <Enter> { ::ms::Hover [_winfo parent %W] %X %Y; break }
_bind _Y_Scrollbar_Canvas <Leave> { ::ms::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the canvas object by one unit up or down
# (depending on the mousewheel direction).
_bind _Y_Scrollbar_Canvas <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the canvas object by one page up or down
# (depending on the mousewheel direction).
_bind _Y_Scrollbar_Canvas <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's vertical scrollbar is active, move the canvas object by one unit up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
_bind _Y_Scrollbar_Canvas <TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's vertical scrollbar is active, move the canvas object by one page up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
_bind _Y_Scrollbar_Canvas <Control-TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D pages; break }

###############################################
##                                           ##
##     _X_FAKE_SCROLLBAR_CANVAS BINDINGS     ##
##                                           ##
###############################################

# Activate/Deactivate
_bind _X_Fake_Scrollbar_Canvas <Activate>   { ::ms::canvas::Pathname_Cmd [_winfo parent %W] state !background; break }
_bind _X_Fake_Scrollbar_Canvas <Deactivate> { ::ms::canvas::Pathname_Cmd [_winfo parent %W] state  background; break }

# Contextual menu
_bind _X_Fake_Scrollbar_Canvas <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }

# Enter/Leave
_bind _X_Fake_Scrollbar_Canvas <Enter> { ::ms::Hover [_winfo parent %W] %X %Y ""; break }
_bind _X_Fake_Scrollbar_Canvas <Leave> { ::ms::Hover [_winfo parent %W] %X %Y ""; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Canvas <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Canvas <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Canvas <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Canvas <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }

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
_bind _X_Fake_Scrollbar_Canvas <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }

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
_bind _X_Fake_Scrollbar_Canvas <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }

###############################################
##                                           ##
##     _Y_FAKE_SCROLLBAR_CANVAS BINDINGS     ##
##                                           ##
###############################################

# Activate/Deactivate
_bind _Y_Fake_Scrollbar_Canvas <Activate>   { ::ms::canvas::Pathname_Cmd [_winfo parent %W] state !background; break }
_bind _Y_Fake_Scrollbar_Canvas <Deactivate> { ::ms::canvas::Pathname_Cmd [_winfo parent %W] state  background; break }

# Contextual menu
_bind _Y_Fake_Scrollbar_Canvas <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }

# Enter/Leave
_bind _Y_Fake_Scrollbar_Canvas <Enter> { ::ms::Hover [_winfo parent %W] %X %Y ""; break }
_bind _Y_Fake_Scrollbar_Canvas <Leave> { ::ms::Hover [_winfo parent %W] %X %Y ""; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Canvas <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Canvas <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Canvas <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Canvas <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }

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
_bind _Y_Fake_Scrollbar_Canvas <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }

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
_bind _Y_Fake_Scrollbar_Canvas <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }

# Create the mustang **canvas** package.
namespace eval ::ms::canvas {
    # Set the canvas 'non-styleable' canvas option list.
    set ::ms::canvas(non_styleable,options) [list class \
                                                  closeenough \
                                                  cmenu \
                                                  confine \
                                                  height \
                                                  insertofftime \
                                                  insertontime \
                                                  insertwidth \
                                                  scrollable \
                                                  scrollregion \
                                                  state \
                                                  style \
                                                  takefocus \
                                                  width \
                                                  xscrollcommand \
                                                  xscrollincrement \
                                                  yscrollcommand \
                                                  yscrollincrement];

    # Set the canvas 'styleable' canvas option list.
    set ::ms::canvas(styleable,options) [list background \
                                              bordercolor \
                                              borderwidth \
                                              cursor \
                                              insertbackground \
                                              insertborderwidth \
                                              relief \
                                              selectbackground \
                                              selectborderwidth \
                                              selectforeground \
                                              shellbackground];

    # Set the default 'non-styleable' canvas options values.
    set ::ms::default(canvas,class)            Canvas
    set ::ms::default(canvas,closeenough)      1.0
    set ::ms::default(canvas,cmenu)            {}
    set ::ms::default(canvas,confine)          1
    set ::ms::default(canvas,height)           [::ms::Convert_Measure 7c "" 300]
    set ::ms::default(canvas,insertofftime)    300
    set ::ms::default(canvas,insertontime)     600
    set ::ms::default(canvas,insertwidth)      2
    set ::ms::default(canvas,scrollable)       false
    set ::ms::default(canvas,scrollregion)     {}
    set ::ms::default(canvas,state)            normal
    set ::ms::default(canvas,style)            Canvas
    set ::ms::default(canvas,takefocus)        0
    set ::ms::default(canvas,width)            [::ms::Convert_Measure 10c "" 400]
    set ::ms::default(canvas,xscrollcommand)   {}
    set ::ms::default(canvas,xscrollincrement) 0
    set ::ms::default(canvas,yscrollcommand)   {}
    set ::ms::default(canvas,yscrollincrement) 0

    # Note: The default 'styleable' canvas options values are always defined inside the current theme.
}

# Rename the original Tk **canvas** command.
rename canvas _canvas

# Create an alias for the mustang **canvas** command.
interp alias {} canvas {} ::ms::canvas::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **canvas** widget command.
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
proc ::ms::canvas::Command { window { args "" } } {
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
            set ::ms::default($w,class)            $::ms::default(canvas,class)
            set ::ms::default($w,cmenu)            $::ms::default(canvas,cmenu)
            set ::ms::default($w,closeenough)      $::ms::default(canvas,closeenough)
            set ::ms::default($w,confine)          $::ms::default(canvas,confine)
            set ::ms::default($w,height)           $::ms::default(canvas,height)
            set ::ms::default($w,insertofftime)    $::ms::default(canvas,insertofftime)
            set ::ms::default($w,insertontime)     $::ms::default(canvas,insertontime)
            set ::ms::default($w,insertwidth)      $::ms::default(canvas,insertwidth)
            set ::ms::default($w,scrollable)       $::ms::default(canvas,scrollable)
            set ::ms::default($w,scrollregion)     $::ms::default(canvas,scrollregion)
            set ::ms::default($w,state)            $::ms::default(canvas,state)
            set ::ms::default($w,style)            $::ms::default(canvas,style)
            set ::ms::default($w,takefocus)        $::ms::default(canvas,takefocus)
            set ::ms::default($w,width)            $::ms::default(canvas,width)
            set ::ms::default($w,xscrollcommand)   $::ms::default(canvas,xscrollcommand)
            set ::ms::default($w,xscrollincrement) $::ms::default(canvas,xscrollincrement)
            set ::ms::default($w,yscrollcommand)   $::ms::default(canvas,yscrollcommand)
            set ::ms::default($w,yscrollincrement) $::ms::default(canvas,yscrollincrement)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)            $::ms::default(canvas,class)
            set ::ms::current($w,cmenu)            $::ms::default(canvas,cmenu)
            set ::ms::current($w,closeenough)      $::ms::default(canvas,closeenough)
            set ::ms::current($w,confine)          $::ms::default(canvas,confine)
            set ::ms::current($w,height)           $::ms::default(canvas,height)
            set ::ms::current($w,insertofftime)    $::ms::default(canvas,insertofftime)
            set ::ms::current($w,insertontime)     $::ms::default(canvas,insertontime)
            set ::ms::current($w,insertwidth)      $::ms::default(canvas,insertwidth)
            set ::ms::current($w,scrollable)       $::ms::default(canvas,scrollable)
            set ::ms::current($w,scrollregion)     $::ms::default(canvas,scrollregion)
            set ::ms::current($w,state)            $::ms::default(canvas,state)
            set ::ms::current($w,style)            $::ms::default(canvas,style)
            set ::ms::current($w,takefocus)        $::ms::default(canvas,takefocus)
            set ::ms::current($w,width)            $::ms::default(canvas,width)
            set ::ms::current($w,xscrollcommand)   $::ms::default(canvas,xscrollcommand)
            set ::ms::current($w,xscrollincrement) $::ms::default(canvas,xscrollincrement)
            set ::ms::current($w,yscrollcommand)   $::ms::default(canvas,yscrollcommand)
            set ::ms::current($w,yscrollincrement) $::ms::default(canvas,yscrollincrement)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) canvas
            set ::ms::data($w,scrollx)   off
            set ::ms::data($w,scrolly)   off
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
            #       To make a canvas styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **canvas** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)        Tk
            set ::ms::managed_by($w,bordercolor)       Tk
            set ::ms::managed_by($w,borderwidth)       Tk
            set ::ms::managed_by($w,cursor)            Tk
            set ::ms::managed_by($w,insertbackground)  Tk
            set ::ms::managed_by($w,insertborderwidth) Tk
            set ::ms::managed_by($w,relief)            Tk
            set ::ms::managed_by($w,selectbackground)  Tk
            set ::ms::managed_by($w,selectborderwidth) Tk
            set ::ms::managed_by($w,selectforeground)  Tk
            set ::ms::managed_by($w,shellbackground)   Tk

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
                    -closeenough {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,closeenough) $value
                    }
                    -confine {
                        switch -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,confine) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,confine) 1 }
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
                    -insertbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertbackground)    $value
                        set ::ms::managed_by($w,insertbackground) developer
                    }
                    -insertborderwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertborderwidth)    $value
                        set ::ms::managed_by($w,insertborderwidth) developer
                    }
                    -insertofftime {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value >= 0 } {
                                    set ::ms::current($w,insertofftime) $value
                                }
                            }
                        }
                    }
                    -insertontime {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,insertontime) $value
                                }
                            }
                        }
                    }
                    -insertwidth {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,insertwidth) $value
                                }
                            }
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
                    -scrollable {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,scrollable) false }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,scrollable) true }
                        }
                    }
                    -scrollregion {
                        switch -- [llength $value] {
                            4   {
                                set scrollregion [list ]
                                foreach coordinate $value {
                                    set unit [string index $coordinate end]
                                    switch -- $unit {
                                        0   -
                                        1   -
                                        2   -
                                        3   -
                                        4   -
                                        5   -
                                        6   -
                                        7   -
                                        8   -
                                        9   {
                                            # The coordinate have no unit, its value is assumed to be in pixels.
                                            if { [string is double -strict $coordinate] && ( $coordinate >= 0 ) } {
                                                lappend scrollregion $coordinate
                                            } else {
                                                break
                                            }
                                        }
                                        i   -
                                        c   -
                                        m   -
                                        p   {
                                            set coordinate [string range $coordinate 0 end-1]

                                            if { [string is double -strict $coordinate] && ( $coordinate >= 0 ) } {
                                                switch -- $coordinate {
                                                    0       { lappend scrollregion $coordinate }
                                                    default { lappend scrollregion [string cat $coordinate $unit] }
                                                }
                                            } else { break }
                                        }
                                        default { break }
                                    }
                                }

                                switch -- [llength $scrollregion] {
                                    4   { set ::ms::current($w,scrollregion) $scrollregion }
                                }
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
                        if { $value in $::ms::style($::ms::theme,theme) } {
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
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,width) $value
                    }
                    -xscrollcommand {
                        switch -- [llength $value] {
                            2   { set ::ms::current($w,xscrollcommand) $value }
                        }
                    }
                    -xscrollincrement {
                        switch -- [string is integer -strict $value] {
                            1   { set ::ms::current($w,xscrollincrement) $value }
                        }
                    }
                    -yscrollcommand {
                        switch -- [llength $value] {
                            2   { set ::ms::current($w,yscrollcommand) $value }
                        }
                    }
                    -yscrollincrement {
                        switch -- [string is integer -strict $value] {
                            1   { set ::ms::current($w,yscrollincrement) $value }
                        }
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::canvas(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Canvas,$option)

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

            # Note: 'borderwidth', 'cursor', 'insertwidth', 'relief' and 'selectborderwidth' are not allowed to change if the statespec changes.

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

            # insertbackground
            switch -- $::ms::managed_by($w,insertbackground) {
                developer { set insertbackground $::ms::current($w,insertbackground) }
                Tk        { set insertbackground [_ttk_style lookup $::ms::current($w,style) -insertbackground $::ms::data($w,statespec) $::ms::default($w,insertbackground)] }
            }

            # selectbackground
            switch -- $::ms::managed_by($w,selectbackground) {
                developer { set selectbackground $::ms::current($w,selectbackground) }
                Tk        { set selectbackground [_ttk_style lookup $::ms::current($w,style) -selectbackground $::ms::data($w,statespec) $::ms::default($w,selectbackground)] }
            }

            # selectforeground
            switch -- $::ms::managed_by($w,selectforeground) {
                developer { set selectforeground $::ms::current($w,selectforeground) }
                Tk        { set selectforeground [_ttk_style lookup $::ms::current($w,style) -selectforeground $::ms::data($w,statespec) $::ms::default($w,selectforeground)] }
            }

            # Set the canvas options.
            set canvas_options [list        -background $background \
                                           -closeenough $::ms::current($w,closeenough) \
                                               -confine $::ms::current($w,confine) \
                                                -cursor $cursor \
                                                -height $::ms::current($w,height) \
                                      -insertbackground $insertbackground \
                                     -insertborderwidth $::ms::current($w,insertborderwidth) \
                                         -insertofftime $::ms::current($w,insertofftime) \
                                          -insertontime $::ms::current($w,insertontime) \
                                           -insertwidth $::ms::current($w,insertwidth) \
                                                -offset 0,0 \
                                          -scrollregion $::ms::current($w,scrollregion) \
                                      -selectbackground $selectbackground \
                                     -selectborderwidth $::ms::current($w,selectborderwidth) \
                                      -selectforeground $selectforeground \
                                                 -state $::ms::current($w,state) \
                                             -takefocus $takefocus \
                                                 -width $::ms::current($w,width) \
                                      -xscrollincrement $::ms::current($w,xscrollincrement) \
                                      -yscrollincrement $::ms::current($w,yscrollincrement)];

            # Note: The '-bordercolor' option is not understanded by Tk canvases, but is made available trough
            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
            #       like it behaves in other widgets that understands the bordercolor.

            # Check the 'relief' type.
            switch -- $::ms::current($w,relief) {
                flat  -
                solid {
                    lappend canvas_options         -borderwidth 0 \
                                           -highlightbackground $bordercolor \
                                                -highlightcolor $bordercolor \
                                            -highlightthickness $::ms::current($w,borderwidth) \
                                                        -relief flat;
                }
                default {
                    lappend canvas_options         -borderwidth $::ms::current($w,borderwidth) \
                                           -highlightbackground $background \
                                                -highlightcolor $background \
                                            -highlightthickness 0 \
                                                        -relief $::ms::current($w,relief);
                }
            }

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false {
                    ###########################
                    ##                       ##
                    ##     SIMPLE CANVAS     ##
                    ##                       ##
                    ###########################

                    ####################
                    ##                ##
                    ##     CANVAS     ##
                    ##                ##
                    ####################

                    # Note: Tk canvases don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # Add the provided 'xscrollcommand' and 'yscrollcommand' data.
                    lappend canvas_options -xscrollcommand $::ms::current($w,xscrollcommand) \
                                           -yscrollcommand $::ms::current($w,yscrollcommand);

                    # Create the widget.
                    try {
                        _canvas $w {*}$canvas_options
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    }

                    # Set the widget toplevel.
                    set ::ms::addr($w,toplevel) [_winfo toplevel $w]

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        Canvas  { _bindtags $w [list $w _Simple_Canvas Canvas $::ms::addr($w,toplevel) all] }
                        default { _bindtags $w [list $w $::ms::current($w,class) _Simple_Canvas Canvas $::ms::addr($w,toplevel) all] }
                    }

                    # Add the simple canvas to the related toplevel keyboard pages navigation bindings.
                    ::ms::Enable_Traversal $w

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses of all the object composing the megawidget.
                    # They will all point to the widget hull object short address.
                    set ::ms::addr($w,short) $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals)  $w
                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w

                    # Set the structure address.
                    set ::ms::addr($w,structure) [list $w]
                }
                true {
                    ###############################
                    ##                           ##
                    ##     SCROLLABLE CANVAS     ##
                    ##                           ##
                    ###############################

                    # Remove any provided or default 'xscrollcommand' or 'yscrollcommand' values and substitute them with the empty string.
                    set ::ms::current($w,xscrollcommand) ""
                    set ::ms::current($w,yscrollcommand) ""

                    # Check if the height provided is zero.
                    switch -- $::ms::current($w,height) {
                        0   { set ::ms::current($w,height) $::ms::default($w,height) }
                    }

                    # Check if the width provided is zero.
                    switch -- $::ms::current($w,width) {
                        0   { set ::ms::current($w,width) $::ms::default($w,width) }
                    }

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

                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { $w state disabled }
                    }

                    # Set the widget toplevel.
                    set ::ms::addr($w,toplevel) [_winfo toplevel $w]

                    ####################
                    ##                ##
                    ##     CANVAS     ##
                    ##                ##
                    ####################

                    # Note: Tk canvases don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # Add the internal 'xscrollcommand' and 'yscrollcommand' data.
                    lappend canvas_options -xscrollcommand [list $w.x set] \
                                           -yscrollcommand [list $w.y set];

                    # Create the widget.
                    _canvas $w.canvas {*}$canvas_options

                    # Grid the canvas object.
                    _grid $w.canvas -column 0 \
                                      -padx 0 \
                                      -pady 0 \
                                       -row 0 \
                                    -sticky nesw;

                    ########################
                    ##                    ##
                    ##     SCROLLBARS     ##
                    ##                    ##
                    ########################

                    # Create the horizontal scrollbar.
                    _ttk_scrollbar $w.x     -class TScrollbar \
                                          -command [list $w.canvas xview] \
                                           -cursor arrow \
                                           -orient horizontal \
                                            -style TScrollbar \
                                        -takefocus 0;

                    # Create the vertical scrollbar.
                    _ttk_scrollbar $w.y     -class TScrollbar \
                                          -command [list $w.canvas yview] \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

                    # Create the fake horizontal scrollbar.
                    _ttk_frame $w.fake_x -borderwidth 0 \
                                               -class TFrame \
                                              -cursor arrow \
                                              -height $::ms::size($::ms::theme,scrollbar) \
                                             -padding 0 \
                                              -relief flat \
                                               -style $::ms::style($w,hull) \
                                           -takefocus 0 \
                                               -width 0;

                    # Create the fake vertical scrollbar.
                    _ttk_frame $w.fake_y -borderwidth 0 \
                                               -class TFrame \
                                              -cursor arrow \
                                              -height 0 \
                                             -padding 0 \
                                              -relief flat \
                                               -style $::ms::style($w,hull) \
                                           -takefocus 0 \
                                               -width $::ms::size($::ms::theme,scrollbar);

                    # Grid the fake scrollbars.
                    _grid $w.fake_x -column 0 \
                                      -padx [list 0  0] \
                                      -pady [list 8p 0] \
                                       -row 1 \
                                    -sticky we;

                    _grid $w.fake_y -column 1 \
                                      -padx [list 8p 0] \
                                      -pady [list 0  0] \
                                       -row 0 \
                                    -sticky ns;

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the hull object.
                    _bindtags $w [list $w _Hull_Canvas TFrame $::ms::addr($w,toplevel) all]

                    # Set the new bindtags for the widget container ('w').
                    switch -- $::ms::current($w,class) {
                        Canvas  { _bindtags $w.canvas [list $w.canvas _Scrollable_Canvas Canvas $::ms::addr($w,toplevel) all] }
                        default { _bindtags $w.canvas [list $w.canvas $::ms::current($w,class) _Scrollable_Canvas Canvas $::ms::addr($w,toplevel) all] }
                    }

                    # Set the new bindtags for the horizontal and vertical scrollbar objects.
                    _bindtags $w.x [list $w.x _X_Scrollbar_Canvas TScrollbar $::ms::addr($w,toplevel) all]
                    _bindtags $w.y [list $w.y _Y_Scrollbar_Canvas TScrollbar $::ms::addr($w,toplevel) all]

                    # Set the new bindtags for the fake horizontal and vertical scrollbar objects.
                    _bindtags $w.fake_x [list $w.fake_x _X_Fake_Scrollbar_Canvas TFrame $::ms::addr($w,toplevel) all]
                    _bindtags $w.fake_y [list $w.fake_y _Y_Fake_Scrollbar_Canvas TFrame $::ms::addr($w,toplevel) all]

                    # Add the widget to the related toplevel keyboard pages navigation bindings.
                    ::ms::Enable_Traversal $w

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Configure the internal widget rows and columns.
                    _grid rowconfigure    $w [list 0] -weight 1
                    _grid columnconfigure $w [list 0] -weight 1

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses relative to its real address, 'w'.
                    # They will all point to the widget hull object short address.
                    set ::ms::addr($w,short)        $short_addr
                    set ::ms::addr($w.canvas,short) $short_addr
                    set ::ms::addr($w.x,short)      $short_addr
                    set ::ms::addr($w.y,short)      $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.canvas \
                                              $w.x \
                                              $w.y;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.canvas

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.canvas

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.canvas];

                    # Add the widget address to the megawidget addresses list.
                    lappend ::ms::addr(megawidgets) $w

                    # Add the widget address to the megawidget container addresses list.
                    lappend ::ms::addr(megawidgets,containers) $w

                    # Add the widget address to the scrollable megawidget addresses list.
                    lappend ::ms::addr(megawidgets,scrollable) $w
                }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::canvas::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::canvas::Pathname_Cmd $w]
            }

            # Add the widget address to the canvas classtype widgets real address list.
            lappend ::ms::addr(canvas,classtype) $w

            # Add the widget address to the canvas classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),canvas,addrs) $w

            # Add the widget address to the canvas classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),canvas,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the canvas classtype.
            if { $::ms::current($w,style) ni $::ms::style(canvas,classtype) } {
                lappend ::ms::style(canvas,classtype) $::ms::current($w,style)
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
proc ::ms::canvas::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        addtag        -
        bbox          -
        bind          -
        canvasx       -
        canvasy       -
        coords        -
        dchars        -
        delete        -
        dtag          -
        find          -
        focus         -
        gettags       -
        icursor       -
        image         -
        imove         -
        index         -
        insert        -
        itemcget      -
        itemconfigure -
        lower         -
        move          -
        moveto        -
        postscript    -
        raise         -
        rchars        -
        rotate        -
        scale         -
        scan          -
        select        -
        type          {
            # Synopsis:
            #
            # *window* **addtag** *tag* *searchSpec* ?*arg* ... *arg*?
            # *window* **bbox** *tagOrId* ?*tagOrId* *tagOrId* ...?
            # *window* **bind** *tagOrId* ?*sequence*? ?*command*?
            # *window* **canvasx** *screenx* ?*gridspacing*?
            # *window* **canvasy** *screeny* ?*gridspacing*?
            # *window* **coords** *tagOrId* ?*x0* *y0* ...?
            # *window* **coords** *tagOrId* ?*coordList*?
            # *window* **dchars** *tagOrId* *first* ?*last*?
            # *window* **delete** ?*tagOrId* *tagOrId* ...?
            # *window* **dtag** *tagOrId* ?*tagToDelete*?
            # *window* **find** *searchCommand* ?*arg* ... *arg*?
            # *window* **focus** ?*tagOrId*?
            # *window* **gettags** *tagOrId*
            # *window* **icursor** *tagOrId* *index*
            # *window* **image** *imagename* ?*subsample*? ?*zoom*?
            # *window* **imove** *tagOrId* *index* *x* *y*
            # *window* **index** *tagOrId* *index*
            # *window* **insert** *tagOrId* *beforeThis* *string*
            # *window* **itemcget** *tagOrId* *option*
            # *window* **itemconfigure** *tagOrId* ?*option*? ?*value*? ?*option value* ... *option value*?
            # *window* **lower** *tagOrId* ?*belowThis*?
            # *window* **move** *tagOrId* *xAmount* *yAmount*
            # *window* **moveto** *tagOrId* *xPos* *yPos*
            # *window* **postscript** ?*option value* ... *option value*?
            # *window* **raise** *tagOrId* ?*aboveThis*?
            # *window* **rchars** *tagOrId* *first* *last* *string*
            # *window* **rotate** *tagOrId* *xOrigin* *yOrigin* *angle*
            # *window* **scale** *tagOrId* *xOrigin* *yOrigin* *xScale* *yScale*
            # *window* **scan** *option* *args*
            #    *window* **scan** **mark** *x* *y*
            #    *window* **scan** **dragto** *x* *y* ?*gain*?
            # *window* **select** *option* ?*tagOrId* *arg*?
            #    *window* **select** **adjust** *tagOrId* *index*
            #    *window* **select** **clear**
            #    *window* **select** **from** *tagOrId* *index*
            #    *window* **select** **item**
            #    *window* **select** **to** *tagOrId* *index*
            # *window* **type** *tagOrId*
            switch -- $::ms::current($w,scrollable) {
                false {
                    # Execute the command.
                    try {
                        interp invokehidden {} $w $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                true {
                    # Execute the command.
                    try {
                        $w.canvas $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
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
                    if { ($option in $::ms::canvas(non_styleable,options)) || ($option in $::ms::canvas(styleable,options)) } {
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
                    foreach option $::ms::canvas(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::canvas(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::canvas(non_styleable,options)) || ($option in $::ms::canvas(styleable,options)) } {
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
                            #       Their registration (if any) is done in the '::ms::canvas::Configure' event procedure.
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
                                    -cmenu {
                                        set value [string trim $value]
                                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
                                            set ::ms::current($w,cmenu) $value
                                        }
                                    }
                                    -closeenough {
                                        switch -- [string is double -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,closeenough) $value
                                    }
                                    -confine {
                                        switch -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,confine) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,confine) 1 }
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

                                        set ::ms::temp($w,height) $value
                                    }
                                    -insertbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,insertbackground)    $value
                                        set ::ms::managed_by($w,insertbackground) developer
                                    }
                                    -insertborderwidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,insertborderwidth)    $value
                                        set ::ms::managed_by($w,insertborderwidth) developer
                                    }
                                    -insertofftime {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value >= 0 } {
                                                    set ::ms::current($w,insertofftime) $value
                                                }
                                            }
                                        }
                                    }
                                    -insertontime {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value > 0 } {
                                                    set ::ms::current($w,insertontime) $value
                                                }
                                            }
                                        }
                                    }
                                    -insertwidth {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value > 0 } {
                                                    set ::ms::current($w,insertwidth) $value
                                                }
                                            }
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
                                    -scrollable {}
                                    -scrollregion {
                                        switch -- [llength $value] {
                                            4   {
                                                set scrollregion [list ]
                                                foreach coordinate $value {
                                                    set unit [string index $coordinate end]
                                                    switch -- $unit {
                                                        0   -
                                                        1   -
                                                        2   -
                                                        3   -
                                                        4   -
                                                        5   -
                                                        6   -
                                                        7   -
                                                        8   -
                                                        9   {
                                                            # The coordinate have no unit, its value is assumed to be in pixels.
                                                            if { [string is double -strict $coordinate] && ( $coordinate >= 0 ) } {
                                                                lappend scrollregion $coordinate
                                                            } else {
                                                                break
                                                            }
                                                        }
                                                        i   -
                                                        c   -
                                                        m   -
                                                        p   {
                                                            set coordinate [string range $coordinate 0 end-1]

                                                            if { [string is double -strict $coordinate] && ( $coordinate >= 0 ) } {
                                                                switch -- $coordinate {
                                                                    0       { lappend scrollregion $coordinate }
                                                                    default { lappend scrollregion [string cat $coordinate $unit] }
                                                                }
                                                            } else {
                                                                break
                                                            }
                                                        }
                                                        default { break }
                                                    }
                                                }

                                                switch -- [llength $scrollregion] {
                                                    4   { set ::ms::current($w,scrollregion) $scrollregion }
                                                }
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
                                            # Remove the widget address from the canvas classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),canvas,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),canvas,addrs) [lremove $::ms::style($::ms::current($w,style),canvas,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,canvas,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the canvas classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),canvas,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(canvas,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(canvas,classtype) [lremove $::ms::style(canvas,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the canvas classtype.
                                            if { $value ni $::ms::style(canvas,classtype) } {
                                                lappend ::ms::style(canvas,classtype) $value
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
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::temp($w,width) $value
                                    }
                                    -xscrollcommand {
                                        switch -- $::ms::current($w,scrollable) {
                                            true { continue }
                                        }

                                        switch -- [llength $value] {
                                            0   { set ::ms::current($w,xscrollcommand) [list ] }
                                            2   { set ::ms::current($w,xscrollcommand) $value  }
                                        }
                                    }
                                    -xscrollincrement {
                                        switch -- [string is integer -strict $value] {
                                            1   { set ::ms::current($w,xscrollincrement) $value }
                                        }
                                    }
                                    -yscrollcommand {
                                        switch -- $::ms::current($w,scrollable) {
                                            true { continue }
                                        }

                                        switch -- [llength $value] {
                                            0   { set ::ms::current($w,yscrollcommand) [list ] }
                                            2   { set ::ms::current($w,yscrollcommand) $value  }
                                        }
                                    }
                                    -yscrollincrement {
                                        switch -- [string is integer -strict $value] {
                                            1   { set ::ms::current($w,yscrollincrement) $value }
                                        }
                                    }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::canvas(styleable,options) {
                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            # Check the widget state and set the cursor and takefocus accordingly.
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

                            # Note: 'borderwidth', 'cursor', 'insertwidth', 'relief' and 'selectborderwidth' are not allowed to change if the statespec changes.

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

                            # insertbackground
                            switch -- $::ms::managed_by($w,insertbackground) {
                                developer { set insertbackground $::ms::current($w,insertbackground) }
                                Tk        { set insertbackground [_ttk_style lookup $::ms::current($w,style) -insertbackground $::ms::data($w,statespec) $::ms::default($w,insertbackground)] }
                            }

                            # selectbackground
                            switch -- $::ms::managed_by($w,selectbackground) {
                                developer { set selectbackground $::ms::current($w,selectbackground) }
                                Tk        { set selectbackground [_ttk_style lookup $::ms::current($w,style) -selectbackground $::ms::data($w,statespec) $::ms::default($w,selectbackground)] }
                            }

                            # selectforeground
                            switch -- $::ms::managed_by($w,selectforeground) {
                                developer { set selectforeground $::ms::current($w,selectforeground) }
                                Tk        { set selectforeground [_ttk_style lookup $::ms::current($w,style) -selectforeground $::ms::data($w,statespec) $::ms::default($w,selectforeground)] }
                            }

                            # Set the canvas options.
                            set canvas_options [list        -background $background \
                                                           -closeenough $::ms::current($w,closeenough) \
                                                               -confine $::ms::current($w,confine) \
                                                                -cursor $cursor \
                                                                -height $::ms::temp($w,height) \
                                                      -insertbackground $insertbackground \
                                                     -insertborderwidth $::ms::current($w,insertborderwidth) \
                                                         -insertofftime $::ms::current($w,insertofftime) \
                                                          -insertontime $::ms::current($w,insertontime) \
                                                           -insertwidth $::ms::current($w,insertwidth) \
                                                          -scrollregion $::ms::current($w,scrollregion) \
                                                      -selectbackground $selectbackground \
                                                     -selectborderwidth $::ms::current($w,selectborderwidth) \
                                                      -selectforeground $selectforeground \
                                                                 -state $::ms::current($w,state) \
                                                             -takefocus $takefocus \
                                                                 -width $::ms::temp($w,width)];

                            # Note: The '-bordercolor' option is not understanded by Tk canvases, but is made available trough
                            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                            #       like it behaves in other widgets that understands the bordercolor.

                            # Check the 'relief' type.
                            switch -- $::ms::current($w,relief) {
                                flat  -
                                solid {
                                    lappend canvas_options         -borderwidth 0 \
                                                           -highlightbackground $bordercolor \
                                                                -highlightcolor $bordercolor \
                                                            -highlightthickness $::ms::current($w,borderwidth) \
                                                                        -relief flat;
                                }
                                default {
                                    lappend canvas_options         -borderwidth $::ms::current($w,borderwidth) \
                                                           -highlightbackground $background \
                                                                -highlightcolor $background \
                                                            -highlightthickness 0 \
                                                                        -relief $::ms::current($w,relief);
                                }
                            }

                            # Check if the widget is scrollable or not.
                            switch -- $::ms::current($w,scrollable) {
                                false {
                                    ###########################
                                    ##                       ##
                                    ##     SIMPLE CANVAS     ##
                                    ##                       ##
                                    ###########################

                                    ####################
                                    ##                ##
                                    ##     CANVAS     ##
                                    ##                ##
                                    ####################

                                    # Note: Tk canvases don't understands styles, at least not natively.
                                    #       No internal styles needs to be created.

                                    # Add the provided 'xscrollcommand' and 'yscrollcommand' data.
                                    lappend canvas_options -xscrollcommand $::ms::current($w,xscrollcommand) \
                                                           -yscrollcommand $::ms::current($w,yscrollcommand);

                                    # Configure the widget.
                                    try {
                                        interp invokehidden {} $w configure {*}$canvas_options
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    }
                                }
                                true {
                                    ###############################
                                    ##                           ##
                                    ##     SCROLLABLE CANVAS     ##
                                    ##                           ##
                                    ###############################

                                    # Check if the height provided is zero.
                                    switch -- $::ms::temp($w,height) {
                                        0   { set ::ms::temp($w,height) $::ms::current($w,height) }
                                    }

                                    # Check if the width provided is zero.
                                    switch -- $::ms::temp($w,width) {
                                        0   { set ::ms::temp($w,width) $::ms::current($w,width) }
                                    }

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

                                    # Check the widget state.
                                    switch -- $::ms::current($w,state) {
                                        disabled { interp invokehidden {} $w state disabled }
                                    }

                                    # Apply the changes.
                                    interp invokehidden {} $w configure -style $::ms::style($w,hull)

                                    ####################
                                    ##                ##
                                    ##     CANVAS     ##
                                    ##                ##
                                    ####################

                                    # Note: Tk canvases don't understands styles, at least not natively.
                                    #       No internal styles needs to be created.

                                    # Create the widget.
                                    $w.canvas configure {*}$canvas_options

                                    ########################
                                    ##                    ##
                                    ##     SCROLLBARS     ##
                                    ##                    ##
                                    ########################

                                    # Configure the fake scrollbars.
                                    $w.fake_x configure -style $::ms::style($w,hull)
                                    $w.fake_y configure -style $::ms::style($w,hull)

                                    # Update the scrollbars.
                                    ::ms::canvas::Scrollbar_Update $w
                                }
                            }

                            # Note: If width and/or height were provided by the developer, and these values were accepted by Tk,
                            #       then a configure event will be invoked by Tk ('::ms::canvas::Configure').
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
        create {
            switch -- [llength $args] {
                0       -
                1       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    set type   [lindex  $args 0]
                    set coords [lindex  $args 1]
                    set args   [lremove $args 0 1]

                    # Check 'type'.
                    switch -- $type {
                        arc       -
                        bitmap    -
                        image     -
                        line      -
                        oval      -
                        polygon   -
                        rectangle -
                        text      -
                        window    {}
                        default   { ::ms::Error "Invalid option, '$type'." $caller_info }
                    }

                    # Check 'coords'.
                    switch -- [expr { [llength $coords]%2 }] {
                        0   {
                            foreach coord $coords {
                                switch -- [string index $coord end] {
                                    0   -
                                    1   -
                                    2   -
                                    3   -
                                    4   -
                                    5   -
                                    6   -
                                    7   -
                                    8   -
                                    9   {
                                        # The coordinate have no unit, its value is assumed to be in pixels.
                                        if { ![string is double -strict $coord] || ( $coord < 0 ) } {
                                            ::ms::Error "Invalid coordinate, '$coords'." $caller_info
                                        }
                                    }
                                    i   -
                                    c   -
                                    m   -
                                    p   {
                                        set coord [string range $coord 0 end-1]

                                        if { ![string is double -strict $coord] || ( $coord < 0 ) } {
                                            ::ms::Error "Invalid coordinate, '$coords'." $caller_info
                                        }
                                    }
                                    default { ::ms::Error "Invalid coordinate, '$coords'." $caller_info }
                                }
                            }
                        }
                        default { ::ms::Error "Invalid number of coordinates, '$coords'." $caller_info }
                    }

                    # Check that the remaining 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            ###############################################
                            ##                                           ##
                            ##     CHECK THE CREATE OPTIONS PROVIDED     ##
                            ##                                           ##
                            ###############################################

                            # Check the remaining widget's options, if any.
                            set new_args [list ]
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -activebackground   -
                                    -activefill         -
                                    -activeforeground   -
                                    -activeoutline      -
                                    -background         -
                                    -disabledbackground -
                                    -disabledfill       -
                                    -disabledforeground -
                                    -disabledoutline    -
                                    -fill               -
                                    -foreground         -
                                    -outline            {
                                        set result [::ms::Check_Color $value invalid]
                                        switch -- $result {
                                            invalid { ::ms::Error "'$value' is not a valid color." $caller_info }
                                            default { lappend new_args $option $result }
                                        }
                                    }
                                    -activebitmap           -
                                    -activedash             -
                                    -activeimage            -
                                    -activeoutlinestipple   -
                                    -activestipple          -
                                    -activewidth            -
                                    -anchor                 -
                                    -angle                  -
                                    -arrow                  -
                                    -arrowshape             -
                                    -bitmap                 -
                                    -capstyle               -
                                    -dash                   -
                                    -dashoffset             -
                                    -disabledbitmap         -
                                    -disableddash           -
                                    -disabledimage          -
                                    -disabledoutlinestipple -
                                    -disabledstipple        -
                                    -disabledwidth          -
                                    -extent                 -
                                    -font                   -
                                    -height                 -
                                    -image                  -
                                    -joinstyle              -
                                    -justify                -
                                    -offset                 -
                                    -outlineoffset          -
                                    -outlinestipple         -
                                    -start                  -
                                    -state                  -
                                    -stipple                -
                                    -style                  -
                                    -smooth                 -
                                    -splinesteps            -
                                    -tags                   -
                                    -text                   -
                                    -underline              -
                                    -width                  { lappend new_args $option $value }
                                    -window {
                                        # Get the 'window' real address.
                                        set result [::ms::Check_Pathname $window invalid]
                                        switch -- $result {
                                            invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                            default { lappend new_args -window [lindex $result 0] }
                                        }
                                    }
                                    default { ::ms::Error "Invalid create option, '$option'." $caller_info }
                                }
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }

                    switch -- $::ms::current($w,scrollable) {
                        false {
                            # Execute the command.
                            try {
                                interp invokehidden {} $w $cmd $type $coords {*}$new_args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        true {
                            # Execute the command.
                            try {
                                $w.canvas $cmd $type $coords {*}$new_args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                    }
                }
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

            update idletasks

            # Get the height and width of the container ('$w').
            set height [_winfo height $w]
            set width  [_winfo width  $w]

            # Get the root coordinates of the north-west corner of the container ('$w').
            set X1 [_winfo rootx $w]
            set Y1 [_winfo rooty $w]

            # Compute the root coordinate of the south-east corner of the container ('$w').
            set X2 [expr { $X1+$width}]
            set Y2 [expr { $Y1+$height}]

            # Transform the relative coordinates provided into root coordinates.
            set X [expr { $X1+$x }]
            set Y [expr { $Y1+$y }]

            # Check if the root coordinates (X,Y) are outside the (X1,Y1)-(X2,Y2) root coordinates.
            if { ($X < $X1) || ($X > $X2) || ($Y < $Y1) || ($Y > $Y2) } {
                return ""
            }

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { return "Canvas.area" }
                true  {
                    # Get the widget address containing the point given by the root coordinates calculated.
                    set widget [_winfo containing -display $w $X $Y]

                    # Execute the command.
                    if { $widget eq $w } {
                        return "Canvas.hull"
                    } elseif { $widget eq "$w.x" } {
                        return "Canvas.x"
                    } elseif { $widget eq "$w.y" } {
                        return "Canvas.y"
                    } else {
                        return "Canvas.area"
                    }
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

                    # Note: 'borderwidth', 'cursor', 'insertwidth', 'relief' and 'selectborderwidth' are not allowed to change if the statespec changes.

                    # Note: Tk canvases don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

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

                    # insertbackground
                    switch -- $::ms::managed_by($w,insertbackground) {
                        developer { set insertbackground $::ms::current($w,insertbackground) }
                        Tk        { set insertbackground [_ttk_style lookup $::ms::current($w,style) -insertbackground $::ms::data($w,statespec) $::ms::default($w,insertbackground)] }
                    }

                    # selectbackground
                    switch -- $::ms::managed_by($w,selectbackground) {
                        developer { set selectbackground $::ms::current($w,selectbackground) }
                        Tk        { set selectbackground [_ttk_style lookup $::ms::current($w,style) -selectbackground $::ms::data($w,statespec) $::ms::default($w,selectbackground)] }
                    }

                    # selectforeground
                    switch -- $::ms::managed_by($w,selectforeground) {
                        developer { set selectforeground $::ms::current($w,selectforeground) }
                        Tk        { set selectforeground [_ttk_style lookup $::ms::current($w,style) -selectforeground $::ms::data($w,statespec) $::ms::default($w,selectforeground)] }
                    }

                    # Set the canvas options.
                    set canvas_options [list       -background $background \
                                             -insertbackground $insertbackground \
                                             -selectbackground $selectbackground \
                                             -selectforeground $selectforeground];

                    # Note: The '-bordercolor' option is not understanded by Tk canvases, but is made available trough
                    #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                    #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                    #       like it behaves in other widgets that understands the bordercolor.

                    # Check the 'relief' type.
                    switch -- $::ms::current($w,relief) {
                        flat  -
                        solid {
                            lappend canvas_options -highlightbackground $bordercolor \
                                                        -highlightcolor $bordercolor;
                        }
                        default {
                            lappend canvas_options -highlightbackground $background \
                                                        -highlightcolor $background;
                        }
                    }

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            ###########################
                            ##                       ##
                            ##     SIMPLE CANVAS     ##
                            ##                       ##
                            ###########################

                            # Apply the changes.
                            interp invokehidden {} $w configure {*}$canvas_options
                        }
                        true {
                            ###############################
                            ##                           ##
                            ##     SCROLLABLE CANVAS     ##
                            ##                           ##
                            ###############################

                            # Apply the changes.
                            interp invokehidden {} $w state $::ms::data($w,statespec)
                            $w.fake_x state $::ms::data($w,statespec)
                            $w.fake_y state $::ms::data($w,statespec)
                            $w.canvas configure {*}$canvas_options
                        }
                    }

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
            # *window* **xview** **moveto** *fraction*
            # *window* **xview** **scroll** *number* *what*
            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.text] }
            }

            # Check the subcommand.
            switch -nocase -- $subcommand {
                ""  {
                    # Execute the command.
                    try {
                        {*}$address xview
                    } on error {} {
                        return ""
                    } on ok { result } {
                        return $result
                    }
                }
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

                    # Execute the command.
                    try {
                        {*}$address xview moveto $fraction
                    } on error {} {
                        return ""
                    }

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
                        pages   { set what "pages" }
                        units   { set what "units" }
                        default { return "" }
                    }

                    # Execute the command.
                    try {
                        {*}$address xview scroll $number $what
                    } on error {} {
                        return ""
                    }

                    return ""
                }
                default { ::ms::Error "Invalid xview option, '$subcommand'." $caller_info }
            }
        }
        yview {
            # Synopsis:
            #
            # *window* **yview**
            # *window* **yview** **moveto** *fraction*
            # *window* **yview** **scroll** *number* *what*
            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.text] }
            }

            # Check the subcommand.
            switch -nocase -- $subcommand {
                ""  {
                    # Execute the command.
                    try {
                        {*}$address yview
                    } on error {} {
                        return ""
                    } on ok { result } {
                        return $result
                    }
                }
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

                    # Execute the command.
                    try {
                        {*}$address yview moveto $fraction
                    } on error {} {
                        return ""
                    }

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
                        pages   { set what "pages" }
                        units   { set what "units" }
                        default { return "" }
                    }

                    # Execute the command.
                    try {
                        {*}$address yview scroll $number $what
                    } on error {} {
                        return ""
                    }

                    return ""
                }
                default { ::ms::Error "Invalid yview option, '$subcommand'." $caller_info }
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
# Update any canvas widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::canvas::Style_Update { stylename caller_info } {
    # Update all the canvas widgets that have stylename as a style.
    foreach w $::ms::style($stylename,canvas,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::canvas(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Canvas,$option)

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

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'borderwidth', 'cursor', 'insertwidth', 'relief' and 'selectborderwidth' are not allowed to change if the statespec changes.

        # background
        switch -- $::ms::managed_by($w,background) {
            developer { set background $::ms::current($w,background) }
            Tk        { set background [_ttk_style lookup $stylename -background $::ms::data($w,statespec) $::ms::default($w,background)] }
        }

        # bordercolor
        switch -- $::ms::managed_by($w,bordercolor) {
            developer { set bordercolor $::ms::current($w,bordercolor) }
            Tk        { set bordercolor [_ttk_style lookup $stylename -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
        }

        # insertbackground
        switch -- $::ms::managed_by($w,insertbackground) {
            developer { set insertbackground $::ms::current($w,insertbackground) }
            Tk        { set insertbackground [_ttk_style lookup $stylename -insertbackground $::ms::data($w,statespec) $::ms::default($w,insertbackground)] }
        }

        # selectbackground
        switch -- $::ms::managed_by($w,selectbackground) {
            developer { set selectbackground $::ms::current($w,selectbackground) }
            Tk        { set selectbackground [_ttk_style lookup $stylename -selectbackground $::ms::data($w,statespec) $::ms::default($w,selectbackground)] }
        }

        # selectforeground
        switch -- $::ms::managed_by($w,selectforeground) {
            developer { set selectforeground $::ms::current($w,selectforeground) }
            Tk        { set selectforeground [_ttk_style lookup $stylename -selectforeground $::ms::data($w,statespec) $::ms::default($w,selectforeground)] }
        }

        # Set the canvas options.
        set canvas_options [list        -background $background \
                                            -cursor $cursor \
                                  -insertbackground $insertbackground \
                                 -insertborderwidth $::ms::current($w,insertborderwidth) \
                                  -selectbackground $selectbackground \
                                 -selectborderwidth $::ms::current($w,selectborderwidth) \
                                  -selectforeground $selectforeground];

        # Note: The '-bordercolor' option is not understanded by Tk canvases, but is made available trough
        #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
        #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
        #       like it behaves in other widgets that understands the bordercolor.

        # Check the 'relief' type.
        switch -- $::ms::current($w,relief) {
            flat  -
            solid {
                lappend canvas_options         -borderwidth 0 \
                                       -highlightbackground $bordercolor \
                                            -highlightcolor $bordercolor \
                                        -highlightthickness $::ms::current($w,borderwidth) \
                                                    -relief flat;
            }
            default {
                lappend canvas_options         -borderwidth $::ms::current($w,borderwidth) \
                                       -highlightbackground $background \
                                            -highlightcolor $background \
                                        -highlightthickness 0 \
                                                    -relief $::ms::current($w,relief);
            }
        }

        # Check if the widget is scrollable or not.
        switch -- $::ms::current($w,scrollable) {
            false {
                ###########################
                ##                       ##
                ##     SIMPLE CANVAS     ##
                ##                       ##
                ###########################

                ####################
                ##                ##
                ##     CANVAS     ##
                ##                ##
                ####################

                # Note: Tk canvases don't understands styles, at least not natively.
                #       No internal styles needs to be created.

                # Apply the changes.
                interp invokehidden {} $w configure {*}$canvas_options
            }
            true {
                ###############################
                ##                           ##
                ##     SCROLLABLE CANVAS     ##
                ##                           ##
                ###############################

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
                        # Check if a 'shellbackground' mapping exists for 'stylename'.
                        switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,shellbackground)] {
                            1   { lappend mapping -background $::ms::stylemap($::ms::theme,$stylename,shellbackground) }
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

                ####################
                ##                ##
                ##     CANVAS     ##
                ##                ##
                ####################

                # Note: Tk Canvases don't understands styles, at least not natively.
                #       No internal styles needs to be created.

                # Apply the changes.
                $w.canvas {*}$canvas_options

                ########################
                ##                    ##
                ##     SCROLLBARS     ##
                ##                    ##
                ########################

                # Update the fake scrollbars.
                $w.fake_x configure -height $::ms::size($::ms::theme,scrollbar) \
                                     -style $::ms::style($w,hull);

                $w.fake_y configure -style $::ms::style($w,hull) \
                                    -width $::ms::size($::ms::theme,scrollbar);

                # Update the scrollbars.
                ::ms::canvas::Scrollbar_Update $w
            }
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
proc ::ms::canvas::Configure { w } {
    # Check if we are here due to a widget configure command or not.
    switch -- [info exists ::ms::temp($w,height)] {
        1   {
            set ::ms::current($w,height) $::ms::temp($w,height)
            set ::ms::current($w,width)  $::ms::temp($w,width)
        }
    }

    # If needed, update the scrollbars.
    switch -- $::ms::current($w,scrollable) {
        true { ::ms::canvas::Scrollbar_Update $w }
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
proc ::ms::canvas::Destroy { w } {
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

    # Remove the widget address from the canvas classtype widgets real address list.
    set index [lsearch -exact $::ms::addr(canvas,classtype) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(canvas,classtype) [lremove $::ms::addr(canvas,classtype) $index] }
    }

    # Remove the widget address from the canvas classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),canvas,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),canvas,addrs) [lremove $::ms::class($::ms::current($w,class),canvas,addrs) $index] }
    }

    # Remove the widget address from the canvas classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),canvas,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),canvas,addrs) [lremove $::ms::style($::ms::current($w,style),canvas,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the canvas classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),canvas,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(canvas,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(canvas,classtype) [lremove $::ms::style(canvas,classtype) $index] }
            }
        }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false {
            ###########################
            ##                       ##
            ##     SIMPLE CANVAS     ##
            ##                       ##
            ###########################

            # Remove the widget address from the list of all available real addresses.
            set index [lsearch -exact $::ms::addr(reals) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
            }
        }
        true {
            ###############################
            ##                           ##
            ##     SCROLLABLE CANVAS     ##
            ##                           ##
            ###############################

            # Remove every widget's objects addresses from the list of all available real addresses.
            foreach object [list $w \
                                 $w.canvas \
                                 $w.x \
                                 $w.y] {
                set index [lsearch -exact $::ms::addr(reals) $object]
                switch -- $index {
                    -1      {}
                    default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
                }
            }

            # Remove the widget address from the megawidget real address list.
            set index [lsearch -exact $::ms::addr(megawidgets) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(megawidgets) [lremove $::ms::addr(megawidgets) $index] }
            }

            # Remove the widget address from the megawidget container real address list.
            set index [lsearch -exact $::ms::addr(megawidgets,containers) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(megawidgets,containers) [lremove $::ms::addr(megawidgets,containers) $index] }
            }

            # Remove the widget address from the megawidget scrollable real address list.
            set index [lsearch -exact $::ms::addr(megawidgets,scrollable) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(megawidgets,scrollable) [lremove $::ms::addr(megawidgets,scrollable) $index] }
            }
        }
    }

    # Destroy the bindings for the widget real address in its related toplevel.
    ::ms::CleanUp $w

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short) \
                         ::ms::addr($w.canvas,short) \
                         ::ms::addr($w.x,short) \
                         ::ms::addr($w.y,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,closeenough) \
                         ::ms::current($w,confine) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,height) \
                         ::ms::current($w,insertbackground) \
                         ::ms::current($w,insertborderwidth) \
                         ::ms::current($w,insertofftime) \
                         ::ms::current($w,insertontime) \
                         ::ms::current($w,insertwidth) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,scrollable) \
                         ::ms::current($w,scrollregion) \
                         ::ms::current($w,selectbackground) \
                         ::ms::current($w,selectborderwidth) \
                         ::ms::current($w,selectforeground) \
                         ::ms::current($w,shellbackground) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,xscrollcommand) \
                         ::ms::current($w,xscrollincrement) \
                         ::ms::current($w,yscrollcommand) \
                         ::ms::current($w,yscrollincrement) \
                         ::ms::current($w,width);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,scrollx) \
                         ::ms::data($w,scrolly) \
                         ::ms::data($w,statespec) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,closeenough) \
                         ::ms::default($w,confine) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,height) \
                         ::ms::default($w,insertbackground) \
                         ::ms::default($w,insertborderwidth) \
                         ::ms::default($w,insertofftime) \
                         ::ms::default($w,insertontime) \
                         ::ms::default($w,insertwidth) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,scrollable) \
                         ::ms::default($w,scrollregion) \
                         ::ms::default($w,selectbackground) \
                         ::ms::default($w,selectborderwidth) \
                         ::ms::default($w,selectforeground) \
                         ::ms::default($w,shellbackground) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,xscrollcommand) \
                         ::ms::default($w,xscrollincrement) \
                         ::ms::default($w,yscrollcommand) \
                         ::ms::default($w,yscrollincrement) \
                         ::ms::default($w,width);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,insertbackground) \
                         ::ms::managed_by($w,insertborderwidth) \
                         ::ms::managed_by($w,relief) \
                         ::ms::managed_by($w,selectbackground) \
                         ::ms::managed_by($w,selectborderwidth) \
                         ::ms::managed_by($w,selectforeground) \
                         ::ms::managed_by($w,shellbackground);

    unset -nocomplain -- ::ms::style($w,hull)

    return ""
}

## FocusOut
#
# Manage the **FocusOut** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::canvas::FocusOut { w } {
    # Check if a contextual menu was provided, if not use the widget's toplevel contextual menu.
    set cmenu $::ms::current($w,cmenu)
    switch -- $cmenu {
        ""  { set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu) }
    }

    # If the contextual menu of the widget exists and it's open, do not loose the focus (graphically).
    switch -- [_winfo exists $cmenu] {
        0   { ::ms::canvas::Pathname_Cmd $w state [list !focus] }
        1   { ::ms::canvas::Pathname_Cmd $w state [list  focus] }
    }

    return ""
}

#######################
##                   ##
##     SCROLLBAR     ##
##                   ##
#######################

## Scrollbar_ButtonPress
#
# Manage the **ButtonPress-1** event on the widget's internal scrollbars.
#
# Where:
#
# w        Should be the widget real address involved.
#
# orient   Specifies a string (**horizontal** or **vertical**) indicating
#          the orientation of the scrollbar.
#
# x, y     Should be the (x,y) mouse pointer coordinates of the event.
#          These values should be provided by the **ButtonPress** event.
#
# It doesn't return anything.
proc ::ms::canvas::Scrollbar_ButtonPress { w orient x y }  {
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
                                    ::ms::canvas::Pathname_Cmd $w xview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set xviews [$w.x get]
                                    set xview1 [lindex $xviews 0]
                                    set xview2 [lindex $xviews 1]

                                    if { $::ms::temp(fraction) < $xview1 } {
                                        # The User has click on the left trough.

                                        # Scroll the thumb by one page towards the left.
                                        ::ms::canvas::Pathname_Cmd $w xview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $xview2 } {
                                        # The User has click on the right trough.

                                        # Scroll the thumb by one page towards the right.
                                        ::ms::canvas::Pathname_Cmd $w xview scroll 1 pages

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
                                    ::ms::canvas::Pathname_Cmd $w yview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set yviews [$w.y get]
                                    set yview1 [lindex $yviews 0]
                                    set yview2 [lindex $yviews 1]

                                    if { $::ms::temp(fraction) < $yview1 } {
                                        # The User has click on the top trough.

                                        # Scroll the thumb by one page towards the top.
                                        ::ms::canvas::Pathname_Cmd $w yview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $yview2 } {
                                        # The User has click on the bottom trough.

                                        # Scroll the thumb by one page towards the bottom.
                                        ::ms::canvas::Pathname_Cmd $w yview scroll 1 pages

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
# Manage the **ButtonRelease-1** event on the widget's internal scrollbars.
#
# It doesn't return anything.
proc ::ms::canvas::Scrollbar_ButtonRelease {} {
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
# x, y     Should be the (x,y) mouse pointer coordinates of the event.
#          These values should be provided by the **B1-Motion** event.
#
# It doesn't return anything.
proc ::ms::canvas::Scrollbar_Drag { w orient x y } {
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
            ::ms::canvas::Pathname_Cmd $w xview moveto $fraction
        }
        vertical {
            # Compute the 'fraction' after the drag movement.
            set delta    [$w.y delta $delta_x $delta_y]
            set fraction [expr { $::ms::temp(fraction)+$delta }]

            # Move the vertical scrollbar to 'fraction'.
            ::ms::canvas::Pathname_Cmd $w yview moveto $fraction
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
proc ::ms::canvas::Scrollbar_Update { w } {
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

                # Display the fake horizontal scrollbar.
                _grid $w.fake_x -column 0 \
                                  -padx [list 0  0] \
                                  -pady [list 8p 0] \
                                   -row 1 \
                                -sticky we;

                # Set the horizontal scrollbar status to 'off'.
                set ::ms::data($w,scrollx) off
            }
        }
    } else {
        # Check if the horizontal scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrollx) {
            off {
                # Hide the fake horizontal scrollbar.
                _grid remove $w.fake_x

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

                # Display the fake vertical scrollbar.
                _grid $w.fake_y -column 1 \
                                  -padx [list 8p 0] \
                                  -pady [list 0  0] \
                                   -row 0 \
                                -sticky ns;

                # Set the vertical scrollbar status to 'off'.
                set ::ms::data($w,scrolly) off
            }
        }
    } else {
        # Check if the vertical scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrolly) {
            off {
                # Hide the fake vertical scrollbar.
                _grid remove $w.fake_y

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