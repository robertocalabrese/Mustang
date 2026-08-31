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

## text
#
#### DESCRIPTION:
#
# Create and manipulate 'text' hypertext editing widgets.
# The text command creates a new window (given by the *window* argument) and makes it into a text widget.
#
# A text widget displays one or more lines of text and allows that text to be edited.
# Text widgets support four different kinds of annotations on the text, called tags, marks, embedded windows or embedded images.
# Tags allow different portions of the text to be displayed with different fonts and colors.
# In addition, Tcl commands can be associated with tags so that scripts are invoked when particular actions such as keystrokes and
# mouse button presses occur in particular ranges of the text.
# See **TAGS** below for more details.
#
# The second form of annotation consists of floating markers in the text called "marks".
# Marks are used to keep track of various interesting positions in the text as it is edited.
# See **MARKS** below for more details.
#
# The third form of annotation allows arbitrary windows to be embedded in a text widget.
# See **EMBEDDED WINDOWS** below for more details.
#
# The fourth form of annotation allows Tk images to be embedded in a text widget.
# See **EMBEDDED IMAGES** below for more details.
#
# The text widget also has a built-in undo/redo mechanism.
# See **THE UNDO MECHANISM** below for more details.
#
# The text widget allows for the creation of peer widgets.
# These are other text widgets which share the same underlying data (text, marks, tags, images, etc).
# See **PEER WIDGETS** below for more details.
#
# The text command returns the pathname of the new window.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname,
#         but the pathname's parents must exists.
#         *Window* may be provided either as a short or as a real address, the address returned will be:
#            - A short address, if the *window* provided as input is a short address.
#            - A real address, if the *window* provided as input is a real address.
#
# Note 2: Depending on the **-scrollable** option value, two kinds of text structures are possible.
#         The mustang simple text (**-scrollable** false) is a single text widget.
#         The mustang scrollable text (**-scrollable** true) is a megawidget composed by an hull object (the megawidget container),
#         a text object and two scrollbar objects (displayed only when needed).
#
# Additional options, described below, may be specified on the command line to configure aspects of the text.
#
#### SYNOPSIS:
#
#   **text** *window* ?*option value*? ... ?*option value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-autoseparators**             Specifies a boolean value that says whether separators are automatically inserted in the undo stack.
#                                 The value may have any of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html),
#                                 such as **0**, **1**, **yes**, **no**, **true**, **false**, **enabled**, or **disabled**.
#                                 Only meaningful when the **-undo** option is **true**.
#
#                                 If not provided, defaults to **true**.
#
# **-blockcursor**                Specifies a boolean value that says whether the blinking insertion cursor should be drawn as a
#                                 character-sized rectangular block.
#                                 The value may have any of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html),
#                                 such as **0**, **1**, **yes**, **no**, **true**, **false**, **enabled**, or **disabled**.
#                                 If **false** (the default) a thin vertical line is used for the insertion cursor.
#                                 For further discussion refer to section **THE INSERTION CURSOR** below.
#
# **-background**                 It's a list that specifies the color to use as background.
#                                 See the **COLOR OPTION** section to know how this list should be composed.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                                If there isn't one, the **-background** of the **Text** style
#                                                                will be used instead.
#                                                                The **-background** will always abide by its mapping values, if any.
#                                                                Styles, mappings and states events are allowed to change its value.
#
#                                 See also **-shellbackground**.
#
# **-bordercolor**                It's a list that specifies the color to use as bordercolor.
#                                 See the **COLOR OPTION** section to know how this list should be composed.
#
#                                 Note: It's only meaningful for widgets with a **solid** or **flat** relief.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                                If there isn't one, the **-bordercolor** of the **Text** style
#                                                                will be used instead.
#                                                                The **-bordercolor** will always abide by its mapping values, if any.
#                                                                Styles, mappings and states events are allowed to change its value.
#
#                                 See also **-borderwidth** and **-relief**.
#
# **-borderwidth**                Specifies the width of the three-dimensional border to draw around the outside of the widget,
#                                 if such a border is being drawn.
#                                 The **-relief** option typically determines this.
#
#                                 The value may also be used when drawing three-dimensional effects in the widget's interior.
#                                 The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                                 (pixels, points, inches, millimeters or centimeters).
#
#                                 Note: A value of **0** means no border.
#
#                                 Note: Only working with reliefs that are not *flat*.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-borderwidth** specified in its style.
#                                                                If there isn't one, the **-borderwidth** of the **Text** style
#                                                                will be used instead.
#                                                                The **-borderwidth** will not abide by its mapping values, if any.
#                                                                It is not supposed to change when the widget 'dynamic' state changes.
#
#                                 See also **-bordercolor** and **-relief**.
#
# **-class**                      Specifies a class for the widget.
#                                 It is mainly used to make bindings for widgets that have the same class.
#
#                                 Note: This option may only be provided while creating the widget.
#                                       Attempts to change this value after the widget is created by using the **configure** command,
#                                       will be ignored by mustang.
#
#                                 If not provided, defaults to **Text**.
#
# **-cmenu**                      Specifies the contextual menu address that will be assigned to the widget.
#
#                                 Simple text (**-scrollable false**):
#                                    The contextual menu will be assigned to the entire widget.
#
#                                 Scrollable text (**-scrollable true**):
#                                    The contextual menu will be assign to the *content* object of the megawidget (the *textarea*).
#                                    If the *cmenu* value is the empty string or invalid, nothing will happen.
#
#                                    The *hull* object will use instead the contextual menu of the widget's toplevel, if any.
#                                    If the developer needs a different contextual menu for it, a variable called
#                                    '::ms::data($short_addr,cmenu,shell)' can be set with a valid contextual menu address in
#                                    order to be used instead of the toplevel one.
#
#                                    Note: '$short_addr' must be the short address of the text widget.
#                                          See the [tk](/wiki/commands/tk.md) command to know more about short and real address.
#
#                                    If '::ms::data($short_addr,cmenu,shell)' is set with an empty string or with an invalid contextual menu
#                                    address, it will be ignored and the contextual menu of the widget's toplevel (if any) will be used.
#                                    If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                                    The *scrollbar* objects are not supposed to have a contextual menu and will not be link with any.
#
#                                 If not provided, defaults to the empty string.
#
#                                 See also **-scrollable**.
#
# **-columns**                    Specifies the desired columns for the window in units of characters in the font given by the **-font** option.
#                                 If the font does not have a uniform width then the width of the character **0** is used in translating from
#                                 character units to screen units.
#
#                                 Note: **-columns** must be a positive integer (**0** not included).
#
#                                 See also **-rows**.
#
# **-cursor**                     Specifies the mouse cursor to be used inside the text area.
#                                 If an empty string is specified, it indicates that the widget should defer to it's parent for
#                                 cursor specification.
#
#                                 See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                                If there isn't one, the **-cursor** of the **Text** style
#                                                                will be used instead.
#                                                                The **-cursor** will not abide by its mapping values, if any.
#                                                                It is not supposed to change when the widget 'dynamic' state changes.
#
# **-endline**                    Specifies an integer line index representing the line of the underlying textual data store that should be just after
#                                 the last line contained in the widget.
#                                 This allows a text widget to reflect only a portion of a larger piece of text.
#                                 Instead of an integer, the empty string can be provided to this configuration option, which will configure the widget
#                                 to end at the very last line in the textual data store.
#
#                                 If not provided, defaults to the empty string.
#
# **-exportselection**            Specifies whether or not a selection in the widget should also be the X selection.
#                                 The value may have any of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html),
#                                 such as **0**, **1**, **yes**, **no**, **true**, **false**, **enabled**, or **disabled**.
#
#                                 If the selection is exported, then selecting in the widget deselects the current X selection, selecting outside the
#                                 widget deselects any widget selection, and the widget will respond to selection retrieval requests when it has a selection.
#
#                                 If not provided, defaults to **1**.
#
# **-font**                       Specifies the font to use for the text displayed by the widget.
#                                 The widget will accept as fontname any font created with the **font** command, including any Tk
#                                 defaults fonts, the new mustang fonts (**BiggestFont**, **BiggerFont**, **NormalFont**, **SmallerFont**,
#                                 **SmallestFont** and **MonospaceFont**) or fonts defined by the developer itself.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-font** specified in its style.
#                                                                If there isn't one, the **-font** of the **Text** style
#                                                                will be used instead.
#                                                                The **-font** will not abide by its mapping values, if any.
#                                                                It is not supposed to change when the widget 'dynamic' state changes.
#
#                                 See also **-foreground**.
#
# **-foreground**                 It's a list that specifies the color to use as foreground.
#                                 See the **COLOR OPTION** section to know how this list should be composed.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-foreground** specified in its style.
#                                                                If there isn't one, the **-foreground** of the **Text** style
#                                                                will be used instead.
#                                                                The **-foreground** will always abide by its mapping values, if any.
#                                                                Styles, mappings and states events are allowed to change its value.
#
#                                 See also **-background** and **-font**.
#
# **-inactiveselectbackground**   Specifies the colour to use for the selection (the sel tag) when the window does not have the input focus.
#                                 If setted as the empty string, no selection is shown when the window does not have the focus.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-inactiveselectbackground** specified in its style.
#                                                                If there isn't one, the **-inactiveselectbackground** of the **Text** style
#                                                                will be used instead.
#                                                                The **-inactiveselectbackground** will not abide by its mapping values, if any.
#                                                                It is not supposed to change when the widget 'dynamic' state changes.
#
# **-insertbackground**           It's a list that specifies the color to use as background in the area covered by the insertion cursor.
#                                 This color will normally override either the normal background for the widget or the selection background
#                                 (if the insertion cursor happens to fall in the selection).
#                                 See the **COLOR OPTION** section to know how this list should be composed.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-insertbackground** specified in its style.
#                                                                If there isn't one, the **-insertbackground** of the **Text** style
#                                                                will be used instead.
#                                                                The **-insertbackground** will always abide by its mapping values, if any.
#                                                                Styles, mappings and states events are allowed to change its value.
#
#                                 See also **-selectbackground** and **-insertborderwidth**.
#
# **-insertborderwidth**          It's a list that specifies a non-negative value indicating the width of the 3-D border to draw around the insertion cursor.
#                                 The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#
#                                 Note: A value of **0** means no border.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-insertborderwidth** specified in its style.
#                                                                If there isn't one, the **-insertborderwidth** of the **Text** style
#                                                                will be used instead.
#                                                                The **-insertborderwidth** will not abide by its mapping values, if any.
#                                                                It is not supposed to change when the widget 'dynamic' state changes.
#
#                                 See also **-selectborderwidth**.
#
# **-insertofftime**              Specifies a non-negative integer value indicating the number of milliseconds the insertion cursor should remain "off" in
#                                 each blink cycle.
#                                 If this option is zero then the cursor does not blink: it is on all the time.
#
#                                 If not provided, defaults to **300** milliseconds.
#
#                                 See also **-insertontime**.
#
# **-insertontime**               Specifies a non-negative integer value indicating the number of milliseconds the insertion cursor should remain "on" in
#                                 each blink cycle.
#
#                                 If not provided, defaults to **600** milliseconds.
#
#                                 See also **-insertofftime**.
#
# **-insertunfocussed**           Specifies how to display the insertion cursor when the widget does not have the focus.
#                                 Must be **none** which means to not display the cursor, **hollow** which means to display a hollow box,
#                                 or **solid** which means to display a solid box.
#                                 Note that *hollow* and *solid* will appear very similar when the **-blockcursor** option is **false**.
#
#                                 If not provided, defaults to **none**.
#
# **-insertwidth**                Specifies a non-negative value indicating the total width of the insertion cursor.
#                                 The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#                                 If a border has been specified for the insertion cursor (using the *-insertborderwidth* option), the border will be drawn
#                                 inside the width specified by the *-insertwidth* option.
#
#                                 If not provided, defaults to **2**.
#
# **-maxundo**                    Specifies the maximum number of compound undo actions on the undo stack.
#                                 A zero or a negative value imply an unlimited undo stack.
#
#                                 If not provided, defaults to **0**.
#
# **-padding**                    Specifies the internal padding for the widget.
#                                 The padding is normally a list of up to four length specifications.
#
#                                 The values must be in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                                 (pixels, points, inches, millimeters or centimeters).
#
#                                 Note: Text and and toplevel paddings differs from any other widget paddings.
#                                       A list of two values specifies the horizontal and the vertical padding.
#                                       A single value specifies the same padding all the way around the widget.
#                                       The third and forth values, if present, will be silently ignored.
#                                       If the '::DEBUG' variable is enabled a communication will be displayed in the stdout channel.
#
#                                 When computing how large a window it needs, the widget will add this amount to the width it would
#                                 normally need (as determined by the width of the things displayed in the widget).
#                                 If the geometry manager can satisfy this request, the widget will end up with extra internal space
#                                 to the left and/or right of what it displays inside.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-padding** specified in its style.
#                                                                If there isn't one, the **-padding** of the **Text** style
#                                                                will be used instead.
#                                                                The **-padding** will not abide by its mapping values, if any.
#                                                                It is not supposed to change when the widget 'dynamic' state changes.
#
# **-relief**                     Specifies the three-dimensional effect desired for the widget.
#                                 The value indicates how the widget's interior should appear relative to its exterior.
#                                 For example, *raised* means the widget's interior should appear to protrude from the screen,
#                                 relative to the exterior of the widget.
#
#                                 The widget will accept as relief any of the following values:
#                                    **flat**,
#                                    **groove**,
#                                    **raised**,
#                                    **ridge**,
#                                    **solid**,
#                                    **sunken**.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-relief** specified in its style.
#                                                                If there isn't one, the **-relief** of the **Text** style
#                                                                will be used instead.
#                                                                The **-relief** will not abide by its mapping values, if any.
#                                                                It is not supposed to change when the widget 'dynamic' state changes.
#
#                                 See also **-bordercolor** and **-borderwidth**.
#
# **-rows**                       Specifies the desired rows for the window, in units of characters in the font given by the **-font** option.
#                                 If the font does not have a uniform height then the height of the character **0** is used in translating from
#                                 character units to screen units.
#
#                                 Note: **-rows** must be a positive integer (**0** not included).
#
#                                 See also **-columns**.
#
# **-scrollable**                 Specifies a boolean value indicating wheter or not the widget should be scrollable.
#                                 The value may have any of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html),
#                                 such as **0**, **1**, **yes**, **no**, **true**, **false**, **enabled**, or **disabled**.
#                                 If **true**, a megawidget structure (with two scrollbars) will be constructed instead of a single text widget.
#
#                                 The scrollbars will be automatically managed by Tk with the following rules:
#                                    The horizontal scrollbar is defined to be *needed* each time the widget *content* width is bigger then
#                                    the widget *viewport* width and *not needed* when it's not.
#
#                                    The vertical scrollbar is defined to be *needed* each time the widget *content* height is bigger then
#                                    the widget *viewport* height and *not needed* when it's not.
#
#                                    If a scrollbar is currently needed, then it will be displayed (if it's not already displayed).
#                                    If a scrollbar is not currently needed, then it will not be displayed (or removed if it was
#                                    already displayed).
#
#                                 Note: This option may be provided while creating the widget.
#                                       Attempts to change this value after the widget was created by using the **configure** command,
#                                       will be ignored by mustang.
#
#                                 If not provided, defaults to **false** (meaning no scrollbar).
#
# **-selectbackground**           It's a list that specifies the background color to use when displaying selected items.
#                                 See the **COLOR OPTION** section to know how this list should be composed.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-selectbackground** specified in its style.
#                                                                If there isn't one, the **-selectbackground** of the **Text** style
#                                                                will be used instead.
#                                                                The **-selectbackground** will always abide by its mapping values, if any.
#                                                                Styles, mappings and states events are allowed to change its value.
#
#                                 See also **-selectforeground** and **-insertborderwidth**.
#
# **-selectborderwidth**          Specifies a non-negative value indicating the width of the 3-D border to draw around selected items.
#                                 The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#
#                                 Note: A value of **0** means no border.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-selectborderwidth** specified in its style.
#                                                                If there isn't one, the **-selectborderwidth** of the **Text** style
#                                                                will be used instead.
#                                                                The **-selectborderwidth** will not abide by its mapping values, if any.
#                                                                It is not supposed to change when the widget 'dynamic' state changes.
#
#                                 See also **-selectbackground** and **-selectforeground**.
#
# **-selectforeground**           It's a list that specifies the foreground color to use when displaying selected items.
#                                 See the **COLOR OPTION** section to know how this list should be composed.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-selectforeground** specified in its style.
#                                                                If there isn't one, the **-selectforeground** of the **Text** style
#                                                                will be used instead.
#                                                                The **-selectforeground** will always abide by its mapping values, if any.
#                                                                Styles, mappings and states events are allowed to change its value.
#
#                                 See also **-selectbackground** and **-selectborderwidth**.
#
# **-setgrid**                    Specifies a boolean value that determines whether this widget controls the resizing grid for its top-level window.
#                                 The value may have any of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html),
#                                 such as **0**, **1**, **yes**, **no**, **true**, **false**, **enabled**, or **disabled**.
#
#                                 This option is typically used in text widgets, where the information in the widget has a natural size (the size of
#                                 a character) and it makes sense for the window's dimensions to be integral numbers of these units.
#                                 These natural window sizes form a grid.
#                                 If the **-setgrid** option is set to *true* then the widget will communicate with the window manager so that when the user
#                                 interactively resizes the top-level window that contains the widget, the dimensions of the window will be displayed to the
#                                 user in grid units and the window size will be constrained to integral numbers of grid units.
#                                 See the section **GRIDDED GEOMETRY MANAGEMENT** in the [wm](/wiki/commands/wm.md) manual entry for more details.
#
# **-shellbackground**            It's a list that specifies the color to use as background structure.
#                                 This color will be used in the interspaces between the mustang objects that compose the widget and should
#                                 reflects the widget's parent background.
#                                 See the **COLOR OPTION** section to know how this list should be composed.
#
#                                 Note: This is a styleable option.
#
#                                       If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                                Only the developer can.
#
#                                       If it's not provided --> The widget will follow the **-shellbackground** specified in its style.
#                                                                If there isn't one, the **-shellbackground** of the **Text** style
#                                                                will be used instead.
#                                                                The **-shellbackground** will always abide by its mapping values, if any.
#                                                                Styles, mappings and states events are allowed to change its value.
#
#                                                                Note: The **-shellbackground** should change rarely, for example upon
#                                                                      an **Activate**/**Deactivate** event.
#
#                                 See also **-background**.
#
# **-spacing1**                   Requests additional space above each text line in the widget, using any of the standard forms for screen distances.
#                                 If a line wraps, this option only applies to the first line on the display.
#                                 This option may be overridden with **-spacing1** options in tags.
#
#                                 If not provided, defaults to **0**.
#
# **-spacing2**                   For lines that wrap (so that they cover more than one line on the display) this option specifies additional space
#                                 to provide between the display lines that represent a single line of text.
#                                 The value may have any of the standard forms for screen distances.
#                                 This option may be overridden with **-spacing2** options in tags.
#
#                                 If not provided, defaults to **0**.
#
# **-spacing3**                   Requests additional space below each text line in the widget, using any of the standard forms for screen distances.
#                                 If a line wraps, this option only applies to the last line on the display.
#                                 This option may be overridden with **-spacing3** options in tags.
#
#                                 If not provided, defaults to **0**.
#
# **-startline**                  Specifies an integer line index representing the first line of the underlying textual data store that should be
#                                 contained in the widget.
#                                 This allows a text widget to reflect only a portion of a larger piece of text.
#                                 Instead of an integer, the empty string can be provided to this configuration option, which will configure the widget
#                                 to start at the very first line in the textual data store.
#
#                                 If not provided, defaults to the empty string.
#
# **-state**                      Specifies the 'physical' state for the widget.
#                                 The text widget 'physical' state acts differently than in the other widgets due to it's a classic widget nature that
#                                 do not support natively any 'dynamic' states.
#                                 Changes to the widget's 'physical' state affects the widget's 'dynamic' state.
#                                 Allowed 'physical' states values are **normal** and **disabled**.
#
#                                 If the text is disabled then characters may not be inserted or deleted and no insertion cursor will be displayed,
#                                 even if the input focus is in the widget.
#
#                                 If not provided, defaults to **normal**.
#
# **-style**                      Specifies a custom widget style.
#                                 If not provided, defaults to **Text**.
#
#                                 The *style* provided should already exists at the time the widget is created.
#
#                                 See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-tabs**                       Specifies a set of tab stops for the window.
#                                 The option's value consists of a list of screen distances giving the positions of the tab stops, each of which is a
#                                 distance relative to the left edge of the widget (excluding borders, padding, etc).
#                                 Each position may optionally be followed in the next list element by one of the keywords **left**, **right**, **center**,
#                                 or **numeric**, which specifies how to justify text relative to the tab stop.
#
#                                 **Left** is the default; it causes the text following the tab character to be positioned with its left edge at the
#                                 tab position.
#                                 **Right** means that the right edge of the text following the tab character is positioned at the tab position,
#                                 and center means that the text is centered at the tab position.
#                                 **Numeric** means that the decimal point in the text is positioned at the tab position; if there is no decimal point
#                                 then the least significant digit of the number is positioned just to the left of the tab position; if there is no
#                                 number in the text then the text is right-justified at the tab position.
#                                 For example, **-tabs {2c left 4c 6c center}** creates three tab stops at two-centimeter intervals; the first two use
#                                 left justification and the third uses center justification.
#
#                                 If the list of tab stops does not have enough elements to cover all of the tabs in a text line, then Tk extrapolates
#                                 new tab stops using the spacing and alignment from the last tab stop in the list.
#                                 Tab distances must be strictly positive, and must always increase from one tab stop to the next (if not, an error is thrown).
#                                 The value of the -tabs option may be overridden by **-tabs** options in tags.
#
#                                 If no **-tabs** option is specified, or if it is specified as an empty list, then Tk uses default tabs spaced every eight
#                                 (average size) characters.
#                                 To achieve a different standard spacing, for example every 4 characters, simply configure the widget with
#                                 **-tabs "[expr {4 * [font measure $font 0]}] left" -tabstyle wordprocessor**.
#
# **-tabstyle**                   Specifies how to interpret the relationship between tab stops on a line and tabs in the text of that line.
#                                 The value must be **tabular** (the default) or **wordprocessor**.
#                                 Note that tabs are interpreted as they are encountered in the text.
#                                 If the tab style is *tabular* then the n'th tab character in the line's text will be associated with the n'th tab stop
#                                 defined for that line. If the tab character's x coordinate falls to the right of the n'th tab stop, then a gap of a single
#                                 space will be inserted as a fallback.
#                                 If the tab style is **wordprocessor** then any tab character being laid out will use (and be defined by) the first tab stop
#                                 to the right of the preceding characters already laid out on that line.
#                                 The value of the **-tabstyle** option may be overridden by **-tabstyle** options in tags.
#
# **-takefocus**                  Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                                 and **Shift-Tab**).
#
#                                 Before setting the focus to a widget, the traversal scripts consult the value of the *-takefocus* option.
#                                 Allowed values are:
#                                    **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                                    **1** --> It means that the widget should receive the input focus as long as it is viewable and all of its ancestors are mapped.
#
#                                 Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                                 Note: If the widget's 'physycal' state is set to **disabled**, mustang will internally set the takefocus value to **0**.
#                                       If the widget's 'physycal' state is set to **normal**, mustang will internally set the takefocus value with the
#                                       value provided by the developer (either **0** or **1**).
#
#                                 If not provided, defaults to **0**.
#
# **-undo**                       Specifies a boolean that says whether the undo mechanism is active or not.
#                                 The value may have any of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html),
#                                 such as **0**, **1**, **yes**, **no**, **true**, **false**, **enabled**, or **disabled**.
#
#                                 If not provided, defaults to **0**.
#
# **-wrap**                       Specifies how to handle lines in the text that are too long to be displayed in a single line of the text's window.
#                                 The value must be **none** or **char** or **word**.
#                                 A wrap mode of *none* means that each line of text appears as exactly one line on the screen; extra characters that
#                                 do not fit on the screen are not displayed.
#                                 In the other modes each line of text will be broken up into several screen lines if necessary to keep all the
#                                 characters visible. In *char* mode a screen line break may occur after any character; in *word* mode a line break will
#                                 only be made at word boundaries.
#
#                                 If not provided, defaults to **word**.
#
# **-xscrollcommand**             Specifies the prefix for a command used to communicate with horizontal scrollbars.
#                                 When the view in the widget's window changes (or whenever anything else occurs that could change the display
#                                 in a scrollbar, such as a change in the total size of the widget's contents), the widget will generate a
#                                 Tcl command by concatenating the scroll command and two numbers.
#
#                                 Each of the numbers is a fraction between **0** and **1.0**, which indicates a position in the document.
#                                 **0** indicates the beginning of the document, **1.0** indicates the end, **0.333** indicates a position
#                                 one third the way through the document, and so on.
#
#                                 The first fraction indicates the first information in the document that is visible in the window, and the
#                                 second fraction indicates the information just after the last portion that is visible.
#                                 The command is then passed to the Tcl interpreter for execution.
#
#                                 Typically the **-xscrollcommand** option consists of the path name of a scrollbar widget followed by **set**,
#                                 e.g. **.x_scrollbar set**: this will cause the scrollbar to be updated whenever the view in the window changes.
#                                 If this option is not specified, then no command will be executed.
#
#                                 Note: This option is ignored for scrollable text (**-scrollable true**) where its value is forced to the empty string.
#
#                                 If not specified defaults to the empty string.
#
#                                 See also **-yscrollcommand** and **-scrollable**.
#
# **-yscrollcommand**             Specifies the prefix for a command used to communicate with vertical scrollbars.
#                                 When the view in the widget's window changes (or whenever anything else occurs that could change the display
#                                 in a scrollbar, such as a change in the total size of the widget's contents), the widget will generate a
#                                 Tcl command by concatenating the scroll command and two numbers.
#
#                                 Each of the numbers is a fraction between **0** and **1.0**, which indicates a position in the document.
#                                 **0** indicates the beginning of the document, **1.0** indicates the end, **0.333** indicates a position
#                                 one third the way through the document, and so on.
#
#                                 The first fraction indicates the first information in the document that is visible in the window, and the
#                                 second fraction indicates the information just after the last portion that is visible.
#                                 The command is then passed to the Tcl interpreter for execution.
#
#                                 Typically the **-yscrollcommand** option consists of the path name of a scrollbar widget followed by **set**,
#                                 e.g. **.y_scrollbar set**: this will cause the scrollbar to be updated whenever the view in the window changes.
#                                 If this option is not specified, then no command will be executed.
#
#                                 Note: This option is ignored for scrollable text (**-scrollable true**) where its value is forced to the empty string.
#
#                                 If not specified defaults to the empty string.
#
#                                 See also **-xscrollcommand** and **-scrollable**.
#
#
#### WIDGET COMMAND:
#
# The text command creates a new command whose name is the same as the pathname of the text's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the text widget's pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for text widgets:
#
#   *window* **bbox** *index*
#     Returns a list of four elements describing the screen area of the character given by *index*.
#     The first two elements of the list give the x and y coordinates of the upper-left corner of the area occupied by the character,
#     and the last two elements give the width and height of the area.
#     If the character is only partially visible on the screen, then the return value reflects just the visible part.
#     If the character is not visible on the screen then the return value is an empty list.
#
#   *window* **cget** *option*
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the frame command (See **WIDGET OPTIONS**).
#
#   *window* **compare** *index1* *op* *index2*
#     Compares the indices given by *index1* and *index2* according to the relational operator given by *op*, and returns **1** if the
#     relationship is satisfied and **0** if it is not.
#     *Op* must be one of the operators **<**, **<=**, **==**, **>=**, **>**, or **!=**.
#     If *op* is **==** then **1** is returned if the two indices refer to the same character, if *op* is **<** then **1** is returned if
#     *index1* refers to an earlier character in the text than *index2*, and so on.
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
#   *window* **count** ?*options*? *index1* *index2*
#     Counts the number of relevant things between the two indices.
#     If *index1* is after *index2*, the result will be a negative number (and this holds for each of the possible options).
#     The actual items which are counted depend on the options given.
#     The result is a list of integers, one for the result of each counting option given.
#     Valid counting options are **-chars**, **-displaychars**, **-displayindices**, **-displaylines**, **-indices**, **-lines**,
#     **-xpixels** and **-ypixels**.
#
#     The default value, if no option is specified, is **-indices**.
#
#     There is an additional possible option **-update** which is a modifier.
#     If given (and if the text widget is managed by a geometry manager), then all subsequent options ensure that any possible out
#     of date information is recalculated.
#     This currently only has any effect for the **-ypixels** count (which, if **-update** is not given, will use the text widget's current
#     cached value for each line).
#     This **-update** option is obsoleted by **window sync**, **window pendingsync** and **WidgetViewSync**.
#     The count options are interpreted as follows:
#
#        **-chars**
#           Count all characters, whether elided or not.
#           Do not count embedded windows or images.
#
#        **-displaychars**
#           Count all non-elided characters.
#
#        **-displayindices**
#           Count all non-elided characters, windows and images.
#
#        **-displaylines**
#           Count all display lines (i.e. counting one for each time a line wraps) from the line of the first index up to, but not including
#           the display line of the second index.
#           Therefore if they are both on the same display line, zero will be returned.
#           By definition displaylines are visible and therefore this only counts portions of actual visible lines.
#
#        **-indices**
#           Count all characters and embedded windows or images (i.e. everything which counts in text-widget index space), whether they are
#           elided or not.
#
#        **-lines**
#           Count all logical lines (irrespective of wrapping) from the line of the first index up to, but not including the line of the second index.
#           Therefore if they are both on the same line, zero will be returned.
#           Logical lines are counted whether they are currently visible (non-elided) or not.
#
#        **-xpixels**
#           Count the number of horizontal pixels from the first pixel of the first index to (but not including) the first pixel of the second index.
#           To count the total desired width of the text widget (assuming wrapping is not enabled), first find the longest line and then use
#           **.text count -xpixels "${line}.0" "${line}.0 lineend"**.
#
#        **-ypixels**
#           Count the number of vertical pixels from the first pixel of the first index to (but not including) the first pixel of the second index.
#           If both indices are on the same display line, zero will be returned.
#           To count the total number of vertical pixels in the text widget, use **.text count -ypixels 1.0 end**, and to ensure this is up to date,
#           use **.text count -update -ypixels 1.0 end**.
#
#     The command returns a positive or negative integer corresponding to the number of items counted between the two indices.
#     One such integer is returned for each counting option given, so a list is returned if more than one option was supplied.
#     For example **.text count -xpixels -ypixels 1.3 4.5** is perfectly valid and will return a list of two elements.
#
#   *window* **debug** ?*boolean*?
#     If *boolean* is specified, then it must have one of the true or false values accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html).
#     If the value is a true one then internal consistency checks will be turned on in the B-tree code associated with text widgets.
#     If *boolean* has a false value then the debugging checks will be turned off.
#     In either case the command returns an empty string.
#     If *boolean* is not specified then the command returns on or off to indicate whether or not debugging is turned on.
#     There is a single debugging switch shared by all text widgets: turning debugging on or off in any widget turns it on or off for all widgets.
#     For widgets with large amounts of text, the consistency checks may cause a noticeable slow-down.
#
#     When debugging is turned on, the drawing routines of the text widget set the global variables **tk_textRedraw** and **tk_textRelayout** to
#     the lists of indices that are redrawn.
#     The values of these variables are tested by Tk's test suite.
#
#   *window* **delete** *index1* ?*index2* ... *indexn*?
#     Delete a range of characters from the text.
#     If both *index1* and *index2* are specified, then delete all the characters starting with the one given by *index1* and stopping just
#     before *index2* (i.e. the character at *index2* is not deleted).
#
#     If *index2* does not specify a position later in the text than *index1* then no characters are deleted.
#     If *index2* is not specified then the single character at *index1* is deleted.
#     Attempts to delete characters in a way that would leave the text without a newline as the last character will be tweaked by the text
#     widget to avoid this.
#     In particular, deletion of complete lines of text up to the end of the text will also delete the newline character just before the
#     deleted block so that it is replaced by the new final newline of the text widget.
#
#     If more indices are given, multiple ranges of text will be deleted.
#     All indices are first checked for validity before any deletions are made.
#     They are sorted and the text is removed from the last range to the first range so deleted text does not cause an undesired index
#     shifting side-effects.
#     If multiple ranges with the same start index are given, then the longest range is used.
#     If overlapping ranges are given, then they will be merged into spans that do not cause deletion of text outside the given ranges due
#     to text shifted during deletion.
#
#     The command returns an empty string.
#
#   *window* **dlineinfo** *index*
#     Returns a list with five elements describing the area occupied by the display line containing *index*.
#     The first two elements of the list give the x and y coordinates of the upper-left corner of the area occupied by the line, the third
#     and fourth elements give the width and height of the area, and the fifth element gives the position of the baseline for the line,
#     measured down from the top of the area.
#     All of this information is measured in pixels.
#
#     If the current wrap mode is **none** and the line extends beyond the boundaries of the window, the area returned reflects the entire area
#     of the line, including the portions that are out of the window.
#     If the line is shorter than the full width of the window then the area returned reflects just the portion of the line that is occupied
#     by characters and embedded windows.
#
#     If the display line containing index is not visible on the screen then the return value is an empty list.
#
#   *window* **dump** ?*switches*? *index1* ?*index2*?
#     Return the contents of the text widget from *index1* up to, but not including *index2*, including the text and information about
#     marks, tags, and embedded windows.
#     If *index2* is not specified, then it defaults to one character past *index1*.
#     The information is returned in the following format:
#
#        key1 value1 index1 key2 value2 index2 ...
#
#     The possible key values are **text**, **mark**, **tagon**, **tagoff**, **image**, and **window**.
#     The corresponding value is the text, mark name, tag name, image name, or window name.
#     The index information is the index of the start of the text, mark, tag transition, image or window.
#     One or more of the following switches (or abbreviations thereof) may be specified to control the dump:
#
#        **-all**
#           Return information about all elements: text, marks, tags, images and windows.
#           This is the default.
#
#        **-command** *command*
#           Instead of returning the information as the result of the dump operation, invoke the *command* on each element of the text widget
#           within the range. The *command* has three arguments appended to it before it is evaluated: the key, value, and index.
#
#        **-image**
#           Include information about images in the dump results.
#
#        **-mark**
#           Include information about marks in the dump results.
#
#        **-tag**
#           Include information about tag transitions in the dump results.
#           Tag information is returned as tagon and tagoff elements that indicate the begin and end of each range of each tag, respectively.
#
#        **-text**
#           Include information about text in the dump results.
#           The value is the text up to the next element or the end of range indicated by *index2*.
#           A text element does not span newlines.
#           A multi-line block of text that contains no marks or tag transitions will still be dumped as a set of text segments that each end
#           with a newline. The newline is part of the value.
#
#        **-window**
#           Include information about embedded windows in the dump results.
#           The value of a window is its Tk pathname, unless the window has not been created yet.
#           (It must have a create script.) In this case an empty string is returned, and you must query the window by its index position
#           to get more information.
#
#   *window* **edit** *option* ?*arg* ... *arg*?
#     This command controls the undo mechanism and the modified flag.
#     The exact behavior of the command depends on the option argument that follows the edit argument.
#     The following forms of the command are currently supported:
#
#        *window* **edit** **canredo**
#          Returns a boolean true if redo is possible, i.e. when the redo stack is not empty.
#          Otherwise returns false.
#
#        *window* **edit** **canundo**
#          Returns a boolean true if undo is possible, i.e. when the undo stack is not empty.
#          Otherwise returns false.
#
#        *window* **edit** **modified** ?*boolean*?
#          If *boolean* is not specified, returns the modified flag of the widget.
#          The insert, delete, edit undo and edit redo commands or the user can set or clear the modified flag.
#          If *boolean* is specified, sets the modified flag of the widget to boolean.
#
#        *window* **edit** **redo**
#          When the **-undo** option is true, reapplies the last undone edits provided no other edits were done since then, and returns
#          a list of indices indicating what ranges were changed by the redo operation.
#          Generates an error when the redo stack is empty.
#          Does nothing when the **-undo** option is false.
#
#        *window* **edit** **reset**
#          Clears the undo and redo stacks.
#
#        *window* **edit** **separator**
#          Inserts a separator (boundary) on the undo stack.
#          Does nothing when the **-undo** option is false.
#
#        *window* **edit** **undo**
#          Undoes the last edit action when the -undo option is true, and returns a list of indices indicating what ranges were changed
#          by the undo operation.
#          An edit action is defined as all the insert and delete commands that are recorded on the undo stack in between two separators.
#          Generates an error when the undo stack is empty.
#          Does nothing when the **-undo** option is false.
#
#   *window* **get** ?*-displaychars*? ?**--**? *index1* ?*index2* ... *indexn*?
#     Return a range of characters from the text.
#     The return value will be all the characters in the text starting with the one whose index is *index1* and ending just before the one
#     whose index is *index2* (the character at *index2* will not be returned).
#     If *index2* is omitted then the single character at index1 is returned.
#
#     If there are no characters in the specified range (e.g. *index1* is past the end of the file or *index2* is less than or equal to *index1*)
#     then an empty string is returned.
#     If the specified range contains embedded windows, no information about them is included in the returned string.
#
#     If multiple index pairs are given, multiple ranges of text will be returned in a list.
#     Invalid ranges will not be represented with empty strings in the list.
#     The ranges are returned in the order passed to **window get**.
#     If the *-displaychars* option is given, then, within each range, only those characters which are not elided will be returned.
#     This may have the effect that some of the returned ranges are empty strings.
#
#   *window* **identify** **element** *x* *y*
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if the mouse pointer does
#     not lie within any element. *X* and *y* are pixel coordinates relative to the widget.
#
#   *window* **image** *option* ?*arg* ... *arg*?
#     This command is used to manipulate embedded images.
#     The behavior of the command depends on the option argument that follows the image argument.
#     The following forms of the command are currently supported:
#
#        *window* **image** **cget** *index* *option*
#          Returns the value of a configuration option for an embedded image.
#          *Index* identifies the embedded image, and option specifies a particular configuration option, which must be one of the ones listed
#          in the section **EMBEDDED IMAGES**.
#
#        *window* **image** **configure** *index* ?*option value* ... *option value*?
#          Query or modify the configuration options for an embedded image.
#          If no *option* is specified, returns a list describing all of the available options for the embedded image at *index* (see
#          [Tk_ConfigureInfo](https://www.tcl-lang.org/man/tcl9.0/TkLib/ConfigWidg.html) for information on the format of this list).
#          If *option* is specified with no value, then the command returns a list describing the one named option (this list will be identical
#          to the corresponding sublist of the value returned if no option is specified).
#          If one or more option-value pairs are specified, then the command modifies the given option(s) to have the given value(s);
#          in this case the command returns an empty string.
#          See **EMBEDDED IMAGES** for information on the options that are supported.
#
#        *window* **image** **create** *index* ?*option value* ... *option value*?
#          This command creates a new image annotation, which will appear in the text at the position given by *index*.
#          Any number of option-value pairs may be specified to configure the annotation.
#          Returns a unique identifier that may be used as an index to refer to this image.
#          See **EMBEDDED IMAGES** for information on the options that are supported, and a description of the identifier returned.
#
#        *window* **image** **names**
#          Returns a list whose elements are the names of all image instances currently embedded in window.
#
#   *window* **index** *index*
#     Returns the position corresponding to *index* in the form **line.char** where line is the line number and char is the character number.
#     *Index* may have any of the forms described under **INDICES** below.
#
#   *window* **insert** *index* *chars* ?*tagList* *chars* *tagList* ...?
#     Inserts all of the *chars* arguments just before the character at *index*.
#     If *index* refers to the end of the text (the character after the last newline) then the new text is inserted just before the last
#     newline instead.
#     If there is a single *chars* argument and no *tagList*, then the new text will receive any tags that are present on both the
#     character before and the character after the insertion point; if a *tag* is present on only one of these characters then it will not
#     be applied to the new text.
#     If *tagList* is specified then it consists of a list of tag names; the new characters will receive all of the tags in this list and no
#     others, regardless of the tags present around the insertion point.
#     If multiple *chars*-*tagList* argument pairs are present, they produce the same effect as if a separate **window insert** widget command
#     had been issued for each pair, in order.
#     The last *tagList* argument may be omitted.
#
#   *window* **instate** *statespec* ?*script*?
#     Test the widget's 'dynamic' state.
#     If *script* is not specified, returns **1** if the widget 'dynamic' state matches *statespec* and **0** otherwise.
#     If *script* is specified it's equivalent to:
#
#        if { [*window* **instate** *stateSpec*] } *script*
#
#     See the [mustang intro](/wiki/commands/intro.md) wiki page to know the names of the allowed 'dynamic' states.
#
#   *window* **mark** *option* ?*arg* ... *arg*?
#     This command is used to manipulate marks.
#     The exact behavior of the command depends on the option argument that follows the mark argument.
#     The following forms of the command are currently supported:
#
#        *window* **mark** **gravity** *markName* ?*direction*?
#          If *direction* is not specified, returns left or right to indicate which of its adjacent characters *markName* is attached to.
#          If *direction* is specified, it must be **left** or **right**; the gravity of *markName* is set to the given value.
#
#        *window* **mark** **names**
#          Returns a list whose elements are the names of all the marks that are currently set.
#
#        *window* **mark** **next** *index*
#          Returns the name of the next mark at or after *index*.
#          If *index* is specified in numerical form, then the search for the next mark begins at that *index*.
#          If *index* is the name of a mark, then the search for the next mark begins immediately after that mark.
#          This can still return a mark at the same position if there are multiple marks at the same index.
#          These semantics mean that the mark next operation can be used to step through all the marks in a text widget in the same order
#          as the mark information returned by the **window dump** operation.
#          If a mark has been set to the special end index, then it appears to be after end with respect to the **window mark next** operation.
#          An empty string is returned if there are no marks after *index*.
#
#        *window* **mark** **previous** *index*
#          Returns the name of the mark at or before *index*.
#          If *index* is specified in numerical form, then the search for the previous mark begins with the character just before that index.
#          If *index* is the name of a mark, then the search for the next mark begins immediately before that mark.
#          This can still return a mark at the same position if there are multiple marks at the same index.
#          These semantics mean that the *window* mark previous operation can be used to step through all the marks in a text widget in the
#          reverse order as the mark information returned by the **window dump** operation.
#          An empty string is returned if there are no marks before *index*.
#
#        *window* **mark** **set** *markName* *index*
#          Sets the mark named *markName* to a position just before the character at *index*.
#          If *markName* already exists, it is moved from its old position; if it does not exist, a new mark is created.
#          This command returns an empty string.
#
#        *window* **mark** **unset** *markName* ?*markName* ... *markName*?
#          Remove the mark corresponding to each of the *markName* arguments.
#          The removed marks will not be usable in indices and will not be returned by future calls to **window mark names**.
#          This command returns an empty string.
#
#   *window* **peer** *option* *args*
#     This command is used to create and query widget peers.
#     It has two forms, depending on *option*:
#
#        *window* **peer** **create** *newPathName* ?*options*?
#          Creates a peer text widget with the given *newPathName*, and any optional standard configuration options (as for the text command).
#          By default the peer will have the same start and end line as the parent widget, but these can be overridden with the standard
#          configuration options.
#
#        *window* **peer** **names**
#          Returns a list of peers of this widget (this does not include the widget itself).
#          The order within this list is undefined.
#
#   *window* **pendingsync**
#     Returns **1** if the line heights calculations are not up-to-date, **0** otherwise.
#
#   *window* **replace** *index1* *index2* *chars* ?*tagList* *chars* *tagList* ...?
#     Replaces the range of characters between *index1* and *index2* with the given characters and tags.
#     See the section on **window insert** for an explanation of the handling of the *tagList* arguments, and the section on **window delete**
#     for an explanation of the handling of the indices.
#     If *index2* corresponds to an index earlier in the text than *index1*, an error will be generated.
#
#     The deletion and insertion are arranged so that no unnecessary scrolling of the window or movement of insertion cursor occurs.
#     In addition the undo/redo stack are correctly modified, if undo operations are active in the text widget.
#     The command returns an empty string.
#
#   *window* **scan** *option* *args*
#     This command is used to implement scanning on texts.
#     It has two forms, depending on *option*:
#
#        *window* **scan** **mark** *x* *y*
#          Records *x* and *y* and the current view in the text window, for use in conjunction with later **window scan dragto** commands.
#          Typically this command is associated with a mouse button press in the widget.
#          It returns an empty string.
#
#        *window* **scan** **dragto** *x* *y*
#          This command computes the difference between its *x* and *y* arguments and the *x* and *y* arguments to the last **window scan mark**
#          command for the widget.
#          It then adjusts the view by 10 times the difference in coordinates.
#          This command is typically associated with mouse motion events in the widget, to produce the effect of dragging the text at high speed
#          through the window.
#          The return value is an empty string.
#
#   *window* **search** ?*switches*? *pattern* *index* ?*stopIndex*?
#     Searches the text in *window* starting at *index* for a range of characters that matches *pattern*.
#     If a match is found, the index of the first character in the match is returned as result; otherwise an empty string is returned.
#     One or more of the following switches (or abbreviations thereof) may be specified to control the search:
#
#        **-forwards**
#           The search will proceed forward through the text, finding the first matching range starting at or after the position given by *index*.
#           This is the default.
#
#        **-backwards**
#           The search will proceed backward through the text, finding the matching range closest to index whose first character is before *index*
#           (it is not allowed to be at index).
#           Note that, for a variety of reasons, backwards searches can be substantially slower than forwards searches (particularly when using
#           **-regexp**), so it is recommended that performance-critical code use forward searches.
#
#        **-exact**
#           Use exact matching: the characters in the matching range must be identical to those in pattern.
#           This is the default.
#
#        **-regexp**
#           Treat pattern as a regular expression and match it against the text using the rules for regular expressions (see the regexp command
#           and the re_syntax page for details).
#           The default matching automatically passes both the **-lineanchor** and **-linestop** options to the regexp engine (unless **-nolinestop**
#           is used), so that **^$** match beginning and end of line, and **.**, **[^** sequences will never match the newline character **\n**.
#
#        **-nolinestop**
#           This allows **.** and **[^** sequences to match the newline character **\n**, which they will otherwise not do (see the regexp command for details).
#           This option is only meaningful if **-regexp** is also given, and an error will be thrown otherwise.
#           For example, to match the entire text, use **window search -nolinestop -regexp ".*" 1.0**.
#
#        **-nocase**
#           Ignore case differences between the pattern and the text.
#
#        **-count** *varName*
#           The argument following *-count* gives the name of a variable; if a match is found, the number of index positions between beginning
#           and end of the matching range will be stored in the variable.
#           If there are no embedded images or windows in the matching range (and there are no elided characters if **-elide** is not given),
#           this is equivalent to the number of characters matched.
#           In either case, the range **matchIdx** to **matchIdx + $count chars** will return the entire matched text.
#
#        **-all**
#           Find all matches in the given range and return a list of the indices of the first character of each match.
#           If a **-count varName** switch is given, then *varName* is also set to a list containing one element for each successful match.
#           Note that, even for exact searches, the elements of this list may be different, if there are embedded images, windows or hidden text.
#           Searches with **-all** behave very similarly to the Tcl command regexp **-all**, in that overlapping matches are not normally returned.
#           For example, applying an **-all** search of the pattern **\w+** against "hello there" will just match twice, once for each word,
#           and matching **Z[a-z]+Z** against "ZooZooZoo" will just match once.
#
#        **-overlap**
#           When performing **-all** searches, the normal behaviour is that matches which overlap an already-found match will not be returned.
#           This switch changes that behaviour so that all matches which are not totally enclosed within another match are returned.
#           For example, applying an *-overlap* search of the pattern **\w+** against "hello there" will just match twice (i.e. no different
#           to just **-all**), but matching **Z[a-z]+Z** against "ZooZooZoo" will now match twice.
#           An error will be thrown if this switch is used without **-all**.
#
#        **-strictlimits**
#           When performing any search, the normal behaviour is that the start and stop limits are checked with respect to the start of the
#           matching text.
#           With the *-strictlimits* flag, the entire matching range must lie inside the start and stop limits specified for the match to be valid.
#
#        **-elide**
#           Find elided (hidden) text as well.
#           By default only displayed text is searched.
#
#        **--**
#           This switch has no effect except to terminate the list of switches: the next argument will be treated as pattern even if
#           it starts with **-**.
#
#     The matching range may be within a single line of text, or run across multiple lines (if parts of the pattern can match a new-line).
#     For regular expression matching one can use the various newline-matching features such as **$** to match the end of a line, **^** to match
#     the beginning of a line, and to control whether **.** is allowed to match a new-line.
#     If *stopIndex* is specified, the search stops at that index: for forward searches, no match at or after *stopIndex* will be considered;
#     for backward searches, no match earlier in the text than *stopIndex* will be considered.
#     If *stopIndex* is omitted, the entire text will be searched: when the beginning or end of the text is reached, the search continues at
#     the other end until the starting location is reached again; if *stopIndex* is specified, no wrap-around will occur.
#     This means that, for example, if the search is **-forwards** but *stopIndex* is earlier in the text than *startIndex*, nothing will ever
#     be found. See **KNOWN BUGS** below for a number of minor limitations of the **window search** command.
#
#   *window* **see** *index*
#     Adjusts the view in the window so that the character given by *index* is completely visible.
#     If *index* is already visible then the command does nothing.
#     If *index* is a short distance out of view, the command adjusts the view just enough to make index visible at the edge of the window.
#     If *index* is far out of view, then the command centers index in the window.
#
#   *window* **state** ?*statespec*?
#     Modify or inquire the widget 'dynamic' state.
#     If *statespec* is present       --> Sets the widget 'dynamic' state.
#                                         For each flag in *statespec*, sets the corresponding flag or clears it
#                                         if prefixed by an exclamation point.
#                                         Returns a new *statespec* indicating which flags were changed.
#
#     If *statespec* is not specified --> Returns a list of the currently enabled 'dynamic' states.
#
#     See the [mustang intro](/wiki/commands/intro.md) wiki page to know the names of the allowed 'dynamic' states.
#
#   *window* **style**
#     Return the style used by the widget.
#
#   *window* **sync** ?*-command command*?
#     Controls the synchronization of the view of the text widget.
#
#        *window* **sync**
#          Immediately brings the line metrics up-to-date by forcing computation of any outdated line heights.
#          The command returns immediately if there is no such outdated line heights otherwise, it returns only at the end of the computation.
#          The command returns an empty string.
#
#        *window* **sync** *-command* *command*
#          Schedules command to be executed (by the event loop) exactly once as soon as all line heights are up-to-date.
#          If there are no pending line metrics calculations, the scheduling is immediate.
#          The command returns the empty string. **bgerror** is called on command failure.
#
#   *window* **tag** *option* ?*arg* ... *arg*?
#     This command is used to manipulate tags.
#     The exact behavior of the command depends on the *option* argument that follows the **tag** argument.
#     The following forms of the command are currently supported:
#
#        *window* **tag** **add** *tagname* *index1* ?*index2* *index1* *index2* ...?
#          Associate the tag *tagname* with all of the characters starting with *index1* and ending just before *index2* (the character at
#          *index2* is not tagged).
#          A single command may contain any number of *index1*-*index2* pairs.
#          If the last *index2* is omitted then the single character at *index1* is tagged.
#          If there are no characters in the specified range (e.g. *index1* is past the end of the file or *index2* is less than or equal to *index1*)
#          then the command has no effect.
#
#        *window* **tag** **bind** *tagname* ?*sequence*? ?*script*?
#          This command associates *script* with the tag given by *tagname*.
#          Whenever the event sequence given by *sequence* occurs for a character that has been tagged with *tagname*, the *script* will be invoked.
#          This widget command is similar to the bind command except that it operates on characters in a text rather than entire widgets.
#          See the [bind](/wiki/commands/bind.md) manual entry for complete details on the syntax of sequence and the substitutions performed
#          on script before invoking it.
#          If all arguments are specified then a new binding is created, replacing any existing binding for the same *sequence* and *tagname*
#          (if the first character of script is **+** then script augments an existing binding rather than replacing it).
#          In this case the return value is an empty string.
#          If *script* is omitted then the command returns the script associated with *tagname* and *sequence* (an error occurs if there is no
#          such binding).
#          If both *script* and *sequence* are omitted then the command returns a list of all the sequences for which bindings have been
#          defined for *tagname*.
#
#          The only events for which bindings may be specified are those related to the mouse and keyboard (such as **Enter**, **Leave**,
#          **Button**, **Motion**, and **Key**) or virtual events.
#          Mouse and keyboard event bindings for a text widget respectively use the current and insert marks described under **MARKS** below.
#          An **Enter** event triggers for a tag when the tag first becomes present on the current character, and a **Leave** event triggers
#          for a tag when it ceases to be present on the current character.
#          **Enter** and **Leave** events can happen either because the current mark moved or because the character at that position changed.
#          Note that these events are different than **Enter** and **Leave** events for windows.
#          Mouse events are directed to the current character, while keyboard events are directed to the insert character.
#          If a virtual event is used in a binding, that binding can trigger only if the virtual event is defined by an underlying mouse-related
#          or keyboard-related event.
#
#          It is possible for the current character to have multiple tags, and for each of them to have a binding for a particular event sequence.
#          When this occurs, one binding is invoked for each tag, in order from lowest-priority to highest priority.
#          If there are multiple matching bindings for a single tag, then the most specific binding is chosen (see the manual entry for the bind
#          command for details).
#          **continue** and **break** commands within binding scripts are processed in the same way as for bindings created with the bind command.
#
#          If bindings are created for the widget as a whole using the bind command, then those bindings will supplement the tag bindings.
#          The tag bindings will be invoked first, followed by bindings for the window as a whole.
#
#        *window* **tag** **cget** *tagname* *option*
#          This command returns the current value of the option named *option* associated with the tag given by *tagname*.
#          *Option* may have any of the values accepted by the **window tag configure** widget command.
#
#        *window* **tag** **configure** *tagname* ?*option*? ?*value*? ?*option value* ... *option value*?
#          This command is similar to the **window configure** widget command except that it modifies options associated with the tag given
#          by *tagname* instead of modifying options for the overall text widget.
#          If no option is specified, the command returns a list describing all of the available options for *tagname* (see
#          [Tk_ConfigureInfo](https://www.tcl-lang.org/man/tcl9.0/TkLib/ConfigWidg.html) for information on the format of this list).
#          If *option* is specified with no value, then the command returns a list describing the one named option (this list will be identical
#          to the corresponding sublist of the value returned if no option is specified).
#          If one or more option-value pairs are specified, then the command modifies the given option(s) to have the given value(s) in *tagname*;
#          in this case the command returns an empty string.
#          See **TAGS** below for details on the options available for tags.
#
#        *window* **tag** **delete** *tagname* ?*tagname* ... *tagname*?
#          Deletes all tag information for each of the *tagname* arguments.
#          The command removes the tags from all characters in the file and also deletes any other information associated with the tags,
#          such as bindings and display information.
#          The command returns an empty string.
#
#        *window* **tag** **lower** *tagname* ?*belowThis*?
#          Changes the priority of tag *tagname* so that it is just lower in priority than the tag whose name is *belowThis*.
#          If *belowThis* is omitted, then tagname's priority is changed to make it lowest priority of all tags.
#
#        *window* **tag** **names** ?*index*?
#          Returns a list whose elements are the names of all the tags that are active at the character position given by index. If index is omitted, then the return value will describe all of the tags that exist for the text (this includes all tags that have been named in a "*window* tag" widget command but have not been deleted by a "*window* tag delete" widget command, even if no characters are currently marked with the tag). The list will be sorted in order from lowest priority to highest priority.
#
#        *window* **tag** **nextrange** *tagname* *index1* ?*index2*?
#          This command searches the text for a range of characters tagged with *tagname* where the first character of the range is no earlier
#          than the character at *index1* and no later than the character just before *index2* (a range starting at *index2* will not be considered).
#          If several matching ranges exist, the first one is chosen.
#          The command's return value is a list containing two elements, which are the index of the first character of the range and the index
#          of the character just after the last one in the range.
#          If no matching range is found then the return value is an empty string.
#          If *index2* is not given then it defaults to the end of the text.
#
#        *window* **tag** **prevrange** *tagname* *index1* ?*index2*?
#          This command searches the text for a range of characters tagged with *tagname* where the first character of the range is before
#          the character at *index1* and no earlier than the character at *index2* (a range starting at *index2* will be considered).
#          If several matching ranges exist, the one closest to *index1* is chosen.
#          The command's return value is a list containing two elements, which are the index of the first character of the range and the index
#          of the character just after the last one in the range.
#          If no matching range is found then the return value is an empty string.
#          If *index2* is not given then it defaults to the beginning of the text.
#
#        *window* **tag** **raise** *tagname* ?*aboveThis*?
#          Changes the priority of tag *tagname* so that it is just higher in priority than the tag whose name is *aboveThis*.
#          If *aboveThis* is omitted, then tagname's priority is changed to make it highest priority of all tags.
#
#        *window* **tag** **ranges** *tagname*
#          Returns a list describing all of the ranges of text that have been tagged with *tagname*.
#          The first two elements of the list describe the first tagged range in the text, the next two elements describe the second range,
#          and so on.
#          The first element of each pair contains the index of the first character of the range, and the second element of the pair contains
#          the index of the character just after the last one in the range.
#          If there are no characters tagged with tag then an empty string is returned.
#
#        *window* **tag** **remove** *tagname* *index1* ?*index2* *index1* *index2* ...?
#          Remove the tag *tagname* from all of the characters starting at *index1* and ending just before *index2* (the character at *index2*
#          is not affected).
#          A single command may contain any number of *index1*-*index2* pairs.
#          If the last *index2* is omitted then the tag is removed from the single character at *index1*.
#          If there are no characters in the specified range (e.g. *index1* is past the end of the file or *index2* is less than or equal to
#          *index1*) then the command has no effect.
#          This command returns an empty string.
#
#   *window* pathname option ?arg ...?
#     This command is used to manipulate embedded windows.
#     The behavior of the command depends on the option argument that follows the *pathname* argument.
#     The following forms of the command are currently supported:
#
#        *window* pathname cget index option
#          Returns the value of a configuration option for an embedded window.
#          *Index* identifies the embedded window, and option specifies a particular configuration option, which must be one of the ones
#          listed in the section **EMBEDDED WINDOWS**.
#
#        *window* pathname configure index ?option value ...?
#          Query or modify the configuration options for an embedded window.
#          If no option is specified, returns a list describing all of the available options for the embedded window at *index*
#          (see [Tk_ConfigureInfo](https://www.tcl-lang.org/man/tcl9.0/TkLib/ConfigWidg.html) for information on the format of this list).
#          If option is specified with no value, then the command returns a list describing the one named option (this list will be identical
#          to the corresponding sublist of the value returned if no option is specified).
#          If one or more option-value pairs are specified, then the command modifies the given option(s) to have the given value(s);
#          in this case the command returns an empty string.
#          See **EMBEDDED WINDOWS** for information on the options that are supported.
#
#        *window* pathname create index ?option value ...?
#          This command creates a new window annotation, which will appear in the text at the position given by index.
#          Any number of option-value pairs may be specified to configure the annotation.
#          See **EMBEDDED WINDOWS** for information on the options that are supported.
#
#          Returns an empty string.
#
#        *window* pathname names
#          Returns a list whose elements are the names of all windows currently embedded in window.
#
#   *window* **xview** ?args?
#     *window* **xview**
#       Returns a list containing two elements.
#       Each element is a real fraction between **0** and **1.0**; together they describe the horizontal span
#       that is visible in the window.
#
#     *window* **xview** **moveto** *fraction*
#       Adjusts the view in the window so that *fraction* of the total width of the widget is off-screen to the left.
#       *Fraction* must be a fraction between **0** and **1.0**.
#
#     *window* **xview** **scroll** *number* *what*
#       This command shifts the view in the window left or right according to *number* and *what*.
#
#       *Number* must be an integer or a float, but not **0**.
#       If *number* is negative then information farther to the left becomes visible, if it is positive then information
#       farther to the right becomes visible.
#       If **0** is provided, the command will be ignored by mustang.
#
#       *what* must be **pages**, **pixels** or **units**.
#       If *what* is **pages** then the view adjusts left or right by number screenfuls.
#       If *what* is **pixels** then the view adjusts left or right by number pixels.
#       The number of pixels may be specified in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html),
#       such as **2.0c** or **1i** (the result is rounded to the nearest integer value. If no units are given, pixels are assumed).
#       If *what* is **units** then the view adjusts left or right by number average-width characters on the display.
#
#       If number is negative then characters farther to the left become visible; if it is positive then characters farther to the right
#       become visible.
#
#   *window* **yview** ?args?
#     *window* **yview**
#       Returns a list containing two elements.
#       Each element is a real fraction between **0** and **1.0**; together they describe the vertical span that
#       is visible in the window.
#
#     *window* **yview** **moveto** *fraction*
#       Adjusts the view in the window so that *fraction* of the total height of the widget is off-screen to the top.
#       *Fraction* must be a fraction between **0** and **1.0**.
#
#     *window* **yview** **scroll** *number* *what*
#       This command shifts the view in the window up or down according to *number* and *what*.
#
#       *Number* must be an integer or a float, but not **0**.
#       If *number* is negative higher information becomes visible, if it is positive then lower information becomes visible.
#       If **0** is provided, the command will be ignored by mustang.
#
#       *what* must be **pages**, **pixels** or **units**.
#       If *what* is **pages** then the view adjusts up or down by number screenfuls.
#       If *what* is **pixels** then the view adjusts up or down by number pixels.
#       The number of pixels may be specified in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html),
#       such as **2.0c** or **1i** (the result is rounded to the nearest integer value. If no units are given, pixels are assumed).
#       If *what* is **units** then the view adjusts up or down by number average-width characters on the display.
#
#       If number is negative then characters farther to the top become visible; if it is positive then characters farther to the bottom
#       become visible.
#
#### INDICES:
#
# Many of the widget commands for texts take one or more indices as arguments.
# An index is a string used to indicate a particular place within a text, such as a place to insert characters or one endpoint
# of a range of characters to delete. Indices have the syntax:
#
#    base modifier modifier modifier ...
#
# Where *base* gives a starting point and the modifiers adjust the index from the starting point (e.g. move forward or backward one character).
# Every index must contain a base, but the *modifier*s are optional.
# Most modifiers (as documented below) allow an optional submodifier.
# Valid submodifiers are **any** and **display**.
# If the submodifier is abbreviated, then it must be followed by whitespace, but otherwise there need be no space between the submodifier
# and the following modifier.
# Typically the display submodifier adjusts the meaning of the following modifier to make it refer to visual or non-elided units rather than
# logical units, but this is explained for each relevant case below.
# Lastly, where count is used as part of a modifier, it can be positive or negative, so "base - -3 lines" is perfectly valid and equivalent to
# "base +3lines".
#
# The base for an index must have one of the following forms:
#
#   *line.char*
#     Indicates char'th character on line *line*. Lines are numbered from **1** for consistency with other UNIX programs that use this numbering scheme.
#     Within a line, characters are numbered from **0**.
#     If *char* is **end** then it refers to the newline character that ends the line.
#
#   *@x,y*
#     Indicates the character that covers the pixel whose *x* and *y* coordinates within the text's window are x and y.
#
#   *end*
#     Indicates the end of the text (the character just after the last newline).
#
#   *mark*
#     Indicates the character just after the mark whose name is mark (see **MARKS** for details).
#
#   *tag.first*
#     Indicates the first character in the text that has been tagged with tag.
#     This form generates an error if no characters are currently tagged with tag.
#
#   *tag.last*
#     Indicates the character just after the last one in the text that has been tagged with tag.
#     This form generates an error if no characters are currently tagged with tag.
#
#   *window*
#     Indicates the position of the embedded window whose name is *window*.
#     This form generates an error if there is no embedded window by the given name.
#
#   *imageName*
#     Indicates the position of the embedded image whose name is imageName.
#     This form generates an error if there is no embedded image by the given name.
#
# If the base could match more than one of the above forms, such as a mark and imageName both having the same value, then the form earlier in
# the above list takes precedence.
# If modifiers follow the base index, each one of them must have one of the forms listed below.
# Keywords such as chars and wordend may be abbreviated as long as the abbreviation is unambiguous.
#
#   **+** **count** ?*submodifier*? *chars*
#     Adjust the index forward by count characters, moving to later lines in the text if necessary.
#     If there are fewer than count characters in the text after the current index, then set the index to the last index in the text.
#     Spaces on either side of count are optional.
#     If the display submodifier is given, elided characters are skipped over without being counted.
#     If any is given, then all characters are counted.
#     For historical reasons, if neither modifier is given then the count actually takes place in units of index positions (see
#     **INDICES** for details).
#     This behaviour may be changed in a future major release, so if you need an index count, you are encouraged to use indices instead
#     wherever possible.
#
#   **-** **count** ?*submodifier*? *chars*
#     Adjust the index backward by count characters, moving to earlier lines in the text if necessary.
#     If there are fewer than count characters in the text before the current index, then set the index to the first index in the text (1.0).
#     Spaces on either side of count are optional.
#     If the display submodifier is given, elided characters are skipped over without being counted.
#     If any is given, then all characters are counted.
#     For historical reasons, if neither modifier is given then the count actually takes place in units of index positions (see **INDICES** for details).
#     This behavior may be changed in a future major release, so if you need an index count, you are encouraged to use indices instead wherever possible.
#
#   **+** **count** ?*submodifier*? *indices*
#     Adjust the index forward by count index positions, moving to later lines in the text if necessary.
#     If there are fewer than count index positions in the text after the current index, then set the index to the last index position in the text.
#     Spaces on either side of count are optional. Note that an index position is either a single character or a single embedded image or embedded window.
#     If the display submodifier is given, elided indices are skipped over without being counted.
#     If any is given, then all indices are counted; this is also the default behaviour if no modifier is given.
#
#   **-** **count** ?*submodifier*? *indices*
#     Adjust the index backward by count index positions, moving to earlier lines in the text if necessary.
#     If there are fewer than count index positions in the text before the current index, then set the index to the first index position (1.0)
#     in the text.
#     Spaces on either side of count are optional.
#     If the display submodifier is given, elided indices are skipped over without being counted.
#     If any is given, then all indices are counted; this is also the default behaviour if no modifier is given.
#
#   **+** **count** ?*submodifier*? *lines*
#     Adjust the index forward by count lines, retaining the same character position within the line.
#     If there are fewer than count lines after the line containing the current index, then set the index to refer to the same character position
#     on the last line of the text. Then, if the line is not long enough to contain a character at the indicated character position, adjust the
#     character position to refer to the last character of the line (the newline).
#     Spaces on either side of count are optional.
#     If the display submodifier is given, then each visual display line is counted separately.
#     Otherwise, if any (or no modifier) is given, then each logical line (no matter how many times it is visually wrapped) counts just once.
#     If the relevant lines are not wrapped, then these two methods of counting are equivalent.
#
#   **-** **count** ?*submodifier*? *lines*
#     Adjust the index backward by count logical lines, retaining the same character position within the line.
#     If there are fewer than count lines before the line containing the current index, then set the index to refer to the same character position
#     on the first line of the text. Then, if the line is not long enough to contain a character at the indicated character position, adjust the
#     character position to refer to the last character of the line (the newline).
#     Spaces on either side of count are optional.
#     If the display submodifier is given, then each visual display line is counted separately.
#     Otherwise, if any (or no modifier) is given, then each logical line (no matter how many times it is visually wrapped) counts just once.
#     If the relevant lines are not wrapped, then these two methods of counting are equivalent.
#
#   ?*submodifier*? *linestart*
#     Adjust the index to refer to the first index on the line.
#     If the display submodifier is given, this is the first index on the display line otherwise, on the logical line.
#
#   ?*submodifier*? *lineend*
#     Adjust the index to refer to the last index on the line (the newline).
#     If the display submodifier is given, this is the last index on the display line otherwise, on the logical line.
#
#   ?*submodifier*? *wordstart*
#     Adjust the index to refer to the first character of the word containing the current index.
#     A word consists of any number of adjacent characters that are letters, digits, or underscores, or a single character that is not one of these.
#     If the display submodifier is given, this only examines non-elided characters otherwise, all characters (elided or not) are examined.
#
#   ?*submodifier*? *wordend*
#     Adjust the index to refer to the character just after the last one of the word containing the current index.
#     If the current index refers to the last character of the text then it is not modified.
#     If the display submodifier is given, this only examines non-elided characters otherwise, all characters (elided or not) are examined.
#
# If more than one modifier is present then they are applied in left-to-right order.
# For example, the index "end - 1 chars" refers to the next-to-last character in the text and "insert wordstart - 1 c" refers to the character
# just before the first one in the word containing the insertion cursor.
# Modifiers are applied one by one in this left to right order, and after each step the resulting index is constrained to be a valid index in the
# text widget. So, for example, the index "1.0 -1c +1c" refers to the index "2.0".
#
# Where modifiers result in index changes by display lines, display chars or display indices, and the base refers to an index inside an elided tag,
# that base index is considered to be equivalent to the first following non-elided index.
#
#### TAGS:
#
# The first form of annotation in text widgets is a *tag*.
# A *tag* is a textual string that is associated with some of the characters in a text.
# Tags may contain arbitrary characters, but it is probably best to avoid using the characters " " (space), **+**, or **-**: these characters have special
# meaning in indices, so tags containing them cannot be used as indices.
# There may be any number of tags associated with characters in a text.
# Each tag may refer to a single character, a range of characters, or several ranges of characters.
# An individual character may have any number of tags associated with it.
#
# A priority order is defined among tags, and this order is used in implementing some of the tag-related functions described below.
# When a tag is defined (by associating it with characters or setting its display options or binding commands to it), it is given a priority higher
# than any existing tag. The priority order of tags may be redefined using the "*window* tag raise" and "*window* tag lower" widget commands.
#
# Tags serve three purposes in text widgets.
# First, they control the way information is displayed on the screen.
# By default, characters are displayed as determined by the **-background**, **-font**, and **-foreground** options for the text widget.
# However, display options may be associated with individual tags using the "*window* tag configure" widget command.
# If a character has been tagged, then the display options associated with the tag override the default display style.
# The following options are currently supported for tags:
#
#   **-background** *color*
#      *Color* specifies the background color to use for characters associated with the tag.
#      It may have any of the forms accepted by mustang.
#
#   **-bgstipple** *bitmap*
#      *Bitmap* specifies a bitmap that is used as a stipple pattern for the background.
#      It may have any of the forms accepted by [Tk_GetBitmap](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetBitmap.html).
#      If bitmap has not been specified, or if it is specified as an empty string, then a solid fill will be used for the background.
#
#   **-borderwidth** *pixels*
#      *Pixels* specifies the width of a border to draw around the tag using any of the forms accepted by [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#      This option should be used in conjunction with the **-relief** option to provide the desired border.
#
#   **-elide** *boolean*
#      Elide specifies whether the data should be elided.
#      Elided data (characters, images, embedded windows, etc.) is not displayed and takes no space on screen, but further on behaves
#      just as normal data.
#
#   **-fgstipple** *bitmap*
#      *Bitmap* specifies a bitmap that is used as a stipple pattern when drawing text and other foreground information such as underlines.
#      It may have any of the forms accepted by [Tk_GetBitmap](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetBitmap.html).
#      If bitmap has not been specified, or if it is specified as an empty string, then a solid fill will be used.
#
#   **-font** *fontName*
#      *FontName* is the name of a font to use for drawing characters.
#      It may have any of the forms accepted by [Tk_GetFont](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetFont.html).
#
#   **-foreground** *color*
#      *Color* specifies the color to use when drawing text and other foreground information such as underlines.
#      It may have any of the forms accepted by mustang.
#
#   **-justify** *justify*
#      If the first non-elided character of a display line has a tag for which this option has been specified, then *justify* determines how to
#      justify the line. It must be one of **left**, **right**, or **center**.
#      If a line wraps, then the justification for each line on the display is determined by the first non-elided character of that display line.
#
#   **-lmargin1** *pixels*
#      If the first non-elided character of a text line has a tag for which this option has been specified, then *pixels* specifies how much the
#      line should be indented from the left edge of the window.
#      *Pixels* may have any of the standard forms for screen distances.
#      If a line of text wraps, this option only applies to the first line on the display; the **-lmargin2** option controls the indentation
#      for subsequent lines.
#
#   **-lmargin2** *pixels*
#      If the first non-elided character of a display line has a tag for which this option has been specified, and if the display line is not
#      the first for its text line (i.e., the text line has wrapped), then *pixels* specifies how much the line should be indented from the left
#      edge of the window.
#      *Pixels* may have any of the standard forms for screen distances.
#      This option is only used when wrapping is enabled, and it only applies to the second and later display lines for a text line.
#
#   **-lmargincolor** *color*
#      *Color* specifies the background color to use in regions that do not contain characters because they are indented by -lmargin1 or -lmargin2. It may have any of the forms accepted by mustang. If color has not been specified, or if it is specified as an empty string, then the color used is specified by the -background tag option (or, if this is also unspecified, by the -background widget option).
#
#   **-offset** *pixels*
#      *Pixels* specifies an amount by which the text's baseline should be offset vertically from the baseline of the overall line, in pixels.
#      For example, a positive offset can be used for superscripts and a negative offset can be used for subscripts.
#      *Pixels* may have any of the standard forms for screen distances.
#
#   **-overstrike** *boolean*
#      Specifies whether or not to draw a horizontal rule through the middle of characters.
#      *Boolean* may have any of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html).
#
#   **-overstrikefg** *color*
#      *Color* specifies the color to use when displaying the overstrike.
#      It may have any of the forms accepted by mustang.
#      If color has not been specified, or if it is specified as an empty string, then the color specified by the **-foreground** tag option is used.
#
#   **-relief** *relief*
#      *Relief* specifies the relief style to use for drawing the border, in any of the forms accepted by [Tk_GetRelief](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetRelief.html).
#      This option is used in conjunction with the **-borderwidth** option to enable to the desired border appearance.
#
#   **-rmargin** *pixels*
#      If the first non-elided character of a display line has a tag for which this option has been specified, then pixels specifies how wide a margin to leave between the end of the line and the right edge of the window. Pixels may have any of the standard forms for screen distances. This option is only used when wrapping is enabled. If a text line wraps, the right margin for each line on the display is determined by the first non-elided character of that display line.
#
#   **-rmargincolor** *color*
#      *Color* specifies the background color to use in regions that do not contain characters because they are indented by **-rmargin**.
#      It may have any of the forms accepted by mustang.
#      If color has not been specified, or if it is specified as an empty string, then the color used is specified by the **-background** tag option
#      (or, if this is also unspecified, by the **-background** widget option).
#
#   **-selectbackground** *color*
#      *Color* specifies the background color to use when displaying selected items.
#      It may have any of the forms accepted by mustang.
#      If color has not been specified, or if it is specified as an empty string, then the color specified by the **-background** tag option is used.
#
#   **-selectforeground** *color*
#      *Color* specifies the foreground color to use when displaying selected items.
#      It may have any of the forms accepted by mustang.
#      If color has not been specified, or if it is specified as an empty string, then the color specified by the **-foreground** tag option is used.
#
#   **-spacing1** *pixels*
#      *Pixels* specifies how much additional space should be left above each text line, using any of the standard forms for screen distances.
#      If a line wraps, this option only applies to the first line on the display.
#
#   **-spacing2** *pixels*
#      For lines that wrap, this option specifies how much additional space to leave between the display lines for a single text line.
#      *Pixels* may have any of the standard forms for screen distances.
#
#   **-spacing3** *pixels*
#      *Pixels* specifies how much additional space should be left below each text line, using any of the standard forms for screen distances.
#      If a line wraps, this option only applies to the last line on the display.
#
#   **-tabs** *tabList*
#      *TabList* specifies a set of tab stops in the same form as for the -tabs option for the text widget.
#      This option only applies to a display line if it applies to the first non-elided character on that display line.
#      If this option is specified as an empty string, it cancels the option, leaving it unspecified for the tag (the default).
#      If the option is specified as a non-empty string that is an empty list, such as **-tags { }**, then it requests default 8-character tabs
#      as described for the **-tags** widget option.
#
#   **-tabstyle** *style*
#      *Style* specifies either the **tabular** or **wordprocessor** style of tabbing to use for the text widget.
#      This option only applies to a display line if it applies to the first non-elided character on that display line.
#      If this option is specified as an empty string, it cancels the option, leaving it unspecified for the tag (the default).
#
#   **-underline** *boolean*
#      *Boolean* specifies whether or not to draw an underline underneath characters.
#      It may have any of the forms accepted by [Tcl_GetBoolean](https://www.tcl-lang.org/man/tcl9.0/TclLib/GetInt.html).
#
#   **-underlinefg** *color*
#      Color specifies the color to use when displaying the underline.
#      It may have any of the forms accepted by mustang.
#      If color has not been specified, or if it is specified as an empty string, then the color specified by the **-foreground** tag option is used.
#
#   **-wrap** *mode*
#      *Mode* specifies how to handle lines that are wider than the text's window.
#      This option only applies to a display line if it applies to the first non-elided character on that display line.
#      It has the same legal values as the **-wrap** option for the text widget: **none**, **char**, or **word**.
#      If this tag option is specified, it overrides the **-wrap** option for the text widget.
#
# If a character has several tags associated with it, and if their display options conflict, then the options of the highest priority tag are used.
# If a particular display option has not been specified for a particular tag, or if it is specified as an empty string, then that option will never
# be used; the next-highest-priority tag's option will used instead.
# If no tag specifies a particular display option, then the default style for the widget will be used.
#
# The second purpose for tags is event bindings.
# You can associate bindings with a tag in much the same way you can associate bindings with a widget class: whenever particular X events occur on
# characters with the given tag, a given Tcl command will be executed.
# Tag bindings can be used to give behaviors to ranges of characters; among other things, this allows hypertext-like features to be implemented.
# For details, see the description of the "pathName tag bind" widget command below.
# Tag bindings are shared between all peer widgets (including any bindings for the special sel tag).
#
# The third use for tags is in managing the selection. See **THE SELECTION** below.
# With the exception of the special sel tag, all tags are shared between peer text widgets, and may be manipulated on an equal basis from any such widget.
# The sel tag exists separately and independently in each peer text widget (but any tag bindings to sel are shared).
#
#### MARKS:
#
# The second form of annotation in text widgets is a *mark*.
# *Mark*s are used for remembering particular places in a text.
# They are something like tags, in that they have names and they refer to places in the file, but a mark is not associated with particular characters.
# Instead, a mark is associated with the gap between two characters.
# Only a single position may be associated with a mark at any given time.
# If the characters around a mark are deleted the mark will still remain; it will just have new neighbor characters.
# In contrast, if the characters containing a tag are deleted then the tag will no longer have an association with characters in the file.
# Marks may be manipulated with the "pathName mark" widget command, and their current locations may be determined by using the mark name as an index
# in widget commands.
#
# Each mark also has a "gravity", which is either left or right.
# The gravity for a mark specifies what happens to the mark when text is inserted at the point of the mark.
# If a mark has left gravity, then the mark is treated as if it were attached to the character on its left, so the mark will remain to the left of
# any text inserted at the mark position.
# If the mark has right gravity, new text inserted at the mark position will appear to the left of the mark (so that the mark remains rightmost).
# The gravity for a mark defaults to right.
#
# The name space for marks is different from that for tags: the same name may be used for both a mark and a tag, but they will refer to different things.
#
# Two marks have special significance.
# First, the mark insert is associated with the insertion cursor, as described under **THE INSERTION CURSOR** below.
# Second, the mark current is associated with the character closest to the mouse and is adjusted automatically to track the mouse position and any
# changes to the text in the widget (one exception: current is not updated in response to mouse motions if a mouse button is down; the update will be
# deferred until all mouse buttons have been released).
# Neither of these special marks may be deleted.
# With the exception of these two special marks, all marks are shared between peer text widgets, and may be manipulated on an equal basis from any peer.
#
#### EMBEDDED WINDOWS:
#
# The third form of annotation in text widgets is an embedded window.
# Each embedded window annotation causes a window to be displayed at a particular point in the text.
# There may be any number of embedded windows in a text widget, and any widget may be used as an embedded window (subject to the usual rules for
# geometry management, which require the text window to be the parent of the embedded window or a descendant of its parent).
#
# The embedded window's position on the screen will be updated as the text is modified or scrolled, and it will be mapped and unmapped as it moves
# into and out of the visible area of the text widget.
# Each embedded window occupies one unit's worth of index space in the text widget, and it may be referred to either by the name of its embedded window
# or by its position in the widget's index space.
# If the range of text containing the embedded window is deleted then the window is destroyed.
# Similarly if the text widget as a whole is deleted, then the window is destroyed.
#
# Eliding an embedded window immediately after scheduling it for creation via pathName window create index **-create** will prevent it from being
# effectively created.
# Uneliding an elided embedded window scheduled for creation via pathName window create index **-create** will automatically trigger the associated
# creation script.
# After destroying an elided embedded window, the latter won't get automatically recreated.
#
# When an embedded window is added to a text widget with the pathName window create widget command, several configuration options may be associated with it.
# These options may be modified later with the pathName window configure widget command.
# The following options are currently supported:
#
#   **-align** *where*
#      If the window is not as tall as the line in which it is displayed, this option determines where the window is displayed in the line.
#      *Where* must have one of the values **top** (align the top of the window with the top of the line), **center** (center the window within the
#      range of the line), **bottom** (align the bottom of the window with the bottom of the line's area), or **baseline** (align the bottom of the
#      window with the baseline of the line).
#
#   **-create** *script*
#      Specifies a Tcl script that may be evaluated to create the window for the annotation.
#      If no **-window** option has been specified for the annotation this script will be evaluated when the annotation is about to be displayed
#      on the screen.
#      *Script* must create a window for the annotation and return the name of that window as its result.
#      Two substitutions will be performed in *script* before evaluation.
#      **%W** will be substituted by the name of the parent text widget, and **%%** will be substituted by a single **%**.
#      If the annotation's window should ever be deleted, *script* will be evaluated again the next time the annotation is displayed.
#
#   **-padx** *pixels*
#      *Pixels* specifies the amount of extra space to leave on each side of the embedded window.
#      It may have any of the usual forms defined for a screen distance.
#
#   **-pady** *pixels*
#      *Pixels* specifies the amount of extra space to leave on the top and on the bottom of the embedded window.
#      It may have any of the usual forms defined for a screen distance.
#
#   **-stretch** *boolean*
#      If the requested height of the embedded window is less than the height of the line in which it is displayed, this option can be used to
#      specify whether the window should be stretched vertically to fill its line.
#      If the **-pady** option has been specified as well, then the requested padding will be retained even if the window is stretched.
#
#   **-window** *pathName*
#      Specifies the name of a window to display in the annotation.
#      Note that if a pathName has been set, then later configuring a window to the empty string will not delete the widget corresponding to
#      the old pathName. Rather it will remove the association between the old pathName and the text widget.
#      If multiple peer widgets are in use, it is usually simpler to use the **-create** option if embedded windows are desired in each peer.
#
#### EMBEDDED IMAGES:
#
# The final form of annotation in text widgets is an embedded image.
# Each embedded image annotation causes an image to be displayed at a particular point in the text.
# There may be any number of embedded images in a text widget, and a particular image may be embedded in multiple places in the same text widget.
#
# The embedded image's position on the screen will be updated as the text is modified or scrolled.
# Each embedded image occupies one unit's worth of index space in the text widget, and it may be referred to either by its position in the widget's
# index space, or the name it is assigned when the image is inserted into the text widget with **pathName image create**.
# If the range of text containing the embedded image is deleted then that copy of the image is removed from the screen.
#
# Eliding an embedded image immediately after scheduling it for creation via pathName image create index **-create** will prevent it from being
# effectively created.
# Uneliding an elided embedded image scheduled for creation via pathName image create index **-create** will automatically trigger the associated
# creation script.
# After destroying an elided embedded image, the latter won't get automatically recreated.
#
# When an embedded image is added to a text widget with the pathName image create widget command, a name unique to this instance of the image is returned.
# This name may then be used to refer to this image instance.
# The name is taken to be the value of the -name option (described below).
# If the **-name** option is not provided, the **-image** name is used instead. If the imageName is already in use in the text widget,
# then **#nn** is added to the end of the imageName, where *nn* is an arbitrary integer.
# This insures the imageName is unique.
# Once this name is assigned to this instance of the image, it does not change, even though the **-image** or **-name** values can be changed
# with **pathName image configure**.
#
# When an embedded image is added to a text widget with the pathName image create widget command, several configuration options may be associated with it.
# These options may be modified later with the pathName image configure widget command.
# The following options are currently supported:
#
#   **-align** *where*
#      If the image is not as tall as the line in which it is displayed, this option determines where the image is displayed in the line.
#      *Where* must have one of the values **top** (align the top of the image with the top of the line), **center** (center the image
#      within the range of the line), **bottom** (align the bottom of the image with the bottom of the line's area), or **baseline** (align
#      the bottom of the image with the baseline of the line).
#
#   **-image** *image*
#      Specifies the name of the Tk image to display in the annotation.
#      If image is not a valid Tk image, then an error is returned.
#
#   **-name** *imageName*
#      Specifies the name by which this image instance may be referenced in the text widget.
#      If *imageName* is not supplied, then the name of the Tk image is used instead.
#      If the *imageName* is already in use, **#nn** is appended to the end of the name as described above.
#
#   **-padx** *pixels*
#      *Pixels* specifies the amount of extra space to leave on each side of the embedded image.
#      It may have any of the usual forms defined for a screen distance.
#
#   **-pady** *pixels*
#      *Pixels* specifies the amount of extra space to leave on the top and on the bottom of the embedded image.
#      It may have any of the usual forms defined for a screen distance.
#
#### THE SELECTION:
#
# Selection support is implemented via tags.
# If the **-exportselection** option for the text widget is true then the sel tag will be associated with the selection:
#
#   Whenever characters are tagged with sel the text widget will claim ownership of the selection.
#   Attempts to retrieve the selection will be serviced by the text widget, returning all the characters with the sel tag.
#   If the selection is claimed away by another application or by another window within this application, then the sel tag will be removed
#   from all characters in the text.
#
#   Whenever the sel tag range changes a virtual event **Selection** is generated.
#   It might also be generated when selection is affected but not actually changed.
#   Further, multiple selection changes could happen before events can be processed leading to multiple events with the same visible selection.
#
# The sel tag is automatically defined when a text widget is created, and it may not be deleted with the "pathName tag delete" widget command.
# Furthermore, the **-selectbackground**, **-selectborderwidth**, and **-selectforeground** options for the text widget are tied to the **-background**,
# **-borderwidth**, and **-foreground** options for the sel tag: changes in either will automatically be reflected in the other.
# Also the **-inactiveselectbackground** option for the text widget is used instead of **-selectbackground** when the text widget does not have the focus.
# This allows programmatic control over the visualization of the sel tag for foreground and background windows, or to have sel not shown at all
# (when **-inactiveselectbackground** is empty) for background windows.
# Each peer text widget has its own sel tag which can be separately configured and set.
#
#### THE INSERTION CURSOR:
#
# The mark named insert has special significance in text widgets.
# It is defined automatically when a text widget is created and it may not be unset with the "pathName mark unset" widget command.
# The insert mark represents the position of the insertion cursor, and the insertion cursor will automatically be drawn at this point whenever
# the text widget has the input focus.
#
# The **-blockcursor** widget option controls the drawing of the cursor.
# However, drawing the cursor as a solid blinking block is not exactly performed as in real or emulated terminals.
# The character at the cursor position is always drawn in it's foreground color, i.e. not in "reverse video", which can lead to unwanted visual effects
# and even hide the character entirely, when the cursor is in its on-state.
#
#### THE MODIFIED FLAG:
#
# The text widget can keep track of changes to the content of the widget by means of the modified flag.
# Inserting or deleting text will set this flag.
# The flag can be queried, set and cleared programmatically as well.
# Whenever the flag changes state a <<Modified>> virtual event is generated.
# See the pathName edit modified widget command for more details.
#
#### THE UNDO MECHANISM:
#
# The text widget has an unlimited undo and redo mechanism (when the **-undo** widget option is true) which records every insert and delete action
# on a stack.
#
# Boundaries (called "separators") are inserted between edit actions.
# The purpose of these separators is to group inserts, deletes and replaces into one compound edit action.
# When undoing a change everything between two separators will be undone.
# The undone changes are then moved to the redo stack, so that an undone edit can be redone again.
# The redo stack is cleared whenever new edit actions are recorded on the undo stack.
# The undo and redo stacks can be cleared to keep their depth under control.
#
# Separators are inserted automatically when the **-autoseparators** widget option is true.
# You can insert separators programmatically as well.
# If a separator is already present at the top of the undo stack no other will be inserted.
# That means that two separators on the undo stack are always separated by at least one insert or delete action.
#
# The **UndoStack** virtual event is generated every time the undo stack or the redo stack becomes empty or unempty.
#
# The undo mechanism is also linked to the modified flag.
# This means that undoing or redoing changes can take a modified text widget back to the unmodified state or vice versa.
# The modified flag will be set automatically to the appropriate state.
# This automatic coupling does not work when the modified flag has been set by the user, until the flag has been reset again.
#
# See below for the pathName edit widget command that controls the undo mechanism.
#
#### PEER WIDGETS:
#
# The text widget has a separate store of all its data concerning each line's textual contents, marks, tags, images and windows, and the undo stack.
#
# While this data store cannot be accessed directly (i.e. without a text widget as an intermediary), multiple text widgets can be created,
# each of which present different views on the same underlying data.
# Such text widgets are known as peer text widgets.
#
# As text is added, deleted, edited and coloured in any one widget, and as images, marks, tags are adjusted, all such changes will be reflected
# in all peers.
#
# All data and markup is shared, except for a few small details.
# First, the sel tag may be set and configured (in its display style) differently for each peer.
# Second, each peer has its own insert and current mark positions (but all other marks are shared).
# Third, embedded windows, which are arbitrary other widgets, cannot be shared between peers.
# This means the **-window** option of embedded windows is independently set for each peer (it is advisable to use the **-create** script capabilities
# to allow each peer to create its own embedded windows as needed).
# Fourth, all of the configuration options of each peer (e.g. **-font**, etc) can be set independently, with the exception of **-undo**, **-maxundo**,
# **-autoseparators** (i.e. all undo, redo and modified state issues are shared).
#
# Finally any single peer need not contain all lines from the underlying data store.
# When creating a peer, a contiguous range of lines (e.g. only lines 52 through 125) may be specified.
# This allows a peer to contain just a small portion of the overall text.
# The range of lines will expand and contract as text is inserted or deleted.
# The peer will only ever display complete lines of text (one cannot share just part of a line).
# If the peer's contents contracts to nothing (i.e. all complete lines in the peer widget have been deleted from another widget), then it is impossible
# for new lines to be inserted.
# The peer will simply become an empty shell on which the background can be configured, but which will never show any content (without manual
# reconfiguration of the start and end lines).
# Note that a peer which does not contain all of the underlying data store still has indices numbered from "1.0" to "end".
# It is simply that those indices reflect a subset of the total data, and data outside the contained range is not accessible to the peer.
# This means that the command peerName index end may return quite different values in different peers.
# Similarly, commands like peerName tag ranges will not return index ranges outside that which is meaningful to the peer.
# The configuration options **-startline** and **-endline** may be used to control how much of the underlying data is contained in any given text widget.
#
# Note that peers are really peers.
# Deleting the "original" text widget will not cause any other peers to be deleted, or otherwise affected.
#
# See below for the pathName peer widget command that controls the creation of peer widgets.
#
#### ASYNCHRONOUS UPDATE OF LINE HEIGHTS:
#
# In order to maintain a responsive user-experience, the text widget calculates lines metrics (line heights in pixels) asynchronously.
# Because of this, some commands of the text widget may return wrong results if the asynchronous calculations are not finished at the time of calling.
# This applies to **pathName count -ypixels** and **pathName yview**.
#
# Again for performance reasons, it would not be appropriate to let these commands always wait for the end of the update calculation each time they are called.
# In most use cases of these commands a more or less inaccurate result does not really matter compared to execution speed.
#
# In case accurate result is needed (and if the text widget is managed by a geometry manager), one can resort to **pathName sync** and
# **pathName pendingsync** to control the synchronization of the view of text widgets.
#
# The **WidgetViewSync** virtual event fires when the line heights of the text widget become obsolete (due to some editing command or configuration change),
# and again when the internal data of the text widget are back in sync with the widget view.
# The detail field (**%d** substitution) is either true (when the widget is in sync) or false (when it is not).
#
# **pathName sync**, **pathName pendingsync** and **WidgetViewSync** apply to each text widget independently of its peers.
#
# Examples of use:
#
#   ## Example 1:
#   # immediately complete line metrics at any cost (GUI unresponsive)
#   $w sync
#   $w yview moveto $fraction
#
#   ## Example 2:
#   # synchronously wait for up-to-date line metrics (GUI responsive)
#   # before executing the scheduled command, but don't block execution flow
#   $w sync -command [list $w yview moveto $fraction]
#
#   ## Example 3:
#   # init
#   set yud($w) 0
#   proc updateaction w {
#       set ::yud($w) 1
#       # any other update action here...
#   }
#   # runtime, synchronously wait for up-to-date line metrics (GUI responsive)
#   $w sync -command [list updateaction $w]
#   vwait yud($w)
#   $w yview moveto $fraction
#
#   ## Example 4:
#   # init
#   set todo($w) {}
#   proc updateaction w {
#       foreach cmd $::todo($w) {uplevel #0 $cmd}
#       set todo($w) {}
#   }
#   # runtime
#   lappend todo($w) [list $w yview moveto $fraction]
#   $w sync -command [list updateaction $w]
#
#   ## Example 5:
#   # init
#   set todo($w) {}
#   bind $w <<WidgetViewSync>> {
#       if {%d} {
#           foreach cmd $todo(%W) {eval $cmd}
#           set todo(%W) {}
#       }
#   }
#   # runtime
#   if {![$w pendingsync]} {
#       $w yview moveto $fraction
#   } else {
#       lappend todo($w) [list $w yview moveto $fraction]
#   }
#
#### STATES:
#
# The text widget supports only the **normal** and **disabled** 'physical' states.
# In the **disabled** state characters may not be inserted or deleted and no insertion cursor will be displayed, even if the input focus
# is in the widget.
#
#### STYLING OPTIONS:
#
# Default style name: **Text**
#
# Every text styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the widget in order to facilitate the developer work and
# augment the user experience at the same time.
#
# If the widget is disabled using the **-state** option, then its view can still be adjusted and text can still be selected,
# but no insertion cursor will be displayed and no text modifications will take place.
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
# Simple texts (**-scrollbar false**):
#
#     1.  **MouseWheel** events will try to find the innermost widget scrollable parent with an active vertical scrollbar and move that
#         scrollbar by one unit up or down (depending on the mousewheel direction).
#         If none of the widget's parents meets the required condition, nothing will happen.
#
#     2.  **Shift-MouseWheel** events will try to find the innermost widget scrollable parent with an active horizontal scrollbar and move
#         that scrollbar by one unit left or right (depending on the mousewheel direction).
#         If none of the widget's parents meets the required condition, nothing will happen.
#
#     3.  **Control-MouseWheel** events will try to find the innermost widget scrollable parent with an active vertical scrollbar and move
#         that scrollbar by one page up or down (depending on the mousewheel direction).
#         If none of the widget's parents meets the required condition, nothing will happen.
#
#     4.  **Control-Shift-MouseWheel** events will try to find the innermost widget scrollable parent with an active horizontal scrollbar
#         and move that scrollbar by one page left or right (depending on the mousewheel direction).
#         If none of the widget's parents meets the required condition, nothing will happen.
#
#     5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#         These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#            1 - **TouchpadScroll** events along the X axis will try to find the innermost widget scrollable parent with an active horizontal
#                scrollbar and move that scrollbar by one unit towards the left or the right (depending on the direction of the touchpad event).
#                If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#            2 - **TouchpadScroll** events along the Y axis will try to find the innermost widget scrollable parent with an active vertical
#                scrollbar and move that scrollbar by one unit towards the top or the bottom (depending on the direction of the touchpad event).
#                If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
#     6.  **Control-TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#         These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#            1 - **Control-TouchpadScroll** events along the X axis will try to find the innermost widget scrollable parent with an active
#                horizontal scrollbar and move that scrollbar by one page towards the left or the right (depending on the direction of the touchpad event).
#                If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#            2 - **Control-TouchpadScroll** events along the Y axis will try to find the innermost widget scrollable parent with an active
#                vertical scrollbar and move that scrollbar by one page towards the top or the bottom (depending on the direction of the touchpad event).
#                If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# Scrollable texts (**-scrollbar true**):
#
#     1.  If the widget have an active vertical scrollbar, **MouseWheel** events will scroll one unit towards the top or the bottom of the widget
#         (depending on the direction of the mousewheel event).
#
#         If the widget doesn't have an active vertical scrollbar, **MouseWheel** events will try to find the innermost widget scrollable parent
#         with an active vertical scrollbar and move that scrollbar by one unit up or down (depending on the mousewheel direction).
#         If none of the widget's parents meets the required condition, nothing will happen.
#
#     2.  If the widget have an active horizontal scrollbar, **Shift-MouseWheel** events will scroll one unit towards the left or the right of the
#         widget (depending on the direction of the mousewheel event).
#
#         If the widget doesn't have an active horizontal scrollbar, **Shift-MouseWheel** events will try to find the innermost widget scrollable
#         parent with an active horizontal scrollbar and move that scrollbar by one unit left or right (depending on the mousewheel direction).
#         If none of the widget's parents meets the required condition, nothing will happen.
#
#     3.  If the widget have an active vertical scrollbar, **Control-MouseWheel** events will scroll one page towards the top or the bottom of the
#         widget (depending on the direction of the mousewheel event).
#
#         If the widget doesn't have an active vertical scrollbar, **Control-MouseWheel** events will try to find the innermost widget scrollable
#         parent with an active vertical scrollbar and move that scrollbar by one page up or down (depending on the mousewheel direction).
#         If none of the widget's parents meets the required condition, nothing will happen.
#
#     4.  If the widget have an active horizontal scrollbar **Control-Shift-MouseWheel** events will scroll one page towards the left or the right
#         of the widget (depending on the direction of the mousewheel event).
#
#         If the widget doesn't have an active horizontal scrollbar, **Control-Shift-MouseWheel** events will try to find the innermost widget scrollable
#         parent with an active horizontal scrollbar and move that scrollbar by one page left or right (depending on the mousewheel direction).
#         If none of the widget's parents meets the required condition, nothing will happen.
#
#     5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#         These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#            1 - If the widget have an active horizontal scrollbar, **TouchpadScroll** events along the X axis will try to scroll the widget scrollbar
#                one unit towards the left or the right (depending on the direction of the touchpad event).
#
#                If the widget does not have an active horizontal scrollbar, **TouchpadScroll** events along the X axis will try to find the innermost
#                widget scrollable parent with an active horizontal scrollbar and move that scrollbar by one unit towards the left or the right
#                (depending on the direction of the touchpad event).
#                If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#            2 - If the widget have an active vertical scrollbar, **TouchpadScroll** events along the Y axis will try to scroll the widget scrollbar
#                one unit towards the top or the bottom (depending on the direction of the touchpad event).
#
#                If the widget does not have an active vertical scrollbar, **TouchpadScroll** events along the Y axis will try to find the innermost
#                widget scrollable parent with an active vertical scrollbar and move that scrollbar by one unit towards the top or the bottom
#                (depending on the direction of the touchpad event).
#                If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
#     6.  **Control-TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#         These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#            1 - If the widget have an active horizontal scrollbar, **Control-TouchpadScroll** events along the X axis will try to scroll the widget
#                scrollbar one page towards the left or the right (depending on the direction of the touchpad event).
#
#                If the widget does not have an active horizontal scrollbar, **Control-TouchpadScroll** events along the X axis will try to find
#                the innermost widget scrollable parent with an active horizontal scrollbar and move that scrollbar by one page towards the left
#                or the right (depending on the direction of the touchpad event).
#                If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#            2 - If the widget have an active vertical scrollbar, **Control-TouchpadScroll** events along the Y axis will try to scroll the widget
#                scrollbar one page towards the top or the bottom (depending on the direction of the touchpad event).
#
#                If the widget does not have an active vertical scrollbar, **Control-TouchpadScroll** events along the Y axis will try to find
#                the innermost widget scrollable parent with an active vertical scrollbar and move that scrollbar by one page towards the top
#                or the bottom (depending on the direction of the touchpad event).
#                If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 7.  **ContextMenu** events will display the contextual menu associated with the widget.
#     See the **-cmenu** option for more details.
#
# The following behavior will happen if the widget is disabled.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  If the widget is scrollable and its vertical scrollbar is active:
#       - **Prior**        Scrolls one page towards the top of the widget.
#       - **Next**         Scrolls one page towards the bottom of the widget.
#     If the widget vertical scrollbar is not active (or the widget is not scrollable), mustang will try to find the innermost widget scrollable
#     parent with an active vertical scrollbar and scroll that scrollbar.
#     If none of the widget's parents meets the required conditions, nothing will happen.
#
# 2.  If the widget is scrollable and its horizontal scrollbar is active:
#       - **Control-Prior** Scrolls one page towards the right of the widget.
#       - **Control-Next**  Scrolls one page towards the left of the widget.
#     If the widget horizontal scrollbar is not active (or the widget is not scrollable), mustang will try to find the innermost widget scrollable
#     parent with an active horizontal scrollbar and scroll that scrollbar.
#     If none of the widget's parents meets the required conditions, nothing will happen.
#
# 3.  **Shift-Prior** and **Shift-Next** scrolls the view by one page up or down and also extends the selection to that point.
#
###### INTERNAL MECHANISM:
#
# 1.  If the current theme follows the **clam** engine (like the 'Halo' theme) and the widget styleable options (**-borderwidth**
#     and **-bordercolor**) allows it, everytime the mouse cursor enters the widget it will illuminate its borders to visually
#     indicate that the user is inside the widget.
#
# 2.  Clicking the left mouse button positions the insertion cursor at the closest edge of the character underneath the mouse cursor,
#     sets the input focus to this widget, and clears any selection in the widget.
#     Dragging with the left mouse button strokes out a selection between the insertion cursor and the character under the mouse.
#
# 3.  Double-clicking with the left mouse button selects the word under the mouse and positions the insertion cursor at the start
#     of the word. Dragging after a double click will stroke out a selection consisting of whole words.
#
# 4.  Triple-clicking with the left mouse button selects the line under the mouse and positions the insertion cursor at the start
#     of the line. Dragging after a triple click will stroke out a selection consisting of whole lines.
#
# 5.  The ends of the selection can be adjusted by dragging with the left mouse button while the **Shift** key is down; this will
#     adjust the end of the selection that was nearest to the mouse cursor when the left mouse button was pressed.
#     If the button is double-clicked before dragging then the selection will be adjusted in units of whole words; if it is
#     triple-clicked then the selection will be adjusted in units of whole lines.
#
# 6.  Clicking the left mouse button with the **Control** key down will reposition the insertion cursor without affecting the selection.
#
# 7.  The view in the widget can be adjusted by dragging with the middle mouse button (button 2, or button 3 in TkAqua).
#     If the middle mouse button is clicked without moving the mouse, the selection is copied into the text at the position of
#     the mouse cursor. The **Insert** key also inserts the selection, but at the position of the insertion cursor.
#
# 8.  If the mouse is dragged out of the widget while the left mouse button is pressed, the entry will automatically scroll to make more text
#     visible (if there is more text off-screen on the side where the mouse left the window).
#
# The following behavior will happen if the widget has the focus and its state is not disabled.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  If any normal printing characters are typed, they are inserted at the point of the insertion cursor.
#
# 2.  The **Left** and **Right** keys move the insertion cursor one character to the left or right; they also clear any selection
#     in the text. **Shift-Left** and **Shift-Right** move the insertion cursor one character to the left or right and the selection
#     is extended to include the new character.
#     **Control-Left** and **Control-Right** move the insertion cursor to the previous or next word.
#
# 3.  The **Up** and **Down** keys move the insertion cursor one line up or down and clear any selection in the text. **Shift-Up** and
#     **Shift-Down** move the insertion cursor one line up or down and the selection is extended to include the new character.
#     **Control-Up** and **Control-Down** move the insertion cursor to the previous or next paragraph.
#
# 4.  The **Prior** and **Next** keys move the insertion cursor by one page up or down and clear any selection in the text.
#     **Shift-Prior** and **Shift-Next** move the insertion cursor by one page up or down and also extends the selection to that point.
#
# 5.  **Control-Prior** and **Control-Next** keys scroll the view left or right by one page without moving the insertion cursor
#     or affecting the selection.
#
# 6.  The **Home** key will move the insertion cursor to the beginning of its display line and clear any selection in the widget.
#     **Control-Home** will move the insertion cursor to the beginning of the entire text and clear any selection in the widget.
#     **Shift-Home** moves the insertion cursor to the beginning of the display line and also extends the selection to that point.
#     **Control-Shift-Home** moves the insertion cursor to the beginning of the entire text and also extends the selection to that point.
#
# 7.  The **End** key will move the insertion cursor to the end of its display line and clear any selection in the widget.
#     **Control-End** will move the insertion cursor to the end of the entire text and clear any selection in the widget.
#     **Shift-End** moves the insertion cursor to the end of the display line and also extends the selection to that point.
#     **Control-Shift-End** moves the insertion cursor to the end of the entire text and also extends the selection to that point.
#
# 8.  The **Select** key set the selection anchor to the position of the insertion cursor.
#     They do not affect the current selection. **Shift-Select** adjust the selection to the current position of the insertion cursor,
#     selecting from the anchor to the insertion cursor if there was not any selection previously.
#
# 9.  The **Delete** key and **Control-d** deletes the selection, if there is one in the widget.
#     If there is no selection, it deletes the character to the right of the insertion cursor.
#     **Alt-d** (**Option-d** for macOS) deletes from the insertion cursor to the end of its line or deletes the newline character
#     if the insertion cursor is already at the end of a line.
#
# 10. The **Backspace** key deletes the selection, if there is one in the widget.
#     If there is no selection, it deletes the character to the left of the insertion cursor.
#
# 11. **Control-a** (**Command-a** for macOS) selects the entire contents of the widget.
#     The **Escape** key and **Control-Shift-a** (**Command-Shift-a** for macOS) clears any selection in the widget
#     or does nothing if there isn't any.
#
# 12. **Control-c** copies the selection in the widget to the clipboard, if there is a selection.
#     This action is carried out by the command **tk_textCopy**.
#
# 13. **Control-x** copies the selection in the widget to the clipboard and deletes the selection.
#     This action is carried out by the command **tk_textCut**.
#     Does nothing if there is no selection in the widget.
#
# 14. **Control-v** inserts the contents of the clipboard at the position of the insertion cursor.
#     This action is carried out by the command **tk_textPaste**.
#
# 15. **Control-z** undoes the last edit action if the **-undo** option is true. Does nothing otherwise.
#     **Control-Shift-z** reapplies the last undone edit action if the **-undo** option is true. Does nothing otherwise.
#
# 16. **Control-t** reverses the order of the two characters to the right of the insertion cursor.
#
# 17. The **Tab** key and **Control-i** will add a certain amount of spaces. Is normally used for indentation purposes.
#
# 18. **Control-Tab** key will change the focus to the next focussable widget while **Control-Shift-Tab** key will change it to the
#     previous focussable widget.
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
#### KNOWN ISSUES:
#
###### ISSUES CONCERNING CHARS AND INDICES:
#
# Before Tk 8.5, the widget used the string "chars" to refer to index positions (which included characters, embedded windows and embedded images). As of Tk 8.5 the text widget deals separately and correctly with "chars" and "indices". For backwards compatibility, however, the index modifiers "+N chars" and "-N chars" continue to refer to indices. One must use any of the full forms "+N any chars" or "-N any chars" etc. to refer to actual character indices. This confusion may be fixed in a future release by making the widget correctly interpret "+N chars" as a synonym for "+N any chars".
#
###### PERFORMANCE ISSUES:
#
# Text widgets should run efficiently under a variety of conditions.
# The text widget uses about 2-3 bytes of main memory for each byte of text, so texts containing a megabyte or more should be practical on most workstations.
# Text is represented internally with a modified B-tree structure that makes operations relatively efficient even with large texts.
# Tags are included in the B-tree structure in a way that allows tags to span large ranges or have many disjoint smaller ranges without loss of efficiency.
# Marks are also implemented in a way that allows large numbers of marks.
# In most cases it is fine to have large numbers of unique tags, or a tag that has many distinct ranges.
#
# One performance problem can arise if you have hundreds or thousands of different tags that all have the following characteristics: the first and last
# ranges of each tag are near the beginning and end of the text, respectively, or a single tag range covers most of the text widget.
# The cost of adding and deleting tags like this is proportional to the number of other tags with the same properties.
# In contrast, there is no problem with having thousands of distinct tags if their overall ranges are localized and spread uniformly throughout the text.
#
# Very long text lines can be expensive, especially if they have many marks and tags within them.
#
# The display line with the insert cursor is redrawn each time the cursor blinks, which causes a steady stream of graphics traffic.
# Set the **-insertofftime** attribute to **0** avoid this.
#
###### KNOWN BUGS:
#
# The **window search** *-regexp* sub-command attempts to perform sophisticated regexp matching across multiple lines in an efficient fashion
# (since Tk 8.5), examining each line individually, and then in small groups of lines, whether searching forwards or backwards.
# Under certain conditions the search result might differ from that obtained by applying the same regexp to the entire text from the widget in one go.
# For example, when searching with a greedy regexp, the widget will continue to attempt to add extra lines to the match as long as one of two
# conditions are true: either Tcl's regexp library returns a code to indicate a longer match is possible (but there are known bugs in Tcl which mean
# this code is not always correctly returned); or if each extra line added results in at least a partial match with the pattern.
# This means in the case where the first extra line added results in no match and Tcl's regexp system returns the incorrect code and adding a
# second extra line would actually match, the text widget will return the wrong result. In practice this is a rare problem, but it can occur,
# for example:
#
#   pack [text .t]
#   .t insert 1.0 "aaaa\nbbbb\ncccc\nbbbb\naaaa\n"
#   .t search -regexp -- {(a+|b+\nc+\nb+)+\na+} 1.0
#
# will not find a match when one exists of 19 characters starting from the first "b".
#
# Whenever one possible match is fully enclosed in another, the search command will attempt to ensure only the larger match is returned.
# When performing backwards regexp searches it is possible that Tcl will not always achieve this, in the case where a match is preceded by one or
# more short, non-overlapping matches, all of which are preceded by a large match which actually encompasses all of them.
# The search algorithm used by the widget does not look back arbitrarily far for a possible match which might cover large portions of the widget.
# For example:
#
#   pack [text .t]
#   .t insert 1.0 "aaaa\nbbbb\nbbbb\nbbbb\nbbbb\n"
#   .t search -regexp -backward -- {b+\n|a+\n(b+\n)+} end
#
# matches at "5.0" when a true greedy match would match at "1.0".
# Similarly if we add -all to this case, it matches at all of "5.0", "4.0", "3.0" and "1.0", when really it should only match at "1.0" since that
# match encloses all the others.
#
#### EXAMPLE:
#
# Create a writeable text 80x5.
#   text .t      -blockcursor false \
#                -borderwidth 2 \
#                    -columns 80 \
#                     -cursor xterm \
#                       -font BiggestFont \
#           -insertunfocussed hollow \
#              -insertofftime 0 \
#                     -relief solid \
#                       -rows 4 \
#                 -scrollable true \
#                      -state normal \
#                      -style Text \
#                  -takefocus true \
#                       -wrap word;
#
#   # Pack the text and expand it in both directions.
#   pack .t  -anchor nw \
#            -expand true \
#              -fill both \
#              -padx [list 15 15] \
#              -pady [list 15 15] \
#              -side top;
#
#   # Focus the text.
#   focus .t
#
#   # Insert some text inside the widget.
#   set text1  [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text2  [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text3  [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text4  [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text5  [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text6  [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text7  [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text8  [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text9  [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text10 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text11 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text12 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text13 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text14 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text15 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text16 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text17 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text18 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text19 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#   set text20 [list "Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis.\n"]
#
#   set i 1
#   while { $i < 21 } {
#       .t insert [string cat $i ".0"] {*}[set [string cat "text" $i]]
#       incr i
#   }
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
package provide ::ms::text 0.1

