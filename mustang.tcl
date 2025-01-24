# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

## ARRAYS
#
# ::ACCENTS --> It's an array that contains all the Mustang accents colors.
# ::ADDRESS --> It's an array that contains addresses organized in various ways.
# ::CURRENT --> It's an array that contains all the Mustang widgets current options values.
# ::DATA    --> It's an array that contains all the Mustang variables that doesn't fit anywhere else.
# ::DEFAULT --> It's an array that contains all the Mustang widgets default options values.
# ::FONT    --> It's an array that contains all the Mustang fonts data.
# ::STYLE   --> It's an array that contains every style name known by each theme available.
# ::SVG     --> It's an array that contains all the Mustang svgs icons.
# ::TABLE   --> It's an array that contains all the Mustang tables.
# ::TEMP    --> It's an array that contains all the Mustang temporary variables.

## EXIT CODES
#
#   0 --> The exit was not caused by an error.
#   1 --> The exit was caused by an error generated for an expected reason.
#   2 --> The exit was caused by an error generated for an unexpected reason.

## LONG AND SHORT ADDRESSES
#
# In order to deliver new widgets functionality (like native scrollbars) Mustang will
# make use of what we can call 'megawidgets'.
# A megawidget is a structure composed by two or more widgets that works together
# to 'appear' as a single widget to the developer eye.
# A megawidget will have a huge impact on the addresses lengths.
#
# Mustang will call long address the official Tk address hierarchy of a widget, including any
# megawidget internal structures.
# A short address refers instead only to a widget address hierarchy created by the developer,
# and will never contain any megawidgets internal structure.
#
# Examples:
#
#   - No megawidgets present in the address hierarchy:
#     A simple frame called 'frame' containing a single label called 'label'.
#
#       .frame.label   short address
#       .frame.label   long address
#
#   - A megawidget present in the address hierarchy:
#     A scrollable frame called 'frame' containing a single label called 'label'.
#
#       .frame.label                               short address
#       .frame.border.visible_area.content.label   long address
#
#     In this case 'border', 'visible_area' and 'content' where not created
#     by the developer but by Mustang. These widgets are part of the
#     scrollable frame megawidget internal structure.
#
# All Mustang widgets and almost all Mustang commands will accept both short and/or long address
# as input and returns short or long address depending on the input address type provided.
# In other words...
#
# Widgets will:
#    return long addresses  --> if a long address was given as input.
#    return short addresses --> if a short address was given as input.
#
# Commands that may return addresses in their results will:
#    return long addresses  --> if a long address was given as input or the command doesn't
#                               require an address as input.
#    return short addresses --> if a short address was given as input. See the note.
#
# Note: There are a few commands that do not follow the last command rule, and may return
#       long addresses or a mix of short and long addresses even if a short address was provided as input.
#       As an example we can take a look at the 'winfo children' command. If a short address
#       will be provided, the children short addresses should be returned.
#
#       But if some of the children were created without using any Mustang widgets, the short addresses
#       of those widgets will not exists and Mustang will return their long address instead.
#
#       These are extraordinary cases, and you may never encounter them.

# Load the Mustang dependencies.
package require Tk
package require Img
package require msgcat

# Set the application name, prettyname and version.
# The developer should overrule these variables values with its own application name, prettyname and version.
set ::APP_NAME       Mustang
set ::APP_PRETTYNAME "Mustang $::MUSTANG_VERSION"
set ::APP_VERSION    $::MUSTANG_VERSION

# Note: The variable '::MUSTANG_VERSION' is defined in the pkgIndex file located in the root folder of the Mustang package.

# Get the family, weight and slant of the TkFixedFont and register them as the Mustang MonospaceFont ones.
set ::FONT(Monospace,family) [font configure TkFixedFont -family]
set ::FONT(Monospace,weight) [font configure TkFixedFont -weight]
set ::FONT(Monospace,slant)  [font configure TkFixedFont -slant]

