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

## progressbar
#
#### DESCRIPTION:
#
# A progressbar widget shows the status of a long-running operation.
# They can operate in two modes: **determinate** mode shows the amount completed relative to the total amount of work to be done,
# and **indeterminate** mode provides an animated display to let the user know that something is happening.
#
# If the value of **-orient** is **horizontal** a text string can be displayed inside the progressbar.
# This string can be configured using the **-anchor**, **-font**, **-foreground**, **-justify**, **-text**, **-textvariable** and
# **-wraplength** options. If the value of **-orient** is **vertical** then these options are ignored.
#
# Note: At the time this command is invoked, there must not exist a window with the same pathname,
#       but the pathname's parents must exists.
#       *Window* may be provided either as a short or as a real address, the address returned will be:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
# Additional options, described below, may be specified on the command line to configure aspects of the progressbar.
#
#### SYNOPSIS:
#
#   **progressbar**  *window* ?*option* *value*? ... ?*option* *value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-anchor**         Specifies how the information in the widget is positioned relative to the inner margins.
#                     Allowed values:
#                         **n**      --> means 'north'.
#                         **ne**     --> means 'north-east'.
#                         **e**      --> means 'east'.
#                         **se**     --> means 'south-east'.
#                         **s**      --> means 'south'.
#                         **sw**     --> means 'south-west'.
#                         **w**      --> means 'west'.
#                         **nw**     --> means 'north-west'.
#                         **center** --> means 'centered'.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-anchor** specified in its style.
#                                                    If there isn't one, the **-anchor** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-anchor** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also *-justify*.
#
# **-background**     It's a list that specifies the color to use as background.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     -->Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                    If there isn't one, the **-background** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-background** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-foreground** and **-troughcolor**.
#
# **-bordercolor**    It's a list that specifies the color to use as bordercolor.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: It's only meaningful for widget with a **solid** relief.
#
#                     Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                    If there isn't one, the **-bordercolor** of the **TProgressbar** style
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
#                                                    If there isn't one, the **-borderwidth** of the **TProgressbar** style
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
#                     If not provided, defaults to **TProgressbar**.
#
# **-cmenu**          Specifies the contextual menu address that will be assigned to the widget.
#                     If the *cmenu* value is the empty string or invalid, nothing will happen.
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
#                                                    If there isn't one, the **-cursor** of the **TProgressbar** style
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
#                                                    If there isn't one, the **-darkcolor** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-darkcolor** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-lightcolor**.
#
# **-font**           Specifies the font to use for the text displayed by the widget.
#                     The widget will accept as fontname any font created with the **font** command, including any Tk
#                     defaults fonts, the new mustang fonts (**BiggestFont**, **BiggerFont**, **NormalFont**, **SmallerFont**,
#                     **SmallestFont** and **MonospaceFont**) or fonts defined by the developer itself.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-font** specified in its style.
#                                                    If there isn't one, the **-font** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-font** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-anchor**, **-foreground**, **-justify**, **-text**, **-textvariable** and **-wraplength**.
#
# **-foreground**     It's a list that specifies the color to use as foreground.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-foreground** specified in its style.
#                                                    If there isn't one, the **-foreground** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-foreground** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-anchor**, **-background**, **-font**, **-justify**, **-text**, **-textvariable**,
#                     **-troughcolor** and **-wraplength**.
#
# **-justify**        If there are multiple lines of text, specifies how the lines are laid out relative to one another.
#                     Allowed values:
#                         **left**,
#                         **center**,
#                         **right**.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-justify** specified in its style.
#                                                    If there isn't one, the **-justify** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-justify** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-anchor**, **-font**, **-foreground**, **-text**, **-textvariable** and **-wraplength**.
#
# **-length**         Specifies the length of the long dimension of the progressbar in screen units (i.e. any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)).
#                     For vertical progressbars this is the progressbar's height; for horizontal progressbars it is the progressbar's width.
#
#                     If not provided, defaults to **75p**.
#
#                     See also **-maximum**, **-mode** and **-thickness**.
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
#                                                    If there isn't one, the **-lightcolor** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-lightcolor** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-darkcolor**.
#
# **-maximum**        A floating point number specifying the maximum **-value**.
#                     If not provided, defaults to **100.0**.
#
#                     See also **-length**, **-mode**, **phase** and **value**.
#
# **-mode**           Specifies the type of progressbar.
#                     Allowed values are **determinate** and **undeterminate**.
#                     If not provided, defaults to **determinate**.
#
#                     See also **-length**, **maximum**, **phase** and **value**.
#
# **-orient**         Specifies the orientation of the widget (**horizontal** or **vertical**).
#
#                     Note: This option may only be provided while creating the widget.
#                           Attempts to change this value after the widget is created by using the **configure** command,
#                           will be ignored by mustang.
#
#                     If not provided, defaults to **horizontal**.
#
# **-phase**          Read-only option. The widget periodically increments the value of this option whenever the **-value** is greater than 0 and,
#                     in determinate mode, less than **-maximum**.
#                     This option may be used by the current theme to provide additional animation effects.
#
#                     If not provided, defaults to **0**.
#
#                     See also **-maximum**, **-mode** and **-value**.
#
# **-state**          Specifies the state for the widget.
#
#                     Note: Progressbars have only the **normal** state.
#
#                     Note: This option will be ignored if provided while creating the widget.
#                           Attempts to change this value after the widget was created, by using the **configure** command,
#                           will be ignored by mustang.
#                           This option can only be retrieved.
#
#                     It's set to **normal**.
#
# **-style**          Specifies a custom widget style.
#                     If not provided, defaults to **TProgressbar**.
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
#                     If not provided, defaults to **0**.
#
# **-text**           Specifies a list containing the *text string* that will be displayed inside the widget.
#                     The list should contain a *text string* as the first element, followed by any substitution strings
#                     required to form the actual *text string* as separated elements.
#
#                     If a *-textvariable* is not provided as well, the *text string* will be translated automatically
#                     by mustang each time a widget is created and each time the current language changes.
#
#                     In order to do so, mustang requires two things:
#                         1 - The text string should be provided in English (*en*).
#
#                             If presents, each of the substitution strings will substitute a single *%s*,
#                             and their numbers depend on how many *%s* are contained in the text string itself.
#
#                             Note1:  If there is no *%s* in the text string, then there's no need to provide any
#                                     substitution strings.
#
#                             Note2:  Each substitution string will be used verbatim (no translation will be performed on them).
#
#                             Example1: No substitution string (single word)
#
#                                     -text [list "Settings:"]    or just     -text "Settings:"
#
#                             Example2: No substitution string (multiple words)
#
#                                     -text [list "My Settings:"]
#
#                             Example3: One substitution string
#
#                                     -text [list "The %s command is invalid." grid]
#
#                             Example4: Multiple substitution strings
#
#                                     -text [list "The %s command address is invalid: '%s'" grid .myapp]
#
#                             ...
#
#                         2 - A message catalog should be provided with all the translations needed by the application and
#                             each language file present in the catalog, should have its translation defined in the
#                             **::ms** or in the **global** namespace.
#
#                     If these requirements are not both satisfied, mustang will not do any translation.
#
#                     If not provided, defaults to the empty string.
#
#                     See also **-anchor**, **-font**, **-foreground**, **-justify**, **-textvariable** and **-wraplength**.
#
# **-textvariable**   Specifies the name of a global variable whose value will be used in place of the *-text* resource.
#                     The variable should already exist at the time the widget is created or this option will be ignored.
#
#                     If provided, mustang will perform no automatic translations (in any scenario).
#                     If not provided, defaults to the empty string.
#
#                     See also **-anchor**, **-font**, **-foreground**, **-justify**, **-text** and **-wraplength**.
#
# **-thickness**      Specifies the desired short dimension of the progressbar in screen units (i.e. any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)).
#                     For vertical progressbars this is the progressbar's width; for horizontal progressbars it is the progressbar's height.
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
# **-troughcolor**    It's a list that specifies the color to use as troughcolor.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-troughcolor** specified in its style.
#                                                    If there isn't one, the **-troughcolor** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-troughcolor** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-background** and **-foreground**.
#
# **-value**          The current value of the progress bar.
#                     In **determinate** mode, this represents the amount of work completed.
#                     In **indeterminate** mode, it is interpreted modulo **-maximum**; that is, the progress bar completes one 'cycle'
#                     when the **-value** increases by **-maximum**.
#
#                     If **-variable** is set to an existing variable, specifying **-value** has no effect (the variable value takes precedence).
#
#                     If not provided, defaults to **0**.
#
#                     See also **-maximum**, **-mode**, **-phase** and **-variable**.
#
# **-variable**       The name of a global Tcl variable which is linked to the **-value**.
#                     If specified to an existing variable, the **-value** of the progress bar is automatically set to the value of the variable
#                     whenever the latter is modified.
#
#                     If not provided, defaults to the empty string.
#
#                     See also **-value**.
#
# **-wraplength**     Specifies the maximum line length.
#                     The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                     (pixels, points, inches, millimeters or centimeters).
#                     If this option is less than or equal to zero, then automatic wrapping is not performed,
#                     otherwise the text is split into lines such that no line is longer than the specified value.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-wraplength** specified in its style.
#                                                    If there isn't one, the **-wraplength** of the **TProgressbar** style
#                                                    will be used instead.
#                                                    The **-wraplength** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-anchor**, **-font**, **-foreground**, **-justify**, **-length**, **-text* and **-textvariable**.
#
#### WIDGET COMMAND:
#
# The progressbar command creates a new command whose name is the same as the pathname of the progressbar's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the progressbar widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for progressbar widgets:
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the progressbar command (See **WIDGET OPTIONS**).
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
#   *window* **start** ?*interval*?
#     Begin autoincrement mode: schedules a recurring timer event that calls **step** every *interval* milliseconds.
#     If omitted, *interval* defaults to 50 milliseconds (20 steps/second).
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
#   *window* **step** ?*amount*?
#     Increments the **-value** by *amount*.
#     *Amount* defaults to **1.0** if omitted.
#
#   *window* **stop**
#     Stop autoincrement mode: cancels any recurring timer event initiated by **window start**.
#
#   *window* **style**
#     Return the style used by the widget.
#
#### STATES:
#
# The progressbar widget supports only the **normal** state.
#
#### STYLING OPTIONS:
#
# Default style name: **TProgressbar**
#
# Every progressbar styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the progressbars in order to facilitate the developer work and
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
#     scrollbar by one unit up or down (depending on the mousewheel direction). If none of the widget's parents meets the required
#     condition, nothing will happen.
#
# 2.  **Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move
#     that scrollbar by one unit left or right (depending on the mousewheel direction). If none of the widget's parents meets the required
#     condition, nothing will happen.
#
# 3.  **Control-MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar and move
#     that scrollbar by one page up or down (depending on the mousewheel direction). If none of the widget's parents meets the required
#     condition, nothing will happen.
#
# 4.  **Control-Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#     and move that scrollbar by one page left or right (depending on the mousewheel direction). If none of the widget's parents meets
#     the required condition, nothing will happen.
#
# 5.  **TouchpadScroll** events will happen on two different planes, horizontal and vertical.
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
# 6.  **Control-TouchpadScroll** events will happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad direction.
#
#        1 - **Control-TouchpadScroll** events along the X axis will try to find the innermost widget's scrollable parent with an active
#            horizontal scrollbar and move that scrollbar by one page left or right (depending on the direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - **Control-TouchpadScroll** events along the Y axis will try to find the innermost widget's scrollable parent with an active
#            vertical scrollbar and move that scrollbar by one page up or down (depending on the direction of the touchpad event).
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
# The following behavior will happen if the widget has the focus.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the
#     previous focussable widget.
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
#   # Create the determinate progressbar increment procedure.
#   proc ::Increment { w } {
#       set value [expr { [$w cget -value]+5.0 }]
#       if { $value > 100.0 } {
#           return ""
#       } else {
#           $w configure -value $value -text "$value%"
#
#           after 1000 [list ::Increment $w]
#       }
#   }
#
#   # Create an horizontal and a vertical 'undeterminate' progressbar.
#   progressbar .hbar1  -orient horizontal \
#                       -length 1000 \
#                        -value 0 \
#                       -cursor arrow \
#                         -mode indeterminate \
#                      -maximum 100.0;
#
#   progressbar .vbar1  -orient vertical \
#                       -length 200 \
#                        -value 0 \
#                       -cursor arrow \
#                         -mode indeterminate \
#                      -maximum 100.0;
#
#   # Pack them.
#   pack .hbar1 -padx 50 \
#               -pady 50;
#
#   pack .vbar1 -padx 50 \
#               -pady 50;
#
#   # Start the movement of the undeterminate progressbars.
#   .hbar1 start
#   .vbar1 start
#
#   # Create an horizontal and a vertical 'determinate' progressbar.
#   progressbar .hbar2     -orient horizontal \
#                          -length 1000 \
#                           -value 0 \
#                          -cursor arrow \
#                            -mode determinate \
#                         -maximum 100.0 \
#                            -text "" \
#                       -thickness 10m;
#
#   progressbar .vbar2   -orient vertical \
#                        -length 200 \
#                         -value 0 \
#                        -cursor arrow \
#                          -mode determinate \
#                       -maximum 100.0;
#
#   # Pack them.
#   pack .hbar2 -padx 50 \
#               -pady 50;
#
#   pack .vbar2 -padx 50 \
#               -pady 50;
#
#   # Start the movement of the determinate progressbars.
#   after 1000 [list ::Increment .hbar2]
#   after 1000 [list ::Increment .vbar2]
#
#   # After 6 seconds, change the accent color.
#   after 6000 [list set ::ms::accent orange]
#
#   # After 12 seconds, change the colorscheme.
#   switch -- [tk windowingsystem] {
#       aqua {
#           switch -- [wm attributes . -isdark] {
#               0   { after 12000 [list set ::ms::colorscheme dark]  }
#               1   { after 12000 [list set ::ms::colorscheme light] }
#           }
#       }
#       default { after 12000 [list set ::ms::colorscheme dark] }
#   }
package provide ::ms::progressbar 0.1