###################################
##                               ##
##     _SIMPLE_TEXT BINDINGS     ##
##                               ##
###################################

# Allowing some modifiers combination.
switch -- [_tk windowingsystem] {
    aqua {
        _bind _Simple_Text <Option-KeyPress>         { # Enable binding }
        _bind _Simple_Text <Option-Shift-KeyPress>   { # Enable binding }
        _bind _Simple_Text <Control-KeyPress>        { # Enable binding }
        _bind _Simple_Text <Control-Option-KeyPress> { # Enable binding }
        _bind _Simple_Text <Control-Shift-KeyPress>  { # Enable binding }
        _bind _Simple_Text <Command-KeyPress>        { # Enable binding }
        _bind _Simple_Text <Command-Shift-KeyPress>  { # Enable binding }
    }
    default {
        _bind _Simple_Text <Alt-KeyPress>           { # Enable binding }
        _bind _Simple_Text <Alt-Shift-KeyPress>     { # Enable binding }
        _bind _Simple_Text <Control-KeyPress>       { # Enable binding }
        _bind _Simple_Text <Control-Alt-KeyPress>   { # Enable binding }
        _bind _Simple_Text <Control-Shift-KeyPress> { # Enable binding }
        _bind _Simple_Text <Meta-KeyPress>          { # Enable binding }
        _bind _Simple_Text <Meta-Shift-KeyPress>    { # Enable binding }
    }
}

# Backspace key
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the left of the cursor location.
_bind _Simple_Text <KeyPress-BackSpace> { ::ms::text::Backspace %W; break }

# ButtonPress-1
_bind _Simple_Text <ButtonPress-1> { ::ms::text::ButtonPress %W %x %y; break }

# Configure
_bind _Simple_Text <Configure> { ::ms::text::Configure %W; break }

# Control-Tab/Control-Shift-Tab
_bind _Simple_Text <Control-Tab>       { ::ms::text::Control_Tab %W +1; break }
_bind _Simple_Text <Control-Shift-Tab> { ::ms::text::Control_Tab %W -1; break }

# Cut/Copy/Paste/Clear
_bind _Simple_Text <<Cut>>   { ::ms::text::Cut   %W; break }
_bind _Simple_Text <<Copy>>  { ::ms::text::Copy  %W; break }
_bind _Simple_Text <<Paste>> { ::ms::text::Paste %W %x %y CLIPBOARD; break }
_bind _Simple_Text <<Clear>> { ::ms::text::Clear %W; break }

# Delete key
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the right of the cursor location.
_bind _Simple_Text <KeyPress-Delete>    { ::ms::text::Delete %W; break }
_bind _Simple_Text <KeyPress-KP_Delete> { ::ms::text::Delete %W; break }
_bind _Simple_Text <<DeleteChar>>       { ::ms::text::Delete %W; break }

# Delete from the insertion cursor till the end of the line.
switch -- [_tk windowingsystem] {
    aqua    { _bind _Simple_Text <Option-KeyPress-d> { ::ms::text::Delete_Till_Line_End %W; break } }
    default { _bind _Simple_Text <Alt-KeyPress-d>    { ::ms::text::Delete_Till_Line_End %W; break } }
}

# If a selection is present, delete the selected text, otherwise delete all the characters positioned
# to the right of the cursor location till the start of the next word.
_bind _Simple_Text <<DeleteWord>> { ::ms::text::Delete_Word %W; break }

# Disable the following bindings to prevent Tk to fire them up:
_bind _Simple_Text <Control-KeyPress-o>    { break }
_bind _Simple_Text <Meta-KeyPress-b>       { break }
_bind _Simple_Text <Meta-KeyPress-d>       { break }
_bind _Simple_Text <Meta-KeyPress-f>       { break }
_bind _Simple_Text <Meta-KeyPress-less>    { break }
_bind _Simple_Text <Meta-KeyPress-greater> { break }

# Disable the Escape key to prevent Tk from printing it.
_bind _Simple_Text <Escape> { break }

# Activate/Deactivate
_bind _Simple_Text <Activate>   { ::ms::text::Pathname_Cmd %W state !background; break }
_bind _Simple_Text <Deactivate> { ::ms::text::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Simple_Text <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Simple_Text <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Simple_Text <Destroy> { ::ms::text::Destroy %W; break }

# Enter/Leave
_bind _Simple_Text <Enter> { ::ms::text::Pathname_Cmd %W state  hover; break }
_bind _Simple_Text <Leave> { ::ms::text::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Simple_Text <FocusIn>  { ::ms::text::FocusIn  %W; break }
_bind _Simple_Text <FocusOut> { ::ms::text::FocusOut %W; break }

# Insert
_bind _Simple_Text <KeyPress-Insert>    { ::ms::text::Insert %W; break }
_bind _Simple_Text <KeyPress-KP_Insert> { ::ms::text::Insert %W; break }

# Key
_bind _Simple_Text <KeyPress> { ::ms::text::KeyPress %W %A; break }

# Return
_bind _Simple_Text <KeyPress-Return>   { ::ms::text::Return %W; break }
_bind _Simple_Text <KeyPress-KP_Enter> { ::ms::text::Return %W; break }

# Tk IME Text
_bind _Simple_Text <<TkStartIMEMarkedText>> { ::ms::text::Start_IME_Marked_Text %W; break }
_bind _Simple_Text <<TkEndIMEMarkedText>>   { ::ms::text::End_IME_Marked_Text   %W; break }
_bind _Simple_Text <<TkClearIMEMarkedText>> { ::ms::text::Clear_IME_Marked_Text %W; break }
_bind _Simple_Text <<TkAccentBackspace>>    { ::ms::text::Accent_Backspace      %W; break }

# Transpose
_bind _Simple_Text <Control-KeyPress-t> { ::ms::text::Transpose %W; break }

# Undo/Redo
_bind _Simple_Text <<Undo>> { ::ms::text::Undo %W; break }
_bind _Simple_Text <<Redo>> { ::ms::text::Redo %W; break }

# Scan or Paste.
_bind _Simple_Text <Button-2>         { ::ms::text::Scan_Or_Paste %W %x %y "Button-2"; break }
_bind _Simple_Text <B2-Motion>        { ::ms::text::Scan_Or_Paste %W %x %y "B2-Motion"; break }
_bind _Simple_Text <ButtonRelease-2>  { ::ms::text::Scan_Or_Paste %W %x %y "ButtonRelease-2"; break }

_bind _Simple_Text <Button-3>         { ::ms::text::Scan_Or_Paste %W %x %y "Button-3"; break }
_bind _Simple_Text <B3-Motion>        { ::ms::text::Scan_Or_Paste %W %x %y "B3-Motion"; break }
_bind _Simple_Text <ButtonRelease-3>  { ::ms::text::Scan_Or_Paste %W %x %y "ButtonRelease-3"; break }

_bind _Simple_Text <<PasteSelection>> { ::ms::text::Scan_Or_Paste %W %x %y "PasteSelection"; break }

# PageUp/PageDown/PageLeft/PageRight
_bind _Simple_Text <Prior>         { ::ms::text::PageUp    %W; break }
_bind _Simple_Text <Next>          { ::ms::text::PageDown  %W; break }
_bind _Simple_Text <Control-Prior> { ::ms::text::PageLeft  %W; break }
_bind _Simple_Text <Control-Next>  { ::ms::text::PageRight %W; break }

# Go to the start/end of the line.
_bind _Simple_Text <<LineStart>> { ::ms::text::Line_Start %W; break }
_bind _Simple_Text <<LineEnd>>   { ::ms::text::Line_End   %W; break }

# Go to the start/end of the entire text.
_bind _Simple_Text <<LineTop>>    { ::ms::text::Line_Top    %W; break }
_bind _Simple_Text <<LineBottom>> { ::ms::text::Line_Bottom %W; break }

# Select all/none.
_bind _Simple_Text <<SelectAll>>  { ::ms::text::Select_All  %W; break }
_bind _Simple_Text <<SelectNone>> { ::ms::text::Select_None %W; break }

# Select from the insertion cursor to the previous/next character.
_bind _Simple_Text <<SelectPrevChar>> { ::ms::text::Select_Previous_Char %W; break }
_bind _Simple_Text <<SelectNextChar>> { ::ms::text::Select_Next_Char     %W; break }

# Select from the insertion cursor to the previous/next word.
_bind _Simple_Text <<SelectPrevWord>> { ::ms::text::Select_Previous_Word %W; break }
_bind _Simple_Text <<SelectNextWord>> { ::ms::text::Select_Next_Word     %W; break }

# Select from the insertion cursor to the previous/next paragraph.
_bind _Simple_Text <<SelectPrevPara>> { ::ms::text::Select_Previous_Paragraph %W; break }
_bind _Simple_Text <<SelectNextPara>> { ::ms::text::Select_Next_Paragraph     %W; break }

# Select from the insertion cursor to the previous/next line.
_bind _Simple_Text <<SelectPrevLine>> { ::ms::text::Select_Previous_Line %W; break }
_bind _Simple_Text <<SelectNextLine>> { ::ms::text::Select_Next_Line     %W; break }

# Select from the insertion cursor to the start/end of the line.
_bind _Simple_Text <<SelectLineStart>> { ::ms::text::Select_Line_Start %W; break }
_bind _Simple_Text <<SelectLineEnd>>   { ::ms::text::Select_Line_End   %W; break }

# Select from the insertion cursor to the start/end of the entire text.
_bind _Simple_Text <<SelectLineTop>>    { ::ms::text::Select_Line_Top    %W; break }
_bind _Simple_Text <<SelectLineBottom>> { ::ms::text::Select_Line_Bottom %W; break }

# Select from the insertion cursor to one page up or down.
_bind _Simple_Text <Shift-Prior> { ::ms::text::Select_PageUp   %W; break }
_bind _Simple_Text <Shift-Next>  { ::ms::text::Select_PageDown %W; break }

# If the widget state is normal, move the insertion cursor to the previous or next character.
# If the widget state is disabled, try to move the widget horizontal scrollbar (if any) by one unit towards the
# left or the right ; if it's not possible, try to find the innermost widget's scrollable parent with an active
# horizontal scrollbar and move that scrollbar by one unit towards the left or the right, otherwise don't do anything.
_bind _Simple_Text <<PrevChar>> { ::ms::text::Previous_Char %W; break }
_bind _Simple_Text <<NextChar>> { ::ms::text::Next_Char     %W; break }

# If the widget state is normal, move the insertion cursor to the previous or next line.
# If the widget state is disabled, try to move the widget vertical scrollbar (if any) by one unit towards the
# top or the bottom; if it's not possible, try to find the innermost widget's scrollable parent with an active
# vertical scrollbar and move that scrollbar by one unit towards the top or the bottom, otherwise don't do anything.
_bind _Simple_Text <<PrevLine>> { ::ms::text::Previous_Line %W; break }
_bind _Simple_Text <<NextLine>> { ::ms::text::Next_Line     %W; break }

# If the widget state is normal, move the insertion cursor to the previous or next word.
# If the widget state is disabled, try to move the widget horizontal scrollbar (if any) by one page towards the
# left or the right; if it's not possible, try to find the innermost widget's scrollable parent with an active
# horizontal scrollbar and move that scrollbar by one page towards the left or right, otherwise don't do anything.
_bind _Simple_Text <<PrevWord>> { ::ms::text::Previous_Word %W; break }
_bind _Simple_Text <<NextWord>> { ::ms::text::Next_Word     %W; break }

# If the widget state is normal, move the insertion cursor to the previous or next paragraph.
# If the widget state is disabled, try to move the widget vertical scrollbar (if any) by one pagetowards the
# top or the bottom; if it's not possible, try to find the innermost widget's scrollable parent with an active
# vertical scrollbar and move that scrollbar by one page towards the top or bottom, otherwise don't do anything.
_bind _Simple_Text <<PrevPara>> { ::ms::text::Previous_Paragraph %W; break }
_bind _Simple_Text <<NextPara>> { ::ms::text::Next_Paragraph     %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that scrollbar
# by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Text <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
# by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Text <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that scrollbar
# by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Text <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
# by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Text <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that
#       scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that
#       scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Simple_Text <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that
#       scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that
#       scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Simple_Text <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

#######################################
##                                   ##
##     _SCROLLABLE_TEXT BINDINGS     ##
##                                   ##
#######################################

# Allowing some modifiers combination.
switch -- [_tk windowingsystem] {
    aqua {
        _bind _Scrollable_Text <Option-KeyPress>         { # Enable binding }
        _bind _Scrollable_Text <Option-Shift-KeyPress>   { # Enable binding }
        _bind _Scrollable_Text <Control-KeyPress>        { # Enable binding }
        _bind _Scrollable_Text <Control-Option-KeyPress> { # Enable binding }
        _bind _Scrollable_Text <Control-Shift-KeyPress>  { # Enable binding }
        _bind _Scrollable_Text <Command-KeyPress>        { # Enable binding }
        _bind _Scrollable_Text <Command-Shift-KeyPress>  { # Enable binding }
    }
    default {
        _bind _Scrollable_Text <Alt-KeyPress>           { # Enable binding }
        _bind _Scrollable_Text <Alt-Shift-KeyPress>     { # Enable binding }
        _bind _Scrollable_Text <Control-KeyPress>       { # Enable binding }
        _bind _Scrollable_Text <Control-Alt-KeyPress>   { # Enable binding }
        _bind _Scrollable_Text <Control-Shift-KeyPress> { # Enable binding }
        _bind _Scrollable_Text <Meta-KeyPress>          { # Enable binding }
        _bind _Scrollable_Text <Meta-Shift-KeyPress>    { # Enable binding }
    }
}

# Backspace key
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the left of the cursor location.
_bind _Scrollable_Text <KeyPress-BackSpace> { ::ms::text::Backspace [_winfo parent %W]; break }

# ButtonPress-1
_bind _Scrollable_Text <ButtonPress-1> { ::ms::text::ButtonPress [_winfo parent %W] %x %y; break }

# Configure
_bind _Scrollable_Text <Configure> { ::ms::text::Configure [_winfo parent %W]; break }

# Contextual menu
_bind _Scrollable_Text <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

# Control-Tab/Control-Shift-Tab
_bind _Scrollable_Text <Control-Tab>       { ::ms::text::Control_Tab [_winfo parent %W] +1; break }
_bind _Scrollable_Text <Control-Shift-Tab> { ::ms::text::Control_Tab [_winfo parent %W] -1; break }

# Cut/Copy/Paste/Clear
_bind _Scrollable_Text <<Cut>>   { ::ms::text::Cut   [_winfo parent %W]; break }
_bind _Scrollable_Text <<Copy>>  { ::ms::text::Copy  %W; break }
_bind _Scrollable_Text <<Paste>> { ::ms::text::Paste [_winfo parent %W] %x %y CLIPBOARD; break }
_bind _Scrollable_Text <<Clear>> { ::ms::text::Clear [_winfo parent %W]; break }

# Delete key
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the right of the cursor location.
_bind _Scrollable_Text <KeyPress-Delete>    { ::ms::text::Delete [_winfo parent %W]; break }
_bind _Scrollable_Text <KeyPress-KP_Delete> { ::ms::text::Delete [_winfo parent %W]; break }
_bind _Scrollable_Text <<DeleteChar>>       { ::ms::text::Delete [_winfo parent %W]; break }

# Delete from the insertion cursor till the end of the line.
switch -- [_tk windowingsystem] {
    aqua    { _bind _Scrollable_Text <Option-KeyPress-d> { ::ms::text::Delete_Till_Line_End [_winfo parent %W]; break } }
    default { _bind _Scrollable_Text <Alt-KeyPress-d>    { ::ms::text::Delete_Till_Line_End [_winfo parent %W]; break } }
}

# If a selection is present, delete the selected text, otherwise delete all the characters positioned
# to the right of the cursor location till the start of the next word.
_bind _Scrollable_Text <<DeleteWord>> { ::ms::text::Delete_Word [_winfo parent %W]; break }

# Disable the following bindings to prevent Tk to fire them up:
_bind _Scrollable_Text <Control-KeyPress-o>    { break }
_bind _Scrollable_Text <Meta-KeyPress-b>       { break }
_bind _Scrollable_Text <Meta-KeyPress-d>       { break }
_bind _Scrollable_Text <Meta-KeyPress-f>       { break }
_bind _Scrollable_Text <Meta-KeyPress-less>    { break }
_bind _Scrollable_Text <Meta-KeyPress-greater> { break }

# Disable the Escape key to prevent Tk from printing it.
_bind _Scrollable_Text <Escape> { break }

# Enter/Leave
_bind _Scrollable_Text <Enter> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }
_bind _Scrollable_Text <Leave> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }

# FocusIn/FocusOut
_bind _Scrollable_Text <FocusIn>  { ::ms::text::FocusIn  [_winfo parent %W]; break }
_bind _Scrollable_Text <FocusOut> { ::ms::text::FocusOut [_winfo parent %W]; break }

# Insert
_bind _Scrollable_Text <KeyPress-Insert>    { ::ms::text::Insert [_winfo parent %W]; break }
_bind _Scrollable_Text <KeyPress-KP_Insert> { ::ms::text::Insert [_winfo parent %W]; break }

# Key
_bind _Scrollable_Text <KeyPress> { ::ms::text::KeyPress [_winfo parent %W] %A; break }

# Return
_bind _Scrollable_Text <KeyPress-Return>   { ::ms::text::Return [_winfo parent %W]; break }
_bind _Scrollable_Text <KeyPress-KP_Enter> { ::ms::text::Return [_winfo parent %W]; break }

# Tk IME Text
_bind _Scrollable_Text <<TkStartIMEMarkedText>> { ::ms::text::Start_IME_Marked_Text [_winfo parent %W]; break }
_bind _Scrollable_Text <<TkEndIMEMarkedText>>   { ::ms::text::End_IME_Marked_Text   [_winfo parent %W]; break }
_bind _Scrollable_Text <<TkClearIMEMarkedText>> { ::ms::text::Clear_IME_Marked_Text [_winfo parent %W]; break }
_bind _Scrollable_Text <<TkAccentBackspace>>    { ::ms::text::Accent_Backspace      [_winfo parent %W]; break }

# Transpose
_bind _Scrollable_Text <Control-KeyPress-t> { ::ms::text::Transpose [_winfo parent %W]; break }

# Undo/Redo
_bind _Scrollable_Text <<Undo>> { ::ms::text::Undo [_winfo parent %W]; break }
_bind _Scrollable_Text <<Redo>> { ::ms::text::Redo [_winfo parent %W]; break }

# Scan or Paste.
_bind _Scrollable_Text <Button-2>         { ::ms::text::Scan_Or_Paste %W %x %y "Button-2"; break }
_bind _Scrollable_Text <B2-Motion>        { ::ms::text::Scan_Or_Paste %W %x %y "B2-Motion"; break }
_bind _Scrollable_Text <ButtonRelease-2>  { ::ms::text::Scan_Or_Paste %W %x %y "ButtonRelease-2"; break }

_bind _Scrollable_Text <Button-3>         { ::ms::text::Scan_Or_Paste %W %x %y "Button-3"; break }
_bind _Scrollable_Text <B3-Motion>        { ::ms::text::Scan_Or_Paste %W %x %y "B3-Motion"; break }
_bind _Scrollable_Text <ButtonRelease-3>  { ::ms::text::Scan_Or_Paste %W %x %y "ButtonRelease-3"; break }

_bind _Scrollable_Text <<PasteSelection>> { ::ms::text::Scan_Or_Paste %W %x %y "PasteSelection"; break }

# PageUp/PageDown/PageLeft/PageRight
_bind _Scrollable_Text <Prior>         { ::ms::text::PageUp    [_winfo parent %W]; break }
_bind _Scrollable_Text <Next>          { ::ms::text::PageDown  [_winfo parent %W]; break }
_bind _Scrollable_Text <Control-Prior> { ::ms::text::PageLeft  [_winfo parent %W]; break }
_bind _Scrollable_Text <Control-Next>  { ::ms::text::PageRight [_winfo parent %W]; break }

# Go to the start/end of the line.
_bind _Scrollable_Text <<LineStart>> { ::ms::text::Line_Start [_winfo parent %W]; break }
_bind _Scrollable_Text <<LineEnd>>   { ::ms::text::Line_End   [_winfo parent %W]; break }

# Go to the start/end of the entire text.
_bind _Scrollable_Text <<LineTop>>    { ::ms::text::Line_Top    [_winfo parent %W]; break }
_bind _Scrollable_Text <<LineBottom>> { ::ms::text::Line_Bottom [_winfo parent %W]; break }

# Select all/none.
_bind _Scrollable_Text <<SelectAll>>  { ::ms::text::Select_All  [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNone>> { ::ms::text::Select_None [_winfo parent %W]; break }

# Select from the insertion cursor to the previous/next character.
_bind _Scrollable_Text <<SelectPrevChar>> { ::ms::text::Select_Previous_Char [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNextChar>> { ::ms::text::Select_Next_Char     [_winfo parent %W]; break }

# Select from the insertion cursor to the previous/next word.
_bind _Scrollable_Text <<SelectPrevWord>> { ::ms::text::Select_Previous_Word [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNextWord>> { ::ms::text::Select_Next_Word     [_winfo parent %W]; break }

# Select from the insertion cursor to the previous/next paragraph.
_bind _Scrollable_Text <<SelectPrevPara>> { ::ms::text::Select_Previous_Paragraph [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNextPara>> { ::ms::text::Select_Next_Paragraph     [_winfo parent %W]; break }

# Select from the insertion cursor to the previous/next line.
_bind _Scrollable_Text <<SelectPrevLine>> { ::ms::text::Select_Previous_Line [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNextLine>> { ::ms::text::Select_Next_Line     [_winfo parent %W]; break }

# Select from the insertion cursor to the start/end of the line.
_bind _Scrollable_Text <<SelectLineStart>> { ::ms::text::Select_Line_Start [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectLineEnd>>   { ::ms::text::Select_Line_End   [_winfo parent %W]; break }

# Select from the insertion cursor to the start/end of the entire text.
_bind _Scrollable_Text <<SelectLineTop>>    { ::ms::text::Select_Line_Top    [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectLineBottom>> { ::ms::text::Select_Line_Bottom [_winfo parent %W]; break }

# Select from the insertion cursor to one page up or down.
_bind _Scrollable_Text <Shift-Prior> { ::ms::text::Select_PageUp   [_winfo parent %W]; break }
_bind _Scrollable_Text <Shift-Next>  { ::ms::text::Select_PageDown [_winfo parent %W]; break }

# If the widget state is normal, move the insertion cursor to the previous or next character.
# If the widget state is disabled, try to move the widget horizontal scrollbar (if any) by one unit towards the
# left or the right ; if it's not possible, try to find the innermost widget's scrollable parent with an active
# horizontal scrollbar and move that scrollbar by one unit towards the left or the right, otherwise don't do anything.
_bind _Scrollable_Text <<PrevChar>> { ::ms::text::Previous_Char [_winfo parent %W]; break }
_bind _Scrollable_Text <<NextChar>> { ::ms::text::Next_Char     [_winfo parent %W]; break }

# If the widget state is normal, move the insertion cursor to the previous or next line.
# If the widget state is disabled, try to move the widget vertical scrollbar (if any) by one unit towards the
# top or the bottom; if it's not possible, try to find the innermost widget's scrollable parent with an active
# vertical scrollbar and move that scrollbar by one unit towards the top or the bottom, otherwise don't do anything.
_bind _Scrollable_Text <<PrevLine>> { ::ms::text::Previous_Line [_winfo parent %W]; break }
_bind _Scrollable_Text <<NextLine>> { ::ms::text::Next_Line     [_winfo parent %W]; break }

# If the widget state is normal, move the insertion cursor to the previous or next word.
# If the widget state is disabled, try to move the widget horizontal scrollbar (if any) by one page towards the
# left or the right; if it's not possible, try to find the innermost widget's scrollable parent with an active
# horizontal scrollbar and move that scrollbar by one page towards the left or right, otherwise don't do anything.
_bind _Scrollable_Text <<PrevWord>> { ::ms::text::Previous_Word [_winfo parent %W]; break }
_bind _Scrollable_Text <<NextWord>> { ::ms::text::Next_Word     [_winfo parent %W]; break }

# If the widget state is normal, move the insertion cursor to the previous or next paragraph.
# If the widget state is disabled, try to move the widget vertical scrollbar (if any) by one pagetowards the
# top or the bottom; if it's not possible, try to find the innermost widget's scrollable parent with an active
# vertical scrollbar and move that scrollbar by one page towards the top or bottom, otherwise don't do anything.
_bind _Scrollable_Text <<PrevPara>> { ::ms::text::Previous_Paragraph [_winfo parent %W]; break }
_bind _Scrollable_Text <<NextPara>> { ::ms::text::Next_Paragraph     [_winfo parent %W]; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the text object by one unit up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Text <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's horizontal scrollbar is active, move the text object by one unit left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Text <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the text object by one page up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Text <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

# If the widget's horizontal scrollbar is active, move the text object by one page left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Text <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the text object by one unit left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the text object by one unit up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scrollable_Text <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the text object by one page left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the text object by one page up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scrollable_Text <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }

#################################
##                             ##
##     _HULL_TEXT BINDINGS     ##
##                             ##
#################################

# Activate/Deactivate
_bind _Hull_Text <Activate>   { ::ms::text::Pathname_Cmd %W state !background; break }
_bind _Hull_Text <Deactivate> { ::ms::text::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Hull_Text <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Hull_Text <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Hull_Text <Destroy> { ::ms::text::Destroy %W; break }

# FocusIn/FocusOut
_bind _Hull_Text <FocusIn>  { ::ms::text::FocusIn  %W; break }
_bind _Hull_Text <FocusOut> { ::ms::text::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Text <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Text <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Text <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Text <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Hull_Text <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Hull_Text <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

########################################
##                                    ##
##     _X_SCROLLBAR_TEXT BINDINGS     ##
##                                    ##
########################################

# ButtonPress-1
_bind _X_Scrollbar_Text <ButtonPress-1>   { ::ms::text::Scrollbar_ButtonPress [_winfo parent %W] horizontal %x %y; break }
_bind _X_Scrollbar_Text <B1-Motion>       { ::ms::text::Scrollbar_Drag        [_winfo parent %W] horizontal %x %y; break }
_bind _X_Scrollbar_Text <ButtonRelease-1> { ::ms::text::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _X_Scrollbar_Text <Enter> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }
_bind _X_Scrollbar_Text <Leave> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's horizontal scrollbar is active, move the text object by one unit left or right
# (depending on the mousewheel direction).
_bind _X_Scrollbar_Text <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
_bind _X_Scrollbar_Text <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# If the widget's horizontal scrollbar is active, move the text object by one page left or right
# (depending on the mousewheel direction).
_bind _X_Scrollbar_Text <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
_bind _X_Scrollbar_Text <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the text object by one unit left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _X_Scrollbar_Text <TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the text object by one page left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _X_Scrollbar_Text <Control-TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D pages; break }

########################################
##                                    ##
##     _Y_SCROLLBAR_TEXT BINDINGS     ##
##                                    ##
########################################

# ButtonPress-1
_bind _Y_Scrollbar_Text <ButtonPress-1>   { ::ms::text::Scrollbar_ButtonPress [_winfo parent %W] vertical %x %y; break }
_bind _Y_Scrollbar_Text <B1-Motion>       { ::ms::text::Scrollbar_Drag        [_winfo parent %W] vertical %x %y; break }
_bind _Y_Scrollbar_Text <ButtonRelease-1> { ::ms::text::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _Y_Scrollbar_Text <Enter> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }
_bind _Y_Scrollbar_Text <Leave> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the text object by one unit up or down
# (depending on the mousewheel direction).
_bind _Y_Scrollbar_Text <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the text object by one page up or down
# (depending on the mousewheel direction).
_bind _Y_Scrollbar_Text <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the text object by one unit up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Y_Scrollbar_Text <TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the text object by one page up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Y_Scrollbar_Text <Control-TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D pages; break }

# Create the mustang **text** package.
namespace eval ::ms::text {
    # Set the 'non-styleable' text option list.
    set ::ms::text(non_styleable,options) [list autoseparators \
                                                blockcursor \
                                                class \
                                                cmenu \
                                                endline \
                                                exportselection \
                                                insertofftime \
                                                insertontime \
                                                insertunfocussed \
                                                insertwidth \
                                                maxundo \
                                                scrollable \
                                                setgrid \
                                                spacing1 \
                                                spacing2 \
                                                spacing3 \
                                                startline \
                                                state \
                                                style \
                                                tabs \
                                                tabstyle \
                                                takefocus \
                                                undo \
                                                wrap \
                                                xscrollcommand \
                                                yscrollcommand];

    # Set the 'styleable' text option list.
    set ::ms::text(styleable,options) [list background \
                                            bordercolor \
                                            borderwidth \
                                            columns \
                                            cursor \
                                            font \
                                            foreground \
                                            inactiveselectbackground \
                                            insertbackground \
                                            insertborderwidth \
                                            padding \
                                            relief \
                                            rows \
                                            selectbackground \
                                            selectborderwidth \
                                            selectforeground \
                                            shellbackground];

    # Set the default 'non-styleable' text options values.
    set ::ms::default(text,autoseparators)   1
    set ::ms::default(text,blockcursor)      0
    set ::ms::default(text,class)            Text
    set ::ms::default(text,cmenu)            {}
    set ::ms::default(text,endline)          {}
    set ::ms::default(text,exportselection)  1
    set ::ms::default(text,insertofftime)    300
    set ::ms::default(text,insertontime)     600
    set ::ms::default(text,insertunfocussed) none
    set ::ms::default(text,insertwidth)      2
    set ::ms::default(text,maxundo)          0
    set ::ms::default(text,scrollable)       false
    set ::ms::default(text,setgrid)          0
    set ::ms::default(text,spacing1)         0
    set ::ms::default(text,spacing2)         0
    set ::ms::default(text,spacing3)         0
    set ::ms::default(text,startline)        {}
    set ::ms::default(text,state)            normal
    set ::ms::default(text,style)            Text
    set ::ms::default(text,tabs)             {}
    set ::ms::default(text,tabstyle)         wordprocessor
    set ::ms::default(text,takefocus)        0
    set ::ms::default(text,undo)             0
    set ::ms::default(text,wrap)             word
    set ::ms::default(text,xscrollcommand)   {}
    set ::ms::default(text,yscrollcommand)   {}

    # Note: The default 'styleable' text options values are always defined inside the current theme.
}

# Rename the original Tk **text** command.
rename text _text

# Create an alias for the mustang **text** command.
interp alias {} text {} ::ms::text::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **text** widget command.
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
proc ::ms::text::Command { window { args "" } } {
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
            set ::ms::default($w,autoseparators)   $::ms::default(text,autoseparators)
            set ::ms::default($w,blockcursor)      $::ms::default(text,blockcursor)
            set ::ms::default($w,class)            $::ms::default(text,class)
            set ::ms::default($w,cmenu)            $::ms::default(text,cmenu)
            set ::ms::default($w,endline)          $::ms::default(text,endline)
            set ::ms::default($w,exportselection)  $::ms::default(text,exportselection)
            set ::ms::default($w,insertofftime)    $::ms::default(text,insertofftime)
            set ::ms::default($w,insertontime)     $::ms::default(text,insertontime)
            set ::ms::default($w,insertunfocussed) $::ms::default(text,insertunfocussed)
            set ::ms::default($w,insertwidth)      $::ms::default(text,insertwidth)
            set ::ms::default($w,maxundo)          $::ms::default(text,maxundo)
            set ::ms::default($w,scrollable)       $::ms::default(text,scrollable)
            set ::ms::default($w,setgrid)          $::ms::default(text,setgrid)
            set ::ms::default($w,spacing1)         $::ms::default(text,spacing1)
            set ::ms::default($w,spacing2)         $::ms::default(text,spacing2)
            set ::ms::default($w,spacing3)         $::ms::default(text,spacing3)
            set ::ms::default($w,startline)        $::ms::default(text,startline)
            set ::ms::default($w,state)            $::ms::default(text,state)
            set ::ms::default($w,style)            $::ms::default(text,style)
            set ::ms::default($w,tabs)             $::ms::default(text,tabs)
            set ::ms::default($w,tabstyle)         $::ms::default(text,tabstyle)
            set ::ms::default($w,takefocus)        $::ms::default(text,takefocus)
            set ::ms::default($w,undo)             $::ms::default(text,undo)
            set ::ms::default($w,wrap)             $::ms::default(text,wrap)
            set ::ms::default($w,xscrollcommand)   $::ms::default(text,xscrollcommand)
            set ::ms::default($w,yscrollcommand)   $::ms::default(text,yscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,autoseparators)   $::ms::default(text,autoseparators)
            set ::ms::current($w,blockcursor)      $::ms::default(text,blockcursor)
            set ::ms::current($w,class)            $::ms::default(text,class)
            set ::ms::current($w,cmenu)            $::ms::default(text,cmenu)
            set ::ms::current($w,endline)          $::ms::default(text,endline)
            set ::ms::current($w,exportselection)  $::ms::default(text,exportselection)
            set ::ms::current($w,insertofftime)    $::ms::default(text,insertofftime)
            set ::ms::current($w,insertontime)     $::ms::default(text,insertontime)
            set ::ms::current($w,insertunfocussed) $::ms::default(text,insertunfocussed)
            set ::ms::current($w,insertwidth)      $::ms::default(text,insertwidth)
            set ::ms::current($w,maxundo)          $::ms::default(text,maxundo)
            set ::ms::current($w,scrollable)       $::ms::default(text,scrollable)
            set ::ms::current($w,setgrid)          $::ms::default(text,setgrid)
            set ::ms::current($w,spacing1)         $::ms::default(text,spacing1)
            set ::ms::current($w,spacing2)         $::ms::default(text,spacing2)
            set ::ms::current($w,spacing3)         $::ms::default(text,spacing3)
            set ::ms::current($w,startline)        $::ms::default(text,startline)
            set ::ms::current($w,state)            $::ms::default(text,state)
            set ::ms::current($w,style)            $::ms::default(text,style)
            set ::ms::current($w,tabs)             $::ms::default(text,tabs)
            set ::ms::current($w,tabstyle)         $::ms::default(text,tabstyle)
            set ::ms::current($w,takefocus)        $::ms::default(text,takefocus)
            set ::ms::current($w,undo)             $::ms::default(text,undo)
            set ::ms::current($w,wrap)             $::ms::default(text,wrap)
            set ::ms::current($w,xscrollcommand)   $::ms::default(text,xscrollcommand)
            set ::ms::current($w,yscrollcommand)   $::ms::default(text,yscrollcommand)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) text
            set ::ms::data($w,statespec) $::ms::data(statespec,normal)
            set ::ms::data($w,scrollx)   off
            set ::ms::data($w,scrolly)   off

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
            #       To make a text styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **text** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)               Tk
            set ::ms::managed_by($w,bordercolor)              Tk
            set ::ms::managed_by($w,borderwidth)              Tk
            set ::ms::managed_by($w,columns)                  Tk
            set ::ms::managed_by($w,cursor)                   Tk
            set ::ms::managed_by($w,font)                     Tk
            set ::ms::managed_by($w,foreground)               Tk
            set ::ms::managed_by($w,inactiveselectbackground) Tk
            set ::ms::managed_by($w,insertbackground)         Tk
            set ::ms::managed_by($w,insertborderwidth)        Tk
            set ::ms::managed_by($w,padding)                  Tk
            set ::ms::managed_by($w,relief)                   Tk
            set ::ms::managed_by($w,rows)                     Tk
            set ::ms::managed_by($w,selectbackground)         Tk
            set ::ms::managed_by($w,selectborderwidth)        Tk
            set ::ms::managed_by($w,selectforeground)         Tk
            set ::ms::managed_by($w,shellbackground)          Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -autoseparators {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,autoseparators) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,autoseparators) 1 }
                        }
                    }
                    -blockcursor {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,blockcursor) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,blockcursor) 1 }
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
                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
                            set ::ms::current($w,cmenu) $value
                        }
                    }
                    -columns {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value < 1 } {
                                    continue
                                }

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
                    -endline {
                        switch -- $value {
                            ""      { set ::ms::current($w,endline) {} }
                            default {
                                switch -- [string is integer -strict $value] {
                                    1   {
                                        if { $value >= 0 } {
                                            set ::ms::current($w,endline) $value
                                        }
                                    }
                                }
                            }
                        }
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
                    -inactiveselectbackground {
                        switch -- $value {
                            ""      {}
                            default {
                                set value [::ms::Check_Color $value invalid]
                                switch -- $value {
                                    invalid { continue }
                                }
                            }
                        }

                        set ::ms::current($w,inactiveselectbackground)    $value
                        set ::ms::managed_by($w,inactiveselectbackground) developer
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
                    -insertunfocussed {
                        set value [string tolower $value]
                        switch -- $value {
                            none   -
                            hollow -
                            solid  { set ::ms::current($w,insertunfocussed) $value }
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
                    -maxundo {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,maxundo) $value
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
                                set pad_left [::ms::Check_Measure [lindex $value 0] invalid]
                                switch -- $pad_left {
                                    invalid { continue }
                                }

                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                switch -- $pad_vertical {
                                    invalid { continue }
                                }

                                set pad_right [::ms::Check_Measure [lindex $value 2] invalid]
                                switch -- $pad_right {
                                    invalid { continue }
                                }

                                set ::ms::current($w,padding) [list $pad_left $pad_vertical $pad_right]
                            }
                            4   {
                                set pad_left [::ms::Check_Measure [lindex $value 0] invalid]
                                switch -- $pad_left {
                                    invalid { continue }
                                }

                                set pad_top [::ms::Check_Measure [lindex $value 1] invalid]
                                switch -- $pad_top {
                                    invalid { continue }
                                }

                                set pad_right [::ms::Check_Measure [lindex $value 2] invalid]
                                switch -- $pad_right {
                                    invalid { continue }
                                }

                                set pad_bottom [::ms::Check_Measure [lindex $value 3] invalid]
                                switch -- $pad_bottom {
                                    invalid { continue }
                                }

                                set ::ms::current($w,padding) [list $pad_left $pad_top $pad_right $pad_bottom]
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
                    -rows {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value < 1 } {
                                    continue
                                }

                                set ::ms::current($w,rows)    $value
                                set ::ms::managed_by($w,rows) developer
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
                    -spacing1 {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,spacing1) $value
                    }
                    -spacing2 {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,spacing2) $value
                    }
                    -spacing3 {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,spacing3) $value
                    }
                    -startline {
                        switch -- $value {
                            ""      { set ::ms::current($w,startline) {} }
                            default {
                                switch -- [string is integer -strict $value] {
                                    1   {
                                        if { $value >= 0 } {
                                            set ::ms::current($w,startline) $value
                                        }
                                    }
                                }
                            }
                        }
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
                    -tabs {
                        set invalid false
                        foreach tabstop $value {
                            switch -nocase -- $tabstop {
                                left    -
                                right   -
                                center  -
                                numeric {}
                                default {
                                    set value [::ms::Check_Measure $value invalid]
                                    switch -- $value {
                                        invalid {
                                            set invalid true
                                            break
                                        }
                                    }
                                }
                            }
                        }

                        switch -- $invalid {
                            false { set ::ms::current($w,tabs) $value }
                        }
                    }
                    -tabstyle {
                        set value [string tolower $value]
                        switch -- $value {
                            tabular       -
                            wordprocessor { set ::ms::current($w,tabstyle) $value }
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
                    -undo {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,undo) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,undo) 1 }
                        }
                    }
                    -wrap {
                        set value [string tolower $value]
                        switch -- $value {
                            none -
                            char -
                            word { set ::ms::current($w,wrap) $value }
                        }
                    }
                    -xscrollcommand {
                        switch -- [llength $value] {
                            2   { set ::ms::current($w,xscrollcommand) $value }
                        }
                    }
                    -yscrollcommand {
                        switch -- [llength $value] {
                            2   { set ::ms::current($w,yscrollcommand) $value }
                        }
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::text(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Text,$option)

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

            # Note: 'borderwidth', 'columns', 'cursor', 'font', 'inactiveselectbackground', 'insertborderwidth', 'padding',
            #       'relief', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

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

            # foreground
            switch -- $::ms::managed_by($w,foreground) {
                developer { set foreground $::ms::current($w,foreground) }
                Tk        { set foreground [_ttk_style lookup $::ms::current($w,style) -foreground $::ms::data($w,statespec) $::ms::default($w,foreground)] }
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

            # Set the text options.
            set text_options [list           -autoseparators $::ms::current($w,autoseparators) \
                                                -blockcursor $::ms::current($w,blockcursor) \
                                                 -background $background \
                                                     -cursor $cursor \
                                                    -endline $::ms::current($w,endline) \
                                            -exportselection $::ms::current($w,exportselection) \
                                                       -font $::ms::current($w,font) \
                                                 -foreground $foreground \
                                                     -height $::ms::current($w,rows) \
                                   -inactiveselectbackground $::ms::current($w,inactiveselectbackground) \
                                           -insertbackground $insertbackground \
                                          -insertborderwidth $::ms::current($w,insertborderwidth) \
                                              -insertofftime $::ms::current($w,insertofftime) \
                                               -insertontime $::ms::current($w,insertontime) \
                                           -insertunfocussed $::ms::current($w,insertunfocussed) \
                                                -insertwidth $::ms::current($w,insertwidth) \
                                                    -maxundo $::ms::current($w,maxundo) \
                                                       -padx [lindex $::ms::data($w,padding) 0] \
                                                       -pady [lindex $::ms::data($w,padding) 1] \
                                           -selectbackground $selectbackground \
                                          -selectborderwidth $::ms::current($w,selectborderwidth) \
                                           -selectforeground $selectforeground \
                                                    -setgrid $::ms::current($w,setgrid) \
                                                   -spacing1 $::ms::current($w,spacing1) \
                                                   -spacing2 $::ms::current($w,spacing2) \
                                                   -spacing3 $::ms::current($w,spacing3) \
                                                  -startline $::ms::current($w,startline) \
                                                      -state $::ms::current($w,state) \
                                                       -tabs $::ms::current($w,tabs) \
                                                   -tabstyle $::ms::current($w,tabstyle) \
                                                  -takefocus $takefocus \
                                                       -undo $::ms::current($w,undo) \
                                                      -width $::ms::current($w,columns) \
                                                       -wrap $::ms::current($w,wrap)];

            # Note: The '-bordercolor' option is not understanded by Tk texts, but is made available trough
            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
            #       like it behaves in other widgets that understands the bordercolor.

            # Check the 'relief' type.
            switch -- $::ms::current($w,relief) {
                flat  -
                solid {
                    lappend text_options         -borderwidth 0 \
                                         -highlightbackground $bordercolor \
                                              -highlightcolor $bordercolor \
                                          -highlightthickness $::ms::current($w,borderwidth) \
                                                      -relief flat;
                }
                default {
                    lappend text_options         -borderwidth $::ms::current($w,borderwidth) \
                                         -highlightbackground $background \
                                              -highlightcolor $background \
                                          -highlightthickness 0 \
                                                      -relief $::ms::current($w,relief);
                }
            }

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false {
                    #########################
                    ##                     ##
                    ##     SIMPLE TEXT     ##
                    ##                     ##
                    #########################

                    ##################
                    ##              ##
                    ##     TEXT     ##
                    ##              ##
                    ##################

                    # Note: Tk texts don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # Add the provided 'xscrollcommand' and 'yscrollcommand' data.
                    lappend text_options -xscrollcommand $::ms::current($w,xscrollcommand) \
                                         -yscrollcommand $::ms::current($w,yscrollcommand);

                    # Create the widget.
                    try {
                        _text $w {*}$text_options
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

                    # Note: If a different class than 'Text' is provided, we need to adapt the bindtags.

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        Text    { _bindtags $w [list $w _Simple_Text Text $::ms::addr($w,toplevel) all] }
                        default { _bindtags $w [list $w $::ms::current($w,class) _Simple_Text Text $::ms::addr($w,toplevel) all] }
                    }

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses relative to its real address, 'w'.
                    set ::ms::addr($w,short) $short_addr

                    # Add the widget real and short address into the list of all available real
                    # and short addresses.
                    lappend ::ms::addr(reals)  $w
                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w]
                }
                true {
                    #############################
                    ##                         ##
                    ##     SCROLLABLE TEXT     ##
                    ##                         ##
                    #############################

                    ##################
                    ##              ##
                    ##     HULL     ##
                    ##              ##
                    ##################

                    # Set the hull object style name
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

                    ##################
                    ##              ##
                    ##     TEXT     ##
                    ##              ##
                    ##################

                    # Note: Tk Texts don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # Set the current 'xscrollcommand' and 'yscrollcommand' to the empty string.
                    set ::ms::current($w,xscrollcommand) {}
                    set ::ms::current($w,yscrollcommand) {}

                    # Add the internal 'xscrollcommand' and 'yscrollcommand' data.
                    lappend text_options -xscrollcommand [list $w.x set] \
                                         -yscrollcommand [list $w.y set];

                    # Create the widget.
                    _text $w.text {*}$text_options

                    # Grid the text object.
                    _grid $w.text -column 0 \
                                    -padx 0 \
                                    -pady 0 \
                                     -row 0 \
                                  -sticky nesw;

                    ########################
                    ##                    ##
                    ##     SCROLLBARS     ##
                    ##                    ##
                    ########################

                    # Create the horizontal scrollbar address.
                    _ttk_scrollbar $w.x     -class TScrollbar \
                                          -command [list $w.text xview] \
                                           -cursor arrow \
                                           -orient horizontal \
                                            -style TScrollbar \
                                        -takefocus 0;

                    # Create the vertical scrollbar address.
                    _ttk_scrollbar $w.y     -class TScrollbar \
                                          -command [list $w.text yview] \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Note: If a different class than 'Text' is provided, we need to adapt the bindtags.

                    # Set the new bindtags for the hull object.
                    _bindtags $w [list $w _Hull_Text TFrame $::ms::addr($w,toplevel) all]

                    # Set the new bindtags for the text object.
                    switch -- $::ms::current($w,class) {
                        Text    { _bindtags $w.text [list $w.text _Scrollable_Text Text $::ms::addr($w,toplevel) all] }
                        default { _bindtags $w.text [list $w.text $::ms::current($w,class) _Scrollable_Text Text $::ms::addr($w,toplevel) all] }
                    }

                    # Set the new bindtags for the horizontal and vertical scrollbar objects.
                    _bindtags $w.x [list $w.x _X_Scrollbar_Text TScrollbar $::ms::addr($w,toplevel) all]
                    _bindtags $w.y [list $w.y _Y_Scrollbar_Text TScrollbar $::ms::addr($w,toplevel) all]

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
                    set ::ms::addr($w,short)      $short_addr
                    set ::ms::addr($w.text,short) $short_addr
                    set ::ms::addr($w.x,short)    $short_addr
                    set ::ms::addr($w.y,short)    $short_addr

                    # Add the widget real and short address into the list of all available real
                    # and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.text \
                                              $w.x \
                                              $w.y;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.text

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.text

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.text];

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
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::text::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::text::Pathname_Cmd $w]
            }

            # Add the widget address to the text widgets real address list.
            lappend ::ms::addr(text) $w

            # Add the widget address to the text classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),text,addrs) $w

            # Add the widget address to the text classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),text,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the text classtype.
            if { $::ms::current($w,style) ni $::ms::style(text,classtype) } {
                lappend ::ms::style(text,classtype) $::ms::current($w,style)
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
proc ::ms::text::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        bbox        -
        compare     -
        count       -
        debug       -
        delete      -
        dlineinfo   -
        dump        -
        edit        -
        get         -
        image       -
        index       -
        mark        -
        peer        -
        pendingsync -
        scan        -
        search      -
        see         -
        sync        {
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.text] }
            }

            # Execute the command.
            try {
                {*}$address $cmd {*}$args
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
                    set option [string tolower [string range $args 1 end]]
                    if { ($option in $::ms::text(non_styleable,options)) || ($option in $::ms::text(styleable,options)) } {
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
                    foreach option $::ms::text(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::text(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::text(non_styleable,options)) || ($option in $::ms::text(styleable,options)) } {
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

                            # Check the remaining widget's options, if any.
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -autoseparators {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,autoseparators) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,autoseparators) 1 }
                                        }
                                    }
                                    -blockcursor {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,blockcursor) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,blockcursor) 1 }
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
                                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
                                            set ::ms::current($w,cmenu) $value
                                        }
                                    }
                                    -columns {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value < 1 } {
                                                    continue
                                                }

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
                                    -endline {
                                        switch -- $value {
                                            ""      { set ::ms::current($w,endline) {} }
                                            default {
                                                switch -- [string is integer -strict $value] {
                                                    1   {
                                                        if { $value >= 0 } {
                                                            set ::ms::current($w,endline) $value
                                                        }
                                                    }
                                                }
                                            }
                                        }
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
                                    -inactiveselectbackground {
                                        switch -- $value {
                                            ""      {}
                                            default {
                                                set value [::ms::Check_Color $value invalid]
                                                switch -- $value {
                                                    invalid { continue }
                                                }
                                            }
                                        }

                                        set ::ms::current($w,inactiveselectbackground)    $value
                                        set ::ms::managed_by($w,inactiveselectbackground) developer
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
                                    -insertunfocussed {
                                        switch -nocase -- $value {
                                            none   { set ::ms::current($w,insertunfocussed) none }
                                            hollow { set ::ms::current($w,insertunfocussed) hollow }
                                            solid  { set ::ms::current($w,insertunfocussed) solid }
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
                                    -maxundo {
                                        switch -- [string is integer -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,maxundo) $value
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
                                                set pad_left [::ms::Check_Measure [lindex $value 0] invalid]
                                                switch -- $pad_left {
                                                    invalid { continue }
                                                }

                                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                                switch -- $pad_vertical {
                                                    invalid { continue }
                                                }

                                                set pad_right [::ms::Check_Measure [lindex $value 2] invalid]
                                                switch -- $pad_right {
                                                    invalid { continue }
                                                }

                                                set ::ms::current($w,padding) [list $pad_left $pad_vertical $pad_right]
                                            }
                                            4   {
                                                set pad_left [::ms::Check_Measure [lindex $value 0] invalid]
                                                switch -- $pad_left {
                                                    invalid { continue }
                                                }

                                                set pad_top [::ms::Check_Measure [lindex $value 1] invalid]
                                                switch -- $pad_top {
                                                    invalid { continue }
                                                }

                                                set pad_right [::ms::Check_Measure [lindex $value 2] invalid]
                                                switch -- $pad_right {
                                                    invalid { continue }
                                                }

                                                set pad_bottom [::ms::Check_Measure [lindex $value 3] invalid]
                                                switch -- $pad_bottom {
                                                    invalid { continue }
                                                }

                                                set ::ms::current($w,padding) [list $pad_left $pad_top $pad_right $pad_bottom]
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
                                    -rows {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value < 1 } {
                                                    continue
                                                }

                                                set ::ms::current($w,rows)    $value
                                                set ::ms::managed_by($w,rows) developer
                                            }
                                        }
                                    }
                                    -scrollable {}
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
                                    -spacing1 {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,spacing1) $value
                                    }
                                    -spacing2 {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,spacing2) $value
                                    }
                                    -spacing3 {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,spacing3) $value
                                    }
                                    -startline {
                                        switch -- $value {
                                            ""      { set ::ms::current($w,startline) {} }
                                            default {
                                                switch -- [string is integer -strict $value] {
                                                    1   {
                                                        if { $value >= 0 } {
                                                            set ::ms::current($w,startline) $value
                                                        }
                                                    }
                                                }
                                            }
                                        }
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
                                            # Remove the widget address from the text classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),text,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),text,addrs) [lremove $::ms::style($::ms::current($w,style),text,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,text,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the text classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),text,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(text,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(text,classtype) [lremove $::ms::style(text,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the text classtype.
                                            if { $value ni $::ms::style(text,classtype) } {
                                                lappend ::ms::style(text,classtype) $value
                                            }

                                            # Update the current style associated with the widget with 'value'.
                                            set ::ms::current($w,style) $value
                                        }
                                    }
                                    -tabs {
                                        set invalid false
                                        foreach tabstop $value {
                                            switch -nocase -- $tabstop {
                                                left    -
                                                right   -
                                                center  -
                                                numeric {}
                                                default {
                                                    set value [::ms::Check_Measure $value invalid]
                                                    switch -- $value {
                                                        invalid {
                                                            set invalid true
                                                            break
                                                        }
                                                    }
                                                }
                                            }
                                        }

                                        switch -- $invalid {
                                            false { set ::ms::current($w,tabs) $value }
                                        }
                                    }
                                    -tabstyle {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            tabular       -
                                            wordprocessor { set ::ms::current($w,tabstyle) $value }
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
                                    -undo {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,undo) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,undo) 1 }
                                        }
                                    }
                                    -wrap {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            none -
                                            char -
                                            word { set ::ms::current($w,wrap) $value }
                                        }
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
                                    -yscrollcommand {
                                        switch -- $::ms::current($w,scrollable) {
                                            true { continue }
                                        }

                                        switch -- [llength $value] {
                                            0   { set ::ms::current($w,yscrollcommand) [list ] }
                                            2   { set ::ms::current($w,yscrollcommand) $value  }
                                        }
                                    }
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Text,$option)

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

                            # Note: 'borderwidth', 'columns', 'cursor', 'font', 'inactiveselectbackground', 'insertborderwidth', 'padding',
                            #       'relief', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

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

                            # foreground
                            switch -- $::ms::managed_by($w,foreground) {
                                developer { set foreground $::ms::current($w,foreground) }
                                Tk        { set foreground [_ttk_style lookup $::ms::current($w,style) -foreground $::ms::data($w,statespec) $::ms::default($w,foreground)] }
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

                            # Set the text options.
                            set text_options [list           -autoseparators $::ms::current($w,autoseparators) \
                                                                -blockcursor $::ms::current($w,blockcursor) \
                                                                 -background $background \
                                                                     -cursor $cursor \
                                                                    -endline $::ms::current($w,endline) \
                                                            -exportselection $::ms::current($w,exportselection) \
                                                                       -font $::ms::current($w,font) \
                                                                 -foreground $foreground \
                                                                     -height $::ms::current($w,rows) \
                                                   -inactiveselectbackground $::ms::current($w,inactiveselectbackground) \
                                                           -insertbackground $insertbackground \
                                                          -insertborderwidth $::ms::current($w,insertborderwidth) \
                                                              -insertofftime $::ms::current($w,insertofftime) \
                                                               -insertontime $::ms::current($w,insertontime) \
                                                           -insertunfocussed $::ms::current($w,insertunfocussed) \
                                                                -insertwidth $::ms::current($w,insertwidth) \
                                                                    -maxundo $::ms::current($w,maxundo) \
                                                                       -padx [lindex $::ms::data($w,padding) 0] \
                                                                       -pady [lindex $::ms::data($w,padding) 1] \
                                                           -selectbackground $selectbackground \
                                                          -selectborderwidth $::ms::current($w,selectborderwidth) \
                                                           -selectforeground $selectforeground \
                                                                    -setgrid $::ms::current($w,setgrid) \
                                                                   -spacing1 $::ms::current($w,spacing1) \
                                                                   -spacing2 $::ms::current($w,spacing2) \
                                                                   -spacing3 $::ms::current($w,spacing3) \
                                                                  -startline $::ms::current($w,startline) \
                                                                      -state $::ms::current($w,state) \
                                                                       -tabs $::ms::current($w,tabs) \
                                                                   -tabstyle $::ms::current($w,tabstyle) \
                                                                  -takefocus $takefocus \
                                                                       -undo $::ms::current($w,undo) \
                                                                      -width $::ms::current($w,columns) \
                                                                       -wrap $::ms::current($w,wrap)];

                            # Note: The '-bordercolor' option is not understanded by Tk texts, but is made available trough
                            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                            #       like it behaves in other widgets that understands the bordercolor.

                            # Check the 'relief' type.
                            switch -- $::ms::current($w,relief) {
                                flat  -
                                solid {
                                    lappend text_options         -borderwidth 0 \
                                                         -highlightbackground $bordercolor \
                                                              -highlightcolor $bordercolor \
                                                          -highlightthickness $::ms::current($w,borderwidth) \
                                                                      -relief flat;
                                }
                                default {
                                    lappend text_options         -borderwidth $::ms::current($w,borderwidth) \
                                                         -highlightbackground $background \
                                                              -highlightcolor $background \
                                                          -highlightthickness 0 \
                                                                      -relief $::ms::current($w,relief);
                                }
                            }

                            # Check if the widget is scrollable or not.
                            switch -- $::ms::current($w,scrollable) {
                                false {
                                    #########################
                                    ##                     ##
                                    ##     SIMPLE TEXT     ##
                                    ##                     ##
                                    #########################

                                    ##################
                                    ##              ##
                                    ##     TEXT     ##
                                    ##              ##
                                    ##################

                                    # Note: Tk texts don't understands styles, at least not natively.
                                    #       No internal styles needs to be created.

                                    # Add the provided 'xscrollcommand' and 'yscrollcommand' data.
                                    lappend text_options -xscrollcommand $::ms::current($w,xscrollcommand) \
                                                         -yscrollcommand $::ms::current($w,yscrollcommand);

                                    # Configure the widget.
                                    try {
                                        interp invokehidden {} $w configure {*}$text_options
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    }
                                }
                                true {
                                    #############################
                                    ##                         ##
                                    ##     SCROLLABLE TEXT     ##
                                    ##                         ##
                                    #############################

                                    ##################
                                    ##              ##
                                    ##     HULL     ##
                                    ##              ##
                                    ##################

                                    # Set the hull object style name
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

                                    ##################
                                    ##              ##
                                    ##     TEXT     ##
                                    ##              ##
                                    ##################

                                    # Note: Tk Texts don't understands styles, at least not natively.
                                    #       No internal styles needs to be created.

                                    # Apply the changes.
                                    $w.text configure {*}$text_options

                                    ########################
                                    ##                    ##
                                    ##     SCROLLBARS     ##
                                    ##                    ##
                                    ########################

                                    # Update the scrollbars.
                                    ::ms::text::Scrollbar_Update $w
                                }
                            }

                            # Note: If width and/or height were provided by the developer, and these values were accepted by Tk,
                            #       then a configure event will be invoked by Tk ('::ms::text::Configure').
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

                    # Return the name of the object, or an empty string if there are no text objects at the coordinates provided.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            if { $widget eq $w } {
                                return "Text.textarea"
                            } else {
                                return ""
                            }
                        }
                        true {
                            if { $widget eq $w } {
                                return "Text.hull"
                            } elseif { $widget eq "$w.text" } {
                                return "Text.textarea"
                            } elseif { $widget eq "$w.x" } {
                                return "Text.hscrollbar"
                            } elseif { $widget eq "$w.y" } {
                                return "Text.vscrollbar"
                            } else {
                                return ""
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        insert  -
        replace {
            # Synopsis:
            #
            # *window* **insert** *index* *chars* ?*tagList* *chars* *tagList* ...?
            # *window* **replace** *index1* *index2* *chars* ?*tagList* *chars* *tagList* ...?
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.text] }
            }

            # Execute the command.
            try {
                {*}$address $cmd {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                switch -- $::ms::current($w,scrollable) {
                    true {
                        # Update the scrollbars.
                        ::ms::text::Scrollbar_Update $w
                    }
                }

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

                    # Note: 'borderwidth', 'columns', 'cursor', 'font', 'inactiveselectbackground', 'insertborderwidth', 'padding',
                    #       'relief', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

                    #####################################
                    ##                                 ##
                    ##     UPDATE THE WIDGET STATE     ##
                    ##                                 ##
                    #####################################

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

                    # foreground
                    switch -- $::ms::managed_by($w,foreground) {
                        developer { set foreground $::ms::current($w,foreground) }
                        Tk        { set foreground [_ttk_style lookup $::ms::current($w,style) -foreground $::ms::data($w,statespec) $::ms::default($w,foreground)] }
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

                    # Set the text options.
                    set text_options [list       -background $background \
                                                 -foreground $foreground \
                                           -insertbackground $insertbackground \
                                           -selectbackground $selectbackground \
                                           -selectforeground $selectforeground];

                    # Note: The '-bordercolor' option is not understanded by Tk texts, but is made available trough
                    #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                    #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                    #       like it behaves in other widgets that understands the bordercolor.

                    # Check the 'relief' type.
                    switch -- $::ms::current($w,relief) {
                        flat  -
                        solid {
                            lappend text_options -highlightbackground $bordercolor \
                                                      -highlightcolor $bordercolor;
                        }
                        default {
                            lappend text_options -highlightbackground $background \
                                                      -highlightcolor $background;
                        }
                    }

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            #########################
                            ##                     ##
                            ##     SIMPLE TEXT     ##
                            ##                     ##
                            #########################

                            # Apply the changes.
                            interp invokehidden {} $w configure {*}$text_options
                        }
                        true {
                            #############################
                            ##                         ##
                            ##     SCROLLABLE TEXT     ##
                            ##                         ##
                            #############################

                            # Apply the changes.
                            interp invokehidden {} $w state $::ms::data($w,statespec)
                            $w.text configure {*}$text_options
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
        tag {
            # Synopsis:
            #
            # *window* **tag** **add** *tagname* *index1* ?*index2* *index1* *index2* ...?
            # *window* **tag** **bind** *tagname* ?*sequence*? ?*script*?
            # *window* **tag** **cget** *tagname* *option*
            # *window* **tag** **configure** *tagname* ?*option*? ?*value*? ?*option value* ... *option value*?
            # *window* **tag** **delete** *tagname* ?*tagname* ...?
            # *window* **tag** **lower** *tagname* ?*belowThis*?
            # *window* **tag** **names** ?*index*?
            # *window* **tag** **nextrange** *tagname* *index1* ?*index2*?
            # *window* **tag** **prevrange** *tagname* *index1* ?*index2*?
            # *window* **tag** **raise** *tagname* ?*aboveThis*?
            # *window* **tag** **ranges** *tagname*
            # *window* **tag** **remove** *tagname* *index1* ?*index2* *index1* *index2* ...?
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { set address [list interp invokehidden {} $w] }
                        true  { set address [list $w.text] }
                    }

                    # Check the 'subcommand'.
                    switch -- $subcommand {
                        configure {
                            set tagname [lindex  $args 0]
                            set args    [lremove $args 0]

                            switch -- [llength $args] {
                                0   -
                                1   {
                                    # Execute the command.
                                    try {
                                        {*}$address tag configure $tagname {*}$args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return $result
                                    }
                                }
                                default {
                                    # Check that the command's 'args' forms a valid 'option/value' list.
                                    switch -- [expr { [llength $args]%2 }] {
                                        0   {
                                            # Check the remaining widget's options, if any.
                                            set new_args [list ]
                                            foreach { option value } $args {
                                                switch -nocase -- $option {
                                                    -background       -
                                                    -foreground       -
                                                    -lmargincolor     -
                                                    -overstrikefg     -
                                                    -rmargincolor     -
                                                    -selectbackground -
                                                    -selectforeground -
                                                    -underlinefg      {
                                                        set value [::ms::Check_Color $value invalid]
                                                        switch -- $value {
                                                            invalid { continue }
                                                            default { lappend new_args $option $value }
                                                        }
                                                    }
                                                    -bgstipple   -
                                                    -borderwidth -
                                                    -elide       -
                                                    -fgstipple   -
                                                    -font        -
                                                    -justify     -
                                                    -lmargin1    -
                                                    -lmargin2    -
                                                    -offset      -
                                                    -overstrike  -
                                                    -relief      -
                                                    -rmargin     -
                                                    -spacing1    -
                                                    -spacing2    -
                                                    -spacing3    -
                                                    -tabs        -
                                                    -tabstyle    -
                                                    -underline   -
                                                    -wrap        { lappend new_args $option $value }
                                                    default      { ::ms::Error "Invalid tag option, '$option'." $caller_info }
                                                }
                                            }
                                        }
                                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                                    }

                                    # Execute the command.
                                    try {
                                        {*}$address tag configure $tagname {*}$new_args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return ""
                                    }
                                }
                            }
                        }
                        default {
                            # Execute the command.
                            try {
                                {*}$address tag $subcommand {*}$args
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
        window {
            # Synopsis:
            #
            # *window* **window** **cget** *index* *option*
            # *window* **window** **configure** *index* ?*option value* ... *option value*?
            # *window* **window** **create** *index* ?*option value* ... *option value*?
            # *window* **window** **names**
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { set address [list interp invokehidden {} $w] }
                        true  { set address [list $w.text] }
                    }

                    # Check the 'subcommand'.
                    switch -- $subcommand {
                        create    -
                        configure {
                            set index [lindex  $args 0]
                            set args  [lremove $args 0]

                            switch -- [llength $args] {
                                0   -
                                1   {
                                    # Execute the command.
                                    try {
                                        {*}$address window $subcommand $index {*}$args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return $result
                                    }
                                }
                                default {
                                    # Check that the command's 'args' forms a valid 'option/value' list.
                                    switch -- [expr { [llength $args]%2 }] {
                                        0   {
                                            # Check the remaining widget's options, if any.
                                            set new_args [list ]
                                            foreach { option value } $args {
                                                switch -nocase -- $option {
                                                    -window {
                                                        # Get the 'window' real address.
                                                        set result [::ms::Check_Pathname $window invalid]
                                                        switch -- $result {
                                                            invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                                            default { lappend new_args -window [lindex $result 0] }
                                                        }
                                                    }
                                                    -align   -
                                                    -create  -
                                                    -padx    -
                                                    -pady    -
                                                    -stretch { lappend new_args $option $value }
                                                    default  { ::ms::Error "Invalid window option, '$option'." $caller_info }
                                                }
                                            }
                                        }
                                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                                    }

                                    # Execute the command.
                                    try {
                                        {*}$address window $subcommand $index {*}$new_args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return ""
                                    }
                                }
                            }
                        }
                        default {
                            # Execute the command.
                            try {
                                {*}$address window $subcommand {*}$args
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
        xview {
            # Synopsis:
            #
            # *window* **xview**
            # *window* **xview** **moveto** *fraction*
            # *window* **xview** **scroll** *number* *what*
            set subcommand [lindex  $args 0]
            set args       [lremove $args 0]

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
                        pixels  { set what "pixels" }
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
            set subcommand [lindex  $args 0]
            set args       [lremove $args 0]

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
                        pixels  { set what "pixels" }
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
# Update any text widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::text::Style_Update { stylename caller_info } {
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

    # Update all the text widgets that have stylename as a style.
    foreach w $::ms::style($stylename,text,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::text(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Text,$option)

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

        # Set the internal '-padding' option to always show the horizontal and vertical padding.
        switch -- [llength $::ms::current($w,padding)] {
            1       { set ::ms::data($w,padding) [list $::ms::current($w,padding) $::ms::current($w,padding)] }
            default { set ::ms::data($w,padding) $::ms::current($w,padding) }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'borderwidth', 'columns', 'cursor', 'font', 'inactiveselectbackground', 'insertborderwidth', 'padding',
        #       'relief', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

        # background
        switch -- $::ms::managed_by($w,background) {
            developer { set background $::ms::current($w,background) }
            Tk        { set background [_ttk_style lookup $stylename -background $::ms::data($w,statespec) $::ms::default($w,background)] }
        }

        # foreground
        switch -- $::ms::managed_by($w,foreground) {
            developer { set foreground $::ms::current($w,foreground) }
            Tk        { set foreground [_ttk_style lookup $stylename -foreground $::ms::data($w,statespec) $::ms::default($w,foreground)] }
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

        # Set the text options.
        set text_options [list      -background $background \
                                          -cursor $cursor \
                                            -font $::ms::current($w,font) \
                                      -foreground $foreground \
                                          -height $::ms::current($w,rows) \
                                -insertbackground $insertbackground \
                               -insertborderwidth $::ms::current($w,insertborderwidth) \
                                            -padx [lindex $::ms::data($w,padding) 0] \
                                            -pady [lindex $::ms::data($w,padding) 1] \
                                -selectbackground $selectbackground \
                               -selectborderwidth $::ms::current($w,selectborderwidth) \
                                -selectforeground $selectforeground \
                                           -width $::ms::current($w,columns)];

        # Note: The '-bordercolor' option is not understanded by Tk texts, but is made available trough
        #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
        #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
        #       like it behaves in other widgets that understands the bordercolor.

        # Check the 'relief' type.
        switch -- $::ms::current($w,relief) {
            flat  -
            solid {
                lappend text_options         -borderwidth 0 \
                                       -highlightbackground $bordercolor \
                                            -highlightcolor $bordercolor \
                                        -highlightthickness $::ms::current($w,borderwidth) \
                                                    -relief flat;
            }
            default {
                lappend text_options         -borderwidth $::ms::current($w,borderwidth) \
                                       -highlightbackground $background \
                                            -highlightcolor $background \
                                        -highlightthickness 0 \
                                                    -relief $::ms::current($w,relief);
            }
        }

        # Check if the widget is scrollable or not.
        switch -- $::ms::current($w,scrollable) {
            false {
                #########################
                ##                     ##
                ##     SIMPLE TEXT     ##
                ##                     ##
                #########################

                ##################
                ##              ##
                ##     TEXT     ##
                ##              ##
                ##################

                # Note: Tk texts don't understands styles, at least not natively.
                #       No internal styles needs to be created.

                # Apply the changes.
                interp invokehidden {} $w configure {*}$text_options
            }
            true {
                ##############################
                ##                          ##
                ##     SSCROLLABLE TEXT     ##
                ##                          ##
                ##############################

                ##################
                ##              ##
                ##     HULL     ##
                ##              ##
                ##################

                # Set the hull object style name
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

                ##################
                ##              ##
                ##     TEXT     ##
                ##              ##
                ##################

                # Note: Tk texts don't understands styles, at least not natively.
                #       No internal styles needs to be created.

                # Apply the changes.
                $w.text configure {*}$text_options

                ########################
                ##                    ##
                ##     SCROLLBARS     ##
                ##                    ##
                ########################

                # Update the scrollbars.
                ::ms::text::Scrollbar_Update $w
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

## ButtonPress
#
# Manage the **ButtonPress** event.
# It clear any pre-existent selections, moves the insertion cursor, sets the selection anchor,
# and claims the input focus.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the mouse pointer (x,y) relative coordinates at the time of the event.
#        These value are provided directly by the **ButtonPress** event.
#
# It doesn't return anything.
proc ::ms::text::ButtonPress { w x y } {
    # Note: This procedure is a modified version of the '::tk::TextButton1' of the Tk text widget.
    #       All credits goes to the original author/s.

    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled {
            # Check the parent of the widget address provided, if any.
            set parent [_winfo parent $w]
            switch -- $parent {
                ""      {}
                default {
                    # Propagate the action to the widget's parents.

                    # ATTENTION!
                    #
                    # This is a recursive loop. The only way to exit is:
                    #   - If there is no more parent to check for.
                    #   - If 'parent' is a scrollable megawidget.
                    set i 1
                    while { $i > 0 } {
                        # Check if 'parent' belongs to a scrollable megawidget.
                        if { $parent in $::ms::addr(megawidgets,scrollable) } {
                            _focus -force $parent
                            return ""
                        }

                        # Check the next parent, if any.
                        set parent [_winfo parent $parent]
                        switch -- $parent {
                            ""  {
                                # There are no more parents to check for.
                                # Stop the recursive iteration.
                                break
                            }
                        }
                    }
                }
            }

            # Check if the widget's toplevel was created by mustang.
            switch -- [info exists ::ms::data($::ms::addr($w,toplevel),classtype)] {
                0   {
                    # If possible, focus the widget's toplevel.
                    try {
                        _focus -force [_winfo toplevel $w]
                    } on error {} {
                        # Do nothing
                    }
                }
                1   {
                    # Check the widget's toplevel takefocus.
                    switch -- $::ms::current($::ms::addr($w,toplevel),takefocus) {
                        0   {
                            # Momentarily set the toplevel takefocus to '1'.
                            # We will re-establish its original takefocus value later, during its 'FocusOut' event.
                            interp invokehidden {} $::ms::addr($w,toplevel) configure -takefocus 1
                        }
                    }

                    # Focus the widget's toplevel.
                    _focus -force $::ms::addr($w,toplevel)
                }
            }
        }
        default {
            set ::tk::Priv(pressX)     $x
            set ::tk::Priv(mouseMoved) 0
            set ::tk::Priv(selectMode) char

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollbar) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.text] }
            }

            {*}$address tag remove sel 1.0 end

            # An operation that clears the selection must insert an autoseparator,
            # because the selection operation may have moved the insert mark.

            # If autoseparators are active, put an autoseparator.
            switch -- $::ms::current($w,autoseparators) {
                1   { {*}$address edit separator }
            }

            set anchor_name [::tk::TextAnchor $::ms::addr($w,widget)]

            {*}$address mark set insert [::ms::text::Closest_Gap {*}$address $x $y]
            {*}$address mark set $anchor_name insert

            # Set the anchor mark's gravity depending on the click position
            # relative to the gap
            set bbox [{*}$address bbox [{*}$address index $anchor_name]]

            if { $x > [lindex $bbox 0] } {
                {*}$address mark gravity $anchor_name right
            } else {
                {*}$address mark gravity $anchor_name left
            }

            # Focus the text object if its not already focussed.
            interp invokehidden {} $w instate [list !focus] {
                _focus -force $::ms::addr($w,widget)
            }

            # If autoseparators are active, put an autoseparator.
            switch -- $::ms::current($w,autoseparators) {
                1   { {*}$address edit separator }
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
proc ::ms::text::Configure { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
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
proc ::ms::text::Destroy { w } {
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

    # Remove the widget address from the text widgets real address list.
    set index [lsearch -exact $::ms::addr(text) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(text) [lremove $::ms::addr(text) $index] }
    }

    # Remove the widget address from the text classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),text,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),text,addrs) [lremove $::ms::class($::ms::current($w,class),text,addrs) $index] }
    }

    # Remove the widget address from the text classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),text,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),text,addrs) [lremove $::ms::style($::ms::current($w,style),text,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the text classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),text,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(text,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(text,classtype) [lremove $::ms::style(text,classtype) $index] }
            }
        }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false {
            #########################
            ##                     ##
            ##     SIMPLE TEXT     ##
            ##                     ##
            #########################

            # Remove the widget address from the list of all available real addresses.
            set index [lsearch -exact $::ms::addr(reals) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
            }
        }
        true {
            #############################
            ##                         ##
            ##     SCROLLABLE TEXT     ##
            ##                         ##
            #############################

            # Remove every widget's objects addresses from the list of all available real addresses.
            foreach object [list $w \
                                 $w.text \
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

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short) \
                         ::ms::addr($w.text,short) \
                         ::ms::addr($w.x,short) \
                         ::ms::addr($w.y,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,autoseparators) \
                         ::ms::current($w,blockcursor) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,columns) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,endline) \
                         ::ms::current($w,exportselection) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,inactiveselectbackground) \
                         ::ms::current($w,insertbackground) \
                         ::ms::current($w,insertborderwidth) \
                         ::ms::current($w,insertofftime) \
                         ::ms::current($w,insertontime) \
                         ::ms::current($w,insertunfocussed) \
                         ::ms::current($w,insertwidth) \
                         ::ms::current($w,maxundo) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,rows) \
                         ::ms::current($w,scrollable) \
                         ::ms::current($w,selectbackground) \
                         ::ms::current($w,selectborderwidth) \
                         ::ms::current($w,selectforeground) \
                         ::ms::current($w,setgrid) \
                         ::ms::current($w,shellbackground) \
                         ::ms::current($w,spacing1) \
                         ::ms::current($w,spacing2) \
                         ::ms::current($w,spacing3) \
                         ::ms::current($w,startline) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,tabs) \
                         ::ms::current($w,tabstyle) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,undo) \
                         ::ms::current($w,wrap) \
                         ::ms::current($w,xscrollcommand) \
                         ::ms::current($w,yscrollcommand);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,padding) \
                         ::ms::data($w,scrollx) \
                         ::ms::data($w,scrolly) \
                         ::ms::data($w,statespec) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,autoseparators) \
                         ::ms::default($w,blockcursor) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,columns) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,endline) \
                         ::ms::default($w,exportselection) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,inactiveselectbackground) \
                         ::ms::default($w,insertbackground) \
                         ::ms::default($w,insertborderwidth) \
                         ::ms::default($w,insertofftime) \
                         ::ms::default($w,insertontime) \
                         ::ms::default($w,insertunfocussed) \
                         ::ms::default($w,insertwidth) \
                         ::ms::default($w,maxundo) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,rows) \
                         ::ms::default($w,scrollable) \
                         ::ms::default($w,selectbackground) \
                         ::ms::default($w,selectborderwidth) \
                         ::ms::default($w,selectforeground) \
                         ::ms::default($w,setgrid) \
                         ::ms::default($w,shellbackground) \
                         ::ms::default($w,spacing1) \
                         ::ms::default($w,spacing2) \
                         ::ms::default($w,spacing3) \
                         ::ms::default($w,startline) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,tabs) \
                         ::ms::default($w,tabstyle) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,undo) \
                         ::ms::default($w,wrap) \
                         ::ms::default($w,xscrollcommand) \
                         ::ms::default($w,yscrollcommand);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,columns) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,inactiveselectbackground) \
                         ::ms::managed_by($w,insertbackground) \
                         ::ms::managed_by($w,insertborderwidth) \
                         ::ms::managed_by($w,relief) \
                         ::ms::managed_by($w,rows) \
                         ::ms::managed_by($w,selectbackground) \
                         ::ms::managed_by($w,selectborderwidth) \
                         ::ms::managed_by($w,selectforeground) \
                         ::ms::managed_by($w,shellbackground);

    unset -nocomplain -- ::ms::style($w,border) \
                         ::ms::style($w,hull);

    return ""
}

## FocusIn
#
# Manage the **FocusIn** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::text::Pathname_Cmd $w state focus

    return ""
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
proc ::ms::text::FocusOut { w } {
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

    # Change the widget dynamic state to '!focus'.
    ::ms::text::Pathname_Cmd $w state !focus

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
# X, Y   Should be the mouse pointer (X,Y) root coordinates at the time of the event.
#        These value are provided directly by the **Enter** or **Leave** event.
#
# It doesn't return anything.
proc ::ms::text::Hover { w X Y } {
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

## Scan_Or_Paste
#
# Manage various **ButtonPress** events.
# Depending on the current value and the operating system it will scan the widget or paste the selection into it.
#
# Where:
#
# w       Should be the widget real address involved.
#
# x, y    Should be the (x,y) relative coordinate of the mouse pointer at the time of the event.
#         This parameter should be passed by the event itself.
#
# event   Should be the event name.
#
#         Allowed events are:
#            Button-2
#            B2-Motion
#            ButtonRelease-2
#            Button-3
#            B3-Motion
#            ButtonRelease-3
#            PasteSelection
#
# It doesn't return anything.
proc ::ms::text::Scan_Or_Paste { w x y event } {
    # Check the middleclick variable.
    switch -- $::ms::middleclick {
        drag {
            # Check the windowing system.
            switch -- [_tk windowingsystem] {
                aqua {
                    # Disable dragging on ButtonPress-2 and enable it on ButtonPress-3 (macOS).
                    switch -- $event {
                        "Button-3"        { ::ms::Scan_Mark $w $x $y }
                        "B3-Motion"       { ::ms::Scan_Drag $w $x $y }
                        "ButtonRelease-3" { ::ms::Scan_Release }
                    }
                }
                default {
                    # Disable dragging on ButtonPress-3 and enable it on ButtonPress-2 (Linux and Windows).
                    switch -- $event {
                        "Button-2"        { ::ms::Scan_Mark $w $x $y }
                        "B2-Motion"       { ::ms::Scan_Drag $w $x $y }
                        "ButtonRelease-2" { ::ms::Scan_Release }
                    }
                }
            }
        }
        paste {
            # Check the windowing system.
            switch -- [_tk windowingsystem] {
                aqua {
                    # Disable paste selection on ButtonPress-2 and enable it on ButtonPress-3 (macOS).
                    switch -- $event {
                        "PasteSelection"  -
                        "ButtonRelease-3" { ::ms::text::Paste $w $x $y PRIMARY }
                    }
                }
                default {
                    # Disable paste selection on ButtonPress-3 and enable it on ButtonPress-2 (Linux and Windows).
                    switch -- $event {
                        "PasteSelection"  -
                        "ButtonRelease-2" { ::ms::text::Paste $w $x $y PRIMARY }
                    }
                }
            }
        }
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
# Manage the **ButtonPress-1** event on the widget's internal scrollbar.
#
# Where:
#
# w        Should be the widget real address involved.
#
# orient   Specifies a string (**horizontal** or **vertical**) indicating
#          the orientation of the scrollbar.
#
# x, y     Should be the (x,y) mouse pointer coordinates of the event.
#          These values should be provided by the <ButtonPress> event.
#
# It doesn't return anything.
proc ::ms::text::Scrollbar_ButtonPress { w orient x y }  {
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
                                    ::ms::text::Pathname_Cmd $w xview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set xviews [$w.x get]
                                    set xview1 [lindex $xviews 0]
                                    set xview2 [lindex $xviews 1]

                                    if { $::ms::temp(fraction) < $xview1 } {
                                        # The User has click on the left trough.

                                        # Scroll the thumb by one page towards the left.
                                        ::ms::text::Pathname_Cmd $w xview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $xview2 } {
                                        # The User has click on the right trough.

                                        # Scroll the thumb by one page towards the right.
                                        ::ms::text::Pathname_Cmd $w xview scroll 1 pages

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
                                    ::ms::text::Pathname_Cmd $w yview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set yviews [$w.y get]
                                    set yview1 [lindex $yviews 0]
                                    set yview2 [lindex $yviews 1]

                                    if { $::ms::temp(fraction) < $yview1 } {
                                        # The User has click on the top trough.

                                        # Scroll the thumb by one page towards the top.
                                        ::ms::text::Pathname_Cmd $w yview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $yview2 } {
                                        # The User has click on the bottom trough.

                                        # Scroll the thumb by one page towards the bottom.
                                        ::ms::text::Pathname_Cmd $w yview scroll 1 pages

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
# Manage the **ButtonRelease-1** event on the widget's internal scrollbar.
#
# It doesn't return anything.
proc ::ms::text::Scrollbar_ButtonRelease {} {
    unset -nocomplain -- ::ms::temp(drag_allowed) \
                         ::ms::temp(fraction) \
                         ::ms::temp(xpress) \
                         ::ms::temp(ypress);

    return ""
}

## Scrollbar_Drag
#
# Manage the **B1-Motion** event on the widget's internal scrollbar.
#
# Where:
#
# w        Should be the widget real address involved.
#
# orient   Specifies a string (**horizontal** or **vertical**) indicating
#          the orientation of the scrollbar.
#
# x, y     Should be the (x,y) mouse pointer coordinates of the event.
#          These values should be provided by the <Motion> event.
#
# It doesn't return anything.
proc ::ms::text::Scrollbar_Drag { w orient x y } {
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
            ::ms::text::Pathname_Cmd $w xview moveto $fraction
        }
        vertical {
            # Compute the 'fraction' after the drag movement.
            set delta    [$w.y delta $delta_x $delta_y]
            set fraction [expr { $::ms::temp(fraction)+$delta }]

            # Move the vertical scrollbar to 'fraction'.
            ::ms::text::Pathname_Cmd $w yview moveto $fraction
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
proc ::ms::text::Scrollbar_Update { w } {
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

##########################################
##                                      ##
##     REWRITTEN TK TEXT PROCEDURES     ##
##                                      ##
##########################################

##################################
##                              ##
##     CLEAR/COPY/CUT/PASTE     ##
##                              ##
##################################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Clear
#
# Manage the **Clear** event by deleting the selected text.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Clear { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   { {*}$address edit separator }
    }

    # Execute the command.
    try {
        {*}$address delete sel.first sel.last
    } on error {} {
        # Do nothing.
    }

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   { {*}$address edit separator }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Copy
#
# Manage the **Copy** event by copying the widget's selection into the clipboard.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Copy { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    try {
        {*}$address get sel.first sel.last
    } on error {} {
        return ""
    } on ok { data } {
        _clipboard clear  -displayof $w
        _clipboard append -displayof $w $data
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Cut
#
# Manage the **Cut** event by copying the widget's selection into the clipboard and
# then deleting the widget's selection.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Cut { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    try {
        {*}$address get sel.first sel.last
    } on error {} {
        return ""
    } on ok { data } {
        # make <<Cut>> an atomic operation on the Undo stack,
        # i.e. separate it from other delete operations on either side

        if { ($::ms::current($w,state) eq "normal") && ($::ms::current($w,autoseparators) == 1) } {
            {*}$address edit separator
        }

        _clipboard clear  -displayof $w
        _clipboard append -displayof $w $data

        {*}$address delete sel.first sel.last

        if { ($::ms::current($w,state) eq "normal") && ($::ms::current($w,autoseparators) == 1) } {
            {*}$address edit separator
        }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Paste
#
# Manages the **Paste** event by inserting the clipboard content ('CLIPBOARD' or 'PRIMARY')
# at the current insert point.
#
# Where:
#
# w                Should be the widget real address involved.
#
# x, y             Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#                  These values should be provided by the **Paste** event.
#
# clipboard_type   Optional, should be a string indicating from which clipboard to take paste data.
#                  Allowed values are:
#                    'CLIPBOARD' --> the primary clipboard
#                    'PRIMARY'   --> the secondary clipboard
#
# It doesn't return anything.
proc ::ms::text::Paste { w x y { clipboard_type CLIPBOARD } } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Check the 'clipboard_type'.
    switch -nocase -- $clipboard_type {
        primary {
            {*}$address mark set insert [::ms::text::Closest_Gap $w $x $y]

            set clipboard_type PRIMARY
        }
        default { set clipboard_type CLIPBOARD }
    }

    # Execute the command.
    try {
        ::tk::GetSelection $w $clipboard_type
    } on error {} {
        # Do nothing.
    } on ok { selection } {
        # If autoseparators are active, put an autoseparator.
        switch -- $::ms::current($w,autoseparators) {
            1   {
                {*}$address configure -autoseparators 0
                {*}$address edit separator
            }
        }

        # Check if the windowing system is Linux.
        switch -- [tk windowingsystem] {
            x11 {
                try {
                    {*}$address delete sel.first sel.last
                } on error {} {
                    # Do nothing
                }
            }
        }

        {*}$address insert insert $selection

        # If autoseparators are active, put an autoseparator.
        switch -- $::ms::current($w,autoseparators) {
            1   {
                {*}$address edit separator
                {*}$address configure -autoseparators 1
            }
        }

        # Check if the widget is scrollable or not.
        switch -- $::ms::current($w,scrollbar) {
            true {
                # Update the scrollbars.
                ::ms::text::Scrollbar_Update $w
            }
        }
    }

    focus $::ms::addr($w,widget)

    return ""
}

####################
##                ##
##     DELETE     ##
##                ##
####################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Backspace
#
# Manage the **Backspace** event.
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the left of the cursor location.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Backspace { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    switch -- [::ms::text::The_Cursor_Is_Inside_The_Selection $w] {
        0   {
            if { [{*}$address compare insert != 1.0] } {
                set index1 [::ms::text::Next_Index     $w insert    ::tk::startOfCluster]
                set index2 [::ms::text::Previous_Index $w insert-1c ::tk::endOfCluster]
                {*}$address delete $index1 $index2
            }

            {*}$address see insert
        }
        1   { {*}$address delete sel.first sel.last }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Delete
#
# Manage the **Delete** event.
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the right of the cursor location.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Delete { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    switch -- [::ms::text::The_Cursor_Is_Inside_The_Selection $w] {
        0   {
            if { [{*}$address compare end != insert+1c] } {
                set index1 [::ms::text::Next_Index     $w insert+1c ::tk::startOfCluster]
                set index2 [::ms::text::Previous_Index $w insert    ::tk::endOfCluster]
                {*}$address delete $index1 $index2
            }

            {*}$address see insert
        }
        1   { {*}$address delete sel.first sel.last }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Delete_Word
#
# If a selection is present, delete the selected text, otherwise delete all the characters positioned
# to the right of the cursor location till the start of the next word.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Delete_Word { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    if { [{*}$address compare end != insert+1c] } {
        {*}$address delete insert [::ms::text::Next_Word $w insert]
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Delete_Till_Line_End
#
# Deletes from the insertion cursor to the end of its line.
# If the insertion cursor is already at the end of a line, then deletes the newline character.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Delete_Till_Line_End { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    switch -- [{*}$address compare end != insert+1c] {
        1   {
            switch -- [{*}$address compare insert == { insert lineend }] {
                0   { {*}$address delete insert { insert lineend } }
                1   { {*}$address delete insert }
            }
        }
    }

    return ""
}

#################
##             ##
##     IME     ##
##             ##
#################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Accent_Backspace
#
# Bindings for IME text input.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Accent_Backspace { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    {*}$address delete insert-1c

    return ""
}

## Clear_IME_Marked_Text
#
# Bindings for IME text input.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Clear_IME_Marked_Text { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    {*}$address delete IMEmarkedtext.first IMEmarkedtext.last

    return ""
}

## Start_IME_Marked_Text
#
# Bindings for IME text input.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Start_IME_Marked_Text { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    dict set ::tk::Priv(IMETextMark) "$::ms::addr($w,widget)" [{*}$address index insert]

    return ""
}

## End_IME_Marked_Text
#
# Handles input method text marking in a text widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::End_IME_Marked_Text { w } {
    variable Priv

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    try {
        dict get $Priv(IMETextMark) $::ms::addr($w,widget)
    } on error {} {
        bell
        return ""
    } on ok { mark } {
        {*}$address tag add IMEmarkedtext $mark insert
        {*}$address tag configure IMEmarkedtext -underline 1
    }

    return ""
}

#####################
##                 ##
##     INSERT      ##
##                 ##
#####################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Insert
#
# Manage the **Insert** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Insert { w } {
    # Execute the command.
    try {
        ::tk::GetSelection $w PRIMARY
    } on error {} {
        # Do Nothing
    } on ok { primary } {
        ::ms::text::Insert_String $w $primary
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Insert_String
#
# Insert a string into a text at the point of the insertion cursor.
# If there is a selection in the text, and it covers the point of the
# insertion cursor, then delete the selection before inserting.
#
# Where:
#
# w      Should be the widget real address involved.
#
# data   The string to insert (usually just a single character)
#
# It doesn't return anything.
proc ::ms::text::Insert_String { w data } {
    if { $data eq "" || $::ms::current($w,state) eq "disabled" } {
        return ""
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    set compound 0
    switch -- [::ms::text::The_Cursor_Is_Inside_The_Selection $w] {
        1   {
            # If autoseparators are active, put an autoseparator.
            switch -- $::ms::current($w,autoseparators) {
                1   {
                    {*}$address configure -autoseparators 0
                    {*}$address edit separator
                    set compound 1
                }
            }

            {*}$address delete sel.first sel.last
        }
    }

    {*}$address insert insert $data
    {*}$address see insert

    if { ($compound == 1) && ($::ms::current($w,autoseparators) == 1) } {
        {*}$address edit separator
        {*}$address configure -autoseparators 1
    }

    return ""
}

#######################
##                   ##
##     KEYPRESS      ##
##                   ##
#######################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Control_Tab
#
# Change the focus from the text widget to the next or previous focussable widget, if any.
#
# Where:
#
# w     Should be the widget real address involved.
#
# dir   Should be the direction that the focus needs to take.
#          +1 --> means go to the next focussable widget.
#          -1 --> means go to the previous focussable widget.
#
# It doesn't return anything.
proc ::ms::text::Control_Tab { w dir } {
    # Check the focus direction.
    switch -- $dir {
        -1      { _focus [::tk_focusPrev $::ms::addr($w,widget)] }
        default { _focus [::tk_focusNext $::ms::addr($w,widget)] }
    }

    return ""
}

## KeyPress
#
# Manage the **KeyPress** event.
#
# Where:
#
# w     Should be the widget real address involved.
#
# key   Should be the unicode of the key involved.
#
# It doesn't return anything.
proc ::ms::text::KeyPress { w key } {
    # Execute the command.
    ::ms::text::Insert_String $w $key

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Return
#
# Manage the **Return** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Return { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    ::ms::text::Insert_String $w \n

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   { {*}$address edit separator }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

####################
##                ##
##     PAGES      ##
##                ##
####################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## PageUp
#
# Manages the **PageUp** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::PageUp { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to a vertical scrollbar.
            switch -- $::current($w,yscrollcommand) {
                ""      { ::ms::Scroll_Parent_Y $w 120.0 pages }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { interp invokehidden {}  $w yview scroll -1 pages }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Scroll_Pages $w -1] }
                    }
                }
            }
        }
        true {
            # Check if the widget vertical scrollbar is active or not.
            switch -- $::ms::data($w,scrolly) {
                off { ::ms::Scroll_Parent_Y $w 120.0 pages }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w 120.0 pages }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Scroll_Pages $w -1] }
                    }
                }
            }
        }
    }

    return ""
}

## PageDown
#
# Manages the **PageDown** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::PageDown { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to a vertical scrollbar.
            switch -- $::current($w,yscrollcommand) {
                ""      { ::ms::Scroll_Parent_Y $w -120.0 pages }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { interp invokehidden {}  $w yview scroll 1 pages }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Scroll_Pages $w 1] }
                    }
                }
            }
        }
        true {
            # Check if the widget vertical scrollbar is active or not.
            switch -- $::ms::data($w,scrolly) {
                off { ::ms::Scroll_Parent_Y $w -120.0 pages }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w -120.0 pages }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Scroll_Pages $w 1] }
                    }
                }
            }
        }
    }

    return ""
}

## PageLeft
#
# Manages the **PageLeft** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::PageLeft { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an horizontal scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""      { ::ms::Scroll_Parent_X  $w 120.0 pages }
                default { interp invokehidden {} $w xview scroll -1 pages}
            }
        }
        true {
            # Check if the widget horizontal scrollbar is active or not.
            switch -- $::ms::data($w,scrollx) {
                off { ::ms::Scroll_Parent_X $w 120.0 pages }
                on  { ::ms::Scroll_Widget_X $w 120.0 pages }
            }
        }
    }

    return ""
}

