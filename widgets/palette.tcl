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

## palette
#
#### DESCRIPTION:
#
# A palette combines a text field with a pop-down list of colornamess and a color preview object; the user may select the colorname
# of the text field from among the colornames in the list. Palette widgets support horizontal scrolling with the standard **-xscrollcommand**
# option and **xview** widget command but only if the **-maxlength** option value is **0**.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname,
#         but the pathname's parents must exists.
#         *Window* may be provided either as a short or as a real address, the address returned will be:
#            - A short address, if the *window* provided as input is a short address.
#            - A real address, if the *window* provided as input is a real address.
#
# Note 2: The mustang palette widget is a megawidget composed by an hull object (the megawidget container), a combobox
#         object (the palette) and a color preview object.
#
# Additional options, described below, may be specified on the command line to configure aspects of the palette.
#
#### SYNOPSIS:
#
#   **palette**  *window* ?*option* *value*? ... ?*option* *value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-arrowcolor**              It's a list that specifies the color to use for the arrow elements.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: It's only meaningful for themes that use the 'default' or 'clam' engine (like the 'Halo' theme).
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-arrowcolor** specified in its style.
#                                                             If there isn't one, the **-arrowcolor** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-arrowcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-arrowsize**.
#
# **-arrowsize**               Specifies the size of the arrow elements.
#                              The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                              (pixels, points, inches, millimeters or centimeters).
#
#                              Note: It's only meaningful for themes that use the 'default' or 'clam' engine (like the 'Halo' theme).
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-arrowsize** specified in its style.
#                                                             If there isn't one, the **-arrowsize** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-arrowsize** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
#                              See also **-arrowcolor**.
#
# **-background**              It's a list that specifies the color to use as background.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                             If there isn't one, the **-background** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-background** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-fieldbackground** and **-foreground**.
#
# **-bordercolor**             It's a list that specifies the color to use as bordercolor.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: It's only meaningful for widget with a **solid** relief.
#
#                              Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                             If there isn't one, the **-bordercolor** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-bordercolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-relief**.
#
# **-charwidth**               Specifies the desired width for the window in units of characters in the font given by the **-font** option.
#                              If the font does not have a uniform width then the width of the character **0** is used in translating from
#                              character units to screen units.
#
#                              Note: The palette **-charwidth** must be a positive integer (**0** not included).
#                                    If it's not, the current theme value will be used instead.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-charwidth** specified in its style.
#                                                             If there isn't one, the **-charwidth** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-charwidth** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
#                              See also **-maxlength**.
#
# **-class**                   Specifies a class for the widget.
#                              It is mainly used to make bindings for widgets that have the same class.
#
#                              Note: This option may only be provided while creating the widget.
#                                    Attempts to change this value after the widget is created by using the **configure** command,
#                                    will be ignored by mustang.
#
#                              If not provided, defaults to **TPalette**.
#
# **-cmenu**                   Specifies the contextual menu address that will be assigned to the widget.
#
#                              The contextual menu will be assign to the *combobox* object of the megawidget.
#                              If the *cmenu* value is the empty string or invalid, nothing will happen.
#
#                              The *hull* and *preview* objects will rather use the contextual menu of the widget's toplevel, if any.
#                              If the developer needs a different contextual menu for the these objects, a variable called
#                              '::ms::data($short_addr,cmenu,shell)' can be set with a valid contextual menu address in order to be used
#                              instead of the toplevel one.
#
#                              Note: '$short_addr' must be the short address of the text widget.
#                                    See the [tk](/wiki/commands/tk.md) command to know more about short and real address.
#
#                              If '::ms::data($short_addr,cmenu,shell)' is set with an empty string or with an invalid contextual menu address,
#                              it will be ignored and the contextual menu of the widget's toplevel (if any) will be used.
#                              If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                              If not provided, defaults to the empty string.
#
# **-command**                 Specifies a procedure to call after the validation on the data has been done.
#                              This procedure will be launched with two parameters, the real address of the palette involved and the current
#                              validated value. Providing an empty string will mean to not launch any procedure after the validation.
#
#                              If not provided, defaults to the empty string.
#
# **-cursor**                  Specifies the mouse cursor to be used for the widget.
#                              If an empty string is specified, it indicates that the widget should defer to it's parent for
#                              cursor specification.
#
#                              See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                              Note: If the widget state is disabled, the cursor shape upon the textarea will always be the 'arrow'.
#                                    If the widget state is readonly, the cursor shape upon the textarea will always be the 'arrow'
#                                    (Windows and Linux) or 'hand1' (macOs).
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                             If there isn't one, the **-cursor** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-cursor** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
# **-darkcolor**               It's a list that specifies the color to use as darkcolor.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: It's only meaningful for widgets with a relief that is not **flat** or **solid**.
#
#                              Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-darkcolor** specified in its style.
#                                                             If there isn't one, the **-darkcolor** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-darkcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-lightcolor**.
#
# **-exportselection**         Specifies a boolean value that indicates whether or not a selection in the widget should be linked to the X
#                              selection. If the selection is exported, then selecting in the widget deselects the current X selection,
#                              selecting outside the widget deselects any widget selection, and the widget will respond to selection retrieval
#                              requests when it has a selection.
#
#                              If a palette is exporting its selection then it will observe the standard X11 protocols for handling the selection;
#                              palette selections are available as type **STRING**.
#                              Palettees also observe the standard Tk rules for dealing with the input focus.
#                              When a palette has the input focus it displays an insert cursor to indicate where new characters will be inserted.
#
#                              Palettees are capable of displaying strings that are too long to fit entirely within the widget's window.
#                              In this case, only a portion of the string will be displayed; commands described below may be used to change the
#                              view in the window. Palettees use the standard **-xscrollcommand** mechanism for interacting with scrollbars.
#
#                              If not provided, defaults to **1**.
#
#                              See also **-xscrollcommand**.
#
# **-fieldbackground**         It's a list that specifies the color to use as fieldbackground.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-fieldbackground** specified in its style.
#                                                             If there isn't one, the **-fieldbackground** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-fieldbackground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-background** and **-foreground**.
#
# **-focuscolor**              It's a list that specifies the color to use as focuscolor (the color or the focus ring).
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: It's only meaningful for themes that use the 'alt', 'default' or 'classic' engine
#                                    and ignored by themes that use the 'clam' engine'.
#                                    If the current theme uses the 'clam' engine (like the 'Halo' theme) a combination of
#                                    'bordercolor' and 'lightcolor' will be used instead.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-focuscolor** specified in its style.
#                                                             If there isn't one, the **-focuscolor** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-focuscolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-bordercolor**.
#
# **-focuswidth**              It's a list that specifies the color to use as focuswidth (the size of the focus ring).
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-focuswidth** specified in its style.
#                                                             If there isn't one, the **-focuswidth** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-focuswidth** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
# **-font**                    Specifies the font to use for the text displayed by the widget.
#                              The widget will accept as fontname any font created with the **font** command, including any Tk
#                              defaults fonts, the new mustang fonts (**BiggestFont**, **BiggerFont**, **NormalFont**, **SmallerFont**,
#                              **SmallestFont** and **MonospaceFont**) or fonts defined by the developer itself.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-font** specified in its style.
#                                                             If there isn't one, the **-font** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-font** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
#                              See also **-foreground**.
#
# **-foreground**              It's a list that specifies the color to use as foreground.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-foreground** specified in its style.
#                                                             If there isn't one, the **-foreground** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-foreground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-background**, **-fieldbackground** and **-font**.
#
# **-insertcolor**             It's a list that specifies the color to use for the palette cursor.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-insertcolor** specified in its style.
#                                                             If there isn't one, the **-insertcolor** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-insertcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-insertwidth**.
#
# **-insertwidth**             Specifies the width of the palette cursor.
#                              The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                              (pixels, points, inches, millimeters or centimeters).
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-insertwidth** specified in its style.
#                                                             If there isn't one, the **-insertwidth** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-insertwidth** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
#                              See also **-insertcolor**.
#
# **-justify**                 If there are multiple lines of text, specifies how the lines are laid out relative to one another.
#                              Allowed values:
#                                  **left**,
#                                  **center**,
#                                  **right**.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-justify** specified in its style.
#                                                             If there isn't one, the **-justify** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-justify** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
# **-lightcolor**              It's a list that specifies the color to use as lightcolor.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: It's only meaningful for widgets with a relief that is not **flat** or **solid**.
#
#                              Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-lightcolor** specified in its style.
#                                                             If there isn't one, the **-lightcolor** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-lightcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-darkcolor**.
#
# **-maxlength**               Specifies an integer that indicates the maximum number of characters that can be inserted inside a
#                              palette widget. If this value is **0**, then any amount of characters can be inserted inside the palette
#                              (that will be scrollable). Any other value will limit the possible characters that can be inserted.
#
#                              The maxlength value can influence the **-charwidth** of the widget, more precisely:
#
#                                 maxlength  = 0                    --> any charwidth value is accepted (even **0**).
#                                 charwidth  = 0                    --> any maxlength value is accepeted (even **0**).
#                                 maxlength != 0 and charwidth !=0  --> If the charwidth is lesser then the maxlength, the former will be
#                                                                       set as the latter.
#
#                              If not provided, defaults to **0**.
#
#                              See also **-charwidth** and **-xscrollcommand**.
#
# **-padding**                 Specifies the internal padding for the widget.
#                              The padding is a list of up to four length specifications.
#                              The values must be in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                              (pixels, points, inches, millimeters or centimeters).
#
#                              A list of four values specifies the left, top, right and bottom padding.
#                              A list of three values specifies the left, vertical, and right padding.
#                              A list of two values specifies the horizontal and the vertical padding
#                              A single value specifies the same padding all the way around the widget.
#
#                              When computing how large a window it needs, the widget will add this amount to the width it would
#                              normally need (as determined by the width of the things displayed in the widget).
#                              If the geometry manager can satisfy this request, the widget will end up with extra internal space
#                              to the left and/or right of what it displays inside.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-padding** specified in its style.
#                                                             If there isn't one, the **-padding** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-padding** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
# **-placeholder**             Specifies a help text string to display if no text is otherwise displayed, that is when the widget is empty.
#                              The placeholder text is displayed using the values of the **-font**, **-justify** and **-placeholderforeground**
#                              options.
#
#                              The placeholder text will disappear when the widget will take the focus, and reappears (if the widget value is
#                              empty) when the widget loses the focus. An empty string will mean no placeholder text to display.
#
#                              If not provided, defaults to the empty string.
#
#                              See also **-font**, **-justify** and **-placeholderforeground**.
#
# **-placeholderforeground**   It's a list that specifies the color to use as foreground for the placeholder text..
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-placeholderforeground** specified in its style.
#                                                             If there isn't one, the **-placeholderforeground** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-placeholderforeground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-font**, **-justify** and **-placeholder**.
#
# **-posthook**                Specifies a procedure to call just after the destroy of the popdown window.
#                              This procedure will be launched with one parameter, the real address of the palette involved.
#                              Providing an empty string will mean to not launch any procedure after the popdown window is destroyed.
#
#                              If not provided, defaults to the empty string.
#
# **-prehook**                 Specifies a procedure to call just before the creation of the popdown window.
#                              This procedure will be launched with one parameter, the real address of the palette involved.
#                              Providing an empty string will mean to not launch any procedure before the creation of the popdown window.
#
#                              If not provided, defaults to the empty string.
#
# **-rows**                    The number of rows to display inside the popdown window.
#                              If the number of row specified is less then the number of values specified then a vertical scrollbar will
#                              be displayed inside the popdown.
#
# **-selectbackground**        It's a list that specifies the background color to use when displaying selected items.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-selectbackground** specified in its style.
#                                                             If there isn't one, the **-selectbackground** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-selectbackground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-selectforeground** and **-insertborderwidth**.
#
# **-selectborderwidth**       Specifies a non-negative value indicating the width of the 3-D border to draw around selected items.
#                              The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html).
#
#                              Note: A value of **0** means no border.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-selectborderwidth** specified in its style.
#                                                             If there isn't one, the **-selectborderwidth** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-selectborderwidth** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
#                              See also **-selectbackground** and **-selectforeground**.
#
# **-selectforeground**        It's a list that specifies the foreground color to use when displaying selected items.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-selectforeground** specified in its style.
#                                                             If there isn't one, the **-selectforeground** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-selectforeground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-selectbackground** and **-selectborderwidth**.
#
# **-shellbackground**         It's a list that specifies the color to use as background structure.
#                              This color will be used in the interspaces between the mustang objects that compose the megawidget and
#                              should reflects the widget's parent background.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-shellbackground** specified in its style.
#                                                             If there isn't one, the **-shellbackground** of the **TPalette** style
#                                                             will be used instead.
#                                                             The **-shellbackground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                                                             Note: The **-shellbackground** should change rarely, for example upon
#                                                                   an **Activate**/**Deactivate** event.
#
# **-state**                   Specifies the state for the widget.
#                              May be set to **normal**, **readonly** or **disabled**.
#                              This is a write-only option: setting it changes the widget state, but the state widget command does not
#                              affect the *-state* option.
#
#                              If not provided, defaults to **normal**.
#
# **-style**                   Specifies a custom widget style.
#                              If not provided, defaults to **TPalette**.
#
#                              The *style* provided should already exists at the time the widget is created.
#
#                              See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**               Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                              and **Shift-Tab**).
#
#                              Before setting the focus to a widget, the traversal scripts consult the value of the
#                              *-takefocus* option.
#                                 **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                                 **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                           and all of its ancestors are mapped.
#
#                              Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                              Note: It is not possible to set a takefocus of **1** to widgets in the disabled state.
#
#                              If not provided, defaults to **1**.
#
# **-textvariable**            Specifies the name of a global variable whose value is linked to the palette widget's contents.
#                              Whenever the variable changes value, the widget's contents are updated, and vice versa.
#
#                              If not provided, defaults to the empty string.
#
# **-values**                  Specifies the list of colornames to display in the popdown window and their relative hexadecimals values
#                              to display in the preview object.
#
#                              The colornames must be composed only by alphanumeric characters plus the space or the underline character.
#                              The hexadecimal can be provided at 8, 12 or 16 bit, in shortform or longform, with or whitout the **#** symbol.
#                              The values will be automatically sorted by mustang per colorname, preserving the hexadecimals associations provided.
#
#                              Differently than the **combobox** widget, the values of the palette will be analized as it's a two columns table
#                              where the first column holds the colornames and the second their hexadecimal values. For example:
#
#                                 set palette_list [list Azure       #0080ff \
#                                                        Blue        #0000ff \
#                                                        Brown       #964b00 \
#                                                        Cyan        #00ffff \
#                                                        Green       #00ff00 \
#                                                        Lime        #c0ff00 \
#                                                        Magenta     #ff00ff \
#                                                        "Navy Blue" #000080 \
#                                                        Orange      #ffa500 \
#                                                        Pink        #ff0080 \
#                                                        Purple      #800080 \
#                                                        Red         #ff0000 \
#                                                        Violet      #8000ff \
#                                                        Yellow      #ffff00];
#
#                              or if you prefer:
#
#                                 set palette_list [list Azure #0080ff Blue #0000ff Brown #964b00 Cyan #00ffff Green #00ff00 Lime #c0ff00 ...]
#
#                              The index returned from (or setted by) the *window* **current** command will always be relative to the colorname
#                              column and not to the entire values list.
#                              In other words, an index of **0** will corrispond to the **Azure** colorname, an index of **5** will correspond
#                              to the **Lime** colorname, an index of **9** will corrispond to the **Pink** colorname and so on and so forth.
#                              The following are the relative index of the colornames of the example above:
#
#                                 index 0  --> Azure       #0080ff
#                                 index 1  --> Blue        #0000ff
#                                 index 2  --> Brown       #964b00
#                                 index 3  --> Cyan        #00ffff
#                                 index 4  --> Green       #00ff00
#                                 index 5  --> Lime        #c0ff00
#                                 index 6  --> Magenta     #ff00ff
#                                 index 7  --> "Navy Blue" #000080
#                                 index 8  --> Orange      #ffa500
#                                 index 9  --> Pink        #ff0080
#                                 index 10 --> Purple      #800080
#                                 index 11 --> Red         #ff0000
#                                 index 12 --> Violet      #8000ff
#                                 index 13 --> Yellow      #ffff00
#
#                              If not provided or if provided as an empty string, defaults to the internal colornames list (the one in the example above).
#
# **-xscrollcommand**          Specifies a command prefix, used to communicate with horizontal scrollbars.
#                              When the view in the widget's window changes, the widget will generate a Tcl command by concatenating the
#                              scroll command and two numbers. Each of the numbers is a fraction between **0** and **1** indicating a position
#                              in the document; **0** indicates the beginning, and **1** indicates the end. The first fraction indicates the
#                              first information in the widget that is visible in the window, and the second fraction indicates the information
#                              just after the last portion that is visible.
#
#                              Typically the **-xscrollcommand** option consists of the path name of a scrollbar widget followed by **set**,
#                              e.g. **.x.scrollbar set**. This will cause the scrollbar to be updated whenever the view in the window changes.
#
#                              If this option is set to the empty string, then no command will be executed.
#
#                              Note that unless the **maxlength** value is **0** mustang will force this value to the empty string.
#
#                              If not provided, defaults to the empty string.
#
#                              See also **-maxlength**.
#
#### WIDGET COMMAND:
#
# The palette command creates a new command whose name is the same as the pathname of the palette's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the palette widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for palette widgets:
#
#   *window* **bbox** *index*
#     Returns a list of four numbers describing the bounding box of the character given by *index*.
#     The first two elements of the list give the **x** and **y** coordinates of the upper-left corner of the screen
#     area covered by the character (in pixels relative to the widget) and the last two elements give the width and height
#     of the character, in pixels.
#     The bounding box may refer to a region outside the visible area of the window.
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the palette command (See **WIDGET OPTIONS**).
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
#   *window* **current** ?*newIndex*?
#     If *newIndex* is supplied, sets the palette value to the element at position *newIndex* in the list of **-values** provided (in addition
#     to integers, the **end** index is supported and indicates the last element of the list, moreover the same simple interpretation as for the
#     command **string index** is supported, with simple integer index arithmetic and indexing relative to **end**).
#     Otherwise, returns the index of the current value in the list of **-values** provided or the empty string if the current value does not
#     appear in the list.
#
#     See the **-values** option for more information about indexes.
#
#   *window* **delete** *first* ?*last*?
#     Delete one or more elements of the palette. *First* is the index of the first character to delete, and *last* is the
#     index of the character just after the last one to delete. If *last* is not specified it defaults to *first*+1,
#     i.e. a single character is deleted.
#     This command returns the empty string.
#
#   *window* **get**
#     Returns the palette's string.
#
#   *window* **icursor** *index*
#     Arrange for the insert cursor to be displayed just before the character given by *index*.
#     Returns the empty string.
#
#   *window* **identify** **element** *x* *y*
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if the mouse pointer does
#     not lie within any element. *X* and *y* are pixel coordinates relative to the widget.
#
#   *window* **index** *index*
#     Returns the numerical index corresponding to *index*.
#
#   *window* **insert** *index* *string*
#     Insert *string* just before the character indicated by *index*.
#     This command is deprecated, please use the **set** command instead.
#     Returns the empty string.
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
#   *window* **selection** *option* *arg*
#     This command is used to adjust the selection within a palette. It has several forms, depending on option:
#
#       *window* **selection** **clear**
#         Clear the selection if it is currently in this widget.
#         If the selection is not in this widget then the command has no effect.
#         Returns the empty string.
#
#       *window* **selection** **present**
#         Returns **1** if there is are characters selected in the palette, **0** if nothing is selected.
#
#       *window* **selection** **range** *start* *end*
#         Sets the selection to include the characters starting with the one indexed by *start* and ending with the one
#         just before *end*.
#         If *end* refers to the same character as *start* or an earlier one, then the palette's selection is cleared.
#
#   *window* **set** *value*
#     Sets the value of the palette to *value*.
#     Returns the empty string.
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
#   *window* **validate**
#     Force revalidation.
#     Returns **0** if validation fails, **1** if it succeeds.
#     Sets or clears the invalid state accordingly.
#
#   *window* **xview** ?args?
#     *window* **xview**
#         Returns a list containing two elements.
#         Each element is a real fraction between **0** and **1.0**; together they describe the horizontal span
#         that is visible in the window.
#
#      *window* **xview** **moveto** *fraction*
#         Adjusts the view in the window so that *fraction* of the total width of the scrollable widget is off-screen to the left.
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
#### INDICES:
#
# Many of the palette widget commands take one or more indices as arguments.
# An index specifies a particular character in the palette's string, in any of the following ways:
#
#   **number**
#      Specifies the character as a numerical index, where **0** corresponds to the first character in the string.
#
#   **@number**
#      In this form, number is treated as an x-coordinate in the palette's window; the character spanning that
#      x-coordinate is used. For example, **@0** indicates the left-most character in the window.
#
#   **end**
#      Indicates the character just after the last one in the palette's string.
#      This is equivalent to specifying a numerical index equal to the length of the palette's string.
#
#   **insert**
#      Indicates the character adjacent to and immediately following the insert cursor.
#
#   **sel.first**
#      Indicates the first character in the selection.
#      It is an error to use this form if the selection is not in the palette window.
#
#   **sel.last**
#      Indicates the character just after the last one in the selection.
#      It is an error to use this form if the selection is not in the palette window.
#
# Abbreviations may be used for any of the forms above, e.g.  **e** or **sel.l**.
# In general, out-of-range indices are automatically rounded to the nearest legal value.
# Indexes support the same simple interpretation as for the command string index, with simple integer index arithmetic
# and indexing relative to end.
#
#### AUTOMATIC VALIDATIONS:
#
# As the entry widget, the palette performs automatic validation of the value inserted by the user (only alphanumeric characters plus
# the space and underline characters are allowed). But the palette widget goes further (due to the fixed list of values that can be
# inserted) and uses a so called *alphabetic inexact search*. This validation will search inside the list of values associated with
# the palette for the items that have the maximum consecutive characters in common with *value* and then, after sorted them out,
# chooses the first in alphabetical order.
#
# Note that the maximum consecutive characters will be counted from the start of the word and any items that do not start with the
# same character of *value* will be discarded and counted with having zero consecutive characters even if all the other characters matches
# the ones in the rest of value. If there are no matches, the first value of the colorname column or the last validated value will be used
# instead (depending if its a keypress validation or the final string validation).
#
# For example if we have the following list of values:
#
#   Azure       #0080ff
#   Blue        #0000ff
#   Brown       #964b00
#   Cyan        #00ffff
#   Green       #00ff00
#   Lime        #c0ff00
#   Magenta     #ff00ff
#   "Navy Blue" #000080
#   Orange      #ffa500
#   Pink        #ff0080
#   Purple      #800080
#   Red         #ff0000
#   Violet      #8000ff
#   Yellow      #ffff00
#
# The value *Daffodil* will be matched by the first value of the colorname column (*Azure* in this case) or by the last validated value.
# The value *P*        will be matched by *Pink*.
# The value *Pu*       will be matched by *Purple*.
# The value *Pur*      will be matched by *Purple*.
# The value *Purp*     will be matched by *Purple*.
# The value *Purpure*  will be matched by *Purple*.
# ... and so on and so forth ...
#
#### STATES:
#
# The palette widget supports the **disabled**, **readonly** and **normal** state.
#
# In the **disabled** state, no insert cursor is displayed, the text cannot be selected, the palette cannot be edited
# (specifically: the insert and delete commands have no effect) and the popdown window cannot be displayed.
#
# In the **readonly** state, no insert cursor is displayed, the text can be selected (depending on the theme), the palette
# cannot be edited (specifically: the insert and delete commands have no effect) and the popdown window can be used to
# change the widget textarea value.
#
# In the **normal** state, the insert cursor is displayed, the text can be selected, the palette can be edited and the
# popdown window can be also used to change the widget textarea value.
#
# Note that changes to the linked **-textvariable** will still be reflected in the palette, even if it is **disabled**.
#
#### STYLING OPTIONS:
#
# Default style name: **TPalette**
#
# An optional style **Popdown** is used to configure the popdown windows.
#
# Every palette styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# The following palette styling options are allowed only for themes that follows the **clam** engine (like the
# **Halo** theme) and ignored by any other engine:
#
#   **-bordercolor**
#   **-darkcolor**
#   **-lightcolor**
#
# The following palette styling options are allowed only for themes that do not follows the **clam** engine:
#
#   **-focuscolor**
#   **-focuswidth**
#
# The following **Popdown** options are supported and configurable with the [style](/wiki/commands/style.md) command:
#
#   **-background**
#   **-borderwidth**
#   **-cursor**
#   **-disabledforeground**
#   **-font**
#   **-foreground**
#   **-justify**
#   **-padding**
#   **-relief**
#   **-selectbackground**
#   **-selectborderwidth**
#   **-selectforeground**
#
# The following **Popdown** options are allowed only for themes that follows the **clam** engine (like the
# **Halo** theme) and ignored by any other engine:
#
#   **-bordercolor**
#   **-darkcolor**
#   **-lightcolor**
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the palettes in order to facilitate the developer work and
# augment the user experience at the same time.
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
# 1.  If the widget is in its **normal** or **readonly** state and the items list is not empty, **MouseWheel** events will scroll the
#     items list without displaying the popdown window, otherwise the event will try to find the innermost widget's scrollable parent
#     with an active vertical scrollbar and move that scrollbar by one unit up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 2.  If the widget is in its **normal** or **readonly** state and has the focus, the **Shift-MouseWheel** events will move the insert
#     cursor by one character towards the left or the right (depending on the direction of the mousewheel event), otherwise
#     the event will try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
#     by one unit left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 3.  **Control-MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar and
#     move that scrollbar by one page up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 4.  **Control-Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#     and move that scrollbar by one page left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad direction.
#
#        1 - View the **MouseWheel** event.
#        2 - View the **Shift-MouseWheel** event.
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
# The following behavior will happen if the widget has the focus. Mustang will try to find the innermost widget's scrollable parent
# with an active vertical/horizontal scrollbar and scroll that scrollbar.
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
###### POPDOWN WINDOW:
#
# The following behavior will happen if the mouse pointer is over the popdown window.
#
# 1.  **MouseWheel** events will scroll one unit towards the top or the bottom of the popdown window (depending on the direction of the
#     mousewheel event) and display the color relative to the selected row in the preview object.
#
# 2.  **Shift-MouseWheel** events will scroll one unit towards the left or the right of the popdown window (depending on the direction of
#     the mousewheel event).
#
# 3.  **Control-MouseWheel** events will scroll one page towards the top or the bottom of the popdown window (depending on the direction
#     of the mousewheel event) and display the color relative to the selected row in the preview object.
#
# 4.  **Control-Shift-MouseWheel** events will scroll one page towards the left or the right of the popdown window (depending on the
#     direction of the mousewheel event).
#
# 5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#
#        1 - **TouchpadScroll** events along the X axis will try will scroll the popdown window scrollbar one unit towards the left or
#            the right (depending on the direction of the touchpad event).
#
#        2 - **TouchpadScroll** events along the Y axis will try will scroll the popdown window scrollbar one unit towards the top or
#            the bottom (depending on the direction of the touchpad event) and display the color relative to the selected row in the
#            preview object.
#
# 6.  **Control-TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#
#        1 - **Control-TouchpadScroll** events along the X axis will try will scroll the popdown window scrollbar one page towards the
#            left or the right (depending on the direction of the touchpad event).
#
#        2 - **Control-TouchpadScroll** events along the Y axis will try will scroll the popdown window scrollbar one page towards the
#            top or the bottom (depending on the direction of the touchpad event) and display the color relative to the selected row
#            in the preview object.
#
# The following behavior will happen if the popdown window is currently displayed.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual machine
#       program used (Parallels, VirtualBox, VMWare...) and on the host and guest machines.
#
# 1.  - **Prior** --> Move the current selection one page towards the top of the popdown window list.
#     - **Next**  --> Move the current selection one page towards the bottom of the popdown window list.
#
#     In both cases the selected row will not be automatically picked up.
#
# 2.  - **Control-Prior** --> Move the current selection one page towards the right of the popdown window list.
#     - **Control-Next**  --> Move the current selection one page towards the left of the popdown window list.
#
#     In both cases the selected row will not be automatically picked up.
#
# 3.  - **Home** --> Move the current selection to the very first item of the popdown window list.
#     - **End**  --> Move the current selection to the very last item of the popdown window list.
#
#     In both cases the selected row will not be automatically picked up.
#
# 4.  - **Up**   --> Move the current selection by one row towards the top of the popdown window list.
#     - **Down** --> Move the current selection by one row towards the bottom of the popdown window list.
#
#     In both cases the selected row will not be automatically picked up.
#
# 5.  Hovering the mouse pointer over a row of the popdown window will select that row and display the color relative to that row
#     in the preview object.
#
# 6.  Pressing the left mouse button upon a selected row will cause the item of that row to be picked up, the color relative of that
#     row to be displayed in the preview object and the popdown window to be closed.
#     Analogously the 'Return' and 'space' keys will pick up the current selection, display the relative color in the preview object
#     and close the popdown window.
#
# 7.  The **Escape** key and any **ButtonPress** events outside of the popdown window, will close the popdown window without
#     picking up the selected row.
#
# 8.  The **Tab** key will close the popdown window without picking the selected row and switch the focus to the next focussable
#     widget. **Shift-Tab** will act like the **Tab** key but it will switch the focus to the previous focussable widget.
#
###### INTERNAL MECHANISM:
#
# The following behavior will happen if the mouse pointer is over the widget (no matter if it does or does not have the focus)
# and its state is normal.
#
# Note: In the descriptions below, **word** refers to a contiguous group of letters, digits, or "_" characters, or any single
#       character other than these.
#
# 1.  Clicking the left mouse button inside the widget textarea will put the insert cursor just before the character underneath
#     the mouse cursor, sets the input focus to this widget, and clears any selection in the widget.
#     Dragging with mouse **button 1** down strokes out a selection between the insert cursor and the character under the mouse.
#
#     Clicking the left mouse button upon the widget arrow will display the popdown window.
#
# 2.  Double-clicking with the left mouse button inside the widget textarea selects the word under the mouse and positions the
#     insert cursor at the end of the word. Dragging after a double click strokes out a selection consisting of whole words.
#
# 3.  Triple-clicking with the left mouse button inside the widget textarea selects all of the text in the widget textarea and
#     positions the insert cursor at the end of the line. The ends of the selection can be adjusted by dragging with left mouse
#     button while the **Shift** key is down. If the button is double-clicked before dragging then the selection will be adjusted
#     in units of whole words.
#
# 4.  Clicking the left mouse button inside the widget textarea with the **Control** key down will position the insert cursor in
#     the widget textarea without affecting the selection.
#
# 5.  If the mouse is dragged out of the widget textarea on the left or right sides while the left mouse button is pressed and
#     the datatype of the palette allows it, the widget textarea will automatically scroll to make more text visible (if there
#     is more text off-screen on the side where the mouse left the window).
#
# The following behavior will happen if the palette widget has the focus and its state is normal.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  If any alphanumeric characters (plus the space and underline character) are typed in an widget textarea, they are inserted at
#     the point of the insert cursor.
#
# 2.  The **Left** and **Right** keys move the insert cursor one character to the left or right; they also clear any selection in
#     the widget textarea. If **Shift-Left** or **Shift-Right** is typed then the insertion cursor moves and the selection is
#     extended to include the new character. **Control-Left** and **Control-Right** move the insert cursor by words, and
#     **Control-Shift-Left** and **Control-Shift-Right** move the insert cursor by words and also extend the selection.
#
# 3.  The **Down** key will display the popdown window, selects the closest match to the value of the widget textarea and displays
#     the relative color of that item in the preview object. If none are found, the first element of the list will be selected and
#     the relative color of that item will be displayed in the preview object.
#
# 4.  The **Home** key move the insert cursor to the beginning of the widget textarea and clears any previous selection.
#     **Shift-Home** moves the insert cursor to the beginning of the widget textarea and extends the selection to that point.
#
# 5.  The **End** key move the insert cursor to the end of the widget textarea and clears any previous selection.
#     **Shift-End** moves the cursor to the end and extends the selection to that point.
#
# 6.  **Control-a** (**Command-a** for macOS) selects all the text in the widget textarea.
#     **Control-Shift-a** (**Command-Shift-a** for macOS) clears any selection in the widget or does nothing if there isn't any.
#
# 7.  The standard Tk **Cut**, **Copy**, **Paste**, and **Clear** virtual events operate on the selection in the expected manner.
#
# 8.  The **Delete** key deletes the selection, if there is one in the widget textarea.
#     If there is no selection, it deletes the character to the right of the insertion cursor.
#     **Alt-d** (**Option-d** for macOS) deletes from the insertion cursor to the end of the widget textarea or does nothing if
#     the insertion cursor is already at the end of the widget textarea.
#
# 9.  The **BackSpace** key delete the selection, if there is one in the widget textarea.
#     If there is no selection, it deletes the character to the left of the insert cursor.
#
# 10. The **Escape** key clears any current value that is not yet validated and restore the last valid one.
#
# 11. The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the previous
#     focussable widget.
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
#   # Create a palette.
#   palette .palette -charwidth 15 \
#                      -command [list ::AfterValidate] \
#                     -datatype alnum \
#                    -maxlength 15 \
#                  -placeholder "Prova" \
#                     -posthook [list ::Posthook] \
#                      -prehook [list ::Prehook] \
#                         -rows 7 \
#                        -state normal \
#                        -style TCombobox;
#
#   # Pack the palette.
#   pack .palette -pady [list 20 10] -padx [list 50 50]
#
#   # Focus the first palette.
#   focus .palette
#
#   # After 3 seconds, change the accent color.
#   after 3000 [list set ::ms::accent purple]
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
#
#   proc ::AfterValidate { w value } {
#       chan puts "Validate $w --> $value"
#   }
#
#   proc ::Posthook { w } {
#       chan puts "$w --> Posthook procedure launched."
#   }
#
#   proc ::Prehook { w } {
#       chan puts "$w --> Prehook procedure launched."
#   }
package provide ::ms::palette 0.1

