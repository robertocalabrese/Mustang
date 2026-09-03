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

## combobox
#
#### DESCRIPTION:
#
# A combobox combines a text field with a pop-down list of values; the user may select the value of the text field from among
# the values in the list. Combobox widgets support horizontal scrolling with the standard **-xscrollcommand** option and **xview**
# widget command but only if the **-datatype** option for the combobox is **none** or the **-maxlength** option value is **0**.
#
# Note: At the time this command is invoked, there must not exist a window with the same pathname,
#       but the pathname's parents must exists.
#       *Window* may be provided either as a short or as a real address, the address returned will be:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
# Additional options, described below, may be specified on the command line to configure aspects of the combobox.
#
#### SYNOPSIS:
#
#   **combobox**  *window* ?*option* *value*? ... ?*option* *value*?
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
#                                                             If there isn't one, the **-arrowcolor** of the **TCombobox** style
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
#                                                             If there isn't one, the **-arrowsize** of the **TCombobox** style
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
#                                                             If there isn't one, the **-background** of the **TCombobox** style
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
#                                                             If there isn't one, the **-bordercolor** of the **TCombobox** style
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
#                              Note: The combobox **-charwidth** must be a positive integer (**0** not included).
#                                    If it's not, the current theme value will be used instead.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-charwidth** specified in its style.
#                                                             If there isn't one, the **-charwidth** of the **TCombobox** style
#                                                             will be used instead.
#                                                             The **-charwidth** will not abide by its mapping values, if any.
#                                                             It is not supposed to change when the widget state changes.
#
#                              See also **-datatype** and **-maxlength**.
#
# **-class**                   Specifies a class for the widget.
#                              It is mainly used to make bindings for widgets that have the same class.
#
#                              Note: This option may only be provided while creating the widget.
#                                    Attempts to change this value after the widget is created by using the **configure** command,
#                                    will be ignored by mustang.
#
#                              If not provided, defaults to **TCombobox**.
#
# **-cmenu**                   Specifies the contextual menu address that will be assigned to the widget.
#                              If the *cmenu* value is the empty string or invalid, nothing will happen.
#
#                              If not provided, defaults to the empty string.
#
# **-command**                 Specifies a procedure to call after the validation on the data has been done.
#                              This procedure will be launched with two parameters, the real address of the combobox involved and the current
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
#                                                             If there isn't one, the **-cursor** of the **TCombobox** style
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
#                                                             If there isn't one, the **-darkcolor** of the **TCombobox** style
#                                                             will be used instead.
#                                                             The **-darkcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-lightcolor**.
#
# **-datatype**                Specifies the type of data that the combobox will accepts.
#                              Allowed datatypes are:
#
#                                 alnum      --> Only alphanumeric and some puntuaction characters will be allowed inside the combobox.
#                                                The only keys that will work on the keyboard inside the combobox will be [0-9a-zA-Z],
#                                                and the point, comma, minus sign and space characters.
#
#                                 alpha      --> Only alphabetic characters and the space character will be allowed inside the combobox.
#                                                The only keys that will work on the keyboard inside the combobox will be [a-zA-Z] and
#                                                the space character.
#
#                                 integer    --> Only digits characters and the minus sign will be allowed inside the combobox.
#                                                The only keys that will work on the keyboard inside the combobox will be [0-9]
#                                                and the minus sign.
#
#                                 posinteger --> Only digits characters will be allowed inside the combobox.
#                                                The only keys that will work on the keyboard inside the combobox will be [0-9].
#
#                                 posreal    --> Only digits characters and the point character will be allowed inside the combobox.
#                                                The only keys that will work on the keyboard inside the combobox will be [0-9]
#                                                and the point character.
#
#                                 real       --> Only digits characters, the point and minus sign will be allowed inside the combobox.
#                                                The only keys that will work on the keyboard inside the combobox will be [0-9]
#                                                the point character and the minus sign.
#
#                                 none       --> All characters are accepted by the combobox and the keyboard is not blocked in any way.
#
#                              Automatic validation will be performed on each datatypes except **none**.
#                              More precisely:
#
#                                 Alphabetic and alphanumeric datatypes will have only a partial validation, meaning that it will be check
#                                 that the string is composed by the characters allowed by the alpha or alnum datatype and nothing else.
#
#                                 Numeric datatypes (integer, pointeger, posreal and real) will have a complete validation, meaning that it
#                                 will be checked that the string is a proper integer, posinteger, posreal or real number (and corrected if
#                                 it isn't) and if a maxlength is not **0** a maxvalue/minvalue check will be performed on it (truncation will
#                                 happen if the number reaches the maxvalue or minvalue specified).
#
#                              See also **-charwidth**, **-invalidcommand**, **-maxlength**, **-validate** and **-validatecommand**.
#
# **-exportselection**         Specifies a boolean value that indicates whether or not a selection in the widget should be linked to the X
#                              selection. If the selection is exported, then selecting in the widget deselects the current X selection,
#                              selecting outside the widget deselects any widget selection, and the widget will respond to selection retrieval
#                              requests when it has a selection.
#
#                              If a combobox is exporting its selection then it will observe the standard X11 protocols for handling the selection;
#                              combobox selections are available as type **STRING**.
#                              Comboboxes also observe the standard Tk rules for dealing with the input focus.
#                              When a combobox has the input focus it displays an insert cursor to indicate where new characters will be inserted.
#
#                              Comboboxes are capable of displaying strings that are too long to fit entirely within the widget's window.
#                              In this case, only a portion of the string will be displayed; commands described below may be used to change the
#                              view in the window. Comboboxes use the standard **-xscrollcommand** mechanism for interacting with scrollbars.
#
#                              If not provided, defaults to **1**.
#
#                              See also **-datatype** and **-xscrollcommand**.
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
#                                                             If there isn't one, the **-fieldbackground** of the **TCombobox** style
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
#                                                             If there isn't one, the **-focuscolor** of the **TCombobox** style
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
#                                                             If there isn't one, the **-focuswidth** of the **TCombobox** style
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
#                                                             If there isn't one, the **-font** of the **TCombobox** style
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
#                                                             If there isn't one, the **-foreground** of the **TCombobox** style
#                                                             will be used instead.
#                                                             The **-foreground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-background**, **-fieldbackground** and **-font**.
#
# **-invalidcommand**          A script template to evaluate whenever the **-validatecommand** returns **0**.
#                              Providing an empty string will mean to not launch any script when the **-validatecommand** returns **0**.
#
#                              Note that every **-datatype** except **none** will force this value to an the empty string to perform
#                              automatic validation.
#
#                              If not provided, defaults to the empty string.
#
#                              See also **-datatype**, **-validate** and **-validatecommand**.
#
# **-insertcolor**             It's a list that specifies the color to use for the combobox cursor.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-insertcolor** specified in its style.
#                                                             If there isn't one, the **-insertcolor** of the **TCombobox** style
#                                                             will be used instead.
#                                                             The **-insertcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-insertwidth**.
#
# **-insertwidth**             Specifies the width of the combobox cursor.
#                              The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                              (pixels, points, inches, millimeters or centimeters).
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-insertwidth** specified in its style.
#                                                             If there isn't one, the **-insertwidth** of the **TCombobox** style
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
#                                                             If there isn't one, the **-justify** of the **TCombobox** style
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
#                                                             If there isn't one, the **-lightcolor** of the **TCombobox** style
#                                                             will be used instead.
#                                                             The **-lightcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-darkcolor**.
#
# **-maxlength**               Specifies an integer that indicates the maximum number of characters that can be inserted inside a
#                              combobox widget. If this value is **0**, then any amount of characters can be inserted inside the combobox
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
#                              See also **-charwidth**, **-datatype**, **-validate** and **-xscrollcommand**.
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
#                                                             If there isn't one, the **-padding** of the **TCombobox** style
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
#                                                             If there isn't one, the **-placeholderforeground** of the **TCombobox** style
#                                                             will be used instead.
#                                                             The **-placeholderforeground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-font**, **-justify** and **-placeholder**.
#
# **-posthook**                Specifies a procedure to call just after the destroy of the popdown window.
#                              This procedure will be launched with one parameter, the real address of the combobox involved.
#                              Providing an empty string will mean to not launch any procedure after the popdown window is destroyed.
#
#                              If not provided, defaults to the empty string.
#
# **-prehook**                 Specifies a procedure to call just before the creation of the popdown window.
#                              This procedure will be launched with one parameter, the real address of the combobox involved.
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
#                                                             If there isn't one, the **-selectbackground** of the **TCombobox** style
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
#                                                             If there isn't one, the **-selectborderwidth** of the **TCombobox** style
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
#                                                             If there isn't one, the **-selectforeground** of the **TCombobox** style
#                                                             will be used instead.
#                                                             The **-selectforeground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-selectbackground** and **-selectborderwidth**.
#
# **-state**                   Specifies the state for the widget.
#                              May be set to **normal**, **readonly** or **disabled**.
#                              This is a write-only option: setting it changes the widget state, but the state widget command does not
#                              affect the *-state* option.
#
#                              If not provided, defaults to **normal**.
#
# **-style**                   Specifies a custom widget style.
#                              If not provided, defaults to **TCombobox**.
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
# **-textvariable**            Specifies the name of a global variable whose value is linked to the combobox widget's contents.
#                              Whenever the variable changes value, the widget's contents are updated, and vice versa.
#
#                              If not provided, defaults to the empty string.
#
# **-validate**                Specifies the mode in which validation should operate.
#                              There are two main validation modes:
#
#                                 *prevalidation* --> The **-validatecommand** is evaluated prior to each edit and the return value is
#                                                     used to determine whether to accept or reject the change.
#                                 *revalidation*  --> The **-validatecommand** is evaluated to determine whether the current value is valid.
#
#                              The **-validate** option determines when validation occurs; it may be set to any of the following values:
#
#                                 none     --> The validation will only occur when specifically requested by the validate widget command.
#                                 focus    --> The combobox is revalidated when the combobox receives or loses focus.
#                                 focusin  --> The combobox is revalidated when the combobox receives focus.
#                                 focusout --> The combobox is revalidated when the combobox loses focus.
#                                 key      --> The combobox will be prevalidated prior to each edit (specifically, whenever the insert or delete
#                                              widget commands are called). If prevalidation fails, the edit is rejected.
#                                 all      --> Validation is performed for all above conditions.
#
#                              Note that every **-datatype** except **none** will force this value to **key** to perform automatic validation.
#
#                              The **-invalidcommand** is evaluated whenever the **-validatecommand** returns a false value.
#                              The **-validatecommand** and **-invalidcommand** may modify the combobox widget's value via the widget insert or
#                              delete commands, or by setting the linked **-textvariable**.
#                              If either does so during prevalidation, then the edit is rejected regardless of the value returned by the
#                              **-validatecommand**. If **-validatecommand** is empty, validation always succeeds.
#
#                              If not provided, defaults to none.
#
#                              See also **-datatype**, **-invalidcommand** and **-validatecommand**.
#
# **-validatecommand**         A script template to evaluate whenever validation is triggered.
#                              If set to the empty string, validation is disabled.
#                              The script must return a boolean value.
#
#                              Note that every **-datatype** except **none** will force this value to an internal procedure to perform
#                              automatic validation.
#
#                              Note that the mustang combobox widget only disables validation if one of the validation scripts raises an error,
#                              or if **-validatecommand** does not return a valid boolean value. (Thus, it is not necessary to re-enable validation
#                              after modifying the combobox value in a validation script).
#
#                              If not provided, defaults to the empty string.
#
#                              See also **-datatype**, **-invalidcommand** and **-validate**.
#
# **-values**                  Specifies the list of values to display in the popdown window.
#                              These values needs to be coherent with the **datatype** specified.
#                              The values will be automatically sorted by mustang.
#
#                              If not provided or if provided as an empty string, defaults to the internal list of values for the datatype provided.
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
#                              Note that every **-datatype** except **none** will force this value to the empty string unless the **maxlength**
#                              value is **0**.
#
#                              If not provided, defaults to the empty string.
#
#                              See also **-datatype** and **-maxlength**.
#
#### WIDGET COMMAND:
#
# The combobox command creates a new command whose name is the same as the pathname of the combobox's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the combobox widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for combobox widgets:
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
#     *Option* may be one of the widget options accepted by the combobox command (See **WIDGET OPTIONS**).
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
#     If *newIndex* is supplied, sets the combobox value to the element at position *newIndex* in the list of **-values** provided (in addition
#     to integers, the **end** index is supported and indicates the last element of the list, moreover the same simple interpretation as for the
#     command **string index** is supported, with simple integer index arithmetic and indexing relative to **end**).
#     Otherwise, returns the index of the current value in the list of **-values** provided or the empty string if the current value does not
#     appear in the list.
#
#   *window* **delete** *first* ?*last*?
#     Delete one or more elements of the combobox. *First* is the index of the first character to delete, and *last* is the
#     index of the character just after the last one to delete. If *last* is not specified it defaults to *first*+1,
#     i.e. a single character is deleted.
#     This command returns the empty string.
#
#   *window* **get**
#     Returns the combobox's string.
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
#     This command is used to adjust the selection within a combobox. It has several forms, depending on option:
#
#       *window* **selection** **clear**
#         Clear the selection if it is currently in this widget.
#         If the selection is not in this widget then the command has no effect.
#         Returns the empty string.
#
#       *window* **selection** **present**
#         Returns **1** if there is are characters selected in the combobox, **0** if nothing is selected.
#
#       *window* **selection** **range** *start* *end*
#         Sets the selection to include the characters starting with the one indexed by *start* and ending with the one
#         just before *end*.
#         If *end* refers to the same character as *start* or an earlier one, then the combobox's selection is cleared.
#
#   *window* **set** *value*
#     Sets the value of the combobox to *value*.
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
#     Force revalidation, independent of the conditions specified by the **-validate** option.
#     Returns **0** if validation fails, **1** if it succeeds.
#     Sets or clears the invalid state accordingly.
#
#     See the **-validate** option for more info.
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
# Many of the combobox widget commands take one or more indices as arguments.
# An index specifies a particular character in the combobox's string, in any of the following ways:
#
#   **number**
#      Specifies the character as a numerical index, where **0** corresponds to the first character in the string.
#
#   **@number**
#      In this form, number is treated as an x-coordinate in the combobox's window; the character spanning that
#      x-coordinate is used. For example, **@0** indicates the left-most character in the window.
#
#   **end**
#      Indicates the character just after the last one in the combobox's string.
#      This is equivalent to specifying a numerical index equal to the length of the combobox's string.
#
#   **insert**
#      Indicates the character adjacent to and immediately following the insert cursor.
#
#   **sel.first**
#      Indicates the first character in the selection.
#      It is an error to use this form if the selection is not in the combobox window.
#
#   **sel.last**
#      Indicates the character just after the last one in the selection.
#      It is an error to use this form if the selection is not in the combobox window.
#
# Abbreviations may be used for any of the forms above, e.g.  **e** or **sel.l**.
# In general, out-of-range indices are automatically rounded to the nearest legal value.
# Indexes support the same simple interpretation as for the command string index, with simple integer index arithmetic
# and indexing relative to end.
#
#### VALIDATION SCRIPT SUBSTITUTIONS:
#
# It is possible to perform percent substitutions on the **-validatecommand** and **-invalidcommand**, just as in a
# bind script. The following substitutions are recognized:
#
#   **%d**
#      Type of action: **1** for insert prevalidation, **0** for delete prevalidation, or **-1** for revalidation.
#
#   **%i**
#      Index of character string to be inserted/deleted, if any, otherwise **-1**.
#
#   **%P**
#      In prevalidation, the new value of the combobox if the edit is accepted.
#      In revalidation, the current value of the combobox.
#
#   **%s**
#      The current value of combobox prior to editing.
#
#   **%S**
#      The text string being inserted/deleted, if any, an empty string otherwise.
#
#   **%v**
#      The current value of the **-validate** option.
#
#   **%V**
#      The validation condition that triggered the callback (*key*, *focusin*, *focusout* or *forced*).
#
#   **%W**
#      The name of the combobox widget.
#
#### AUTOMATIC VALIDATIONS:
#
# As the entry widget, the combobox performs automatic validation of the value inserted by the user unless its **-datatype**
# is **none**. But the combobox widget goes further (due to the fixed list of values that can be inserted) and uses two types
# of validations (depending on its **-datatype**):
#
#    **alpha**      -
#    **alnum**      --> An *alphabetic inexact search* will be performed.
#    **integer**    -
#    **posinteger** -
#    **posreal**    -
#    **real**       --> A *numerical inexact search* will be performed.
#
###### ALPHABETIC INEXACT SEARCH:
#
# This validation will search inside the list of values associated with the combobox for the items that have the maximum consecutive
# characters in common with *value* and then, after sorted them out, chooses the first in alphabetical order.
#
# Note that the maximum consecutive characters will be counted from the start of the word and any items that do not start with the
# same character of *value* will be discarded and counted with having zero consecutive characters even if all the other characters matches
# the ones in the rest of value. If there are no matches, the first value of the list or the last validated value will be used instead
# (depending if its a keypress validation or the final string validation).
#
# For example if we have the following list of values:
#
#    "London" "Madrid" "Mari" "Milan" "Milwaukee" "Minneapolis" "Moscow" "New York"
#
# The value *Paris* will be matched by the first value of the list (*London* in this case) or by the last validated value.
# The value *M*     will be matched by *Madrid*.
# The value *Mi*    will be matched by *Milan*.
# The value *Mil*   will be matched by *Milan*.
# The value *Milw*  will be matched by *Milwaukee*.
# The value *Milwo* will be matched by *Milwaukee*.
# ... and so on and so forth ...
#
###### NUMERICAL INEXACT SEARCH:
#
# This validation will search the list of values associated with the combobox for the item that is arithmetically closer to *value*.
# If *value* is less than the first item than the first item will be matched, if it's greater then the last item then the last item
# will be matched, otherwise it start to analize the items two at the times (for example the first and the second one), if *value*
# is not enclosed by those items, it analizes the next two (the second and the third one) and so on and so forth until it finds two
# items that enclose *value*. Once it finds these items, it calculates the distance between the items and *value* itself, and will
# match the item that has the minor distance. If the two distance are the same, the bigger item will be matched.
#
# For example if we have the following list of values:
#
#    "1.0" "5.0" "10.0" "15.0" "20.0"
#
# The value "0.5"   will be macthed by "1.0"
# The value "1.0"   will be macthed by "1.0"
# The value "10.5"  will be matched by "10.0"
# The value "12.5"  will be matched by "15.0"
# The value "14.0"  will be matched by "15.0"
# The value "16.0"  will be matched by "15.0"
# The value "157.0" will be matched by "20.0"
# ... and so on and so forth ...
#
#### STATES:
#
# The combobox widget supports the **disabled**, **readonly** and **normal** state.
#
# In the **disabled** state, no insert cursor is displayed, the text cannot be selected, the combobox cannot be edited
# (specifically: the insert and delete commands have no effect) and the popdown window cannot be displayed.
#
# In the **readonly** state, no insert cursor is displayed, the text can be selected (depending on the theme), the combobox
# cannot be edited (specifically: the insert and delete commands have no effect) and the popdown window can be used to
# change the widget textarea value.
#
# In the **normal** state, the insert cursor is displayed, the text can be selected, the combobox can be edited and the
# popdown window can be also used to change the widget textarea value.
#
# Note that changes to the linked **-textvariable** will still be reflected in the combobox, even if it is **disabled**.
#
#### STYLING OPTIONS:
#
# Default style name: **TCombobox**
#
# An optional style **Popdown** is used to configure the popdown windows.
#
# Every combobox styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# The following combobox styling options are allowed only for themes that follows the **clam** engine (like the
# **Halo** theme) and ignored by any other engine:
#
#   **-bordercolor**
#   **-darkcolor**
#   **-lightcolor**
#
# The following combobox styling options are allowed only for themes that do not follows the **clam** engine:
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
# Mustang automatically creates several bindings for the comboboxs in order to facilitate the developer work and
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
#     mousewheel event).
#
# 2.  **Shift-MouseWheel** events will scroll one unit towards the left or the right of the popdown window (depending on the direction of
#     the mousewheel event).
#
# 3.  **Control-MouseWheel** events will scroll one page towards the top or the bottom of the popdown window (depending on the direction
#     of the mousewheel event).
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
#            the bottom (depending on the direction of the touchpad event).
#
# 6.  **Control-TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#
#        1 - **Control-TouchpadScroll** events along the X axis will try will scroll the popdown window scrollbar one page towards the
#            left or the right (depending on the direction of the touchpad event).
#
#        2 - **Control-TouchpadScroll** events along the Y axis will try will scroll the popdown window scrollbar one page towards the
#            top or the bottom (depending on the direction of the touchpad event).
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
# 5.  Hovering the mouse pointer over a row of the popdown window will select that row.
#
# 6.  Pressing the left mouse button upon a selected row will cause the item of that row to be picked up and the popdown window
#     to be closed. Analogously the 'Return' and 'space' keys will pick up the current selection and close the popdown window.
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
#     the datatype of the combobox allows it, the widget textarea will automatically scroll to make more text visible (if there
#     is more text off-screen on the side where the mouse left the window).
#
# The following behavior will happen if the combobox widget has the focus and its state is normal.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  If any normal printing characters are typed in an widget textarea (according to its datatype), they are inserted at the
#     point of the insert cursor.
#
# 2.  The **Left** and **Right** keys move the insert cursor one character to the left or right; they also clear any selection in
#     the widget textarea. If **Shift-Left** or **Shift-Right** is typed then the insertion cursor moves and the selection is
#     extended to include the new character. **Control-Left** and **Control-Right** move the insert cursor by words, and
#     **Control-Shift-Left** and **Control-Shift-Right** move the insert cursor by words and also extend the selection.
#
# 3.  The **Down** key will display the popdown window and selects the closest match to the value of the combobox textarea.
#     If none are found, the first element of the list will be selected.
#
# 4.  The **Home** key move the insert cursor to the beginning of the widget textarea  and clears any previous selection.
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
#   # Create the values lists.
#   set alnum_values   [list Albatross Crow Eagle Falcon Hummingbird Parrot Pidgeon Osprey Quail Vulture]
#   set integer_values [list 100 200 300 400 500 600 700 800 900 1000]
#   set none_values    [list Bear Cat Dog Duck Elephant Horse Lion Panther Tiger Whale]
#
#   # Create comboboxes of different datatypes and states.
#   combobox .cb1 -charwidth 11 \
#                   -command [list ::AfterValidate] \
#                  -datatype alnum \
#                 -maxlength 11 \
#                  -posthook [list ::Posthook] \
#                   -prehook [list ::Prehook] \
#                      -rows 4 \
#                     -state normal \
#                     -style TCombobox \
#                    -values $alnum_values;
#
#   combobox .cb2 -charwidth 11 \
#                   -command [list ::AfterValidate] \
#                  -datatype integer \
#                 -maxlength 4 \
#                  -posthook [list ::Posthook] \
#                   -prehook [list ::Prehook] \
#                      -rows 4 \
#                     -state normal \
#                     -style TCombobox \
#                    -values $integer_values;
#
#   combobox .cb3 -charwidth 11 \
#                   -command [list ::AfterValidate] \
#                  -datatype none \
#                 -maxlength 8 \
#                  -posthook [list ::Posthook] \
#                   -prehook [list ::Prehook] \
#                      -rows 4 \
#                     -state normal \
#                     -style TCombobox \
#                    -values $none_values;
#
#   combobox .cb4 -charwidth 11 \
#                   -command [list ::AfterValidate] \
#                  -datatype alnum \
#                 -maxlength 11 \
#                  -posthook [list ::Posthook] \
#                   -prehook [list ::Prehook] \
#                      -rows 4 \
#                     -state readonly \
#                     -style TCombobox \
#                    -values $alnum_values;
#
#   combobox .cb5 -charwidth 11 \
#                   -command [list ::AfterValidate] \
#                  -datatype integer \
#                 -maxlength 4 \
#                  -posthook [list ::Posthook] \
#                   -prehook [list ::Prehook] \
#                      -rows 4 \
#                     -state readonly \
#                     -style TCombobox \
#                    -values $integer_values;
#
#   combobox .cb6 -charwidth 11 \
#                   -command [list ::AfterValidate] \
#                  -datatype none \
#                 -maxlength 8 \
#                  -posthook [list ::Posthook] \
#                   -prehook [list ::Prehook] \
#                      -rows 4 \
#                     -state readonly \
#                     -style TCombobox \
#                    -values $none_values;
#
#   combobox .cb7 -charwidth 11 \
#                   -command [list ::AfterValidate] \
#                  -datatype alnum \
#                 -maxlength 11 \
#                  -posthook [list ::Posthook] \
#                   -prehook [list ::Prehook] \
#                      -rows 4 \
#                     -state disabled \
#                     -style TCombobox \
#                    -values $alnum_values;
#
#   combobox .cb8 -charwidth 11 \
#                   -command [list ::AfterValidate] \
#                  -datatype integer \
#                 -maxlength 4 \
#                  -posthook [list ::Posthook] \
#                   -prehook [list ::Prehook] \
#                      -rows 4 \
#                     -state disabled \
#                     -style TCombobox \
#                    -values $integer_values;
#
#   combobox .cb9 -charwidth 11 \
#                   -command [list ::AfterValidate] \
#                  -datatype none \
#                 -maxlength 8 \
#                  -posthook [list ::Posthook] \
#                   -prehook [list ::Prehook] \
#                      -rows 4 \
#                     -state disabled \
#                     -style TCombobox \
#                    -values $none_values;
#
#   # Pack all the comboboxes.
#   pack .cb1 -pady [list 20 10] -padx [list 50 50]
#   pack .cb2 -pady [list 10 10] -padx [list 50 50]
#   pack .cb3 -pady [list 10 10] -padx [list 50 50]
#   pack .cb4 -pady [list 10 10] -padx [list 50 50]
#   pack .cb5 -pady [list 10 10] -padx [list 50 50]
#   pack .cb6 -pady [list 10 10] -padx [list 50 50]
#   pack .cb7 -pady [list 10 10] -padx [list 50 50]
#   pack .cb8 -pady [list 10 10] -padx [list 50 50]
#   pack .cb9 -pady [list 10 20] -padx [list 50 50]
#
#   # Focus the first combobox.
#   focus .cb1
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
#       chan puts "$w --> $value"
#   }
#
#   proc ::Posthook { w } {
#       chan puts "$w --> Posthook procedure launched."
#   }
#
#   proc ::Prehook { w } {
#       chan puts "$w --> Prehook procedure launched."
#   }
package provide ::ms::combobox 0.1

