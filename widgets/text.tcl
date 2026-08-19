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

#################################
##                             ##
##     _HULL_TEXT BINDINGS     ##
##                             ##
#################################

# Activate/Deactivate
_bind _Hull_Text <Activate>   { ::ms::text::Pathname_Cmd %W state !background; break }
_bind _Hull_Text <Deactivate> { ::ms::text::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Hull_Text <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Hull_Text <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Hull_Text <Destroy> { ::ms::text::Destroy %W; break }

# FocusIn/FocusOut
_bind _Hull_Text <FocusIn>  { ::ms::text::FocusIn  %W; break }
_bind _Hull_Text <FocusOut> { ::ms::text::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Text <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Text <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Text <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Hull_Text <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Hull_Text <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Hull_Text <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

########################################
##                                    ##
##     _H_SCROLLBAR_TEXT BINDINGS     ##
##                                    ##
########################################

# ButtonPress-1
_bind _H_Scrollbar_Text <ButtonPress-1>   { ::ms::text::Scrollbar_ButtonPress [_winfo parent %W] horizontal %x %y; break }
_bind _H_Scrollbar_Text <B1-Motion>       { ::ms::text::Scrollbar_Drag        [_winfo parent %W] horizontal %x %y; break }
_bind _H_Scrollbar_Text <ButtonRelease-1> { ::ms::text::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _H_Scrollbar_Text <Enter> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }
_bind _H_Scrollbar_Text <Leave> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's horizontal scrollbar is active, move the text object by one unit left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _H_Scrollbar_Text <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
_bind _H_Scrollbar_Text <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

# If the widget's horizontal scrollbar is active, move the text object by one page left or right
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _H_Scrollbar_Text <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
_bind _H_Scrollbar_Text <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal and vertical.
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
# In this case, only the horizontal plane is involved.
#
# If the widget's horizontal scrollbar is active, move the text object by one unit left or right
# (depending on the touchpad direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the touchpad direction).
# If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
_bind _H_Scrollbar_Text <TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal and vertical.
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
# In this case, only the horizontal plane is involved.
#
# If the widget's horizontal scrollbar is active, move the text object by one page left or right
# (depending on the touchpad direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the touchpad direction).
# If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
_bind _H_Scrollbar_Text <Control-TouchpadScroll> { ::ms::Touchpad_Widget_X [_winfo parent %W] %# %D pages; break }

########################################
##                                    ##
##     _V_SCROLLBAR_TEXT BINDINGS     ##
##                                    ##
########################################

# ButtonPress-1
_bind _V_Scrollbar_Text <ButtonPress-1>   { ::ms::text::Scrollbar_ButtonPress [_winfo parent %W] vertical %x %y; break }
_bind _V_Scrollbar_Text <B1-Motion>       { ::ms::text::Scrollbar_Drag        [_winfo parent %W] vertical %x %y; break }
_bind _V_Scrollbar_Text <ButtonRelease-1> { ::ms::text::Scrollbar_ButtonRelease; break }

# Enter/Leave
_bind _V_Scrollbar_Text <Enter> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }
_bind _V_Scrollbar_Text <Leave> { ::ms::text::Hover [_winfo parent %W] %X %Y; break }

# Mousewheel and Touchpad

# If the widget's vertical scrollbar is active, move the text object by one unit up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _V_Scrollbar_Text <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

# If the widget's vertical scrollbar is active, move the text object by one page up or down
# (depending on the mousewheel direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _V_Scrollbar_Text <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal and vertical.
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
# In this case, only the vertical plane is involved.
#
# If the widget's vertical scrollbar is active, move the text object by one unit up or down
# (depending on the touchpad direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the touchpad direction).
# If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _V_Scrollbar_Text <TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D units; break }

# This binding movement will happen on two different planes, horizontal and vertical.
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
# In this case, only the vertical plane is involved.
#
# If the widget's vertical scrollbar is active, move the text object by one page up or down
# (depending on the touchpad direction).
# Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the touchpad direction).
# If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _V_Scrollbar_Text <Control-TouchpadScroll> { ::ms::Touchpad_Widget_Y [_winfo parent %W] %# %D pages; break }

# Create the mustang **text** package.
namespace eval ::ms::text {
    # Set the 'non-styleable' text option list.
    set ::ms::text(non_styleable,options) [list autoseparators \
                                                blockcursor \
                                                class \
                                                cmenu \
                                                endline \
                                                exportselection \
                                                insertofftime \
                                                insertontime \
                                                insertunfocussed \
                                                insertwidth \
                                                maxundo \
                                                scrollable \
                                                setgrid \
                                                spacing1 \
                                                spacing2 \
                                                spacing3 \
                                                startline \
                                                state \
                                                style \
                                                tabs \
                                                tabstyle \
                                                takefocus \
                                                undo \
                                                wrap \
                                                xscrollcommand \
                                                yscrollcommand];

    # Set the 'styleable' text option list.
    set ::ms::text(styleable,options) [list background \
                                            bordercolor \
                                            borderwidth \
                                            columns \
                                            cursor \
                                            font \
                                            foreground \
                                            inactiveselectbackground \
                                            insertbackground \
                                            insertborderwidth \
                                            padding \
                                            relief \
                                            rows \
                                            selectbackground \
                                            selectborderwidth \
                                            selectforeground \
                                            shellbackground];

    # Set the default 'non-styleable' text options values.
    set ::ms::default(text,autoseparators)   1
    set ::ms::default(text,blockcursor)      0
    set ::ms::default(text,class)            Text
    set ::ms::default(text,cmenu)            {}
    set ::ms::default(text,endline)          {}
    set ::ms::default(text,exportselection)  1
    set ::ms::default(text,insertofftime)    300
    set ::ms::default(text,insertontime)     600
    set ::ms::default(text,insertunfocussed) none
    set ::ms::default(text,insertwidth)      2
    set ::ms::default(text,maxundo)          0
    set ::ms::default(text,scrollable)       false
    set ::ms::default(text,setgrid)          0
    set ::ms::default(text,spacing1)         0
    set ::ms::default(text,spacing2)         0
    set ::ms::default(text,spacing3)         0
    set ::ms::default(text,startline)        {}
    set ::ms::default(text,state)            normal
    set ::ms::default(text,style)            Text
    set ::ms::default(text,tabs)             {}
    set ::ms::default(text,tabstyle)         wordprocessor
    set ::ms::default(text,takefocus)        0
    set ::ms::default(text,undo)             0
    set ::ms::default(text,wrap)             word
    set ::ms::default(text,xscrollcommand)   {}
    set ::ms::default(text,yscrollcommand)   {}

    # Note: The default 'styleable' text options values are always defined inside the current theme.
}

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
            set ::ms::default($w,autoseparators)   $::ms::default(text,autoseparators)
            set ::ms::default($w,blockcursor)      $::ms::default(text,blockcursor)
            set ::ms::default($w,class)            $::ms::default(text,class)
            set ::ms::default($w,cmenu)            $::ms::default(text,cmenu)
            set ::ms::default($w,endline)          $::ms::default(text,endline)
            set ::ms::default($w,exportselection)  $::ms::default(text,exportselection)
            set ::ms::default($w,insertofftime)    $::ms::default(text,insertofftime)
            set ::ms::default($w,insertontime)     $::ms::default(text,insertontime)
            set ::ms::default($w,insertunfocussed) $::ms::default(text,insertunfocussed)
            set ::ms::default($w,insertwidth)      $::ms::default(text,insertwidth)
            set ::ms::default($w,maxundo)          $::ms::default(text,maxundo)
            set ::ms::default($w,scrollable)       $::ms::default(text,scrollable)
            set ::ms::default($w,setgrid)          $::ms::default(text,setgrid)
            set ::ms::default($w,spacing1)         $::ms::default(text,spacing1)
            set ::ms::default($w,spacing2)         $::ms::default(text,spacing2)
            set ::ms::default($w,spacing3)         $::ms::default(text,spacing3)
            set ::ms::default($w,startline)        $::ms::default(text,startline)
            set ::ms::default($w,state)            $::ms::default(text,state)
            set ::ms::default($w,style)            $::ms::default(text,style)
            set ::ms::default($w,tabs)             $::ms::default(text,tabs)
            set ::ms::default($w,tabstyle)         $::ms::default(text,tabstyle)
            set ::ms::default($w,takefocus)        $::ms::default(text,takefocus)
            set ::ms::default($w,undo)             $::ms::default(text,undo)
            set ::ms::default($w,wrap)             $::ms::default(text,wrap)
            set ::ms::default($w,xscrollcommand)   $::ms::default(text,xscrollcommand)
            set ::ms::default($w,yscrollcommand)   $::ms::default(text,yscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,autoseparators)   $::ms::default(text,autoseparators)
            set ::ms::current($w,blockcursor)      $::ms::default(text,blockcursor)
            set ::ms::current($w,class)            $::ms::default(text,class)
            set ::ms::current($w,cmenu)            $::ms::default(text,cmenu)
            set ::ms::current($w,endline)          $::ms::default(text,endline)
            set ::ms::current($w,exportselection)  $::ms::default(text,exportselection)
            set ::ms::current($w,insertofftime)    $::ms::default(text,insertofftime)
            set ::ms::current($w,insertontime)     $::ms::default(text,insertontime)
            set ::ms::current($w,insertunfocussed) $::ms::default(text,insertunfocussed)
            set ::ms::current($w,insertwidth)      $::ms::default(text,insertwidth)
            set ::ms::current($w,maxundo)          $::ms::default(text,maxundo)
            set ::ms::current($w,scrollable)       $::ms::default(text,scrollable)
            set ::ms::current($w,setgrid)          $::ms::default(text,setgrid)
            set ::ms::current($w,spacing1)         $::ms::default(text,spacing1)
            set ::ms::current($w,spacing2)         $::ms::default(text,spacing2)
            set ::ms::current($w,spacing3)         $::ms::default(text,spacing3)
            set ::ms::current($w,startline)        $::ms::default(text,startline)
            set ::ms::current($w,state)            $::ms::default(text,state)
            set ::ms::current($w,style)            $::ms::default(text,style)
            set ::ms::current($w,tabs)             $::ms::default(text,tabs)
            set ::ms::current($w,tabstyle)         $::ms::default(text,tabstyle)
            set ::ms::current($w,takefocus)        $::ms::default(text,takefocus)
            set ::ms::current($w,undo)             $::ms::default(text,undo)
            set ::ms::current($w,wrap)             $::ms::default(text,wrap)
            set ::ms::current($w,xscrollcommand)   $::ms::default(text,xscrollcommand)
            set ::ms::current($w,yscrollcommand)   $::ms::default(text,yscrollcommand)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) text
            set ::ms::data($w,statespec) $::ms::data(statespec,normal)
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
            #       To make a text styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **text** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)               Tk
            set ::ms::managed_by($w,bordercolor)              Tk
            set ::ms::managed_by($w,borderwidth)              Tk
            set ::ms::managed_by($w,columns)                  Tk
            set ::ms::managed_by($w,cursor)                   Tk
            set ::ms::managed_by($w,font)                     Tk
            set ::ms::managed_by($w,foreground)               Tk
            set ::ms::managed_by($w,inactiveselectbackground) Tk
            set ::ms::managed_by($w,insertbackground)         Tk
            set ::ms::managed_by($w,insertborderwidth)        Tk
            set ::ms::managed_by($w,padding)                  Tk
            set ::ms::managed_by($w,relief)                   Tk
            set ::ms::managed_by($w,rows)                     Tk
            set ::ms::managed_by($w,selectbackground)         Tk
            set ::ms::managed_by($w,selectborderwidth)        Tk
            set ::ms::managed_by($w,selectforeground)         Tk
            set ::ms::managed_by($w,shellbackground)          Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -autoseparators {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,autoseparators) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,autoseparators) 1 }
                        }
                    }
                    -blockcursor {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,blockcursor) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,blockcursor) 1 }
                        }
                    }
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
                    -class { set ::ms::current($w,class) $value }
                    -cmenu {
                        set value [string trim $value]
                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                            set ::ms::current($w,cmenu) $value
                        }
                    }
                    -columns {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value < 1 } {
                                    continue
                                }

                                set ::ms::current($w,columns)    $value
                                set ::ms::managed_by($w,columns) developer
                            }
                        }
                    }
                    -cursor {
                        set value [string tolower $value]
                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                            set ::ms::current($w,cursor)    $value
                            set ::ms::managed_by($w,cursor) developer
                        }
                    }
                    -endline {
                        switch -- $value {
                            ""      { set ::ms::current($w,endline) {} }
                            default {
                                switch -- [string is integer -strict $value] {
                                    1   {
                                        if { $value >= 0 } {
                                            set ::ms::current($w,endline) $value
                                        }
                                    }
                                }
                            }
                        }
                    }
                    -exportselection {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,exportselection) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,exportselection) 1 }
                        }
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
                    -inactiveselectbackground {
                        switch -- $value {
                            ""      {}
                            default {
                                set value [::ms::Check_Color $value invalid]
                                switch -- $value {
                                    invalid { continue }
                                }
                            }
                        }

                        set ::ms::current($w,inactiveselectbackground)    $value
                        set ::ms::managed_by($w,inactiveselectbackground) developer
                    }
                    -insertbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertbackground)    $value
                        set ::ms::managed_by($w,insertbackground) developer
                    }
                    -insertborderwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertborderwidth)    $value
                        set ::ms::managed_by($w,insertborderwidth) developer
                    }
                    -insertofftime {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value >= 0 } {
                                    set ::ms::current($w,insertofftime) $value
                                }
                            }
                        }
                    }
                    -insertontime {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,insertontime) $value
                                }
                            }
                        }
                    }
                    -insertunfocussed {
                        set value [string tolower $value]
                        switch -- $value {
                            none   -
                            hollow -
                            solid  { set ::ms::current($w,insertunfocussed) $value }
                        }
                    }
                    -insertwidth {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,insertwidth) $value
                                }
                            }
                        }
                    }
                    -maxundo {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,maxundo) $value
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
                    -relief {
                        set value [string tolower $value]
                        switch -- $value {
                            flat   -
                            groove -
                            raised -
                            ridge  -
                            solid  -
                            sunken {
                                set ::ms::current($w,relief)    $value
                                set ::ms::managed_by($w,relief) developer
                            }
                        }
                    }
                    -rows {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value < 1 } {
                                    continue
                                }

                                set ::ms::current($w,rows)    $value
                                set ::ms::managed_by($w,rows) developer
                            }
                        }
                    }
                    -scrollable {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,scrollable) false }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,scrollable) true }
                        }
                    }
                    -selectbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,selectbackground)    $value
                        set ::ms::managed_by($w,selectbackground) developer
                    }
                    -selectborderwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,selectborderwidth)    $value
                        set ::ms::managed_by($w,selectborderwidth) developer
                    }
                    -selectforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,selectforeground)    $value
                        set ::ms::managed_by($w,selectforeground) developer
                    }
                    -setgrid {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,setgrid) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,setgrid) 1 }
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
                    -spacing1 {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,spacing1) $value
                    }
                    -spacing2 {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,spacing2) $value
                    }
                    -spacing3 {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,spacing3) $value
                    }
                    -startline {
                        switch -- $value {
                            ""      { set ::ms::current($w,startline) {} }
                            default {
                                switch -- [string is integer -strict $value] {
                                    1   {
                                        if { $value >= 0 } {
                                            set ::ms::current($w,startline) $value
                                        }
                                    }
                                }
                            }
                        }
                    }
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            disabled {
                                set ::ms::current($w,state) disabled

                                # Set the widget dynamic state to 'disabled'
                                set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) 3 3 "disabled"]
                            }
                            normal { set ::ms::current($w,state) normal }
                        }
                    }
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            set ::ms::current($w,style) $value
                        }
                    }
                    -tabs {
                        set invalid false
                        foreach tabstop $value {
                            switch -nocase -- $tabstop {
                                left    -
                                right   -
                                center  -
                                numeric {}
                                default {
                                    set value [::ms::Check_Measure $value invalid]
                                    switch -- $value {
                                        invalid {
                                            set invalid true
                                            break
                                        }
                                    }
                                }
                            }
                        }

                        switch -- $invalid {
                            false { set ::ms::current($w,tabs) $value }
                        }
                    }
                    -tabstyle {
                        set value [string tolower $value]
                        switch -- $value {
                            tabular       -
                            wordprocessor { set ::ms::current($w,tabstyle) $value }
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
                    -undo {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,undo) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,undo) 1 }
                        }
                    }
                    -wrap {
                        set value [string tolower $value]
                        switch -- $value {
                            none -
                            char -
                            word { set ::ms::current($w,wrap) $value }
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
            foreach option $::ms::text(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Text,$option)

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

            # Set the internal '-padding' option to always show the horizontal and vertical padding.
            switch -- [llength $::ms::current($w,padding)] {
                1       { set ::ms::data($w,padding) [list $::ms::current($w,padding) $::ms::current($w,padding)] }
                default { set ::ms::data($w,padding) $::ms::current($w,padding) }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'borderwidth', 'columns', 'cursor', 'font', 'inactiveselectbackground', 'insertborderwidth', 'padding',
            #       'relief', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

            # background
            switch -- $::ms::managed_by($w,background) {
                developer { set background $::ms::current($w,background) }
                Tk        { set background [_ttk_style lookup $::ms::current($w,style) -background $::ms::data($w,statespec) $::ms::default($w,background)] }
            }

            # bordercolor
            switch -- $::ms::managed_by($w,bordercolor) {
                developer { set bordercolor $::ms::current($w,bordercolor) }
                Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
            }

            # foreground
            switch -- $::ms::managed_by($w,foreground) {
                developer { set foreground $::ms::current($w,foreground) }
                Tk        { set foreground [_ttk_style lookup $::ms::current($w,style) -foreground $::ms::data($w,statespec) $::ms::default($w,foreground)] }
            }

            # insertbackground
            switch -- $::ms::managed_by($w,insertbackground) {
                developer { set insertbackground $::ms::current($w,insertbackground) }
                Tk        { set insertbackground [_ttk_style lookup $::ms::current($w,style) -insertbackground $::ms::data($w,statespec) $::ms::default($w,insertbackground)] }
            }

            # selectbackground
            switch -- $::ms::managed_by($w,selectbackground) {
                developer { set selectbackground $::ms::current($w,selectbackground) }
                Tk        { set selectbackground [_ttk_style lookup $::ms::current($w,style) -selectbackground $::ms::data($w,statespec) $::ms::default($w,selectbackground)] }
            }

            # selectforeground
            switch -- $::ms::managed_by($w,selectforeground) {
                developer { set selectforeground $::ms::current($w,selectforeground) }
                Tk        { set selectforeground [_ttk_style lookup $::ms::current($w,style) -selectforeground $::ms::data($w,statespec) $::ms::default($w,selectforeground)] }
            }

            # Set the text options.
            set text_options [list           -autoseparators $::ms::current($w,autoseparators) \
                                                -blockcursor $::ms::current($w,blockcursor) \
                                                 -background $background \
                                                     -cursor $cursor \
                                                    -endline $::ms::current($w,endline) \
                                            -exportselection $::ms::current($w,exportselection) \
                                                       -font $::ms::current($w,font) \
                                                 -foreground $foreground \
                                                     -height $::ms::current($w,rows) \
                                   -inactiveselectbackground $::ms::current($w,inactiveselectbackground) \
                                           -insertbackground $insertbackground \
                                          -insertborderwidth $::ms::current($w,insertborderwidth) \
                                              -insertofftime $::ms::current($w,insertofftime) \
                                               -insertontime $::ms::current($w,insertontime) \
                                           -insertunfocussed $::ms::current($w,insertunfocussed) \
                                                -insertwidth $::ms::current($w,insertwidth) \
                                                    -maxundo $::ms::current($w,maxundo) \
                                                       -padx [lindex $::ms::data($w,padding) 0] \
                                                       -pady [lindex $::ms::data($w,padding) 1] \
                                           -selectbackground $selectbackground \
                                          -selectborderwidth $::ms::current($w,selectborderwidth) \
                                           -selectforeground $selectforeground \
                                                    -setgrid $::ms::current($w,setgrid) \
                                                   -spacing1 $::ms::current($w,spacing1) \
                                                   -spacing2 $::ms::current($w,spacing2) \
                                                   -spacing3 $::ms::current($w,spacing3) \
                                                  -startline $::ms::current($w,startline) \
                                                      -state $::ms::current($w,state) \
                                                       -tabs $::ms::current($w,tabs) \
                                                   -tabstyle $::ms::current($w,tabstyle) \
                                                  -takefocus $takefocus \
                                                       -undo $::ms::current($w,undo) \
                                                      -width $::ms::current($w,columns) \
                                                       -wrap $::ms::current($w,wrap)];

            # Note: The '-bordercolor' option is not understanded by Tk texts, but is made available trough
            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
            #       like it behaves in other widgets that understands the bordercolor.

            # Check the 'relief' type.
            switch -- $::ms::current($w,relief) {
                flat  -
                solid {
                    lappend text_options         -borderwidth 0 \
                                         -highlightbackground $bordercolor \
                                              -highlightcolor $bordercolor \
                                          -highlightthickness $::ms::current($w,borderwidth) \
                                                      -relief flat;
                }
                default {
                    lappend text_options         -borderwidth $::ms::current($w,borderwidth) \
                                         -highlightbackground $background \
                                              -highlightcolor $background \
                                          -highlightthickness 0 \
                                                      -relief $::ms::current($w,relief);
                }
            }

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false {
                    #########################
                    ##                     ##
                    ##     SIMPLE TEXT     ##
                    ##                     ##
                    #########################

                    ##################
                    ##              ##
                    ##     TEXT     ##
                    ##              ##
                    ##################

                    # Note: Tk texts don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # Add the provided 'xscrollcommand' and 'yscrollcommand' data.
                    lappend text_options -xscrollcommand $::ms::current($w,xscrollcommand) \
                                         -yscrollcommand $::ms::current($w,yscrollcommand);

                    # Create the widget.
                    try {
                        _text $w {*}$text_options
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    }

                    # Set the widget toplevel.
                    set ::ms::addr($w,toplevel) [_winfo toplevel $w]

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Note: If a different class than 'Text' is provided, we need to adapt the bindtags.

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        Text    { bindtags $w [list $w _Simple_Text Text $::ms::addr($w,toplevel) all] }
                        default { bindtags $w [list $w $::ms::current($w,class) _Simple_Text Text $::ms::addr($w,toplevel) all] }
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

                    # Add the widget address to the text widgets real address list.
                    lappend ::ms::addr(text) $w

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w]
                }
                true {
                    #############################
                    ##                         ##
                    ##     SCROLLABLE TEXT     ##
                    ##                         ##
                    #############################

                    ##################
                    ##              ##
                    ##     HULL     ##
                    ##              ##
                    ##################

                    # Set the hull object style name
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

                    ##################
                    ##              ##
                    ##     TEXT     ##
                    ##              ##
                    ##################

                    # Note: Tk Texts don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # Set the current 'xscrollcommand' and 'yscrollcommand' to the empty string.
                    set ::ms::current($w,xscrollcommand) {}
                    set ::ms::current($w,yscrollcommand) {}

                    # Add the internal 'xscrollcommand' and 'yscrollcommand' data.
                    lappend text_options -xscrollcommand [list $w.x set] \
                                         -yscrollcommand [list $w.y set];

                    # Create the widget.
                    _text $w.text {*}$text_options

                    # Grid the text object.
                    _grid $w.text -column 0 \
                                    -padx 0 \
                                    -pady 0 \
                                     -row 0 \
                                  -sticky nesw;

                    ########################
                    ##                    ##
                    ##     SCROLLBARS     ##
                    ##                    ##
                    ########################

                    # Create the horizontal scrollbar address.
                    _ttk_scrollbar $w.x     -class TScrollbar \
                                          -command [list $w.text xview] \
                                           -cursor arrow \
                                           -orient horizontal \
                                            -style TScrollbar \
                                        -takefocus 0;

                    # Create the vertical scrollbar address.
                    _ttk_scrollbar $w.y     -class TScrollbar \
                                          -command [list $w.text yview] \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Note: If a different class than 'Text' is provided, we need to adapt the bindtags.

                    # Set the new bindtags for the hull object.
                    bindtags $w [list $w _Hull_Text TFrame $::ms::addr($w,toplevel) all]

                    # Set the new bindtags for the text object.
                    switch -- $::ms::current($w,class) {
                        Text    { bindtags $w.text [list $w.text _Scrollable_Text Text $::ms::addr($w,toplevel) all] }
                        default { bindtags $w.text [list $w.text $::ms::current($w,class) _Scrollable_Text Text $::ms::addr($w,toplevel) all] }
                    }

                    # Set the new bindtags for the horizontal and vertical scrollbar objects.
                    bindtags $w.x [list $w.x _H_Scrollbar_Text TScrollbar $::ms::addr($w,toplevel) all]
                    bindtags $w.y [list $w.y _V_Scrollbar_Text TScrollbar $::ms::addr($w,toplevel) all]

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
                    set ::ms::addr($w,short)      $short_addr
                    set ::ms::addr($w.text,short) $short_addr
                    set ::ms::addr($w.x,short)    $short_addr
                    set ::ms::addr($w.y,short)    $short_addr

                    # Add the widget real and short address into the list of all available real
                    # and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.text \
                                              $w.x \
                                              $w.y;

                    lappend ::ms::addr(shorts) $short_addr

                    # Add the widget address to the text widgets real address list.
                    lappend ::ms::addr(text) $w

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.text

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.text

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.text];

                    # Add the widget address to the megawidget addresses list.
                    lappend ::ms::addr(megawidgets) $w

                    # Add the widget address to the megawidget container addresses list.
                    lappend ::ms::addr(megawidgets,containers) $w

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
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::text::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::text::Pathname_Cmd $w]
            }

            # Add the widget address to the text classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),text,addrs) $w

            # Add the widget address to the text classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),text,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the text classtype.
            if { $::ms::current($w,style) ni $::ms::style(text,classtype) } {
                lappend ::ms::style(text,classtype) $::ms::current($w,style)
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
proc ::ms::text::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        bbox        -
        compare     -
        count       -
        debug       -
        delete      -
        dlineinfo   -
        dump        -
        edit        -
        get         -
        image       -
        index       -
        mark        -
        peer        -
        pendingsync -
        scan        -
        search      -
        see         -
        sync        {}
        cget {
            # Synopsis:
            #
            # *window* **cget** *option*
            switch -- [llength $args] {
                0   { ::ms::Error "Missing cget option." $caller_info }
                1   {
                    # Check if the option provided is a valid 'styleable' or 'non-styleable' option.
                    set option [string range $args 1 end]
                    if { ($option in $::ms::text(non_styleable,options)) || ($option in $::ms::text(styleable,options))} {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid option, '$args'." $caller_info }
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
                    foreach option $::ms::text(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::text(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::text(non_styleable,options)) || ($option in $::ms::text(styleable,options)) } {
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

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the remaining widget's options, if any.
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -autoseparators {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,autoseparators) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,autoseparators) 1 }
                                        }
                                    }
                                    -blockcursor {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,blockcursor) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,blockcursor) 1 }
                                        }
                                    }
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
                                    -class {}
                                    -cmenu {
                                        set value [string trim $value]
                                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                                            set ::ms::current($w,cmenu) $value
                                        }
                                    }
                                    -columns {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value < 1 } {
                                                    continue
                                                }

                                                set ::ms::current($w,columns)    $value
                                                set ::ms::managed_by($w,columns) developer
                                            }
                                        }
                                    }
                                    -cursor {
                                        set value [string tolower $value]
                                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                                            set ::ms::current($w,cursor)    $value
                                            set ::ms::managed_by($w,cursor) developer
                                        }
                                    }
                                    -endline {
                                        switch -- $value {
                                            ""      { set ::ms::current($w,endline) {} }
                                            default {
                                                switch -- [string is integer -strict $value] {
                                                    1   {
                                                        if { $value >= 0 } {
                                                            set ::ms::current($w,endline) $value
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    -exportselection {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,exportselection) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,exportselection) 1 }
                                        }
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
                                    -inactiveselectbackground {
                                        switch -- $value {
                                            ""      {}
                                            default {
                                                set value [::ms::Check_Color $value invalid]
                                                switch -- $value {
                                                    invalid { continue }
                                                }
                                            }
                                        }

                                        set ::ms::current($w,inactiveselectbackground)    $value
                                        set ::ms::managed_by($w,inactiveselectbackground) developer
                                    }
                                    -insertbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,insertbackground)    $value
                                        set ::ms::managed_by($w,insertbackground) developer
                                    }
                                    -insertborderwidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,insertborderwidth)    $value
                                        set ::ms::managed_by($w,insertborderwidth) developer
                                    }
                                    -insertofftime {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value >= 0 } {
                                                    set ::ms::current($w,insertofftime) $value
                                                }
                                            }
                                        }
                                    }
                                    -insertontime {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value > 0 } {
                                                    set ::ms::current($w,insertontime) $value
                                                }
                                            }
                                        }
                                    }
                                    -insertunfocussed {
                                        switch -nocase -- $value {
                                            none   { set ::ms::current($w,insertunfocussed) none }
                                            hollow { set ::ms::current($w,insertunfocussed) hollow }
                                            solid  { set ::ms::current($w,insertunfocussed) solid }
                                        }
                                    }
                                    -insertwidth {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value > 0 } {
                                                    set ::ms::current($w,insertwidth) $value
                                                }
                                            }
                                        }
                                    }
                                    -maxundo {
                                        switch -- [string is integer -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,maxundo) $value
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
                                    -relief {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            flat   -
                                            groove -
                                            raised -
                                            ridge  -
                                            solid  -
                                            sunken {
                                                set ::ms::current($w,relief)    $value
                                                set ::ms::managed_by($w,relief) developer
                                            }
                                        }
                                    }
                                    -rows {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                if { $value < 1 } {
                                                    continue
                                                }

                                                set ::ms::current($w,rows)    $value
                                                set ::ms::managed_by($w,rows) developer
                                            }
                                        }
                                    }
                                    -scrollable {}
                                    -selectbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,selectbackground)    $value
                                        set ::ms::managed_by($w,selectbackground) developer
                                    }
                                    -selectborderwidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,selectborderwidth)    $value
                                        set ::ms::managed_by($w,selectborderwidth) developer
                                    }
                                    -selectforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,selectforeground)    $value
                                        set ::ms::managed_by($w,selectforeground) developer
                                    }
                                    -setgrid {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,setgrid) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,setgrid) 1 }
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
                                    -spacing1 {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,spacing1) $value
                                    }
                                    -spacing2 {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,spacing2) $value
                                    }
                                    -spacing3 {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,spacing3) $value
                                    }
                                    -startline {
                                        switch -- $value {
                                            ""      { set ::ms::current($w,startline) {} }
                                            default {
                                                switch -- [string is integer -strict $value] {
                                                    1   {
                                                        if { $value >= 0 } {
                                                            set ::ms::current($w,startline) $value
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    -state {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            disabled {
                                                set ::ms::current($w,state) disabled

                                                # Set the widget dynamic state to 'disabled'
                                                set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) 3 3 "disabled"]
                                            }
                                            normal {
                                                set ::ms::current($w,state) normal

                                                # Set the widget dynamic state to '!disabled'
                                                set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) 3 3 "!disabled"]
                                            }
                                        }
                                    }
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Remove the widget address from the text classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),text,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),text,addrs) [lremove $::ms::style($::ms::current($w,style),text,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,text,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the text classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),text,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(text,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(text,classtype) [lremove $::ms::style(text,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the text classtype.
                                            if { $value ni $::ms::style(text,classtype) } {
                                                lappend ::ms::style(text,classtype) $value
                                            }

                                            # Update the current style associated with the widget with 'value'.
                                            set ::ms::current($w,style) $value
                                        }
                                    }
                                    -tabs {
                                        set invalid false
                                        foreach tabstop $value {
                                            switch -nocase -- $tabstop {
                                                left    -
                                                right   -
                                                center  -
                                                numeric {}
                                                default {
                                                    set value [::ms::Check_Measure $value invalid]
                                                    switch -- $value {
                                                        invalid {
                                                            set invalid true
                                                            break
                                                        }
                                                    }
                                                }
                                            }
                                        }

                                        switch -- $invalid {
                                            false { set ::ms::current($w,tabs) $value }
                                        }
                                    }
                                    -tabstyle {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            tabular       -
                                            wordprocessor { set ::ms::current($w,tabstyle) $value }
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
                                    -undo {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,undo) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,undo) 1 }
                                        }
                                    }
                                    -wrap {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            none -
                                            char -
                                            word { set ::ms::current($w,wrap) $value }
                                        }
                                    }
                                    -xscrollcommand {
                                        switch -- $::ms::current($w,scrollable) {
                                            true { continue }
                                        }

                                        switch -- [llength $value] {
                                            0   { set ::ms::current($w,xscrollcommand) [list ] }
                                            2   { set ::ms::current($w,xscrollcommand) $value  }
                                        }
                                    }
                                    -yscrollcommand {
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

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::text(styleable,options) {
                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            # Check the widget state and set the cursor and takefocus accordingly.
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

                            # Set the internal '-padding' option to always show the horizontal and vertical padding.
                            switch -- [llength $::ms::current($w,padding)] {
                                1       { set ::ms::data($w,padding) [list $::ms::current($w,padding) $::ms::current($w,padding)] }
                                default { set ::ms::data($w,padding) $::ms::current($w,padding) }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'borderwidth', 'columns', 'cursor', 'font', 'inactiveselectbackground', 'insertborderwidth', 'padding',
                            #       'relief', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

                            # background
                            switch -- $::ms::managed_by($w,background) {
                                developer { set background $::ms::current($w,background) }
                                Tk        { set background [_ttk_style lookup $::ms::current($w,style) -background $::ms::data($w,statespec) $::ms::default($w,background)] }
                            }

                            # bordercolor
                            switch -- $::ms::managed_by($w,bordercolor) {
                                developer { set bordercolor $::ms::current($w,bordercolor) }
                                Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
                            }

                            # foreground
                            switch -- $::ms::managed_by($w,foreground) {
                                developer { set foreground $::ms::current($w,foreground) }
                                Tk        { set foreground [_ttk_style lookup $::ms::current($w,style) -foreground $::ms::data($w,statespec) $::ms::default($w,foreground)] }
                            }

                            # insertbackground
                            switch -- $::ms::managed_by($w,insertbackground) {
                                developer { set insertbackground $::ms::current($w,insertbackground) }
                                Tk        { set insertbackground [_ttk_style lookup $::ms::current($w,style) -insertbackground $::ms::data($w,statespec) $::ms::default($w,insertbackground)] }
                            }

                            # selectbackground
                            switch -- $::ms::managed_by($w,selectbackground) {
                                developer { set selectbackground $::ms::current($w,selectbackground) }
                                Tk        { set selectbackground [_ttk_style lookup $::ms::current($w,style) -selectbackground $::ms::data($w,statespec) $::ms::default($w,selectbackground)] }
                            }

                            # selectforeground
                            switch -- $::ms::managed_by($w,selectforeground) {
                                developer { set selectforeground $::ms::current($w,selectforeground) }
                                Tk        { set selectforeground [_ttk_style lookup $::ms::current($w,style) -selectforeground $::ms::data($w,statespec) $::ms::default($w,selectforeground)] }
                            }

                            # Set the text options.
                            set text_options [list           -autoseparators $::ms::current($w,autoseparators) \
                                                                -blockcursor $::ms::current($w,blockcursor) \
                                                                 -background $background \
                                                                     -cursor $cursor \
                                                                    -endline $::ms::current($w,endline) \
                                                            -exportselection $::ms::current($w,exportselection) \
                                                                       -font $::ms::current($w,font) \
                                                                 -foreground $foreground \
                                                                     -height $::ms::current($w,rows) \
                                                   -inactiveselectbackground $::ms::current($w,inactiveselectbackground) \
                                                           -insertbackground $insertbackground \
                                                          -insertborderwidth $::ms::current($w,insertborderwidth) \
                                                              -insertofftime $::ms::current($w,insertofftime) \
                                                               -insertontime $::ms::current($w,insertontime) \
                                                           -insertunfocussed $::ms::current($w,insertunfocussed) \
                                                                -insertwidth $::ms::current($w,insertwidth) \
                                                                    -maxundo $::ms::current($w,maxundo) \
                                                                       -padx [lindex $::ms::data($w,padding) 0] \
                                                                       -pady [lindex $::ms::data($w,padding) 1] \
                                                           -selectbackground $selectbackground \
                                                          -selectborderwidth $::ms::current($w,selectborderwidth) \
                                                           -selectforeground $selectforeground \
                                                                    -setgrid $::ms::current($w,setgrid) \
                                                                   -spacing1 $::ms::current($w,spacing1) \
                                                                   -spacing2 $::ms::current($w,spacing2) \
                                                                   -spacing3 $::ms::current($w,spacing3) \
                                                                  -startline $::ms::current($w,startline) \
                                                                      -state $::ms::current($w,state) \
                                                                       -tabs $::ms::current($w,tabs) \
                                                                   -tabstyle $::ms::current($w,tabstyle) \
                                                                  -takefocus $takefocus \
                                                                       -undo $::ms::current($w,undo) \
                                                                      -width $::ms::current($w,columns) \
                                                                       -wrap $::ms::current($w,wrap)];

                            # Note: The '-bordercolor' option is not understanded by Tk texts, but is made available trough
                            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                            #       like it behaves in other widgets that understands the bordercolor.

                            # Check the 'relief' type.
                            switch -- $::ms::current($w,relief) {
                                flat  -
                                solid {
                                    lappend text_options         -borderwidth 0 \
                                                         -highlightbackground $bordercolor \
                                                              -highlightcolor $bordercolor \
                                                          -highlightthickness $::ms::current($w,borderwidth) \
                                                                      -relief flat;
                                }
                                default {
                                    lappend text_options         -borderwidth $::ms::current($w,borderwidth) \
                                                         -highlightbackground $background \
                                                              -highlightcolor $background \
                                                          -highlightthickness 0 \
                                                                      -relief $::ms::current($w,relief);
                                }
                            }

                            # Check if the widget is scrollable or not.
                            switch -- $::ms::current($w,scrollable) {
                                false {
                                    #########################
                                    ##                     ##
                                    ##     SIMPLE TEXT     ##
                                    ##                     ##
                                    #########################

                                    ##################
                                    ##              ##
                                    ##     TEXT     ##
                                    ##              ##
                                    ##################

                                    # Note: Tk texts don't understands styles, at least not natively.
                                    #       No internal styles needs to be created.

                                    # Add the provided 'xscrollcommand' and 'yscrollcommand' data.
                                    lappend text_options -xscrollcommand $::ms::current($w,xscrollcommand) \
                                                         -yscrollcommand $::ms::current($w,yscrollcommand);

                                    # Configure the widget.
                                    try {
                                        interp invokehidden {} $w configure {*}$text_options
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    }
                                }
                                true {
                                    #############################
                                    ##                         ##
                                    ##     SCROLLABLE TEXT     ##
                                    ##                         ##
                                    #############################

                                    ##################
                                    ##              ##
                                    ##     HULL     ##
                                    ##              ##
                                    ##################

                                    # Set the hull object style name
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

                                    ##################
                                    ##              ##
                                    ##     TEXT     ##
                                    ##              ##
                                    ##################

                                    # Note: Tk Texts don't understands styles, at least not natively.
                                    #       No internal styles needs to be created.

                                    # Apply the changes.
                                    $w.text configure {*}$text_options

                                    ########################
                                    ##                    ##
                                    ##     SCROLLBARS     ##
                                    ##                    ##
                                    ########################

                                    # Update the scrollbars.
                                    ::ms::text::Scrollbar_Update $w
                                }
                            }

                            # Note: If width and/or height were provided by the developer, and these values were accepted by Tk,
                            #       then a configure event will be invoked by Tk ('::ms::text::Configure').
                            #       After this event, their values will be registered.

                            update

                            # Cleaning.
                            unset -nocomplain -- ::ms::temp($w,height) \
                                                 ::ms::temp($w,width);

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        identify {
            # Synopsis:
            #
            # *window* **identify** **element** *x* *y*
            switch -- [llength $args] {
                3   {
                    # Check that the first argument of 'args' is the word "element".
                    switch -- [lindex $args 0] {
                        element {}
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

                    # Get the root coordinates of the north-west corner of the container ('$w').
                    set rootx [_winfo rootx $w]
                    set rooty [_winfo rooty $w]

                    # Transform the relative coordinates provided into root coordinates.
                    set X [expr { $rootx+$x }]
                    set Y [expr { $rooty+$y }]

                    # Get the widget address containing the point given by the root coordinates calculated.
                    set widget [_winfo containing -display $w $X $Y]

                    # Return the name of the object, or an empty string if there are no text objects at the coordinates provided.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            if { $widget eq $w } {
                                return "Text.textarea"
                            } else {
                                return ""
                            }
                        }
                        true {
                            if { $widget eq $w } {
                                return "Text.hull"
                            } elseif { $widget eq "$w.text" } {
                                return "Text.textarea"
                            } elseif { $widget eq "$w.x" } {
                                return "Text.hscrollbar"
                            } elseif { $widget eq "$w.y" } {
                                return "Text.vscrollbar"
                            } else {
                                return ""
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        insert  -
        replace {
            # Synopsis:
            #
            # *window* **insert** *index* *chars* ?*tagList* *chars* *tagList* ...?
            # *window* **replace** *index1* *index2* *chars* ?*tagList* *chars* *tagList* ...?
            switch -- $::ms::current($w,scrollable) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.text] }
            }

            # Execute the command.
            try {
                {*}$address $cmd {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                switch -- $::ms::current($w,scrollable) {
                    true {
                        # Update the scrollbars.
                        ::ms::text::Scrollbar_Update $w
                    }
                }

                return ""
            }
        }
        instate {
            # Synopsis:
            #
            # *window* **instate** *statespec* ?*script*?
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

                    # Compare the statespec provided with the current statespec of the widget.
                    set boolean 1
                    foreach state $statespec {
                        if { $state ni $::ms::data($w,statespec) } {
                            set boolean 0
                            break
                        }
                    }

                    return $boolean
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

                    # Compare the statespec provided with the current statespec of the widget.
                    foreach state $statespec {
                        if { $state ni $::ms::data($w,statespec) } {
                            return ""
                        }
                    }

                    # Execute the script.
                    try {
                        eval $script
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
            switch -- [llength $args] {
                0   { return [lsort -increasing -dictionary $::ms::data($w,statespec)] }
                1   {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { set statespec disabled }
                        normal {
                            # Check the 'statespec' provided.
                            set statespec $args
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
                        }
                    }

                    # Change the statespec and register the states that have changed.
                    set states_that_have_changed [list ]
                    foreach state $statespec {
                        if { $state ni $::ms::data($w,statespec) } {
                            # Note: The state analized is different than its equivalent currently active (old state).
                            #       For example 'disabled' (state) and '!disabled' (old state).

                            # Get the old state as the inverse of the new state.
                            switch -glob -- $state {
                                "!*"    { set old_state [string trimleft $state "!"] }
                                default { set old_state [string cat      "!" $state] }
                            }

                            # Update the current statespec old state with the new state.
                            set index [lsearch -exact $::ms::data($w,statespec) $old_state]

                            # No need to check if 'index' is '-1'.
                            set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) $index $index $state]

                            # Add the old state to the list containing the states that have changed.
                            lappend states_that_have_changed $old_state
                        }
                    }

                    # Note: 'borderwidth', 'columns', 'cursor', 'font', 'inactiveselectbackground', 'insertborderwidth', 'padding',
                    #       'relief', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

                    #####################################
                    ##                                 ##
                    ##     UPDATE THE WIDGET STATE     ##
                    ##                                 ##
                    #####################################

                    # Note: Tk canvases don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # background
                    switch -- $::ms::managed_by($w,background) {
                        developer { set background $::ms::current($w,background) }
                        Tk        { set background [_ttk_style lookup $::ms::current($w,style) -background $::ms::data($w,statespec) $::ms::default($w,background)] }
                    }

                    # bordercolor
                    switch -- $::ms::managed_by($w,bordercolor) {
                        developer { set bordercolor $::ms::current($w,bordercolor) }
                        Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
                    }

                    # foreground
                    switch -- $::ms::managed_by($w,foreground) {
                        developer { set foreground $::ms::current($w,foreground) }
                        Tk        { set foreground [_ttk_style lookup $::ms::current($w,style) -foreground $::ms::data($w,statespec) $::ms::default($w,foreground)] }
                    }

                    # insertbackground
                    switch -- $::ms::managed_by($w,insertbackground) {
                        developer { set insertbackground $::ms::current($w,insertbackground) }
                        Tk        { set insertbackground [_ttk_style lookup $::ms::current($w,style) -insertbackground $::ms::data($w,statespec) $::ms::default($w,insertbackground)] }
                    }

                    # selectbackground
                    switch -- $::ms::managed_by($w,selectbackground) {
                        developer { set selectbackground $::ms::current($w,selectbackground) }
                        Tk        { set selectbackground [_ttk_style lookup $::ms::current($w,style) -selectbackground $::ms::data($w,statespec) $::ms::default($w,selectbackground)] }
                    }

                    # selectforeground
                    switch -- $::ms::managed_by($w,selectforeground) {
                        developer { set selectforeground $::ms::current($w,selectforeground) }
                        Tk        { set selectforeground [_ttk_style lookup $::ms::current($w,style) -selectforeground $::ms::data($w,statespec) $::ms::default($w,selectforeground)] }
                    }

                    # Set the text options.
                    set text_options [list       -background $background \
                                                 -foreground $foreground \
                                           -insertbackground $insertbackground \
                                           -selectbackground $selectbackground \
                                           -selectforeground $selectforeground];

                    # Note: The '-bordercolor' option is not understanded by Tk texts, but is made available trough
                    #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                    #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                    #       like it behaves in other widgets that understands the bordercolor.

                    # Check the 'relief' type.
                    switch -- $::ms::current($w,relief) {
                        flat  -
                        solid {
                            lappend text_options -highlightbackground $bordercolor \
                                                      -highlightcolor $bordercolor;
                        }
                        default {
                            lappend text_options -highlightbackground $background \
                                                      -highlightcolor $background;
                        }
                    }

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            #########################
                            ##                     ##
                            ##     SIMPLE TEXT     ##
                            ##                     ##
                            #########################

                            # Apply the changes.
                            interp invokehidden {} $w configure {*}$text_options
                        }
                        true {
                            #############################
                            ##                         ##
                            ##     SCROLLABLE TEXT     ##
                            ##                         ##
                            #############################

                            # Apply the changes.
                            interp invokehidden {} $w state $::ms::data($w,statespec)
                            $w.text configure {*}$text_options
                        }
                    }

                    return $states_that_have_changed
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
        tag {
            # Synopsis:
            #
            # *window* **tag** **add** *tagname* *index1* ?*index2* *index1* *index2* ...?
            # *window* **tag** **bind** *tagname* ?*sequence*? ?*script*?
            # *window* **tag** **cget** *tagname* *option*
            # *window* **tag** **configure** *tagname* ?*option*? ?*value*? ?*option value* ... *option value*?
            # *window* **tag** **delete** *tagname* ?*tagname* ...?
            # *window* **tag** **lower** *tagname* ?*belowThis*?
            # *window* **tag** **names** ?*index*?
            # *window* **tag** **nextrange** *tagname* *index1* ?*index2*?
            # *window* **tag** **prevrange** *tagname* *index1* ?*index2*?
            # *window* **tag** **raise** *tagname* ?*aboveThis*?
            # *window* **tag** **ranges** *tagname*
            # *window* **tag** **remove** *tagname* *index1* ?*index2* *index1* *index2* ...?
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { set address [list interp invokehidden {} $w] }
                        true  { set address [list $w.text] }
                    }

                    # Check the 'subcommand'.
                    switch -- $subcommand {
                        configure {
                            set tagname [lindex  $args 0]
                            set args    [lremove $args 0]

                            switch -- [llength $args] {
                                0   -
                                1   {
                                    # Execute the command.
                                    try {
                                        {*}$address tag configure $tagname {*}$args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return $result
                                    }
                                }
                                default {
                                    # Check that the command's 'args' forms a valid 'option/value' list.
                                    switch -- [expr { [llength $args]%2 }] {
                                        0   {
                                            # Check the remaining widget's options, if any.
                                            set new_args [list ]
                                            foreach { option value } $args {
                                                switch -nocase -- $option {
                                                    -background       -
                                                    -foreground       -
                                                    -lmargincolor     -
                                                    -overstrikefg     -
                                                    -rmargincolor     -
                                                    -selectbackground -
                                                    -selectforeground -
                                                    -underlinefg      {
                                                        set value [::ms::Check_Color $value invalid]
                                                        switch -- $value {
                                                            invalid { continue }
                                                            default { lappend new_args $option $value }
                                                        }
                                                    }
                                                    -bgstipple   -
                                                    -borderwidth -
                                                    -elide       -
                                                    -fgstipple   -
                                                    -font        -
                                                    -justify     -
                                                    -lmargin1    -
                                                    -lmargin2    -
                                                    -offset      -
                                                    -overstrike  -
                                                    -relief      -
                                                    -rmargin     -
                                                    -spacing1    -
                                                    -spacing2    -
                                                    -spacing3    -
                                                    -tabs        -
                                                    -tabstyle    -
                                                    -underline   -
                                                    -wrap        { lappend new_args $option $value }
                                                    default      { ::ms::Error "Invalid tag option, '$option'." $caller_info }
                                                }
                                            }
                                        }
                                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                                    }

                                    # Execute the command.
                                    try {
                                        {*}$address tag configure $tagname {*}$new_args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return ""
                                    }
                                }
                            }
                        }
                        default {
                            # Execute the command.
                            try {
                                {*}$address tag $subcommand {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                    }
                }
            }
        }
        window {
            # Synopsis:
            #
            # *window* **window** **cget** *index* *option*
            # *window* **window** **configure** *index* ?*option value* ... *option value*?
            # *window* **window** **create** *index* ?*option value* ... *option value*?
            # *window* **window** **names**
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { set address [list interp invokehidden {} $w] }
                        true  { set address [list $w.text] }
                    }

                    # Check the 'subcommand'.
                    switch -- $subcommand {
                        create    -
                        configure {
                            set index [lindex  $args 0]
                            set args  [lremove $args 0]

                            switch -- [llength $args] {
                                0   -
                                1   {
                                    # Execute the command.
                                    try {
                                        {*}$address window $subcommand $index {*}$args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return $result
                                    }
                                }
                                default {
                                    # Check that the command's 'args' forms a valid 'option/value' list.
                                    switch -- [expr { [llength $args]%2 }] {
                                        0   {
                                            # Check the remaining widget's options, if any.
                                            set new_args [list ]
                                            foreach { option value } $args {
                                                switch -nocase -- $option {
                                                    -window {
                                                        # Get the 'window' real address.
                                                        set result [::ms::Check_Pathname $window invalid]
                                                        switch -- $result {
                                                            invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                                            default { lappend new_args -window [lindex $result 0] }
                                                        }
                                                    }
                                                    -align   -
                                                    -create  -
                                                    -padx    -
                                                    -pady    -
                                                    -stretch { lappend new_args $option $value }
                                                    default  { ::ms::Error "Invalid window option, '$option'." $caller_info }
                                                }
                                            }
                                        }
                                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                                    }

                                    # Execute the command.
                                    try {
                                        {*}$address window $subcommand $index {*}$new_args
                                    } on error { errortext errorcode } {
                                        ::ms::Error "$errortext" $caller_info
                                    } on ok { result } {
                                        return ""
                                    }
                                }
                            }
                        }
                        default {
                            # Execute the command.
                            try {
                                {*}$address window $subcommand {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                    }
                }
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
                true  { set address [list $w.text] }
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
                        return ""
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
                        pixels  { set what "pixels" }
                        units   { set what "units" }
                        default { return "" }
                    }

                    # Execute the command.
                    try {
                        {*}$address xview scroll $number $what
                    } on error {} {
                        return ""
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
                true  { set address [list $w.text] }
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
                        return ""
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
                        pixels  { set what "pixels" }
                        units   { set what "units" }
                        default { return "" }
                    }

                    # Execute the command.
                    try {
                        {*}$address yview scroll $number $what
                    } on error {} {
                        return ""
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
# Update any text widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::text::Style_Update { stylename caller_info } {
    # Check the stylename padding, if any.
    set index [lsearch -exact $::ms::styleopt($::ms::theme,$stylename) "-padding"]
    switch -- $index {
        -1      {}
        default {
            switch -- [llength $::ms::styleopt($::ms::theme,$stylename,padding)] {
                3   -
                4   {
                    # Update the stylename padding option for the current theme.
                    set ::ms::styleopt($::ms::theme,$stylename)         [lreplace $::ms::styleopt($::ms::theme,$stylename) $index+1 $index+1 $::ms::styleopt($::ms::theme,$stylename,padding)]
                    set ::ms::styleopt($::ms::theme,$stylename,padding) [list [lindex $::ms::styleopt($::ms::theme,$stylename,padding) 0] [lindex $::ms::styleopt($::ms::theme,$stylename,padding) 1]]
                }
            }
        }
    }

    # Update all the text widgets that have stylename as a style.
    foreach w $::ms::style($stylename,text,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::text(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Text,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        # Check the widget state and set the relative cursor.
        switch -- $::ms::current($w,state) {
            disabled { set cursor arrow }
            normal   { set cursor $::ms::current($w,cursor) }
        }

        # Set the internal '-padding' option to always show the horizontal and vertical padding.
        switch -- [llength $::ms::current($w,padding)] {
            1       { set ::ms::data($w,padding) [list $::ms::current($w,padding) $::ms::current($w,padding)] }
            default { set ::ms::data($w,padding) $::ms::current($w,padding) }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'borderwidth', 'columns', 'cursor', 'font', 'inactiveselectbackground', 'insertborderwidth', 'padding',
        #       'relief', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

        # background
        switch -- $::ms::managed_by($w,background) {
            developer { set background $::ms::current($w,background) }
            Tk        { set background [_ttk_style lookup $stylename -background $::ms::data($w,statespec) $::ms::default($w,background)] }
        }

        # foreground
        switch -- $::ms::managed_by($w,foreground) {
            developer { set foreground $::ms::current($w,foreground) }
            Tk        { set foreground [_ttk_style lookup $stylename -foreground $::ms::data($w,statespec) $::ms::default($w,foreground)] }
        }

        # insertbackground
        switch -- $::ms::managed_by($w,insertbackground) {
            developer { set insertbackground $::ms::current($w,insertbackground) }
            Tk        { set insertbackground [_ttk_style lookup $stylename -insertbackground $::ms::data($w,statespec) $::ms::default($w,insertbackground)] }
        }

        # selectbackground
        switch -- $::ms::managed_by($w,selectbackground) {
            developer { set selectbackground $::ms::current($w,selectbackground) }
            Tk        { set selectbackground [_ttk_style lookup $stylename -selectbackground $::ms::data($w,statespec) $::ms::default($w,selectbackground)] }
        }

        # selectforeground
        switch -- $::ms::managed_by($w,selectforeground) {
            developer { set selectforeground $::ms::current($w,selectforeground) }
            Tk        { set selectforeground [_ttk_style lookup $stylename -selectforeground $::ms::data($w,statespec) $::ms::default($w,selectforeground)] }
        }

        # Set the text options.
        set text_options [list      -background $background \
                                          -cursor $cursor \
                                            -font $::ms::current($w,font) \
                                      -foreground $foreground \
                                          -height $::ms::current($w,rows) \
                                -insertbackground $insertbackground \
                               -insertborderwidth $::ms::current($w,insertborderwidth) \
                                            -padx [lindex $::ms::data($w,padding) 0] \
                                            -pady [lindex $::ms::data($w,padding) 1] \
                                -selectbackground $selectbackground \
                               -selectborderwidth $::ms::current($w,selectborderwidth) \
                                -selectforeground $selectforeground \
                                           -width $::ms::current($w,columns)];

        # Note: The '-bordercolor' option is not understanded by Tk texts, but is made available trough
        #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
        #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
        #       like it behaves in other widgets that understands the bordercolor.

        # Check the 'relief' type.
        switch -- $::ms::current($w,relief) {
            flat  -
            solid {
                lappend text_options         -borderwidth 0 \
                                       -highlightbackground $bordercolor \
                                            -highlightcolor $bordercolor \
                                        -highlightthickness $::ms::current($w,borderwidth) \
                                                    -relief flat;
            }
            default {
                lappend text_options         -borderwidth $::ms::current($w,borderwidth) \
                                       -highlightbackground $background \
                                            -highlightcolor $background \
                                        -highlightthickness 0 \
                                                    -relief $::ms::current($w,relief);
            }
        }

        # Check if the widget is scrollable or not.
        switch -- $::ms::current($w,scrollable) {
            false {
                #########################
                ##                     ##
                ##     SIMPLE TEXT     ##
                ##                     ##
                #########################

                ##################
                ##              ##
                ##     TEXT     ##
                ##              ##
                ##################

                # Note: Tk texts don't understands styles, at least not natively.
                #       No internal styles needs to be created.

                # Apply the changes.
                interp invokehidden {} $w configure {*}$text_options
            }
            true {
                ##############################
                ##                          ##
                ##     SSCROLLABLE TEXT     ##
                ##                          ##
                ##############################

                ##################
                ##              ##
                ##     HULL     ##
                ##              ##
                ##################

                # Set the hull object style name
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

                ##################
                ##              ##
                ##     TEXT     ##
                ##              ##
                ##################

                # Note: Tk texts don't understands styles, at least not natively.
                #       No internal styles needs to be created.

                # Apply the changes.
                $w.text configure {*}$text_options

                ########################
                ##                    ##
                ##     SCROLLBARS     ##
                ##                    ##
                ########################

                # Update the scrollbars.
                ::ms::text::Scrollbar_Update $w
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

## ButtonPress
#
# Manage the **ButtonPress** event.
# It clear any pre-existent selections, moves the insertion cursor, sets the selection anchor,
# and claims the input focus.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the mouse pointer (x,y) relative coordinates at the time of the event.
#        These value are provided directly by the **ButtonPress** event.
#
# It doesn't return anything.
proc ::ms::text::ButtonPress { w x y } {
    # Note: This procedure is a modified version of the '::tk::TextButton1' of the Tk text widget.
    #       All credits goes to the original author/s.

    # Check the widget's state.
    switch -- $::ms::current($w,state) {
        disabled {
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
        default {
            set ::tk::Priv(pressX)     $x
            set ::tk::Priv(mouseMoved) 0
            set ::tk::Priv(selectMode) char

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollbar) {
                false { set address [list interp invokehidden {} $w] }
                true  { set address [list $w.text] }
            }

            {*}$address tag remove sel 1.0 end

            # An operation that clears the selection must insert an autoseparator,
            # because the selection operation may have moved the insert mark.

            # If autoseparators are active, put an autoseparator.
            switch -- $::ms::current($w,autoseparators) {
                1   { {*}$address edit separator }
            }

            set anchor_name [::tk::TextAnchor $::ms::addr($w,widget)]

            {*}$address mark set insert [::ms::text::ClosestGap {*}$address $x $y]
            {*}$address mark set $anchor_name insert

            # Set the anchor mark's gravity depending on the click position
            # relative to the gap
            set bbox [{*}$address bbox [{*}$address index $anchor_name]]

            if { $x > [lindex $bbox 0] } {
                {*}$address mark gravity $anchor_name right
            } else {
                {*}$address mark gravity $anchor_name left
            }

            # Focus the text object if its not already focussed.
            interp invokehidden {} $w instate [list !focus] {
                _focus -force $::ms::addr($w,widget)
            }

            # If autoseparators are active, put an autoseparator.
            switch -- $::ms::current($w,autoseparators) {
                1   { {*}$address edit separator }
            }
        }
    }

    return ""
}

## Configure
#
# Manage the **Configure** event on a widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Configure { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
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
proc ::ms::text::Destroy { w } {
    # Get the short address related to the widget real address.
    set short_addr $::ms::addr($w,short)

    # Destroy the aliased widget pathcommands.
    foreach token $::ms::data($w,token) {
        interp alias {} $token {}
    }

    # Remove the widget short address from the list of all available short addresses.
    set index [lsearch -exact $::ms::addr(shorts) $short_addr]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(shorts) [lremove $::ms::addr(shorts) $index] }
    }

    # Remove the widget address from the text widgets real address list.
    set index [lsearch -exact $::ms::addr(text) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(text) [lremove $::ms::addr(text) $index] }
    }

    # Remove the widget address from the text classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),text,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),text,addrs) [lremove $::ms::class($::ms::current($w,class),text,addrs) $index] }
    }

    # Remove the widget address from the text classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),text,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),text,addrs) [lremove $::ms::style($::ms::current($w,style),text,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the text classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),text,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(text,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(text,classtype) [lremove $::ms::style(text,classtype) $index] }
            }
        }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollable) {
        false {
            #########################
            ##                     ##
            ##     SIMPLE TEXT     ##
            ##                     ##
            #########################

            # Remove the widget address from the list of all available real addresses.
            set index [lsearch -exact $::ms::addr(reals) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
            }
        }
        true {
            #############################
            ##                         ##
            ##     SCROLLABLE TEXT     ##
            ##                         ##
            #############################

            # Remove every widget's objects addresses from the list of all available real addresses.
            foreach object [list $w \
                                 $w.text \
                                 $w.x \
                                 $w.y] {
                set index [lsearch -exact $::ms::addr(reals) $object]
                switch -- $index {
                    -1      {}
                    default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
                }
            }

            # Remove the widget address from the megawidget real address list.
            set index [lsearch -exact $::ms::addr(megawidgets) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(megawidgets) [lremove $::ms::addr(megawidgets) $index] }
            }

            # Remove the widget address from the megawidget container real address list.
            set index [lsearch -exact $::ms::addr(megawidgets,containers) $w]
            switch -- $index {
                -1      {}
                default { set ::ms::addr(megawidgets,containers) [lremove $::ms::addr(megawidgets,containers) $index] }
            }

            # Remove the widget address from the megawidget scrollable real address list.
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
                         ::ms::addr($w.text,short) \
                         ::ms::addr($w.x,short) \
                         ::ms::addr($w.y,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,autoseparators) \
                         ::ms::current($w,blockcursor) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,columns) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,endline) \
                         ::ms::current($w,exportselection) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,inactiveselectbackground) \
                         ::ms::current($w,insertbackground) \
                         ::ms::current($w,insertborderwidth) \
                         ::ms::current($w,insertofftime) \
                         ::ms::current($w,insertontime) \
                         ::ms::current($w,insertunfocussed) \
                         ::ms::current($w,insertwidth) \
                         ::ms::current($w,maxundo) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,rows) \
                         ::ms::current($w,scrollable) \
                         ::ms::current($w,selectbackground) \
                         ::ms::current($w,selectborderwidth) \
                         ::ms::current($w,selectforeground) \
                         ::ms::current($w,setgrid) \
                         ::ms::current($w,shellbackground) \
                         ::ms::current($w,spacing1) \
                         ::ms::current($w,spacing2) \
                         ::ms::current($w,spacing3) \
                         ::ms::current($w,startline) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,tabs) \
                         ::ms::current($w,tabstyle) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,undo) \
                         ::ms::current($w,wrap) \
                         ::ms::current($w,xscrollcommand) \
                         ::ms::current($w,yscrollcommand);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,padding) \
                         ::ms::data($w,scrollx) \
                         ::ms::data($w,scrolly) \
                         ::ms::data($w,statespec) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,autoseparators) \
                         ::ms::default($w,blockcursor) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,columns) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,endline) \
                         ::ms::default($w,exportselection) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,inactiveselectbackground) \
                         ::ms::default($w,insertbackground) \
                         ::ms::default($w,insertborderwidth) \
                         ::ms::default($w,insertofftime) \
                         ::ms::default($w,insertontime) \
                         ::ms::default($w,insertunfocussed) \
                         ::ms::default($w,insertwidth) \
                         ::ms::default($w,maxundo) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,rows) \
                         ::ms::default($w,scrollable) \
                         ::ms::default($w,selectbackground) \
                         ::ms::default($w,selectborderwidth) \
                         ::ms::default($w,selectforeground) \
                         ::ms::default($w,setgrid) \
                         ::ms::default($w,shellbackground) \
                         ::ms::default($w,spacing1) \
                         ::ms::default($w,spacing2) \
                         ::ms::default($w,spacing3) \
                         ::ms::default($w,startline) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,tabs) \
                         ::ms::default($w,tabstyle) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,undo) \
                         ::ms::default($w,wrap) \
                         ::ms::default($w,xscrollcommand) \
                         ::ms::default($w,yscrollcommand);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,columns) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,inactiveselectbackground) \
                         ::ms::managed_by($w,insertbackground) \
                         ::ms::managed_by($w,insertborderwidth) \
                         ::ms::managed_by($w,relief) \
                         ::ms::managed_by($w,rows) \
                         ::ms::managed_by($w,selectbackground) \
                         ::ms::managed_by($w,selectborderwidth) \
                         ::ms::managed_by($w,selectforeground) \
                         ::ms::managed_by($w,shellbackground);

    unset -nocomplain -- ::ms::style($w,border) \
                         ::ms::style($w,hull);

    return ""
}

