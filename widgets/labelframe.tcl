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

## labelframe
#
#### DESCRIPTION:
#
# A labelframe widget is a container (used to group other widgets together) with a label
# along the top of it's border.
#
# The labelframe command returns the pathname of the new window.
#
# Note 1: At the time this command is invoked, there must not exist a window with the same pathname,
#         but the pathname's parents must exists.
#         *Window* may be provided either as a short or as a real address, the address returned will be:
#            - A short address, if the *window* provided as input is a short address.
#            - A real address, if the *window* provided as input is a real address.
#
# Note 2: Depending on the **-scrollable** option value, two kinds of labelframe structures are possible.
#         The mustang simple labelframe (**-scrollable** false) is a megawidget composed by an hull object (the megawidget container),
#         a title object and a frame object (the content).
#         The mustang scrollable labelframe (**-scrollable** true) is a megawidget composed by an hull object (the megawidget container),
#         a title object, a container object (an internal container) a border object, a viewport object, a frame object (the content)
#         and two scrollbar objects (displayed only when needed).
#
# Note 3: The mustang labelframe widget is a complete rewrite of its Tk counterpart (with no Tk labelframes involved).
#
# Additional options, described below, may be specified on the command line to configure aspects of the labelframe.
#
#### SYNOPSIS:
#
#   **labelframe**  *window* ?*option value*? ... ?*option value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-anchor**                 Specifies where to anchor the labelframe title.
#                             Allowed values:
#                                 "ne"     -
#                                 "e"      --> means 'left'.
#                                 "nw"     -
#                                 "w"      --> means 'right'.
#                                 "ew"     -
#                                 "we"     -
#                                 "n"      -
#                                 "center" --> means 'centered'.
#
#                             Note: This is a stylable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the '*-anchor*' specified in its style.
#                                                            If there isn't one, the '*-anchor*' of the **TLabelframe** style will be used instead.
#                                                            The **-anchor** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
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
#                                                            If there isn't one, the **-background** of the **TLabelrame** style
#                                                            will be used instead.
#                                                            The **-background** will always abide by its mapping values, if any.
#                                                            Styles, mappings and states events are allowed to change its value.
#
#                             See also **-shellbackground** and **-foreground**.
#
# **-bordercolor**            It's a list that specifies the color to use as bordercolor.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: It's only meaningful for widgets with a **solid** or **flat** relief.
#
#                             Note: It's only meaningful for themes that use the 'clam' engine (like the 'Halo' theme).
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-bordercolor** specified in its style.
#                                                            If there isn't one, the **-bordercolor** of the **TLabelframe** style
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
#                             Note: **0** is not accepted as a valid value, labelframes will always be bordered.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-borderwidth** specified in its style.
#                                                            If there isn't one, the **-borderwidth** of the **TLabelframe** style
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
#                             If not provided, defaults to **TLabelframe**.
#
# **-cmenu**                  Specifies the contextual menu address that will be assigned to the widget.
#
#                             The contextual menu will be assign to the *content* and *border* objects of the megawidget.
#                             If the *cmenu* value is the empty string or invalid, the contextual menu of the widget's toplevel (if any)
#                             will be used instead. If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                             The *hull*, *title* and *container* objects will rather use the contextual menu of the widget's toplevel,
#                             if any. If the developer needs a different contextual menu for these objects a variable called
#                             '::ms::data($short_addr,cmenu,shell)' can be set with a valid contextual menu address in order to be
#                             used instead of the toplevel one.
#
#                             Note: '$short_addr' must be the short address of the text widget.
#                                   See the [tk](/wiki/commands/tk.md) command to know more about short and real address.
#
#                             If '::ms::data($short_addr,cmenu,shell)' is set with an empty string or with an invalid contextual
#                             menu address, it will be ignored and the contextual menu of the widget's toplevel (if any) will be used.
#                             If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                             The *viewport* and the *scrollbar* objects are not supposed to have a contextual menu and
#                             will not be link with any.
#
# **-compound**               Specifies if the labelframe title should display text and images at the same time, and if so, where the image
#                             should be placed relative to the text.
#                             Allowed values:
#                                 **text**   --> Display the text only.
#                                 **image**  --> Display the image only.
#                                 **center** --> Display the text centered on top of the image.
#                                 **top**    --> Display the image above the text.
#                                 **bottom** --> Display the image below the text.
#                                 **left**   --> Display the image before the text.
#                                 **right**  --> Display the image after the text.
#                                 **none**   --> Display the image if present, otherwise the text.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-compound** specified in its style.
#                                                            If there isn't one, the **-compound** of the **TLabelframe** style
#                                                            will be used instead.
#                                                            The **-compound** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-image**, **-text** and **-textvariable**.
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
#                                                            If there isn't one, the **-cursor** of the **TLabelframe** style
#                                                            will be used instead.
#                                                            The **-cursor** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
# **-darkcolor**              It's a list that specifies the color to use as darkcolor.
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
#                                   If it's not provided --> The widget will follow the **-darkcolor** specified in its style.
#                                                            If there isn't one, the **-darkcolor** of the **TLabelframe** style
#                                                            will be used instead.
#                                                            The **-darkcolor** will always abide by its mapping values, if any.
#                                                            Styles, mappings and states events are allowed to change its value.
#
#                             See also **-lightcolor**.
#
# **-height**                 Specifies the desired height for the widget in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                             (pixels, points, inches, millimeters and centimeters).
#
#                             Note that labelframes will ignore height of '0'.
#                             This restriction is not necessary on Linux (or BSD), but in order to have the same behaviour across operating systems
#                             a height value of '0' will not be accepted for labelframes.
#
#                             Note: "WINDOW MANAGERS"
#
#                                 Any toplevel is managed by the *window manager*.
#                                 Any widget's program-requested height may cause it's toplevel to change it's height as well.
#                                 If the toplevel program-requested height is ignored (by the window manager),
#                                 then any widget's program-requested height is ignored too (by Tk that follows the istructions
#                                 received by the 'window manager').
#
#                                 Some window managers ignores any toplevel program-requested height and demands only to the
#                                 user to manually change the toplevel's height.
#
#                                 Some window managers allows any toplevel program-requested height until the user will
#                                 manually change the toplevel's height.
#                                 Once the user has manually changed the toplevel's height, any subsequent toplevel program-requested
#                                 height will be ignored.
#
#                                 Others window managers allows any toplevel program-requested height in any circumstances.
#
#                             "Tk"
#
#                                 Tk ignores any widget's program-requested height if the **grid** or **pack** geometry manager is used
#                                 within the widget, since these geometry managers will override the widget's height in those cases.
#
#                             If not provided, defaults to **500** pixels.
#
#                             See also **-width**.
#
# **-font**                   Specifies the font to use for the labelframe title displayed by the widget.
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
#                                                            If there isn't one, the **-font** of the **TLabelframe** style
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
#                                                            If there isn't one, the **-foreground** of the **TLabelframe** style
#                                                            will be used instead.
#                                                            The **-foreground** will always abide by its mapping values, if any.
#                                                            Styles, mappings and states events are allowed to change its value.
#
#                             See also **-background** and **-font**.
#
# **-image**                  Specifies an image to display. This is a list of one or more elements.
#                             The first element is the default image name. The rest of the list is a sequence of statespec/value pairs as per
#                             style map, specifying different images to use when the widget is in a particular state or combination of states.
#
#                             Note that all images in the list should have the same size.
#
#                             If an empty string is specified, it indicates that the widget has no image to display.
#                             The image specified should have been already created at the time the widget is created.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-image** specified in its style.
#                                                            If there isn't one, the **-image** of the **TLabelframe** style
#                                                            will be used instead.
#                                                            The **-image** will not abide by its mapping values, if any.
#                                                            Its mapping values must be specified as stated above, even in styles.
#
#                             See also **-compound**, **-text** and **-textvariable**.
#
# **-lightcolor**             It's a list that specifies the color to use as lightcolor.
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
#                                   If it's not provided --> The widget will follow the **-lightcolor** specified in its style.
#                                                            If there isn't one, the **-lightcolor** of the **TLabelframe** style
#                                                            will be used instead.
#                                                            The **-lightcolor** will always abide by its mapping values, if any.
#                                                            Styles, mappings and states events are allowed to change its value.
#
#                             See also **-darkcolor**.
#
# **-padding**                Specifies the internal padding for the labelframe content.
#                             The padding is a list of up to four length specifications.
#                             The values must be in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                             (pixels, points, inches, millimeters or centimeters).
#
#                             A list of four values specifies the left, top, right and bottom padding.
#                             A list of three values specifies the left, vertical, and right padding.
#                             A list of two values specifies the horizontal and the vertical padding
#                             A single value specifies the same padding all the way around the widget.
#
#                             When computing how large a window it needs, the widget will add this amount to the width it would
#                             normally need (as determined by the width of the things displayed in the widget).
#                             If the geometry manager can satisfy this request, the widget will end up with extra internal space
#                             to the left and/or right of what it displays inside.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-padding** specified in its style.
#                                                            If there isn't one, the **-padding** of the **TLabelframe** style
#                                                            will be used instead.
#                                                            The **-padding** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
# **-relief**                 Specifies the three-dimensional effect desired for the widget.
#                             The value indicates how the widget's interior should appear relative to its exterior.
#                             For example, *raised* means the widget's interior should appear to protrude from the screen,
#                             relative to the exterior of the widget.
#
#                             The widget will accept as relief any of the following values:
#                                **groove**,
#                                **raised**,
#                                **ridge**,
#                                **solid**,
#                                **sunken**.
#
#                             Note that labelframes don't support **flat** reliefs, they are supposed to be bordered.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-relief** specified in its style.
#                                                            If there isn't one, the **-relief** of the **TLabelframe** style
#                                                            will be used instead.
#                                                            The **-relief** will not abide by its mapping values, if any.
#                                                            It is not supposed to change when the widget state changes.
#
#                             See also **-bordercolor** and **-borderwidth**.
#
# **-scrollable**             Specifies a boolean value indicating wheter or not the widget should be scrollable.
#                             If **true**, a megawidget structure (with two scrollbars) will be constructed instead of a single canvas widget.
#
#                             The scrollbars will be automatically managed by Tk with the following rules:
#                                The horizontal scrollbar is defined to be *needed* each time the widget *content* width is bigger then
#                                the widget *viewport* width and *not needed* when it's not.
#
#                                The vertical scrollbar is defined to be *needed* each time the widget *content* height is bigger then
#                                the widget *viewport* height and *not needed* when it's not.
#
#                                If a scrollbar is currently needed, then it will be displayed (if it's not already displayed).
#                                If a scrollbar is not currently needed, then it will not be displayed (or removed if it was
#                                already displayed).
#
#                             Note: This option may be provided while creating the widget.
#                                   Attempts to change this value after the widget was created by using the **configure** command,
#                                   will be ignored by mustang.
#
#                             If not provided, defaults to **false** (meaning no scrollbar).
#
# **-shellbackground**        It's a list that specifies the color to use as background structure.
#                             This color will be used in the interspaces between the mustang objects that compose the labelframe
#                             and should reflects the widget's parent background.
#                             See the **COLOR OPTION** section to know how this list should be composed.
#
#                             Note: This is a styleable option.
#
#                                   If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                            Only the developer can.
#
#                                   If it's not provided --> The widget will follow the **-shellbackground** specified in its style.
#                                                            If there isn't one, the **-shellbackground** of the **TLabelframe** style
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
#
#                             Note: Labelframes have only the **normal** state.
#
#                             Note: This option will be ignored if provided while creating the widget.
#                                   Attempts to change this value after the widget was created, by using the **configure** command,
#                                   will be ignored by mustang.
#
#                             It's set to **normal**.
#
# **-style**                  Specifies a custom widget style.
#                             If not provided, defaults to **TLabelframe**.
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
#                             If not provided, defaults to **0**.
#
# **-text**                   Specifies a list containing the *text string* that will be displayed inside the labelframe title.
#                             The list should contain a *text string* as the first element, followed by any substitution strings
#                             required to form the actual *text string* as separated elements.
#
#                             If a *-textvariable* is not provided as well, the *text string* will be translated automatically
#                             by mustang each time a widget is created and each time the current language changes.
#
#                             In order to do so, mustang requires two things:
#                                 1 - The text string should be provided in English (*en*).
#
#                                     If presents, each of the substitution strings will substitute a single *%s*,
#                                     and their numbers depend on how many *%s* are contained in the text string itself.
#
#                                     Note1:  If there is no *%s* in the text string, then there's no need to provide any
#                                             substitution strings.
#
#                                     Note2:  Each substitution string will be used verbatim (no translation will be performed on them).
#
#                                     Example1: No substitution string (single word)
#
#                                             -text [list "Settings:"]    or just     -text "Settings:"
#
#                                     Example2: No substitution string (multiple words)
#
#                                             -text [list "My Settings:"]
#
#                                     Example3: One substitution string
#
#                                             -text [list "The %s command is invalid." grid]
#
#                                     Example4: Multiple substitution strings
#
#                                             -text [list "The %s command address is invalid: '%s'" grid .myapp]
#
#                                     ...
#
#                                 2 - A message catalog should be provided with all the translations needed by the application and
#                                     each language file present in the catalog, should have its translation defined in the
#                                     **::ms** or in the **global** namespace.
#
#                             If these requirements are not both satisfied, mustang will not do any translation.
#
#                             If not provided, defaults to the empty string.
#
#                             See also **-compound**, **-image** and **-textvariable**.
#
# **-textvariable**           Specifies the name of a global variable whose value will be used in place of the *-text* resource.
#                             The variable should already exist at the time the widget is created or this option will be ignored.
#
#                             If provided, mustang will perform no automatic translations (in any scenario).
#                             If not provided, defaults to the empty string.
#
#                             See also **compound**, **-image** and **-text**.
#
# **-width**                  Specifies the desired width for the widget in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                             (pixels, points, inches, millimeters and centimeters).
#
#                             Note that labelframes will ignore width of '0'.
#                             This restriction is not necessary on Linux (or BSD), but in order to have the same behaviour across operating systems
#                             a width value of '0' will not be accepted for labelframes.
#
#                             Note: "WINDOW MANAGERS"
#
#                                       Any toplevel is managed by the *window manager*.
#                                       Any widget's program-requested width may cause it's toplevel to change it's width as well.
#                                       If the toplevel program-requested width is ignored (by the window manager),
#                                       then any widget's program-requested width is ignored too (by Tk that follows the istructions
#                                       received by the window manager).
#
#                                       Some window managers ignores any toplevel program-requested width and demands only to the
#                                       user to manually change the toplevel's width.
#
#                                       Some window managers allows any toplevel program-requested width until the user will
#                                       manually change the toplevel's width.
#                                       Once the user has manually changed the toplevel's width, any subsequent toplevel program-requested
#                                       width will be ignored.
#
#                                       Others window managers allows any toplevel program-requested width in any circumstances.
#
#                                   "Tk"
#
#                                       Tk ignores any widget's program-requested width if the **grid** or **pack** geometry manager is used
#                                       within the widget, since these geometry managers will override the widget's width in those cases.
#
#                             If not provided, defaults to **500** pixels.
#
#                             See also **-height**.
#
# **-xscrollincrement**       Specifies an integer indicating the increment for horizontal scrolling.
#                             If the value of this option is greater than zero, the horizontal view in the widget will be constrained so
#                             that the labelframe *x* coordinate at the left edge of the widget is always an even multiple of **xScrollIncrement**;
#                             furthermore, the units for scrolling (e.g., the change in view when the left and right arrows of a
#                             scrollbar are selected) will also be **xScrollIncrement**. If the value of this option is zero, then
#                             horizontal scrolling is unconstrained.
#
#                             Note: The *-xscrollincrement* is meaningless and will be ignored for labelframe that are not scrollable.
#
#                             If not provided, defaults to **0**.
#
# **-yscrollincrement**       Specifies an integer indicating the increment for vertical scrolling.
#                             If the value of this option is greater than zero, the vertical view in the widget will be constrained so
#                             that the labelframe *y* coordinate at the left edge of the widget is always an even multiple of **xScrollIncrement**;
#                             furthermore, the units for scrolling (e.g., the change in view when the left and right arrows of a
#                             scrollbar are selected) will also be **yScrollIncrement**. If the value of this option is zero, then
#                             vertical scrolling is unconstrained.
#
#                             Note: The *-xscrollincrement* is meaningless and will be ignored for labelframe that are not scrollable.
#
#                             If not provided, defaults to **0**.
#
#### WIDGET COMMAND:
#
# The labelframe command creates a new command whose name is the same as the pathname of the labelframe's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the labelframe widget's pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for labelframe widgets:
#
#   *window* **cget** *option*
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the labelframe command (See **WIDGET OPTIONS**).
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
#   *window* **see** *widget*
#     Adjust the view of *window* so that the address given by *widget*, a child of *window* (direct or not),
#     will be visible. If *widget* is already visible then the command has no effect.
#
#     Returns an empty string.
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
#### STATES:
#
# The labelframe widget supports only the **normal** state.
#
#### STYLING OPTIONS:
#
# Default style name: **TLabelframe**
#
# An optional style **TLabelframe.Label** is used to configure the labelframe title.
#
# Every labelframe styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# Some labelframe title options are managed by the **TLabelframe.Label** style.
# The following labelframe title options are supported and configurable with the [style](/wiki/commands/style.md) command:
#
#   **-background** *color*
#   **-bordercolor** *color*
#   **-borderwidth** *size*
#   **-darkcolor** *color*
#   **-lightcolor** *color*
#   **-padding** *amount*
#   **-labelwidth** *amount*
#   **-relief** *relief*
#
# Note: Some options are only available for specific themes.
#
# If you use a different style for your labelframe (for example **MyStyle**) than **TLabelframe**, you should provide a title style
# as well (**MyStyle.Label**), otherwise the **TLabelframe.Label** will be used to style your labelframe's title.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the labelframes in order to facilitate the developer work and
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
######## SIMPLE LABELFRAME:
#
# 1.  **MouseWheel** events will try to find the innermost widget scrollable parent with an active vertical scrollbar and move
#     that scrollbar by one unit up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 2.  **Shift-MouseWheel** events will try to find the innermost widget scrollable parent with an active horizontal scrollbar
#     and move that scrollbar by one unit left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 3.  **Control-MouseWheel** events will try to find the innermost widget scrollable parent with an active vertical scrollbar
#     and move that scrollbar by one page up or down (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 4.  **Control-Shift-MouseWheel** events will try to find the innermost widget scrollable parent with an active horizontal
#     scrollbar and move that scrollbar by one page left or right (depending on the mousewheel direction).
#     If none of the widget's parents meets the required condition, nothing will happen.
#
# 5.  **TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#        1 - **TouchpadScroll** events along the X axis will try to find the innermost widget scrollable parent with an active
#            horizontal scrollbar and move that scrollbar by one unit towards the left or the right (depending on the direction
#            of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - **TouchpadScroll** events along the Y axis will try to find the innermost widget scrollable parent with an active
#            vertical scrollbar and move that scrollbar by one unit towards the top or the bottom (depending on the direction
#            of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 6.  **Control-TouchpadScroll** events may happen on two different planes, horizontal and vertical.
#     These two planes may involve different widgets depending on the active scrollbars on them and on the touchpad directions.
#
#        1 - **Control-TouchpadScroll** events along the X axis will try to find the innermost widget scrollable parent with an
#            active horizontal scrollbar and move that scrollbar by one page towards the left or the right (depending on the
#            direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the horizontal axis.
#
#        2 - **Control-TouchpadScroll** events along the Y axis will try to find the innermost widget scrollable parent with an
#            active vertical scrollbar and move that scrollbar by one page towards the top or the bottom (depending on the
#            direction of the touchpad event).
#            If none of the widget's parents meets the required condition, nothing will happen on the vertical axis.
#
# 7.  **ContextMenu** events will display the contextual menu associated with the widget.
#     See the **-cmenu** option for more details.
#
######## SCROLLABLE LABELFRAME:
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
# 1.  If the current theme follows the **clam** engine (like the 'Halo' theme) and the widget styleable options (**-borderwidth** and
#     **-bordercolor**) allows it, everytime the mouse cursor enters the widget it will illuminate its borders to visually indicate
#     that the user is inside the widget.
#
# The following behavior will happen if the widget has the focus or if one of its children has the focus but do not have a direct
# binding action setted for the key involved.
#
# Note: Under virtual machines, some of the bindings shortcut keys explained below may be different depending on the virtual
#       machine program used (Parallels, VirtualBox, VMWare...), on the host machine and on the virtualized operating system in use.
#
# 1.  The **Tab** key will change the focus to the next focussable widget while **Shift-Tab** key will change it to the
#     previous focussable widget.
#
# 2.  If the widget vertical scrollbar is active:
#       - **Prior**        Scrolls one page towards the top of the widget.
#       - **Next**         Scrolls one page towards the bottom of the widget.
#     If the widget vertical scrollbar is not active or not present, mustang will try to find the innermost widget scrollable parent
#     with an active vertical scrollbar and scroll that scrollbar.
#     If none of the widget's parents meets the required conditions, nothing will happen.
#
# 3.  If the widget horizontal scrollbar is active:
#       - **Control-Prior** Scrolls one page towards the right of the widget.
#       - **Control-Next**  Scrolls one page towards the left of the widget.
#     If the widget horizontal scrollbar is not active or not present, mustang will try to find the innermost widget scrollable parent
#     with an active horizontal scrollbar and scroll that scrollbar.
#     If none of the widget's parents meets the required conditions, nothing will happen.
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
#   # Create a labelframe 600x800.
#   labelframe .lb -borderwidth 2 \
#                       -height 600 \
#                       -relief solid \
#                        -style TLabelframe \
#                    -takefocus true \
#                         -text [list "My %s" Title] \
#                        -width 800;
#
#   # Focus the labelframe.
#   focus .lb
#
#   # Pack the frame and expand it in both directions.
#   pack .lb -anchor nw \
#            -expand true \
#              -fill both \
#              -padx [list 15 15] \
#              -pady [list 15 15] \
#              -side top;
#
#   # Or alternatively:
#
#       ## Pack the frame and expanding it horizontally.
#       #pack .lb -anchor center \
#       #         -expand true \
#       #           -fill x \
#       #           -padx [list 15 15] \
#       #           -pady [list 15 15] \
#       #           -side top;
#
#       ## ...or pack the frame and expanding it vertically.
#       #pack .lb -anchor center \
#       #         -expand true \
#       #           -fill y \
#       #           -padx [list 15 15] \
#       #           -pady [list 15 15] \
#       #           -side top;
#
#       ## ...or pack the frame with no expansion.
#       #pack .lb -anchor center \
#       #         -expand no \
#       #           -fill none \
#       #           -padx [list 15 15] \
#       #           -pady [list 15 15] \
#       #           -side top;
#
#   # You can also use 'grid' instead of 'pack'.
#   # If this is the case, comment the pack lines and comment out the grid lines.
#   # If this is not the case, leave the pack and grid lines as they are.
#
#       ## Grid the frame and expand it in both directions.
#       #grid .lb -column 0 \
#       #           -padx [list 15 15] \
#       #           -pady [list 15 15] \
#       #            -row 0 \
#       #         -sticky nsew;
#
#       # Or alternatively:
#
#           ## Grid the frame and expanding it horizontally.
#           #grid .lb -column 0 \
#           #           -padx [list 15 15] \
#           #           -pady [list 15 15] \
#           #            -row 0 \
#           #         -sticky ew;
#
#           ## ...or grid the frame and expanding it vertically.
#           #grid .lb -column 0 \
#           #           -padx [list 15 15] \
#           #           -pady [list 15 15] \
#           #            -row 0 \
#           #         -sticky ns;
#
#           ## ...or grid the frame with no expansion.
#           #grid .lb -column 0 \
#           #           -padx [list 15 15] \
#           #           -pady [list 15 15] \
#           #            -row 0 \
#           #         -sticky n;
#
#       ## Configure the internal toplevel rows and columns.
#       #grid rowconfigure    . [list 0] -weight 1
#       #grid columnconfigure . [list 0] -weight 1
#
#   # Create 120 labels positioned in two columns.
#   set row 0
#   set i 0
#   while { $i < 120 } {
#       label .lb.l$i -text [list "Label $i"]
#
#       grid .lb.l$i -column 0 \
#                      -padx [list 15 15] \
#                      -pady [list 15 15] \
#                       -row $row \
#                    -sticky we;
#
#       incr i
#
#       label .lb.l$i -text [list "Label $i"]
#
#       grid .lb.l$i -column 2 \
#                      -padx [list 15 15] \
#                      -pady [list 15 15] \
#                       -row $row \
#                    -sticky we;
#
#       incr row
#       incr i
#   }
#
#   # After 3 seconds, positions the viewpoint so that label 39 is visible.
#   after 3000 [list .lb see .lb.l39]
#
#   # After 6 seconds, change the accent color to orange.
#   after 6000 [list set ::ms::accent orange]
#
#   # After 9 seconds, invert the colorscheme.
#   switch -- [tk windowingsystem] {
#       aqua {
#           switch -- [wm attributes . -isdark] {
#               0   { after 9000 [list set ::ms::colorscheme dark]  }
#               1   { after 9000 [list set ::ms::colorscheme light] }
#           }
#       }
#       default { after 9000 [list set ::ms::colorscheme dark] }
#   }
package provide ::ms::labelframe 0.1

