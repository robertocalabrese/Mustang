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

#*EOF*