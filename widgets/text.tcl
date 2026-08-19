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
                }
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