###############################
##                           ##
##     _PALETTE BINDINGS     ##
##                           ##
###############################

# Activate/Deactivate
_bind _Palette <Activate>   { ::ms::palette::Pathname_Cmd %W state !background; break }
_bind _Palette <Deactivate> { ::ms::palette::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Palette <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Palette <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Palette <Destroy> { ::ms::palette::Destroy %W; break }

# Enter
_bind _Palette <Enter> { ::ms::palette::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Palette <FocusIn>  { ::ms::palette::FocusIn  %W; break }
_bind _Palette <FocusOut> { ::ms::palette::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, don't do anything.
_bind _Palette <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, don't do anything.
_bind _Palette <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Palette <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Palette <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

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
_bind _Palette <TouchpadScroll> { ::ms::palette::Touchpad %W %# %D; break }

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
_bind _Palette <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **palette** package.
namespace eval ::ms::palette {
    # Set the 'non styleable' palette option list.
    set ::ms::palette(non_styleable,options) [list class \
                                                   cmenu \
                                                   command \
                                                   exportselection \
                                                   maxlength \
                                                   placeholder \
                                                   posthook \
                                                   prehook \
                                                   state \
                                                   style \
                                                   takefocus \
                                                   textvariable \
                                                   values \
                                                   xscrollcommand];

    # Set the 'styleable' palette option list.
    set ::ms::palette(styleable,options) [list arrowcolor \
                                               arrowsize \
                                               background \
                                               bordercolor \
                                               charwidth \
                                               cursor \
                                               darkcolor \
                                               fieldbackground \
                                               focuscolor \
                                               focuswidth \
                                               font \
                                               foreground \
                                               insertcolor \
                                               insertwidth \
                                               justify \
                                               lightcolor \
                                               padding \
                                               placeholderforeground \
                                               rows \
                                               selectbackground \
                                               selectborderwidth \
                                               selectforeground \
                                               shellbackground];

    # Set the default 'non-styleable' palette options values.
    set ::ms::default(palette,class)           TPalette
    set ::ms::default(palette,cmenu)           {}
    set ::ms::default(palette,command)         {}
    set ::ms::default(palette,exportselection) 1
    set ::ms::default(palette,maxlength)       0
    set ::ms::default(palette,placeholder)     {}
    set ::ms::default(palette,posthook)        {}
    set ::ms::default(palette,prehook)         {}
    set ::ms::default(palette,state)           normal
    set ::ms::default(palette,style)           TPalette
    set ::ms::default(palette,takefocus)       1
    set ::ms::default(palette,textvariable)    {}
    set ::ms::default(palette,values)          [list Azure       #0080ff \
                                                     Blue        #0000ff \
                                                     Brown       #964b00 \
                                                     Cyan        #00ffff \
                                                     Green       #00ff00 \
                                                     Lime        #c0ff00 \
                                                     Magenta     #ff00ff \
                                                     "Navy Blue" #000080 \
                                                     Orange      #ffa500 \
                                                     Pink        #ff0080 \
                                                     Purple      #800080 \
                                                     Red         #ff0000 \
                                                     Violet      #8000ff \
                                                     Yellow      #ffff00];
    set ::ms::default(palette,xscrollcommand)  {}
}

# Create aliases for the mustang **palette** command.
interp alias {} palette {} ::ms::palette::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Create the **palette** widgets command.
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
proc ::ms::palette::Command { window { args "" } } {
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
            set ::ms::default($w,class)           $::ms::default(palette,class)
            set ::ms::default($w,cmenu)           $::ms::default(palette,cmenu)
            set ::ms::default($w,command)         $::ms::default(palette,command)
            set ::ms::default($w,exportselection) $::ms::default(palette,exportselection)
            set ::ms::default($w,maxlength)       $::ms::default(palette,maxlength)
            set ::ms::default($w,placeholder)     $::ms::default(palette,placeholder)
            set ::ms::default($w,posthook)        $::ms::default(palette,posthook)
            set ::ms::default($w,prehook)         $::ms::default(palette,prehook)
            set ::ms::default($w,state)           $::ms::default(palette,state)
            set ::ms::default($w,style)           $::ms::default(palette,style)
            set ::ms::default($w,takefocus)       $::ms::default(palette,takefocus)
            set ::ms::default($w,textvariable)    $::ms::default(palette,textvariable)
            set ::ms::default($w,values)          $::ms::default(palette,values)
            set ::ms::default($w,xscrollcommand)  $::ms::default(palette,xscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)           $::ms::default(palette,class)
            set ::ms::current($w,cmenu)           $::ms::default(palette,cmenu)
            set ::ms::current($w,command)         $::ms::default(palette,command)
            set ::ms::current($w,exportselection) $::ms::default(palette,exportselection)
            set ::ms::current($w,maxlength)       $::ms::default(palette,maxlength)
            set ::ms::current($w,placeholder)     $::ms::default(palette,placeholder)
            set ::ms::current($w,posthook)        $::ms::default(palette,posthook)
            set ::ms::current($w,prehook)         $::ms::default(palette,prehook)
            set ::ms::current($w,state)           $::ms::default(palette,state)
            set ::ms::current($w,style)           $::ms::default(palette,style)
            set ::ms::current($w,takefocus)       $::ms::default(palette,takefocus)
            set ::ms::current($w,textvariable)    $::ms::default(palette,textvariable)
            set ::ms::current($w,values)          $::ms::default(palette,values)
            set ::ms::current($w,xscrollcommand)  $::ms::default(palette,xscrollcommand)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)    palette
            set ::ms::data($w,colornames)   [list ]
            set ::ms::data($w,hexadecimals) [list ]

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
            #       To make a palette styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **palette** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,arrowcolor)            Tk
            set ::ms::managed_by($w,arrowsize)             Tk
            set ::ms::managed_by($w,background)            Tk
            set ::ms::managed_by($w,bordercolor)           Tk
            set ::ms::managed_by($w,charwidth)             Tk
            set ::ms::managed_by($w,cursor)                Tk
            set ::ms::managed_by($w,darkcolor)             Tk
            set ::ms::managed_by($w,fieldbackground)       Tk
            set ::ms::managed_by($w,focuscolor)            Tk
            set ::ms::managed_by($w,focuswidth)            Tk
            set ::ms::managed_by($w,font)                  Tk
            set ::ms::managed_by($w,foreground)            Tk
            set ::ms::managed_by($w,insertcolor)           Tk
            set ::ms::managed_by($w,insertwidth)           Tk
            set ::ms::managed_by($w,justify)               Tk
            set ::ms::managed_by($w,lightcolor)            Tk
            set ::ms::managed_by($w,padding)               Tk
            set ::ms::managed_by($w,placeholderforeground) Tk
            set ::ms::managed_by($w,rows)                  Tk
            set ::ms::managed_by($w,selectbackground)      Tk
            set ::ms::managed_by($w,selectborderwidth)     Tk
            set ::ms::managed_by($w,selectforeground)      Tk
            set ::ms::managed_by($w,shellbackground)       Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -arrowcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,arrowcolor)    $value
                        set ::ms::managed_by($w,arrowcolor) developer
                    }
                    -arrowsize {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,arrowsize)    $value
                        set ::ms::managed_by($w,arrowsize) developer
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
                    -charwidth {
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,charwidth)    $value
                                set ::ms::managed_by($w,charwidth) developer
                            }
                        }
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
                    -fieldbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,fieldbackground)    $value
                        set ::ms::managed_by($w,fieldbackground) developer
                    }
                    -focuscolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,focuscolor)    $value
                        set ::ms::managed_by($w,focuscolor) developer
                    }
                    -focuswidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,focuswidth)    $value
                        set ::ms::managed_by($w,focuswidth) developer
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
                    -insertcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertcolor)    $value
                        set ::ms::managed_by($w,insertcolor) developer
                    }
                    -insertwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertwidth)    $value
                        set ::ms::managed_by($w,insertwidth) developer
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
                    -lightcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,lightcolor)    $value
                        set ::ms::managed_by($w,lightcolor) developer
                    }
                    -maxlength {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value >= 0 } {
                                    set ::ms::current($w,maxlength) $value
                                }
                            }
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
                    -placeholder { set ::ms::current($w,placeholder) $value }
                    -placeholderforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,placeholderforeground)    $value
                        set ::ms::managed_by($w,placeholderforeground) developer
                    }
                    -posthook { set ::ms::current($w,posthook) $value }
                    -prehook { set ::ms::current($w,prehook) $value }
                    -rows {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,rows)    $value
                                    set ::ms::managed_by($w,rows) developer
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
                            disabled -
                            readonly -
                            normal   { set ::ms::current($w,state) $value }
                        }
                    }
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TPalette' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TPalette]
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
                    -textvariable {
                        switch -- [info exists $value] {
                            1   {
                                set ::ms::current($w,textvariable) $value

                                # Set a trace in order to perform a validation (if needed) whenever the developer
                                # changes the value of the variable name provided.
                                trace add variable $value \
                                          write    [list ::ms::palette::Return $w]
                            }
                        }
                    }
                    -values { set ::ms::current($w,values) $value }
                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::palette(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TPalette,$option)

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
                readonly {
                    # Check the windowing system.
                    switch -- [_tk windowingsystem] {
                        aqua    { set cursor hand1 }
                        default { set cursor arrow }
                    }
                    set takefocus $::ms::current($w,takefocus)
                }
                normal {
                    set cursor    $::ms::current($w,cursor)
                    set takefocus $::ms::current($w,takefocus)
                }
            }

            # If the maxlength is not zero check that the charwidth is not less of it.
            switch -- $::ms::current($w,maxlength) {
                0       {}
                default {
                    if { $::ms::current($w,charwidth) < $::ms::current($w,maxlength) } {
                        set ::ms::current($w,charwidth) $::ms::current($w,maxlength)
                    }

                    # Ignore the xscrollcommand provided, if any.
                    set ::ms::current($w,xscrollcommand) {}
                }
            }

            # Check that the values provided forms a valid list of values (they must be divisible by two).
            set value_length [llength $::ms::current($w,values)]
            switch -- [expr { $value_length%2 }] {
                0   {
                    # Check if an empty list was provided.
                    switch -- $value_length {
                        0   {
                            set ::ms::current($w,values) $::ms::default(palette,values)

                            # Initialize the colornames and hexadecimal lists.
                            set ::ms::data($w,colornames)   [list ]
                            set ::ms::data($w,hexadecimals) [list ]

                            # Add the colorname and its hexadecimal value in their relative lists.
                            foreach { colorname hex } $values {
                                lappend ::ms::data($w,colornames)   $colorname
                                lappend ::ms::data($w,hexadecimals) $hex
                            }
                        }
                        default {
                            # Sort the values.
                            set values [lsort -dictionary -stride 2 -index 0 $::ms::current($w,values)]

                            # Initialize the colornames and hexadecimal lists.
                            set ::ms::data($w,colornames)   [list ]
                            set ::ms::data($w,hexadecimals) [list ]

                            # Check the value list.
                            foreach { colorname hex } $values {
                                # Check every character in colorname.
                                set i 0
                                while { $i < [string length $colorname] } {
                                    set char [string index $colorname $i]
                                    switch -- $char {
                                        " "     -
                                        "-"     {}
                                        default {
                                            switch -- [string is alnum $char] {
                                                0   { ::ms::Error "'$colorname' is not a valid colorname." $caller_info }
                                            }
                                        }
                                    }

                                    incr i
                                }

                                # Check the hexadecimal color value.
                                set hex [::ms::Check_Color $hex invalid]
                                switch -- $hex {
                                    invalid { ::ms::Error "'$hex' is not a valid hexadecimal color." $caller_info }
                                }

                                # Add the colorname and its hexadecimal value in their relative lists.
                                lappend ::ms::data($w,colornames)   $colorname
                                lappend ::ms::data($w,hexadecimals) $hex
                            }
                        }
                    }

                    # Set the current index as the first one of the colorname list.
                    set ::ms::data($w,current_index) 0

                    # Set the current colorname value.
                    set ::ms::data($w,current_value) [lindex $::ms::data($w,colornames) $::ms::data($w,current_index)]

                    # Set the current hexadecimal value.
                    set ::ms::data($w,current_hex) [lindex $::ms::data($w,hexadecimals) $::ms::data($w,current_index)]

                    # Set the last available index.
                    set ::ms::data($w,last_available_index) [expr { [llength $::ms::data($w,colornames)]-1 }]

                    # Set the lowercase '::ms::data($w,colornames)' list.
                    set ::ms::data($w,colornames,lowercase) [string tolower $::ms::data($w,colornames)]
                }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', insertwidth', 'justify',
            #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

            ##################
            ##              ##
            ##     HULL     ##
            ##              ##
            ##################

            # Set the hull object style.
            set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                 ".TFrame"];

            # If needed, create the hull object style.
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

            #######################
            ##                   ##
            ##     COMBOBOX      ##
            ##                   ##
            #######################

            # Agglomerate the padding values.
            set padding ""
            foreach pad $::ms::current($w,padding) {
                append padding "$pad" "-"
            }
            set padding [string trimright $padding "-"]

            # Set the widget style.
            set ::ms::style($w,widget) [string cat "_ac="  $::ms::current($w,arrowcolor) \
                                                   "_as="  $::ms::current($w,arrowsize) \
                                                   "_bg="  $::ms::current($w,background) \
                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                   "_fb="  $::ms::current($w,fieldbackground) \
                                                   "_fc="  $::ms::current($w,focuscolor) \
                                                   "_fg="  $::ms::current($w,foreground) \
                                                   "_fw="  $::ms::current($w,focuswidth) \
                                                   "_iw="  $::ms::current($w,insertwidth) \
                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                   "_pd="  $padding \
                                                   "_phf=" $::ms::current($w,placeholderforeground) \
                                                   "_sbg=" $::ms::current($w,selectbackground) \
                                                   "_sbd=" $::ms::current($w,selectborderwidth) \
                                                   "_sfg=" $::ms::current($w,selectforeground) \
                                                   "." $::ms::current($w,style)];

            # If needed, create the widget style.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)            -arrowcolor $::ms::current($w,arrowcolor) \
                                                                         -arrowsize $::ms::current($w,arrowsize) \
                                                                        -background $::ms::current($w,background) \
                                                                       -bordercolor $::ms::current($w,bordercolor) \
                                                                         -darkcolor $::ms::current($w,darkcolor) \
                                                                   -fieldbackground $::ms::current($w,fieldbackground) \
                                                                        -focuscolor $::ms::current($w,focuscolor) \
                                                                        -focuswidth $::ms::current($w,focuswidth) \
                                                                        -foreground $::ms::current($w,foreground) \
                                                                        -lightcolor $::ms::current($w,lightcolor) \
                                                                           -padding $::ms::current($w,padding) \
                                                             -placeholderforeground $::ms::current($w,placeholderforeground) \
                                                                  -selectbackground $::ms::current($w,selectbackground) \
                                                                  -selectforeground $::ms::current($w,selectforeground);

                # Add the widget object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
            }

            # Initialize the widget mapping.
            set mapping [list ]

            # arrowcolor
            switch -- $::ms::managed_by($w,arrowcolor) {
                developer { lappend mapping -arrowcolor [list pressed $::ms::current($w,arrowcolor)] }
                Tk  {
                    # Check if a 'arrowcolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor)] {
                        1   { lappend mapping -arrowcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor) }
                    }
                }
            }

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

            # fieldbackground
            switch -- $::ms::managed_by($w,fieldbackground) {
                developer { lappend mapping -fieldbackground [list pressed $::ms::current($w,fieldbackground)] }
                Tk  {
                    # Check if a 'fieldbackground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),fieldbackground)] {
                        1   { lappend mapping -fieldbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),fieldbackground) }
                    }
                }
            }

            # focuscolor
            switch -- $::ms::managed_by($w,focuscolor) {
                developer { lappend mapping -focuscolor [list pressed $::ms::current($w,focuscolor)] }
                Tk  {
                    # Check if a 'focuscolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),focuscolor)] {
                        1   { lappend mapping -focuscolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),focuscolor) }
                    }
                }
            }

            # foreground
            switch -- $::ms::managed_by($w,foreground) {
                developer { lappend mapping -foreground [list pressed $::ms::current($w,foreground)] }
                Tk  {
                    # Check if a 'foreground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),foreground)] {
                        1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$::ms::current($w,style),foreground) }
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

            # placeholderforeground
            switch -- $::ms::managed_by($w,placeholderforeground) {
                developer { lappend mapping -placeholderforeground [list pressed $::ms::current($w,placeholderforeground)] }
                Tk  {
                    # Check if a 'placeholderforeground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground)] {
                        1   { lappend mapping -placeholderforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground) }
                    }
                }
            }

            # selectbackground
            switch -- $::ms::managed_by($w,selectbackground) {
                developer { lappend mapping -selectbackground [list pressed $::ms::current($w,selectbackground)] }
                Tk  {
                    # Check if a 'selectbackground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground)] {
                        1   { lappend mapping -selectbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground) }
                    }
                }
            }

            # selectforeground
            switch -- $::ms::managed_by($w,selectforeground) {
                developer { lappend mapping -selectforeground [list pressed $::ms::current($w,selectforeground)] }
                Tk  {
                    # Check if a 'selectforeground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground)] {
                        1   { lappend mapping -selectforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground) }
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

            # Create the palette widget.
            _ttk_combobox $w.combobox           -class $::ms::current($w,class) \
                                               -cursor $cursor \
                                      -exportselection $::ms::current($w,exportselection) \
                                                 -font $::ms::current($w,font) \
                                       -invalidcommand {} \
                                               -height $::ms::current($w,rows) \
                                              -justify $::ms::current($w,justify) \
                                          -placeholder $::ms::current($w,placeholder) \
                                          -postcommand {} \
                                                 -show "" \
                                                -state $::ms::current($w,state) \
                                                -style $::ms::style($w,widget) \
                                            -takefocus $takefocus \
                                         -textvariable $::ms::current($w,textvariable) \
                                             -validate key \
                                      -validatecommand [list ::ms::palette::Validate_KeyPress $w %P] \
                                               -values $::ms::data($w,colornames) \
                                                -width $::ms::current($w,charwidth) \
                                       -xscrollcommand $::ms::current($w,xscrollcommand);

            # Set the current index in the combobox object.
            $w.combobox current $::ms::data($w,current_index)

            # Set the cursor at the end of the combobox textarea.
            $w.combobox icursor end

            # Pack the combobox object.
            pack $w.combobox -expand true \
                               -fill x \
                               -padx [list 0 3p] \
                               -pady 0 \
                               -side left;

            ######################
            ##                  ##
            ##     PREVIEW      ##
            ##                  ##
            ######################

            # Set the bordercolor of the preview object (black or white).
            switch -- [string length $::ms::data($w,current_hex)] {
                10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
                13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
                default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
            }

            # Create the preview object.
            _frame $w.preview          -background $::ms::data($w,current_hex) \
                                  -backgroundimage "" \
                                      -borderwidth 0 \
                                            -class Frame \
                                         -colormap "" \
                                        -container 0 \
                                           -cursor arrow \
                                           -height $::ms::styleopt($::ms::theme,Preview,height) \
                              -highlightbackground $bordercolor \
                                   -highlightcolor $bordercolor \
                               -highlightthickness $::ms::styleopt($::ms::theme,Preview,borderwidth) \
                                             -padx 0 \
                                             -pady 0 \
                                           -relief flat \
                                        -takefocus 0 \
                                             -tile 0 \
                                           -visual "" \
                                            -width $::ms::styleopt($::ms::theme,Preview,width);

            # Pack the preview object.
            pack $w.preview -expand false \
                              -fill none \
                              -padx [list 3p 0] \
                              -pady 0 \
                              -side left;

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TPalette { _bindtags $w [list $w _Palette TPalette $::ms::addr($w,toplevel) all] }
                default  { _bindtags $w [list $w $::ms::current($w,class) _Palette TPalette $::ms::addr($w,toplevel) all] }
            }

            # Buttonpress-1
            _bind $w.combobox <ButtonPress-1>        { ::ms::palette::ButtonPress [_winfo parent %W] %x %y "" ; break }
            _bind $w.combobox <Shift-ButtonPress-1>  { ::ms::palette::ButtonPress [_winfo parent %W] %x %y "s"; break }
            _bind $w.combobox <Double-ButtonPress-1> { ::ms::palette::ButtonPress [_winfo parent %W] %x %y "2"; break }
            _bind $w.combobox <Triple-ButtonPress-1> { ::ms::palette::ButtonPress [_winfo parent %W] %x %y "3"; break }
            _bind $w.combobox <B1-Motion>            { ::ms::Drag %W %x %y; break }

            _bind $w.preview  <ButtonPress-1>        { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }

            _bind $w.combobox <Button-2>         { ::ms::Scan_Or_Paste %W %x "Button-2"; break }
            _bind $w.combobox <B2-Motion>        { ::ms::Scan_Or_Paste %W %x "B2-Motion"; break }
            _bind $w.combobox <ButtonRelease-2>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-2"; break }

            _bind $w.combobox <Button-3>         { ::ms::Scan_Or_Paste %W %x "Button-3"; break }
            _bind $w.combobox <B3-Motion>        { ::ms::Scan_Or_Paste %W %x "B3-Motion"; break }
            _bind $w.combobox <ButtonRelease-3>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-3"; break }

            # Contextual menu
            _bind $w.combobox <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }
            _bind $w.preview  <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }

            # ClearCopy/Cut/Paste
            _bind $w.combobox <<Clear>> { ::ms::Clear [winfo parent %W]; break }
            _bind $w.combobox <<Copy>>  { ::ms::Copy  [winfo parent %W]; break }
            _bind $w.combobox <<Cut>>   { ::ms::Cut   [winfo parent %W]; break }
            _bind $w.combobox <<Paste>> { ::ms::Paste [winfo parent %W] CLIPBOARD; break }

            # Cursor management.
            _bind $w.combobox <Motion> { ::ms::Set_Cursor %W %x %y; break }

            # Enter/Leave
            _bind $w.combobox <Enter> { ::ms::palette::Pathname_Cmd [_winfo parent %W] state  hover; break }
            _bind $w.combobox <Leave> { ::ms::palette::Pathname_Cmd [_winfo parent %W] state !hover; break }

            # FocusIn/FocusOut
            _bind $w.combobox <FocusIn>  { ::ms::palette::FocusIn  [_winfo parent %W]; break }
            _bind $w.combobox <FocusOut> { ::ms::palette::FocusOut [_winfo parent %W]; break }

            # Enable only the keypress bindings that are needed and disable everything else.
            _bind $w.combobox <KeyPress> {
                switch -- %A {
                    Caps_Lock   -
                    KP_Subtract {}
                    default     {
                        if { ![regexp "\[0-9a-zA-Z \-\]" %A] } {
                            break
                        }
                    }
                }

                ::ttk::entry::Insert %W %A

                break
            }

            # Re-enable some keys.
            _bind $w.combobox <KeyPress-space>       { ::ttk::entry::Insert %W " "; break }
            _bind $w.combobox <KeyPress-Caps_Lock>   { # Enable binding }
            _bind $w.combobox <KeyPress-KP_Subtract> { ::ttk::entry::Insert %W "-"; break }

            # Insert cursor movements.
            _bind $w.combobox <<LineEnd>>   { ::ttk::entry::Move %W end; break }
            _bind $w.combobox <<LineStart>> { ::ttk::entry::Move %W home; break }
            _bind $w.combobox <<NextChar>>  { ::ttk::entry::Move %W nextchar; break }
            _bind $w.combobox <<NextLine>>  { ::ms::palette::Post [_winfo parent %W]; break }
            _bind $w.combobox <<NextWord>>  { ::ttk::entry::Move %W nextword; break }
            _bind $w.combobox <<PrevChar>>  { ::ttk::entry::Move %W prevchar; break }
            _bind $w.combobox <<PrevWord>>  { ::ttk::entry::Move %W prevword; break }

            _bind $w.combobox <<SelectLineEnd>>   { ::ttk::entry::Extend %W end; break }
            _bind $w.combobox <<SelectLineStart>> { ::ttk::entry::Extend %W home; break }
            _bind $w.combobox <<SelectNextChar>>  { ::ttk::entry::Extend %W nextchar; break }
            _bind $w.combobox <<SelectNextWord>>  { ::ttk::entry::Extend %W selectnextword; break }
            _bind $w.combobox <<SelectPrevChar>>  { ::ttk::entry::Extend %W prevchar; break }
            _bind $w.combobox <<SelectPrevWord>>  { ::ttk::entry::Extend %W prevword; break }

            _bind $w.combobox <<SelectAll>>  { %W selection range 0 end; break }
            _bind $w.combobox <<SelectNone>> { %W selection clear; break }

            # Backspace/Delete keys
            _bind $w.combobox <KeyPress-BackSpace> { ::ttk::entry::Backspace %W; break }
            _bind $w.combobox <KeyPress-Delete>    { ::ttk::entry::Delete %W; break }
            _bind $w.combobox <KeyPress-KP_Delete> { ::ttk::entry::Delete %W; break }

            # Escape
            _bind $w.combobox <KeyPress-Escape> { ::ms::Escape %W; break }

            # F keys
            _bind $w.combobox <Fn-KeyPress> { # Enable binding }

            # Return
            _bind $w.combobox <KeyPress-Return>   { ::ms::palette::Return [_winfo parent %W]; break }
            _bind $w.combobox <KeyPress-KP_Enter> { ::ms::palette::Return [_winfo parent %W]; break }

            # Tab/Shift-Tab keys
            _bind $w.combobox <KeyPress-Tab> { # Enable binding }
            switch -- [_tk windowingsystem] {
                x11 {
                    _bind $w.combobox <KeyPress-ISO_Left_Tab> { # Enable binding }

                    # This seems to be correct on *some* HP systems.
                    catch { _bind $w.combobox <KeyPress-hpBackTab> { # Enable binding } }
                }
                aqua  { _bind $w.combobox <KeyPress-ISO_Left_Tab> { # Enable binding } }
                win32 { _bind $w.combobox <Shift-KeyPress-Tab>    { # Enable binding } }
            }

            # Enabling window traversal navigation.
            _bind $w.combobox <<PageLeft>>  { # Enable binding }
            _bind $w.combobox <<PageRight>> { # Enable binding }
            _bind $w.combobox <<PageUp>>    { # Enable binding }
            _bind $w.combobox <<PageDown>>  { # Enable binding }

            # Allowing some modifiers combination.
            _bind $w.combobox <Alt-KeyPress>           { # Enable binding }
            _bind $w.combobox <Alt-Shift-KeyPress>     { # Enable binding }
            _bind $w.combobox <Control-KeyPress>       { # Enable binding }
            _bind $w.combobox <Control-Alt-KeyPress>   { # Enable binding }
            _bind $w.combobox <Control-Shift-KeyPress> { # Enable binding }
            _bind $w.combobox <Meta-KeyPress>          { # Enable binding }
            _bind $w.combobox <Meta-Shift-KeyPress>    { # Enable binding }

            # Note: At this point we have every keypress disabled except the ones allowed and the ones that were re-enabled.

            # Mousewheel and Touchpad

            # If the widget is in its **normal** or **readonly** state and the items list is not empty, scroll the items
            # list without displaying the popdown window, otherwise try to find the innermost widget's scrollable parent
            # with an active vertical scrollbar and move that scrollbar by one unit up or down (depending on the
            # mousewheel direction). If none of the widget's parents meets the required condition, nothing will happen.
            _bind $w.combobox <MouseWheel> [list ::ms::palette::MouseWheel $w %D]

            # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
            # If none of the widget's parents meets the required condition, don't do anything.
            _bind $w.preview <MouseWheel> [list ::ms::Scroll_Parent_Y $w %D units]

            # If the widget is in its **normal** state and has the focus, move the insert cursor by one character
            # towards the left or the right (depending on the direction of the mousewheel event), otherwise try to
            # find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
            # by one unit left or right (again, depending on the mousewheel direction).
            # If none of the widget's parents meets the required condition, nothing will happen.
            _bind $w.combobox <Shift-MouseWheel> [list ::ms::palette::Shift_MouseWheel $w %D]

            # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
            # If none of the widget's parents meets the required condition, don't do anything.
            _bind $w.preview <Shift-MouseWheel> [list ::ms::Scroll_Parent_X $w %D units]

            # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one page up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.combobox <Control-MouseWheel> [list ::ms::Scroll_Parent_Y $w %D pages]
            _bind $w.preview  <Control-MouseWheel> [list ::ms::Scroll_Parent_Y $w %D pages]

            # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one page left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.combobox <Control-Shift-MouseWheel> [list ::ms::Scroll_Parent_X $w %D pages]
            _bind $w.preview  <Control-Shift-MouseWheel> [list ::ms::Scroll_Parent_X $w %D pages]

            # Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
            #       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

            # This binding movement will happen on two different planes, horizontal and vertical.
            # These two planes may involve different widgets depending on the active scrollbars on them and on the
            # touchpad direction.
            #   1 - View the '$w.combobox' **Mousewheel** event.
            #   2 - View the '$w.combobox' **Shift-Mousewheel** event.
            _bind $w.combobox <TouchpadScroll> [list ::ms::palette::Touchpad $w %# %D]

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
            _bind $w.preview <TouchpadScroll> [list ::ms::palette::Touchpad $w %# %D]

            # This binding movement will happen on two different planes, horizontal and vertical.
            # These two planes may involve different widgets depending on the active scrollbars on them and on the
            # touchpad direction.
            #   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            #       and move that scrollbar by one page left or right (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
            #
            #   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            #       and move that scrollbar by one page up or down (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
            _bind $w.combobox <Control-TouchpadScroll> [list ::ms::Touchpad_Parent $w %# %D pages]
            _bind $w.preview  <Control-TouchpadScroll> [list ::ms::Touchpad_Parent $w %# %D pages]

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::palette::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::palette::Pathname_Cmd $w]
            }

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w.combobox

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w.combobox

            # Set the structure addresses.
            set ::ms::addr($w,structure) [list $w \
                                               $w.preview \
                                               $w.combobox];

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short addresses relative to its real address, 'w'.
            # They will all point to the widget hull object short address.
            set ::ms::addr($w,short)          $short_addr
            set ::ms::addr($w.preview,short)  $short_addr
            set ::ms::addr($w.combobox,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals) $w \
                                      $w.preview \
                                      $w.combobox;

            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the palette widgets real address list.
            lappend ::ms::addr(palette) $w

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w.combobox

            # Add the widget address to the palette classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),palette,addrs) $w

            # Add the widget address to the palette classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),palette,addrs) $w

            # Add the widget address to the megawidget addresses list.
            lappend ::ms::addr(megawidgets) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the palette classtype.
            if { $::ms::current($w,style) ni $::ms::style(palette,classtype) } {
                lappend ::ms::style(palette,classtype) $::ms::current($w,style)
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
proc ::ms::palette::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        bbox    -
        icursor -
        index   {
            # Synopsis:
            #
            # *window* **bbox** *index*
            # *window* **icursor** *index*
            # *window* **index** *index*
            switch -- [llength $args] {
                1   {
                    try {
                        $w.combobox $cmd $args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
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
                    if { ($option in $::ms::palette(non_styleable,options)) || ($option in $::ms::palette(styleable,options)) } {
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
                    foreach option $::ms::palette(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::palette(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::palette(non_styleable,options)) || ($option in $::ms::palette(styleable,options)) } {
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

                            # Set a variable that indicates if new valid list of values have been provided or not.
                            set new_values false

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the widget options provided.
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -arrowcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,arrowcolor)    $value
                                        set ::ms::managed_by($w,arrowcolor) developer
                                    }
                                    -arrowsize {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,arrowsize)    $value
                                        set ::ms::managed_by($w,arrowsize) developer
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
                                    -charwidth {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                set ::ms::current($w,charwidth)    $value
                                                set ::ms::managed_by($w,charwidth) developer
                                            }
                                        }
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
                                    -fieldbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,fieldbackground)    $value
                                        set ::ms::managed_by($w,fieldbackground) developer
                                    }
                                    -focuscolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,focuscolor)    $value
                                        set ::ms::managed_by($w,focuscolor) developer
                                    }
                                    -focuswidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,focuswidth)    $value
                                        set ::ms::managed_by($w,focuswidth) developer
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
                                    -insertcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,insertcolor)    $value
                                        set ::ms::managed_by($w,insertcolor) developer
                                    }
                                    -insertwidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,insertwidth)    $value
                                        set ::ms::managed_by($w,insertwidth) developer
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
                                    -lightcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,lightcolor)    $value
                                        set ::ms::managed_by($w,lightcolor) developer
                                    }
                                    -maxlength {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value >= 0 } {
                                                    set ::ms::current($w,maxlength) $value
                                                }
                                            }
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
                                    -placeholder { set ::ms::current($w,placeholder) $value }
                                    -placeholderforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,placeholderforeground)    $value
                                        set ::ms::managed_by($w,placeholderforeground) developer
                                    }
                                    -posthook { set ::ms::current($w,posthook) $value }
                                    -prehook { set ::ms::current($w,prehook) $value }
                                    -rows {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value > 0 } {
                                                    set ::ms::current($w,rows)    $value
                                                    set ::ms::managed_by($w,rows) developer
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
                                            disabled -
                                            readonly -
                                            normal   { set ::ms::current($w,state) $value }
                                        }
                                    }
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Check if exists a layout for the style provided.
                                            # If not, create one by mirroring the current theme 'TPalette' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TPalette]
                                            }

                                            # Remove the widget address from the palette classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),palette,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),palette,addrs) [lremove $::ms::style($::ms::current($w,style),palette,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,palette,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the palette classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),palette,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(palette,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(palette,classtype) [lremove $::ms::style(palette,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the palette classtype.
                                            if { $value ni $::ms::style(palette,classtype) } {
                                                lappend ::ms::style(palette,classtype) $value
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
                                    -textvariable {
                                        switch -- [info exists $value] {
                                            1   {
                                                # Remove the previous trace, if any.
                                                switch -- $::ms::current($w,textvariable) {
                                                    ""      {}
                                                    default {
                                                        trace remove variable $::ms::current($w,textvariable) \
                                                                     write    [list ::ms::palette::Return $w];
                                                    }
                                                }

                                                # Set the new current textvariable.
                                                set ::ms::current($w,textvariable) $value

                                                # Set a trace in order to perform a validation (if needed) whenever the developer
                                                # changes the value of the variable name provided.
                                                trace add variable $value \
                                                          write    [list ::ms::palette::Return $w];
                                            }
                                        }
                                    }
                                    -values {
                                        switch -- [llength $value] {
                                            0       { ::ms::Error "An empty list of values was assigned to '$w'." $caller_info }
                                            default {
                                                # Check that the values provided forms a valid list of values (they must be divisible by two).
                                                set value_length [llength $value]
                                                switch -- [expr { $value_length%2 }] {
                                                    0   {
                                                        # Set the new current list of values.
                                                        set ::ms::current($w,values) $value

                                                        # Sort the values.
                                                        set values [lsort -dictionary -stride 2 -index 0 $::ms::current($w,values)]

                                                        # Initialize the colornames and hexadecimal lists.
                                                        set ::ms::data($w,colornames)   [list ]
                                                        set ::ms::data($w,hexadecimals) [list ]

                                                        # Check the value list.
                                                        foreach { colorname hex } $values {
                                                            # Check every character in colorname.
                                                            set i 0
                                                            while { $i < [string length $colorname] } {
                                                                set char [string index $colorname $i]
                                                                switch -- $char {
                                                                    " "     -
                                                                    "-"     {}
                                                                    default {
                                                                        switch -- [string is alnum $char] {
                                                                            0   { ::ms::Error "'$colorname' is not a valid colorname." $caller_info }
                                                                        }
                                                                    }
                                                                }

                                                                incr i
                                                            }

                                                            # Check the hexadecimal color value.
                                                            set hex [::ms::Check_Color $hex invalid]
                                                            switch -- $hex {
                                                                invalid { ::ms::Error "'$hex' is not a valid hexadecimal color." $caller_info }
                                                            }

                                                            # Add the colorname and its hexadecimal value in their relative lists.
                                                            lappend ::ms::data($w,colornames)   $colorname
                                                            lappend ::ms::data($w,hexadecimals) $hex
                                                        }

                                                        # Set the current index as the first one of the colorname list.
                                                        set ::ms::data($w,current_index) 0

                                                        # Set the current colorname value.
                                                        set ::ms::data($w,current_value) [lindex $::ms::data($w,colornames) $::ms::data($w,current_index)]

                                                        # Set the current hexadecimal value.
                                                        set ::ms::data($w,current_hex) [lindex $::ms::data($w,hexadecimals) $::ms::data($w,current_index)]

                                                        # Set the last available index.
                                                        set ::ms::data($w,last_available_index) [expr { [llength $::ms::data($w,colornames)]-1 }]

                                                        # Set the lowercase '::ms::data($w,colornames)' list.
                                                        set ::ms::data($w,colornames,lowercase) [string tolower $::ms::data($w,colornames)]

                                                        # Register the fact that a new valid list of values was provided.
                                                        set new_values true
                                                    }
                                                    default { ::ms::Error "An invalid list of values was assigned to '$w', '$value'." $caller_info }
                                                }
                                            }
                                        }
                                    }
                                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TPalette,$option)

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
                                readonly {
                                    # Check the windowing system.
                                    switch -- [_tk windowingsystem] {
                                        aqua    { set cursor hand1 }
                                        default { set cursor arrow }
                                    }
                                    set takefocus $::ms::current($w,takefocus)
                                }
                                normal {
                                    set cursor    $::ms::current($w,cursor)
                                    set takefocus $::ms::current($w,takefocus)
                                }
                            }

                            # If the maxlength is not zero check that the charwidth is not less of it.
                            switch -- $::ms::current($w,maxlength) {
                                0       {}
                                default {
                                    if { $::ms::current($w,charwidth) < $::ms::current($w,maxlength) } {
                                        set ::ms::current($w,charwidth) $::ms::current($w,maxlength)
                                    }

                                    # Ignore the xscrollcommand provided, if any.
                                    set ::ms::current($w,xscrollcommand) {}
                                }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', insertwidth', 'justify',
                            #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

                            ##################
                            ##              ##
                            ##     HULL     ##
                            ##              ##
                            ##################

                            # Set the hull object style.
                            set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                                 ".TFrame"];

                            # If needed, create the hull object style.
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

                            #######################
                            ##                   ##
                            ##     COMBOBOX      ##
                            ##                   ##
                            #######################

                            # Agglomerate the padding values.
                            set padding ""
                            foreach pad $::ms::current($w,padding) {
                                append padding "$pad" "-"
                            }
                            set padding [string trimright $padding "-"]

                            # Set the combobox object style name.
                            set ::ms::style($w,widget) [string cat "_ac="  $::ms::current($w,arrowcolor) \
                                                                   "_as="  $::ms::current($w,arrowsize) \
                                                                   "_bg="  $::ms::current($w,background) \
                                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                                   "_fb="  $::ms::current($w,fieldbackground) \
                                                                   "_fc="  $::ms::current($w,focuscolor) \
                                                                   "_fg="  $::ms::current($w,foreground) \
                                                                   "_fw="  $::ms::current($w,focuswidth) \
                                                                   "_iw="  $::ms::current($w,insertwidth) \
                                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                                   "_pd="  $padding \
                                                                   "_phf=" $::ms::current($w,placeholderforeground) \
                                                                   "_sbg=" $::ms::current($w,selectbackground) \
                                                                   "_sbd=" $::ms::current($w,selectborderwidth) \
                                                                   "_sfg=" $::ms::current($w,selectforeground) \
                                                                   "." $::ms::current($w,style)];

                            # If needed, create the combobox object style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)            -arrowcolor $::ms::current($w,arrowcolor) \
                                                                                         -arrowsize $::ms::current($w,arrowsize) \
                                                                                        -background $::ms::current($w,background) \
                                                                                       -bordercolor $::ms::current($w,bordercolor) \
                                                                                         -darkcolor $::ms::current($w,darkcolor) \
                                                                                   -fieldbackground $::ms::current($w,fieldbackground) \
                                                                                        -focuscolor $::ms::current($w,focuscolor) \
                                                                                        -focuswidth $::ms::current($w,focuswidth) \
                                                                                        -foreground $::ms::current($w,foreground) \
                                                                                        -lightcolor $::ms::current($w,lightcolor) \
                                                                                           -padding $::ms::current($w,padding) \
                                                                             -placeholderforeground $::ms::current($w,placeholderforeground) \
                                                                                  -selectbackground $::ms::current($w,selectbackground) \
                                                                                  -selectforeground $::ms::current($w,selectforeground);

                                # Add the widget object style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
                            }

                            # Initialize the combobox object mapping.
                            set mapping [list ]

                            # arrowcolor
                            switch -- $::ms::managed_by($w,arrowcolor) {
                                developer { lappend mapping -arrowcolor [list pressed $::ms::current($w,arrowcolor)] }
                                Tk  {
                                    # Check if a 'arrowcolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor)] {
                                        1   { lappend mapping -arrowcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor) }
                                    }
                                }
                            }

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

                            # fieldbackground
                            switch -- $::ms::managed_by($w,fieldbackground) {
                                developer { lappend mapping -fieldbackground [list pressed $::ms::current($w,fieldbackground)] }
                                Tk  {
                                    # Check if a 'fieldbackground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),fieldbackground)] {
                                        1   { lappend mapping -fieldbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),fieldbackground) }
                                    }
                                }
                            }

                            # focuscolor
                            switch -- $::ms::managed_by($w,focuscolor) {
                                developer { lappend mapping -focuscolor [list pressed $::ms::current($w,focuscolor)] }
                                Tk  {
                                    # Check if a 'focuscolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),focuscolor)] {
                                        1   { lappend mapping -focuscolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),focuscolor) }
                                    }
                                }
                            }

                            # foreground
                            switch -- $::ms::managed_by($w,foreground) {
                                developer { lappend mapping -foreground [list pressed $::ms::current($w,foreground)] }
                                Tk  {
                                    # Check if a 'foreground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),foreground)] {
                                        1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$::ms::current($w,style),foreground) }
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

                            # placeholderforeground
                            switch -- $::ms::managed_by($w,placeholderforeground) {
                                developer { lappend mapping -placeholderforeground [list pressed $::ms::current($w,placeholderforeground)] }
                                Tk  {
                                    # Check if a 'placeholderforeground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground)] {
                                        1   { lappend mapping -placeholderforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground) }
                                    }
                                }
                            }

                            # selectbackground
                            switch -- $::ms::managed_by($w,selectbackground) {
                                developer { lappend mapping -selectbackground [list pressed $::ms::current($w,selectbackground)] }
                                Tk  {
                                    # Check if a 'selectbackground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground)] {
                                        1   { lappend mapping -selectbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground) }
                                    }
                                }
                            }

                            # selectforeground
                            switch -- $::ms::managed_by($w,selectforeground) {
                                developer { lappend mapping -selectforeground [list pressed $::ms::current($w,selectforeground)] }
                                Tk  {
                                    # Check if a 'selectforeground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground)] {
                                        1   { lappend mapping -selectforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground) }
                                    }
                                }
                            }

                            # If needed, create the combobox object mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,widget) {*}$mapping

                                # Add the combobox object mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            $w.combobox configure          -cursor $cursor \
                                                  -exportselection $::ms::current($w,exportselection) \
                                                             -font $::ms::current($w,font) \
                                                          -justify $::ms::current($w,justify) \
                                                      -placeholder $::ms::current($w,placeholder) \
                                                            -state $::ms::current($w,state) \
                                                            -style $::ms::style($w,widget) \
                                                        -takefocus $takefocus \
                                                     -textvariable $::ms::current($w,textvariable) \
                                                           -values $::ms::data($w,colornames) \
                                                            -width $::ms::current($w,charwidth) \
                                                   -xscrollcommand $::ms::current($w,xscrollcommand);

                            ######################
                            ##                  ##
                            ##     PREVIEW      ##
                            ##                  ##
                            ######################

                            # Check if a new list of values was provided.
                            switch -- $new_values {
                                true {
                                    # Apply the changes to the combobox object.
                                    $w.combobox current $::ms::data($w,current_index)

                                    # Set the bordercolor of the preview object (black or white).
                                    switch -- [string length $::ms::data($w,current_hex)] {
                                        10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
                                        13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
                                        default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
                                    }

                                    # Apply the changes to the preview object.
                                    $w.preview configure          -background $::ms::data($w,current_hex) \
                                                         -highlightbackground $bordercolor \
                                                              -highlightcolor $bordercolor;
                                }
                            }

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        current {
            # Synopsis:
            #
            # *window* **current** ?newIndex?
            switch -- [llength $args] {
                0   {
                    # Find the value in '::ms::data($w,colornames)' that corrisponds to the current index
                    # displayed in the palette entry.
                    set value [lindex $::ms::data($w,colornames) $::ms::data($w,current_index)]

                    # Return the index equivalent to '::ms::data($w,current_index)' in '::ms::current($w,values)'.
                    return [lsearch -exact $::ms::current($w,values) $value]
                }
                1   {
                    # Check that the argument provided is an integer.
                    switch -- [string is integer $args] {
                        0   { ::ms::Error "The argument provided is not an index, '$args'" $caller_info }
                    }

                    # Find the index in '::ms::data($w,colornames)' that corrisponds to the index provided
                    # for '::ms::current($w,values)'.
                    set value [lindex $::ms::current($w,values) $args]
                    switch -- $value {
                        ""      {}
                        default {
                            # Get the new index.
                            set index [lsearch -exact -nocase $::ms::data($w,colornames) $value]

                            # Update the current index, value and preview color.
                            set ::ms::data($w,current_index) $index
                            set ::ms::data($w,current_value) $value
                            set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $index]

                            # Apply the changes to the combobox object.
                            $w.combobox current $index

                            # Set the bordercolor of the preview object (black or white).
                            switch -- [string length $::ms::data($w,current_hex)] {
                                10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
                                13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
                                default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
                            }

                            # Apply the changes to the preview object.
                            $w.preview configure          -background $::ms::data($w,current_hex) \
                                                 -highlightbackground $bordercolor \
                                                      -highlightcolor $bordercolor;
                        }
                    }

                    return ""
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        delete    -
        selection {
            # Synopsis:
            #
            # *window* **delete** *first* ?*last*?
            # *window* **selection** *option* *arg*
            #    *window* **selection** **clear**
            #    *window* **selection** **present**
            #    *window* **selection** **range** *start* *end*
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    try {
                        $w.combobox $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
            }
        }
        get      -
        validate {
            # Synopsis:
            #
            # *window* **get**
            # *window* **validate**
            return [$w.combobox $cmd]
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

                    # Return the name of the object, or an empty string if there are no canvas objects at the coordinates provided.
                    if { $widget eq $w } {
                        return "Palette.hull"
                    } elseif { $widget eq "$w.preview" } {
                        return "Palette.preview"
                    } elseif { $widget eq "$w.combobox" } {
                        try {
                            interp invokehidden {} $w identify element $x $y
                        } on error { errortext errorcode } {
                            ::ms::Error "$errortext" $caller_info
                        } on ok { result } {
                            switch -nocase -- $result {
                                textarea { return "Palette.textarea"  }
                                default  { return "Palette.downarrow" }
                            }
                        }
                    } else {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        insert {
            # Synopsis:
            #
            # *window* **insert** *index* *string*
            switch -- $::DEBUG {
                1       -
                on      -
                true    -
                active  -
                enabled { chan puts stdout "'insert' is a deprecated mustang palette command. Use 'set' instead." }
            }

            # Check the widget state.
            switch -- $::ms::current($w,state) {
                normal {
                    # Check the number of arguments provided.
                    switch -- [llength $args] {
                        2   {
                            set index  [lindex $args 0]
                            set string [lindex $args 1]

                            try {
                                interp invokehidden {} $w.combobox insert $index $string
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }

            return ""
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

                    try {
                        $w.combobox instate $statespec
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

                    try {
                        $w.combobox instate $statespec $script
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        set {
            # Synopsis:
            #
            # *window* **set** *value*
            switch -- [llength $args] {
                1   {
                    # Check that the value provided exists inside the '::ms::data($w,colornames)' list.
                    set index [lsearch -exact -nocase $::ms::data($w,colornames) $args]
                    switch -- $index {
                        -1      {}
                        default {
                            # Update the current index, value and preview color.
                            set ::ms::data($w,current_index) $index
                            set ::ms::data($w,current_value) [lindex $::ms::data($w,colornames)   $index]
                            set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $index]

                            # Apply the changes to the combobox object.
                            $w.combobox current $index

                            # Set the bordercolor of the preview object (black or white).
                            switch -- [string length $::ms::data($w,current_hex)] {
                                10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
                                13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
                                default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
                            }

                            # Apply the changes to the preview object.
                            $w.preview configure          -background $::ms::data($w,current_hex) \
                                                 -highlightbackground $bordercolor \
                                                      -highlightcolor $bordercolor;
                        }
                    }

                    return ""
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        state {
            # Synopsis:
            #
            # *window* **state** ?*statespec*?
            switch -- [llength $args] {
                0   { return [$w.combobox state] }
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

                    return [$w.combobox state $statespec]
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
            # *window* **xview** *option* *args*
            #    *window* **xview**
            #    *window* **xview** *index*
            #    *window* **xview** **moveto** *fraction*
            #    *window* **xview** **scroll** *number* *what*
            switch -- [llength $args] {
                0   { return [$w.combobox xview] }
                1   -
                2   -
                3   {
                    try {
                        $w.combobox $cmd {*}$args
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
# Update any palette widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::palette::Style_Update { stylename caller_info } {
    # Check the stylename charwidth, if any.
    set index [lsearch -exact $::ms::styleopt($::ms::theme,$stylename) "-charwidth"]
    switch -- $index {
        -1      {}
        default {
            if { $::ms::styleopt($::ms::theme,$stylename,charwidth) <= 0 } {
                # Update the stylename charwidth option for the current theme.
                set ::ms::styleopt($::ms::theme,$stylename)           [lreplace $::ms::styleopt($::ms::theme,$stylename) $index+1 $index+1 8]
                set ::ms::styleopt($::ms::theme,$stylename,charwidth) 8
            }
        }
    }

    # Update all the palette widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,palette,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::palette(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TPalette,$option)

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
            readonly {
                # Check the windowing system.
                switch -- [_tk windowingsystem] {
                    aqua    { set cursor hand1 }
                    default { set cursor arrow }
                }
            }
            normal { set cursor $::ms::current($w,cursor) }
        }

        # If the maxlength is not zero check that the charwidth is not less of it.
        switch -- $::ms::current($w,maxlength) {
            0       {}
            default {
                if { $::ms::current($w,charwidth) < $::ms::current($w,maxlength) } {
                    set ::ms::current($w,charwidth) $::ms::current($w,maxlength)
                }
            }
        }

        #######################################
        ##                                   ##
        ##     UPDATE THE WIDGET'S STYLE     ##
        ##                                   ##
        #######################################

        # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', insertwidth', 'justify',
        #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

        ##################
        ##              ##
        ##     HULL     ##
        ##              ##
        ##################

        # Set the hull object style.
        set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                             ".TFrame"];

        # If needed, create the hull object style.
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

        #######################
        ##                   ##
        ##     COMBOBOX      ##
        ##                   ##
        #######################

        # If the palette popdown is currently displayed, release the grab.
        switch -- [winfo exists $w.popdown] {
            1   { set ::wait_for_user_response "Unpost" }
        }

        # Agglomerate the padding values.
        set padding ""
        foreach pad $::ms::current($w,padding) {
            append padding "$pad" "-"
        }
        set padding [string trimright $padding "-"]

        # Set the widget style.
        set ::ms::style($w,widget) [string cat "_ac="  $::ms::current($w,arrowcolor) \
                                               "_as="  $::ms::current($w,arrowsize) \
                                               "_bg="  $::ms::current($w,background) \
                                               "_bc="  $::ms::current($w,bordercolor) \
                                               "_dc="  $::ms::current($w,darkcolor) \
                                               "_fb="  $::ms::current($w,fieldbackground) \
                                               "_fc="  $::ms::current($w,focuscolor) \
                                               "_fg="  $::ms::current($w,foreground) \
                                               "_fw="  $::ms::current($w,focuswidth) \
                                               "_iw="  $::ms::current($w,insertwidth) \
                                               "_lc="  $::ms::current($w,lightcolor) \
                                               "_pd="  $padding \
                                               "_phf=" $::ms::current($w,placeholderforeground) \
                                               "_sbg=" $::ms::current($w,selectbackground) \
                                               "_sbd=" $::ms::current($w,selectborderwidth) \
                                               "_sfg=" $::ms::current($w,selectforeground) \
                                               "." $::ms::current($w,style)];

        # If needed, create the widget style.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)            -arrowcolor $::ms::current($w,arrowcolor) \
                                                                     -arrowsize $::ms::current($w,arrowsize) \
                                                                    -background $::ms::current($w,background) \
                                                                   -bordercolor $::ms::current($w,bordercolor) \
                                                                     -darkcolor $::ms::current($w,darkcolor) \
                                                               -fieldbackground $::ms::current($w,fieldbackground) \
                                                                    -focuscolor $::ms::current($w,focuscolor) \
                                                                    -focuswidth $::ms::current($w,focuswidth) \
                                                                    -foreground $::ms::current($w,foreground) \
                                                                    -lightcolor $::ms::current($w,lightcolor) \
                                                                       -padding $::ms::current($w,padding) \
                                                         -placeholderforeground $::ms::current($w,placeholderforeground) \
                                                              -selectbackground $::ms::current($w,selectbackground) \
                                                              -selectforeground $::ms::current($w,selectforeground);

            # Add the widget object style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
        }

        # Initialize the widget mapping.
        set mapping [list ]

        # arrowcolor
        switch -- $::ms::managed_by($w,arrowcolor) {
            developer { lappend mapping -arrowcolor [list pressed $::ms::current($w,arrowcolor)] }
            Tk  {
                # Check if a 'arrowcolor' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor)] {
                    1   { lappend mapping -arrowcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor) }
                }
            }
        }

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

        # fieldbackground
        switch -- $::ms::managed_by($w,fieldbackground) {
            developer { lappend mapping -fieldbackground [list pressed $::ms::current($w,fieldbackground)] }
            Tk  {
                # Check if a 'fieldbackground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),fieldbackground)] {
                    1   { lappend mapping -fieldbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),fieldbackground) }
                }
            }
        }

        # focuscolor
        switch -- $::ms::managed_by($w,focuscolor) {
            developer { lappend mapping -focuscolor [list pressed $::ms::current($w,focuscolor)] }
            Tk  {
                # Check if a 'focuscolor' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),focuscolor)] {
                    1   { lappend mapping -focuscolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),focuscolor) }
                }
            }
        }

        # foreground
        switch -- $::ms::managed_by($w,foreground) {
            developer { lappend mapping -foreground [list pressed $::ms::current($w,foreground)] }
            Tk  {
                # Check if a 'foreground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),foreground)] {
                    1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$::ms::current($w,style),foreground) }
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

        # placeholderforeground
        switch -- $::ms::managed_by($w,placeholderforeground) {
            developer { lappend mapping -placeholderforeground [list pressed $::ms::current($w,placeholderforeground)] }
            Tk  {
                # Check if a 'placeholderforeground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground)] {
                    1   { lappend mapping -placeholderforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground) }
                }
            }
        }

        # selectbackground
        switch -- $::ms::managed_by($w,selectbackground) {
            developer { lappend mapping -selectbackground [list pressed $::ms::current($w,selectbackground)] }
            Tk  {
                # Check if a 'selectbackground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground)] {
                    1   { lappend mapping -selectbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground) }
                }
            }
        }

        # selectforeground
        switch -- $::ms::managed_by($w,selectforeground) {
            developer { lappend mapping -selectforeground [list pressed $::ms::current($w,selectforeground)] }
            Tk  {
                # Check if a 'selectforeground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground)] {
                    1   { lappend mapping -selectforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground) }
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
        $w.combobox configure      -cursor $cursor \
                                     -font $::ms::current($w,font) \
                                  -justify $::ms::current($w,justify) \
                              -placeholder $::ms::current($w,placeholder) \
                                    -style $::ms::style($w,widget) \
                                    -width $::ms::current($w,charwidth);

        ######################
        ##                  ##
        ##     PREVIEW      ##
        ##                  ##
        ######################

        # Apply the changes to the preview object.
        $w.preview configure             -height $::ms::styleopt($::ms::theme,Preview,height) \
                             -highlightthickness $::ms::styleopt($::ms::theme,Preview,borderwidth) \
                                          -width $::ms::styleopt($::ms::theme,Preview,width);
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
# Manage the **ButtonPress-1** event on the widget.
# Post/Unpost the popdown listbox or perform the entry widget binding,
# depending on widget state and the location of the ButtonPress.
#
# Note: The following procedure is a modified version of the 'ttk::combobox::Press' procedure.
#       All credits goes to the original author/s.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#        These values should be provided by the **ButtonPress** event.
#
# mode   Should be the click type.
#        Allowed values are:
#           "" --> for single press
#           2  --> for double press
#           3  --> for triple press
#           s  --> for shift press
#
# It doesn't return anything.
proc ::ms::palette::ButtonPress { w x y mode } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { ::ms::palette::Post $w }
        normal   {
            # Check the cursor location.
            switch -- [$w.combobox identify element $x $y] {
                "textarea" {
                    # Check if the widget is focussable or not.
                    switch -- [::ms::Is_Focussable $w.combobox] {
                        0   { return "" }
                    }

                    # Check if the widget is already focussed.
                    switch -- [$w.combobox instate [list !focus]] {
                        1   {
                            # Focus the widget.
                            _focus -force $w.combobox

                            # Change the widget dynamic state to 'focus'.
                            $w.combobox state [list focus]
                        }
                    }

                    # Check the press type.
                    switch -- $mode {
                        s   {
                            set ::ttk::entry::State(x)          $x
                            set ::ttk::entry::State(selectMode) char
                            set ::ttk::entry::State(anchor)     [::ttk::entry::ExtendTo $w.combobox @$x]
                        }
                        2   {
                            set cursor_index [::ttk::entry::ClosestGap $w.combobox $x]

                            ::ttk::entry::WordSelect $w.combobox $cursor_index $cursor_index

                            set ::ttk::entry::State(anchor)     $cursor_index
                            set ::ttk::entry::State(selectMode) $mode
                        }
                        3   {
                            set cursor_index [::ttk::entry::ClosestGap $w.combobox $x]

                            ::ttk::entry::LineSelect $w.combobox $cursor_index $cursor_index

                            set ::ttk::entry::State(anchor)     $cursor_index
                            set ::ttk::entry::State(selectMode) $mode
                        }
                        default {
                            $w.combobox icursor [::ttk::entry::ClosestGap $w.combobox $x]
                            $w.combobox selection clear

                            # Set up for future drag, double-click, triple-click or quadruple-click.
                            set ::ttk::entry::State(x)          $x
                            set ::ttk::entry::State(selectMode) char
                            set ::ttk::entry::State(anchor)     [$w.combobox index insert]
                        }
                    }
                }
                default { ::ms::palette::Post $w }
            }
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
proc ::ms::palette::Destroy { w } {
    # Get the short address related to the widget real address.
    set short_addr $::ms::addr($w,short)

    # Destroy the aliased widget pathcommands.
    foreach token $::ms::data($w,token) {
        interp alias {} $token {}
    }

    # Remove all the objects real addresses from the list of all available real addresses.
    foreach object [list $w \
                         $w.preview \
                         $w.combobox] {
        set index [lsearch -exact $::ms::addr(reals) $object]
        switch -- $index {
            -1      {}
            default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
        }
    }

    # Remove the widget short address from the widgets short address list.
    set index [lsearch -exact $::ms::addr(shorts) $short_addr]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(shorts) [lremove $::ms::addr(shorts) $index] }
    }

    # Remove the widget address from the palette widgets real address list.
    set index [lsearch -exact $::ms::addr(palette) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(palette) [lremove $::ms::addr(palette) $index] }
    }

    # Remove the widget address from the palette classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),palette,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),palette,addrs) [lremove $::ms::class($::ms::current($w,class),palette,addrs) $index] }
    }

    # Remove the widget address from the palette classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),palette,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),palette,addrs) [lremove $::ms::style($::ms::current($w,style),palette,addrs) $index] }
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

    # Remove the widget address from the megawidget real address list.
    set index [lsearch -exact $::ms::addr(megawidgets) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(megawidgets) [lremove $::ms::addr(megawidgets) $index] }
    }

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short) \
                         ::ms::addr($w.combobox,short) \
                         ::ms::addr($w.preview,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,arrowcolor) \
                         ::ms::current($w,arrowsize) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,charwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,exportselection) \
                         ::ms::current($w,fieldbackground) \
                         ::ms::current($w,focuscolor) \
                         ::ms::current($w,focuswidth) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,insertcolor) \
                         ::ms::current($w,insertwidth) \
                         ::ms::current($w,justify) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,maxlength) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,placeholder) \
                         ::ms::current($w,placeholderforeground) \
                         ::ms::current($w,posthook) \
                         ::ms::current($w,prehook) \
                         ::ms::current($w,selectbackground) \
                         ::ms::current($w,selectborderwidth) \
                         ::ms::current($w,selectforeground) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,values) \
                         ::ms::current($w,xscrollcommand);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,colornames) \
                         ::ms::data($w,colornames,lowercase) \
                         ::ms::data($w,current_index) \
                         ::ms::data($w,current_hex) \
                         ::ms::data($w,current_value) \
                         ::ms::data($w,hexadecimals) \
                         ::ms::data($w,last_available_index) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,arrowcolor) \
                         ::ms::default($w,arrowsize) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,charwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,exportselection) \
                         ::ms::default($w,fieldbackground) \
                         ::ms::default($w,focuscolor) \
                         ::ms::default($w,focuswidth) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,insertcolor) \
                         ::ms::default($w,insertwidth) \
                         ::ms::default($w,justify) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,maxlength) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,placeholder) \
                         ::ms::default($w,placeholderforeground) \
                         ::ms::default($w,posthook) \
                         ::ms::default($w,prehook) \
                         ::ms::default($w,selectbackground) \
                         ::ms::default($w,selectborderwidth) \
                         ::ms::default($w,selectforeground) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,textvariable) \
                         ::ms::default($w,values) \
                         ::ms::default($w,xscrollcommand);

    unset -nocomplain -- ::ms::managed_by($w,arrowcolor) \
                         ::ms::managed_by($w,arrowsize) \
                         ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,charwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,fieldbackground) \
                         ::ms::managed_by($w,focuscolor) \
                         ::ms::managed_by($w,focuswidth) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,insertcolor) \
                         ::ms::managed_by($w,insertwidth) \
                         ::ms::managed_by($w,justify) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,padding) \
                         ::ms::managed_by($w,placeholderforeground) \
                         ::ms::managed_by($w,rows) \
                         ::ms::managed_by($w,selectbackground) \
                         ::ms::managed_by($w,selectborderwidth) \
                         ::ms::managed_by($w,selectforeground);

    unset -nocomplain -- ::ms::style($w,widget)

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
proc ::ms::palette::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::palette::Pathname_Cmd $w state [list focus]

    # Check the widget stateis in its normal state, s
    switch -- $::ms::current($w,state) {
        normal {
            # Select all the widget textarea characters.
            $w.combobox selection range 0 end
        }
    }

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
proc ::ms::palette::FocusOut { w } {
    # If the popdown window of the palette is currently displayed do not loose the focus (graphically),
    # remove the selection or validate the data.
    switch -- [_winfo exists $w.popdown] {
        1   { return "" }
    }

    # If '$::ms::current($w,cmenu)' exists (meaning it's open), do not loose the focus (graphically).
    switch -- [_winfo exists $::ms::current($w,cmenu)] {
        0   { $w.combobox state [list !focus] }
        1   { $w.combobox state [list  focus] }
    }

    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { set value [$w.combobox get] }
        normal {
            # Validate the widget string.
            set value [::ms::palette::Validate_String $w]

            # Clear the widget field, insert the validated value and put the cursor at the end.
            $w.combobox delete  0 end
            $w.combobox set     $value
            $w.combobox icursor end

            # Remove the widget selection, if any.
            $w.combobox selection clear
        }
    }

    # Check the widget value.
    if { $value ne $::ms::data($w,current_value) } {
        # Update the current values.
        set ::ms::data($w,current_value) $value
        set ::ms::data($w,current_index) [lsearch -exact $::ms::data($w,colornames) $value]
        set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $::ms::data($w,current_index)]

        # Set the bordercolor of the preview object.
        switch -- [string length $::ms::data($w,current_hex)] {
            10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $::ms::data($w,current_hex) \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;

        ::ms::Execute_Widget_Cmd $w
    } else {
        # Set the bordercolor of the preview object.
        switch -- [string length $::ms::data($w,current_hex)] {
            10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $::ms::data($w,current_hex) \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;
    }

    # Cleaning.
    unset -nocomplain -- ::ms::temp($w,pending_execute_cmd)

    return ""
}

