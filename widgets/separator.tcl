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

## separator
#
#### DESCRIPTION:
#
# A separator widget displays an horizontal or vertical separator bar.
#
# Note: At the time this command is invoked, there must not exist a window with the same pathname,
#       but the pathname's parents must exists.
#       *Window* may be provided either as a short or as a real address, the address returned will be:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
# Additional options, described below, may be specified on the command line to configure aspects of the separator.
#
#### SYNOPSIS:
#
#   **separator**  *window* ?*option* *value*? ... ?*option* *value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
# **-background**   It's a list that specifies the color to use as background (the actual color of the separator line).
#                   See the **COLOR OPTION** section to know how this list should be composed.
#
#                   Note: This is a styleable option.
#
#                         If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                  Only the developer can.
#
#                         If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                  If there isn't one, the **-background** of the **TSeparator** style
#                                                  will be used instead.
#                                                  The **-background** will always abide by its mapping values, if any.
#                                                  Styles, mappings and states events are allowed to change its value.
#
#                   Note: The background will be ignored by Tk is the current theme is not based on the clam engine
#                         like the **Halo** theme.
#
# **-class**        Specifies a class for the widget.
#                   It is mainly used to make bindings for widgets that have the same class.
#
#                   Note: This option may only be provided while creating the widget.
#                         Attempts to change this value after the widget is created by using the **configure** command,
#                         will be ignored by mustang.
#
#                   If not provided, defaults to **TSeparator**.
#
# **-cmenu**        Specifies the contextual menu address that will be assigned to the widget.
#                   If the *cmenu* value is the empty string or invalid, the contextual menu of the widget's toplevel (if any)
#                   will be used. If the widget's toplevel doesn't have a contextual menu, nothing will happen.
#
#                   If not provided, defaults to the empty string.
#
# **-cursor**       Specifies the mouse cursor to be used for the widget.
#                   If an empty string is specified, it indicates that the widget should defer to it's parent for
#                   cursor specification.
#
#                   See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                   Note: This is a styleable option.
#
#                         If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                  Only the developer can.
#
#                         If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                  If there isn't one, the **-cursor** of the **TSeparator** style
#                                                  will be used instead.
#                                                  The **-cursor** will not abide by its mapping values, if any.
#                                                  It is not supposed to change when the widget state changes.
#
# **-orient**       Specifies the orientation of the separator (**horizontal** or **vertical**).
#
#                   Note: This option may only be provided while creating the widget.
#                         Attempts to change this value after the widget is created by using the **configure** command,
#                         will be ignored by mustang.
#
#                   If not provided, defaults to **horizontal**.
#
# **-state**        Specifies the state for the widget.
#
#                   Note: Separators have only the **normal** state.
#
#                   Note: This option will be ignored if provided while creating the widget.
#                         Attempts to change this value after the widget was created, by using the **configure** command,
#                         will be ignored by mustang.
#                         This option can only be retrieved.
#
#                   It's set to **normal**.
#
# **-style**        Specifies a custom widget style.
#                   If not provided, defaults to **TSeparator**.
#
#                   The *style* provided should already exists at the time the widget is created.
#
#                   See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**    Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                   and **Shift-Tab**).
#
#                   Before setting the focus to a widget, the traversal scripts consult the value of the
#                   *-takefocus* option.
#                      **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                      **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                and all of its ancestors are mapped.
#
#                   Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                   If not provided, defaults to **0**.
#
#### WIDGET COMMAND:
#
# The separator command creates a new command whose name is the same as the pathname of the separator's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the separator widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# The following commands are possible for separator widgets:
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the separator command (See **WIDGET OPTIONS**).
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
# The separator widget supports only the **normal** state.
#
#### STYLING OPTIONS:
#
# Default style name: **TSeparator**
#
# Every separator styleable option is supported and configurable with the [style](/wiki/commands/style.md) command.
# Valid styleable options of other widgets will be ignored.
# It is considered an error providing style options that are not managed by mustang or Tk.
#
# See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# The background separator styling option is allowed only for themes that follows the **clam** engine (like the **Halo** theme) and ignored
# by any other engine.
#
#### BINDINGS:
#
# Mustang automatically creates several bindings for the separators in order to facilitate the developer work and augment the
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
# The following behavior will happen if the widget has the focus. Mustang will try to find the innermost widget's scrollable
# parent with an active vertical/horizontal scrollbar and scroll that scrollbar.
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
# FocusIn/FocusOut**.
#
###### ALTERNATIVE BINDINGS:
#
# Check the [event](/wiki/commands/event.md) wiki page to see alternative keystrokes in case some keys are not present in
# the user keyboard like the *Delete*, *Arrows*, *Home*, *End*, *PageUp* or *PageDown* keys.
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
#   # Create an horizontal separator.
#   separator .sep -orient horizontal
#
#   # Pack it.
#   pack .sep -expand true \
#               -fill x \
#               -padx 10 \
#               -pady 20 \
#               -side top;
#
#   # After 3 seconds, change the accent color.
#   after 3000 [list set ::ms::accent orange]
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
package provide ::ms::separator 0.1

