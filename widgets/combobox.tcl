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
            set ::ms::default($w,class)           $::ms::default(combobox,class)
            set ::ms::default($w,cmenu)           $::ms::default(combobox,cmenu)
            set ::ms::default($w,command)         $::ms::default(combobox,command)
            set ::ms::default($w,datatype)        $::ms::default(combobox,datatype)
            set ::ms::default($w,exportselection) $::ms::default(combobox,exportselection)
            set ::ms::default($w,invalidcommand)  $::ms::default(combobox,invalidcommand)
            set ::ms::default($w,maxlength)       $::ms::default(combobox,maxlength)
            set ::ms::default($w,placeholder)     $::ms::default(combobox,placeholder)
            set ::ms::default($w,posthook)        $::ms::default(combobox,posthook)
            set ::ms::default($w,prehook)         $::ms::default(combobox,prehook)
            set ::ms::default($w,state)           $::ms::default(combobox,state)
            set ::ms::default($w,style)           $::ms::default(combobox,style)
            set ::ms::default($w,takefocus)       $::ms::default(combobox,takefocus)
            set ::ms::default($w,textvariable)    $::ms::default(combobox,textvariable)
            set ::ms::default($w,validate)        $::ms::default(combobox,validate)
            set ::ms::default($w,validatecommand) $::ms::default(combobox,validatecommand)
            set ::ms::default($w,values)          $::ms::default(combobox,values)
            set ::ms::default($w,xscrollcommand)  $::ms::default(combobox,xscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)           $::ms::default(combobox,class)
            set ::ms::current($w,cmenu)           $::ms::default(combobox,cmenu)
            set ::ms::current($w,command)         $::ms::default(combobox,command)
            set ::ms::current($w,datatype)        $::ms::default(combobox,datatype)
            set ::ms::current($w,exportselection) $::ms::default(combobox,exportselection)
            set ::ms::current($w,invalidcommand)  $::ms::default(combobox,invalidcommand)
            set ::ms::current($w,maxlength)       $::ms::default(combobox,maxlength)
            set ::ms::current($w,placeholder)     $::ms::default(combobox,placeholder)
            set ::ms::current($w,posthook)        $::ms::default(combobox,posthook)
            set ::ms::current($w,prehook)         $::ms::default(combobox,prehook)
            set ::ms::current($w,state)           $::ms::default(combobox,state)
            set ::ms::current($w,style)           $::ms::default(combobox,style)
            set ::ms::current($w,takefocus)       $::ms::default(combobox,takefocus)
            set ::ms::current($w,textvariable)    $::ms::default(combobox,textvariable)
            set ::ms::current($w,validate)        $::ms::default(combobox,validate)
            set ::ms::current($w,validatecommand) $::ms::default(combobox,validatecommand)
            set ::ms::current($w,values)          $::ms::default(combobox,values)
            set ::ms::current($w,xscrollcommand)  $::ms::default(combobox,xscrollcommand)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) combobox

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
            #       To make a combobox styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **combobox** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,arrowcolor)            Tk
            set ::ms::managed_by($w,arrowsize)             Tk
            set ::ms::managed_by($w,background)            Tk
            set ::ms::managed_by($w,bordercolor)           Tk
            set ::ms::managed_by($w,charwidth)             Tk
            set ::ms::managed_by($w,cursor)                Tk
            set ::ms::managed_by($w,darkcolor)             Tk
            set ::ms::managed_by($w,fieldbackground)       Tk
            set ::ms::managed_by($w,focuscolor)            Tk
            set ::ms::managed_by($w,focuswidth)            Tk
            set ::ms::managed_by($w,font)                  Tk
            set ::ms::managed_by($w,foreground)            Tk
            set ::ms::managed_by($w,insertcolor)           Tk
            set ::ms::managed_by($w,insertwidth)           Tk
            set ::ms::managed_by($w,justify)               Tk
            set ::ms::managed_by($w,lightcolor)            Tk
            set ::ms::managed_by($w,padding)               Tk
            set ::ms::managed_by($w,placeholderforeground) Tk
            set ::ms::managed_by($w,rows)                  Tk
            set ::ms::managed_by($w,selectbackground)      Tk
            set ::ms::managed_by($w,selectborderwidth)     Tk
            set ::ms::managed_by($w,selectforeground)      Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -arrowcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,arrowcolor)    $value
                        set ::ms::managed_by($w,arrowcolor) developer
                    }
                    -arrowsize {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,arrowsize)    $value
                        set ::ms::managed_by($w,arrowsize) developer
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
                    -charwidth {
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,charwidth)    $value
                                set ::ms::managed_by($w,charwidth) developer
                            }
                        }
                    }
                    -class { set ::ms::current($w,class) $value }
                    -cmenu {
                        set value [string trim $value]
                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                            set ::ms::current($w,cmenu) $value
                        }
                    }
                    -command { set ::ms::current($w,command) $value }
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
                    -datatype {
                        set value [string tolower $value]
                        switch -- $value {
                            alnum      -
                            alpha      -
                            integer    -
                            posinteger -
                            posreal    -
                            real       -
                            none       { set ::ms::current($w,datatype) $value }
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
                    -insertcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertcolor)    $value
                        set ::ms::managed_by($w,insertcolor) developer
                    }
                    -insertwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertwidth)    $value
                        set ::ms::managed_by($w,insertwidth) developer
                    }
                    -invalidcommand { set ::ms::current($w,invalidcommand) $value }
                    -justify {
                        set value [string tolower $value]
                        switch -- $value {
                            center -
                            left   -
                            right  {
                                set ::ms::current($w,justify)    $value
                                set ::ms::managed_by($w,justify) developer
                            }
                        }
                    }
                    -lightcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,lightcolor)    $value
                        set ::ms::managed_by($w,lightcolor) developer
                    }
                    -maxlength {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value >= 0 } {
                                    set ::ms::current($w,maxlength) $value
                                }
                            }
                        }
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
                    -placeholder { set ::ms::current($w,placeholder) $value }
                    -placeholderforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,placeholderforeground)    $value
                        set ::ms::managed_by($w,placeholderforeground) developer
                    }
                    -posthook { set ::ms::current($w,posthook) $value }
                    -prehook { set ::ms::current($w,prehook) $value }
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
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            disabled -
                            readonly -
                            normal   { set ::ms::current($w,state) $value }
                        }
                    }
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TCombobox' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TCombobox]
                            }

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
                    -textvariable {
                        switch -- [info exists $value] {
                            1   {
                                set ::ms::current($w,textvariable) $value

                                # Set a trace in order to perform a validation (if needed) whenever the developer
                                # changes the value of the variable name provided.
                                trace add variable $value \
                                          write    [list ::ms::combobox::Check_TextVariable $w]
                            }
                        }
                    }
                    -validate {
                        switch -nocase $value {
                            none     { set ::ms::current($w,validate) none }
                            focus    { set ::ms::current($w,validate) focus }
                            focusin  { set ::ms::current($w,validate) focusin }
                            focusout { set ::ms::current($w,validate) focusout }
                            key      { set ::ms::current($w,validate) key }
                            all      { set ::ms::current($w,validate) all }
                        }
                    }
                    -validatecommand { set ::ms::current($w,validatecommand) $value }
                    -values { set ::ms::current($w,values) $value }
                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::combobox(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TCombobox,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            # Check the widget state and set the takefocus accordingly.
            switch -- $::ms::current($w,state) {
                disabled { set ::ms::current($w,takefocus) 0 }
            }

            # If the maxlength is not zero check that the charwidth is not less of it.
            switch -- $::ms::current($w,maxlength) {
                0       {}
                default {
                    if { $::ms::current($w,charwidth) < $::ms::current($w,maxlength) } {
                        set ::ms::current($w,charwidth) $::ms::current($w,maxlength)
                    }
                }
            }

            # Check the invalidcommand, validate, validatecommand and xscrollcommand options
            # relative to the datatype option provided.
            switch -- $::ms::current($w,datatype) {
                alnum      -
                alpha      -
                integer    -
                posinteger -
                posreal    -
                real       {
                    set ::ms::current($w,invalidcommand)  {}
                    set ::ms::current($w,validate)        key
                    set ::ms::current($w,validatecommand) [list ::ms::combobox::Validate_KeyPress %W %P]

                    switch -- $::ms::current($w,maxlength) {
                        0       {}
                        default {
                            # Ignore the xscrollcommand provided, if any.
                            set ::ms::current($w,xscrollcommand) {}
                        }
                    }
                }
            }

            # Check if a list of values was provided.
            switch -- [llength $::ms::current($w,values)] {
                0   {
                    # Check the datatype.
                    switch -- $::ms::current($w,datatype) {
                        alnum {
                            set number 1
                            while { $number < 51 } {
                                lappend ::ms::current($w,values) [string cat "Item-" $number]
                                incr number
                            }

                            # Set the current index as the index of the item **Item-0**.
                            set ::ms::data($w,current_index) 0

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::current($w,values)]
                        }
                        integer {
                            set number -25
                            while { $number < 26 } {
                                lappend ::ms::current($w,values) $number
                                incr number
                            }

                            # Set the current index as the index of the item **0**.
                            set ::ms::data($w,current_index) 25
                        }
                        posinteger {
                            set number 0
                            while { $number < 51 } {
                                lappend ::ms::current($w,values) $number
                                incr number
                            }

                            # Set the current index as the index of the item **0**.
                            set ::ms::data($w,current_index) 0
                        }
                        posreal {
                            set number 0
                            while { $number < 51.0 } {
                                lappend ::ms::current($w,values) $number
                                set number [expr { $number+1.0 } ]
                            }

                            # Set the current index as the index of the item **0**.
                            set ::ms::data($w,current_index) 0
                        }
                        real {
                            set number -25.0
                            while { $number < 26.0 } {
                                lappend ::ms::current($w,values) $number
                                set number [expr { $number+1.0 } ]
                            }

                            # Set the current index as the index of the item **0**.
                            set ::ms::data($w,current_index) 25
                        }
                        default {
                            lappend ::ms::current($w,values) Amsterdam Beijing        Cairo           Dublin    Freetown      Gibraltar \
                                                             Hanoi     Havana         Helsinki        Islamabad Jerusalem     Kabul \
                                                             Kingston  "Kuala Lumpur" "La Paz"        Lima      Lisbon        London \
                                                             Madrid    Manila         "Mexico City"   Minx      Monaco        Montevideo \
                                                             Moscow    Nairobi        "New Delhi"     Oslo      "Panama City" Paris \
                                                             Praga     Quito          Reykjavík       Riga      Rome          "San José" \
                                                             San Juan  "San Salvador" "Santo Domingo" Sarajevo  Seoul         Singapore \
                                                             Sofia     Stockholm      Taipei          Tallin    Tirana        Tokyo \
                                                             Tunis     Valletta       Vienna          Warsaw    Washigton     Zagreb;

                            # Set the current index as the index of the item **Amsterdam**.
                            set ::ms::data($w,current_index) 0

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::current($w,values)]
                        }
                    }

                    # Register the sorted values
                    set ::ms::data($w,values) $::ms::current($w,values)

                    # Set the current value as the value corresponding to the '::ms::data($w,current_index)' in '::ms::current($w,values)'.
                    set ::ms::data($w,current_value) [lindex $::ms::current($w,values) $::ms::data($w,current_index)]

                    # Compute the index of the last available item in '::ms::current($w,values)'.
                    set ::ms::data($w,last_available_index) [expr { [llength $::ms::current($w,values)]-1 }]
                }
                default {
                    # Check the datatype.
                    switch -- $::ms::current($w,datatype) {
                        alnum {
                            foreach value $::ms::current($w,values) {
                                # Check every character in value.
                                set i 0
                                while { $i < [string length $value] } {
                                    set char [string index $value $i]
                                    switch -- $char {
                                        " "     -
                                        "."     -
                                        ","     -
                                        "-"     {}
                                        default {
                                            switch -- [string is alnum $char] {
                                                0   { ::ms::Error "One of the values assigned to '$w' is not a valid alphanumeric value, 'value: $value'." $caller_info }
                                            }
                                        }
                                    }

                                    incr i
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -dictionary $::ms::current($w,values)]

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                        }
                        alpha {
                            foreach value $::ms::current($w,values) {
                                # Check every character in value.
                                set i 0
                                while { $i < [string length $value] } {
                                    set char [string index $value $i]
                                    switch -- $char {
                                        " "     {}
                                        default {
                                            switch -- [string is alpha $char] {
                                                0   { ::ms::Error "One of the values assigned to '$w' is not a valid alphabetic value, 'value: $value'." $caller_info }
                                            }
                                        }
                                    }

                                    incr i
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -ascii $::ms::current($w,values)]

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                        }
                        integer {
                            foreach value $::ms::current($w,values) {
                                switch -- [string is integer -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid integer value, 'value: $value'." $caller_info }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -integer $::ms::current($w,values)]
                        }
                        posinteger {
                            foreach value $::ms::current($w,values) {
                                switch -- [string is integer -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid posinteger value, 'value: $value'." $caller_info }
                                    1   {
                                        if { $value < 0 } {
                                            ::ms::Error "One of the values assigned to '$w' is not a valid posinteger value, 'value: $value'." $caller_info
                                        }
                                    }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -integer $::ms::current($w,values)]
                        }
                        posreal {
                            foreach value $::ms::current($w,values) {
                                switch -- [string is double -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid posreal value, 'value: $value'." $caller_info }
                                    1   {
                                        if { $value < 0 } {
                                            ::ms::Error "One of the values assigned to '$w' is not a valid posreal value, 'value: $value'." $caller_info
                                        }
                                    }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -real $::ms::current($w,values)]
                        }
                        real {
                            foreach value $::ms::current($w,values) {
                                switch -- [string is double -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid real value, 'value: $value'." $caller_info }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -real $::ms::current($w,values)]
                        }
                        none {
                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -dictionary $::ms::current($w,values)]

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                        }
                    }

                    # Set the current index as the first one of '::ms::data($w,values)', and get the relative value.
                    set ::ms::data($w,current_index) 0
                    set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $::ms::data($w,current_index)]

                    # Compute the index of the last available item in '::ms::data($w,values)'.
                    set ::ms::data($w,last_available_index) [expr { [llength $::ms::data($w,values)]-1 }]
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