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

# Symbols meanings that may be used by the procedure infos:
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

#########################
##                     ##
##     DEFINITIONS     ##
##                     ##
#########################

# **classtype**
#
#       Indicates the widget's type. It's always the name of the widget in lowercase characters.
#       The classtype is assigned by mustang and every widget have its own like **frame** for *frame*s,
#       **labelframe** for *labelframe*s and so on and so forth.
#
# **megawidget**
#
#       Indicates a group of widgets that works together to act, look and feel as if they were a single widget.
#       In mustang, the widgets used to construct a megawidget are called objects.
#       Note that any megawidgets internal objects do not have a classtype, only the megawidget hull has it.
#
# **real** and **short** addresses
#
#       In order to deliver new widget functionality (like native scrollbars) mustang will make use of *megawidgets*.
#       *Megawidget*s have a huge impact on the length of a widget pathname.
#
#       Mustang will call *real* address the official Tk pathname of a widget, including any megawidget internal objects
#       on his path.
#       A *short* address instead, refers only to the pathname created by the developer.
#       If in this pathname are present any megawidgets then the short address will contain only their hulls objects,
#       otherwise the short and real addresses of the widget will be the same.
#
#       Examples:
#
#         - No megawidgets are present in the widget pathname:
#           A simple frame called *frame* containing a single label called *label*.
#
#             .frame.label --> This is the short address.
#                              It's the *label* pathname that the developer have created.
#
#             .frame.label --> This is the real address.
#                              It's the *label* pathname that mustang will pass to Tk
#                              to create the label.
#
#         - A megawidget is present in the widget pathname:
#           A scrollable frame called *frame* containing a single label called *label*.
#
#             .frame.label --> This is the short address.
#                              It's the *label* pathname that the developer have created.
#
#             .frame.border.viewport.content.label --> This is the real address.
#                                                      It's the *label* pathname that mustang will pass to Tk
#                                                      to create the label.
#
#           In the above example *border*, *viewport* and *content* were not created by the developer but by mustang.
#           These are mustang objects that have been created in order to create a scrollable frame.
#           It is worth noting that the *frame* widget is also a mustang object, called *hull*, but differently from
#           any other objects of the example above, it is showed in the short address pathname.
#           That because the *hull* represents the placeholder for the entire megawidget structure other than acting
#           as an actual container.
#
#       You can use **tk get short** to transform a real address into a short address, and **tk get real** to
#       transform a short address into a real address.
#
#       Every command or widget accepts both real and short address, and will return one of the other depending on
#       the input type of the address provided to them.
#       There are very few exception to this rule, most notably the **winfo children** and **winfo containing** commands,
#       where the command will always return real addresses, no matter the address input type.
#
# **non styleable** options
#
#       A *non styleable* option is a static option, meaning that it doesn't change it's value if its state, style or mapping changes.
#       These option must be provided only as a command line argument.
#       Every classtype have its own sets of *non styleable* options (see the widgets wiki).
#
#       The only actor that can change its value is the developer, unless stated otherwise (see the widgets wiki).
#
# **styleable** options
#
#       A *styleable* option is a dynamic option, meaning that it may change it's value if its state, style or mapping changes.
#       These option may be provided either as a command line argument or inside a style.
#       Every classtype have its own sets of *styleable* options (see the widgets wiki).
#
#       If provided as a command line argument, the only actor that can change its value is the developer and
#       if its state, style or mapping changes, it will not affect them.
#       If provided in this way, the *styleable* option will act and behave as a *non styleable* (or static if you prefer) option.
#
#       An option specified with the above method will be treated by mustang as **managed by the developer**.
#
#       If provided inside a style, it will change it's value according to it's state, style and mapping.
#       Note that some *styleable* options do not abide to their mapping values no matter what, like *-cursor*,
#       *-borderwidth*, *-padding*, *-relief*, ... (see the widgets wikis).
#
#       An option specified with the above method will be treated by mustang as **managed by Tk**.
#
#       ATTENTION! Once an option is managed by the developer it cannot go back to be managed by Tk, while
#                  an option managed by Tk can be changed to be managed by the developer at any time.
package provide ::ms $::ms_version

# Note: The variables '::ms_library' and '::ms_version' are defined in the pkgIndex file
#       located in the root folder of the mustang package.

# Load the mustang dependancies.
package require Tk 9.0.1
package require msgcat

# Create the mustang package.
namespace eval ::ms {}

####################################
##                                ##
##     INITIALIZATION PROCESS     ##
##                                ##
####################################