## Post
#
# Post the popdown window.
#
# Note: The following procedure is a modified version of the 'ttk::palette::Post' procedure.
#       All credits goes to the original author/s.
#
# Where:
#
# w   Should be the palette real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Post { w } {
    # Note: This procedure have been highly influenced by many 'ttk::palette' procedures.
    #       All credits goes to the original author/s.

    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Safeguard.
    unset -nocomplain -- ::wait_for_user_response

    # Run the prehook callback, if any.
    switch -- $::ms::current($w,prehook) {
        ""      {}
        default {
            try {
                uplevel #0 [list $::ms::current($w,prehook) $w]
            } on error { errortext errorcode } {
                ::ms::Error "Invalid prehook command for '$w'." ""
            }
        }
    }

    ################################
    ##                            ##
    ##     CREATE THE POPDOWN     ##
    ##                            ##
    ################################

    set background        $::ms::styleopt($::ms::theme,Popdown,background)
    set bordercolor       $::ms::styleopt($::ms::theme,Popdown,bordercolor)
    set borderwidth       $::ms::styleopt($::ms::theme,Popdown,borderwidth)
    set cursor            $::ms::styleopt($::ms::theme,Popdown,cursor)
    set darkcolor         $::ms::styleopt($::ms::theme,Popdown,darkcolor)
    set font              $::ms::styleopt($::ms::theme,Popdown,font)
    set foreground        $::ms::styleopt($::ms::theme,Popdown,foreground)
    set justify           $::ms::styleopt($::ms::theme,Popdown,justify)
    set lightcolor        $::ms::styleopt($::ms::theme,Popdown,lightcolor)
    set padding           $::ms::styleopt($::ms::theme,Popdown,padding)
    set relief            $::ms::styleopt($::ms::theme,Popdown,relief)
    set selectbackground  $::ms::styleopt($::ms::theme,Popdown,selectbackground)
    set selectborderwidth $::ms::styleopt($::ms::theme,Popdown,selectborderwidth)
    set selectforeground  $::ms::styleopt($::ms::theme,Popdown,selectforeground)

    # Change the widget dynamic state to 'pressed'.
    ::ms::palette::Pathname_Cmd $w state [list pressed]

    ######################
    ##                  ##
    ##     TOPLEVEL     ##
    ##                  ##
    ######################

    _toplevel $w.popdown          -background $background \
                             -backgroundimage "" \
                                 -borderwidth 0 \
                                       -class ComboboxPopdown \
                                    -colormap {} \
                                   -container 0 \
                                      -cursor arrow \
                                      -height 0 \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor \
                          -highlightthickness $borderwidth \
                                        -menu {} \
                                        -padx [list 0] \
                                        -pady [list 0] \
                                      -relief flat \
                                      -screen {} \
                                   -takefocus 0 \
                                        -tile 0 \
                                         -use {} \
                                      -visual {} \
                                       -width 0;

    # OS specific attributes.
    switch -- [_tk windowingsystem] {
        aqua    { _wm attributes $w.popdown -alpha 1.0 }
        win32   { _wm attributes $w.popdown -toolwindow 1 }
        default { _wm attributes $w.popdown -type combo }

    }

    # Common attributes.
    _wm group $w.popdown $::ms::addr($w,toplevel)
    _wm overrideredirect $w.popdown true
    _wm resizable $w.popdown 0 0
    _wm withdraw $w.popdown

    ###################
    ##               ##
    ##     FRAME     ##
    ##               ##
    ###################

    # Set the popdown frame style.
    set popdown_frame [string cat "_sb=" $background \
                                  "_bc=" $bordercolor \
                                  "_dc=" $darkcolor \
                                  "_lc=" $lightcolor \
                                  ".TFrame"];

    # If needed, create the popdown frame style.
    if { $popdown_frame ni $::ms::style($::ms::theme,created_by_mustang) } {
        _ttk_style configure $popdown_frame  -background $background \
                                            -bordercolor $bordercolor \
                                              -darkcolor $darkcolor \
                                             -lightcolor $lightcolor;
    }

    # Initialize the popdown frame mapping.
    set mapping [list ]

    # Check if a 'bordercolor' mapping exists for 'Popdown'.
    switch -- [info exists ::ms::stylemap($::ms::theme,Popdown,bordercolor)] {
        0   { lappend mapping -bordercolor [list pressed $bordercolor] }
        1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,Popdown,bordercolor) }
    }

    # Check if a 'darkcolor' mapping exists for 'Popdown'.
    switch -- [info exists ::ms::stylemap($::ms::theme,Popdown,darkcolor)] {
        0   { lappend mapping -darkcolor [list pressed $darkcolor] }
        1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,Popdown,darkcolor) }
    }

    # Check if a 'lightcolor' mapping exists for 'Popdown'.
    switch -- [info exists ::ms::stylemap($::ms::theme,Popdown,lightcolor)] {
        0   { lappend mapping -lightcolor [list pressed $lightcolor] }
        1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,Popdown,lightcolor) }
    }

    # If needed, create the popdown frame mapping.
    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
        _ttk_style map $popdown_frame {*}$mapping

        # Add the popdown frame mapping to the stylemap list containing all the mappings
        # created by mustang for the current theme.
        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
    }

    # Create the popdown frame object.
    _ttk_frame $w.popdown.f -borderwidth 0 \
                                  -class TFrame \
                                 -cursor arrow \
                                 -height 0 \
                                -padding $padding \
                                 -relief flat \
                                  -style $popdown_frame \
                              -takefocus 0 \
                                  -width 0;

    #####################
    ##                 ##
    ##     LISTBOX     ##
    ##                 ##
    #####################

    _listbox $w.popdown.f.lb         -activestyle none \
                                      -background $background \
                                     -borderwidth 0 \
                                          -cursor $cursor \
                                 -exportselection false \
                                            -font $font \
                                      -foreground $foreground \
                                          -height $::ms::current($w,rows) \
                             -highlightbackground $background \
                                  -highlightcolor $background \
                              -highlightthickness 0 \
                                         -justify $justify \
                                    -listvariable ::ms::data($w,colornames) \
                                          -relief flat \
                                -selectbackground $selectbackground \
                               -selectborderwidth $selectborderwidth \
                                -selectforeground $selectforeground \
                                      -selectmode browse \
                                         -setgrid 0 \
                                           -state normal \
                                       -takefocus 1 \
                                           -width 0 \
                                  -xscrollcommand {} \
                                  -yscrollcommand {};

    # Set the listbox bindtags.
    _bindtags $w.popdown.f.lb [list $w.popdown.f.lb Popdown Listbox $w.popdown.f all]

    ##############################
    ##                          ##
    ##     POPDOWN BINDINGS     ##
    ##                          ##
    ##############################

    # ButtonRelease events outside of the popdown window.
    switch -- [_tk windowingsystem] {
        aqua    { _bind $w.popdown <ButtonPress-2> [list ::ms::External_Click $w %X %Y] }
        default { _bind $w.popdown <ButtonPress-3> [list ::ms::External_Click $w %X %Y] }
    }
    _bind $w.popdown <ButtonPress-1> [list ::ms::External_Click $w %X %Y]

    # Map/Unmap
    _bind $w.popdown <Map>   { break }
    _bind $w.popdown <Unmap> { break }

    # Motion
    _bind $w.popdown <Motion> [list ::ms::palette::Popdown_Motion $w %X %Y]

    # Scan
    _bind $w.popdown <<ScanMark>>    [list ::ms::Scan_Mark $w.popdown.f.lb %x %y]
    _bind $w.popdown <<ScanDrag>>    [list ::ms::Scan_Drag $w.popdown.f.lb %x %y]
    _bind $w.popdown <<ScanRelease>> [list ::ms::Scan_Release]

    # ArrowDown/ArrowUp
    _bind $w.popdown.f.lb <<NextLine>> [list ::ms::palette::Popdown_ArrowDown  $w]
    _bind $w.popdown.f.lb <<PrevLine>> [list ::ms::palette::Popdown_ArrowUp    $w]

    # Control-End/Control-Home
    _bind $w.popdown.f.lb <<LineEnd>>   [list ::ms::palette::Popdown_End  $w]
    _bind $w.popdown.f.lb <<LineStart>> [list ::ms::palette::Popdown_Home $w]

    # Escape
    _bind $w.popdown.f.lb <KeyPress-Escape> { set ::wait_for_user_response "Unpost"; break }

    # End/Home
    _bind $w.popdown.f.lb <<LineBottom>> [list ::ms::palette::Popdown_End  $w]
    _bind $w.popdown.f.lb <<LineTop>>    [list ::ms::palette::Popdown_Home $w]

    # FocusOut, *only* do this on Windows (see #1814778).
    # Dismiss the listbox when the user switches to a different application.
    switch -- [_tk windowingsystem] {
        win32 { _bind $w.popdown.f.lb <FocusOut> { set ::wait_for_user_response "Unpost"; break } }
    }

    # Motion
    _bind $w.popdown.f.lb <Motion> [list ::ms::palette::Popdown_Hover $w %x %y]

    # PageDown/PageUp
    _bind $w.popdown.f.lb <<PageDown>> [list ::ms::palette::Popdown_PageDown  $w]
    _bind $w.popdown.f.lb <<PageUp>>   [list ::ms::palette::Popdown_PageUp    $w]

    # Selection
    _bind $w.popdown.f.lb <ButtonRelease-1>   [list ::ms::palette::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-Return>   [list ::ms::palette::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-KP_Enter> [list ::ms::palette::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-space>    [list ::ms::palette::Popdown_Select $w]

    # Shift-Tab/Tab
    switch -- [_tk windowingsystem] {
        win32   { _bind $w.popdown.f.lb <Shift-Tab> { ::ms::palette::Popdown_Tab %W previous; break } }
        default {
            _bind $w.popdown.f.lb <ISO_Left_Tab>    { ::ms::palette::Popdown_Tab %W previous; break }

            try {
                _bind $w.popdown.f.lb <hpBackTab>   { ::ms::palette::Popdown_Tab %W previous; break }
            } on error {} {
                # Do nothing.
            }
        }
    }
    _bind $w.popdown.f.lb <Tab> { ::ms::palette::Popdown_Tab %W next; break }

    # If the listbox can scroll vertically, move the listbox viewpoint by one unit up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f     <MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f.lb  <MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D units]

    # If the listbox can scroll horizontally, move the listbox viewpoint by one unit left or right
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f     <Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f.lb  <Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D units]

    # If the listbox can scroll vertically, move the listbox viewpoint by one page up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f     <Control-MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f.lb  <Control-MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D pages]

    # If the listbox can scroll horizontally, move the listbox viewpoint by one page left or right
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f     <Control-Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f.lb  <Control-Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D pages]

    # Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
    #       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

    # If the listbox can scroll vertically, move the listbox viewpoint by one unit up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D units]
    _bind $w.popdown.f     <TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D units]
    _bind $w.popdown.f.lb  <TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D units]

    # If the listbox can scroll vertically, move the listbox viewpoint by one page up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D pages]
    _bind $w.popdown.f     <Control-TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D pages]
    _bind $w.popdown.f.lb  <Control-TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D pages]

    #############################
    ##                         ##
    ##     GRID EVERYTHING     ##
    ##                         ##
    #############################

    # Grid the elements of the popdown window.
    _grid $w.popdown.f   -padx [list 0] \
                         -pady [list 0] \
                       -sticky news;

    _grid $w.popdown.f.lb -column 0 \
                            -padx [list 3p 3p] \
                            -pady [list 3p 3p] \
                             -row 0 \
                          -sticky nsew;

    # Configure the grids rows and columns.
    _grid rowconfigure    $w.popdown 0 -weight 1
    _grid columnconfigure $w.popdown 0 -weight 1

    _grid columnconfigure $w.popdown.f 0 -weight 1
    _grid rowconfigure    $w.popdown.f 0 -weight 1

    #######################
    ##                   ##
    ##     SCROLLBAR     ##
    ##                   ##
    #######################

    if { $::ms::current($w,rows) < [llength $::ms::data($w,colornames)] } {
        _ttk_scrollbar $w.popdown.f.vsb     -class TScrollbar \
                                          -command [list $w.popdown.f.lb yview] \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

        $w.popdown.f.lb configure -yscrollcommand [list $w.popdown.f.vsb set]

        _bind $w.popdown.f.vsb <MouseWheel>         [list ::ms::combobox::Scrollbar_Mousewheel $w %D units]
        _bind $w.popdown.f.vsb <Control-MouseWheel> [list ::ms::combobox::Scrollbar_Mousewheel $w %D pages]

        _bind $w.popdown.f.vsb <TouchpadScroll>         [list ::ms::combobox::Scrollbar_TouchpadScroll $w %# %D units]
        _bind $w.popdown.f.vsb <Control-TouchpadScroll> [list ::ms::combobox::Scrollbar_TouchpadScroll $w %# %D pages]

        _grid $w.popdown.f.vsb -column 1 \
                                 -padx [list 0  3p] \
                                 -pady [list 3p 3p] \
                                  -row 0 \
                               -sticky ns;
    }

    #######################################
    ##                                   ##
    ##     SET THE POPDOWN SELECTION     ##
    ##                                   ##
    #######################################

    ::ms::palette::Popdown_AutoSelection $w

    ###############################
    ##                           ##
    ##     PLACE THE POPDOWN     ##
    ##                           ##
    ###############################

    update idletasks

    # Get the (x,y) absolute coordinate of the NW point of the palette.
    set palette_x [_winfo rootx $w]
    set palette_y [_winfo rooty $w]

    # Get the width and height of the palette.
    set palette_height [_winfo height $w.combobox]
    set palette_width  [_winfo width  $w.combobox]

    # Adjust the coordinates and dimensions by the 'postoffset' specified in the palette style provided.
    set postoffset [_ttk_style lookup $::ms::current($w,style) -postoffset {} [list 0 0 0 0]]
    foreach var { palette_x palette_y palette_width palette_height } delta $postoffset {
        incr $var $delta
    }

    # Compute if the popdown will show below the palette element or above it.
    set popdown_height [_winfo reqheight $w.popdown]
    if { ($palette_y+$palette_height+$popdown_height+4) > [_winfo screenheight $w.popdown] } {
        # Above the palette.
        set popdown_y [expr { $palette_y-$popdown_height-4 }]
    } else {
        # Below the palette.
        # This is the normal flow of the popdown window.
        set popdown_y [expr { $palette_y+$palette_height+4 }]
    }

    # Set the popdown geometry.
    _wm geometry $w.popdown ${palette_width}x${popdown_height}+${palette_x}+${popdown_y}

    #####################################
    ##                                 ##
    ##     POST THE POPDOWN WINDOW     ##
    ##                                 ##
    #####################################

    # Note: Need to set [wm transient] just before mapping the popdown
    #       instead of when it's created, in case a containing frame
    #       has been reparented [#1818441].
    #
    #       On Windows: setting [wm transient] prevents the parent
    #       toplevel from becoming inactive when the popdown is posted
    #       (Tk 8.4.8+)
    #
    #       On X11: WM_TRANSIENT_FOR on override-redirect windows
    #       may be used by compositing managers and by EWMH-aware
    #       window managers (even though the older ICCCM spec says
    #       it's meaningless).
    switch -- [_tk windowingsystem] {
        win32 -
        x11   { _wm transient $w.popdown $::ms::addr($w,toplevel) }
    }

    # Post the popdown window.
    _wm attribute $w.popdown -topmost 1
    _wm deiconify $w.popdown
    _raise $w.popdown

    # Focus on the 'popdown' object.
    _focus -force $w.popdown.f.lb

    # Get the combobox current fieldbackground color for the focus dynamic state.
    set fieldbackground [_ttk_style lookup $::ms::current($w,style) -fieldbackground [list focus] $::ms::current($w,fieldbackground)]

    # Create/Update the sub-style for the fieldbackground.
    _ttk_style configure Fieldbackground.$::ms::style($w,widget) -fieldbackground $fieldbackground

    # Change momentarily the combobox style to the sub-style.
    $w.combobox configure -style Fieldbackground.$::ms::style($w,widget)

    ###############################
    ##                           ##
    ##     SET A GLOBAL GRAB     ##
    ##                           ##
    ###############################

    # Setting a global grab on the popdown window.
    _grab set -global $w.popdown

    # Waiting for '::wait_for_user_response'.
    vwait ::wait_for_user_response

    #######################################
    ##                                   ##
    ##     UNPOST THE POPDOWN WINDOW     ##
    ##                                   ##
    #######################################

    # Change the combobox style back to its original style.
    $w.combobox configure -style $::ms::style($w,widget)

    # Unpost the popdown window.
    ::ms::palette::Unpost $w

    return ""
}

## Return
#
# Manage the **Return** keypress event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Return { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { set value [$w.combobox get] }
        normal {
            # Validate the widget string.
            set value [::ms::palette::Validate_String $w]

            # Clear the widget field, insert the validated value and put the cursor at the end.
            $w.combobox delete  0 end
            $w.combobox set     $value
            $w.combobox icursor end

            # Remove the widget selection, if any.
            $w.combobox selection clear
        }
    }

    # Check the widget value.
    if { $value ne $::ms::data($w,current_value) } {
        # Update the current values.
        set ::ms::data($w,current_value) $value
        set ::ms::data($w,current_index) [lsearch -exact $::ms::data($w,colornames) $value]
        set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $::ms::data($w,current_index)]

        # Set the bordercolor of the preview object.
        switch -- [string length $::ms::data($w,current_hex)] {
            10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $::ms::data($w,current_hex) \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;

        ::ms::Execute_Widget_Cmd $w
    } else {
        # Set the bordercolor of the preview object.
        switch -- [string length $::ms::data($w,current_hex)] {
            10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $::ms::data($w,current_hex) \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;
    }

    return ""
}