#################################
##                             ##
##     _SEPARATOR BINDINGS     ##
##                             ##
#################################

# Activate/Deactivate
_bind _Separator <Activate>   { interp invokehidden {} %W state [list !background]; break }
_bind _Separator <Deactivate> { interp invokehidden {} %W state [list  background]; break }

# Contextual menu
_bind _Separator <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Separator <Destroy> { ::ms::separator::Destroy %W; break }

# Enter/Leave
_bind _Separator <Enter> { interp invokehidden {} %W state [list  hover]; break }
_bind _Separator <Leave> { interp invokehidden {} %W state [list !hover]; break }

# FocusIn/FocusOut
_bind _Separator <FocusIn>  { interp invokehidden {} %W state [list focus]; break }
_bind _Separator <FocusOut> { ::ms::separator::FocusOut %W; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Separator <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Separator <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Separator <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Separator <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Separator <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Separator <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **separator** package.
namespace eval ::ms::separator {
    # Set the 'non styleable' separator option list.
    set ::ms::separator(non_styleable,options) [list class \
                                                     cmenu \
                                                     orient \
                                                     state \
                                                     style \
                                                     takefocus];

    # Set the 'styleable' separator option list.
    set ::ms::separator(styleable,options) [list background \
                                                 cursor];

    # Set the default 'non-styleable' separator options values.
    set ::ms::default(separator,class)     TSeparator
    set ::ms::default(separator,cmenu)     {}
    set ::ms::default(separator,orient)    horizontal
    set ::ms::default(separator,state)     normal
    set ::ms::default(separator,style)     TSeparator
    set ::ms::default(separator,takefocus) 0

    # Note: The default 'styleable' separator options values are always defined inside the current theme.
}

# Rename the original Tk **ttk::separator** command.
rename ttk::separator _ttk_separator

# Create aliases for the mustang **separator** command.
interp alias {} separator      {} ::ms::separator::Command
interp alias {} ttk::separator {} ::ms::separator::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::separator** widget command.
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
proc ::ms::separator::Command { window { args "" } } {
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
            set ::ms::default($w,class)     $::ms::default(separator,class)
            set ::ms::default($w,cmenu)     $::ms::default(separator,cmenu)
            set ::ms::default($w,orient)    $::ms::default(separator,orient)
            set ::ms::default($w,state)     $::ms::default(separator,state)
            set ::ms::default($w,style)     $::ms::default(separator,style)
            set ::ms::default($w,takefocus) $::ms::default(separator,takefocus)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)     $::ms::default(separator,class)
            set ::ms::current($w,cmenu)     $::ms::default(separator,cmenu)
            set ::ms::current($w,orient)    $::ms::default(separator,orient)
            set ::ms::current($w,state)     $::ms::default(separator,state)
            set ::ms::current($w,style)     $::ms::default(separator,style)
            set ::ms::current($w,takefocus) $::ms::default(separator,takefocus)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) separator

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
            #       To make a separator styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **separator** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background) Tk
            set ::ms::managed_by($w,cursor)     Tk

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
                    -orient {
                        set value [string tolower $value]
                        switch -- $value {
                            horizontal -
                            vertical   { set ::ms::current($w,orient) $value }
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
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::separator(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TSeparator,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
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
                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TSeparator]]
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'cursor' is not allowed to change if the statespec changes.

            #######################
            ##                   ##
            ##     SEPARATOR     ##
            ##                   ##
            #######################

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                   "." $parent_style];

            # If needed, create the widget style.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget) -background $::ms::current($w,background)

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

            # If needed, create the widget mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,widget) {*}$mapping

                # Add the widget mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the separator widget.
            _ttk_separator $w     -class $::ms::current($w,class) \
                                 -cursor $::ms::current($w,cursor) \
                                 -orient $::ms::current($w,orient) \
                                  -style $::ms::style($w,widget) \
                              -takefocus $::ms::current($w,takefocus);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TSeparator { _bindtags $w [list $w _Separator TSeparator $::ms::addr($w,toplevel) all] }
                default    { _bindtags $w [list $w $::ms::current($w,class) _Separator TSeparator $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::separator::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::separator::Pathname_Cmd $w]
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

            # Add the widget address to the separator widgets real address list.
            lappend ::ms::addr(separator) $w

            # Add the widget address to the separator classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),separator,addrs) $w

            # Add the widget address to the separator classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),separator,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the separator classtype.
            if { $::ms::current($w,style) ni $::ms::style(separator,classtype) } {
                lappend ::ms::style(separator,classtype) $::ms::current($w,style)
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
proc ::ms::separator::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::separator(non_styleable,options)) || ($option in $::ms::separator(styleable,options)) } {
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
                    foreach option $::ms::separator(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::separator(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::separator(non_styleable,options)) || ($option in $::ms::separator(styleable,options)) } {
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
                                    -orient -
                                    -state  {}
                                    -style  {
                                        if { $value ni $::ms::style($::ms::theme) } {
                                            continue
                                        }

                                        # Check if exists a layout for the style provided.
                                        # If not, create one by mirroring the current theme 'TSeparator' layout.
                                        if { $value ni $::ms::layouts($::ms::theme) } {
                                            _ttk_style layout $value [_ttk_style layout TSeparator]
                                        }

                                        # Remove the widget address from the separator classtype real address list that contains all the
                                        # widgets addresses with style '::ms::current($w,style)'.
                                        set index [lsearch -exact $::ms::style($::ms::current($w,style),separator,addrs) $w]
                                        switch -- $index {
                                            -1      {}
                                            default { set ::ms::style($::ms::current($w,style),separator,addrs) [lremove $::ms::style($::ms::current($w,style),separator,addrs) $index] }
                                        }

                                        # Add the widget address to the address list that contains all the
                                        # widgets addresses with style 'value'.
                                        lappend ::ms::style($value,separator,addrs) $w

                                        # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                        # for the separator classtype.
                                        switch -- [llength $::ms::style($::ms::current($w,style),separator,addrs)] {
                                            0   {
                                                set index [lsearch -exact $::ms::style(separator,classtype) $::ms::current($w,style)]
                                                switch -- $index {
                                                    -1      {}
                                                    default { set ::ms::style(separator,classtype) [lremove $::ms::style(separator,classtype) $index] }
                                                }
                                            }
                                        }

                                        # If needed, add 'value' to the available styles for the separator classtype.
                                        if { $value ni $::ms::style(separator,classtype) } {
                                            lappend ::ms::style(separator,classtype) $value
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
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TSeparator,$option)

                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
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
                                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TSeparator]]
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'cursor' is not allowed to change if the statespec changes.

                            #######################
                            ##                   ##
                            ##     SEPARATOR     ##
                            ##                   ##
                            #######################

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                                   "." $parent_style];

                            # If needed, create the widget style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget) -background $::ms::current($w,background)

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

                            # If needed, create the widget mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,widget) {*}$mapping

                                # Add the widget mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure    -cursor $::ms::current($w,cursor) \
                                                                    -style $::ms::style($w,widget) \
                                                                -takefocus $::ms::current($w,takefocus);

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

            # Execute the command.
            try {
                interp invokehidden {} $w identify element $x $y
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return "Separator.line"
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
# Update any separator widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::separator::Style_Update { stylename caller_info } {
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

        # If the parent style layout is not known by mustang, set it as the current theme layout orientation.
        if { $parent_style($orient) ni $::ms::layouts($::ms::theme) } {
            _ttk_style layout $parent_style($orient) [_ttk_style layout [string cat $dir "." TSeparator]]
        }
    }

    # Update all the separator widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,separator,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::separator(styleable,options) {
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

        #######################################
        ##                                   ##
        ##     UPDATE THE WIDGET'S STYLE     ##
        ##                                   ##
        #######################################

        # Note: 'cursor' is not allowed to change if the statespec changes.

        #######################
        ##                   ##
        ##     SEPARATOR     ##
        ##                   ##
        #######################

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                               "." $parent_style($::ms::current($w,orient))];

        # If needed, create the widget style.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget) -background $::ms::current($w,background)

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

        # If needed, create the widget mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,widget) {*}$mapping

            # Add the widget mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        interp invokehidden {} $w configure -cursor $::ms::current($w,cursor) \
                                             -style $::ms::style($w,widget);
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
proc ::ms::separator::Destroy { w } {
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

    # Remove the widget address from the separator widgets real address list.
    set index [lsearch -exact $::ms::addr(separator) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(separator) [lremove $::ms::addr(separator) $index] }
    }

    # Remove the widget address from the separator classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),separator,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),separator,addrs) [lremove $::ms::class($::ms::current($w,class),separator,addrs) $index] }
    }

    # Remove the widget address from the separator classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),separator,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),separator,addrs) [lremove $::ms::style($::ms::current($w,style),separator,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the separator classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),separator,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(separator,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(separator,classtype) [lremove $::ms::style(separator,classtype) $index] }
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
                         ::ms::current($w,class) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,orient) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,background) \
                         ::ms::default($w,class) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,orient) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,cursor);

    unset -nocomplain -- ::ms::style($w,widget)

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
proc ::ms::separator::FocusOut { w } {
    # Check if a contextual menu was assigned to the widget.
    # If not, use the contextual menu of the widget's toplevel.
    set cmenu $::ms::current($w,cmenu)
    switch -- $cmenu {
        ""  { set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu) }
    }

    # If 'cmenu' exists (meaning it's open), do not loose the focus (graphically).
    switch -- [_winfo exists $cmenu] {
        0   { interp invokehidden {} $w state [list !focus] }
        1   { interp invokehidden {} $w state [list  focus] }
    }

    return ""
}

#*EOF*