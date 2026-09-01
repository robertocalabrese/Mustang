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

## checkbutton
#
#### DESCRIPTION:
#
# Checkbutton widgets are used to show or change a setting.
# It has two states, selected and deselected.
# Checkbuttons are linked to a Tcl variable, and have an associated off and on value; when a checkbutton is clicked,
# it sets the variable to its associated value (if the state is selected sets the variable to the **onvalue**,
# otherwise to the **offvalue**).
#
# The checkbutton command creates a new window (given by the *window* argument) and makes it into a checkbutton widget.
# Additional options, described below, may be specified on the command line to configure aspects of the checkbutton.
# The checkbutton command returns the pathname of the new window.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname,
#         but the pathname's parents must exists.
#         *Window* may be provided either as a short or as a real address, the address returned will be:
#            - A short address, if the *window* provided as input is a short address.
#            - A real address, if the *window* provided as input is a real address.
#
# Note 2: The mustang checkbutton widget is a megawidget composed by an hull object (the megawidget container), a checkbutton
#         object used for the indicator image, a label object and an highlight object.
#
# Additional options, described below, may be specified on the command line to configure aspects of the checkbutton.
#
#### SYNOPSIS:
#
#   **checkbutton**  *window* ?*option* *value*? ... ?*option* *value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-background**            It's a list that specifies the color to use as background structure.
#                            This color will be used in the interspaces between the mustang objects that compose the widget and
#                            should reflects the widget's parent background.
#                            See the **COLOR OPTION** section to know how this list should be composed.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                           If there isn't one, the **-background** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-background** will not abide by its mapping values, if any.
#                                                           It is not supposed to change when the widget state changes.
#
#                            See also **-foreground**.
#
# **-charwidth**             If greater than zero, specifies how much space, in character widths, to allocate for the widget's label.
#                            If less than zero, specifies a minimum width.
#                            If zero or unspecified, the natural width of the text checkbutton is used.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-charwidth** specified in its style.
#                                                           If there isn't one, the **-charwidth** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-charwidth** will not abide by its mapping values, if any.
#                                                           It is not supposed to change when the widget state changes.
#
# **-class**                 Specifies a class for the widget.
#                            It is mainly used to make bindings for widgets that have the same class.
#
#                            Note: This option may only be provided while creating the widget.
#                                  Attempts to change this value after the widget is created by using the **configure** command,
#                                  will be ignored by mustang.
#
#                            If not provided, defaults to **TCheckbutton**.
#
# **-cmenu**                 Specifies the contextual menu address that will be assigned to the widget.
#
#                            The contextual menu will be assign to the *checkbutton* and *label* objects of the megawidget.
#                            If the *cmenu* value is the empty string or invalid, the contextual menu of the widget's toplevel (if any)
#                            will be used instead. If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                            The *hull* and *highlight* objects will rather use the contextual menu of the widget's toplevel, if any.
#                            If the developer needs a different contextual menu for the these objects, a variable called
#                            '::ms::data($short_addr,cmenu,shell)' can be set with a valid contextual menu address in order to be used
#                            instead of the toplevel one.
#
#                            Note: '$short_addr' must be the short address of the text widget.
#                                  See the [tk](/wiki/commands/tk.md) command to know more about short and real address.
#
#                            If '::ms::data($short_addr,cmenu,shell)' is set with an empty string or with an invalid contextual menu address,
#                            it will be ignored and the contextual menu of the widget's toplevel (if any) will be used.
#                            If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                            If not provided, defaults to the empty string.
#
# **-command**               Specifies a Tcl script (or procedure) to evaluate whenever the widget is invoked.
#                            An empty string means 'no Tcl script or procedure will be evaluated when the widget is invoked'.
#
#                            Note: The Tcl script (or procedure) will be executed at top-level (only global variables will be visible).
#
#                            If not provided, defaults to the empty string.
#
# **-cursor**                Specifies the mouse cursor to be used for the widget.
#                            If an empty string is specified, it indicates that the widget should defer to it's parent for
#                            cursor specification.
#
#                            See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                            Note: If the widget state is disabled, the cursor shape upon the indicator and its label will always be the 'arrow'.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                           If there isn't one, the **-cursor** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-cursor** will not abide by its mapping values, if any.
#                                                           It is not supposed to change when the widget state changes.
#
# **-font**                  Specifies the font to use for the widget's label.
#                            The widget will accept as fontname any font created with the **font** command, including any Tk
#                            defaults fonts, the new mustang fonts (**BiggestFont**, **BiggerFont**, **NormalFont**, **SmallerFont**,
#                            **SmallestFont** and **MonospaceFont**) or fonts defined by the developer itself.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-font** specified in its style.
#                                                           If there isn't one, the **-font** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-font** will not abide by its mapping values, if any.
#                                                           It is not supposed to change when the widget state changes.
#
#                            See also **-foreground**.
#
# **-foreground**            It's a list that specifies the color to use as foreground of the widget's label.
#                            See the **COLOR OPTION** section to know how this list should be composed.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-foreground** specified in its style.
#                                                           If there isn't one, the **-foreground** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-foreground** will always abide by its mapping values, if any.
#                                                           Styles, mappings and states events are allowed to change its value.
#
#                            See also **-background** and **-font**.
#
# **-highlightcolor**        It's a list that specifies the color to use as highlightcolor.
#                            See the **COLOR OPTION** section to know how this list should be composed.
#
#                            Note: It's only meaningful for widget that have a **solid** relief.
#
#                            Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-highlightcolor** specified in its style.
#                                                           If there isn't one, the **-highlightcolor** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-highlightcolor** will always abide by its mapping values, if any.
#                                                           Styles, mappings and states events are allowed to change its value.
#
# **-image**                 Specifies an image to display. This is a list of one or more elements.
#                            The first element is the default image name. The rest of the list is a sequence of statespec/value pairs as per
#                            style map, specifying different images to use when the widget is in a particular state or combination of states.
#
#                            Note that all images in the list should have the same size.
#
#                            If an empty string is specified, it indicates that the widget has no image to display.
#                            The image specified should have been already created at the time the widget is created.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-image** specified in its style.
#                                                           If there isn't one, the **-image** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-image** will not abide by its mapping values, if any.
#                                                           Its mapping values must be specified as stated above, even in styles.
#
# **-indicatorbackground**   It's a list that specifies the color to use as the indicatorbackground.
#                            See the **COLOR OPTION** section to know how this list should be composed.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-indicatorbackground** specified in its style.
#                                                           If there isn't one, the **-indicatorbackground** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-indicatorbackground** will always abide by its mapping values, if any.
#                                                           Styles, mappings and states events are allowed to change its value.
#
#                            See also **-indicatorforeground** and **-indicatorrelief**.
#
# **-indicatorforeground**   It's a list that specifies the color to use as the indicatorforeground.
#                            See the **COLOR OPTION** section to know how this list should be composed.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-indicatorforeground** specified in its style.
#                                                           If there isn't one, the **-indicatorforeground** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-indicatorforeground** will always abide by its mapping values, if any.
#                                                           Styles, mappings and states events are allowed to change its value.
#
#                            See also **-indicatorbackground** and **-indicatorrelief**.
#
# **-indicatorrelief**       Specifies the three-dimensional effect desired for the indicator.
#                            The value indicates how the widget's interior should appear relative to its exterior.
#                            For example, *raised* means the widget's interior should appear to protrude from the screen,
#                            relative to the exterior of the widget.
#
#                            The widget will accept as relief any of the following values:
#                               **flat**,
#                               **groove**,
#                               **raised**,
#                               **ridge**,
#                               **solid**,
#                               **sunken**.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-indicatorrelief** specified in its style.
#                                                           If there isn't one, the **-indicatorrelief** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The '*-indicatorrelief*' will not abide by its mapping values, if any.
#                                                           It is not supposed to change when the widget state changes.
#
#                            See also **-indicatorbackground** and **-indicatorforeground**.
#
# **-justify**               If there are multiple lines of text, specifies how the lines are laid out relative to one another.
#                            Allowed values:
#                                **left**,
#                                **center**,
#                                **right**.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-justify** specified in its style.
#                                                           If there isn't one, the **-justify** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-justify** will not abide by its mapping values, if any.
#                                                           It is not supposed to change when the widget state changes.
#
#                            See also **-anchor**.
#
# **-offvalue**              The value to store in the associated **-variable** when the widget is deselected.
#                            If not provided, defaults to **0**.
#
#                            See also **-onvalue** and **-variable**.
#
# **-onvalue**               The value to store in the associated **-variable** when the widget is selected.
#                            If not provided, defaults to **1**.
#
#                            See also **-offvalue** and **-variable**.
#
# **-padding**               Specifies the internal padding for the widget.
#                            The padding is a list of up to four length specifications.
#                            The values must be in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                            (pixels, points, inches, millimeters or centimeters).
#
#                            A list of four values specifies the left, top, right and bottom padding.
#                            A list of three values specifies the left, vertical, and right padding.
#                            A list of two values specifies the horizontal and the vertical padding
#                            A single value specifies the same padding all the way around the widget.
#
#                            When computing how large a window it needs, the widget will add this amount to the width it would
#                            normally need (as determined by the width of the things displayed in the widget).
#                            If the geometry manager can satisfy this request, the widget will end up with extra internal space
#                            to the left and/or right of what it displays inside.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-padding** specified in its style.
#                                                           If there isn't one, the **-padding** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-padding** will not abide by its mapping values, if any.
#                                                           It is not supposed to change when the widget state changes.
#
# **-spacer**                Specifies the distance between the indicator and its label.
#                            The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                            (pixels, points, inches, millimeters or centimeters).
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-spacer** specified in its style.
#                                                           If there isn't one, the **-spacer** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-spacer** will always abide by its mapping values, if any.
#                                                           Styles, mappings and states events are allowed to change its value.
#
# **-state**                 Specifies the state for the widget.
#                            May be set to **normal** or **disabled** to control the disabled state bit.
#                            This is a write-only option: setting it changes the widget state,
#                            but the state widget command does not affect the *-state* option.
#
#                            If not provided, defaults to **normal**.
#
# **-style**                 Specifies a custom widget style.
#                            If not provided, defaults to **TCheckbutton**.
#
#                            The *style* provided should already exists at the time the widget is created.
#
#                            See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**             Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                            and **Shift-Tab**).
#
#                            Before setting the focus to a widget, the traversal scripts consult the value of the
#                            *-takefocus* option.
#                               **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                               **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                         and all of its ancestors are mapped.
#
#                            Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                            Note: It is not possible to set a takefocus of **1** to widgets in the disabled state.
#
#                            If not provided, defaults to **0**.
#
# **-text**                  Specifies a list containing the *text string* that will be displayed inside the widget's label.
#                            The list should contain a *text string* as the first element, followed by any substitution strings
#                            required to form the actual *text string* as separated elements.
#
#                            If a *-textvariable* is not provided as well, the *text string* will be translated automatically
#                            by mustang each time a widget is created and each time the current language changes.
#
#                            In order to do so, mustang requires two things:
#                                1 - The text string should be provided in English (*en*).
#
#                                    If presents, each of the substitution strings will substitute a single *%s*,
#                                    and their numbers depend on how many *%s* are contained in the text string itself.
#
#                                    Note1:  If there is no *%s* in the text string, then there's no need to provide any
#                                            substitution strings.
#
#                                    Note2:  Each substitution string will be used verbatim (no translation will be performed on them).
#
#                                    Example1: No substitution string (single word)
#
#                                            -text [list "Settings:"]    or just     -text "Settings:"
#
#                                    Example2: No substitution string (multiple words)
#
#                                            -text [list "My Settings:"]
#
#                                    Example3: One substitution string
#
#                                            -text [list "The %s command is invalid." grid]
#
#                                    Example4: Multiple substitution strings
#
#                                            -text [list "The %s command address is invalid: '%s'" grid .myapp]
#
#                                    ...
#
#                                2 - A message catalog should be provided with all the translations needed by the application and
#                                    each language file present in the catalog, should have its translation defined in the
#                                    **::ms** or in the **global** namespace.
#
#                            If these requirements are not both satisfied, mustang will not do any translation.
#
#                            If not provided, defaults to the empty string.
#
#                            See also **-image** and **-textvariable**.
#
# **-textvariable**          Specifies the name of a global variable whose value will be used in place of the *-text* resource.
#                            The variable should already exist at the time the widget is created or this option will be ignored.
#
#                            If provided, mustang will perform no automatic translations (in any scenario).
#                            If not provided, defaults to the empty string.
#
#                            See also **-image** and **-text**.
#
# **-underline**             If set, specifies the index of a character to underline in the widget's label.
#                            The underlined character is used for mnemonic activation.
#
#                            If not provided, defaults to **-1** (meaning no underline or mnemonic activation will be performed).
#
# **-variable**              The name of a Tcl variable (with absolute path) which is linked to the **-offvalue** and the **-onvalue**.
#                            The variable should already exist at the time the widget is created or this option will be ignored.
#
#                            If not provided, defaults to the widget address.
#
#                            See also **-offvalue** and **-onvalue**.
#
# **-wraplength**            Specifies the maximum line length of the widget's label.
#                            The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                            (pixels, points, inches, millimeters or centimeters).
#                            If this option is less than or equal to zero then automatic wrapping is not performed, otherwise
#                            the text is split into lines such that no line is longer than the specified value.
#
#                            Note: This is a styleable option.
#
#                                  If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                           Only the developer can.
#
#                                  If it's not provided --> The widget will follow the **-wraplength** specified in its style.
#                                                           If there isn't one, the **-wraplength** of the **TCheckbutton** style
#                                                           will be used instead.
#                                                           The **-wraplength** will always abide by its mapping values, if any.
#                                                           Styles, mappings and states events are allowed to change its value.
#
#### WIDGET COMMAND:
#
# The checkbutton command creates a new command whose name is the same as the pathname of the checkbutton's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the checkbutton widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for checkbutton widgets:
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the checkbutton command (See **WIDGET OPTIONS**).
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
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if the mouse pointer does not
#     lie within any element.
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
#   *window* **invoke**
#     Toggles between the selected and deselected states and evaluates the associated **-command**.
#     If the widget is currently selected, sets the **-variable** to the **-offvalue** and deselects the widget; otherwise,
#     sets the **-variable** to the **-onvalue**.
#
#     Returns the result of the **-command**.
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
# The checkbutton widget supports the **disabled** and **normal** state.
# The widget does not respond to user input if the disabled state is set.
# The widget sets the selected state whenever the linked **-variable** is set to the widget's **-onvalue**, and clears it when
# it's setted to the **-offvalue**.
#
#### STYLING OPTIONS:
#
# Default style name: **TCheckbutton**
#
# Every checkbutton styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the checkbuttons in order to facilitate the developer work and augment the
# user experience at the same time.
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
#       Mustang will iterate all widget's parents in search of one that is scrollable and has the proper scrollbar active for
#       the relative key combination examined. If mustang finds a suitable parent, it will scroll that widget scrollbar,
#       otherwise nothing will happen.
#
# Note: In Linux, **TouchpadScroll** events abide by the same rules of the **MouseWheel** for the X axis and the **Shift-MouseWheel**
#       for the Y axis, while **Control-TouchpadScroll** events abide by the same rules of the **Control-MouseWheel** for the X axis
#       and the **Control-Shift-MouseWheel** for the Y axis.
#
# 1.  **MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar and move
#     that scrollbar by one unit up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 2.  **Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#     and move that scrollbar by one unit left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 3.  **Control-MouseWheel** events will try to find the innermost widget's scrollable parent with an active vertical scrollbar
#     and move that scrollbar by one page up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 4.  **Control-Shift-MouseWheel** events will try to find the innermost widget's scrollable parent with an active horizontal
#     scrollbar and move that scrollbar by one page left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
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
# with an active vertical or horizontal scrollbar and scroll that scrollbar.
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
# 1.  **ButtonPress-1**, **Return** and **space** will select the checkbutton and invoke the associated command.
#
# 2.  The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the previous
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
#   # Create 3 checkbuttons each one with its own variable.
#   set ::MyVar1 0
#   set ::MyVar2 0
#   set ::MyVar3 0
#
#   checkbutton .check1   -command { chan puts ".check1 was invoked, result --> $::MyVar1" } \
#                        -offvalue 0 \
#                         -onvalue 1 \
#                           -state normal \
#                           -style TCheckbutton \
#                       -takefocus 1 \
#                            -text "Checkbutton 1" \
#                       -underline -1 \
#                        -variable ::MyVar1;
#
#   checkbutton .check2   -command { chan puts ".check2 was invoked, result --> $::MyVar2" } \
#                        -offvalue 0 \
#                         -onvalue 1 \
#                           -state normal \
#                           -style TCheckbutton \
#                       -takefocus 1 \
#                            -text "Checkbutton 2" \
#                       -underline -1 \
#                        -variable ::MyVar2;
#
#   checkbutton .check3   -command { chan puts ".check3 was invoked, result --> $::MyVar3" } \
#                        -offvalue 0 \
#                         -onvalue 1 \
#                           -state normal \
#                           -style TCheckbutton \
#                       -takefocus 1 \
#                            -text "Checkbutton 3" \
#                       -underline -1 \
#                        -variable ::MyVar3;
#
#   pack .check1 -anchor nw \
#                -expand false \
#                  -fill none \
#                  -padx [list 15 15] \
#                  -pady [list 15 15] \
#                  -side top;
#
#   pack .check2 -anchor nw \
#                -expand false \
#                  -fill none \
#                  -padx [list 15 15] \
#                  -pady [list 15 15] \
#                  -side top;
#
#   pack .check3 -anchor nw \
#                -expand false \
#                  -fill none \
#                  -padx [list 15 15] \
#                  -pady [list 15 15] \
#                  -side top;
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
package provide ::ms::checkbutton 0.1

