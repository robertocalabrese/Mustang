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
_bind _X_Scrollbar_Treeview <ButtonPress-1>   { ::ms::treeview::Scrollbar_ButtonPress [_winfo parent %W] horizontal %x %y; break }
_bind _X_Scrollbar_Treeview <B1-Motion>       { ::ms::treeview::Scrollbar_Drag        [_winfo parent %W] horizontal %x %y; break }
_bind _X_Scrollbar_Treeview <ButtonRelease-1> { ::ms::treeview::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _X_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %X %Y; break }
_bind _X_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's horizontal scrollbar is active, move the treeview object by one unit left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Scrollbar_Treeview <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
_bind _X_Scrollbar_Treeview <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# If the widget's horizontal scrollbar is active, move the treeview object by one page left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Scrollbar_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
_bind _X_Scrollbar_Treeview <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

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
_bind _X_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D units; break }

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
_bind _X_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D pages; break }

############################################
##                                        ##
##     _V_SCROLLBAR_TREEVIEW BINDINGS     ##
##                                        ##
############################################

# ButtonPress-1
_bind _Y_Scrollbar_Treeview <ButtonPress-1>   { ::ms::treeview::Scrollbar_ButtonPress [_winfo parent %W] vertical %x %y; break }
_bind _Y_Scrollbar_Treeview <B1-Motion>       { ::ms::treeview::Scrollbar_Drag        [_winfo parent %W] vertical %x %y; break }
_bind _Y_Scrollbar_Treeview <ButtonRelease-1> { ::ms::treeview::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _Y_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %X %Y; break }
_bind _Y_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the treeview object by one unit up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Scrollbar_Treeview <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the treeview object by one page up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Scrollbar_Treeview <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

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
_bind _Y_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D units; break }

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
_bind _Y_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D pages; break }

#################################################
##                                             ##
##     _X_FAKE_SCROLLBAR_TREEVIEW BINDINGS     ##
##                                             ##
#################################################

# Activate/Deactivate
_bind _X_Fake_Scrollbar_Treeview <Activate>   { ::ms::treeview::Pathname_Cmd %W state !background; break }
_bind _X_Fake_Scrollbar_Treeview <Deactivate> { ::ms::treeview::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _X_Fake_Scrollbar_Treeview <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _X_Fake_Scrollbar_Treeview <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Enter/Leave
_bind _X_Fake_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover %W %X %Y; break }
_bind _X_Fake_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover %W %X %Y; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Treeview <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Treeview <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Treeview <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _X_Fake_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _X_Fake_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

#################################################
##                                             ##
##     _Y_FAKE_SCROLLBAR_TREEVIEW BINDINGS     ##
##                                             ##
#################################################

# Activate/Deactivate
_bind _Y_Fake_Scrollbar_Treeview <Activate>   { ::ms::treeview::Pathname_Cmd %W state !background; break }
_bind _Y_Fake_Scrollbar_Treeview <Deactivate> { ::ms::treeview::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Y_Fake_Scrollbar_Treeview <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Y_Fake_Scrollbar_Treeview <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Enter/Leave
_bind _Y_Fake_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover %W %X %Y; break }
_bind _Y_Fake_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover %W %X %Y; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Treeview <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Treeview <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Treeview <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Y_Fake_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Y_Fake_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **treeview** package.
namespace eval ::ms::treeview {
    # Set the 'non-styleable' treeview option list.
    set ::ms::treeview(non_styleable,options) [list class \
                                                    cmenu \
                                                    columns \
                                                    displaycolumns \
                                                    scrollable \
                                                    selectmode \
                                                    selecttype \
                                                    show \
                                                    state \
                                                    striped \
                                                    style \
                                                    takefocus \
                                                    titlecolumns \
                                                    titleitems \
                                                    xscrollcommand \
                                                    yscrollcommand];

    # Set the 'styleable' treeview option list.
    set ::ms::treeview(styleable,options) [list background \
                                                bordercolor \
                                                borderwidth \
                                                columnseparatorwidth \
                                                cursor \
                                                darkcolor \
                                                fieldbackground \
                                                focuscolor \
                                                focuswidth \
                                                font \
                                                foreground \
                                                indent \
                                                lightcolor \
                                                padding \
                                                rowheight \
                                                rows \
                                                shellbackground \
                                                stripedbackground];