## Unpost
#
# Unpost the popdown window.
#
# Where:
#
# w   Should be the palette real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Unpost { w } {
    # Release the grab.
    _grab release $w.popdown

    # Withdraw and destroy the popdown window.
    _wm withdraw $w.popdown
    _destroy $w.popdown

    # Run the posthook callback, if any.
    switch -- $::ms::current($w,posthook) {
        ""      {}
        default {
            try {
                uplevel #0 [list $::ms::current($w,posthook) $w]
            } on error { errortext errorcode } {
                ::ms::Error "Invalid posthook command for '$w'." ""
            }
        }
    }

    # Change the widget dynamic state to '!pressed'.
    ::ms::palette::Pathname_Cmd $w state [list !pressed]

    # Unset the toplevel temporary variables.
    unset -nocomplain -- ::ms::temp(toplevel_Xnw) \
                         ::ms::temp(toplevel_Ynw) \
                         ::ms::temp(toplevel_height) \
                         ::ms::temp(toplevel_width) \
                         ::ms::temp(toplevel_Xse) \
                         ::ms::temp(toplevel_Yse);

    # Focus on the combobox object.
    _focus -force $w.combobox

    # Check the current palette index.
    set current_index [$w.combobox current]
    switch -- $current_index {
        ""  {
            set execute_cmd no

            # Hide the preview object.
            set preview_color $::ms::current($w,shellbackground)
            set bordercolor   $::ms::current($w,shellbackground)
        }
        default {
            if { $current_index ne $::ms::data($w,current_index) } {
                set execute_cmd yes

                # Update the current values.
                set ::ms::data($w,current_index) $current_index
                set ::ms::data($w,current_value) [lindex $::ms::data($w,colornames)   $current_index]
                set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $current_index]
            } else {
                set execute_cmd no
            }

            # Set the preview color and its bordercolor (black or white).
            set preview_color $::ms::data($w,current_hex)
            switch -- [string length $::ms::data($w,current_hex)] {
                10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
                13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
                default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
            }
        }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    # Execute the external procedure provided, if needed and if any.
    switch -- $execute_cmd {
        yes {
            switch -- $::ms::current($w,command) {
                ""      {}
                default {
                    try {
                        uplevel #0 [list $::ms::current($w,command) $w $::ms::data($w,current_value)]
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    }
                }
            }
        }
    }

    return ""
}

