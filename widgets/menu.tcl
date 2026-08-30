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

# menu
#
#### DESCRIPTION:
#
# Create and manipulate 'menu' widgets and menubars.
# The menu command creates a new top-level window (given by the pathName argument) and makes it into a menu widget.
# That menu widget can either be used as a pop-up window or applied to a toplevel (with its **-menu** option) to make it into the menubar for that toplevel.
#
# A menu is a widget that displays a collection of one-line entries arranged in one or more columns.
# There exist several different types of entries, each with different properties.
# Entries of different types may be combined in a single menu. Menu entries are not the same as entry widgets.
# In fact, menu entries are not even distinct widgets; the entire menu is one widget.
#
# Menu entries are displayed with up to three separate fields.
# The main field is a label in the form of a text string, a bitmap, or an image, controlled by the **-label**, **-bitmap**, and **-image** options for the entry.
# If the **-accelerator** option is specified for an entry then a second textual field is displayed to the right of the label.
# The accelerator typically describes a keystroke sequence that may be used in the application to cause the same result as invoking the menu entry.
# This is a display option, it does not actually set the corresponding binding (which can be achieved using the bind command).
# The third field is an indicator. The indicator is present only for checkbutton or radiobutton entries.
# It indicates whether the entry is selected or not, and is displayed to the left of the entry's string.
#
# In normal use, an entry becomes active (displays itself differently) whenever the mouse pointer is over the entry.
# If a mouse button is released over the entry then the entry is invoked.
# The effect of invocation is different for each type of entry; these effects are described below in the sections on individual entries.
#
# Entries may be disabled, which causes their labels and accelerators to be displayed with dimmer colors.
# The default menu bindings will not allow a disabled entry to be activated or invoked.
# Disabled entries may be re-enabled, at which point it becomes possible to activate and invoke them again.
#
# Whenever a menu's active entry is changed, a **<<MenuSelect>>** virtual event is send to the menu.
# The active item can then be queried from the menu, and an action can be taken, such as setting context-sensitive help text for the entry.
#
# Note: At the time this command is invoked, there must not exist a window with the same pathname,
#       but the pathname's parents must exists.
#       *Window* may be provided either as a short or as a real address, the address returned will be:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
# Additional options, described below, may be specified on the command line to configure aspects of the menu.
#
#### SYNOPSIS:
#
#   **menu** *window* ?*option* *value*? ... ?*option* *value*?
#
#### WIDGET OPTIONS:
#
# Note: Every option listed here can be:
#          - Retrieved with the **configure** or **cget** command with no exceptions.
#          - Changed with the **configure** command, unless stated otherwise.
#
#
# **-activebackground**     It's a list that specifies the color to use as active background.
#                           See the **COLOR OPTION** section to know how this list should be composed.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-activebackground** specified in its style.
#                                                          If there isn't one, the **-activebackground** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-activebackground** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-activeforeground**, **-background** and **-foreground**.
#
# **-activeborderwidth**    Specifies the width of the three-dimensional border to draw around the outside of the active entry,
#                           if such a border is being drawn.
#                           The **-activerelief** option typically determines this.
#
#                           The value may also be used when drawing three-dimensional effects in the widget's interior.
#                           The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                           (pixels, points, inches, millimeters or centimeters).
#
#                           Note: A value of **0** means no border.
#
#                           Note: Only working with active reliefs that are not *flat*.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-activeborderwidth** specified in its style.
#                                                          If there isn't one, the **-activeborderwidth** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-activeborderwidth** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-activerelief**.
#
# **-activeforeground**     It's a list that specifies the color to use as active foreground.
#                           See the **COLOR OPTION** section to know how this list should be composed.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-activeforeground** specified in its style.
#                                                          If there isn't one, the **-activeforeground** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-activeforeground** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-activebackground**, **-background** and **-foreground**.
#
# **-activerelief**         Specifies the three-dimensional effect desired for the active entry.
#                           The value indicates how the entry's interior should appear relative to its exterior.
#                           For example, *raised* means the entry's interior should appear to protrude from the screen,
#                           relative to the exterior of the entry.
#
#                           The entry will accept as active relief any of the following values:
#                              **flat**,
#                              **groove**,
#                              **raised**,
#                              **ridge**,
#                              **solid**,
#                              **sunken**.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-activerelief** specified in its style.
#                                                          If there isn't one, the **-activerelief** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-activerelief** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-activeborderwidth**.
#
# **-background**           It's a list that specifies the color to use as background.
#                           See the **COLOR OPTION** section to know how this list should be composed.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-background** specified in its style.
#                                                          If there isn't one, the **-background** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-background** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-activebackground**, **-activeforeground** and **-foreground**.
#
#
# **-borderwidth**          Specifies the width of the three-dimensional border to draw around the outside of the widget,
#                           if such a border is being drawn.
#                           The **-relief** option typically determines this.
#
#                           The value may also be used when drawing three-dimensional effects in the widget's interior.
#                           The value may have any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)
#                           (pixels, points, inches, millimeters or centimeters).
#
#                           Note: A value of **0** means no border.
#
#                           Note: Only working with reliefs that are not *flat*.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-borderwidth** specified in its style.
#                                                          If there isn't one, the **-borderwidth** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-borderwidth** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-relief**.
#
# **-class**                Specifies a class for the widget.
#                           It is mainly used to make bindings for widgets that have the same class.
#
#                           Note: This option may only be provided while creating the widget.
#                                 Attempts to change this value after the widget is created by using the **configure** command,
#                                 will be ignored by mustang.
#
#                           If not provided, defaults to **Menu**.
#
# **-cursor**               Specifies the mouse cursor to be used inside the widget.
#                           If an empty string is specified, it indicates that the widget should defer to it's parent for
#                           cursor specification.
#
#                           See the [cursors](/wiki/cursors/index.md) wiki page to know which cursors are allowed.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-cursor** specified in its style.
#                                                          If there isn't one, the **-cursor** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-cursor** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
# **-font**                 Specifies the font to use for the text displayed by the widget.
#                           The widget will accept as fontname any font created with the **font** command, including any Tk
#                           defaults fonts, the new mustang fonts (**BiggestFont**, **BiggerFont**, **NormalFont**, **SmallerFont**,
#                           **SmallestFont** and **MonospaceFont**) or fonts defined by the developer itself.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-font** specified in its style.
#                                                          If there isn't one, the **-font** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-font** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-foreground**.
#
# **-foreground**           It's a list that specifies the color to use as foreground.
#                           See the **COLOR OPTION** section to know how this list should be composed.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-foreground** specified in its style.
#                                                          If there isn't one, the **-foreground** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-foreground** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-activebackground**, **-activeforeground** and **-background**.
#
# **-disabledforeground**   It's a list that specifies the color to use as disabled foreground.
#                           See the **COLOR OPTION** section to know how this list should be composed.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-disabledforeground** specified in its style.
#                                                          If there isn't one, the **-disabledforeground** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-disabledforeground** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-foreground**.
#
# **-postcommand**          It's a list that specifies a Tcl command to execute each time the menu is posted.
#                           The command is invoked by the post widget command before posting the menu.
#
#                           If not provided, defaults to the empty string (meaning no postcommand command).
#
# **-relief**               Specifies the three-dimensional effect desired for the widget.
#                           The value indicates how the widget's interior should appear relative to its exterior.
#                           For example, *raised* means the widget's interior should appear to protrude from the screen,
#                           relative to the exterior of the widget.
#
#                           The widget will accept as relief any of the following values:
#                              **flat**,
#                              **groove**,
#                              **raised**,
#                              **ridge**,
#                              **solid**,
#                              **sunken**.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-relief** specified in its style.
#                                                          If there isn't one, the **-relief** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-relief** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
#                           See also **-borderwidth**.
#
# **-selectcolor**          It's a list that specifies the color to use in the indicator when the check button or radio button is selected.
#                           See the **COLOR OPTION** section to know how this list should be composed.
#
#                           Note: This is a styleable option.
#
#                                 If it's provided     --> Styles, mappings and states events cannot change its value.
#                                                          Only the developer can.
#
#                                 If it's not provided --> The widget will follow the **-selectcolor** specified in its style.
#                                                          If there isn't one, the **-selectcolor** of the **Menu** style
#                                                          will be used instead.
#                                                          The **-selectcolor** will not abide by its mapping values, if any.
#                                                          It is not supposed to change when the widget state changes.
#
# **-state**                Specifies the physical state for the widget.
#
#                           Note: Menus have only the **normal** state.
#
#                           Note: This option will be ignored if provided while creating the widget.
#                                 Attempts to change this value after the widget was created, by using the **configure** command,
#                                 will be ignored by mustang.
#                                 This option can only be retrieved.
#
#                           It's set to **normal**.
#
# **-style**                Specifies a custom widget style.
#                           If not provided, defaults to **Menu**.
#
#                           The *style* provided should already exists at the time the widget is created.
#
#                           See the [style](/wiki/commands/style.md) wiki page to know more about styles.
#
# **-takefocus**            Determines whether or not the widget will accept the focus during keyboard traversal (e.g., **Tab**
#                           and **Shift-Tab**).
#
#                           Before setting the focus to a widget, the traversal scripts consult the value of the
#                           *-takefocus* option.
#                              **0** --> It means that the widget should be skipped entirely during keyboard traversal.
#                              **1** --> It means that the widget should receive the input focus as long as it is viewable
#                                        and all of its ancestors are mapped.
#
#                           Differently than Tk, mustang does not allow the empty string as a valid value.
#
#                           If not provided, defaults to **0**.
#
#### WIDGET COMMAND:
#
# The menu command creates a new command whose name is the same as the pathname of the menu's window.
# This command may be used to invoke various operations on the widget.
# It has the following general form:
#
#   *window* *action* ?*arg* *arg* ... *arg*?
#
# *Window* is the name of the command, which is the same as the menu widget pathname.
# *Actions* and the *arg*s determine the exact behavior of the *window* command.
#
# Note: Differently than any other widgets, the menu widget doesn't have the '-identify element', 'instate' or 'state' command.
#
# The following commands are possible for menu widgets:
#
#   *window* **activate** *index*
#     Change the state of the entry indicated by *index* to active and redisplay it using its active colors.
#     Any previously-active entry is deactivated.
#     If *index* is specified as the empty string, or if the specified entry is disabled, then the menu ends up with no active entry.
#
#     Returns an empty string.
#
#   *window* **add** *type* ?*id*? ?*option* *value*? ... ?*option* *value*?
#     Add a new entry to the bottom of the menu.
#     The new entry's type is given by *type* and must be one of **cascade**, **checkbutton**, **command**, **radiobutton** or **separator**,
#     or a unique abbreviation of one of the above.
#     If the *id* argument is specified, it is used as the entry identifier; *id* must not already exist in the menu.
#     Otherwise, a new unique identifier is generated.
#     If additional arguments are present, they specify the options listed in the **MENU ENTRY OPTIONS** section below.
#
#     The **add** widget command returns the *id* of the new entry.
#
#   *window* **cget** ?*option*?
#     Returns the current value of the option given by *option*.
#     *Option* may be one of the widget options accepted by the menu command (See **WIDGET OPTIONS**).
#
#   *window* **clone** *newWindow* ?*cloneType*?
#     Makes a clone of the current menu named *newWindow*.
#     This clone is a menu in its own right, but any changes to the clone are propagated to the original menu and vice versa.
#     *cloneType* can be **normal** or **menubar**.
#     Should not normally be called outside of the Tk library.
#
#     See the **CLONES** section for more information.
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
#   *window* **delete** *index1* ?*index2*?
#     Delete all of the menu entries between *index1* and *index2* inclusive.
#     If *index2* is omitted then it defaults to *index1*.
#
#   *window* **entrycget** *index* *option*
#     Returns the current value of a configuration option for the entry given by *index*.
#     *Option* may have any of the names described in the **MENU ENTRY OPTIONS** section below.
#
#   *window* **entryconfigure** *index* ?*option* *value*? ... ?*option* *value*?
#     This command is similar to the configure command, except that it applies to the options for an individual entry,
#     whereas configure applies to the options for the menu as a whole.
#     *Options* may have any of the values described in the **MENU ENTRY OPTIONS** section below.
#
#     If options are specified, options are modified as indicated in the command and the command returns an empty string.
#     If no options are specified, returns a list describing the current options for entry *index*.
#
#   *window* **id** *index*
#     Returns the id of the menu entry given by *index*.
#     This is the identifier that was assigned to the entry when it was created using the **add** or **insert** widget command.
#
#     Returns an empty string if index is equivalent to the empty string.
#
#   *window* **index** *index*
#     Returns the numerical index corresponding to *index*, or an empty string if index was specified as an empty string.
#
#   *window* **insert** *index* *type* ?*id*? ?*option* *value*? ... ?*option* *value*?
#     Same as the **add** widget command except that it inserts the new entry just before the entry given by *index*, instead of appending to the end of the menu.
#     The *type*, *id*, *option*, and *value* arguments have the same interpretation as for the **add** widget command.
#
#     The insert widget command returns the id of the new entry.
#
#   *window* **invoke** *index*
#     Invoke the action of the menu entry. See the sections on the individual entries below for details on what happens.
#     If the menu entry is disabled then nothing happens.
#     If the entry has a command associated with it then the result of that command is returned as the result of the invoke widget command.
#     Otherwise the result is an empty string.
#
#     Note: invoking a menu entry does not automatically unpost the menu; the default bindings normally take care of this before invoking the invoke widget command.
#
#   *window* **post** *x* *y* ?*index*?
#     Arrange for the menu to be displayed on the screen at the root-window coordinates given by *x* and *y*.
#     If an *index* is specified the menu will be located so that the entry with that index is displayed at the point.
#     These coordinates are adjusted if necessary to guarantee that the entire menu is visible on the screen.
#
#     This command normally returns an empty string.
#
#     If the **-postcommand** option has been specified, then its value is executed as a Tcl script before posting the menu and the result of that script
#     is returned as the result of the post widget command.
#
#     If an error returns while executing the command, then the error is returned without posting the menu.
#
#   *window* **postcascade** *index*
#     Posts the submenu associated with the cascade entry given by *index*, and unposts any previously posted submenu.
#     If *index* does not correspond to a cascade entry, or if *window* is not posted, the command has no effect except to unpost any currently posted submenu.
#
#   *window* **type** *index*
#     Returns the type of the menu entry given by *index*.
#     This is the type argument passed to the **add** or **insert** widget command when the entry was created, such as command or separator.
#
#   *window* **unpost**
#     Unmap the window so that it is no longer displayed.
#     If a lower-level cascaded menu is posted, unpost that menu.
#
#     Returns an empty string.
#
#     Note: This subcommand does not work on **Windows** and the **Macintosh**, as those platforms have their own way of unposting menus.
#
#   *window* **style**
#     Return the style used by the widget.
#
#   *window* **xposition** *index*
#     Returns a decimal string giving the x-coordinate within the menu window of the leftmost pixel in the entry specified by *index*.
#
#   *window* **yposition** *index*
#     Returns a decimal string giving the y-coordinate within the menu window of the topmost pixel in the entry specified by *index*.
#
#### INDEXES:
#
# Many of the widget commands for a menu take as one argument an indicator of which entry of the menu to operate on.
# These indicators are called indexes and may be specified in any of the following forms:
#
#   **active**
#     Indicates the entry that is currently active.
#     If no entry is active then this form is equivalent to the empty string.
#
#     This form may not be abbreviated.
#
#   **end**
#     Indicates the bottommost entry in the menu.
#     If there are no entries in the menu then this form is equivalent to the empty string.
#
#     This form may not be abbreviated.
#
#   **last**
#     Same as **end**.
#
#   **{}**
#     Indicates 'no entry at all'; this is used most commonly with the activate option to deactivate all the entries in the menu.
#     In most cases the specification of an empty string causes nothing to happen in the widget command.
#
#   *@x,y*
#     Indicates the entry that covers the point in the menu's window specified by *x* and *y* (in pixel coordinates).
#     If no entry covers that point, then this form is equivalent to the empty string.
#
#     If only a single number is specified, it is treated as the *y-coordinate*.
#
#   *number*
#     Specifies the entry numerically, where **0** corresponds to the top-most entry of the menu, **1** to the entry below it, and so on and so forth.
#
#   *id*
#     If the index does not satisfy one of the above forms then the menu is searched for an entry with the specified id.
#
#   *pattern*
#     If all of the above methods for finding an entry fail, this form is used.
#     Pattern is pattern-matched against the label of each entry in the menu, in order from the top down, until a matching entry is found.
#     The rules of string match are used.
#
# If the index could match more than one of the above forms, then the form earlier in the above list takes precedence.
# Indexes support the same simple interpretation as for the command string index, with simple integer index arithmetic and indexing relative to end.
#
#### TYPES OF ENTRIES:
#
###### COMMAND ENTRIES:
#
# The most common kind of menu entry is a command entry, which behaves much like a button widget.
# When a command entry is invoked, a Tcl command is executed.
# The Tcl command is specified with the *-command* option.
#
###### SEPARATOR ENTRIES:
#
# A separator is an entry that is displayed as a horizontal dividing line.
# A separator may not be activated or invoked, and it has no behavior other than its display appearance.
#
###### CHECKBUTTON ENTRIES:
#
# A checkbutton menu entry behaves much like a checkbutton widget.
# When it is invoked it toggles back and forth between the selected and deselected states.
#
# When the entry is selected, a particular value is stored in a particular global variable (as determined by the *-onvalue* and *-variable* options for the entry).
# When the entry is deselected another value (determined by the *-offvalue* option) is stored in the global variable.
#
# An indicator box is displayed to the left of the label in a checkbutton entry.
# If the entry is selected then the indicator's center is displayed in the color given by the *-selectcolor* option for the entry; otherwise the indicator's center
# is displayed in the background color for the menu.
#
# If a *-command* option is specified for a checkbutton entry, then its value is evaluated as a Tcl command each time the entry is invoked.
# This happens after toggling the entry's selected state.
#
###### RADIOBUTTON ENTRIES:
#
# A radiobutton menu entry behaves much like a radiobutton widget.
# Radiobutton entries are organized in groups of which only one entry may be selected at a time.
#
# Whenever a particular entry becomes selected it stores a particular value into a particular global variable (as determined by the *-value* and *-variable*
# options for the entry).
# This action causes any previously-selected entry in the same group to deselect itself.
# Once an entry has become selected, any change to the entry's associated variable will cause the entry to deselect itself.
#
# Grouping of radiobutton entries is determined by their associated variables: if two entries have the same associated variable then they are in the same group.
#
# An indicator diamond is displayed to the left of the label in each radiobutton entry.
# If the entry is selected then the indicator's center is displayed in the color given by the *-selectcolor* option for the entry; otherwise the indicator's center
# is displayed in the background color for the menu.
#
# If a *-command* option is specified for a radiobutton entry, then its value is evaluated as a Tcl command each time the entry is invoked.
# This happens after selecting the entry.
#
###### CASCADE ENTRIES:
#
# A cascade entry is one with an associated menu (determined by the *-menu* option).
# Cascade entries allow the construction of cascading menus.
# The postcascade widget command can be used to post and unpost the associated menu just next to of the cascade entry.
# The associated menu must be a child of the menu containing the cascade entry (this is needed in order for menu traversal to work correctly).
#
# A cascade entry posts its associated menu by invoking a Tcl command of the form:
#
#    *window* **post** *x* *y*
#
# where *window* is the pathname of the associated menu, and *x* and *y* are the root-window coordinates of the upper-right corner of the cascade entry.
# On Unix, the lower-level menu is unposted by executing a Tcl command with the form
#
#    *window* **unpost**
#
# where *window* is the pathname of the associated menu.
# On other platforms, the platform's native code takes care of unposting the menu.
#
# If a *-command* option is specified for a cascade entry then it is evaluated as a Tcl command whenever the entry is invoked.
# This is not supported on Windows.
#
#### MENU ENTRY OPTIONS:
#
# The following options are allowed on menu entries. Most options are not supported by all entry types.
#
#   **-activebackground** *value*
#       Specifies a background color to use for displaying this entry when it is active.
#       This option is ignored on **Aqua/macOS**.
#       If it is specified as an empty string (the default), then the **-activebackground** option for the overall menu is used.
#
#       This option is not available for separator entries.
#
#   **-activeforeground** *value*
#       Specifies a foreground color to use for displaying this entry when it is active.
#       This option is ignored on **Aqua/macOS**.
#       If this option is specified as an empty string (the default), then the **-activeforeground** option for the overall menu is used.
#
#   **-accelerator** *value*
#       Specifies a string to display at the right side of the menu entry.
#       Normally describes an accelerator keystroke sequence that may be used to invoke the same function as the menu entry.
#       This is a display option, it does not actually set the corresponding binding (which can be achieved using the bind command).
#
#       This option is not available for separator entries.
#
#   **-background** *value*
#       Specifies a background color to use for displaying this entry when it is in the normal state (neither active nor disabled).
#       This option is ignored on **Aqua/macOS**.
#       If it is specified as an empty string (the default), then the **-background** option for the overall menu is used.
#
#       This option is not available for separator entries.
#
#   **-bitmap** *value*
#       Specifies a bitmap to display in the menu instead of a textual label, in any of the forms accepted by Tk_GetBitmap.
#       This option overrides the **-label** option (as controlled by the **-compound** option) but may be reset to an empty string to
#       enable a textual label to be displayed.
#       If a **-image** option has been specified, it overrides **-bitmap**.
#
#       This option is not available for separator entries.
#
#   **-columnbreak** *value*
#       When this option is zero, the entry appears below the previous entry.
#       When this option is one, the entry appears at the top of a new column in the menu.
#       This option is ignored on **Aqua/macOS**, where menus are always a single column.
#
#   **-command** *value*
#       Specifies a Tcl command to execute when the menu entry is invoked.
#
#       This option is not available for separator entries.
#
#   **-compound** *value*
#       Specifies whether the menu entry should display both an image and text, and if so, where the image should be placed relative to the text.
#       Valid values for this option are **bottom**, **center**, **left**, **none**, **right** and **top**.
#       The default value is **none**, meaning that the button will display either an image or text, depending on the values of the **-image** and **-bitmap** options.
#
#       This option is not available for separator entries.
#
#   **-font** *value*
#       Specifies the font to use when drawing the label or accelerator string in this entry.
#       If this option is specified as an empty string (the default) then the **-font** option for the overall menu is used.
#
#       This option is not available for separator entries.
#
#   **-foreground** *value*
#       Specifies a foreground color to use for displaying this entry when it is in the normal state (neither active nor disabled).
#       This option is ignored on **Aqua/macOS**.
#       If it is specified as an empty string (the default), then the **-foreground** option for the overall menu is used.
#
#       This option is not available for separator entries.
#
#   **-hidemargin** *value*
#       Specifies whether the standard margins should be drawn for this menu entry.
#       This is useful when creating palette with images in them, i.e., color palettes, pattern palettes, etc. **1** indicates that the margin for the entry is hidden;
#       **0** means that the margin is used.
#
#       This option is not available for separator entries.
#
#   **-image** *value*
#       Specifies an image to display in the menu instead of a text string or bitmap.
#       The image must have been created by some previous invocation of image create.
#       This option overrides the **-label** and **-bitmap** options (as controlled by the **-compound** option) but may be reset to an empty string
#       to enable a textual or bitmap label to be displayed.
#
#       This option is not available for separator entries.
#
#   **-indicatoron** *value*
#       Available only for checkbutton and radiobutton entries.
#       *Value* is a boolean that determines whether or not the indicator should be displayed.
#
#   **-label** *value*
#       Specifies a string to display as an identifying label in the menu entry.
#
#       Note: Differently than the other widgets, the menu doesn't do autotranslations.
#
#       This option is not available for separator entries.
#
#   **-menu** *value*
#       Available only for cascade entries.
#       Specifies the path name of the submenu associated with this entry.
#       The submenu must be a child of the menu.
#
#   **-offvalue** *value*
#       Available only for checkbutton entries.
#       Specifies the value to store in the entry's associated variable when the entry is deselected.
#
#   **-onvalue** *value*
#       Available only for checkbutton entries.
#       Specifies the value to store in the entry's associated variable when the entry is selected.
#
#   **-selectcolor** *value*
#       Available only for checkbutton and radiobutton entries.
#       Specifies the color to display in the indicator when the entry is selected.
#       If *value* is an empty string (the default) then the -selectcolor option for the menu determines the indicator color.
#
#   **-selectimage** *value*
#       Available only for checkbutton and radiobutton entries.
#       Specifies an image to display in the entry (in place of the **-image** option) when it is selected.
#       *Value* is the name of an image, which must have been created by some previous invocation of image create.
#       This option is ignored unless the **-image** option has been specified.
#
#   **-state** *value*
#       Specifies one of three states for the entry: **normal**, **active**, or **disabled**.
#       In **normal** state the entry is displayed using the **-foreground** option for the menu and the **-background** option from the entry or the menu.
#       The **active** state is typically used when the pointer is over the entry.
#       In active state the entry is displayed using the **-activeforeground** option for the menu along with the **-activebackground** option from the entry.
#       **Disabled** state means that the entry should be insensitive: the default bindings will refuse to activate or invoke the entry.
#       In this state the entry is displayed according to the **-disabledforeground** option for the menu and the **-background** option from the entry.
#
#       This option is not available for separator entries.
#
#   **-underline** *value*
#       Specifies the integer index of a character to underline in the entry.
#       This option is also queried by the default bindings and used to implement keyboard traversal.
#       **0** corresponds to the first character of the text displayed in the entry, **1** to the next character, and so on and so forth.
#       If a bitmap or image is displayed in the entry then this option is ignored.
#
#       This option is not available for separator entries.
#
#   **-value** *value*
#       Available only for radiobutton entries.
#       Specifies the value to store in the entry's associated variable when the entry is selected.
#       If an empty string is specified, then the **-label** option for the entry as the value to store in the variable.
#
#   **-variable** *value*
#       Available only for checkbutton and radiobutton entries.
#       Specifies the name of a global variable to set when the entry is selected.
#
#       For radiobutton entries, changing the variable causes the currently-selected entry to deselect itself.
#       For checkbutton entries the variable is also set when the entry is deselected.
#
#       For checkbutton entries, the default value of this option is taken from the **-label** option, and for radiobutton entries a single fixed value is used.
#       It is recommended that you always set the **-variable** option when creating either a checkbutton or a radiobutton.
#
#### MENUBARS:
#
# Any menu can be set as a menubar for a toplevel window (see toplevel command for syntax).
# On the **Macintosh**, whenever the toplevel is in front, this menu's cascade items will appear in the menubar across the top of the main screen.
# On Windows and Unix, this menu's items will be displayed in a menubar across the top of the window.
#
# These menus will behave according to the interface guidelines of their platforms.
# In particular, since **macOS** requires that a menubar always be displayed for the active app, if no menu is assigned by a configure *-menu* for a
# certain toplevel then a standard default menu will be displayed whenever that toplevel has focus.
#
# For every menu set as a menubar, a clone menu is made. See the **CLONES** section for more information.
#
# As noted, menubars may behave differently on different platforms.
# One example of this concerns the handling of checkbuttons and radiobuttons within the menu.
# While it is permitted to put these menu elements on menubars, they may not be drawn with indicators on some platforms, due to system restrictions.
#
###### SPECIAL MENUS IN MENUBARS:
#
# Certain menus in a menubar will be treated specially.
#
# On the **Macintosh**, access to the special **Application**, **Window** and **Help** menus is provided.
# On **Windows**, access to the **Windows System** menu in each window is provided.
#
# In all cases, these menus must be created with the command name of the menubar menu concatenated with the special name.
# So for a menubar named **.menubar**, on the **Macintosh**, the special menus would be **.menubar.apple**, **.menubar.window** and **.menubar.help**
# On **Windows**, the special menu would be **.menubar.system**.
#
# When Tk sees a **.menubar.apple** menu as the first menu in a menubar on the **Macintosh**, that menu's contents make up the first items of
# the **Application** menu whenever the window containing the menubar is in front.
# After all of the Tk-defined items, the menu will have a separator, followed by all standard **Application** menu items.
# Such a **.apple** menu must be present in a menu when that menu is first configured as a toplevel's menubar, otherwise a default application menu
# (hidden from Tk) will be inserted into the menubar at that time and subsequent addition of a **.apple** menu will no longer result in it becoming
# the **Application** menu.
#
# When Tk sees a **.menubar.window** menu on the **Macintosh**, the menu's contents are inserted into the standard Window menu of the user's menubar
# whenever the window's menubar is in front.
# The first items in the menu are provided by **macOS**, and the names of the current toplevels are automatically appended after all the Tk-defined
# items and a separator.
# The **Window** menu on the *Mac* also allows toggling the window into a fullscreen state, and managing a tabbed window interface (multiple windows
# grouped into a single window) if supported by that version of the operating system.
#
# When Tk sees a **.menubar.help** menu on the **Macintosh**, the menu's contents are appended to the standard **Help** menu of the user's menubar
# whenever the window's menubar is in front.
# The first items in the menu are provided by **macOS**.
#
# When Tk sees a **System** menu on Windows, its items are appended to the system menu that the menubar is attached to.
# This menu is tied to the application icon and can be invoked with the mouse or by typing **Alt+Spacebar**.
# Due to limitations in the **Windows API**, any font changes, colors, images or bitmaps images will not appear in the system menu.
#
#### MENU CONFIGURATIONS:
#
# The default bindings support three different ways of using menus:
#
#   **Pulldown Menus in Menubar**
#       This is the most common case.
#       You create a menu widget that will become the menu bar.
#       You then add cascade entries to this menu, specifying the pull down menus you wish to use in your menu bar.
#       You then create all of the pulldowns. Once you have done this, specify the menu using the **-menu** option of the toplevel's widget command.
#
#       See the toplevel manual entry for details.
#
#   **Pulldown Menus in Menu Buttons**
#       This is the compatible way to do menu bars.
#       You create one menubutton widget for each top-level menu, and typically you arrange a series of menubuttons in a row in a menubar window.
#       You also create the top-level menus and any cascaded submenus, and tie them together with **-menu** options in menubuttons and cascade menu entries.
#       The top-level menu must be a child of the menubutton, and each submenu must be a child of the menu that refers to it.
#       Once you have done this, the default bindings will allow users to traverse and invoke the tree of menus via its menubutton.
#
#       See the menubutton manual entry for details.
#
#   **Popup Menus**
#       Popup menus typically post in response to a mouse button press or keystroke.
#       You create the popup menus and any cascaded submenus, then you call the tk_popup procedure at the appropriate time to post the top-level menu.
#
#### CLONES:
#
# When a menu is set as a menubar for a toplevel window a clone of the menu is made.
# This clone is a menu widget in its own right, but it is a child of the original.
# Changes in the configuration of the original are reflected in the clone.
# Additionally, any cascades that are pointed to are also cloned so that menu traversal will work right.
# Clones are destroyed when the menubar goes away, or when the original menu is destroyed.
#
#### STATES:
#
# The menu widget supports only the **normal** physical state.
#
#### STYLING OPTIONS:
#
# Default style name: **Menu**
#
#### BINDINGS:
#
# Tk automatically creates class bindings for menus that give them the following default behavior:
#
# 1 - When the mouse enters a menu, the entry underneath the mouse cursor activates; as the mouse moves around the menu, the active entry changes to track the mouse.
#
# 2 - When the mouse leaves a menu all of the entries in the menu deactivate, except in the special case where the mouse moves from a menu to a cascaded submenu.
#
# 3 - When a button is released over a menu, the active entry (if any) is invoked.
#     The menu also unposts unless it is a torn-off menu.
#
# 4 - The **Space** and **Return** keys invoke the active entry and unpost the menu.
#
# 5 - If any of the entries in a menu have letters underlined with the -underline option, then pressing one of the underlined letters
#     (or its upper-case or lower-case equivalent) invokes that entry and unposts the menu.
#
# 6 - The **Escape** key aborts a menu selection in progress without invoking any entry.
#     It also unposts the menu.
#
# 7 - The **Up** and **Down** keys activate the next higher or lower entry in the menu.
#     When one end of the menu is reached, the active entry wraps around to the other end.
#
# 8 - The **Left** key moves to the next menu to the left.
#     If the current menu is a cascaded submenu, then the submenu is unposted and the current menu entry becomes the cascade entry in the parent.
#     If the current menu is a top-level menu posted from a menubutton, then the current menubutton is unposted and the next menubutton to the left is posted.
#     Otherwise the key has no effect. The left-right order of menubuttons is determined by their stacking order: Tk assumes that the lowest menubutton
#     (which by default is the first one created) is on the left.
#
# 9 - The **Right** key moves to the next menu to the right.
#     If the current entry is a cascade entry, then the submenu is posted and the current menu entry becomes the first entry in the submenu.
#     Otherwise, if the current menu was posted from a menubutton, then the current menubutton is unposted and the next menubutton to the right is posted.
#
# Disabled menu entries are non-responsive: they do not activate and they ignore mouse button presses and releases.
# Several of the bindings make use of the command tk_menuSetFocus. It saves the current focus and sets the focus to its pathName argument, which is a menu widget.
# The behavior of menus can be changed by defining new bindings for individual widgets or by redefining the class bindings.
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
###### MENUBAR:
#
#   # Create the menubar.
#   menu .menubar
#
#   # Create two menuvoices ('File' and 'Edit').
#   .menubar add cascade -menu .menubar.file -label File -underline 0
#   .menubar add cascade -menu .menubar.edit -label Edit -underline 0
#
#   # Create the 'File' popdown menu voices.
#   menu .menubar.file
#   .menubar.file add cascade -label Import -menu .menubar.file.import -underline 0
#   .menubar.file add separator
#   .menubar.file add command -label Exit -underline 0 -command [list exit]
#
#   # Create the 'Edit' popdown menu voices.
#   menu .menubar.edit
#   .menubar.edit add command -label Copy  -command [list ::myCopyProc]
#   .menubar.edit add command -label Cut   -command [list ::myCutProc]
#   .menubar.edit add command -label Paste -command [list ::myPasteProc]
#
#   # Create the cascade menu linked to the 'File.Import' voice.
#   menu .menubar.file.import
#   .menubar.file.import add command -label "Import File"    -command [list ::myImportFileProc]
#   .menubar.file.import add command -label "Import Folder"  -command [list ::myImportFolderProc]
#   .menubar.file.import add command -label "Import Project" -command [list ::myImportProjectProc]
#
#   # Attach the menubar to the point toplevel.
#   . configure -menu .menubar
#
###### CONTEXTUAL MENU:
#
#   # Create the contextual menu.
#   menu .cmenu
#
#   # Create the contextual menu voices.
#   .cmenu add command -label Copy  -command [list ::myCopyProc]
#   .cmenu add command -label Cut   -command [list ::myCutProc]
#   .cmenu add command -label Paste -command [list ::myPasteProc]
#
#   # Set up the binding that will show the contextual menu whenever the **ButtonPress-2** (on Mac) or
#   # **ButtonPress-3** (on Linux and Windows) event happens upon the point toplevel.
#   bind . <<ContextMenu>> { cmenu .cmenu %X %Y }
package provide ::ms::menu 0.1