## FocusIn
#
# Manage the **FocusIn** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::text::Pathname_Cmd $w state focus

    return ""
}

## FocusOut
#
# Manage the **FocusOut** event on the widget.
#
# Where:
#
# w   should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::FocusOut { w } {
    # Check the contextual menu relative to this widget, if any.
    switch -- $::ms::current($w,cmenu) {
        ""      {}
        default {
            # If the contextual menu of the widget is open do not loose the focus (graphically).
            switch -- [_winfo exists $::ms::current($w,cmenu)] {
                1   { return "" }
            }
        }
    }

    # Change the widget dynamic state to '!focus'.
    ::ms::text::Pathname_Cmd $w state !focus

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
# It doesn't return anything.
proc ::ms::text::Hover { w X Y } {
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

        # Change the widget dynamic state to '!hover'.
        ::ms::text::Pathname_Cmd $w state !hover
    } else {
        # The mouse cursor is inside the widget acting as a border object.

        # Change the widget dynamic state to 'hover'.
        ::ms::text::Pathname_Cmd $w state hover
    }

    return ""
}

## Scan_Or_Paste
#
# Manage various **ButtonPress** events.
# Depending on the current value and the operating system it will scan the widget or paste the selection into it.
#
# Where:
#
# w       Should be the widget real address involved.
#
# x, y    Should be the (x,y) relative coordinate of the mouse pointer at the time of the event.
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
proc ::ms::text::Scan_Or_Paste { w x y event } {
    # Check the middleclick variable.
    switch -- $::ms::middleclick {
        drag {
            # Check the windowing system.
            switch -- [_tk windowingsystem] {
                aqua {
                    # Disable dragging on ButtonPress-2 and enable it on ButtonPress-3 (macOS).
                    switch -- $event {
                        "Button-3"        { ::ms::Scan_Mark $w $x $y }
                        "B3-Motion"       { ::ms::Scan_Drag $w $x $y }
                        "ButtonRelease-3" { ::ms::Scan_Release }
                    }
                }
                default {
                    # Disable dragging on ButtonPress-3 and enable it on ButtonPress-2 (Linux and Windows).
                    switch -- $event {
                        "Button-2"        { ::ms::Scan_Mark $w $x $y }
                        "B2-Motion"       { ::ms::Scan_Drag $w $x $y }
                        "ButtonRelease-2" { ::ms::Scan_Release }
                    }
                }
            }
        }
        paste {
            # Check the windowing system.
            switch -- [_tk windowingsystem] {
                aqua {
                    # Disable paste selection on ButtonPress-2 and enable it on ButtonPress-3 (macOS).
                    switch -- $event {
                        "PasteSelection"  -
                        "ButtonRelease-3" { ::ms::text::Paste $w $x $y PRIMARY }
                    }
                }
                default {
                    # Disable paste selection on ButtonPress-3 and enable it on ButtonPress-2 (Linux and Windows).
                    switch -- $event {
                        "PasteSelection"  -
                        "ButtonRelease-2" { ::ms::text::Paste $w $x $y PRIMARY }
                    }
                }
            }
        }
    }

    return ""
}