## PageRight
#
# Manages the **PageRight** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::PageRight { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an horizontal scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""      { ::ms::Scroll_Parent_X $w -120.0 pages }
                default { interp invokehidden {} $w xview scroll 1 pages }
            }
        }
        true {
            # Check if the widget horizontal scrollbar is active or not.
            switch -- $::ms::data($w,scrollx) {
                off { ::ms::Scroll_Parent_X $w -120.0 pages }
                on  { ::ms::Scroll_Widget_X $w -120.0 pages }
            }
        }
    }

    return ""
}

##################
##              ##
##     LINE     ##
##              ##
##################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Line_Index
#
# Returns the index of the character one display line above or below the insertion cursor.
# There is a tricky thing here: we want to maintain the original x position across repeated operations,
# even though some lines that will get passed through don't have enough characters to cover the original column.
#
# Where:
#
# w   Should be the widget real address involved.
#
# n   The number of display lines to move:
#       -1 --> up one line
#       +1 --> down one line
#
# Returns the resulting index.
proc ::ms::text::Line_Index { w n } {
    variable ::tk::Priv

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    set i [{*}$address index insert]

    if { $Priv(prevPos) ne $i } {
        set Priv(textPosOrig) $i
    }

    set lines [{*}$address count -displaylines $Priv(textPosOrig) $i]
    set new   [{*}$address index "$Priv(textPosOrig) + [expr { $lines + $n }] displaylines"]

    set Priv(prevPos) $new

    if { [{*}$address compare $new == "end display lineend"] || [{*}$address compare $new == "insert display linestart"] } {
        set Priv(textPosOrig) $new
    }

    return $new
}