###################################
##                               ##
##     VALIDATION PROCEDURES     ##
##                               ##
###################################

## Validate_KeyPress
#
# Limit the input keypresses in a palette widget and set the widget state to 'invalid' or '!invalid'
# depending if there are illegal characters or if the string is not contained inside any of the items
# provided by the first column of the '::ms::current($w,values)' variable.
#
# Where:
#
# w        Should be the widget real address involved.
#
# string   Should be the string to check.
#
# It returns a boolean value ['0' or '1'] indicating if the string provided
# reached it's length limit or not.
proc ::ms::palette::Validate_KeyPress { w string } {
    # Check if the character is allowed to be displayed or not.
    switch -- $::ms::current($w,maxlength) {
        0       {}
        default {
            # Check if the length of 'string' is bigger than the maxlength allowed.
            if { [string length $string] > $::ms::current($w,maxlength) } {
                # The character will not be inserted.
                return 0
            }
        }
    }

    # Remove any leading and trailing spaces from 'string'.
    set value [string trim $string]

    # Check 'value'.
    switch -- $value {
        ""  {
            # Change the widget dynamic state to '!invalid'.
            ::ms::palette::Pathname_Cmd $w state [list !invalid]

            # Hide the preview object.
            $w.preview configure          -background $::ms::current($w,shellbackground) \
                                 -highlightbackground $::ms::current($w,shellbackground) \
                                      -highlightcolor $::ms::current($w,shellbackground);

            return 1
        }
        default {
            # Note: Illegal characters cannot be inserted directly through the keyboard, we made
            #       sure of that in the widget bindings section.
            #       Nonetheless, they can be inserted trough a paste or pasteselection event.
            #       If this is the case, we will let the illegal character be inserted but we will
            #       mark the string as invalid.

            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    " "     -
                    "-"     {}
                    default {
                        switch -- [string is alnum $char] {
                            0   {
                                # Change the widget dynamic state to 'invalid'.
                                ::ms::palette::Pathname_Cmd $w state [list invalid]

                                # Hide the preview object.
                                $w.preview configure          -background $::ms::current($w,shellbackground) \
                                                     -highlightbackground $::ms::current($w,shellbackground) \
                                                          -highlightcolor $::ms::current($w,shellbackground);

                                return 1
                            }
                        }
                    }
                }

                incr i
            }
        }
    }

    # Note: If we have arrived to this point, it means that no illegal characters have been found
    #       in the string examined but the string could still be invalid because it may not be contained
    #       inside the items of the list provided for the widget.

    #######################################
    ##                                   ##
    ##     ALPHABETIC INEXACT SEARCH     ##
    ##                                   ##
    #######################################

    # Trasform 'value' in lowercase characters for comparison reasons.
    set value [string tolower $value]

    # Find the closest match to 'value' in the colorname lowercase list.
    set i     0
    set limit [string length $value]
    while { $i < $limit } {
        # Get the longest common characters in the list.
        set longest [::tcl::prefix longest $::ms::data($w,colornames,lowercase) $value]

        # Check the 'longest' variable.
        switch -- $longest {
            ""  {
                # Remove the last character from 'value'.
                set value [string range $value 0 end-1]

                incr i
            }
        }

        break
    }

    # Check the resulting 'longest' value after the loop.
    switch -- $longest {
        ""  {
            # Change the widget dynamic state to 'invalid'.
            ::ms::palette::Pathname_Cmd $w state [list invalid]

            # Hide the preview object.
            set preview_color $::ms::current($w,shellbackground)
            set bordercolor   $::ms::current($w,shellbackground)
        }
        default {
            # Get the list of all elements that starts with the 'longest' value and sort it.
            set prefix_list [lsort -dictionary [::tcl::prefix all $::ms::data($w,colornames,lowercase) $longest]]

            # Get the index of the first element of 'prefix_list' relative to '::ms::data($w,colornames,lowercase)'.
            set index [lsearch -exact $::ms::data($w,colornames,lowercase) [lindex $prefix_list 0]]
            switch -- $index {
                ""  { set index $::ms::data($w,current_index) }
            }

            # Compare the longest common characters found in 'values' that contains consecutive characters of
            # 'value' with 'value' itself and change the widget dynamic invalid state accordingly.
            if { [string range $longest 0 $limit-1] eq $value } {
                ::ms::palette::Pathname_Cmd $w state [list !invalid]

                # Set the preview color and its bordercolor (black or white).
                set preview_color [lindex $::ms::data($w,hexadecimals) $index]
                switch -- [string length $::ms::data($w,current_hex)] {
                    10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
                    13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
                    default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
                }
            } else {
                ::ms::palette::Pathname_Cmd $w state [list invalid]

                # Hide the preview object.
                set preview_color $::ms::current($w,shellbackground)
                set bordercolor   $::ms::current($w,shellbackground)
            }
        }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    return 1
}

