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

    ################################################################
    ##                                                            ##
    ##     INITIALIZE SOME VARIABLES THAT HELPS THE DEVELOPER     ##
    ##                                                            ##
    ################################################################

    # Set the default accent color of the current theme.
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
    # Only available on Linux and BSD operating systems.
    #
    # On Linux, the default action is 'paste', on the other
    # operating systems is blocked to 'drag'.
    #
    # ['paste','drag']
    switch -- [_tk windowingsystem] {
        x11     { set ::ms::middleclick paste }
        default { set ::ms::middleclick drag }
    }

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
    #                This is the default on Windows, Linux and BSD operating systems.
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

    set translated_error_text ""
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

            # Set the UI scale factor.
            set ::ms::machine(os,ui_scale_factor) 200.0

            # Get the macOS name, prettyname and version number.
            set cmd [list {*}[auto_execok sw_vers] "-productVersion"]
            try {
                exec {*}$cmd
            } on error {} {
                set translated_error_text "[::msgcat::mc "Operating system not supported."]"
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
                    default { set translated_error_text "[::msgcat::mc "Operating system not supported."]" }
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

            # Set the UI scale factor.
            set ::ms::machine(os,ui_scale_factor) 100.0

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
        "Win*" {}
        default { set translated_error_text "[::msgcat::mc "Operating system not supported."]" }
    }
}

####################
##                ##
##     CHECKS     ##
##                ##
####################

#*EOF*