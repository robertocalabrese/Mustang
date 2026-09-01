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

## menubutton
#
#### DESCRIPTION:
#
# The menubutton command creates a new window (given by the *window* argument) and makes it into a menubutton widget.
# A menubutton widget purpose is to pops down a menu when pressed.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname,
#         but the pathname's parents must exists.
#         *Window* may be provided either as a short or as a real address, the address returned will be:
#            - A short address, if the *window* provided as input is a short address.
#            - A real address, if the *window* provided as input is a real address.
#
# Note 2: The mustang menubutton widget is a single widget (a 'ttk::menubutton').
#
# Additional options, described below, may be specified on the command line to configure aspects of the menubutton.
#
#### SYNOPSIS:
#
# **menubutton**  *window* ?*option value*? ... ?*option value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-arrowcolor**        It's a list that specifies the color to use for the arrow objects.
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: It's only meaningful for themes that use the 'default' or 'clam' engine (like the 'Halo' theme).
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-arrowcolor** specified in its style.
#                                                       If there isn't one, the **-arrowcolor** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-arrowcolor** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
#                        See also **-arrowsize**.
#
# **-arrowsize**         Specifies the size of the arrow objects.
#                        The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                        (pixels, points, inches, millimeters or centimeters).
#
#                        Note: It's only meaningful for themes that use the 'default' or 'clam' engine (like the 'Halo' theme).
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-arrowsize** specified in its style.
#                                                       If there isn't one, the **-arrowsize** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-arrowsize** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget state changes.
#
#                        See also **-arrowcolor**.
#
# **-background**        It's a list that specifies the color to use as background.
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                       If there isn't one, the **-background** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-background** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
#                        See also **-foreground**.
#
# **-bordercolor**       It's a list that specifies the color to use as bordercolor.
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: It's only meaningful for widget with a **solid** or **flat** relief.
#
#                        Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                       If there isn't one, the **-bordercolor** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-bordercolor** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
#                        See also **-borderwidth** and **-relief**.
#
# **-class**             Specifies a class for the widget.
#                        It is mainly used to make bindings for widgets that have the same class.
#
#                        Note: This option may only be provided while creating the widget.
#                              Attempts to change this value after the widget is created by using the **configure** command,
#                              will be ignored by mustang.
#
#                        If not provided, defaults to **TMenubutton**.
#
# **-compound**          Specifies if the widget should display text and images at the same time, and if so, where the image
#                        should be placed relative to the text.
#
#                        Allowed values:
#                           **text**                      --> Display the text only.
#                           **image**                     --> Display the image only.
#                           **center**                    --> Display the text centered on top of the image.
#                           **top**                       --> Display the image above the text.
#                           **bottom**                    --> Display the image below the text.
#                           **left**                      --> Display the image before the text.
#                           **right**                     --> Display the image after the text.
#                           **none** or the empty string  --> Display the image if present, otherwise the text.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-compound** specified in its style.
#                                                       If there isn't one, the **-compound** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-compound** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget state changes.
#
#                        See also **-image**, **-text** and **-textvariable**.
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
#                                                       If there isn't one, the **-cursor** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-cursor** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget state changes.
#
# **-darkcolor**         It's a list that specifies the color to use as darkcolor.
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: It's only meaningful for widgets with a relief that is not **flat** or **solid**.
#
#                        Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-darkcolor** specified in its style.
#                                                       If there isn't one, the **-darkcolor** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-darkcolor** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
#                        See also **-lightcolor**.
#
# **-direction**         It's a string that specifies where the menu is to be popped up relative to the menubutton.
#                        Allowed values are: **above**, **below**, **left**, **right** or **flush**.
#                        **flush** pops the menu up directly over the menubutton.
#
#                        Note: **flush** it's only meaningful in macOS operating systems.
#                              It will be ignored by the other operating systems.
#
#                        If not provided, defaults to **below**.
#
# **-fieldbackground**   It's a list that specifies the color to use as fieldbackground.
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-fieldbackground** specified in its style.
#                                                       If there isn't one, the **-fieldbackground** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-fieldbackground** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
#                        See also **-background** and **-foreground**.
#
# **-focuscolor**        It's a list that specifies the color to use as focuscolor (the color or the focus ring).
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: It's only meaningful for themes that use the 'alt', 'default' or 'classic' engine
#                              and ignored by themes that use the 'clam' engine'.
#                              If the current theme uses the 'clam' engine (like the 'Halo' theme) a combination of
#                              'bordercolor' and 'lightcolor' will be used instead.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-focuscolor** specified in its style.
#                                                       If there isn't one, the **-focuscolor** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-focuscolor** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
#                        See also **-bordercolor**.
#
# **-focuswidth**        It's a list that specifies the color to use as focuswidth (the size of the focus ring).
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-focuswidth** specified in its style.
#                                                       If there isn't one, the **-focuswidth** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-focuswidth** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget state changes.
#
# **-font**              Specifies the font to use for the text displayed by the widget.
#                        The widget will accept as fontname any font created with the **font** command, including any Tk
#                        defaults fonts, the new mustang fonts (**BiggestFont**, **BiggerFont**, **NormalFont**, **SmallerFont**,
#                        **SmallestFont** and **MonospaceFont**) or fonts defined by the developer itself.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-font** specified in its style.
#                                                       If there isn't one, the **-font** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-font** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget state changes.
#
#                        See also **-foreground**.
#
# **-foreground**        It's a list that specifies the color to use as foreground.
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-foreground** specified in its style.
#                                                       If there isn't one, the **-foreground** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-foreground** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
#                        See also **-background**, **-fieldbackground** and **-font**.
#
# **-image**             Specifies an image to display. This is a list of one or more elements.
#                        The first element is the default image name. The rest of the list is a sequence of statespec/value
#                        pairs as per style map, specifying different images to use when the widget is in a particular state
#                        or combination of states.
#
#                        Note that all images in the list should have the same size.
#
#                        If an empty string is specified, it indicates that the widget has no image to display.
#                        The image specified should have been already created at the time the widget is created.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-image** specified in its style.
#                                                       If there isn't one, the **-image** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-image** will not abide by its mapping values, if any.
#                                                       Its mapping values must be specified as stated above, even in styles.
#
#                        See also **-compound**, **-text** and **-textvariable**.
#
# **-justify**           If there are multiple lines of text, specifies how the lines are laid out relative to one another.
#                        Allowed values:
#                            **left**,
#                            **center**,
#                            **right**.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-justify** specified in its style.
#                                                       If there isn't one, the **-justify** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-justify** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget state changes.
#
#                        See also **-anchor**.
#
# **-lightcolor**        It's a list that specifies the color to use as lightcolor.
#                        See the **COLOR OPTION** section to know how this list should be composed.
#
#                        Note: It's only meaningful for widgets with a relief that is not **flat** or **solid**.
#
#                        Note: It's only meaningful if the current theme uses the 'clam' engine (like the 'Halo' theme).
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-lightcolor** specified in its style.
#                                                       If there isn't one, the **-lightcolor** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-lightcolor** will always abide by its mapping values, if any.
#                                                       Styles, mappings and states events are allowed to change its value.
#
#                        See also **-darkcolor**.
#
# **-menu**              Specifies the path name of the menu associated with the menubutton.
#
#                        If not provided, defaults to the empty string, meaning no menu list available.
#
# **-padding**           Specifies the internal padding for the widget.
#                        The padding is a list of up to four length specifications.
#                        The values must be in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                        (pixels, points, inches, millimeters or centimeters).
#
#                        A list of four values specifies the left, top, right and bottom padding.
#                        A list of three values specifies the left, vertical, and right padding.
#                        A list of two values specifies the horizontal and the vertical padding
#                        A single value specifies the same padding all the way around the widget.
#
#                        When computing how large a window it needs, the widget will add this amount to the width it would
#                        normally need (as determined by the width of the things displayed in the widget).
#                        If the geometry manager can satisfy this request, the widget will end up with extra internal space
#                        to the left and/or right of what it displays inside.
#
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-padding** specified in its style.
#                                                       If there isn't one, the **-padding** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The **-padding** will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget state changes.
#
# **-posthook**          Specifies a procedure to call just after the destroy of the popdown window.
#                        This procedure will be launched with one parameter, the real address of the menubutton involved.
#                        Providing an empty string will mean to not launch any procedure after the popdown window is destroyed.
#
#                        If not provided, defaults to the empty string.
#
# **-prehook**           Specifies a procedure to call just before the creation of the popdown window.
#                        This procedure will be launched with one parameter, the real address of the menubutton involved.
#                        Providing an empty string will mean to not launch any procedure before the creation of the popdown window.
#
#                        If not provided, defaults to the empty string.
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
#                        Note: This is a styleable option.
#
#                              If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                       Only the developer can.
#
#                              If it's not provided --> The widget will follow the **-relief** specified in its style.
#                                                       If there isn't one, the **-relief** of the **TMenubutton** style
#                                                       will be used instead.
#                                                       The '*-relief*' will not abide by its mapping values, if any.
#                                                       It is not supposed to change when the widget state changes.
#
#                        See also **-bordercolor** and **-borderwidth**.
#
# **-state**             Setting it changes the widget **physical** state and not the widget *look* (the state widget command does that).
#                        Allowed states values are **normal**, **active** and **disabled**.
#
#                        In 'normal' state the menubutton is displayed using the **-foreground** and **-background** options provided.
#
#                        The 'active' state is typically used when the pointer is over the menubutton.
#                        In 'active' state the menubutton is displayed using the '-activeforeground' and '-activebackground' options provided.
#
#                        'Disabled' state means that the menubutton should be insensitive: the default bindings will refuse to activate the widget
#                        and will ignore mouse button presses.
#                        In this state the '-disabledforeground' and '-background' options provided determine how the button is displayed.
#
#                        If not provided, defaults to **normal**.
#
# **-style**             Specifies a custom widget style.
#                        If not provided, defaults to **TMenubutton**.
#
#                        The *style* provided should already exists at the time the widget is created.
#
#                        See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**         Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                        and **Shift-Tab**).
#
#                        Before setting the focus to a widget, the traversal scripts consult the value of the
#                        *-takefocus* option.
#                           **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                           **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                     and all of its ancestors are mapped.
#
#                        Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                        If not provided, defaults to **0**.
#
# **-text**              Specifies a list containing the *text string* that will be displayed inside the widget.
#                        The list should contain a *text string* as the first element, followed by any substitution strings
#                        required to form the actual *text string* as separated elements.
#
#                        If a *-textvariable* is not provided as well, the *text string* will be translated automatically
#                        by mustang each time a widget is created and each time the current language changes.
#
#                        In order to do so, mustang requires two things:
#                            1 - The text string should be provided in English (*en*).
#
#                                If presents, each of the substitution strings will substitute a single *%s*,
#                                and their numbers depend on how many *%s* are contained in the text string itself.
#
#                                Note1:  If there is no *%s* in the text string, then there's no need to provide any
#                                        substitution strings.
#
#                                Note2:  Each substitution string will be used verbatim (no translation will be performed on them).
#
#                                Example1: No substitution string (single word)
#
#                                        -text [list "Settings:"]    or just     -text "Settings:"
#
#                                Example2: No substitution string (multiple words)
#
#                                        -text [list "My Settings:"]
#
#                                Example3: One substitution string
#
#                                        -text [list "The %s command is invalid." grid]
#
#                                Example4: Multiple substitution strings
#
#                                        -text [list "The %s command address is invalid: '%s'" grid .myapp]
#
#                                ...
#
#                            2 - A message catalog should be provided with all the translations needed by the application and
#                                each language file present in the catalog, should have its translation defined in the
#                                **::ms** or in the **global** namespace.
#
#                        If these requirements are not both satisfied, mustang will not do any translation.
#
#                        If not provided, defaults to the empty string.
#
#                        See also **-compound**, **-image** and **-textvariable**.
#
# **-textvariable**      Specifies the name of a global variable whose value will be used in place of the *-text* resource.
#                        The variable should already exist at the time the widget is created or this option will be ignored.
#
#                        If provided, mustang will perform no automatic translations (in any scenario).
#                        If not provided, defaults to the empty string.
#
#                        See also **-compound**, **-image** and **-text**.
#
# **-underline**         If set, specifies the index of a character to underline in the text string.
#                        The underlined character is used for mnemonic activation.
#
#                        If not provided, defaults to **-1** (meaning no underline or mnemonic activation will be performed).
#
#### WIDGET COMMAND:
#
# The menubutton command creates a new command whose name is the same as the pathname of the menubutton's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the menubutton widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for menubutton widgets:
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the menubutton command (See **WIDGET OPTIONS**).
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
#   *window* **identify** *component* *x* *y*
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if no *component* is present at that location.
#     *X* and *y* are pixel coordinates relative to the widget.
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
# The menubutton widget supports the **normal**, **active** and **disabled** states.
# In 'normal' state the menubutton is displayed using the **-foreground** and **-background** options provided.
# The 'active' state is typically used when the pointer is over the menubutton.
# In 'active' state the menubutton is displayed using the '-activeforeground' and '-activebackground' options provided.
# 'Disabled' state means that the menubutton should be insensitive: the default bindings will refuse to activate the widget
# and will ignore mouse button presses.
# In this state the '-disabledforeground' and '-background' options provided determine how the button is displayed.
#
#### STYLING OPTIONS:
#
# Default style name: **TMenubutton**
#
# Every menubutton styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the menubuttons in order to facilitate the developer work and
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
#   # Create a menu popup.
#   cmenu .toplevelmenu ...
#
#   # Create three menubuttons with different states.
#   menubutton .mb1 -charwidth 10 \
#                    -compound none \
#                   -direction below \
#                        -font BiggerFont \
#                        -menu .toplevelmenu \
#                    -posthook [list ::Posthook] \
#                     -prehook [list ::Prehook] \
#                      -relief solid \
#                       -state normal \
#                       -style TMenubutton \
#                   -takefocus 1;
#
#   menubutton .mb2 -charwidth 10 \
#                    -compound none \
#                   -direction below \
#                        -font BiggerFont \
#                        -menu .toplevelmenu \
#                    -posthook [list ::Posthook] \
#                     -prehook [list ::Prehook] \
#                      -relief solid \
#                       -state readonly \
#                       -style TMenubutton \
#                   -takefocus 1;
#
#   menubutton .mb3 -charwidth 10 \
#                    -compound none \
#                   -direction below \
#                        -font BiggerFont \
#                        -menu .toplevelmenu \
#                    -posthook [list ::Posthook] \
#                     -prehook [list ::Prehook] \
#                      -relief solid \
#                       -state disabled \
#                       -style TMenubutton \
#                   -takefocus 0;
#
#   # Pack the menubuttons.
#   pack .mb1 -anchor nw \
#             -expand false \
#               -fill none \
#               -padx [list 15 15] \
#               -pady [list 15 15] \
#               -side top;
#
#   pack .mb2 -anchor nw \
#             -expand false \
#               -fill none \
#               -padx [list 15 15] \
#               -pady [list 15 15] \
#               -side top;
#
#   pack .mb3 -anchor nw \
#             -expand false \
#               -fill none \
#               -padx [list 15 15] \
#               -pady [list 15 15] \
#               -side top;
#
#   # Focus the menubutton
#   focus .mb1
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
#   proc ::Posthook { w } {
#       chan puts "$w --> Posthook procedure launched."
#   }
#
#   proc ::Prehook { w } {
#       chan puts "$w --> Prehook procedure launched."
#   }
package provide ::ms::menubutton 0.1

