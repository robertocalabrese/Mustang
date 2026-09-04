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
_bind _Simple_Treeview <ButtonPress-1>     { ::ms::treeview::ButtonPress   %W %x %y; break }
_bind _Simple_Treeview <ButtonRelease-1>   { ::ms::treeview::ButtonRelease %W %x %y; break }
_bind _Simple_Treeview <B1-Motion>         { ::ms::treeview::Drag          %W %x %y; break }
_bind _Simple_Treeview <Double-Button-1>   { ::ms::treeview::Double_Click  %W %x %y; break }
_bind _Simple_Treeview <Shift-Button-1>    { ::ms::treeview::Select        %W %x %y extend; break }
_bind _Simple_Treeview <<ToggleSelection>> { ::ms::treeview::Select        %W %x %y toggle; break }

# Motion
_bind _Simple_Treeview <Motion> { ::ms::treeview::Motion %W %x %y; break }

# Contextual menu
_bind _Simple_Treeview <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Configure
_bind _Simple_Treeview <Configure> { ::ms::treeview::Configure %W; break }

# Enter/Leave
_bind _Simple_Treeview <Enter> { ::ms::treeview::Hover %W %x %y ""; break }
_bind _Simple_Treeview <Leave> { ::ms::treeview::Hover %W %x %y ""; break }

# FocusIn/FocusOut
_bind _Simple_Treeview <FocusIn>  { interp invokehidden {} %W state [list focus]; break }
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
_bind _Scrollable_Treeview <ButtonPress-1>     { ::ms::treeview::ButtonPress   [_winfo parent %W] %x %y; break }
_bind _Scrollable_Treeview <ButtonRelease-1>   { ::ms::treeview::ButtonRelease [_winfo parent %W] %x %y; break }
_bind _Scrollable_Treeview <B1-Motion>         { ::ms::treeview::Drag          [_winfo parent %W] %x %y; break }
_bind _Scrollable_Treeview <Double-Button-1>   { ::ms::treeview::Double_Click  [_winfo parent %W] %x %y; break }
_bind _Scrollable_Treeview <Shift-Button-1>    { ::ms::treeview::Select        [_winfo parent %W] %x %y extend; break }
_bind _Scrollable_Treeview <<ToggleSelection>> { ::ms::treeview::Select        [_winfo parent %W] %x %y toggle; break }

# Motion
_bind _Scrollable_Treeview <Motion> { ::ms::treeview::Motion [_winfo parent %W] %x %y; break }

# Contextual menu
_bind _Scrollable_Treeview <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

# Configure
_bind _Scrollable_Treeview <Configure> { ::ms::treeview::Configure [_winfo parent %W]; break }

# Enter/Leave
_bind _Scrollable_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %X %Y ""; break }
_bind _Scrollable_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %X %Y Leave; break }

# FocusIn/FocusOut
_bind _Scrollable_Treeview <FocusIn>  { ::ms::treeview::Pathname_Cmd [_winfo parent %W] state [list focus]; break }
_bind _Scrollable_Treeview <FocusOut> { ::ms::treeview::FocusOut     [_winfo parent %W]; break }

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
_bind _Hull_Treeview <Enter> { ::ms::treeview::Hover %W %X %Y ""; break }
_bind _Hull_Treeview <Leave> { ::ms::treeview::Hover %W %X %Y ""; break }

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
##     _X_SCROLLBAR_TREEVIEW BINDINGS     ##
##                                        ##
############################################

# ButtonPress-1
_bind _X_Scrollbar_Treeview <ButtonPress-1>   { ::ms::treeview::Scrollbar_ButtonPress [_winfo parent %W] horizontal %x %y; break }
_bind _X_Scrollbar_Treeview <B1-Motion>       { ::ms::treeview::Scrollbar_Drag        [_winfo parent %W] horizontal %x %y; break }
_bind _X_Scrollbar_Treeview <ButtonRelease-1> { ::ms::treeview::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _X_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %X %Y ""; break }
_bind _X_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %X %Y ""; break }

# Mousewheel and Touchpad

# Move the treeview object by one unit left or right (depending on the mousewheel direction).
_bind _X_Scrollbar_Treeview <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
_bind _X_Scrollbar_Treeview <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# Move the treeview object by one page left or right (depending on the mousewheel direction).
_bind _X_Scrollbar_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
_bind _X_Scrollbar_Treeview <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# Move the treeview object by one unit left or right (depending on the touchpad direction).
_bind _X_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D units; break }

# Move the treeview object by one page left or right (depending on the touchpad direction).
_bind _X_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D pages; break }

############################################
##                                        ##
##     _Y_SCROLLBAR_TREEVIEW BINDINGS     ##
##                                        ##
############################################

# ButtonPress-1
_bind _Y_Scrollbar_Treeview <ButtonPress-1>   { ::ms::treeview::Scrollbar_ButtonPress [_winfo parent %W] vertical %x %y; break }
_bind _Y_Scrollbar_Treeview <B1-Motion>       { ::ms::treeview::Scrollbar_Drag        [_winfo parent %W] vertical %x %y; break }
_bind _Y_Scrollbar_Treeview <ButtonRelease-1> { ::ms::treeview::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _Y_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %X %Y ""; break }
_bind _Y_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %X %Y ""; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the treeview object by one unit up or down
# (depending on the mousewheel direction).
_bind _Y_Scrollbar_Treeview <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the treeview object by one page up or down
# (depending on the mousewheel direction).
_bind _Y_Scrollbar_Treeview <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# Move the treeview object by one unit up or down (depending on the touchpad direction).
_bind _Y_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D units; break }

# Move the treeview object by one page up or down (depending on the touchpad direction).
_bind _Y_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D pages; break }

#################################################
##                                             ##
##     _X_FAKE_SCROLLBAR_TREEVIEW BINDINGS     ##
##                                             ##
#################################################

# Activate/Deactivate
_bind _X_Fake_Scrollbar_Treeview <Activate>   { ::ms::treeview::Pathname_Cmd [_winfo parent %W] state !background; break }
_bind _X_Fake_Scrollbar_Treeview <Deactivate> { ::ms::treeview::Pathname_Cmd [_winfo parent %W] state  background; break }

# ButtonPress-1
_bind _X_Fake_Scrollbar_Treeview <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }

# Contextual menu
_bind _X_Fake_Scrollbar_Treeview <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }

# Enter/Leave
_bind _X_Fake_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %X %Y ""; break }
_bind _X_Fake_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %X %Y ""; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Treeview <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Treeview <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Treeview <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _X_Fake_Scrollbar_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }

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
_bind _X_Fake_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }

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
_bind _X_Fake_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }

#################################################
##                                             ##
##     _Y_FAKE_SCROLLBAR_TREEVIEW BINDINGS     ##
##                                             ##
#################################################

# Activate/Deactivate
_bind _Y_Fake_Scrollbar_Treeview <Activate>   { ::ms::treeview::Pathname_Cmd [_winfo parent %W] state !background; break }
_bind _Y_Fake_Scrollbar_Treeview <Deactivate> { ::ms::treeview::Pathname_Cmd [_winfo parent %W] state  background; break }

# ButtonPress-1
_bind _Y_Fake_Scrollbar_Treeview <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }

# Contextual menu
_bind _Y_Fake_Scrollbar_Treeview <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }

