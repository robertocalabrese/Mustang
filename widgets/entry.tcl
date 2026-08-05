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
package provide ::ms::entry 0.1

#############################
##                         ##
##     _ENTRY BINDINGS     ##
##                         ##
#############################

# Activate/Deactivate
_bind _Entry <Activate>   { ::ms::entry::Pathname_Cmd %W state !background; break }
_bind _Entry <Deactivate> { ::ms::entry::Pathname_Cmd %W state  background; break }

# Allowing some modifiers combination.
switch -- [_tk windowingsystem] {
    aqua {
        _bind _Entry <Option-KeyPress>         { # Enable binding }
        _bind _Entry <Option-Shift-KeyPress>   { # Enable binding }
        _bind _Entry <Control-KeyPress>        { # Enable binding }
        _bind _Entry <Control-Option-KeyPress> { # Enable binding }
        _bind _Entry <Control-Shift-KeyPress>  { # Enable binding }
        _bind _Entry <Command-KeyPress>        { # Enable binding }
        _bind _Entry <Command-Shift-KeyPress>  { # Enable binding }
    }
    default {
        _bind _Entry <Alt-KeyPress>           { # Enable binding }
        _bind _Entry <Alt-Shift-KeyPress>     { # Enable binding }
        _bind _Entry <Control-KeyPress>       { # Enable binding }
        _bind _Entry <Control-Alt-KeyPress>   { # Enable binding }
        _bind _Entry <Control-Shift-KeyPress> { # Enable binding }
        _bind _Entry <Meta-KeyPress>          { # Enable binding }
        _bind _Entry <Meta-Shift-KeyPress>    { # Enable binding }
    }
}

# Backspace/Delete keys
_bind _Entry <KeyPress-BackSpace> { # Enable binding }
_bind _Entry <KeyPress-Delete>    { # Enable binding }
_bind _Entry <KeyPress-KP_Delete> { ::ttk::entry::Delete %W; break }
_bind _Entry <<DeleteChar>>       { ::ttk::entry::Delete %W; break }

# Delete from the insertion cursor till the end of the line.
switch -- [_tk windowingsystem] {
    aqua    { _bind _Entry <Option-KeyPress-d> { %W delete insert end; break } }
    default { _bind _Entry <Alt-KeyPress-d>    { %W delete insert end; break } }
}

# ButtonPress-1
_bind _Entry <ButtonPress-1>    { ::ms::entry::ButtonPress %W %x; break }

_bind _Entry <Button-2>         { ::ms::Scan_Or_Paste %W %x "Button-2"; break }
_bind _Entry <B2-Motion>        { ::ms::Scan_Or_Paste %W %x "B2-Motion"; break }
_bind _Entry <ButtonRelease-2>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-2"; break }

_bind _Entry <Button-3>         { ::ms::Scan_Or_Paste %W %x "Button-3"; break }
_bind _Entry <B3-Motion>        { ::ms::Scan_Or_Paste %W %x "B3-Motion"; break }
_bind _Entry <ButtonRelease-3>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-3"; break }

# Clear/Copy/Cut/Paste
_bind _Entry <<Clear>> { ::ms::Clear %W; break }
_bind _Entry <<Copy>>  { ::ms::Copy  %W; break }
_bind _Entry <<Cut>>   { ::ms::Cut   %W; break }
_bind _Entry <<Paste>> { ::ms::Paste %W CLIPBOARD; break }

# Contextual menu
_bind _Entry <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Entry <Destroy> { ::ms::entry::Destroy %W; break }

# Enter/Leave
_bind _Entry <Enter> { ::ms::entry::Pathname_Cmd %W state  hover; break }
_bind _Entry <Leave> { ::ms::entry::Pathname_Cmd %W state !hover; break }

# Escape key
_bind _Entry <KeyPress-Escape> { ::ms::Escape %W; break }

# F keys
_bind _Entry <Fn-KeyPress> { # Enable binding }

# FocusIn/FocusOut
_bind _Entry <FocusIn>  { ::ms::entry::Focus_In  %W; break }
_bind _Entry <FocusOut> { ::ms::entry::Focus_Out %W; break }

# Insert cursor movements.
_bind _Entry <<PrevChar>>   { ::ttk::entry::Move %W prevchar; break }
_bind _Entry <<NextChar>>   { ::ttk::entry::Move %W nextchar; break }
_bind _Entry <<PrevWord>>   { ::ttk::entry::Move %W prevword; break }
_bind _Entry <<NextWord>>   { ::ttk::entry::Move %W nextword; break }
_bind _Entry <<LineStart>>  { ::ttk::entry::Move %W home; break }
_bind _Entry <<LineEnd>>    { ::ttk::entry::Move %W end; break }

# Insert cursor selections.
_bind _Entry <<SelectPrevChar>>  { ::ttk::entry::Extend %W prevchar; break }
_bind _Entry <<SelectNextChar>>  { ::ttk::entry::Extend %W nextchar; break }
_bind _Entry <<SelectPrevWord>>  { ::ttk::entry::Extend %W prevword; break }
_bind _Entry <<SelectNextWord>>  { ::ttk::entry::Extend %W selectnextword; break }
_bind _Entry <<SelectLineStart>> { ::ttk::entry::Extend %W home; break }
_bind _Entry <<SelectLineEnd>>   { ::ttk::entry::Extend %W end; break }

# Enabling only some keys depending on the datatype specified for the widget.
_bind _Entry <KeyPress> { ::ms::entry::KeyPress %W %A; break }

# Return
_bind _Entry <KeyPress-Return>   { ::ms::entry::Return %W; break }
_bind _Entry <KeyPress-KP_Enter> { ::ms::entry::Return %W; break }

# Tab/Shift-Tab keys
_bind _Entry <KeyPress-Tab> { # Enable binding }
switch -- [_tk windowingsystem] {
    x11 {
        _bind _Entry <KeyPress-ISO_Left_Tab> { # Enable binding }

        # This seems to be correct on *some* HP systems.
        catch { _bind _Entry <KeyPress-hpBackTab> { # Enable binding } }
    }
    aqua  { _bind _Entry <KeyPress-ISO_Left_Tab> { # Enable binding } }
    win32 { _bind _Entry <Shift-KeyPress-Tab>    { # Enable binding } }
}

# Enabling window traversal navigation.
_bind _Entry <<PageLeft>>  { # Enable binding }
_bind _Entry <<PageRight>> { # Enable binding }
_bind _Entry <<PageUp>>    { # Enable binding }
_bind _Entry <<PageDown>>  { # Enable binding }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar and move
# that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Entry <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# If the widget has the focus, move the insert cursor by one character to the left or to the right
# (depending on the mousewheel direction), otherwise try to find the innermost widget's scrollable
# parent with an active horizontal scrollbar and move that scrollbar by one unit left or right
# (again, depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Entry <Shift-MouseWheel> { ::ms::entry::Shift_MouseWheel %W %D; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Entry <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Entry <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - View the **Shift-MouseWheel** event.
#   2 - View the **MouseWheel** event.
_bind _Entry <TouchpadScroll> { ::ms::entry::Touchpad %W %# %D; break }

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
_bind _Entry <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **entry** package.
namespace eval ::ms::entry {
    # Set the 'non styleable' entry option list.
    set ::ms::entry(non_styleable,options) [list class \
                                                 cmenu \
                                                 command \
                                                 datatype \
                                                 decimals \
                                                 exportselection \
                                                 from \
                                                 hash \
                                                 invalidcommand \
                                                 maxlength \
                                                 placeholder \
                                                 show \
                                                 state \
                                                 style \
                                                 takefocus \
                                                 textvariable \
                                                 to \
                                                 validate \
                                                 validatecommand \
                                                 xscrollcommand];

    # Set the 'styleable' entry option list.
    set ::ms::entry(styleable,options) [list background \
                                             bordercolor \
                                             charwidth \
                                             cursor \
                                             darkcolor \
                                             fieldbackground \
                                             focuscolor \
                                             focuswidth \
                                             font \
                                             foreground \
                                             insertcolor \
                                             insertwidth \
                                             justify \
                                             lightcolor \
                                             padding \
                                             placeholderforeground \
                                             selectbackground \
                                             selectborderwidth \
                                             selectforeground];

    # Set the default 'non-styleable' entry options values.
    set ::ms::default(entry,class)           TEntry
    set ::ms::default(entry,cmenu)           {}
    set ::ms::default(entry,command)         {}
    set ::ms::default(entry,datatype)        none
    set ::ms::default(entry,decimals)        1
    set ::ms::default(entry,exportselection) 1
    set ::ms::default(entry,from)            0
    set ::ms::default(entry,hash)            yes
    set ::ms::default(entry,invalidcommand)  {}
    set ::ms::default(entry,maxlength)       0
    set ::ms::default(entry,placeholder)     {}
    set ::ms::default(entry,show)            {}
    set ::ms::default(entry,state)           normal
    set ::ms::default(entry,style)           TEntry
    set ::ms::default(entry,takefocus)       1
    set ::ms::default(entry,textvariable)    {}
    set ::ms::default(entry,to)              0
    set ::ms::default(entry,validate)        none
    set ::ms::default(entry,validatecommand) {}
    set ::ms::default(entry,xscrollcommand)  {}

    # Note: The default 'styleable' entry options values are always defined inside the current theme.
}

# Rename the original Tk **entry** and **ttk::entry** commands.
rename entry      _entry
rename ttk::entry _ttk_entry

# Create aliases for the mustang **entry** command.
interp alias {} entry      {} ::ms::entry::Command
interp alias {} ttk::entry {} ::ms::entry::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **entry** and **ttk::entry** widgets commands.
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
proc ::ms::entry::Command { window { args "" } } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the 'window' address and set its real and short addresses.
    set addresses  [::ms::Check_Widget_Address $window $caller_info]
    set w          [lindex $addresses 0]
    set short_addr [lindex $addresses 1]
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
proc ::ms::entry::Pathname_Cmd { w cmd args } {}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any entry widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::entry::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*