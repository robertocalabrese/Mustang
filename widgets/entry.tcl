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

## entry
#
#### DESCRIPTION:
#
# An entry widget displays a one-line text string and allows that string to be edited by the user. The value of the string may be linked
# to a Tcl variable with the **-textvariable** option. Entry widgets support horizontal scrolling with the standard **-xscrollcommand**
# option and **xview** widget command but only if the **-datatype** option for the entry is **none** or the **-maxlength** option value
# is **0**.
#
# Note: At the time this command is invoked, there must not exist a window with the same pathname,
#       but the pathname's parents must exists.
#       *Window* may be provided either as a short or as a real address, the address returned will be:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
# Additional options, described below, may be specified on the command line to configure aspects of the entry.
#
#### SYNOPSIS:
#
#   **entry**  *window* ?*option* *value*? ... ?*option* *value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
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
#                                                             If there isn't one, the **-background** of the **TEntry** style
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
#                                                             If there isn't one, the **-bordercolor** of the **TEntry** style
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
#                              Note: The entry **-charwidth** must be a positive integer (**0** not included).
#                                    If it's not, the current theme value will be used instead.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-charwidth** specified in its style.
#                                                             If there isn't one, the **-charwidth** of the **TEntry** style
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
#                              If not provided, defaults to **TEntry**.
#
# **-cmenu**                   Specifies the contextual menu address that will be assigned to the widget.
#                              If the *cmenu* value is the empty string or invalid, nothing will happen.
#
#                              If not provided, defaults to the empty string.
#
# **-command**                 Specifies a procedure to call after the validation on the data has been done.
#                              This procedure will be launched with two parameters, the real address of the entry involved and the current
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
#                              Note: If the widget state is disabled or readonly, the cursor shape upon the textarea will always be the 'arrow'.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                             If there isn't one, the **-cursor** of the **TEntry** style
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
#                                                             If there isn't one, the **-darkcolor** of the **TEntry** style
#                                                             will be used instead.
#                                                             The **-darkcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-lightcolor**.
#
# **-datatype**                Specifies the type of data that the entry will accepts.
#                              Allowed datatypes are:
#
#                                 alnum      --> Only alphanumeric and some puntuaction characters will be allowed inside the entry.
#                                                The only keys that will work on the keyboard inside the entry will be [0-9a-zA-Z],
#                                                and the point, comma, minus sign and space characters.
#
#                                 alpha      --> Only alphabetic characters and the space character will be allowed inside the entry.
#                                                The only keys that will work on the keyboard inside the entry will be [a-zA-Z] and
#                                                the space character.
#
#                                 hex8       -
#                                 hex12      -
#                                 hex16      --> Only hexadecimal characters will be allowed inside the entry.
#                                                The only keys that will work on the keyboard inside the entry will be [0-9a-fA-F].
#                                                The has sign '#' will be available only if the **-hash** option is enabled.
#
#                                                Note that **hex8** can be shortened into just **hex**.
#
#                                 integer    --> Only digits characters and the minus sign will be allowed inside the entry.
#                                                The only keys that will work on the keyboard inside the entry will be [0-9]
#                                                and the minus sign.
#
#                                 posinteger --> Only digits characters will be allowed inside the entry.
#                                                The only keys that will work on the keyboard inside the entry will be [0-9].
#
#                                 posreal    --> Only digits characters and the point character will be allowed inside the entry.
#                                                The only keys that will work on the keyboard inside the entry will be [0-9]
#                                                and the point character.
#
#                                 real       --> Only digits characters, the point and minus sign will be allowed inside the entry.
#                                                The only keys that will work on the keyboard inside the entry will be [0-9]
#                                                the point character and the minus sign.
#
#                                 none       --> All characters are accepted by the entry and the keyboard is not blocked in any way.
#
#                              Automatic validation will be performed on each datatypes except **none**.
#                              More precisely:
#
#                                 Alphabetic and alphanumeric datatypes will have only a partial validation, meaning that it will be check
#                                 that the string is composed by the characters allowed by the alpha or alnum datatype and nothing else.
#
#                                 Numeric datatypes (integer, pointeger, posreal and real) will have a complete validation, meaning that it
#                                 will be checked that the string is a proper integer, posinteger, posreal or real number (and corrected if
#                                 it isn't) and if a maxlength is not **0** a limit check will be performed on it (truncation will happen if
#                                 the number reaches the from or to value specified).
#
#                                 Hexadecimal datatypes (hex8, hex12, hex16) will ensure that the string is a valid hexadecimal color at
#                                 8, 12 or 16 bits. If the string is an hexadecimal shortform it will be transformed in hexadecimal longform.
#                                 The hexadecimal color that will result may or may not have the hash sign '#', depending on the value of the
#                                 **-hash** option specified.
#
#                              See also **-charwidth**, **-invalidcommand**, **-maxlength**, **-from**, **-to**, **-validate**
#                              and **-validatecommand**.
#
# **-decimals**                Should be an integer that indicates how many decimal digits should be enforced.
#
#                              Note: This option is only meaningfull for **posreal** and **real** datatypes and will be ignored for any other
#                                    datatypes.
#
#                              If not provided, defaults to **1**.
#
# **-exportselection**         Specifies a boolean value that indicates whether or not a selection in the widget should be linked to the X
#                              selection. If the selection is exported, then selecting in the widget deselects the current X selection,
#                              selecting outside the widget deselects any widget selection, and the widget will respond to selection retrieval
#                              requests when it has a selection.
#
#                              If an entry is exporting its selection then it will observe the standard X11 protocols for handling the selection;
#                              entry selections are available as type **STRING**.
#                              Entries also observe the standard Tk rules for dealing with the input focus.
#                              When an entry has the input focus it displays an insert cursor to indicate where new characters will be inserted.
#
#                              Entries are capable of displaying strings that are too long to fit entirely within the widget's window.
#                              In this case, only a portion of the string will be displayed; commands described below may be used to change the
#                              view in the window. Entries use the standard **-xscrollcommand** mechanism for interacting with scrollbars.
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
#                                                             If there isn't one, the **-fieldbackground** of the **TEntry** style
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
#                                                             If there isn't one, the **-focuscolor** of the **TEntry** style
#                                                             will be used instead.
#                                                             The **-focuscolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-bordercolor**.
#
# **-focuswidth**              It's a list that specifies the color to use as focuswidth (the size of the focus ring).
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: It's only meaningful for themes that use the 'alt', 'default' or 'classic' engine
#                                    and ignored by themes that use the 'clam' engine'.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-focuswidth** specified in its style.
#                                                             If there isn't one, the **-focuswidth** of the **TEntry** style
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
#                                                             If there isn't one, the **-font** of the **TEntry** style
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
#                                                             If there isn't one, the **-foreground** of the **TEntry** style
#                                                             will be used instead.
#                                                             The **-foreground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-background**, **-fieldbackground** and **-font**.
#
# **-from**                    Specifies the minimum value acceptable for a numerical datatype (integer, posinteger, posreal and real).
#                              Note that the *from* value will be ignored for any other widget datatypes.
#
#                              The following rules must be taked in account when providing the *from* value:
#                                - For 'posinteger' and 'posreal' datatypes only, the *from* value must be greater or equal to zero.
#                                - For any numerical datatypes the *from* value must always be lesser or equal than the *to* value.
#
#                              Failing to respect one or both of these rules will cause the *from* and *to* values provided to be ignored
#                              and their defaults values for the widget datatype to be used instead.
#
#                              A limit check will be performed during the validation process to assure that the value inserted by the user
#                              is always between the *from* and *to* values (*from* and *to* included).
#
#                              If not provided, defaults to:
#                                 - **-9**   for integer datatypes.
#                                 - **-9.9** for real datatypes.
#                                 - **0**    for posinteger and posreal datatypes.
#
#                              See also **-datatype**, **-decimals**, **-maxlength** and **-to**.
#
# **-hash**                    Specifies a boolean value that indicates if the hash sign '#' will be available inside the entry or not.
#                              It's only valid for hexadecimal datatypes and will be ignore in any other case.
#
#                              Note: This option may only be provided while creating the widget.
#                                    Attempts to change this value after the widget is created by using the **configure** command,
#                                    will be ignored by mustang.
#
#                              If not provided, defaults to **yes**.
#
#                              See also **-datatype**.
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
# **-insertcolor**             It's a list that specifies the color to use for the entry cursor.
#                              See the **COLOR OPTION** section to know how this list should be composed.
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-insertcolor** specified in its style.
#                                                             If there isn't one, the **-insertcolor** of the **TEntry** style
#                                                             will be used instead.
#                                                             The **-insertcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-insertwidth**.
#
# **-insertwidth**             Specifies the width of the entry cursor.
#                              The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                              (pixels, points, inches, millimeters or centimeters).
#
#                              Note: This is a styleable option.
#
#                                    If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                             Only the developer can.
#
#                                    If it's not provided --> The widget will follow the **-insertwidth** specified in its style.
#                                                             If there isn't one, the **-insertwidth** of the **TEntry** style
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
#                                                             If there isn't one, the **-justify** of the **TEntry** style
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
#                                                             If there isn't one, the **-lightcolor** of the **TEntry** style
#                                                             will be used instead.
#                                                             The **-lightcolor** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-darkcolor**.
#
# **-maxlength**               Specifies an integer that indicates the maximum number of characters that can be inserted inside an entry widget.
#                              If this value is **0**, then any amount of characters can be inserted inside the entry (that will be scrollable).
#                              Any other value will limit the possible characters that can be inserted.
#
#                              Note that hexadecimal and numerical datatypes will always force their relative maxlength no matter if a
#                              different value is provided, more precisely:
#
#                                 hex8       --> the maxlength will be forced to **6**  if the hash sign is disabled or **7**  if it's enabled.
#                                 hex12      --> the maxlength will be forced to **9**  if the hash sign is disabled or **10** if it's enabled.
#                                 hex16      --> the maxlength will be forced to **12** if the hash sign is disabled or **13** if it's enabled.
#                                 integer    -
#                                 posinteger -
#                                 posreal    -
#                                 real       --> the maxlength will be forced to whichever between the *from* and *to* values, have the greater
#                                                number of digits (point, sign and decimals included for the datatypes that allows them).
#
#                              The maxlength value can influence the **-charwidth** of the widget, more precisely:
#
#                                 maxlength  = 0                    --> any valid charwidth value is accepted (even **0**).
#                                 maxlength != 0 and charwidth !=0  --> If the charwidth is lesser then the maxlength, the former will be
#                                                                       set as the latter.
#
#                              If not provided, defaults to **0**.
#
#                              See also **-charwidth**, **-datatype**, **-decimals**, **-from**, **-to** and **-xscrollcommand**.
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
#                                                             If there isn't one, the **-padding** of the **TEntry** style
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
#                                                             If there isn't one, the **-placeholderforeground** of the **TEntry** style
#                                                             will be used instead.
#                                                             The **-placeholderforeground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-font**, **-justify** and **-placeholder**.
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
#                                                             If there isn't one, the **-selectbackground** of the **TEntry** style
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
#                                                             If there isn't one, the **-selectborderwidth** of the **TEntry** style
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
#                                                             If there isn't one, the **-selectforeground** of the **TEntry** style
#                                                             will be used instead.
#                                                             The **-selectforeground** will always abide by its mapping values, if any.
#                                                             Styles, mappings and states events are allowed to change its value.
#
#                              See also **-selectbackground** and **-selectborderwidth**.
#
# **-show**                    If this option is specified, then the true contents of the entry are not displayed in the window.
#                              Instead, each character in the entry's value will be displayed as the first character in the value of
#                              this option, such as "*" or a bullet. This is useful, for example, if the entry is to be used to enter
#                              a password. If characters in the entry are selected and copied elsewhere, the information copied will
#                              be what is displayed, not the true contents of the entry.
#                              An empty string will mean that all characters of the entry widget will be visible and copyable.
#
#                              If not provided, defaults to the empty string.
#
# **-state**                   Specifies the state for the widget.
#                              May be set to **normal**, **readonly** or **disabled** to control the disabled state bit.
#                              This is a write-only option: setting it changes the widget state,
#                              but the state widget command does not affect the *-state* option.
#
#                              If not provided, defaults to **normal**.
#
# **-style**                   Specifies a custom widget style.
#                              If not provided, defaults to **TEntry**.
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
# **-textvariable**            Specifies the name of a global variable whose value is linked to the entry widget's contents.
#                              Whenever the variable changes value, the widget's contents are updated, and vice versa.
#
#                              If not provided, defaults to the empty string.
#
# **-to**                      Specifies the maximum value acceptable for a numerical datatype (integer, posinteger, posreal and real).
#                              Note that the *to* value will be ignored for any other widget datatypes.
#
#                              The following rules must be taked in account when providing the *to* value:
#                                - For 'posinteger' and 'posreal' datatypes only, the *to* value must be greater or equal to zero.
#                                - For any numerical datatypes the *to* value must always be greater or equal than the *from* value.
#
#                              Failing to respect one or both of these rules will cause the *from* and *to* values provided to be ignored
#                              and their defaults values for the widget datatype to be used instead.
#
#                              A limit check will be performed during the validation process to assure that the value inserted by the user
#                              is always between the *from* and *to* values (*from* and *to* included).
#
#                              If not provided, defaults to:
#                                 - **9**   for integer and posinteger datatypes.
#                                 - **9.9** for posreal and real datatypes.
#
#                              See also **-datatype**, **-decimals**, **-from** and **-maxlength**.
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
#                                 focus    --> The entry is revalidated when the entry receives or loses focus.
#                                 focusin  --> The entry is revalidated when the entry receives focus.
#                                 focusout --> The entry is revalidated when the entry loses focus.
#                                 key      --> The entry will be prevalidated prior to each edit (specifically, whenever the insert or delete
#                                              widget commands are called). If prevalidation fails, the edit is rejected.
#                                 all      --> Validation is performed for all above conditions.
#
#                              Note that every **-datatype** except **none** will force this value to **key** to perform automatic validation.
#
#                              The **-invalidcommand** is evaluated whenever the **-validatecommand** returns a false value.
#                              The **-validatecommand** and **-invalidcommand** may modify the entry widget's value via the widget insert or
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
#                              If not provided, defaults to the empty string.
#
#                              See also **-datatype**, **-invalidcommand** and **-validate**.
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
# The entry command creates a new command whose name is the same as the pathname of the entry's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the entry widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for entry widgets:
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
#     *Option* may be one of the widget options accepted by the entry command (See **WIDGET OPTIONS**).
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
#   *window* **delete** *first* ?*last*?
#     Delete one or more elements of the entry. *First* is the index of the first character to delete, and *last* is the
#     index of the character just after the last one to delete. If *last* is not specified it defaults to *first*+1,
#     i.e. a single character is deleted.
#     This command returns the empty string.
#
#   *window* **get**
#     Returns the entry's string.
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
#     This command is used to adjust the selection within an entry. It has several forms, depending on option:
#
#       *window* **selection** **clear**
#         Clear the selection if it is currently in this widget.
#         If the selection is not in this widget then the command has no effect.
#         Returns the empty string.
#
#       *window* **selection** **present**
#         Returns **1** if there is are characters selected in the entry, **0** if nothing is selected.
#
#       *window* **selection** **range** *start* *end*
#         Sets the selection to include the characters starting with the one indexed by *start* and ending with the one
#         just before *end*.
#         If *end* refers to the same character as *start* or an earlier one, then the entry's selection is cleared.
#
#   *window* **set* *value*
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
# Many of the entry widget commands take one or more indices as arguments.
# An index specifies a particular character in the entry's string, in any of the following ways:
#
#   **number**
#      Specifies the character as a numerical index, where **0** corresponds to the first character in the string.
#
#   **@number**
#      In this form, number is treated as an x-coordinate in the entry's window; the character spanning that
#      x-coordinate is used. For example, **@0** indicates the left-most character in the window.
#
#   **end**
#      Indicates the character just after the last one in the entry's string.
#      This is equivalent to specifying a numerical index equal to the length of the entry's string.
#
#   **insert**
#      Indicates the character adjacent to and immediately following the insert cursor.
#
#   **sel.first**
#      Indicates the first character in the selection.
#      It is an error to use this form if the selection is not in the entry window.
#
#   **sel.last**
#      Indicates the character just after the last one in the selection.
#      It is an error to use this form if the selection is not in the entry window.
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
#      In prevalidation, the new value of the entry if the edit is accepted.
#      In revalidation, the current value of the entry.
#
#   **%s**
#      The current value of entry prior to editing.
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
#      The name of the entry widget.
#
#### STATES:
#
# The entry widget supports the **disabled**, **readonly** and **normal** state.
#
# In the **disabled** state, no insert cursor is displayed, the entry cannot be edited (specifically: the insert and
# delete commands have no effect) and the text cannot be selected.
#
# In the **readonly** state, no insert cursor is displayed, the entry cannot be edited (specifically: the insert and
# delete commands have no effect) but the text can be selected.
#
# Note that changes to the linked **-textvariable** will still be reflected in the entry, even if it is **disabled**.
#
#### STYLING OPTIONS:
#
# Default style name: **TEntry**
#
# Every entry styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# The following entry styling options are allowed only for themes that follows the **clam** engine (like the
# **Halo** theme) and ignored by any other engine:
#
#   **-bordercolor**
#   **-darkcolor**
#   **-lightcolor**
#
# The following entry styling options are allowed only for themes that do not follows the **clam** engine:
#
#   **-focuscolor**
#   **-focuswidth**
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the entrys in order to facilitate the developer work and
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
# 1.  **MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that
#     scrollbar by one unit up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 2.  If the widget has the focus, the **Shift-MouseWheel** events will move the insert cursor by one character towards the left or
#     the right (depending on the direction of the mousewheel event).
#
#     If the widget does not have the focus, **Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with
#     an active horizontal scrollbar and move that scrollbar by one unit left or right (depending on the mousewheel direction).
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
#        1 - If the widget have the focus, events along the X axis will move the insert cursor by one character to the left or to
#            the right (depending on the mousewheel direction).
#
#            If the widget does not have the focus, **TouchpadScroll** events along the X axis will try to find the innermost
#            widget's scrollable parent with an active horizontal scrollbar and move that scrollbar by one unit left or right
#            (depending on the direction of the touchpad event).
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
###### INTERNAL MECHANISM:
#
# The following behavior will happen if the mouse pointer is over the widget (no matter if it does or does not have the focus).
#
# Note: In the descriptions below, **word** refers to a contiguous group of letters, digits, or "_" characters, or any single
#       character other than these.
#
# 1.  Clicking the left mouse button will put the insert cursor just before the character underneath the mouse cursor, sets the
#     input focus to this widget, and clears any selection in the widget.
#     Dragging with mouse **button 1** down strokes out a selection between the insert cursor and the character under the mouse.
#
# 2.  Double-clicking with the left mouse button selects the word under the mouse and positions the insert cursor at the end of
#     the word. Dragging after a double click strokes out a selection consisting of whole words.
#
# 3.  Triple-clicking with the left mouse button selects all of the text in the entry and positions the insert cursor at the end
#     of the line. The ends of the selection can be adjusted by dragging with mouse button 1 while the **Shift** key is down.
#     If the button is double-clicked before dragging then the selection will be adjusted in units of whole words.
#
# 4.  Clicking the left mouse button with the **Control** key down will position the insert cursor in the entry without affecting
#     the selection.
#
# 5.  If the mouse is dragged out of the entry on the left or right sides while the left mouse button is pressed and the datatype of
#     the entry allows it, the entry will automatically scroll to make more text visible (if there is more text off-screen on the side
#     where the mouse left the window).
#
# The following behavior will happen if the entry widget has the focus.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  If any normal printing characters are typed in an entry (according to its datatype), they are inserted at the point of the
#     insert cursor.
#
# 2.  The **Left** and **Right** keys move the insert cursor one character to the left or right; they also clear any selection in
#     the entry. If **Shift-Left** or **Shift-Right** is typed then the insertion cursor moves and the selection is extended to
#     include the new character. **Control-Left** and **Control-Right** move the insert cursor by words, and **Control-Shift-Left**
#     and **Control-Shift-Right** move the insert cursor by words and also extend the selection.
#
# 3.  The **Home** key move the insert cursor to the beginning of the entry and clear any selection in the entry.
#     **Shift-Home** moves the insert cursor to the beginning of the entry and extends the selection to that point.
#
# 4.  The **End** key move the insert cursor to the end of the entry and clear any selection in the entry.
#     **Shift-End** moves the cursor to the end and extends the selection to that point.
#
# 5.  **Control-a** (**Command-a** for macOS) selects all the text in the entry.
#     **Control-Shift-a** (**Command-Shift-a** for macOS) clears any selection in the widget or does nothing if there isn't any.
#
# 6.  The standard Tk **Cut**, **Copy**, **Paste**, and **Clear** virtual events operate on the selection in the expected manner.
#
# 7.  The **Delete** key deletes the selection, if there is one in the entry.
#     If there is no selection, it deletes the character to the right of the insertion cursor.
#     **Alt-d** (**Option-d** for macOS) deletes from the insertion cursor to the end of the entry or does nothing if the
#     insertion cursor is already at the end of the entry.
#
# 8.  The **BackSpace** key delete the selection, if there is one in the entry.
#     If there is no selection, it deletes the character to the left of the insert cursor.
#
# 9.  The **Escape** key clears any current value that is not yet validated and restore the last valid one.
#
# 10. The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the previous
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
#### DIFFERENCES FROM Tk ENTRY WIDGET VALIDATION:
#
# The standard Tk entry widget automatically disables validation (by setting **-validate** to **none**) if the **-validatecommand**
# or **-invalidcommand** modifies the entry's value.
# The Tk themed entry widget (the one used internally by mustang) only disables validation if one of the validation scripts raises
# an error, or if **-validatecommand** does not return a valid boolean value. (Thus, it is not necessary to re-enable validation
# after modifying the entry value in a validation script).
#
# In addition, the standard entry widget invokes validation whenever the linked **-textvariable** is modified; the Tk themed entry
# widget does not.
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
#   # Create entries of different datatypes.
#   entry .e1       -charwidth 12 \
#                     -command [list ::AfterValidate] \
#                    -datatype integer \
#             -exportselection 1 \
#                        -from -999 \
#                        -hash no \
#                     -justify right \
#                   -maxlength 4 \
#                 -placeholder integer \
#                       -state normal \
#                       -style TEntry \
#                   -takefocus 1 \
#                          -to 999 \;
#
#   entry .e2       -charwidth 12 \
#                     -command [list ::AfterValidate] \
#                    -datatype posinteger \
#             -exportselection 1 \
#                        -from -999 \
#                        -hash no \
#                     -justify right \
#                   -maxlength 4 \
#                 -placeholder posinteger \
#                       -state normal \
#                       -style TEntry \
#                   -takefocus 1 \
#                          -to 999 \;
#
#   entry .e3       -charwidth 12 \
#                     -command [list ::AfterValidate] \
#                    -datatype posreal \
#             -exportselection 1 \
#                        -from -100.0 \
#                        -hash no \
#                     -justify right \
#                   -maxlength 6 \
#                 -placeholder posreal \
#                       -state normal \
#                       -style TEntry \
#                   -takefocus 1 \
#                          -to 100.0 \;
#
#   entry .e4       -charwidth 12 \
#                     -command [list ::AfterValidate] \
#                    -datatype real \
#             -exportselection 1 \
#                        -from -100.0 \
#                        -hash no \
#                     -justify right \
#                   -maxlength 7 \
#                 -placeholder real \
#                       -state normal \
#                       -style TEntry \
#                   -takefocus 1 \
#                          -to 100.0 \;
#
#   entry .e5       -charwidth 12 \
#                     -command [list ::AfterValidate] \
#                    -datatype hex8 \
#             -exportselection 1 \
#                        -from "" \
#                        -hash yes \
#                     -justify right \
#                   -maxlength 10 \
#                 -placeholder "hex8 with #" \
#                       -state normal \
#                       -style TEntry \
#                   -takefocus 1 \
#                          -to "" \;
#
#   entry .e6       -charwidth 12 \
#                     -command [list ::AfterValidate] \
#                    -datatype hex8 \
#             -exportselection 1 \
#                        -from "" \
#                        -hash no \
#                     -justify right \
#                   -maxlength 10 \
#                 -placeholder "hex8 without #" \
#                       -state normal \
#                       -style TEntry \
#                   -takefocus 1 \
#                          -to "" \;
#
#   entry .e7       -charwidth 12 \
#                     -command [list ::AfterValidate] \
#                    -datatype alnum \
#             -exportselection 1 \
#                        -from "" \
#                        -hash no \
#                     -justify left \
#                   -maxlength 0 \
#                 -placeholder alnum \
#                       -state normal \
#                       -style TEntry \
#                   -takefocus 1 \
#                          -to "" \;
#
#   entry .e8       -charwidth 12 \
#                     -command [list ::AfterValidate] \
#                    -datatype alpha \
#             -exportselection 1 \
#                        -from "" \
#                        -hash no \
#                     -justify left \
#                   -maxlength 0 \
#                 -placeholder alpha \
#                       -state normal \
#                       -style TEntry \
#                   -takefocus 1 \
#                          -to "" \;
#
#   entry .e9       -charwidth 12 \
#                     -command [list ::AfterValidate] \
#                    -datatype none \
#             -exportselection 1 \
#                        -from "" \
#                        -hash no \
#                     -justify left \
#                   -maxlength 0 \
#                 -placeholder none \
#                       -state normal \
#                       -style TEntry \
#                   -takefocus 1 \
#                          -to "" \;
#
#   pack .e1 -padx 30 \
#            -pady 30 \
#            -side top;
#
#   pack .e2 -padx 30 \
#            -pady 30 \
#            -side top;
#
#   pack .e3 -padx 30 \
#            -pady 30 \
#            -side top;
#
#   pack .e4 -padx 30 \
#            -pady 30 \
#            -side top;
#
#   pack .e5 -padx 30 \
#            -pady 30 \
#            -side top;
#
#   pack .e6 -padx 30 \
#            -pady 30 \
#            -side top;
#
#   pack .e7 -padx 30 \
#            -pady 30 \
#            -side top;
#
#   pack .e8 -padx 30 \
#            -pady 30 \
#            -side top;
#
#   pack .e9 -padx 30 \
#            -pady 30 \
#            -side top;
#
#   # Focus the first entry of the first pane.
#   focus .e1
#
#   # After 3 seconds, change the accent color.
#   after 3000 [list set ::ms::accent red]
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
package provide ::ms::entry 0.1