# Enter/Leave
_bind _Y_Fake_Scrollbar_Treeview <Enter> { ::ms::treeview::Hover [_winfo parent %W] %X %Y ""; break }
_bind _Y_Fake_Scrollbar_Treeview <Leave> { ::ms::treeview::Hover [_winfo parent %W] %X %Y ""; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Treeview <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Treeview <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Treeview <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Y_Fake_Scrollbar_Treeview <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }

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
_bind _Y_Fake_Scrollbar_Treeview <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }

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
_bind _Y_Fake_Scrollbar_Treeview <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }

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
            set ::ms::data($w,active,column)  {}
            set ::ms::data($w,cell,anchor)    {}
            set ::ms::data($w,cell,anchor,op) set
            set ::ms::data($w,classtype)      treeview
            set ::ms::data($w,press,column)   {}
            set ::ms::data($w,press,mode)     {}
            set ::ms::data($w,resize,column)  #0
            set ::ms::data($w,scrollx)        off
            set ::ms::data($w,scrolly)        off

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
                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
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
                    _bindtags $w.x [list $w.x _X_Scrollbar_Treeview TScrollbar $::ms::addr($w,toplevel) all]
                    _bindtags $w.y [list $w.y _Y_Scrollbar_Treeview TScrollbar $::ms::addr($w,toplevel) all]

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
                    set ::ms::addr($w.fake_x,short)   $short_addr
                    set ::ms::addr($w.fake_y,short)   $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.treeview \
                                              $w.x \
                                              $w.y \
                                              $w.fake_x \
                                              $w.fake_y;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.treeview

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.treeview

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.treeview \
                                                       $w.fake_x \
                                                       $w.fake_y];

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
        tag      {
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
                    set option [string tolower [string range $args 1 end]]
                    if { ($option in $::ms::treeview(non_styleable,options)) || ($option in $::ms::treeview(styleable,options)) } {
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
        set      {
            # Synopsis:
            #
            # *window* **children** *item* ?*newchildren*?
            # *window* **column** *column* ?*option*? ?*value*? ?*option value* ... *option value*?
            # *window* **delete** *itemList*
            # *window* **detach** *itemList*
            # *window* **heading** *column* ?*option*? ?*value*? ?*option value* ... *option value*?
            # *window* **insert** *parent* *index* ?*-id id*? options...
            # *window* **item** *item* ?*option*? ?*value*? ?*option value* ... *option value*?
            # *window* **see** *item*
            # *window* **set** *item* ?*column*? ?*value*?

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.treeview] }
            }

            # Execute the command.
            try {
                {*}$address $cmd {*}$args
            } on error {} {
                ::ms::Error "Invalid script." $caller_info
            } on ok { result } {
                # If needed, update the scrollbar/s.
                ::ms::treeview::Scrollbar_Update $w

                return $result
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
                default {
                    # Check that the command's 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            # Set a variable that keeps tracks if the developer changes the widget state.
                            set state_changed false

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the remaining widget's options, if any.
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
                                    -class {}
                                    -cmenu {
                                        set value [string trim $value]
                                        if { ($value eq "") || ($value in $::ms::addr(menu)) } {
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
                                            normal   {
                                                set ::ms::current($w,state) $value
                                                set state_changed true
                                            }
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
                                            ## Check if exists a layout for the style provided.
                                            ## If not, create one by mirroring the current theme 'Treeview' layout.
                                            #if { $value ni $::ms::layouts($::ms::theme) } {
                                            #    _ttk_style layout $value [_ttk_style layout Treeview]
                                            #}

                                            # Remove the widget address from the treeview classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),treeview,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),treeview,addrs) [lremove $::ms::style($::ms::current($w,style),treeview,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,treeview,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the treeview classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),treeview,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(treeview,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(treeview,classtype) [lremove $::ms::style(treeview,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the treeview classtype.
                                            if { $value ni $::ms::style(treeview,classtype) } {
                                                lappend ::ms::style(treeview,classtype) $value
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
                                        # Check if the widget is scrollable or not.
                                        switch -- $::ms::current($w,scrollable) {
                                            true { continue }
                                        }

                                        switch -- [llength $value] {
                                            0   { set ::ms::current($w,xscrollcommand) [list ] }
                                            2   { set ::ms::current($w,xscrollcommand) $value  }
                                        }
                                    }
                                    -yscrollcommand {
                                        # Check if the widget is scrollable or not.
                                        switch -- $::ms::current($w,scrollable) {
                                            true { continue }
                                        }

                                        switch -- [llength $value] {
                                            0   { set ::ms::current($w,yscrollcommand) [list ] }
                                            2   { set ::ms::current($w,yscrollcommand) $value  }
                                        }
                                    }
                                }
                            }

                            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
                            foreach option $::ms::button(styleable,options) {
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

                            ################################
                            ##                            ##
                            ##     CONFIGURE THE WIDGET   ##
                            ##                            ##
                            ################################

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

                            set treeview_separator_style [string cat $::ms::current($w,style) $parent $parent_style ".Separator"]

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

                                    # Configure the widget.
                                    interp invokehidden {} $w {*}$treeview_options
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

                                    # Apply the changes.
                                    interp invokehidden {} $w configure -style $::ms::style($w,hull)

                                    ######################
                                    ##                  ##
                                    ##     TREEVIEW     ##
                                    ##                  ##
                                    ######################

                                    $w.treeview configure {*}$treeview_options

                                    ######################
                                    ##                  ##
                                    ##     SCROLLBARS   ##
                                    ##                  ##
                                    ######################

                                    # Configure the fake scrollbars.
                                    $w.fake_x configure -style $::ms::style($w,hull)
                                    $w.fake_y configure -style $::ms::style($w,hull)

                                    # Update the scrollbars.
                                    ::ms::treeview::Scrollbar_Update $w
                                }
                            }

                            # Check if the developer changed the widget state as well.
                            switch -- $state_changed {
                                true {
                                    # Note: The Tk treeview widget don't have a '-state' option.
                                    #       We need to simulate it graphically.
                                    switch -- $::ms::current($w,state) {
                                        disabled {
                                            # Change the widget dynamic state to 'disabled'.
                                            ::ms::treeview::Pathname_Cmd $w state disabled
                                        }
                                        normal {
                                            # Change the widget dynamic state to '!disabled'.
                                            ::ms::treeview::Pathname_Cmd $w state !disabled
                                        }
                                    }
                                }
                            }

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
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
            # *window* **identify**             *x* *y*
            # *window* **identify** **cell**    *x* *y*
            # *window* **identify** **column**  *x* *y*
            # *window* **identify** **element** *x* *y*
            # *window* **identify** **item**    *x* *y*
            # *window* **identify** **region**  *x* *y*
            # *window* **identify** **row**     *x* *y*
            switch -- [llength $args] {
                2   {
                    set subcommand region
                    set x          [lindex $args 0]
                    set y          [lindex $args 1]
                }
                3   {
                    # Check that the first argument of 'args' is the word "element" or 'sash'.
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

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.treeview] }
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
                            region {
                                switch -- $result {
                                    heading   { return "Treeview.heading" }
                                    separator { return "Treeview.separator" }
                                    tree      { return "Treeview.tree" }
                                    default   { return "Treeview.cell" }
                                }
                            }
                            element {
                                switch -glob -- $result {
                                    *indicator  { return "Treeview.indicator" }
                                    *disclosure { return "Treeview.disclosure" }
                                    *text       { return "Treeview.text" }
                                    default     { return "Treeview.area" }
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
                            # Execute the command.
                            if { $widget eq $w } {
                                return "Treeview.hull"
                            } elseif { $widget eq "$w.x" } {
                                return "Treeview.x"
                            } elseif { $widget eq "$w.y" } {
                                return "Treeview.y"
                            } else {
                                try {
                                    {*}$address identify element $x $y
                                } on error { errortext errorcode } {
                                    ::ms::Error "$errortext" $caller_info
                                } on ok { result } {
                                    switch -glob -- $result {
                                        *indicator  { return "Treeview.indicator" }
                                        *disclosure { return "Treeview.disclosure" }
                                        *text       { return "Treeview.text" }
                                        default     { return "Treeview.area" }
                                    }
                                }
                            }
                        }
                        region {
                            # Execute the command.
                            if { $widget eq $w } {
                                return "Treeview.hull"
                            } elseif { $widget eq "$w.x" } {
                                return "Treeview.x"
                            } elseif { $widget eq "$w.y" } {
                                return "Treeview.y"
                            } else {
                                try {
                                    {*}$address identify region $x $y
                                } on error { errortext errorcode } {
                                    ::ms::Error "$errortext" $caller_info
                                } on ok { result } {
                                    switch -- $result {
                                        heading   { return "Treeview.heading" }
                                        separator { return "Treeview.separator" }
                                        tree      { return "Treeview.tree" }
                                        default   { return "Treeview.cell" }
                                    }
                                }
                            }
                        }
                        default {
                            # Execute the command.
                            if { $widget eq "$w.treeview" } {
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
            # *window* **selection** **set** *itemList*
            # *window* **selection** **add** *itemList*
            # *window* **selection** **remove** *itemList*
            # *window* **selection** **toggle** *itemList*
            switch -- [llength $args] {
                2   {
                    # Check the subcommand.
                    switch -- [lindex $args 0] {
                        add     -
                        remove  -
                        set     -
                        toggle  {}
                        default { ::ms::Error "Invalid cellselection command, '$subcommand'." $caller_info }
                    }

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { set address [list interp invokehidden {} $w] }
                        true  { set address [list $w.treeview] }
                    }

                    # Execute the command.
                    try {
                        {*}$address selection {*}$args
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

                    #######################################
                    ##                                   ##
                    ##     UPDATE THE WIDGET'S STATE     ##
                    ##                                   ##
                    #######################################

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { return [interp invokehidden {} $w state $statespec] }
                        true  {
                            interp invokehidden {} $w state $statespec
                            $w.fake_x state $statespec
                            $w.fake_y state $statespec
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
proc ::ms::treeview::Style_Update { stylename caller_info } {
    # Check if the style provided is a parent of 'Treeview'.
    set index [string last "." $stylename]
    switch -- $index {
        -1      { set parent_style ".Treeview" }
        default {
            switch -- [string range $stylename $index+1 end] {
                Treeview { set parent_style "" }
                default  { set parent_style ".Treeview"}
            }
        }
    }

    ###################################
    ##                               ##
    ##     HEADING STYLE OPTIONS     ##
    ##                               ##
    ###################################

    set treeview_heading_style [string cat $stylename $parent_style ".Heading"]

    # Check if a layout exists for 'stylename.Heading'.
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

    set treeview_separator_style [string cat $stylename $parent_style ".Separator"]

    # Check if a layout exists for 'stylename.Separator'.
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

    set treeview_item_style [string cat $stylename $parent_style ".Item"]

    # Check if a layout exists for 'stylename.Item'.
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

    set treeview_cell_style [string cat $stylename $parent_style ".Cell"]

    # Check if a layout exists for 'stylename.Cell'.
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

    set treeview_row_style [string cat $stylename $parent_style ".Row"]

    # Check if a layout exists for 'stylename.Row'.
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
    ##     UPDATE THE WIDGETS STYLE   ##
    ##                                ##
    ####################################

    # Update all the treeview widgets that have stylename as a style.
    foreach w $::ms::style($stylename,treeview,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::treeview(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Treeview,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        # Check the widget state and set the cursor accordingly.
        switch -- $::ms::current($w,state) {
            disabled { set cursor arrow }
            normal   { set cursor $::ms::current($w,cursor) }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET'S STYLE   ##
        ##                                 ##
        #####################################

        # Note: 'borderwidth', 'columnseparatorwidth', 'cursor', 'focuswidth', 'font', 'indent', 'justify',
        #       'padding' and 'rowheight' are not allowed to change if the statespec changes.

        ######################
        ##                  ##
        ##     TREEVIEW     ##
        ##                  ##
        ######################

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
                                                 "." $stylename $parent_style];

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
                # Check if a 'background' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,background)] {
                    1   { lappend mapping -background $::ms::stylemap($::ms::theme,$stylename,background) }
                }
            }
        }

        # bordercolor
        switch -- $::ms::managed_by($w,bordercolor) {
            developer { lappend mapping -bordercolor [list pressed $::ms::current($w,bordercolor)] }
            Tk  {
                # Check if a 'bordercolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,bordercolor)] {
                    1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$stylename,bordercolor) }
                }
            }
        }

        # darkcolor
        switch -- $::ms::managed_by($w,darkcolor) {
            developer { lappend mapping -darkcolor [list pressed $::ms::current($w,darkcolor)] }
            Tk  {
                # Check if a 'darkcolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,darkcolor)] {
                    1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$stylename,darkcolor) }
                }
            }
        }

        # fieldbackground
        switch -- $::ms::managed_by($w,fieldbackground) {
            developer { lappend mapping -fieldbackground [list pressed $::ms::current($w,fieldbackground)] }
            Tk  {
                # Check if a 'fieldbackground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,fieldbackground)] {
                    1   { lappend mapping -fieldbackground $::ms::stylemap($::ms::theme,$stylename,fieldbackground) }
                }
            }
        }

        # focuscolor
        switch -- $::ms::managed_by($w,focuscolor) {
            developer { lappend mapping -focuscolor [list pressed $::ms::current($w,focuscolor)] }
            Tk  {
                # Check if a 'focuscolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,focuscolor)] {
                    1   { lappend mapping -focuscolor $::ms::stylemap($::ms::theme,$stylename,focuscolor) }
                }
            }
        }

        # foreground
        switch -- $::ms::managed_by($w,foreground) {
            developer { lappend mapping -foreground [list pressed $::ms::current($w,foreground)] }
            Tk  {
                # Check if a 'foreground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,foreground)] {
                    1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$stylename,foreground) }
                }
            }
        }

        # lightcolor
        switch -- $::ms::managed_by($w,lightcolor) {
            developer { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
            Tk  {
                # Check if a 'lightcolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,lightcolor)] {
                    1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$stylename,lightcolor) }
                }
            }
        }

        # stripedbackground
        switch -- $::ms::managed_by($w,stripedbackground) {
            developer { lappend mapping -stripedbackground [list pressed $::ms::current($w,stripedbackground)] }
            Tk  {
                # Check if a 'stripedbackground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,stripedbackground)] {
                    1   { lappend mapping -stripedbackground $::ms::stylemap($::ms::theme,$stylename,stripedbackground) }
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
        set treeview_options [list  -cursor $cursor \
                                    -height $::ms::current($w,rows) \
                                   -padding $::ms::current($w,padding) \
                                     -style $::ms::style($w,treeview)];

        # Check if the widget is scrollable or not.
        switch -- $::ms::current($w,scrollable) {
            false {
                #############################
                ##                         ##
                ##     SIMPLE TREEVIEW     ##
                ##                         ##
                #############################

                ######################
                ##                  ##
                ##     TREEVIEW     ##
                ##                  ##
                ######################

                interp invokehidden {} $w configure {*}$treeview_options
            }
            true {
                #################################
                ##                             ##
                ##     SCROLLABLE TREEVIEW     ##
                ##                             ##
                #################################

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
                        # Check if a 'shellbackground' mapping exists for 'stylename'.
                        switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,shellbackground)] {
                            1   { lappend mapping -background $::ms::stylemap($::ms::theme,$stylename,shellbackground) }
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

                # Apply the changes.
                interp invokehidden {} $w configure -style $::ms::style($w,hull)

                ######################
                ##                  ##
                ##     TREEVIEW     ##
                ##                  ##
                ######################

                $w.treeview configure {*}$treeview_options

                ######################
                ##                  ##
                ##     SCROLLBARS   ##
                ##                  ##
                ######################

                # Update the fake scrollbars.
                $w.fake_x configure -height $::ms::size($::ms::theme,scrollbar) \
                                     -style $::ms::style($w,hull);

                $w.fake_y configure -style $::ms::style($w,hull) \
                                    -width $::ms::size($::ms::theme,scrollbar);

                # Update the scrollbars.
                ::ms::treeview::Scrollbar_Update $w
            }
        }

        # The Tk treeview widget don't have a '-state' option.
        # We need to simulate it graphically.
        switch -- $::ms::current($w,state) {
            disabled {
                # Change the widget dynamic state to 'disabled'.
                ::ms::treeview::Pathname_Cmd $w state disabled
            }
            normal {
                # Change the widget dynamic state to '!disabled'.
                ::ms::treeview::Pathname_Cmd $w state !disabled
            }
        }
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

## Configure
#
# Manage the **Configure** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::treeview::Configure { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        true {
            # Note: The configure event have already happened.
            #       We just need to propagate the event inside the content
            #       and check if the scrollbar/s are updated/needed.

            # Update the scrollbars.
            ::ms::treeview::Scrollbar_Update $w
        }
    }

    return ""
}