## Line_Start
#
# Manages the **LineStart** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Line_Start { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an horizontal scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""      { ::ms::Scroll_Parent_X $w -120.0 pages }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::text::Pathname_Cmd $w xview moveto 0 }
                        normal   { ::ms::text::Move_Cursor  $w {insert display linestart} }
                    }
                }
            }
        }
        true {
            # Check if the widget horizontal scrollbar is active or not.
            switch -- $::ms::data($w,scrollx) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w -120.0 pages }
                        normal   { ::ms::text::Move_Cursor $w {insert display linestart} }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::text::Pathname_Cmd $w xview moveto 0 }
                        normal   { ::ms::text::Move_Cursor  $w {insert display linestart} }
                    }
                }
            }
        }
    }

    return ""
}

## Line_End
#
# Manages the **LineEnd** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Line_End { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an horizontal scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""      { ::ms::Scroll_Parent_X $w 120.0 pages }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::text::Pathname_Cmd $w xview moveto 1.0 }
                        normal   { ::ms::text::Move_Cursor  $w {insert display lineend} }
                    }
                }
            }
        }
        true {
            # Check if the widget horizontal scrollbar is active or not.
            switch -- $::ms::data($w,scrollx) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w 120.0 pages }
                        normal   { ::ms::text::Move_Cursor $w {insert display lineend} }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::text::Pathname_Cmd $w xview moveto 1.0 }
                        normal   { ::ms::text::Move_Cursor  $w {insert display lineend} }
                    }
                }
            }
        }
    }

    return ""
}