##################################
##                              ##
##     _MENUBUTTON BINDINGS     ##
##                              ##
##################################

# Activate/Deactivate
_bind _Menubutton <Activate>   { interp invokehidden {} %W state !background; break }
_bind _Menubutton <Deactivate> { interp invokehidden {} %W state  background; break }

# Buttonpress
switch -- [_tk windowingsystem] {
    "x11" {
        _bind _Menubutton <ButtonPress-1>   { ::ms::menubutton::Pulldown      %W; break }
        _bind _Menubutton <ButtonRelease-1> { ::ms::menubutton::Transfer_Grab %W; break }
        _bind _Menubutton <B1-Leave>        { ::ms::menubutton::Transfer_Grab %W; break }
    }
    default {
        _bind _Menubutton <ButtonPress-1>   { ::ms::menubutton::ButtonPress   %W; break }
        _bind _Menubutton <ButtonRelease-1> { ::ms::menubutton::ButtonRelease %W; break }
    }
}

# Destroy
_bind _Menubutton <Destroy> { ::ms::menubutton::Destroy %W; break }

# Enter/Leave
_bind _Menubutton <Enter> { ::ms::menubutton::Enter %W; break }
_bind _Menubutton <Leave> { ::ms::menubutton::Leave %W; break }

# FocusIn/FocusOut
_bind _Menubutton <FocusIn>  { ::ms::menubutton::FocusIn  %W; break }
_bind _Menubutton <FocusOut> { ::ms::menubutton::FocusOut %W; break }