# Get the family, weight and slant of the TkDefaultFont and register them as the Mustang NormalFont ones.
set ::FONT(Normal,family) [font configure TkDefaultFont -family]
set ::FONT(Normal,weight) [font configure TkDefaultFont -weight]
set ::FONT(Normal,slant)  [font configure TkDefaultFont -slant]

# Get/Set the Mustang MonospaceFont and NormalFont sizes.
switch -- [tk windowingsystem] {
    aqua {
        set ::FONT(Monospace,size) [font configure TkFixedFont -size]
        set ::FONT(Normal,size)    [font configure TkDefaultFont -size]
    }
    win32 {
        set ::FONT(Monospace,size) 8
        set ::FONT(Normal,size)    6
    }
    default {
        set ::FONT(Monospace,size) 10
        set ::FONT(Normal,size)    10
    }
}

# Set the family, weight, slant and size of the Mustang BiggestFont.
set ::FONT(Biggest,family) $::FONT(Normal,family)
set ::FONT(Biggest,size)   [expr { $::FONT(Normal,size)+1 }]
set ::FONT(Biggest,weight) $::FONT(Normal,weight)
set ::FONT(Biggest,slant)  $::FONT(Normal,slant)

# Set a list with all the SVG icon names defined by Mustang.
set ::SVG(list) [list error \
                      info \
                      question \
                      reboot \
                      warning];

# Note: The following images were taken from the 'Vimix Icon Theme' project and
#       translated into 'base64' format.
#       The images were used as they were, no modifications have been made.
#
#       'Vimix Icon Theme' project:    https://github.com/vinceliuice/vimix-icon-theme
#       'Vimix Icon Theme' license:    https://github.com/vinceliuice/vimix-icon-theme/blob/master/COPYING

