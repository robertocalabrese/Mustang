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
# *option*             --> A mandatory parameter that must be substituted with a proper value.
# **option**           --> The command name or a mandatory parameter that must be written verbatim.
#
# ?*option*?           --> An optional parameter that must be substituted with a proper value.
# ?**option**?         --> An optional parameter that must be written verbatim.
#
# ?*option* *value*?   --> An optional 'key-value' parameter that must be substituted with proper values.
# ?**option** *value*? --> An optional 'key-value' parameter where the former must be written verbatim and
#                          the latter must be substituted with a proper value.

# Symbols meanings that may be used by the widget infos:
#
# *text*               --> Italic.
# **text**             --> Bold.
# ***text***           --> Italic-bold
#
# ## text              --> Title.
# #### text            --> Chapter.
# ###### text          --> Sub-chapter.
#
# [text](https:\\...)  --> Link to an internet page.
# [text](/wiki/...)    --> Link to another file in the wiki.

## label
#
#### DESCRIPTION:
#
# A label widget displays a textual label and/or image.
# The label command creates a new window (given by the *window* argument) and makes it into a label widget.
# Additional options, described below, may be specified on the command line to configure aspects of the label.
# The label command returns the pathname of the new window.
#
# Note: At the time this command is invoked, there must not exist a window with the same pathname,
#       but the pathname's parents must exists.
#       *Window* may be provided either as a short or as a real address, the address returned will be:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
# Additional options, described below, may be specified on the command line to configure aspects of the label.
#
#### SYNOPSIS:
#
#   **label**  *window* ?*option* *value*? ... ?*option* *value*?
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
#                                                    If there isn't one, the **-anchor** of the **TLabel** style
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
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                    If there isn't one, the **-background** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-background** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-foreground**.
#
# **-bordercolor**    It's a list that specifies the color to use as bordercolor.
#                     See the **COLOR OPTION** section to know how this list should be composed.
#
#                     Note: It's only meaningful for widget with a **solid** or **flat** relief.
#
#                     Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                    If there isn't one, the **-bordercolor** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-bordercolor** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-borderwidth** and **-relief**.
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
#                                                    If there isn't one, the **-borderwidth** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-borderwidth** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-bordercolor** and **-relief**.
#
# **-charwidth**      If greater than zero, specifies how much space, in character widths, to allocate for the text label.
#                     If less than zero, specifies a minimum width.
#                     If zero or unspecified, the natural width of the text label is used.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-charwidth** specified in its style.
#                                                    If there isn't one, the **-charwidth** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-charwidth** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
# **-class**          Specifies a class for the widget.
#                     It is mainly used to make bindings for widgets that have the same class.
#
#                     Note: This option may only be provided while creating the widget.
#                           Attempts to change this value after the widget is created by using the **configure** command,
#                           will be ignored by mustang.
#
#                     If not provided, defaults to **TLabel**.
#
# **-cmenu**          Specifies the contextual menu address that will be assigned to the widget.
#                     If the *cmenu* value is the empty string or invalid, the contextual menu of the widget's toplevel (if any)
#                     will be used. If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                     If not provided, defaults to the empty string.
#
# **-compound**       Specifies if the widget should display text and images at the same time, and if so, where the image
#                     should be placed relative to the text.
#
#                     Allowed values:
#                        **text**                      --> Display the text only.
#                        **image**                     --> Display the image only.
#                        **center**                    --> Display the text centered on top of the image.
#                        **top**                       --> Display the image above the text.
#                        **bottom**                    --> Display the image below the text.
#                        **left**                      --> Display the image before the text.
#                        **right**                     --> Display the image after the text.
#                        **none** or the empty string  --> Display the image if present, otherwise the text.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-compound** specified in its style.
#                                                    If there isn't one, the **-compound** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-compound** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-image**, **-text** and **-textvariable**.
#
# **-cursor**         Specifies the mouse cursor to be used for the widget.
#                     If an empty string is specified, it indicates that the widget should defer to it's parent for
#                     cursor specification.
#
#                     See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                     Note: If the widget state is disabled, the cursor shape upon it will always be the 'arrow'.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                    If there isn't one, the **-cursor** of the **TLabel** style
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
#                                                    If there isn't one, the **-darkcolor** of the **TLabel** style
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
#                                                    If there isn't one, the **-font** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-font** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-foreground**.
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
#                                                    If there isn't one, the **-foreground** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-foreground** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-background** and **-font**.
#
# **-image**          Specifies an image to display. This is a list of one or more elements.
#                     The first element is the default image name. The rest of the list is a sequence of statespec/value pairs as per style map,
#                     specifying different images to use when the widget is in a particular state or combination of states.
#
#                     Note that all images in the list should have the same size.
#
#                     If an empty string is specified, it indicates that the widget has no image to display.
#                     The image specified should have been already created at the time the widget is created.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-image** specified in its style.
#                                                    If there isn't one, the **-image** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-image** will not abide by its mapping values, if any.
#                                                    Its mapping values must be specified as stated above, even in styles.
#
#                     See also **-compound**, **-text** and **-textvariable**.
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
#                                                    If there isn't one, the **-justify** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-justify** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-anchor**.
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
#                                                    If there isn't one, the **-lightcolor** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-lightcolor** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#                     See also **-darkcolor**.
#
# **-padding**        Specifies the internal padding for the widget.
#                     The padding is a list of up to four length specifications.
#                     The values must be in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                     (pixels, points, inches, millimeters or centimeters).
#
#                     A list of four values specifies the left, top, right and bottom padding.
#                     A list of three values specifies the left, vertical, and right padding.
#                     A list of two values specifies the horizontal and the vertical padding
#                     A single value specifies the same padding all the way around the widget.
#
#                     When computing how large a window it needs, the widget will add this amount to the width it would
#                     normally need (as determined by the width of the things displayed in the widget).
#                     If the geometry manager can satisfy this request, the widget will end up with extra internal space
#                     to the left and/or right of what it displays inside.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-padding** specified in its style.
#                                                    If there isn't one, the **-padding** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-padding** will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
# **-relief**         Specifies the three-dimensional effect desired for the widget.
#                     The value indicates how the widget's interior should appear relative to its exterior.
#                     For example, *raised* means the widget's interior should appear to protrude from the screen,
#                     relative to the exterior of the widget.
#
#                     The widget will accept as relief any of the following values:
#                        **flat**,
#                        **groove**,
#                        **raised**,
#                        **ridge**,
#                        **solid**,
#                        **sunken**.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-relief** specified in its style.
#                                                    If there isn't one, the **-relief** of the **TLabel** style
#                                                    will be used instead.
#                                                    The '*-relief*' will not abide by its mapping values, if any.
#                                                    It is not supposed to change when the widget state changes.
#
#                     See also **-bordercolor** and **-borderwidth**.
#
# **-state**          Specifies the state for the widget.
#                     May be set to **normal** or **disabled** to control the disabled state bit.
#                     This is a write-only option: setting it changes the widget state,
#                     but the state widget command does not affect the *-state* option.
#
#                     If not provided, defaults to **normal**.
#
# **-style**          Specifies a custom widget style.
#                     If not provided, defaults to **TLabel**.
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
#                     Note: Widgets will ignore any takefocus values while in the **disabled** state.
#                           The moment the widget becomes **normal** the takefocus specified will be taken into consideration.
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
#                     See also **-compound**, **-image** and **-textvariable**.
#
# **-textvariable**   Specifies the name of a global variable whose value will be used in place of the *-text* resource.
#                     The variable should already exist at the time the widget is created or this option will be ignored.
#
#                     If provided, mustang will perform no automatic translations (in any scenario).
#                     If not provided, defaults to the empty string.
#
#                     See also **-compound**, **-image** and **-text**.
#
# **-underline**      If set, specifies the index of a character to underline in the text string.
#                     The underlined character is used for mnemonic activation.
#
#                     If not provided, defaults to **-1** (meaning no underline or mnemonic activation will be performed).
#
# **-wraplength**     Specifies the maximum line length.
#                     The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                     (pixels, points, inches, millimeters or centimeters).
#                     If this option is less than or equal to zero then automatic wrapping is not performed, otherwise
#                     the text is split into lines such that no line is longer than the specified value.
#
#                     Note: This is a styleable option.
#
#                           If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                    Only the developer can.
#
#                           If it's not provided --> The widget will follow the **-wraplength** specified in its style.
#                                                    If there isn't one, the **-wraplength** of the **TLabel** style
#                                                    will be used instead.
#                                                    The **-wraplength** will always abide by its mapping values, if any.
#                                                    Styles, mappings and states events are allowed to change its value.
#
#### WIDGET COMMAND:
#
# The label command creates a new command whose name is the same as the pathname of the label's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the label widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for label widgets:
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the label command (See **WIDGET OPTIONS**).
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
#     Returns the name of the element under the point given by *x* and *y*, or an empty string if the mouse pointer does not lie within any element.
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
# The label widget supports the **disabled** and **normal** state.
#
#### STYLING OPTIONS:
#
# Default style name: **TLabel**
#
# Every label styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the labels in order to facilitate the developer work and
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
# 1.  The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the previous
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
#   # Create a label.
#   label .l     -state normal \
#                -style TLabel \
#            -takefocus 0 \
#                 -text "My label text" \
#            -underline -1;
#
#   pack .l -anchor nw \
#           -expand false \
#             -fill none \
#             -padx [list 15 15] \
#             -pady [list 15 15] \
#             -side top;
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
package provide ::ms::label 0.1