## Init
#
# Initialize mustang.
#
# It doesn't return anything.
proc ::ms::Init {} {
    #################################################
    ##                                             ##
    ##     INITIALIZE SOME LISTS AND VARIABLES     ##
    ##                                             ##
    #################################################

    # Initialize the widgets real and short address list.
    set ::ms::addr(reals)  [list ]
    set ::ms::addr(shorts) [list ]

    # Initialize some styles and classtypes related lists.
    foreach classtype [list button \
                            canvas \
                            checkbutton \
                            combobox \
                            cmenu \
                            crate \
                            embed \
                            entry \
                            frame \
                            label \
                            labelframe \
                            listbox \
                            menu \
                            menubutton \
                            notebook \
                            palette \
                            progressbar \
                            radiobutton \
                            scale \
                            separator \
                            sizegrip \
                            spinbox \
                            text \
                            toolbutton \
                            toplevel \
                            treeview] {
        # Initialize the widgets real address list for 'classtype'.
        set ::ms::addr($classtype) [list ]

        # Initialize the widgets style list for 'classtype'.
        set ::ms::style($classtype) [list ]

        # Add 'classtype' to the list of available classtypes.
        lappend ::ms::data(classtypes) $classtype
    }

    # Note: Panedwindows are disabled for Windows and macOS systems.
    #       See the [panedwindow](/wiki/widgets/panedwindow.md) page for more information.
    switch -nocase -glob -- $::tcl_platform(os) {
        Darwin  -
        "Win*"  {}
        default {
            # Initialize the widgets real address list for the 'panedwindow' classtype.
            set ::ms::addr(panedwindow) [list ]

            # Initialize the widgets style list for the 'panedwindow' classtype.
            set ::ms::style(panedwindow) [list ]

            # Add 'panedwindow' to the list of available classtypes.
            lappend ::ms::data(classtypes) panedwindow
        }
    }

    # Initialize the megawidgets real address lists.
    set ::ms::addr(megawidgets)            [list ]
    set ::ms::addr(megawidgets,containers) [list ]
    set ::ms::addr(megawidgets,scrollable) [list ]

    # Set the statespec value for the 'normal' state.
    set ::ms::data(statespec,normal) [list "!active" \
                                           "!alternate" \
                                           "!background" \
                                           "!disabled" \
                                           "!focus" \
                                           "!hover" \
                                           "!invalid" \
                                           "!pressed" \
                                           "!readonly" \
                                           "!selected" \
                                           "!user1" \
                                           "!user2" \
                                           "!user3" \
                                           "!user4" \
                                           "!user5" \
                                           "!user6"];

    # Set the debug global variable to 'disabled', if it doesn't exists yet.
    #
    # ['enabled', 'disabled']
    switch -- [info exists ::DEBUG] {
        0   { set ::DEBUG "disabled" }
    }

    # Set the tolerance error (16 bits).
    set ::ms::tolerance [expr { 1.0/65535.0 }]

    ##############################################
    ##                                          ##
    ##     INITIALIZE THE SPECIAL VARIABLES     ##
    ##                                          ##
    ##############################################

    # Note: Special variables are variables that act as a bridge between mustang and the developer.
    #       At any moment one or more of these variables are modified, mustang will react in the relative appropriate manner.
    #       Special variables cannot be deleted. The moment they do, they will be recreated with their last valid value.

    # Set the default accent color of the current theme.
    # The default value is 'blue'.
    #
    # ['blue', 'gray', 'green', 'orange', 'pink', 'purple', 'red' or 'yellow']
    set ::ms::accent "blue"

    # Set how each mustang scrollbar and scale reacts when a click happens on their trough.
    #    jump   --> The thumb will jump to the selected location.
    #
    #    scroll --> The scrollbar thumb will scroll one page down, up, left or right depending
    #               on the scrollbar orientation and the clicked position.
    #               The scale thumb will scroll one unit down, up, left or right depending on
    #               the scale orientation and the clicked position.
    #               This is the default click action.
    #
    # ['jump' or 'scroll']
    set ::ms::clickaction "scroll"

    # Set the default colorscheme of the current theme.
    # The default colorscheme is 'light' in Windows and Linux and the system one in macOS.
    #
    # ['light' or 'dark']
    set ::ms::colorscheme "light"

    # Set the default focus model to 'explicit'.
    #
    # In an **explicit** focus model the focus changes only when a widget decides
    # explicitly to claim the focus (e.g., because of a button click), or when
    # the user types a key such as 'Tab' or 'Shift-Tab' that moves the focus.
    # This is the default focus model.
    #
    # In an **implicit** focus model instead, the focus changes everytime the mouse
    # enters a focussable widget.
    #
    # ['explicit' or 'implicit']
    set ::ms::focusmodel "explicit"

    # Set the default action for the middle click buttonpress.
    #
    # On Linux, the default action is 'paste', on the other
    # operating systems is 'drag'.
    #
    # ['paste','drag']
    switch -- [_tk windowingsystem] {
        x11     { set ::ms::middleclick paste }
        default { set ::ms::middleclick drag }
    }

    # Set the UI scale factor.
    # It's used for example to display SVG images ('width' and 'height' are both influenced by the UI scale factor).
    #
    # Note: macOS and Windows operaing systems automatically apply the scale to each image displayed.
    #       In those systems it's value is fixed to '100.0' and any modification attempt will be ignored.
    #
    # It must be in the range [100.0,1000.0].
    set ::ms::scale 100.0

    # Set how the mouse scrolling should work.
    #    natural --> (Apple style) Scrolling the mousewheel up will move the page towards the bottom
    #                and scrolling the mousewheel down will move the page towards the top.
    #                Scrolling the mousewheel up (with the SHIFT key pressed) will move the page
    #                towards the right and scrolling the mousewheel down (with the SHIFT key pressed)
    #                will move the page towards the left.
    #
    #    classic --> Scrolling the mousewheel up will move the page towards the top and scrolling
    #                the mousewheel down will move the page towards the bottom.
    #                Scrolling the mousewheel up (with the SHIFT key pressed) will move the page
    #                towards the left and scrolling the mousewheel down (with the SHIFT key pressed)
    #                will move the page towards the right.
    #                This is the default on Windows and Linux operating systems.
    set ::ms::scrollmode "classic"

    # Enable/Disable the scroll stopper for combobox, spinbox and listboxes.
    #    enabled  --> When pressing of the arrow up or of the arrow down key (or by scrolling the mousewheel)
    #                 cause the relative content to reach the start (or the end), the movement will stop.
    #                 Further pressing of the same arrow key (or scrolling the mousewheel in the same
    #                 direction as before) will not yield any movement.
    #
    #    disabled --> When pressing of the arrow up or of the arrow down key (or by scrolling the mousewheel)
    #                 cause the relative content to reach the start (or the end), the movement will cycle trough.
    #                 Further pressing of the same arrow key (or scrolling the mousewheel in the same
    #                 direction as before) will continue to do the movement but from the other end of the content.
    set ::ms::scrollstopper "enabled"

    # Set the current theme as the default 'Halo' theme.
    # Theme names are case sensitive.
    set ::ms::theme "Halo"

    # Set the mustang union symbol that should be displayed inside a shortcut that links
    # two or more keys together, like 'Ctrl+C', 'Ctrl-C', or 'Ctrl C' for copy.
    # It's used inside mustangs menu popups and contextual menus.
    #
    # ['+', '-' or 'space']
    set ::ms::union "+"

    ##############################################
    ##                                          ##
    ##     SET THE OPERATING SYSTEM FOLDERS     ##
    ##                                          ##
    ##############################################

    switch -- [_tk windowingsystem] {
        aqua {
            set ::ms::folder(os,cache)  [file join $::env(HOME) Library Caches]
            set ::ms::folder(os,config) [file join $::env(HOME) Library "Application Support"]
            set ::ms::folder(os,data)   [file join $::env(HOME) Library Preferences]
        }
        win32 {
            set ::ms::folder(os,cache)  [file join $::env(LOCALAPPDATA) cache]
            set ::ms::folder(os,config) $::env(LOCALAPPDATA)
            set ::ms::folder(os,data)   $::env(APPDATA)
        }
        default {
            switch -- [info exists ::env(XDG_CACHE_HOME)] {
                0   { set ::ms::folder(os,cache) [file join $::env(HOME) ".cache"] }
                1   { set ::ms::folder(os,cache) $::env(XDG_CACHE_HOME) }
            }

            switch -- [info exists ::env(XDG_CONFIG_HOME)] {
                0   { set ::ms::folder(os,config) [file join $::env(HOME) ".config"] }
                1   { set ::ms::folder(os,config) $::env(XDG_CONFIG_HOME) }
            }

            switch -- [info exists ::env(XDG_DATA_HOME)] {
                0   { set ::ms::folder(os,data) [file join $::env(HOME) ".local" share] }
                1   { set ::ms::folder(os,data) $::env(XDG_DATA_HOME) }
            }
        }
    }

    ############################################
    ##                                        ##
    ##     SET/CREATE THE MUSTANG FOLDERS     ##
    ##                                        ##
    ############################################

    # Get the mustang major version number.
    set major_version [lindex [split $::ms_version "."] 0]
    switch -- $major_version {
        0       { set major_version "dev" }
        default { set major_version [string cat $major_version ".0"] }
    }

    # Set the mustang folders.
    switch -- $major_version {
        1.0 -
        dev {
            set ::ms::folder(mustang,cache)  [file join $::ms::folder(os,cache)  mustang]
            set ::ms::folder(mustang,config) [file join $::ms::folder(os,config) mustang]
            set ::ms::folder(mustang,data)   [file join $::ms::folder(os,data)   mustang]
        }
        default {
            set folder [string cat "mustang-" $major_version]

            set ::ms::folder(mustang,cache)  [file join $::ms::folder(os,cache)  $folder]
            set ::ms::folder(mustang,config) [file join $::ms::folder(os,config) $folder]
            set ::ms::folder(mustang,data)   [file join $::ms::folder(os,data)   $folder]
        }
    }

    # Set the mustang subfolders.
    set ::ms::folder(mustang,palettes) [file join $::ms::folder(mustang,data)  palettes]
    set ::ms::folder(mustang,svgs)     [file join $::ms::folder(mustang,cache) svgs]

    # If needed, create the mustang folders and subfolders.
    file mkdir $::ms::folder(mustang,config)
    file mkdir $::ms::folder(mustang,palettes)
    file mkdir $::ms::folder(mustang,svgs)

    #############################################################
    ##                                                         ##
    ##     LOAD ALL THE AVAILABLE MUSTANG MESSAGE CATALOGS     ##
    ##                                                         ##
    #############################################################

    # Note: For auto translations purposes, the developer message catalogs should be
    #       defined in the '::ms' namespace or in the global namespace.

    # Set the available mustang message catalogs.
    set ::ms::languages [list ]
    foreach path [glob -type f -nocomplain -directory [file join $::ms_library msgs] -- *.msg] {
        set language [string tolower [file rootname [file tail $path]]]
        switch -- $language {
            root    { continue }
            default { lappend ::ms::languages $language }
        }
    }

    # Load all the available mustang message catalogs.
    ::msgcat::mcload [file join $::ms_library msgs]

    # Set the mustang language to use.
    set ::ms::language [::msgcat::mclocale]

    #################################################
    ##                                             ##
    ##     LOAD THE DEFAULT MUSTANG SVG IMAGES     ##
    ##                                             ##
    #################################################

    # Note: The following images are taken from the 'Vimix Icon Theme' project and
    #       translated into 'base64' format.
    #       These images are used as they are, no modifications have been made.
    #
    #       'Vimix Icon Theme' project: https://github.com/vinceliuice/vimix-icon-theme
    #       'Vimix Icon Theme' license: https://github.com/vinceliuice/vimix-icon-theme/blob/master/COPYING

    set ::ms::svg(error)    [image create photo  -format [list svg -scale 1.0] \
                                                -palette 255/255/255 \
                                                   -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KIDxwYXRoIGQ9Im0xNiAxYy04LjI3NjggMC0xNSA2LjcyMzItMTUgMTUgMCA4LjI3NjggNi43MjMyIDE1IDE1IDE1IDguMjc2OCAwIDE1LTYuNzIzMiAxNS0xNSAwLTguMjc2OC02LjcyMzItMTUtMTUtMTV6IiBjb2xvcj0iIzAwMDAwMCIgZmlsbD0iI2Y0NjA2MiIgb3BhY2l0eT0iLjk5IiBvdmVyZmxvdz0idmlzaWJsZSIgc3Ryb2tlLXdpZHRoPSIxLjAzNDMiLz4KIDxyZWN0IHg9IjE0IiB5PSI2IiB3aWR0aD0iNCIgaGVpZ2h0PSIxNCIgcng9IjIiIHJ5PSIyIiBmaWxsPSIjZmZmZmZmIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS1taXRlcmxpbWl0PSIyIiBzdHJva2Utd2lkdGg9IjIiLz4KIDxjaXJjbGUgY3g9IjE2IiBjeT0iMjQiIHI9IjIiIGZpbGw9IiNmZmZmZmYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLW1pdGVybGltaXQ9IjIiIHN0cm9rZS13aWR0aD0iMiIvPgo8L3N2Zz4K"]];

    set ::ms::svg(info)     [image create photo  -format [list svg -scale 1.0] \
                                                -palette 255/255/255 \
                                                   -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiA8ZGVmcz4KICA8bGluZWFyR3JhZGllbnQgaWQ9ImIiIHgxPSI2OS4zMTIiIHgyPSI2OS4zMTIiIHkxPSIyMS4zMTkiIHkyPSIyNy43MjciIGdyYWRpZW50VHJhbnNmb3JtPSJtYXRyaXgoLjE5ODExIDAgMCAuMjMwNjcgLTMyLjYyNiAyNC45NSkiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgPHN0b3Agb2Zmc2V0PSIwIi8+CiAgIDxzdG9wIHN0b3Atb3BhY2l0eT0iMCIgb2Zmc2V0PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KIDwvZGVmcz4KIDxwYXRoIGQ9Im0xNiAxYy04LjI3NjggMC0xNSA2LjcyMzItMTUgMTUgMCA4LjI3NjggNi43MjMyIDE1IDE1IDE1IDguMjc2OCAwIDE1LTYuNzIzMiAxNS0xNSAwLTguMjc2OC02LjcyMzItMTUtMTUtMTV6IiBjb2xvcj0iIzAwMDAwMCIgZmlsbD0iIzUyOTRlMiIgb3BhY2l0eT0iLjk5IiBvdmVyZmxvdz0idmlzaWJsZSIgc3Ryb2tlLXdpZHRoPSIxLjAzNDMiLz4KIDxwYXRoIGQ9Im0tMzcuMjg1IDcuMzcxaDMydjMyaC0zMnoiIGZpbGw9Im5vbmUiLz4KIDxwYXRoIGQ9Ik0tMTguMTg4IDMwLjA5NWMtLjQwNC4zMjQtLjc5My43OC0xLjMwNi44MjMiIGZpbGw9Im5vbmUiIGZvbnQtZmFtaWx5PSJVUlcgUGFsbGFkaW8gTCIgZm9udC1zaXplPSI0MCIgZm9udC13ZWlnaHQ9IjcwMCIgb3BhY2l0eT0iLjEiIHN0cm9rZT0idXJsKCNiKSIvPgogPHJlY3QgdHJhbnNmb3JtPSJzY2FsZSgxLC0xKSIgeD0iMTQiIHk9Ii0yNiIgd2lkdGg9IjQiIGhlaWdodD0iMTQiIHJ4PSIyIiByeT0iMiIgZmlsbD0iI2ZmZmZmZiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2UtbWl0ZXJsaW1pdD0iMiIgc3Ryb2tlLXdpZHRoPSIyIi8+CiA8Y2lyY2xlIHRyYW5zZm9ybT0ic2NhbGUoMSwtMSkiIGN4PSIxNiIgY3k9Ii04IiByPSIyIiBmaWxsPSIjZmZmZmZmIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS1taXRlcmxpbWl0PSIyIiBzdHJva2Utd2lkdGg9IjIiLz4KPC9zdmc+Cg=="]];

    set ::ms::svg(question) [image create photo  -format [list svg -scale 1.0] \
                                                -palette 255/255/255 \
                                                   -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KIDxwYXRoIGQ9Im0xNiAxYy04LjI3NjggMC0xNSA2LjcyMzItMTUgMTUgMCA4LjI3NjggNi43MjMyIDE1IDE1IDE1IDguMjc2OCAwIDE1LTYuNzIzMiAxNS0xNSAwLTguMjc2OC02LjcyMzItMTUtMTUtMTV6IiBjb2xvcj0iIzAwMDAwMCIgZmlsbD0iIzUyOTRlMiIgb3BhY2l0eT0iLjk5IiBvdmVyZmxvdz0idmlzaWJsZSIgc3Ryb2tlLXdpZHRoPSIxLjAzNDMiLz4KIDxwYXRoIGQ9Im0xNiA2YTYgNiAwIDAgMC02IDZoMmE0IDQgMCAwIDEgMy45Mzk1LTQgNCA0IDAgMCAxIDAuMDYwNTQ3IDAgNCA0IDAgMCAxIDQgNCA0IDQgMCAwIDEtNCA0djJhNiA2IDAgMCAwIDYtNiA2IDYgMCAwIDAtNi02eiIgZmlsbD0iI2ZmZmZmZiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2UtbWl0ZXJsaW1pdD0iMiIgc3Ryb2tlLXdpZHRoPSIyLjE4MTgiLz4KIDxjaXJjbGUgY3g9IjE2IiBjeT0iMjQiIHI9IjIiIGZpbGw9IiNmZmZmZmYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLW1pdGVybGltaXQ9IjIiIHN0cm9rZS13aWR0aD0iMiIvPgogPHJlY3QgeD0iMTUiIHk9IjE2IiB3aWR0aD0iMiIgaGVpZ2h0PSI0IiBmaWxsPSIjZmZmZmZmIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS1taXRlcmxpbWl0PSIyIiBzdHJva2Utd2lkdGg9IjEuNDE0MiIvPgo8L3N2Zz4K"]];

    set ::ms::svg(reboot)   [image create photo  -format [list svg -scale 1.0] \
                                                -palette 255/255/255 \
                                                   -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KIDxwYXRoIGQ9Im0xNiAxYy04LjI3NjggMC0xNSA2LjcyMzItMTUgMTUgMCA4LjI3NjggNi43MjMyIDE1IDE1IDE1IDguMjc1OCAwIDE1LTYuNzIzMiAxNS0xNSAwLTguMjc1OC02LjcyMzItMTUtMTUtMTV6IiBjb2xvcj0iIzAwMDAwMCIgZmlsbD0iIzRkYTJmMyIgZmlsbC1vcGFjaXR5PSIuOTkyIiBvcGFjaXR5PSIuOTkiIG92ZXJmbG93PSJ2aXNpYmxlIiBzdHJva2Utd2lkdGg9IjEuMDM0MyIvPgogPHBhdGggZD0iTTE2IDYuNXYyLjQyOWE3LjI4NiA3LjI4NiAwIDEgMCA3LjI4NiA3LjI4NWgtMi40MjlBNC44NTcgNC44NTcgMCAxIDEgMTYgMTEuMzU3djIuNDI5bDYuMDcxLTMuNjQzTDE2IDYuNXoiIGNvbG9yPSIjYmViZWJlIiBmaWxsPSIjZmZmIiBvdmVyZmxvdz0idmlzaWJsZSIvPgo8L3N2Zz4K"]];

    set ::ms::svg(warning)  [image create photo  -format [list svg -scale 1.0] \
                                                -palette 255/255/255 \
                                                   -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiA8ZGVmcz4KICA8bGluZWFyR3JhZGllbnQgaWQ9ImIiIHgxPSI0NC40MjQiIHgyPSI0NC40MjQiIHkxPSI2MC41MzUiIHkyPSItNS40OTciIGdyYWRpZW50VHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTYuNzIzIDEuMjI2KSBzY2FsZSguNTAxNzQpIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+CiAgIDxzdG9wIHN0b3AtY29sb3I9IiM2MzQyMTUiIG9mZnNldD0iMCIvPgogICA8c3RvcCBzdG9wLWNvbG9yPSIjOTM3MDBkIiBvZmZzZXQ9IjEiLz4KICA8L2xpbmVhckdyYWRpZW50PgogPC9kZWZzPgogPHBhdGggZD0iTTAgMGgzMnYzMkgweiIgZmlsbD0ibm9uZSIvPgogPHBhdGggZD0ibTMwLjc4NiAyNy4wMzctMTMuMDIxLTI0Yy0wLjM3MzQ1LTAuNjY2ODEtMS4wNTEtMS4wMzctMS44MDUyLTEuMDM3LTAuNzU1MTcgMC0xLjQzNDggMC40NDQ4OS0xLjgxNDUgMS4xMTA3bC0xMi45MjQgMjRjLTAuMzA0MTQgMC41OTMxOS0wLjMwODI4IDEuNDA3MyAwLjA2NjIwNyAyLjAwMDQgMC4zNzQ0OCAwLjU5MjE1IDAuOTc2NTUgMC44ODg3NCAxLjczMTcgMC44ODg3NGgyNS45NDVjMC43NTMxIDAgMS40MzM4LTAuMzcwMjIgMS43Mzc5LTAuOTYzNDEgMC4zNzk2Ni0wLjU5MjE1IDAuMzgyNzYtMS4zMzI2IDAuMDgzNzktMS45OTk0eiIgZmlsbD0iI2ZhYzg0OCIgc3Ryb2tlLXdpZHRoPSIxLjAzNTgiLz4KIDxwYXRoIHRyYW5zZm9ybT0idHJhbnNsYXRlKC4wMDQpIiBkPSJNMTQuNDE2IDkuNTE2Yy4zNzUgMy42NjYuODA1IDcuMzA3IDEuMTI1IDEwLjk4N2gxLjAyYy4yNjUtMy41MzQuNjkyLTcuMDQ3IDEtMTAuNTc4LjE1OC0uODM1LS4yNzItMS44MjgtMS4xNTQtMi4wMy0uODczLS4yNTYtMS44NDcuMzc2LTEuOTYzIDEuMjc4LS4wMi4xMTMtLjAyOC4yMjgtLjAyOC4zNDN6bS0uMTExIDE0LjkwNWMtLjA0IDEuMDkyIDEuMTYxIDEuOTQ3IDIuMTg2IDEuNjAxLjk5My0uMjUzIDEuNTE2LTEuNTAxIDEuMDA3LTIuMzg5LS40NTUtLjkxNy0xLjc5MS0xLjIxOS0yLjU2LS41MTctLjM4OC4zMi0uNjQ2Ljc5Ni0uNjMzIDEuMzA1eiIgZmlsbD0iI2ZmZmZmZiIgZm9udC1mYW1pbHk9Ikdlb3JnaWEiIGZvbnQtc2l6ZT0iNjIuNDU4IiBmb250LXdlaWdodD0iNDAwIiBvdmVyZmxvdz0idmlzaWJsZSIvPgo8L3N2Zz4K"]];

    ###################################################
    ##                                               ##
    ##     LOAD ALL THE AVAILABLE COLOR PALETTES     ##
    ##                                               ##
    ###################################################

    # Initialize the list of all known palette names.
    set ::ms::palette(names) [list ]

    # Set the list of all family names.
    set ::ms::palette(families) [list Blue \
                                      Blue-Purple \
                                      Cyan \
                                      Cyan-Blue \
                                      Gray \
                                      Green \
                                      Green-Cyan \
                                      Orange \
                                      Purple \
                                      Purple-Red \
                                      Red \
                                      Yellow \
                                      Yellow-Green];

    # Load any default palette files.
    foreach palette [glob -type f -directory [file join $::ms_library palettes] -- *.txt] {
        ::ms::Load_Palette $palette
    }

    # Load any program, developer or user palette files.
    foreach palette [glob -type f -directory $::ms::folder(mustang,palettes) -- *.txt] {
        ::ms::Load_Palette $palette
    }

    # Check that at least one palette file was loaded.
    switch -- [llength $::ms::palette(names)] {
        0   {
            switch -nocase -- $::DEBUG {
                1       -
                on      -
                true    -
                active  -
                enabled { chan puts stdout "No palettes found." }
            }

            set ::ms::palette(names) [list ]
        }
        default {
            # Order the list of all known palette names alphabetically.
            set ::ms::palette(names) [lsort -increasing -dictionary $::ms::palette(names)]
        }
    }

    ######################################
    ##                                  ##
    ##     CREATE THE MUSTANG FONTS     ##
    ##                                  ##
    ######################################

    # Set the mustang fonts families and sizes for each
    # operating system scenarios.
    switch -nocase -glob -- $::tcl_platform(os) {
        Darwin {
            set family      [_font configure TkDefaultFont -family]
            set family_mono [_font configure TkFixedFont -family]

            # Check if it's a recent macOS operating system or not.
            switch -- [_tk windowingsystem] {
                aqua {
                    # Note: 'macOS Big Sur' or later.
                    set size_biggest   15
                    set size_bigger    14
                    set size_normal    13
                    set size_smaller   12
                    set size_smallest  11
                    set size_mono      11
                }
                default {
                    set size_normal [_font configure TkDefaultFont -size]
                    set size_mono   [_font configure TkFixedFont -size]

                    set size_biggest  [expr { $size_normal+2 }]
                    set size_bigger   [expr { $size_normal+1 }]
                    set size_smaller  [expr { $size_normal-1 }]
                    set size_smallest [expr { $size_normal-2 }]
                }
            }

            # Create the mustang fonts.
            _font create BiggestFont   -family $family \
                                         -size $size_biggest;

            _font create BiggerFont    -family $family \
                                         -size $size_bigger;

            _font create NormalFont    -family $family \
                                         -size $size_normal;

            _font create SmallerFont   -family $family \
                                         -size $size_smaller;

            _font create SmallestFont  -family $family \
                                         -size $size_smallest;

            _font create MonospaceFont -family $family_mono \
                                         -size $size_mono;
        }
        "Win*" {
            set family      [_font configure TkDefaultFont -family]
            set family_mono [_font configure TkFixedFont -family]

            set size_normal [_font configure TkDefaultFont -size]
            set size_mono   [_font configure TkFixedFont -size]

            set size_biggest  [expr { $size_normal+2 }]
            set size_bigger   [expr { $size_normal+1 }]
            set size_smaller  [expr { $size_normal-1 }]
            set size_smallest [expr { $size_normal-2 }]

            # Create the mustang fonts.
            _font create BiggestFont   -family $family \
                                         -size $size_biggest;

            _font create BiggerFont    -family $family \
                                         -size $size_bigger;

            _font create NormalFont    -family $family \
                                         -size $size_normal;

            _font create SmallerFont   -family $family \
                                         -size $size_smaller;

            _font create SmallestFont  -family $family \
                                         -size $size_smallest;

            _font create MonospaceFont -family $family_mono \
                                         -size $size_mono;
        }
        default {
            set family      [_font configure TkDefaultFont -family]
            set family_mono [_font configure TkFixedFont -family]

            set size_normal [_font configure TkDefaultFont -size]
            set size_mono   [_font configure TkFixedFont -size]

            set size_biggest  [expr { $size_normal+2 }]
            set size_bigger   [expr { $size_normal+1 }]
            set size_smaller  [expr { $size_normal-1 }]
            set size_smallest [expr { $size_normal-2 }]

            # Check the configuration file for the following desktop environment (in order):
            #
            #   'KDE'
            #   'QT'
            #   'GTK4'
            #   'GTK3'
            #   'GTK2'
            #
            # The first one found that have font data informations will define the families
            # and sizes of the mustang fonts.
            # If the fonts data informations are not found for some reasons, the above ones
            # will be used.

            set found 0

            # Check the KDE configuration file, if any.
            try {
                open [file join $::ms::folder(os,config) kdeglobals] r
            } on error {} {
                # Do nothing.
            } on ok { channel } {
                # Read the entire file.
                set file_content [split [chan read $channel] "\n"]
                chan close $channel

                # Scan the file content line by line.
                foreach line $file_content {
                    set line [split $line "="]
                    # Check if the line starts with the word 'fixed' or 'font'.
                    # If not, skip the line.
                    switch -- [lindex $line 0] {
                        fixed {
                            set values [split [lindex $line 1] ","]

                            set family_mono [lindex $values 0]
                            set size_mono   [lindex $values 1]

                            incr found
                        }
                        font {
                            set values [split [lindex $line 1] ","]

                            set family      [string trim [lindex $values 0]]
                            set size_normal [string trim [lindex $values 1]]

                            set size_biggest  [expr { $size_normal+2 }]
                            set size_bigger   [expr { $size_normal+1 }]
                            set size_smaller  [expr { $size_normal-1 }]
                            set size_smallest [expr { $size_normal-2 }]

                            incr found
                        }
                    }
                }
            }

            # Check the QT configuration file, if any.
            switch -- $found {
                0   {
                    try {
                        open [file join $::ms::folder(os,config) "Trolltech.conf"] r
                    } on error {} {
                        # Do nothing.
                    } on ok { channel } {
                        # Read the entire file.
                        set file_content [split [chan read $channel] "\n"]
                        chan close $channel

                        # Scan the file content line by line.
                        foreach line $file_content {
                            set line [split $line "="]
                            # Check if the line starts with the word 'font'.
                            # If not, skip the line.
                            switch -- [lindex $line 0] {
                                font {
                                    set values [split [lindex $line 1] ","]

                                    set family      [string range [string trim [lindex $values 0]] 1 end]
                                    set size_normal [string trim  [lindex $values 1]]

                                    set size_biggest  [expr { $size_normal+2 }]
                                    set size_bigger   [expr { $size_normal+1 }]
                                    set size_smaller  [expr { $size_normal-1 }]
                                    set size_smallest [expr { $size_normal-2 }]

                                    incr found
                                }
                            }
                        }
                    }
                }
            }

            # Check the GTK configuration files, if any.
            switch -- $found {
                0   {
                    foreach path [list [file join $::ms::folder(os,config) "gtk-4.0" "settings.ini"] \
                                       [file join $::ms::folder(os,config) "gtk-3.0" "settings.ini"] \
                                       [file join $::env(HOME) ".gtkrc-2.0"]] {
                        try {
                            open $path r
                        } on error {} {
                            continue
                        } on ok { channel } {
                            # Read the entire file.
                            set file_content [split [chan read $channel] "\n"]
                            chan close $channel

                            # Scan the file content line by line.
                            foreach line $file_content {
                                set line [split $line "="]
                                # Check if the line starts with the word 'gtk-font-name' or 'monospace-font-name'.
                                # If not, skip the line.
                                switch -- [lindex $line 0] {
                                    "gtk-font-name" {
                                        set values [split [lindex $line 1] ","]

                                        set family      [string trim [lindex $values 0]]
                                        set size_normal [string trim [lindex $values 1]]

                                        set size_biggest  [expr { $size_normal+2 }]
                                        set size_bigger   [expr { $size_normal+1 }]
                                        set size_smaller  [expr { $size_normal-1 }]
                                        set size_smallest [expr { $size_normal-2 }]

                                        incr found
                                    }
                                    "monospace-font-name" {
                                        set values [split [lindex $line 1] ","]

                                        set family_mono [string trim [lindex $values 0]]
                                        set size_mono   [string trim [lindex $values 1]]

                                        incr found
                                    }
                                }
                            }

                            switch -- $found {
                                0       { continue }
                                default { break }
                            }
                        }
                    }
                }
            }

            # Try the 'gsettings' command.
            # Distribution like Ubuntu don't come with a GTK configuration file,
            # but they do have the 'gsettings' command.
            switch -- $found {
                0   {
                    # gsettings: check if a normal font is defined.
                    set cmd [list {*}[auto_execok gsettings] "get" "org.gnome.desktop.interface" "font-name"]
                    try {
                        exec {*}$cmd
                    } on error {} {
                        # Do nothing.
                    } on ok { result } {
                        set values [string trim $result "'"]
                        set index [string first "," $values]
                        switch -- $index {
                            0   {}
                            -1  {
                                set size_normal [string trim [lindex  $values end]]
                                set family      [string trim [lremove $values end]]

                                set size_biggest  [expr { $size_normal+2 }]
                                set size_bigger   [expr { $size_normal+1 }]
                                set size_smaller  [expr { $size_normal-1 }]
                                set size_smallest [expr { $size_normal-2 }]
                            }
                            default {
                                set values [split $values ","]

                                set family      [string trim [lindex $values 0]]
                                set size_normal [string trim [lindex $values 1]]

                                set size_biggest  [expr { $size_normal+2 }]
                                set size_bigger   [expr { $size_normal+1 }]
                                set size_smaller  [expr { $size_normal-1 }]
                                set size_smallest [expr { $size_normal-2 }]
                            }
                        }

                        # gsettings: check if a monospace font is defined.
                        set cmd [list {*}[auto_execok gsettings] "get" "org.gnome.desktop.interface" "monospace-font-name"]
                        try {
                            exec {*}$cmd
                        } on error {} {
                            # Do nothing.
                        } on ok { result } {
                            set values [string trim $result "'"]
                            set index [string first "," $values]
                            switch -- $index {
                                0   {}
                                -1  {
                                    set size_mono   [string trim [lindex  $values end]]
                                    set family_mono [string trim [lremove $values end]]
                                }
                                default {
                                    set values [split $values ","]

                                    set family_mono [string trim [lindex $values 0]]
                                    set size_mono   [string trim [lindex $values 1]]
                                }
                            }
                        }
                    }
                }
            }

            # Create the mustang fonts.
            _font create BiggestFont   -family $family \
                                         -size $size_biggest;

            _font create BiggerFont    -family $family \
                                         -size $size_bigger;

            _font create NormalFont    -family $family \
                                         -size $size_normal;

            _font create SmallerFont   -family $family \
                                         -size $size_smaller;

            _font create SmallestFont  -family $family \
                                         -size $size_smallest;

            _font create MonospaceFont -family $family_mono \
                                         -size $size_mono;
        }
    }

    ################################################
    ##                                            ##
    ##     CHECK THE CURRENT OPERATING SYSTEM     ##
    ##                                            ##
    ################################################

    # Note: We haven't loaded any theme yet, meaning we should not display the error message dialog in case something bad happens.
    #       But we can delay the error message dialog until a theme is loaded or an unskippable/undelayable error happens.

    # Set the ERROR variable to 'false', meaning no error has happened.
    set ERROR false

    # Check the current platform.
    switch -nocase -glob -- $::tcl_platform(os) {
        Darwin {
            # Set all the available macOS cursors types.
            set ::ms::machine(os,cursors) [list aliasarrow          arrow                    based_arrow_down       based_arrow_up \
                                                boat                bogosity                 bottom_left_corner     bottom_right_corner \
                                                bottom_side         bottom_tee               box_spiral             bucket \
                                                cancel              center_ptr               circle                 clock \
                                                closedhand          coffee_mug               contextualmenuarrow    copyarrow \
                                                countingdownhand    countingupanddownhand    countinguphand         cross \
                                                cross-hair          cross_reverse            crosshair              diamond_cross \
                                                dot                 dotbox                   double_arrow           draft_large \
                                                draft_small         draped_box               exchange               eyedrop \
                                                eyedrop-full        fist                     fleur                  gobbler \
                                                gumby               hand                     hand1                  hand2 \
                                                heart               help                     icon                   iron_cross \
                                                left_ptr            left_side                left_tee               leftbutton \
                                                ll_angle            lr_angle                 man                    middlebutton \
                                                mouse               movearrow                none                   notallowed \
                                                openhand            pencil                   pirate                 plus \
                                                pointinghand        poof                     question_arrow         resize \
                                                resizebottomleft    resizebottomright        resizedown             resizeleft \
                                                resizeleftright     resizeright              resizetopleft          resizetopright \
                                                resizeup            resizeupdown             right_ptr              right_side \
                                                right_tee           rightbutton              rtl_logo               sailboat \
                                                sb_down_arrow       sb_h_double_arrow        sb_left_arrow          sb_right_arrow \
                                                sb_up_arrow         sb_v_double_arrow        shuttle                sizing \
                                                spider              spinning                 spraycan               star \
                                                target              tcross                   text                   top_left_arrow \
                                                top_left_corner     top_right_corner         top_side               top_tee \
                                                trek                ul_angle                 umbrella               ur_angle \
                                                wait                watch                    X_cursor               xterm \
                                                zoom-in             zoom-out];

            # Set the colorscheme as the user choice in the macOS settings panel.
            _wm attributes . -appearance auto
            switch -- [_wm attributes . -isdark] {
                0   { set ::ms::colorscheme light }
                1   { set ::ms::colorscheme dark }
            }

            # Get the mouse scrolling mode setted in the macOS preferences window.
            set cmd [list {*}[auto_execok defaults] "read" "-g" "com.apple.swipescrolldirection"]
            try {
                exec {*}$cmd
            } on error {} {
                # Do nothing.
            } on ok { result } {
                switch -- $result {
                    1       -
                    on      -
                    yes     -
                    true    -
                    enabled { set ::ms::scrollmode "natural" }
                    default { set ::ms::scrollmode "classic" }
                }
            }

            # Get the cpu model name.
            set cmd [list {*}[auto_execok sysctl] "-n" "machdep.cpu.brand_string"]
            try {
                exec {*}$cmd
            } on error {} {
                set ::ms::machine(cpu,model) "unknown"
            } on ok { result } {
                set ::ms::machine(cpu,model) [lremove $result 0 2]
            }

            # Get the number of cpus cores available.
            set cmd [list {*}[auto_execok sysctl] "-n" "hw.physicalcpu"]
            try {
                exec {*}$cmd
            } on error {} {
                set ::ms::machine(cpu,cores) 1
            } on ok { result } {
                set ::ms::machine(cpu,cores) $result
            }

            # Get the number of cpus threads available.
            set cmd [list {*}[auto_execok sysctl] "-n" "hw.logicalcpu"]
            try {
                exec {*}$cmd
            } on error {} {
                set ::ms::machine(cpu,threads) 1
            } on ok { result } {
                set ::ms::machine(cpu,threads) $result
            }

            # Get the macOS name, prettyname and version number.
            set cmd [list {*}[auto_execok sw_vers] "-productVersion"]
            try {
                exec {*}$cmd
            } on error {} {
                set ERROR true
            } on ok { version } {
                # Note: Data taken from 'https://ss64.com/osx/sw_vers.html'.

                # Note: The 'aqua' theme was released in 2020; for this reason macOS versions
                #       prior to 'Monterey' are not supported by mustang.

                switch -glob -- $version {
                    "26*" {
                        set ::ms::machine(os,name)       "macOS Tahoe"
                        set ::ms::machine(os,prettyname) "macOS Tahoe $version"
                        set ::ms::machine(os,version)    $version
                    }
                    "15*" {
                        set ::ms::machine(os,name)       "macOS Sequoia"
                        set ::ms::machine(os,prettyname) "macOS Sequoia $version"
                        set ::ms::machine(os,version)    $version
                    }
                    "14*" {
                        set ::ms::machine(os,name)       "macOS Sonoma"
                        set ::ms::machine(os,prettyname) "macOS Sonoma $version"
                        set ::ms::machine(os,version)    $version
                    }
                    "13*" {
                        set ::ms::machine(os,name)       "macOS Ventura"
                        set ::ms::machine(os,prettyname) "macOS Ventura $version"
                        set ::ms::machine(os,version)    $version
                    }
                    "12*" {
                        set ::ms::machine(os,name)       "macOS Monterey"
                        set ::ms::machine(os,prettyname) "macOS Monterey $version"
                        set ::ms::machine(os,version)    $version
                    }
                    default { set ERROR true }
                }
            }
        }
        Linux {
            # Set all the available Linux cursors types.
            set ::ms::machine(os,cursors) [list arrow             based_arrow_down      based_arrow_up         boat \
                                                bogosity          bottom_left_corner    bottom_right_corner    bottom_side \
                                                bottom_tee        box_spiral            center_ptr             circle \
                                                clock             coffee_mug            cross                  cross_reverse \
                                                crosshair         diamond_cross         dot                    dotbox \
                                                double_arrow      draft_large           draft_small            draped_box \
                                                exchange          fleur                 gobbler                gumby \
                                                hand1             hand2                 heart                  icon \
                                                iron_cross        left_ptr              left_side              left_tee \
                                                leftbutton        ll_angle              lr_angle               man \
                                                middlebutton      mouse                 none                   pencil \
                                                pirate            plus                  question_arrow         right_ptr \
                                                right_side        right_tee             rightbutton            rtl_logo \
                                                sailboat          sb_down_arrow         sb_h_double_arrow      sb_left_arrow \
                                                sb_right_arrow    sb_up_arrow           sb_v_double_arrow      shuttle \
                                                sizing            spider                spraycan               star \
                                                target            tcross                top_left_arrow         top_left_corner \
                                                top_right_corner  top_side              top_tee                trek \
                                                ul_angle          umbrella              ur_angle               watch \
                                                X_cursor          xterm];

            # Get the cpu model name.
            set cmds [list {*}[auto_execok grep] "-m" "1" "model name" "[file join / proc cpuinfo]"]
            try {
                exec {*}$cmd
            } on error {} {
                set ::ms::machine(cpu,model) "unknown"
            } on ok { result } {
                set ::ms::machine(cpu,model) [lremove $result 0 2]
            }

            # Get the number of cpus cores available.
            set cmd [list {*}[auto_execok grep] "-m" "1" "cpu cores" "[file join / proc cpuinfo]"]
            try {
                exec {*}$cmd
            } on error {} {
                set ::ms::machine(cpu,cores) 1
            } on ok { result } {
                set ::ms::machine(cpu,cores) [lremove $result 0 2]
            }

            # Get the number of cpus threads available.
            set cmd [list {*}[auto_execok getconf] "_NPROCESSORS_ONLN"]
            try {
                exec {*}$cmd
            } on error {} {
                # Fallback.
                set cmd [list {*}[auto_execok nproc] "--all"]
                try {
                    exec {*}$cmd
                } on error {} {
                    set ::ms::machine(cpu,threads) 1
                } on ok { result } {
                    set ::ms::machine(cpu,threads) $result
                }
            } on ok { result } {
                set ::ms::machine(cpu,threads) $result
            }

            # /etc/os-release
            #
            # Archlinux:
            #
            #   NAME="Arch Linux"
            #   PRETTY_NAME="Arch Linux"
            #   ID=arch
            #   BUILD_ID=rolling
            #   ANSI_COLOR="38;2;23;147;209"
            #   HOME_URL="https://archlinux.org/"
            #   DOCUMENTATION_URL="https://wiki.archlinux.org/"
            #   SUPPORT_URL="https://bbs.archlinux.org/"
            #   BUG_REPORT_URL="https://gitlab.archlinux.org/groups/archlinux/-/issues"
            #   PRIVACY_POLICY_URL="https://terms.archlinux.org/docs/privacy-policy/"
            #   LOGO=archlinux-logo
            #
            # Archlinux ARM:
            #
            #   NAME="Arch Linux ARM"
            #   PRETTY_NAME="Arch Linux ARM"
            #   ID=archarm
            #   ID_LIKE=arch
            #   BUILD_ID=rolling
            #   ANSI_COLOR="38;2;23;147;209"
            #   HOME_URL="https://archlinuxarm.org/"
            #   DOCUMENTATION_URL="https://archlinuxarm.org/wiki"
            #   SUPPORT_URL="https://archlinuxarm.org/forum/"
            #   BUG_REPORT_URL="https://github.com/archlinuxarm/PKGBUILDs/issues"
            #   LOGO=archlinux-logo
            #
            # Ubuntu:
            #
            #   PRETTY_NAME="Ubuntu 24.10"
            #   NAME="Ubuntu"
            #   VERSION_ID="24.10"
            #   VERSION="24.10 (Oracular Oriole)"
            #   VERSION_CODENAME=oracular
            #   ID=ubuntu
            #   ID_LIKE=debian
            #   HOME_URL="https://www.ubuntu.com/"
            #   SUPPORT_URL="https://help.ubuntu.com"
            #   BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
            #   PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy/"
            #   UBUNTU_CODENAME=oracular
            #   LOGO=ubuntu-logo
            #
            # Ubuntu LTS:
            #
            #   PRETTY_NAME="Ubuntu 24.04.2 LTS"
            #   NAME="Ubuntu"
            #   VERSION_ID="24.04"
            #   VERSION="24.04.2 LTS (Noble Numbat)"
            #   VERSION_CODENAME=noble
            #   ID=ubuntu
            #   ID_LIKE=debian
            #   HOME_URL="https://www.ubuntu.com/"
            #   SUPPORT_URL="https://help.ubuntu.com"
            #   BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
            #   PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy/"
            #   UBUNTU_CODENAME=noble
            #   LOGO=ubuntu-logo
            #
            # Debian:
            #
            #   PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
            #   NAME="Debian GNU/Linux"
            #   VERSION_ID="12"
            #   VERSION="12 (bookworm)"
            #   VERSION_CODENAME="bookworm"
            #   ID=debian
            #   BUILD_ID=rolling
            #   ANSI_COLOR="0;36"
            #   HOME_URL="https://www.debian.org/"
            #   SUPPORT_URL="https://www.debian.org/support"
            #   BUG_REPORT_URL="https://bugs.debian.org/"
            #
            # Fedora Linux:
            #
            #   NAME="Fedora Linux"
            #   VERSION="41 (KDE Plasma)"
            #   RELEASE_TYPE=stable
            #   ID="fedora"
            #   VERSION_ID="41"
            #   VERSION_CODENAME=""
            #   PLATFORM_ID="platform:f41"
            #   PRETTY_NAME="Fedora Linux 41 (KDE Plasma)"
            #   ANSI_COLOR="0;38;2;60;110;180"
            #   LOGO=fedora-logo-icon
            #   CPE_NAME="cpe:/o:fedoraproject:fedora:41"
            #   DEFAULT_HOSTNAME="fedora"
            #   HOME_URL="http://www.fedoraproject.org"
            #   DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f41/system-administrators-guide/"
            #   SUPPORT_URL="https://ask.fedoraproject.org"
            #   BUG_REPORT_URL="https://bugzilla.redhat.com"
            #   REDHAT_BUGZILLA_PRODUCT="Fedora"
            #   REDHAT_BUGZILLA_PRODUCT_VERSION=41
            #   REDHAT_SUPPORT_PRODUCT="Fedora"
            #   REDHAT_SUPPORT_PRODUCT_VERSION=41
            #   SUPPORT_END=2025-12-15
            #   VARIANT="KDE Plasma"
            #   VARIANT_ID=kde
            #
            # openSUSE Tumbleweed:
            #
            #   NAME="openSUSE Tumbleweed"
            #   # VERSION="20250306"
            #   ID="opensuse-tumbleweed"
            #   ID_LIKE="opensuse suse"
            #   VERSION_ID="20250306"
            #   PRETTY_NAME="openSUSE Tumbleweed"
            #   ANSI_COLOR="0;32"
            #   #CPE 2.3 format, boot#1217921
            #   CPE_NAME="cpe:2.3:o:opensuse:tumbleweed:20250306:*:*:*:*:*:*:*"
            #   #CPE 2.2 format
            #   #CPE_NAME="cpe:/o:opensuse:tumbleweed:20250306"
            #   BUG_REPORT_URL="https://bugs.opensuse.org"
            #   HOME_URL="http://www.opensuse.org"
            #   DOCUMENTATION_URL="https://en.opensuse.org/Portal:Tumbleweed"
            #   LOGO="distributor-logo-Tumbleweed"
            #
            # openSUSE Leap:
            #
            #   NAME="openSUSE Leap"
            #   VERSION="15.5"
            #   ID="opensuse-leap"
            #   ID_LIKE="opensuse suse"
            #   VERSION_ID="15.5"
            #   PRETTY_NAME="openSUSE Leap 15.5"
            #   ANSI_COLOR="0;32"
            #   CPE_NAME="cpe:/o:opensuse:leap:15.5"
            #   BUG_REPORT_URL="https://bugs.opensuse.org"
            #   HOME_URL="http://www.opensuse.org"
            #   DOCUMENTATION_URL="https://en.opensuse.org/Portal:Leap"
            #   LOGO="distributor-logo-Leap"

            # Get the Linux distribution name, prettyname and version.
            try {
                open [file join / etc os-release] r
            } on error {} {
                set ::ms::machine(os,name)       "unknown"
                set ::ms::machine(os,prettyname) "unknown"
                set ::ms::machine(os,version)    "unknown"
            } on ok { channel } {
                # Read the entire file.
                set file_content [split [chan read $channel] "\n"]
                chan close $channel

                # Scan the file content line by line.
                foreach line $file_content {
                    set line [split $line "="]
                    switch -nocase -- [lindex $line 0] {
                        NAME        { set ::ms::machine(os,name)       [string trim [lindex $line 1] \"] }
                        PRETTY_NAME { set ::ms::machine(os,prettyname) [string trim [lindex $line 1] \"] }
                        VERSION_ID  -
                        BUILD_ID    { set ::ms::machine(os,version)    [string trim [lindex $line 1] \"] }
                    }
                }
            }

            # Set the Linux distribution package manager.
            #
            # ['apt', 'dnf', 'emerge', 'installpkg', 'pacman', 'rpm', 'zypper', 'yum', 'unknown']
            set ::ms::machine(os,pkgmanager) "unknown"
            foreach name [list apt dnf emerge installpkg pacman rpm zypper yum] {
                switch -- [auto_execok $name] {
                    ""      {}
                    default {
                        set ::ms::machine(os,pkgmanager) $name
                        break
                    }
                }
            }

            # Set the graphic user interface (GUI) currently in use in the Linux distribution .
            # The first element is the name of the desktop environment or window manager in use while the second element
            # is the GUI type, either the word 'DE' for desktop environments or 'WM' for window managers.
            set options [list -e | {*}[auto_execok grep] -E -i "awesome|bspwm|budgie-desktop|cinnamon-session|cosmic-launcher|dwm|enlightenment_start|gala|gnome-session|hyprland|i3|mango|mate-session|niri|niri-session|openbox-session|qtile|river|startdde|startlxde|startlxqt|startkde|startplasma|startplasma-x11|startplasma-way|startplasma-wayland|startxfce|startxfce2|startxfce3|startxfce4|sway|xmonad"]
            try {
                exec {*}[auto_execok ps] {*}$options
            } on error {} {
                set ::ms::machine(os,GUI) [list unknown unknown]
            } on ok { results } {
                switch -- [string trim $results] {
                    ""      { set ::ms::machine(os,GUI) [list unknown unknown] }
                    default {
                        switch -nocase -- [lindex $results end] {
                            awesome             { set ::ms::machine(os,GUI) [list AwesomeWM     WM] }
                            bspwm               { set ::ms::machine(os,GUI) [list BSPWM         WM] }
                            budgie-desktop      { set ::ms::machine(os,GUI) [list Budgie        DE] }
                            cinnamon-session    { set ::ms::machine(os,GUI) [list Cinnamon      DE] }
                            cosmic-launcher     { set ::ms::machine(os,GUI) [list COSMIC        DE] }
                            dwm                 { set ::ms::machine(os,GUI) [list DWM           WM] }
                            enlightenment_start { set ::ms::machine(os,GUI) [list Enlightenment DE] }
                            gala                { set ::ms::machine(os,GUI) [list Pantheon      DE] }
                            gnome-session       { set ::ms::machine(os,GUI) [list Gnome         DE] }
                            hyprland            { set ::ms::machine(os,GUI) [list Hyprland      WM] }
                            i3                  { set ::ms::machine(os,GUI) [list i3            WM] }
                            mango               { set ::ms::machine(os,GUI) [list MangoWM       WM] }
                            mate-session        { set ::ms::machine(os,GUI) [list Mate          DE] }
                            niri                -
                            niri-session        { set ::ms::machine(os,GUI) [list Niri          WM] }
                            openbox-session     { set ::ms::machine(os,GUI) [list Openbox       WM] }
                            qtile               { set ::ms::machine(os,GUI) [list Qtile         WM] }
                            river               { set ::ms::machine(os,GUI) [list River         WM] }
                            startdde            { set ::ms::machine(os,GUI) [list Deepin        DE] }
                            startlxde           { set ::ms::machine(os,GUI) [list LXDE          DE] }
                            startlxqt           { set ::ms::machine(os,GUI) [list LXQT          DE] }
                            startkde            { set ::ms::machine(os,GUI) [list KDE           DE] }
                            startplasma         -
                            startplasma-x11     -
                            startplasma-way     -
                            startplasma-wayland { set ::ms::machine(os,GUI) [list "KDE Plasma"  DE] }
                            startxfce           -
                            startxfce2          -
                            startxfce3          -
                            startxfce4          { set ::ms::machine(os,GUI) [list XFCE          DE] }
                            sway                { set ::ms::machine(os,GUI) [list SWAY          WM] }
                            xmonad              { set ::ms::machine(os,GUI) [list Xmonad        WM] }
                            default             { set ::ms::machine(os,GUI) [list unknown       unknown] }
                        }
                    }
                }
            }

            # Set the Linux distribution display manager ('x11' or 'wayland').
            switch -- [info exists ::env(WAYLAND_DISPLAY)] {
                0   {
                    # Fallback.
                    switch -- [info exists ::env(XDG_SESSION_TYPE)] {
                        0   { set ::ms::machine(os,display_manager) "x11" }
                        1   { set ::ms::machine(os,display_manager) $::env(XDG_SESSION_TYPE) }
                    }
                }
                1   { set ::ms::machine(os,display_manager) "wayland" }
            }
        }
        "Win*" {
            # Set all the available Windows cursors types.
            set ::ms::machine(os,cursors) [list arrow            based_arrow_down      based_arrow_up         boat \
                                                bogosity         bottom_left_corner    bottom_right_corner    bottom_side \
                                                bottom_tee       box_spiral            center_ptr             circle \
                                                clock            coffee_mug            cross                  cross_reverse \
                                                crosshair        diamond_cross         dot                    dotbox \
                                                double_arrow     draft_large           draft_small            draped_box \
                                                exchange         fleur                 gobbler                gumby \
                                                hand1            hand2                 heart                  icon \
                                                iron_cross       left_ptr              left_side              left_tee \
                                                leftbutton       ll_angle              lr_angle               man \
                                                middlebutton     mouse                 no                     none \
                                                pencil           pirate                plus                   question_arrow \
                                                right_ptr        right_side            right_tee              rightbutton \
                                                rtl_logo         sailboat              sb_down_arrow          sb_h_double_arrow \
                                                sb_left_arrow    sb_right_arrow        sb_up_arrow            sb_v_double_arrow \
                                                shuttle          size                  size_ne_sw             size_ns \
                                                size_nw_se       size_we               sizing                 spider \
                                                spraycan         star                  starting               target \
                                                tcross           top_left_arrow        top_left_corner        top_right_corner \
                                                top_side         top_tee               trek                   ul_angle \
                                                umbrella         uparrow               ur_angle               wait \
                                                watch            X_cursor              xterm];

            # Get the cpu model name.
            set cmd [list {*}[auto_execok wmic] "cpu" "get" "Name"]
            try {
                exec {*}$cmd
            } on error {} {
                set ::ms::machine(cpu,model) "unknown"
            } on ok { results } {
                set ::ms::machine(cpu,model) [lremove $results 0]
            }

            # Get the number of cpus cores available.
            set cmd [list {*}[auto_execok wmic] "cpu" "get" "NumberOfCores"]
            try {
                exec {*}$cmd
            } on error {} {
                set ::ms::machine(cpu,cores) 1
            } on ok { results } {
                set results [lremove $results 0]

                set ::ms::machine(cpu,cores) 0
                foreach core $results {
                    incr ::ms::machine(cpu,cores) $core
                }
            }

            # Get the number of cpus threads available.
            set cmd [list {*}[auto_execok wmic] "cpu" "get" "NumberOfLogicalProcessors"]
            try {
                exec {*}$cmd
            } on error {} {
                set ::ms::machine(cpu,threads) 1
            } on ok { results } {
                set results [lremove $results 0]

                set ::ms::machine(cpu,threads) 0
                foreach thread $results {
                    incr ::ms::machine(cpu,threads) $thread
                }
            }

            # Get the Windows version number.
            set cmd [list {*}[auto_execok wmic] "os" "get" "Version"]
            try {
                exec {*}$cmd
            } on error {} {
                set ERROR true
            } on ok { results } {
                set ::ms::machine(os,version) [lremove $results 0]

                set version     [split $::tcl_platform(osVersion) "."]
                set major       [lindex $version 0]
                set buildNumber [lindex $version 2]

                if { ($major < 11) } {
                    set ERROR true
                }
            }

            # Get the Windows exact name.
            set cmd [list {*}[auto_execok wmic] "os" "get" "Caption"]
            try {
                exec {*}$cmd
            } on error {} {
                set ::ms::machine(os,name) "Microsoft Windows $major"
            } on ok { results } {
                set ::ms::machine(os,name) [lremove $results 0]
            }

            # Set the Windows prettyname.
            set ::ms::machine(os,prettyname) [list {*}$::ms::machine(os,name) " build: " $buildNumber]
        }
        default { set ERROR true }
    }

    ############################################
    ##                                        ##
    ##     LOAD/SAVE THE MUSTANG SETTINGS     ##
    ##                                        ##
    ############################################

    # Set the mustang settings filepath.
    set filepath [file join $::ms::folder(mustang,config) settings.ini]

    # Load the mustang settings file, if any.
    try {
        open $filepath r
    } on error {} {
        ############################################
        ##                                        ##
        ##     SAVE THE MUSTANG SETTINGS FILE     ##
        ##                                        ##
        ############################################

        try {
            open $filepath w
        } on error {} {
            switch -nocase -- $::DEBUG {
                1       -
                on      -
                true    -
                active  -
                enabled { chan puts "Unable to read or write '[file tail $filepath]'. Ignoring." }
            }
        } on ok { channel } {
            chan puts $channel "# [string trimright [string cat "Mustang " $major_version]]"
            chan puts $channel "#"
            chan puts $channel "# [clock format [clock seconds] -format [list %d %B %Y - %H:%M:%S]]"
            chan puts $channel ""

            chan puts $channel "#############################"
            chan puts $channel "##                         ##"
            chan puts $channel "##     GENERAL OPTIONS     ##"
            chan puts $channel "##                         ##"
            chan puts $channel "#############################"
            chan puts $channel ""

            chan puts $channel "# Accent color"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the accent color to use."
            chan puts $channel "# The default value is 'blue'."
            chan puts $channel "#"
            chan puts $channel "# \['blue', 'gray', 'green', 'orange', 'pink', 'purple', 'red' or 'yellow'\]"
            chan puts $channel "Accent: $::ms::accent"
            chan puts $channel ""

            chan puts $channel "# Colorscheme"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the colorscheme to use."
            chan puts $channel "# The default colorscheme is 'light' in Windows and Linux and the system one in macOS."
            chan puts $channel "#"
            chan puts $channel "# \['light' or 'dark'\]"
            chan puts $channel "Colorscheme: $::ms::colorscheme"
            chan puts $channel ""

            chan puts $channel "# Focus Model"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the focus model to use."
            chan puts $channel "#     explicit --> The focus changes only when a widget decides explicitly to"
            chan puts $channel "#                  claim the focus (e.g., because of a button click), or when"
            chan puts $channel "#                  the user types a key such as TAB or SHIFT-TAB that moves"
            chan puts $channel "#                  the focus."
            chan puts $channel "#                  This is the default focus model."
            chan puts $channel "#"
            chan puts $channel "#     implicit --> The focus changes everytime the mouse enters a focussable widget."
            chan puts $channel "#"
            chan puts $channel "# \['explicit' or 'implicit'\]"
            chan puts $channel "FocusModel: $::ms::focusmodel"
            chan puts $channel ""

            chan puts $channel "# Language"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the language to use."
            chan puts $channel "Language: $::ms::language"
            chan puts $channel ""

            chan puts $channel "# Click action"
            chan puts $channel "#"
            chan puts $channel "# Set how each mustang scrollbar and scale reacts when a click happens on their trough."
            chan puts $channel "#    jump   --> The thumb will jump to the selected location."
            chan puts $channel "#"
            chan puts $channel "#    scroll --> The scrollbar thumb will scroll one page down, up, left or right depending"
            chan puts $channel "#               on the scrollbar orientation and the clicked position."
            chan puts $channel "#               The scale thumb will scroll one unit down, up, left or right depending on"
            chan puts $channel "#               the scale orientation and the clicked position."
            chan puts $channel "#               This is the default click action."
            chan puts $channel "#"
            chan puts $channel "# \['jump' or 'scroll'\]"
            chan puts $channel "ClickAction: $::ms::clickaction"
            chan puts $channel ""

            chan puts $channel "# Set the default action for the middle click buttonpress."
            chan puts $channel "#"
            chan puts $channel "# On Linux, the default action is 'paste', on the other"
            chan puts $channel "# operating systems is 'drag'."
            chan puts $channel "#"
            chan puts $channel "# \['paste','drag'\]"
            chan puts $channel "MiddleClick: $::ms::middleclick"
            chan puts $channel ""

            chan puts $channel "# Scroll mode"
            chan puts $channel "#"
            chan puts $channel "# It's the mousewheel scroll mode."
            chan puts $channel "#    natural --> (Apple style) Scrolling the mousewheel up will move the page towards the bottom "
            chan puts $channel "#                and scrolling the mousewheel down will move the page towards the top."
            chan puts $channel "#                Scrolling the mousewheel up (with the SHIFT key pressed) will move the page"
            chan puts $channel "#                towards the right and scrolling the mousewheel down (with the SHIFT key pressed)"
            chan puts $channel "#                will move the page towards the left."
            chan puts $channel "#"
            chan puts $channel "#    classic --> Scrolling the mousewheel up will move the page towards the top and scrolling "
            chan puts $channel "#                the mousewheel down will move the page towards the bottom."
            chan puts $channel "#                Scrolling the mousewheel up (with the SHIFT key pressed) will move the page"
            chan puts $channel "#                towards the left and scrolling the mousewheel down (with the SHIFT key pressed)"
            chan puts $channel "#                will move the page towards the right."
            chan puts $channel "#                This is the default scroll mode on Windows and Linux operating systems."
            chan puts $channel "#"
            chan puts $channel "# \['classic' or 'natural'\]"
            chan puts $channel "ScrollMode: $::ms::scrollmode"
            chan puts $channel ""

            chan puts $channel "# Enable/Disable the scroll stopper for combobox, spinbox and listboxes."
            chan puts $channel "#    enabled  --> When the pressing of the arrow up or of the arrow down key (or by scrolling the mousewheel)"
            chan puts $channel "#                 cause the relative content to reach the start (or the end), the movement will stop."
            chan puts $channel "#                 Further pressing of the same arrow key (or scrolling the mousewheel in the same"
            chan puts $channel "#                 direction as before) will not yield any movement."
            chan puts $channel "#"
            chan puts $channel "#    disabled --> When the pressing of the arrow up or of the arrow down key (or by scrolling the mousewheel)"
            chan puts $channel "#                 cause the relative content to reach the start (or the end), the movement will cycle trough."
            chan puts $channel "#                 Further pressing of the same arrow key (or scrolling the mousewheel in the same"
            chan puts $channel "#                 direction as before) will continue to do the movement but from the other end of the content."
            chan puts $channel "#"
            chan puts $channel "# \['disabled' or 'enabled'\]"
            chan puts $channel "ScrollStopper: $::ms::scrollstopper"
            chan puts $channel ""

            chan puts $channel "# Theme"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the theme to use."
            chan puts $channel "# Theme names are case sensitive."
            chan puts $channel "Theme: $::ms::theme"
            chan puts $channel ""

            # If the system is not macOS or Windows, save the UI scale.
            switch -- [_tk windowingsystem] {
                aqua    -
                win32   {}
                default {
                    chan puts $channel "# Scale"
                    chan puts $channel "#"
                    chan puts $channel "# It's a floating point number that specifies the UI scaling factor (in percentage, but without the '%' sign)."
                    chan puts $channel "#"
                    chan puts $channel "# \[100.0,1000.0\]"
                    chan puts $channel "Scale: $::ms::scale"
                    chan puts $channel ""
                }
            }

            chan puts $channel "###################"
            chan puts $channel "##               ##"
            chan puts $channel "##     FONTS     ##"
            chan puts $channel "##               ##"
            chan puts $channel "###################"
            chan puts $channel ""
            chan puts $channel "# If the font size specified is a positive number, it is interpreted as a size in points."
            chan puts $channel "# If the font size specified is a negative number, its absolute value is interpreted as a size in pixels."
            chan puts $channel "# If a font cannot be displayed at the specified size, a nearby size will be chosen."
            chan puts $channel ""

            chan puts $channel "# Biggest font"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the biggest font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another sans-serif family will be chosen."
            chan puts $channel "BiggestFont: [_font configure BiggestFont -family] [_font configure BiggestFont -size]"
            chan puts $channel ""

            chan puts $channel "# Bigger font"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the bigger font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another sans-serif family will be chosen."
            chan puts $channel "BiggerFont: [_font configure BiggerFont -family] [_font configure BiggerFont -size]"
            chan puts $channel ""

            chan puts $channel "# Default font"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the default font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another sans-serif family will be chosen."
            chan puts $channel "DefaultFont: [_font configure NormalFont -family] [_font configure NormalFont -size]"
            chan puts $channel ""

            chan puts $channel "# Smaller font"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the smaller font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another sans-serif family will be chosen."
            chan puts $channel "SmallerFont: [_font configure SmallerFont -family] [_font configure SmallerFont -size]"
            chan puts $channel ""

            chan puts $channel "# Smallest font"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the smallest font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another sans-serif family will be chosen."
            chan puts $channel "SmallestFont: [_font configure SmallestFont -family] [_font configure SmallestFont -size]"
            chan puts $channel ""

            chan puts $channel "# Monospace font"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the monospace font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another monospace family will be chosen."
            chan puts $channel "MonospaceFont: [_font configure MonospaceFont -family] [_font configure MonospaceFont -size]"

            chan flush $channel
            chan close $channel
        }
    } on ok { channel } {
        ############################################
        ##                                        ##
        ##     READ THE MUSTANG SETTINGS FILE     ##
        ##                                        ##
        ############################################

        # Read the entire file.
        set file_content [split [chan read $channel] "\n"]
        chan close $channel

        # Scan the file content line by line.
        foreach line $file_content {
            # Remove any spaces at the beginning and ending of the line string.
            set line [string trim $line]

            # Skip comments.
            switch -- [string index $line 0] {
                "#"  { continue }
            }

            # Skip empty lines and options without value/s.
            switch -- [llength $line] {
                0       -
                1       { continue }
                default {
                    # Get all the font family names known by the operating system.
                    set families [_font families -displayof .]

                    # Check the settings options specified.
                    set option [lindex  $line 0]
                    set value  [lremove $line 0]
                    switch -nocase -- $option {
                        "Accent:" {
                            set value [string tolower $value]
                            switch -- $value {
                                blue   -
                                gray   -
                                green  -
                                orange -
                                pink   -
                                purple -
                                red    -
                                yellow { set ::ms::accent $value }
                            }
                        }
                        "BiggerFont:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lremove $value end]]
                            if { $family ni $families } {
                                continue
                            }

                            _font configure BiggerFont -family $family \
                                                         -size $size;
                        }
                        "BiggestFont:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lremove $value end]]
                            if { $family ni $families } {
                                continue
                            }

                            _font configure BiggestFont -family $family \
                                                          -size $size;
                        }
                        "ClickAction:" {
                            set value [string tolower $value]
                            switch -- $value {
                                jump   -
                                scroll { set ::ms::clickaction $value }
                            }
                        }
                        "Colorscheme:" {
                            set value [string tolower $value]
                            switch -- $value {
                                dark  -
                                light { set ::ms::colorscheme $value }
                            }
                        }
                        "DefaultFont:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lremove $value end]]
                            if { $family ni $families } {
                                continue
                            }

                            _font configure NormalFont -family $family \
                                                         -size $size;
                        }
                        "FocusModel:" {
                            switch -nocase -- $value {
                                explicit { set ::ms::focusmodel explicit }
                                implicit {
                                    set ::ms::focusmodel implicit

                                    # Apply the implicit bindings.
                                    _bind all <Enter> [list +::ms::focus::Implicit %W %d]
                                }
                            }
                        }
                        "Language:" {
                            set value [string tolower $value]
                            if { $value in $::ms::languages } {
                                # Set the new mustang language.
                                set ::ms::language $value

                                # Change the mustang language.
                                ::msgcat::mclocale $value
                            }
                        }
                        "MiddleClick:" {
                            set value [string tolower $value]
                            switch -- $value {
                                drag  -
                                paste { set ::ms::middleclick $value }
                            }
                        }
                        "MonospaceFont:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lremove $value end]]
                            if { $family ni $families } {
                                continue
                            }

                            _font configure MonospaceFont -family $family \
                                                            -size $size;
                        }
                        "Scale:" {
                            # If the operating system is macOS or Windows, do not allow to change it's value (100.0).
                            switch -- [_tk windowingsystem] {
                                aqua    -
                                win32   { continue }
                                default {
                                    switch -- [string is double -strict $value] {
                                        0   { continue }
                                        1   {
                                            if { $value < 100.0 } {
                                                continue
                                            } elseif { $value > 1000.0 } {
                                                continue
                                            }
                                        }
                                    }

                                    set ::ms::scale $value
                                }
                            }
                        }
                        "ScrollMode:" {
                            switch -nocase -- $value {
                                classic { set ::ms::scrollmode classic }
                                natural { set ::ms::scrollmode natural }
                            }
                        }
                        "ScrollStopper:" {
                            switch -nocase -- $value {
                                0        -
                                no       -
                                off      -
                                false    -
                                disabled { set ::ms::scrollstopper disabled }
                                1        -
                                yes      -
                                on       -
                                true     -
                                enabled  { set ::ms::scrollstopper enabled }
                            }
                        }
                        "SmallerFont:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lremove $value end]]
                            if { $family ni $families } {
                                continue
                            }

                            _font configure SmallerFont -family $family \
                                                          -size $size;
                        }
                        "SmallestFont:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lremove $value end]]
                            if { $family ni $families } {
                                continue
                            }

                            _font configure SmallestFont -family $family \
                                                           -size $size;
                        }
                        "Theme:" { set ::ms::theme $value }
                    }
                }
            }
        }
    }

    ###########################################
    ##                                       ##
    ##     LOAD THE MUSTANG THEME COLORS     ##
    ##                                       ##
    ###########################################

    try {
        source -encoding utf-8 [file join $::ms_library themes "colors.tcl"]
    } on error {} {
        # Note: We have no themes available and at the same time we cannot go on.
        #       We cannot risk to display a graphical error dialog.

        # Exit from the application and print the reason on 'stdout'.
        # If the operating system is not supported display the translation of "Operating system not supported",
        # otherwise display the translation of 'Missing colors'.
        switch -- $ERROR {
            false { chan puts stdout "[::msgcat::mc "Missing colors."]" }
            true  { chan puts stdout "[::msgcat::mc "Operating system not supported."]" }
        }

        # Display the translation of "Quit the application".
        chan puts stdout "[::msgcat::mc "Quit the application."]"
        exit 1
    }

    #####################################################
    ##                                                 ##
    ##     SOURCE ALL THE AVAILABLE MUSTANG THEMES     ##
    ##                                                 ##
    #####################################################

    # Initialize the list of available themes.
    set ::ms::themes [list ]

    # Initialize some style variables.
    foreach classtype $::ms::data(classtypes) {
        # Get the default 'style' from 'classtype'.
        switch -- $classtype {
            canvas   -
            listbox  -
            treeview -
            text     -
            toplevel { set style [string totitle $classtype] }
            crate    { set style Crate }
            embed    { set style Embed }
            default  { set style [string cat "T" [string totitle $classtype]] }
        }

        # Inizialize the classtype widgets real address list for 'style'.
        set ::ms::style($style,$classtype,addrs) [list ]
    }

    # Source all default themes.
    foreach theme_folder [lsort -dictionary -increasing [glob -type d -nocomplain -directory [file join $::ms_library themes] -- *]] {
        # Get the theme name from the folder name.
        set theme [file tail $theme_folder]

        # Initialize the style list for this theme.
        set ::ms::style($theme) [list ]

        # If 'theme' is a valid mustang theme, source it.
        try {
            source -encoding utf-8 [file join $::ms_library themes $theme "theme.tcl"]
        } on error {} {
            # If the '::DEBUG' variable is enabled, display on the standard output channel
            # that the current theme examined was ignored.
            switch -nocase -- $::DEBUG {
                1       -
                on      -
                true    -
                active  -
                enabled { chan puts stdout "Unable to load the '$theme' theme. Ignoring." }
            }

            # Remove every variable created so far for this theme.
            foreach style $::ms::style($theme) {
                unset -nocomplain -- ::ms::stylelayout($theme,$style) \
                                     ::ms::stylemap($theme,$style) \
                                     ::ms::styleopt($theme,$style);
            }

            unset -nocomplain -- ::ms::layouts($theme) \
                                 ::ms::style($theme);
        } on ok {} {
            # Check that the theme charwidth values for entries, comboboxes, menubuttons, palettes and spinboxes
            # are present and that they are a positive integer (and not **0**).
            foreach style [list TEntry TCombobox TMenubutton TPalette TSpinbox] {
                set index [lsearch -exact $::ms::styleopt($theme,$style) "-charwidth"]
                switch -- $index {
                    -1  {
                        # Set the charwidth option for the current theme.
                        lappend ::ms::styleopt($theme,$style) "-charwidth" \
                                                              8;

                        set ::ms::styleopt($theme,$style,charwidth) 8
                    }
                    default {
                        if { $::ms::styleopt($theme,$style,charwidth) <= 0 } {
                            # Update the charwidth option for the current theme.
                            set ::ms::styleopt($theme,$style)           [lreplace $::ms::styleopt($theme,$style) $index+1 $index+1 8]
                            set ::ms::styleopt($theme,$style,charwidth) 8
                        }
                    }
                }
            }

            # Check that the theme paddings for crates, embeds, texts and toplevels are present and that they are
            # lists with at least two elements.
            foreach style [list Crate Embed Text Toplevel] {
                set index [lsearch -exact $::ms::styleopt($theme,$style) "-padding"]
                switch -- $index {
                    -1  {
                        # Set the padding option for the current theme.
                        lappend ::ms::styleopt($theme,$style) "-padding" \
                                                              [list 0];

                        set ::ms::styleopt($theme,$style,padding) [list 0]
                    }
                    default {
                        if { $::ms::styleopt($theme,$style,padding) <= 0 } {
                            # Update the padding option for the current theme.
                            set ::ms::styleopt($theme,$style)         [lreplace $::ms::styleopt($theme,$style) $index+1 $index+1 [list 0]]
                            set ::ms::styleopt($theme,$style,padding) [list 0]
                        }
                    }
                }
            }

            # Register the theme name among the available themes.
            lappend ::ms::themes $theme
        }
    }

    # Safeguards.
    switch -- [llength $::ms::themes] {
        0   {
            # Note: We have no themes available and at the same time we cannot go on.
            #       We cannot risk to display a graphical error dialog.

            # Exit from the application and print the reason on 'stdout'.
            # If the operating system is not supported display the translation of "Operating system not supported",
            # otherwise display the translation of 'Missing themes'.
            switch -- $ERROR {
                false { chan puts stdout "[::msgcat::mc "Missing themes."]" }
                true  { chan puts stdout "[::msgcat::mc "Operating system not supported."]" }
            }

            # Display the translation of "Quit the application".
            chan puts stdout "[::msgcat::mc "Quit the application."]"
            exit 1
        }
        1   {
            # Check if the current theme is one of the actual themes known by mustang.
            if { $::ms::theme ni $::ms::themes } {
                switch -nocase -- $::DEBUG {
                    1       -
                    on      -
                    true    -
                    active  -
                    enabled { chan puts stdout "Unable to load the '$::ms::theme' theme. The program will use the first theme on the list." }
                }

                # Set the current theme with the first theme available (in alphabetical order) among the ones known by mustang.
                set ::ms::theme [lindex $::ms::themes 0]
            }
        }
    }

    # Load the mustang theme.
    # It could be the default one (Halo), the first on the theme list (in alphabetical order) or the one registered in the mustang preferences.
    _ttk_style theme use $::ms::theme

    ###########################################################################
    ##                                                                       ##
    ##     CONFIGURE 'POINT' TO ACT, LOOK AND FEEL AS ANY OTHER TOPLEVEL     ##
    ##                                                                       ##
    ###########################################################################

    # Set the default values of every point 'not styleable' option.
    set ::ms::default(.,class)     [lindex [. configure -class] 3]
    set ::ms::default(.,colormap)  [lindex [. configure -colormap] 3]
    set ::ms::default(.,cmenu)     {}
    set ::ms::default(.,height)    [lindex [. configure -height] 3]
    set ::ms::default(.,menu)      [lindex [. configure -menu] 3]
    set ::ms::default(.,screen)    [lindex [. configure -screen] 3]
    set ::ms::default(.,state)     $::ms::default(toplevel,state)
    set ::ms::default(.,style)     $::ms::default(toplevel,style)
    set ::ms::default(.,takefocus) 0
    set ::ms::default(.,title)     [_wm title .]
    set ::ms::default(.,visual)    [lindex [. configure -visual] 3]
    set ::ms::default(.,width)     [lindex [. configure -width] 3]

    # Set the current values of every point 'not styleable' option.
    set ::ms::current(.,class)     [lindex [. configure -class] 4]
    set ::ms::current(.,colormap)  [lindex [. configure -colormap] 4]
    set ::ms::current(.,cmenu)     $::ms::default(.,cmenu)
    set ::ms::current(.,height)    [lindex [. configure -height] 4]
    set ::ms::current(.,menu)      [lindex [. configure -menu] 4]
    set ::ms::current(.,screen)    [lindex [. configure -screen] 4]
    set ::ms::current(.,state)     $::ms::default(.,state)
    set ::ms::current(.,style)     $::ms::default(.,style)
    set ::ms::current(.,takefocus) 0
    set ::ms::current(.,title)     $::ms::default(.,title)
    set ::ms::current(.,visual)    [lindex [. configure -visual] 4]
    set ::ms::current(.,width)     [lindex [. configure -width] 4]

    # Set the point variables needed for internal mechanisms.
    set ::ms::data(.,classtype) toplevel
    set ::ms::data(.,statespec) $::ms::data(statespec,normal)

    # Set each point styleable option to be managed by Tk.
    #
    # Note: developer --> The 'option' will be managed directly by the developer and may not follow
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
    #       To make a point styleable option managed by the developer, just set your desired value for that
    #       option through its configure command, like:
    #
    #           . configure -background red
    set ::ms::managed_by(.,background)      Tk
    set ::ms::managed_by(.,bordercolor)     Tk
    set ::ms::managed_by(.,borderwidth)     Tk
    set ::ms::managed_by(.,cursor)          Tk
    set ::ms::managed_by(.,padding)         Tk
    set ::ms::managed_by(.,relief)          Tk

    # Set the default options values for each styleable option.
    foreach option $::ms::toplevel(styleable,options) {
        set ::ms::default(.,$option) $::ms::styleopt($::ms::theme,Toplevel,$option)
    }

    # Set the current values of every point 'styleable' option as their default values.
    set ::ms::current(.,background)  $::ms::default(.,background)
    set ::ms::current(.,bordercolor) $::ms::default(.,bordercolor)
    set ::ms::current(.,borderwidth) $::ms::default(.,borderwidth)
    set ::ms::current(.,cursor)      $::ms::default(.,cursor)
    set ::ms::current(.,padding)     $::ms::default(.,padding)
    set ::ms::current(.,relief)      $::ms::default(.,relief)

    # Set the internal '-padding' option to always show the horizontal and vertical padding.
    switch -- [llength $::ms::current(.,padding)] {
        1   { set ::ms::data(.,padding) [list $::ms::current(.,padding) $::ms::current(.,padding)] }
        2   { set ::ms::data(.,padding) $::ms::current(.,padding) }
        3   {
            # If the '::DEBUG' variable is enabled, display the notificafion for the padding value ignored.
            switch -nocase -- $::DEBUG {
                1       -
                on      -
                true    -
                active  -
                enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
            }

            set ::ms::data(.,padding) [list [lindex $::ms::current(.,padding) 0] [lindex $::ms::current(.,padding) 1]]
        }
        4   {
            # If the '::DEBUG' variable is enabled, display the notificafion for the padding values ignored.
            switch -nocase -- $::DEBUG {
                1       -
                on      -
                true    -
                active  -
                enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
            }

            set ::ms::data(.,padding) [list [lindex $::ms::current(.,padding) 0] [lindex $::ms::current(.,padding) 1]]
        }
    }

    # Set the point options that needs to be configured.
    set POINT_OPTIONS [list -background $::ms::current(.,background) \
                                -cursor $::ms::current(.,cursor) \
                                  -padx [lindex $::ms::data(.,padding) 0] \
                                  -pady [lindex $::ms::data(.,padding) 1] \
                             -takefocus $::ms::current(.,takefocus)];

    switch -- $::ms::current(.,relief) {
        flat  -
        solid {
            lappend POINT_OPTIONS         -borderwidth 0 \
                                  -highlightbackground $::ms::current(.,bordercolor) \
                                       -highlightcolor $::ms::current(.,bordercolor) \
                                   -highlightthickness $::ms::current(.,borderwidth) \
                                               -relief flat;
        }
        default {
            lappend POINT_OPTIONS         -borderwidth $::ms::current(.,borderwidth) \
                                  -highlightbackground $::ms::current(.,background) \
                                       -highlightcolor $::ms::current(.,background) \
                                   -highlightthickness 0 \
                                               -relief $::ms::current(.,relief);
        }
    }

    # Apply the options.
    . configure {*}$POINT_OPTIONS

    # Set the widget toplevel.
    set ::ms::addr(.,toplevel) .

    # Check the windowing system.
    switch -- [_tk windowingsystem] {
        aqua {
            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for point.
            switch -- $::ms::current(.,class) {
                Toplevel { bindtags . [list . _Toplevel Toplevel $::ms::addr(.,toplevel) all] }
                default  { bindtags . [list . $::ms::current(.,class) _Toplevel Toplevel $::ms::addr(.,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr(.,real) .

            # Set the widget short address relative to its real address, 'w'.
            set ::ms::addr(.,short) .

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals)  .
            lappend ::ms::addr(shorts) .

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr(.,border) .

            # Set the actual widget address.
            set ::ms::addr(.,widget) .

            # Set the structure address.
            set ::ms::addr(.,structure) [list .];
        }
        default {
            #####################
            ##                 ##
            ##     CONTENT     ##
            ##                 ##
            #####################

            # Set the content object style name.
            set ::ms::style(.,content) [string cat "_bg=" $::ms::current(.,background) \
                                                   ".TFrame"];

            # If needed, create the content object style name.
            if { $::ms::style(.,content) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style(.,content) -background $::ms::current(.,background)

                # Add the content object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style(.,content)
            }

            # Initialize the content object mapping.
            set mapping [list ]

            # background
            switch -- $::ms::managed_by(.,background) {
                developer { lappend mapping -background [list pressed $::ms::current(.,background)] }
                Tk  {
                    # Check if a 'background' mapping exists for '::ms::current(.,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current(.,style),background)] {
                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current(.,style),background) }
                    }
                }
            }

            # If needed, create the content object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style(.,content) {*}$mapping

                # Add the content object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the content object.
            _ttk_frame .content -borderwidth 0 \
                                      -class TFrame \
                                     -cursor arrow \
                                     -height $::ms::current(.,height) \
                                    -padding 0 \
                                     -relief flat \
                                      -style $::ms::style(.,content) \
                                  -takefocus 0 \
                                      -width $::ms::current(.,width);

            # Pack the content object.
            _pack .content -anchor nw \
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
            switch -- $::ms::current(.,class) {
                Toplevel { bindtags . [list . _Toplevel Toplevel $::ms::addr(.,toplevel) all] }
                default  { bindtags . [list . $::ms::current(.,class) _Toplevel Toplevel $::ms::addr(.,toplevel) all] }
            }

            # Activate/Deactivate
            _bind .content <Activate>   { ::ms::toplevel::Pathname_Cmd . state !background; break }
            _bind .content <Deactivate> { ::ms::toplevel::Pathname_Cmd . state  background; break }

            # ButtonPress-1
            _bind .content <ButtonPress-1> { ::ms::toplevel::Focus_Toplevel .; break }

            # Contextual menu
            _bind .content <<ContextMenu>> { ::ms::Show_Context_Menu . %X %Y cmenu; break }

            # Destroy
            _bind .content <Destroy> { ::ms::toplevel::Destroy .; break }

            # Enter/Leave
            _bind .content <Enter> { ::ms::toplevel::Hover . %X %Y; break }
            _bind .content <Leave> { ::ms::toplevel::Hover . %X %Y; break }

            # FocusIn/FocusOut
            _bind .content <FocusIn>  { ::ms::toplevel::Focus_In  .; break }
            _bind .content <FocusOut> { ::ms::toplevel::Focus_Out .; break }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Set the widget real address relative to its short address, '.'.
            set ::ms::addr(.,real) .

            # Set the widget short address relative to its real address, '.'.
            set ::ms::addr(.,short)        .
            set ::ms::addr(.content,short) .

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals) . \
                                      .content;

            lappend ::ms::addr(shorts) .

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr(.,border) .

            # Set the actual widget address.
            set ::ms::addr(.,widget) .content

            # Set the structure address.
            set ::ms::addr(.,structure) [list . \
                                              .content];

            # Add the widget address to the megawidget addresses list.
            lappend ::ms::addr(megawidgets) .

            # Add the widget address to the megawidget container addresses list.
            lappend ::ms::addr(megawidgets,containers) .
        }
    }

    #####################
    ##                 ##
    ##     CLOSING     ##
    ##                 ##
    #####################

    # Set the toplevel title, if any.
    switch -- $::ms::current(.,title) {
        ""      {}
        default { wm title . [::msgcat::mc "$::ms::current(.,title)"] }
    }

    # Hide the toplevel real address pathcommand.
    interp hide {} .

    # Create an alias for the toplevel real pathcommand.
    lappend ::ms::data(.,token) [interp alias {} . {} ::ms::toplevel::Pathname_Cmd .]

    # Add the widget address to the toplevel widgets real address list.
    lappend ::ms::addr(toplevel) .

    # Add the widget address to the toplevel real address list with class '::ms::current(.,class)'.
    lappend ::ms::class($::ms::current(.,class),toplevel,addrs) .

    # Add the widget address to the toplevel real address list with style '::ms::current(.,style)'.
    lappend ::ms::style($::ms::current(.,style),toplevel,addrs) .

    # Add '::ms::current(.,style)' to the available styles for the toplevel classtype.
    lappend ::ms::style(toplevel) $::ms::current(.,style)

    ###############################################################################
    ##                                                                           ##
    ##     SET A TRACING ON THE ACCENT, COLORSCHEME AND FOCUSMODEL VARIABLES     ##
    ##                                                                           ##
    ###############################################################################

    # Register the current accent color, colorscheme and focusmodel as the last valid ones.
    # These variables are used when the new color accent, colorscheme and focusmodel validation fails
    # and mustang needs to reset its/their value/s to the last valid one/s.
    set ::ms::temp(accent,last)      $::ms::accent
    set ::ms::temp(colorscheme,last) $::ms::colorscheme
    set ::ms::temp(focusmodel,last)  $::ms::focusmodel

    # Set a trace on '::ms::accent' and '::ms::colorscheme' in order to check their values in case the developer/user changes them.
    # If the value provided is a valid one then mustang will react accordingly, if it is not, mustang will override it with its last valid value.
    trace add variable ::ms::accent \
              write    [list ::ms::Check_And_React]

    trace add variable ::ms::colorscheme \
              write    [list ::ms::Check_And_React]

    trace add variable ::ms::focusmodel \
              write    [list ::ms::Check_And_React]

    ###############################################################
    ##                                                           ##
    ##     CHECK IF THE OPERATING SYSTEM IS SUPPORTED OR NOT     ##
    ##                                                           ##
    ###############################################################

    # Note: If the operating system is not supported, we can now display a graphical error dialog.

    switch -- $ERROR {
        false { return "" }
        true  { ::ms::Error "[::msgcat::mc "Operating system not supported."]" "" }
    }
}

####################
##                ##
##     CHECKS     ##
##                ##
####################

## Check_And_React
#
# Check and react to any changes made to the mustang traced variables.
#
# Where:
#
# name1,
# name2,
# op        Should be the tracing arguments.
#           Do not pass any value, the **trace** command will automatically pass these values.
#
# It doesn't return anything.
proc ::ms::Check_And_React { name1 name2 op } {
    # Safeguard for future use of this procedure with other variables other than '::ms::accent' and '::ms::colorscheme'.
    # If the variable is an array, reconstruct the name.
    set varName $name1
    switch -- $name2 {
        ""      {}
        default { append varName "(" $name2 ")" }
    }

    # Check the value of the variable name contained in 'varName'.
    switch -- $varName {
        ::ms::accent {
            # Transform the accent color provided in lowercase characters.
            set ::ms::accent [string tolower $::ms::accent]

            # Check that the new accent color provided is a valid one.
            switch -- $::ms::accent {
                blue   -
                gray   -
                green  -
                orange -
                pink   -
                purple -
                red    -
                yellow {
                    # Check that the new accent color is not the same as the one currently registered.
                    if { $::ms::accent ne $::ms::temp(accent,last) } {
                        # Register the last valid accent color.
                        set ::ms::temp(accent,last) $::ms::accent

                        # Note: Both '::ms::accent' and '::ms::colorscheme' needs to refresh the theme after their validation.
                        #       If both of these variables are setted at the same time, two refreshes will happen.
                        #       To avoid it, we introduce a timer (50ms) before actually executing the refresh.
                        #       This timer will be resetted if, while active, another command asks to refresh the theme.

                        if { [info exists ::ms::temp(pending,refresh)] } {
                            after cancel $::ms::temp(pending,refresh)
                            unset -nocomplain -- ::ms::temp(pending,refresh)
                        }
                        set ::ms::temp(pending,refresh) [after 50 [list style theme use $::ms::theme]]
                    }
                }
                default {
                    # Restore the last valid accent color.
                    set ::ms::accent $::ms::temp(accent,last)
                }
            }
        }
        ::ms::colorscheme {
            # Transform the colorscheme value provided in lowercase characters.
            set ::ms::colorscheme [string tolower $::ms::colorscheme]

            # Check that the new colorscheme value is a valid one.
            switch -- $::ms::colorscheme {
                dark  -
                light {
                    # Check that the new colorscheme value is not the same as the one currently registered.
                    if { $::ms::colorscheme ne $::ms::temp(colorscheme,last) } {
                        # Register the last valid colorscheme value.
                        set ::ms::temp(colorscheme,last) $::ms::colorscheme

                        # Note: Both '::ms::accent' and '::ms::colorscheme' needs to refresh the theme after their validation.
                        #       If both of these variables are setted at the same time, two refreshes will happen.
                        #       To avoid it, we introduce a timer (50ms) before actually executing the refresh.
                        #       This timer will be resetted if, while active, another command asks to refresh the theme.

                        if { [info exists ::ms::temp(pending,refresh)] } {
                            after cancel $::ms::temp(pending,refresh)
                            unset -nocomplain -- ::ms::temp(pending,refresh)
                        }
                        set ::ms::temp(pending,refresh) [after 50 [list style theme use $::ms::theme]]
                    }
                }
                default {
                    # Restore the last valid colorscheme value.
                    set ::ms::colorscheme $::ms::temp(colorscheme,last)
                }
            }
        }
        ::ms::focusmodel {
            # Transform the focus model provided in lowercase characters.
            set ::ms::focusmodel [string tolower $::ms::focusmodel]

            # Check that the new focus model provided is a valid one.
            switch -- $::ms::focusmodel {
                implicit {
                    if { $::ms::focusmodel ne $::ms::temp(focusmodel,last) } {
                        # Register the last valid focus model as implicit.
                        set ::ms::temp(focusmodel,last) implicit

                        # Apply the implicit bindings.
                        _bind all <Enter> [list +::ms::focus::Implicit %W %d]
                    }
                }
                explicit {
                    if { $::ms::focusmodel ne $::ms::temp(focusmodel,last) } {
                        # Register the last valid focus model as explicit.
                        set ::ms::temp(focusmodel,last) explicit

                        # Remove the implicit bindings.
                        bind all <Enter> [list -::ms::focus::Implicit %W %d]
                    }
                }
                default {
                    # Restore the last valid focus model.
                    set ::ms::focusmodel $::ms::temp(focusmodel,last)
                }
            }
        }
    }

    return ""
}

## Check_Color
#
# Validate a color expressed in hexadecimal or textual form.
#
# Where:
#
# value      It's a list that specifies the color to validate and optionally some other information about the color.
#            The number of elements of this list depends on the color type in which *value* is provided.
#            The allowed color types are:
#
#               **hexadecimal colors**  --> These colors needs to be specified at **8**, **12** or **16** bits, without an *alpha*
#                                           channel (transparency), in shortform (three hexadecimals) or longform (six, nine or twelve
#                                           hexadecimals), with or without the **#**.
#
#                                           In this form, the list should have only one or two elements.
#                                           The first element indicates the color to validate and the second one (optional) indicates
#                                           the hexadecimal color model (**HEX8**, **HEX12** or **HEX16**) in which the color will be
#                                           translated. If only one element is provided (the hexadecimal color) its color model will be
#                                           assumed to be **HEX8**.
#
#                                           Note that **HEX8** can be shortened into **HEX**.
#
#                                           After its validation, the color will be returned translated in its equivalent hexadecimal
#                                           longform (in lowercase characters and with the **#** symbol) for the color model provided.
#
#                                           See the [color model](/wiki/colormodels/index.md) wiki page to know more about color models.
#
#                                           Note: Hexadecimal colors and color models are case insensitive.
#
#                                           Some examples:
#
#                                                "#FFF"            --> The hexadecimal color is "#FFF".
#                                                                      The color model is **HEX8**.
#
#                                                                      The hexadecimal color is translated to '#ffffff'.
#
#                                                "#F0F hex12"      --> The hexadecimal color is "#F0F".
#                                                                      The color model is **HEX12**.
#
#                                                                      The hexadecimal color is translated to '#FFF000FFF'.
#
#                                                "#FF0000"         --> The hexadecimal color is "#FF0000".
#                                                                      The color model is **HEX8**.
#
#                                                                      The hexadecimal color is translated to '#ff0000'.
#
#                                                "#00FF00 hex16"   --> The hexadecimal color is "#00FF00".
#                                                                      The color model is **HEX16**.
#
#                                                                      The hexadecimal color is translated to '#0000ffff0000'.
#
#                                                "#000000FFF hex"  --> The hexadecimal color is "#000000FFF".
#                                                                      The color model is **HEX8**.
#
#                                                                      The hexadecimal color is translated to '#0000ff'.
#
#                                                "FFFF00"          --> The hexadecimal color is "FFFF00".
#                                                                      The color model is **HEX8**.
#
#                                                                      The hexadecimal color is translated to '#ffff00'.
#
#               **textual color names** --> These colors needs to be specified in textual form like *Azure*, *Brown*, *Dark Red*,
#                                           *Magenta*, or *Light Steel Blue*.
#
#                                           In this form, the list should have at least one element. More precisely:
#
#                                                colorname   --> It's the textual color name that specifies the color.
#                                                                Should always be written first. It can take more than one element of
#                                                                the list depending on how many words are needed to define it.
#
#                                                                The only color names known by mustang are specified in its palettes.
#                                                                See the [palette](/wiki/palettes/index.md) wiki page to know more about
#                                                                the allowed color names for the default **mustang** palette.
#
#                                                palette     --> Optional. Should be the name of the palette that contains the color name.
#                                                                If present, it should always be the last element of the list if the color model
#                                                                is not present, or the last but one if the color model is present.
#
#                                                                Allowed values are any palette name loaded into mustang.
#                                                                If not provided, defaults to **mustang** or return the fallback value
#                                                                if the **mustang** palette was not loaded.
#
#                                                                See the [palette](/wiki/palettes/index.md) wiki page to know more about
#                                                                the mustang palettes.
#
#                                                colormodel  --> Optional. Should be the hexadecimal color model in which the color name
#                                                                will be translated.
#                                                                If present, the color model should always be the last element of the list.
#
#                                                                Allowed values are **HEX8**, **HEX12** and **HEX16**.
#                                                                If not provided, defaults to **HEX8**.
#
#                                                                Note that **HEX8** can be shortened into **HEX**.
#
#                                                                See the [color model](/wiki/colormodels/index.md) wiki page to know more
#                                                                about color models.
#
#                                           Note: Colornames, palettes and color models are case insensitive.
#
#                                           Some examples:
#
#                                                "teal"                --> The color name is *teal*.
#                                                                          The palette name is **mustang**.
#                                                                          The color model is **HEX8**.
#
#                                                                          The color name is translated to "#008080"
#
#                                                "medium violet red"   --> The color name is *medium violet red*.
#                                                                          The palette name is **mustang**.
#                                                                          The color model is **HEX8**.
#
#                                                                          The color name is translated to "#c71585"
#
#                                                "sepia MyPalette"     --> The color name is *sepia*.
#                                                                          The palette name is **MyPalette**.
#                                                                          The color model is **HEX8**.
#
#                                                                          Note that in this example **MyPalette** is a fictional
#                                                                          palette name that have been loaded into mustang.
#
#                                                                          The color name is translated to the hexadecimal color at 8 bit
#                                                                          associated to the 'sepia' colorname in the palette 'MyPalette'.
#
#                                                "light coral hex16"   --> The color name is *light coral*.
#                                                                          The color model is **HEX16**.
#                                                                          The palette name is **mustang**.
#
#                                                                          The color name is translated to "#f0f080808080"
#
#                                                "caribbean green pearl mustang hex8" --> The color name is *caribbean green pearl*.
#                                                                                         The palette name is **mustang**.
#                                                                                         The color model is **HEX8**.
#
#                                                                                         The color name is translated to "#6ada8e"
#
#                                           After its validation, the color name will be returned translated in its hexadecimal longform
#                                           equivalent (in lowercase characters and with the **#** symbol) for the color model specified.
#
#               **theme color names**   --> These colors needs to be specified in textual form like like *Accent*, *Invalid*, *Highlight*,
#                                           *HighlightAlternate* or *PlaceholderText*.
#
#                                           In this form, the list should have only one or two elements.
#                                           The first element indicates the theme color name to validate and the second one (optional)
#                                           indicates the hexadecimal color model (**HEX8**, **HEX12** or **HEX16**) in which the color
#                                           will be translated. If only one element is provided (the theme color name) its color model
#                                           will be assumed to be **HEX8**.
#
#                                           Note that **HEX8** can be shortened into **HEX**.
#
#                                           After its validation, the color will be returned translated in its equivalent hexadecimal
#                                           longform (in lowercase characters and with the **#** symbol) for the color model provided.
#
#                                           See the [theme color](/wiki/theme_colors/index.md) wiki page to know which
#                                           theme color names are allowed.
#
#                                           Note: Theme colors are case sensitive.
#
# fallback   Optional. Should be a string that specifies the fallback value to return if the color provided will result invalid.
#            If not provided, defaults to **invalid**.
#
# Return the validated color or the fallback value.
proc ::ms::Check_Color { value { fallback invalid } } {
    # Check if a valid hexadecimal color model has been provided.
    set colormodel [lindex $value end]
    switch -nocase -- $colormodel {
        HEX  -
        HEX8 {
            set colormodel HEX8
            set value      [lrange $value 0 end-1]
        }
        HEX12 {
            set colormodel HEX12
            set value      [lrange $value 0 end-1]
        }
        HEX16 {
            set colormodel HEX16
            set value      [lrange $value 0 end-1]
        }
        default { set colormodel HEX8 }
    }

    # Check if a valid palette name has been provided.
    set palette [string tolower [lindex $value end]]
    if { $palette in $::ms::palette(names) } {
        set color [lrange $value 0 end-1]
    } else {
        set color $value

        # Check if the 'mustang' palette was actually loaded.
        if { "mustang" in $::ms::palette(names) } {
            set palette "mustang"
        } else {
            return $fallback
        }
    }

    # Check if 'color' is a valid hexadecimal color.
    set result [::ms::Check_Hex $color $colormodel invalid]
    switch -- $result {
        invalid {
            # Check if 'color' is an empty string.
            switch -- [string trim $color] {
                ""  { return $fallback }
            }

            # Transform each word that compose 'color' in titlecase characters.
            set colorname [list ]
            foreach word $color {
                lappend colorname [string totitle $word]
            }

            # Check if 'colorname' is known by 'palette'.
            if { $colorname in $::ms::palette($palette,all_families,colornames) } {
                # Return the colorname hexadecimal longform expressed in the hexadecimal color model provided.
                switch -nocase -- $colormodel {
                    HEX8  { return $::ms::palette($palette,$colorname,hex8) }
                    HEX12 { return [::HEX8_HEX12 $::ms::palette($palette,$colorname,hex8)] }
                    HEX16 { return [::HEX8_HEX16 $::ms::palette($palette,$colorname,hex8)] }
                }
            } else {
                set hex8 [::ms::Translate_Theme_Color $color invalid]
                switch -- $hex8 {
                    invalid { return $fallback }
                    default {
                        # Return the colorname hexadecimal longform expressed in the hexadecimal color model provided.
                        switch -nocase -- $colormodel {
                            HEX8  { return $hex8 }
                            HEX12 { return [::HEX8_HEX12 $hex8] }
                            HEX16 { return [::HEX8_HEX16 $hex8] }
                        }
                    }
                }
            }
        }
        default { return $result }
    }
}

## Check_Hex
#
# Validate a color expressed in hexadecimal form.
#
# Where:
#
# color        Should be the color to validate expressed at **8**, **12** or **16** bits, without any *alpha* channel (transparency),
#              in shortform (three hexadecimals) or longform (six, nine or twelve hexadecimals), with or without the **#**.
#
#              *Color* values are case insensitive.
#
# colormodel   Optional. Should be a string that specifies the hexadecimal color model in which *color* will be evaluated.
#              Allowed values are:
#                  **HEX** or **HEX8** --> 3 or 6  hexadecimals.
#                  **HEX12**           --> 3 or 9  hexadecimals.
#                  **HEX16**           --> 3 or 12 hexadecimals.
#
#              *Colormodel* strings are case insensitive.
#
#              If not provided, defaults to **HEX8**.
#
# fallback     Optional. Should be a string that specifies the fallback value to return if the color provided will
#              result invalid. If not provided, defaults to **invalid**.
#
# Return the validated color in its hexadecimal longform expressed in the color model specified, or the fallback value.
# Validated colors will always be returned with lowercase characters.
proc ::ms::Check_Hex { color { colormodel HEX8 } { fallback invalid } } {
    # Check if the color provided is expressed in a valid hexadecimal form.
    set color [string tolower [string trimleft $color "#"]]
    switch -- [string is xdigit -strict $color] {
        0       { return $fallback }
        default {
            switch -nocase -- $colormodel {
                HEX  -
                HEX8 {
                    # Check the number of hexadecimals in 'color'.
                    switch -- [string length $color] {
                        1   {
                            return [string cat "#" \
                                               $color $color \
                                               $color $color \
                                               $color $color];
                        }
                        3   {
                            # 'Color' have been provided as a shortform.
                            set red   [string index $color 0]
                            set green [string index $color 1]
                            set blue  [string index $color 2]

                            return [string cat "#" \
                                               $red   $red \
                                               $green $green \
                                               $blue  $blue];

                        }
                        6       { return [string cat "#" $color] }
                        default { return $fallback }
                    }
                }
                HEX12 {
                    # Check the number of hexadecimals in color.
                    switch -- [string length $color] {
                        1   {
                            return [string cat "#" \
                                               $color $color $color \
                                               $color $color $color \
                                               $color $color $color];
                        }
                        3   {
                            # 'Color' have been provided as a shortform.
                            set red   [string index $color 0]
                            set green [string index $color 1]
                            set blue  [string index $color 2]

                            return [string cat "#" \
                                               $red   $red   $red  \
                                               $green $green $green \
                                               $blue  $blue  $blue];
                        }
                        9       { return [string cat "#" $color] }
                        default { return $fallback }
                    }
                }
                HEX16 {
                    # Check the number of hexadecimals in color.
                    switch -- [string length $color] {
                        1   {
                            return [string cat "#" \
                                               $color $color $color $color \
                                               $color $color $color $color \
                                               $color $color $color $color];
                        }
                        3   {
                            # 'Color' have been provided as a shortform.
                            set red   [string index $color 0]
                            set green [string index $color 1]
                            set blue  [string index $color 2]

                            return [string cat "#" \
                                               $red   $red   $red   $red  \
                                               $green $green $green $green \
                                               $blue  $blue  $blue  $blue];
                        }
                        12      { return [string cat "#" $color] }
                        default { return $fallback }
                    }
                }
            }
        }
    }
}

## Check_Image
#
# Validate an image list.
#
# Where:
#
# image   Should be an image list of one or more elements.
#         The first element is the default image name. The rest of the list is a sequence of statespec/value pairs as per style map,
#         specifying different images to use when the widget is in a particular state or combination of states.
#
# Return **OK** if *image* is a valid image list or **invalid** if it's not.
proc ::ms::Check_Image { image } {
    set image [lindex  $image 0]
    set args  [lremove $image 0]

    # Check the first image.
    switch -- $image {
        ""      { return "OK" }
        default {
            if { $image ni [_image names] } {
                return "invalid"
            }
        }
    }

    # Check if more than one image was provided.
    switch -- [llength $args] {
        0       {}
        default {
            # Check that 'args' is an 'option/value' list.
            switch -- [expr { [llength $args]%2 }] {
                0   {
                    # Check the states related images.
                    foreach { states image } $args {
                        # Check the states.
                        foreach state $states {
                            switch -- [::ms::Check_State $state] {
                                invalid { return "invalid" }
                            }
                        }

                        # Check the image related to the states examined.
                        if { $image ni [image names] } {
                            return "invalid"
                        }
                    }
                }
                default { return "invalid" }
            }
        }
    }

    return "OK"
}

## Check_Measure
#
# Validate a measure.
#
# Where:
#
# measure    Should be a string (or an integer in case of pixels) that specifies
#            the measure to convert and its unit. Allowed units are:
#                c --> centimeters
#                i --> inches
#                m --> millimeters
#                p --> points
#            If there is no unit, the measure will be assumed to be in **pixels**.
#            The measure (intended as without its unit) should always be a positive integer value.
#
# fallback   Optional. Should be a string that specifies the fallback value to return if
#            the measure provided will result invalid.
#            If not provided, defaults to **invalid**.
#
# Return the validated measure or the fallback value.
proc ::ms::Check_Measure { measure { fallback invalid } } {
    # Check if the measure is a positive integer.
    switch -- [string is integer -strict $measure] {
        0   {
            set measure [string tolower $measure]

            # Check the last digit of the measure provided.
            switch -- [string index $measure end] {
                c   -
                i   -
                m   -
                p   {
                    # The measure have a valid unit, separate its value from its unit.
                    set value [string range $measure 0 end-1]

                    # Check if the value is a positive double.
                    switch -- [string is double -strict $value] {
                        1   {
                            if { $value > 0 } {
                                return $measure
                            } elseif { $value == 0 } {
                                return "0"
                            }
                        }
                    }
                }
            }
        }
        1   {
            if { $measure >= 0 } {
                return $measure
            }
        }
    }

    return $fallback
}

## Check_Pathname
#
# Check the window pathname provided to a mustang command.
#
# Where:
#
# window     Should be the window pathname to check for.
#
# fallback   Optional. Should be a string that specifies the fallback value to return
#            if the color provided will result invalid.
#            If not provided, defaults to **invalid**.
#
# Return either a list containing (in order) the real address associated to *window* and
# *window*'s type (**real** or **short**) or the fallback value if the address provided
# is invalid.
proc ::ms::Check_Pathname { window { fallback invalid } } {
    # Find the real address related to 'window'.
    if { $window in $::ms::addr(shorts) } {
        # 'window' is a short address created by mustang.

        set type      short
        set real_addr $::ms::addr($window,real)
    } elseif { $window in $::ms::addr(reals) } {
        # 'window' is a real address created by mustang.

        set type       real
        set short_addr $::ms::addr($window,short)
        set real_addr  $::ms::addr($short_addr,real)
    } else {
        # 'window' could still be a real address, but not created by mustang.
        switch -- [_winfo exists $window] {
            0   { return $fallback }
            1   {
                # 'window' is a real address not created by mustang.

                set type      real
                set real_addr $window
            }
        }
    }

    return [list $real_addr $type]
}

## Check_State
#
# Validate a widget state.
#
# Where:
#
# state   Specifies the widget state to validate.
#         Widget states may be prepended with a **!** to indicate their negation.
#
# Return **OK** if *state* is a valid widget state or **invalid** if it's not.
proc ::ms::Check_State { state } {
    switch -- $state {
        active        -
        alternate     -
        background    -
        disabled      -
        focus         -
        hover         -
        invalid       -
        pressed       -
        readonly      -
        selected      -
        user1         -
        user2         -
        user3         -
        user4         -
        user5         -
        user6         -
        "!active"     -
        "!alternate"  -
        "!background" -
        "!disabled"   -
        "!focus"      -
        "!hover"      -
        "!invalid"    -
        "!pressed"    -
        "!readonly"   -
        "!selected"   -
        "!user1"      -
        "!user2"      -
        "!user3"      -
        "!user4"      -
        "!user5"      -
        "!user6"      { return "OK" }
        default       { return "invalid" }
    }
}

## Check_Widget_Address
#
# Check a widget address.
#
# Where:
#
# window        Should be the widget pathname address to create.
#               This address should be unique and all the parents addresses should exists already.
#               *Window* can either be a real or short address.
#
# caller_info   Should be the location of the command that generated the error.
#
# Returns the real and short address relative to 'window'.
proc ::ms::Check_Widget_Address { window caller_info } {
    # Set the widget real and short addresses.
    set index [string last "." $window]
    switch -- $index {
        -1  -
        1   { ::ms::Error "Invalid address, '$window'." $caller_info }
        0   {
            # Safeguard.
            try {
                _winfo toplevel $window
            } on error {} {
                # Do Nothing.
            } on ok { result } {
                if { $result eq $window } {
                    ::ms::Error "Invalid address, '$window'." $caller_info
                }
            }

            # 'window' is a short address or equal to one.
            set type short

            # Set the widget real and short addresses.
            switch -- $::ms::addr(.,widget) {
                ".content" { set real_addr [string cat ".content" $window] }
                default    { set real_addr $window }
            }
            set short_addr $window
        }
        default {
            # Separate the 'window' address into it's parent address and it's relative address.
            set parent_addr   [string range $window 0 $index-1]
            set relative_addr [string range $window $index end]

            # Check 'parent_addr'.
            if { $parent_addr in $::ms::addr(shorts) } {
                # 'parent_addr' is the short address of a widget created by mustang.
                set type short

                # Check if 'parent_addr' refers to a container widget.
                set real_addr $::ms::addr($parent_addr,real)
                switch -- $::ms::data($real_addr,classtype) {
                    canvas      -
                    frame       -
                    labelframe  -
                    notebook    -
                    panedwindow -
                    text        -
                    toplevel    {
                        set parent_real_addr  $::ms::addr($real_address,widget)
                        set parent_short_addr $parent_addr
                    }
                    default { ::ms::Error "Invalid address, '$window'." $caller_info }
                }
            } elseif { $parent_addr in $::ms::addr(reals) } {
                # 'parent_addr' is the real address of a widget created by mustang.
                set type real

                # Check if 'parent_addr' refers to a container widget.
                set short_addr $::ms::addr($parent_addr,short)
                set real_addr  $::ms::addr($short_addr,real)
                switch -- $::ms::data($real_addr,classtype) {
                    canvas      -
                    frame       -
                    labelframe  -
                    notebook    -
                    panedwindow -
                    text        -
                    toplevel    {
                        set parent_real_addr  $::ms::addr($real_addr,widget)
                        set parent_short_addr $::ms::addr($real_addr,short)
                    }
                    default { ::ms::Error "Invalid address, '$window'." $caller_info }
                }
            } elseif { [_winfo exists $parent_addr] } {
                # 'parent_addr' is the real address of a widget not created by mustang.
                set type real

                # Note: Widgets created outside of mustang do not have short addresses,
                #       we will set their short address as their real address.

                set parent_real_addr  $parent_addr
                set parent_short_addr $parent_addr
            } else {
                ::ms::Error "Invalid address, '$window'." $caller_info
            }

            # Set the widget real ('w') and short addresses.
            set real_addr  [string cat $parent_real_addr  $relative_addr]
            set short_addr [string cat $parent_short_addr $relative_addr]
        }
    }

    # Check the widget address uniqueness.
    switch -- [_winfo exists $real_addr] {
        0   { return [list $real_addr $short_addr] }
        1   { ::ms::Error "The address provided already exists, '$window'." $caller_info }
    }
}

########################################
##                                    ##
##     CLEAR, COPY, CUT AND PASTE     ##
##                                    ##
########################################

## Clear
#
# Delete the selection.
#
# Note: The following procedure is inspired by the ttk::entry::Clear.
#       The procedure have been slighty modified to work with mustang.
#       All credits goes to the original author/s.
#
# Note: This procedure is use by the entry, combobox, palette and spinbox widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::Clear { w } {
    # Check if the address provided belongs to a palette widget.
    switch -- $::ms::data($w,classtype) {
        palette { set cmd [list $w.combobox delete sel.first sel.last] }
        default { set cmd [list interp invokehidden {} $w delete sel.first sel.last] }
    }

    # Execute the command.
    try {
        {*}$cmd
    } on error {} {
        # Do nothing.
    }

    return ""
}

## Copy
#
# Copy the selection to the clipboard.
#
# Note: The following procedure is inspired by the ttk::entry::Copy.
#       The procedure have been slighty modified to work with mustang.
#       All credits goes to the original author/s.
#
# Note: This procedure is use by the entry, combobox, palette and spinbox widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::Copy { w } {
    # Check if the address provided belongs to a palette widget.
    switch -- $::ms::data($w,classtype) {
        palette {
            set string [$w.combobox get]
            set index1 [$w.combobox index sel.first]
            set index2 [expr { [$w.combobox index sel.last]-1 }]
        }
        default {
            set string [interp invokehidden {} $w get]
            set index1 [interp invokehidden {} $w index sel.first]
            set index2 [expr { [interp invokehidden {} $w index sel.last]-1 }]
        }
    }

    # Execute the command.
    try {
        string range $string $index1 $index2
    } on error {} {
        # Do nothing.
    } on ok { selection } {
        clipboard clear  -displayof $w
        clipboard append -displayof $w $selection
    }

    return ""
}

## Cut
#
# Copy selection to clipboard then delete it.
#
# Note: The following procedure is inspired by the ttk::entry::Cut.
#       The procedure have been slighty modified to work with mustang.
#       All credits goes to the original author/s.
#
# Note: This procedure is use by the entry, combobox, palette and spinbox widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::Cut { w } {
    ::ms::Copy  $w
    ::ms::Clear $w

    return ""
}

## Paste
#
# Insert the clipboard content ('CLIPBOARD' or 'PRIMARY') at the current insert point.
#
# Note: This procedure is use by the entry, combobox, palette and spinbox widget.
#
# Where:
#
# w                Should be the widget real address involved.
#
# clipboard_type   Optional, should be a string indicating from which clipboard to take paste data.
#                  Allowed values are:
#                    'CLIPBOARD' --> the primary clipboard
#                    'PRIMARY'   --> the secondary clipboard
#
# It doesn't return anything.
proc ::ms::Paste { w { clipboard_type CLIPBOARD } } {
    # Check the 'clipboard_type'.
    switch -nocase -- $clipboard_type {
        primary { set clipboard_type PRIMARY   }
        default { set clipboard_type CLIPBOARD }
    }

    # Check if the address provided belongs to a palette widget.
    switch -- $::ms::data($w,classtype) {
        palette { set address $w.combobox }
        default { set address [list interp invokehidden {} $w]}
    }

    # Delete any previously selected characters.
    ::ttk::entry::PendingDelete $::ms::addr($w,widget)

    # Get the 'clipboard_data' to copy.
    try {
        ::tk::GetSelection $::ms::addr($w,widget) $clipboard_type
    } on error {} {
        return ""
    } on ok { result } {
        set clipboard_data $result
    }

    # Get the widget value.
    set value [{*}$address get]

    # Get the insert index.
    set insert [{*}$address index insert]

    # Clean 'clipboard_data' from the tab, newline feed and carriage return symbols.
    set i 1
    while { $i > 0 } {
        # Register the initial 'clipboard_data' for later comparison.
        set initial_value $clipboard_data

        # Remove the special characters from 'clipboard_data' and substitute them with an empty character.
        set clipboard_data [regsub {\t} $clipboard_data ""]
        set clipboard_data [regsub {\n} $clipboard_data ""]
        set clipboard_data [regsub {\r} $clipboard_data ""]

        # Check if 'clipboard_data' is equal to its initial value.
        # If so, exit the loop, otherwise do another pass.
        if { $clipboard_data eq $initial_value } {
            break
        }
    }

    # Check the maxlength.
    switch -- $::ms::current($w,maxlength) {
        0   {
            # Insert the 'clipboard_data' string at the insert point.
            interp invokehidden {} $w insert $insert $clipboard_data

            # Compute the cursor index at the end of the 'clipboard_data' string.
            set clipboard_data_end [string length [string cat [string range $value 0 $insert-1] "$clipboard_data"]]

            # Set the cursor at 'clipboard_data_end'.
            interp invokehidden {} $w icursor $clipboard_data_end

            # Make the 'clipboard_data_end' character visible.
            switch -- $::ms::data($w,classtype) {
                palette { ::ttk::entry::See $w.combobox $clipboard_data_end }
                default { ::ttk::entry::See $w $clipboard_data_end }
            }
        }
        default {
            # Construct the new value with the 'clipboard_data' inserted at the insert point.
            set new_value [string cat [string range $value 0 $insert-1] "$clipboard_data" [string range $value $insert end]]

            # Compute the length of new value.
            set new_value_length [string length $new_value]

            # Check if 'new_value' fits the widget maxlength.
            if { $new_value_length > $::ms::current($w,maxlength) } {
                # It doesn't fit 😕.
                # Clear the widget field, insert the truncated new value and position the cursor at the end.
                interp invokehidden {} $w delete 0 end
                interp invokehidden {} $w insert 0 [string range $new_value 0 $::ms::current($w,maxlength)-1]
                interp invokehidden {} $w icursor end
            } else {
                # It fit 😄.
                # Insert 'clipboard_data' at the insert point.
                interp invokehidden {} $w insert $insert $clipboard_data

                # Compute the cursor index at the end of the 'clipboard_data' string.
                set clipboard_data_end [string length [string cat [string range $value 0 $insert-1] "$clipboard_data"]]

                # Set the cursor at 'clipboard_data_end'.
                interp invokehidden {} $w icursor $clipboard_data_end
            }
        }
    }

    return ""
}

## Scan_Or_Paste
#
# Manage various **ButtonPress** events.
# Used by entry, combobox, palette and spinbox widgets.
#
# Where:
#
# w       Should be the widget real address involved.
#
# x       Should be the x relative coordinate of the mouse pointer at the time of the event.
#         This parameter should be passed by the event itself.
#
# event   Should be the event name.
#
#         Allowed events are:
#            Button-2
#            B2-Motion
#            ButtonRelease-2
#            Button-3
#            B3-Motion
#            ButtonRelease-3
#            PasteSelection
#
# It doesn't return anything.
proc ::ms::Scan_Or_Paste { w x event } {
    switch -- $::ms::middleclick {
        drag {
            switch -- [_tk windowingsystem] {
                aqua {
                    switch -- $event {
                        "Button-3"        { ::ttk::entry::ScanMark    $w $x }
                        "B3-Motion"       { ::ttk::entry::ScanDrag    $w $x }
                        "ButtonRelease-3" { ::ttk::entry::ScanRelease $w $x }
                    }
                }
                default {
                    switch -- $event {
                        "Button-2"        { ::ttk::entry::ScanMark    $w $x }
                        "B2-Motion"       { ::ttk::entry::ScanDrag    $w $x }
                        "ButtonRelease-2" { ::ttk::entry::ScanRelease $w $x }
                    }
                }
            }
        }
        paste {
            switch -- [_tk windowingsystem] {
                aqua {
                    switch -- $event {
                        "ButtonRelease-3" { ::ms::Paste $w PRIMARY }
                    }
                }
                default {
                    switch -- $event {
                        "ButtonRelease-2" { ::ms::Paste $w PRIMARY }
                    }
                }
            }
        }
    }

    return ""
}

##################
##              ##
##     DRAG     ##
##              ##
##################

## Drag
#
# Manage the mouse left button motion binding.
#
# Note: The following procedure is inspired by the ttk::entry::Drag.
#       The procedure have been slighty modified to work with mustang.
#       All credits goes to the original author/s.
#
# Used by combobox, palette and spinbox widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) relative coordinate of the mouse pointer at the time of the event.
#        Its normally provided by the **B1-Motion** event.
#
# It doesn't return anything.
proc ::ms::Drag { w x y } {
    # Check if the address provided belongs to a palette widget.
    switch -- $::ms::data($w,classtype) {
        palette { set element [$w.combobox identify element $x $y] }
        default { set element [interp invokehidden {} $w identify element $x $y] }
    }

    # Check the widget state.
    switch -- $::ms::current($w,state) {
        normal {
            # Check the cursor location.

            switch -glob -- $element {
                "*textarea" {
                    set ::ttk::entry::State(x) $x
                    ::ms::Drag_To $w $x
                }
            }
        }
    }

    return ""
}

# Drag_To
#
# Extend selection to 'x' based on current selection mode.
#
# Note: The following procedure is inspired by the ttk::entry::DragTo.
#       The procedure have been slighty modified to work with mustang.
#       All credits goes to the original author/s.
#
# Note: This procedure is use by the entry, combobox, palette and spinbox widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) relative coordinate of the mouse pointer at the time of the event.
#        Its normally provided by the **B1-Motion** event.
#
# It doesn't return anything.
proc ::ms::Drag_To { w x } {
    # Check if the address provided belongs to a palette widget.
    switch -- $::ms::data($w,classtype) {
        palette { set address $w.combobox }
        default { set address $w }
    }

    # Check the selection mode.
    switch $::ttk::entry::State(selectMode) {
        char { ::ttk::entry::CharSelect $address $::ttk::entry::State(anchor) [::ttk::entry::ClosestGap $address $x] }
        word { ::ttk::entry::WordSelect $address $::ttk::entry::State(anchor) [::ttk::entry::ClosestGap $address $x] }
        line { ::ttk::entry::LineSelect $address $::ttk::entry::State(anchor) [::ttk::entry::ClosestGap $address $x] }
    }

    return ""
}

## Scan_Drag
#
# Manages the **<B2-Motion>** (or **<B3-Motion>** in macOS Aqua) event on a scrollable widget
# that supports **scan** operations.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer coordinates of the event.
#        These values should be provided by the <Motion> event.
#
# It doesn't return anything.
proc ::ms::Scan_Drag { w x y } {
    # Safeguard.
    # Check if the drag operation is allowed or not.
    switch -- [info exists ::ms::temp(drag_allowed)] {
        0   { return "" }
        1   {
            # Compute 'delta_x' and 'delta_y'.
            set delta_x [expr { $x-$::ms::temp(x_press) }]
            set delta_y [expr { $y-$::ms::temp(y_press) }]

            # Compute the new (x,y) coordinates to go to.
            switch -- $::ms::scrollmode {
                classic {
                    set x [expr { $::ms::temp(x_press)-$delta_x }]
                    set y [expr { $::ms::temp(y_press)-$delta_y }]
                }
                natural {
                    set x [expr { $::ms::temp(x_press)+$delta_x }]
                    set y [expr { $::ms::temp(y_press)+$delta_y }]
                }
            }

            # Drag the scrollable widget viewport towards the new (x,y) coordinates.
            $w scan dragto $x $y
        }
    }

    try {
        return -code break
    } on error {} {
        return ""
    }
}

## Scan_Mark
#
# Manages the **<ButtonPress-2>** (or **<ButtonPress-3>** in macOS Aqua) event on a scrollable widget
# that supports **scan** operations.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer coordinates of the event.
#        These values should be provided by the <ButtonPress> event.
#
# It doesn't return anything.
proc ::ms::Scan_Mark { w x y } {
    set ::ms::temp(drag_allowed) yes
    set ::ms::temp(x_press) $x
    set ::ms::temp(y_press) $y

    # Put a mark on the <ButtonPress> coordinates.
    $w scan mark $x $y

    try {
        return -code break
    } on error {} {
        return ""
    }
}

## Scan_Release
#
# Manages the **<ButtonRelease-2>** (or **<ButtonRelease-3>** in macOS Aqua) event on a scrollable widget
# that supports **scan** operations.
#
# It doesn't return anything.
proc ::ms::Scan_Release {} {
    unset -nocomplain ::ms::temp(drag_allowed) \
                      ::ms::temp(x_press) \
                      ::ms::temp(y_press);

    try {
        return -code break
    } on error {} {
        return ""
    }
}

#################################
##                             ##
##     SCROLLBAR MECHANISM     ##
##                             ##
#################################

## Scrollable_Widgets_Propagation_Mechanism
#
# Force the *place* propagation (if needed) on any scrollable widgets real address parents
# that are present on the widget/object real address provided.
#
# Where:
#
# w   Should be the widget real address that was just created, deleted or changed it's size.
#
# It doesn't return anything.
proc ::ms::Scrollable_Widgets_Propagation_Mechanism { w } {
    # Check if the widget address provided is not the empty string.
    switch -- $w {
        ""      { return "" }
        default {
            # Check if the widget address provided has a parent to check for.
            set parent [_winfo parent $w]
            switch -- $parent {
                ""  { return "" }
            }
        }
    }

    # ATTENTION!
    #
    # This is a recursive loop.
    # The only way to exit is if there is no more parents to check for.
    set i 1
    while { $i > 0 } {
        # Check if 'parent' is a scrollable widget.
        if { $parent in $::ms::addr(megawidgets,scrollable) } {
            switch -- $::ms::data($parent,classtype) {
                frame      -
                labelframe {
                    # The 'place' geometry manager (used internally by these classtypes) doesn't
                    # allow any propagation. We need to force it by ourself.

                    # Get the 'content' requested height and width of 'parent'.
                    set ::ms::data($parent,reqheight) [_winfo reqheight $::ms::addr($parent,widget)]
                    set ::ms::data($parent,reqwidth)  [_winfo reqwidth  $::ms::addr($parent,widget)]

                    # height
                    set height $::ms::data($parent,reqheight)
                    if { $::ms::data($parent,height) > $::ms::data($parent,reqheight) } {
                        # Change the 'content' height to match the 'viewport' height.
                        set height $::ms::data($parent,height)
                    }

                    # width
                    set width $::ms::data($parent,reqwidth)
                    if { $::ms::data($parent,width) > $::ms::data($parent,reqwidth) } {
                        # Change the 'content' width to match the 'viewport' width.
                        set width $::ms::data($parent,width)
                    }

                    # Configure the 'content' height and width displayed by the 'place' geometry manager.
                    _place configure $::ms::addr($parent,widget) -height $height \
                                                                  -width $width;

                    # Update the scrollbar/s.
                    [string cat "::ms::" $::ms::data($parent,classtype) "::Scrollbar_Update"] $parent

                    update idletasks
                }
            }
        }

        # Check the next parent, if any.
        set parent [_winfo parent $parent]
        switch -- $parent {
            ""  { break }
        }
    }

    return ""
}

## Scroll_Parent_X
#
# Search the widget parents for a scrollable widget with an active scrollbar along the X axis.
# If we found one, scroll it and exit, otherwise examine the next parent until we reach out of parents.
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
#          Note: **0** is not allowed. If provided, it will be changed to **-120.0**.
#
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::Scroll_Parent_X { w amount { what units } } {
    # Check the parent of the widget address provided, if any.
    set parent [_winfo parent $w]
    switch -- $parent {
        ""  {
            # There are no parents to check for.
            return ""
        }
    }

    # Check that 'amount' is an integer or a float.
    switch -- [string is double -strict $amount] {
        0   { set amount 120.0 }
        1   {
            if { $amount == 0 } {
                set amount -120.0
            } else {
                set amount [expr { $amount*1.0 }]
            }
        }
    }

    # Check the scrollmode.
    switch -- $::ms::scrollmode {
        natural { set amount [expr { -1.0*$amount }] }
    }

    # Propagate the action to the widget's parents.

    # ATTENTION!
    #
    # This is a recursive loop. The only way to exit is:
    #   - If there is no more parent to check for.
    #   - If 'parent' is a scrollable megawidget with an active horizontal scrollbar.
    #   - If 'parent' is a widget created outside of mustang that is linked
    #     to an horizontal scrollbar.
    set i 1
    while { $i > 0 } {
        # Check if 'parent' belongs to a scrollable megawidget.
        if { $parent in $::ms::addr(megawidgets,scrollable) } {
            # Check if 'parent' has an active horizontal scrollbar linked to it.
            switch -- $::ms::data($parent,scrollx) {
                on  {
                    # Scroll the horizontal scrollbar.
                    $parent xview scroll [expr { -$amount*0.008333333333333333 }] $what

                    # Stop the recursive iteration.
                    break
                }
            }
        } elseif { $parent ni $::ms::addr(reals) } {
            # The widget was created outside of mustang.

            try {
                $parent xview scroll [expr { -$amount*0.008333333333333333 }] $what
            } on error {} {
                # 'parent' has no horizontal scrollbar linked to it
                # or doesn't have the 'xview' command.
                # Continue the recursive iteration.
            } on ok {} {
                # Stop the recursive iteration.
                break
            }
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

    return ""
}

## Scroll_Parent_Y
#
# Search the widget parents for a scrollable widget with an active scrollbar along the Y axis.
# If we found one, scroll it and exit, otherwise examine the next parent until we reach out of parents.
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
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::Scroll_Parent_Y { w amount { what units } } {
    # Check the parent of the widget address provided, if any.
    set parent [_winfo parent $w]
    switch -- $parent {
        ""  {
            # There are no parents to check for.
            return ""
        }
    }

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

    # Propagate the action to the widget's parents.

    # ATTENTION!
    #
    # This is a recursive loop. The only way to exit is:
    #   - If there is no more parent to check for.
    #   - If 'parent' is a scrollable megawidget with an active vertical scrollbar.
    #   - If 'parent' is a widget created outside of mustang that is linked
    #     to a vertical scrollbar.
    set i 1
    while { $i > 0 } {
        # Check if 'parent' belongs to a scrollable megawidget.
        if { $parent in $::ms::addr(megawidgets,scrollable) } {
            # Check if 'parent' has an active vertical scrollbar linked to it.
            switch -- $::ms::data($parent,scrolly) {
                on  {
                    # Scroll the vertical scrollbar.
                    $parent yview scroll [expr { -$amount*0.008333333333333333 }] $what

                    # Stop the recursive iteration.
                    break
                }
            }
        } elseif { $parent ni $::ms::addr(reals) } {
            # The widget was created outside of mustang.
            try {
                $parent yview scroll [expr { -$amount*0.008333333333333333 }] $what
            } on error {} {
                # 'parent' has no vertical scrollbar linked to it or
                # doesn't have the 'yview' command.
                # Continue the recursive iteration.
            } on ok {} {
                # Stop the recursive iteration.
                break
            }
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

    return ""
}

## Scroll_Widget_X
#
# Scrolls the active scrollbar (if any) related to the widget address provided, along the X axis.
# If the widget is not a scrollable widget or doesn't have an active scrollbar along the X axis,
# check it's parents until an active one is found or we reach out of parents.
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
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::Scroll_Widget_X { w amount { what units } } {
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

    # Check if the widget address provided belongs to a scrollable megawidget.
    if { $w in $::ms::addr(megawidgets,scrollable) } {
        # Check if there is an active horizontal scrollbar linked to the widget address provided.
        switch -- $::ms::data($w,scrollx) {
            on  {
                # Scroll the horizontal scrollbar.
                $w xview scroll [expr { -$amount*0.008333333333333333 }] $what

                return ""
            }
        }
    } elseif { $w ni $::ms::addr(reals) } {
        # The widget was created outside of mustang.

        try {
            $w xview scroll [expr { -$amount*0.008333333333333333 }] $what
        } on error {} {
            # The widget address provided has no horizontal scrollbar linked to it
            # or doesn't have the 'xview' command.
        } on ok {} {
            return ""
        }
    }

    # Check its parents, if any.
    ::ms::Scroll_Parent_X $w $amount $what

    return ""
}

## Scroll_Widget_Y
#
# Scrolls the scrollbar (if any) related to the widget address provided, along the Y axis.
# If the widget is not a scrollable widget or doesn't have an active scrollbar along the Y axis,
# check it's parents until an active one is found or we reach out of parents.
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
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::Scroll_Widget_Y { w amount { what units } } {
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

    # Check if the widget address provided belongs to a scrollable megawidget.
    if { $w in $::ms::addr(megawidgets,scrollable) } {
        # Check if there is an active vertical scrollbar linked to the widget address provided.
        switch -- $::ms::data($w,scrolly) {
            on  {
                # Scroll the vertical scrollbar.
                $w yview scroll [expr { -$amount*0.008333333333333333 }] $what

                return ""
            }
        }
    } elseif { $w ni $::ms::addr(reals) } {
        # The widget was created outside of mustang.

        try {
            $w yview scroll [expr { -$amount*0.008333333333333333 }] $what
        } on error {} {
            # The widget address provided has no vertical scrollbar linked to it
            # or doesn't have the 'yview' command.
        } on ok {} {
            return ""
        }
    }

    # Check its parents, if any.
    ::ms::Scroll_Parent_Y $w $amount $what

    return ""
}

## Touchpad_Parent
#
# Search the widget parents for a scrollable widget with an active scrollbar along the X and/or Y axis.
# If we found one, scroll it and exit, otherwise examine the next parent until we reach out of parents.
#
# Where:
#
# w         Should be the widget real address involved.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# amount    Should be the delta value of a **TouchpadScroll** event.
#           The delta value represents the rotation units the mouse wheel has been moved.
#           The sign of the value represents the direction the mouse wheel was scrolled.
#           *Amount* is normally delivered by the **TouchpadScroll** event with a value of
#           **+120.0** or **-120.0**, depending on the scroll direction.
#
#           If the value provided as *amount* is not an integer or a float,
#           defaults to **+120.0**.
#
#           Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what      Should be a string that specifies the unit type.
#           Allowed values are the word **units** or **pages**.
#           If not provided, defaults to **units**.
#
# It doesn't return anything.
proc ::ms::Touchpad_Parent { w counter amount { what units } } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # <TouchpadScroll> events can be generated about 60 times per second
    # during a two-finger gesture.
    # This code allows the binding script to respond to every 5th <TouchpadScroll> event
    # by testing is the 'counter' is divisible by 5.
    if { [expr { $counter%5 }] != 0 } {
        return ""
    }

    # Translate 'amount' in 'delta_x' and 'delta_y'.
    lassign [::tk::PreciseScrollDeltas $amount] delta_x delta_y

    # Adjust 'delta_x' and 'delta_y' values, or the movement will be too slow.
    set delta_x [expr { $delta_x*30 }]
    set delta_y [expr { $delta_y*30 }]

    # If there is a movement along the X axis, launch '::ms::Scroll_Parent_X'.
    if { $delta_x != 0 } {
        ::ms::Scroll_Parent_X $w $delta_x $what
    }

    # If there is a movement along the Y axis, launch '::ms::Scroll_Parent_Y'.
    if { $delta_y != 0 } {
        ::ms::Scroll_Parent_Y $w $delta_y $what
    }
}

## Touchpad_Widget
#
# Scrolls the scrollbar (if any) related to the scrollable widget real address provided, along the X and/or Y axis.
# If the widget is not a scrollable widget or doesn't have an active scrollbar along the X and/or Y axis,
# check it's parents until an active one is found or we reach out of parents.
#
# Where:
#
# w         Should be the scrollable widget real address involved.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# amount    Should be the delta value of a **TouchpadScroll** event.
#           The delta value represents the rotation units the mouse wheel has been moved.
#           The sign of the value represents the direction the mouse wheel was scrolled.
#           *Amount* is normally delivered by the **TouchpadScroll** event with a value of
#           **+120.0** or **-120.0**, depending on the scroll direction.
#
#           If the value provided as *amount* is not an integer or a float,
#           defaults to **+120.0**.
#
#           Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what      Should be a string that specifies the unit type.
#           Allowed values are the word **units** or **pages**.
#           If not provided, defaults to **units**.
#
# It doesn't return anything.
proc ::ms::Touchpad_Widget { w counter amount { what units } } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # <TouchpadScroll> events can be generated about 60 times per second
    # during a two-finger gesture.
    # This code allows the binding script to respond to every 5th <TouchpadScroll> event
    # by testing is the 'counter' is divisible by 5.
    if { [expr { $counter%5 }] != 0 } {
        return ""
    }

    # Translate 'amount' in 'delta_x' and 'delta_y'.
    lassign [::tk::PreciseScrollDeltas $amount] delta_x delta_y

    # Adjust 'delta_x' and 'delta_y' values, or the movement will be too slow.
    set delta_x [expr { $delta_x*30 }]
    set delta_y [expr { $delta_y*30 }]

    # If there is a movement along the X axis, launch '::ms::Scroll_Widget_X'.
    if { $delta_x != 0 } {
        ::ms::Scroll_Widget_X $w $delta_x $what
    }

    # If there is a movement along the Y axis, launch '::ms::Scroll_Widget_Y'.
    if { $delta_y != 0 } {
        ::ms::Scroll_Widget_Y $w $delta_y $what
    }
}

##########################################
##                                      ##
##     KEYBOARD TRAVERSAL SCROLLING     ##
##                                      ##
##########################################

# Note: The following procedures were inspired by the ttk::notebook mechanism for traverse bindings.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## CleanUp
#
# <Destroy> binding for container widgets.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::Clean_Up { w } {
    # Get the toplevel related to 'w'.
    set toplevel [_winfo toplevel $w]

    # If present, remove 'w' from the list of all traversal-enabled containers widgets contained in the toplevel.
    switch -- [info exists ::ms::containers(traversal,$toplevel)] {
        1   {
            set index [lsearch -exact $::ms::containers(traversal,$toplevel) $w]
            set ::ms::containers(traversal,$toplevel) [lreplace $::ms::containers(traversal,$toplevel) $index $index]
        }
    }

    return ""
}

## Enable_Traversal
#
# Enable keyboard traversal for a container widget by adding bindings to the containing toplevel window.
#
# '::ms::containers(traversal,$toplevel)' keeps track of the list of all traversal-enabled containers
# widgets contained in the toplevel.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::Enable_Traversal { w } {
    # Get the toplevel related to 'w'.
    set toplevel [_winfo toplevel $w]

    # Check if we need to implement the traversal bindings in the toplevel.
    switch -- [info exists ::ms::containers(traversal,$toplevel)] {
        0   {
            #####################################################################
            ##                                                                 ##
            ##     AUGMENT THE SCROLLABLE WIDGET RELATED TOPLEVEL BINDINGS     ##
            ##                                                                 ##
            #####################################################################

            # Destroy
            _bind $toplevel <Destroy> [list +::ms::Traverse_Clean_Up %W]

            # Scroll one page left or right with the keyboard.
            _bind $toplevel <<PageLeft>>  [list ::ms::Traverse_Scroll %W xview  120.0 pages]
            _bind $toplevel <<PageRight>> [list ::ms::Traverse_Scroll %W xview -120.0 pages]

            # Scroll one page up or down with the keyboard.
            _bind $toplevel <<PageUp>>    [list ::ms::Traverse_Scroll %W yview  120.0 pages]
            _bind $toplevel <<PageDown>>  [list ::ms::Traverse_Scroll %W yview -120.0 pages]
        }
    }

    # Add the container real address to the list of the traversal container for its related toplevel.
    lappend ::ms::containers(traversal,$toplevel) $w

    return ""
}

## Enclosing_Container
#
# Return the nearest traversal-enabled container widget that contains 'w'.
#
# Where:
#
# w   Should be the widget real address involved.
#
# BUGS: This routine should follow the geometry manager hierarchy, not window ancestry,
#       but that information is not available in Tk.
#
# Returns the nearest traversal enabled container widget address or an empty string is none is found.
proc ::ms::Enclosing_Container { w } {
    # Get the toplevel related to 'w'.
    set toplevel [_winfo toplevel $w]

    # Check if exists a traversal enabled container list for the toplevel related to 'w'.
    switch -- [info exists ::ms::containers(traversal,$toplevel)] {
        0   { return "" }
    }

    # Get the enclosing container.
    while { $w ne $toplevel && $w ne "" } {
        switch -- [lsearch -exact $::ms::containers(traversal,$toplevel) $w] {
            -1      {}
            default { return $w }
        }

        set w [_winfo parent $w]
    }

    return ""
}

## Traverse_Clean_Up
#
# <Destroy> binding for traversal-enabled toplevels.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::Traverse_Clean_Up { w } {
    # Check if the real address provided is a toplevel.
    if { $w eq [_winfo toplevel $w] } {
        unset -nocomplain -- ::ms::containers(traversal,$w)
    }

    return ""
}