## Destroy
#
# Manage the **Destroy** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::treeview::Destroy { w } {
    # Get the short address related to the widget's real address.
    set short_addr $::ms::addr($w,short)

    # Destroy the aliased widget's pathcommands.
    foreach token $::ms::data($w,token) {
        interp alias {} $token {}
    }

    # Remove the widget's short address from the list of all available short addresses.
    set index [lsearch -exact $::ms::addr(shorts) $short_addr]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(shorts) [lremove $::ms::addr(shorts) $index] }
    }

    # Remove the widget's address from the treeview widgets real address list.
    set index [lsearch -exact $::ms::addr(treeview) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(treeview) [lremove $::ms::addr(treeview) $index] }
    }

    # Remove the widget's address from the treeview classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),treeview,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),treeview,addrs) [lremove $::ms::class($::ms::current($w,class),treeview,addrs) $index] }
    }

    # Remove the widget's address from the treeview classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),treeview,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),treeview,addrs) [lremove $::ms::style($::ms::current($w,style),treeview,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the treeview classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),treeview,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(treeview,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(treeview,classtype) [lremove $::ms::style(treeview,classtype) $index] }
            }
        }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false {
            #############################
            ##                         ##
            ##     SIMPLE TREEVIEW     ##
            ##                         ##
            #############################

            # Remove all the widget's objects real addresses from the list of all available real addresses.
            # Remove the widget address from the list of all available real addresses.
            set index [lsearch -exact $::ms::addr(reals) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
            }
        }
        true {
            #################################
            ##                             ##
            ##     SCROLLABLE TREEVIEW     ##
            ##                             ##
            #################################

            # Remove all the widget's objects real addresses from the list of all available real addresses.
            foreach object [list $w \
                                 $w.treeview \
                                 $w.x \
                                 $w.y \
                                 $w.fake_x \
                                 $w.fake_y] {
                set index [lsearch -exact $::ms::addr(reals) $object]
                switch -- $index {
                    -1      {}
                    default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
                }
            }

            # Remove the widget's address from the megawidget real address list.
            set index [lsearch -exact $::ms::addr(megawidgets) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(megawidgets) [lremove $::ms::addr(megawidgets) $index] }
            }

            # Remove the widget's address from the megawidget scrollable real address list.
            set index [lsearch -exact $::ms::addr(megawidgets,scrollable) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(megawidgets,scrollable) [lremove $::ms::addr(megawidgets,scrollable) $index] }
            }
        }
    }

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short) \
                         ::ms::addr($w.treeview,short) \
                         ::ms::addr($w.x,short) \
                         ::ms::addr($w.y,short) \
                         ::ms::addr($w.fake_x,short) \
                         ::ms::addr($w.fake_y,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,background) \
                         ::ms::current($w,class) \
                         ::ms::current($w,cmenu) \
                         ::ms::current($w,columns) \
                         ::ms::current($w,columnseparatorwidth) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,displaycolumns) \
                         ::ms::current($w,fieldbackground) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,indent) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,rowheight) \
                         ::ms::current($w,rows) \
                         ::ms::current($w,scrollable) \
                         ::ms::current($w,selectmode) \
                         ::ms::current($w,selecttype) \
                         ::ms::current($w,shellbackground) \
                         ::ms::current($w,show) \
                         ::ms::current($w,state) \
                         ::ms::current($w,striped) \
                         ::ms::current($w,stripedbackground) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,titlecolumns) \
                         ::ms::current($w,titleitems) \
                         ::ms::current($w,xscrollcommand) \
                         ::ms::current($w,yscrollcommand);

    unset -nocomplain -- ::ms::data($w,active,column) \
                         ::ms::data($w,cell,anchor) \
                         ::ms::data($w,cell,anchor,op) \
                         ::ms::data($w,classtype) \
                         ::ms::data($w,press,column) \
                         ::ms::data($w,press,mode) \
                         ::ms::data($w,resize,column) \
                         ::ms::data($w,scrollx) \
                         ::ms::data($w,scrolly) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,background) \
                         ::ms::default($w,class) \
                         ::ms::default($w,cmenu) \
                         ::ms::default($w,columns) \
                         ::ms::default($w,columnseparatorwidth) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,displaycolumns) \
                         ::ms::default($w,fieldbackground) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,indent) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,rowheight) \
                         ::ms::default($w,rows) \
                         ::ms::default($w,scrollable) \
                         ::ms::default($w,selectmode) \
                         ::ms::default($w,selecttype) \
                         ::ms::default($w,shellbackground) \
                         ::ms::default($w,show) \
                         ::ms::default($w,state) \
                         ::ms::default($w,striped) \
                         ::ms::default($w,stripedbackground) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,titlecolumns) \
                         ::ms::default($w,titleitems) \
                         ::ms::default($w,xscrollcommand) \
                         ::ms::default($w,yscrollcommand);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,columnseparatorwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,fieldbackground) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,indent) \
                         ::ms::managed_by($w,rowheight) \
                         ::ms::managed_by($w,rows) \
                         ::ms::managed_by($w,padding) \
                         ::ms::managed_by($w,shellbackground) \
                         ::ms::managed_by($w,stripedbackground);

    unset -nocomplain -- ::ms::style($w,hull) \
                         ::ms::style($w,separator) \
                         ::ms::style($w,treeview) \
                         ::ms::style($w,widget);

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
proc ::ms::treeview::FocusOut { w } {
    # Check if a contextual menu was assigned to the widget.
    # If not, use the contextual menu of the widget's toplevel.
    set cmenu $::ms::current($w,cmenu)
    switch -- $cmenu {
        ""  { set cmenu $::ms::current($::ms::addr($w,toplevel),cmenu) }
    }

    # If 'cmenu' exists (meaning it's open), do not loose the focus (graphically).
    switch -- [_winfo exists $cmenu] {
        0   { ::ms::treeview::Pathname_Cmd $w state [list !focus] }
        1   { ::ms::treeview::Pathname_Cmd $w state [list  focus] }
    }

    return ""
}