# Insert cursor movements.
_bind _Menubutton <<NextLine>> { ::ms::menubutton::Return %W; break }

# Return/KP_Enter/space
_bind _Menubutton <KeyPress-Return>   { ::ms::menubutton::Return %W; break }
_bind _Menubutton <KeyPress-KP_Enter> { ::ms::menubutton::Return %W; break }
_bind _Menubutton <KeyPress-space>    { ::ms::menubutton::Return %W; break }

# Tab/Shift-Tab keys
_bind _Menubutton <KeyPress-Tab> { # Enable binding }
switch -- [_tk windowingsystem] {
    x11 {
        _bind _Menubutton <KeyPress-ISO_Left_Tab> { # Enable binding }

        # This seems to be correct on *some* HP systems.
        catch { _bind _Menubutton <KeyPress-hpBackTab> { # Enable binding } }
    }
    aqua  { _bind _Menubutton <KeyPress-ISO_Left_Tab> { # Enable binding } }
    win32 { _bind _Menubutton <Shift-KeyPress-Tab>    { # Enable binding } }
}

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, nothing will happen.
_bind _Menubutton <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (again, depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, nothing will happen.
_bind _Menubutton <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Menubutton <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Menubutton <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Menubutton <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Menubutton <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **menubutton** package.
namespace eval ::ms::menubutton {
    # Set the 'non styleable' menubutton option list.
    set ::ms::menubutton(non_styleable,options) [list class \
                                                      direction \
                                                      menu \
                                                      posthook \
                                                      prehook \
                                                      state \
                                                      style \
                                                      takefocus \
                                                      text \
                                                      textvariable \
                                                      underline];

    # Set the 'styleable' menubutton option list.
    set ::ms::menubutton(styleable,options) [list arrowcolor \
                                                  arrowsize \
                                                  background \
                                                  bordercolor \
                                                  charwidth \
                                                  compound \
                                                  cursor \
                                                  darkcolor \
                                                  fieldbackground \
                                                  focuscolor \
                                                  focuswidth \
                                                  font \
                                                  foreground \
                                                  image \
                                                  justify \
                                                  lightcolor \
                                                  padding \
                                                  relief];

    # Set the default 'non-styleable' menubutton options values.
    set ::ms::default(menubutton,class)        TMenubutton
    set ::ms::default(menubutton,direction)    below
    set ::ms::default(menubutton,menu)         {}
    set ::ms::default(menubutton,posthook)     {}
    set ::ms::default(menubutton,prehook)      {}
    set ::ms::default(menubutton,state)        normal
    set ::ms::default(menubutton,style)        TMenubutton
    set ::ms::default(menubutton,takefocus)    1
    set ::ms::default(menubutton,text)         {}
    set ::ms::default(menubutton,textvariable) {}
    set ::ms::default(menubutton,underline)    -1

    # Note: The default 'styleable' menubutton options values are always defined inside the current theme.
}

# Rename the original Tk **menubutton** and **ttk::menubutton** commands.
rename menubutton      _menubutton
rename ttk::menubutton _ttk_menubutton

# Create aliases for the mustang **menubutton** command.
interp alias {} menubutton      {} ::ms::menubutton::Command
interp alias {} ttk::menubutton {} ::ms::menubutton::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **menubutton** and **ttk::menubutton** widgets commands.
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
proc ::ms::menubutton::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(menubutton,class)
            set ::ms::default($w,direction)    $::ms::default(menubutton,direction)
            set ::ms::default($w,menu)         $::ms::default(menubutton,menu)
            set ::ms::default($w,posthook)     $::ms::default(menubutton,posthook)
            set ::ms::default($w,prehook)      $::ms::default(menubutton,prehook)
            set ::ms::default($w,state)        $::ms::default(menubutton,state)
            set ::ms::default($w,style)        $::ms::default(menubutton,style)
            set ::ms::default($w,takefocus)    $::ms::default(menubutton,takefocus)
            set ::ms::default($w,text)         $::ms::default(menubutton,text)
            set ::ms::default($w,textvariable) $::ms::default(menubutton,textvariable)
            set ::ms::default($w,underline)    $::ms::default(menubutton,underline)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(menubutton,class)
            set ::ms::current($w,direction)    $::ms::default(menubutton,direction)
            set ::ms::current($w,menu)         $::ms::default(menubutton,menu)
            set ::ms::current($w,posthook)     $::ms::default(menubutton,posthook)
            set ::ms::current($w,prehook)      $::ms::default(menubutton,prehook)
            set ::ms::current($w,state)        $::ms::default(menubutton,state)
            set ::ms::current($w,style)        $::ms::default(menubutton,style)
            set ::ms::current($w,takefocus)    $::ms::default(menubutton,takefocus)
            set ::ms::current($w,text)         $::ms::default(menubutton,text)
            set ::ms::current($w,textvariable) $::ms::default(menubutton,textvariable)
            set ::ms::current($w,underline)    $::ms::default(menubutton,underline)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) menubutton

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
            #       To make a menubutton styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **menubutton** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,arrowcolor)      Tk
            set ::ms::managed_by($w,arrowsize)       Tk
            set ::ms::managed_by($w,background)      Tk
            set ::ms::managed_by($w,bordercolor)     Tk
            set ::ms::managed_by($w,charwidth)       Tk
            set ::ms::managed_by($w,compound)        Tk
            set ::ms::managed_by($w,cursor)          Tk
            set ::ms::managed_by($w,darkcolor)       Tk
            set ::ms::managed_by($w,fieldbackground) Tk
            set ::ms::managed_by($w,focuscolor)      Tk
            set ::ms::managed_by($w,focuswidth)      Tk
            set ::ms::managed_by($w,font)            Tk
            set ::ms::managed_by($w,foreground)      Tk
            set ::ms::managed_by($w,image)           Tk
            set ::ms::managed_by($w,justify)         Tk
            set ::ms::managed_by($w,lightcolor)      Tk
            set ::ms::managed_by($w,padding)         Tk
            set ::ms::managed_by($w,relief)          Tk

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
                    -compound {
                        set value [string tolower $value]
                        switch -- $value {
                            bottom -
                            center -
                            image  -
                            left   -
                            none   -
                            right  -
                            text   -
                            top    {
                                set ::ms::current($w,compound)    $value
                                set ::ms::managed_by($w,compound) developer
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
                    -darkcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,darkcolor)    $value
                        set ::ms::managed_by($w,darkcolor) developer
                    }
                    -direction {
                        set value [string tolower $value]
                        switch -- $value {
                            above -
                            below -
                            flush -
                            left  -
                            right { set ::ms::current($w,direction) $value }
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
                    -image {
                        switch -- [::ms::Check_Image $value] {
                            invalid { continue }
                        }

                        set ::ms::current($w,image)    $value
                        set ::ms::managed_by($w,image) developer
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
                    -menu {
                        set value [string trim $value]
                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
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
                    -posthook { set ::ms::current($w,posthook) $value }
                    -prehook { set ::ms::current($w,prehook) $value }
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
                            disabled -
                            active   -
                            normal   { set ::ms::current($w,state) $value }
                        }
                    }
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TMenubutton' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TMenubutton]
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
                    -text { set ::ms::current($w,text) $value }
                    -textvariable {
                        switch -- [info exists $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,textvariable) $value
                    }
                    -underline {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                        }

                        if { $value < -1 } {
                            continue
                        }

                        set ::ms::current($w,underline) $value
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::menubutton(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TMenubutton,$option)

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
                active {
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

            # Enable/Disable the widget automatic translation.
            switch -- $::ms::current($w,textvariable) {
                ""  {
                    # Automatic translation: ON
                    set ::ms::data($w,translated_text) [::msgcat::mc {*}$::ms::current($w,text)]
                    set text_variable ::ms::data($w,translated_text)
                }
                default {
                    # Automatic translation: OFF
                    set text_variable $::ms::current($w,textvariable)
                }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'arrowsize', 'charwidth', 'compound', 'cursor', 'focuswidth', 'font', 'justify', 'padding'
            #        and 'relief' are not allowed to change if the statespec changes.

            ########################
            ##                    ##
            ##     MENUBUTTON     ##
            ##                    ##
            ########################

            # Agglomerate the padding values.
            set padding ""
            foreach pad $::ms::current($w,padding) {
                append padding "$pad" "-"
            }
            set padding [string trimright $padding "-"]

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_ac=" $::ms::current($w,arrowcolor) \
                                                   "_as=" $::ms::current($w,arrowsize) \
                                                   "_bg=" $::ms::current($w,background) \
                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                   "_fb=" $::ms::current($w,fieldbackground) \
                                                   "_fc=" $::ms::current($w,focuscolor) \
                                                   "_fg=" $::ms::current($w,foreground) \
                                                   "_fn=" $::ms::current($w,font) \
                                                   "_fw=" $::ms::current($w,focuswidth) \
                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                   "_pd=" $padding \
                                                   "_rl=" $::ms::current($w,relief) \
                                                   "." $::ms::current($w,style)];

            # If needed, create the widget style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)      -arrowcolor $::ms::current($w,arrowcolor) \
                                                                   -arrowsize $::ms::current($w,arrowsize) \
                                                                  -background $::ms::current($w,background) \
                                                                 -bordercolor $::ms::current($w,bordercolor) \
                                                                   -darkcolor $::ms::current($w,darkcolor) \
                                                             -fieldbackground $::ms::current($w,fieldbackground) \
                                                                  -focuscolor $::ms::current($w,focuscolor) \
                                                                  -focuswidth $::ms::current($w,focuswidth) \
                                                                        -font $::ms::current($w,font) \
                                                                  -foreground $::ms::current($w,foreground) \
                                                                  -lightcolor $::ms::current($w,lightcolor) \
                                                                     -padding $::ms::current($w,padding) \
                                                                      -relief $::ms::current($w,relief);

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

            # If needed, create the widget mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,widget) {*}$mapping

                # Add the widget mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the menubutton widget.
            _ttk_menubutton $w        -class $::ms::current($w,class) \
                                   -compound $::ms::current($w,compound) \
                                     -cursor $cursor \
                                  -direction $::ms::current($w,direction) \
                                      -image $::ms::current($w,image) \
                                    -justify $::ms::current($w,justify) \
                                       -menu $::ms::current($w,menu) \
                                      -state $::ms::current($w,state) \
                                      -style $::ms::style($w,widget) \
                                  -takefocus $takefocus \
                                       -text "" \
                               -textvariable $text_variable \
                                  -underline $::ms::current($w,underline) \
                                      -width $::ms::current($w,charwidth);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TMenubutton { _bindtags $w [list $w _Menubutton TMenubutton $::ms::addr($w,toplevel) all] }
                default     { _bindtags $w [list $w $::ms::current($w,class) _Menubutton TMenubutton $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::menubutton::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::menubutton::Pathname_Cmd $w]
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

            # Add the widget address to the menubutton widgets real address list.
            lappend ::ms::addr(menubutton) $w

            # Add the widget address to the menubutton classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),menubutton,addrs) $w

            # Add the widget address to the menubutton classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),menubutton,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the menubutton classtype.
            if { $::ms::current($w,style) ni $::ms::style(menubutton.classtype) } {
                lappend ::ms::style(menubutton.classtype) $::ms::current($w,style)
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
proc ::ms::menubutton::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::menubutton(non_styleable,options)) || ($option in $::ms::menubutton(styleable,options))} {
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
                    foreach option $::ms::menubutton(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::menubutton(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::menubutton(non_styleable,options)) || ($option in $::ms::menubutton(styleable,options)) } {
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
                                    -compound {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            bottom -
                                            center -
                                            image  -
                                            left   -
                                            none   -
                                            right  -
                                            text   -
                                            top    {
                                                set ::ms::current($w,compound)    $value
                                                set ::ms::managed_by($w,compound) developer
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
                                    -darkcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,darkcolor)    $value
                                        set ::ms::managed_by($w,darkcolor) developer
                                    }
                                    -direction {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            above -
                                            below -
                                            flush -
                                            left  -
                                            right { set ::ms::current($w,direction) $value }
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
                                    -image {
                                        switch -- [::ms::Check_Image $value] {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,image)    $value
                                        set ::ms::managed_by($w,image) developer
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
                                    -menu {
                                        set value [string trim $value]
                                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
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
                                    -posthook { set ::ms::current($w,posthook) $value }
                                    -prehook { set ::ms::current($w,prehook) $value }
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
                                            disabled -
                                            active   -
                                            normal   { set ::ms::current($w,state) $value }
                                        }
                                    }
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Check if exists a layout for the style provided.
                                            # If not, create one by mirroring the current theme 'TMenubutton' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TMenubutton]
                                            }

                                            # Remove the widget address from the menubutton real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),menubutton,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),menubutton,addrs) [lremove $::ms::style($::ms::current($w,style),menubutton,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,menubutton,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the menubutton classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),menubutton,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(menubutton.classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(menubutton.classtype) [lremove $::ms::style(menubutton.classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the menubutton classtype.
                                            if { $value ni $::ms::style(menubutton.classtype) } {
                                                lappend ::ms::style(menubutton.classtype) $value
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
                                    -text { set ::ms::current($w,text) $value }
                                    -textvariable {
                                        switch -- [info exists $value] {
                                            0   { continue }
                                        }

                                        # Set the new current textvariable.
                                        set ::ms::current($w,textvariable) $value
                                    }
                                    -underline {
                                        switch -- [string is integer -strict $value] {
                                            0   { continue }
                                        }

                                        if { $value < -1 } {
                                            continue
                                        }

                                        set ::ms::current($w,underline) $value
                                    }
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TMenubutton,$option)

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
                                active {
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

                            # Enable/Disable the widget automatic translation.
                            switch -- $::ms::current($w,textvariable) {
                                ""  {
                                    # Automatic translation: ON
                                    set ::ms::data($w,translated_text) [::msgcat::mc {*}$::ms::current($w,text)]
                                    set text_variable ::ms::data($w,translated_text)
                                }
                                default {
                                    # Automatic translation: OFF
                                    set text_variable $::ms::current($w,textvariable)
                                }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'arrowsize', 'charwidth', 'compound', 'cursor', 'focuswidth', 'font', 'justify', 'padding'
                            #        and 'relief' are not allowed to change if the statespec changes.

                            ########################
                            ##                    ##
                            ##     MENUBUTTON     ##
                            ##                    ##
                            ########################

                            # Agglomerate the padding values.
                            set padding ""
                            foreach pad $::ms::current($w,padding) {
                                append padding "$pad" "-"
                            }
                            set padding [string trimright $padding "-"]

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_ac=" $::ms::current($w,arrowcolor) \
                                                                   "_as=" $::ms::current($w,arrowsize) \
                                                                   "_bg=" $::ms::current($w,background) \
                                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                                   "_fb=" $::ms::current($w,fieldbackground) \
                                                                   "_fc=" $::ms::current($w,focuscolor) \
                                                                   "_fg=" $::ms::current($w,foreground) \
                                                                   "_fn=" $::ms::current($w,font) \
                                                                   "_fw=" $::ms::current($w,focuswidth) \
                                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                                   "_pd=" $padding \
                                                                   "_rl=" $::ms::current($w,relief) \
                                                                   "." $::ms::current($w,style)];

                            # If needed, create the widget style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)      -arrowcolor $::ms::current($w,arrowcolor) \
                                                                                   -arrowsize $::ms::current($w,arrowsize) \
                                                                                  -background $::ms::current($w,background) \
                                                                                 -bordercolor $::ms::current($w,bordercolor) \
                                                                                   -darkcolor $::ms::current($w,darkcolor) \
                                                                             -fieldbackground $::ms::current($w,fieldbackground) \
                                                                                  -focuscolor $::ms::current($w,focuscolor) \
                                                                                  -focuswidth $::ms::current($w,focuswidth) \
                                                                                        -font $::ms::current($w,font) \
                                                                                  -foreground $::ms::current($w,foreground) \
                                                                                  -lightcolor $::ms::current($w,lightcolor) \
                                                                                     -padding $::ms::current($w,padding) \
                                                                                      -relief $::ms::current($w,relief);

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

                            # If needed, create the widget mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,widget) {*}$mapping

                                # Add the widget mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure       -cursor $cursor \
                                                                   -direction $::ms::current($w,direction) \
                                                                     -justify $::ms::current($w,justify) \
                                                                        -menu $::ms::current($w,menu) \
                                                                       -state $::ms::current($w,state) \
                                                                       -style $::ms::style($w,widget) \
                                                                   -takefocus $takefocus \
                                                                        -text "" \
                                                                -textvariable $text_variable \
                                                                   -underline $::ms::current($w,underline) \
                                                                       -width $::ms::current($w,charwidth);

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
            # *window* **identify** *x* *y*
            # *window* **identify** **element** *x* *y*
            switch -- [llength $args] {
                2   {
                    set x [lindex $args 0]
                    set y [lindex $args 1]

                    # Check that the coordinates provided are valid.
                    switch -- [string is integer -strict $x] {
                        0   { ::ms::Error "Invalid coordinate, '$x'." $caller_info }
                    }

                    switch -- [string is integer -strict $y] {
                        0   { ::ms::Error "Invalid coordinate, '$y'." $caller_info }
                    }
                }
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
                }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w $cmd {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                switch -glob -- $result {
                    *downarrow { return "Menubutton.downarrow" }
                    *label     { return "Menubutton.label" }
                    *padding   { return "Menubutton.padding" }
                    default    { return "" }
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

                    # Apply the new statespec.
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
# Update any menubutton widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::menubutton::Style_Update { stylename caller_info } {
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

    # Update all the menubutton widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,menubutton,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::menubutton(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TMenubutton,$option)

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
            active {
                # Check the windowing system.
                switch -- [_tk windowingsystem] {
                    aqua    { set cursor hand1 }
                    default { set cursor arrow }
                }
            }
            normal { set cursor $::ms::current($w,cursor) }
        }

        #######################################
        ##                                   ##
        ##     UPDATE THE WIDGET'S STYLE     ##
        ##                                   ##
        #######################################

        # Note: 'arrowsize', 'charwidth', 'compound', 'cursor', 'focuswidth', 'font', 'justify', 'padding'
        #        and 'relief' are not allowed to change if the statespec changes.

        ########################
        ##                    ##
        ##     MENUBUTTON     ##
        ##                    ##
        ########################

        # Agglomerate the padding values.
        set padding ""
        foreach pad $::ms::current($w,padding) {
            append padding "$pad" "-"
        }
        set padding [string trimright $padding "-"]

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_ac=" $::ms::current($w,arrowcolor) \
                                               "_as=" $::ms::current($w,arrowsize) \
                                               "_bg=" $::ms::current($w,background) \
                                               "_bc=" $::ms::current($w,bordercolor) \
                                               "_dc=" $::ms::current($w,darkcolor) \
                                               "_fb=" $::ms::current($w,fieldbackground) \
                                               "_fc=" $::ms::current($w,focuscolor) \
                                               "_fg=" $::ms::current($w,foreground) \
                                               "_fn=" $::ms::current($w,font) \
                                               "_fw=" $::ms::current($w,focuswidth) \
                                               "_lc=" $::ms::current($w,lightcolor) \
                                               "_pd=" $padding \
                                               "_rl=" $::ms::current($w,relief) \
                                               "." $::ms::current($w,style)];

        # If needed, create the widget style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)      -arrowcolor $::ms::current($w,arrowcolor) \
                                                               -arrowsize $::ms::current($w,arrowsize) \
                                                              -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                         -fieldbackground $::ms::current($w,fieldbackground) \
                                                              -focuscolor $::ms::current($w,focuscolor) \
                                                              -focuswidth $::ms::current($w,focuswidth) \
                                                                    -font $::ms::current($w,font) \
                                                              -foreground $::ms::current($w,foreground) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                                 -padding $::ms::current($w,padding) \
                                                                  -relief $::ms::current($w,relief);

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

        # If needed, create the widget mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,widget) {*}$mapping

            # Add the widget mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        interp invokehidden {} $w configure -cursor $cursor \
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

## ButtonRelease
#
# Manage the **ButtonRelease-1** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::menubutton::ButtonRelease { w } {
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

    # Focus on the menubutton.
    _focus -force $w

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
proc ::ms::menubutton::Destroy { w } {
    # If the menubutton popdown is currently displayed, release the grab.
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

    # Remove the widget address from the menubutton widgets real address list.
    set index [lsearch -exact $::ms::addr(menubutton) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(menubutton) [lremove $::ms::addr(menubutton) $index] }
    }

    # Remove the widget address from the menubutton classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),menubutton,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),menubutton,addrs) [lremove $::ms::class($::ms::current($w,class),menubutton,addrs) $index] }
    }

    # Remove the widget address from the menubutton classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),menubutton,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),menubutton,addrs) [lremove $::ms::style($::ms::current($w,style),menubutton,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the menubutton classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),menubutton,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(menubutton,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(menubutton,classtype) [lremove $::ms::style(menubutton,classtype) $index] }
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
                         ::ms::current($w,compound) \
                         ::ms::current($w,class) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,direction) \
                         ::ms::current($w,fieldbackground) \
                         ::ms::current($w,focuscolor) \
                         ::ms::current($w,focuswidth) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,image) \
                         ::ms::current($w,justify) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,menu) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,posthook) \
                         ::ms::current($w,prehook) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,text) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,underline);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,arrowcolor) \
                         ::ms::default($w,arrowsize) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,charwidth) \
                         ::ms::default($w,compound) \
                         ::ms::default($w,class) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,direction) \
                         ::ms::default($w,fieldbackground) \
                         ::ms::default($w,focuscolor) \
                         ::ms::default($w,focuswidth) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,image) \
                         ::ms::default($w,justify) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,menu) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,posthook) \
                         ::ms::default($w,prehook) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,text) \
                         ::ms::default($w,textvariable) \
                         ::ms::default($w,underline);

    unset -nocomplain -- ::ms::managed_by($w,arrowcolor) \
                         ::ms::managed_by($w,arrowsize) \
                         ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,charwidth) \
                         ::ms::managed_by($w,compound) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,fieldbackground) \
                         ::ms::managed_by($w,focuscolor) \
                         ::ms::managed_by($w,focuswidth) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,image) \
                         ::ms::managed_by($w,justify) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,padding) \
                         ::ms::managed_by($w,relief);

    unset -nocomplain -- ::ms::style($w,widget)

    return ""
}