###################################
##                               ##
##     _CHECKBUTTON BINDINGS     ##
##                               ##
###################################

# Activate/Deactivate
_bind _Checkbutton <Activate>   { ::ms::radiobutton::Pathname_Cmd %W state !background; break }
_bind _Checkbutton <Deactivate> { ::ms::radiobutton::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Checkbutton <ButtonPress-1> { ::ms::checkbutton::ButtonPress %W; break }

# Contextual menu
_bind _Checkbutton <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Checkbutton <Destroy> { ::ms::radiobutton::Destroy %W; break }

# Enter/Leave
_bind _Checkbutton <Enter> { ::ms::radiobutton::Hover %W %X %Y; break }
_bind _Checkbutton <Leave> { ::ms::radiobutton::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Checkbutton <FocusIn>  { ::ms::checkbutton::Pathname_Cmd %W state focus; break }
_bind _Checkbutton <FocusOut> { ::ms::radiobutton::FocusOut     %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Checkbutton <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Checkbutton <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **checkbutton** package.
namespace eval ::ms::checkbutton {
    # Set the 'non styleable' checkbutton option list.
    set ::ms::checkbutton(non_styleable,options) [list class \
                                                       cmenu \
                                                       command \
                                                       offvalue \
                                                       onvalue \
                                                       state \
                                                       style \
                                                       takefocus \
                                                       text \
                                                       textvariable \
                                                       underline \
                                                       variable];

    # Set the 'styleable' checkbutton option list.
    set ::ms::checkbutton(styleable,options) [list background \
                                                   charwidth \
                                                   cursor \
                                                   font \
                                                   foreground \
                                                   highlightcolor \
                                                   image \
                                                   indicatorbackground \
                                                   indicatorforeground \
                                                   indicatorrelief \
                                                   justify \
                                                   padding \
                                                   spacer \
                                                   wraplength];

    # Set the default 'non-styleable' checkbutton options values.
    set ::ms::default(checkbutton,class)        TCheckbutton
    set ::ms::default(checkbutton,cmenu)        {}
    set ::ms::default(checkbutton,command)      {}
    set ::ms::default(checkbutton,offvalue)     0
    set ::ms::default(checkbutton,onvalue)      1
    set ::ms::default(checkbutton,state)        normal
    set ::ms::default(checkbutton,style)        TCheckbutton
    set ::ms::default(checkbutton,takefocus)    1
    set ::ms::default(checkbutton,text)         {}
    set ::ms::default(checkbutton,textvariable) {}
    set ::ms::default(checkbutton,underline)    -1
    set ::ms::default(checkbutton,variable)     {}

    # Note: The default 'styleable' checkbutton options values are always defined inside the current theme.
}

# Rename the original Tk **checkbutton** and **ttk::checkbutton** commands.
rename checkbutton      _checkbutton
rename ttk::checkbutton _ttk_checkbutton

# Create aliases for the mustang **checkbutton** command.
interp alias {} checkbutton      {} ::ms::checkbutton::Command
interp alias {} ttk::checkbutton {} ::ms::checkbutton::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **checkbutton** and **ttk::checkbutton** widgets commands.
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
proc ::ms::checkbutton::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(checkbutton,class)
            set ::ms::default($w,cmenu)        $::ms::default(checkbutton,cmenu)
            set ::ms::default($w,command)      $::ms::default(checkbutton,command)
            set ::ms::default($w,offvalue)     $::ms::default(checkbutton,offvalue)
            set ::ms::default($w,onvalue)      $::ms::default(checkbutton,onvalue)
            set ::ms::default($w,state)        $::ms::default(checkbutton,state)
            set ::ms::default($w,style)        $::ms::default(checkbutton,style)
            set ::ms::default($w,takefocus)    $::ms::default(checkbutton,takefocus)
            set ::ms::default($w,text)         $::ms::default(checkbutton,text)
            set ::ms::default($w,textvariable) $::ms::default(checkbutton,textvariable)
            set ::ms::default($w,underline)    $::ms::default(checkbutton,underline)
            set ::ms::default($w,variable)     $::ms::default(checkbutton,variable)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(checkbutton,class)
            set ::ms::current($w,cmenu)        $::ms::default(checkbutton,cmenu)
            set ::ms::current($w,command)      $::ms::default(checkbutton,command)
            set ::ms::current($w,offvalue)     $::ms::default(checkbutton,offvalue)
            set ::ms::current($w,onvalue)      $::ms::default(checkbutton,onvalue)
            set ::ms::current($w,state)        $::ms::default(checkbutton,state)
            set ::ms::current($w,style)        $::ms::default(checkbutton,style)
            set ::ms::current($w,takefocus)    $::ms::default(checkbutton,takefocus)
            set ::ms::current($w,text)         $::ms::default(checkbutton,text)
            set ::ms::current($w,textvariable) $::ms::default(checkbutton,textvariable)
            set ::ms::current($w,underline)    $::ms::default(checkbutton,underline)
            set ::ms::current($w,variable)     $::ms::default(checkbutton,variable)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) checkbutton

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
            #       To make a checkbutton styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **checkbutton** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)          Tk
            set ::ms::managed_by($w,charwidth)           Tk
            set ::ms::managed_by($w,cursor)              Tk
            set ::ms::managed_by($w,font)                Tk
            set ::ms::managed_by($w,foreground)          Tk
            set ::ms::managed_by($w,highlightcolor)      Tk
            set ::ms::managed_by($w,image)               Tk
            set ::ms::managed_by($w,indicatorbackground) Tk
            set ::ms::managed_by($w,indicatorforeground) Tk
            set ::ms::managed_by($w,indicatorrelief)     Tk
            set ::ms::managed_by($w,justify)             Tk
            set ::ms::managed_by($w,padding)             Tk
            set ::ms::managed_by($w,spacer)              Tk
            set ::ms::managed_by($w,wraplength)          Tk

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
                    -charwidth {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,charwidth)    $value
                        set ::ms::managed_by($w,charwidth) developer
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
                    -highlightcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,highlightcolor)    $value
                        set ::ms::managed_by($w,highlightcolor) developer
                    }
                    -image {
                        switch -- [::ms::Check_Image $value] {
                            invalid { continue }
                        }

                        set ::ms::current($w,image)    $value
                        set ::ms::managed_by($w,image) developer
                    }
                    -indicatorbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,indicatorbackground)    $value
                        set ::ms::managed_by($w,indicatorbackground) developer
                    }
                    -indicatorforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,indicatorforeground)    $value
                        set ::ms::managed_by($w,indicatorforeground) developer
                    }
                    -indicatorrelief {
                        set value [string tolower $value]
                        switch -- $value {
                            flat   -
                            groove -
                            raised -
                            ridge  -
                            solid  -
                            sunken {
                                set ::ms::current($w,indicatorrelief)    $value
                                set ::ms::managed_by($w,indicatorrelief) developer
                            }
                        }
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
                    -offvalue { set ::ms::current($w,offvalue) $value }
                    -onvalue { set ::ms::current($w,onvalue) $value }
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
                    -spacer {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,spacer)    $value
                        set ::ms::managed_by($w,spacer) developer
                    }
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            disabled -
                            normal   { set ::ms::current($w,state) $value }
                        }
                    }
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TCheckbutton' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TCheckbutton]
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
                            1   {
                                if { $value >= -1 } {
                                    set ::ms::current($w,underline) $value
                                }
                            }
                        }
                    }
                    -variable {
                        switch -- [info exists $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,variable) $value
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
            foreach option $::ms::checkbutton(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TCheckbutton,$option)

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

            # Check if a variable was provided.
            switch -- [llength $::ms::current($w,variable)] {
                0   {
                    # Depending on the address type provided, set the appropriate address.
                    switch -- $type {
                        real  { set ::ms::current($w,variable) $w }
                        short { set ::ms::current($w,variable) $short_addr }
                    }
                }
            }

            # Get the padding data.
            switch -- [llength $::ms::current($w,padding)] {
                1   {
                    set pad_left   [lindex $::ms::current($w,padding) 0]
                    set pad_right  [lindex $::ms::current($w,padding) 0]
                    set pad_top    [lindex $::ms::current($w,padding) 0]
                    set pad_bottom [lindex $::ms::current($w,padding) 0]
                }
                2   {
                    set pad_left   [lindex $::ms::current($w,padding) 0]
                    set pad_top    [lindex $::ms::current($w,padding) 1]
                    set pad_right  [lindex $::ms::current($w,padding) 0]
                    set pad_bottom [lindex $::ms::current($w,padding) 1]
                }
                3   {
                    set pad_left   [lindex $::ms::current($w,padding) 0]
                    set pad_top    [lindex $::ms::current($w,padding) 1]
                    set pad_right  [lindex $::ms::current($w,padding) 2]
                    set pad_bottom [lindex $::ms::current($w,padding) 1]
                }
                4   {
                    set pad_left   [lindex $::ms::current($w,padding) 0]
                    set pad_top    [lindex $::ms::current($w,padding) 1]
                    set pad_right  [lindex $::ms::current($w,padding) 2]
                    set pad_bottom [lindex $::ms::current($w,padding) 3]
                }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'background', 'charwidth', 'cursor', 'font', 'indicatorbackground', 'indicatorrelief', 'justify',
            #       'padding', 'spacer' and 'wraplength' are not allowed to change if the statespec changes.

            ##################
            ##              ##
            ##     HULL     ##
            ##              ##
            ##################

            # Set the hull object style name.
            set ::ms::style($w,hull) [string cat "_bg=" $::ms::current($w,background) \
                                                 ".TFrame"];

            # If needed, create the hull object style name.
            if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,background)

                # Add the hull object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
            }

            # Create the hull object.
            _ttk_frame $w -borderwidth 0 \
                                -class TFrame \
                               -cursor $cursor \
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
            ##     INDICATOR     ##
            ##                   ##
            #######################

            # Note: The 'alt' engine use the option name 'indicatorcolor' instead of 'indicatorforeground' as the other engines do.
            #       Mustang will take care of setting both option names with the 'indicatorforeground' value so that no matter
            #       the engine used by the current theme, everything will work as expected by the developer.

            # Set the indicator object style name.
            set ::ms::style($w,indicator) [string cat "_bg=" $::ms::current($w,background) \
                                                      "_ib=" $::ms::current($w,indicatorbackground) \
                                                      "_if=" $::ms::current($w,indicatorforeground) \
                                                      "_ir=" $::ms::current($w,indicatorrelief) \
                                                      "." $::ms::current($w,style)];

            # If needed, create the indicator object style name.
            if { $::ms::style($w,indicator) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,indicator)          -background $::ms::current($w,background) \
                                                                -indicatorbackground $::ms::current($w,indicatorbackground) \
                                                                     -indicatorcolor $::ms::current($w,indicatorforeground) \
                                                                -indicatorforeground $::ms::current($w,indicatorforeground) \
                                                                    -indicatorrelief $::ms::current($w,indicatorrelief);

                # Add the indicator object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,indicator)
            }

            # Initialize the indicator object mapping.
            set mapping [list ]

            # indicatorcolor and indicatorforeground.
            switch -- $::ms::managed_by($w,indicatorforeground) {
                developer {
                    lappend mapping -indicatorcolor      [list pressed $::ms::current($w,indicatorforeground)]
                    lappend mapping -indicatorforeground [list pressed $::ms::current($w,indicatorforeground)]
                }
                Tk  {
                    # Check if a 'indicatorforeground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)] {
                        1   {
                            lappend mapping -indicatorcolor      $::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)
                            lappend mapping -indicatorforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)
                        }
                    }
                }
            }

            # If needed, create the indicator object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,indicator) {*}$mapping

                # Add the indicator object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the indicator object.
            _ttk_checkbutton $w.indicator        -class TCheckbutton \
                                               -command $::ms::current($w,command) \
                                              -compound left \
                                                -cursor $cursor \
                                                 -image $::ms::current($w,image) \
                                              -offvalue $::ms::current($w,offvalue) \
                                               -onvalue $::ms::current($w,onvalue) \
                                               -padding 0 \
                                                 -state $::ms::current($w,state) \
                                                 -style $::ms::style($w,indicator) \
                                             -takefocus $takefocus \
                                                  -text "" \
                                          -textvariable "" \
                                             -underline -1 \
                                              -variable $::ms::current($w,variable);

            # Grid the indicator object.
            _grid $w.indicator -column 0 \
                                 -padx [list $pad_left 0] \
                                 -pady [list $pad_top 1m] \
                                  -row 0 \
                               -sticky w;

            ###################
            ##               ##
            ##     LABEL     ##
            ##               ##
            ###################

            # Set the label object style name.
            set ::ms::style($w,label) [string cat "_bg=" $::ms::current($w,background) \
                                                  "_fg=" $::ms::current($w,foreground) \
                                                  ".TLabel"];

            # If needed, create the label object style name.
            if { $::ms::style($w,label) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,label) -background $::ms::current($w,background) \
                                                            -foreground $::ms::current($w,foreground);

                # Add the label object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,label)
            }

            # Initialize the label object mapping.
            set mapping [list ]

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

            # If needed, create the label object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,label) {*}$mapping

                # Add the label object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the label object.
            _ttk_label $w.label       -anchor w \
                                 -borderwidth 0 \
                                       -class TLabel \
                                    -compound none \
                                      -cursor $cursor \
                                        -font $::ms::current($w,font) \
                                       -image [list ] \
                                     -justify $::ms::current($w,justify) \
                                     -padding 0 \
                                      -relief flat \
                                       -state $::ms::current($w,state) \
                                       -style $::ms::style($w,label) \
                                   -takefocus 0 \
                                        -text "" \
                                -textvariable $text_variable \
                                   -underline $::ms::current($w,underline) \
                                       -width $::ms::current($w,charwidth) \
                                  -wraplength $::ms::current($w,wraplength);

            # Grid the label object.
            _grid $w.label -column 1 \
                             -padx [list $::ms::current($w,spacer) $pad_right] \
                             -pady [list $pad_top 1m] \
                              -row 0 \
                           -sticky we;

            #######################
            ##                   ##
            ##     HIGHLIGHT     ##
            ##                   ##
            #######################

            # Set the highlight object style name.
            set ::ms::style($w,highlight) [string cat "_hc=" $::ms::current($w,highlightcolor) \
                                                      ".TFrame"];

            # If needed, create the highlight object style name.
            if { $::ms::style($w,highlight) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,highlight) -background $::ms::current($w,highlightcolor)

                # Add the highlight object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,highlight)
            }

            # Initialize the highlight object mapping.
            set mapping [list ]

            # highlightcolor
            switch -- $::ms::managed_by($w,highlightcolor) {
                developer { lappend mapping -background [list pressed $::ms::current($w,highlightcolor)] }
                Tk  {
                    # Check if a 'background' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),highlightcolor)] {
                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),highlightcolor) }
                    }
                }
            }

            # If needed, create the highlight object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,highlight) {*}$mapping

                # Add the highlight object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the highlight object.
            _ttk_frame $w.highlight -borderwidth 0 \
                                          -class TFrame \
                                         -cursor $cursor \
                                         -height 2 \
                                        -padding 0 \
                                         -relief flat \
                                          -style $::ms::style($w,highlight) \
                                      -takefocus 0 \
                                          -width 1;

            _grid $w.highlight -column 1 \
                                 -padx [list $::ms::current($w,spacer) $pad_right] \
                                 -pady [list 1m $pad_bottom] \
                                  -row 1 \
                               -sticky we;

            ####################################
            ##                                ##
            ##     CHECK THE WIDGET STATE     ##
            ##                                ##
            ####################################

            switch -- $::ms::current($w,state) {
                disabled {
                    $w state disabled
                    $w.indicator state disabled
                    $w.label state disabled
                    $w.highlight state disabled
                }
            }

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TCheckbutton { _bindtags $w [list $w _Checkbutton TCheckbutton $::ms::addr($w,toplevel) all] }
                default      { _bindtags $w [list $w $::ms::current($w,class) _Checkbutton TCheckbutton $::ms::addr($w,toplevel) all] }
            }

            # ButtonPress-1
            _bind $w.highlight <ButtonPress-1> { ::ms::checkbutton::ButtonPress [_winfo parent %W]; break }
            _bind $w.indicator <ButtonPress-1> { ::ms::checkbutton::ButtonPress [_winfo parent %W]; break }
            _bind $w.label     <ButtonPress-1> { ::ms::checkbutton::ButtonPress [_winfo parent %W]; break }

            # Contextual menu
            _bind $w.highlight <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }
            _bind $w.indicator <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }
            _bind $w.label     <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

            # Enter/Leave
            _bind $w.highlight <Enter> { ::ms::checkbutton::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.indicator <Enter> { ::ms::checkbutton::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.label     <Enter> { ::ms::checkbutton::Hover [_winfo parent %W] %X %Y; break }

            _bind $w.highlight <Leave> { ::ms::checkbutton::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.indicator <Leave> { ::ms::checkbutton::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.label     <Leave> { ::ms::checkbutton::Hover [_winfo parent %W] %X %Y; break }

            # FocusIn/FocusOut
            _bind $w.highlight <FocusIn>  { ::ms::checkbutton::FocusIn  [_winfo parent %W]; break }
            _bind $w.indicator <FocusIn>  { ::ms::checkbutton::FocusIn  [_winfo parent %W]; break }
            _bind $w.label     <FocusIn>  { ::ms::checkbutton::FocusIn  [_winfo parent %W]; break }

            _bind $w.highlight <FocusOut> { ::ms::checkbutton::FocusOut [_winfo parent %W]; break }
            _bind $w.indicator <FocusOut> { ::ms::checkbutton::FocusOut [_winfo parent %W]; break }
            _bind $w.label     <FocusOut> { ::ms::checkbutton::FocusOut [_winfo parent %W]; break }

            # Return/KP_Enter
            _bind $w.indicator <Return>   { ::ms::checkbutton::Return [_winfo parent %W]; break }
            _bind $w.indicator <KP_Enter> { ::ms::checkbutton::Return [_winfo parent %W]; break }

            # Shift-Tab
            switch -- [_tk windowingsystem] {
                win32   { _bind $w.indicator <Shift-Tab> { ::tk::TabToWindow [tk_focusPrev [_winfo parent %W]]; break } }
                default {
                    _bind $w.indicator <ISO_Left_Tab>    { ::tk::TabToWindow [tk_focusPrev [_winfo parent %W]]; break }

                    try {
                        _bind $w.indicator <hpBackTab>   { ::tk::TabToWindow [tk_focusPrev [_winfo parent %W]]; break }
                    } on error {} {
                        # Do nothing.
                    }
                }
            }

            # Mousewheel and Touchpad

            # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.highlight <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }
            _bind $w.indicator <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }
            _bind $w.label     <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }

            # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.highlight <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }
            _bind $w.indicator <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }
            _bind $w.label     <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }

            # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one page up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.highlight <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }
            _bind $w.indicator <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }
            _bind $w.label     <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }

            # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one page left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.highlight <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }
            _bind $w.indicator <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }
            _bind $w.label     <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }

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
            _bind $w.highlight <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }
            _bind $w.indicator <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }
            _bind $w.label     <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }

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
            _bind $w.highlight <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }
            _bind $w.indicator <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }
            _bind $w.label     <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Configure the internal widget rows and columns.
            _grid rowconfigure $w [list 0] -weight 1
            _grid rowconfigure $w [list 1] -weight 0

            _grid columnconfigure $w [list 0] -weight 0
            _grid columnconfigure $w [list 1] -weight 1

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::checkbutton::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::checkbutton::Pathname_Cmd $w]
            }

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w.indicator

            # Set the structure addresses.
            set ::ms::addr($w,structure) [list $w \
                                               $w.highlight \
                                               $w.indicator \
                                               $w.label];

            # Add the widget address to the megawidget addresses list.
            lappend ::ms::addr(megawidgets) $w

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short addresses relative to its real address, 'w'.
            # They will all point to the widget hull object short address.
            set ::ms::addr($w,short)           $short_addr
            set ::ms::addr($w.indicator,short) $short_addr
            set ::ms::addr($w.label,short)     $short_addr
            set ::ms::addr($w.highlight,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals) $w \
                                      $w.highlight \
                                      $w.indicator \
                                      $w.label;

            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the checkbutton classtype widgets real address list.
            lappend ::ms::addr(checkbutton) $w

            # Add the widget address to the checkbutton classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),checkbutton,addrs) $w

            # Add the widget address to the checkbutton classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),checkbutton,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the checkbutton classtype.
            if { $::ms::current($w,style) ni $::ms::style(checkbutton,classtype) } {
                lappend ::ms::style(checkbutton,classtype) $::ms::current($w,style)
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
proc ::ms::checkbutton::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::checkbutton(non_styleable,options)) || ($option in $::ms::checkbutton(styleable,options)) } {
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
                    foreach option $::ms::checkbutton(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::checkbutton(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::checkbutton(non_styleable,options)) || ($option in $::ms::checkbutton(styleable,options)) } {
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
                                    -background {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,background)    $value
                                        set ::ms::managed_by($w,background) developer
                                    }
                                    -charwidth {
                                        switch -- [string is integer -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,charwidth)    $value
                                        set ::ms::managed_by($w,charwidth) developer
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
                                    -highlightcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,highlightcolor)    $value
                                        set ::ms::managed_by($w,highlightcolor) developer
                                    }
                                    -image {
                                        switch -- [::ms::Check_Image $value] {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,image)    $value
                                        set ::ms::managed_by($w,image) developer
                                    }
                                    -indicatorforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,indicatorforeground)    $value
                                        set ::ms::managed_by($w,indicatorforeground) developer
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
                                    -offvalue { set ::ms::current($w,offvalue) $value }
                                    -onvalue { set ::ms::current($w,onvalue) $value }
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
                                    -spacer {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,spacer)    $value
                                        set ::ms::managed_by($w,spacer) developer
                                    }
                                    -state {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            disabled -
                                            normal   { set ::ms::current($w,state) $value }
                                        }
                                    }
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Check if exists a layout for the style provided.
                                            # If not, create one by mirroring the current theme 'TCheckbutton' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TCheckbutton]
                                            }

                                            # Remove the widget address from the checkbutton classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),checkbutton,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),checkbutton,addrs) [lremove $::ms::style($::ms::current($w,style),checkbutton,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,checkbutton,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the checkbutton classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),checkbutton,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(checkbutton,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(checkbutton,classtype) [lremove $::ms::style(checkbutton,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the checkbutton classtype.
                                            if { $value ni $::ms::style(checkbutton,classtype) } {
                                                lappend ::ms::style(checkbutton,classtype) $value
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

                                        set ::ms::current($w,textvariable) $value
                                    }
                                    -underline {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value >= -1 } {
                                                    set ::ms::current($w,underline) $value
                                                }
                                            }
                                        }
                                    }
                                    -variable {
                                        switch -- [info exists $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,variable) $value
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
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TCheckbutton,$option)

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

                            # Check if a variable was provided.
                            switch -- [llength $::ms::current($w,variable)] {
                                0   {
                                    # Depending on the address type provided, set the appropriate address.
                                    switch -- $type {
                                        real  { set ::ms::current($w,variable) $w }
                                        short { set ::ms::current($w,variable) $short_addr }
                                    }
                                }
                            }

                            # Get the padding data.
                            switch -- [llength $::ms::current($w,padding)] {
                                1   {
                                    set pad_left   [lindex $::ms::current($w,padding) 0]
                                    set pad_right  [lindex $::ms::current($w,padding) 0]
                                    set pad_top    [lindex $::ms::current($w,padding) 0]
                                    set pad_bottom [lindex $::ms::current($w,padding) 0]
                                }
                                2   {
                                    set pad_left   [lindex $::ms::current($w,padding) 0]
                                    set pad_top    [lindex $::ms::current($w,padding) 1]
                                    set pad_right  [lindex $::ms::current($w,padding) 0]
                                    set pad_bottom [lindex $::ms::current($w,padding) 1]
                                }
                                3   {
                                    set pad_left   [lindex $::ms::current($w,padding) 0]
                                    set pad_top    [lindex $::ms::current($w,padding) 1]
                                    set pad_right  [lindex $::ms::current($w,padding) 2]
                                    set pad_bottom [lindex $::ms::current($w,padding) 1]
                                }
                                4   {
                                    set pad_left   [lindex $::ms::current($w,padding) 0]
                                    set pad_top    [lindex $::ms::current($w,padding) 1]
                                    set pad_right  [lindex $::ms::current($w,padding) 2]
                                    set pad_bottom [lindex $::ms::current($w,padding) 3]
                                }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'background', 'charwidth', 'cursor', 'font', 'indicatorbackground', 'indicatorrelief', 'justify',
                            #       'padding', 'spacer' and 'wraplength' are not allowed to change if the statespec changes.

                            ##################
                            ##              ##
                            ##     HULL     ##
                            ##              ##
                            ##################

                            # Set the hull object style name.
                            set ::ms::style($w,hull) [string cat "_bg=" $::ms::current($w,background) \
                                                                 ".TFrame"];

                            # If needed, create the hull object style name.
                            if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,background)

                                # Add the hull object style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure -cursor $cursor \
                                                                 -style $::ms::style($w,hull);

                            #######################
                            ##                   ##
                            ##     INDICATOR     ##
                            ##                   ##
                            #######################

                            # Note: The 'alt' engine use the option name 'indicatorcolor' instead of 'indicatorforeground' as the other engines do.
                            #       Mustang will take care of setting both option names with the 'indicatorforeground' value so that no matter
                            #       the engine used by the current theme, everything will work as expected by the developer.

                            # Set the indicator object style name.
                            set ::ms::style($w,indicator) [string cat "_bg=" $::ms::current($w,background) \
                                                                      "_ib=" $::ms::current($w,indicatorbackground) \
                                                                      "_if=" $::ms::current($w,indicatorforeground) \
                                                                      "_ir=" $::ms::current($w,indicatorrelief) \
                                                                      "." $::ms::current($w,style)];

                            # If needed, create the indicator object style name.
                            if { $::ms::style($w,indicator) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,indicator)          -background $::ms::current($w,background) \
                                                                                -indicatorbackground $::ms::current($w,indicatorbackground) \
                                                                                     -indicatorcolor $::ms::current($w,indicatorforeground) \
                                                                                -indicatorforeground $::ms::current($w,indicatorforeground) \
                                                                                    -indicatorrelief $::ms::current($w,indicatorrelief);

                                # Add the indicator object style to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,indicator)
                            }

                            # Initialize the indicator object mapping.
                            set mapping [list ]

                            # indicatorcolor and indicatorforeground.
                            switch -- $::ms::managed_by($w,indicatorforeground) {
                                developer {
                                    lappend mapping -indicatorcolor      [list pressed $::ms::current($w,indicatorforeground)]
                                    lappend mapping -indicatorforeground [list pressed $::ms::current($w,indicatorforeground)]
                                }
                                Tk  {
                                    # Check if a 'indicatorforeground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)] {
                                        1   {
                                            lappend mapping -indicatorcolor      $::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)
                                            lappend mapping -indicatorforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)
                                        }
                                    }
                                }
                            }

                            # If needed, create the indicator object mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,indicator) {*}$mapping

                                # Add the indicator object mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            $w.indicator configure   -command $::ms::current($w,command) \
                                                      -cursor $cursor \
                                                       -image $::ms::current($w,image) \
                                                    -offvalue $::ms::current($w,offvalue) \
                                                     -onvalue $::ms::current($w,onvalue) \
                                                       -state $::ms::current($w,state) \
                                                       -style $::ms::style($w,indicator) \
                                                   -takefocus $takefocus \
                                                    -variable $::ms::current($w,variable);

                            _grid configure $w.indicator -padx [list $pad_left 0] \
                                                         -pady [list $pad_top 1m];

                            ###################
                            ##               ##
                            ##     LABEL     ##
                            ##               ##
                            ###################

                            # Set the label object style name.
                            set ::ms::style($w,label) [string cat "_bg=" $::ms::current($w,background) \
                                                                  "_fg=" $::ms::current($w,foreground) \
                                                                  ".TLabel"];

                            # If needed, create the label object style name.
                            if { $::ms::style($w,label) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,label) -background $::ms::current($w,background) \
                                                                            -foreground $::ms::current($w,foreground);

                                # Add the label object style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,label)
                            }

                            # Initialize the label object mapping.
                            set mapping [list ]

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

                            # If needed, create the label object mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,label) {*}$mapping

                                # Add the label object mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            $w.label configure       -cursor $cursor \
                                                       -font $::ms::current($w,font) \
                                                    -justify $::ms::current($w,justify) \
                                                      -state $::ms::current($w,state) \
                                                      -style $::ms::style($w,label) \
                                               -textvariable $text_variable \
                                                  -underline $::ms::current($w,underline) \
                                                      -width $::ms::current($w,charwidth) \
                                                 -wraplength $::ms::current($w,wraplength);

                            _grid configure $w.label -padx [list $::ms::current($w,spacer) $pad_right] \
                                                     -pady [list $pad_top 1m];

                            #######################
                            ##                   ##
                            ##     HIGHLIGHT     ##
                            ##                   ##
                            #######################

                            # Set the highlight object style name.
                            set ::ms::style($w,highlight) [string cat "_hc=" $::ms::current($w,highlightcolor) \
                                                                      ".TFrame"];

                            # If needed, create the highlight object style name.
                            if { $::ms::style($w,highlight) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,highlight) -background $::ms::current($w,highlightcolor)

                                # Add the highlight object style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,highlight)
                            }

                            # Initialize the highlight object mapping.
                            set mapping [list ]

                            # highlightcolor
                            switch -- $::ms::managed_by($w,highlightcolor) {
                                developer { lappend mapping -background [list pressed $::ms::current($w,highlightcolor)] }
                                Tk  {
                                    # Check if a 'background' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),highlightcolor)] {
                                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),highlightcolor) }
                                    }
                                }
                            }

                            # If needed, create the highlight object mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,highlight) {*}$mapping

                                # Add the highlight object mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            $w.highlight configure -cursor $cursor \
                                                    -style $::ms::style($w,highlight);

                            _grid configure $w.highlight -padx [list $::ms::current($w,spacer) $pad_right] \
                                                         -pady [list 1m $pad_bottom];

                            ####################################
                            ##                                ##
                            ##     CHECK THE WIDGET STATE     ##
                            ##                                ##
                            ####################################

                            switch -- $::ms::current($w,state) {
                                disabled {
                                    interp invokehidden {} $w state disabled
                                    $w.indicator state disabled
                                    $w.label state disabled
                                    $w.highlight state disabled
                                }
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

                    # Return the name of the object, or an empty string if there are no checkbutton objects at the coordinates provided.
                    if { $widget eq $w } {
                        return "Checkbutton.hull"
                    } elseif { $widget eq "$w.indicator" } {
                        return "Checkbutton.indicator"
                    } elseif { $widget eq "$w.label" } {
                        return "Checkbutton.label"
                    } elseif { $widget eq "$w.highlight" } {
                        return "Checkbutton.highlight"
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

                    # Execute the command.
                    try {
                        $w.indicator instate $statespec
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
                        $w.indicator instate $statespec $script
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        invoke {
            # Synopsis:
            #
            # *window* **invoke**
            switch -- $::ms::current($w,state) {
                normal {
                    # Execute the command.
                    try {
                        uplevel #0 [list $w.indicator invoke]
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                disabled { return "" }
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

                    # Propagate the new statespec to the hull, label, highlight and indicator objects of
                    # the checkbutton.
                    interp invokehidden {} $w state $statespec
                    $w.label state $statespec
                    $w.highlight state $statespec

                    return [$w.indicator state $statespec]
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
# Update any checkbutton widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::checkbutton::Style_Update { stylename caller_info } {
    # Update all the checkbutton widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,checkbutton,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::checkbutton(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TCheckbutton,$option)

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

        # Get the padding data.
        switch -- [llength $::ms::current($w,padding)] {
            1   {
                set pad_left   [lindex $::ms::current($w,padding) 0]
                set pad_right  [lindex $::ms::current($w,padding) 0]
                set pad_top    [lindex $::ms::current($w,padding) 0]
                set pad_bottom [lindex $::ms::current($w,padding) 0]
            }
            2   {
                set pad_left   [lindex $::ms::current($w,padding) 0]
                set pad_top    [lindex $::ms::current($w,padding) 1]
                set pad_right  [lindex $::ms::current($w,padding) 0]
                set pad_bottom [lindex $::ms::current($w,padding) 1]
            }
            3   {
                set pad_left   [lindex $::ms::current($w,padding) 0]
                set pad_top    [lindex $::ms::current($w,padding) 1]
                set pad_right  [lindex $::ms::current($w,padding) 2]
                set pad_bottom [lindex $::ms::current($w,padding) 1]
            }
            4   {
                set pad_left   [lindex $::ms::current($w,padding) 0]
                set pad_top    [lindex $::ms::current($w,padding) 1]
                set pad_right  [lindex $::ms::current($w,padding) 2]
                set pad_bottom [lindex $::ms::current($w,padding) 3]
            }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'background', 'charwidth', 'cursor', 'font', 'indicatorbackground', 'indicatorrelief', 'justify',
        #       'padding', 'spacer' and 'wraplength' are not allowed to change if the statespec changes.

        ##################
        ##              ##
        ##     HULL     ##
        ##              ##
        ##################

        # Set the hull object style name.
        set ::ms::style($w,hull) [string cat "_bg=" $::ms::current($w,background) \
                                             ".TFrame"];

        # If needed, create the hull object style name.
        if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,background)

            # Add the hull object style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
        }

        # Apply the changes.
        interp invokehidden {} $w configure -cursor $cursor \
                                             -style $::ms::style($w,hull);

        #######################
        ##                   ##
        ##     INDICATOR     ##
        ##                   ##
        #######################

        # Note: The 'alt' engine use the option name 'indicatorcolor' instead of 'indicatorforeground' as the other engines do.
        #       Mustang will take care of setting both option names with the 'indicatorforeground' value so that no matter
        #       the engine used by the current theme, everything will work as expected by the developer.

        # Set the indicator object style name.
        set ::ms::style($w,indicator) [string cat "_bg=" $::ms::current($w,background) \
                                                  "_ib=" $::ms::current($w,indicatorbackground) \
                                                  "_if=" $::ms::current($w,indicatorforeground) \
                                                  "_ir=" $::ms::current($w,indicatorrelief) \
                                                  "." $::ms::current($w,style)];

        # If needed, create the indicator object style name.
        if { $::ms::style($w,indicator) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,indicator)          -background $::ms::current($w,background) \
                                                            -indicatorbackground $::ms::current($w,indicatorbackground) \
                                                                 -indicatorcolor $::ms::current($w,indicatorforeground) \
                                                            -indicatorforeground $::ms::current($w,indicatorforeground) \
                                                                -indicatorrelief $::ms::current($w,indicatorrelief);

            # Add the indicator object style to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,indicator)
        }

        # Initialize the indicator object mapping.
        set mapping [list ]

        # indicatorcolor and indicatorforeground.
        switch -- $::ms::managed_by($w,indicatorforeground) {
            developer {
                lappend mapping -indicatorcolor      [list pressed $::ms::current($w,indicatorforeground)]
                lappend mapping -indicatorforeground [list pressed $::ms::current($w,indicatorforeground)]
            }
            Tk  {
                # Check if a 'indicatorforeground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)] {
                    1   {
                        lappend mapping -indicatorcolor      $::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)
                        lappend mapping -indicatorforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)
                    }
                }
            }
        }

        # If needed, create the indicator object mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,indicator) {*}$mapping

            # Add the indicator object mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        $w.indicator configure -cursor $cursor \
                                -image $::ms::current($w,image) \
                                -style $::ms::style($w,indicator);

        _grid configure $w.indicator -padx [list $pad_left 0] \
                                     -pady [list $pad_top 1m];

        ###################
        ##               ##
        ##     LABEL     ##
        ##               ##
        ###################

        # Set the label object style name.
        set ::ms::style($w,label) [string cat "_bg=" $::ms::current($w,background) \
                                              "_fg=" $::ms::current($w,foreground) \
                                              ".TLabel"];

        # If needed, create the label object style name.
        if { $::ms::style($w,label) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,label) -background $::ms::current($w,background) \
                                                        -foreground $::ms::current($w,foreground);

            # Add the label object style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,label)
        }

        # Initialize the label object mapping.
        set mapping [list ]

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

        # If needed, create the label object mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,label) {*}$mapping

            # Add the label object mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        $w.label configure     -cursor $cursor \
                                 -font $::ms::current($w,font) \
                              -justify $::ms::current($w,justify) \
                                -style $::ms::style($w,label) \
                                -width $::ms::current($w,charwidth) \
                           -wraplength $::ms::current($w,wraplength);

        _grid configure $w.label -padx [list $::ms::current($w,spacer) $pad_right] \
                                 -pady [list $pad_top 1m];

        #######################
        ##                   ##
        ##     HIGHLIGHT     ##
        ##                   ##
        #######################

        # Set the highlight object style name.
        set ::ms::style($w,highlight) [string cat "_hc=" $::ms::current($w,highlightcolor) \
                                                  ".TFrame"];

        # If needed, create the highlight object style name.
        if { $::ms::style($w,highlight) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,highlight) -background $::ms::current($w,highlightcolor)

            # Add the highlight object style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,highlight)
        }

        # Initialize the highlight object mapping.
        set mapping [list ]

        # highlightcolor
        switch -- $::ms::managed_by($w,highlightcolor) {
            developer { lappend mapping -background [list pressed $::ms::current($w,highlightcolor)] }
            Tk  {
                # Check if a 'background' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),highlightcolor)] {
                    1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),highlightcolor) }
                }
            }
        }

        # If needed, create the highlight object mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,highlight) {*}$mapping

            # Add the highlight object mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        $w.highlight configure -cursor $cursor \
                                -style $::ms::style($w,highlight);

        _grid configure $w.highlight -padx [list $::ms::current($w,spacer) $pad_right] \
                                     -pady [list 1m $pad_bottom];
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
# Select the checkbutton where the <ButtonPress-1> event happened and launch the associated command, if any.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::checkbutton::ButtonPress { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        normal {
            # Focus the widget indicator.
            _focus -force $w.indicator

            # Invoke the widget command, if any.
            switch -- $::ms::current($w,command) {
                ""      {}
                default {
                    try {
                        uplevel #0 [list $w.indicator invoke]
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" ""
                    }
                }
            }
        }
        default {
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
proc ::ms::checkbutton::Destroy { w } {
    # Get the short address related to the widget real address.
    set short_addr $::ms::addr($w,short)

    # Destroy the aliased widget pathcommands.
    foreach token $::ms::data($w,token) {
        interp alias {} $token {}
    }

    # Remove all the objects real addresses from the list of all available real addresses.
    foreach object [list $w \
                         $w.highlight \
                         $w.indicator \
                         $w.label] {
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

    # Remove the widget address from the checkbutton widgets real address list.
    set index [lsearch -exact $::ms::addr(checkbutton) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(checkbutton) [lremove $::ms::addr(checkbutton) $index] }
    }

    # Remove the widget address from the checkbutton real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),checkbutton,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),checkbutton,addrs) [lremove $::ms::class($::ms::current($w,class),checkbutton,addrs) $index] }
    }

    # Remove the widget address from the checkbutton real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),checkbutton,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),checkbutton,addrs) [lremove $::ms::style($::ms::current($w,style),checkbutton,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the checkbutton classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),checkbutton,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(checkbutton,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(checkbutton,classtype) [lremove $::ms::style(checkbutton,classtype) $index] }
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
                         ::ms::addr($w,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,background) \
                         ::ms::current($w,charwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,command) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,highlightcolor) \
                         ::ms::current($w,indicatorbackground) \
                         ::ms::current($w,indicatorforeground) \
                         ::ms::current($w,indicatorrelief) \
                         ::ms::current($w,justify) \
                         ::ms::current($w,offvalue) \
                         ::ms::current($w,onvalue) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,spacer) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,text) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,underline) \
                         ::ms::current($w,variable) \
                         ::ms::current($w,wraplength);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token) \
                         ::ms::data($w,translated_text);

    unset -nocomplain -- ::ms::default($w,background) \
                         ::ms::default($w,charwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,command) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,highlightcolor) \
                         ::ms::default($w,indicatorbackground) \
                         ::ms::default($w,indicatorforeground) \
                         ::ms::default($w,indicatorrelief) \
                         ::ms::default($w,justify) \
                         ::ms::default($w,offvalue) \
                         ::ms::default($w,onvalue) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,spacer) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,text) \
                         ::ms::default($w,textvariable) \
                         ::ms::default($w,underline) \
                         ::ms::default($w,variable) \
                         ::ms::default($w,wraplength);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,charwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,highlightcolor) \
                         ::ms::managed_by($w,indicatorbackground) \
                         ::ms::managed_by($w,indicatorforeground) \
                         ::ms::managed_by($w,indicatorrelief) \
                         ::ms::managed_by($w,justify) \
                         ::ms::managed_by($w,padding) \
                         ::ms::managed_by($w,spacer) \
                         ::ms::managed_by($w,wraplength);

    unset -nocomplain -- ::ms::style($w,hull) \
                         ::ms::style($w,indicator) \
                         ::ms::style($w,label) \
                         ::ms::style($w,highlight);

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
proc ::ms::checkbutton::FocusOut { w } {
    # Check if a contextual menu was assigned to the widget.
    # If not, use the contextual menu of the widget's toplevel.
    set cmenu $::ms::current($w,cmenu)
    switch -- $cmenu {
        ""  { set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu) }
    }

    # If 'cmenu' exists (meaning it's open), do not loose the focus (graphically).
    switch -- [_winfo exists $cmenu] {
        0   { ::ms::checkbutton::Pathname_Cmd $w state [list !focus] }
        1   { ::ms::checkbutton::Pathname_Cmd $w state [list  focus] }
    }

    return ""
}

## Hover
#
# Manage the **Enter** and **Leave** event on a checkbutton.
#
# Where:
#
# w      Should be the widget real address involved.
#
# X, Y   Should be the mouse pointer (X,Y) root coordinates.
#        These value are provided directly by the **Enter** or **Leave** event.
#
# It doesn't return anything.
proc ::ms::checkbutton::Hover { w X Y } {
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
        ::ms::checkbutton::Pathname_Cmd $w state !hover
    } else {
        # The mouse cursor is inside the widget acting as a border object.

        # Change the widget dynamic state to 'hover'.
        ::ms::checkbutton::Pathname_Cmd $w state hover
    }

    return ""
}

## Return
#
# Launch the associated command, if any.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::checkbutton::Return { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        normal {
            # Invoke the widget command, if any.
            switch -- $::ms::current($w,command) {
                ""      {}
                default {
                    try {
                        uplevel #0 [list $w.indicator invoke]
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" ""
                    }
                }
            }
        }
    }

    return ""
}

#*EOF*