## Traverse_Scroll
#
# Toplevel binding procedure for **<<PageDown>>**, **<<PageLeft>>**, **<<PageRight>>**, **<<PageUp>>** keyboard events.
# Scrolls up, down, left or right (by one page) the content of the nearest ancestor scrollable widget.
#
# Where:
#
# w          Should be the widget real address involved.
#
# command    Should be the command of the movement.
#            Allowed values are **xview** or **yview**.
#
# amount     Optional. Should be the amount of the movement.
#            Its sign determines the direction to take (left/right or up/down).
#            It's normally delivered by the event (**+120.0** or **-120.0).
#
# what       Optional. Should be a string that specifies the unit type.
#            Allowed values are the word **units** or **pages**.
#            If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# If a suitable widget is found, it will scroll it and return a TCL_BREAK, otherwise return an empty string.
proc ::ms::Traverse_Scroll { w command { amount -120.0 } { what units } } {
    # Get the enclosing container.
    set container_addr [::ms::Enclosing_Container $w]
    switch -- $container_addr {
        ""      { return "" }
        default {
            # Check the scrollmode.
            switch -- $::ms::scrollmode {
                natural { set amount [expr { -1.0*$amount }] }
            }
            set amount [expr { -$amount*0.008333333333333333 }]

            # Check the command provided.
            switch -- $command {
                xview { set scroll scrollx }
                yview { set scroll scrolly }
            }

            # ATTENTION!
            #
            # This is a recursive loop. The only way to exit is:
            #   - If there is no more container address to check for.
            #   - If the container address is a scrollable megawidget with an active horizontal or
            #     vertical scrollbar (depending on the 'axis' provided).
            #   - If the container address is a widget created outside of mustang that is linked
            #     to an horizontal or vertical scrollbar (depending on the 'axis' provided).
            set i 1
            while { $i > 0 } {
                # Check if the container address belongs to a scrollable megawidget.
                if { $container_addr in $::ms::addr(megawidgets,scrollable) } {
                    # Check if the container address has an active horizontal/vertical scrollbar linked to it.
                    switch -- $::ms::data($container_addr,$scroll) {
                        on  {
                            # Execute the movement.
                            $container_addr $command scroll $amount $what

                            # Stop the recursive iteration.
                            break
                        }
                    }
                } elseif { $container_addr ni $::ms::addr(reals) } {
                    # The widget was created outside of mustang.

                    # If possible, execute the movement.
                    try {
                        $container_addr $command scroll $amount $what
                    } on error {} {
                        # The container address has no horizontal/vertical scrollbar linked to it or
                        # doesn't have the 'xview' or 'yview' commands.
                        # Continue the recursive iteration.
                    } on ok {} {
                        # Stop the recursive iteration.
                        break
                    }
                }

                # Check the next container address, if any.
                set container_addr [_winfo parent $container_addr]
                switch -- $container_addr {
                    ""  {
                        # There are no more container address to check for.
                        # Stop the recursive iteration.
                        return ""
                    }
                }
            }

            return -code break
        }
    }
}

