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
package provide ::ms::treeview 0.1

#######################################
##                                   ##
##     _SIMPLE_TREEVIEW BINDINGS     ##
##                                   ##
#######################################

# ButtonPress-1
_bind _Simple_Treeview <ButtonPress-1>     { ::ms::treeview::ButtonPress %W %x %y; break }
_bind _Simple_Treeview <ButtonRelease-1>   { ::ms::treeview::Release     %W %x %y; break }
_bind _Simple_Treeview <B1-Motion>         { ::ms::treeview::Drag        %W %x %y; break }
_bind _Simple_Treeview <Double-Button-1>   { ::ms::treeview::DoubleClick %W %x %y; break }
_bind _Simple_Treeview <Shift-Button-1>    { ::ms::treeview::Select      %W %x %y extend; break }
_bind _Simple_Treeview <<ToggleSelection>> { ::ms::treeview::Select      %W %x %y toggle; break }

# Motion
_bind _Simple_Treeview <Motion> { ::ms::treeview::Motion %W %x %y; break }

# Contextual menu
_bind _Simple_Treeview <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Configure
_bind _Simple_Treeview <Configure> { ::ms::treeview::Configure %W; break }

# Enter/Leave
_bind _Simple_Treeview <Enter> { ::ms::treeview::Hover %W %x %y; break }
_bind _Simple_Treeview <Leave> { ::ms::treeview::Hover %W %x %y }

# FocusIn/FocusOut
_bind _Simple_Treeview <FocusIn>  { ::ms::treeview::FocusIn  %W; break }
_bind _Simple_Treeview <FocusOut> { ::ms::treeview::FocusOut %W; break }

# Keyboard navigation
_bind _Simple_Treeview <<PrevLine>> { ::ms::treeview::Arrow_Keys %W up; break }
_bind _Simple_Treeview <<NextLine>> { ::ms::treeview::Arrow_Keys %W down; break }
_bind _Simple_Treeview <<NextChar>> { ::ms::treeview::Arrow_Keys %W right; break }
_bind _Simple_Treeview <<PrevChar>> { ::ms::treeview::Arrow_Keys %W left; break }

# Map
_bind _Simple_Treeview <Map> { ::ms::treeview::Map %W; break }

# Page navigation
_bind _Simple_Treeview <<PageDown>>  { ::ms::treeview::Pages %W down; break }
_bind _Simple_Treeview <<PageLeft>>  { ::ms::treeview::Pages %W left; break }
_bind _Simple_Treeview <<PageRight>> { ::ms::treeview::Pages %W right; break }
_bind _Simple_Treeview <<PageUp>>    { ::ms::treeview::Pages %W up; break }

# Return/KP_Enter/space
_bind _Simple_Treeview <KeyPress-Return>   { ::ms::treeview::Return %W; break }
_bind _Simple_Treeview <KeyPress-KP_Enter> { ::ms::treeview::Return %W; break }
_bind _Simple_Treeview <KeyPress-space>    { ::ms::treeview::Return %W; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the treeview object by one unit up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Treeview <MouseWheel> { ::ms::Scroll_Widget_Y %W %D units; break }

# If the widget's horizontal scrollbar is active, move the treeview object by one unit left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Treeview <Shift-MouseWheel> { ::ms::Scroll_Widget_X %W %D units; break }

# If the widget's vertical scrollbar is active, move the treeview object by one page up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Treeview <Control-MouseWheel> { ::ms::Scroll_Widget_Y %W %D pages; break }

# If the widget's horizontal scrollbar is active, move the treeview object by one page left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the treeview object by one unit left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the treeview object by one unit up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Simple_Treeview <TouchpadScroll> { ::ms::Touchpad_Widget %W %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the treeview object by one page left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the treeview object by one page up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Simple_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Widget %W %# %D pages; break }

###########################################
##                                       ##
##     _SCROLLABLE_TREEVIEW BINDINGS     ##
##                                       ##
###########################################

# ButtonPress-1
_bind _Scrollable_Treeview <ButtonPress-1>     { ::ms::treeview::ButtonPress [_winfo parent %W] %x %y; break }
_bind _Scrollable_Treeview <ButtonRelease-1>   { ::ms::treeview::Release     [_winfo parent %W] %x %y; break }
_bind _Scrollable_Treeview <B1-Motion>         { ::ms::treeview::Drag        [_winfo parent %W] %x %y; break }
_bind _Scrollable_Treeview <Double-Button-1>   { ::ms::treeview::DoubleClick [_winfo parent %W] %x %y; break }
_bind _Scrollable_Treeview <Shift-Button-1>    { ::ms::treeview::Select      [_winfo parent %W] %x %y extend; break }
_bind _Scrollable_Treeview <<ToggleSelection>> { ::ms::treeview::Select      [_winfo parent %W] %x %y toggle; break }

# Motion
_bind _Scrollable_Treeview <Motion> { ::ms::treeview::Motion [_winfo parent %W] %x %y; break }

# Contextual menu
_bind _Scrollable_Treeview <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

# Configure
_bind _Scrollable_Treeview <Configure> { ::ms::treeview::Configure [_winfo parent %W]; break }

# Enter/Leave
_bind _Scrollable_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %x %y; break }
_bind _Scrollable_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %x %y }

# FocusIn/FocusOut
_bind _Scrollable_Treeview <FocusIn>  { ::ms::treeview::FocusIn  [_winfo parent %W]; break }
_bind _Scrollable_Treeview <FocusOut> { ::ms::treeview::FocusOut [_winfo parent %W]; break }