## Line_Top
#
# Manages the **LineTop** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Line_Top { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an vertical scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""      { ::ms::Scroll_Parent_Y $w -120.0 pages }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::text::Pathname_Cmd $w yview moveto 0 }
                        normal   { ::ms::text::Move_Cursor  $w 1.0 }
                    }
                }
            }
        }
        true {
            # Check if the widget vertical scrollbar is active or not.
            switch -- $::ms::data($w,scrolly) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w -120.0 pages }
                        normal   { ::ms::text::Move_Cursor $w 1.0 }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::text::Pathname_Cmd $w yview moveto 0 }
                        normal   { ::ms::text::Move_Cursor  $w 1.0 }
                    }
                }
            }
        }
    }

    return ""
}

## Line_Bottom
#
# Manages the **LineBottom** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Line_Bottom { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an vertical scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""      { ::ms::Scroll_Parent_Y $w 120.0 pages }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::text::Pathname_Cmd $w yview moveto 1.0 }
                        normal   { ::ms::text::Move_Cursor  $w {end - 1 indices} }
                    }
                }
            }
        }
        true {
            # Check if the widget vertical scrollbar is active or not.
            switch -- $::ms::data($w,scrolly) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w 120.0 pages }
                        normal   { ::ms::text::Move_Cursor $w {end - 1 indices} }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::text::Pathname_Cmd $w yview moveto 1.0 }
                        normal   { ::ms::text::Move_Cursor  $w {end - 1 indices} }
                    }
                }
            }
        }
    }

    return ""
}

