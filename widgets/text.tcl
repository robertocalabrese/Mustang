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
package provide ::ms::text 0.1

###################################
##                               ##
##     _SIMPLE_TEXT BINDINGS     ##
##                               ##
###################################

# Allowing some modifiers combination.
switch -- [_tk windowingsystem] {
    aqua {
        _bind _Simple_Text <Option-KeyPress>         { # Enable binding }
        _bind _Simple_Text <Option-Shift-KeyPress>   { # Enable binding }
        _bind _Simple_Text <Control-KeyPress>        { # Enable binding }
        _bind _Simple_Text <Control-Option-KeyPress> { # Enable binding }
        _bind _Simple_Text <Control-Shift-KeyPress>  { # Enable binding }
        _bind _Simple_Text <Command-KeyPress>        { # Enable binding }
        _bind _Simple_Text <Command-Shift-KeyPress>  { # Enable binding }
    }
    default {
        _bind _Simple_Text <Alt-KeyPress>           { # Enable binding }
        _bind _Simple_Text <Alt-Shift-KeyPress>     { # Enable binding }
        _bind _Simple_Text <Control-KeyPress>       { # Enable binding }
        _bind _Simple_Text <Control-Alt-KeyPress>   { # Enable binding }
        _bind _Simple_Text <Control-Shift-KeyPress> { # Enable binding }
        _bind _Simple_Text <Meta-KeyPress>          { # Enable binding }
        _bind _Simple_Text <Meta-Shift-KeyPress>    { # Enable binding }
    }
}

# Backspace key
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the left of the cursor location.
_bind _Simple_Text <KeyPress-BackSpace> { ::ms::text::Backspace %W; break }

# ButtonPress-1
_bind _Simple_Text <ButtonPress-1> { ::ms::text::ButtonPress %W %x %y; break }

# Configure
_bind _Simple_Text <Configure> { ::ms::text::Configure %W; break }

# Control-Tab/Control-Shift-Tab
_bind _Simple_Text <Control-Tab>       { ::ms::text::Control_Tab %W +1; break }
_bind _Simple_Text <Control-Shift-Tab> { ::ms::text::Control_Tab %W -1; break }

# Cut/Copy/Paste/Clear
_bind _Simple_Text <<Cut>>   { ::ms::text::Cut   %W; break }
_bind _Simple_Text <<Copy>>  { ::ms::text::Copy  %W; break }
_bind _Simple_Text <<Paste>> { ::ms::text::Paste %W %x %y CLIPBOARD; break }
_bind _Simple_Text <<Clear>> { ::ms::text::Clear %W; break }

# Delete key
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the right of the cursor location.
_bind _Simple_Text <KeyPress-Delete>    { ::ms::text::Delete %W; break }
_bind _Simple_Text <KeyPress-KP_Delete> { ::ms::text::Delete %W; break }
_bind _Simple_Text <<DeleteChar>>       { ::ms::text::Delete %W; break }

# Delete from the insertion cursor till the end of the line.
switch -- [_tk windowingsystem] {
    aqua    { _bind _Simple_Text <Option-KeyPress-d> { ::ms::text::Delete_Till_Line_End %W; break } }
    default { _bind _Simple_Text <Alt-KeyPress-d>    { ::ms::text::Delete_Till_Line_End %W; break } }
}

# If a selection is present, delete the selected text, otherwise delete all the characters positioned
# to the right of the cursor location till the start of the next word.
_bind _Simple_Text <<DeleteWord>> { ::ms::text::Delete_Word %W; break }

# Disable the following bindings to prevent Tk to fire them up:
_bind _Simple_Text <Control-KeyPress-o>    { break }
_bind _Simple_Text <Meta-KeyPress-b>       { break }
_bind _Simple_Text <Meta-KeyPress-d>       { break }
_bind _Simple_Text <Meta-KeyPress-f>       { break }
_bind _Simple_Text <Meta-KeyPress-less>    { break }
_bind _Simple_Text <Meta-KeyPress-greater> { break }

# Disable the Escape key to prevent Tk from printing it.
_bind _Simple_Text <Escape> { break }

# Activate/Deactivate
_bind _Simple_Text <Activate>   { ::ms::text::Pathname_Cmd %W state !background; break }
_bind _Simple_Text <Deactivate> { ::ms::text::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Simple_Text <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Simple_Text <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Simple_Text <Destroy> { ::ms::text::Destroy %W; break }

# Enter/Leave
_bind _Simple_Text <Enter> { ::ms::text::Pathname_Cmd %W state  hover; break }
_bind _Simple_Text <Leave> { ::ms::text::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Simple_Text <FocusIn>  { ::ms::text::FocusIn  %W; break }
_bind _Simple_Text <FocusOut> { ::ms::text::FocusOut %W; break }

# Insert
_bind _Simple_Text <KeyPress-Insert>    { ::ms::text::Insert %W; break }
_bind _Simple_Text <KeyPress-KP_Insert> { ::ms::text::Insert %W; break }

# Key
_bind _Simple_Text <Key> { ::ms::text::Key %W %A; break }

# Return
_bind _Simple_Text <KeyPress-Return>   { ::ms::text::Return %W; break }
_bind _Simple_Text <KeyPress-KP_Enter> { ::ms::text::Return %W; break }

# Tk IME Text
_bind _Simple_Text <<TkStartIMEMarkedText>> { ::ms::text::Start_IME_Marked_Text %W; break }
_bind _Simple_Text <<TkEndIMEMarkedText>>   { ::ms::text::End_IME_Marked_Text   %W; break }
_bind _Simple_Text <<TkClearIMEMarkedText>> { ::ms::text::Clear_IME_Marked_Text %W; break }
_bind _Simple_Text <<TkAccentBackspace>>    { ::ms::text::Accent_Backspace      %W; break }

# Transpose
_bind _Simple_Text <Control-KeyPress-t> { ::ms::text::Transpose %W; break }

# Undo/Redo
_bind _Simple_Text <<Undo>> { ::ms::text::Undo %W; break }
_bind _Simple_Text <<Redo>> { ::ms::text::Redo %W; break }

# Scan or Paste.
_bind _Simple_Text <Button-2>         { ::ms::text::Scan_Or_Paste %W %x %y "Button-2"; break }
_bind _Simple_Text <B2-Motion>        { ::ms::text::Scan_Or_Paste %W %x %y "B2-Motion"; break }
_bind _Simple_Text <ButtonRelease-2>  { ::ms::text::Scan_Or_Paste %W %x %y "ButtonRelease-2"; break }

_bind _Simple_Text <Button-3>         { ::ms::text::Scan_Or_Paste %W %x %y "Button-3"; break }
_bind _Simple_Text <B3-Motion>        { ::ms::text::Scan_Or_Paste %W %x %y "B3-Motion"; break }
_bind _Simple_Text <ButtonRelease-3>  { ::ms::text::Scan_Or_Paste %W %x %y "ButtonRelease-3"; break }

_bind _Simple_Text <<PasteSelection>> { ::ms::text::Scan_Or_Paste %W %x %y "PasteSelection"; break }

# PageUp/PageDown/PageLeft/PageRight
_bind _Simple_Text <Prior>         { ::ms::text::PageUp    %W; break }
_bind _Simple_Text <Next>          { ::ms::text::PageDown  %W; break }
_bind _Simple_Text <Control-Prior> { ::ms::text::PageLeft  %W; break }
_bind _Simple_Text <Control-Next>  { ::ms::text::PageRight %W; break }

# Go to the start/end of the line.
_bind _Simple_Text <<LineStart>> { ::ms::text::Line_Start %W; break }
_bind _Simple_Text <<LineEnd>>   { ::ms::text::Line_End   %W; break }

# Go to the start/end of the entire text.
_bind _Simple_Text <<LineTop>>    { ::ms::text::Line_Top    %W; break }
_bind _Simple_Text <<LineBottom>> { ::ms::text::Line_Bottom %W; break }

# Select all/none.
_bind _Simple_Text <<SelectAll>>  { ::ms::text::Select_All  %W; break }
_bind _Simple_Text <<SelectNone>> { ::ms::text::Select_None %W; break }

# Select from the insertion cursor to the previous/next character.
_bind _Simple_Text <<SelectPrevChar>> { ::ms::text::Select_Previous_Char %W; break }
_bind _Simple_Text <<SelectNextChar>> { ::ms::text::Select_Next_Char     %W; break }

# Select from the insertion cursor to the previous/next word.
_bind _Simple_Text <<SelectPrevWord>> { ::ms::text::Select_Previous_Word %W; break }
_bind _Simple_Text <<SelectNextWord>> { ::ms::text::Select_Next_Word     %W; break }

# Select from the insertion cursor to the previous/next paragraph.
_bind _Simple_Text <<SelectPrevPara>> { ::ms::text::Select_Previous_Paragraph %W; break }
_bind _Simple_Text <<SelectNextPara>> { ::ms::text::Select_Next_Paragraph     %W; break }

# Select from the insertion cursor to the previous/next line.
_bind _Simple_Text <<SelectPrevLine>> { ::ms::text::Select_Previous_Line %W; break }
_bind _Simple_Text <<SelectNextLine>> { ::ms::text::Select_Next_Line     %W; break }

# Select from the insertion cursor to the start/end of the line.
_bind _Simple_Text <<SelectLineStart>> { ::ms::text::Select_Line_Start %W; break }
_bind _Simple_Text <<SelectLineEnd>>   { ::ms::text::Select_Line_End   %W; break }

# Select from the insertion cursor to the start/end of the entire text.
_bind _Simple_Text <<SelectLineTop>>    { ::ms::text::Select_Line_Top    %W; break }
_bind _Simple_Text <<SelectLineBottom>> { ::ms::text::Select_Line_Bottom %W; break }

# Select from the insertion cursor to one page up or down.
_bind _Simple_Text <Shift-Prior> { ::ms::text::Select_PageUp   %W; break }
_bind _Simple_Text <Shift-Next>  { ::ms::text::Select_PageDown %W; break }

# If the widget state is normal, move the insertion cursor to the previous or next character.
# If the widget state is disabled, try to move the widget horizontal scrollbar (if any) by one unit towards the
# left or the right ; if it's not possible, try to find the innermost widget's scrollable parent with an active
# horizontal scrollbar and move that scrollbar by one unit towards the left or the right, otherwise don't do anything.
_bind _Simple_Text <<PrevChar>> { ::ms::text::Previous_Char %W; break }
_bind _Simple_Text <<NextChar>> { ::ms::text::Next_Char     %W; break }

# If the widget state is normal, move the insertion cursor to the previous or next line.
# If the widget state is disabled, try to move the widget vertical scrollbar (if any) by one unit towards the
# top or the bottom; if it's not possible, try to find the innermost widget's scrollable parent with an active
# vertical scrollbar and move that scrollbar by one unit towards the top or the bottom, otherwise don't do anything.
_bind _Simple_Text <<PrevLine>> { ::ms::text::Previous_Line %W; break }
_bind _Simple_Text <<NextLine>> { ::ms::text::Next_Line     %W; break }

# If the widget state is normal, move the insertion cursor to the previous or next word.
# If the widget state is disabled, try to move the widget horizontal scrollbar (if any) by one page towards the
# left or the right; if it's not possible, try to find the innermost widget's scrollable parent with an active
# horizontal scrollbar and move that scrollbar by one page towards the left or right, otherwise don't do anything.
_bind _Simple_Text <<PrevWord>> { ::ms::text::Previous_Word %W; break }
_bind _Simple_Text <<NextWord>> { ::ms::text::Next_Word     %W; break }

# If the widget state is normal, move the insertion cursor to the previous or next paragraph.
# If the widget state is disabled, try to move the widget vertical scrollbar (if any) by one pagetowards the
# top or the bottom; if it's not possible, try to find the innermost widget's scrollable parent with an active
# vertical scrollbar and move that scrollbar by one page towards the top or bottom, otherwise don't do anything.
_bind _Simple_Text <<PrevPara>> { ::ms::text::Previous_Paragraph %W; break }
_bind _Simple_Text <<NextPara>> { ::ms::text::Next_Paragraph     %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that scrollbar
# by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Text <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
# by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Text <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that scrollbar
# by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Text <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
# by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Simple_Text <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that
#       scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that
#       scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Simple_Text <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar and move that
#       scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move that
#       scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Simple_Text <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

#######################################
##                                   ##
##     _SCROLLABLE_TEXT BINDINGS     ##
##                                   ##
#######################################

# Allowing some modifiers combination.
switch -- [_tk windowingsystem] {
    aqua {
        _bind _Scrollable_Text <Option-KeyPress>         { # Enable binding }
        _bind _Scrollable_Text <Option-Shift-KeyPress>   { # Enable binding }
        _bind _Scrollable_Text <Control-KeyPress>        { # Enable binding }
        _bind _Scrollable_Text <Control-Option-KeyPress> { # Enable binding }
        _bind _Scrollable_Text <Control-Shift-KeyPress>  { # Enable binding }
        _bind _Scrollable_Text <Command-KeyPress>        { # Enable binding }
        _bind _Scrollable_Text <Command-Shift-KeyPress>  { # Enable binding }
    }
    default {
        _bind _Scrollable_Text <Alt-KeyPress>           { # Enable binding }
        _bind _Scrollable_Text <Alt-Shift-KeyPress>     { # Enable binding }
        _bind _Scrollable_Text <Control-KeyPress>       { # Enable binding }
        _bind _Scrollable_Text <Control-Alt-KeyPress>   { # Enable binding }
        _bind _Scrollable_Text <Control-Shift-KeyPress> { # Enable binding }
        _bind _Scrollable_Text <Meta-KeyPress>          { # Enable binding }
        _bind _Scrollable_Text <Meta-Shift-KeyPress>    { # Enable binding }
    }
}

# Backspace key
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the left of the cursor location.
_bind _Scrollable_Text <KeyPress-BackSpace> { ::ms::text::Backspace [_winfo parent %W]; break }

# ButtonPress-1
_bind _Scrollable_Text <ButtonPress-1> { ::ms::text::ButtonPress [_winfo parent %W] %x %y; break }

# Configure
_bind _Scrollable_Text <Configure> { ::ms::text::Configure [_winfo parent %W]; break }

# Contextual menu
_bind _Scrollable_Text <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

# Control-Tab/Control-Shift-Tab
_bind _Scrollable_Text <Control-Tab>       { ::ms::text::Control_Tab [_winfo parent %W] +1; break }
_bind _Scrollable_Text <Control-Shift-Tab> { ::ms::text::Control_Tab [_winfo parent %W] -1; break }

# Cut/Copy/Paste/Clear
_bind _Scrollable_Text <<Cut>>   { ::ms::text::Cut   [_winfo parent %W]; break }
_bind _Scrollable_Text <<Copy>>  { ::ms::text::Copy  %W; break }
_bind _Scrollable_Text <<Paste>> { ::ms::text::Paste [_winfo parent %W] %x %y CLIPBOARD; break }
_bind _Scrollable_Text <<Clear>> { ::ms::text::Clear [_winfo parent %W]; break }

# Delete key
# If a selection is present, delete the selected text, otherwise delete a character positioned
# to the right of the cursor location.
_bind _Scrollable_Text <KeyPress-Delete>    { ::ms::text::Delete [_winfo parent %W]; break }
_bind _Scrollable_Text <KeyPress-KP_Delete> { ::ms::text::Delete [_winfo parent %W]; break }
_bind _Scrollable_Text <<DeleteChar>>       { ::ms::text::Delete [_winfo parent %W]; break }

# Delete from the insertion cursor till the end of the line.
switch -- [_tk windowingsystem] {
    aqua    { _bind _Scrollable_Text <Option-KeyPress-d> { ::ms::text::Delete_Till_Line_End [_winfo parent %W]; break } }
    default { _bind _Scrollable_Text <Alt-KeyPress-d>    { ::ms::text::Delete_Till_Line_End [_winfo parent %W]; break } }
}

# If a selection is present, delete the selected text, otherwise delete all the characters positioned
# to the right of the cursor location till the start of the next word.
_bind _Scrollable_Text <<DeleteWord>> { ::ms::text::Delete_Word [_winfo parent %W]; break }

# Disable the following bindings to prevent Tk to fire them up:
_bind _Scrollable_Text <Control-KeyPress-o>    { break }
_bind _Scrollable_Text <Meta-KeyPress-b>       { break }
_bind _Scrollable_Text <Meta-KeyPress-d>       { break }
_bind _Scrollable_Text <Meta-KeyPress-f>       { break }
_bind _Scrollable_Text <Meta-KeyPress-less>    { break }
_bind _Scrollable_Text <Meta-KeyPress-greater> { break }

# Disable the Escape key to prevent Tk from printing it.
_bind _Scrollable_Text <Escape> { break }

# Enter/Leave
_bind _Scrollable_Text <Enter> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }
_bind _Scrollable_Text <Leave> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }

# FocusIn/FocusOut
_bind _Scrollable_Text <FocusIn>  { ::ms::text::FocusIn  [_winfo parent %W]; break }
_bind _Scrollable_Text <FocusOut> { ::ms::text::FocusOut [_winfo parent %W]; break }

# Insert
_bind _Scrollable_Text <KeyPress-Insert>    { ::ms::text::Insert [_winfo parent %W]; break }
_bind _Scrollable_Text <KeyPress-KP_Insert> { ::ms::text::Insert [_winfo parent %W]; break }

# Key
_bind _Scrollable_Text <Key> { ::ms::text::Key [_winfo parent %W] %A; break }

# Return
_bind _Scrollable_Text <KeyPress-Return>   { ::ms::text::Return [_winfo parent %W]; break }
_bind _Scrollable_Text <KeyPress-KP_Enter> { ::ms::text::Return [_winfo parent %W]; break }

# Tk IME Text
_bind _Scrollable_Text <<TkStartIMEMarkedText>> { ::ms::text::Start_IME_Marked_Text [_winfo parent %W]; break }
_bind _Scrollable_Text <<TkEndIMEMarkedText>>   { ::ms::text::End_IME_Marked_Text   [_winfo parent %W]; break }
_bind _Scrollable_Text <<TkClearIMEMarkedText>> { ::ms::text::Clear_IME_Marked_Text [_winfo parent %W]; break }
_bind _Scrollable_Text <<TkAccentBackspace>>    { ::ms::text::Accent_Backspace      [_winfo parent %W]; break }

# Transpose
_bind _Scrollable_Text <Control-KeyPress-t> { ::ms::text::Transpose [_winfo parent %W]; break }

# Undo/Redo
_bind _Scrollable_Text <<Undo>> { ::ms::text::Undo [_winfo parent %W]; break }
_bind _Scrollable_Text <<Redo>> { ::ms::text::Redo [_winfo parent %W]; break }

# Scan or Paste.
_bind _Scrollable_Text <Button-2>         { ::ms::text::Scan_Or_Paste %W %x %y "Button-2"; break }
_bind _Scrollable_Text <B2-Motion>        { ::ms::text::Scan_Or_Paste %W %x %y "B2-Motion"; break }
_bind _Scrollable_Text <ButtonRelease-2>  { ::ms::text::Scan_Or_Paste %W %x %y "ButtonRelease-2"; break }

_bind _Scrollable_Text <Button-3>         { ::ms::text::Scan_Or_Paste %W %x %y "Button-3"; break }
_bind _Scrollable_Text <B3-Motion>        { ::ms::text::Scan_Or_Paste %W %x %y "B3-Motion"; break }
_bind _Scrollable_Text <ButtonRelease-3>  { ::ms::text::Scan_Or_Paste %W %x %y "ButtonRelease-3"; break }

_bind _Scrollable_Text <<PasteSelection>> { ::ms::text::Scan_Or_Paste %W %x %y "PasteSelection"; break }

# PageUp/PageDown/PageLeft/PageRight
_bind _Scrollable_Text <Prior>         { ::ms::text::PageUp    [_winfo parent %W]; break }
_bind _Scrollable_Text <Next>          { ::ms::text::PageDown  [_winfo parent %W]; break }
_bind _Scrollable_Text <Control-Prior> { ::ms::text::PageLeft  [_winfo parent %W]; break }
_bind _Scrollable_Text <Control-Next>  { ::ms::text::PageRight [_winfo parent %W]; break }

# Go to the start/end of the line.
_bind _Scrollable_Text <<LineStart>> { ::ms::text::Line_Start [_winfo parent %W]; break }
_bind _Scrollable_Text <<LineEnd>>   { ::ms::text::Line_End   [_winfo parent %W]; break }

# Go to the start/end of the entire text.
_bind _Scrollable_Text <<LineTop>>    { ::ms::text::Line_Top    [_winfo parent %W]; break }
_bind _Scrollable_Text <<LineBottom>> { ::ms::text::Line_Bottom [_winfo parent %W]; break }

# Select all/none.
_bind _Scrollable_Text <<SelectAll>>  { ::ms::text::Select_All  [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNone>> { ::ms::text::Select_None [_winfo parent %W]; break }

# Select from the insertion cursor to the previous/next character.
_bind _Scrollable_Text <<SelectPrevChar>> { ::ms::text::Select_Previous_Char [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNextChar>> { ::ms::text::Select_Next_Char     [_winfo parent %W]; break }

# Select from the insertion cursor to the previous/next word.
_bind _Scrollable_Text <<SelectPrevWord>> { ::ms::text::Select_Previous_Word [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNextWord>> { ::ms::text::Select_Next_Word     [_winfo parent %W]; break }

# Select from the insertion cursor to the previous/next paragraph.
_bind _Scrollable_Text <<SelectPrevPara>> { ::ms::text::Select_Previous_Paragraph [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNextPara>> { ::ms::text::Select_Next_Paragraph     [_winfo parent %W]; break }

# Select from the insertion cursor to the previous/next line.
_bind _Scrollable_Text <<SelectPrevLine>> { ::ms::text::Select_Previous_Line [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectNextLine>> { ::ms::text::Select_Next_Line     [_winfo parent %W]; break }

# Select from the insertion cursor to the start/end of the line.
_bind _Scrollable_Text <<SelectLineStart>> { ::ms::text::Select_Line_Start [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectLineEnd>>   { ::ms::text::Select_Line_End   [_winfo parent %W]; break }

# Select from the insertion cursor to the start/end of the entire text.
_bind _Scrollable_Text <<SelectLineTop>>    { ::ms::text::Select_Line_Top    [_winfo parent %W]; break }
_bind _Scrollable_Text <<SelectLineBottom>> { ::ms::text::Select_Line_Bottom [_winfo parent %W]; break }

# Select from the insertion cursor to one page up or down.
_bind _Scrollable_Text <Shift-Prior> { ::ms::text::Select_PageUp   [_winfo parent %W]; break }
_bind _Scrollable_Text <Shift-Next>  { ::ms::text::Select_PageDown [_winfo parent %W]; break }

# If the widget state is normal, move the insertion cursor to the previous or next character.
# If the widget state is disabled, try to move the widget horizontal scrollbar (if any) by one unit towards the
# left or the right ; if it's not possible, try to find the innermost widget's scrollable parent with an active
# horizontal scrollbar and move that scrollbar by one unit towards the left or the right, otherwise don't do anything.
_bind _Scrollable_Text <<PrevChar>> { ::ms::text::Previous_Char [_winfo parent %W]; break }
_bind _Scrollable_Text <<NextChar>> { ::ms::text::Next_Char     [_winfo parent %W]; break }

# If the widget state is normal, move the insertion cursor to the previous or next line.
# If the widget state is disabled, try to move the widget vertical scrollbar (if any) by one unit towards the
# top or the bottom; if it's not possible, try to find the innermost widget's scrollable parent with an active
# vertical scrollbar and move that scrollbar by one unit towards the top or the bottom, otherwise don't do anything.
_bind _Scrollable_Text <<PrevLine>> { ::ms::text::Previous_Line [_winfo parent %W]; break }
_bind _Scrollable_Text <<NextLine>> { ::ms::text::Next_Line     [_winfo parent %W]; break }

# If the widget state is normal, move the insertion cursor to the previous or next word.
# If the widget state is disabled, try to move the widget horizontal scrollbar (if any) by one page towards the
# left or the right; if it's not possible, try to find the innermost widget's scrollable parent with an active
# horizontal scrollbar and move that scrollbar by one page towards the left or right, otherwise don't do anything.
_bind _Scrollable_Text <<PrevWord>> { ::ms::text::Previous_Word [_winfo parent %W]; break }
_bind _Scrollable_Text <<NextWord>> { ::ms::text::Next_Word     [_winfo parent %W]; break }

# If the widget state is normal, move the insertion cursor to the previous or next paragraph.
# If the widget state is disabled, try to move the widget vertical scrollbar (if any) by one pagetowards the
# top or the bottom; if it's not possible, try to find the innermost widget's scrollable parent with an active
# vertical scrollbar and move that scrollbar by one page towards the top or bottom, otherwise don't do anything.
_bind _Scrollable_Text <<PrevPara>> { ::ms::text::Previous_Paragraph [_winfo parent %W]; break }
_bind _Scrollable_Text <<NextPara>> { ::ms::text::Next_Paragraph     [_winfo parent %W]; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the text object by one unit up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Text <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's horizontal scrollbar is active, move the text object by one unit left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Text <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the text object by one page up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Text <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

# If the widget's horizontal scrollbar is active, move the text object by one page left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scrollable_Text <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the text object by one unit left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the text object by one unit up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scrollable_Text <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - If the widget's horizontal scrollbar is active, move the text object by one page left or right
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - If the widget's vertical scrollbar is active, move the text object by one page up or down
#       (depending on the touchpad direction).
#       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Scrollable_Text <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }

# Create the mustang **text** package.
namespace eval ::ms::text {}

# Rename the original Tk **text** command.
rename text _text

# Create an alias for the mustang **text** command.
interp alias {} text {} ::ms::text::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **text** widget command.
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
proc ::ms::text::Command { window { args "" } } {
    # For the time being we launch the Tk original command with one caveat,
    # the address provided must be a real address.
    # Short addresses are not covered until the new command is written.
    _text $window {*}$args
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
proc ::ms::text::Pathname_Cmd { w cmd args } {}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any text widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::text::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*