#################################
##                             ##
##     INTERNAL PROCEDURES     ##
##                             ##
#################################

## Beautify_Input_Number
#
# Beautify a numeric input.
#
# What it does:
#    - If needed, deletes leading zeroes (every datatypes).
#    - If needed, deletes trailing zero ('real' and 'posreal' datatype only).
#    - If needed, deletes every '-' sign after the first digit ('integer' and 'real' datatype only).
#    - If needed, deletes every '.' after the first one ('real' and 'posreal' datatype only).
#    - If number starts with '.', a zero will be inserted before '.' ('real' and 'posreal' datatype only).
#    - If number ends with '.', a zero will be inserted after '.' ('real' and 'posreal' datatype only).
#
# Note: This procedure assumes that the following keybindings are in place on the widget:
#          'integer'    --> The only keys enabled in the keyboard are [0123456789-].
#          'posinteger' --> The only keys enabled in the keyboard are [0123456789].
#          'posreal'    --> The only keys enabled in the keyboard are [0123456789.].
#          'real'       --> The only keys enabled in the keyboard are [0123456789-.].
#
# Where:
#
# number      Should be the value to check.
#
# maxlength   Should be the max number of characters allowed inside the widget.
#
# datatype    Should be the widget datatype ['integer', 'posinteger', 'posreal' or 'real'].
#
# Returns the eventually corrected number.
proc ::ms::Beautify_Input_Number { number maxlength datatype } {
    switch -- $datatype {
        integer {
            ########################
            ##                    ##
            ##     CORRECTION     ##
            ##                    ##
            ########################

            # Check for any leading minus sign.
            switch -- [string index $number 0] {
                -       { set startFrom 1 }
                default { set startFrom 0 }
            }

            # If needed, remove any other minus sign.
            set number [::ms::Strip_Chars $number "-" $startFrom]
            switch -- [string length $number] {
                0   { return "" }
            }

            ############################
            ##                        ##
            ##     BEAUTIFICATION     ##
            ##                        ##
            ############################

            if { $number == 0 } {
                # Avoid to return '00', '000', ...
                return 0
            } else {
                # Strip any leading zeros, if any.
                switch -- $startFrom {
                    0   { return [string trimleft $number 0] }
                    1   { return [string cat "-" [string trimleft [string range $number 1 end] 0]] }
                }
            }
        }
        posinteger {
            ############################
            ##                        ##
            ##     BEAUTIFICATION     ##
            ##                        ##
            ############################

            if { $number == 0 } {
                return 0
            } else {
                # Strip any leading zeros, if any.
                return [string trimleft $number 0]
            }
        }
        posreal {
            # Get the first '.' index, if any.
            set pointIndex [string first "." $number]
            switch -- $pointIndex {
                -1  {
                    ############################
                    ##                        ##
                    ##     BEAUTIFICATION     ##
                    ##                        ##
                    ############################

                    if { $number == 0 } {
                        # Avoid to return '00', '000', ...
                        return 0
                    } else {
                        # Strip any leading zeros, if any.
                        set number [string trimleft $number 0]

                        # Check the maxlength.
                        switch -- $maxlength {
                            0       {}
                            default {
                                # Check if we need to truncate 'number'.
                                set max_length [expr { $maxlength-2 }]
                                set num_length [string length $number]

                                if { $max_length < $num_length } {
                                    set diff   [expr { $num_length-$max_length }]
                                    set number [string range $number 0 end-$diff]
                                }
                            }
                        }

                        # Add '.0' at the end.
                        return [string cat $number ".0"]
                    }
                }
                default {
                    ########################
                    ##                    ##
                    ##     CORRECTION     ##
                    ##                    ##
                    ########################

                    # If needed, remove any other '.'.
                    set number [::ms::Strip_Chars $number "." $pointIndex+1]

                    ############################
                    ##                        ##
                    ##     BEAUTIFICATION     ##
                    ##                        ##
                    ############################

                    # Strip any leading or trailing zeros, if any.
                    set number [string trim $number 0]

                    # Check if the number starts with '.'.
                    switch -- [string index $number 0] {
                        "." {
                            # Check the maxlength.
                            switch -- $maxlength {
                                0       {}
                                default {
                                    # Check if we need to truncate 'number'.
                                    set max_length [expr { $maxlength-1 }]
                                    set num_length [string length $number]

                                    if { $max_length < $num_length } {
                                        set diff   [expr { $num_length-$max_length }]
                                        set number [string range $number 0 end-$diff]
                                    }
                                }
                            }

                            # Add '0' before '.'.
                            set number [string cat "0" $number]
                        }
                    }

                    # Check if the number ends with '.'.
                    switch -- [string index $number end] {
                        "." {
                            # Check the maxlength.
                            switch -- $maxlength {
                                0       {}
                                default {
                                    # Check if we need to truncate 'number'.
                                    set max_length [expr { $maxlength-1 }]
                                    set num_length [string length $number]

                                    if { $max_length < $num_length } {
                                        set diff   [expr { $num_length-$max_length }]
                                        set number [string range $number 0 end-$diff]
                                    }
                                }
                            }

                            # Add '0' after '.'.
                            set number [string cat $number "0"]
                        }
                    }

                    if { $number == 0 } {
                        # Avoid to return '0.0'.
                        return 0
                    } else {
                        return $number
                    }
                }
            }
        }
        real {
            ########################
            ##                    ##
            ##     CORRECTION     ##
            ##                    ##
            ########################

            # Check for any leading minus sign.
            switch -- [string index $number 0] {
                -       { set startFrom 1 }
                default { set startFrom 0 }
            }

            # If needed, remove any other minus sign.
            set number [::ms::Strip_Chars $number "-" $startFrom]
            switch -- [string length $number] {
                0   { return "" }
            }

            # Get the first '.' index, if any.
            set pointIndex [string first "." $number]
            switch -- $pointIndex {
                -1  {
                    ############################
                    ##                        ##
                    ##     BEAUTIFICATION     ##
                    ##                        ##
                    ############################

                    if { $number == 0 } {
                        # Avoid to return '0.0', '.0', '0.', '-0.0', '-.0', '-0.', '00.0' ...
                        return 0
                    } else {
                        # Strip any leading zeros, if any.
                        switch -- $startFrom {
                            0   { set number [string trimleft $number 0] }
                            1   { set number [string cat "-" [string trimleft [string range $number 1 end] 0]] }
                        }

                        # Check the maxlength.
                        switch -- $maxlength {
                            0       {}
                            default {
                                # Check if we need to truncate 'number'.
                                set max_length [expr { $maxlength-2 }]
                                set num_length [string length $number]

                                if { $max_length < $num_length } {
                                    set diff   [expr { $num_length-$max_length }]
                                    set number [string range $number 0 end-$diff]
                                }
                            }
                        }

                        # Add '.0' at the end.
                        return [string cat $number ".0"]
                    }
                }
                default {
                    ########################
                    ##                    ##
                    ##     CORRECTION     ##
                    ##                    ##
                    ########################

                    # If needed, remove any other '.'.
                    set number [::ms::Strip_Chars $number "." $pointIndex+1]

                    ############################
                    ##                        ##
                    ##     BEAUTIFICATION     ##
                    ##                        ##
                    ############################

                    # Strip any leading zeros, if any.
                    switch -- $startFrom {
                        0   { set number [string trimleft $number 0] }
                        1   { set number [string cat "-" [string trimleft [string range $number 1 end] 0]] }
                    }

                    # Strip any trailing zeros, if any.
                    set number [string trimright $number 0]

                    # Check startFrom.
                    switch -- $startFrom {
                        0   {
                            # Check if the number starts with '.'.
                            switch -- [string index $number 0] {
                                "." {
                                    # Check the maxlength.
                                    switch -- $maxlength {
                                        0       {}
                                        default {
                                            # Check if we need to truncate 'number'.
                                            set max_length [expr { $maxlength-1 }]
                                            set num_length [string length $number]

                                            if { $max_length < $num_length } {
                                                set diff   [expr { $num_length-$max_length }]
                                                set number [string range $number 0 end-$diff]
                                            }
                                        }
                                    }

                                    # Add '0' before '.'.
                                    set number [string cat "0" $number]
                                }
                            }
                        }
                        1   {
                            # Check if the number starts with '-.'.
                            switch -- [string index $number 1] {
                                "." {
                                    # Check the maxlength.
                                    switch -- $maxlength {
                                        0       {}
                                        default {
                                            # Check if we need to truncate 'number'.
                                            set max_length [expr { $maxlength-1 }]
                                            set num_length [string length $number]

                                            if { $max_length < $num_length } {
                                                set diff   [expr { $num_length-$max_length }]
                                                set number [string range $number 0 end-$diff]
                                            }
                                        }
                                    }

                                    # Add '0' before '.'.
                                    set number [string insert $number 1 "0"]
                                }
                            }
                        }
                    }

                    # Check if the number ends with '.'.
                    switch -- [string index $number end] {
                        "." {
                            # Check the maxlength.
                            switch -- $maxlength {
                                0       {}
                                default {
                                    # Check if we need to truncate 'number'.
                                    set max_length [expr { $maxlength-1 }]
                                    set num_length [string length $number]

                                    if { $max_length < $num_length } {
                                        set diff   [expr { $num_length-$max_length }]
                                        set number [string range $number 0 end-$diff]
                                    }
                                }
                            }

                            # Add '0' after '.'.
                            set number [string cat $number "0"]
                        }
                    }

                    if { $number == 0 } {
                        # Avoid to return '0.0' or '-0.0'.
                        return 0
                    } else {
                        return $number
                    }
                }
            }
        }
    }
}