##################
##              ##
##     NEXT     ##
##              ##
##################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Next_Index
#
# Returns the index of the next position after the given starting position.
#
# Where:
#
# w       Should be the widget real address involved.
#
# start   Position at which to start search.
#
# op      Function to use to find the next position.
#
# Returns the resulting index.
proc ::ms::text::Next_Index { w start op } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    set text ""
    set cur  $start
    while { [{*}$address compare $cur < end] } {
        set text [string cat $text [{*}$address get -displaychars $cur "$cur lineend + 1c"]]

        set pos [$op $text 0]
        if { $pos >= 0 } {
            return [{*}$address index "$start + $pos display chars"]
        }

        set cur [{*}$address index "$cur lineend +1c"]
    }

    return end
}

## Next_Paragraph_Index
#
# Returns the index of the beginning of the paragraph just after a given position in the text
# (the beginning of a paragraph is the first non-blank character after a blank line).
#
# Where:
#
# w       Should be the widget real address involved.
#
# start   Position at which to start search.
#
# Returns the resulting index.
proc ::ms::text::Next_Paragraph_Index { w start } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    set pos [{*}$address index "$start linestart + 1 line"]

    while { [{*}$address get $pos] ne "\n" } {
        if { [{*}$address compare $pos == end] } {
            return [{*}$address index "end - 1c"]
        }

        set pos [{*}$address index "$pos + 1 line"]
    }

    while { [{*}$address get $pos] eq "\n" } {
        set pos [{*}$address index "$pos + 1 line"]
        if { [{*}$address compare $pos == end] } {
            return [{*}$address index "end - 1c"]
        }
    }

    if { [regexp -indices -- {^[ \t]+(.)} [{*}$address get $pos "$pos lineend"] -> index]} {
        return [{*}$address index "$pos + [lindex $index 0] chars"]
    }

    return $pos
}