# Create the mustang **menu** package.
namespace eval ::ms::menu {
    # Set the 'non styleable' menu option list.
    set ::ms::menu(non_styleable,options) [list class \
                                                postcommand \
                                                state \
                                                style \
                                                takefocus];

    # Set the 'styleable' menu option list.
    set ::ms::menu(styleable,options) [list activebackground \
                                            activeborderwidth \
                                            activeforeground \
                                            activerelief \
                                            background \
                                            borderwidth \
                                            cursor \
                                            disabledforeground \
                                            font \
                                            foreground \
                                            relief \
                                            selectcolor];

    # Set the default 'non-styleable' menu options values.
    set ::ms::default(menu,class)       Menu
    set ::ms::default(menu,postcommand) {}
    set ::ms::default(menu,state)       normal
    set ::ms::default(menu,style)       Menu
    set ::ms::default(menu,takefocus)   0

    # Note: The default 'styleable' menu options values are always defined inside the current theme.
}

# Rename the original Tk **menu** command.
rename menu _menu

# Create an alias for the mustang **menu** command.
interp alias {} menu {} ::ms::menu::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **menu** widget command.
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
proc ::ms::menu::Command { window { args "" } } {
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
            set ::ms::default(menu,class)       $::ms::default(menu,class)
            set ::ms::default(menu,postcommand) $::ms::default(menu,postcommand)
            set ::ms::default(menu,state)       $::ms::default(menu,state)
            set ::ms::default(menu,style)       $::ms::default(menu,style)
            set ::ms::default(menu,takefocus)   $::ms::default(menu,takefocus)

            # Set the current widget (not styleable) options.
            set ::ms::current(menu,class)       $::ms::default(menu,class)
            set ::ms::current(menu,postcommand) $::ms::default(menu,postcommand)
            set ::ms::current(menu,state)       $::ms::default(menu,state)
            set ::ms::current(menu,style)       $::ms::default(menu,style)
            set ::ms::current(menu,takefocus)   $::ms::default(menu,takefocus)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) menu

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
            #       To make a menu styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **menu** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,activebackground)   Tk
            set ::ms::managed_by($w,activeborderwidth)  Tk
            set ::ms::managed_by($w,activeforeground)   Tk
            set ::ms::managed_by($w,activerelief)       Tk
            set ::ms::managed_by($w,background)         Tk
            set ::ms::managed_by($w,borderwidth)        Tk
            set ::ms::managed_by($w,cursor)             Tk
            set ::ms::managed_by($w,disabledforeground) Tk
            set ::ms::managed_by($w,font)               Tk
            set ::ms::managed_by($w,foreground)         Tk
            set ::ms::managed_by($w,relief)             Tk
            set ::ms::managed_by($w,selectcolor)        Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -activebackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,activebackground)    $value
                        set ::ms::managed_by($w,activebackground) developer
                    }
                    -activeborderwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,activeborderwidth)    $value
                        set ::ms::managed_by($w,activeborderwidth) developer
                    }
                    -activeforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,activeforeground)    $value
                        set ::ms::managed_by($w,activeforeground) developer
                    }
                    -background {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,background)    $value
                        set ::ms::managed_by($w,background) developer
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
                    -cursor {
                        set value [string tolower $value]
                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                            set ::ms::current($w,cursor)    $value
                            set ::ms::managed_by($w,cursor) developer
                        }
                    }
                    -disabledforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,disabledforeground)    $value
                        set ::ms::managed_by($w,disabledforeground) developer
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
                    -postcommand { set ::ms::current($w,postcommand) $value }
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
                    -selectcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,selectcolor)    $value
                        set ::ms::managed_by($w,selectcolor) developer
                    }
                    -state {}
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
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
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::menu(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Menu,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'activebackground', 'activeborderwidth', 'activeforeground', 'activerelief', 'activerelief', 'background', 'borderwidth', 'cursor',
            #       'disabledbackground', 'font', 'foreground', 'relief' and 'selectcolor' are not allowed to change if the statespec changes.

            # Create the widget.
            menu $w   -activebackground $::ms::current($w,activebackground) \
                     -activeborderwidth $::ms::current($w,activeborderwidth) \
                      -activeforeground $::ms::current($w,activeforeground) \
                          -activerelief $::ms::current($w,activerelief) \
                            -background $::ms::current($w,background) \
                           -borderwidth $::ms::current($w,borderwidth) \
                                -cursor $::ms::current($w,cursor) \
                    -disabledforeground $::ms::current($w,disabledforeground) \
                                  -font $::ms::current($w,font) \
                            -foreground $::ms::current($w,foreground) \
                           -postcommand $::ms::current($w,postcommand) \
                                -relief $::ms::current($w,relief) \
                           -selectcolor $::ms::current($w,selectcolor) \
                             -takefocus $::ms::current($w,takefocus) \
                               -tearoff 0 \
                        -tearoffcommand {} \
                                 -title {} \
                                  -type menubar;

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            _bindtags $w [list $w $::ms::current($w,class) Menu $::ms::addr($w,toplevel) all]

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::menu::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::menu::Pathname_Cmd $w]
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

            # Add the widget address to the menu widgets real address list.
            lappend ::ms::addr(menu) $w

            # Add the widget address to the menu classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),menu,addrs) $w

            # Add the widget address to the menu classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),menu,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the menu classtype.
            if { $::ms::current($w,style) ni $::ms::style(menu,classtype) } {
                lappend ::ms::style(menu,classtype) $::ms::current($w,style)
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
proc ::ms::menu::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        activate {
            # Synopsis:
            #
            # *window* **activate** *index*
            switch -- [llength $args] {
                1   {
                    # Execute the command.
                    try {
                        $w $cmd $args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        add {
            # Synopsis:
            #
            # *window* **add** *type* ?*id*? ?*option* *value* ... *option* *value**?
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    # Execute the command.
                    try {
                        $w add {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
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
                    if { ($option in $::ms::menu(non_styleable,options)) || ($option in $::ms::menu(styleable,options)) } {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid option, '$args'." $caller_info }
            }
        }
        clone  -
        delete {
            # Synopsis:
            #
            # *window* **clone** *newWindow* ?*cloneType*?
            # *window* **delete** *index1* ?*index2*?
            switch -- [llength $args] {
                1   -
                2   {
                    # Execute the command.
                    try {
                        $w $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
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
                    foreach option $::ms::menu(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::menu(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::menu(non_styleable,options)) || ($option in $::ms::menu(styleable,options)) } {
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

                            #################################################
                            ##                                             ##
                            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
                            ##                                             ##
                            #################################################

                            # Check the remaining options, if any.
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -activebackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,activebackground)    $value
                                        set ::ms::managed_by($w,activebackground) developer
                                    }
                                    -activeborderwidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,activeborderwidth)    $value
                                        set ::ms::managed_by($w,activeborderwidth) developer
                                    }
                                    -activeforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,activeforeground)    $value
                                        set ::ms::managed_by($w,activeforeground) developer
                                    }
                                    -background {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,background)    $value
                                        set ::ms::managed_by($w,background) developer
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
                                    -cursor {
                                        set value [string tolower $value]
                                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                                            set ::ms::current($w,cursor)    $value
                                            set ::ms::managed_by($w,cursor) developer
                                        }
                                    }
                                    -disabledforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,disabledforeground)    $value
                                        set ::ms::managed_by($w,disabledforeground) developer
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
                                    -postcommand { set ::ms::current($w,postcommand) $value }
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
                                    -selectcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,selectcolor)    $value
                                        set ::ms::managed_by($w,selectcolor) developer
                                    }
                                    -state {}
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Remove the widget address from the menu classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),menu,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),menu,addrs) [lremove $::ms::style($::ms::current($w,style),menu,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,menu,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the menu classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),menu,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(menu) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(menu) [lremove $::ms::style(menu) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the menu classtype.
                                            if { $value ni $::ms::style(menu) } {
                                                lappend ::ms::style(menu) $value
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
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
                                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Menu,$option)

                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'activebackground', 'activeborderwidth', 'activeforeground', 'activerelief', 'activerelief', 'background', 'borderwidth', 'cursor',
                            #       'disabledbackground', 'font', 'foreground', 'relief' and 'selectcolor' are not allowed to change if the statespec changes.

                            # Apply the changes.
                            interp invokehidden {} $w configure -activebackground $::ms::current($w,activebackground) \
                                                               -activeborderwidth $::ms::current($w,activeborderwidth) \
                                                                -activeforeground $::ms::current($w,activeforeground) \
                                                                    -activerelief $::ms::current($w,activerelief) \
                                                                      -background $::ms::current($w,background) \
                                                                     -borderwidth $::ms::current($w,borderwidth) \
                                                                          -cursor $::ms::current($w,cursor) \
                                                              -disabledforeground $::ms::current($w,disabledforeground) \
                                                                            -font $::ms::current($w,font) \
                                                                      -foreground $::ms::current($w,foreground) \
                                                                     -postcommand $::ms::current($w,postcommand) \
                                                                          -relief $::ms::current($w,relief) \
                                                                     -selectcolor $::ms::current($w,selectcolor) \
                                                                       -takefocus $::ms::current($w,takefocus);

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        entrycget {
            # Synopsis:
            #
            # *window* **entrycget** *index* *option*
            switch -- [llength $args] {
                2   {
                    # Execute the command.
                    try {
                        $w entrycget {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        entryconfigure {
            # Synopsis:
            #
            # *window* **entryconfigure** *index*
            # *window* **entryconfigure** *index* *option*
            # *window* **entryconfigure** *index* *option* *value*
            # *window* **entryconfigure** *index* *option* *value* ... ?*option* *value*?
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    # Execute the command.
                    try {
                        $w entryconfigure {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
            }
        }
        id          -
        index       -
        invoke      -
        postcascade -
        type        -
        xposition   -
        yposition   {}
        insert {
            # Synopsis:
            #
            # *window* **insert** *index* *type* ?*id*? ?*option* *value* ... *option* *value**?
            switch -- [llength $args] {
                0       -
                1       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    # Execute the command.
                    try {
                        $w insert {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { id } {
                        return $id
                    }
                }
            }
        }
        post {
            # Synopsis:
            #
            # *window* **post** *x* y* ?*index*?
            switch -- [llength $args] {
                2   -
                3   {
                    # Execute the command.
                    try {
                        $w post {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
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
        unpost {
            # Synopsis:
            #
            # *window* **unpost**
            switch -- [llength $args] {
                0   {
                    # Execute the command.
                    try {
                        $w unpost
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
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
# Update any menu widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::menu::Style_Update { stylename caller_info } {
     # Update all the menu widgets that have stylename as a style.
    foreach w $::ms::style($stylename,menu,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::menu(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Menu,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'activebackground', 'activeborderwidth', 'activeforeground', 'activerelief', 'activerelief', 'background', 'borderwidth', 'cursor',
        #       'disabledbackground', 'font', 'foreground', 'relief' and 'selectcolor' are not allowed to change if the statespec changes.

        # Apply the changes.
        interp invokehidden {} $w configure -activebackground $::ms::current($w,activebackground) \
                                           -activeborderwidth $::ms::current($w,activeborderwidth) \
                                            -activeforeground $::ms::current($w,activeforeground) \
                                                -activerelief $::ms::current($w,activerelief) \
                                                  -background $::ms::current($w,background) \
                                                 -borderwidth $::ms::current($w,borderwidth) \
                                                      -cursor $::ms::current($w,cursor) \
                                          -disabledforeground $::ms::current($w,disabledforeground) \
                                                        -font $::ms::current($w,font) \
                                                  -foreground $::ms::current($w,foreground) \
                                                      -relief $::ms::current($w,relief) \
                                                 -selectcolor $::ms::current($w,selectcolor);
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
proc ::ms::menu::Destroy { w } {
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

    # Remove the widget address from the menu widgets real address list.
    set index [lsearch -exact $::ms::addr(menu) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(menu) [lremove $::ms::addr(menu) $index] }
    }

    # Remove the widget address from the menu real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),menu,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),menu,addrs) [lremove $::ms::class($::ms::current($w,class),menu,addrs) $index] }
    }

    # Remove the widget address from the menu real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),menu,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),menu,addrs) [lremove $::ms::style($::ms::current($w,style),menu,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the menu classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),menu,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(menu,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(menu,classtype) [lremove $::ms::style(menu,classtype) $index] }
            }
        }
    }

    # Remove the widget real address from the list of all available real addresses.
    set index [lsearch -exact $::ms::addr(reals) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
    }

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,activebackground) \
                         ::ms::current($w,activeborderwidth) \
                         ::ms::current($w,activeforeground) \
                         ::ms::current($w,activerelief) \
                         ::ms::current($w,background) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,disabledforeground) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,postcommand) \
                         ::ms::current($w,selectcolor) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,activebackground) \
                         ::ms::default($w,activeborderwidth) \
                         ::ms::default($w,activeforeground) \
                         ::ms::default($w,activerelief) \
                         ::ms::default($w,background) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,disabledforeground) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,postcommand) \
                         ::ms::default($w,selectcolor) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus);

    unset -nocomplain -- ::ms::managed_by($w,activebackground) \
                         ::ms::managed_by($w,activeborderwidth) \
                         ::ms::managed_by($w,activeforeground) \
                         ::ms::managed_by($w,activerelief) \
                         ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,disabledforeground) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,relief) \
                         ::ms::managed_by($w,selectcolor);

    return ""
}

#*EOF*