# Enter
#
# Manages the **Enter** event on a menubutton.
#
# Where:
#
# w   Should be the menubutton real address involved.
#
# It doesn't return anything.
proc ::ms::menubutton::Enter { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Change the widget dynamic state to 'active'.
    interp invokehidden {} $w state [list active]

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
proc ::ms::menubutton::FocusIn { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Change the widget dynamic state to 'focus'.
    interp invokehidden {} $w state [list focus]

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
proc ::ms::menubutton::FocusOut { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Change the widget dynamic state to '!focus'.
    interp invokehidden {} $w state [list !focus]

    return ""
}

# Leave
#
# Manages the **Leave** event on a menubutton.
#
# Where:
#
# w   Should be the menubutton real address involved.
#
# It doesn't return anything.
proc ::ms::menubutton::Leave { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Change the widget dynamic state to '!active'.
    interp invokehidden {} $w state [list !active]

    return ""
}

################################################
##                                            ##
##     REWRITTEN TK MENUBUTTON PROCEDURES     ##
##                                            ##
################################################

# Note: The following procedures are a modified version of their equivalent ones of the Tk menubutton widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## ButtonPress
#
# Manage the **ButtonPress-1** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::menubutton::ButtonPress { w } {
    # Check the widget state.
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
            # Check if there is a menu associated with the widget.
            switch -- $::ms::current($w,menu) {
                ""  { return "" }
            }

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

            # Change the widget dynamic state to 'pressed'.
            interp invokehidden {} $w state [list pressed]

            # Post the menu.
            ::tk_popup $menu {*}[::ms::menubutton::Post_Position $w]
        }
    }

    return ""
}

