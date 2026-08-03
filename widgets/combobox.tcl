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
package provide ::ms::combobox 0.1

################################
##                            ##
##     _COMBOBOX BINDINGS     ##
##                            ##
################################

# Activate/Deactivate
_bind _Combobox <Activate>   { ::ms::combobox::Pathname_Cmd %W state !background; break }
_bind _Combobox <Deactivate> { ::ms::combobox::Pathname_Cmd %W state  background; break }

# Allowing some modifiers combination.
switch -- [_tk windowingsystem] {
    aqua {
        _bind _Combobox <Option-KeyPress>         { # Enable binding }
        _bind _Combobox <Option-Shift-KeyPress>   { # Enable binding }
        _bind _Combobox <Control-KeyPress>        { # Enable binding }
        _bind _Combobox <Control-Option-KeyPress> { # Enable binding }
        _bind _Combobox <Control-Shift-KeyPress>  { # Enable binding }
        _bind _Combobox <Command-KeyPress>        { # Enable binding }
        _bind _Combobox <Command-Shift-KeyPress>  { # Enable binding }
    }
    default {
        _bind _Combobox <Alt-KeyPress>           { # Enable binding }
        _bind _Combobox <Alt-Shift-KeyPress>     { # Enable binding }
        _bind _Combobox <Control-KeyPress>       { # Enable binding }
        _bind _Combobox <Control-Alt-KeyPress>   { # Enable binding }
        _bind _Combobox <Control-Shift-KeyPress> { # Enable binding }
        _bind _Combobox <Meta-KeyPress>          { # Enable binding }
        _bind _Combobox <Meta-Shift-KeyPress>    { # Enable binding }
    }
}

# Backspace/Delete keys
_bind _Combobox <KeyPress-BackSpace> { # Enable binding }
_bind _Combobox <KeyPress-Delete>    { # Enable binding }
_bind _Combobox <KeyPress-KP_Delete> { ::ttk::entry::Delete %W; break }

# Buttonpress
_bind _Combobox <ButtonPress-1>        { ::ms::combobox::ButtonPress %W %x %y "";  break }
_bind _Combobox <Shift-ButtonPress-1>  { ::ms::combobox::ButtonPress %W %x %y "s"; break }
_bind _Combobox <Double-ButtonPress-1> { ::ms::combobox::ButtonPress %W %x %y "2"; break }
_bind _Combobox <Triple-ButtonPress-1> { ::ms::combobox::ButtonPress %W %x %y "3"; break }
_bind _Combobox <B1-Motion>            { ::ms::Drag %W %x %y; break }

_bind _Combobox <Button-2>         { ::ms::Scan_Or_Paste %W %x "Button-2"; break }
_bind _Combobox <B2-Motion>        { ::ms::Scan_Or_Paste %W %x "B2-Motion"; break }
_bind _Combobox <ButtonRelease-2>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-2"; break }

_bind _Combobox <Button-3>         { ::ms::Scan_Or_Paste %W %x "Button-3"; break }
_bind _Combobox <B3-Motion>        { ::ms::Scan_Or_Paste %W %x "B3-Motion"; break }
_bind _Combobox <ButtonRelease-3>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-3"; break }

# Contextual menu
_bind _Combobox <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Clear/Copy/Cut/Paste
_bind _Combobox <<Clear>> { ::ms::Clear %W; break }
_bind _Combobox <<Copy>>  { ::ms::Copy  %W; break }
_bind _Combobox <<Cut>>   { ::ms::Cut   %W; break }
_bind _Combobox <<Paste>> { ::ms::Paste %W CLIPBOARD; break }

# Cursor management.
_bind _Combobox <Motion> { ::ms::Set_Cursor %W %x %y; break }

# Destroy
_bind _Combobox <Destroy> { ::ms::combobox::Destroy %W; break }

# Enter/Leave
_bind _Combobox <Enter> { ::ms::combobox::Pathname_Cmd %W state  hover; break }
_bind _Combobox <Leave> { ::ms::combobox::Pathname_Cmd %W state !hover; break }

# Escape key
_bind _Combobox <KeyPress-Escape> { ::ms::Escape %W; break }

# F keys
_bind _Combobox <Fn-KeyPress> { # Enable binding }

# FocusIn/FocusOut
_bind _Combobox <FocusIn>  { ::ms::combobox::Focus_In  %W; break }
_bind _Combobox <FocusOut> { ::ms::combobox::Focus_Out %W; break }

# Insert cursor movements.
_bind _Combobox <<LineEnd>>   { ::ttk::entry::Move %W end; break }
_bind _Combobox <<LineStart>> { ::ttk::entry::Move %W home; break }
_bind _Combobox <<NextChar>>  { ::ttk::entry::Move %W nextchar; break }
_bind _Combobox <<NextLine>>  { ::ms::combobox::Post %W; break }
_bind _Combobox <<NextWord>>  { ::ttk::entry::Move %W nextword; break }
_bind _Combobox <<PrevChar>>  { ::ttk::entry::Move %W prevchar; break }
_bind _Combobox <<PrevWord>>  { ::ttk::entry::Move %W prevword; break }

_bind _Combobox <<SelectLineEnd>>   { ::ttk::entry::Extend %W end; break }
_bind _Combobox <<SelectLineStart>> { ::ttk::entry::Extend %W home; break }
_bind _Combobox <<SelectNextChar>>  { ::ttk::entry::Extend %W nextchar; break }
_bind _Combobox <<SelectNextWord>>  { ::ttk::entry::Extend %W selectnextword; break }
_bind _Combobox <<SelectPrevChar>>  { ::ttk::entry::Extend %W prevchar; break }
_bind _Combobox <<SelectPrevWord>>  { ::ttk::entry::Extend %W prevword; break }

_bind _Combobox <<SelectAll>>  { %W selection range 0 end; break }
_bind _Combobox <<SelectNone>> { %W selection clear; break }

# Enabling only some keys depending on the datatype specified for the widget.
_bind _Combobox <KeyPress> { ::ms::combobox::KeyPress %W %A; break }

# Return
_bind _Combobox <KeyPress-Return>   { ::ms::combobox::Return %W; break }
_bind _Combobox <KeyPress-KP_Enter> { ::ms::combobox::Return %W; break }

# Tab/Shift-Tab keys
_bind _Combobox <KeyPress-Tab> { # Enable binding }
switch -- [_tk windowingsystem] {
    x11 {
        _bind _Combobox <KeyPress-ISO_Left_Tab> { # Enable binding }

        # This seems to be correct on *some* HP systems.
        catch { _bind _Combobox <KeyPress-hpBackTab> { # Enable binding } }
    }
    aqua  { _bind _Combobox <KeyPress-ISO_Left_Tab> { # Enable binding } }
    win32 { _bind _Combobox <Shift-KeyPress-Tab>    { # Enable binding } }
}

# Enabling window traversal navigation.
_bind _Combobox <<PageLeft>>  { # Enable binding }
_bind _Combobox <<PageRight>> { # Enable binding }
_bind _Combobox <<PageUp>>    { # Enable binding }
_bind _Combobox <<PageDown>>  { # Enable binding }

# Mousewheel and Touchpad

# If the widget is in its **normal** or **readonly** state and the items list is not empty, scroll the items
# list without displaying the popdown window, otherwise try to find the innermost widget's scrollable parent
# with an active vertical scrollbar and move that scrollbar by one unit up or down (depending on the
# mousewheel direction). If none of the widget's parents meets the required condition, nothing will happen.
_bind _Combobox <MouseWheel> { ::ms::combobox::MouseWheel %W %D; break }

# If the widget is in its **normal** state and has the focus, move the insert cursor by one character
# towards the left or the right (depending on the direction of the mousewheel event), otherwise try to
# find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
# by one unit left or right (again, depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, nothing will happen.
_bind _Combobox <Shift-MouseWheel> { ::ms::combobox::Shift_MouseWheel %W %D; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Combobox <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Combobox <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - View the **Shift-MouseWheel** event.
#   2 - View the **MouseWheel** event.
_bind _Combobox <TouchpadScroll> { ::ms::combobox::Touchpad %W %# %D; break }

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
_bind _Combobox <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **combobox** package.
namespace eval ::ms::combobox {
    # Set the 'non styleable' combobox option list.
    set ::ms::combobox(non_styleable,options) [list class \
                                                    cmenu \
                                                    command \
                                                    datatype \
                                                    exportselection \
                                                    invalidcommand \
                                                    maxlength \
                                                    placeholder \
                                                    posthook \
                                                    prehook \
                                                    state \
                                                    style \
                                                    takefocus \
                                                    textvariable \
                                                    validate \
                                                    validatecommand \
                                                    values \
                                                    xscrollcommand];

    # Set the 'styleable' combobox option list.
    set ::ms::combobox(styleable,options) [list arrowcolor \
                                                arrowsize \
                                                background \
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
                                                rows \
                                                selectbackground \
                                                selectborderwidth \
                                                selectforeground];

    # Set the default 'non-styleable' combobox options values.
    set ::ms::default(combobox,class)           TCombobox
    set ::ms::default(combobox,cmenu)           {}
    set ::ms::default(combobox,command)         {}
    set ::ms::default(combobox,datatype)        none
    set ::ms::default(combobox,exportselection) 1
    set ::ms::default(combobox,invalidcommand)  {}
    set ::ms::default(combobox,maxlength)       0
    set ::ms::default(combobox,placeholder)     {}
    set ::ms::default(combobox,posthook)        {}
    set ::ms::default(combobox,prehook)         {}
    set ::ms::default(combobox,state)           normal
    set ::ms::default(combobox,style)           TCombobox
    set ::ms::default(combobox,takefocus)       1
    set ::ms::default(combobox,textvariable)    {}
    set ::ms::default(combobox,validate)        none
    set ::ms::default(combobox,validatecommand) {}
    set ::ms::default(combobox,values)          {}
    set ::ms::default(combobox,xscrollcommand)  {}

    # Note: The default 'styleable' combobox options values are always defined inside the current theme.
}

# Rename the original Tk **ttk::combobox** command.
rename ttk::combobox _ttk_combobox

# Create aliases for the mustang **combobox** command.
interp alias {} combobox      {} ::ms::combobox::Command
interp alias {} ttk::combobox {} ::ms::combobox::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **combobox** and **ttk::combobox** widgets commands.
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
proc ::ms::combobox::Command { window { args "" } } {
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
proc ::ms::combobox::Pathname_Cmd { w cmd args } {}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any combobox widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::combobox::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*