##################################
##                              ##
##     _LABELFRAME BINDINGS     ##
##                              ##
##################################

# Activate/Deactivate
_bind _Labelframe <Activate>   { ::ms::labelframe::Pathname_Cmd %W state !background; break }
_bind _Labelframe <Deactivate> { ::ms::labelframe::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Labelframe <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Labelframe <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Delete
_bind _Labelframe <Destroy> { ::ms::labelframe::Destroy %W; break }

# Enter/Leave
_bind _Labelframe <Enter> { ::ms::labelframe::Hover %W %X %Y; break }
_bind _Labelframe <Leave> { ::ms::labelframe::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Labelframe <FocusIn>  { ::ms::labelframe::FocusIn  %W; break }
_bind _Labelframe <FocusOut> { ::ms::labelframe::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Labelframe <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Labelframe <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Labelframe <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Labelframe <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Labelframe <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Labelframe <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **labelframe** package.
namespace eval ::ms::labelframe {
    # Set the labelframe 'non-styleable' labelframe option list.
    set ::ms::labelframe(non_styleable,options) [list class \
                                                      cmenu \
                                                      height \
                                                      scrollable \
                                                      state \
                                                      style \
                                                      takefocus \
                                                      text \
                                                      textvariable \
                                                      width \
                                                      xscrollincrement \
                                                      yscrollincrement];

    # Set the labelframe 'styleable' labelframe option list.
    set ::ms::labelframe(styleable,options) [list anchor \
                                                  background \
                                                  bordercolor \
                                                  borderwidth \
                                                  compound \
                                                  cursor \
                                                  darkcolor \
                                                  font \
                                                  foreground \
                                                  image \
                                                  lightcolor \
                                                  padding \
                                                  relief \
                                                  shellbackground];

    # Set the default 'non-styleable' labelframe options values.
    set ::ms::default(labelframe,class)            TLabelframe
    set ::ms::default(labelframe,cmenu)            {}
    set ::ms::default(labelframe,height)           500
    set ::ms::default(labelframe,scrollable)       false
    set ::ms::default(labelframe,state)            normal
    set ::ms::default(labelframe,style)            TLabelframe
    set ::ms::default(labelframe,takefocus)        0
    set ::ms::default(labelframe,text)             {}
    set ::ms::default(labelframe,textvariable)     {}
    set ::ms::default(labelframe,width)            500
    set ::ms::default(labelframe,xscrollincrement) 0
    set ::ms::default(labelframe,yscrollincrement) 0

    # Note: The default 'styleable' options values are always defined inside the current theme.
}

# Rename the original Tk **labelframe** and **ttk::labelframe** commands.
rename labelframe      _labelframe
rename ttk::labelframe _ttk_labelframe

# Create aliases for the mustang **labelframe** command.
interp alias {} labelframe      {} ::ms::labelframe::Command
interp alias {} ttk::labelframe {} ::ms::labelframe::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **labelframe** and **ttk::labelframe** widgets commands.
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
proc ::ms::labelframe::Command { window { args "" } } {
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
            set ::ms::default($w,class)            $::ms::default(labelframe,class)
            set ::ms::default($w,cmenu)            $::ms::default(labelframe,cmenu)
            set ::ms::default($w,height)           $::ms::default(labelframe,height)
            set ::ms::default($w,scrollable)       $::ms::default(labelframe,scrollable)
            set ::ms::default($w,state)            $::ms::default(labelframe,state)
            set ::ms::default($w,style)            $::ms::default(labelframe,style)
            set ::ms::default($w,takefocus)        $::ms::default(labelframe,takefocus)
            set ::ms::default($w,text)             $::ms::default(labelframe,text)
            set ::ms::default($w,textvariable)     $::ms::default(labelframe,textvariable)
            set ::ms::default($w,width)            $::ms::default(labelframe,width)
            set ::ms::default($w,xscrollincrement) $::ms::default(labelframe,xscrollincrement)
            set ::ms::default($w,yscrollincrement) $::ms::default(labelframe,yscrollincrement)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)            $::ms::default(labelframe,class)
            set ::ms::current($w,cmenu)            $::ms::default(labelframe,cmenu)
            set ::ms::current($w,height)           $::ms::default(labelframe,height)
            set ::ms::current($w,scrollable)       $::ms::default(labelframe,scrollable)
            set ::ms::current($w,state)            $::ms::default(labelframe,state)
            set ::ms::current($w,style)            $::ms::default(labelframe,style)
            set ::ms::current($w,takefocus)        $::ms::default(labelframe,takefocus)
            set ::ms::current($w,text)             $::ms::default(labelframe,text)
            set ::ms::current($w,textvariable)     $::ms::default(labelframe,textvariable)
            set ::ms::current($w,width)            $::ms::default(labelframe,width)
            set ::ms::current($w,xscrollincrement) $::ms::default(labelframe,xscrollincrement)
            set ::ms::current($w,yscrollincrement) $::ms::default(labelframe,yscrollincrement)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)  labelframe
            set ::ms::data($w,scrollx)    off
            set ::ms::data($w,scrolly)    off
            set ::ms::data($w,xview1)     0
            set ::ms::data($w,xview2)     1.0
            set ::ms::data($w,xview_diff) 1.0
            set ::ms::data($w,yview1)     0
            set ::ms::data($w,yview2)     1.0
            set ::ms::data($w,yview_diff) 1.0

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
            #       To make a labelframe styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **labelframe** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,anchor)          Tk
            set ::ms::managed_by($w,background)      Tk
            set ::ms::managed_by($w,bordercolor)     Tk
            set ::ms::managed_by($w,borderwidth)     Tk
            set ::ms::managed_by($w,compound)        Tk
            set ::ms::managed_by($w,cursor)          Tk
            set ::ms::managed_by($w,darkcolor)       Tk
            set ::ms::managed_by($w,font)            Tk
            set ::ms::managed_by($w,foreground)      Tk
            set ::ms::managed_by($w,image)           Tk
            set ::ms::managed_by($w,lightcolor)      Tk
            set ::ms::managed_by($w,padding)         Tk
            set ::ms::managed_by($w,relief)          Tk
            set ::ms::managed_by($w,shellbackground) Tk

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
                            ne      -
                            e       { set ::ms::current($w,anchor) ne }
                            nw      -
                            w       { set ::ms::current($w,anchor) nw }
                            n       -
                            ew      -
                            we      -
                            center  { set ::ms::current($w,anchor) n }
                            default { continue }
                        }

                        set ::ms::managed_by($w,anchor) developer
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
                            default {
                                switch -- $value {
                                    0   { continue }
                                }
                            }
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
                    -compound {
                        set value [string tolower $value]
                        switch -- $value {
                            bottom  -
                            center  -
                            image   -
                            left    -
                            none    -
                            right   -
                            text    -
                            top     {
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
                    -height {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                            default {
                                switch -- $value {
                                    0   { continue }
                                }
                            }
                        }

                        set ::ms::current($w,height) $value
                    }
                    -image {
                        switch -- [::ms::Check_Image $value] {
                            invalid { continue }
                        }

                        set ::ms::current($w,image)    $value
                        set ::ms::managed_by($w,image) developer
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
                    -shellbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,shellbackground)    $value
                        set ::ms::managed_by($w,shellbackground) developer
                    }
                    -state {}
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TLabelframe' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TLabelframe]
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
                    -width {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                            default {
                                switch -- $value {
                                    0   { continue }
                                }
                            }
                        }

                        set ::ms::current($w,width) $value
                    }
                    -xscrollincrement {
                        switch -- [string is integer -strict $value] {
                            1   { set ::ms::current($w,xscrollincrement) $value }
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
            foreach option $::ms::labelframe(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TLabelframe,$option)

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

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'anchor', 'borderwidth', 'compound', 'cursor', 'font', 'padding' and 'relief'
            #       are not allowed to change if the statespec changes.

            # Check if the height provided is zero.
            switch -- $::ms::current($w,height) {
                0   { set ::ms::current($w,height) $::ms::default($w,height) }
            }

            # Check if the width provided is zero.
            switch -- $::ms::current($w,width) {
                0   { set ::ms::current($w,width) $::ms::default($w,width) }
            }

            # Convert the current height and width in pixels.
            set ::ms::data($w,height) [::ms::Convert_Measure $::ms::current($w,height) "" $::ms::default($w,height)]
            set ::ms::data($w,width)  [::ms::Convert_Measure $::ms::current($w,width)  "" $::ms::default($w,width)]

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

            ###################
            ##               ##
            ##     TITLE     ##
            ##               ##
            ###################

            set background  $::ms::styleopt($::ms::theme,TLabelframe.Label,background)
            set bordercolor $::ms::styleopt($::ms::theme,TLabelframe.Label,bordercolor)
            set borderwidth $::ms::styleopt($::ms::theme,TLabelframe.Label,borderwidth)
            set charwidth   $::ms::styleopt($::ms::theme,TLabelframe.Label,charwidth)
            set darkcolor   $::ms::styleopt($::ms::theme,TLabelframe.Label,darkcolor)
            set lightcolor  $::ms::styleopt($::ms::theme,TLabelframe.Label,lightcolor)
            set padding     $::ms::styleopt($::ms::theme,TLabelframe.Label,padding)
            set relief      $::ms::styleopt($::ms::theme,TLabelframe.Label,relief)

            # Check if '::ms::current($w,style).Label' exists among the styles known by the current theme.
            # If not, set it as 'TLabelframe.Label'.
            set labelframe_title_style [string cat $::ms::current($w,style) ".Label"]
            if { ($labelframe_title_style in $::ms::style($::ms::theme)) && ($labelframe_title_style ne "TLabelframe.Label") } {
                # Check if a layout exists for '::ms::current($w,style).Label'.
                # If not, create one by mirroring the 'TLabelframe.Label' layout for the current theme.
                if { $labelframe_title_style ni $::ms::layouts($::ms::theme) } {
                    _ttk_style layout $labelframe_title_style [_ttk_style layout TLabelframe.Label]
                }

                # Get the labelframe title style options, if any.
                foreach option [list  background \
                                     bordercolor \
                                     borderwidth \
                                       charwidth \
                                       darkcolor \
                                      lightcolor \
                                         padding \
                                          relief] {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$labelframe_title_style,$option)] {
                        1   { set $option $::ms::styleopt($::ms::theme,$labelframe_title_style,$option) }
                    }
                }
            }

            # Set the anchor variable.
            switch -- $::ms::current($w,anchor) {
                ne  { set anchor ne }
                nw  { set anchor nw }
                n   { set anchor center }
            }

            # Set the title object style name.
            set ::ms::style($w,title) [string cat "_bg=" $background \
                                                  "_bc=" $bordercolor \
                                                  "_dc=" $darkcolor \
                                                  "_fg=" $::ms::current($w,foreground) \
                                                  "_lc=" $lightcolor \
                                                  "." $labelframe_title_style];

            # If needed, create the title object style name.
            if { $::ms::style($w,title) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,title)  -background $background \
                                                            -bordercolor $bordercolor \
                                                              -darkcolor $darkcolor \
                                                             -foreground $::ms::current($w,foreground) \
                                                             -lightcolor $lightcolor;

                # Add the title object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,title)
            }

            # Initialize the title object mapping.
            set mapping [list ]

            # background
            # Check if a 'background' mapping exists for 'labelframe_title_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,background)] {
                0   { lappend mapping -background [list pressed $background] }
                1   { lappend mapping -background $::ms::stylemap($::ms::theme,$labelframe_title_style,background) }
            }

            # bordercolor
            # Check if a 'bordercolor' mapping exists for 'labelframe_title_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor)] {
                0   { lappend mapping -bordercolor [list pressed $bordercolor] }
                1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor) }
            }

            # darkcolor
            # Check if a 'darkcolor' mapping exists for 'labelframe_title_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor)] {
                0   { lappend mapping -darkcolor [list pressed $darkcolor] }
                1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor) }
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
            # Check if a 'lightcolor' mapping exists for 'labelframe_title_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor)] {
                0   { lappend mapping -lightcolor [list pressed $lightcolor] }
                1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor) }
            }

            # If needed, create the title object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,title) {*}$mapping

                # Add the title object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the title object.
            _ttk_label $w.title       -anchor $anchor \
                                 -borderwidth $borderwidth \
                                       -class $::ms::current($w,class) \
                                    -compound $::ms::current($w,compound) \
                                      -cursor $::ms::current($w,cursor) \
                                        -font $::ms::current($w,font) \
                                       -image $::ms::current($w,image) \
                                     -justify left \
                                     -padding $padding \
                                      -relief $relief \
                                       -state $::ms::current($w,state) \
                                       -style $::ms::style($w,title) \
                                   -takefocus $::ms::current($w,takefocus) \
                                        -text "" \
                                -textvariable $text_variable \
                                   -underline -1 \
                                       -width $charwidth \
                                  -wraplength 0;

            # Pack the title object.
            _pack $w.title -anchor $::ms::current($w,anchor) \
                           -expand false \
                             -fill none \
                             -padx 0 \
                             -pady 0 \
                             -side top;

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false {
                    ###############################
                    ##                           ##
                    ##     SIMPLE LABELFRAME     ##
                    ##                           ##
                    ###############################

                    #####################
                    ##                 ##
                    ##     CONTENT     ##
                    ##                 ##
                    #####################

                    # Set the content object style name.
                    set ::ms::style($w,content) [string cat "_bg=" $::ms::current($w,background) \
                                                            "_bc=" $::ms::current($w,bordercolor) \
                                                            "_dc=" $::ms::current($w,darkcolor) \
                                                            "_lc=" $::ms::current($w,lightcolor) \
                                                            "." $::ms::current($w,style)];

                    # If needed, create the content object style name.
                    if { $::ms::style($w,content) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,content)  -background $::ms::current($w,background) \
                                                                      -bordercolor $::ms::current($w,bordercolor) \
                                                                        -darkcolor $::ms::current($w,darkcolor) \
                                                                       -lightcolor $::ms::current($w,lightcolor);

                        # Add the content object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,content)
                    }

                    # Initialize the content object mapping.
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

                    # If needed, create the content object mapping.
                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                        _ttk_style map $::ms::style($w,content) {*}$mapping

                        # Add the content object mapping to the stylemap list containing all the mappings
                        # created by mustang for the current theme.
                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                    }

                    # Create the content object.
                    _ttk_frame $w.content -borderwidth $::ms::current($w,borderwidth) \
                                                -class $::ms::current($w,class) \
                                               -cursor $::ms::current($w,cursor) \
                                               -height $::ms::data($w,height) \
                                              -padding $::ms::current($w,padding) \
                                               -relief $::ms::current($w,relief) \
                                                -style $::ms::style($w,content) \
                                            -takefocus $::ms::current($w,takefocus) \
                                                -width $::ms::data($w,width);

                    # Pack the content object.
                    _pack $w.content -anchor nw \
                                     -expand true \
                                       -fill both \
                                       -padx 0 \
                                       -pady 0 \
                                       -side top;

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        TLabelFrame { _bindtags $w [list $w _LabelFrame TLabelFrame $::ms::addr($w,toplevel) all] }
                        default     { _bindtags $w [list $w $::ms::current($w,class) _LabelFrame TLabelFrame $::ms::addr($w,toplevel) all] }
                    }

                    # ButtonPress-1
                    _bind $w.content <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }
                    _bind $w.title   <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }

                    # Contextual menu
                    _bind $w.content <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }
                    _bind $w.title   <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }

                    # Configure
                    _bind $w.content <Configure> { ::ms::labelframe::Configure [_winfo parent %W] %w %h; break }

                    # Enter/Leave
                    _bind $w.content <Enter> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.title   <Enter> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }

                    _bind $w.content <Leave> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.title   <Leave> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }

                    # FocusIn/FocusOut
                    _bind $w.content <FocusIn>  { ::ms::labelframe::FocusIn  [_winfo parent %W]; break }
                    _bind $w.content <FocusOut> { ::ms::labelframe::FocusOut [_winfo parent %W]; break }

                    # Mousewheel and Touchpad

                    # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.content <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }
                    _bind $w.title   <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }

                    # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.content <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }
                    _bind $w.title   <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }

                    # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one page up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.content <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }
                    _bind $w.title   <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }

                    # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one page left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.content <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }
                    _bind $w.title   <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }

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
                    _bind $w.content <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }
                    _bind $w.title   <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }

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
                    _bind $w.content <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }
                    _bind $w.title   <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }

                    # Add the labelframe to the related toplevel keyboard pages navigation bindings.
                    ::ms::Enable_Traversal $w

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses relative to its real address, 'w'.
                    # They will all point to the widget hull object short address.
                    set ::ms::addr($w,short)         $short_addr
                    set ::ms::addr($w.title,short)   $short_addr
                    set ::ms::addr($w.content,short) $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.title \
                                              $w.content;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.content

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.content

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.title \
                                                       $w.content];

                    # Add the widget address to the megawidget addresses list.
                    lappend ::ms::addr(megawidgets) $w

                    # Add the widget address to the megawidget container addresses list.
                    lappend ::ms::addr(megawidgets,containers) $w
                }
                true {
                    ###################################
                    ##                               ##
                    ##     SCROLLABLE LABELFRAME     ##
                    ##                               ##
                    ###################################

                    set ::ms::data($w,reqheight) $::ms::data($w,height)
                    set ::ms::data($w,reqwidth)  $::ms::data($w,width)

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

                    ###################
                    ##               ##
                    ##     TITLE     ##
                    ##               ##
                    ###################

                    # Set the title object style name.
                    set ::ms::style($w,title) [string cat "_bg=" $background \
                                                          "_bc=" $bordercolor \
                                                          "_dc=" $darkcolor \
                                                          "_fg=" $::ms::current($w,foreground) \
                                                          "_lc=" $lightcolor \
                                                          "." $labelframe_title_style];

                    # If needed, create the title object style name.
                    if { $::ms::style($w,title) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,title)  -background $background \
                                                                    -bordercolor $bordercolor \
                                                                      -darkcolor $darkcolor \
                                                                     -foreground $::ms::current($w,foreground) \
                                                                     -lightcolor $lightcolor;

                        # Add the title object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,title)
                    }

                    # Initialize the title object mapping.
                    set mapping [list ]

                    # background
                    # Check if a 'background' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,background)] {
                        0   { lappend mapping -background [list pressed $background] }
                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$labelframe_title_style,background) }
                    }

                    # bordercolor
                    # Check if a 'bordercolor' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor)] {
                        0   { lappend mapping -bordercolor [list pressed $bordercolor] }
                        1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor) }
                    }

                    # darkcolor
                    # Check if a 'darkcolor' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor)] {
                        0   { lappend mapping -darkcolor [list pressed $darkcolor] }
                        1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor) }
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
                    # Check if a 'lightcolor' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor)] {
                        0   { lappend mapping -lightcolor [list pressed $lightcolor] }
                        1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor) }
                    }

                    # If needed, create the title object mapping.
                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                        _ttk_style map $::ms::style($w,title) {*}$mapping

                        # Add the title object mapping to the stylemap list containing all the mappings
                        # created by mustang for the current theme.
                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                    }

                    # Create the title object.
                    _ttk_label $w.title       -anchor $anchor \
                                         -borderwidth $borderwidth \
                                               -class $::ms::current($w,class) \
                                            -compound $::ms::current($w,compound) \
                                              -cursor $::ms::current($w,cursor) \
                                                -font $::ms::current($w,font) \
                                               -image $::ms::current($w,image) \
                                             -justify left \
                                             -padding $padding \
                                              -relief $relief \
                                               -state $::ms::current($w,state) \
                                               -style $::ms::style($w,title) \
                                           -takefocus $::ms::current($w,takefocus) \
                                                -text "" \
                                        -textvariable $textvariable \
                                           -underline -1 \
                                               -width $charwidth \
                                          -wraplength 0;

                    # Pack the title object.
                    _pack $w.title -anchor $::ms::current($w,anchor) \
                                   -expand false \
                                     -fill none \
                                     -padx 0 \
                                     -pady 0 \
                                     -side top;

                    #######################
                    ##                   ##
                    ##     CONTAINER     ##
                    ##                   ##
                    #######################

                    # Set the container object style name.
                    set ::ms::style($w,container) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                              ".TFrame"];

                    # If needed, create the container object style name.
                    if { $::ms::style($w,container) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,container) -background $::ms::current($w,shellbackground)

                        # Add the container object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,container)
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

                    # Create the container object.
                    _ttk_frame $w.container -borderwidth 0 \
                                                  -class TFrame \
                                                 -cursor arrow \
                                                 -height 0 \
                                                -padding 0 \
                                                 -relief flat \
                                                  -style $::ms::style($w,container) \
                                              -takefocus 0 \
                                                  -width 0;

                    # Pack the container object.
                    _pack $w.container -anchor nw \
                                       -expand true \
                                         -fill both \
                                         -padx 0 \
                                         -pady 0 \
                                         -side top;

                    ####################
                    ##                ##
                    ##     BORDER     ##
                    ##                ##
                    ####################

                    # Set the border object style name.
                    set ::ms::style($w,border) [string cat "_bg=" $::ms::current($w,background) \
                                                           "_bc=" $::ms::current($w,bordercolor) \
                                                           "_dc=" $::ms::current($w,darkcolor) \
                                                           "_lc=" $::ms::current($w,lightcolor) \
                                                           ".TFrame"];

                    # If needed, create the border object style name.
                    if { $::ms::style($w,border) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,border)  -background $::ms::current($w,background) \
                                                                     -bordercolor $::ms::current($w,bordercolor) \
                                                                       -darkcolor $::ms::current($w,darkcolor) \
                                                                      -lightcolor $::ms::current($w,lightcolor);

                        # Add the border object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,border)
                    }

                    # Initialize the border object mapping.
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

                    # If needed, create the border object mapping.
                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                        _ttk_style map $::ms::style($w,border) {*}$mapping

                        # Add the border object mapping to the stylemap list containing all the mappings
                        # created by mustang for the current theme.
                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                    }

                    # Create the border object.
                    _ttk_frame $w.container.border -borderwidth $::ms::current($w,borderwidth) \
                                                         -class TFrame \
                                                        -cursor arrow \
                                                        -height 0 \
                                                       -padding 0 \
                                                        -relief $::ms::current($w,relief) \
                                                         -style $::ms::style($w,border) \
                                                     -takefocus 0 \
                                                         -width 0;

                    # Grid the border object.
                    _grid $w.container.border -column 0 \
                                                -padx 0 \
                                                -pady 0 \
                                                 -row 0 \
                                              -sticky nesw;

                    ##################################
                    ##                              ##
                    ##     VIEWPORT AND CONTENT     ##
                    ##                              ##
                    ##################################

                    # Note: The viewport and the content objects will have the same style, '::ms::style($w,content)'.

                    # Set the content and viewport objects style name.
                    set ::ms::style($w,content) [string cat "_bg=" $::ms::current($w,background) \
                                                            "." $::ms::current($w,style)];

                    # If needed, create the content and viewport objects style name.
                    if { $::ms::style($w,content) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,content) -background $::ms::current($w,background)

                        # Add the content and viewport objects style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,content)
                    }

                    # Initialize the content and viewport objects mapping.
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

                    # If needed, create the content and viewport objects mapping.
                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                        _ttk_style map $::ms::style($w,content) {*}$mapping

                        # Add the content and viewport objects mapping to the stylemap list containing all the mappings
                        # created by mustang for the current theme.
                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                    }

                    # Create the viewport object.
                    _ttk_frame $w.container.border.viewport -borderwidth 0 \
                                                                  -class TFrame \
                                                                 -cursor $::ms::current($w,cursor) \
                                                                 -height $::ms::data($w,height) \
                                                                -padding 0 \
                                                                 -relief flat \
                                                                  -style $::ms::style($w,content) \
                                                              -takefocus 0 \
                                                                  -width $::ms::data($w,width);

                    # Pack the viewport object.
                    _pack $w.container.border.viewport -anchor nw \
                                                       -expand true \
                                                         -fill both \
                                                         -padx 0 \
                                                         -pady 0 \
                                                         -side top;

                    # Create the content object.
                    _ttk_frame $w.container.border.viewport.content -borderwidth 0 \
                                                                          -class $::ms::current($w,class) \
                                                                         -cursor $::ms::current($w,cursor) \
                                                                         -height $::ms::data($w,height) \
                                                                        -padding $::ms::current($w,padding) \
                                                                         -relief flat \
                                                                          -style $::ms::style($w,content) \
                                                                      -takefocus $::ms::current($w,takefocus) \
                                                                          -width $::ms::data($w,width);

                    # Place the content object.
                    _place $w.container.border.viewport.content     -anchor nw \
                                                                -bordermode outside \
                                                                        -in $w.container.border.viewport \
                                                                 -relheight 1.0 \
                                                                  -relwidth 1.0 \
                                                                      -relx 0 \
                                                                      -rely 0;

                    # NOTE:  The widget's content is placed by the 'place' geometry manager.
                    #        The reasons around the 'place' choice is to intercepts any widget dimensions
                    #        changes or scrolls upon it.

                    ########################
                    ##                    ##
                    ##     SCROLLBARS     ##
                    ##                    ##
                    ########################

                    # Create the horizontal scrollbar address.
                    _ttk_scrollbar $w.container.x     -class TScrollbar \
                                                    -command "" \
                                                     -cursor arrow \
                                                     -orient horizontal \
                                                      -style TScrollbar \
                                                  -takefocus 0;

                    # Create the vertical scrollbar address.
                    _ttk_scrollbar $w.container.y     -class TScrollbar \
                                                    -command "" \
                                                     -cursor arrow \
                                                     -orient vertical \
                                                      -style TScrollbar \
                                                  -takefocus 0;

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        TLabelFrame { _bindtags $w [list $w _LabelFrame TLabelFrame $::ms::addr($w,toplevel) all] }
                        default     { _bindtags $w [list $w $::ms::current($w,class) _LabelFrame TLabelFrame $::ms::addr($w,toplevel) all] }
                    }

                    # ButtonPress-1
                    _bind $w.container                         <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }
                    _bind $w.container.border                  <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent [_winfo parent %W]]; break }
                    _bind $w.container.border.viewport.content <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]]; break }
                    _bind $w.title                             <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }

                    _bind $w.container.x <ButtonPress-1>   { ::ms::labelframe::Scrollbar_ButtonPress  [_winfo parent [_winfo parent %W]] horizontal %x %y; break }
                    _bind $w.container.x <B1-Motion>       { ::ms::labelframe::Scrollbar_Drag         [_winfo parent [_winfo parent %W]] horizontal %x %y; break }
                    _bind $w.container.x <ButtonRelease-1> { ::ms::labelframe::Scrollbar_ButtonRelease; break }

                    _bind $w.container.y <ButtonPress-1>   { ::ms::labelframe::Scrollbar_ButtonPress  [_winfo parent [_winfo parent %W]] vertical %x %y; break }
                    _bind $w.container.y <B1-Motion>       { ::ms::labelframe::Scrollbar_Drag         [_winfo parent [_winfo parent %W]] vertical %x %y; break }
                    _bind $w.container.y <ButtonRelease-1> { ::ms::labelframe::Scrollbar_ButtonRelease; break }

                    # Contextual menu
                    _bind $w.container                         <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }
                    _bind $w.container.border                  <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent [_winfo parent %W]] %X %Y cmenu; break }
                    _bind $w.container.border.viewport.content <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %X %Y cmenu; break }
                    _bind $w.title                             <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }

                    # Configure
                    _bind $w.container.border.viewport         <Configure> { ::ms::labelframe::Configure [_winfo parent [_winfo parent [_winfo parent %W]]] %w %h; break }
                    _bind $w.container.border.viewport.content <Configure> { update; break }

                    # Enter/Leave
                    _bind $w.container.border                  <Enter> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.container.border.viewport.content <Enter> { ::ms::labelframe::Hover [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %X %Y; break }
                    _bind $w.container.x                       <Enter> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.container.y                       <Enter> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.title                             <Enter> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }

                    _bind $w.container.border                  <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.container.border.viewport.content <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %X %Y; break }
                    _bind $w.container.x                       <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.container.y                       <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.title                             <Leave> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }

                    # FocusIn/FocusOut
                    _bind $w.container.border.viewport.content <FocusIn>  { ::ms::labelframe::FocusIn  [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]]; break }
                    _bind $w.container.border.viewport.content <FocusOut> { ::ms::labelframe::FocusOut [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]]; break }

                    # Mousewheel and Touchpad

                    # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }
                    _bind $w.title     <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }

                    # If the widget's vertical scrollbar is active, move the widget's content zone by one unit
                    # up or down (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container.border                  <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent %W]] %D units; break }
                    _bind $w.container.border.viewport.content <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %D units; break }
                    _bind $w.container.y                       <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent %W]] %D units; break }

                    # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }
                    _bind $w.title     <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }

                    # If the widget's horizontal scrollbar is active, move the widget's content zone by one unit
                    # left or right (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container.border                  <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent %W]] %D units; break }
                    _bind $w.container.border.viewport.content <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %D units; break }
                    _bind $w.container.x                       <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent %W]] %D units; break }

                    # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one page up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }
                    _bind $w.title     <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }

                    # If the widget's vertical scrollbar is active, move the widget's content zone by one page
                    # up or down (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one page up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container.border                  <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent %W]] %D pages; break }
                    _bind $w.container.border.viewport.content <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %D pages; break }
                    _bind $w.container.y                       <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent %W]] %D pages; break }

                    # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one page left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }
                    _bind $w.title     <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }

                    # If the widget's horizontal scrollbar is active, move the widget's content zone by one page
                    # left or right (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one page left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container.border                  <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent %W]] %D pages; break }
                    _bind $w.container.border.viewport.content <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %D pages; break }
                    _bind $w.container.x                       <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent %W]] %D pages; break }

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
                    _bind $w.container <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }
                    _bind $w.title     <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }

                    # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
                    # These two planes may involve different widgets depending on the active scrollbars on them and on the
                    # touchpad direction.
                    #   1 - If the widget's horizontal scrollbar is active, move the widget's content zone by one unit
                    #       left or right (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    #       and move that scrollbar by one unit left or right (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
                    #
                    #   2 - If the widget's vertical scrollbar is active, move the widget's content zone by one unit
                    #       up or down (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    #       and move that scrollbar by one unit up or down (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
                    _bind $w.container.border                  <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D units; break }
                    _bind $w.container.border.viewport.content <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %# %D units; break }
                    _bind $w.container.x                       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D units; break }
                    _bind $w.container.y                       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D units; break }

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
                    _bind $w.container <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }
                    _bind $w.title     <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }

                    # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
                    # These two planes may involve different widgets depending on the active scrollbars on them and on the
                    # touchpad direction.
                    #   1 - If the widget's horizontal scrollbar is active, move the widget's content zone by one page
                    #       left or right (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    #       and move that scrollbar by one page left or right (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
                    #
                    #   2 - If the widget's vertical scrollbar is active, move the widget's content zone by one page
                    #       up or down (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    #       and move that scrollbar by one page up or down (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
                    _bind $w.container.border                  <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D pages; break }
                    _bind $w.container.border.viewport.content <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %# %D pages; break }
                    _bind $w.container.x                       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D pages; break }
                    _bind $w.container.y                       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D pages; break }

                    # Add the labelframe to the related toplevel keyboard pages navigation bindings.
                    ::ms::Enable_Traversal $w

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Configure the internal widget rows and columns.
                    _grid rowconfigure    $w.container [list 0] -weight 1
                    _grid columnconfigure $w.container [list 0] -weight 1

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses relative to its real address, 'w'.
                    # They will all point to the widget hull object short address.
                    set ::ms::addr($w,short)                                   $short_addr
                    set ::ms::addr($w.title,short)                             $short_addr
                    set ::ms::addr($w.container,short)                         $short_addr
                    set ::ms::addr($w.container.border,short)                  $short_addr
                    set ::ms::addr($w.container.border.viewport,short)         $short_addr
                    set ::ms::addr($w.container.border.viewport.content,short) $short_addr
                    set ::ms::addr($w.container.x,short)                       $short_addr
                    set ::ms::addr($w.container.y,short)                       $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.title \
                                              $w.container \
                                              $w.container.border \
                                              $w.container.border.viewport \
                                              $w.container.border.viewport.content \
                                              $w.container.x \
                                              $w.container.y;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.container.border

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.container.border.viewport.content

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.title \
                                                       $w.container \
                                                       $w.container.border \
                                                       $w.container.border.viewport \
                                                       $w.container.border.viewport.content];

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
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::labelframe::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::labelframe::Pathname_Cmd $w]
            }

            # Add the widget address to the labelframe widgets real address list.
            lappend ::ms::addr(labelframe) $w

            # Add the widget address to the labelframe real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),labelframe,addrs) $w

            # Add the widget address to the labelframe real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),labelframe,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the labelframe classtype.
            if { $::ms::current($w,style) ni $::ms::style(labelframe) } {
                lappend ::ms::style(labelframe) $::ms::current($w,style)
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
proc ::ms::labelframe::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::labelframe(non_styleable,options)) || ($option in $::ms::labelframe(styleable,options)) } {
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
                    foreach option $::ms::labelframe(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::labelframe(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::labelframe(non_styleable,options)) || ($option in $::ms::labelframe(styleable,options)) } {
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
                            #       Their registration (if any) is done in the '::ms::labelframe::Configure' event procedure.
                            set ::ms::temp($w,height) $::ms::current($w,height)
                            set ::ms::temp($w,width)  $::ms::current($w,width)

                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the remaining options, if any.
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -anchor {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            ne      -
                                            e       { set ::ms::current($w,anchor) ne }
                                            nw      -
                                            w       { set ::ms::current($w,anchor) nw }
                                            n       -
                                            ew      -
                                            we      -
                                            center  { set ::ms::current($w,anchor) n }
                                            default { continue }
                                        }

                                        set ::ms::managed_by($w,anchor) developer
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
                                            default {
                                                switch -- $value {
                                                    0   { continue }
                                                }
                                            }
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
                                    -height {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                            default {
                                                switch -- $value {
                                                    0   { continue }
                                                }
                                            }
                                        }

                                        set ::ms::temp($w,height) $value
                                    }
                                    -image {
                                        switch -- [::ms::Check_Image $value] {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,image)    $value
                                        set ::ms::managed_by($w,image) developer
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
                                            groove  -
                                            raised  -
                                            ridge   -
                                            solid   -
                                            sunken  {
                                                set ::ms::current($w,relief)    $value
                                                set ::ms::managed_by($w,relief) developer
                                            }
                                            default { continue }
                                        }
                                    }
                                    -scrollable {}
                                    -shellbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,shellbackground)    $value
                                        set ::ms::managed_by($w,shellbackground) developer
                                    }
                                    -state {}
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Check if exists a layout for the style provided.
                                            # If not, create one by mirroring the current theme 'TLabelframe' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TLabelframe]
                                            }

                                            # Remove the widget address from the labelframe classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),labelframe,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),labelframe,addrs) [lremove $::ms::style($::ms::current($w,style),labelframe,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,labelframe,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the labelframe classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),labelframe,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(labelframe) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(labelframe) [lremove $::ms::style(labelframe) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the labelframe classtype.
                                            if { $value ni $::ms::style(labelframe) } {
                                                lappend ::ms::style(labelframe) $value
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
                                    -width {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                            default {
                                                switch -- $value {
                                                    0   { continue }
                                                }
                                            }
                                        }

                                        set ::ms::temp($w,width) $value
                                    }
                                    -xscrollincrement {
                                        switch -- [string is integer -strict $value] {
                                            1   { set ::ms::current($w,xscrollincrement) $value }
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
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TLabelframe,$option)

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

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'anchor', 'borderwidth', 'compound', 'cursor', 'font', 'padding' and 'relief'
                            #       are not allowed to change if the statespec changes.

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

                            ###################
                            ##               ##
                            ##     TITLE     ##
                            ##               ##
                            ###################

                            set background  $::ms::styleopt($::ms::theme,TLabelframe.Label,background)
                            set bordercolor $::ms::styleopt($::ms::theme,TLabelframe.Label,bordercolor)
                            set borderwidth $::ms::styleopt($::ms::theme,TLabelframe.Label,borderwidth)
                            set charwidth   $::ms::styleopt($::ms::theme,TLabelframe.Label,charwidth)
                            set darkcolor   $::ms::styleopt($::ms::theme,TLabelframe.Label,darkcolor)
                            set lightcolor  $::ms::styleopt($::ms::theme,TLabelframe.Label,lightcolor)
                            set padding     $::ms::styleopt($::ms::theme,TLabelframe.Label,padding)
                            set relief      $::ms::styleopt($::ms::theme,TLabelframe.Label,relief)

                            # Check if '::ms::current($w,style).Label' exists among the styles known by the current theme.
                            # If not, set it as 'TLabelframe.Label'.
                            set labelframe_title_style [string cat $::ms::current($w,style) ".Label"]
                            if { ($labelframe_title_style in $::ms::style($::ms::theme)) && ($labelframe_title_style ne "TLabelframe.Label") } {
                                # Check if a layout exists for '::ms::current($w,style).Label'.
                                # If not, create one by mirroring the 'TLabelframe' layout for the current theme.
                                if { $labelframe_title_style ni $::ms::layouts($::ms::theme) } {
                                    _ttk_style layout $labelframe_title_style [_ttk_style layout TLabelframe.Label]
                                }

                                # Get the labelframe title style options, if any.
                                foreach option [list  background \
                                                     bordercolor \
                                                     borderwidth \
                                                       charwidth \
                                                       darkcolor \
                                                      lightcolor \
                                                         padding \
                                                          relief] {
                                    switch -- [info exists ::ms::styleopt($::ms::theme,$labelframe_title_style,$option)] {
                                        1   { set $option $::ms::styleopt($::ms::theme,$labelframe_title_style,$option) }
                                    }
                                }
                            }

                            # Set the anchor variable.
                            switch -- $::ms::current($w,anchor) {
                                ne  { set anchor ne }
                                nw  { set anchor nw }
                                n   { set anchor center }
                            }

                            # Set the title object style name.
                            set ::ms::style($w,title) [string cat "_bg=" $background \
                                                                  "_bc=" $bordercolor \
                                                                  "_dc=" $darkcolor \
                                                                  "_fg=" $::ms::current($w,foreground) \
                                                                  "_lc=" $lightcolor \
                                                                  "." $labelframe_title_style];

                            # If needed, create the title object style name.
                            if { $::ms::style($w,title) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,title)  -background $background \
                                                                            -bordercolor $bordercolor \
                                                                              -darkcolor $darkcolor \
                                                                             -foreground $::ms::current($w,foreground) \
                                                                             -lightcolor $lightcolor;

                                # Add the title object style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,title)
                            }

                            # Initialize the title object mapping.
                            set mapping [list ]

                            # background
                            # Check if a 'background' mapping exists for 'labelframe_title_style'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,background)] {
                                0   { lappend mapping -background [list pressed $background] }
                                1   { lappend mapping -background $::ms::stylemap($::ms::theme,$labelframe_title_style,background) }
                            }

                            # bordercolor
                            # Check if a 'bordercolor' mapping exists for 'labelframe_title_style'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor)] {
                                0   { lappend mapping -bordercolor [list pressed $bordercolor] }
                                1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor) }
                            }

                            # darkcolor
                            # Check if a 'darkcolor' mapping exists for 'labelframe_title_style'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor)] {
                                0   { lappend mapping -darkcolor [list pressed $darkcolor] }
                                1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor) }
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
                            # Check if a 'lightcolor' mapping exists for 'labelframe_title_style'.
                            switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor)] {
                                0   { lappend mapping -lightcolor [list pressed $lightcolor] }
                                1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor) }
                            }

                            # If needed, create the title object mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,title) {*}$mapping

                                # Add the title object mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            $w.title configure      -anchor $anchor \
                                               -borderwidth $borderwidth \
                                                  -compound $::ms::current($w,compound) \
                                                    -cursor $::ms::current($w,cursor) \
                                                      -font $::ms::current($w,font) \
                                                     -image $::ms::current($w,image) \
                                                   -justify left \
                                                   -padding $padding \
                                                    -relief $relief \
                                                     -style $::ms::style($w,title) \
                                                 -takefocus $::ms::current($w,takefocus) \
                                              -textvariable $text_variable \
                                                     -width $charwidth \
                                                -wraplength 0;

                            _pack configure $w.title -anchor $::ms::current($w,anchor)

                            # Check if the widget is scrollable or not.
                            switch -- $ms::current($w,scrollable) {
                                false {
                                    ###############################
                                    ##                           ##
                                    ##     SIMPLE LABELFRAME     ##
                                    ##                           ##
                                    ###############################

                                    #####################
                                    ##                 ##
                                    ##     CONTENT     ##
                                    ##                 ##
                                    #####################

                                    # Set the content object style name.
                                    set ::ms::style($w,content) [string cat "_bg=" $::ms::current($w,background) \
                                                                            "_bc=" $::ms::current($w,bordercolor) \
                                                                            "_dc=" $::ms::current($w,darkcolor) \
                                                                            "_lc=" $::ms::current($w,lightcolor) \
                                                                            "." $::ms::current($w,style)];

                                    # If needed, create the content object style name.
                                    if { $::ms::style($w,content) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                        _ttk_style configure $::ms::style($w,content)  -background $::ms::current($w,background) \
                                                                                      -bordercolor $::ms::current($w,bordercolor) \
                                                                                        -darkcolor $::ms::current($w,darkcolor) \
                                                                                       -lightcolor $::ms::current($w,lightcolor);

                                        # Add the content object style name to the theme styles list created by mustang.
                                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,content)
                                    }

                                    # Initialize the content object mapping.
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

                                    # If needed, create the content object mapping.
                                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                        _ttk_style map $::ms::style($w,content) {*}$mapping

                                        # Add the content object mapping to the stylemap list containing all the mappings
                                        # created by mustang for the current theme.
                                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                                    }

                                    # Apply the changes.
                                    $w.content configure -borderwidth $::ms::current($w,borderwidth) \
                                                              -cursor $::ms::current($w,cursor) \
                                                              -height $::ms::temp($w,height) \
                                                             -padding $::ms::current($w,padding) \
                                                              -relief $::ms::current($w,relief) \
                                                               -style $::ms::style($w,content) \
                                                           -takefocus $::ms::current($w,takefocus) \
                                                               -width $::ms::temp($w,width);
                                }
                                true {
                                    ###################################
                                    ##                               ##
                                    ##     SCROLLABLE LABELFRAME     ##
                                    ##                               ##
                                    ###################################

                                    #######################
                                    ##                   ##
                                    ##     CONTAINER     ##
                                    ##                   ##
                                    #######################

                                    # Set the container object style name.
                                    set ::ms::style($w,container) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                                              ".TFrame"];

                                    # If needed, create the container object style name.
                                    if { $::ms::style($w,container) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                        _ttk_style configure $::ms::style($w,container) -background $::ms::current($w,shellbackground)

                                        # Add the container object style name to the theme styles list created by mustang.
                                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,container)
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
                                    $w.container configure -style $::ms::style($w,container)

                                    ####################
                                    ##                ##
                                    ##     BORDER     ##
                                    ##                ##
                                    ####################

                                    # Set the border object style name.
                                    set ::ms::style($w,border) [string cat "_bg=" $::ms::current($w,background) \
                                                                           "_bc=" $::ms::current($w,bordercolor) \
                                                                           "_dc=" $::ms::current($w,darkcolor) \
                                                                           "_lc=" $::ms::current($w,lightcolor) \
                                                                           ".TFrame"];

                                    # If needed, create the border object style name.
                                    if { $::ms::style($w,border) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                        _ttk_style configure $::ms::style($w,border)  -background $::ms::current($w,background) \
                                                                                     -bordercolor $::ms::current($w,bordercolor) \
                                                                                       -darkcolor $::ms::current($w,darkcolor) \
                                                                                      -lightcolor $::ms::current($w,lightcolor);

                                        # Add the border object style name to the theme styles list created by mustang.
                                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,border)
                                    }

                                    # Initialize the border object mapping.
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

                                    # If needed, create the border object mapping.
                                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                        _ttk_style map $::ms::style($w,border) {*}$mapping

                                        # Add the border object mapping to the stylemap list containing all the mappings
                                        # created by mustang for the current theme.
                                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                                    }

                                    # Apply the changes.
                                    $w.container.border configure -borderwidth $::ms::current($w,borderwidth) \
                                                                       -relief $::ms::current($w,relief) \
                                                                        -style $::ms::style($w,border);

                                    ##################################
                                    ##                              ##
                                    ##     VIEWPORT AND CONTENT     ##
                                    ##                              ##
                                    ##################################

                                    # Note: The viewport and the content objects will have the same style, '::ms::style($w,content)'.

                                    # Set the content and viewport objects style name.
                                    set ::ms::style($w,content) [string cat "_bg=" $::ms::current($w,background) \
                                                                            "." $::ms::current($w,style)];

                                    # If needed, create the content and viewport objects style name.
                                    if { $::ms::style($w,content) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                        _ttk_style configure $::ms::style($w,content) -background $::ms::current($w,background)

                                        # Add the content and viewport objects style name to the theme styles list created by mustang.
                                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,content)
                                    }

                                    # Initialize the content and viewport objects mapping.
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

                                    # If needed, create the content and viewport objects mapping.
                                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                        _ttk_style map $::ms::style($w,content) {*}$mapping

                                        # Add the content and viewport objects mapping to the stylemap list containing all the mappings
                                        # created by mustang for the current theme.
                                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                                    }

                                    # Apply the changes.
                                    $w.container.border.viewport configure -cursor $::ms::current($w,cursor) \
                                                                           -height $::ms::temp($w,height) \
                                                                            -style $::ms::style($w,content) \
                                                                            -width $::ms::temp($w,width);

                                    $w.container.border.viewport.content configure    -cursor $::ms::current($w,cursor) \
                                                                                     -padding $::ms::current($w,padding) \
                                                                                       -style $::ms::style($w,content) \
                                                                                   -takefocus $::ms::current($w,takefocus);

                                    ########################
                                    ##                    ##
                                    ##     SCROLLBARS     ##
                                    ##                    ##
                                    ########################

                                    # Update the scrollbars.
                                    ::ms::labelframe::Scrollbar_Update $w
                                }
                            }

                            # Note: If width and/or height were provided by the developer, and these values were accepted by Tk,
                            #       then a configure event will be invoked by Tk ('::ms::labelframe::Configure').
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

                    # Return the name of the object, or an empty string if there are no labelframe objects at the coordinates provided.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            if { $widget eq $w } {
                                return "Labelframe.hull"
                            } elseif { $widget eq "$w.title" } {
                                return "Labelframe.title"
                            } elseif { $widget eq "$w.content" } {
                                return "Labelframe.frame"
                            } else {
                                return ""
                            }
                        }
                        true {
                            if { $widget eq $w } {
                                return "Labelframe.hull"
                            } elseif { $widget eq "$w.title" } {
                                return "Labelframe.title"
                            } elseif { $widget eq "$w.container" } {
                                return "Labelframe.container"
                            } elseif { $widget eq "$w.container.border" } {
                                return "Labelframe.border"
                            } elseif { $widget eq "$w.container.border.viewport.content" } {
                                return "Labelframe.frame"
                            } elseif { $widget eq "$w.container.x" } {
                                return "Labelframe.hscrollbar"
                            } elseif { $widget eq "$w.container.y" } {
                                return "Labelframe.vscrollbar"
                            } else {
                                return ""
                            }
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

                    return [$::ms::addr($w,widget) instate $statespec]
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
                        $::ms::addr($w,widget) instate $statespec $script
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        see {
            # Synopsis:
            #
            # *window* **see** *widget*
            set widget $args

            # Get the 'widget' real address.
            set result [::ms::Check_Pathname $widget invalid]
            switch -- $result {
                invalid { return "" }
                default { set widget_real_pathname [lindex $result 0] }
            }

            # Get the parent address of the widget real pathname.
            set parent_addr [_winfo parent $widget_real_pathname]
            switch -- $parent_addr {
                ""  { return "" }
            }

            # Start a recursive loop until either we find 'w' as parent (direct or not) of 'widget' or
            # we have no more parents to check for.
            set i 0
            while { $i == 0 } {
                # Check if the parent retrieved is equal to the labelframe address provided ('w').
                if { $parent_addr eq $w } {
                    update idletasks

                    set place_options [list ]

                    ##################################
                    ##                              ##
                    ##     HORIZONTAL SCROLLBAR     ##
                    ##                              ##
                    ##################################

                    switch -- $::ms::data($w,scrollx) {
                        on  {
                            # Get the widget width and horizontal coordinates.
                            set width  [_winfo width $widget_real_pathname]
                            set x1     [_winfo x $widget_real_pathname]
                            set x2     [expr { $x1+$width }]

                            # Set the widget xview1 and xview2.
                            set xview1 [expr { ($x1*1.0)/$::ms::data($w,reqwidth) }]
                            set xview2 [expr { ($x2*1.0)/$::ms::data($w,reqwidth) }]

                            if { ($xview1 >= $::ms::data($w,xview1)) && ($xview2 <= $::ms::data($w,xview2)) } {
                                # Note: The width of the widget its already entirely visible.
                                #       There will be no movement along the 'X' axis.
                            } else {
                                # Compute the movement along the 'X' axis.
                                if { (($width*1.0)/$::ms::data($w,reqwidth)) < $::ms::data($w,xview_diff) } {
                                    # Note: The width of the widget can be entirely visible.
                                    #       If possible, we will anchor its 'X' center to the 'X' center of the 'viewport' object.
                                    #       The widget will be completely visible along the 'X' axis.

                                    set x_center        [expr { round(floor($x1+($width/2.0))) }]
                                    set xview_center    [expr { ($x_center*1.0)/$::ms::data($w,reqwidth) }]
                                    set half_xview_diff [expr { $::ms::data($w,xview_diff)/2.0 }]

                                    # Compute the new 'viewport' xview1 and xview2.
                                    set ::ms::data($w,xview1) [expr { $xview_center-$half_xview_diff }]
                                    set ::ms::data($w,xview2) [expr { $xview_center+$half_xview_diff }]

                                    if { $::ms::data($w,xview1) < 0 } {
                                        # We are near the left limit of the 'X' axis.
                                        # Change the anchoring to the left of the 'X' axis.
                                        set ::ms::data($w,xview1) 0
                                        set ::ms::data($w,xview2) $::ms::data($w,xview_diff)
                                    } elseif { $::ms::data($w,xview2) > 1.0 } {
                                        # We are near the right limit of the 'X' axis.
                                        # Change the anchoring to the right of the 'X' axis.
                                        set ::ms::data($w,xview1) [expr { 1.0-$::ms::data($w,xview_diff) }]
                                        set ::ms::data($w,xview2) 1.0
                                    }
                                } else {
                                    # Note: The width of the widget cannot be entirely visible.
                                    #       We will anchor its 'X' west to the 'X' west of the 'viewport' object.
                                    #       The widget will be partially visible along the 'X' axis.

                                    # Compute the new 'viewport' xview1 and xview2.
                                    set ::ms::data($w,xview1) [expr { ($x1*1.0)/$::ms::data($w,reqwidth) }]
                                    set ::ms::data($w,xview2) [expr { $::ms::data($w,xview1)+$::ms::data($w,xview_diff) }]
                                }

                                # Compute the content scroll along the 'X' axis.
                                set x [expr { round(floor(-$::ms::data($w,xview1)*$::ms::data($w,reqwidth))) }]

                                # Horizontal scroll stopper.
                                set x_limit [expr { round(floor(($::ms::data($w,reqwidth)-($::ms::data($w,reqwidth)*$::ms::data($w,xview_diff)))*-1.0)) }]
                                if { $x < $x_limit } {
                                    set x $x_limit
                                }

                                # Register the 'content' object place 'x' coordinate to enforce.
                                lappend place_options -x $x

                                # Update the horizontal scrollbar thumb position.
                                $w.container.x set $::ms::data($w,xview1) $::ms::data($w,xview2)
                            }
                        }
                    }

                    ################################
                    ##                            ##
                    ##     VERTICAL SCROLLBAR     ##
                    ##                            ##
                    ################################

                    switch -- $::ms::data($w,scrolly) {
                        on  {
                            # Get the widget height and vertical coordinates.
                            set height [_winfo height $widget_real_pathname]
                            set y1     [_winfo y $widget_real_pathname]
                            set y2     [expr { $y1+$height }]

                            # Set the widget yview1 and yview2.
                            set yview1 [expr { ($y1*1.0)/$::ms::data($w,reqheight) }]
                            set yview2 [expr { ($y2*1.0)/$::ms::data($w,reqheight) }]

                            if { ($yview1 >= $::ms::data($w,yview1)) && ($yview2 <= $::ms::data($w,yview2)) } {
                                # Note: The height of the widget its already entirely visible.
                                #       There will be no movement along the 'Y' axis.
                            } else {
                                # Compute the movement along the 'Y' axis.
                                if { (($height*1.0)/$::ms::data($w,reqheight)) < $::ms::data($w,yview_diff) } {
                                    # Note: The height of the widget can be entirely visible.
                                    #       If possible, we will anchor its 'Y' center to the 'Y' center of the 'viewport' object.
                                    #       The widget will be completely visible along the 'Y' axis.

                                    set y_center        [expr { round(floor($y1+($height/2.0))) }]
                                    set yview_center    [expr { ($y_center*1.0)/$::ms::data($w,reqheight) }]
                                    set half_yview_diff [expr { $::ms::data($w,yview_diff)/2.0 }]

                                    # Compute the new 'viewport' yview1 and yview2.
                                    set ::ms::data($w,yview1) [expr { $yview_center-$half_yview_diff }]
                                    set ::ms::data($w,yview2) [expr { $yview_center+$half_yview_diff }]

                                    if { $::ms::data($w,yview1) < 0 } {
                                        # We are near the upper limit of the 'Y' axis.
                                        # Change the anchoring to the top of the 'Y' axis.
                                        set ::ms::data($w,yview1) 0
                                        set ::ms::data($w,yview2) $::ms::data($w,yview_diff)
                                    } elseif { $::ms::data($w,yview2) > 1.0 } {
                                        # We are near the lower limit of the 'Y' axis.
                                        # Change the anchoring to the bottom of the 'Y' axis.
                                        set ::ms::data($w,yview1) [expr { 1.0-$::ms::data($w,yview_diff) }]
                                        set ::ms::data($w,yview2) 1.0
                                    }
                                } else {
                                    # Note: The height of the widget cannot be entirely visible.
                                    #       We will anchor its 'Y' north to the 'Y' north of the 'viewport' object.
                                    #       The widget will be partially visible along the 'Y' axis.

                                    # Compute the new 'viewport' yview1 and yview2.
                                    set ::ms::data($w,yview1) [expr { ($y1*1.0)/$::ms::data($w,reqheight) }]
                                    set ::ms::data($w,yview2) [expr { $::ms::data($w,yview1)+$::ms::data($w,yview_diff) }]
                                }

                                # Compute the content scroll along the 'Y' axis.
                                set y [expr { round(floor(-$::ms::data($w,yview1)*$::ms::data($w,reqheight))) }]

                                # Vertical scroll stopper.
                                set y_limit [expr { round(floor(($::ms::data($w,reqheight)-($::ms::data($w,reqheight)*$::ms::data($w,yview_diff)))*-1.0)) }]
                                if { $y < $y_limit } {
                                    set y $y_limit
                                }

                                # Register the 'content' object place 'y' coordinate to enforce.
                                lappend place_options -y $y

                                # Update the vertical scrollbar thumb position.
                                $w.container.y set $::ms::data($w,yview1) $::ms::data($w,yview2)
                            }
                        }
                    }

                    # Scroll the 'content' object of the scrollablle labelframe, if needed.
                    switch -- $place_options {
                        ""      {}
                        default { _place configure $w.container.border.viewport.content {*}$place_options }
                    }

                    break
                }

                # Continue the recursive loop, if needed.
                set parent_addr [_winfo parent $parent_addr]
                switch -- $parent_addr {
                    ""  { break }
                }
            }

            return ""
        }
        state {
            # Synopsis:
            #
            # *window* **state** ?*statespec*?
            switch -- [llength $args] {
                0   { return [$::ms::addr($w,widget) state] }
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

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            # Propagate the new statespec to the widget's hull, title and content objects.
                            interp invokehidden {} $w state $statespec
                            $w.title state $statespec

                            return [$w.content state $statespec]
                        }
                        true {
                            # Propagate the new statespec to the widget's hull, title, container, border and content objects.
                            interp invokehidden {} $w state $statespec
                            $w.title state $statespec
                            $w.container state $statespec
                            $w.container.border state $statespec

                            return [$w.container.border.content state $statespec]
                        }
                    }
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

            # Check if the widget has an active horizontal scrollbar.
            switch -- $::ms::data($w,scrollx) {
                on  {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    switch -nocase -- $subcommand {
                        ""     { return [list $::ms::data($w,xview1) $::ms::data($w,xview2)] }
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

                            # For performance reasons, we avoid the computation for the following cases:
                            if { $::ms::data($w,xview1) == $fraction } {
                                return ""
                            } elseif { ($::ms::data($w,xview2) == 1.0) && ($::ms::data($w,xview1) <= $fraction) } {
                                return ""
                            }

                            # Position the thumb with it's center placed at fraction.
                            set half_xview_diff       [expr { $::ms::data($w,xview_diff)/2.0 }]
                            set ::ms::data($w,xview1) [expr { $fraction-$half_xview_diff }]
                            set ::ms::data($w,xview2) [expr { $fraction+$half_xview_diff }]

                            if { $::ms::data($w,xview1) < 0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the left side of the scrollbar.
                                set ::ms::data($w,xview1) 0
                                set ::ms::data($w,xview2) $::ms::data($w,xview_diff)
                            } elseif { $::ms::data($w,xview2) > 1.0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the right side of the scrollbar.
                                set ::ms::data($w,xview1) [expr { 1.0-$::ms::data($w,xview_diff) }]
                                set ::ms::data($w,xview2) 1.0
                            }

                            # Compute the new horizontal coordinate of the content object.
                            set x [expr { round(floor(-$::ms::data($w,xview1)*$::ms::data($w,reqwidth))) }]

                            # Horizontal scroll stopper.
                            set x_limit [expr { round(floor(($::ms::data($w,reqwidth)-($::ms::data($w,reqwidth)*$::ms::data($w,xview_diff)))*-1.0)) }]
                            if { $x < $x_limit } {
                                set x $x_limit
                            }

                            # Move the content object horizontally.
                            _place configure $w.container.border.viewport.content -x $x

                            # Update the horizontal scrollbar thumb position.
                            $w.container.x set $::ms::data($w,xview1) $::ms::data($w,xview2)

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
                                    # Note: A 'page' is 9/10 of the viewport width.
                                    set page   [expr { $::ms::data($w,width)*0.9 }]
                                    set amount [expr { $number*$page }]
                                }
                                units {
                                    if { $::ms::current($w,xscrollincrement) > 0 } {
                                        # Note: A 'unit' is '::ms::current($w,xscrollincrement)'.
                                        set unit   $::ms::current($w,xscrollincrement)
                                        set amount [expr { $number*$unit }]
                                    } else {
                                        # Note: A 'unit' is 1/10 of the viewport width.
                                        set unit   [expr { $::ms::data($w,width)*0.1 }]
                                        set amount [expr { $number*$unit }]
                                    }
                                }
                                default { return "" }
                            }

                            # Compute the fraction [0,1.0].
                            set fraction [expr { $::ms::data($w,xview1)+($amount/($::ms::data($w,reqwidth)*1.0)) }]
                            if { $fraction < 0 } {
                                set fraction 0
                            } elseif { $fraction > 1.0 } {
                                set fraction 1.0
                            }

                            # For performance reasons, we avoid the computation for the following cases:
                            if { $::ms::data($w,xview1) == $fraction } {
                                return ""
                            } elseif { ($::ms::data($w,xview2) == 1.0) && ($::ms::data($w,xview1) <= $fraction) } {
                                return ""
                            }

                            # Update the content area along the horizontal axis.
                            set ::ms::data($w,xview1) $fraction
                            set ::ms::data($w,xview2) [expr { $::ms::data($w,xview1)+$::ms::data($w,xview_diff) }]
                            if {$::ms::data($w,xview2) > 1.0} {
                                # Override the previous coordinates.
                                # Position the thumb on the right side of the scrollbar.
                                set ::ms::data($w,xview1) [expr { 1.0-$::ms::data($w,xview_diff) }]
                                set ::ms::data($w,xview2) 1.0
                            }

                            # Compute the new horizontal coordinate of the content object.
                            set x [expr { round(floor(-$::ms::data($w,xview1)*$::ms::data($w,reqwidth))) }]

                            # Horizontal scroll stopper.
                            set x_limit [expr { round(floor(($::ms::data($w,reqwidth)-($::ms::data($w,reqwidth)*$::ms::data($w,xview_diff)))*-1.0)) }]
                            if { $x < $x_limit } {
                                set x $x_limit
                            }

                            # Move the content object horizontally.
                            _place configure $w.container.border.viewport.content -x $x

                            # Update the horizontal scrollbar thumb position.
                            $w.container.x set $::ms::data($w,xview1) $::ms::data($w,xview2)

                            return ""
                        }
                        default { ::ms::Error "Invalid xview option, '$subcommand'." $caller_info }
                    }
                }
            }

            return ""
        }
        yview {
            # Synopsis:
            #
            # *window* **yview**
            # *window* **yview** **moveto** *fraction*
            # *window* **yview** **scroll** *number* *what*

            # Check if the widget has an active vertical scrollbar.
            switch -- $::ms::data($w,scrolly) {
                on  {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    switch -nocase -- $subcommand {
                        ""     { return [list $::ms::data($w,yview1) $::ms::data($w,yview2)] }
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

                            # For performance reasons, we avoid the computation for the following cases:
                            if { $::ms::data($w,yview1) == $fraction } {
                                return ""
                            } elseif { ($::ms::data($w,yview2) == 1.0) && ($::ms::data($w,yview1) <= $fraction) } {
                                return ""
                            }

                            # Position the thumb with it's center placed at fraction.
                            set half_yview_diff       [expr { $::ms::data($w,yview_diff)/2.0 }]
                            set ::ms::data($w,yview1) [expr { $fraction-$half_yview_diff }]
                            set ::ms::data($w,yview2) [expr { $fraction+$half_yview_diff }]

                            if { $::ms::data($w,yview1) < 0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the top side of the scrollbar.
                                set ::ms::data($w,yview1) 0
                                set ::ms::data($w,yview2) $::ms::data($w,yview_diff)
                            } elseif { $::ms::data($w,yview2) > 1.0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the bottom side of the scrollbar.
                                set ::ms::data($w,yview1) [expr { 1.0-$::ms::data($w,yview_diff) }]
                                set ::ms::data($w,yview2) 1.0
                            }

                            # Compute the new vertical coordinate of the content object.
                            set y [expr { round(floor(-$::ms::data($w,yview1)*$::ms::data($w,reqheight))) }]

                            # Vertical scroll stopper.
                            set y_limit [expr { round(floor(($::ms::data($w,reqheight)-($::ms::data($w,reqheight)*$::ms::data($w,yview_diff)))*-1.0)) }]
                            if { $y < $y_limit } {
                                set y $y_limit
                            }

                            # Move the content object vertically.
                            _place configure $w.container.border.viewport.content -y $y

                            # Update the vertical scrollbar thumb position.
                            $w.container.y set $::ms::data($w,yview1) $::ms::data($w,yview2)

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
                                    # Note: A 'page' is 9/10 of the viewport height.
                                    set page   [expr { $::ms::data($w,height)*0.9 }]
                                    set amount [expr { $number*$page }]
                                }
                                units {
                                    if { $::ms::current($w,yscrollincrement) > 0 } {
                                        # Note: A 'unit' is '::ms::current($w,yscrollincrement)'.
                                        set unit   $::ms::current($w,yscrollincrement)
                                        set amount [expr { $number*$unit }]
                                    } else {
                                        # Note: A 'unit' is 1/10 of the viewport height.
                                        set unit   [expr { $::ms::data($w,height)*0.1 }]
                                        set amount [expr { $number*$unit }]
                                    }
                                }
                                default { return "" }
                            }

                            # Compute the fraction [0,1.0].
                            set fraction [expr { $::ms::data($w,yview1)+($amount/($::ms::data($w,reqheight)*1.0)) }]
                            if {$fraction < 0} {
                                set fraction 0
                            } elseif {$fraction > 1.0} {
                                set fraction 1.0
                            }

                            # For performance reasons, we avoid the computation for the following cases:
                            if { $::ms::data($w,yview1) == $fraction } {
                                return ""
                            } elseif { ($::ms::data($w,yview2) == 1.0) && ($::ms::data($w,yview1) <= $fraction) } {
                                return ""
                            }

                            # Update the content area along the vertical axis.
                            set ::ms::data($w,yview1) $fraction
                            set ::ms::data($w,yview2) [expr { $::ms::data($w,yview1)+$::ms::data($w,yview_diff) }]
                            if { $::ms::data($w,yview2) > 1.0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the bottom side of the scrollbar.
                                set ::ms::data($w,yview1) [expr { 1.0-$::ms::data($w,yview_diff) }]
                                set ::ms::data($w,yview2) 1.0
                            }

                            # Compute the new vertical coordinate of the content object.
                            set y [expr { round(floor(-$::ms::data($w,yview1)*$::ms::data($w,reqheight))) }]

                            # Vertical scroll stopper.
                            set y_limit [expr { round(floor(($::ms::data($w,reqheight)-($::ms::data($w,reqheight)*$::ms::data($w,yview_diff)))*-1.0)) }]
                            if { $y < $y_limit } {
                                set y $y_limit
                            }

                            # Move the content object vertically.
                            _place configure $w.container.border.viewport.content -y $y

                            # Update the vertical scrollbar thumb position.
                            $w.container.y set $::ms::data($w,yview1) $::ms::data($w,yview2)

                            return ""
                        }
                        default { ::ms::Error "Invalid yview option, '$subcommand'." $caller_info }
                    }
                }
            }

            return ""
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
# Update any labelframe widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::labelframe::Style_Update { stylename caller_info } {
    ##############################
    ##                          ##
    ##     LABELFRAME.LABEL     ##
    ##                          ##
    ##############################

    set background  $::ms::styleopt($::ms::theme,TLabelframe.Label,background)
    set bordercolor $::ms::styleopt($::ms::theme,TLabelframe.Label,bordercolor)
    set borderwidth $::ms::styleopt($::ms::theme,TLabelframe.Label,borderwidth)
    set charwidth   $::ms::styleopt($::ms::theme,TLabelframe.Label,charwidth)
    set darkcolor   $::ms::styleopt($::ms::theme,TLabelframe.Label,darkcolor)
    set lightcolor  $::ms::styleopt($::ms::theme,TLabelframe.Label,lightcolor)
    set padding     $::ms::styleopt($::ms::theme,TLabelframe.Label,padding)
    set relief      $::ms::styleopt($::ms::theme,TLabelframe.Label,relief)

    # Check if 'stylename.Label' exists among the styles known by the current theme.
    # If not, set it as 'TLabelframe.Label'.
    set labelframe_title_style [string cat $stylename ".Label"]
    if { ($labelframe_title_style in $::ms::style($::ms::theme)) && ($labelframe_title_style ne "TLabelframe.Label") } {
        # Check if a layout exists for 'stylename.Label'.
        # If not, create one by mirroring the 'TLabelframe' layout for the current theme.
        if { $labelframe_title_style ni $::ms::layouts($::ms::theme) } {
            _ttk_style layout $labelframe_title_style [_ttk_style layout TLabelframe.Label]
        }

        # Get the labelframe title style options, if any.
        foreach option [list  background \
                             bordercolor \
                             borderwidth \
                               charwidth \
                               darkcolor \
                              lightcolor \
                                 padding \
                                  relief] {
            switch -- [info exists ::ms::styleopt($::ms::theme,$labelframe_title_style,$option)] {
                1   { set $option $::ms::styleopt($::ms::theme,$labelframe_title_style,$option) }
            }
        }
    }

    # Update all the labelframe widgets that have stylename as a style.
    foreach w $::ms::style($stylename,labelframe,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::labelframe(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TLabelframe,$option)

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

        # Note: 'anchor', 'borderwidth', 'compound', 'cursor', 'font', 'padding' and 'relief'
        #       are not allowed to change if the statespec changes.

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

        ###################
        ##               ##
        ##     TITLE     ##
        ##               ##
        ###################

        # Set the anchor variable.
        switch -- $::ms::current($w,anchor) {
            ne  { set anchor ne }
            nw  { set anchor nw }
            n   { set anchor center }
        }

        # Set the title object style name.
        set ::ms::style($w,title) [string cat "_bg=" $background \
                                              "_bc=" $bordercolor \
                                              "_dc=" $darkcolor \
                                              "_fg=" $::ms::current($w,foreground) \
                                              "_lc=" $lightcolor \
                                              "." $labelframe_title_style];

        # If needed, create the title object style name.
        if { $::ms::style($w,title) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,title)  -background $background \
                                                        -bordercolor $bordercolor \
                                                          -darkcolor $darkcolor \
                                                         -foreground $::ms::current($w,foreground) \
                                                         -lightcolor $lightcolor;

            # Add the title object style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,title)
        }

        # Initialize the title object mapping.
        set mapping [list ]

        # background
        # Check if a 'background' mapping exists for 'labelframe_title_style'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,background)] {
            0   { lappend mapping -background [list pressed $background] }
            1   { lappend mapping -background $::ms::stylemap($::ms::theme,$labelframe_title_style,background) }
        }

        # bordercolor
        # Check if a 'bordercolor' mapping exists for 'labelframe_title_style'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor)] {
            0   { lappend mapping -bordercolor [list pressed $bordercolor] }
            1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor) }
        }

        # darkcolor
        # Check if a 'darkcolor' mapping exists for 'labelframe_title_style'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor)] {
            0   { lappend mapping -darkcolor [list pressed $darkcolor] }
            1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor) }
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
        # Check if a 'lightcolor' mapping exists for 'labelframe_title_style'.
        switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor)] {
            0   { lappend mapping -lightcolor [list pressed $lightcolor] }
            1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor) }
        }

        # If needed, create the title object mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,title) {*}$mapping

            # Add the title object mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        $w.title configure      -anchor $anchor \
                           -borderwidth $borderwidth \
                              -compound $::ms::current($w,compound) \
                                -cursor $::ms::current($w,cursor) \
                                  -font $::ms::current($w,font) \
                                 -image $::ms::current($w,image) \
                               -justify left \
                               -padding $padding \
                                -relief $relief \
                                 -style $::ms::style($w,title) \
                                 -width $charwidth \
                            -wraplength 0;

        _pack configure $w.title -anchor $::ms::current($w,anchor)

        # Check if the widget is scrollable or not.
        switch -- $::ms::current($w,scrollable) {
            false {
                ###############################
                ##                           ##
                ##     SIMPLE LABELFRAME     ##
                ##                           ##
                ###############################

                #####################
                ##                 ##
                ##     CONTENT     ##
                ##                 ##
                #####################

                # Set the content object style name.
                set ::ms::style($w,content) [string cat "_bg=" $::ms::current($w,background) \
                                                        "_bc=" $::ms::current($w,bordercolor) \
                                                        "_dc=" $::ms::current($w,darkcolor) \
                                                        "_lc=" $::ms::current($w,lightcolor) \
                                                        "." $stylename];

                # If needed, create the content object style name.
                if { $::ms::style($w,content) ni $::ms::style($::ms::theme,created_by_mustang) } {
                    _ttk_style configure $::ms::style($w,content)  -background $::ms::current($w,background) \
                                                                  -bordercolor $::ms::current($w,bordercolor) \
                                                                    -darkcolor $::ms::current($w,darkcolor) \
                                                                   -lightcolor $::ms::current($w,lightcolor);

                    # Add the content object style name to the theme styles list created by mustang.
                    lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,content)
                }

                # Initialize the content object mapping.
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

                # If needed, create the content object mapping.
                if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                    _ttk_style map $::ms::style($w,content) {*}$mapping

                    # Add the content object mapping to the stylemap list containing all the mappings
                    # created by mustang for the current theme.
                    lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                }

                # Apply the changes.
                $w.content configure -borderwidth $::ms::current($w,borderwidth) \
                                          -cursor $::ms::current($w,cursor) \
                                         -padding $::ms::current($w,padding) \
                                          -relief $::ms::current($w,relief) \
                                           -style $::ms::style($w,content);
            }
            true {
                ###################################
                ##                               ##
                ##     SCROLLABLE LABELFRAME     ##
                ##                               ##
                ###################################

                #######################
                ##                   ##
                ##     CONTAINER     ##
                ##                   ##
                #######################

                # Set the container object style name.
                set ::ms::style($w,container) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                          ".TFrame"];

                # If needed, create the container object style name.
                if { $::ms::style($w,container) ni $::ms::style($::ms::theme,created_by_mustang) } {
                    _ttk_style configure $::ms::style($w,container) -background $::ms::current($w,shellbackground)

                    # Add the container object style name to the theme styles list created by mustang.
                    lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,container)
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
                $w.container configure -style $::ms::style($w,container)

                ####################
                ##                ##
                ##     BORDER     ##
                ##                ##
                ####################

                # Set the border object style name.
                set ::ms::style($w,border) [string cat "_bg=" $::ms::current($w,background) \
                                                       "_bc=" $::ms::current($w,bordercolor) \
                                                       "_dc=" $::ms::current($w,darkcolor) \
                                                       "_lc=" $::ms::current($w,lightcolor) \
                                                       ".TFrame"];

                # If needed, create the border object style name.
                if { $::ms::style($w,border) ni $::ms::style($::ms::theme,created_by_mustang) } {
                    _ttk_style configure $::ms::style($w,border)  -background $::ms::current($w,background) \
                                                                 -bordercolor $::ms::current($w,bordercolor) \
                                                                   -darkcolor $::ms::current($w,darkcolor) \
                                                                  -lightcolor $::ms::current($w,lightcolor);

                    # Add the border object style name to the theme styles list created by mustang.
                    lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,border)
                }

                # Initialize the border object mapping.
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

                # If needed, create the border object mapping.
                if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                    _ttk_style map $::ms::style($w,border) {*}$mapping

                    # Add the border object mapping to the stylemap list containing all the mappings
                    # created by mustang for the current theme.
                    lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                }

                # Apply the changes.
                $w.container.border configure -borderwidth $::ms::current($w,borderwidth) \
                                                   -relief $::ms::current($w,relief) \
                                                    -style $::ms::style($w,border);

                ##################################
                ##                              ##
                ##     VIEWPORT AND CONTENT     ##
                ##                              ##
                ##################################

                # Note: The viewport and the content objects will have the same style, '::ms::style($w,content)'.

                # Set the content and viewport objects style name.
                set ::ms::style($w,content) [string cat "_bg=" $::ms::current($w,background) \
                                                        "." $stylename];

                # If needed, create the content and viewport objects style name.
                if { $::ms::style($w,content) ni $::ms::style($::ms::theme,created_by_mustang) } {
                    _ttk_style configure $::ms::style($w,content) -background $::ms::current($w,background)

                    # Add the content and viewport objects style name to the theme styles list created by mustang.
                    lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,content)
                }

                # Initialize the content and viewport objects mapping.
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

                # If needed, create the content and viewport objects mapping.
                if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                    _ttk_style map $::ms::style($w,content) {*}$mapping

                    # Add the content and viewport objects mapping to the stylemap list containing all the mappings
                    # created by mustang for the current theme.
                    lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                }

                # Apply the changes.
                $w.container.border.viewport configure  -cursor $::ms::current($w,cursor) \
                                                         -style $::ms::style($w,content);

                $w.container.border.viewport.content configure  -cursor $::ms::current($w,cursor) \
                                                               -padding $::ms::current($w,padding) \
                                                                 -style $::ms::style($w,content);

                ########################
                ##                    ##
                ##     SCROLLBARS     ##
                ##                    ##
                ########################

                # Update the scrollbars.
                ::ms::labelframe::Scrollbar_Update $w
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
# w               Should be the widget real address involved.
#
# width, height   Should be the new width and height of the widget.
#                 These values should be provided by the **Configure** event.
#
# It doesn't return anything.
proc ::ms::labelframe::Configure { w width height } {
    # Check if we are here due to a widget configure command or not.
    switch -- [info exists ::ms::temp($w,height)] {
        1   {
            set ::ms::current($w,height) $::ms::temp($w,height)
            set ::ms::current($w,width)  $::ms::temp($w,width)
        }
    }

    # Note: The configure event have already happened.
    #       We just need to propagate the event inside the content
    #       and check if the scrollbar/s are updated/needed.

    set ::ms::data($w,height) $height
    set ::ms::data($w,width)  $width

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        true {
            # Update the scrollbars.
            ::ms::labelframe::Scrollbar_Update $w
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
proc ::ms::labelframe::Destroy { w } {
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

    # Remove the widget address from the labelframe widgets real address list.
    set index [lsearch -exact $::ms::addr(labelframe) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(labelframe) [lremove $::ms::addr(labelframe) $index] }
    }

    # Remove the widget address from the labelframe classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),labelframe,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),labelframe,addrs) [lremove $::ms::class($::ms::current($w,class),labelframe,addrs) $index] }
    }

    # Remove the widget address from the labelframe classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),labelframe,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),labelframe,addrs) [lremove $::ms::style($::ms::current($w,style),labelframe,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the labelframe classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),labelframe,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(labelframe,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(labelframe,classtype) [lremove $::ms::style(labelframe,classtype) $index] }
            }
        }
    }

    # Remove all the objects real addresses from the list of all available real addresses.
    foreach object [list $w \
                         $w.container \
                         $w.container.border \
                         $w.container.border.content \
                         $w.container.border.viewport \
                         $w.container.border.viewport.content \
                         $w.container.x \
                         $w.container.y \
                         $w.content \
                         $w.title] {
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

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        true {
            # Remove the widget address from the megawidget scrollable real address list.
            set index [lsearch -exact $::ms::addr(megawidgets,scrollable) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(megawidgets,scrollable) [lremove $::ms::addr(megawidgets,scrollable) $index] }
            }
        }
    }

    # Destroy the bindings for the widget real address in its related toplevel.
    ::ms::Clean_Up $w

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short) \
                         ::ms::addr($w.border,short) \
                         ::ms::addr($w.border.content,short) \
                         ::ms::addr($w.container,short) \
                         ::ms::addr($w.container.border,short) \
                         ::ms::addr($w.container.border.content,short) \
                         ::ms::addr($w.container.border.viewport,short) \
                         ::ms::addr($w.container.border.viewport.content,short) \
                         ::ms::addr($w.container.x,short) \
                         ::ms::addr($w.container.y,short) \
                         ::ms::addr($w.content,short) \
                         ::ms::addr($w.title,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,anchor) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,compound) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,font) \
                         ::ms::current($w,height) \
                         ::ms::current($w,image) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,scrollable) \
                         ::ms::current($w,shellbackground) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,text) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,xscrollincrement) \
                         ::ms::current($w,yscrollincrement) \
                         ::ms::current($w,width);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,height) \
                         ::ms::data($w,reqheight) \
                         ::ms::data($w,reqwidth) \
                         ::ms::data($w,scrollx) \
                         ::ms::data($w,scrolly) \
                         ::ms::data($w,token) \
                         ::ms::data($w,translated_text) \
                         ::ms::data($w,width) \
                         ::ms::data($w,xview1) \
                         ::ms::data($w,xview2) \
                         ::ms::data($w,xview_diff) \
                         ::ms::data($w,yview1) \
                         ::ms::data($w,yview2) \
                         ::ms::data($w,yview_diff);

    unset -nocomplain -- ::ms::default($w,anchor) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,compound) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,font) \
                         ::ms::default($w,height) \
                         ::ms::default($w,image) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,scrollable) \
                         ::ms::default($w,shellbackground) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,text) \
                         ::ms::default($w,textvariable) \
                         ::ms::default($w,xscrollincrement) \
                         ::ms::default($w,yscrollincrement) \
                         ::ms::default($w,width);

    unset -nocomplain -- ::ms::managed_by($w,anchor) \
                         ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,compound) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,image) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,padding) \
                         ::ms::managed_by($w,relief) \
                         ::ms::managed_by($w,shellbackground);

    unset -nocomplain -- ::ms::style($w,border) \
                         ::ms::style($w,container) \
                         ::ms::style($w,content) \
                         ::ms::style($w,hull) \
                         ::ms::style($w,title);

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
proc ::ms::labelframe::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::labelframe::Pathname_Cmd $w state focus

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
proc ::ms::labelframe::FocusOut { w } {
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
    ::ms::labelframe::Pathname_Cmd $w state !focus

    return ""
}