## Validate_String
#
# Validate the string inside the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# Return the validated string.
proc ::ms::palette::Validate_String { w } {
    ##############################
    ##                          ##
    ##     VALUE CORRECTION     ##
    ##                          ##
    ##############################

    # Remove any leading and trailing spaces from the current value.
    set value [string trim [$w.combobox get]]

    # Clear 'value' from illegal characters, if any.
    set corrected_value ""
    set i 0
    while { $i < [string length $value] } {
        set char [string index $value $i]
        switch -- $char {
            " "     -
            "-"     {}
            default {
                # Check if 'char' is an alphanumeric character.
                switch -- [string is alnum $char] {
                    0   {
                        incr i
                        continue
                    }
                }
            }
        }

        # Add char to the 'corrected_value' string.
        append corrected_value $char

        incr i
    }

    set value $corrected_value

    # Note: At this point, every illegal characters in string have been stripped out.

    ########################
    ##                    ##
    ##     VALIDATION     ##
    ##                    ##
    ########################

    switch -- $value {
        ""      { set index $::ms::data($w,current_index) }
        default {
            # Trasform 'value' in lowercase characters for comnparison reasons.
            set value [string tolower $value]

            # Find the closest match to 'value' in the colorname lowercase list.
            set i     0
            set limit [string length $value]
            while { $i < $limit } {
                # Get the longest common characters in the list.
                set longest [::tcl::prefix longest $::ms::data($w,colornames,lowercase) $value]

                # Check the 'longest' variable.
                switch -- $longest {
                    ""  {
                        # Remove the last character from 'value'.
                        set value [string range $value 0 end-1]

                        incr i
                    }
                }

                break
            }

            # Check the resulting 'longest' value after the loop.
            switch -- $longest {
                ""      { set index $::ms::data($w,current_index) }
                default {
                    # Get the list of all elements that starts with the 'longest' value and sort it.
                    set prefix_list [lsort -dictionary [::tcl::prefix all $::ms::data($w,colornames,lowercase) $longest]]

                    # Get the index of the first element of 'prefix_list' relative to '::ms::data($w,colornames,lowercase)'.
                    set index [lsearch -exact $::ms::data($w,colornames,lowercase) [lindex $prefix_list 0]]
                    switch -- $index {
                        ""  { set index $::ms::data($w,current_index) }
                    }
                }
            }
        }
    }

    # Set the widget dynamic state to '!invalid'.
    ::ms::palette::Pathname_Cmd $w state [list !invalid]

    return [lindex $::ms::data($w,colornames) $index]
}