## Next_Char
#
# Manages the **NextChar** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Next_Char { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an vertical scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Index $w insert ::tk::endOfCluster] }
                    }
                }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_X   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Index $w insert ::tk::endOfCluster] }
                    }
                }
            }
        }
        true {
            # Check if the widget horizontal scrollbar is active or not.
            switch -- $::ms::data($w,scrollx) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Index $w insert ::tk::endOfCluster] }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_X   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Index $w insert ::tk::endOfCluster] }
                    }
                }
            }
        }
    }

    return ""
}

## Next_Word
#
# Manages the **NextWord** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Next_Word { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an horizontal scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Index $w [::ms::text::Next_Index $w $start tk::endOfWord] tk::startOfNextWord] }
                    }
                }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_X   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Index $w [::ms::text::Next_Index $w $start tk::endOfWord] tk::startOfNextWord] }
                    }
                }
            }
        }
        true {
            # Check if the widget horizontal scrollbar is active or not.
            switch -- $::ms::data($w,scrollx) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Index $w [::ms::text::Next_Index $w $start tk::endOfWord] tk::startOfNextWord] }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_X   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Index $w [::ms::text::Next_Index $w $start tk::endOfWord] tk::startOfNextWord] }
                    }
                }
            }
        }
    }

    return ""
}