################################
##                            ##
##     _COMBOBOX BINDINGS     ##
##                            ##
################################

# Activate/Deactivate
_bind _Combobox <Activate>   { ::ms::combobox::Pathname_Cmd %W state !background; break }
_bind _Combobox <Deactivate> { ::ms::combobox::Pathname_Cmd %W state  background; break }

# Allowing some modifiers combination.
switch -- [_tk windowingsystem] {
    aqua {
        _bind _Combobox <Option-KeyPress>         { # Enable binding }
        _bind _Combobox <Option-Shift-KeyPress>   { # Enable binding }
        _bind _Combobox <Control-KeyPress>        { # Enable binding }
        _bind _Combobox <Control-Option-KeyPress> { # Enable binding }
        _bind _Combobox <Control-Shift-KeyPress>  { # Enable binding }
        _bind _Combobox <Command-KeyPress>        { # Enable binding }
        _bind _Combobox <Command-Shift-KeyPress>  { # Enable binding }
    }
    default {
        _bind _Combobox <Alt-KeyPress>           { # Enable binding }
        _bind _Combobox <Alt-Shift-KeyPress>     { # Enable binding }
        _bind _Combobox <Control-KeyPress>       { # Enable binding }
        _bind _Combobox <Control-Alt-KeyPress>   { # Enable binding }
        _bind _Combobox <Control-Shift-KeyPress> { # Enable binding }
        _bind _Combobox <Meta-KeyPress>          { # Enable binding }
        _bind _Combobox <Meta-Shift-KeyPress>    { # Enable binding }
    }
}

# Backspace/Delete keys
_bind _Combobox <KeyPress-BackSpace> { # Enable binding }
_bind _Combobox <KeyPress-Delete>    { # Enable binding }
_bind _Combobox <KeyPress-KP_Delete> { ::ttk::entry::Delete %W; break }

# Buttonpress
_bind _Combobox <ButtonPress-1>        { ::ms::combobox::ButtonPress %W %x %y "";  break }
_bind _Combobox <Shift-ButtonPress-1>  { ::ms::combobox::ButtonPress %W %x %y "s"; break }
_bind _Combobox <Double-ButtonPress-1> { ::ms::combobox::ButtonPress %W %x %y "2"; break }
_bind _Combobox <Triple-ButtonPress-1> { ::ms::combobox::ButtonPress %W %x %y "3"; break }
_bind _Combobox <B1-Motion>            { ::ms::Drag %W %x %y; break }

_bind _Combobox <Button-2>         { ::ms::Scan_Or_Paste %W %x "Button-2"; break }
_bind _Combobox <B2-Motion>        { ::ms::Scan_Or_Paste %W %x "B2-Motion"; break }
_bind _Combobox <ButtonRelease-2>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-2"; break }

_bind _Combobox <Button-3>         { ::ms::Scan_Or_Paste %W %x "Button-3"; break }
_bind _Combobox <B3-Motion>        { ::ms::Scan_Or_Paste %W %x "B3-Motion"; break }
_bind _Combobox <ButtonRelease-3>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-3"; break }

# Contextual menu
_bind _Combobox <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Clear/Copy/Cut/Paste
_bind _Combobox <<Clear>> { ::ms::Clear %W; break }
_bind _Combobox <<Copy>>  { ::ms::Copy  %W; break }
_bind _Combobox <<Cut>>   { ::ms::Cut   %W; break }
_bind _Combobox <<Paste>> { ::ms::Paste %W CLIPBOARD; break }

# Cursor management.
_bind _Combobox <Motion> { ::ms::Set_Cursor %W %x %y; break }

# Destroy
_bind _Combobox <Destroy> { ::ms::combobox::Destroy %W; break }

# Enter/Leave
_bind _Combobox <Enter> { ::ms::combobox::Pathname_Cmd %W state  hover; break }
_bind _Combobox <Leave> { ::ms::combobox::Pathname_Cmd %W state !hover; break }

# Escape key
_bind _Combobox <KeyPress-Escape> { ::ms::Escape %W; break }

# F keys
_bind _Combobox <Fn-KeyPress> { # Enable binding }

# FocusIn/FocusOut
_bind _Combobox <FocusIn>  { ::ms::combobox::FocusIn  %W; break }
_bind _Combobox <FocusOut> { ::ms::combobox::FocusOut %W; break }

# Insert cursor movements.
_bind _Combobox <<LineEnd>>   { ::ttk::entry::Move %W end; break }
_bind _Combobox <<LineStart>> { ::ttk::entry::Move %W home; break }
_bind _Combobox <<NextChar>>  { ::ttk::entry::Move %W nextchar; break }
_bind _Combobox <<NextLine>>  { ::ms::combobox::Post %W; break }
_bind _Combobox <<NextWord>>  { ::ttk::entry::Move %W nextword; break }
_bind _Combobox <<PrevChar>>  { ::ttk::entry::Move %W prevchar; break }
_bind _Combobox <<PrevWord>>  { ::ttk::entry::Move %W prevword; break }

_bind _Combobox <<SelectLineEnd>>   { ::ttk::entry::Extend %W end; break }
_bind _Combobox <<SelectLineStart>> { ::ttk::entry::Extend %W home; break }
_bind _Combobox <<SelectNextChar>>  { ::ttk::entry::Extend %W nextchar; break }
_bind _Combobox <<SelectNextWord>>  { ::ttk::entry::Extend %W selectnextword; break }
_bind _Combobox <<SelectPrevChar>>  { ::ttk::entry::Extend %W prevchar; break }
_bind _Combobox <<SelectPrevWord>>  { ::ttk::entry::Extend %W prevword; break }

_bind _Combobox <<SelectAll>>  { %W selection range 0 end; break }
_bind _Combobox <<SelectNone>> { %W selection clear; break }

# Enabling only some keys depending on the datatype specified for the widget.
_bind _Combobox <KeyPress> { ::ms::combobox::KeyPress %W %A; break }

# Return
_bind _Combobox <KeyPress-Return>   { ::ms::combobox::Return %W; break }
_bind _Combobox <KeyPress-KP_Enter> { ::ms::combobox::Return %W; break }

# Tab/Shift-Tab keys
_bind _Combobox <KeyPress-Tab> { # Enable binding }
switch -- [_tk windowingsystem] {
    x11 {
        _bind _Combobox <KeyPress-ISO_Left_Tab> { # Enable binding }

        # This seems to be correct on *some* HP systems.
        catch { _bind _Combobox <KeyPress-hpBackTab> { # Enable binding } }
    }
    aqua  { _bind _Combobox <KeyPress-ISO_Left_Tab> { # Enable binding } }
    win32 { _bind _Combobox <Shift-KeyPress-Tab>    { # Enable binding } }
}

# Enabling window traversal navigation.
_bind _Combobox <<PageLeft>>  { # Enable binding }
_bind _Combobox <<PageRight>> { # Enable binding }
_bind _Combobox <<PageUp>>    { # Enable binding }
_bind _Combobox <<PageDown>>  { # Enable binding }

# Mousewheel and Touchpad

# If the widget is in its **normal** or **readonly** state and the items list is not empty, scroll the items
# list without displaying the popdown window, otherwise try to find the innermost widget's scrollable parent
# with an active vertical scrollbar and move that scrollbar by one unit up or down (depending on the
# mousewheel direction). If none of the widget's parents meets the required condition, nothing will happen.
_bind _Combobox <MouseWheel> { ::ms::combobox::MouseWheel %W %D; break }

# If the widget is in its **normal** state and has the focus, move the insert cursor by one character
# towards the left or the right (depending on the direction of the mousewheel event), otherwise try to
# find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
# by one unit left or right (again, depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, nothing will happen.
_bind _Combobox <Shift-MouseWheel> { ::ms::combobox::Shift_MouseWheel %W %D; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Combobox <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Combobox <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - View the **Shift-MouseWheel** event.
#   2 - View the **MouseWheel** event.
_bind _Combobox <TouchpadScroll> { ::ms::combobox::Touchpad %W %# %D; break }

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
_bind _Combobox <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **combobox** package.
namespace eval ::ms::combobox {
    # Set the 'non styleable' combobox option list.
    set ::ms::combobox(non_styleable,options) [list class \
                                                    cmenu \
                                                    command \
                                                    datatype \
                                                    exportselection \
                                                    invalidcommand \
                                                    maxlength \
                                                    placeholder \
                                                    posthook \
                                                    prehook \
                                                    state \
                                                    style \
                                                    takefocus \
                                                    textvariable \
                                                    validate \
                                                    validatecommand \
                                                    values \
                                                    xscrollcommand];

    # Set the 'styleable' combobox option list.
    set ::ms::combobox(styleable,options) [list arrowcolor \
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
                                                selectforeground];

    # Set the default 'non-styleable' combobox options values.
    set ::ms::default(combobox,class)           TCombobox
    set ::ms::default(combobox,cmenu)           {}
    set ::ms::default(combobox,command)         {}
    set ::ms::default(combobox,datatype)        none
    set ::ms::default(combobox,exportselection) 1
    set ::ms::default(combobox,invalidcommand)  {}
    set ::ms::default(combobox,maxlength)       0
    set ::ms::default(combobox,placeholder)     {}
    set ::ms::default(combobox,posthook)        {}
    set ::ms::default(combobox,prehook)         {}
    set ::ms::default(combobox,state)           normal
    set ::ms::default(combobox,style)           TCombobox
    set ::ms::default(combobox,takefocus)       1
    set ::ms::default(combobox,textvariable)    {}
    set ::ms::default(combobox,validate)        none
    set ::ms::default(combobox,validatecommand) {}
    set ::ms::default(combobox,values)          {}
    set ::ms::default(combobox,xscrollcommand)  {}

    # Note: The default 'styleable' combobox options values are always defined inside the current theme.
}

# Rename the original Tk **ttk::combobox** command.
rename ttk::combobox _ttk_combobox

# Create aliases for the mustang **combobox** command.
interp alias {} combobox      {} ::ms::combobox::Command
interp alias {} ttk::combobox {} ::ms::combobox::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **combobox** and **ttk::combobox** widgets commands.
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
proc ::ms::combobox::Command { window { args "" } } {
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
            set ::ms::default($w,class)           $::ms::default(combobox,class)
            set ::ms::default($w,cmenu)           $::ms::default(combobox,cmenu)
            set ::ms::default($w,command)         $::ms::default(combobox,command)
            set ::ms::default($w,datatype)        $::ms::default(combobox,datatype)
            set ::ms::default($w,exportselection) $::ms::default(combobox,exportselection)
            set ::ms::default($w,invalidcommand)  $::ms::default(combobox,invalidcommand)
            set ::ms::default($w,maxlength)       $::ms::default(combobox,maxlength)
            set ::ms::default($w,placeholder)     $::ms::default(combobox,placeholder)
            set ::ms::default($w,posthook)        $::ms::default(combobox,posthook)
            set ::ms::default($w,prehook)         $::ms::default(combobox,prehook)
            set ::ms::default($w,state)           $::ms::default(combobox,state)
            set ::ms::default($w,style)           $::ms::default(combobox,style)
            set ::ms::default($w,takefocus)       $::ms::default(combobox,takefocus)
            set ::ms::default($w,textvariable)    $::ms::default(combobox,textvariable)
            set ::ms::default($w,validate)        $::ms::default(combobox,validate)
            set ::ms::default($w,validatecommand) $::ms::default(combobox,validatecommand)
            set ::ms::default($w,values)          $::ms::default(combobox,values)
            set ::ms::default($w,xscrollcommand)  $::ms::default(combobox,xscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)           $::ms::default(combobox,class)
            set ::ms::current($w,cmenu)           $::ms::default(combobox,cmenu)
            set ::ms::current($w,command)         $::ms::default(combobox,command)
            set ::ms::current($w,datatype)        $::ms::default(combobox,datatype)
            set ::ms::current($w,exportselection) $::ms::default(combobox,exportselection)
            set ::ms::current($w,invalidcommand)  $::ms::default(combobox,invalidcommand)
            set ::ms::current($w,maxlength)       $::ms::default(combobox,maxlength)
            set ::ms::current($w,placeholder)     $::ms::default(combobox,placeholder)
            set ::ms::current($w,posthook)        $::ms::default(combobox,posthook)
            set ::ms::current($w,prehook)         $::ms::default(combobox,prehook)
            set ::ms::current($w,state)           $::ms::default(combobox,state)
            set ::ms::current($w,style)           $::ms::default(combobox,style)
            set ::ms::current($w,takefocus)       $::ms::default(combobox,takefocus)
            set ::ms::current($w,textvariable)    $::ms::default(combobox,textvariable)
            set ::ms::current($w,validate)        $::ms::default(combobox,validate)
            set ::ms::current($w,validatecommand) $::ms::default(combobox,validatecommand)
            set ::ms::current($w,values)          $::ms::default(combobox,values)
            set ::ms::current($w,xscrollcommand)  $::ms::default(combobox,xscrollcommand)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) combobox

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
            #       To make a combobox styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **combobox** *window* **-background** red
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
                    -datatype {
                        set value [string tolower $value]
                        switch -- $value {
                            alnum      -
                            alpha      -
                            integer    -
                            posinteger -
                            posreal    -
                            real       -
                            none       { set ::ms::current($w,datatype) $value }
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
                    -invalidcommand { set ::ms::current($w,invalidcommand) $value }
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
                            # If not, create one by mirroring the current theme 'TCombobox' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TCombobox]
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
                                          write    [list ::ms::combobox::Check_TextVariable $w]
                            }
                        }
                    }
                    -validate {
                        switch -nocase $value {
                            none     { set ::ms::current($w,validate) none }
                            focus    { set ::ms::current($w,validate) focus }
                            focusin  { set ::ms::current($w,validate) focusin }
                            focusout { set ::ms::current($w,validate) focusout }
                            key      { set ::ms::current($w,validate) key }
                            all      { set ::ms::current($w,validate) all }
                        }
                    }
                    -validatecommand { set ::ms::current($w,validatecommand) $value }
                    -values { set ::ms::current($w,values) $value }
                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::combobox(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TCombobox,$option)

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

            # Check the invalidcommand, validate, validatecommand and xscrollcommand options
            # relative to the datatype option provided.
            switch -- $::ms::current($w,datatype) {
                alnum      -
                alpha      -
                integer    -
                posinteger -
                posreal    -
                real       {
                    set ::ms::current($w,invalidcommand)  {}
                    set ::ms::current($w,validate)        key
                    set ::ms::current($w,validatecommand) [list ::ms::combobox::Validate_KeyPress %W %P]

                    switch -- $::ms::current($w,maxlength) {
                        0       {}
                        default {
                            # Ignore the xscrollcommand provided, if any.
                            set ::ms::current($w,xscrollcommand) {}
                        }
                    }
                }
            }

            # Check if a list of values was provided.
            switch -- [llength $::ms::current($w,values)] {
                0   {
                    # Check the datatype.
                    switch -- $::ms::current($w,datatype) {
                        alnum {
                            set number 1
                            while { $number < 51 } {
                                lappend ::ms::current($w,values) [string cat "Item-" $number]
                                incr number
                            }

                            # Set the current index as the index of the item **Item-0**.
                            set ::ms::data($w,current_index) 0

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::current($w,values)]
                        }
                        integer {
                            set number -25
                            while { $number < 26 } {
                                lappend ::ms::current($w,values) $number
                                incr number
                            }

                            # Set the current index as the index of the item **0**.
                            set ::ms::data($w,current_index) 25
                        }
                        posinteger {
                            set number 0
                            while { $number < 51 } {
                                lappend ::ms::current($w,values) $number
                                incr number
                            }

                            # Set the current index as the index of the item **0**.
                            set ::ms::data($w,current_index) 0
                        }
                        posreal {
                            set number 0
                            while { $number < 51.0 } {
                                lappend ::ms::current($w,values) $number
                                set number [expr { $number+1.0 } ]
                            }

                            # Set the current index as the index of the item **0**.
                            set ::ms::data($w,current_index) 0
                        }
                        real {
                            set number -25.0
                            while { $number < 26.0 } {
                                lappend ::ms::current($w,values) $number
                                set number [expr { $number+1.0 } ]
                            }

                            # Set the current index as the index of the item **0**.
                            set ::ms::data($w,current_index) 25
                        }
                        default {
                            lappend ::ms::current($w,values) Amsterdam Beijing        Cairo           Dublin    Freetown      Gibraltar \
                                                             Hanoi     Havana         Helsinki        Islamabad Jerusalem     Kabul \
                                                             Kingston  "Kuala Lumpur" "La Paz"        Lima      Lisbon        London \
                                                             Madrid    Manila         "Mexico City"   Minx      Monaco        Montevideo \
                                                             Moscow    Nairobi        "New Delhi"     Oslo      "Panama City" Paris \
                                                             Praga     Quito          Reykjavík       Riga      Rome          "San José" \
                                                             San Juan  "San Salvador" "Santo Domingo" Sarajevo  Seoul         Singapore \
                                                             Sofia     Stockholm      Taipei          Tallin    Tirana        Tokyo \
                                                             Tunis     Valletta       Vienna          Warsaw    Washigton     Zagreb;

                            # Set the current index as the index of the item **Amsterdam**.
                            set ::ms::data($w,current_index) 0

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::current($w,values)]
                        }
                    }

                    # Register the sorted values
                    set ::ms::data($w,values) $::ms::current($w,values)

                    # Set the current value as the value corresponding to the '::ms::data($w,current_index)' in '::ms::current($w,values)'.
                    set ::ms::data($w,current_value) [lindex $::ms::current($w,values) $::ms::data($w,current_index)]

                    # Compute the index of the last available item in '::ms::current($w,values)'.
                    set ::ms::data($w,last_available_index) [expr { [llength $::ms::current($w,values)]-1 }]
                }
                default {
                    # Check the datatype.
                    switch -- $::ms::current($w,datatype) {
                        alnum {
                            foreach value $::ms::current($w,values) {
                                # Check every character in value.
                                set i 0
                                while { $i < [string length $value] } {
                                    set char [string index $value $i]
                                    switch -- $char {
                                        " "     -
                                        "."     -
                                        ","     -
                                        "-"     {}
                                        default {
                                            switch -- [string is alnum $char] {
                                                0   { ::ms::Error "One of the values assigned to '$w' is not a valid alphanumeric value, 'value: $value'." $caller_info }
                                            }
                                        }
                                    }

                                    incr i
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -dictionary $::ms::current($w,values)]

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                        }
                        alpha {
                            foreach value $::ms::current($w,values) {
                                # Check every character in value.
                                set i 0
                                while { $i < [string length $value] } {
                                    set char [string index $value $i]
                                    switch -- $char {
                                        " "     {}
                                        default {
                                            switch -- [string is alpha $char] {
                                                0   { ::ms::Error "One of the values assigned to '$w' is not a valid alphabetic value, 'value: $value'." $caller_info }
                                            }
                                        }
                                    }

                                    incr i
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -ascii $::ms::current($w,values)]

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                        }
                        integer {
                            foreach value $::ms::current($w,values) {
                                switch -- [string is integer -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid integer value, 'value: $value'." $caller_info }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -integer $::ms::current($w,values)]
                        }
                        posinteger {
                            foreach value $::ms::current($w,values) {
                                switch -- [string is integer -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid posinteger value, 'value: $value'." $caller_info }
                                    1   {
                                        if { $value < 0 } {
                                            ::ms::Error "One of the values assigned to '$w' is not a valid posinteger value, 'value: $value'." $caller_info
                                        }
                                    }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -integer $::ms::current($w,values)]
                        }
                        posreal {
                            foreach value $::ms::current($w,values) {
                                switch -- [string is double -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid posreal value, 'value: $value'." $caller_info }
                                    1   {
                                        if { $value < 0 } {
                                            ::ms::Error "One of the values assigned to '$w' is not a valid posreal value, 'value: $value'." $caller_info
                                        }
                                    }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -real $::ms::current($w,values)]
                        }
                        real {
                            foreach value $::ms::current($w,values) {
                                switch -- [string is double -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid real value, 'value: $value'." $caller_info }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -real $::ms::current($w,values)]
                        }
                        none {
                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -dictionary $::ms::current($w,values)]

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                        }
                    }

                    # Set the current index as the first one of '::ms::data($w,values)', and get the relative value.
                    set ::ms::data($w,current_index) 0
                    set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $::ms::data($w,current_index)]

                    # Compute the index of the last available item in '::ms::data($w,values)'.
                    set ::ms::data($w,last_available_index) [expr { [llength $::ms::data($w,values)]-1 }]
                }
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

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify',
            #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

            # Agglomerate the padding values.
            set padding ""
            foreach pad $::ms::current($w,padding) {
                append padding "$pad" "-"
            }
            set padding [string trimright $padding "-"]

            ######################
            ##                  ##
            ##     COMBOBOX     ##
            ##                  ##
            ######################

            # Set the widget style name.
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

            # If needed, create the widget style name.
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

                # Add the widget style name to the theme styles list created by mustang.
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

            # Create the combobox widget.
            _ttk_combobox $w           -class $::ms::current($w,class) \
                                      -cursor $cursor \
                             -exportselection $::ms::current($w,exportselection) \
                                        -font $::ms::current($w,font) \
                              -invalidcommand $::ms::current($w,invalidcommand) \
                                      -height $::ms::current($w,rows) \
                                     -justify $::ms::current($w,justify) \
                                 -placeholder $::ms::current($w,placeholder) \
                                 -postcommand {} \
                                        -show "" \
                                       -state $::ms::current($w,state) \
                                       -style $::ms::style($w,widget) \
                                   -takefocus $takefocus \
                                -textvariable $::ms::current($w,textvariable) \
                                    -validate $::ms::current($w,validate) \
                             -validatecommand $::ms::current($w,validatecommand) \
                                      -values $::ms::data($w,values) \
                                       -width $::ms::current($w,charwidth) \
                              -xscrollcommand $::ms::current($w,xscrollcommand);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            # Set the current index in the combobox entry.
            $w current $::ms::data($w,current_index)

            # Set the cursor at the end of the combobox textarea.
            $w icursor end

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TCombobox { _bindtags $w [list $w _Combobox TCombobox $::ms::addr($w,toplevel) all] }
                default   { _bindtags $w [list $w $::ms::current($w,class) _Combobox TCombobox $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::combobox::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::combobox::Pathname_Cmd $w]
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

            # Add the widget address to the combobox classtype widgets real address list.
            lappend ::ms::addr(combobox) $w

            # Add the widget address to the combobox classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),combobox,addrs) $w

            # Add the widget address to the combobox classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),combobox,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the combobox classtype.
            if { $::ms::current($w,style) ni $::ms::style(combobox,classtype) } {
                lappend ::ms::style(combobox,classtype) $::ms::current($w,style)
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
proc ::ms::combobox::Pathname_Cmd { w cmd args } {
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
                        interp invokehidden {} $w $cmd $args
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
                    if { ($option in $::ms::combobox(non_styleable,options)) || ($option in $::ms::combobox(styleable,options)) } {
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
                    foreach option $::ms::combobox(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::combobox(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::combobox(non_styleable,options)) || ($option in $::ms::combobox(styleable,options)) } {
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

                            # Set a variable that indicates if new values or a new datatype have been provided or not.
                            set new_datatype false
                            set new_values   false

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
                                    -datatype {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            alnum      -
                                            alpha      -
                                            integer    -
                                            posinteger -
                                            posreal    -
                                            real       -
                                            none       {
                                                set ::ms::current($w,datatype) $value
                                                set new_datatype true
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
                                    -invalidcommand { set ::ms::current($w,invalidcommand) $value }
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
                                            # If not, create one by mirroring the current theme 'TCombobox' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TCombobox]
                                            }

                                            # Remove the widget address from the combobox classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),combobox,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),combobox,addrs) [lremove $::ms::style($::ms::current($w,style),combobox,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,combobox,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the combobox classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),combobox,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(combobox,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(combobox,classtype) [lremove $::ms::style(combobox,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the combobox classtype.
                                            if { $value ni $::ms::style(combobox,classtype) } {
                                                lappend ::ms::style(combobox,classtype) $value
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
                                                                     write    [list ::ms::combobox::Check_TextVariable $w];
                                                    }
                                                }

                                                # Set the new current textvariable.
                                                set ::ms::current($w,textvariable) $value

                                                # Set a trace in order to perform a validation (if needed) whenever the developer
                                                # changes the value of the variable name provided.
                                                trace add variable $value \
                                                          write    [list ::ms::combobox::Check_TextVariable $w];
                                            }
                                        }
                                    }
                                    -validate {
                                        switch -nocase $value {
                                            none     { set ::ms::current($w,validate) none }
                                            focus    { set ::ms::current($w,validate) focus }
                                            focusin  { set ::ms::current($w,validate) focusin }
                                            focusout { set ::ms::current($w,validate) focusout }
                                            key      { set ::ms::current($w,validate) key }
                                            all      { set ::ms::current($w,validate) all }
                                        }
                                    }
                                    -validatecommand { set ::ms::current($w,validatecommand) $value }
                                    -values {
                                        switch -- [llength $value] {
                                            0       { ::ms::Error "An empty list was assigned to '$w'." $caller_info }
                                            default {
                                                set ::ms::current($w,values) $value
                                                set new_values true
                                            }
                                        }
                                    }
                                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TCombobox,$option)

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
                                }
                            }

                            # Check the invalidcommand, validate, validatecommand and xscrollcommand options
                            # relative to the datatype option provided.
                            switch -- $::ms::current($w,datatype) {
                                alnum      -
                                alpha      -
                                integer    -
                                posinteger -
                                posreal    -
                                real       {
                                    set ::ms::current($w,invalidcommand)  {}
                                    set ::ms::current($w,validate)        key
                                    set ::ms::current($w,validatecommand) [list ::ms::combobox::Validate_KeyPress %W %P]

                                    switch -- $::ms::current($w,maxlength) {
                                        0       {}
                                        default {
                                            # Ignore the xscrollcommand provided, if any.
                                            set ::ms::current($w,xscrollcommand) {}
                                        }
                                    }
                                }
                            }

                            # Check if a new list of values or a new datatype has been provided.
                            if { ($new_value eq "true") || ($new_datatype eq "true") } {
                                # Check the list of values against the datatype.
                                switch -- $::ms::current($w,datatype) {
                                    alnum {
                                        foreach value $::ms::current($w,values) {
                                            # Check every character in value.
                                            set i 0
                                            while { $i < [string length $value] } {
                                                set char [string index $value $i]
                                                switch -- $char {
                                                    " "     -
                                                    "."     -
                                                    ","     -
                                                    "-"     {}
                                                    default {
                                                        switch -- [string is alnum $char] {
                                                            0   { ::ms::Error "One of the values assigned to '$w' is not a valid alphanumeric value, 'value: $value'." $caller_info }
                                                        }
                                                    }
                                                }

                                                incr i
                                            }
                                        }

                                        # Register the sorted values.
                                        set ::ms::data($w,values) [lsort -dictionary $::ms::current($w,values)]

                                        # Register the sorted values in lowercase characters.
                                        set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                                    }
                                    alpha {
                                        foreach value $::ms::current($w,values) {
                                            # Check every character in value.
                                            set i 0
                                            while { $i < [string length $value] } {
                                                set char [string index $value $i]
                                                switch -- $char {
                                                    " "     {}
                                                    default {
                                                        switch -- [string is alpha $char] {
                                                            0   { ::ms::Error "One of the values assigned to '$w' is not a valid alphabetic value, 'value: $value'." $caller_info }
                                                        }
                                                    }
                                                }

                                                incr i
                                            }
                                        }

                                        # Register the sorted values.
                                        set ::ms::data($w,values) [lsort -ascii $::ms::current($w,values)]

                                        # Register the sorted values in lowercase characters.
                                        set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                                    }
                                    integer {
                                        foreach value $::ms::current($w,values) {
                                            switch -- [string is integer -strict $value] {
                                                0   { ::ms::Error "One of the values assigned to '$w' is not a valid integer value, 'value: $value'." $caller_info }
                                            }
                                        }

                                        # Register the sorted values.
                                        set ::ms::data($w,values) [lsort -integer $::ms::current($w,values)]
                                    }
                                    posinteger {
                                        foreach value $::ms::current($w,values) {
                                            switch -- [string is integer -strict $value] {
                                                0   { ::ms::Error "One of the values assigned to '$w' is not a valid posinteger value, 'value: $value'." $caller_info }
                                                1   {
                                                    if { $value < 0 } {
                                                        ::ms::Error "One of the values assigned to '$w' is not a valid posinteger value, 'value: $value'." $caller_info
                                                    }
                                                }
                                            }
                                        }

                                        # Register the sorted values.
                                        set ::ms::data($w,values) [lsort -integer $::ms::current($w,values)]
                                    }
                                    posreal {
                                        foreach value $::ms::current($w,values) {
                                            switch -- [string is double -strict $value] {
                                                0   { ::ms::Error "One of the values assigned to '$w' is not a valid posreal value, 'value: $value'." $caller_info }
                                                1   {
                                                    if { $value < 0 } {
                                                        ::ms::Error "One of the values assigned to '$w' is not a valid posreal value, 'value: $value'." $caller_info
                                                    }
                                                }
                                            }
                                        }

                                        # Register the sorted values.
                                        set ::ms::data($w,values) [lsort -real $::ms::current($w,values)]
                                    }
                                    real {
                                        foreach value $::ms::current($w,values) {
                                            switch -- [string is double -strict $value] {
                                                0   { ::ms::Error "One of the values assigned to '$w' is not a valid real value, 'value: $value'." $caller_info }
                                            }
                                        }

                                        # Register the sorted values.
                                        set ::ms::data($w,values) [lsort -real $::ms::current($w,values)]
                                    }
                                    none {
                                        # Register the sorted values.
                                        set ::ms::data($w,values) [lsort -dictionary $::ms::current($w,values)]

                                        # Register the sorted values in lowercase characters.
                                        set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                                    }
                                }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify',
                            #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

                            # Agglomerate the padding values.
                            set padding ""
                            foreach pad $::ms::current($w,padding) {
                                append padding "$pad" "-"
                            }
                            set padding [string trimright $padding "-"]

                            # If the combobox popdown is currently displayed, release the grab.
                            switch -- [winfo exists $w.popdown] {
                                1   { set ::wait_for_user_response "Unpost" }
                            }

                            ######################
                            ##                  ##
                            ##     COMBOBOX     ##
                            ##                  ##
                            ######################

                            # Set the widget style name.
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

                            # If needed, create the widget style name.
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

                                # Add the widget style name to the theme styles list created by mustang.
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
                            interp invokehidden {} $w configure          -cursor $cursor \
                                                                -exportselection $::ms::current($w,exportselection) \
                                                                           -font $::ms::current($w,font) \
                                                                 -invalidcommand $::ms::current($w,invalidcommand) \
                                                                        -justify $::ms::current($w,justify) \
                                                                    -placeholder $::ms::current($w,placeholder) \
                                                                          -state $::ms::current($w,state) \
                                                                          -style $::ms::style($w,widget) \
                                                                      -takefocus $takefocus \
                                                                   -textvariable $::ms::current($w,textvariable) \
                                                                       -validate $::ms::current($w,validate) \
                                                                -validatecommand $::ms::current($w,validatecommand) \
                                                                          -width $::ms::current($w,charwidth) \
                                                                 -xscrollcommand $::ms::current($w,xscrollcommand);

                            # Check if a new list of values was provided.
                            if { ($new_values eq "true") || ($new_datatype eq "true") {
                                interp invokehidden {} $w configure -values $::ms::current($w,values)

                                # Set the current index as the first one of '::ms::data($w,values)', and get the relative value.
                                set ::ms::data($w,current_index) 0
                                set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $::ms::data($w,current_index)]

                                # Compute the index of the last available item in '::ms::data($w,values)'.
                                set ::ms::data($w,last_available_index) [expr { [llength $::ms::data($w,values)]-1 }]

                                # Clear the widget textarea.
                                interp invokehidden {} $w delete 0 end
                                interp invokehidden {} $w selection clear

                                # Set the current index in the combobox entry.
                                interp invokehidden {} $w current $::ms::data($w,current_index)
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
                    # Find the value in '::ms::data($w,values)' that corrisponds to the current index
                    # displayed in the combobox entry.
                    set value [lindex $::ms::data($w,values) $::ms::data($w,current_index)]

                    # Check the widget datatype.
                    switch -- $::ms::current($w,datatype) {
                        integer    -
                        posinteger { return [lsearch -exact -integer $::ms::current($w,values) $value] }
                        real       -
                        posreal    { return [lsearch -exact -real    $::ms::current($w,values) $value] }
                        default    { return [lsearch -exact -nocase  $::ms::current($w,values) $value] }
                    }
                }
                1   {
                    # Check that the argument provided is an integer.
                    switch -- [string is integer $args] {
                        0   { ::ms::Error "The argument provided is not an index, '$args'" $caller_info }
                    }

                    # Find the index in '::ms::data($w,values)' that corrisponds to the index provided
                    # for '::ms::current($w,values)'.
                    set value [lindex $::ms::current($w,values) $args]
                    switch -- $value {
                        ""      {}
                        default {
                            # Set the new current index and value.
                            set ::ms::data($w,current_value) $value

                            # Check the widget datatype.
                            switch -- $::ms::current($w,datatype) {
                                integer    -
                                posinteger { set ::ms::data($w,current_index) [lsearch -exact -integer $::ms::current($w,values) $value] }
                                real       -
                                posreal    { set ::ms::data($w,current_index) [lsearch -exact -real    $::ms::current($w,values) $value] }
                                default    { set ::ms::data($w,current_index) [lsearch -exact -nocase  $::ms::current($w,values) $value] }
                            }

                            # Clear the widget textarea.
                            interp invokehidden {} $w delete 0 end
                            interp invokehidden {} $w selection clear

                            # Apply the changes.
                            interp invokehidden {} $w current $::ms::data($w,current_index)
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
                        interp invokehidden {} $w $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
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
                    # Check that the first argument of 'args' is the word 'element' or 'sash'.
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

                    try {
                        interp invokehidden {} $w identify $x $y
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -nocase -- $result {
                            textarea { set result "Combobox.textarea" }
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
            # *window* **insert** *index* *string*
            switch -- $::DEBUG {
                1       -
                on      -
                true    -
                active  -
                enabled { chan puts stdout "'insert' is a deprecated mustang combobox command. Use 'set' instead." }
            }

            # Check the widget's state.
            switch -- $::ms::current($w,state) {
                normal {
                    # Check the number of arguments provided.
                    switch -- [llength $args] {
                        2   {
                            set index  [lindex $args 0]
                            set string [lindex $args 1]

                            try {
                                interp invokehidden {} $w insert $index $string
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
        get      -
        validate {
            # Synopsis:
            #
            # *window* **get**
            # *window* **validate**
            switch -- [llength $args] {
                0       { return [interp invokehidden {} $w $cmd] }
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
        set {
            # Synopsis:
            #
            # *window* **set** *value*
            switch -- [llength $args] {
                1   {
                    # Check the widget datatype.
                    switch -- $::ms::current($w,datatype) {
                        integer    -
                        posinteger { set index [lsearch -exact -integer $::ms::data($w,values) $args] }
                        real       -
                        posreal    { set index [lsearch -exact -real    $::ms::data($w,values) $args] }
                        default    { set index [lsearch -exact -nocase  $::ms::data($w,values) $args] }
                    }

                    # Check that the value provided exists inside '::ms::data($w,values)'.
                    switch -- $index {
                        -1      {}
                        default {
                            # Update the current index and value.
                            set ::ms::data($w,current_index) $index
                            set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $index]

                            # Clear the widget textarea.
                            interp invokehidden {} $w delete 0 end
                            interp invokehidden {} $w selection clear

                            # Apply the changes.
                            interp invokehidden {} $w current $index

                            # Execute the command associated with the widget.
                            ::ms::Execute_Widget_Cmd $w
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
        xview {
            # Synopsis:
            #
            # *window* **xview** *option* *args*
            #    *window* **xview**
            #    *window* **xview** *index*
            #    *window* **xview** **moveto** *fraction*
            #    *window* **xview** **scroll** *number* *what*
            switch -- [llength $args] {
                0   { return [interp invokehidden {} $w xview] }
                1   -
                2   -
                3   {
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
# Update any combobox widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::combobox::Style_Update { stylename caller_info } {
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

    # Update all the combobox widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,combobox,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::combobox(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TCombobox,$option)

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

        # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify',
        #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

        # Agglomerate the padding values.
        set padding ""
        foreach pad $::ms::current($w,padding) {
            append padding "$pad" "-"
        }
        set padding [string trimright $padding "-"]

        # If the combobox popdown is currently displayed, release the grab.
        switch -- [winfo exists $w.popdown] {
            1   { set ::wait_for_user_response "Unpost" }
        }

        ######################
        ##                  ##
        ##     COMBOBOX     ##
        ##                  ##
        ######################

        # Set the widget style name.
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

        # If needed, create the widget style name.
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

            # Add the widget style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
        }

        # Initialize the widget mapping.
        set mapping [list ]

        # arrowsize
        switch -- $::ms::managed_by($w,arrowsize) {
            developer { lappend mapping -arrowsize [list pressed $::ms::current($w,arrowsize)] }
            Tk  {
                # Check if a 'arrowsize' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowsize)] {
                    1   { lappend mapping -arrowsize $::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowsize) }
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
        interp invokehidden {} $w configure      -cursor $cursor \
                                                   -font $::ms::current($w,font) \
                                                -justify $::ms::current($w,justify) \
                                            -placeholder $::ms::current($w,placeholder) \
                                                  -style $::ms::style($w,widget) \
                                                  -width $::ms::current($w,charwidth);
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
proc ::ms::combobox::ButtonPress { w x y mode } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { ::ms::combobox::Post $w }
        normal   {
            # Check the cursor location.
            switch -- [interp invokehidden {} $w identify element $x $y] {
                "textarea" {
                    # Check if the widget is focussable or not.
                    switch -- [::ms::Is_Focussable $w] {
                        0   { return "" }
                    }

                    # Check if the widget is already focussed.
                    switch -- [interp invokehidden {} $w instate [list !focus]] {
                        1   {
                            # Focus the widget.
                            _focus -force $w

                            # Change the widget dynamic state to 'focus'.
                            interp invokehidden {} $w state [list focus]
                        }
                    }

                    # Check the press type.
                    switch -- $mode {
                        s       { ::ttk::entry::Shift-Press $w $x }
                        2       { ::ttk::entry::Select      $w $x word }
                        3       { ::ttk::entry::Select      $w $x line }
                        default { ::ttk::entry::Press       $w $x }
                    }
                }
                default { ::ms::combobox::Post $w }
            }
        }
    }

    return ""
}

## Check_TextVariable
#
# Validate the textvariable value, everytime it changes.
#
# Where:
#
# w        Should be the widget real address involved.
#
# name1,
# name2,
# op       Should be the tracing arguments.
#          Do not pass any value, the **trace** command will automatically pass these values.
#
# It doesn't return anything.
proc ::ms::combobox::Check_TextVariable { w name1 name2 op } {
    switch -- $::ms::current($w,datatype) {
        none    {}
        default { ::ms::combobox::Return $w }
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
proc ::ms::combobox::Destroy { w } {
    # If the combobox popdown is currently displayed, release the grab.
    switch -- [winfo exists $w.popdown] {
        1   { set ::wait_for_user_response "Unpost" }
    }

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

    # Remove the widget address from the combobox widgets real address list.
    set index [lsearch -exact $::ms::addr(combobox) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(combobox) [lremove $::ms::addr(combobox) $index] }
    }

    # Remove the widget address from the combobox real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),combobox,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),combobox,addrs) [lremove $::ms::class($::ms::current($w,class),combobox,addrs) $index] }
    }

    # Remove the widget address from the combobox real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),combobox,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),combobox,addrs) [lremove $::ms::style($::ms::current($w,style),combobox,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the combobox classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),combobox,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(combobox,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(combobox,classtype) [lremove $::ms::style(combobox,classtype) $index] }
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

    unset -nocomplain -- ::ms::current($w,arrowcolor) \
                         ::ms::current($w,arrowsize) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,charwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,command) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,datatype) \
                         ::ms::current($w,exportselection) \
                         ::ms::current($w,fieldbackground) \
                         ::ms::current($w,focuscolor) \
                         ::ms::current($w,focuswidth) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,invalidcommand) \
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
                         ::ms::current($w,rows) \
                         ::ms::current($w,selectbackground) \
                         ::ms::current($w,selectborderwidth) \
                         ::ms::current($w,selectforeground) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,validate) \
                         ::ms::current($w,validatecommand) \
                         ::ms::current($w,values) \
                         ::ms::current($w,xscrollcommand);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,current_index) \
                         ::ms::data($w,current_value) \
                         ::ms::data($w,last_available_index) \
                         ::ms::data($w,token) \
                         ::ms::data($w,values) \
                         ::ms::data($w,values,lowercase);

    unset -nocomplain -- ::ms::default($w,arrowcolor) \
                         ::ms::default($w,arrowsize) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,charwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,command) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,datatype) \
                         ::ms::default($w,exportselection) \
                         ::ms::default($w,fieldbackground) \
                         ::ms::default($w,focuscolor) \
                         ::ms::default($w,focuswidth) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,invalidcommand) \
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
                         ::ms::default($w,rows) \
                         ::ms::default($w,selectbackground) \
                         ::ms::default($w,selectborderwidth) \
                         ::ms::default($w,selectforeground) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,textvariable) \
                         ::ms::default($w,validate) \
                         ::ms::default($w,validatecommand) \
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
# Manage the **FocusIn** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    interp invokehidden {} $w state [list focus]

    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        normal {
            # Select all the widget textarea characters.
            interp invokehidden {} $w selection range 0 end
        }
    }

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
proc ::ms::combobox::FocusOut { w } {
    # Check if a contextual menu was assigned to the widget.
    # If not, use the contextual menu of the widget's toplevel.
    set cmenu $::ms::current($w,cmenu)
    switch -- $cmenu {
        ""  { set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu) }
    }

    # If the popdown window of the combobox is currently displayed do not loose the focus (graphically),
    # remove the selection or validate the data.
    switch -- [_winfo exists $w.popdown] {
        1   { return "" }
    }

    # Change the widget dynamic state to '!focus'.
    interp invokehidden {} $w state [list !focus]

    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { set value [interp invokehidden {} $w get] }
        normal {
            # Validate the widget string.
            set value [::ms::combobox::Validate_String $w]

            # Clear the widget field, insert the validated value and put the cursor at the end.
            interp invokehidden {} $w delete 0 end
            interp invokehidden {} $w set $value
            interp invokehidden {} $w icursor end
        }
    }

    # Remove the widget selection, if any.
    interp invokehidden {} $w selection clear

    # If 'value' is different than the previous registered one, register it
    # and launch the external procedure provided, if any.
    if { $value ne $::ms::data($w,current_value) } {
        set ::ms::data($w,current_index) [lsearch -exact $::ms::data($w,values) $value]
        set ::ms::data($w,current_value) $value

        ::ms::Execute_Widget_Cmd $w
    }

    # Cleaning.
    unset -nocomplain -- ::ms::temp($w,pending_execute_cmd)

    return ""
}

## KeyPress
#
# Manage the **Keypress** event on the widget.
# Some keys may be disabled depending on the datatype specified for the widget.
#
# Note: See the **WIDGET OPTIONS** for more info upon valid keys for each datatypes.
#
# Where:
#
# w     Should be the widget real address involved.
#
# key   Should be the key pressed.
#
# It doesn't return anything.
proc ::ms::combobox::KeyPress { w key } {
    # Enable only the keypress bindings that are needed for the 'datatype' provided and
    # disable everything else.
    switch -- $::ms::current($w,datatype) {
        alnum {
            # Check if 'key' is a special key.
            switch -- $key {
                Caps_Lock   -
                KP_Decimal  -
                KP_Subtract {}
                default     {
                    # Check if 'key' is not an alphanumer valid key.
                    if { ![regexp "\[0-9a-zA-Z .,\-\]" $key] } {
                        # 😕 Do not insert the key.
                        return -code break
                    }
                }
            }
        }
        alpha {
            # Check if 'key' is a special key.
            switch -- $key {
                Caps_Lock {}
                default   {
                    # Check if 'key' is not an alphabetic valid key.
                    if { ![regexp "\[a-zA-Z \]" $key] } {
                        # 😕 Do not insert the key.
                        return -code break
                    }
                }
            }
        }
        integer {
            # Check if 'key' is a special key.
            switch -- $key {
                KP_Subtract {}
                default     {
                    # Check if 'key' is not an integer valid key.
                    if { ![regexp "\[0-9\-\]" $key] } {
                        # 😕 Do not insert the key.
                        return -code break
                    }
                }
            }
        }
        posinteger {
            # Check if 'key' is not a positive integer valid key.
            if { ![regexp "\[0-9\]" $key] } {
                # 😕 Do not insert the key.
                return -code break
            }
        }
        posreal {
            # Check if 'key' is a special key.
            switch -- $key {
                KP_Decimal {}
                default    {
                    # Check if 'key' is not a positive real valid key.
                    if { ![regexp "\[0-9.\]" $key] } {
                        # 😕 Do not insert the key.
                        return -code break
                    }
                }
            }
        }
        real {
            # Check if 'key' is a special key.
            switch -- $key {
                KP_Decimal  -
                KP_Subtract {}
                default     {
                    # Check if 'key' is not a real valid key.
                    if { ![regexp "\[0-9.\-\]" $key] } {
                        # 😕 Do not insert the key.
                        return -code break
                    }
                }
            }
        }
    }

    # 😀 Insert the key.
    ::ttk::entry::Insert $w $key

    return ""
}

## Post
#
# Post the popdown window.
#
# Note: The following procedure is a modified version of the 'ttk::combobox::Post' procedure.
#       All credits goes to the original author/s.
#
# Where:
#
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Post { w } {
    # Note: This procedure have been highly influenced by many 'ttk::combobox' procedures.
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
    interp invokehidden {} $w state [list pressed]

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

    # Set the OS specific attributes.
    switch -- [_tk windowingsystem] {
        aqua    { _wm attributes $w.popdown -alpha 1.0 }
        win32   { _wm attributes $w.popdown -toolwindow 1 }
        default { _wm attributes $w.popdown -type combo }

    }

    # Set the common attributes.
    _wm group            $w.popdown $::ms::addr($w,toplevel)
    _wm overrideredirect $w.popdown true
    _wm resizable        $w.popdown 0 0
    _wm withdraw         $w.popdown

    ###################
    ##               ##
    ##     FRAME     ##
    ##               ##
    ###################

    # Set the popdown frame style.
    set ::ms::style($w,popdown_frame) [string cat "_sb=" $background \
                                                  "_bc=" $bordercolor \
                                                  "_dc=" $darkcolor \
                                                  "_lc=" $lightcolor \
                                                  ".TFrame"];

    # If needed, create the popdown frame style.
    if { $::ms::style($w,popdown_frame) ni $::ms::style($::ms::theme,created_by_mustang) } {
        _ttk_style configure $::ms::style($w,popdown_frame)  -background $background \
                                                            -bordercolor $bordercolor \
                                                              -darkcolor $darkcolor \
                                                             -lightcolor $lightcolor;

        # Add the popdown frame style to the theme styles list created by mustang.
        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,popdown_frame)
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
        _ttk_style map $::ms::style($w,popdown_frame) {*}$mapping

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
                                  -style $::ms::style($w,popdown_frame) \
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
                                    -listvariable ::ms::data($w,values) \
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
    _bind $w.popdown <Motion> [list ::ms::combobox::Popdown_Motion $w %X %Y]

    # Scan
    _bind $w.popdown <<ScanMark>>    [list ::ms::Scan_Mark $w.popdown.f.lb %x %y]
    _bind $w.popdown <<ScanDrag>>    [list ::ms::Scan_Drag $w.popdown.f.lb %x %y]
    _bind $w.popdown <<ScanRelease>> [list ::ms::Scan_Release]

    # ArrowDown/ArrowUp
    _bind $w.popdown.f.lb <<NextLine>> [list ::ms::combobox::Popdown_ArrowDown  $w]
    _bind $w.popdown.f.lb <<PrevLine>> [list ::ms::combobox::Popdown_ArrowUp    $w]

    # Control-End/Control-Home
    _bind $w.popdown.f.lb <<LineEnd>>   [list ::ms::combobox::Popdown_End  $w]
    _bind $w.popdown.f.lb <<LineStart>> [list ::ms::combobox::Popdown_Home $w]

    # Escape
    _bind $w.popdown.f.lb <KeyPress-Escape> { set ::wait_for_user_response "Unpost"; break }

    # End/Home
    _bind $w.popdown.f.lb <<LineBottom>> [list ::ms::combobox::Popdown_End  $w]
    _bind $w.popdown.f.lb <<LineTop>>    [list ::ms::combobox::Popdown_Home $w]

    # FocusOut, *only* do this on Windows (see #1814778).
    # Dismiss the listbox when the user switches to a different application.
    switch -- [_tk windowingsystem] {
        win32 { _bind $w.popdown.f.lb <FocusOut> { set ::wait_for_user_response "Unpost"; break } }
    }

    # Motion
    _bind $w.popdown.f.lb <Motion> [list ::ms::combobox::Popdown_Hover $w %x %y]

    # PageDown/PageUp
    _bind $w.popdown.f.lb <<PageDown>> [list ::ms::combobox::Popdown_PageDown  $w]
    _bind $w.popdown.f.lb <<PageUp>>   [list ::ms::combobox::Popdown_PageUp    $w]

    # Selection
    _bind $w.popdown.f.lb <ButtonRelease-1>   [list ::ms::combobox::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-Return>   [list ::ms::combobox::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-KP_Enter> [list ::ms::combobox::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-space>    [list ::ms::combobox::Popdown_Select $w]

    # Shift-Tab/Tab
    switch -- [_tk windowingsystem] {
        win32   { _bind $w.popdown.f.lb <Shift-Tab> { ::ms::combobox::Popdown_Tab %W previous; break } }
        default {
            _bind $w.popdown.f.lb <ISO_Left_Tab>    { ::ms::combobox::Popdown_Tab %W previous; break }

            try {
                _bind $w.popdown.f.lb <hpBackTab>   { ::ms::combobox::Popdown_Tab %W previous; break }
            } on error {} {
                # Do nothing.
            }
        }
    }
    _bind $w.popdown.f.lb <Tab> { ::ms::combobox::Popdown_Tab %W next; break }

    # If the listbox can scroll vertically, move the listbox viewpoint by one unit up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f     <MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f.lb  <MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D units]

    # If the listbox can scroll horizontally, move the listbox viewpoint by one unit left or right
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f     <Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f.lb  <Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D units]

    # If the listbox can scroll vertically, move the listbox viewpoint by one page up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f     <Control-MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f.lb  <Control-MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D pages]

    # If the listbox can scroll horizontally, move the listbox viewpoint by one page left or right
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f     <Control-Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f.lb  <Control-Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D pages]

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

    if { $::ms::current($w,rows) < [llength $::ms::data($w,values)] } {
        _ttk_scrollbar $w.popdown.f.vsb     -class TScrollbar \
                                          -command [list $w.popdown.f.lb yview] \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

        $w.popdown.f.lb configure -yscrollcommand [list $w.popdown.f.vsb set]

        _bind $w.popdown.f.vsb <MouseWheel>         [list ::ms::combobox::Scrollbar_MouseWheel $w %D units]
        _bind $w.popdown.f.vsb <Control-MouseWheel> [list ::ms::combobox::Scrollbar_MouseWheel $w %D pages]

        _bind $w.popdown.f.vsb <TouchpadScroll>         [list ::ms::combobox::Scrollbar_Touchpad $w %# %D units]
        _bind $w.popdown.f.vsb <Control-TouchpadScroll> [list ::ms::combobox::Scrollbar_Touchpad $w %# %D pages]

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

    ::ms::combobox::Popdown_Autoselection $w

    ###############################
    ##                           ##
    ##     PLACE THE POPDOWN     ##
    ##                           ##
    ###############################

    update idletasks

    # Get the (x,y) absolute coordinate of the NW point of the combobox.
    set combobox_x [_winfo rootx $w]
    set combobox_y [_winfo rooty $w]

    # Get the width and height of the combobox.
    set combobox_height [_winfo height $w]
    set combobox_width  [_winfo width  $w]

    # Adjust the coordinates and dimensions by the 'postoffset' specified in the combobox style provided.
    set postoffset [_ttk_style lookup $::ms::current($w,style) -postoffset {} [list 0 0 0 0]]
    foreach var { combobox_x combobox_y combobox_width combobox_height } delta $postoffset {
        incr $var $delta
    }

    # Compute if the popdown will show below the combobox element or above it.
    set popdown_height [_winfo reqheight $w.popdown]
    if { ($combobox_y+$combobox_height+$popdown_height+4) > [_winfo screenheight $w.popdown] } {
        # Above the combobox.
        set popdown_y [expr { $combobox_y-$popdown_height-4 }]
    } else {
        # Below the combobox.
        # This is the normal flow of the popdown window.
        set popdown_y [expr { $combobox_y+$combobox_height+4 }]
    }

    # Set the popdown geometry.
    _wm geometry $w.popdown ${combobox_width}x${popdown_height}+${combobox_x}+${popdown_y}

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
    _wm attributes $w.popdown -topmost 1
    _wm deiconify  $w.popdown
    _raise         $w.popdown

    # Focus on the 'popdown' object.
    _focus -force $w.popdown.f.lb

    # Get the widget current fieldbackground color for the focus dynamic state.
    set fieldbackground [_ttk_style lookup $::ms::current($w,style) -fieldbackground [list focus] $::ms::current($w,fieldbackground)]

    # Create/Update the sub-style for the fieldbackground.
    _ttk_style configure Fieldbackground.$::ms::style($w,widget) -fieldbackground $fieldbackground

    # Change momentarily the widget style to the sub-style.
    interp invokehidden {} $w configure -style Fieldbackground.$::ms::style($w,widget)

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

    # Change the widget style back to its original style.
    interp invokehidden {} $w configure -style $::ms::style($w,widget)

    # Unpost the popdown window.
    ::ms::combobox::Unpost $w

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
proc ::ms::combobox::Return { w } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { set value [interp invokehidden {} $w get] }
        normal {
            # Validate the widget string.
            set value [::ms::combobox::Validate_String $w]

            # Clear the widget field, insert the validated value and put the cursor at the end.
            interp invokehidden {} $w delete 0 end
            interp invokehidden {} $w set $value
            interp invokehidden {} $w icursor end
        }
    }

    # Remove the widget selection, if any.
    interp invokehidden {} $w selection clear

    # If 'value' is different than the previous registered one, register it
    # and launch the external procedure provided, if any.
    if { $value ne $::ms::data($w,current_value) } {
        set ::ms::data($w,current_index) [lsearch -exact $::ms::data($w,values) $value]
        set ::ms::data($w,current_value) $value

        ::ms::Execute_Widget_Cmd $w
    }

    return ""
}

## Unpost
#
# Unpost the popdown window.
#
# Where:
#
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Unpost { w } {
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
    interp invokehidden {} $w state [list !pressed]

    # Unset the toplevel temporary variables.
    unset -nocomplain -- ::ms::temp(toplevel,height) \
                         ::ms::temp(toplevel,width) \
                         ::ms::temp(toplevel,X,nw) \
                         ::ms::temp(toplevel,X,se) \
                         ::ms::temp(toplevel,Y,nw) \
                         ::ms::temp(toplevel,Y,se);

    # Focus on the combobox.
    _focus -force $w

    # Check the current combobox index.
    set current_index [interp invokehidden {} $w current]
    switch -- $current_index {
        ""      {}
        default {
            if { $current_index ne $::ms::data($w,current_index) } {
                set ::ms::data($w,current_index) $current_index
                set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $current_index]

                # Execute the external procedure provided, if any.
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
# Limit the input keypresses in a combobox widget and set the widget state to 'invalid' or '!invalid'
# depending if there are illegal characters for the datatype specified or if the string is not contained
# inside any of the items provided by the ::ms::current($w,values) variable.
#
# Where:
#
# w        Should be the widget real address involved.
#
# string   Should be the string to check.
#
# It returns a boolean value ['0' or '1'] indicating if the string provided
# reached it's length limit or not.
proc ::ms::combobox::Validate_KeyPress { w string } {
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
            interp invoke hidden {} $w state [list !invalid]

            return 1
        }
        default {
            # Note: Illegal datatype characters cannot be inserted directly through the keyboard,
            #       we made sure of that in the widget bindings section.
            #       Nonetheless, they can be inserted trough a paste or pasteselection event.
            #       If this is the case, we will let the illegal character be inserted but we will
            #       mark the string as invalid.

            # Depending on the widget datatype, check for illegal characters in 'value'.
            switch -- $::ms::current($w,datatype) {
                alnum {
                    # Check every character in 'value'.
                    set i 0
                    while { $i < [string length $value] } {
                        set char [string index $value $i]
                        switch -- $char {
                            " "     -
                            "."     -
                            ","     -
                            "-"     {}
                            default {
                                switch -- [string is alnum $char] {
                                    0   {
                                        # Change the widget dynamic state to 'invalid'.
                                        interp invoke hidden {} $w state [list invalid]

                                        return 1
                                    }
                                }
                            }
                        }

                        incr i
                    }
                }
                alpha {
                    # Check every character in 'value'.
                    set i 0
                    while { $i < [string length $value] } {
                        set char [string index $value $i]
                        switch -- $char {
                            " "     {}
                            default {
                                switch -- [string is alpha $char] {
                                    0   {
                                        # Change the widget dynamic state to 'invalid'.
                                        interp invoke hidden {} $w state [list invalid]

                                        return 1
                                    }
                                }
                            }
                        }

                        incr i
                    }
                }
                integer {
                    switch -- $value {
                        "-"     {}
                        default {
                            switch -- [string is integer $value] {
                                0   {
                                    # Change the widget dynamic state to 'invalid'.
                                    interp invoke hidden {} $w state [list invalid]

                                    return 1
                                }
                            }
                        }
                    }
                }
                posinteger {
                    switch -- [string is integer $value] {
                        0   {
                            # Change the widget dynamic state to 'invalid'.
                            interp invoke hidden {} $w state [list invalid]

                            return 1
                        }
                        1   {
                            if { $value < 0 } {
                                # Change the widget dynamic state to 'invalid'.
                                interp invoke hidden {} $w state [list invalid]

                                return 1
                            }
                        }
                    }
                }
                posreal {
                    switch -- $value {
                        "."     {}
                        default {
                            switch -- [string is double $value] {
                                0   {
                                    # Change the widget dynamic state to 'invalid'.
                                    interp invoke hidden {} $w state [list invalid]

                                    return 1
                                }
                                1   {
                                    if { $value < 0 } {
                                        # Change the widget dynamic state to 'invalid'.
                                        interp invoke hidden {} $w state [list invalid]

                                        return 1
                                    }
                                }
                            }
                        }
                    }
                }
                real {
                    switch -- $value {
                        "-"     -
                        "."     {}
                        default {
                            switch -- [string is double $value] {
                                0   {
                                    # Change the widget dynamic state to 'invalid'.
                                    interp invoke hidden {} $w state [list invalid]

                                    return 1
                                }
                            }
                        }
                    }
                }
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

    # Check the datatype.
    switch -- $::ms::current($w,datatype) {
        integer    -
        posinteger -
        posreal    -
        real       { set values $::ms::data($w,values) }
        default    {
            # Trasform 'string' in lowercase characters for comparison reasons.
            set value [string tolower $value]
            set values $::ms::data($w,values,lowercase)
        }
    }

    # Compare the longest common characters found in 'values' that contains consecutive characters of
    # 'value' with 'value' itself and change the widget dynamic invalid state accordingly.
    set end [expr { [string length $value]-1 }]
    if { [string range [::tcl::prefix longest $values $value] 0 $end] eq $value } {
        interp invoke hidden {} $w state [list !invalid]
    } else {
        interp invoke hidden {} $w state [list  invalid]
    }

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
proc ::ms::combobox::Validate_String { w } {
    ##############################
    ##                          ##
    ##     VALUE CORRECTION     ##
    ##                          ##
    ##############################

    # Get the widget string and remove any leading/trailing spaces from it.
    set value [string trim [interp invokehidden {} $w get]]

    # Clear 'string' from illegal characters, if any.
    set corrected_value ""
    switch -- $::ms::current($w,datatype) {
        alnum {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    " "     -
                    "."     -
                    ","     -
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
        }
        alpha {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    " "     {}
                    default {
                        # Check if 'char' is an alphabetic character.
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
        }
        integer {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "-"     {}
                    default {
                        # Check if 'char' is an integer character.
                        switch -- [string is integer $char] {
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
        }
        posinteger {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                # Check if 'char' is an integer character.
                set char [string index $value $i]
                switch -- [string is integer $char] {
                    0   {
                        incr i
                        continue
                    }
                }

                # Add char to the 'corrected_value' string.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
        posreal {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "."     {}
                    default {
                        # Check if 'char' is an integer character.
                        switch -- [string is integer $char] {
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
        }
        real {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "-"     -
                    "."     {}
                    default {
                        # Check if 'char' is an integer character.
                        switch -- [string is integer $char] {
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
        }
    }

    # Note: At this point, every illegal characters in string (for the datatype specified) have been stripped out.

    ########################
    ##                    ##
    ##     VALIDATION     ##
    ##                    ##
    ########################

    switch -- $value {
        ""      { set index $::ms::data($w,current_index) }
        default {
            switch -- $::ms::current($w,datatype) {
                alnum -
                alpha {
                    #######################################
                    ##                                   ##
                    ##     ALPHABETIC INEXACT SEARCH     ##
                    ##                                   ##
                    #######################################

                    # Trasform 'value' in lowercase characters for comparison reasons.
                    set value [string tolower $value]

                    # Find the closest match to value.
                    set i     0
                    set limit [string length $value]
                    while { $i < $limit } {
                        # Get the longest common characters in the lowercase list.
                        set longest [::tcl::prefix longest $::ms::data($w,values,lowercase) $value]

                        # Check the 'longest' variable.
                        switch -- $longest {
                            ""  {
                                # Remove the last character from value.
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
                            # Get all the elements from the lowercase list that starts with the 'longest' value and sort it.
                            set prefix_list [lsort -dictionary [::tcl::prefix all $::ms::data($w,values,lowercase) $longest]]

                            # Get the index of the first element of 'prefix_list' relative to '::ms::data($w,values,lowercase)'.
                            set index [lsearch -exact $::ms::data($w,values,lowercase) [lindex $prefix_list 0]]
                            switch -- $index {
                                ""  { set index $::ms::data($w,current_index) }
                            }
                        }
                    }
                }
                integer    -
                posinteger -
                posreal    -
                real       {
                    # Beautify and correct 'value' depending on the datatype specified.
                    set value [::ms::Beautify_Input_Number $value $::ms::current($w,maxlength) $::ms::current($w,datatype)]

                    switch -- [string is double -strict $value] {
                        0   { set index $::ms::data($w,current_index) }
                        1   {
                            # Get the first and last elements of the ordered list.
                            set first [lindex $::ms::data($w,values) 0]
                            set last  [lindex $::ms::data($w,values) end]

                            # Check if 'value' is less than the first element or more of the last element.
                            if { $value <= $first } {
                                set index 0
                            } elseif { $value >= $last } {
                                set index [expr { [llength $::ms::data($w,values)]-1 }]
                            } else {
                                # 'value' is in between the first and last elements (both not included).

                                ######################################
                                ##                                  ##
                                ##     NUMERICAL INEXACT SEARCH     ##
                                ##                                  ##
                                ######################################

                                # Set the previous element as the first one.
                                set previous $first

                                # Find the closest match to 'value'.
                                set i 1
                                while { $i < [llength $::ms::data($w,values)] } {
                                    # Set the 'next' element.
                                    set next [lindex $::ms::data($w,values) $i]

                                    if { $value == $next } {
                                        # Set the index of the next element as the current index.
                                        set index [lsearch -exact $::ms::data($w,values) $next]
                                        break
                                    } elseif { $value < $next } {
                                        # Set the index that contains the closest match to 'value' between 'previous' and 'next' as the current index.
                                        if { ($next-$value) < ($value-$previous) } {
                                            set index [lsearch -exact $::ms::data($w,values) $next]
                                        } else {
                                            set index [lsearch -exact $::ms::data($w,values) $previous]
                                        }

                                        break
                                    }

                                    # Update the previous element for the next lap.
                                    set previous $next

                                    incr i
                                }
                            }
                        }
                    }
                }
                none {
                    # Trasform 'value' in lowercase characters for comparison reasons.
                    set value [string tolower $value]
                    if { $value in $::ms::data($w,values,lowercase) } {
                        set index [lsearch -exact $::ms::data($w,values,lowercase) $value]
                    } else {
                        set index $::ms::data($w,current_index)
                    }
                }
            }
        }
    }

    # Set the widget dynamic state to '!invalid'.
    interp invoke hidden {} $w state [list !invalid]

    return [lindex $::ms::data($w,values) $index]
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
proc ::ms::combobox::MouseWheel { w amount } {
    switch -- $::ms::current($w,state) {
        disabled {
            # Try to find a widget parent to scroll vertically, if any.
            ::ms::Scroll_Parent_Y $w $amount units
        }
        default {
            # Check if the widget is focussable or not.
            switch -- [::ms::Is_Focussable $w] {
                0   {
                    # Try to find a widget parent to scroll vertically, if any.
                    ::ms::Scroll_Parent_Y $w $amount units

                    return ""
                }
            }

            # Check if the widget is already focussed.
            switch -- [interp invokehidden {} $w instate [list !focus]] {
                1   {
                    # Focus the widget.
                    _focus -force $w

                    # Change the widget dynamic state to 'focus'.
                    interp invokehidden {} $w state [list focus]
                }
            }

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
            set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $index]

            # Clear the widget textarea, remove any previous selection and display the new widget value.
            interp invokehidden {} $w delete 0 end
            interp invokehidden {} $w selection clear
            interp invokehidden {} $w set $::ms::data($w,current_value)

            # If the widget is not in readonly state, select the combobox value.
            switch -- $::ms::current($w,state) {
                normal {
                    interp invokehidden {} $w selection range 0 end
                    interp invokehidden {} $w icursor end
                }
            }

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
proc ::ms::combobox::Shift_MouseWheel { w amount } {
    switch -- $::ms::current($w,state) {
        normal {
            # Check if the widget is currently in focus or not.
            if { [_focus -displayof $w] eq $w } {
                # Get the current cursor position
                set index [interp invokehidden {} $w index insert]

                # Move the cursor by one character to the left or to the right (depending
                # on the mousewheel direction).
                if { $amount > 0 } {
                    interp invokehidden {} $w icursor $index+1
                } else {
                    interp invokehidden {} $w icursor $index-1
                }

                # Make the index character visible.
                ::ttk::entry::See $w $index

                return ""
            }
        }
    }

    # Try to find a widget parent to scroll horizontally, if any.
    ::ms::Scroll_Parent_X $w $amount units

    return ""
}

## Scrollbar_MouseWheel
#
# Scroll the popdown listbox vertically by units (**MouseWheel**) or by pages (**Control-MouseWheel**).
#
# Where:
#
# w        Should be the widget real address involved.
#
# amount   Should be the delta value of a **MouseWheel**/**Control-MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#          *Amount* is normally delivered by the **MouseWheel**/**Control-MouseWheel**
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
proc ::ms::combobox::Scrollbar_MouseWheel { w amount what } {
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

    # If possible, scroll the popdown listbox vertically.
    try {
        $w.popdown.f.lb yview scroll [expr { -$amount*0.008333333333333333 }] $what
    } on error {} {
        # The popdown listbox cannot scroll vertically.
    }

    return ""
}

## Scrollbar_Touchpad
#
# Scroll the popdown listbox both horizontally and vertically by units (**TouchpadScroll**) or by pages (**Control-TouchpadScroll**).
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
#
#           If not provided, defaults to **units**.
#
# It doesn't return anything.
proc ::ms::combobox::Scrollbar_Touchpad { w counter amount { what units } } {
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

    # If there is a movement along the X axis, launch '::ms::combobox::MouseWheel'.
    if { $delta_x != 0 } {
        ::ms::combobox::MouseWheel $w $delta_x
    }

    # If there is a movement along the Y axis, launch '::ms::combobox::Shift_MouseWheel'.
    if { $delta_y != 0 } {
        ::ms::combobox::Shift_MouseWheel $w $delta_y
    }
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
proc ::ms::combobox::Touchpad { w counter amount } {
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

    # Adjust 'delta_x' and 'delta_y' values, or the movement will be too slow.
    set delta_x [expr { $delta_x*30 }]
    set delta_y [expr { $delta_y*30 }]

    # If there is a movement along the X axis, launch '::ms::combobox::MouseWheel'.
    if { $delta_x != 0 } {
        ::ms::combobox::MouseWheel $w $delta_x
    }

    # If there is a movement along the Y axis, launch '::ms::combobox::Shift_MouseWheel'.
    if { $delta_y != 0 } {
        ::ms::combobox::Shift_MouseWheel $w $delta_y
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
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_ArrowDown { w } {
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
    $w.popdown.f.lb activate  $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    # Make sure that 'index' is visible.
    $w.popdown.f.lb see $index

    return -code break
}

## Popdown_ArrowUp
#
# Move the current selected row towards the top by one row.
#
# Where:
#
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_ArrowUp { w } {
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
    $w.popdown.f.lb activate  $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    # Make sure that 'index' is visible.
    $w.popdown.f.lb see $index

    return -code break
}

## Popdown_Autoselection
#
# Automatic selection of the listbox item.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_Autoselection { w } {
    ##############################
    ##                          ##
    ##     VALUE CORRECTION     ##
    ##                          ##
    ##############################

    # Remove any leading and trailing spaces from the widget textarea value.
    set value [string trim [interp invokehidden {} $w get]]

    # Clear 'value' from illegal characters, if any.
    set corrected_value ""
    switch -- $::ms::current($w,datatype) {
        alnum {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    " "     -
                    "."     -
                    ","     -
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
        }
        alpha {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    " "     {}
                    default {
                        # Check if 'char' is an alphabetic character.
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
        }
        integer {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "-"     {}
                    default {
                        # Check if 'char' is an integer character.
                        switch -- [string is integer $char] {
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
        }
        posinteger {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                # Check if 'char' is an integer character.
                set char [string index $value $i]
                switch -- [string is integer $char] {
                    0   {
                        incr i
                        continue
                    }
                }

                # Add char to the 'corrected_value' string.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
        posreal {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "."     {}
                    default {
                        # Check if 'char' is an integer character.
                        switch -- [string is integer $char] {
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
        }
        real {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "-"     -
                    "."     {}
                    default {
                        # Check if 'char' is an integer character.
                        switch -- [string is integer $char] {
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
        }
    }

    ##########################################################
    ##                                                      ##
    ##     SEARCH THE INDEX OF THE CLOSEST LISTBOX ITEM     ##
    ##                                                      ##
    ##########################################################

    switch -- $value {
        ""      { set index 0 }
        default {
            switch -- $::ms::current($w,datatype) {
                alnum -
                alpha {
                    #######################################
                    ##                                   ##
                    ##     ALPHABETIC INEXACT SEARCH     ##
                    ##                                   ##
                    #######################################

                    # Trasform 'value' in lowercase characters for comparison reasons.
                    set value [string tolower $value]

                    # Find the closest match to 'value'.
                    set i     0
                    set limit [string length $value]
                    while { $i < $limit } {
                        # Get the longest common characters in the list.
                        set longest [::tcl::prefix longest $::ms::data($w,values,lowercase) $value]

                        # Check the 'longest' variable.
                        switch -- $longest {
                            ""  {
                                # Remove the last character from value.
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
                            # Get all the elements from the lowercase list that starts with the 'longest' value and sort it.
                            set prefix_list [lsort -dictionary [::tcl::prefix all $::ms::data($w,values,lowercase) $longest]]

                            # Get the index of the first element of 'prefix_list' relative to '::ms::data($w,values,lowercase)'.
                            set index [lsearch -exact $::ms::data($w,values,lowercase) [lindex $prefix_list 0]]
                            switch -- $index {
                                ""  { set index $::ms::data($w,current_index) }
                            }
                        }
                    }
                }
                integer    -
                posinteger -
                posreal    -
                real       {
                    # Beautify and correct 'value' depending on its datatype.
                    set value [::ms::Beautify_Input_Number $value $::ms::current($w,maxlength) $::ms::current($w,datatype)]

                    # Get the first and last elements of the ordered list.
                    set first [lindex $::ms::data($w,values) 0]
                    set last  [lindex $::ms::data($w,values) end]

                    # Check if 'value' is less than the first element or more of the last element.
                    if { $value <= $first } {
                        set index 0
                    } elseif { $value >= $last } {
                        set index end
                    } else {
                        # 'value' is in between the first and last elements (both not included).

                        ######################################
                        ##                                  ##
                        ##     NUMERICAL INEXACT SEARCH     ##
                        ##                                  ##
                        ######################################

                        # Set the previous element as the first one.
                        set previous $first

                        # Find the closest match to 'value'.
                        set i 1
                        while { $i < [llength $::ms::data($w,values)] } {
                            # Set the 'next' element.
                            set next [lindex $::ms::data($w,values) $i]

                            if { $value == $next } {
                                # Set the index of the next element as the current index.
                                set index [lsearch -exact $::ms::data($w,values) $next]
                                break
                            } elseif { $value < $next } {
                                # Set the index that contains the closest match to 'value' between 'previous' and 'next' as the current index.
                                if { ($next-$value) < ($value-$previous) } {
                                    set index [lsearch -exact $::ms::data($w,values) $next]
                                } else {
                                    set index [lsearch -exact $::ms::data($w,values) $previous]
                                }

                                break
                            }

                            # Update the previous element for the next lap.
                            set previous $next

                            incr i
                        }
                    }
                }
                none {
                    # Trasform 'value' in lowercase characters for comparison reasons.
                    set value [string tolower $value]
                    if { $value in $::ms::data($w,values,lowercase) } {
                        set index [lsearch -exact $::ms::data($w,values,lowercase) $value]
                    } else {
                        set index $::ms::data($w,current_index)
                    }
                }
            }
        }
    }

    # Select the listbox 'index' found.
    $w.popdown.f.lb activate  $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    # Make sure that 'index' is visible.
    $w.popdown.f.lb see $index

    return ""
}

## Popdown_End
#
# Move the listbox view to its bottom and select the very last row.
#
# Where:
#
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_End { w } {
    # Select and activate the very last row.
    $w.popdown.f.lb activate  $::ms::data($w,last_available_index)
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $::ms::data($w,last_available_index)

    # Make sure that the last available index is visible.
    $w.popdown.f.lb see $::ms::data($w,last_available_index)

    return ""
}

## Popdown_Home
#
# Move the listbox view to its top and select the very first row.
#
# Where:
#
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_Home { w } {
    # Select and activate the very first row.
    $w.popdown.f.lb activate  0
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set 0

    # Make sure that index **0** is visible.
    $w.popdown.f.lb see 0

    return ""
}

## Popdown_Hover
#
# Manage the **Motion** event upon the listbox.
#
# Note: The following procedure is a modified version of the 'ttk::combobox::LBHover' procedure.
#       All credits goes to the original author/s.
#
#
# w      Should be the combobox real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#        These values should be provided by the **Motion** event.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_Hover { w x y } {
    # Get the index of the current hovered row.
    set index [$w.popdown.f.lb index @$x,$y]

    # Select and activate the new index.
    $w.popdown.f.lb activate  $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    return ""
}

## Popdown_Motion
#
# Manage the **Motion** event upon the listbox.
#
# Where:
#
# w      Should be the widget real address involved.
#
# X, Y   Should be the (x,y) mouse pointer root coordinates at the time of the event.
#        These values should be provided by the **Motion** event.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_Motion { w X Y } {
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
#          These values should be provided by the **MouseWheel**/**Control-MouseWheel** event.
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
proc ::ms::combobox::Popdown_MouseWheel { w x y amount { what units } } {
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
    $w.popdown.f.lb activate  $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    return -code break
}

## Popdown_PageDown
#
# Move the listbox view towards the bottom by one page and
# select the first visible row.
#
# Where:
#
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_PageDown { w } {
    # Check if all popdown rows are currently displayed or not.
    if { [llength $::ms::data($w,values)] > $::ms::current($w,rows) } {
        # Scroll one page towards the bottom of the popdown window.
        $w.popdown.f.lb yview scroll +1 pages

        # Get the index of the current bottom visible row.
        set y     [_winfo height $w.popdown.f.lb]
        set index [$w.popdown.f.lb index @0,$y]

        # Select and activate the current bottom visible row.
        $w.popdown.f.lb activate  $index
        $w.popdown.f.lb selection clear 0 end
        $w.popdown.f.lb selection set $index
    } else {
        ::ms::combobox::Popdown_End $w
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
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_PageUp { w } {
    # Check if all popdown rows are currently displayed or not.
    if { [llength $::ms::data($w,values)] > $::ms::current($w,rows) } {
        # Scroll one page towards the top of the popdown window.
        $w.popdown.f.lb yview scroll -1 pages

        # Get the index of the current top visible row.
        set index [$w.popdown.f.lb index @0,0]

        # Select and activate the current top visible row.
        $w.popdown.f.lb activate  $index
        $w.popdown.f.lb selection clear 0 end
        $w.popdown.f.lb selection set $index
    } else {
        ::ms::combobox::Popdown_Home $w
    }

    return -code break
}

## Popdown_Select
#
# Manage the lisbox selection event.
#
# Note: The following procedure is a modified version of the 'ttk::combobox::LBSelect' procedure.
#       All credits goes to the original author/s.
#
# Where:
#
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_Select { w } {
    # Clear the widget textarea.
    interp invokehidden {} $w delete 0 end

    # Set the widget selection in response to an user action.
    interp invokehidden {} $w current   [$w.popdown.f.lb index active]
    interp invokehidden {} $w selection range 0 end
    interp invokehidden {} $w icursor   end

    # Change the widget dynamic state to '!invalid'.
    ::ms::combobox::Pathname_Cmd $w state !invalid

    # Release the grab.
    set ::wait_for_user_response "Selection"

    return ""
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
#          These values should be provided by the **Shift-MouseWheel**/**Control-Shift-MouseWheel**
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
proc ::ms::combobox::Popdown_Shift_MouseWheel { w x y amount { what units } } {
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

    # Get the index of the current hovered row.
    set index [$w.popdown.f.lb index @$x,$y]

    # Select and activate the new index.
    $w.popdown.f.lb activate $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    return -code break
}

## Popdown_Tab
#
# Manage the **Tab** and **Shift-Tab** events on the combobox listbox.
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
proc ::ms::combobox::Popdown_Tab { popdown dir } {
    # Get the combobox real address.
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
proc ::ms::combobox::Popdown_Touchpad { w x y counter amount { what units } } {
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

    # Adjust 'delta_x' and 'delta_y' values, or the movement will be too slow.
    set delta_x [expr { $delta_x*30 }]
    set delta_y [expr { $delta_y*30 }]

    # If there is a movement along the X axis, launch '::ms::palette::Popdown_Shift_MouseWheel'.
    if { $delta_x != 0 } {
        ::ms::palette::Popdown_Shift_MouseWheel $w $x $y $delta_x $what
    }

    # If there is a movement along the Y axis, launch '::ms::palette::Popdown_MouseWheel'.
    if { $delta_y != 0 } {
        ::ms::palette::Popdown_MouseWheel $w $x $y $delta_y $what
    }

    return ""
}

#*EOF*