#####################################
##                                 ##
##     MOUSEWHEEL AND TOUCHPAD     ##
##                                 ##
#####################################

## MouseWheel
#
# If the widget is not in its disabled state and the list provided is not empty, scroll the items
# list without displaying the popdown window, otherwise try to find the innermost widget's scrollable
# parent with an active vertical scrollbar and move that scrollbar by one unit up or down (depending
# on the mousewheel direction). If none of the widget's parent meets the required condition,
# don't do anything.
#
# Where:
#
# w        Should be the widget real address involved.
#
# amount   Should be the delta value of a **MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#          *Amount* is normally delivered by the **MouseWheel** event with a value of
#          **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# It doesn't return anything.
proc ::ms::palette::MouseWheel { w amount } {
    switch -- $::ms::current($w,state) {
        disabled {
            # Try to find a widget parent to scroll vertically, if any.
            ::ms::Scroll_Parent_Y $w $amount units
        }
        default {
            switch -- [winfo exists $w.popdown] {
                0   {
                    # Check if the widget is focussable or not.
                    switch -- [::ms::Is_Focussable $w] {
                        0   {
                            # Try to find a widget parent to scroll vertically, if any.
                            ::ms::Scroll_Parent_Y $w $amount units

                            return ""
                        }
                    }

                    # Check if the widget is in focus.
                    switch -- [interp invokehidden {} $w instate [list focus]] {
                        0   {
                            # Try to find a widget parent to scroll vertically, if any.
                            ::ms::Scroll_Parent_Y $w $amount units

                            return ""
                        }
                        1   {
                            # Check the scrollmode.
                            switch -- $::ms::scrollmode {
                                natural { set amount [expr { -1.0*$amount }] }
                            }

                            # Change the widget textarea value by scrolling the items list provided up or down
                            # (depending on the scroll direction).
                            if { $amount > 0 } {
                                set index [expr { $::ms::data($w,current_index)-1 }]
                            } else {
                                set index [expr { $::ms::data($w,current_index)+1 }]
                            }

                            # Check the scrollstopper ('disabled' or 'enabled').
                            switch -- $::ms::scrollstopper {
                                disabled {
                                    # If index is lesser than zero or bigger than the last available index, cycle trough.
                                    if { $index < 0 } {
                                        set index $::ms::data($w,last_available_index)
                                    } elseif { $index > $::ms::data($w,last_available_index) } {
                                        set index 0
                                    }
                                }
                                enabled {
                                    # If index is lesser than zero or bigger than the last available index, stop the scrolling.
                                    if { $index < 0 } {
                                        return ""
                                    } elseif { $index > $::ms::data($w,last_available_index) } {
                                        return ""
                                    }
                                }
                            }

                            # Update the current index and value.
                            set ::ms::data($w,current_index) $index
                            set ::ms::data($w,current_value) [lindex $::ms::data($w,colornames)   $index]
                            set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $index]

                            # Clear the widget textarea, remove any previous selection and display the new widget value.
                            $w.combobox delete 0 end
                            $w.combobox selection clear
                            $w.combobox set $::ms::data($w,current_value)

                            # If the widget is not in readonly state, select the palette entry.
                            switch -- $::ms::current($w,state) {
                                normal {
                                    $w.combobox selection range 0 end
                                    $w.combobox icursor end
                                }
                            }

                            # Set the bordercolor of the preview object.
                            switch -- [string length $::ms::data($w,current_hex)] {
                                10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
                                13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
                                default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
                            }

                            # Apply the changes to the preview object.
                            $w.preview configure          -background $::ms::data($w,current_hex) \
                                                 -highlightbackground $bordercolor \
                                                      -highlightcolor $bordercolor;

                            # Note: To avoid executing the associated widget command multiple times, we introduce a timer (50ms) before actually
                            #       executing the command. This timer will be resetted if, while active, another mousewheel action on the widget
                            #       asks to launch again the command.
                            if { [info exists ::ms::temp($w,pending_execute_cmd)] } {
                                after cancel $::ms::temp($w,pending_execute_cmd)
                                unset -nocomplain -- ::ms::temp($w,pending_execute_cmd)
                            }
                            set ::ms::temp($w,pending_execute_cmd) [after 50 [list ::ms::Execute_Widget_Cmd $w]]
                        }
                    }
                }
            }
        }
    }

    return ""
}

## Shift_MouseWheel
#
# If the widget is in its **normal** state and has the focus, move the insert cursor by one character
# to the left or to the right (depending on the mousewheel direction), otherwise try to find the
# innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
# by one unit left or right (again, depending on the mousewheel direction). If none of the widget's
# parent meets the required condition, don't do anything.
#
# Where:
#
# w        Should be the widget real address involved.
#
# amount   Should be the delta value of a **MouseWheel** event.
#          The delta value represents the rotation units the mousewheel has been moved.
#          The sign of the value represents the direction the mousewheel was scrolled.
#          *Amount* is normally delivered by the **MouseWheel** event with a value of
#          **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# It doesn't return anything.
proc ::ms::palette::Shift_MouseWheel { w amount } {
    switch -- $::ms::current($w,state) {
        normal {
            # Check if the widget is on focus.
            switch -- [$w.combobox instate [list focus]] {
                1   {
                    # Get the current cursor position
                    set index [$w.combobox index insert]

                    # Move the cursor by one character to the left or to the right (depending
                    # on the mousewheel direction).
                    if { $amount > 0 } {
                        $w.combobox icursor $index+1
                    } else {
                        $w.combobox icursor $index-1
                    }

                    # Make the index character visible.
                    ::ttk::entry::See $w.combobox $index

                    return ""
                }
            }
        }
    }

    # Try to find a widget parent to scroll horizontally, if any.
    ::ms::Scroll_Parent_X $w $amount units

    return ""
}

## Touchpad
#
# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
#
#   1 - If the listbox can scroll horizontally, scroll it by units (**TouchpadScroll**) or by pages
#       (**Control-TouchpadScroll**), otherwise don't do any movement on the horizontal axis.
#
#   2 - If the listbox can scroll vertically, scroll it by units (**TouchpadScroll**) or by pages
#       (**Control-TouchpadScroll**), otherwise don't do any movement on the vertical axis.
#
# Where:
#
# w         Should be the scrollable widget real address involved.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# amount    Should be the delta value of a **TouchpadScroll**/**Control-TouchpadScroll** event.
#           The delta value represents the rotation units the mouse wheel has been moved.
#           The sign of the value represents the direction the mouse wheel was scrolled.
#           *Amount* is normally delivered by the **TouchpadScroll**/**Control-TouchpadScroll**
#           event with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#           If the value provided as *amount* is not an integer or a float,
#           defaults to **+120.0**.
#
#           Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what      Should be a string that specifies the unit type.
#           Allowed values are the word **units** or **pages**.
#           *Units* are used by the **TouchpadScroll** event while *pages* are used
#           by the **Control-TouchpadScroll** event.
#
#           If not provided, defaults to **units**.
#
# It doesn't return anything.
proc ::ms::palette::Touchpad { w counter amount } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # <TouchpadScroll> events can be generated about 60 times per second
    # during a two-finger gesture.
    # This allow the binding script to respond to every 5th <TouchpadScroll> event
    # by testing is the 'counter' is divisible by 5.
    set counter [expr { $counter%5 }]
    if { $counter != 0 } {
        return ""
    }

    # Translate 'amount' in 'delta_x' and 'delta_y'.
    lassign [::tk::PreciseScrollDeltas $amount] delta_x delta_y

    # Adjust 'delta_x' and 'delta_y' values, or the movement will be too slow.
    set delta_x [expr { $delta_x*30 }]
    set delta_y [expr { $delta_y*30 }]

    # If there is a movement along the X axis, launch '::ms::palette::MouseWheel'.
    if { $delta_x != 0 } {
        ::ms::palette::MouseWheel $w $delta_x
    }

    # If there is a movement along the Y axis, launch '::ms::palette::Shift_MouseWheel'.
    if { $delta_y != 0 } {
        ::ms::palette::Shift_MouseWheel $w $delta_y
    }

    return ""
}

#######################################
##                                   ##
##     POPDOWN WINDOW PROCEDURES     ##
##                                   ##
#######################################

## Popdown_ArrowDown
#
# Move the current selected row towards the bottom by one row.
#
# Where:
#
# w   Should be the palette real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_ArrowDown { w } {
    # Compute the new index.
    set index [expr { [$w.popdown.f.lb index active]+1 }]

    # Check the scrollstopper ('disabled' or 'enabled').
    switch -- $::ms::scrollstopper {
        disabled {
            # If index is bigger than the last available index, cycle trough.
            if { $index > $::ms::data($w,last_available_index) } {
                set index 0
            }
        }
        enabled {
            # If index is bigger than the last available index, stop the movement.
            if { $index > $::ms::data($w,last_available_index) } {
                return -code break
            }
        }
    }

    # Select and activate the new index.
    $w.popdown.f.lb activate $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    # Make sure that 'index' is visible.
    $w.popdown.f.lb see $index

    # Set the preview color and its bordercolor (black or white).
    set preview_color [lindex $::ms::data($w,hexadecimals) $index]
    switch -- [string length $preview_color] {
        10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
        13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
        default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    return -code break
}