## Next_Line
#
# Manages the **NextLine** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Next_Line { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an vertical scrollbar.
            switch -- $::current($w,yscrollcommand) {
                ""  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Line_Index 1] }
                    }
                }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Line_Index 1] }
                    }
                }
            }
        }
        true {
            # Check if the widget vertical scrollbar is active or not.
            switch -- $::ms::data($w,scrolly) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Line_Index 1] }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Line_Index 1] }
                    }
                }
            }
        }
    }

    return ""
}

## Next_Paragraph
#
# Manages the **NextPara** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Next_Paragraph { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an vertical scrollbar.
            switch -- $::current($w,yscrollcommand) {
                ""  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Paragraph_Index $w insert] }
                    }
                }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Paragraph_Index $w insert] }
                    }
                }
            }
        }
        true {
            # Check if the widget vertical scrollbar is active or not.
            switch -- $::ms::data($w,scrolly) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Paragraph_Index $w insert] }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w -120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Next_Paragraph_Index $w insert] }
                    }
                }
            }
        }
    }

    return ""
}

######################
##                  ##
##     PREVIOUS     ##
##                  ##
######################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Previous_Index
#
# Returns the index of the previous position before the given starting position.
#
# Where:
#
# w       Should be the widget real address involved.
#
# start   Position at which to start search.
#
# op      Function to use to find the previous position.
#
# Returns the resulting index.
proc ::ms::text::Previous_Index { w start op } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    set text ""
    set cur  $start
    while { [{*}$address compare $cur > 0.0] } {
        set text [string cat [{*}$address get -displaychars "$cur linestart - 1c" $cur] $text]

        set pos [$op $text end]
        if { $pos >= 0 } {
            return [{*}$address index "$cur linestart - 1c + $pos display chars"]
        }

        set cur [{*}$address index "$cur linestart - 1c"]
    }

    return 0.0
}

## Previous_Paragraph_Index
#
# Returns the index of the beginning of the paragraph just before a given position in the text
# (the beginning of a paragraph is the first non-blank character after a blank line).
#
# Where:
#
# w     Should be the widget real address involved.
#
# pos   Position at which to start search.
#
# Returns the resulting index.
proc ::ms::text::Previous_Paragraph_Index { w pos } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    set pos [{*}$address index "$pos linestart"]

    while { 1 } {
        if { ([{*}$address get "$pos - 1 line"] eq "\n" && ([{*}$address get $pos] ne "\n")) || $pos eq "1.0" } {
            if { [regexp -indices -- {^[ \t]+(.)} [{*}$address get $pos "$pos lineend"] -> index] } {
                set pos [{*}$address index "$pos + [lindex $index 0] chars"]
            }

            if { [{*}$address compare $pos != insert] || [lindex [split $pos .] 0]==1 } {
                return $pos
            }
        }

        set pos [{*}$address index "$pos - 1 line"]
    }
}

## Previous_Char
#
# Manages the **PrevChar** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Previous_Char { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an vertical scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Index $w insert ::tk::startOfCluster] }
                    }
                }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_X   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Index $w insert ::tk::startOfCluster] }
                    }
                }
            }
        }
        true {
            # Check if the widget horizontal scrollbar is active or not.
            switch -- $::ms::data($w,scrollx) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Index $w insert ::tk::startOfCluster] }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_X   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Index $w insert ::tk::startOfCluster] }
                    }
                }
            }
        }
    }

    return ""
}

## Previous_Word
#
# Manages the **PrevWord** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Previous_Word { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an horizontal scrollbar.
            switch -- $::current($w,xscrollcommand) {
                ""  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Index $w insert ::tk::startOfPreviousWord] }
                    }
                }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_X   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Index $w insert ::tk::startOfPreviousWord] }
                    }
                }
            }
        }
        true {
            # Check if the widget horizontal scrollbar is active or not.
            switch -- $::ms::data($w,scrollx) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_X   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Index $w insert ::tk::startOfPreviousWord] }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_X   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Index $w insert ::tk::startOfPreviousWord] }
                    }
                }
            }
        }
    }

    return ""
}

## Previous_Line
#
# Manages the **PrevLine** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Previous_Line { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an vertical scrollbar.
            switch -- $::current($w,yscrollcommand) {
                ""  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Line_Index -1] }
                    }
                }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Line_Index -1] }
                    }
                }
            }
        }
        true {
            # Check if the widget vertical scrollbar is active or not.
            switch -- $::ms::data($w,scrolly) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Line_Index -1] }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Line_Index -1] }
                    }
                }
            }
        }
    }

    return ""
}

## Previous_Paragraph
#
# Manages the **PrevPara** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Previous_Paragraph { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false {
            # Check if the simple text is linked to an vertical scrollbar.
            switch -- $::current($w,yscrollcommand) {
                ""  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Paragraph_Index $w insert] }
                    }
                }
                default {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Paragraph_Index $w insert] }
                    }
                }
            }
        }
        true {
            # Check if the widget vertical scrollbar is active or not.
            switch -- $::ms::data($w,scrolly) {
                off {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Parent_Y   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Paragraph_Index $w insert] }
                    }
                }
                on  {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { ::ms::Scroll_Widget_Y   $w 120.0 units }
                        normal   { ::ms::text::Move_Cursor $w [::ms::text::Previous_Paragraph_Index $w insert] }
                    }
                }
            }
        }
    }

    return ""
}

####################
##                ##
##     SELECT     ##
##                ##
####################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Select_All
#
# Select all the text inside the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_All { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    {*}$address tag add sel 1.0 end

    return ""
}

## Select_Key
#
# This procedure is invoked when stroking out selections using the keyboard.
# It moves the cursor to a new position, then extends the selection to that position.
#
# Where:
#
# w     Should be the widget real address involved.
#
# new   A new position for the insertion cursor (the cursor hasn't actually been moved to this position yet).
#
# It doesn't return anything.
proc ::ms::text::Select_Key { w new } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    set anchorname [tk::TextAnchor $::ms::addr($w,widget)]

    if { [{*}$address tag nextrange sel 1.0 end] eq "" } {
        if { [{*}$address compare $new < insert] } {
            {*}$address tag add sel $new insert
        } else {
            {*}$address tag add sel insert $new
        }

        {*}$address mark set $anchorname insert
    } else {
        if { [catch { {*}$address index $anchorname }] } {
            {*}$address mark set $anchorname insert
        }

        if { [{*}$address compare $new < $anchorname] } {
            set first $new
            set last $anchorname
        } else {
            set first $anchorname
            set last $new
        }

        {*}$address tag remove sel 1.0 $first
        {*}$address tag add sel $first $last
        {*}$address tag remove sel $last end
    }

    {*}$address mark set insert $new
    {*}$address see insert

    update idletasks

    return ""
}

## Select_None
#
# Clears any selections.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_None { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Remove the selection, if any.
    {*}$address tag remove sel 1.0 end

    # An operation that clears the selection must insert an autoseparator,
    # because the selection operation may have moved the insert mark

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   { {*}$address edit separator }
    }

    return ""
}

##########################
##                      ##
##     SELECT PAGES     ##
##                      ##
##########################

## Select_PageUp
#
# Scrolls the widget vertically by one page towards the top and extends the selections to that point.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_PageUp { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Scroll_Pages $w -1] }
    }

    return ""
}

## Select_PageDown
#
# Scrolls the widget vertically by one page towards the bottom and extends the selections to that point.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_PageDown { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Scroll_Pages $w 1] }
    }

    return ""
}

#########################
##                     ##
##     SELECT LINE     ##
##                     ##
#########################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Select_Line_Start
#
# Select from the insertion cursor to the start of the line.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Line_Start { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w {insert display linestart} }
    }

    return ""
}

## Select_Line_End
#
# Select from the insertion cursor to the end of the line.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Line_End { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w {insert display lineend} }
    }

    return ""
}

## Select_Line_Top
#
# Select from the insertion cursor to the start of the text.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Line_Top { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w 1.0 }
    }

    return ""
}

## Select_Line_Bottom
#
# Select from the insertion cursor to the end of the text.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Line_Bottom { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w {end - 1 indices} }
    }

    return ""
}

#########################
##                     ##
##     SELECT NEXT     ##
##                     ##
#########################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Select_Next_Char
#
# Select from the insertion cursor to the next character.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Next_Char { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Next_Index $w insert ::tk::endOfCluster] }
    }

    return ""
}

## Select_Next_Word
#
# Select from the insertion cursor to the next word.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Next_Word { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Next_Index $w insert tk::endOfWord] }
    }

    return ""
}

## Select_Next_Line
#
# Select from the insertion cursor to the next line.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Next_Line { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Line_Index 1] }
    }

    return ""
}

## Select_Next_Paragraph
#
# Select from the insertion cursor to the next paragraph.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Next_Paragraph { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Next_Paragraph_Index $w insert] }
    }

    return ""
}

#############################
##                         ##
##     SELECT PREVIOUS     ##
##                         ##
#############################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Select_Previous_Char
#
# Select from the insertion cursor to the previous character.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Previous_Char { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Previous_Index $w insert ::tk::startOfCluster] }
    }

    return ""
}

## Select_Previous_Word
#
# Select from the insertion cursor to the previous word.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Previous_Word { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Previous_Index $w insert ::tk::startOfPreviousWord] }
    }

    return ""
}

## Select_Previous_Line
#
# Select from the insertion cursor to the previous line.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Previous_Line { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Line_Index -1] }
    }

    return ""
}

## Select_Previous_Paragraph
#
# Select from the insertion cursor to the previous paragraph.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Select_Previous_Paragraph { w } {
    switch -- $::ms::current($w,state) {
        normal { ::ms::text::Select_Key $w [::ms::text::Previous_Paragraph $w insert] }
    }

    return ""
}

##################################
##                              ##
##     UNDO/REDO/TRANSPOSE      ##
##                              ##
##################################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Undo
#
# Manage the **Undo** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Undo { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   { {*}$address edit separator }
    }

    # Execute the command.
    try {
        {*}$address edit undo
    } on error {} {
        # Do nothing
    }

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   { {*}$address edit separator }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Redo
#
# Manage the **Redo** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Redo { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    try {
        {*}$address edit redo
    } on error {} {
        # Do nothing
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Transpose
#
# This procedure implements the "transpose" function for text widgets.
# It tranposes the characters on either side of the insertion cursor, unless the cursor is at the end of the line.
# In this case it transposes the two characters to the left of the cursor.
# In either case, the cursor ends up to the right of the transposed characters.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Transpose { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    set pos insert

    if { [{*}$address compare $pos != "$pos lineend"] } {
        set pos [{*}$address index "$pos + 1 char"]
    }

    set new [string cat [{*}$address get "$pos - 1 char"] [{*}$address get  "$pos - 2 char"]]

    if { [{*}$address compare "$pos - 1 char" == 1.0] } {
        return ""
    }

    # Ensure this is seen as an atomic op to undo.

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   {
            {*}$address configure -autoseparators 0
            {*}$address edit separator
        }
    }

    {*}$address delete "$pos - 2 char" $pos
    {*}$address insert insert $new
    {*}$address see insert

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   {
            {*}$address edit separator
            {*}$address configure -autoseparators $::ms::current($w,autoseparators)
        }
    }

    return ""
}

######################
##                  ##
##     UTILITY      ##
##                  ##
######################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## The_Cursor_Is_Inside_The_Selection
#
# Check whether the selection exists and contains the insertion cursor.
# Note that it assumes that the selection is contiguous.
#
# Where:
#
# w   Should be the widget real address involved.
#
# Return '1' if the selection exists and contains the insertion cursor, otherwise returns '0'.
proc ::ms::text::The_Cursor_Is_Inside_The_Selection { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    if { [llength [{*}$address tag ranges sel]] && [{*}$address compare sel.first <= insert] && [{*}$address compare sel.last >= insert] } {
        return 1
    } else {
        return 0
    }
}

## Move_Cursor
#
# Move the insertion cursor to a given position in a text.
# Also clears the selection, if there is one in the text, and makes sure that the insertion cursor is visible.
# Also, don't let the insertion cursor appear on the dummy last line of the text.
#
# Where:
#
# w     Should be the widget real address involved.
#
# pos   The desired new position for the cursor in the window.
#
# It doesn't return anything.
proc ::ms::text::Move_Cursor { w pos } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    if { [{*}$address compare $pos == end] } {
        set pos {end - 1 chars}
    }

    {*}$address mark set insert $pos
    {*}$address tag remove sel 1.0 end
    {*}$address see insert

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   { {*}$address edit separator }
    }

    return ""
}

## Scroll_Pages
#
# It scrolls the view in the widget by *n* pages, and it returns the index of the character that
# is at the same position in the new view as the insertion cursor used to be in the old view.
#
# Where:
#
# w   Should be the widget real address involved.
#
# n   Number of pages to scroll:
#        -1 --> one page up
#        +1 --> one page down
#
# Returns the resulting index.
proc ::ms::text::Scroll_Pages { w n } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    {*}$address yview scroll $n pages

    set bbox [{*}$address bbox insert]
    switch -- $bbox {
        ""  {
            set index [string cat "@" \
                                  [expr { [_winfo height $::ms::addr($w,widget)]/2} ] \
                                  ",0"];
        }
        default {
            set index [string cat "@" \
                                  [lindex $bbox 0] \
                                  "," \
                                  [lindex $bbox 1]];
        }
    }

    return [{*}$address index $index]
}

## Closest_Gap
#
# Given the x and y coordinates, this procedure finds the closest boundary between characters to the given
# coordinates and returns the index of the character just after the boundary.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) relative coordinates at the time of the event.
#
# Returns the resulting index.
proc ::ms::text::Closest_Gap { w x y } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    set pos [{*}$address index @$x,$y]

    set bbox [{*}$address bbox $pos]
    if { $bbox eq "" } {
        return $pos
    }

    # The check on y coord of the line bbox with dlineinfo is to fix
    # [a9cf210a42] to properly handle selecting and moving the mouse
    # out of the widget.
    if { $y < [lindex [{*}$address dlineinfo $pos] 1] || ($x - [lindex $bbox 0] < [lindex $bbox 2]/2) } {
        return $pos
    }

    return [{*}$address index "$pos + 1 char"]
}

#*EOF*