#############################
##                         ##
##     _ENTRY BINDINGS     ##
##                         ##
#############################

# Activate/Deactivate
_bind _Entry <Activate>   { ::ms::entry::Pathname_Cmd %W state !background; break }
_bind _Entry <Deactivate> { ::ms::entry::Pathname_Cmd %W state  background; break }

# Allowing some modifiers combination.
switch -- [_tk windowingsystem] {
    aqua {
        _bind _Entry <Option-KeyPress>         { # Enable binding }
        _bind _Entry <Option-Shift-KeyPress>   { # Enable binding }
        _bind _Entry <Control-KeyPress>        { # Enable binding }
        _bind _Entry <Control-Option-KeyPress> { # Enable binding }
        _bind _Entry <Control-Shift-KeyPress>  { # Enable binding }
        _bind _Entry <Command-KeyPress>        { # Enable binding }
        _bind _Entry <Command-Shift-KeyPress>  { # Enable binding }
    }
    default {
        _bind _Entry <Alt-KeyPress>           { # Enable binding }
        _bind _Entry <Alt-Shift-KeyPress>     { # Enable binding }
        _bind _Entry <Control-KeyPress>       { # Enable binding }
        _bind _Entry <Control-Alt-KeyPress>   { # Enable binding }
        _bind _Entry <Control-Shift-KeyPress> { # Enable binding }
        _bind _Entry <Meta-KeyPress>          { # Enable binding }
        _bind _Entry <Meta-Shift-KeyPress>    { # Enable binding }
    }
}

# Backspace/Delete keys
_bind _Entry <KeyPress-BackSpace> { # Enable binding }
_bind _Entry <KeyPress-Delete>    { # Enable binding }
_bind _Entry <KeyPress-KP_Delete> { ::ttk::entry::Delete %W; break }
_bind _Entry <<DeleteChar>>       { ::ttk::entry::Delete %W; break }

# Delete from the insertion cursor till the end of the line.
switch -- [_tk windowingsystem] {
    aqua    { _bind _Entry <Option-KeyPress-d> { %W delete insert end; break } }
    default { _bind _Entry <Alt-KeyPress-d>    { %W delete insert end; break } }
}

# ButtonPress-1
_bind _Entry <ButtonPress-1>    { ::ms::entry::ButtonPress %W %x; break }

_bind _Entry <Button-2>         { ::ms::Scan_Or_Paste %W %x "Button-2"; break }
_bind _Entry <B2-Motion>        { ::ms::Scan_Or_Paste %W %x "B2-Motion"; break }
_bind _Entry <ButtonRelease-2>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-2"; break }

_bind _Entry <Button-3>         { ::ms::Scan_Or_Paste %W %x "Button-3"; break }
_bind _Entry <B3-Motion>        { ::ms::Scan_Or_Paste %W %x "B3-Motion"; break }
_bind _Entry <ButtonRelease-3>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-3"; break }

# Clear/Copy/Cut/Paste
_bind _Entry <<Clear>> { ::ms::Clear %W; break }
_bind _Entry <<Copy>>  { ::ms::Copy  %W; break }
_bind _Entry <<Cut>>   { ::ms::Cut   %W; break }
_bind _Entry <<Paste>> { ::ms::Paste %W CLIPBOARD; break }

# Contextual menu
_bind _Entry <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Entry <Destroy> { ::ms::entry::Destroy %W; break }

# Enter/Leave
_bind _Entry <Enter> { ::ms::entry::Pathname_Cmd %W state  hover; break }
_bind _Entry <Leave> { ::ms::entry::Pathname_Cmd %W state !hover; break }

# Escape key
_bind _Entry <KeyPress-Escape> { ::ms::Escape %W; break }

# F keys
_bind _Entry <Fn-KeyPress> { # Enable binding }

# FocusIn/FocusOut
_bind _Entry <FocusIn>  { ::ms::entry::FocusIn  %W; break }
_bind _Entry <FocusOut> { ::ms::entry::FocusOut %W; break }

# Insert cursor movements.
_bind _Entry <<PrevChar>>   { ::ttk::entry::Move %W prevchar; break }
_bind _Entry <<NextChar>>   { ::ttk::entry::Move %W nextchar; break }
_bind _Entry <<PrevWord>>   { ::ttk::entry::Move %W prevword; break }
_bind _Entry <<NextWord>>   { ::ttk::entry::Move %W nextword; break }
_bind _Entry <<LineStart>>  { ::ttk::entry::Move %W home; break }
_bind _Entry <<LineEnd>>    { ::ttk::entry::Move %W end; break }

# Insert cursor selections.
_bind _Entry <<SelectPrevChar>>  { ::ttk::entry::Extend %W prevchar; break }
_bind _Entry <<SelectNextChar>>  { ::ttk::entry::Extend %W nextchar; break }
_bind _Entry <<SelectPrevWord>>  { ::ttk::entry::Extend %W prevword; break }
_bind _Entry <<SelectNextWord>>  { ::ttk::entry::Extend %W selectnextword; break }
_bind _Entry <<SelectLineStart>> { ::ttk::entry::Extend %W home; break }
_bind _Entry <<SelectLineEnd>>   { ::ttk::entry::Extend %W end; break }

# Enabling only some keys depending on the datatype specified for the widget.
_bind _Entry <KeyPress> { ::ms::entry::KeyPress %W %A; break }

# Return
_bind _Entry <KeyPress-Return>   { ::ms::entry::Return %W; break }
_bind _Entry <KeyPress-KP_Enter> { ::ms::entry::Return %W; break }

# Tab/Shift-Tab keys
_bind _Entry <KeyPress-Tab> { # Enable binding }
switch -- [_tk windowingsystem] {
    x11 {
        _bind _Entry <KeyPress-ISO_Left_Tab> { # Enable binding }

        # This seems to be correct on *some* HP systems.
        catch { _bind _Entry <KeyPress-hpBackTab> { # Enable binding } }
    }
    aqua  { _bind _Entry <KeyPress-ISO_Left_Tab> { # Enable binding } }
    win32 { _bind _Entry <Shift-KeyPress-Tab>    { # Enable binding } }
}

# Enabling window traversal navigation.
_bind _Entry <<PageLeft>>  { # Enable binding }
_bind _Entry <<PageRight>> { # Enable binding }
_bind _Entry <<PageUp>>    { # Enable binding }
_bind _Entry <<PageDown>>  { # Enable binding }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move
# that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Entry <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# If the widget has the focus, move the insert cursor by one character to the left or to the right
# (depending on the mousewheel direction), otherwise try to find the innermost widget's scrollable
# parent with an active horizontal scrollbar and move that scrollbar by one unit left or right
# (again, depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Entry <Shift-MouseWheel> { ::ms::entry::Shift_MouseWheel %W %D; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Entry <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Entry <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - View the **Shift-MouseWheel** event.
#   2 - View the **MouseWheel** event.
_bind _Entry <TouchpadScroll> { ::ms::entry::Touchpad %W %# %D; break }

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
_bind _Entry <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **entry** package.
namespace eval ::ms::entry {
    # Set the 'non styleable' entry option list.
    set ::ms::entry(non_styleable,options) [list class \
                                                 cmenu \
                                                 command \
                                                 datatype \
                                                 decimals \
                                                 exportselection \
                                                 from \
                                                 hash \
                                                 invalidcommand \
                                                 maxlength \
                                                 placeholder \
                                                 show \
                                                 state \
                                                 style \
                                                 takefocus \
                                                 textvariable \
                                                 to \
                                                 validate \
                                                 validatecommand \
                                                 xscrollcommand];

    # Set the 'styleable' entry option list.
    set ::ms::entry(styleable,options) [list background \
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
                                             selectbackground \
                                             selectborderwidth \
                                             selectforeground];

    # Set the default 'non-styleable' entry options values.
    set ::ms::default(entry,class)           TEntry
    set ::ms::default(entry,cmenu)           {}
    set ::ms::default(entry,command)         {}
    set ::ms::default(entry,datatype)        none
    set ::ms::default(entry,decimals)        1
    set ::ms::default(entry,exportselection) 1
    set ::ms::default(entry,from)            0
    set ::ms::default(entry,hash)            yes
    set ::ms::default(entry,invalidcommand)  {}
    set ::ms::default(entry,maxlength)       0
    set ::ms::default(entry,placeholder)     {}
    set ::ms::default(entry,show)            {}
    set ::ms::default(entry,state)           normal
    set ::ms::default(entry,style)           TEntry
    set ::ms::default(entry,takefocus)       1
    set ::ms::default(entry,textvariable)    {}
    set ::ms::default(entry,to)              0
    set ::ms::default(entry,validate)        none
    set ::ms::default(entry,validatecommand) {}
    set ::ms::default(entry,xscrollcommand)  {}

    # Note: The default 'styleable' entry options values are always defined inside the current theme.
}

# Rename the original Tk **entry** and **ttk::entry** commands.
rename entry      _entry
rename ttk::entry _ttk_entry

# Create aliases for the mustang **entry** command.
interp alias {} entry      {} ::ms::entry::Command
interp alias {} ttk::entry {} ::ms::entry::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **entry** and **ttk::entry** widgets commands.
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
proc ::ms::entry::Command { window { args "" } } {
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
            set ::ms::default($w,class)           $::ms::default(entry,class)
            set ::ms::default($w,cmenu)           $::ms::default(entry,cmenu)
            set ::ms::default($w,command)         $::ms::default(entry,command)
            set ::ms::default($w,datatype)        $::ms::default(entry,datatype)
            set ::ms::default($w,decimals)        $::ms::default(entry,decimals)
            set ::ms::default($w,exportselection) $::ms::default(entry,exportselection)
            set ::ms::default($w,from)            $::ms::default(entry,from)
            set ::ms::default($w,hash)            $::ms::default(entry,hash)
            set ::ms::default($w,invalidcommand)  $::ms::default(entry,invalidcommand)
            set ::ms::default($w,maxlength)       $::ms::default(entry,maxlength)
            set ::ms::default($w,placeholder)     $::ms::default(entry,placeholder)
            set ::ms::default($w,show)            $::ms::default(entry,show)
            set ::ms::default($w,state)           $::ms::default(entry,state)
            set ::ms::default($w,style)           $::ms::default(entry,style)
            set ::ms::default($w,takefocus)       $::ms::default(entry,takefocus)
            set ::ms::default($w,textvariable)    $::ms::default(entry,textvariable)
            set ::ms::default($w,to)              $::ms::default(entry,to)
            set ::ms::default($w,validate)        $::ms::default(entry,validate)
            set ::ms::default($w,validatecommand) $::ms::default(entry,validatecommand)
            set ::ms::default($w,xscrollcommand)  $::ms::default(entry,xscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)           $::ms::default(entry,class)
            set ::ms::current($w,cmenu)           $::ms::default(entry,cmenu)
            set ::ms::current($w,command)         $::ms::default(entry,command)
            set ::ms::current($w,datatype)        $::ms::default(entry,datatype)
            set ::ms::current($w,decimals)        $::ms::default(entry,decimals)
            set ::ms::current($w,exportselection) $::ms::default(entry,exportselection)
            set ::ms::current($w,from)            $::ms::default(entry,from)
            set ::ms::current($w,hash)            $::ms::default(entry,hash)
            set ::ms::current($w,invalidcommand)  $::ms::default(entry,invalidcommand)
            set ::ms::current($w,maxlength)       $::ms::default(entry,maxlength)
            set ::ms::current($w,placeholder)     $::ms::default(entry,placeholder)
            set ::ms::current($w,show)            $::ms::default(entry,show)
            set ::ms::current($w,state)           $::ms::default(entry,state)
            set ::ms::current($w,style)           $::ms::default(entry,style)
            set ::ms::current($w,takefocus)       $::ms::default(entry,takefocus)
            set ::ms::current($w,textvariable)    $::ms::default(entry,textvariable)
            set ::ms::current($w,to)              $::ms::default(entry,to)
            set ::ms::current($w,validate)        $::ms::default(entry,validate)
            set ::ms::current($w,validatecommand) $::ms::default(entry,validatecommand)
            set ::ms::current($w,xscrollcommand)  $::ms::default(entry,xscrollcommand)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)     entry
            set ::ms::data($w,current_value) ""
            set ::ms::data($w,format)        "%.1f"

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
            #       To make a entry styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **entry** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
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
                                if { $value >= 0 } {
                                    set ::ms::current($w,charwidth)    $value
                                    set ::ms::managed_by($w,charwidth) developer
                                }
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
                            hex8       -
                            hex12      -
                            hex16      -
                            integer    -
                            posinteger -
                            posreal    -
                            real       -
                            none       { set ::ms::current($w,datatype) $value }
                            hex        { set ::ms::current($w,datatype) hex8 }
                        }
                    }
                    -decimals {
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,decimals) $value
                                set ::ms::data($w,format) "%.${value}f"
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
                    -from {
                        switch -- [string is double -strict $value] {
                            1   { set ::ms::current($w,from) $value }
                        }
                    }
                    -hash {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,hash) no }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,hash) yes }
                        }
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
                    -show {
                        switch -- [string length $value] {
                            1   { set ::ms::current($w,show) $value }
                        }
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
                            # If not, create one by mirroring the current theme 'TEntry' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TEntry]
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
                            1   { set ::ms::current($w,textvariable) $value }
                        }
                    }
                    -to {
                        switch -- [string is double -strict $value] {
                            1   { set ::ms::current($w,to) $value }
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
                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::entry(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TEntry,$option)

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
                    set cursor    arrow
                    set takefocus $::ms::current($w,takefocus)
                }
                normal   {
                    set cursor    $::ms::current($w,cursor)
                    set takefocus $::ms::current($w,takefocus)
                }
            }

            # Check the invalidcommand, validate, validatecommand and xscrollcommand options
            # relative to the datatype option provided.
            switch -- $::ms::current($w,datatype) {
                alnum      -
                alpha      -
                hex8       -
                hex12      -
                hex16      -
                integer    -
                posinteger -
                posreal    -
                real       {
                    set ::ms::current($w,invalidcommand)  {}
                    set ::ms::current($w,validate)        key
                    set ::ms::current($w,validatecommand) [list ::ms::entry::Validate_Keypress %W %P]

                    switch -- $::ms::current($w,maxlength) {
                        0       {}
                        default { set ::ms::current($w,xscrollcommand) {} }
                    }
                }
            }

            # Depending on the datatype provided override the maxlength option and, if needed,
            # check the 'from' and 'to' values.
            switch -- $::ms::current($w,datatype) {
                hex8 {
                    # Override any 'maxlength' provided.
                    switch -- $::ms::current($w,hash) {
                        no  { set ::ms::current($w,maxlength) 6 }
                        yes { set ::ms::current($w,maxlength) 7 }
                    }
                }
                hex12 {
                    # Override any 'maxlength' provided.
                    switch -- $::ms::current($w,hash) {
                        no  { set ::ms::current($w,maxlength) 9 }
                        yes { set ::ms::current($w,maxlength) 10 }
                    }
                }
                hex16 {
                    # Override any 'maxlength' provided.
                    switch -- $::ms::current($w,hash) {
                        no  { set ::ms::current($w,maxlength) 12 }
                        yes { set ::ms::current($w,maxlength) 13 }
                    }
                }
                integer {
                    # Safeguard.
                    # Make sure that the 'from' and 'to' values are integers.
                    set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }]
                    set ::ms::current($w,to)   [expr { int($::ms::current($w,to)) }]

                    # Safeguard.
                    # Make sure that the 'from' value is not greater than the 'to' value.
                    if { $::ms::current($w,from) > $::ms::current($w,to) } {
                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                        set ::ms::current($w,from) -9
                        set ::ms::current($w,to)    9
                    }

                    # Override any 'maxlength' provided.
                    set maxlength_from [string length $::ms::current($w,from)]
                    set maxlength_to   [string length $::ms::current($w,to)]
                    if { $maxlength_from > $maxlength_to } {
                        set ::ms::current($w,maxlength) $maxlength_from
                    } else {
                        set ::ms::current($w,maxlength) $maxlength_to
                    }
                }
                posinteger {
                    # Safeguard.
                    # Make sure that the 'from' and 'to' values are integers.
                    set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }]
                    set ::ms::current($w,to)   [expr { int($::ms::current($w,to)) }]

                    # Safeguard.
                    # Make sure that the 'from' and 'to' value are both greater or equal to zero.
                    if { ($::ms::current($w,from) < 0) || ($::ms::current($w,to) < 0) } {
                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                        set ::ms::current($w,from) 0
                        set ::ms::current($w,to)   9
                    }

                    # Safeguard.
                    # Make sure that the 'from' value is not greater than the 'to' value.
                    if { $::ms::current($w,from) > $::ms::current($w,to) } {
                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                        set ::ms::current($w,from) 0
                        set ::ms::current($w,to)   9
                    }

                    # Override any 'maxlength' provided.
                    set ::ms::current($w,maxlength) [string length $::ms::current($w,to)]
                }
                posreal {
                    # Safeguard.
                    # Make sure that the 'from' and 'to' values respects the 'decimals' provided, if any.
                    if { $::ms::current($w,from) != 0 } {
                        set ::ms::current($w,from) [format $::ms::data($w,format) $::ms::current($w,from)]
                    } else {
                        set ::ms::current($w,from) 0
                    }

                    if { $::ms::current($w,to) != 0 } {
                        set ::ms::current($w,to) [format $::ms::data($w,format) $::ms::current($w,to)]
                    } else {
                        set ::ms::current($w,to) 0
                    }

                    # Safeguard.
                    # Make sure that the 'from' and 'to' value are both greater or equal to zero.
                    if { ($::ms::current($w,from) < 0) || ($::ms::current($w,to) < 0) } {
                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                        set ::ms::current($w,from) 0
                        set ::ms::current($w,to)   9.9
                    }

                    # Make sure that the 'from' value is not greater than the 'to' value.
                    if { $::ms::current($w,from) > $::ms::current($w,to) } {
                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                        set ::ms::current($w,from) 0
                        set ::ms::current($w,to)   9.9
                    }

                    # Override any 'maxlength' provided.
                    set ::ms::current($w,maxlength) [string length $::ms::current($w,to)]
                }
                real {
                    # Safeguard.
                    # Make sure that the 'from' and 'to' values respects the 'decimals' provided, if any.
                    if { $::ms::current($w,from) != 0 } {
                        set ::ms::current($w,from) [format $::ms::data($w,format) $::ms::current($w,from)]
                    } else {
                        set ::ms::current($w,from) 0
                    }

                    if { $::ms::current($w,to) != 0 } {
                        set ::ms::current($w,to) [format $::ms::data($w,format) $::ms::current($w,to)]
                    } else {
                        set ::ms::current($w,to) 0
                    }

                    # Safeguard.
                    # Make sure that the 'from' value is not greater than the 'to' value.
                    if { $::ms::current($w,from) > $::ms::current($w,to) } {
                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                        set ::ms::current($w,from) -9.9
                        set ::ms::current($w,to)    9.9
                    }

                    # Override any 'maxlength' provided.
                    set maxlength_from [string length $::ms::current($w,from)]
                    set maxlength_to   [string length $::ms::current($w,to)]
                    if { $maxlength_from > $maxlength_to } {
                        set ::ms::current($w,maxlength) $maxlength_from
                    } else {
                        set ::ms::current($w,maxlength) $maxlength_to
                    }
                }
            }

            # Check the 'maxlength'.
            switch -- $::ms::current($w,maxlength) {
                0       {}
                default {
                    # Safeguard.
                    # Check that 'charwidth' is not inferior to 'maxlength'.
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

            # Note: 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify', 'padding'
            #       and 'selectborderwidth' are not allowed to change if the statespec changes.

            # Agglomerate the padding values.
            set padding ""
            foreach pad $::ms::current($w,padding) {
                append padding "$pad" "-"
            }
            set padding [string trimright $padding "-"]

            ###################
            ##               ##
            ##     ENTRY     ##
            ##               ##
            ###################

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
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
                _ttk_style configure $::ms::style($w,widget)             -background $::ms::current($w,background) \
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

            # Create the entry widget.
            _ttk_entry $w           -class $::ms::current($w,class) \
                                   -cursor $cursor \
                          -exportselection $::ms::current($w,exportselection) \
                                     -font $::ms::current($w,font) \
                           -invalidcommand $::ms::current($w,invalidcommand) \
                                  -justify $::ms::current($w,justify) \
                              -placeholder $::ms::current($w,placeholder) \
                                     -show $::ms::current($w,show) \
                                    -state $::ms::current($w,state) \
                                    -style $::ms::style($w,widget) \
                                -takefocus $takefocus \
                             -textvariable $::ms::current($w,textvariable) \
                                 -validate $::ms::current($w,validate) \
                          -validatecommand $::ms::current($w,validatecommand) \
                                    -width $::ms::current($w,charwidth) \
                           -xscrollcommand $::ms::current($w,xscrollcommand);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TEntry  { _bindtags $w [list $w _Entry TEntry $::ms::addr($w,toplevel) all] }
                default { _bindtags $w [list $w $::ms::current($w,class) _Entry TEntry $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::entry::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::entry::Pathname_Cmd $w]
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

            # Add the widget address to the entry widgets real address list.
            lappend ::ms::addr(entry) $w

            # Add the widget address to the entry classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),entry,addrs) $w

            # Add the widget address to the entry classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),entry,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the entry classtype.
            if { $::ms::current($w,style) ni $::ms::style(entry,classtype) } {
                lappend ::ms::style(entry,classtype) $::ms::current($w,style)
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
proc ::ms::entry::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        bbox      -
        delete    -
        get       -
        icursor   -
        index     -
        selection -
        validate  -
        xview     {
            # Synopsis:
            #
            # *window* **bbox** *index*
            # *window* **delete** *first* ?*last*?
            # *window* **get**
            # *window* **icursor** *index*
            # *window* **index** *index*
            # *window* **selection** *option* *arg*
            #    *window* **selection** **clear**
            #    *window* **selection** **present**
            #    *window* **selection** **range** *start* *end*
            # *window* **validate**
            # *window* **xview** *option* *args*
            #    *window* **xview**
            #    *window* **xview** **moveto** *fraction*
            #    *window* **xview** **scroll** *number* *what*
            try {
                interp invokehidden {} $w $cmd {*}$args
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
                    if { ($option in $::ms::entry(non_styleable,options)) || ($option in $::ms::entry(styleable,options)) } {
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
                    foreach option $::ms::entry(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::entry(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::entry(non_styleable,options)) || ($option in $::ms::entry(styleable,options)) } {
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

                            # Set a variable that indicates if a new datatype has been provided or not.
                            set new_datatype false

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
                                    -charwidth {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value >= 0 } {
                                                    set ::ms::current($w,charwidth)    $value
                                                    set ::ms::managed_by($w,charwidth) developer
                                                }
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
                                            hex8       -
                                            hex12      -
                                            hex16      -
                                            integer    -
                                            posinteger -
                                            posreal    -
                                            real       -
                                            none       {
                                                set ::ms::current($w,datatype) $value
                                                set new_datatype true
                                            }
                                            hex        {
                                                set ::ms::current($w,datatype) hex8
                                                set new_datatype true
                                            }
                                        }
                                    }
                                    -decimals {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                set ::ms::current($w,decimals) $value
                                                set ::ms::data($w,format) "%.${value}f"
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
                                    -from {
                                        switch -- [string is double -strict $value] {
                                            1   { set ::ms::current($w,from) $value }
                                        }
                                    }
                                    -hash {}
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
                                    -show {
                                        switch -- [string length $value] {
                                            1   { set ::ms::current($w,show) $value }
                                        }
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
                                            # If not, create one by mirroring the current theme 'TEntry' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TEntry]
                                            }

                                            # Remove the widget address from the entry classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),entry,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),entry,addrs) [lremove $::ms::style($::ms::current($w,style),entry,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,entry,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the entry classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),entry,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(entry,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(entry,classtype) [lremove $::ms::style(entry,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the entry classtype.
                                            if { $value ni $::ms::style(entry,classtype) } {
                                                lappend ::ms::style(entry,classtype) $value
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
                                            1   { set ::ms::current($w,textvariable) $value }
                                        }
                                    }
                                    -to {
                                        switch -- [string is double -strict $value] {
                                            1   { set ::ms::current($w,to) $value }
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
                                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TEntry,$option)

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
                                    set cursor    arrow
                                    set takefocus $::ms::current($w,takefocus)
                                }
                                normal   {
                                    set cursor    $::ms::current($w,cursor)
                                    set takefocus $::ms::current($w,takefocus)
                                }
                            }

                            # Check if a new datatype was provided.
                            switch -- $new_datatype {
                                true {
                                    # Remove any previously displayed value.
                                    interp invokehidden {} $w delete 0 end
                                    interp invokehidden {} $w selection clear
                                    interp invokehidden {} $w icursor 0

                                    # Set the new current value to the empty string.
                                    set ::ms::data($w,current_value) ""
                                }
                            }

                            # Check the invalidcommand, validate, validatecommand and xscrollcommand options
                            # relative to the datatype option provided.
                            switch -- $::ms::current($w,datatype) {
                                alnum      -
                                alpha      -
                                hex8       -
                                hex12      -
                                hex16      -
                                integer    -
                                posinteger -
                                posreal    -
                                real       {
                                    set ::ms::current($w,invalidcommand)  {}
                                    set ::ms::current($w,validate)        key
                                    set ::ms::current($w,validatecommand) [list ::ms::entry::Validate_Keypress %W %P]

                                    switch -- $::ms::current($w,maxlength) {
                                        0       {}
                                        default { set ::ms::current($w,xscrollcommand) {} }
                                    }
                                }
                            }

                            # Depending on the datatype provided override the maxlength option and, if needed,
                            # check the 'from' and 'to' values.
                            switch -- $::ms::current($w,datatype) {
                                hex8 {
                                    # Override any 'maxlength' provided.
                                    switch -- $::ms::current($w,hash) {
                                        no  { set ::ms::current($w,maxlength) 6 }
                                        yes { set ::ms::current($w,maxlength) 7 }
                                    }
                                }
                                hex12 {
                                    # Override any 'maxlength' provided.
                                    switch -- $::ms::current($w,hash) {
                                        no  { set ::ms::current($w,maxlength) 9 }
                                        yes { set ::ms::current($w,maxlength) 10 }
                                    }
                                }
                                hex16 {
                                    # Override any 'maxlength' provided.
                                    switch -- $::ms::current($w,hash) {
                                        no  { set ::ms::current($w,maxlength) 12 }
                                        yes { set ::ms::current($w,maxlength) 13 }
                                    }
                                }
                                integer {
                                    # Safeguard.
                                    # Make sure that the 'from' and 'to' values are integers.
                                    set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }]
                                    set ::ms::current($w,to)   [expr { int($::ms::current($w,to)) }]

                                    # Safeguard.
                                    # Make sure that the 'from' value is not greater than the 'to' value.
                                    if { $::ms::current($w,from) > $::ms::current($w,to) } {
                                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                        set ::ms::current($w,from) -9
                                        set ::ms::current($w,to)    9
                                    }

                                    # Override any 'maxlength' provided.
                                    set maxlength_from [string length $::ms::current($w,from)]
                                    set maxlength_to   [string length $::ms::current($w,to)]
                                    if { $maxlength_from > $maxlength_to } {
                                        set ::ms::current($w,maxlength) $maxlength_from
                                    } else {
                                        set ::ms::current($w,maxlength) $maxlength_to
                                    }
                                }
                                posinteger {
                                    # Safeguard.
                                    # Make sure that the 'from' and 'to' values are integers.
                                    set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }]
                                    set ::ms::current($w,to)   [expr { int($::ms::current($w,to)) }]

                                    # Safeguard.
                                    # Make sure that the 'from' and 'to' value are both greater or equal to zero.
                                    if { ($::ms::current($w,from) < 0) || ($::ms::current($w,to) < 0) } {
                                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                        set ::ms::current($w,from) 0
                                        set ::ms::current($w,to)   9
                                    }

                                    # Safeguard.
                                    # Make sure that the 'from' value is not greater than the 'to' value.
                                    if { $::ms::current($w,from) > $::ms::current($w,to) } {
                                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                        set ::ms::current($w,from) 0
                                        set ::ms::current($w,to)   9
                                    }

                                    # Override any 'maxlength' provided.
                                    set ::ms::current($w,maxlength) [string length $::ms::current($w,to)]
                                }
                                posreal {
                                    # Safeguard.
                                    # Make sure that the 'from' and 'to' values respects the 'decimals' provided, if any.
                                    if { $::ms::current($w,from) != 0 } {
                                        set ::ms::current($w,from) [format $::ms::data($w,format) $::ms::current($w,from)]
                                    } else {
                                        set ::ms::current($w,from) 0
                                    }

                                    if { $::ms::current($w,to) != 0 } {
                                        set ::ms::current($w,to) [format $::ms::data($w,format) $::ms::current($w,to)]
                                    } else {
                                        set ::ms::current($w,to) 0
                                    }

                                    # Safeguard.
                                    # Make sure that the 'from' and 'to' value are both greater or equal to zero.
                                    if { ($::ms::current($w,from) < 0) || ($::ms::current($w,to) < 0) } {
                                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                        set ::ms::current($w,from) 0
                                        set ::ms::current($w,to)   9.9
                                    }

                                    # Make sure that the 'from' value is not greater than the 'to' value.
                                    if { $::ms::current($w,from) > $::ms::current($w,to) } {
                                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                        set ::ms::current($w,from) 0
                                        set ::ms::current($w,to)   9.9
                                    }

                                    # Override any 'maxlength' provided.
                                    set ::ms::current($w,maxlength) [string length $::ms::current($w,to)]
                                }
                                real {
                                    # Safeguard.
                                    # Make sure that the 'from' and 'to' values respects the 'decimals' provided, if any.
                                    if { $::ms::current($w,from) != 0 } {
                                        set ::ms::current($w,from) [format $::ms::data($w,format) $::ms::current($w,from)]
                                    } else {
                                        set ::ms::current($w,from) 0
                                    }

                                    if { $::ms::current($w,to) != 0 } {
                                        set ::ms::current($w,to) [format $::ms::data($w,format) $::ms::current($w,to)]
                                    } else {
                                        set ::ms::current($w,to) 0
                                    }

                                    # Safeguard.
                                    # Make sure that the 'from' value is not greater than the 'to' value.
                                    if { $::ms::current($w,from) > $::ms::current($w,to) } {
                                        # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                        set ::ms::current($w,from) -9.9
                                        set ::ms::current($w,to)    9.9
                                    }

                                    # Override any 'maxlength' provided.
                                    set maxlength_from [string length $::ms::current($w,from)]
                                    set maxlength_to   [string length $::ms::current($w,to)]
                                    if { $maxlength_from > $maxlength_to } {
                                        set ::ms::current($w,maxlength) $maxlength_from
                                    } else {
                                        set ::ms::current($w,maxlength) $maxlength_to
                                    }
                                }
                            }

                            # Check the 'maxlength'.
                            switch -- $::ms::current($w,maxlength) {
                                0       {}
                                default {
                                    # Safeguard.
                                    # Check that 'charwidth' is not inferior to 'maxlength'.
                                    if { $::ms::current($w,charwidth) < $::ms::current($w,maxlength) } {
                                        set ::ms::current($w,charwidth) $::ms::current($w,maxlength)
                                    }
                                }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify', 'padding'
                            #       and 'selectborderwidth' are not allowed to change if the statespec changes.

                            # Agglomerate the padding values.
                            set padding ""
                            foreach pad $::ms::current($w,padding) {
                                append padding "$pad" "-"
                            }
                            set padding [string trimright $padding "-"]

                            ###################
                            ##               ##
                            ##     ENTRY     ##
                            ##               ##
                            ###################

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
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
                                _ttk_style configure $::ms::style($w,widget)             -background $::ms::current($w,background) \
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
                                                                           -show $::ms::current($w,show) \
                                                                          -state $::ms::current($w,state) \
                                                                          -style $::ms::style($w,widget) \
                                                                      -takefocus $takefocus \
                                                                   -textvariable $::ms::current($w,textvariable) \
                                                                       -validate $::ms::current($w,validate) \
                                                                -validatecommand $::ms::current($w,validatecommand) \
                                                                          -width $::ms::current($w,charwidth) \
                                                                 -xscrollcommand $::ms::current($w,xscrollcommand);

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
                    try {
                        interp invokehidden {} $w identify {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -nocase -- $result {
                            textarea { set result "Entry.textarea" }
                        }

                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
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

                    # Return the name of the object, or an empty string if there are no entry objects at the coordinates provided.
                    if { $widget eq $w } {
                        return "Entry.textarea"
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
                enabled { chan puts stdout "'insert' is a deprecated entry command. Use 'set' instead." }
            }

            switch -- [llength $args] {
                2   {
                    set index  [lindex $args 0]
                    set string [lindex $args 1]

                    # Check the index value.
                    switch -- [string is integer -strict $index] {
                        0   { ::ms::Error "Invalid index, '$index'." $caller_info }
                    }

                    # Construct the new value that should be displayed inside the widget.
                    set value [interp invokehidden {} $w get]
                    if { $index < 1 } {
                        set value [string cat $string $value]
                    } elseif { $index >= [string length $value] } {
                        set value [string cat $value $string]
                    } else {
                        set value [string cat [string range $value 0 $index-1] $string [string range $value $index end]]
                    }

                    # Launch the 'set' command.
                    ::ms::entry::Pathname_Cmd $w set $value
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
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
            # *window* **set** *value*?
            switch -- [llength $args] {
                1   {
                    # Remove any consecutive whitespaces at the beginning or at the end of the current value.
                    set value [string trim $args]

                    # If the datatype is not 'none', 'alnum' or 'alpha' validate the current value.
                    switch -- $::ms::current($w,datatype) {
                        hex8  -
                        hex12 -
                        hex16 {
                            # Check if current value is the empty string.
                            switch -- $value {
                                ""  {
                                    # Clear the widget field.
                                    interp invokehidden {} $w delete    0 end
                                    interp invokehidden {} $w selection clear
                                }
                                default {
                                    # Check if the current value is a valid hexadecimal color.
                                    set value [::ms::Check_Hex $value $::ms::current($w,datatype) invalid]
                                    switch -- $value {
                                        invalid { set value $::ms::data($w,current_value) }
                                        default {
                                            # Check if the hash sign '#' should be included or not.
                                            switch -- $::ms::current($w,hash) {
                                                no  { set value [string trimleft $value "#"] }
                                            }
                                        }
                                    }

                                    # If the corrected value is different than the current value,
                                    # clear the widget field, insert the corrected value and position the cursor at the end.
                                    if { $value ne $args } {
                                        interp invokehidden {} $w delete    0 end
                                        interp invokehidden {} $w selection clear
                                        interp invokehidden {} $w insert    0 $value
                                        interp invokehidden {} $w icursor   end
                                    }
                                }
                            }
                        }
                        integer    -
                        posinteger {
                            # Check if current value is the empty string.
                            switch -- $value {
                                ""  {
                                    # Clear the widget field.
                                    interp invokehidden {} $w delete    0 end
                                    interp invokehidden {} $w selection clear
                                }
                                default {
                                    # Beautify 'value'.
                                    set value [::ms::Beautify_Input_Number $value $::ms::current($w,maxlength) $::ms::current($w,datatype)]

                                    # Check if 'value' is an integer.
                                    switch -- [string is integer -strict $value] {
                                        0   {
                                            set value $::ms::data($w,current_value)

                                            interp invokehidden {} $w delete    0 end
                                            interp invokehidden {} $w selection clear
                                            interp invokehidden {} $w insert    0 $value
                                            interp invokehidden {} $w icursor   end
                                        }
                                        1   {
                                            # Check 'value' against the 'from' and 'to' values.
                                            if { $value < $::ms::current($w,from) } {
                                                set value $::ms::current($w,from)
                                            } elseif { $value > $::ms::current($w,to) } {
                                                set value $::ms::current($w,to)
                                            }

                                            # Set the widget dynamic state as '!invalid'.
                                            ::ms::entry::Pathname_Cmd $w state !invalid

                                            # If the corrected value is different than the current value,
                                            # clear the widget field, insert the corrected value and position the cursor at the end.
                                            if { $value ne $args } {
                                                interp invokehidden {} $w delete    0 end
                                                interp invokehidden {} $w selection clear
                                                interp invokehidden {} $w insert    0 $value
                                                interp invokehidden {} $w icursor   end
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        posreal -
                        real    {
                            # Check if current value is the empty string.
                            switch -- $value {
                                ""  {
                                    # Clear the widget field.
                                    interp invokehidden {} $w delete    0 end
                                    interp invokehidden {} $w selection clear
                                }
                                default {
                                    # Beautify 'value'.
                                    set value [::ms::Beautify_Input_Number $value $::ms::current($w,maxlength) $::ms::current($w,datatype)]

                                    # Check if 'value' is a double.
                                    switch -- [string is double -strict $value] {
                                        0   {
                                            set value $::ms::data($w,current_value)

                                            interp invokehidden {} $w delete    0 end
                                            interp invokehidden {} $w selection clear
                                            interp invokehidden {} $w insert    0 $value
                                            interp invokehidden {} $w icursor   end
                                        }
                                        1   {
                                            # Check 'value' against the 'from' and 'to' values.
                                            if { $value < $::ms::current($w,from) } {
                                                set value $::ms::current($w,from)
                                            } elseif { $value > $::ms::current($w,to) } {
                                                set value $::ms::current($w,to)
                                            } else {
                                                set value [format $::ms::data($w,format) $value]
                                            }

                                            # Set the widget dynamic state as '!invalid'.
                                            ::ms::entry::Pathname_Cmd $w state !invalid

                                            # If the corrected value is different than the current value,
                                            # clear the widget field, insert the corrected value and position the cursor at the end.
                                            if { $value ne $args } {
                                                interp invokehidden {} $w delete    0 end
                                                interp invokehidden {} $w selection clear
                                                interp invokehidden {} $w insert    0 $value
                                                interp invokehidden {} $w icursor   end
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        default {
                            # Check if current value is the empty string.
                            switch -- $value {
                                ""  {
                                    # Clear the widget field.
                                    interp invokehidden {} $w delete    0 end
                                    interp invokehidden {} $w selection clear
                                }
                                default {
                                    # If the corrected value is different than the current value,
                                    # clear the widget field, insert the corrected value and position the cursor at the end.
                                    if { $value ne $args } {
                                        interp invokehidden {} $w delete    0 end
                                        interp invokehidden {} $w selection clear
                                        interp invokehidden {} $w insert    0 $value
                                        interp invokehidden {} $w icursor   end
                                    }
                                }
                            }
                        }
                    }

                    # If the current value is different than the previous registered one, register it
                    # and launch the external procedure provided, if any.
                    if { $value ne $::ms::data($w,current_value) } {
                        set ::ms::data($w,current_value) $value

                        ::ms::Execute_Widget_Cmd $w
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
# Update any entry widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::entry::Style_Update { stylename caller_info } {
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

    # Update all the entry widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,entry,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::entry(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TEntry,$option)

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
            disabled -
            readonly { set cursor arrow }
            normal   { set cursor $::ms::current($w,cursor) }
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

        # Note: 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify', 'padding'
        #       and 'selectborderwidth' are not allowed to change if the statespec changes.

        # Agglomerate the padding values.
        set padding ""
        foreach pad $::ms::current($w,padding) {
            append padding "$pad" "-"
        }
        set padding [string trimright $padding "-"]

        ###################
        ##               ##
        ##     ENTRY     ##
        ##               ##
        ###################

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
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
                                               "." $stylename];

        # If needed, create the widget style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)            -background $::ms::current($w,background) \
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

        # fieldbackground
        switch -- $::ms::managed_by($w,fieldbackground) {
            developer { lappend mapping -fieldbackground [list pressed $::ms::current($w,fieldbackground)] }
            Tk  {
                # Check if a 'fieldbackground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,fieldbackground)] {
                    1   { lappend mapping -fieldbackground $::ms::stylemap($::ms::theme,$stylename,fieldbackground) }
                }
            }
        }

        # focuscolor
        switch -- $::ms::managed_by($w,focuscolor) {
            developer { lappend mapping -focuscolor [list pressed $::ms::current($w,focuscolor)] }
            Tk  {
                # Check if a 'focuscolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,focuscolor)] {
                    1   { lappend mapping -focuscolor $::ms::stylemap($::ms::theme,$stylename,focuscolor) }
                }
            }
        }

        # foreground
        switch -- $::ms::managed_by($w,foreground) {
            developer { lappend mapping -foreground [list pressed $::ms::current($w,foreground)] }
            Tk  {
                # Check if a 'foreground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,foreground)] {
                    1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$stylename,foreground) }
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

        # placeholderforeground
        switch -- $::ms::managed_by($w,placeholderforeground) {
            developer { lappend mapping -placeholderforeground [list pressed $::ms::current($w,placeholderforeground)] }
            Tk  {
                # Check if a 'placeholderforeground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,placeholderforeground)] {
                    1   { lappend mapping -placeholderforeground $::ms::stylemap($::ms::theme,$stylename,placeholderforeground) }
                }
            }
        }

        # selectbackground
        switch -- $::ms::managed_by($w,selectbackground) {
            developer { lappend mapping -selectbackground [list pressed $::ms::current($w,selectbackground)] }
            Tk  {
                # Check if a 'selectbackground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,selectbackground)] {
                    1   { lappend mapping -selectbackground $::ms::stylemap($::ms::theme,$stylename,selectbackground) }
                }
            }
        }

        # selectforeground
        switch -- $::ms::managed_by($w,selectforeground) {
            developer { lappend mapping -selectforeground [list pressed $::ms::current($w,selectforeground)] }
            Tk  {
                # Check if a 'selectforeground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,selectforeground)] {
                    1   { lappend mapping -selectforeground $::ms::stylemap($::ms::theme,$stylename,selectforeground) }
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

        # Check if the widget has the focus.
        switch -- [interp invokehidden {} $w instate focus] {
            0   { set placeholder $::ms::current($w,placeholder) }
            1   { set placeholder "" }
        }

        # Apply the changes.
        interp invokehidden {} $w configure      -cursor $cursor \
                                                   -font $::ms::current($w,font) \
                                                -justify $::ms::current($w,justify) \
                                            -placeholder $placeholder \
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
# Manage the <ButtonPress-1> event.
# Sets the insertion cursor, claim the input focus and set up for future possible drag operations.
#
# Note: This is a slighty modified version of the '::ttk::entry::Press' procedure of the Tk entry.
#       All credits goes to the original author/s.
#
# Where:
#
# w   Should be the widget real address involved.
#
# x   Should be the current 'x' coordinate of the mouse pointer.
#
# It doesn't return anything.
proc ::ms::entry::ButtonPress { w x } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return ""}
    }

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

    interp invokehidden {} $w icursor   [::ttk::entry::ClosestGap $w $x]
    interp invokehidden {} $w selection clear
    interp invokehidden {} $w configure -placeholder ""

    # Set up for future drag, double-click, triple-click or quadruple-click.
    set ::ttk::entry::State(x)          $x
    set ::ttk::entry::State(selectMode) char
    set ::ttk::entry::State(anchor)     [interp invokehidden {} $w index insert]

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
proc ::ms::entry::Destroy { w } {
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

    # Remove the widget address from the entry widgets real address list.
    set index [lsearch -exact $::ms::addr(entry) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(entry) [lremove $::ms::addr(entry) $index] }
    }

    # Remove the widget address from the entry classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),entry,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),entry,addrs) [lremove $::ms::class($::ms::current($w,class),entry,addrs) $index] }
    }

    # Remove the widget address from the entry classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),entry,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),entry,addrs) [lremove $::ms::style($::ms::current($w,style),entry,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the entry classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),entry,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(entry,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(entry,classtype) [lremove $::ms::style(entry,classtype) $index] }
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
                         ::ms::current($w,charwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,command) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,datatype) \
                         ::ms::current($w,decimals) \
                         ::ms::current($w,exportselection) \
                         ::ms::current($w,fieldbackground) \
                         ::ms::current($w,focuscolor) \
                         ::ms::current($w,focuswidth) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,from) \
                         ::ms::current($w,hash) \
                         ::ms::current($w,invalidcommand) \
                         ::ms::current($w,insertcolor) \
                         ::ms::current($w,insertwidth) \
                         ::ms::current($w,justify) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,maxlength) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,placeholder) \
                         ::ms::current($w,placeholderforeground) \
                         ::ms::current($w,selectbackground) \
                         ::ms::current($w,selectborderwidth) \
                         ::ms::current($w,selectforeground) \
                         ::ms::current($w,show) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,to) \
                         ::ms::current($w,validate) \
                         ::ms::current($w,validatecommand) \
                         ::ms::current($w,xscrollcommand);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,current_value) \
                         ::ms::data($w,format) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,charwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,command) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,datatype) \
                         ::ms::default($w,decimals) \
                         ::ms::default($w,exportselection) \
                         ::ms::default($w,fieldbackground) \
                         ::ms::default($w,focuscolor) \
                         ::ms::default($w,focuswidth) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,from) \
                         ::ms::default($w,hash) \
                         ::ms::default($w,invalidcommand) \
                         ::ms::default($w,insertcolor) \
                         ::ms::default($w,insertwidth) \
                         ::ms::default($w,justify) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,maxlength) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,placeholder) \
                         ::ms::default($w,placeholderforeground) \
                         ::ms::default($w,selectbackground) \
                         ::ms::default($w,selectborderwidth) \
                         ::ms::default($w,selectforeground) \
                         ::ms::default($w,show) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,textvariable) \
                         ::ms::default($w,to) \
                         ::ms::default($w,validate) \
                         ::ms::default($w,validatecommand) \
                         ::ms::default($w,xscrollcommand);

    unset -nocomplain -- ::ms::managed_by($w,background) \
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
# w   should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::entry::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    interp invokehidden {} $w state [list focus]

    # Select all the widget textarea characters.
    interp invokehidden {} $w selection range 0 end

    # Remove the placeholder, if any.
    interp invokehidden {} $w configure -placeholder ""

    return ""
}

## FocusOut
#
# Manage the **FocusOut** event.
#
# Where:
#
# w   should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::entry::FocusOut { w } {
    # If the contextual menu of the widget is open do not:
    #   - loose the focus (graphically),
    #   - remove the selection,
    #   - validate the data,
    #   - or change the placeholder.
    switch -- [_winfo exists $::ms::current($w,cmenu)] {
        1   { return "" }
    }

    # Change the widget dynamic state to '!focus'.
    interp invokehidden {} $w state [list !focus]

    # Remove the widget selection, if any.
    interp invokehidden {} $w selection clear

    # Re-enable the placeholder.
    interp invokehidden {} $w configure -placeholder $::ms::current($w,placeholder)

    # Validate the widget string.
    set value [::ms::entry::Validate_String $w]

    # Clear the widget field, insert the validated value and put the cursor at the end.
    interp invokehidden {} $w delete    0 end
    interp invokehidden {} $w selection clear
    interp invokehidden {} $w insert    0 $value
    interp invokehidden {} $w icursor   end

    # If 'value' is different than the previous registered one, register it
    # and launch the external procedure provided, if any.
    if { $value ne $::ms::data($w,current_value) } {
        set ::ms::data($w,current_value) $value

        ::ms::Execute_Widget_Cmd $w
    }

    return ""
}

## KeyPress
#
# Manage the **KeyPress** event.
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
proc ::ms::entry::KeyPress { w key } {
    # Check the datatype provided for the widget.
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
        hex8  -
        hex12 -
        hex16 {
            # Check if 'key' is a special key.
            switch -- $key {
                "#" {
                    # Check if hash are allowed for the widget.
                    switch -- $::ms::current($w,hash) {
                        no  {
                            # 😕 Do not insert the key.
                            return -code break
                        }

                    }
                }
                Caps_Lock {}
                default   {
                    # Check if 'key' is not an hexadecimal valid key.
                    if { ![regexp "\[0-9a-fA-F\]" %A] } {
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
                    # Check if 'key' is not an positive real valid key.
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

## Return
#
# Manage the **Return** key event.
#
# Where:
#
# w   should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::entry::Return { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled -
        readonly { return "" }
    }

    # Validate the widget string.
    set value [::ms::entry::Validate_String $w]

    # Clear the widget field, insert the validated value, select all characters
    # and put the cursor at the end.
    interp invokehidden {} $w delete    0 end
    interp invokehidden {} $w insert    0 $value
    interp invokehidden {} $w selection range 0 end
    interp invokehidden {} $w icursor   end

    # If the current value is different than the previous registered one, register it
    # and launch the external procedure provided, if any.
    if { $value ne $::ms::data($w,current_value) } {
        set ::ms::data($w,current_value) $value

        ::ms::Execute_Widget_Cmd $w
    }

    return ""
}

## Shift_MouseWheel
#
# If the widget has the focus, move the insert cursor by one character to the left or to the right
# (depending on the mousewheel direction), otherwise trys to find the innermost widget's scrollable
# parent with an active horizontal scrollbar and move that scrollbar by one unit left or right
# (again, depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, it doesn't do anything.
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
proc ::ms::entry::Shift_MouseWheel { w amount } {
    if { [_focus -displayof $w] eq $w } {
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

        # Get the current cursor position
        set index [interp invokehidden {} $w index insert]

        # Move the cursor by one character to the left or to the right (depending
        # on the mousewheel direction).
        if { $amount > 0 } {
            interp invokehidden {} $w icursor $index+1
        } else {
            interp invokehidden {} $w icursor $index-1
        }

        # Remove any previous selection on the widget.
        interp invokehidden {} $w selection clear

        # Make the index character visible.
        ::ttk::entry::See $w $index
    } else {
        ::ms::Scroll_Parent_X $w $amount units
    }

    return ""
}

## Touchpad
#
# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget has the focus, any movement along the X axis will move the insert cursor by one
#       character to the left or to the right (depending on the mousewheel direction), otherwise any movement
#       along the X axis will try to find the innermost widget's scrollable parent with an active horizontal
#       scrollbar and move that scrollbar by one unit left or right (again, depending on the mousewheel direction).
#       If none of the widget's parent meets the required condition, it doesn't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, it doesn't do anything on the vertical axis.
#
# Where:
#
# w         Should be the widget real address involved.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# amount    Should be the delta value of a **TouchpadScroll** event.
#           The delta value represents the rotation units the mousewheel has been moved.
#           The sign of the value represents the direction the mousewheel was scrolled.
#           *Amount* is normally delivered by the **TouchpadScroll** event with a value of
#           **+120.0** or **-120.0**, depending on the scroll direction.
#
#           If the value provided as *amount* is not an integer or a float,
#           defaults to **+120.0**.
#
#           Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# It doesn't return anything.
proc ::ms::entry::Touchpad { w counter amount } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # <TouchpadScroll> events can be generated about 60 times per second
    # during a two-finger gestures.
    # This allow the binding script to respond to every 5th <TouchpadScroll> event
    # by testing is the 'counter' is divisible by 5.
    set counter [expr { $counter%5 }]
    if { $counter != 0 } {
        return ""
    }

    # Translate 'amount' in 'deltaX' and 'deltaY'.
    lassign [::tk::PreciseScrollDeltas $amount] deltaX deltaY

    # Adjust 'deltaX' and 'deltaY' values, or the movement will be too slow.
    set deltaX [expr { $deltaX*30 }]
    set deltaY [expr { $deltaY*30 }]

    if { [_focus -display $w] eq $w } {
        # If there is a movement along the X axis, move the insert cursor by one
        # character to the left or to the right (depending on the horizontal touchpad direction).
        if { $deltaX != 0 } {
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

            # Get the current cursor position.
            set index [interp invokehidden {} $w index insert]

            # Move the cursor.
            if { $amount > 0 } {
                interp invokehidden {} $w icursor $index+1
            } else {
                interp invokehidden {} $w icursor $index-1
            }

            # Remove any previous selection on the widget.
            interp invokehidden {} $w selection clear

            # Make the index character visible.
            ::ttk::entry::See $w $index
        }

        # If there is a movement along the Y axis, launch '::ms::Scroll_Parent_Y'.
        if { $deltaY != 0 } {
            ::ms::Scroll_Parent_Y $w $deltaY units
        }
    } else {
        ::ms::Touchpad_Parent $w $counter $amount units
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
# Limit the input keypresses in an entry widget and update the widget state ('invalid' or '!invalid').
#
# Where:
#
# w        should be the widget real address involved.
#
# string   should be the string to check.
#
# It returns a boolean value ['0' or '1'] indicating if the string provided
# reached it's length limit or not.
proc ::ms::entry::Validate_KeyPress { w string } {
    # Check if the character is allowed to be displayed or not
    switch -- $::ms::current($w,maxlength) {
        0       {}
        default {
            # Check if the length of string is bigger than the maxlength allowed.
            if { [string length $string] > $::ms::current($w,maxlength) } {
                return 0
            }
        }
    }

    # Remove any leading and trailing spaces from 'string'.
    set value [string trim $string]

    # Check 'value'.
    switch -- $value {
        ""      {}
        default {
            # Note: Illegal datatype characters cannot be inserted directly through the keyboard,
            #       we made sure of that trough the widget bindings.
            #       Nonetheless, they can be inserted trough a paste or pasteselection event.
            #       If this is the case, we will let the illegal character be inserted but we will
            #       mark the string as invalid.

            # Check if the widget needs to change it's state from 'invalid' to '!invalid' or viceversa.
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
                                        ::ms::combobox::Pathname_Cmd $w state invalid

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
                                        ::ms::combobox::Pathname_Cmd $w state invalid

                                        return 1
                                    }
                                }
                            }
                        }

                        incr i
                    }
                }
                hex8  -
                hex12 -
                hex16 {
                    # Check the first character of 'value' to see if its an 'hash' sign.
                    set hash [string index $value 0]
                    switch -- $hash {
                        "#" {
                            switch -- $::ms::current($w,hash) {
                                no  {
                                    # Change the widget dynamic state to 'invalid'.
                                    ::ms::entry::Pathname_Cmd $w state invalid

                                    return 1
                                }
                            }
                        }
                        default {
                            set result [::ms::Check_Color [list $value $::ms::current($w,datatype)] invalid]
                            switch -- $result {
                                invalid {
                                    # Change the widget dynamic state to 'invalid'.
                                    ::ms::entry::Pathname_Cmd $w state invalid

                                    return 1
                                }
                            }
                        }
                    }
                }
                integer {
                    # Check 'value' to see if its the 'minus' sign.
                    switch -- $value {
                        "-"     {}
                        default {
                            # Check if 'value' is an integer.
                            switch -- [string is integer $value] {
                                0   {
                                    # Change the widget dynamic state to 'invalid'.
                                    ::ms::entry::Pathname_Cmd $w state invalid

                                    return 1
                                }
                                1   {
                                    # Check that 'value' is not beyond the entry limits.
                                    if { ($value < $::ms::current($w,from)) || ($value > $::ms::current($w,to)) } {
                                        # Change the widget dynamic state to 'invalid'.
                                        ::ms::entry::Pathname_Cmd $w state invalid

                                        return 1
                                    }
                                }
                            }
                        }
                    }
                }
                posinteger {
                    # Check if 'value' is an integer.
                    switch -- [string is integer $value] {
                        0   {
                            # Change the widget dynamic state to 'invalid'.
                            ::ms::entry::Pathname_Cmd $w state invalid

                            return 1
                        }
                        1   {
                            # Check that 'value' is not beyond the entry limits.
                            if { ($value < $::ms::current($w,from)) || ($value > $::ms::current($w,to)) } {
                                # Change the widget dynamic state to 'invalid'.
                                ::ms::entry::Pathname_Cmd $w state invalid

                                return 1
                            }
                        }
                    }
                }
                posreal {
                    # Check if 'value' is the 'point' sign.
                    switch -- $value {
                        "."     {}
                        default {
                            # Check if 'value' is a double.
                            switch -- [string is double $value] {
                                0   {
                                    # Change the widget dynamic state to 'invalid'.
                                    ::ms::entry::Pathname_Cmd $w state invalid

                                    return 1
                                }
                                1   {
                                    # Check that 'value' is not beyond the entry limits.
                                    if { ($value < $::ms::current($w,from)) || ($value > $::ms::current($w,to)) } {
                                        # Change the widget dynamic state to 'invalid'.
                                        ::ms::entry::Pathname_Cmd $w state invalid

                                        return 1
                                    }
                                }
                            }
                        }
                    }
                }
                real {
                    # Check if 'value' is the 'point' or 'minus' sign.
                    switch -- $value {
                        "-"     -
                        "."     {}
                        default {
                            # Check if 'value' is a double.
                            switch -- [string is double $value] {
                                0   {
                                    # Change the widget dynamic state to 'invalid'.
                                    ::ms::entry::Pathname_Cmd $w state invalid

                                    return 1
                                }
                                1   {
                                    # Check that 'value' is not beyond the entry limits.
                                    if { ($value < $::ms::current($w,from)) || ($value > $::ms::current($w,to)) } {
                                        # Change the widget dynamic state to 'invalid'.
                                        ::ms::entry::Pathname_Cmd $w state invalid

                                        return 1
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    # Change the widget dynamic state to '!invalid'.
    ::ms::entry::Pathname_Cmd $w state !invalid

    return 1
}

## Validate_String
#
# Validate the string inside the widget.
#
# Where:
#
# w   should be the widget real address involved.
#
# Return the validated string.
proc ::ms::entry::Validate_String { w } {
    ##############################
    ##                          ##
    ##     VALUE CORRECTION     ##
    ##                          ##
    ##############################

    # Get the widget string and remove any leading/trailing spaces from it.
    set value [string trim [interp invokehidden {} $w get]]

    # Note: Illegal datatype characters cannot be inserted directly through the keyboard,
    #       we made sure of that trough the widget bindings.
    #       Nonetheless, they can be inserted trough a paste or pasteselection event.

    # Clear 'value' from any illegal characters, if any.
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

                # Add char to the corrected value.
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

                # Add char to the corrected value.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
        hex8  -
        hex12 -
        hex16 {
            switch -- [string index $value 0] {
                "#" {
                    # Check if the hash sign '#' should be included or not.
                    switch -- $::ms::current($w,hash) {
                        no  { set i 0 }
                        yes {
                            # Add '#' to the corrected value.
                            append corrected_value "#"

                            set i 1
                        }
                    }
                }
                default { set i 0 }
            }

            # Check every character in 'value'.
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "#" {
                        incr i
                        continue
                    }
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

                # Add char to the corrected value.
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

                # Add char to the corrected value.
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

                # Add char to the corrected value.
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

                # Add char to the corrected value.
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

                # Add char to the corrected value.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
    }

    # Note: At this point, every illegal characters in 'value' (for the datatype specified) have been stripped out.

    ########################
    ##                    ##
    ##     VALIDATION     ##
    ##                    ##
    ########################

    # If the datatype is not 'none', 'alnum' or 'alpha' validate 'value'.
    switch -- $::ms::current($w,datatype) {
        hex8  -
        hex12 -
        hex16 {
            # Check if 'value' is the empty string.
            switch -- $value {
                ""      {}
                default {
                    # Check if 'value' is a valid hexadecimal color.
                    set value [::ms::Check_Hex $value $::ms::current($w,datatype) invalid]
                    switch -- $value {
                        invalid { set value $::ms::data($w,current_value) }
                        default {
                            # Check if the hash sign '#' should be included or not.
                            switch -- $::ms::current($w,hash) {
                                no  { set value [string trimleft $value "#"] }
                            }
                        }
                    }
                }
            }
        }
        integer    -
        posinteger {
            # Check if 'value' is the empty string.
            switch -- $value {
                ""      {}
                default {
                    # Beautify 'value'.
                    set value [::ms::Beautify_Input_Number $value $::ms::current($w,maxlength) $::ms::current($w,datatype)]

                    # Check if 'value' is a valid number.
                    switch -- [string is integer -strict $value] {
                        0   { set value $::ms::data($w,current_value) }
                        1   {
                            # Check that 'value' is not beyond the widget limits, truncate if needed.
                            if { $value < $::ms::current($w,from) } {
                                set value $::ms::current($w,from)
                            } elseif { $value > $::ms::current($w,to) } {
                                set value $::ms::current($w,to)
                            }
                        }
                    }
                }
            }
        }
        posreal -
        real    {
            # Check if 'value' is the empty string.
            switch -- $value {
                ""      {}
                default {
                    # Beautify 'value'.
                    set value [::ms::Beautify_Input_Number $value $::ms::current($w,maxlength) $::ms::current($w,datatype)]

                    # Check if 'value' is a valid number.
                    switch -- [string is double -strict $value] {
                        0   { set value $::ms::data($w,current_value) }
                        1   {
                            # Check that 'value' is not beyond the widget limits, truncate if needed.
                            if { $value <= $::ms::current($w,from) } {
                                set value $::ms::current($w,from)
                            } elseif { $value >= $::ms::current($w,to) } {
                                set value $::ms::current($w,to)
                            } else {
                                set value [format $::ms::data($w,format) $value]
                            }
                        }
                    }
                }
            }
        }
    }

    # Set the widget dynamic state as '!invalid'.
    ::ms::entry::Pathname_Cmd $w state !invalid

    return $value
}

#*EOF*