# Find_Menu_Index
#
# Hack to support **tk_optionMenus**.
#
# Where:
#
# w   Should be the menubutton real address involved.
#
# Returns the index of the menu entry with a matching '-label', or an empty string if not found.
proc ::ms::menubutton::Find_Menu_Index { w } {
    set last_available_index [interp invokehidden {} $::ms::current($w,menu) index last]
    if { $last_available_index < 0 } {
        return ""
    }

    set index 0
    while { $index <= $last_available_index } {
        if { ![catch { interp invokehidden {} $::ms::current($w,menu) entrycget $index -label } label] && ($label eq $::ms::current($w,text)) } {
            return $index
        }

        incr index
    }

    return ""
}

## Return
#
# Post the popdown window when the **Arrow Down**, **Return**, **KP_Return** or **space** key is pressed.
#
# Where:
#
# w   Should be the menubutton real address involved.
#
# It doesn't return anything.
proc ::ms::menubutton::Return { w } {
    # Check if the popdown should not be displayed.
    if { $::ms::current($w,state) eq "disabled" } {
        return ""
    }

    # Check if there is a menu associated with the widget.
    switch -- $::ms::current($w,menu) {
        ""  { return "" }
    }

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

    # Change the widget dynamic state to 'pressed'.
    interp invokehidden {} $w state [list pressed]

    # Post the menu.
    ::tk_popup $menu {*}[::ms::menubutton::Post_Position $w]

    return ""
}