## Popdown_ArrowUp
#
# Move the current selected row towards the top by one row.
#
# Where:
#
# w   Should be the palette real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_ArrowUp { w } {
    # Compute the new index.
    set index [expr { [$w.popdown.f.lb index active]-1 }]

    # Check the scrollstopper ('disabled' or 'enabled').
    switch -- $::ms::scrollstopper {
        disabled {
            # If index is lesser than zero, cycle trough.
            if { $index < 0 } {
                set index $::ms::data($w,last_available_index)
            }
        }
        enabled {
            # If index is lesser than zero, stop the movement.
            if { $index < 0 } {
                return -code break
            }
        }
    }

    # Select and activate the new index.
    $w.popdown.f.lb activate $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    # Make sure that 'index' is visible.
    $w.popdown.f.lb see $index

    # Set the preview color and its bordercolor (black or white).
    set preview_color [lindex $::ms::data($w,hexadecimals) $index]
    switch -- [string length $preview_color] {
        10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
        13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
        default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    return -code break
}

## Popdown_AutoSelection
#
# Automatic selection of the listbox item.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_AutoSelection { w } {
    ##############################
    ##                          ##
    ##     VALUE CORRECTION     ##
    ##                          ##
    ##############################

    # Remove any leading and trailing spaces from the widget textarea value.
    set value [string trim [$w.combobox get]]

    # Clear 'value' from illegal characters, if any.
    set corrected_value ""
    set i 0
    while { $i < [string length $value] } {
        set char [string index $value $i]
        switch -- $char {
            " "     -
            "-"     {}
            default {
                # Check if 'char' is an alphanumeric character.
                switch -- [string is alnum $char] {
                    0   {
                        incr i
                        continue
                    }
                }
            }
        }

        # Add char to the 'corrected_value' string.
        append corrected_value $char

        incr i
    }

    set value $corrected_value

    ##########################################################
    ##                                                      ##
    ##     SEARCH THE INDEX OF THE CLOSEST LISTBOX ITEM     ##
    ##                                                      ##
    ##########################################################

    switch -- $value {
        ""      { set index 0 }
        default {
            #######################################
            ##                                   ##
            ##     ALPHABETIC INEXACT SEARCH     ##
            ##                                   ##
            #######################################

            # Trasform 'value' in lowercase characters for comparison reasons.
            set value [string tolower $value]

            # Find the closest match to 'value' in the colorname lowercase list.
            set found false
            set i     0
            set limit [string length $value]
            while { $i < $limit } {
                # Get the longest common characters in the list.
                set longest [::tcl::prefix longest $::ms::data($w,colornames,lowercase) $value]

                # Check the 'longest' variable.
                switch -- $longest {
                    ""  {
                        # Remove the last character from 'value'.
                        set value [string range $value 0 end-1]

                        incr i
                    }
                }

                break
            }

            # Check the resulting 'longest' value after the loop.
            switch -- $longest {
                ""      { set index 0 }
                default {
                    # Get the list of all elements that starts with the 'longest' value and sort it.
                    set prefix_list [lsort -dictionary [::tcl::prefix all $::ms::data($w,colornames,lowercase) $longest]]

                    # Get the index of the first element of 'prefix_list' relative to '::ms::data($w,colornames,lowercase)'.
                    set index [lsearch -exact $::ms::data($w,colornames,lowercase) [lindex $prefix_list 0]]
                    switch -- $index {
                        ""  { set index $::ms::data($w,current_index) }
                    }
                }
            }
        }
    }

    # Select the listbox 'index' found.
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index
    $w.popdown.f.lb activate $index

    # Make sure that 'index' is visible.
    $w.popdown.f.lb see $index

    # Set the preview color and its bordercolor (black or white).
    set preview_color [lindex $::ms::data($w,hexadecimals) $index]
    switch -- [string length $preview_color] {
        10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
        13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
        default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    return ""
}

## Popdown_End
#
# Move the listbox view to its bottom and select the very last row.
#
# Where:
#
# w   Should be the palette real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_End { w } {
    # Select and activate the very last row.
    $w.popdown.f.lb activate $::ms::data($w,last_available_index)
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $::ms::data($w,last_available_index)

    # Make sure that the last available index is visible.
    $w.popdown.f.lb see $::ms::data($w,last_available_index)

    # Set the preview color and its bordercolor (black or white).
    set preview_color [lindex $::ms::data($w,hexadecimals) $::ms::data($w,last_available_index)]
    switch -- [string length $preview_color] {
        10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
        13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
        default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    return ""
}

## Popdown_Home
#
# Move the listbox view to its top and select the very first row.
#
# Where:
#
# w   Should be the palette real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_Home { w } {
    # Select and activate the very first row.
    $w.popdown.f.lb activate 0
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set 0

    # Make sure that index **0** is visible.
    $w.popdown.f.lb see 0

    # Set the preview color and its bordercolor (black or white).
    set preview_color [lindex $::ms::data($w,hexadecimals) 0]
    switch -- [string length $preview_color] {
        10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
        13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
        default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    return ""
}

## Popdown_Hover
#
# Manage the **Motion** event on the popdown listbox.
#
# Note: The following procedure is a modified version of the 'ttk::combobox::LBHover' procedure.
#       All credits goes to the original author/s.
#
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#        These values should be provided by the **Motion** event.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_Hover { w x y } {
    # Get the index of the current hovered row.
    set index [$w.popdown.f.lb index @$x,$y]

    # Select and activate the new index.
    $w.popdown.f.lb activate $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    # Set the preview color and its bordercolor (black or white).
    set preview_color [lindex $::ms::data($w,hexadecimals) $index]
    switch -- [string length $preview_color] {
        10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
        13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
        default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    return -code break
}

## Popdown_Motion
#
# Manage the **Motion** event on the widget popdown.
#
# Where:
#
# w      Should be the widget real address involved.
#
# X, Y   Should be the (x,y) mouse pointer absolute coordinates at the time of the event.
#        These values should be provided by the **Motion** event.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_Motion { w X Y } {
    switch -- [info exists ::ms::temp(toplevel_height)] {
        0   {
            update idletasks

            # Get the toplevel north-west (nw) root coordinates.
            set ::ms::temp(toplevel,X,nw) [_winfo rootx $::ms::addr($w,toplevel)]
            set ::ms::temp(toplevel,Y,nw) [_winfo rooty $::ms::addr($w,toplevel)]

            # Get the toplevel dimensions.
            set ::ms::temp(toplevel,height) [_winfo height $::ms::addr($w,toplevel)]
            set ::ms::temp(toplevel,width)  [_winfo width  $::ms::addr($w,toplevel)]

            # Get the toplevel south-east (se) root coordinates.
            set ::ms::temp(toplevel,X,se) [expr { $::ms::temp(toplevel,X,nw)+$::ms::temp(toplevel,width) }]
            set ::ms::temp(toplevel,Y,se) [expr { $::ms::temp(toplevel,Y,nw)+$::ms::temp(toplevel,height) }]
        }
    }

    if { ($X <= $::ms::temp(toplevel,X,nw)) || ($X >= $::ms::temp(toplevel,X,se)) || ($Y <= $::ms::temp(toplevel,Y,nw)) || ($Y >= $::ms::temp(toplevel,Y,se)) } {
        # The mouse cursor is outside the address.

        set ::wait_for_user_response "Unpost"
    }

    return ""
}

## Popdown_MouseWheel
#
# If the listbox can scroll vertically, scroll it by units (**MouseWheel**) or by pages
# (**Control-MouseWheel**), otherwise don't do anything.
#
# Where:
#
# w        Should be the widget real address involved.
#
# x, y     Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#          These values should be provided by the **Mousewheel**/**Control-MouseWheel** event.
#
# amount   Should be the delta value of a **MouseWheel**/**Control-MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#          *Amount* is normally delivered by the **MouseWheel**/**Control-MouseWheel** event
#          with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#          *Units* are used by the **MouseWheel** event while *pages* are used
#          by the **Control-MouseWheel** event.
#
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::palette::Popdown_MouseWheel { w x y amount { what units } } {
    # Check that 'amount' is an integer or a float.
    switch -- [string is double -strict $amount] {
        0   { set amount 120.0 }
        1   {
            if { $amount == 0 } {
                set amount 120
            } else {
                set amount [expr { $amount*1.0 }]
            }
        }
    }

    # Check the scrollmode.
    switch -- $::ms::scrollmode {
        natural { set amount [expr { -1.0*$amount }] }
    }

    # If possible, scroll the listbox vertically.
    try {
        $w.popdown.f.lb yview scroll [expr { -$amount*0.008333333333333333 }] $what
    } on error {} {
        # The popdown listbox cannot scroll vertically.
    }

    # Get the index of the current hovered row.
    set index [$w.popdown.f.lb index @$x,$y]

    # Select and activate the new index.
    $w.popdown.f.lb activate $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    # Set the preview color and its bordercolor (black or white).
    set preview_color [lindex $::ms::data($w,hexadecimals) $index]
    switch -- [string length $preview_color] {
        10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
        13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
        default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    return -code break
}

## Popdown_PageDown
#
# Move the listbox view towards the bottom by one page and
# select the first visible row.
#
# Where:
#
# w   Should be the palette real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_PageDown { w } {
    if { [llength $::ms::data($w,colornames)] > $::ms::current($w,rows) } {
        # Scroll one page towards the bottom of the popdown window.
        $w.popdown.f.lb yview scroll +1 pages

        # Get the index of the current bottom visible row.
        set y     [_winfo height $w.popdown.f.lb]
        set index [$w.popdown.f.lb index @0,$y]

        # Select and activate the current bottom visible row.
        $w.popdown.f.lb activate $index
        $w.popdown.f.lb selection clear 0 end
        $w.popdown.f.lb selection set $index

        # Set the preview color and its bordercolor (black or white).
        set preview_color [lindex $::ms::data($w,hexadecimals) $index]
        switch -- [string length $preview_color] {
            10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $preview_color \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;
    } else {
        ::ms::palette::Popdown_End $w
    }

    return -code break
}

## Popdown_PageUp
#
# Move the listbox view towards the top by one page and
# select the first visible row.
#
# Where:
#
# w   Should be the palette real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_PageUp { w } {
    if { [llength $::ms::data($w,colornames)] > $::ms::current($w,rows) } {
        # Scroll one page towards the top of the popdown window.
        $w.popdown.f.lb yview scroll -1 pages

        # Get the index of the current top visible row.
        set index [$w.popdown.f.lb index @0,0]

        # Select and activate the current top visible row.
        $w.popdown.f.lb activate $index
        $w.popdown.f.lb selection clear 0 end
        $w.popdown.f.lb selection set $index

        # Set the preview color and its bordercolor (black or white).
        set preview_color [lindex $::ms::data($w,hexadecimals) $index]
        switch -- [string length $preview_color] {
            10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $preview_color \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;
    } else {
        ::ms::palette::Popdown_Home $w
    }

    return -code break
}

## Popdown_Select
#
# Manage the lisbox selection event.
#
# Note: The following procedure is a modified version of the 'ttk::palette::LBSelect' procedure.
#       All credits goes to the original author/s.
#
# Where:
#
# w   Should be the palette real address involved.
#
#
# It doesn't return anything.
proc ::ms::palette::Popdown_Select { w } {
    # Get the active index.
    set index [$w.popdown.f.lb index active]

    # Set the palette selection in response to a user action.
    $w.combobox current $index
    $w.combobox selection range 0 end
    $w.combobox icursor end

    # Change the widget dynamic state to '!invalid'.
    ::ms::palette::Pathname_Cmd $w state !invalid

    # Set the preview color and its bordercolor (black or white).
    set preview_color [lindex $::ms::data($w,hexadecimals) $index]
    switch -- [string length $preview_color] {
        10      { set bordercolor [::ms::palette::Black_Or_White $preview_color 12] }
        13      { set bordercolor [::ms::palette::Black_Or_White $preview_color 16] }
        default { set bordercolor [::ms::palette::Black_Or_White $preview_color 8 ] }
    }

    # Apply the changes to the preview object.
    $w.preview configure          -background $preview_color \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor;

    # Release the grab.
    set ::wait_for_user_response "Selection"

    return -code break
}

## Popdown_Shift_MouseWheel
#
# If the listbox can scroll horizontally, scroll it by units (**Shift-MouseWheel**) or by pages
# (**Control-Shift-MouseWheel**), otherwise don't do anything.
#
# Where:
#
# w        Should be the widget real address involved.
#
# x, y     Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#          These values should be provided by the **Shift-Mousewheel**/**Control-Shift-MouseWheel**
#          event.
#
# amount   Should be the delta value of a **Shift-MouseWheel**/**Control-Shift-MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#          *Amount* is normally delivered by the **Shift-MouseWheel**/**Control-Shift-MouseWheel**
#          event with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::palette::Popdown_Shift_MouseWheel { w x y amount { what units } } {
    # Check that 'amount' is an integer or a float.
    switch -- [string is double -strict $amount] {
        0   { set amount 120.0 }
        1   {
            if { $amount == 0 } {
                set amount 120
            } else {
                set amount [expr { $amount*1.0 }]
            }
        }
    }

    # Check the scrollmode.
    switch -- $::ms::scrollmode {
        natural { set amount [expr { -1.0*$amount }] }
    }

    # If possible, scroll the listbox horizontally.
    try {
        $w.popdown.f.lb xview scroll [expr { -$amount*0.008333333333333333 }] $what
    } on error {} {
        # The popdown listbox cannot scroll horizontally.
    }

    return -code break
}

## Popdown_Tab
#
# Manage the **Tab** and **Shift-Tab** events on the palette listbox.
# Set the selection, and navigate to next/prev widget.
#
# Where:
#
# popdown   Should be the popdown window real address involved.
#
# dir       The direction of the tab movement.
#           Allowed values are 'previos' or 'next'.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_Tab { popdown dir } {
    # Get the palette real address.
    set w [_winfo parent [_winfo parent [_winfo parent $popdown]]]

    # Check if there is another widget to focus to.
    switch -- $dir {
        next     { set newFocus [tk_focusNext $w] }
        previous { set newFocus [tk_focusPrev $w] }
    }

    # Chek the next/previous focussable widget found, if any.
    switch -- $newFocus {
        ""      {}
        default {
            # Release the grab.
            set ::wait_for_user_response "Unpost"

            # The [grab release] call in [Unpost] queues events that later
            # re-set the focus (@@@ NOTE: this might not be true anymore).
            # Set new focus later:
            after 0 [list ::ttk::traverseTo $newFocus]
        }
    }

    return ""
}

## Popdown_Touchpad
#
# Manage the **TouchpadScroll** and **Control-TouchpadScroll** events on the popdown window.
#
# Where:
#
# w         Should be the scrollable widget real address involved.
#
# x, y      Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#           These values should be provided by the **TouchpadScroll**/**Control-TouchpadScroll**
#           event.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# amount    Should be the delta value of a **TouchpadScroll**/**Control-TouchpadScroll** event.
#           The delta value represents the rotation units the mouse wheel has been moved.
#           The sign of the value represents the direction the mouse wheel was scrolled.
#           *Amount* is normally delivered by the **TouchpadScroll**/**Control-TouchpadScroll**
#           event with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#           If the value provided as *amount* is not an integer or a float,
#           defaults to **+120.0**.
#
#           Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what      Should be a string that specifies the unit type.
#           Allowed values are the word **units** or **pages**.
#           *Units* are used by the **TouchpadScroll** event while *pages* are used
#           by the **Control-TouchpadScroll** event.
#
#           If not provided, defaults to **units**.
#
# It doesn't return anything.
proc ::ms::palette::Popdown_Touchpad { w x y counter amount { what units } } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # **TouchpadScroll** events can be generated about 60 times per second
    # during a two-finger gesture.
    # This allow the binding script to respond to every 5th **TouchpadScroll** event
    # by testing is the 'counter' is divisible by 5.
    set counter [expr { $counter%5 }]
    if { $counter != 0 } {
        return ""
    }

    # Translate 'amount' in 'delta_x' and 'delta_y'.
    lassign [::tk::PreciseScrollDeltas $amount] delta_x delta_y

    # Check if 'what' is 'units' or 'pages'.
    switch -- $what {
        pages {}
        units {
            # Adjust 'delta_x' and 'delta_y' values, or the movement will be too slow.
            set delta_x [expr { $delta_x*30 }]
            set delta_y [expr { $delta_y*30 }]
        }
        default { return "" }
    }

    # If there is a movement along the X axis, launch '::ms::palette::Popdown_Shift_MouseWheel'.
    if { $delta_x != 0 } {
        ::ms::palette::Popdown_Shift_MouseWheel $w $x $y $delta_x $what
    }

    # If there is a movement along the Y axis, launch '::ms::palette::Popdown_MouseWheel'.
    if { $delta_y != 0 } {
        ::ms::palette::Popdown_MouseWheel $w $x $y $delta_y $what
    }

    return -code break
}

############################
##                        ##
##     BLACK OR WHITE     ##
##                        ##
############################

## Black_Or_White
#
# Compute which color (**black** or **white**) has more contrast against the hexadecimal color provided.
#
# Where:
#
# hex     Should be an hexadecimal color in longform with the **#**.
#
# depth   Optional, should be the color depth of the hexadecimal provided.
#         Allowed values are **8**, **12** or **16** bits.
#            8  --> range [0,255]
#            12 --> range [0,4095]
#            16 --> range [0,65535]
#
#         If not provided, defaults to **8**.
#
# Note: The formula used to compute the contrast is:
#
#          (luma_color+0.05)/(luma_black+0.05) > (luma_white+0.05)/(luma_color+0.05) --> black
#          (luma_color+0.05)/(luma_black+0.05) = (luma_white+0.05)/(luma_color+0.05) --> same contrast (we will choose white in this case)
#          (luma_color+0.05)/(luma_black+0.05) < (luma_white+0.05)/(luma_color+0.05) --> white
#
#       Where:
#
#       luma_black = 0
#       luma_white = 1.0
#       luma_color = (Unadapted_Yr*$r_linear)+(Unadapted_Yg*$g_linear)+(Unadapted_Yb*$b_linear)
#
#       r_linear --> range [0,1.0]
#       g_linear --> range [0,1.0]
#       b_linear --> range [0,1.0]
#
#       Unadapted_Yr = 0.21264461762001413 --> for the sRGB D65
#       Unadapted_Yg = 0.7151663725690272  --> for the sRGB D65
#       Unadapted_Yb = 0.07218900981095855 --> for the sRGB D65
#
#
# Returns the color *black* or *white*, depending which one have more contrast with the color provided.
# Note that the color returned will always be at **8 bit**, there is no need to translate it to
# the same depth of the color provided.
proc ::ms::palette::Black_Or_White { hex { depth 8 } } {
    # Transform the hexadecimal color into an rgb color [0,1.0].
    switch -- $depth {
        8  { set channels [::RGB8_rgb  [::HEX8_RGB8   $hex]] }
        12 { set channels [::RGB12_rgb [::HEX12_RGB12 $hex]] }
        16 { set channels [::RGB16_rgb [::HEX16_RGB16 $hex]] }
    }

    # Trasform the non-linear rgb value into linear rgb ones.
    set r_linear [::ms::inverse_companding::Operation [lindex $channels 0]]
    set g_linear [::ms::inverse_companding::Operation [lindex $channels 1]]
    set b_linear [::ms::inverse_companding::Operation [lindex $channels 2]]

    # Compute the luma of the rgb linear color.
    set luma [expr { (0.21264461762001413*$r_linear)+(0.7151663725690272*$g_linear)+(0.07218900981095855*$b_linear) }]

    # Confront the contrast value against black with the contrast value against white.
    if { (($luma+0.05)*20.0) > (1.05/($luma+0.05)) } {
        return "#000000"
    } else {
        return "#ffffff"
    }
}

#*EOF*