# Keyboard navigation
_bind _Scrollable_Treeview <<PrevLine>> { ::ms::treeview::Arrow_Keys [_winfo parent %W] up; break }
_bind _Scrollable_Treeview <<NextLine>> { ::ms::treeview::Arrow_Keys [_winfo parent %W] down; break }
_bind _Scrollable_Treeview <<NextChar>> { ::ms::treeview::Arrow_Keys [_winfo parent %W] right; break }
_bind _Scrollable_Treeview <<PrevChar>> { ::ms::treeview::Arrow_Keys [_winfo parent %W] left; break }

# Map
_bind _Scrollable_Treeview <Map> { ::ms::treeview::Map [_winfo parent %W]; break }

# Page navigation
_bind _Scrollable_Treeview <<PageDown>>  { ::ms::treeview::Pages [_winfo parent %W] down; break }
_bind _Scrollable_Treeview <<PageLeft>>  { ::ms::treeview::Pages [_winfo parent %W] left; break }
_bind _Scrollable_Treeview <<PageRight>> { ::ms::treeview::Pages [_winfo parent %W] right; break }
_bind _Scrollable_Treeview <<PageUp>>    { ::ms::treeview::Pages [_winfo parent %W] up; break }

# Return/KP_Enter/space
_bind _Scrollable_Treeview <KeyPress-Return>   { ::ms::treeview::Return [_winfo parent %W]; break }
_bind _Scrollable_Treeview <KeyPress-KP_Enter> { ::ms::treeview::Return [_winfo parent %W]; break }
_bind _Scrollable_Treeview <KeyPress-space>    { ::ms::treeview::Return [_winfo parent %W]; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the treeview object by one unit up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Treeview <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's horizontal scrollbar is active, move the treeview object by one unit left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Treeview <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the treeview object by one page up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Treeview <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

# If the widget's horizontal scrollbar is active, move the treeview object by one page left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the treeview object by one unit left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the treeview object by one unit up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scrollable_Treeview <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the treeview object by one page left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the treeview object by one page up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scrollable_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }

#####################################
##                                 ##
##     _HULL_TREEVIEW BINDINGS     ##
##                                 ##
#####################################

# Activate/Deactivate
_bind _Hull_Treeview <Activate>   { ::ms::treeview::Pathname_Cmd %W state !background; break }
_bind _Hull_Treeview <Deactivate> { ::ms::treeview::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Hull_Treeview <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Hull_Treeview <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Hull_Treeview <Destroy> { ::ms::treeview::Destroy %W; break }

# Enter/Leave
_bind _Hull_Treeview <Enter> { ::ms::treeview::Hover %W %X %Y; break }
_bind _Hull_Treeview <Leave> { ::ms::treeview::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Hull_Treeview <FocusIn>  { ::ms::treeview::FocusIn  %W; break }
_bind _Hull_Treeview <FocusOut> { ::ms::treeview::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Treeview <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Treeview <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Treeview <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Hull_Treeview <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Hull_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

############################################
##                                        ##
##     _H_SCROLLBAR_TREEVIEW BINDINGS     ##
##                                        ##
############################################

# ButtonPress-1
_bind _H_Scrollbar_Treeview <ButtonPress-1>   { ::ms::treeview::Scrollbar_ButtonPress [_winfo parent %W] horizontal %x %y; break }
_bind _H_Scrollbar_Treeview <B1-Motion>       { ::ms::treeview::Scrollbar_Drag        [_winfo parent %W] horizontal %x %y; break }
_bind _H_Scrollbar_Treeview <ButtonRelease-1> { ::ms::treeview::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _H_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %X %Y; break }
_bind _H_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's horizontal scrollbar is active, move the treeview object by one unit left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _H_Scrollbar_Treeview <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
_bind _H_Scrollbar_Treeview <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# If the widget's horizontal scrollbar is active, move the treeview object by one page left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _H_Scrollbar_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
_bind _H_Scrollbar_Treeview <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the treeview object by one unit left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one units up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _H_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the treeview object by one page left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _H_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D pages; break }

############################################
##                                        ##
##     _V_SCROLLBAR_TREEVIEW BINDINGS     ##
##                                        ##
############################################

# ButtonPress-1
_bind _V_Scrollbar_Treeview <ButtonPress-1>   { ::ms::treeview::Scrollbar_ButtonPress [_winfo parent %W] vertical %x %y; break }
_bind _V_Scrollbar_Treeview <B1-Motion>       { ::ms::treeview::Scrollbar_Drag        [_winfo parent %W] vertical %x %y; break }
_bind _V_Scrollbar_Treeview <ButtonRelease-1> { ::ms::treeview::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _V_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %X %Y; break }
_bind _V_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the treeview object by one unit up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _V_Scrollbar_Treeview <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the treeview object by one page up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _V_Scrollbar_Treeview <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the treeview object by one unit up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _V_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the treeview object by one page up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _V_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D pages; break }

# Create the mustang **treeview** package.
namespace eval ::ms::treeview {}

# Rename the original Tk **ttk::treeview** command.
rename ttk::treeview _ttk_treeview

# Create aliases for the mustang **treeview** command.
interp alias {} treeview      {} ::ms::treeview::Command
interp alias {} ttk::treeview {} ::ms::treeview::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::treeview** widget command.
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
proc ::ms::treeview::Command { window { args "" } } {
    # For the time being we launch the Tk original command with one caveat,
    # the address provided must be a real address.
    # Short addresses are not covered until the new command is written.
    _ttk_treeview $window {*}$args
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
proc ::ms::treeview::Pathname_Cmd { w cmd args } {}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any treeview widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::treeview::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*