# Post_Position
#
# Computes the (x,y) coordinates of the menu that needs to be posted.
#
# If the index computed is not an empty string the menu should be posted so that the
# upper left corner of the indexed menu item is located at the point (x,y).
# Otherwise the top left corner of the menu itself should be located at that point.
#
# TODO: Adjust menu width to be at least as wide as the button for -direction above, below.
#
# Where:
#
# w   Should be the menubutton real address involved.
#
# Returns a list formed by three elements (in order):
#   - the 'x' root coordinate of the menu that needs to be posted.
#   - the 'y' root coordinate of the menu that needs to be posted.
#   - An item index of the menu that needs to be posted (or an empty string if there is no such thing).
proc ::ms::menubutton::Post_Position { w } {
    # Check the windowing system.
    switch -- [_tk windowingsystem] {
        aqua {
            # MacOS
            set menuPad   5
            set buttonPad 1
            set flushPad  4

            set menubutton_reqheight [_winfo reqheight $::ms::current($w,menu)]
            set menubutton_reqwidth  [_winfo reqwidth  $::ms::current($w,menu)]

            set menu_width  [_winfo width $w]
            set menu_height [expr { [_winfo height $w]+$buttonPad }]

            # Get the entry index, if any.
            set entry [::ms::menubutton::Find_Menu_Index $w]
            switch -- $entry {
                ""  { set entry 0 }
            }

            # Get the (x,y) root coordinates of the widget.
            set x [_winfo rootx $w]
            set y [_winfo rooty $w]

            # Check the direction provided for the widget menu.
            switch -- $::ms::current($w,direction) {
                above {
                    set menuPad [expr { 2*$menuPad }]
                    incr y [expr { -menubutton_reqheight+$menuPad }]

                    set entry ""
                }
                below {
                    incr y $menu_height

                    set entry ""
                }
                left {
                    incr y  $menuPad
                    incr x -$menubutton_reqwidth
                }
                right {
                    incr y $menuPad
                    incr x $menu_width
                }
                default {
                    # Flush

                    incr y  $flushPad
                    incr x -$flushPad
                }
            }
        }
        default {
            set menu_reqheight [expr { [_winfo reqheight $::ms::current($w,menu)] }]
            set menu_reqwidth  [expr { [_winfo reqwidth  $::ms::current($w,menu)] }]

            set menubutton_height [expr { [_winfo height $w] }]
            set menubutton_width  [expr { [_winfo width  $w] }]

            # Check if the windowing system is Windows.
            switch -- [_tk windowingsystem] {
                win32 {
                    incr menubutton_height 6
                    incr menubutton_width  16
                }
            }

            # Get the entry index, if any.
            set entry [::ms::menubutton::Find_Menu_Index $w]
            switch -- $entry {
                ""  { set entry 0 }
            }

            # Get the (x,y) root coordinates of the widget.
            set x [_winfo rootx $w]
            set y [_winfo rooty $w]

            # Check the direction provided for the widget menu.
            switch -- $::ms::current($w,direction) {
                above {
                    incr y -$menubutton_height

                    set reqheight [_winfo reqheight $w]
                    set rooty     [_winfo rooty     $w]
                    set vrooty    [_winfo vrooty    $w]

                    # If we go offscreen to the top, show as 'below'.
                    if { $y < $vrooty } {
                        set y [expr { $vrooty+$rooty+$reqheight }]
                    }

                    set entry ""
                }
                below {
                    incr y $menu_reqheight

                    set rooty       [_winfo rooty       $w]
                    set vrooty      [_winfo vrooty      $w]
                    set vrootheight [_winfo vrootheight $w]

                    # If we go offscreen to the bottom, show as 'above'.
                    if { ($y+$menubutton_height) > ($rooty+$vrootheight) } {
                        set y [expr { $vrooty+$rooty-$menubutton_height }]
                    }

                    set entry ""
                }
                left  { incr x -$menubutton_width }
                right { incr x  $menu_reqwidth }
                default {
                    # Flush

                    set width    [_winfo width    $w]
                    set reqwidth [_winfo reqwidth $::ms::current($w,menu)]

                    incr x [expr { ($width-$reqwidth)/2 }]
                }
            }
        }
    }

    return [list $x $y $entry]
}