## Compute_Maximum
#
# Computes the maximum possible value that is allowed for the digits provided.
#
# Where:
#
# digits   should be the available digits in the widget.
#          *Digits* must be an integer greater than zero if *sign* is **no** or
#          an integer greater than one if *sign* is **yes**.
#
# sign     Optional, should be a boolean value [**yes** or **no**] specifying if
#          the procedure needs to take in account one spot for the sign or not.
#
# It returns the 'maximum' value allowed for that widget.
proc ::ms::Compute_Maximum { digits { sign no } } {
    # Correct the digits available, if needed.
    switch -- $sign {
        "yes" { set digits [expr { $digits-1 }] }
    }

    # Set the maximum digits.
    set i 0
    while { $i < $digits } {
        append maximum_digits 9
        incr i
    }

    return $maximum_digits
}

## Convert_Measure
#
# Convert a measure from one unit measure to another.
#
# Where:
#
# measure    Should be a string (or an integer in case of pixels) that specifies
#            the measure to convert and its unit. Allowed units are:
#                c --> centimeters
#                i --> inches
#                m --> millimeters
#                p --> points
#            If there is no unit, the measure will be assumed to be in **pixels**.
#            The measure (intended as without its unit) should always be a positive integer value.
#
# to         Optional. Should be a string that specifies the new unit in which the result
#            needs to be expressed. Allowed values are:
#                c --> centimeters
#                i --> inches
#                m --> millimeters
#                p --> points
#            If an empty string is provided, the **to** parameter will be assumed to be in pixels.
#            If not provided, defaults to **pixels**.
#
# fallback   Optional. Should be a string that specifies the fallback value to return if
#            the measure provided will result invalid.
#            If not provided, defaults to **invalid**.
#
# Some pre-computation have been made in order to increase the performance:
#   2.54/72.0 = 0.035277777777777776
#   25.4/72.0 = 0.35277777777777775
#   72.0/2.54 = 28.346456692913385
#   72.0/25.4 = 2.834645669291339
#   1/72.0    = 0.013888888888888888
#   1/2.54    = 0.39370078740157477
#   1/25.4    = 0.03937007874015748
#
# Return the converted measure or the fallback value.
proc ::ms::Convert_Measure { measure { to "" } { fallback invalid } } {
    # Check the measure provided and extract its unit.
    set from [string index $measure end]
    switch -- $from {
        0   -
        1   -
        2   -
        3   -
        4   -
        5   -
        6   -
        7   -
        8   -
        9   {
            # The measure have no unit, its value is assumed to be in pixels.
            set from ""

            # Check if the measure is a positive integer.
            switch -- [string is integer -strict $measure] {
                0   { return $fallback }
                1   {
                    if { $measure < 0 } {
                        return $fallback
                    }
                }
            }
        }
        c   -
        i   -
        m   -
        p   {
            # Get the actual measure without its unit.
            set measure [string range $measure 0 end-1]

            # Check if the measure is a positive double.
            switch -- [string is double -strict $measure] {
                0   { return $fallback }
                1   {
                    if { $measure < 0 } {
                        return $fallback
                    }
                }
            }
        }
        default { return $fallback }
    }

    # Check the 'to' value.
    switch -- $to {
        ""      -
        c       -
        i       -
        m       -
        p       {}
        default { return $fallback }
    }

    # If the measure is zero, return it without doing the conversion.
    if { $measure == 0 } {
        return "0"
    }

    # Get the current tk scaling value.
    set tkscaling [_tk scaling]

    # Execute the conversion.
    switch -- $from {
        ""  {
            switch -- $to {
                c   { set measure [expr { ($measure/$tkscaling)*0.035277777777777776 }] }
                i   { set measure [expr { ($measure/$tkscaling)*0.013888888888888888 }] }
                m   { set measure [expr { ($measure/$tkscaling)*0.352777777777777750 }] }
                p   { set measure [expr { ($measure/$tkscaling) }] }
            }
        }
        c   {
            switch -- $to {
                ""  { set measure [expr { round($measure*$tkscaling*28.346456692913385) }] }
                i   { set measure [expr { $measure*0.39370078740157477 }] }
                m   { set measure [expr { $measure*10 }] }
                p   { set measure [expr { $measure*28.3464566929133850 }] }
            }
        }
        i   {
            switch -- $to {
                ""  { set measure [expr { round($measure*$tkscaling*72.0) }] }
                c   { set measure [expr { $measure*2.54 }] }
                m   { set measure [expr { $measure*25.4 }] }
                p   { set measure [expr { $measure*72.0 }] }
            }
        }
        m   {
            switch -- $to {
                ""  { set measure [expr { round($measure*$tkscaling*2.834645669291339) }] }
                c   { set measure [expr { $measure*0.1 }] }
                i   { set measure [expr { $measure*0.03937007874015748 }] }
                p   { set measure [expr { $measure*2.83464566929133900 }] }
            }
        }
        p   {
            switch -- $to {
                ""  { set measure [expr { round($measure*$tkscaling) }] }
                c   { set measure [expr { $measure*0.035277777777777776 }] }
                i   { set measure [expr { $measure*0.013888888888888888 }] }
                m   { set measure [expr { $measure*0.352777777777777750 }] }
            }
        }
    }

    switch -- $to {
        ""      { return $measure }
        default { return [string cat $measure $to] }
    }
}