    # Set the default 'non-styleable' treeview options values.
    set ::ms::default(treeview,class)          Treeview
    set ::ms::default(treeview,cmenu)          {}
    set ::ms::default(treeview,columns)        {}
    set ::ms::default(treeview,displaycolumns) [list #all]
    set ::ms::default(treeview,scrollable)     false
    set ::ms::default(treeview,selectmode)     extended
    set ::ms::default(treeview,selecttype)     item
    set ::ms::default(treeview,show)           [list tree headings]
    set ::ms::default(treeview,state)          normal
    set ::ms::default(treeview,striped)        1
    set ::ms::default(treeview,style)          Treeview
    set ::ms::default(treeview,takefocus)      0
    set ::ms::default(treeview,titlecolumns)   0
    set ::ms::default(treeview,titleitems)     0
    set ::ms::default(treeview,xscrollcommand) {}
    set ::ms::default(treeview,yscrollcommand) {}

    # Note: The default 'styleable' treeview options values are always defined inside the current theme.
}

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
            set ::ms::default($w,class)          $::ms::default(treeview,class)
            set ::ms::default($w,cmenu)          $::ms::default(treeview,cmenu)
            set ::ms::default($w,columns)        $::ms::default(treeview,columns)
            set ::ms::default($w,displaycolumns) $::ms::default(treeview,displaycolumns)
            set ::ms::default($w,selectmode)     $::ms::default(treeview,selectmode)
            set ::ms::default($w,selecttype)     $::ms::default(treeview,selecttype)
            set ::ms::default($w,show)           $::ms::default(treeview,show)
            set ::ms::default($w,state)          $::ms::default(treeview,state)
            set ::ms::default($w,striped)        $::ms::default(treeview,striped)
            set ::ms::default($w,style)          $::ms::default(treeview,style)
            set ::ms::default($w,takefocus)      $::ms::default(treeview,takefocus)
            set ::ms::default($w,titlecolumns)   $::ms::default(treeview,titlecolumns)
            set ::ms::default($w,titleitems)     $::ms::default(treeview,titleitems)
            set ::ms::default($w,xscrollcommand) $::ms::default(treeview,xscrollcommand)
            set ::ms::default($w,yscrollcommand) $::ms::default(treeview,yscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)          $::ms::default(treeview,class)
            set ::ms::current($w,cmenu)          $::ms::default(treeview,cmenu)
            set ::ms::current($w,columns)        $::ms::default(treeview,columns)
            set ::ms::current($w,displaycolumns) $::ms::default(treeview,displaycolumns)
            set ::ms::current($w,selectmode)     $::ms::default(treeview,selectmode)
            set ::ms::current($w,selecttype)     $::ms::default(treeview,selecttype)
            set ::ms::current($w,show)           $::ms::default(treeview,show)
            set ::ms::current($w,state)          $::ms::default(treeview,state)
            set ::ms::current($w,striped)        $::ms::default(treeview,striped)
            set ::ms::current($w,style)          $::ms::default(treeview,style)
            set ::ms::current($w,takefocus)      $::ms::default(treeview,takefocus)
            set ::ms::current($w,titlecolumns)   $::ms::default(treeview,titlecolumns)
            set ::ms::current($w,titleitems)     $::ms::default(treeview,titleitems)
            set ::ms::current($w,xscrollcommand) $::ms::default(treeview,xscrollcommand)
            set ::ms::current($w,yscrollcommand) $::ms::default(treeview,yscrollcommand)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) treeview
            set ::ms::data($w,scrollx)   off
            set ::ms::data($w,scrolly)   off

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
            #       To make a treeview styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **treeview** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)           Tk
            set ::ms::managed_by($w,bordercolor)          Tk
            set ::ms::managed_by($w,borderwidth)          Tk
            set ::ms::managed_by($w,columnseparatorwidth) Tk
            set ::ms::managed_by($w,cursor)               Tk
            set ::ms::managed_by($w,darkcolor)            Tk
            set ::ms::managed_by($w,fieldbackground)      Tk
            set ::ms::managed_by($w,focuscolor)           Tk
            set ::ms::managed_by($w,focuswidth)           Tk
            set ::ms::managed_by($w,font)                 Tk
            set ::ms::managed_by($w,foreground)           Tk
            set ::ms::managed_by($w,indent)               Tk
            set ::ms::managed_by($w,lightcolor)           Tk
            set ::ms::managed_by($w,rowheight)            Tk
            set ::ms::managed_by($w,rows)                 Tk
            set ::ms::managed_by($w,padding)              Tk
            set ::ms::managed_by($w,shellbackground)      Tk
            set ::ms::managed_by($w,stripedbackground)    Tk

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
                        }

                        set ::ms::current($w,borderwidth)    $value
                        set ::ms::managed_by($w,borderwidth) developer
                    }
                    -columnseparatorwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,columnseparatorwidth)    $value
                        set ::ms::managed_by($w,columnseparatorwidth) developer
                    }
                    -class { set ::ms::current($w,class) $value }
                    -cmenu {
                        set value [string trim $value]
                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                            set ::ms::current($w,cmenu) $value
                        }
                    }
                    -columns { set ::ms::current($w,columns) [list {*}$value] }
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
                    -displaycolumns {
                        switch -nocase -- $value {
                            "#all"  { set ::ms::current($w,displaycolumns) "#all" }
                            default { set ::ms::current($w,displaycolumns) [list {*}$value] }
                        }
                    }
                    -fieldbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,fieldbackground)    $value
                        set ::ms::managed_by($w,fieldbackground) developer
                    }
                    -focuscolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,focuscolor)    $value
                        set ::ms::managed_by($w,focuscolor) developer
                    }
                    -focuswidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,focuswidth)    $value
                        set ::ms::managed_by($w,focuswidth) developer
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
                    -indent {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,indent)    $value
                        set ::ms::managed_by($w,indent) developer
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
                    -rowheight {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,rowheight)    $value
                        set ::ms::managed_by($w,rowheight) developer
                    }
                    -rows {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,rows)    $value
                                    set ::ms::managed_by($w,rows) developer
                                }
                            }
                        }
                    }
                    -selectmode {
                        set value [string tolower $value]
                        switch -- $value {
                            extended -
                            browse   -
                            none     { set ::ms::current($w,selectmode) $value }
                        }
                    }
                    -selecttype {
                        set value [string tolower $value]
                        switch -- $value {
                            item -
                            cell { set ::ms::current($w,selecttype) $value }
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
                    -show {
                        switch -- [llength $value] {
                            0   { set ::ms::current($w,show) [list ] }
                            1   -
                            2   {
                                switch -nocase -- $value {
                                    tree            { set ::ms::current($w,show) [list tree] }
                                    headings        { set ::ms::current($w,show) [list headings] }
                                    "tree headings" -
                                    "headings tree" { set ::ms::current($w,show) [list tree headings] }
                                }
                            }
                        }
                    }
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            disabled -
                            normal   { set ::ms::current($w,state) $value }
                        }
                    }
                    -striped {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,striped) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,striped) 1 }
                        }
                    }
                    -stripedbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,stripedbackground)    $value
                        set ::ms::managed_by($w,stripedbackground) developer
                    }
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
                    -titlecolumns {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > -1 } {
                                    set ::ms::current($w,titlecolumns) $value
                                }
                            }
                        }
                    }
                    -titleitems {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > -1 } {
                                    set ::ms::current($w,titleitems) $value
                                }
                            }
                        }
                    }
                    -xscrollcommand {
                        switch -- [llength $value] {
                            2   { set ::ms::current($w,xscrollcommand) $value }
                        }
                    }
                    -yscrollcommand {
                        switch -- [llength $value] {
                            2   { set ::ms::current($w,yscrollcommand) $value }
                        }
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::treeview(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Treeview,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            # Check the widget state and set the takefocus and cursor accordingly.
            switch -- $::ms::current($w,state) {
                disabled {
                    set cursor    arrow
                    set takefocus 0
                }
                normal {
                    set cursor    $::ms::current($w,cursor)
                    set takefocus $::ms::current($w,takefocus)
                }
            }

            # Check if the style provided is a parent of 'Treeview'.
            set index [string last "." $::ms::current($w,style)]
            switch -- $index {
                -1      { set parent_style ".Treeview" }
                default {
                    switch -- [string range $::ms::current($w,style) $index+1 end] {
                        Treeview { set parent_style "" }
                        default  { set parent_style ".Treeview"}
                    }
                }
            }

            #############################
            ##                         ##
            ##     CREATE THE WIDGET   ##
            ##                         ##
            #############################

            # Note: 'borderwidth', 'columnseparatorwidth', 'cursor', 'focuswidth', 'font', 'indent', 'justify',
            #       'padding' and 'rowheight' are not allowed to change if the statespec changes.

            ###################################
            ##                               ##
            ##     HEADING STYLE OPTIONS     ##
            ##                               ##
            ###################################

            set treeview_heading_style [string cat $::ms::current($w,style) $parent_style ".Heading"]

            # Check if a layout exists for '::ms::current($w,style).Heading'.
            # If not, create one by mirroring the 'Heading' layout for the current theme.
            if { $treeview_heading_style ni $::ms::layouts($::ms::theme) } {
                _ttk_style layout $treeview_heading_style [_ttk_style layout Heading]
            }

            # background
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_heading_style,background)] {
                0   { _ttk_style configure $treeview_heading_style -background $::ms::styleopt($::ms::theme,Heading,background) }
            }

            # font
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_heading_style,font)] {
                0   { _ttk_style configure $treeview_heading_style -font $::ms::styleopt($::ms::theme,Heading,font) }
            }

            # relief
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_heading_style,relief)] {
                0   { _ttk_style configure $treeview_heading_style -relief $::ms::styleopt($::ms::theme,Heading,relief) }
            }

            #####################################
            ##                                 ##
            ##     SEPARATOR STYLE OPTIONS     ##
            ##                                 ##
            #####################################

            set treeview_separator_style [string cat $::ms::current($w,style) $parent_style ".Separator"]

            # Check if a layout exists for '::ms::current($w,style).Separator'.
            # If not, create one by mirroring the 'Separator' layout for the current theme.
            if { $treeview_separator_style ni $::ms::layouts($::ms::theme) } {
                _ttk_style layout $treeview_separator_style [_ttk_style layout Separator]
            }

            # background
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_separator_style,background)] {
                0   { _ttk_style configure $treeview_separator_style -background $::ms::styleopt($::ms::theme,Treeview.Separator,background) }
            }

            # Note: The 'Item', 'Cell' and 'Row' style options are here for completeness but it seems than Tk
            #       doesn't look for them internally and they always be like the ones defined in the theme.

            ################################
            ##                            ##
            ##     ITEM STYLE OPTIONS     ##
            ##                            ##
            ################################

            set treeview_item_style [string cat $::ms::current($w,style) $parent_style ".Item"]

            # Check if a layout exists for '::ms::current($w,style).Item'.
            # If not, create one by mirroring the 'Item' layout for the current theme.
            if { $treeview_item_style ni $::ms::layouts($::ms::theme) } {
                _ttk_style layout $treeview_item_style [_ttk_style layout Item]
            }

            # foreground
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_item_style,foreground)] {
                0   { _ttk_style configure $treeview_item_style -foreground $::ms::styleopt($::ms::theme,Item,foreground) }
            }

            # indicatormargins
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_item_style,indicatormargins)] {
                0   { _ttk_style configure $treeview_item_style -indicatormargins $::ms::styleopt($::ms::theme,Item,indicatormargins) }
            }

            # indicatorsize
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_item_style,indicatorsize)] {
                0   { _ttk_style configure $treeview_item_style -indicatorsize $::ms::styleopt($::ms::theme,Item,indicatorsize) }
            }

            # padding
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_item_style,padding)] {
                0   { _ttk_style configure $treeview_item_style -padding $::ms::styleopt($::ms::theme,Item,padding) }
            }

            ################################
            ##                            ##
            ##     CELL STYLE OPTIONS     ##
            ##                            ##
            ################################

            set treeview_cell_style [string cat $::ms::current($w,style) $parent_style ".Cell"]

            # Check if a layout exists for '::ms::current($w,style).Cell'.
            # If not, create one by mirroring the 'Cell' layout for the current theme.
            if { $treeview_cell_style ni $::ms::layouts($::ms::theme) } {
                _ttk_style layout $treeview_cell_style [_ttk_style layout Cell]
            }

            # padding
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_cell_style,padding)] {
                0   { _ttk_style configure $treeview_cell_style -padding $::ms::styleopt($::ms::theme,Cell,padding) }
            }

            ###############################
            ##                           ##
            ##     ROW STYLE OPTIONS     ##
            ##                           ##
            ###############################

            set treeview_row_style [string cat $::ms::current($w,style) $parent_style ".Row"]

            # Check if a layout exists for '::ms::current($w,style).Row'.
            # If not, create one by mirroring the 'Row' layout for the current theme.
            if { $treeview_row_style ni $::ms::layouts($::ms::theme) } {
                _ttk_style layout $treeview_row_style [_ttk_style layout Row]
            }

            # background
            switch -- [info exists ::ms::styleopt($::ms::theme,$treeview_row_style,background)] {
                0   { _ttk_style configure $treeview_row_style -background $::ms::styleopt($::ms::theme,Row,background) }
            }

            ####################################
            ##                                ##
            ##     TREEVIEW STYLE OPTIONS     ##
            ##                                ##
            ####################################

            # Set the treeview object style name.
            set ::ms::style($w,treeview) [string cat "_bg="  $::ms::current($w,background) \
                                                     "_bc="  $::ms::current($w,bordercolor) \
                                                     "_csw=" $::ms::current($w,columnseparatorwidth) \
                                                     "_dc="  $::ms::current($w,darkcolor) \
                                                     "_fb="  $::ms::current($w,fieldbackground) \
                                                     "_fc="  $::ms::current($w,focuscolor) \
                                                     "_fg="  $::ms::current($w,foreground) \
                                                     "_fw="  $::ms::current($w,focuswidth) \
                                                     "_fn="  $::ms::current($w,font) \
                                                     "_in="  $::ms::current($w,indent) \
                                                     "_lc="  $::ms::current($w,lightcolor) \
                                                     "_rh="  $::ms::current($w,rowheight) \
                                                     "_stb=" $::ms::current($w,stripedbackground) \
                                                     "." $::ms::current($w,style) $parent_style];

            # If needed, create the treeview object style name.
            if { $::ms::style($w,treeview) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,treeview) -background $::ms::current($w,background)

                # Add the treeview object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,treeview)
            }

            # Initialize the treeview object mapping.
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

            # fieldbackground
            switch -- $::ms::managed_by($w,fieldbackground) {
                developer { lappend mapping -fieldbackground [list pressed $::ms::current($w,fieldbackground)] }
                Tk  {
                    # Check if a 'fieldbackground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),fieldbackground)] {
                        1   { lappend mapping -fieldbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),fieldbackground) }
                    }
                }
            }

            # focuscolor
            switch -- $::ms::managed_by($w,focuscolor) {
                developer { lappend mapping -focuscolor [list pressed $::ms::current($w,focuscolor)] }
                Tk  {
                    # Check if a 'focuscolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),focuscolor)] {
                        1   { lappend mapping -focuscolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),focuscolor) }
                    }
                }
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
            switch -- $::ms::managed_by($w,lightcolor) {
                developer { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
                Tk  {
                    # Check if a 'lightcolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor)] {
                        1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor) }
                    }
                }
            }

            # stripedbackground
            switch -- $::ms::managed_by($w,stripedbackground) {
                developer { lappend mapping -stripedbackground [list pressed $::ms::current($w,stripedbackground)] }
                Tk  {
                    # Check if a 'stripedbackground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),stripedbackground)] {
                        1   { lappend mapping -stripedbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),stripedbackground) }
                    }
                }
            }

            # If needed, create the treeview object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,treeview) {*}$mapping

                # Add the treeview object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Set the treeview options.
            set treeview_options [list        -columns $::ms::current($w,columns) \
                                               -cursor $cursor \
                                       -displaycolumns $::ms::current($w,displaycolumns) \
                                               -height $::ms::current($w,rows) \
                                              -padding $::ms::current($w,padding) \
                                           -selectmode $::ms::current($w,selectmode) \
                                           -selecttype $::ms::current($w,selecttype) \
                                                 -show $::ms::current($w,show) \
                                              -striped $::ms::current($w,striped) \
                                                -style $::ms::style($w,treeview) \
                                            -takefocus $takefocus \
                                         -titlecolumns $::ms::current($w,titlecolumns) \
                                           -titleitems $::ms::current($w,titleitems)];

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false {
                    ###########################
                    ##                       ##
                    ##     SIMPLE TREEVIEW   ##
                    ##                       ##
                    ###########################

                    ######################
                    ##                  ##
                    ##     TREEVIEW     ##
                    ##                  ##
                    ######################

                    # Add the internal 'xscrollcommand' and 'yscrollcommand' data.
                    lappend treeview_options -xscrollcommand $::ms::current($w,xscrollcommand) \
                                             -yscrollcommand $::ms::current($w,yscrollcommand);

                    # Create the widget.
                    _ttk_treeview $w {*}$treeview_options

                    # Note: The Tk treeview widget don't have a '-state' option.
                    #       We need to simulate it graphically.
                    switch -- $::ms::current($w,state) {
                        disabled {
                            # Change the widget dynamic state to 'disabled'.
                            $w state disabled
                        }
                        normal {
                            # Change the widget dynamic state to '!disabled'.
                            $w state !disabled
                        }
                    }

                    # Set the widget toplevel.
                    set ::ms::addr($w,toplevel) [_winfo toplevel $w]

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        Treeview { _bindtags $w [list $w _Simple_Treeview Treeview $::ms::addr($w,toplevel) all] }
                        default  { _bindtags $w [list $w $::ms::current($w,class) _Simple_Treeview Treeview $::ms::addr($w,toplevel) all] }
                    }

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses relative to its real address, 'w'.
                    set ::ms::addr($w,short) $short_addr

                    # Add the widget real and short address into the list of all available real
                    # and short addresses.
                    lappend ::ms::addr(reals)  $w
                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w]
                }
                true {
                    ###############################
                    ##                           ##
                    ##     SCROLLABLE TREEVIEW   ##
                    ##                           ##
                    ###############################

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

                    ######################
                    ##                  ##
                    ##     TREEVIEW     ##
                    ##                  ##
                    ######################

                    # Set the current 'xscrollcommand' and 'yscrollcommand' to the empty string.
                    set ::ms::current($w,xscrollcommand) {}
                    set ::ms::current($w,yscrollcommand) {}

                    # Add the internal 'xscrollcommand' and 'yscrollcommand' data.
                    lappend treeview_options -xscrollcommand [list $w.x set] \
                                             -yscrollcommand [list $w.y set];

                    # Create the treeview object.
                    _ttk_treeview $w.treeview {*}$treeview_options

                    # Grid the treeview object.
                    _grid $w.treeview -column 0 \
                                        -padx 0 \
                                        -pady 0 \
                                         -row 0 \
                                      -sticky nesw;

                    # Note: The Tk treeview widget don't have a '-state' option.
                    #       We need to simulate it graphically.
                    switch -- $::ms::current($w,state) {
                        disabled {
                            # Change the widget dynamic state to 'disabled'.
                            $w.treeview state disabled
                        }
                        normal {
                            # Change the widget dynamic state to '!disabled'.
                            $w.treeview state !disabled
                        }
                    }

                    ########################
                    ##                    ##
                    ##     SCROLLBARS     ##
                    ##                    ##
                    ########################

                    # Create the horizontal scrollbar.
                    _ttk_scrollbar $w.x     -class TScrollbar \
                                          -command [list $w.treeview xview] \
                                           -cursor arrow \
                                           -orient horizontal \
                                            -style TScrollbar \
                                        -takefocus 0;

                    # Create the vertical scrollbar.
                    _ttk_scrollbar $w.y     -class TScrollbar \
                                          -command [list $w.treeview yview] \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

                    # Create the fake horizontal scrollbar.
                    _ttk_frame $w.fake_x -borderwidth 0 \
                                               -class TFrame \
                                              -cursor arrow \
                                              -height $::ms::size($::ms::theme,scrollbar) \
                                             -padding 0 \
                                              -relief flat \
                                               -style $::ms::style($w,hull) \
                                           -takefocus 0 \
                                               -width 0;

                    # Create the fake vertical scrollbar.
                    _ttk_frame $w.fake_y -borderwidth 0 \
                                               -class TFrame \
                                              -cursor arrow \
                                              -height 0 \
                                             -padding 0 \
                                              -relief flat \
                                               -style $::ms::style($w,hull) \
                                           -takefocus 0 \
                                               -width $::ms::size($::ms::theme,scrollbar);

                    # Grid the fake scrollbars.
                    _grid $w.fake_x -column 0 \
                                      -padx [list 0  0] \
                                      -pady [list 8p 0] \
                                       -row 1 \
                                    -sticky we;

                    _grid $w.fake_y -column 1 \
                                      -padx [list 8p 0] \
                                      -pady [list 0  0] \
                                       -row 0 \
                                    -sticky ns;

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the hull object.
                    _bindtags $w [list $w _Hull_Treeview TFrame $::ms::addr($w,toplevel) all]

                    # Set the new bindtags for the treeview object.
                    switch -- $::ms::current($w,class) {
                        Treeview { _bindtags $w.treeview [list $w.treeview _Scrollable_Treeview Treeview $::ms::addr($w,toplevel) all] }
                        default  { _bindtags $w.treeview [list $w.treeview $::ms::current($w,class) _Scrollable_Treeview Treeview $::ms::addr($w,toplevel) all] }
                    }

                    # Set the new bindtags for the horizontal and vertical scrollbar objects.
                    _bindtags $w.x [list $w.x _H_Scrollbar_Treeview TScrollbar $::ms::addr($w,toplevel) all]
                    _bindtags $w.y [list $w.y _H_Scrollbar_Treeview TScrollbar $::ms::addr($w,toplevel) all]

                    # Set the new bindtags for the fake horizontal and vertical scrollbar objects.
                    _bindtags $w.fake_x [list $w.fake_x _X_Fake_Scrollbar_Treeview TFrame $::ms::addr($w,toplevel) all]
                    _bindtags $w.fake_y [list $w.fake_y _Y_Fake_Scrollbar_Treeview TFrame $::ms::addr($w,toplevel) all]

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Configure the internal widget rows and columns.
                    _grid rowconfigure    $w [list 0] -weight 1
                    _grid columnconfigure $w [list 0] -weight 1

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses relative to its real address, 'w'.
                    # They will all point to the widget hull object short address.
                    set ::ms::addr($w,short)          $short_addr
                    set ::ms::addr($w.treeview,short) $short_addr
                    set ::ms::addr($w.x,short)        $short_addr
                    set ::ms::addr($w.y,short)        $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.treeview \
                                              $w.x \
                                              $w.y;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.treeview

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.treeview

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.treeview];

                    # Add the widget address to the megawidget addresses list.
                    lappend ::ms::addr(megawidgets) $w

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
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::treeview::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::treeview::Pathname_Cmd $w]
            }

            # Add the widget address to the treeview widgets real address list.
            lappend ::ms::addr(treeview) $w

            # Add the widget address to the treeview classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),treeview,addrs) $w

            # Add the widget address to the treeview classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),treeview,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the treeview classtype.
            if { $::ms::current($w,style) ni $::ms::style(treeview,classtype) } {
                lappend ::ms::style(treeview,classtype) $::ms::current($w,style)
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
proc ::ms::treeview::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        bbox     -
        detached -
        drag     -
        drop     -
        exists   -
        index    -
        move     -
        next     -
        parent   -
        prev     -
        tag      {}
        cellselection {
            # Synopsis:
            #
            # *window* **cellselection** ?*selop* *arg* ...?
            #    *window* **cellselection** **set* *cellList*
            #    *window* **cellselection** **set* *firstCell* *lastCell*
            #    *window* **cellselection** **add* *cellList*
            #    *window* **cellselection** **add* *firstCell* *lastCell*
            #    *window* **cellselection** **remove* *cellList*
            #    *window* **cellselection** **remove* *firstCell* *lastCell*
            #    *window* **cellselection** **toggle* *cellList*
            #    *window* **cellselection** **toggle* *firstCell* *lastCell*

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.treeview] }
            }

            switch -- [llength $args] {
                2   {
                    set subcommand [lindex $args 0]
                    set cellList   [lindex $args 1]

                    # Check the subcommand.
                    switch -- $subcommand {
                        add    -
                        remove -
                        set    -
                        toggle {
                            try {
                                {*}$address cellselection $subcommand $cellList
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default { ::ms::Error "Invalid cellselection command, '$subcommand'." $caller_info }
                    }
                }
                3   {
                    set subcommand [lindex $args 0]
                    set firstCell  [lindex $args 1]
                    set lastCell   [lindex $args 2]

                    # Check the subcommand.
                    switch -- $subcommand {
                        add    -
                        remove -
                        set    -
                        toggle {
                            try {
                                {*}$address cellselection $subcommand $firstCell $lastCell
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default { ::ms::Error "Invalid cellselection command, '$subcommand'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
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
                    set option [string range $args 1 end]
                    if { ($option in $::ms::treeview(non_styleable,options)) || ($option in $::ms::treeview(styleable,options))} {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid option, '$args'." $caller_info }
            }
        }
        children -
        column   -
        delete   -
        detach   -
        heading  -
        insert   -
        item     -
        see      -
        set      {}
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
                    foreach option $::ms::treeview(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::treeview(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::treeview(non_styleable,options)) || ($option in $::ms::treeview(styleable,options)) } {
                        return [list $::ms::default($w,$option) $::ms::current($w,$option)]
                    } else {
                        ::ms::Error "Invalid configure option, '$args'." $caller_info
                    }
                }
                default {}
            }
        }
        focus {
            # Synopsis:
            #
            # *window* **focus** ?*item*?

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.treeview] }
            }

            switch -- [llength $args] {
                0   { return [{*}$address focus] }
                1   {
                    set item $args

                    # Execute the command.
                    try {
                        {*}$address focus $item
                    } on error {} {
                        ::ms::Error "Invalid item, '$item'." $caller_info
                    } on ok { result } {
                        # Check the selection type.
                        switch -- $::ms::current($w,selecttype) {
                            item { ::ms::treeview::Select_Op $w $item "" choose }
                            cell {
                                # Select the first available column, either the tree column (#0) or '#1'.
                                if { "tree" in $::ms::current($w,show) } {
                                    ::ms::treeview::Select_Op $w $item [list $item #0] choose
                                } else {
                                    ::ms::treeview::Select_Op $w $item [list $item #1] choose
                                }
                            }
                        }

                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        identify {
            # Synopsis:
            #
            # *window* **identify** **cell**    *x* *y*
            # *window* **identify** **column**  *x* *y*
            # *window* **identify** **element** *x* *y*
            # *window* **identify** **item**    *x* *y*
            # *window* **identify** **region**  *x* *y*
            # *window* **identify** **row**     *x* *y*

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.treeview] }
            }

            switch -- [llength $args] {
                3   {
                    # Check that the first argument of 'args' is the word "element".
                    set subcommand [lindex $args 0]
                    switch -- $subcommand {
                        cell    -
                        column  -
                        element -
                        item    -
                        region  -
                        row     {}
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

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            # Execute the command.
                            try {
                                {*}$address identify $subcommand $x $y
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                switch -- $subcommand {
                                    region  { return [string cat "Treeview." $result] }
                                    element {
                                        switch -glob -- $result {
                                            *indicator  { return "Treeview.indicator" }
                                            *disclosure { return "Treeview.disclosure" }
                                            *text       { return "Treeview.text" }
                                            *padding    { return "Treeview.padding" }
                                            default     { return "" }
                                        }
                                    }
                                    default { return $result }
                                }
                            }
                        }
                        true {
                            # Get the root coordinates of the north-west corner of the container ('$w').
                            set rootx [_winfo rootx $w]
                            set rooty [_winfo rooty $w]

                            # Transform the relative coordinates provided into root coordinates.
                            set X [expr { $rootx+$x }]
                            set Y [expr { $rooty+$y }]

                            # Get the widget address containing the point given by the root coordinates calculated.
                            set widget [_winfo containing -display $w $X $Y]

                            # Check the 'subcommand'.
                            switch -- $subcommand {
                                element {
                                    if { $widget eq $w } {
                                        return "Treeview.hull"
                                    } elseif { $widget eq "$w.treeview" } {
                                        try {
                                            {*}$address identify element $x $y
                                        } on error { errortext errorcode } {
                                            ::ms::Error "$errortext" $caller_info
                                        } on ok { result } {
                                            switch -glob -- $result {
                                                *indicator  { return "Treeview.indicator" }
                                                *disclosure { return "Treeview.disclosure" }
                                                *text       { return "Treeview.text" }
                                                *padding    { return "Treeview.padding" }
                                                default     { return "" }
                                            }
                                        }
                                    } elseif { $widget eq "$w.x" } {
                                        return "Treeview.hscrollbar"
                                    } elseif { $widget eq "$w.y" } {
                                        return "Treeview.vscrollbar"
                                    } else {
                                        return ""
                                    }
                                }
                                region {
                                    if { $widget eq "$w.treeview" } {
                                        # Execute the command.
                                        try {
                                            {*}$address identify region $x $y
                                        } on error { errortext errorcode } {
                                            ::ms::Error "$errortext" $caller_info
                                        } on ok { result } {
                                            return [string cat "Treeview." $result]
                                        }
                                    } else {
                                        return ""
                                    }
                                }
                                default {
                                    if { $widget eq "$w.treeview" } {
                                        # Execute the command.
                                        try {
                                            {*}$address identify $subcommand $x $y
                                        } on error { errortext errorcode } {
                                            ::ms::Error "$errortext" $caller_info
                                        } on ok { result } {
                                            return $result
                                        }
                                    } else {
                                        return ""
                                    }
                                }
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

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.treeview] }
            }

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
                    return [{*}$address instate $statespec]
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
                        {*}$address instate $statespec $script
                    } on error {} {
                        ::ms::Error "Invalid script." $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        selection {
            # Synopsis:
            #
            # *window* **selection** ?*selop* *itemList*?
            #    *window* **selection** **set** *itemList*
            #    *window* **selection** **add** *itemList*
            #    *window* **selection** **remove** *itemList*
            #    *window* **selection** **toggle** *itemList*

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.treeview] }
            }

            switch -- [llength $args] {
                2   {
                    set subcommand [lindex $args 0]
                    set itemList   [lindex $args 1]

                    # Check the subcommand.
                    switch -- $subcommand {
                        add    -
                        remove -
                        set    -
                        toggle {
                            # Execute the command.
                            try {
                                {*}$address selection $subcommand $itemList
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        default { ::ms::Error "Invalid cellselection command, '$subcommand'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        state {
            # Synopsis:
            #
            # *window* **state** ?*statespec*?

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.treeview] }
            }

            switch -- [llength $args] {
                0   { return [{*}$address state] }
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

                    #####################################
                    ##                                 ##
                    ##     UPDATE THE WIDGET STATE     ##
                    ##                                 ##
                    #####################################

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { return [interp invokehidden {} $w state $statespec] }
                        true  {
                            interp invokehidden {} $w state $statespec
                            return [$w.treeview state $statespec]
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
            set subcommand [lindex  $args 0]
            set args       [lremove $args 0]

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  {
                    # Check if the widget has an active horizontal scrollbar.
                    switch -- $::ms::data($w,scrollx) {
                        off { return "" }
                        on  { set address [list $w.treeview] }
                    }
                }
            }

            # Check the subcommand.
            switch -nocase -- $subcommand {
                ""  {
                    # Execute the command.
                    try {
                        {*}$address xview
                    } on error {} {
                        return ""
                    } on ok { result } {
                        return $result
                    }
                }
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

                    # Execute the command.
                    try {
                        {*}$address xview moveto $fraction
                    } on error {} {
                        # Do nothing.
                    }

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
                        pages   { set what "pages" }
                        units   { set what "units" }
                        default { return "" }
                    }

                    # Execute the command.
                    try {
                        {*}$address xview scroll $number $what
                    } on error {} {
                        # Do nothing.
                    }

                    return ""
                }
                default { ::ms::Error "Invalid xview option, '$subcommand'." $caller_info }
            }
        }
        yview {
            # Synopsis:
            #
            # *window* **yview**
            # *window* **yview** **moveto** *fraction*
            # *window* **yview** **scroll** *number* *what*
            set subcommand [lindex  $args 0]
            set args       [lremove $args 0]

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  {
                    # Check if the widget has an active vertical scrollbar.
                    switch -- $::ms::data($w,scrolly) {
                        off { return "" }
                        on  { set address [list $w.treeview] }
                    }
                }
            }

            # Check the subcommand.
            switch -nocase -- $subcommand {
                ""  {
                    # Execute the command.
                    try {
                        {*}$address yview
                    } on error {} {
                        return ""
                    } on ok { result } {
                        return $result
                    }
                }
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

                    # Execute the command.
                    try {
                        {*}$address yview moveto $fraction
                    } on error {} {
                        # Do nothing.
                    }

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
                        pages   { set what "pages" }
                        units   { set what "units" }
                        default { return "" }
                    }

                    # Execute the command.
                    try {
                        {*}$address yview scroll $number $what
                    } on error {} {
                        # Do nothing.
                    }

                    return ""
                }
                default { ::ms::Error "Invalid yview option, '$subcommand'." $caller_info }
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