## Hover
#
# Manage the **Enter** and **Leave** event on the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# X, Y   Should be the mouse pointer (X,Y) root coordinates at the time of the event.
#        These value are provided directly by the **Enter** or **Leave** event.
#
# type   Specifies if a **Leave** event has happened on the treeview object.
#        Allowed values are **Leave** or the empty string.
#
#        If not provided, defaults to the empty string.
#
# It doesn't return anything.
proc ::ms::treeview::Hover { w X Y { type "" } } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false {
            # Check if a **Leave** event has just happened upon a treeview object.
            switch -- $type {
                Leave {
                    # Change the widget dynamic state to '!hover'
                    interp invokehidden {} $w state [list !hover]

                    # Reset the widget's active column.
                    set ::ms::data($w,active,column) {}
                }
                default {
                    # Change the widget dynamic state to 'hover'
                    interp invokehidden {} $w state [list hover]
                }
            }
        }
        true  {
            # Get the dimensions of the widget that acts as a border object.
            set height [_winfo height $::ms::addr($w,border)]
            set width  [_winfo width  $::ms::addr($w,border)]

            # Get the north-west (nw) root coordinates of the widget that acts as a border object.
            set X_nw [_winfo rootx $::ms::addr($w,border)]
            set Y_nw [_winfo rooty $::ms::addr($w,border)]

            # Get the widget south-east (se) root coordinates of the widget that acts as a border object.
            set X_se [expr { $X_nw+$width }]
            set Y_se [expr { $Y_nw+$height }]

            # Check if the mouse pointer coordinates are inside or outside the widget acting as a border object.
            if { ($X <= $X_nw) || ($X >= $X_se) || ($Y <= $Y_nw) || ($Y >= $Y_se) } {
                # The mouse cursor is outside the widget acting as a border object.

                # Change the widget dynamic state to '!hover'
                ::ms::treeview::Pathname_Cmd $w state [list !hover]

                # Check if a **Leave** event has just happened upon a treeview object.
                switch -- $type {
                    Leave { set ::ms::data($w,active,column) {} }
                }
            } else {
                # The mouse cursor is inside the widget acting as a border object.

                # Change the widget dynamic state to 'hover'
                ::ms::treeview::Pathname_Cmd $w state [list hover]
            }
        }
    }

    return ""
}