#############################
##                         ##
##     _LABEL BINDINGS     ##
##                         ##
#############################

# Activate/Deactivate
_bind _Label <Activate>   { ::ms::label::Pathname_Cmd %W state !background; break }
_bind _Label <Deactivate> { ::ms::label::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Label <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Label <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Label <Destroy> { ::ms::label::Destroy %W; break }

# Enter/Leave
_bind _Label <Enter> { ::ms::label::Pathname_Cmd %W state  hover; break }
_bind _Label <Leave> { ::ms::label::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Label <FocusIn>  { ::ms::label::FocusIn  %W; break }
_bind _Label <FocusOut> { ::ms::label::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Label <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Label <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Label <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Label <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Label <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Label <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **label** package.
namespace eval ::ms::label {
    # Set the 'non styleable' label option list.
    set ::ms::label(non_styleable,options) [list class \
                                                 cmenu \
                                                 state \
                                                 style \
                                                 takefocus \
                                                 text \
                                                 textvariable \
                                                 underline];

    # Set the 'styleable' label option list.
    set ::ms::label(styleable,options) [list anchor \
                                             background \
                                             bordercolor \
                                             borderwidth \
                                             charwidth \
                                             compound \
                                             cursor \
                                             darkcolor \
                                             font \
                                             foreground \
                                             image \
                                             justify \
                                             lightcolor \
                                             padding \
                                             relief \
                                             wraplength];

    # Set the default 'non-styleable' label options values.
    set ::ms::default(label,class)        TLabel
    set ::ms::default(label,cmenu)        {}
    set ::ms::default(label,state)        normal
    set ::ms::default(label,style)        TLabel
    set ::ms::default(label,takefocus)    0
    set ::ms::default(label,text)         {}
    set ::ms::default(label,textvariable) {}
    set ::ms::default(label,underline)    -1

    # Note: The default 'styleable' label options values are always defined inside the current theme.
}

# Rename the original Tk **label** and **ttk::label** commands.
rename label      _label
rename ttk::label _ttk_label

# Create aliases for the mustang **label** command.
interp alias {} label      {} ::ms::label::Command
interp alias {} ttk::label {} ::ms::label::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **label** and **ttk::label** widgets commands.
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
proc ::ms::label::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(label,class)
            set ::ms::default($w,cmenu)        $::ms::default(label,cmenu)
            set ::ms::default($w,state)        $::ms::default(label,state)
            set ::ms::default($w,style)        $::ms::default(label,style)
            set ::ms::default($w,takefocus)    $::ms::default(label,takefocus)
            set ::ms::default($w,text)         $::ms::default(label,text)
            set ::ms::default($w,textvariable) $::ms::default(label,textvariable)
            set ::ms::default($w,underline)    $::ms::default(label,underline)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(label,class)
            set ::ms::current($w,cmenu)        $::ms::default(label,cmenu)
            set ::ms::current($w,state)        $::ms::default(label,state)
            set ::ms::current($w,style)        $::ms::default(label,style)
            set ::ms::current($w,takefocus)    $::ms::default(label,takefocus)
            set ::ms::current($w,text)         $::ms::default(label,text)
            set ::ms::current($w,textvariable) $::ms::default(label,textvariable)
            set ::ms::current($w,underline)    $::ms::default(label,underline)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) label

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
            #       To make a label styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **label** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,anchor)      Tk
            set ::ms::managed_by($w,background)  Tk
            set ::ms::managed_by($w,bordercolor) Tk
            set ::ms::managed_by($w,borderwidth) Tk
            set ::ms::managed_by($w,charwidth)   Tk
            set ::ms::managed_by($w,compound)    Tk
            set ::ms::managed_by($w,cursor)      Tk
            set ::ms::managed_by($w,darkcolor)   Tk
            set ::ms::managed_by($w,font)        Tk
            set ::ms::managed_by($w,foreground)  Tk
            set ::ms::managed_by($w,image)       Tk
            set ::ms::managed_by($w,justify)     Tk
            set ::ms::managed_by($w,lightcolor)  Tk
            set ::ms::managed_by($w,padding)     Tk
            set ::ms::managed_by($w,relief)      Tk
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
                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                            set ::ms::current($w,cmenu) $value
                        }
                    }
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
                            # If not, create one by mirroring the current theme 'TLabel' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TLabel]
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
                            1   { set ::ms::current($w,textvariable) $value }
                        }
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
            foreach option $::ms::label(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TLabel,$option)

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

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'anchor', 'borderwidth', 'charwidth', 'compound', 'cursor', 'font', 'justify', 'padding',
            #       'relief' and 'wraplength' are not allowed to change if the statespec changes.

            ###################
            ##               ##
            ##     LABEL     ##
            ##               ##
            ###################

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                   "_fg=" $::ms::current($w,foreground) \
                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                   "." $::ms::current($w,style)];

            # If needed, create the widget style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                              -foreground $::ms::current($w,foreground) \
                                                              -lightcolor $::ms::current($w,lightcolor);

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

            # Create the label widget.
            _ttk_label $w       -anchor $::ms::current($w,anchor) \
                           -borderwidth $::ms::current($w,borderwidth) \
                                 -class $::ms::current($w,class) \
                              -compound $::ms::current($w,compound) \
                                -cursor $cursor \
                                  -font $::ms::current($w,font) \
                                 -image $::ms::current($w,image) \
                               -justify $::ms::current($w,justify) \
                               -padding $::ms::current($w,padding) \
                                -relief $::ms::current($w,relief) \
                                 -state $::ms::current($w,state) \
                                 -style $::ms::style($w,widget) \
                             -takefocus $takefocus \
                                  -text "" \
                          -textvariable $text_variable \
                             -underline $::ms::current($w,underline) \
                                 -width $::ms::current($w,charwidth) \
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
                TLabel  { bindtags $w [list $w _Label TLabel $::ms::addr($w,toplevel) all] }
                default { bindtags $w [list $w $::ms::current($w,class) _Label TLabel $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::label::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::label::Pathname_Cmd $w]
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

            # Add the widget address to the label widgets real address list.
            lappend ::ms::addr(label) $w

            # Add the widget address to the label classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),label,addrs) $w

            # Add the widget address to the label classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),label,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the label classtype.
            if { $::ms::current($w,style) ni $::ms::style(label,classtype) } {
                lappend ::ms::style(label,classtype) $::ms::current($w,style)
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
# w      Should be the widget address involved.
#
# cmd    Should be the widget command to use.
#        The aliased command will provided this data.
#
# args   Contains the options needed by the 'cmd', if any.
#        The aliased command will provided this data.
#
# Returned values depends on the 'cmd' provided.
proc ::ms::label::Pathname_Cmd { w cmd args } {
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
                    set option [string range $args 1 end]
                    if { ($option in $::ms::label(non_styleable,options)) || ($option in $::ms::label(styleable,options))} {
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
                    foreach option $::ms::label(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::label(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::label(non_styleable,options)) || ($option in $::ms::label(styleable,options)) } {
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
                                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                                            set ::ms::current($w,cmenu) $value
                                        }
                                    }
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
                                            # If not, create one by mirroring the current theme 'TLabel' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TLabel]
                                            }

                                            # Remove the widget address from the label real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),label,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),label,addrs) [lremove $::ms::style($::ms::current($w,style),label,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,label,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the label classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),label,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(label,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(label,classtype) [lremove $::ms::style(label,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the label classtype.
                                            if { $value ni $::ms::style(label,classtype) } {
                                                lappend ::ms::style(label,classtype) $value
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
                                            1   { set ::ms::current($w,textvariable) $value }
                                        }
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
                                    -wraplength {
                                        switch -- [string is integer -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,wraplength)    $value
                                        set ::ms::managed_by($w,wraplength) developer
                                    }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::label(styleable,options) {
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

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'anchor', 'borderwidth', 'charwidth', 'compound', 'cursor', 'font', 'justify', 'padding',
                            #       'relief' and 'wraplength' are not allowed to change if the statespec changes.

                            ###################
                            ##               ##
                            ##     LABEL     ##
                            ##               ##
                            ###################

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                                   "_fg=" $::ms::current($w,foreground) \
                                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                                   "." $::ms::current($w,style)];

                            # If needed, create the widget style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                                              -foreground $::ms::current($w,foreground) \
                                                                              -lightcolor $::ms::current($w,lightcolor);

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
                            interp invokehidden {} $w configure       -anchor $::ms::current($w,anchor) \
                                                                 -borderwidth $::ms::current($w,borderwidth) \
                                                                    -compound $::ms::current($w,compound) \
                                                                      -cursor $cursor \
                                                                        -font $::ms::current($w,font) \
                                                                       -image $::ms::current($w,image) \
                                                                     -justify $::ms::current($w,justify) \
                                                                     -padding $::ms::current($w,padding) \
                                                                      -relief $::ms::current($w,relief) \
                                                                       -state $::ms::current($w,state) \
                                                                       -style $::ms::style($w,widget) \
                                                                   -takefocus $takefocus \
                                                                -textvariable $text_variable \
                                                                   -underline $::ms::current($w,underline) \
                                                                       -width $::ms::current($w,charwidth) \
                                                                  -wraplength $::ms::current($w,wraplength);

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        identify {
            switch -- [llength $args] {
                3   {
                    try {
                        interp invokehidden {} $w identify {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -nocase -- $result {
                            label { set result "Label.label" }
                        }

                        return $result
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
# Update any label widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::label::Style_Update { stylename caller_info } {
    # Update all the label widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,label,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::label(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TLabel,$option)

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

        # Note: 'anchor', 'borderwidth', 'charwidth', 'compound', 'cursor', 'font', 'justify', 'padding',
        #       'relief' and 'wraplength' are not allowed to change if the statespec changes.

        ###################
        ##               ##
        ##     LABEL     ##
        ##               ##
        ###################

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                               "_bc=" $::ms::current($w,bordercolor) \
                                               "_dc=" $::ms::current($w,darkcolor) \
                                               "_fg=" $::ms::current($w,foreground) \
                                               "_lc=" $::ms::current($w,lightcolor) \
                                               "." $stylename];

        # If needed, create the widget style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            # Create the child style.
            _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                         -bordercolor $::ms::current($w,bordercolor) \
                                                           -darkcolor $::ms::current($w,darkcolor) \
                                                          -foreground $::ms::current($w,foreground) \
                                                          -lightcolor $::ms::current($w,lightcolor);

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

        # If needed, create the widget mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,widget) {*}$mapping

            # Add the widget mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        interp invokehidden {} $w configure      -anchor $::ms::current($w,anchor) \
                                            -borderwidth $::ms::current($w,borderwidth) \
                                               -compound $::ms::current($w,compound) \
                                                 -cursor $cursor \
                                                   -font $::ms::current($w,font) \
                                                  -image $::ms::current($w,image) \
                                                -justify $::ms::current($w,justify) \
                                                -padding $::ms::current($w,padding) \
                                                 -relief $::ms::current($w,relief) \
                                                  -style $::ms::style($w,widget) \
                                                  -width $::ms::current($w,charwidth) \
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
# w   Should be the widget address involved.
#
# It doesn't return anything.
proc ::ms::label::Destroy { w } {
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

    # Remove the widget address from the label widgets real address list.
    set index [lsearch -exact $::ms::addr(label) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(label) [lremove $::ms::addr(label) $index] }
    }

    # Remove the widget address from the label real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),label,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),label,addrs) [lremove $::ms::class($::ms::current($w,class),label,addrs) $index] }
    }

    # Remove the widget address from the label real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),label,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),label,addrs) [lremove $::ms::style($::ms::current($w,style),label,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the label classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),label,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(label,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(label,classtype) [lremove $::ms::style(label,classtype) $index] }
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

    unset -nocomplain -- ::ms::current($w,anchor) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,charwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,compound) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,image) \
                         ::ms::current($w,justify) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,text) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,underline) \
                         ::ms::current($w,wraplength);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token) \
                         ::ms::data($w,translated_text);

    unset -nocomplain -- ::ms::default($w,anchor) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,charwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,compound) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,image) \
                         ::ms::default($w,justify) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,text) \
                         ::ms::default($w,textvariable) \
                         ::ms::default($w,underline) \
                         ::ms::default($w,wraplength);

    unset -nocomplain -- ::ms::managed_by($w,anchor) \
                         ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,charwidth) \
                         ::ms::managed_by($w,compound) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,image) \
                         ::ms::managed_by($w,justify) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,padding) \
                         ::ms::managed_by($w,relief) \
                         ::ms::managed_by($w,wraplength);

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
proc ::ms::label::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::label::Pathname_Cmd $w state focus

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
proc ::ms::label::FocusOut { w } {
    # Check the contextual menu associated with this widget, if any.
    set cmenu $::ms::current($w,cmenu)
    switch -- $cmenu {
        ""  {
            # Check if a contextual menu was associated with the widget's toplevel.
            set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu)
            switch -- $cmenu {
                ""      {}
                default {
                    # If the contextual menu of the widget's toplevel is open do not loose the focus (graphically).
                    switch -- [_winfo exists $cmenu] {
                        1   { return "" }
                    }
                }
            }
        }
        default {
            # If the contextual menu of the widget is open do not loose the focus (graphically).
            switch -- [_winfo exists $cmenu] {
                1   { return "" }
            }
        }
    }

    # Change the widget dynamic state to '!focus'.
    ::ms::label::Pathname_Cmd $w state !focus

    return ""
}

#*EOF*