###################################
##                               ##
##     _PROGRESSBAR BINDINGS     ##
##                               ##
###################################

# Activate/Deactivate
_bind _Progressbar <Activate>   { ::ms::progressbar::Pathname_Cmd %W state !background; break }
_bind _Progressbar <Deactivate> { ::ms::progressbar::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Progressbar <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Progressbar <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Progressbar <Destroy> { ::ms::progressbar::Destroy %W; break }

# Enter/Leave
_bind _Progressbar <Enter> { ::ms::progressbar::Pathname_Cmd %W state  hover; break }
_bind _Progressbar <Leave> { ::ms::progressbar::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Progressbar <FocusIn>  { ::ms::progressbar::FocusIn  %W; break }
_bind _Progressbar <FocusOut> { ::ms::progressbar::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Progressbar <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Progressbar <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Progressbar <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Progressbar <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Progressbar <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Progressbar <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **progressbar** package.
namespace eval ::ms::progressbar {
    # Set the 'non styleable' progressbar option list.
    set ::ms::progressbar(non_styleable,options) [list class \
                                                       cmenu \
                                                       length \
                                                       maximum \
                                                       mode \
                                                       orient \
                                                       phase \
                                                       state \
                                                       style \
                                                       takefocus \
                                                       text \
                                                       textvariable \
                                                       value \
                                                       variable];

    # Set the 'styleable' progressbar option list.
    set ::ms::progressbar(styleable,options) [list anchor \
                                                   background \
                                                   bordercolor \
                                                   borderwidth \
                                                   cursor \
                                                   darkcolor \
                                                   font \
                                                   foreground \
                                                   justify \
                                                   lightcolor \
                                                   thickness \
                                                   troughcolor \
                                                   wraplength];

    # Set the default 'non-styleable' progressbar options values.
    set ::ms::default(progressbar,class)        TProgressbar
    set ::ms::default(progressbar,cmenu)        {}
    set ::ms::default(progressbar,length)       75p
    set ::ms::default(progressbar,maximum)      100.0
    set ::ms::default(progressbar,mode)         determinate
    set ::ms::default(progressbar,orient)       horizontal
    set ::ms::default(progressbar,phase)        0
    set ::ms::default(progressbar,state)        normal
    set ::ms::default(progressbar,style)        TProgressbar
    set ::ms::default(progressbar,takefocus)    1
    set ::ms::default(progressbar,text)         {}
    set ::ms::default(progressbar,textvariable) {}
    set ::ms::default(progressbar,value)        0.0
    set ::ms::default(progressbar,variable)     {}

    # Note: The default 'styleable' progressbar options values are always defined inside the current theme.
}

# Rename the original Tk **ttk::progressbar** command.
rename ttk::progressbar _ttk_progressbar

# Create aliases for the mustang **progressbar** command.
interp alias {} progressbar      {} ::ms::progressbar::Command
interp alias {} ttk::progressbar {} ::ms::progressbar::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::progressbar** widget command.
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
proc ::ms::progressbar::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(progressbar,class)
            set ::ms::default($w,cmenu)        $::ms::default(progressbar,cmenu)
            set ::ms::default($w,length)       $::ms::default(progressbar,length)
            set ::ms::default($w,maximum)      $::ms::default(progressbar,maximum)
            set ::ms::default($w,mode)         $::ms::default(progressbar,mode)
            set ::ms::default($w,orient)       $::ms::default(progressbar,orient)
            set ::ms::default($w,phase)        $::ms::default(progressbar,phase)
            set ::ms::default($w,state)        $::ms::default(progressbar,state)
            set ::ms::default($w,style)        $::ms::default(progressbar,style)
            set ::ms::default($w,takefocus)    $::ms::default(progressbar,takefocus)
            set ::ms::default($w,text)         $::ms::default(progressbar,text)
            set ::ms::default($w,textvariable) $::ms::default(progressbar,textvariable)
            set ::ms::default($w,value)        $::ms::default(progressbar,value)
            set ::ms::default($w,variable)     $::ms::default(progressbar,variable)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(progressbar,class)
            set ::ms::current($w,cmenu)        $::ms::default(progressbar,cmenu)
            set ::ms::current($w,length)       $::ms::default(progressbar,length)
            set ::ms::current($w,maximum)      $::ms::default(progressbar,maximum)
            set ::ms::current($w,mode)         $::ms::default(progressbar,mode)
            set ::ms::current($w,orient)       $::ms::default(progressbar,orient)
            set ::ms::current($w,phase)        $::ms::default(progressbar,phase)
            set ::ms::current($w,state)        $::ms::default(progressbar,state)
            set ::ms::current($w,style)        $::ms::default(progressbar,style)
            set ::ms::current($w,takefocus)    $::ms::default(progressbar,takefocus)
            set ::ms::current($w,text)         $::ms::default(progressbar,text)
            set ::ms::current($w,textvariable) $::ms::default(progressbar,textvariable)
            set ::ms::current($w,value)        $::ms::default(progressbar,value)
            set ::ms::current($w,variable)     $::ms::default(progressbar,variable)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) progressbar

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
            #       To make a progressbar styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **progressbar** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,anchor)      Tk
            set ::ms::managed_by($w,background)  Tk
            set ::ms::managed_by($w,bordercolor) Tk
            set ::ms::managed_by($w,borderwidth) Tk
            set ::ms::managed_by($w,cursor)      Tk
            set ::ms::managed_by($w,darkcolor)   Tk
            set ::ms::managed_by($w,font)        Tk
            set ::ms::managed_by($w,foreground)  Tk
            set ::ms::managed_by($w,justify)     Tk
            set ::ms::managed_by($w,lightcolor)  Tk
            set ::ms::managed_by($w,thickness)   Tk
            set ::ms::managed_by($w,troughcolor) Tk
            set ::ms::managed_by($w,wraplength)  Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -anchor {
                        set value [string tolower $value]
                        switch -- $value {
                            center -
                            e      -
                            n      -
                            ne     -
                            nw     -
                            s      -
                            se     -
                            sw     -
                            w      {
                                set ::ms::current($w,anchor)    $value
                                set ::ms::managed_by($w,anchor) developer
                            }
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
                    -maximum {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,maximum) $value
                                }
                            }
                        }
                    }
                    -mode {
                        set value [string tolower $value]
                        switch -- $value {
                            determinate   -
                            indeterminate { set ::ms::current($w,orient) $value }
                        }
                    }
                    -orient {
                        set value [string tolower $value]
                        switch -- $value {
                            horizontal -
                            vertical   { set ::ms::current($w,orient) $value }
                        }
                    }
                    -phase {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,phase) $value
                                }
                            }
                        }
                    }
                    -state {}
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
                    -text { set ::ms::current($w,text) $value }
                    -textvariable {
                        switch -- [info exists $value] {
                            1   { set ::ms::current($w,textvariable) $value }
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
                    -troughcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,troughcolor)    $value
                        set ::ms::managed_by($w,troughcolor) developer
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
                    -wraplength {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,wraplength)    $value
                        set ::ms::managed_by($w,wraplength) developer
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::progressbar(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TProgressbar,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            # Enable/Disable the widget automatic translation.
            switch -- $::ms::current($w,textvariable) {
                ""  {
                    # Automatic translation: ON
                    set ::ms::data($w,translated_text) [::msgcat::mc {*}$::ms::current($w,text)]
                    set text_variable $::ms::data($w,translated_text)
                }
                default {
                    # Automatic translation: OFF
                    set text_variable [set $::ms::current($w,textvariable)]
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
                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TProgressbar]]
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'anchor', 'borderwidth', 'cursor', 'font', 'justify', 'thickness', 'troughcolor' and 'wraplength' are not allowed
            #       to change if the statespec changes.

            #########################
            ##                     ##
            ##     PROGRESSBAR     ##
            ##                     ##
            #########################

            # Note: 'arrowsize' is only understood by the clam engine while 'thickness' is understood by the other engines.

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                   "_bw=" $::ms::current($w,borderwidth) \
                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                   "_tn=" $::ms::current($w,thickness) \
                                                   "_tc=" $::ms::current($w,troughcolor) \
                                                   "." $parent_style];

            # If needed, create the widget style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)   -arrowsize $::ms::current($w,thickness) \
                                                              -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                             -borderwidth $::ms::current($w,borderwidth) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                               -thickness $::ms::current($w,thickness) \
                                                             -troughcolor $::ms::current($w,troughcolor);

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

            # Create the progressbar widget.
            _ttk_progressbar $w     -anchor $::ms::current($w,anchor) \
                                     -class $::ms::current($w,class) \
                                    -cursor $::ms::current($w,cursor) \
                                      -font $::ms::current($w,font) \
                                -foreground $::ms::current($w,foreground) \
                                   -justify $::ms::current($w,justify) \
                                    -length $::ms::current($w,length) \
                                   -maximum $::ms::current($w,maximum) \
                                      -mode $::ms::current($w,mode) \
                                    -orient $::ms::current($w,orient) \
                                     -phase $::ms::current($w,phase) \
                                     -style $::ms::style($w,widget) \
                                 -takefocus $::ms::current($w,takefocus) \
                                      -text $text_variable \
                                     -value $::ms::current($w,value) \
                                  -variable $::ms::current($w,variable) \
                                -wraplength $::ms::current($w,wraplength);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TProgressbar { _bindtags $w [list $w _Progressbar TProgressbar $::ms::addr($w,toplevel) all] }
                default      { _bindtags $w [list $w $::ms::current($w,class) _Progressbar TProgressbar $::ms::addr($w,toplevel) all] }
            }

            # Add the progressbar to the related toplevel keyboard pages navigation bindings.
            ::ms::Enable_Traversal $w

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::progressbar::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::progressbar::Pathname_Cmd $w]
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

            # Add the widget address to the progressbar widgets real address list.
            lappend ::ms::addr(progressbar) $w

            # Add the widget address to the progressbar classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),progressbar,addrs) $w

            # Add the widget address to the progressbar classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),progressbar,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the progressbar classtype.
            if { $::ms::current($w,style) ni $::ms::style(progressbar,classtype) } {
                lappend ::ms::style(progressbar,classtype) $::ms::current($w,style)
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
proc ::ms::progressbar::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::progressbar(non_styleable,options)) || ($option in $::ms::progressbar(styleable,options)) } {
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
                    foreach option $::ms::progressbar(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::progressbar(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::progressbar(non_styleable,options)) || ($option in $::ms::progressbar(styleable,options)) } {
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
                                    -anchor {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            center -
                                            e      -
                                            n      -
                                            ne     -
                                            nw     -
                                            s      -
                                            se     -
                                            sw     -
                                            w      {
                                                set ::ms::current($w,anchor)    $value
                                                set ::ms::managed_by($w,anchor) developer
                                            }
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
                                    -length {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,length) $value
                                    }
                                    -maximum {
                                        switch -- [string is double -strict $value] {
                                            0   { continue }
                                            1   {
                                                if { $value > 0 } {
                                                    set ::ms::current($w,maximum) $value
                                                }
                                            }
                                        }
                                    }
                                    -mode {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            determinate   -
                                            indeterminate { set ::ms::current($w,orient) $value }
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
                                    -orient {}
                                    -phase {
                                        switch -- [string is integer -strict $value] {
                                            0   { continue }
                                            1   {
                                                if { $value > 0 } {
                                                    set ::ms::current($w,phase) $value
                                                }
                                            }
                                        }
                                    }
                                    -state {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            disabled -
                                            normal   { set ::ms::current($w,state) $value }
                                        }
                                    }
                                    -style  {
                                        if { $value ni $::ms::style($::ms::theme) } {
                                            continue
                                        }

                                        # Remove the widget address from the progressbar classtype real address list that contains all the
                                        # widgets addresses with style '::ms::current($w,style)'.
                                        set index [lsearch -exact $::ms::style($::ms::current($w,style),progressbar,addrs) $w]
                                        switch -- $index {
                                            -1      {}
                                            default { set ::ms::style($::ms::current($w,style),progressbar,addrs) [lremove $::ms::style($::ms::current($w,style),progressbar,addrs) $index] }
                                        }

                                        # Add the widget address to the address list that contains all the
                                        # widgets addresses with style 'value'.
                                        lappend ::ms::style($value,progressbar,addrs) $w

                                        # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                        # for the progressbar classtype.
                                        switch -- [llength $::ms::style($::ms::current($w,style),progressbar,addrs)] {
                                            0   {
                                                set index [lsearch -exact $::ms::style(progressbar,classtype) $::ms::current($w,style)]
                                                switch -- $index {
                                                    -1      {}
                                                    default { set ::ms::style(progressbar,classtype) [lremove $::ms::style(progressbar,classtype) $index] }
                                                }
                                            }
                                        }

                                        # If needed, add 'value' to the available styles for the progressbar classtype.
                                        if { $value ni $::ms::style(progressbar,classtype) } {
                                            lappend ::ms::style(progressbar,classtype) $value
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
                                    -text { set ::ms::current($w,text) $value }
                                    -textvariable {
                                        switch -- [info exists $value] {
                                            1   { set ::ms::current($w,textvariable) $value }
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
                                    -troughcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,troughcolor)    $value
                                        set ::ms::managed_by($w,troughcolor) developer
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
                                    -wraplength {
                                        switch -- [string is integer -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,wraplength)    $value
                                        set ::ms::managed_by($w,wraplength) developer
                                    }
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TProgressbar,$option)

                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
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
                                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TProgressbar]]
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'anchor', 'borderwidth', 'cursor', 'font', 'justify', 'thickness', 'troughcolor' and 'wraplength' are not allowed
                            #       to change if the statespec changes.

                            #########################
                            ##                     ##
                            ##     PROGRESSBAR     ##
                            ##                     ##
                            #########################

                            # Note: 'arrowsize' is only understood by the clam engine while 'thickness' is understood by the other engines.

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                                   "_bw=" $::ms::current($w,borderwidth) \
                                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                                   "_tn=" $::ms::current($w,thickness) \
                                                                   "_tc=" $::ms::current($w,troughcolor) \
                                                                   "." $parent_style];

                            # If needed, create the widget style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)   -arrowsize $::ms::current($w,thickness) \
                                                                              -background $::ms::current($w,background) \
                                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                                             -borderwidth $::ms::current($w,borderwidth) \
                                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                                               -thickness $::ms::current($w,thickness) \
                                                                             -troughcolor $::ms::current($w,troughcolor);

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

                            # If not specified in the command line the foreground should follow it's mapping style, if any.
                            switch -- $::ms::managed_by($w,foreground) {
                                developer { set foreground $::ms::current($w,foreground) }
                                Tk        { set foreground [_ttk_style lookup $::ms::current($w,style) -foreground [interp invokehidden {} $w state] $::ms::default($w,foreground)] }
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure     -anchor $::ms::current($w,anchor) \
                                                                    -cursor $::ms::current($w,cursor) \
                                                                      -font $::ms::current($w,font) \
                                                                -foreground $foreground \
                                                                   -justify $::ms::current($w,justify) \
                                                                    -length $::ms::current($w,length) \
                                                                   -maximum $::ms::current($w,maximum) \
                                                                      -mode $::ms::current($w,mode) \
                                                                     -phase $::ms::current($w,phase) \
                                                                     -style $::ms::style($w,widget) \
                                                                 -takefocus $::ms::current($w,takefocus) \
                                                                      -text $text_variable \
                                                                     -value $::ms::current($w,value) \
                                                                  -variable $::ms::current($w,variable) \
                                                                -wraplength $::ms::current($w,wraplength);

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

                    # Execute the command.
                    try {
                        interp invokehidden {} $w identify element $x $y
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -- $result {
                            trough  { return "Progressbar.trough" }
                            default { return "Progressbar.pbar" }
                        }
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
        start -
        step  {
            # Synopsis:
            #
            # *window* **start** ?*interval*?
            # *window* **step** ?*amount*?
            switch -- [llength $args] {
                0   -
                1   {
                    # Execute the command.
                    try {
                        interp invokehidden {} $w $cmd {*}$args
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
        stop {
            # Synopsis:
            #
            # *window* **stop**
            switch -- [llength $args] {
                0   {
                    # Execute the command.
                    interp invokehidden {} $w stop

                    return ""
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
# Update any progressbar widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::progressbar::Style_Update { stylename caller_info } {
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

    # Update all the progressbar widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,progressbar,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::progressbar(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TProgressbar,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        #######################################
        ##                                   ##
        ##     UPDATE THE WIDGET'S STYLE     ##
        ##                                   ##
        #######################################

        # Note: 'anchor', 'borderwidth', 'cursor', 'font', 'justify', 'thickness', 'troughcolor' and 'wraplength' are not allowed
        #       to change if the statespec changes.

        #########################
        ##                     ##
        ##     PROGRESSBAR     ##
        ##                     ##
        #########################

        # Note: 'arrowsize' is only understood by the clam engine while 'thickness' is understood by the other engines.

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                               "_bc=" $::ms::current($w,bordercolor) \
                                               "_bw=" $::ms::current($w,borderwidth) \
                                               "_dc=" $::ms::current($w,darkcolor) \
                                               "_lc=" $::ms::current($w,lightcolor) \
                                               "_tn=" $::ms::current($w,thickness) \
                                               "_tc=" $::ms::current($w,troughcolor) \
                                               "." $parent_style($::ms::current($w,orient))];

        # If needed, create the widget style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)   -arrowsize $::ms::current($w,thickness) \
                                                          -background $::ms::current($w,background) \
                                                         -bordercolor $::ms::current($w,bordercolor) \
                                                         -borderwidth $::ms::current($w,borderwidth) \
                                                           -darkcolor $::ms::current($w,darkcolor) \
                                                          -lightcolor $::ms::current($w,lightcolor) \
                                                           -thickness $::ms::current($w,thickness) \
                                                         -troughcolor $::ms::current($w,troughcolor);

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

        # If needed, create the widget mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,widget) {*}$mapping

            # Add the widget mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # If not specified in the command line the foreground should follow it's mapping style, if any.
        switch -- $::ms::managed_by($w,foreground) {
            developer { set foreground $::ms::current($w,foreground) }
            Tk        { set foreground [_ttk_style lookup $stylename -foreground [interp invokehidden {} $w state] $::ms::default($w,foreground)] }
        }

        # Apply the changes.
        interp invokehidden {} $w configure     -anchor $::ms::current($w,anchor) \
                                                -cursor $::ms::current($w,cursor) \
                                            -foreground $foreground \
                                               -justify $::ms::current($w,justify) \
                                                 -style $::ms::style($w,widget) \
                                            -wraplength $::ms::current($w,wraplength);
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

## Destroy
#
# Manage the **Destroy** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::progressbar::Destroy { w } {
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

    # Remove the widget address from the progressbar widgets real address list.
    set index [lsearch -exact $::ms::addr(progressbar) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(progressbar) [lremove $::ms::addr(progressbar) $index] }
    }

    # Remove the widget address from the progressbar classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),progressbar,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),progressbar,addrs) [lremove $::ms::class($::ms::current($w,class),progressbar,addrs) $index] }
    }

    # Remove the widget address from the progressbar classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),progressbar,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),progressbar,addrs) [lremove $::ms::style($::ms::current($w,style),progressbar,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the progressbar classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),progressbar,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(progressbar,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(progressbar,classtype) [lremove $::ms::style(progressbar,classtype) $index] }
            }
        }
    }

    # Destroy the bindings for the widget real address in its related toplevel.
    ::ms::Clean_Up $w

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,anchor) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,justify) \
                         ::ms::current($w,length) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,maximum) \
                         ::ms::current($w,mode) \
                         ::ms::current($w,orient) \
                         ::ms::current($w,phase) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,text) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,thickness) \
                         ::ms::current($w,troughcolor) \
                         ::ms::current($w,value) \
                         ::ms::current($w,variable) \
                         ::ms::current($w,wraplength);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token) \
                         ::ms::data($w,translated_text);

    unset -nocomplain -- ::ms::default($w,anchor) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,justify) \
                         ::ms::default($w,length) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,maximum) \
                         ::ms::default($w,mode) \
                         ::ms::default($w,orient) \
                         ::ms::default($w,phase) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,text) \
                         ::ms::default($w,textvariable) \
                         ::ms::default($w,thickness) \
                         ::ms::default($w,troughcolor) \
                         ::ms::default($w,value) \
                         ::ms::default($w,variable) \
                         ::ms::default($w,wraplength);

    unset -nocomplain -- ::ms::managed_by($w,anchor) \
                         ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,justify) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,thickness) \
                         ::ms::managed_by($w,troughcolor) \
                         ::ms::managed_by($w,wraplength);

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
proc ::ms::progressbar::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::progressbar::Pathname_Cmd $w state focus

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
proc ::ms::progressbar::FocusOut { w } {
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
    ::ms::progressbar::Pathname_Cmd $w state !focus

    return ""
}

#*EOF*