## Error
#
# The mustang error dialog.
#
# Where:
#
# message       Should be the error message to display to the user.
#
# caller_info   Optional. Should be the location of the command that generated the error.
#               For user related errors, this value should be the empty string.
#
# It doesn't return anything.
proc ::ms::Error { message { caller_info "" } } {
    # For the time being, just show the error message and the caller information (if any)
    # on the terminal standard output channel.
    chan puts stdout "$message"
    chan puts stdout "$caller_info"
    exit 1
}

## Escape
#
# Set the last valid value as the current value.
# Used by entry, combobox, palette and spinbox widgets.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::Escape { w } {
    # Check if the address provided belogs to a palette widget.
    switch -- [info exists ::ms::data($w,classtype)] {
        0   {
            set address $w
            set w       [_winfo parent $w]
        }
        1   { set address [list interp invokehidden {} $w] }
    }

    # Clear the widget textarea.
    {*}$address delete 0 end
    {*}$address selection clear

    # Insert the last valid value.
    {*}$address insert 0 $::ms::data($w,current_value)

    # Put the text cursor at the end of the value.
    {*}$address icursor end

    return ""
}

## Execute_Widget_Cmd
#
# Execute the command associated with the widget.
# Used by entry, combobox, palette and spinbox widgets.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::Execute_Widget_Cmd { w } {
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

    return ""
}