set ::SVG(icon,error) [image create photo  -format [list svg -scale 1.0] \
                                          -palette 255/255/255 \
                                             -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KIDxwYXRoIGQ9Im0xNiAxYy04LjI3NjggMC0xNSA2LjcyMzItMTUgMTUgMCA4LjI3NjggNi43MjMyIDE1IDE1IDE1IDguMjc2OCAwIDE1LTYuNzIzMiAxNS0xNSAwLTguMjc2OC02LjcyMzItMTUtMTUtMTV6IiBjb2xvcj0iIzAwMDAwMCIgZmlsbD0iI2Y0NjA2MiIgb3BhY2l0eT0iLjk5IiBvdmVyZmxvdz0idmlzaWJsZSIgc3Ryb2tlLXdpZHRoPSIxLjAzNDMiLz4KIDxyZWN0IHg9IjE0IiB5PSI2IiB3aWR0aD0iNCIgaGVpZ2h0PSIxNCIgcng9IjIiIHJ5PSIyIiBmaWxsPSIjZmZmZmZmIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS1taXRlcmxpbWl0PSIyIiBzdHJva2Utd2lkdGg9IjIiLz4KIDxjaXJjbGUgY3g9IjE2IiBjeT0iMjQiIHI9IjIiIGZpbGw9IiNmZmZmZmYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLW1pdGVybGltaXQ9IjIiIHN0cm9rZS13aWR0aD0iMiIvPgo8L3N2Zz4K"]];

set ::SVG(icon,info) [image create photo  -format [list svg -scale 1.0] \
                                         -palette 255/255/255 \
                                            -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiA8ZGVmcz4KICA8bGluZWFyR3JhZGllbnQgaWQ9ImIiIHgxPSI2OS4zMTIiIHgyPSI2OS4zMTIiIHkxPSIyMS4zMTkiIHkyPSIyNy43MjciIGdyYWRpZW50VHJhbnNmb3JtPSJtYXRyaXgoLjE5ODExIDAgMCAuMjMwNjcgLTMyLjYyNiAyNC45NSkiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgPHN0b3Agb2Zmc2V0PSIwIi8+CiAgIDxzdG9wIHN0b3Atb3BhY2l0eT0iMCIgb2Zmc2V0PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KIDwvZGVmcz4KIDxwYXRoIGQ9Im0xNiAxYy04LjI3NjggMC0xNSA2LjcyMzItMTUgMTUgMCA4LjI3NjggNi43MjMyIDE1IDE1IDE1IDguMjc2OCAwIDE1LTYuNzIzMiAxNS0xNSAwLTguMjc2OC02LjcyMzItMTUtMTUtMTV6IiBjb2xvcj0iIzAwMDAwMCIgZmlsbD0iIzUyOTRlMiIgb3BhY2l0eT0iLjk5IiBvdmVyZmxvdz0idmlzaWJsZSIgc3Ryb2tlLXdpZHRoPSIxLjAzNDMiLz4KIDxwYXRoIGQ9Im0tMzcuMjg1IDcuMzcxaDMydjMyaC0zMnoiIGZpbGw9Im5vbmUiLz4KIDxwYXRoIGQ9Ik0tMTguMTg4IDMwLjA5NWMtLjQwNC4zMjQtLjc5My43OC0xLjMwNi44MjMiIGZpbGw9Im5vbmUiIGZvbnQtZmFtaWx5PSJVUlcgUGFsbGFkaW8gTCIgZm9udC1zaXplPSI0MCIgZm9udC13ZWlnaHQ9IjcwMCIgb3BhY2l0eT0iLjEiIHN0cm9rZT0idXJsKCNiKSIvPgogPHJlY3QgdHJhbnNmb3JtPSJzY2FsZSgxLC0xKSIgeD0iMTQiIHk9Ii0yNiIgd2lkdGg9IjQiIGhlaWdodD0iMTQiIHJ4PSIyIiByeT0iMiIgZmlsbD0iI2ZmZmZmZiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2UtbWl0ZXJsaW1pdD0iMiIgc3Ryb2tlLXdpZHRoPSIyIi8+CiA8Y2lyY2xlIHRyYW5zZm9ybT0ic2NhbGUoMSwtMSkiIGN4PSIxNiIgY3k9Ii04IiByPSIyIiBmaWxsPSIjZmZmZmZmIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS1taXRlcmxpbWl0PSIyIiBzdHJva2Utd2lkdGg9IjIiLz4KPC9zdmc+Cg=="]];

set ::SVG(icon,question) [image create photo  -format [list svg -scale 1.0] \
                                             -palette 255/255/255 \
                                                -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KIDxwYXRoIGQ9Im0xNiAxYy04LjI3NjggMC0xNSA2LjcyMzItMTUgMTUgMCA4LjI3NjggNi43MjMyIDE1IDE1IDE1IDguMjc2OCAwIDE1LTYuNzIzMiAxNS0xNSAwLTguMjc2OC02LjcyMzItMTUtMTUtMTV6IiBjb2xvcj0iIzAwMDAwMCIgZmlsbD0iIzUyOTRlMiIgb3BhY2l0eT0iLjk5IiBvdmVyZmxvdz0idmlzaWJsZSIgc3Ryb2tlLXdpZHRoPSIxLjAzNDMiLz4KIDxwYXRoIGQ9Im0xNiA2YTYgNiAwIDAgMC02IDZoMmE0IDQgMCAwIDEgMy45Mzk1LTQgNCA0IDAgMCAxIDAuMDYwNTQ3IDAgNCA0IDAgMCAxIDQgNCA0IDQgMCAwIDEtNCA0djJhNiA2IDAgMCAwIDYtNiA2IDYgMCAwIDAtNi02eiIgZmlsbD0iI2ZmZmZmZiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2UtbWl0ZXJsaW1pdD0iMiIgc3Ryb2tlLXdpZHRoPSIyLjE4MTgiLz4KIDxjaXJjbGUgY3g9IjE2IiBjeT0iMjQiIHI9IjIiIGZpbGw9IiNmZmZmZmYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLW1pdGVybGltaXQ9IjIiIHN0cm9rZS13aWR0aD0iMiIvPgogPHJlY3QgeD0iMTUiIHk9IjE2IiB3aWR0aD0iMiIgaGVpZ2h0PSI0IiBmaWxsPSIjZmZmZmZmIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS1taXRlcmxpbWl0PSIyIiBzdHJva2Utd2lkdGg9IjEuNDE0MiIvPgo8L3N2Zz4K"]];

set ::SVG(icon,reboot) [image create photo  -format [list svg -scale 1.0] \
                                           -palette 255/255/255 \
                                              -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KIDxwYXRoIGQ9Im0xNiAxYy04LjI3NjggMC0xNSA2LjcyMzItMTUgMTUgMCA4LjI3NjggNi43MjMyIDE1IDE1IDE1IDguMjc1OCAwIDE1LTYuNzIzMiAxNS0xNSAwLTguMjc1OC02LjcyMzItMTUtMTUtMTV6IiBjb2xvcj0iIzAwMDAwMCIgZmlsbD0iIzRkYTJmMyIgZmlsbC1vcGFjaXR5PSIuOTkyIiBvcGFjaXR5PSIuOTkiIG92ZXJmbG93PSJ2aXNpYmxlIiBzdHJva2Utd2lkdGg9IjEuMDM0MyIvPgogPHBhdGggZD0iTTE2IDYuNXYyLjQyOWE3LjI4NiA3LjI4NiAwIDEgMCA3LjI4NiA3LjI4NWgtMi40MjlBNC44NTcgNC44NTcgMCAxIDEgMTYgMTEuMzU3djIuNDI5bDYuMDcxLTMuNjQzTDE2IDYuNXoiIGNvbG9yPSIjYmViZWJlIiBmaWxsPSIjZmZmIiBvdmVyZmxvdz0idmlzaWJsZSIvPgo8L3N2Zz4K"]];

set ::SVG(icon,warning) [image create photo  -format [list svg -scale 1.0] \
                                            -palette 255/255/255 \
                                               -data [binary decode base64 "PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiA8ZGVmcz4KICA8bGluZWFyR3JhZGllbnQgaWQ9ImIiIHgxPSI0NC40MjQiIHgyPSI0NC40MjQiIHkxPSI2MC41MzUiIHkyPSItNS40OTciIGdyYWRpZW50VHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTYuNzIzIDEuMjI2KSBzY2FsZSguNTAxNzQpIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+CiAgIDxzdG9wIHN0b3AtY29sb3I9IiM2MzQyMTUiIG9mZnNldD0iMCIvPgogICA8c3RvcCBzdG9wLWNvbG9yPSIjOTM3MDBkIiBvZmZzZXQ9IjEiLz4KICA8L2xpbmVhckdyYWRpZW50PgogPC9kZWZzPgogPHBhdGggZD0iTTAgMGgzMnYzMkgweiIgZmlsbD0ibm9uZSIvPgogPHBhdGggZD0ibTMwLjc4NiAyNy4wMzctMTMuMDIxLTI0Yy0wLjM3MzQ1LTAuNjY2ODEtMS4wNTEtMS4wMzctMS44MDUyLTEuMDM3LTAuNzU1MTcgMC0xLjQzNDggMC40NDQ4OS0xLjgxNDUgMS4xMTA3bC0xMi45MjQgMjRjLTAuMzA0MTQgMC41OTMxOS0wLjMwODI4IDEuNDA3MyAwLjA2NjIwNyAyLjAwMDQgMC4zNzQ0OCAwLjU5MjE1IDAuOTc2NTUgMC44ODg3NCAxLjczMTcgMC44ODg3NGgyNS45NDVjMC43NTMxIDAgMS40MzM4LTAuMzcwMjIgMS43Mzc5LTAuOTYzNDEgMC4zNzk2Ni0wLjU5MjE1IDAuMzgyNzYtMS4zMzI2IDAuMDgzNzktMS45OTk0eiIgZmlsbD0iI2ZhYzg0OCIgc3Ryb2tlLXdpZHRoPSIxLjAzNTgiLz4KIDxwYXRoIHRyYW5zZm9ybT0idHJhbnNsYXRlKC4wMDQpIiBkPSJNMTQuNDE2IDkuNTE2Yy4zNzUgMy42NjYuODA1IDcuMzA3IDEuMTI1IDEwLjk4N2gxLjAyYy4yNjUtMy41MzQuNjkyLTcuMDQ3IDEtMTAuNTc4LjE1OC0uODM1LS4yNzItMS44MjgtMS4xNTQtMi4wMy0uODczLS4yNTYtMS44NDcuMzc2LTEuOTYzIDEuMjc4LS4wMi4xMTMtLjAyOC4yMjgtLjAyOC4zNDN6bS0uMTExIDE0LjkwNWMtLjA0IDEuMDkyIDEuMTYxIDEuOTQ3IDIuMTg2IDEuNjAxLjk5My0uMjUzIDEuNTE2LTEuNTAxIDEuMDA3LTIuMzg5LS40NTUtLjkxNy0xLjc5MS0xLjIxOS0yLjU2LS41MTctLjM4OC4zMi0uNjQ2Ljc5Ni0uNjMzIDEuMzA1eiIgZmlsbD0iI2ZmZmZmZiIgZm9udC1mYW1pbHk9Ikdlb3JnaWEiIGZvbnQtc2l6ZT0iNjIuNDU4IiBmb250LXdlaWdodD0iNDAwIiBvdmVyZmxvdz0idmlzaWJsZSIvPgo8L3N2Zz4K"]];

# Create the Mustang package.
package provide Mustang $::MUSTANG_VERSION
namespace eval ::Mustang {}

## init
#
# Initialize Mustang.
#
# It doesn't return anything.
proc ::Mustang::init {} {
    # Set the actual internal name of the application.
    tk appname [string tolower $::APP_NAME]

    # Hide the initial toplevel created by Tk.
    wm withdraw .

    # Initialize all the widgets classtypes ::ADDRESS lists.
    set ::ADDRESS(classtype,BUTTON)         [list ]
    set ::ADDRESS(classtype,CANVAS)         [list ]
    set ::ADDRESS(classtype,CHECKBUTTON)    [list ]
    set ::ADDRESS(classtype,COMBOBOX)       [list ]
    set ::ADDRESS(classtype,CONTEXTUALMENU) [list ]
    set ::ADDRESS(classtype,ENTRY)          [list ]
    set ::ADDRESS(classtype,FRAME)          [list ]
    set ::ADDRESS(classtype,LABEL)          [list ]
    set ::ADDRESS(classtype,LABELFRAME)     [list ]
    set ::ADDRESS(classtype,LISTBOX)        [list ]
    set ::ADDRESS(classtype,MENU)           [list ]
    set ::ADDRESS(classtype,MENUBUTTON)     [list ]
    set ::ADDRESS(classtype,NOTEBOOK)       [list ]
    set ::ADDRESS(classtype,PALETTE)        [list ]
    set ::ADDRESS(classtype,PANEDWINDOW)    [list ]
    set ::ADDRESS(classtype,POINT)          [list ]
    set ::ADDRESS(classtype,PROGRESSBAR)    [list ]
    set ::ADDRESS(classtype,RADIOBUTTON)    [list ]
    set ::ADDRESS(classtype,SCALE)          [list ]
    set ::ADDRESS(classtype,SCROLLBAR)      [list ]
    set ::ADDRESS(classtype,SEPARATOR)      [list ]
    set ::ADDRESS(classtype,SIZEGRIP)       [list ]
    set ::ADDRESS(classtype,SPINBOX)        [list ]
    set ::ADDRESS(classtype,TEXT)           [list ]
    set ::ADDRESS(classtype,TOPLEVEL)       [list ]
    set ::ADDRESS(classtype,TREEVIEW)       [list ]

    # Initialize some more ::ADDRESS lists.
    set ::ADDRESS(longs)              [list ]
    set ::ADDRESS(complex,containers) [list ]
    set ::ADDRESS(simple,containers)  [list ]
    set ::ADDRESS(scrollable)         [list ]
    set ::ADDRESS(shorts)             [list ]

    # ::ACCENT
    #
    # It's a string that specifies the current accent color.
    #
    # ['blue', 'cyan', 'green', 'orange', 'purple', 'red', 'yellow' or 'custom']
    set ::ACCENT "blue"

    # ::ARCH
    #
    # It's a string that specifies the operating system architecture.
    #
    # ['32 bit' or '64 bit']
    switch -- $::tcl_platform(pointerSize) {
        8   { set ::ARCH "64 bit" }
        4   { set ::ARCH "32 bit" }
    }

    # ::CIE
    #
    # It's a string that specifies the current CIE standard.
    # This value is used in color model conversions like XYZ-->RGB, RGB-->XYZ, ...
    #
    # ['standard' or 'intent']
    set ::CIE "standard"

    # ::COLORSCHEME
    #
    # It's a string that specifies the current colorscheme.
    #
    # ['light' or 'dark']
    set ::COLORSCHEME "light"

    # ::DEPTH
    #
    # It's an integer that specifies the current color depth.
    #
    # ['8', '12' or '16']
    set ::DEPTH 8

    # ::DPI
    #
    # It's an integer that specifies the number of pixels per inch of the screen
    # where '.' is initially placed.
    set ::DPI [expr { round([tk scaling]*72.0) }]

    # ::FOCUS_MODEL
    #
    # This variable changes the focus model for the application.
    #
    # Implicit method:
    #    Whenever the mouse enters a window, Mustang will automatically give it the input focus.
    #    The focus command may be used to move the focus to a window other than the one under the mouse,
    #    but as soon as the mouse moves into a new window the focus will jump to that window.
    #
    # Explicit method.
    #    The user has to click on a window to give it the focus.
    #
    # ['implicit' or 'explicit']
    set ::FOCUS_MODEL "explicit"

    # FONT_FAMILIES
    #
    # It's a list that specifies all the font families available at the start of the application.
    set ::FONT_FAMILIES [font families -displayof .]

    # ::LANGUAGES
    #
    # It's a string that specifies the available languages.
    # It must follow the 'ISO 639-1' specifications.
    set ::LANGUAGES [list ]
    foreach path [glob -type f -nocomplain -directory [file join $::BISON_DIR msgs] -- *.msg] {
        set lang [string tolower [file rootname [file tail $path]]]
        switch -- $lang {
            root    { continue }
            default { lappend ::LANGUAGES $lang }
        }
    }
    ::msgcat::mcload [file join $::BISON_DIR msgs]

    # Note: The Mustang language packs are defined in the global namespace.
    #
    #       App developers that wants that Mustang autotranslates their application texts,
    #       should define their message catalog in the global namespace as well.
    #
    #       3rd party package developers should use the widget '-textvariable' option
    #       instead of the '-text' one, and manage their translation internally.

    # ::LANGUAGE
    #
    # It's a string that specifies the current language.
    # It must follow the 'ISO 639-1' specifications.
    set ::LANGUAGE [::msgcat::mclocale]

    # ::NOTIFICATIONS
    #
    # It's a boolean that specifies the notifications state.
    #
    # ['enabled' or 'disabled']
    set ::NOTIFICATIONS "enabled"

    # ::PALETTES
    #
    # It's a list that specifies all the available palettes.
    # This list is case sensitive.
    set ::PALETTES [list ALL]

    # ::POPUPS
    #
    # It's a boolean that specifies the popups state.
    #
    # ['enabled' or 'disabled']
    set ::POPUPS "enabled"
}

#*EOF*