## Hover
#
# Manage the **Leave** event on a labelframe.
#
# Where:
#
# w      Should be the widget real address involved.
#
# X, Y   Should be the mouse pointer (X,Y) root coordinates.
#        These value are provided directly by the **Leave** event.
#
# It doesn't return anything.
proc ::ms::labelframe::Hover { w X Y } {
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
    if { ($X >= $X_nw) && ($X <= $X_se) && ($Y >= $Y_nw) && ($Y <= $Y_se) } {
        # The mouse cursor is outside the widget acting as a border object.

        # Change the widget dynamic state to '!hover'.
        ::ms::labelframe::Pathname_Cmd $w state hover
    } else {
        # The mouse cursor is inside the widget acting as a border object.

        # Change the widget dynamic state to 'hover'.
        ::ms::labelframe::Pathname_Cmd $w state !hover
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
# Manage the **ButtonPress** event on the widget's internal scrollbars.
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
proc ::ms::labelframe::Scrollbar_ButtonPress { w orient x y }  {
    set ::ms::temp(xpress) $x
    set ::ms::temp(ypress) $y

    switch -nocase -- $orient {
        horizontal {
            switch -nocase -glob -- [$w.container.x identify $x $y] {
                "*leftarrow"  { ::ms::Scroll_Widget_X $w +120 units }
                "*rightarrow" { ::ms::Scroll_Widget_X $w -120 units }
                "*grip"  -
                "*thumb" {
                    set ::ms::temp(drag_allowed) yes

                    set xviews [$w.container.x get]
                    set xview1 [lindex $xviews 0]
                    set xview2 [lindex $xviews 1]

                    # Compute the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [expr { ($xview2+$xview1)*0.5 }]
                }
                "*trough" {
                    # Get the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [$w.container.x fraction $x $y]

                    # Check if 'parent' has an active horizontal scrollbar linked to it.
                    switch -- $::ms::data($w,scrollx) {
                        on  {
                            switch -nocase -- $::ms::clickaction {
                                jump {
                                    # Jump to the location on the scrollbar that was clicked.
                                    ::ms::labelframe::Pathname_Cmd $w xview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set xviews [$w.container.x get]
                                    set xview1 [lindex $xviews 0]
                                    set xview2 [lindex $xviews 1]

                                    if { $::ms::temp(fraction) < $xview1 } {
                                        # The User has click on the left trough.

                                        # Scroll the thumb by one page towards the left.
                                        ::ms::labelframe::Pathname_Cmd $w xview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $xview2 } {
                                        # The User has click on the right trough.

                                        # Scroll the thumb by one page towards the right.
                                        ::ms::labelframe::Pathname_Cmd $w xview scroll 1 pages

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
            switch -nocase -glob -- [$w.container.y identify $x $y] {
                "*uparrow"   { ::ms::Scroll_Widget_Y $w +120 units }
                "*downarrow" { ::ms::Scroll_Widget_Y $w -120 units }
                "*grip"  -
                "*thumb" {
                    set ::ms::temp(drag_allowed) yes

                    set yviews [$w.container.y get]
                    set yview1 [lindex $yviews 0]
                    set yview2 [lindex $yviews 1]

                    # Compute the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [expr { ($yview2+$yview1)*0.5 }]
                }
                "*trough" {
                    # Get the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [$w.container.y fraction $x $y]

                    # Check if 'parent' has an active vertical scrollbar linked to it.
                    switch -- $::ms::data($w,scrolly) {
                        on  {
                            switch -nocase -- $::ms::clickaction {
                                jump {
                                    # Jump to the location on the scrollbar that was clicked.
                                    ::ms::labelframe::Pathname_Cmd $w yview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set yviews [$w.container.y get]
                                    set yview1 [lindex $yviews 0]
                                    set yview2 [lindex $yviews 1]

                                    if { $::ms::temp(fraction) < $yview1 } {
                                        # The User has click on the top trough.

                                        # Scroll the thumb by one page towards the top.
                                        ::ms::labelframe::Pathname_Cmd $w yview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $yview2 } {
                                        # The User has click on the bottom trough.

                                        # Scroll the thumb by one page towards the bottom.
                                        ::ms::labelframe::Pathname_Cmd $w yview scroll 1 pages

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
proc ::ms::labelframe::Scrollbar_ButtonRelease {} {
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
proc ::ms::labelframe::Scrollbar_Drag { w orient x y } {
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
            set delta    [$w.container.x delta $delta_x $delta_y]
            set fraction [expr { $::ms::temp(fraction)+$delta }]

            # Move the horizontal scrollbar to 'fraction'.
            ::ms::labelframe::Pathname_Cmd $w xview moveto $fraction
        }
        vertical {
            # Compute the 'fraction' after the drag movement.
            set delta    [$w.container.y delta $delta_x $delta_y]
            set fraction [expr { $::ms::temp(fraction)+$delta }]

            # Move the vertical scrollbar to 'fraction'.
            ::ms::labelframe::Pathname_Cmd $w yview moveto $fraction
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
proc ::ms::labelframe::Scrollbar_Update { w } {
    update

    set place_options [list ]

    ##################################
    ##                              ##
    ##     HORIZONTAL SCROLLBAR     ##
    ##                              ##
    ##################################

    # Get the focussable object required width.
    set ::ms::data($w,reqwidth) [_winfo reqwidth $w.container.border.viewport.content]

    if { $::ms::data($w,width) < $::ms::data($w,reqwidth) } {
        # Update the content area along the horizontal axis.
        set ::ms::data($w,xview_diff) [expr { ($::ms::data($w,width)*1.0)/$::ms::data($w,reqwidth) }]
        set ::ms::data($w,xview2)     [expr { $::ms::data($w,xview1)+$::ms::data($w,xview_diff) }]
        if { $::ms::data($w,xview2) > 1.0 } {
            set ::ms::data($w,xview1) [expr { 1.0-$::ms::data($w,xview_diff) }]
            set ::ms::data($w,xview2) 1.0
        }

        # Compute the new horizontal coordinate of the content object.
        set x [expr { -$::ms::data($w,xview1)*$::ms::data($w,reqwidth) }]

        # Horizontal scroll stopper.
        set x_limit [expr { round(floor(($::ms::data($w,reqwidth)-($::ms::data($w,reqwidth)*$::ms::data($w,xview_diff)))*-1.0)) }]
        if { $x < $x_limit } {
            set x $x_limit
        }

        # Register the 'content' object place 'x' coordinate to enforce.
        lappend place_options -x $x

        # Check if the horizontal scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrollx) {
            off {
                # Display the horizontal scrollbar.
                _grid $w.container.x -column 0 \
                                       -padx [list 0  0] \
                                       -pady [list 8p 0] \
                                        -row 1 \
                                     -sticky we;

                # Set the horizontal scrollbar status to 'on'.
                set ::ms::data($w,scrollx) on
            }
        }
    } else {
        # Update the content area along the horizontal axis.
        set ::ms::data($w,xview1)     0
        set ::ms::data($w,xview2)     1.0
        set ::ms::data($w,xview_diff) 1.0

        # Check if the horizontal scrollbar is currently displayed.
        switch -- $::ms::data($w,scrollx) {
            on  {
                # Hide the horizontal scrollbar.
                _grid remove $w.container.x

                # Set the horizontal scrollbar status to 'off'.
                set ::ms::data($w,scrollx) off

                # Register the 'content' object place 'x' coordinate to enforce.
                lappend place_options -x 0
            }
        }
    }

    ################################
    ##                            ##
    ##     VERTICAL SCROLLBAR     ##
    ##                            ##
    ################################

    # Get the focussable object required height.
    set ::ms::data($w,reqheight) [_winfo reqheight $w.container.border.viewport.content]

    if { $::ms::data($w,height) < $::ms::data($w,reqheight) } {
        # Update the content area along the vertical axis.
        set ::ms::data($w,yview_diff) [expr { ($::ms::data($w,height)*1.0)/$::ms::data($w,reqheight) }]
        set ::ms::data($w,yview2)     [expr { $::ms::data($w,yview1)+$::ms::data($w,yview_diff) }]
        if { $::ms::data($w,yview2) > 1.0 } {
            set ::ms::data($w,yview1) [expr { 1.0-$::ms::data($w,yview_diff) }]
            set ::ms::data($w,yview2) 1.0
        }

        # Compute the new vertical coordinate of the content object.
        set y [expr { -$::ms::data($w,yview1)*$::ms::data($w,reqheight) }]

        # Vertical scroll stopper.
        set y_limit [expr { round(floor(($::ms::data($w,reqheight)-($::ms::data($w,reqheight)*$::ms::data($w,yview_diff)))*-1.0)) }]
        if { $y < $y_limit } {
            set y $y_limit
        }

        # Register the 'content' object place 'y' coordinate to enforce.
        lappend place_options -y $y

        # Check if the vertical scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrolly) {
            off {
                # Display the vertical scrollbar.
                _grid $w.container.y -column 1 \
                                       -padx [list 8p 0] \
                                       -pady [list 0  0] \
                                        -row 0 \
                                     -sticky ns;

                # Set the vertical scrollbar status to 'on'.
                set ::ms::data($w,scrolly) on
            }
        }
    } else {
        # Update the content area along the vertical axis.
        set ::ms::data($w,yview1)     0
        set ::ms::data($w,yview2)     1.0
        set ::ms::data($w,yview_diff) 1.0

        # Check if the vertical scrollbar is currently displayed.
        switch -- $::ms::data($w,scrolly) {
            on  {
                # Hide the vertical scrollbar.
                _grid remove $w.container.y

                # Set the vertical scrollbar status to 'off'.
                set ::ms::data($w,scrolly) off

                # Register the 'content' object place 'y' coordinate to enforce.
                lappend place_options -y 0
            }
        }
    }

    # Update the horizontal and vertical scrollbars thumbs positions.
    $w.container.x set $::ms::data($w,xview1) $::ms::data($w,xview2)
    $w.container.y set $::ms::data($w,yview1) $::ms::data($w,yview2)

    # Move the content, if needed.
    switch -- $place_options {
        ""      {}
        default { _place configure $w.container.border.viewport.content {*}$place_options }
    }

    update idletasks

    return ""
}

#*EOF*