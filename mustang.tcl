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
proc ::ms::Init {} {}

####################
##                ##
##     CHECKS     ##
##                ##
####################

#*EOF*