#######################
##                   ##
##     SCROLLBAR     ##
##                   ##
#######################

## Scrollbar_ButtonPress
#
# Manage the **ButtonPress-1** event on the widget's internal scrollbar.
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
proc ::ms::text::Scrollbar_ButtonPress { w orient x y }  {
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
                                    ::ms::text::Pathname_Cmd $w xview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set xviews [$w.x get]
                                    set xview1 [lindex $xviews 0]
                                    set xview2 [lindex $xviews 1]

                                    if { $::ms::temp(fraction) < $xview1 } {
                                        # The User has click on the left trough.

                                        # Scroll the thumb by one page towards the left.
                                        ::ms::text::Pathname_Cmd $w xview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $xview2 } {
                                        # The User has click on the right trough.

                                        # Scroll the thumb by one page towards the right.
                                        ::ms::text::Pathname_Cmd $w xview scroll 1 pages

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
                                    ::ms::text::Pathname_Cmd $w yview moveto $::ms::temp(fraction)
                                }
                                scroll {
                                    set yviews [$w.y get]
                                    set yview1 [lindex $yviews 0]
                                    set yview2 [lindex $yviews 1]

                                    if { $::ms::temp(fraction) < $yview1 } {
                                        # The User has click on the top trough.

                                        # Scroll the thumb by one page towards the top.
                                        ::ms::text::Pathname_Cmd $w yview scroll -1 pages

                                        set ::ms::temp(drag_allowed) yes
                                    } elseif { $::ms::temp(fraction) > $yview2 } {
                                        # The User has click on the bottom trough.

                                        # Scroll the thumb by one page towards the bottom.
                                        ::ms::text::Pathname_Cmd $w yview scroll 1 pages

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
# Manage the **ButtonRelease-1** event on the widget's internal scrollbar.
#
# It doesn't return anything.
proc ::ms::text::Scrollbar_ButtonRelease {} {
    unset -nocomplain -- ::ms::temp(drag_allowed) \
                         ::ms::temp(fraction) \
                         ::ms::temp(xpress) \
                         ::ms::temp(ypress);

    return ""
}

## Scrollbar_Drag
#
# Manage the **B1-Motion** event on the widget's internal scrollbar.
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
proc ::ms::text::Scrollbar_Drag { w orient x y } {
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
            ::ms::text::Pathname_Cmd $w xview moveto $fraction
        }
        vertical {
            # Compute the 'fraction' after the drag movement.
            set delta    [$w.y delta $delta_x $delta_y]
            set fraction [expr { $::ms::temp(fraction)+$delta }]

            # Move the vertical scrollbar to 'fraction'.
            ::ms::text::Pathname_Cmd $w yview moveto $fraction
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
proc ::ms::text::Scrollbar_Update { w } {
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

                # Set the horizontal scrollbar status to 'off'.
                set ::ms::data($w,scrollx) off
            }
        }
    } else {
        # Check if the horizontal scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrollx) {
            off {
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

                # Set the vertical scrollbar status to 'off'.
                set ::ms::data($w,scrolly) off
            }
        }
    } else {
        # Check if the vertical scrollbar is not currently displayed.
        switch -- $::ms::data($w,scrolly) {
            off {
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

##########################################
##                                      ##
##     REWRITTEN TK TEXT PROCEDURES     ##
##                                      ##
##########################################

##################################
##                              ##
##     CLEAR/COPY/CUT/PASTE     ##
##                              ##
##################################

# Note: The following procedures are a modified version of their equivalent ones of the Tk text widget.
#       The modifications were needed to let them work in mustang.
#       All credits goes to the original author/s.

## Clear
#
# Manage the **Clear** event by deleting the selected text.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Clear { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   { {*}$address edit separator }
    }

    # Execute the command.
    try {
        {*}$address delete sel.first sel.last
    } on error {} {
        # Do nothing.
    }

    # If autoseparators are active, put an autoseparator.
    switch -- $::ms::current($w,autoseparators) {
        1   { {*}$address edit separator }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

# Copy
#
# Manage the **Copy** event by copying the widget's selection into the clipboard.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Copy { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    try {
        {*}$address get sel.first sel.last
    } on error {} {
        return ""
    } on ok { data } {
        _clipboard clear  -displayof $w
        _clipboard append -displayof $w $data
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

## Cut
#
# Manage the **Cut** event by copying the widget's selection into the clipboard and
# then deleting the widget's selection.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::text::Cut { w } {
    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        false { set address [list interp invokehidden {} $w] }
        true  { set address [list $w.text] }
    }

    # Execute the command.
    try {
        {*}$address get sel.first sel.last
    } on error {} {
        return ""
    } on ok { data } {
        # make <<Cut>> an atomic operation on the Undo stack,
        # i.e. separate it from other delete operations on either side

        if { ($::ms::current($w,state) eq "normal") && ($::ms::current($w,autoseparators) == 1) } {
            {*}$address edit separator
        }

        _clipboard clear  -displayof $w
        _clipboard append -displayof $w $data

        {*}$address delete sel.first sel.last

        if { ($::ms::current($w,state) eq "normal") && ($::ms::current($w,autoseparators) == 1) } {
            {*}$address edit separator
        }
    }

    # Check if the widget is scrollable or not.
    switch -- $::ms::current($w,scrollbar) {
        true {
            # Update the scrollbars.
            ::ms::text::Scrollbar_Update $w
        }
    }

    return ""
}

#*EOF*