# Pulldown
#
# This procedure is called when **ButtonPress1** is pressed on a menubutton.
# It posts the menu; a subsequent **ButtonRelease** or **Leave** event will set a grab on the menu.
#
# Note: Only used under X11.
#
# Where:
#
# w   Should be the menubutton real address involved.
#
# It doesn't return anything.
proc ::ms::menubutton::Pulldown { w } {
    # Check if the popdown should not be displayed.
    if { $::ms::current($w,state) eq "disabled" } {
        return ""
    }

    # Check if there is a menu associated with the widget.
    switch -- $::ms::current($w,menu) {
        ""  { return "" }
    }

    # Set some temporary variables.
    set ::ms::temp(pulldown) 1

    # Change the widget dynamic state to 'pressed'.
    interp invokehidden {} $w state [list pressed]

    # Change the cursor of 'w' with the 'menu' one.
    set menu_cursor [interp invokehidden {} $::ms::current($w,menu) cget -cursor]
    interp invokehidden {} $w configure -cursor $menu_cursor

    # Compute the position where to post the menu.
    set values [::ms::menubutton::Post_Position $w]
    set x      [lindex $values 0]
    set y      [lindex $values 1]
    set entry  [lindex $values 2]

    # Check the entry retrieved and post the menu.
    switch -- $entry {
        ""      { interp invokehidden {} $::ms::current($w,menu) post $x $y }
        default { interp invokehidden {} $::ms::current($w,menu) post $x $y $entry }
    }

    # Focus the menu.
    ::tk_menuSetFocus $::ms::current($w,menu)
}

# Transfer_Grab
#
# Switch from pulldown mode (menubutton has an implicit grab) to popdown mode (menu has an explicit grab).
#
# Note: Only used under X11.
#
# Where:
#
# w   Should be the menubutton real address involved.
#
# It doesn't return anything.
proc ::ms::menubutton::Transfer_Grab { w } {
    switch -- [info exists ::ms::temp(pulldown)] {
        1   {
            # Re-establish the original cursor for 'w'.
            interp invokehidden {} $w configure -cursor $::ms::current($w,cursor)

            # Change the widget dynamic state to '!pressed !active'.
            interp invokehidden {} $w state [list !pressed !active]

            # Post the menu.
            ::tk_popup $::ms::current($w,menu) [_winfo rootx $::ms::current($w,menu)] [_winfo rooty $::ms::current($w,menu)]

            # Remove the temporary variables that were created by the 'Pulldown' procedure.
            unset -nocomplain -- ::ms::temp(pulldown)
        }
    }

    return ""
}

#*EOF*