## Map
#
# Manage the **Map** event on the widget.
# It also remove the **Map** binding after it fires up the first time.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::treeview::Map { w } {
    # Remove the Map binding.
    _bind $::ms::addr($w,widget) <Map> {}

    # If needed, update the scrollbar/s.
    ::ms::treeview::Scrollbar_Update $w

    return ""
}

## Pages
#
# Manage the **PageUp**/**PageDown**/**PageLeft**/**PageRight** events on the widget.
#
# Where:
#
# w           Should be the widget real address involved.
#
# direction   Should be the direction of the movement.
#             Allowed values are **up**, **down**, **left** or **right**.
#
# It doesn't return anything.
proc ::ms::treeview::Pages { w direction } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check the direction provided.
    switch -- $direction {
        down  { ::ms::Scroll_Widget_Y $w -1 pages }
        left  { ::ms::Scroll_Widget_X $w  1 pages }
        right { ::ms::Scroll_Widget_X $w -1 pages }
        up    { ::ms::Scroll_Widget_Y $w  1 pages }
    }

    return ""
}

## Return
#
# Manage the **Return**/**KP_Enter**/**space** keypress events on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::treeview::Return { w } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Toggle the focus.
    ::ms::treeview::Toggle_Focus $w

    return ""
}

########################
##                    ##
##     SCROLLBARS     ##
##                    ##
########################