## External_Click
#
# Checks if a **ButtonPress** event happened inside a combobox or palette popdown window or not.
# Used by combobox and palette widgets.
#
# Where:
#
# w      Should be the widget real address involved.
#
# X, Y   Should be the (x,y) mouse pointer absolute coordinates at the time of the event.
#        These values should be provided by the **ButtonPress** event.
#
# It doesn't return anything.
proc ::ms::External_Click { w X Y } {
    # Get the Tk widget address under the mouse coordinates.
    set tk_widget [_winfo containing -displayof $w $X $Y]

    # Check if the 'Popdown scrollbar' and the Tk widget under the mouse coordinates, are the same address or not.
    if { [_winfo toplevel $tk_widget] ne "$w.popdown" } {
        # Unpost the popdown window.
        set ::wait_for_user_response "Unpost"
    }

    return ""
}

## Focus_The_Widget_Or_Its_Toplevel
#
# Focus the widget provided or its related toplevel after a **ButtonPress-1** event on it.
#
# The idea of this procedure is to give the user the possibility to click in an inert zone
# of the application (e.g. a container or a toplevel) to remove the focus on a widget that
# currently has it (e.g. an entry or a combobox).
# While this is normally true if the click happens on a widget that can take the focus,
# this procedure also put in place a system that works even for widgets that normally have
# their takefocus option setted to **0** (e.g. a container or a toplevel).
#
# Where:
#
# w   Should be the real address on the widget involved.
#
# It doesn't return anything.
proc ::ms::Focus_The_Widget_Or_Its_Toplevel { w } {
    # Check the widget takefocus.
    switch -- $::ms::current($w,takefocus) {
        0   {
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
        1   {
            # Check if 'w' is the hull of a megawidget of some kind.
            if { $w in $::ms::addr(megawidgets) } {
                set w $::ms::addr($w,widget)
            }

            # Focus the widget.
            focus -force $w
        }
    }

    return ""
}

## Load_Palette
#
# Load a palette file.
#
# Where:
#
# filepath   Should be the absolute filepath of the palette file to load.
#
# It doesn't return anything.
proc ::ms::Load_Palette { filepath } {
    # Get the palette name in lowercase characters.
    set palette [string tolower [file rootname [file tail $filepath]]]

    # Load the palette file.
    try {
        open [file nativename $filepath] r
    } on error {} {
        switch -nocase -- $::DEBUG {
            1       -
            on      -
            true    -
            active  -
            enabled { chan puts stdout "Unable to load the '[file rootname [file tail $filepath]]' palette file. Ignoring." }
        }
    } on ok { channel } {
        # Read the entire file.
        set file_content [split [chan read $channel] "\n"]
        chan close $channel

        # Initialize the list of available colornames for 'palette'.
        set ::ms::palette($palette,all_families,colornames) [list ]

        # Scan the file content line by line.
        foreach line $file_content {
            # Skip any empty or commented lines.
            switch -- [string index [string trim $line] 0] {
                ""  -
                "#" {
                    # Skip the entire line.
                    continue
                }
                default {
                    # Transform each word that compose the color name in titlecase characters.
                    set colorname [list ]
                    foreach word [string trim [lindex $line 0]] {
                        lappend colorname [string totitle $word]
                    }

                    # Check that 'colorname' is not already registered for this palette.
                    if { $colorname in $::ms::palette($palette,all_families,colornames) } {
                        # Skip the entire line.
                        continue
                    }

                    # Check the hexadecimal value at 8bit.
                    set result [::ms::Check_Hex [lindex $line 1] HEX8 invalid]
                    switch -- $result {
                        invalid {
                            # Skip the entire line.
                            continue
                        }
                        default { set hexcolor $result }
                    }

                    # Check the family name.
                    set index [lsearch -exact -nocase $::ms::palette(families) [lindex $line 2]]
                    switch -- $index {
                        -1  {
                            # Skip the entire line.
                            continue
                        }
                        default { set family [lindex $::ms::palette(families) $index] }
                    }

                    # Register the 'colorname' data.
                    set ::ms::palette($palette,$colorname,hex8) $hexcolor

                    lappend ::ms::palette($palette,$family,colornames)      $colorname
                    lappend ::ms::palette($palette,all_families,colornames) $colorname
                }
            }
        }
    }

    # Safeguard.
    # Check the number of colornames registered for 'palette'.
    switch -- [llength ::ms::palette($palette,all_families,colornames)] {
        0   {
            # All the colornames specified in the palette file were ignored.
            unset -nocomplain -- ::ms::palette($palette,all_families,colornames)
            return ""
        }
    }

    # Safeguard.
    # Create the missing 'palette' family lists, if any.
    foreach family $::ms::palette(families) {
        switch -- [info exists ::ms::palette($palette,$family,colornames)] {
            0   { set ::ms::palette($palette,$family,colornames) [list ] }
        }
    }

    # Register the palette name into the available ones.
    lappend ::ms::palette(names) $palette

    return ""
}

## Load_SVG_Images
#
# Automatically load all the current theme svg images (if any) and re-color them.
#
# Note: In order for this procedure to work, the theme developer will need to set an svg dataset table array with 3 columns.
#       This table array must be called '::ms::svg(THEMENAME,svg_dataset)' where THEMENAME must be substituted with your theme name.
#       The first column of the table represents the svg input filenames without the extension.
#       The second column of the table represents the colors of the svg input images.
#       The third column of the table represents the colors of the svg output images.
#       See the Halo theme for an svg dataset example.
#
# If no svg dataset table is found for the current theme, then no images will be loaded or re-colored automatically.
#
# It doesn't return anything
proc ::ms::Load_SVG_Images {} {
    # Safeguard.
    switch -- [info exists ::ms::svg($::ms::theme,svg_dataset)] {
        0   { return "" }
    }

    # Set the current theme svgs input and output folder.
    set input_folder  [file join $::ms_library themes $::ms::theme]
    set output_folder [file join $::ms::folder(mustang,data) themes $::ms::theme]

    # If needed, create the current theme svgs output folder.
    file mkdir $output_folder

    # Iterate each svg dataset line.
    foreach { svg_name input_color output_color } $::ms::svg($::ms::theme,svg_dataset) {
        # Set the input and output svg absolute filepaths.
        set input_filepath  [file join $input_folder  [string cat $svg_name ".svg"]]
        set output_filepath [file join $output_folder [string cat $svg_name ".svg"]]

        # Read the input svg image.
        try {
            open $input_filepath "r"
        } on error { errortext errorcode } {
            ::ms::Error "$::ms::theme theme. $errortext" ""
        } on ok { channel } {
            # Register the input svg data.
            set input_svg_data [split [chan read $channel] "\n"]
            chan close $channel
        }

        # Initialize the output svg data.
        set output_svg_data [list ]

        # Scan the input svg data, line by line.
        foreach input_line $input_svg_data {
            # Initialize/Reset the 'output_line'.
            set output_line ""

            # Remove any indentation from 'input_line'.
            set trimmed [string trimleft $input_line]

            # Compute the indentation of the 'input_line'.
            set indentation [expr { [string length $input_line]-[string length $trimmed] }]

            # Analyze how 'trimmed' start with.
            switch -glob -- $trimmed {
                "bordercolor=*" {
                    # Add the original 'input_line' indentation to 'output_line'.
                    while { $indentation > 0 } {
                        append output_line " "
                        incr indentation -1
                    }

                    # Append 'bordercolor=' to 'output_line'.
                    append output_line "bordercolor="

                    # Get the bordercolor value.
                    set bordercolor [string range $trimmed 13 end-1]

                    # Check if the bordercolor examined it's a valid hexadecimal color at 8 bit.
                    if { $bordercolor eq $input_color } {
                        # Set the parameter value with the output color translated as an hexadecimal at 8 bit.
                        set bordercolor [::ms::Check_Color [list $output_color HEX8] invalid]
                        switch -- $bordercolor {
                            invalid { ::ms::Error "$::ms::theme theme. Wrong svg output color, '$output_color'." ""}
                        }
                    }

                    # Append the bordercolor value to 'output_line'.
                    append output_line [string cat "\"" $bordercolor "\""]
                }
                "style=*" {
                    # Add the original 'input_line' indentation to 'output_line'.
                    while { $indentation > 0 } {
                        append output_line " "
                        incr indentation -1
                    }

                    # Append 'style="' to 'output_line'.
                    append output_line "style=" "\""

                    # Get the style values (the string after 'style="').
                    # Note that 'value' may contain several style parameters with their relative values, plus other code.
                    set values [string range $trimmed 7 end]

                    # Search the first (is actually the last) '"' in values.
                    set index  [string first \" $values]

                    # Separate 'values' into the actual style value and the rest of the line.
                    set value  [string range $values 0 $index-1]
                    set rest   [string range $values $index+1 end]

                    # Split 'value' into groups (along ';') with each group in the form 'parameterName:parameterValue'.
                    set groups [split $value ";"]
                    foreach group $groups {
                        # Split 'group' into parameterName and parameterValue (along ':').
                        set group          [split  $group ":"]
                        set parameterName  [lindex $group 0]
                        set parameterValue [lindex $group 1]

                        # Check if the parameter value examined starts with the hash sign '#'.
                        switch -- [string index $parameterValue 0] {
                            "#" {
                                # Check if the parameter value examined it's a valid hexadecimal color at 8 bit.
                                set result [::ms::Check_Hex $parameterValue HEX8 invalid]
                                switch -- $result {
                                    invalid {}
                                    default {
                                        # Check if 'result' is equal to the input color provided.
                                        if { $result eq $input_color } {
                                            # Set the parameter value with the output color translated as an hexadecimal at 8 bit.
                                            set parameterValue [::ms::Check_Color [list $output_color HEX8] invalid]
                                            switch -- $parameterValue {
                                                invalid { ::ms::Error "$::ms::theme theme. Wrong svg output color, '$output_color'." ""}
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        # Append the parameterName and the parameterValue to 'output_line'.
                        append output_line [string cat $parameterName ":" $parameterValue ";"]
                    }

                    # Replace the last ';' with the '"'
                    set output_line [string replace $output_line end end \"]

                    # If there is a 'rest', append it at the end of 'output_line'.
                    switch -- $rest {
                        ""      {}
                        default { append output_line $rest }
                    }
                }
                default {
                    # Copy the 'input_line' verbatim to 'output_line'.
                    set output_line $input_line
                }
            }

            # Append the 'output_line' to the 'output_svg_data'.
            lappend output_svg_data $output_line
        }

        # Check the output svg data.
        switch -- $output_svg_data {
            ""  {
                # An error as occured, copy the input svg image verbatim, if possible.
                try {
                    file copy -force -- $input_filepath $output_filepath
                } on error { errortext errorcode } {
                    ::ms::Error "$::ms::theme theme. $errortext" ""
                }
            }
            default {
                # Save the output svg image. Overwrite if needed.
                try {
                    open $output_filepath "w"
                } on error { errortext errorcode } {
                    # An error as occured, copy the input svg image verbatim, if possible.
                    try {
                        file copy -force -- $input_filepath $output_filepath
                    } on error { errortext errorcode } {
                        ::ms::Error "$::ms::theme theme. $errortext" ""
                    }
                } on ok { channel } {
                    # Write the output svg data, line by line.
                    foreach line $output_svg_data {
                        chan puts $channel "$line"
                    }

                    chan flush $channel
                    chan close $channel
                }
            }
        }

        # If an svg image for 'svg_name' already exists, delete it.
        try {
            image delete $svg_name
        } on error {} {
            # Do nothing
        }

        # Note that macOS and Windows systems automatically applies the correct scale on the image to display.
        # If we will apply too it will be a double scale.
        # That's the reason behind their values has been setted at '100.0'.

        # Check the windowing system.
        switch -- [_tk windowingsystem] {
            aqua    -
            win32   { set scale 100.0 }
            default { set scale $::ms::scale }
        }

        # Load the svg image at the current UI scale factor.
        image create photo $svg_name -format [list svg -dpi 96 -scale [expr { $scale*0.01 }]] -file $output_filepath
    }

    return ""
}

## Set_Cursor
#
# Set the cursor shape on a combobox, palette or spinbox widget.
#
# Note: The following procedure is inspired by the ttk::panedwindow::SetCursor.
#       The procedure have been slighty modified to work with mustang.
#       All credits goes to the original author/s.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#        These values should be provided by the **<Motion>** event.
#
# It doesn't return anything.
proc ::ms::Set_Cursor { w x y } {
    # Check if the address provided belogs to a palette widget.
    switch -- [info exists ::ms::data($w,classtype)] {
        0   {
            set address $w
            set w       [_winfo parent $w]
        }
        1   { set address [list interp invokehidden {} $w] }
    }

    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled {
            # Check if the cursor is different than 'arrow'.
            switch -- $::ms::current($w,cursor) {
                arrow   {}
                default { {*}$address configure -cursor arrow }
            }
        }
        readonly {
            # Check if the cursor is different than the '::ms::current($w,cursor)' provided.
            if { [{*}$address cget -cursor] ne $::ms::current($w,cursor) } {
                {*}$address configure -cursor $::ms::current($w,cursor)
            }
        }
        normal {
            # Check if the cursor is over the textarea.
            switch -- [{*}$address identify $x $y] {
                textarea {
                    # Check if the cursor is different than 'xterm'.
                    switch -- [{*}$address cget -cursor] {
                        xterm   {}
                        default { {*}$address configure -cursor xterm }
                    }
                }
                default {
                    # Check if the cursor is different than the '::ms::current($w,cursor)' provided.
                    if { [{*}$address cget -cursor] ne $::ms::current($w,cursor) } {
                        {*}$address configure -cursor $::ms::current($w,cursor)
                    }
                }
            }
        }
    }

    return ""
}

## Show_ContextMenu
#
# Manages the **<<ContextMenu>>** event on a widget by displaying
# its contextual menu at the (X,Y) root coordinates provided.
#
# Where:
#
# w      Should be the widget real address involved.
#
# X, Y   Should be the mouse pointer (X,Y) root coordinates.
#        These value should be provided by the **<<ContextMenu>>** event.
#
# type   Optional, should be the type of contextual menu address to fire up.
#        Allowed values are **cmenu** or **shell**.
#
#        If not provided defaults to **cmenu**.
#
# It doesn't return anything.
proc ::ms::Show_ContextMenu { w X Y { type cmenu } } {
    # Check the type provided.
    switch -- $type {
        cmenu {
            # Check the widget state.
            switch -- $::ms::current($w,state) {
                disabled { set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu) }
                default  {
                    set cmenu $::ms::current($w,cmenu)

                    # Check the current contextual menu of the widget.
                    if { ($cmenu eq "") || ($cmenu ni $::ms::addr(cmenu)) } {
                        # Check if the widget address provided belongs to a checkbutton, crate, frame,
                        # label, labelframe, notebook, panedwindow or radiobutton widget.
                        switch -- $::ms::data($w,classtype) {
                            checkbutton -
                            crate       -
                            frame       -
                            label       -
                            labelframe  -
                            notebook    -
                            panedwindow -
                            radiobutton -
                            separator   -
                            sizegrip    {
                                # Use the widget's toplevel contextual menu, if any.
                                set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu)
                            }
                            default { return "" }
                        }
                    }
                }
            }
        }
        shell {
            # Check if exists a variable called '::ms::data($short_addr,cmenu,shell)'.
            switch -- [_winfo exists ::ms::data($::ms::addr($w,short),cmenu,shell)] {
                0   { set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu) }
                1   {
                    # Get the contextual menu address located inside the variable provided.
                    set cmenu [string trim $::ms::data($::ms::addr($w,short),cmenu,shell)]

                    # Check if the contextual menu is an empty string or an invalid address.
                    # If so, use the widget's toplevel contextual menu, if any.
                    if { ($cmenu eq "") || ($cmenu ni $::ms::addr(cmenu)) } {
                        set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu)
                    }
                }
            }
        }
    }

    # Check that the contextual menu is not an empty string.
    switch -- $cmenu {
        ""  { return "" }
    }

    # Fire up the contextual menu.
    ::ms::cmenu::Show $cmenu $X $Y

    return ""
}

## Strip_Chars
#
# Strip a string from any recurrence of the character provided.
#
# Where:
#
# string      Should be the string involved.
#
# char        Should be the character to strip from the string provided.
#
# startFrom   Optional, should be the index where the strip procedure will start analyzing the string.
#             Defaults to '0', if not provided.
#
# Returns the eventualy stripped string.
proc ::ms::Strip_Chars { string char { startFrom 0 } } {
    # ATTENTION!
    #
    # This is a recursive loop.
    # The only way to exit is if 'string' doesn't have any(more) 'char' in it.
    set i 1
    while { $i == 1 } {
        set index [string first $char $string $startFrom]
        switch -- $index {
            -1      { break }
            default { set string [string replace $string $index $index] }
        }
    }

    return $string
}

## Translate_Theme_Color
#
# Translate a theme color into an hexadecimal color at 8 bit.
#
# Where:
#
# color      Should be the theme color to translate, like *AccentColor*, *LightColor*
#            or *WindowBackgroundColor*.
#
# fallback   Should be the fallback value in case the color provided is not a theme color.
#            If not provided, defaults to **#ffffff**
#
# Return the translated theme color or the fallback value.
proc ::ms::Translate_Theme_Color { color { fallback #ffffff }} {
    # Check the theme accented colors.
    # Theme accented colors change only if the accent color change.
    set index [lsearch -exact $::ms::color(accent) $color]
    switch -- $index {
        -1      {}
        default {
            switch -- $::ms::accent {
                blue   { return [lindex $::ms::color(accent) $index+1] }
                gray   { return [lindex $::ms::color(accent) $index+2] }
                green  { return [lindex $::ms::color(accent) $index+3] }
                orange { return [lindex $::ms::color(accent) $index+4] }
                pink   { return [lindex $::ms::color(accent) $index+5] }
                purple { return [lindex $::ms::color(accent) $index+6] }
                red    { return [lindex $::ms::color(accent) $index+7] }
                yellow { return [lindex $::ms::color(accent) $index+8] }
            }
        }
    }

    # Check the theme colorschemed colors.
    # Theme colorschemed colors change only if the colorscheme change.
    set index [lsearch -exact $::ms::color(colorscheme) $color]
    switch -- $index {
        -1      {}
        default {
            switch -- $::ms::colorscheme {
                dark  { return [lindex $::ms::color(colorscheme) $index+1] }
                light { return [lindex $::ms::color(colorscheme) $index+2] }
            }
        }
    }

    # Check the theme fixed colors.
    # Theme fixed colors don't change no matter the colorscheme or the accent color in use.
    set index [lsearch -exact $::ms::color(fixed) $color]
    switch -- $index {
        -1      {}
        default { return [lindex $::ms::color(fixed) $index+1] }
    }

    return $fallback
}

#*EOF*