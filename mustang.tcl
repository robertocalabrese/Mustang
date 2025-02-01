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

# Note: The variables '::MUSTANG_VERSION' and '::MUSTANG_DIR' are defined in the pkgIndex file located in the root folder of the Mustang package.

# Set the application name, prettyname and version.
# The developer should overrule these variables values with its own application name, prettyname and version.
set ::APP_NAME       Mustang
set ::APP_PRETTYNAME "Mustang $::MUSTANG_VERSION"
set ::APP_VERSION    $::MUSTANG_VERSION

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
set ::SVGS [list error \
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
    # This value is used in color model conversions like XYZ-->Lab or Lab-->XYZ.
    #
    # ['standard' or 'intent']
    set ::CIE "standard"

    # ::COLOR_PATTERN
    #
    # Each color pattern is a list that specifies the theme colors to use for the relative accent color.
    #
    # The first  hexadecimal will be used as 'Press' color.
    # The second hexadecimal will be used as 'Hover' color.
    # The third  hexadecimal will be used as 'Focus' color.
    # The fourth hexadecimal will be used as 'Selection' color.
    # The fifth  hexadecimal will be used as 'Invalid' color.
    # The sixth  hexadecimal will be used as 'Secondary' color.
    #
    # The color displayed as the accent color in the theme chooser window, will be the 'hover' one.
    # An exception is made for the custom accent color that will have an image of a colorwheel.
    set ::COLOR_PATTERN(blue)   [list #334173  #1ca7ec  #b5e2ff  #e9fcf6  #ff0000  #f68453]
    set ::COLOR_PATTERN(cyan)   [list #026aa7  #298fca  #9ebaf5  #ccf2f6  #ff0000  #ff9505]
    set ::COLOR_PATTERN(green)  [list #004d25  #48bf53  #99d18f  #d6ecd2  #ff0000  #205072]
    set ::COLOR_PATTERN(orange) [list #784c34  #de7f31  #ffaf7a  #e6c09a  #ff0000  #223B5D]
    set ::COLOR_PATTERN(purple) [list #522157  #c678dd  #efa6f6  #e4c7b7  #ff0000  #33539e]
    set ::COLOR_PATTERN(red)    [list #431e15  #f67280  #ffb171  #ffdca2  #ff0000  #2c7a7b]
    set ::COLOR_PATTERN(yellow) [list #be8815  #e5de00  #f1ee8e  #f7f5bc  #ff0000  #e47200]
    set ::COLOR_PATTERN(custom) [list #ffffff  #ffffff  #ffffff  #ffffff  #ffffff  #ffffff]

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
    # where the application is initially placed.
    set ::DPI [expr { round([tk scaling]*72.0) }]

    # ::FOCUS_MODEL
    #
    # Change the focus model for the application.
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
    foreach path [glob -type f -nocomplain -directory [file join $::MUSTANG_DIR msgs] -- *.msg] {
        set lang [string tolower [file rootname [file tail $path]]]
        switch -- $lang {
            root    { continue }
            default { lappend ::LANGUAGES $lang }
        }
    }
    ::msgcat::mcload [file join $::MUSTANG_DIR msgs]

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
    set ::PALETTES [list ]

    # ::POPUPS
    #
    # It's a boolean that specifies the popups state.
    #
    # ['enabled' or 'disabled']
    set ::POPUPS "enabled"

    # ::SCALING
    #
    # It's a percentage that specifies the scaling factor of the screen.
    # It can be provided with or without the '%' symbol.
    # It's always registered without the '%' symbol.
    #
    # [25%-300%]
    switch -- [info exists ::tk::scalingPct] {
        0   { set ::SCALING 100.0 }
        1   { set ::SCALING $::tk::scalingPct }
    }

    # ::SCROLLBAR_ACTION
    #
    # It's a string that specifies how each scrollbar reacts when a click happens on its trough.
    #    jump --> The thumb will jump to the selected location.
    #    page --> The thumb will scroll one page down, up, left or right.
    #
    # ['jump' or 'page']
    set ::SCROLLBAR_ACTION jump

    # ::SCROLLSPEED
    #
    # It's an integer that specifies how big is a scroll unit.
    # A scroll unit rappresents the distance to travel (in pixels) for a single tick of the mouse wheel.
    #
    # [1.0,100.0]
    set ::SCROLLSPEED 50

    # ::TEMP(init,state)
    #
    # It's a string that specifies the Mustang initialization state.
    #
    # ['ongoing', 'done']
    set ::TEMP(init,state) ongoing

    # ::THEME
    #
    # It's a string that specifies the current theme name.
    set ::THEME "halo"

    # ::THEMES
    #
    # It's a list that specifies the available themes names.
    set ::THEMES [list halo vintage]

    # ::UNION
    #
    # It's a character that specifies the current union symbol inside a shortcut that links two
    # or more keys together (like 'Ctrl+C', 'Ctrl-C' or 'Ctrl C' for copy).
    # It's used inside menus popups and contextual menus.
    #
    # ['+', '-' or 'space']
    set ::UNION "+"

    # Note: The following data has been exctracted or computed from the icc profile 'sRGB_v4.icc' located in the colormath folder.
    #       This icc profile is not directly used by Mustang, it's here for completeness.

    # sRGB Chromaticity matrix.
    #
    #   | a1  b1  c1 |
    #   | a2  b2  c2 | --> [list a1 a2 a3 b1 b2 b3 c1 c2 c3]
    #   | a3  b3  c3 |
    set ::sRGB(chromaticity) [list 0.63999938964843750 0.33000183105468750 1.00000000000000000 0.30000305175781250 0.60000610351562500 1.00000000000000000 0.14999389648437500 0.05999755859375000 1.00000000000000000]

    # Whitepoint D65 xyz.
    set ::sRGB(whitepoint,x) 0.31270049247729637
    set ::sRGB(whitepoint,y) 0.32900093876915815
    set ::sRGB(whitepoint,z) 0.3582985687535455

    # Whitepoint D65 XYZ.
    set ::sRGB(whitepoint,X) 0.95045471191406250
    set ::sRGB(whitepoint,Y) 1.0
    set ::sRGB(whitepoint,Z) 1.08905029296875000

    # PCS D50 xyz.
    set ::sRGB(PCS,x) 0.345702914918791
    set ::sRGB(PCS,y) 0.3585385966799326
    set ::sRGB(PCS,z) 0.2957584884012764

    # PCS D50 XYZ.
    set ::sRGB(PCS,X) 0.96419999999999995
    set ::sRGB(PCS,Y) 1.0
    set ::sRGB(PCS,Z) 0.82489999999999997

    # Chromatic adaptation matrices (from 'D65' to 'D50' and viceversa).
    #
    #   | a1  b1  c1 |
    #   | a2  b2  c2 | --> [list a1 a2 a3 b1 b2 b3 c1 c2 c3]
    #   | a3  b3  c3 |
    set ::sRGB(chad)         [list 1.04788208007812500 0.02958679199218750 -0.00924682617187500 0.02291870117187500 0.99047851562500000 0.01507568359375000 -0.05021667480468750 -0.01707458496093750 0.75167846679687500]
    set ::sRGB(chad_inverse) [list 0.9555159902501114 -0.02307332134099263 0.06331013920126154 -0.028329994273946075 1.0099481697889854 0.021048637709356464 0.012322535106861805 -0.020539385824452097 1.3307127175165263]

    # Unadapted Y.
    set ::sRGB(unadapted,Yr) 0.21264461762001413
    set ::sRGB(unadapted,Yg) 0.7151663725690272
    set ::sRGB(unadapted,Yb) 0.07218900981095855

    # RGB_XYZ and XYZ_RGB matrices.
    #
    #   | a1  b1  c1 |
    #   | a2  b2  c2 | --> [list a1 a2 a3 b1 b2 b3 c1 c2 c3]
    #   | a3  b3  c3 |
    #
    # If a chromatic adaptation is needed (like in this case, from 'D65' to 'D50'), the 'RGB_XYZ' and
    # 'XYZ_RGB' data must be allready chromatically adapted.
    set ::sRGB(RGB_XYZ) [list 0.43603515625000000 0.22248840332031250 0.01391601562500000 0.38511657714843750 0.71690368652343750 0.09706115722656250 0.14305114746093750 0.06060791015625000 0.71391296386718750]
    set ::sRGB(XYZ_RGB) [list 3.134274306471669 -0.978795574325203 0.071978551323668 -1.617274016967423 1.916161596468483 -0.2289898906034097 -0.4907348029960735 0.03345405023031962 1.4057483687096277]

    ##########################
    # Start the init process #
    ##########################

    # Set the list of all availables accent colors.
    set ::ACCENTS [list blue cyan green orange purple red yellow custom]

    # Set the user folders.
    switch -- [tk windowingsystem] {
        aqua {
            set ::HOME_DIR   [file nativename $::env(HOME)]
            set ::CACHE_DIR  [file nativename [file join $::HOME_DIR Library Caches]]
            set ::CONFIG_DIR [file nativename [file join $::HOME_DIR Library "Application Support"]]
            set ::DATA_DIR   [file nativename [file join $::HOME_DIR Library Preferences]]
        }
        win32 {
            set ::HOME_DIR   [file nativename $::env(HOME)]
            set ::CONFIG_DIR [file nativename $::env(LOCALAPPDATA)]
            set ::CACHE_DIR  [file nativename [file join $::CONFIG_DIR cache]]
            set ::DATA_DIR   [file nativename $::env(APPDATA)]

            # Set some usefull Windows folders.
            set ::WIN_DISK   [file nativename $::env(SystemDrive)]
            set ::WIN_DIR    [file nativename $::env(SystemRoot)]
        }
        default {
            set ::HOME_DIR $::env(HOME)

            switch -- [info exists ::env(XDG_CACHE_HOME)] {
                0   { set ::CACHE_DIR [file nativename [file join $::HOME_DIR ".cache"]] }
                1   { set ::CACHE_DIR [file nativename $::env(XDG_CACHE_HOME)] }
            }

            switch -- [info exists ::env(XDG_CONFIG_HOME)] {
                0   { set ::CONFIG_DIR [file nativename [file join $::HOME_DIR ".config"]] }
                1   { set ::CONFIG_DIR [file nativename $::env(XDG_CONFIG_HOME)] }
            }

            switch -- [info exists ::env(XDG_DATA_HOME)] {
                0   { set ::DATA_DIR [file nativename [file join $::HOME_DIR ".local" share]] }
                1   { set ::DATA_DIR [file nativename $::env(XDG_DATA_HOME)] }
            }
        }
    }

    # Create the Mustang config folder.
    file mkdir [file join $::CONFIG_DIR mustang]

    # Load the helper functions.
    set HELPER_LIST [list [file join $::MUSTANG_DIR API "_ADD_ALPHA_CHANNEL.tcl"] \
                          [file join $::MUSTANG_DIR API "_ADD_SPACES_TO_A_STRING.tcl"] \
                          [file join $::MUSTANG_DIR API "_CENTER_A_TOPLEVEL_ON_THE_SCREEN.tcl"] \
                          [file join $::MUSTANG_DIR API "_CHECK_COLORNAME.tcl"] \
                          [file join $::MUSTANG_DIR API "_CHECK_HEX.tcl"] \
                          [file join $::MUSTANG_DIR API "_CHECK_MEASURE.tcl"] \
                          [file join $::MUSTANG_DIR API "_CONVERT_MEASURE.tcl"] \
                          [file join $::MUSTANG_DIR API "_LOAD_PALETTE.tcl"] \
                          [file join $::MUSTANG_DIR API "_REMOVE_ALPHA_CHANNEL.tcl"] \
                          [file join $::MUSTANG_DIR API "_ROUND.tcl"]];

    foreach ::path $HELPER_LIST {
        try {
            apply { {} { source -encoding utf-8 $::path }}
        } on error { errortext errorcode } {
            chan puts "Unable to load '[file rootname [file tail $::path]]'."
            exit 2
        }
    }

    # Load the color math functions.
    set COLORMATH_LIST [list [file join $::MUSTANG_DIR colormath "_COMPANDING.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEX8_HEX12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEX8_HEX16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEX8_RGB8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEX12_HEX8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEX12_HEX16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEX12_RGB12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEX16_HEX8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEX16_HEX12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEX16_RGB16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEXA8_HEXA12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEXA8_HEXA16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEXA8_RGBA8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEXA12_HEXA8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEXA12_HEXA16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEXA12_RGBA12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEXA16_HEXA8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEXA16_HEXA12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HEXA16_RGBA16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSB_HSI.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSB_HSL.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSB_HSP.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSB_rgb.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSBA_HSIA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSBA_HSLA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSBA_HSPA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSBA_rgba.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSI_HSB.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSI_HSL.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSI_HSP.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSI_rgb.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSIA_HSBA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSIA_HSLA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSIA_HSPA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSIA_rgba.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSL_HSB.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSL_HSI.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSL_HSP.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSL_rgb.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSLA_HSBA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSLA_HSIA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSLA_HSPA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSLA_rgba.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSP_HSB.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSP_HSI.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSP_HSL.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSP_rgb.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSPA_HSBA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSPA_HSIA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSPA_HSLA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_HSPA_rgba.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_INVERSE_COMPANDING.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_Lab_XYZ.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_LabA_XYZA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_Luv_XYZ.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_LuvA_XYZA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB8_HEX8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB8_rgb.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB8_RGB12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB8_RGB16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB12_HEX12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB12_rgb.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB12_RGB8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB12_RGB16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB16_HEX16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB16_rgb.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB16_RGB8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGB16_RGB12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgb_HSB.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgb_HSI.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgb_HSL.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgb_HSP.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgb_RGB8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgb_RGB12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgb_RGB16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgb_XYZ.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA8_HEXA8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA8_rgba.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA8_RGBA12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA8_RGBA16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA12_HEXA12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA12_rgba.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA12_RGBA8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA12_RGBA16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA16_HEXA16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA16_rgba.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA16_RGBA8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_RGBA16_RGBA12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgba_HSBA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgba_HSIA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgba_HSLA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgba_HSPA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgba_RGBA8.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgba_RGBA12.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgba_RGBA16.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_rgba_XYZA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_xyY_XYZ.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_xyYA_XYZA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_XYZ_Lab.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_XYZ_Luv.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_XYZ_rgb.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_XYZ_xyY.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_XYZA_LabA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_XYZA_LuvA.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_XYZA_rgba.tcl"] \
                             [file join $::MUSTANG_DIR colormath "_XYZA_xyYA.tcl"]];

    foreach ::path $COLORMATH_LIST {
        try {
            apply { {} { source -encoding utf-8 $::path }}
        } on error { errortext errorcode } {
            chan puts "Unable to load '[file rootname [file tail $::path]]'."
            exit 2
        }
    }

    # Remove the following commands from Tk.
    set REMOVED_CMDS_LIST [list [file join $::MUSTANG_DIR cmds removed "fontchooser.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "message.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_bisque.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_chooseColor.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_chooseDirectory.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_dialog.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_focusFollowsMouse.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_getOpenFile.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_getSaveFile.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_menuSetFocus.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_messageBox.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_optionMenu.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_popup.tcl"] \
                                [file join $::MUSTANG_DIR cmds removed "tk_SetPalette.tcl"]];

    foreach ::path $REMOVED_CMDS_LIST {
        try {
            apply { {} { source -encoding utf-8 $::path }}
        } on error { errortext errorcode } {
            chan puts "Unable to load '[file rootname [file tail $::path]]'."
            exit 2
        }
    }

    # Deprecate the following commands from Tk.
    set DEPRECATED_CMDS_LIST [list [file join $::MUSTANG_DIR cmds deprecated "tk_focusNext.tcl"] \
                                   [file join $::MUSTANG_DIR cmds deprecated "tk_focusPrev.tcl"] \
                                   [file join $::MUSTANG_DIR cmds deprecated "tk_textCopy.tcl"] \
                                   [file join $::MUSTANG_DIR cmds deprecated "tk_textCut.tcl"] \
                                   [file join $::MUSTANG_DIR cmds deprecated "tk_textPaste.tcl"]];

    foreach ::path $DEPRECATED_CMDS_LIST {
        try {
            apply { {} { source -encoding utf-8 $::path }}
        } on error { errortext errorcode } {
            chan puts "Unable to load '[file rootname [file tail $::path]]'."
            exit 2
        }
    }

    # Load the Tk commands that will be hijacked by Mustang.
    # Order do matter here. 'winfo.tcl' and 'tk.tcl' must be loaded before anything other commands.
    set HIJACKED_CMDS_LIST [list [file join $::MUSTANG_DIR cmds "winfo.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "tk.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "bell.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "bind.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "bindtags.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "clipboard.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "destroy.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "event.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "focus.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "font.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "grab.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "grid.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "option.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "pack.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "place.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "selection.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "send.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "style.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "tkwait.tcl"] \
                                 [file join $::MUSTANG_DIR cmds "wm.tcl"]];

    foreach ::path $HIJACKED_CMDS_LIST {
        try {
            apply { {} { source -encoding utf-8 $::path }}
        } on error { errortext errorcode } {
            chan puts "Unable to load '[file rootname [file tail $::path]]'."
            exit 2
        }
    }

    # Load the new Mustang commands.
    set NEW_MUSTANG_CMDS_LIST [list [file join $::MUSTANG_DIR cmds "color.tcl"] \
                                    [file join $::MUSTANG_DIR cmds "copy.tcl"] \
                                    [file join $::MUSTANG_DIR cmds "cut.tcl"] \
                                    [file join $::MUSTANG_DIR cmds "dialog.tcl"] \
                                    [file join $::MUSTANG_DIR cmds "paste.tcl"]];

    foreach ::path $NEW_MUSTANG_CMDS_LIST {
        try {
            apply { {} { source -encoding utf-8 $::path }}
        } on error { errortext errorcode } {
            chan puts "Unable to load '[file rootname [file tail $::path]]'."
            exit 2
        }
    }

    # Load the Mustang widgets.
    package require button
    package require canvas
    package require checkbutton
    package require combobox
    package require contextmenu
    package require entry
    package require frame
    package require label
    package require labelframe
    package require listbox
    package require menu
    package require menubutton
    package require notebook
    package require palette
    package require panedwindow
    package require progressbar
    package require radiobutton
    package require scale
    package require scrollbar
    package require separator
    package require sizegrip
    package require spinbox
    package require text
    package require toplevel
    package require treeview

    # Initialize the tables for all the available palettes color families.
    set ::TABLE(ALL,all)         [list ]
    set ::TABLE(ALL,gray)        [list ]
    set ::TABLE(ALL,red)         [list ]
    set ::TABLE(ALL,orange)      [list ]
    set ::TABLE(ALL,yellow)      [list ]
    set ::TABLE(ALL,yellowgreen) [list ]
    set ::TABLE(ALL,green)       [list ]
    set ::TABLE(ALL,greencyan)   [list ]
    set ::TABLE(ALL,cyan)        [list ]
    set ::TABLE(ALL,cyanblue)    [list ]
    set ::TABLE(ALL,blue)        [list ]
    set ::TABLE(ALL,bluepurple)  [list ]
    set ::TABLE(ALL,purple)      [list ]
    set ::TABLE(ALL,purplered)   [list ]

    # Load the default palette file.
    ::_LOAD_PALETTE [file join $::MUSTANG_DIR palettes "Classic.txt"]

    # Set the Mustang major version and preference filepath.
    set major_version [lindex [split $::MUSTANG_VERSION "."] 0]
    switch -- $major_version {
        0   -
        1   {
            set major_version ""
            set filepath      [file join $::CONFIG_DIR mustang "mustang.conf"]
        }
        default {
            set major_version [string cat $major_version ".0"]
            set filepath      [file join $::CONFIG_DIR [string cat "mustang-" $major_version] [string cat "mustang-" $major_version ".conf"]]
        }
    }

    # Load the Mustang preference file, if any.
    try {
        open $filepath r
    } on error { errortext errorcode } {
        # Save the Mustang preference file.
        try {
            open $filepath w
        } on error { errortext errorcode } {
            chan puts "Unable to read or write '$filepath'."
        } on ok { channel } {
            chan puts $channel "# [string trimright [string cat "Mustang " $major_version]]"
            chan puts $channel "#"
            chan puts $channel "# [clock format [clock seconds] -format [list %d %B %Y - %H:%M:%S]]"
            chan puts $channel ""

            chan puts $channel "# ACCENT"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the accent color to use."
            chan puts $channel "#"
            chan puts $channel "# \['blue', 'cyan', 'green', 'orange', 'purple', 'red', 'yellow' or 'custom'\]"
            chan puts $channel "ACCENT: $::ACCENT"
            chan puts $channel ""

            chan puts $channel "# BIGGEST_FONT"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the biggest font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another sans-serif family will be chosen."
            chan puts $channel "# If the size is a positive number, it is interpreted as a size in points."
            chan puts $channel "# If the size is a negative number, its absolute value is interpreted as a size in pixels."
            chan puts $channel "# If a font cannot be displayed at the specified size, a nearby size will be chosen."
            chan puts $channel "BIGGEST_FONT: $::FONT(Biggest,family) $::FONT(Biggest,size)"
            chan puts $channel ""

            chan puts $channel "# CIE"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the CIE standard to use."
            chan puts $channel "# This value is used in color model conversions like XYZ-->Lab or Lab-->XYZ."
            chan puts $channel "#"
            chan puts $channel "# \['standard' or 'intent'\]"
            chan puts $channel "CIE: $::CIE"
            chan puts $channel ""

            chan puts $channel "# COLOR_PATTERN"
            chan puts $channel "#"
            chan puts $channel "# Each color pattern is a list that specifies the theme colors to use for the relative accent color."
            chan puts $channel "#"
            chan puts $channel "# The first  hexadecimal will be used as 'Press' color."
            chan puts $channel "# The second hexadecimal will be used as 'Hover' color."
            chan puts $channel "# The third  hexadecimal will be used as 'Focus' color."
            chan puts $channel "# The fourth hexadecimal will be used as 'Selection' color."
            chan puts $channel "# The fifth  hexadecimal will be used as 'Invalid' color."
            chan puts $channel "# The sixth  hexadecimal will be used as 'Secondary' color."
            chan puts $channel "#"
            chan puts $channel "# The color displayed as the accent color in the theme chooser window, will be the 'hover' one."
            chan puts $channel "# An exception is made for the custom accent color that will have an image of a colorwheel."
            chan puts $channel "BLUE:   $::COLOR_PATTERN(blue)"
            chan puts $channel "CYAN:   $::COLOR_PATTERN(cyan)"
            chan puts $channel "GREEN:  $::COLOR_PATTERN(green)"
            chan puts $channel "ORANGE: $::COLOR_PATTERN(orange)"
            chan puts $channel "PURPLE: $::COLOR_PATTERN(purple)"
            chan puts $channel "RED:    $::COLOR_PATTERN(red)"
            chan puts $channel "YELLOW: $::COLOR_PATTERN(yellow)"
            chan puts $channel "CUSTOM: $::COLOR_PATTERN(custom)"
            chan puts $channel ""

            chan puts $channel "# COLORSCHEME"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the colorscheme to use."
            chan puts $channel "#"
            chan puts $channel "# \['light' or 'dark'\]"
            chan puts $channel "COLORSCHEME: $::COLORSCHEME"
            chan puts $channel ""

            chan puts $channel "# DEPTH"
            chan puts $channel "#"
            chan puts $channel "# It's an integer that specifies the color depth to use."
            chan puts $channel "#"
            chan puts $channel "# \['8', '12' or '16'\]"
            chan puts $channel "DEPTH: $::DEPTH"
            chan puts $channel ""

            chan puts $channel "# DPI"
            chan puts $channel "#"
            chan puts $channel "# It's an integer that specifies the number of pixels per inch of the screen"
            chan puts $channel "# where the application is initially placed."
            chan puts $channel "DPI: $::DPI"
            chan puts $channel ""

            chan puts $channel "# ::FOCUS_MODEL"
            chan puts $channel "#"
            chan puts $channel "# Change the focus model for the application."
            chan puts $channel "#"
            chan puts $channel "# Implicit method:"
            chan puts $channel "#    Whenever the mouse enters a window, Mustang will automatically give it the input focus."
            chan puts $channel "#    The focus command may be used to move the focus to a window other than the one under the mouse,"
            chan puts $channel "#    but as soon as the mouse moves into a new window the focus will jump to that window."
            chan puts $channel "#"
            chan puts $channel "# Explicit method."
            chan puts $channel "#    The 'User' has to click on a window to give it the focus."
            chan puts $channel "#"
            chan puts $channel "# \['implicit' or 'explicit'\]"
            chan puts $channel "FOCUS_MODEL: $::FOCUS_MODEL"
            chan puts $channel ""

            chan puts $channel "# LANGUAGE"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the language to use."
            chan puts $channel "# It must follow the 'ISO 639-1' specifications."
            chan puts $channel "LANGUAGE: $::LANGUAGE"
            chan puts $channel ""

            chan puts $channel "# MONOSPACE_FONT"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the monospace font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another monospace family will be chosen."
            chan puts $channel "# If the size is a positive number, it is interpreted as a size in points."
            chan puts $channel "# If the size is a negative number, its absolute value is interpreted as a size in pixels."
            chan puts $channel "# If a font cannot be displayed at the specified size, a nearby size will be chosen."
            chan puts $channel "MONOSPACE_FONT: $::FONT(Monospace,family) $::FONT(Monospace,size)"
            chan puts $channel ""

            chan puts $channel "# NORMAL_FONT"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the general font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another sans-serif family will be chosen."
            chan puts $channel "# If the size is a positive number, it is interpreted as a size in points."
            chan puts $channel "# If the size is a negative number, its absolute value is interpreted as a size in pixels."
            chan puts $channel "# If a font cannot be displayed at the specified size, a nearby size will be chosen."
            chan puts $channel "NORMAL_FONT: $::FONT(Normal,family) $::FONT(Normal,size)"
            chan puts $channel ""

            chan puts $channel "# NOTIFICATIONS"
            chan puts $channel "#"
            chan puts $channel "# It's a boolean that specifies if notifications should be displayed or not."
            chan puts $channel "#"
            chan puts $channel "# \['enabled' or 'disabled'\]"
            chan puts $channel "NOTIFICATIONS: $::NOTIFICATIONS"
            chan puts $channel ""

            chan puts $channel "# POPUPS"
            chan puts $channel "#"
            chan puts $channel "# It's a boolean that specifies if popups should be displayed or not."
            chan puts $channel "#"
            chan puts $channel "# \['enabled' or 'disabled'\]"
            chan puts $channel "POPUPS: $::POPUPS"
            chan puts $channel ""

            chan puts $channel "# SCALING"
            chan puts $channel "#"
            chan puts $channel "# It's a percentage that specifies the scaling factor of the screen."
            chan puts $channel "# It can be provided with or without the '%' symbol."
            chan puts $channel "#"
            chan puts $channel "# \[25.0%,300.0%\]"
            chan puts $channel "SCALING: $::SCALING"
            chan puts $channel ""

            chan puts $channel "# SCROLLBAR_ACTION"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies how each scrollbar reacts when a click happens on its trough."
            chan puts $channel "#    jump --> The thumb will jump to the selected location."
            chan puts $channel "#    page --> The thumb will scroll one page down, up, left or right."
            chan puts $channel "#"
            chan puts $channel "# \['jump' or 'page'\]"
            chan puts $channel "SCROLLBAR_ACTION: $::SCROLLBAR_ACTION"
            chan puts $channel ""

            chan puts $channel "# SCROLLSPEED"
            chan puts $channel "#"
            chan puts $channel "# It's an integer that specifies how big is a scroll unit."
            chan puts $channel "# A scroll unit rappresents the distance to travel (in pixels) for a single tick of the mouse wheel."
            chan puts $channel "#"
            chan puts $channel "# \[1,100\]"
            chan puts $channel "SCROLLSPEED: $::SCROLLSPEED"
            chan puts $channel ""

            chan puts $channel "# SMALLEST_FONT"
            chan puts $channel "#"
            chan puts $channel "# It's a list that specifies the smallest font to use (both family and size)."
            chan puts $channel "# If the family does not exists, another sans-serif family will be chosen."
            chan puts $channel "# If the size is a positive number, it is interpreted as a size in points."
            chan puts $channel "# If the size is a negative number, its absolute value is interpreted as a size in pixels."
            chan puts $channel "# If a font cannot be displayed at the specified size, a nearby size will be chosen."
            chan puts $channel "SMALLEST_FONT: $::FONT(Smallest,family) $::FONT(Smallest,size)"
            chan puts $channel ""

            chan puts $channel "# THEME"
            chan puts $channel "#"
            chan puts $channel "# It's a string that specifies the theme name to use."
            chan puts $channel "THEME: $::THEME"
            chan puts $channel ""

            switch -- $::UNION {
                " " { set union space }
                "-" { set union "-"   }
                "+" { set union "+"   }
            }

            chan puts $channel "# UNION"
            chan puts $channel "#"
            chan puts $channel "# It's a character that specifies the union symbol to use inside a shortcut that links two"
            chan puts $channel "# or more keys together (like 'Ctrl+C', 'Ctrl-C' or 'Ctrl C' for copy)."
            chan puts $channel "# It's used inside menus popups and/or contextual menus."
            chan puts $channel "#"
            chan puts $channel "# \['+', '-' or 'space'\]"
            chan puts $channel "UNION: $union"

            chan flush $channel
            chan close $channel
        }
    } on ok { channel } {
        # Read the entire file.
        set file_content [split [chan read $channel] "\n"]
        chan close $channel

        # Scan the file content line by line.
        foreach line $file_content {
            # Remove any spaces at the beginning and ending of the line string.
            set line [string trimright [string trimleft $line]]

            # Skip comments.
            switch -- [string index $line 0] {
                "#"  { continue }
            }

            # Skip empty lines and options without value/s.
            switch -- [llength $line] {
                0       -
                1       { continue }
                default {
                    # Threat '$line' as option/value.
                    set option [lindex   $line 0]
                    set value  [lreplace $line 0 0]
                    switch -nocase -- $option {
                        "ACCENT:" {
                            set value [string tolower $value]
                            if { $value in $::ACCENTS } {
                                set ::ACCENT $value
                            }
                        }
                        "BIGGEST_FONT:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lreplace $value end end]]
                            if { $family ni $::FONT_FAMILIES } {
                                continue
                            }

                            set ::FONT(Biggest,family) $family
                            set ::FONT(Biggest,size)   $size

                            _font configure BiggestFont -family $::FONT(Biggest,family) \
                                                          -size $::FONT(Biggest,size);
                        }
                        "CIE:" {
                            switch -nocase -- $value {
                                intent   { set ::CIE intent }
                                standard { set ::CIE standard }
                            }
                        }
                        "BLUE:"   -
                        "CYAN:"   -
                        "GREEN:"  -
                        "ORANGE:" -
                        "PURPLE:" -
                        "RED:"    -
                        "YELLOW:" -
                        "CUSTOM:" {
                            set accent_color  [string tolower [string range $option 0 end-1]]
                            set color_pattern ""
                            set valid_pattern true

                            switch -- [llength $value] {
                                6   {
                                    foreach color [string tolower $value] {
                                        # Check if color is a valid hexadecimal color.
                                        set longform [::_CHECK_HEX $color HEX8]
                                        switch -- $longform {
                                            INVALID {
                                                # Check if color is a known palette colorname.
                                                set longform [::_CHECK_COLORNAME $color HEX8]
                                                switch -- $longform {
                                                    INVALID {
                                                        set valid_pattern false
                                                        break
                                                    }
                                                }
                                            }
                                        }
                                        append color_pattern $longform " "
                                    }

                                    switch -- $valid_pattern {
                                        true { set ::COLOR_PATTERN($accent_color) $color_pattern }
                                    }
                                }
                            }
                        }
                        "COLORSCHEME:" {
                            switch -nocase -- $value {
                                dark  { set ::COLORSCHEME dark }
                                light { set ::COLORSCHEME light }
                            }
                        }
                        "DEPTH:" {
                            switch -- $value {
                                8   -
                                12  -
                                16  { set ::DEPTH $value }
                            }
                        }
                        "DPI:" {
                            switch -- [string is integer -strict $value] {
                                1   {
                                    if { $value >= 72 } {
                                        set ::DPI $value
                                    }
                                }
                            }
                        }
                        "FOCUS_MODEL:" {
                            switch -nocase -- $value {
                                explicit { set ::FOCUS_MODEL explicit }
                                implicit { set ::FOCUS_MODEL implicit }
                            }
                        }
                        "LANGUAGE:" {
                            set value [string tolower $value]
                            if { $value in $::LANGUAGES } {
                                set ::LANGUAGE $value
                            }
                        }
                        "MONOSPACE_FONT:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lreplace $value end end]]
                            if { $family ni $::FONT_FAMILIES } {
                                continue
                            }

                            set ::FONT(Monospace,family) $family
                            set ::FONT(Monospace,size)   $size

                            _font configure MonospaceFont -family $::FONT(Monospace,family) \
                                                            -size $::FONT(Monospace,size);
                        }
                        "NORMAL_FONT:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lreplace $value end end]]
                            if { $family ni $::FONT_FAMILIES } {
                                continue
                            }

                            set ::FONT(Normal,family) $family
                            set ::FONT(Normal,size)   $size

                            _font configure NormalFont -family $::FONT(Normal,family) \
                                                         -size $::FONT(Normal,size);
                        }
                        "NOTIFICATIONS:" {
                            switch -nocase -- $value {
                                0        -
                                off      -
                                no       -
                                false    -
                                disabled { set ::NOTIFICATIONS disabled }
                                1        -
                                on       -
                                yes      -
                                true     -
                                enabled  { set ::NOTIFICATIONS enabled }
                            }
                        }
                        "POPUPS:" {
                            switch -nocase -- $value {
                                0        -
                                off      -
                                no       -
                                false    -
                                disabled { set ::POPUPS disabled }
                                1        -
                                on       -
                                yes      -
                                true     -
                                enabled  { set ::POPUPS enabled }
                            }
                        }
                        "SCALING:" {
                            set value [string trim $value "%"]
                            switch -- [string is double -strict $value] {
                                1   {
                                    if { ($value >= 25.0) && ($value <= 300.0) } {
                                        set ::SCALING $value
                                    }
                                }
                            }
                        }
                        "SCROLLBAR_ACTION:" {
                            switch -nocase -- $value {
                                jump { set ::SCROLLBAR_ACTION jump }
                                page { set ::SCROLLBAR_ACTION page }
                            }
                        }
                        "SCROLLSPEED:" {
                            switch -- [string is integer -strict $value] {
                                1   {
                                    if { ($value >= 1) && ($value <= 100) } {
                                        set ::SCROLLSPEED $value
                                    }
                                }
                            }
                        }
                        "SMALLEST_FONT:" {
                            set size [lindex $value end]
                            switch -- [string is integer -strict $size] {
                                0   { continue }
                            }

                            set family [string trim [lreplace $value end end]]
                            if { $family ni $::FONT_FAMILIES } {
                                continue
                            }

                            set ::FONT(Smallest,family) $family
                            set ::FONT(Smallest,size)   $size

                            _font configure SmallestFont -family $::FONT(Smallest,family) \
                                                           -size $::FONT(Smallest,size);
                        }
                        "THEME:" {
                            set value [string tolower $value]
                            if { $value in $::THEMES } {
                                set ::THEME $value
                            }
                        }
                        "UNION:" {
                            switch -nocase -- $value {
                                "+"     -
                                "-"     { set ::UNION $value }
                                " "     -
                                "space" { set ::UNION " " }
                            }
                        }
                    }
                }
            }
        }
    }

    # Set the tk scaling.
    set scaleFactor [expr { $::SCALING/100.0 }]
    _tk scaling     [expr { ($::DPI/72.0)*$scaleFactor }]

    # Adjust the scale of every SVG images defined by Mustang.
    foreach svg $::SVGS {
        $::SVG(icon,$svg) configure -format [list svg -scale $scaleFactor]
    }

    # Initialize all the style theme lists.
    set theme_stylenames [list Button \
                               Canvas \
                               Checkbutton \
                               Combobox \
                               Contextmenu \
                               Entry \
                               Frame \
                               Label \
                               Labelframe \
                               Listbox \
                               Menu \
                               Menubutton \
                               Notebook \
                               Palette \
                               Panedwindow \
                               Progressbar \
                               Radiobutton \
                               Scale \
                               Scrollbar \
                               Separator \
                               Sizegrip \
                               Spinbox \
                               Text \
                               Toplevel \
                               Treeview];

    foreach theme $::THEMES {
        set ::STYLES($theme,dev)     $theme_stylenames
        set ::STYLES($theme,mustang) $theme_stylenames
    }

    # Unset the no longer needed '::path' variable.
    # It was defined in the global namespace in order to be used with the apply command.
    unset -nocomplain -- ::path

    # From this moment on, Mustang is officially up and running.
    set ::TEMP(init,state) done
}

#*EOF*