## Scrollbar_ButtonPress
#
# Manage the **<ButtonPress-1>** event on the widget's internal scrollbars.
#
# Where:
#
# w        Should be the widget real address involved.
#
# orient   Specifies a string (**horizontal** or **vertical**) indicating
#          the orientation of the scrollbar.
#
# x, y     Should be the (x,y) mouse pointer coordinates of the event.
#          These values should be provided by the <ButtonPress> event.
#
# It doesn't return anything.
proc ::ms::treeview::Scrollbar_ButtonPress { w orient x y }  {
    set ::ms::temp(xpress) $x
    set ::ms::temp(ypress) $y

    switch -nocase -- $orient {
        horizontal {
            switch -nocase -glob -- [$w.x identify $x $y] {
                "*leftarrow"  { ::ms::Scroll_Widget_X $w +120 units }
                "*rightarrow" { ::ms::Scroll_Widget_X $w -120 units }
                "*grip"  -
                "*thumb" {
                    set ::ms::temp(drag_allowed) yes

                    set xviews [$w.x get]
                    set xview1 [lindex $xviews 0]
                    set xview2 [lindex $xviews 1]

                    # Compute the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [expr { ($xview2+$xview1)*0.5 }]
                }
                "*trough" {
                    # Get the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [$w.x fraction $x $y]

                    # Check if 'parent' has an active horizontal scrollbar linked to it.
                    switch -- $::ms::data($w,scrollx) {
                        on  {
                            switch -nocase -- $::ms::clickaction {
                                jump {
                                    # Jump to the location on the scrollbar that was clicked.
                                    ::ms::treeview::Pathname_Cmd $w xview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set xviews [$w.x get]
                                    set xview1 [lindex $xviews 0]
                                    set xview2 [lindex $xviews 1]

                                    if { $::ms::temp(fraction) < $xview1 } {
                                        # The User has click on the left trough.

                                        # Scroll the thumb by one page towards the left.
                                        ::ms::treeview::Pathname_Cmd $w xview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $xview2 } {
                                        # The User has click on the right trough.

                                        # Scroll the thumb by one page towards the right.
                                        ::ms::treeview::Pathname_Cmd $w xview scroll 1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } else {
                                        # The User has click on the thumb (???).

                                        set ::ms::temp(drag_allowed) no
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        vertical {
            switch -nocase -glob -- [$w.y identify $x $y] {
                "*uparrow"   { ::ms::Scroll_Widget_Y $w +120 units }
                "*downarrow" { ::ms::Scroll_Widget_Y $w -120 units }
                "*grip"  -
                "*thumb" {
                    set ::ms::temp(drag_allowed) yes

                    set yviews [$w.y get]
                    set yview1 [lindex $yviews 0]
                    set yview2 [lindex $yviews 1]

                    # Compute the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [expr { ($yview2+$yview1)*0.5 }]
                }
                "*trough" {
                    # Get the fraction for the center of the thumb.
                    set ::ms::temp(fraction) [$w.y fraction $x $y]

                    # Check if 'parent' has an active vertical scrollbar linked to it.
                    switch -- $::ms::data($w,scrolly) {
                        on  {
                            switch -nocase -- $::ms::clickaction {
                                jump {
                                    # Jump to the location on the scrollbar that was clicked.
                                    ::ms::treeview::Pathname_Cmd $w yview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set yviews [$w.y get]
                                    set yview1 [lindex $yviews 0]
                                    set yview2 [lindex $yviews 1]

                                    if { $::ms::temp(fraction) < $yview1 } {
                                        # The User has click on the top trough.

                                        # Scroll the thumb by one page towards the top.
                                        ::ms::treeview::Pathname_Cmd $w yview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $yview2 } {
                                        # The User has click on the bottom trough.

                                        # Scroll the thumb by one page towards the bottom.
                                        ::ms::treeview::Pathname_Cmd $w yview scroll 1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } else {
                                        # The User has click on the thumb (???).
                                        set ::ms::temp(drag_allowed) no
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    return ""
}

## Scrollbar_ButtonRelease
#
# Manage the **ButtonRelease-1** event on the widget's internal scrollbars.
#
# It doesn't return anything.
proc ::ms::treeview::Scrollbar_ButtonRelease {} {
    unset -nocomplain -- ::ms::temp(drag_allowed) \
                         ::ms::temp(fraction) \
                         ::ms::temp(xpress) \
                         ::ms::temp(ypress);

    return ""
}

## Scrollbar_Drag
#
# Manage the **B1-Motion** event on the widget's internal scrollbars.
#
# Where:
#
# w        Should be the widget real address involved.
#
# orient   Specifies a string (**horizontal** or **vertical**) indicating
#          the orientation of the scrollbar.
#
# x, y     Should be the (x,y) mouse pointer coordinates of the event.
#          These values should be provided by the <Motion> event.
#
# It doesn't return anything.
proc ::ms::treeview::Scrollbar_Drag { w orient x y } {
    # Safeguard.
    # Check if the 'Scrollbar_Drag' operation is allowed or not.
    switch -- [info exists ::ms::temp(drag_allowed)] {
        0   { return "" }
        1   {
            switch -- $::ms::temp(drag_allowed) {
                no  { return "" }
            }
        }
    }

    # Compute 'delta_x' and 'delta_y'.
    set delta_x [expr { $x-$::ms::temp(xpress) }]
    set delta_y [expr { $y-$::ms::temp(ypress) }]

    # Check the orientation.
    switch -nocase -- $orient {
        horizontal {
            # Compute the 'fraction' after the drag movement.
            set delta    [$w.x delta $delta_x $delta_y]
            set fraction [expr { $::ms::temp(fraction)+$delta }]

            # Move the horizontal scrollbar to 'fraction'.
            ::ms::treeview::Pathname_Cmd $w xview moveto $fraction
        }
        vertical {
            # Compute the 'fraction' after the drag movement.
            set delta    [$w.y delta $delta_x $delta_y]
            set fraction [expr { $::ms::temp(fraction)+$delta }]

            # Move the vertical scrollbar to 'fraction'.
            ::ms::treeview::Pathname_Cmd $w yview moveto $fraction
        }
    }

    return ""
}

## Scrollbar_Update
#
# Manage the widget's scrollbars movements and displays.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::treeview::Scrollbar_Update { w } {
    update

    ##################################
    ##                              ##
    ##     HORIZONTAL SCROLLBAR     ##
    ##                              ##
    ##################################

    # Get 'xview1' and 'xview2'.
    set xviews [$w.x get]
    set xview1 [lindex $xviews 0]
    set xview2 [lindex $xviews 1]

    if { ($xview1 == 0) && ($xview2 == 1.0) } {
        # Check if the horizontal scrollbar is currently displayed.
        switch -- $::ms::data($w,scrollx) {
            on  {
                # Hide the horizontal scrollbar.
                _grid remove $w.x

                # Display the fake horizontal scrollbar.
                _grid $w.fake_x -column 0 \
                                  -padx [list 0  0] \
                                  -pady [list 8p 0] \
                                   -row 1 \
                                -sticky we;

                # Set the horizontal scrollbar status to 'off'.
                set ::ms::data($w,scrollx) off
            }
        }
    } else {
        # Check if the horizontal scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrollx) {
            off {
                # Hide the fake horizontal scrollbar.
                _grid remove $w.fake_x

                # Display the horizontal scrollbar.
                _grid $w.x -column 0 \
                             -padx [list 0  0] \
                             -pady [list 8p 0] \
                              -row 1 \
                           -sticky we;

                # Set the horizontal scrollbar status to 'on'.
                set ::ms::data($w,scrollx) on
            }
        }
    }

    ################################
    ##                            ##
    ##     VERTICAL SCROLLBAR     ##
    ##                            ##
    ################################

    # Get 'yview1' and 'yview2'.
    set yviews [$w.y get]
    set yview1 [lindex $yviews 0]
    set yview2 [lindex $yviews 1]

    if { ($yview1 == 0) && ($yview2 == 1.0) } {
        # Check if the vertical scrollbar is currently displayed.
        switch -- $::ms::data($w,scrolly) {
            on  {
                # Hide the vertical scrollbar.
                _grid remove $w.y

                # Display the fake vertical scrollbar.
                _grid $w.fake_y -column 1 \
                                  -padx [list 8p 0] \
                                  -pady [list 0  0] \
                                   -row 0 \
                                -sticky ns;

                # Set the vertical scrollbar status to 'off'.
                set ::ms::data($w,scrolly) off
            }
        }
    } else {
        # Check if the vertical scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrolly) {
            off {
                # Hide the fake vertical scrollbar.
                _grid remove $w.fake_y

                # Display the vertical scrollbar.
                _grid $w.y -column 1 \
                             -padx [list 8p 0] \
                             -pady [list 0  0] \
                              -row 0 \
                           -sticky ns;

                # Set the vertical scrollbar status to 'on'.
                set ::ms::data($w,scrolly) on
            }
        }
    }

    update idletasks

    return ""
}

##############################################
##                                          ##
##     REWRITTEN TK TREEVIEW PROCEDURES     ##
##                                          ##
##############################################

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

# Note: The following procedures were inspired by their treeview equivalent ones.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## Arrow_Keys
#
# Manage the Key navigation on the widget.
#
# Where:
#
# w     Should be the widget real address involved.
#
# key   Should be arrow key event that happened on the widget.
#       Allowed values are **down**, **left**, **right** and **up**.
#
# It doesn't return anything.
proc ::ms::treeview::Arrow_Keys { w key } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # Check if the widget has no items.
    set root_children [{*}$address children {}]
    switch -- [llength $root_children] {
        0   { return "" }
    }

    # Get the widget's item in focus.
    set item [{*}$address focus]
    switch -- $item {
        ""  {
            # Check the key pressed.
            switch -- $key {
                up   -
                left {
                    # Get the last 'item'
                    set item [lindex $root_children end]
                }
                down  -
                right {
                    # Get the first 'item'.
                    set item [lindex $root_children 0]
                }
            }

            # Check the selection type.
            switch -- $::ms::current($w,selecttype) {
                cell {
                    # Select the first cell of 'item'
                    ::ms::treeview::Select_Op $w $item [list $item #1] choose
                }
                default {
                    # Select 'item'.
                    ::ms::treeview::Select_Op $w $item "" choose
                }
            }

            return ""
        }
    }

    # Check the selection type.
    switch -- $::ms::current($w,selecttype) {
        cell {
            set column [lindex $::ms::data($w,cell,anchor) 1]
            switch -- $column {
                ""  { set column "#1" }
            }
        }
    }

    # Check the key pressed.
    switch -- $key {
        up  {
            # Check if 'item' is the first root child.
            if { $item eq [lindex $root_children 0] } {
                # Check if we need to cycle (scrollstopper --> disabled).
                switch -- $::ms::scrollstopper {
                    disabled { set item [lindex $root_children end] }
                    enabled  { return "" }
                }
            } else {
                set up [{*}$address prev $item]
                switch -- $up {
                    ""      { set item [{*}$address parent $item] }
                    default {
                        while { [{*}$address item $up -open] && [llength [{*}$address children $up]] } {
                            set up [lindex [{*}$address children $up] end]
                        }

                        set item $up
                    }
                }
            }
        }
        down {
            # Check if 'item' is the last root child.
            if { $item eq [lindex $root_children end] } {
                # Check if we need to cycle (scrollstopper --> disabled).
                switch -- $::ms::scrollstopper {
                    disabled { set item [lindex $root_children 0] }
                    enabled  { return "" }
                }
            } else {
                if { [{*}$address item $item -open] && [llength [{*}$address children $item]] } {
                    set item [lindex [{*}$address children $item] 0]
                } else {
                    set up $item
                    while { $up ne "" && [set down [{*}$address next $up]] eq "" } {
                        set up [{*}$address parent $up]
                    }
                    set item $down
                }
            }
        }
        left {
            # Check the selection type.
            switch -- $::ms::current($w,selecttype) {
                cell {
                    # This assumes that column is of the "#N" format.
                    set columns [string range $column 1 end]

                    if { "tree" in $::ms::current($w,show) } {
                        set first_column 0
                    } else {
                        set first_column 1
                    }

                    if { $columns > $first_column } {
                        incr columns -1
                        set column [string cat "#" $columns]
                    }
                }
                default {
                    set children [{*}$address children $item]

                    if { [{*}$address item $item -open] && [llength $children] } {
                        ::ms::treeview::Close_Item $w $item
                    } else {
                        set item [{*}$address parent $item]
                    }
                }
            }
        }
        right {
            # Check the selection type.
            switch -- $::ms::current($w,selecttype) {
                cell {
                    switch -- $::ms::current($w,displaycolumns) {
                        "#all"  { set last_column [llength $::ms::current($w,columns)] }
                        default { set last_column [llength $::ms::current($w,displaycolumns)] }
                    }

                    # Set the 'column'.
                    set columns [string range $column 1 end]
                    if { $columns < $last_column } {
                        incr columns
                        set column [string cat "#" $columns]
                    }
                }
                default { ::ms::treeview::Open_Item $w $item }
            }
        }
    }

    # Check if 'item' is the empty string or not.
    switch -- $item {
        ""      {}
        default {
            # Check the selection type.
            switch -- $::ms::current($w,selecttype) {
                cell    { ::ms::treeview::Select_Op $w $item [list $item $column] choose }
                default { ::ms::treeview::Select_Op $w $item "" choose }
            }
        }
    }

    return ""
}

## ButtonPress
#
# Manage the **ButtonPress** event on the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#        These values should be provided by the **ButtonPress** event.
#
# It doesn't return anything.
proc ::ms::treeview::ButtonPress { w x y } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # Focus the treeview.
    _focus -force $::ms::addr($w,widget)

    # Change the widget dynamic state to 'focus'
    ::ms::treeview::Pathname_Cmd $w state [list focus]

    # Identify the widget's region under the mouse pointer.
    switch -- [{*}$address identify region $x $y] {
        heading {
            # Heading.Press
            set column [{*}$address identify column $x $y]

            set ::ms::data($w,press,mode)   heading
            set ::ms::data($w,press,column) $column

            # Execute the command.
            {*}$address heading $column state pressed
        }
        separator {
            # Resize.Press
            set ::ms::data($w,press,mode)    resize
            set ::ms::data($w,resize,column) [{*}$address identify column $x $y]
        }
        tree -
        cell {
            # Identify the widget's item under the mouse pointer.
            set item [{*}$address identify item $x $y]

            # Identify the widget's cell under the mouse pointer.
            set cell [::ms::treeview::Identify_Cell $w $x $y]

            # Dispatch to the appropriate select operation depending on current value of '-selectmode'.
            ::ms::treeview::Select_Op $w $item $cell choose

            # Identify the widget's element under the mouse pointer.
            switch -glob -- [{*}$address identify element $x $y] {
                *indicator  -
                *disclosure -
                *text       -
                *padding    { ::ms::treeview::Toggle $w $item }
            }
        }
    }

    return ""
}

## ButtonRelease
#
# Manages the **ButtonRel;ease-1** event.
#
# Where:
#
# w     Should be the widget real address involved.
#
# x,y   Should be the (x,y) coordinates of the mouse pointer at the time of the event.
#
# It doesn't return anything.
proc ::ms::treeview::ButtonRelease { w x y } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # Check the press mode.
    switch -- $::ms::data($w,press,mode) {
        resize {
            # Resize.Release
            {*}$address drop
        }
        heading {
            # Heading.Release
            set state [{*}$address heading $::ms::data($w,press,column) state]
            if { [lsearch -exact $state pressed] >= 0 } {
                after 0 [list {*}$address heading $::ms::data($w,press,column) -command]
            }

            # Execute the command.
            {*}$address heading $::ms::data($w,press,column) state !pressed
        }
    }

    # Reset the press mode variable.
    set ::ms::data($w,press,mode) {}

    # Execute the **Motion** procedure.
    ::ms::treeview::Motion $w $x $y

    return ""
}

## DoubleClick
#
# Manages the **Double-Button-1** event
#
# Where:
#
# w     Should be the widget real address involved.
#
# x,y   Should be the (x,y) coordinates of the mouse pointer at the time of the event.
#
# It doesn't return anything.
proc ::ms::treeview::DoubleClick { w x y } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # Check the row under the coordinates provided.
    set row [{*}$address identify row $x $y]
    switch -- $row {
        ""  {
            # Perform single-click action.
            ::ms::treeview::Press $w $x $y
        }
        default { ::ms::treeview::Toggle $w $row }
    }

    return ""
}

## Drag
#
# Manages the **B1-Motion** event.
#
# Where:
#
# w     Should be the widget real address involved.
#
# x,y   Should be the (x,y) coordinates of the mouse pointer at the time of the event.
#
# It doesn't return anything.
proc ::ms::treeview::Drag { w x y } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # Check the press mode.
    switch -- $::ms::data($w,press,mode) {
        resize {
            # Resize.Drag
            {*}$address drag $::ms::data($w,resize,column) $x
        }
        heading {
            # Heading.Drag
            if { ([{*}$address identify region $x $y] eq "heading") && ([{*}$address identify column $x $y] eq $::ms::data($w,press,column)) } {
                {*}$address heading $::ms::data($w,press,column) state  pressed
            } else {
                {*}$address heading $::ms::data($w,press,column) state !pressed
            }
        }
    }

    return ""
}

## Motion
#
# Manages the **Motion** event by setting the cursor, active element, ...
#
# Where:
#
# w     Should be the widget real address involved.
#
# x,y   Should be the (x,y) coordinates of the mouse pointer at the time of the event.
#
# It doesn't return anything.
proc ::ms::treeview::Motion { w x y } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # Check the widget's region under the coordinates provided.
    set active_column {}
    set cursor        $::ms::current($w,cursor)
    switch -- [{*}$address identify region $x $y] {
        separator { set cursor  hresize }
        heading   { set active_column [{*}$address identify column $x $y] }
    }

    # If needed, change the cursor.
    if { [{*}$address cget -cursor] ne $cursor } {
        {*}$address configure -cursor $cursor
    }

    # Check if the active column is different than the one currently registered.
    if { $active_column != $::ms::data($w,active,column) } {
        # If needed, deactivate the currently registered active column.
        switch -- $::ms::data($w,active,column) {
            ""      {}
            default {
                try {
                    {*}$address heading $::ms::data($w,active,column) state !active
                } on error {} {
                    # Do Nothing.
                }
            }
        }

        # If needed, activate the current active column.
        switch -- $active_column {
            ""      {}
            default { {*}$address heading $active_column state active }
        }

        # Register the new active column.
        set ::ms::data($w,active,column) $active_column
    }

    return ""
}

#############################
##                         ##
##     OPEN/CLOSE ITEM     ##
##                         ##
#############################

# Note: The following procedures were inspired by their treeview equivalent ones.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## Open_Item
#
# Open an item.
#
# Where:
#
# w      Should be the widget real address involved.
#
# item   Should be the 'item' ID involved.
#
# It doesn't return anything.
proc ::ms::treeview::Open_Item { w item } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    {*}$address focus $item
    {*}$address item  $item -open true

    # Generate a **TreeviewOpen** event.
    event generate $w <<TreeviewOpen>>

    return ""
}

## Close_Item
#
# Close an item.
#
# Where:
#
# w      Should be the widget real address involved.
#
# item   Should be the 'item' ID involved.
#
# It doesn't return anything.
proc ::ms::treeview::Close_Item { w item } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    {*}$address item  $item -open false
    {*}$address focus $item

    # Generate a **TreeviewClose** event.
    event generate $w <<TreeviewClose>>

    return ""
}

## Toggle
#
# Set the open state of an item and generate the relative event
#
# Where:
#
# w      Should be the widget real address involved.
#
# item   Should be the 'item' ID involved.
#
# It doesn't return anything.
proc ::ms::treeview::Toggle { w item } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # Don't allow toggling on indicators that are not present in front of leaf items.
    switch -- [llength [{*}$address children $item]] {
        0   { return "" }
    }

    # Not a leaf, toggle!
    if { [{*}$address item $item -open] } {
        ::ms::treeview::Close_Item $w $item
    } else {
        ::ms::treeview::Open_Item  $w $item
    }

    return ""
}

## Toggle_Focus
#
# Toggle the focus state of an item.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::treeview::Toggle_Focus { w } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # If needed, toggle.
    set item [{*}$address focus]
    switch -- $item {
        ""      {}
        default { ::ms::treeview::Toggle $w $item }
    }

    return ""
}

###############################
##                           ##
##     SELECT OPERATIONS     ##
##                           ##
###############################

# Note: The following procedures were inspired by their treeview equivalent ones.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## Select
#
# Binding procedure for selection operations. See "Selection modes", below.
#
# Where:
#
# w     Should be the widget real address involved.
#
# x,y   Should be the (x,y) coordinates of the mouse pointer at the time of the event.
#
# op    Should be the 'operation' type.
#       Allowed values are 'choose', 'extend' or 'toggle'.
#
# It doesn't return anything.
proc ::ms::treeview::Select { w x y op } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # If needed, launch the corrispondent select operation.
    set item [{*}$address identify row $x $y]
    switch -- $item {
        ""      {}
        default { ::ms::treeview::Select_Op $w $item [::ms::treeview::Identify_Cell $w $x $y] $op }
    }

    return ""
}

## Select_Op
#
# Dispatch to appropriate selection operation depending on current value of 'selectmode'.
#
# Where:
#
# w      Should be the widget real address involved.
#
# item   Should be the 'item' ID involved.
#
# cell   Should be the 'cell' involved.
#
# op     Should be the 'operation' type.
#        Allowed values are 'choose', 'extend' or 'toggle'.
#
# It doesn't return anything.
proc ::ms::treeview::Select_Op { w item cell op } {
    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # Check the 'selectmode'.
    switch -- $::ms::current($w,selectmode) {
        none {
            {*}$address focus $item
            {*}$address see   $item
        }
        browse   { ::ms::treeview::Browse_To $w $item $cell }
        extended {
            # Check the operation type.
            switch -- $op {
                choose { ::ms::treeview::Browse_To $w $item $cell }
                toggle {
                    # Check if the 'cell' is the empty string or not.
                    switch -- $cell {
                        ""  {
                            {*}$address cellselection toggle [list $cell]

                            set ::ms::data($w,cell,anchor)    $cell
                            set ::ms::data($w,cell,anchor,op) add
                        }
                        default { {*}$address selection toggle [list $item] }
                    }
                }
                extend {
                    # Check if the 'cell' is the empty string or not.
                    switch -- $cell {
                        ""  {
                            # Check if the 'cell anchor' is the empty string or not.
                            switch -- $::ms::data($w,cell,anchor) {
                                ""      { ::ms::treeview::Browse_To $w $item $cell }
                                default { {*}$address cellselection $::ms::data($w,cell,anchor,op) $::ms::data($w,cell,anchor) $cell }
                            }
                        }
                        default {
                            # Check if the 'anchor' is the empty string or not.
                            set anchor [{*}$address focus]
                            switch -- $anchor {
                                ""      { ::ms::treeview::Browse_To $w $item $cell }
                                default { {*}$address selection set [::ms::treeview::Between $w $anchor $item] }
                            }
                        }
                    }
                }
            }
        }
    }

    return ""
}

##################################
##                              ##
##     UTILITIES PROCEDURES     ##
##                              ##
##################################

# Note: The following procedures were inspired by their treeview equivalent ones.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## Identify_Cell
#
# Locate the cell at coordinate.
# Only active when 'selecttype' is 'cell', and leaves cell empty otherwise.
# Down the call chain it is enough to check cell to know the selecttype.
#
# Where:
#
# w     Should be the widget real address involved.
#
# x,y   Should be the (x,y) coordinates of the mouse pointer at the time of the event.
#
# It doesn't return anything.
proc ::ms::treeview::Identify_Cell { w x y } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    # Check the current 'selecttype' option.
    switch -- $::ms::current($w,selecttype) {
        cell {
            # Later handling assumes that the column in the cell ID is of the format #N,
            # which is always the case from 'identify cell'.

            return [{*}$address identify cell $x $y]
        }
    }

    return ""
}

## Browse_To
#
# Navigate to specified item and set focus and selection.
#
# Where:
#
# w      Should be the widget real address involved.
#
# item   Should be the 'item' ID involved.
#
# cell   Should be the 'cell' involved.
#
# It doesn't return anything.
proc ::ms::treeview::Browse_To { w item cell } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    {*}$address focus $item
    {*}$address see   $item

    set ::ms::data($w,cell,anchor)    $cell
    set ::ms::data($w,cell,anchor,op) set

    # Check if the 'cell' is the empty string or not.
    switch -- $cell {
        ""      { {*}$address selection set     [list $item] }
        default { {*}$address cellselection set [list $cell] }
    }

    return ""
}

## Between
#
# Returns a list of all items between $item1 and $item2, in preorder traversal order.
# $item1 and $item2 may be in either order.
#
# NOTES: This routine is O(N) in the size of the tree.
#        There's probably a way to do this that's O(N) in the number
#        of items returned, but I'm not clever enough to figure it out.
#
# Return the 'between' value.
proc ::ms::treeview::Between { w item1 item2 } {
    set ::ttk::treeview::between          [list ]
    set ::ttk::treeview::selectingBetween 0

    ::ms::treeview::Scan_Between $w $item1 $item2 {}

    return $::ttk::treeview::between
}

## Scan_Between
#
# Recursive worker routine for 'ttk::treeview::between'.
#
# It doesn't return anything.
proc ::ms::treeview::Scan_Between { w item1 item2 item } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.treeview] }
    }

    if { ($item eq $item1) || ($item eq $item2) } {
        lappend ::ttk::treeview::between $item

        set ::ttk::treeview::selectingBetween [expr { !$::ttk::treeview::selectingBetween }]
    } elseif { $::ttk::treeview::selectingBetween } {
        lappend ::ttk::treeview::between $item
    }

    # Recursive cycle.
    foreach child [{*}$address children $item] {
        ::ms::treeview::Scan_Between $w $item1 $item2 $child
    }

    return ""
}

#*EOF*