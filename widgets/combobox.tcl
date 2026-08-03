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

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify',
            #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

            # Agglomerate the padding values.
            set padding ""
            foreach pad $::ms::current($w,padding) {
                append padding "$pad" "-"
            }
            set padding [string trimright $padding "-"]

            ######################
            ##                  ##
            ##     COMBOBOX     ##
            ##                  ##
            ######################

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_ac="  $::ms::current($w,arrowcolor) \
                                                   "_as="  $::ms::current($w,arrowsize) \
                                                   "_bg="  $::ms::current($w,background) \
                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                   "_fb="  $::ms::current($w,fieldbackground) \
                                                   "_fc="  $::ms::current($w,focuscolor) \
                                                   "_fg="  $::ms::current($w,foreground) \
                                                   "_fw="  $::ms::current($w,focuswidth) \
                                                   "_iw="  $::ms::current($w,insertwidth) \
                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                   "_pd="  $padding \
                                                   "_phf=" $::ms::current($w,placeholderforeground) \
                                                   "_sbg=" $::ms::current($w,selectbackground) \
                                                   "_sbd=" $::ms::current($w,selectborderwidth) \
                                                   "_sfg=" $::ms::current($w,selectforeground) \
                                                   "." $::ms::current($w,style)];

            # If needed, create the widget style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)            -arrowcolor $::ms::current($w,arrowcolor) \
                                                                         -arrowsize $::ms::current($w,arrowsize) \
                                                                        -background $::ms::current($w,background) \
                                                                       -bordercolor $::ms::current($w,bordercolor) \
                                                                         -darkcolor $::ms::current($w,darkcolor) \
                                                                   -fieldbackground $::ms::current($w,fieldbackground) \
                                                                        -focuscolor $::ms::current($w,focuscolor) \
                                                                        -focuswidth $::ms::current($w,focuswidth) \
                                                                        -foreground $::ms::current($w,foreground) \
                                                                        -lightcolor $::ms::current($w,lightcolor) \
                                                                           -padding $::ms::current($w,padding) \
                                                             -placeholderforeground $::ms::current($w,placeholderforeground) \
                                                                  -selectbackground $::ms::current($w,selectbackground) \
                                                                  -selectforeground $::ms::current($w,selectforeground);

                # Add the widget style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
            }

            # Initialize the widget mapping.
            set mapping [list ]

            # arrowcolor
            switch -- $::ms::managed_by($w,arrowcolor) {
                developer { lappend mapping -arrowcolor [list pressed $::ms::current($w,arrowcolor)] }
                Tk  {
                    # Check if a 'arrowcolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor)] {
                        1   { lappend mapping -arrowcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor) }
                    }
                }
            }

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

            # placeholderforeground
            switch -- $::ms::managed_by($w,placeholderforeground) {
                developer { lappend mapping -placeholderforeground [list pressed $::ms::current($w,placeholderforeground)] }
                Tk  {
                    # Check if a 'placeholderforeground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground)] {
                        1   { lappend mapping -placeholderforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground) }
                    }
                }
            }

            # selectbackground
            switch -- $::ms::managed_by($w,selectbackground) {
                developer { lappend mapping -selectbackground [list pressed $::ms::current($w,selectbackground)] }
                Tk  {
                    # Check if a 'selectbackground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground)] {
                        1   { lappend mapping -selectbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground) }
                    }
                }
            }

            # selectforeground
            switch -- $::ms::managed_by($w,selectforeground) {
                developer { lappend mapping -selectforeground [list pressed $::ms::current($w,selectforeground)] }
                Tk  {
                    # Check if a 'selectforeground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground)] {
                        1   { lappend mapping -selectforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground) }
                    }
                }
            }

            # If needed, create the widget mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,widget) {*}$mapping

                # Add the widget mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the combobox widget.
            _ttk_combobox $w           -class $::ms::current($w,class) \
                                      -cursor $::ms::current($w,cursor) \
                             -exportselection $::ms::current($w,exportselection) \
                                        -font $::ms::current($w,font) \
                              -invalidcommand $::ms::current($w,invalidcommand) \
                                      -height $::ms::current($w,rows) \
                                     -justify $::ms::current($w,justify) \
                                 -placeholder $::ms::current($w,placeholder) \
                                 -postcommand {} \
                                        -show "" \
                                       -state $::ms::current($w,state) \
                                       -style $::ms::style($w,widget) \
                                   -takefocus $::ms::current($w,takefocus) \
                                -textvariable $::ms::current($w,textvariable) \
                                    -validate $::ms::current($w,validate) \
                             -validatecommand $::ms::current($w,validatecommand) \
                                      -values $::ms::data($w,values) \
                                       -width $::ms::current($w,charwidth) \
                              -xscrollcommand $::ms::current($w,xscrollcommand);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            # Set the current index in the combobox entry.
            $w current $::ms::data($w,current_index)

            # Set the cursor at the end of the combobox textarea.
            $w icursor end

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TCombobox { bindtags $w [list $w _Combobox TCombobox $::ms::addr($w,toplevel) all] }
                default   { bindtags $w [list $w $::ms::current($w,class) _Combobox TCombobox $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::combobox::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::combobox::Pathname_Cmd $w]
            }

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w

            # Set the structure addresses.
            set ::ms::addr($w,structure) [list $w]

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short address relative to its real address, 'w'.
            set ::ms::addr($w,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals)  $w
            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the combobox classtype widgets real address list.
            lappend ::ms::addr(combobox) $w

            # Add the widget address to the combobox classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),combobox,addrs) $w

            # Add the widget address to the combobox classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),combobox,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the combobox classtype.
            if { $::ms::current($w,style) ni $::ms::style(combobox,classtype) } {
                lappend ::ms::style(combobox,classtype) $::ms::current($w,style)
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
proc ::ms::combobox::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        bbox    -
        icursor -
        index   {
            # Synopsis:
            #
            # *window* **bbox** *index*
            # *window* **icursor** *index*
            # *window* **index** *index*
            switch -- [llength $args] {
                1   {
                    try {
                        interp invokehidden {} $w $cmd $args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
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
                    if { ($option in $::ms::combobox(non_styleable,options)) || ($option in $::ms::combobox(styleable,options))} {
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
                    foreach option $::ms::combobox(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::combobox(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::combobox(non_styleable,options)) || ($option in $::ms::combobox(styleable,options)) } {
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

                            # Check the widget options provided.
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
                                    -class {}
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
                                    -datatype {}
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
                                    -invalidcommand { set ::ms::current($w,invalidcommand) $value }
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

                                            # Remove the widget address from the combobox real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),combobox,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),combobox,addrs) [lremove $::ms::style($::ms::current($w,style),combobox,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,combobox,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the combobox classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),combobox,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(combobox,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(combobox,classtype) [lremove $::ms::style(combobox,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the combobox classtype.
                                            if { $value ni $::ms::style(combobox,classtype) } {
                                                lappend ::ms::style(combobox,classtype) $value
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
                                    -textvariable {
                                        switch -- [info exists $value] {
                                            1   {
                                                # Remove the previous trace, if any.
                                                switch -- $::ms::current($w,textvariable) {
                                                    ""      {}
                                                    default {
                                                        trace remove variable $::ms::current($w,textvariable) \
                                                                     write    [list ::ms::combobox::Check_TextVariable $w];
                                                    }
                                                }

                                                # Set the new current textvariable.
                                                set ::ms::current($w,textvariable) $value

                                                # Set a trace in order to perform a validation (if needed) whenever the developer
                                                # changes the value of the variable name provided.
                                                trace add variable $value \
                                                          write    [list ::ms::combobox::Check_TextVariable $w];
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
                                    -values {
                                        # Set the new current list of values.
                                        set ::ms::current($w,values) $value

                                        # Check if a list of values was provided.
                                        switch -- [llength $::ms::current($w,values)] {
                                            0   {
                                                # Remove any possible whitespaces.
                                                set ::ms::current($w,values) [list ]

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
                                                                                         Praga     Quito          Reykjavík       Riga      Rome          San José \
                                                                                         San Juan  San Salvador   "Santo Domingo" Sarajevo  Seoul         Singapore \
                                                                                         Sofia     Stockholm      Taipei          Tallin    Tirana        Tokyo \
                                                                                         Tunis     Valletta       Vienna          Warsaw    Washigton     Zagreb;

                                                        # Set the current index as the index of the item **Amsterdam**.
                                                        set ::ms::data($w,current_index) 0

                                                        # Register the sorted values in lowercase characters.
                                                        set ::ms::data($w,values,lowercase) [string tolower $::ms::current($w,values)]
                                                    }
                                                }

                                                # Register the sorted values.
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

                                        # Clear the widget textarea.
                                        interp invokehidden {} $w delete 0 end
                                        interp invokehidden {} $w selection clear

                                        # Set the current index in the combobox entry.
                                        interp invokehidden {} $w current $::ms::data($w,current_index)
                                    }
                                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::combobox(styleable,options) {
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

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify',
                            #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

                            # Agglomerate the padding values.
                            set padding ""
                            foreach pad $::ms::current($w,padding) {
                                append padding "$pad" "-"
                            }
                            set padding [string trimright $padding "-"]

                            # If the combobox popdown is currently displayed, release the grab.
                            switch -- [winfo exists $w.popdown] {
                                1   { set ::wait_for_user_response "Unpost" }
                            }

                            ######################
                            ##                  ##
                            ##     COMBOBOX     ##
                            ##                  ##
                            ######################

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_ac="  $::ms::current($w,arrowcolor) \
                                                                   "_as="  $::ms::current($w,arrowsize) \
                                                                   "_bg="  $::ms::current($w,background) \
                                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                                   "_fb="  $::ms::current($w,fieldbackground) \
                                                                   "_fc="  $::ms::current($w,focuscolor) \
                                                                   "_fg="  $::ms::current($w,foreground) \
                                                                   "_fw="  $::ms::current($w,focuswidth) \
                                                                   "_iw="  $::ms::current($w,insertwidth) \
                                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                                   "_pd="  $padding \
                                                                   "_phf=" $::ms::current($w,placeholderforeground) \
                                                                   "_sbg=" $::ms::current($w,selectbackground) \
                                                                   "_sbd=" $::ms::current($w,selectborderwidth) \
                                                                   "_sfg=" $::ms::current($w,selectforeground) \
                                                                   "." $::ms::current($w,style)];

                            # If needed, create the widget style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)            -arrowcolor $::ms::current($w,arrowcolor) \
                                                                                         -arrowsize $::ms::current($w,arrowsize) \
                                                                                        -background $::ms::current($w,background) \
                                                                                       -bordercolor $::ms::current($w,bordercolor) \
                                                                                         -darkcolor $::ms::current($w,darkcolor) \
                                                                                   -fieldbackground $::ms::current($w,fieldbackground) \
                                                                                        -focuscolor $::ms::current($w,focuscolor) \
                                                                                        -focuswidth $::ms::current($w,focuswidth) \
                                                                                        -foreground $::ms::current($w,foreground) \
                                                                                        -lightcolor $::ms::current($w,lightcolor) \
                                                                                           -padding $::ms::current($w,padding) \
                                                                             -placeholderforeground $::ms::current($w,placeholderforeground) \
                                                                                  -selectbackground $::ms::current($w,selectbackground) \
                                                                                  -selectforeground $::ms::current($w,selectforeground);

                                # Add the widget style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
                            }

                            # Initialize the widget mapping.
                            set mapping [list ]

                            # arrowcolor
                            switch -- $::ms::managed_by($w,arrowcolor) {
                                developer { lappend mapping -arrowcolor [list pressed $::ms::current($w,arrowcolor)] }
                                Tk  {
                                    # Check if a 'arrowcolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor)] {
                                        1   { lappend mapping -arrowcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowcolor) }
                                    }
                                }
                            }

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

                            # placeholderforeground
                            switch -- $::ms::managed_by($w,placeholderforeground) {
                                developer { lappend mapping -placeholderforeground [list pressed $::ms::current($w,placeholderforeground)] }
                                Tk  {
                                    # Check if a 'placeholderforeground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground)] {
                                        1   { lappend mapping -placeholderforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground) }
                                    }
                                }
                            }

                            # selectbackground
                            switch -- $::ms::managed_by($w,selectbackground) {
                                developer { lappend mapping -selectbackground [list pressed $::ms::current($w,selectbackground)] }
                                Tk  {
                                    # Check if a 'selectbackground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground)] {
                                        1   { lappend mapping -selectbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground) }
                                    }
                                }
                            }

                            # selectforeground
                            switch -- $::ms::managed_by($w,selectforeground) {
                                developer { lappend mapping -selectforeground [list pressed $::ms::current($w,selectforeground)] }
                                Tk  {
                                    # Check if a 'selectforeground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground)] {
                                        1   { lappend mapping -selectforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground) }
                                    }
                                }
                            }

                            # If needed, create the widget mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,widget) {*}$mapping

                                # Add the widget mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure          -cursor $::ms::current($w,cursor) \
                                                                -exportselection $::ms::current($w,exportselection) \
                                                                           -font $::ms::current($w,font) \
                                                                 -invalidcommand $::ms::current($w,invalidcommand) \
                                                                        -justify $::ms::current($w,justify) \
                                                                    -placeholder $::ms::current($w,placeholder) \
                                                                          -state $::ms::current($w,state) \
                                                                          -style $::ms::style($w,widget) \
                                                                      -takefocus $::ms::current($w,takefocus) \
                                                                   -textvariable $::ms::current($w,textvariable) \
                                                                       -validate $::ms::current($w,validate) \
                                                                -validatecommand $::ms::current($w,validatecommand) \
                                                                         -values $::ms::data($w,values) \
                                                                          -width $::ms::current($w,charwidth) \
                                                                 -xscrollcommand $::ms::current($w,xscrollcommand);

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        current {
            # Synopsis:
            #
            # *window* **current** ?newIndex?
            switch -- [llength $args] {
                0   {
                    # Find the value in '::ms::data($w,values)' that corrisponds to the current index
                    # displayed in the combobox entry.
                    set value [lindex $::ms::data($w,values) $::ms::data($w,current_index)]

                    # Check the widget datatype.
                    switch -- $::ms::current($w,datatype) {
                        integer    -
                        posinteger { return [lsearch -exact -integer $::ms::current($w,values) $value] }
                        real       -
                        posreal    { return [lsearch -exact -real    $::ms::current($w,values) $value] }
                        default    { return [lsearch -exact -nocase  $::ms::current($w,values) $value] }
                    }
                }
                1   {
                    # Check that the argument provided is an integer.
                    switch -- [string is integer $args] {
                        0   { ::ms::Error "The argument provided is not an index, '$args'" $caller_info }
                    }

                    # Find the index in '::ms::data($w,values)' that corrisponds to the index provided
                    # for '::ms::current($w,values)'.
                    set value [lindex $::ms::current($w,values) $args]
                    switch -- $value {
                        ""      {}
                        default {
                            # Set the new current index and value.
                            set ::ms::data($w,current_value) $value

                            # Check the widget datatype.
                            switch -- $::ms::current($w,datatype) {
                                integer    -
                                posinteger { set ::ms::data($w,current_index) [lsearch -exact -integer $::ms::current($w,values) $value] }
                                real       -
                                posreal    { set ::ms::data($w,current_index) [lsearch -exact -real    $::ms::current($w,values) $value] }
                                default    { set ::ms::data($w,current_index) [lsearch -exact -nocase  $::ms::current($w,values) $value] }
                            }

                            # Clear the widget textarea.
                            interp invokehidden {} $w delete 0 end
                            interp invokehidden {} $w selection clear

                            # Apply the changes.
                            interp invokehidden {} $w current $::ms::data($w,current_index)
                        }
                    }

                    return ""
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        delete    -
        identify  -
        selection {
            # Synopsis:
            #
            # *window* **delete** *first* ?*last*?
            # *window* **identify** **element** *x* *y*
            # *window* **selection** *option* *arg*
            #    *window* **selection** **clear**
            #    *window* **selection** **present**
            #    *window* **selection** **range** *start* *end*
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    try {
                        interp invokehidden {} $w $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
            }
        }
        insert {
            # Synopsis:
            #
            # *window* **insert** *index* *string*
            switch -- $::DEBUG {
                1       -
                on      -
                true    -
                active  -
                enabled { chan puts stdout "'insert' is a deprecated mustang combobox command. Use 'set' instead." }
            }

            # Check the widget state.
            switch -- $::ms::current($w,state) {
                normal {
                    # Check the number of arguments provided.
                    switch -- [llength $args] {
                        2   {
                            set index  [lindex $args 0]
                            set string [lindex $args 1]

                            try {
                                interp invokehidden {} $w insert $index $string
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }

            return ""
        }
        get      -
        validate {
            # Synopsis:
            #
            # *window* **get**
            # *window* **validate**
            return [interp invokehidden {} $w $cmd]
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

                    try {
                        interp invokehidden {} $w instate $statespec
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
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

                    try {
                        interp invokehidden {} $w instate $statespec $script
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        set {
            # Synopsis:
            #
            # *window* **set** *value*
            switch -- [llength $args] {
                1   {
                    # Check the widget datatype.
                    switch -- $::ms::current($w,datatype) {
                        integer    -
                        posinteger { set index [lsearch -exact -integer $::ms::data($w,values) $args] }
                        real       -
                        posreal    { set index [lsearch -exact -real    $::ms::data($w,values) $args] }
                        default    { set index [lsearch -exact -nocase  $::ms::data($w,values) $args] }
                    }

                    # Check that the value provided exists inside '::ms::data($w,values)'.
                    switch -- $index {
                        -1      {}
                        default {
                            # Update the current index and value.
                            set ::ms::data($w,current_index) $index
                            set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $index]

                            # Clear the widget textarea.
                            interp invokehidden {} $w delete 0 end
                            interp invokehidden {} $w selection clear

                            # Apply the changes.
                            interp invokehidden {} $w current $index

                            # Execute the command associated with the widget.
                            ::ms::Execute_Widget_Cmd $w
                        }
                    }

                    return ""
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        state {
            # Synopsis:
            #
            # *window* **state** ?*statespec*?
            switch -- [llength $args] {
                0   { return [interp invokehidden {} $w state] }
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

                    return [interp invokehidden {} $w state $statespec]
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
            # *window* **xview** *option* *args*
            #    *window* **xview**
            #    *window* **xview** *index*
            #    *window* **xview** **moveto** *fraction*
            #    *window* **xview** **scroll** *number* *what*
            switch -- [llength $args] {
                0   { return [interp invokehidden {} $w xview] }
                1   -
                2   -
                3   {
                    try {
                        interp invokehidden {} $w $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
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
# Update any combobox widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::combobox::Style_Update { stylename caller_info } {
    # Check the stylename charwidth, if any.
    set index [lsearch -exact $::ms::styleopt($::ms::theme,$stylename) "-charwidth"]
    switch -- $index {
        -1      {}
        default {
            if { $::ms::styleopt($::ms::theme,$stylename,charwidth) <= 0 } {
                # Update the stylename charwidth option for the current theme.
                set ::ms::styleopt($::ms::theme,$stylename)           [lreplace $::ms::styleopt($::ms::theme,$stylename) $index+1 $index+1 8]
                set ::ms::styleopt($::ms::theme,$stylename,charwidth) 8
            }
        }
    }

    # Update all the combobox widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,combobox,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::combobox(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TCombobox,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
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

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify',
        #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

        # Agglomerate the padding values.
        set padding ""
        foreach pad $::ms::current($w,padding) {
            append padding "$pad" "-"
        }
        set padding [string trimright $padding "-"]

        # If the combobox popdown is currently displayed, release the grab.
        switch -- [winfo exists $w.popdown] {
            1   { set ::wait_for_user_response "Unpost" }
        }

        ######################
        ##                  ##
        ##     COMBOBOX     ##
        ##                  ##
        ######################

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_ac="  $::ms::current($w,arrowcolor) \
                                               "_as="  $::ms::current($w,arrowsize) \
                                               "_bg="  $::ms::current($w,background) \
                                               "_bc="  $::ms::current($w,bordercolor) \
                                               "_dc="  $::ms::current($w,darkcolor) \
                                               "_fb="  $::ms::current($w,fieldbackground) \
                                               "_fc="  $::ms::current($w,focuscolor) \
                                               "_fg="  $::ms::current($w,foreground) \
                                               "_fw="  $::ms::current($w,focuswidth) \
                                               "_iw="  $::ms::current($w,insertwidth) \
                                               "_lc="  $::ms::current($w,lightcolor) \
                                               "_pd="  $padding \
                                               "_phf=" $::ms::current($w,placeholderforeground) \
                                               "_sbg=" $::ms::current($w,selectbackground) \
                                               "_sbd=" $::ms::current($w,selectborderwidth) \
                                               "_sfg=" $::ms::current($w,selectforeground) \
                                               "." $::ms::current($w,style)];

        # If needed, create the widget style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)            -arrowcolor $::ms::current($w,arrowcolor) \
                                                                     -arrowsize $::ms::current($w,arrowsize) \
                                                                    -background $::ms::current($w,background) \
                                                                   -bordercolor $::ms::current($w,bordercolor) \
                                                                     -darkcolor $::ms::current($w,darkcolor) \
                                                               -fieldbackground $::ms::current($w,fieldbackground) \
                                                                    -focuscolor $::ms::current($w,focuscolor) \
                                                                    -focuswidth $::ms::current($w,focuswidth) \
                                                                    -foreground $::ms::current($w,foreground) \
                                                                    -lightcolor $::ms::current($w,lightcolor) \
                                                                       -padding $::ms::current($w,padding) \
                                                         -placeholderforeground $::ms::current($w,placeholderforeground) \
                                                              -selectbackground $::ms::current($w,selectbackground) \
                                                              -selectforeground $::ms::current($w,selectforeground);

            # Add the widget style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
        }

        # Initialize the widget mapping.
        set mapping [list ]

        # arrowsize
        switch -- $::ms::managed_by($w,arrowsize) {
            developer { lappend mapping -arrowsize [list pressed $::ms::current($w,arrowsize)] }
            Tk  {
                # Check if a 'arrowsize' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowsize)] {
                    1   { lappend mapping -arrowsize $::ms::stylemap($::ms::theme,$::ms::current($w,style),arrowsize) }
                }
            }
        }

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

        # placeholderforeground
        switch -- $::ms::managed_by($w,placeholderforeground) {
            developer { lappend mapping -placeholderforeground [list pressed $::ms::current($w,placeholderforeground)] }
            Tk  {
                # Check if a 'placeholderforeground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground)] {
                    1   { lappend mapping -placeholderforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),placeholderforeground) }
                }
            }
        }

        # selectbackground
        switch -- $::ms::managed_by($w,selectbackground) {
            developer { lappend mapping -selectbackground [list pressed $::ms::current($w,selectbackground)] }
            Tk  {
                # Check if a 'selectbackground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground)] {
                    1   { lappend mapping -selectbackground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectbackground) }
                }
            }
        }

        # selectforeground
        switch -- $::ms::managed_by($w,selectforeground) {
            developer { lappend mapping -selectforeground [list pressed $::ms::current($w,selectforeground)] }
            Tk  {
                # Check if a 'selectforeground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground)] {
                    1   { lappend mapping -selectforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),selectforeground) }
                }
            }
        }

        # If needed, create the widget mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,widget) {*}$mapping

            # Add the widget mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        interp invokehidden {} $w configure      -cursor $::ms::current($w,cursor) \
                                                   -font $::ms::current($w,font) \
                                                -justify $::ms::current($w,justify) \
                                            -placeholder $::ms::current($w,placeholder) \
                                                  -style $::ms::style($w,widget) \
                                                  -width $::ms::current($w,charwidth);
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
# Manage the **ButtonPress-1** event on the widget.
# Post/Unpost the popdown listbox or perform the entry widget binding,
# depending on widget state and the location of the ButtonPress.
#
# Note: The following procedure is a modified version of the 'ttk::combobox::Press' procedure.
#       All credits goes to the original author/s.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#        These values should be provided by the **ButtonPress** event.
#
# mode   Should be the click type.
#        Allowed values are:
#           "" --> for single press
#           2  --> for double press
#           3  --> for triple press
#           s  --> for shift press
#
# It doesn't return anything.
proc ::ms::combobox::ButtonPress { w x y mode } {
    # Check the widget state.
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
        readonly { ::ms::combobox::Post $w }
        normal   {
            # Check the cursor location.
            switch -- [interp invokehidden {} $w identify element $x $y] {
                "textarea" {
                    # Focus the combobox if its not already focussed.
                    interp invokehidden {} $w instate [list !focus] {
                        _focus -force $w
                    }

                    # Check the press type.
                    switch -- $mode {
                        s       { ::ttk::entry::Shift-Press $w $x }
                        2       { ::ttk::entry::Select      $w $x word }
                        3       { ::ttk::entry::Select      $w $x line }
                        default { ::ttk::entry::Press       $w $x }
                    }
                }
                default { ::ms::combobox::Post $w }
            }
        }
    }

    return ""
}

## Check_TextVariable
#
# Validate the textvariable value, everytime it changes.
#
# Where:
#
# w        Should be the widget real address involved.
#
# name1,
# name2,
# op       Should be the tracing arguments.
#          Do not pass any value, the **trace** command will automatically pass these values.
#
# It doesn't return anything.
proc ::ms::combobox::Check_TextVariable { w name1 name2 op } {
    switch -- $::ms::current($w,datatype) {
        none    {}
        default { ::ms::combobox::Return $w }
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
proc ::ms::combobox::Destroy { w } {
    # If the combobox popdown is currently displayed, release the grab.
    switch -- [winfo exists $w.popdown] {
        1   { set ::wait_for_user_response "Unpost" }
    }

    # Get the short address related to the widget real address.
    set short_addr $::ms::addr($w,short)

    # Destroy the aliased widget pathcommands.
    foreach token $::ms::data($w,token) {
        interp alias {} $token {}
    }

    # Remove the widget real address from the widgets real address list.
    set index [lsearch -exact $::ms::addr(reals) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
    }

    # Remove the widget short address from the widgets short address list.
    set index [lsearch -exact $::ms::addr(shorts) $short_addr]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(shorts) [lremove $::ms::addr(shorts) $index] }
    }

    # Remove the widget address from the combobox widgets real address list.
    set index [lsearch -exact $::ms::addr(combobox) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(combobox) [lremove $::ms::addr(combobox) $index] }
    }

    # Remove the widget address from the combobox real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),combobox,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),combobox,addrs) [lremove $::ms::class($::ms::current($w,class),combobox,addrs) $index] }
    }

    # Remove the widget address from the combobox real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),combobox,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),combobox,addrs) [lremove $::ms::style($::ms::current($w,style),combobox,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the combobox classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),combobox,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(combobox,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(combobox,classtype) [lremove $::ms::style(combobox,classtype) $index] }
            }
        }
    }

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,arrowcolor) \
                         ::ms::current($w,arrowsize) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,charwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,command) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,datatype) \
                         ::ms::current($w,exportselection) \
                         ::ms::current($w,fieldbackground) \
                         ::ms::current($w,focuscolor) \
                         ::ms::current($w,focuswidth) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,invalidcommand) \
                         ::ms::current($w,insertcolor) \
                         ::ms::current($w,insertwidth) \
                         ::ms::current($w,justify) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,maxlength) \
                         ::ms::current($w,padding) \
                         ::ms::current($w,placeholder) \
                         ::ms::current($w,placeholderforeground) \
                         ::ms::current($w,posthook) \
                         ::ms::current($w,prehook) \
                         ::ms::current($w,rows) \
                         ::ms::current($w,selectbackground) \
                         ::ms::current($w,selectborderwidth) \
                         ::ms::current($w,selectforeground) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,validate) \
                         ::ms::current($w,validatecommand) \
                         ::ms::current($w,values) \
                         ::ms::current($w,xscrollcommand);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,current_index) \
                         ::ms::data($w,current_value) \
                         ::ms::data($w,last_available_index) \
                         ::ms::data($w,token) \
                         ::ms::data($w,values) \
                         ::ms::data($w,values,lowercase);

    unset -nocomplain -- ::ms::default($w,arrowcolor) \
                         ::ms::default($w,arrowsize) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,charwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,command) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,datatype) \
                         ::ms::default($w,exportselection) \
                         ::ms::default($w,fieldbackground) \
                         ::ms::default($w,focuscolor) \
                         ::ms::default($w,focuswidth) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,invalidcommand) \
                         ::ms::default($w,insertcolor) \
                         ::ms::default($w,insertwidth) \
                         ::ms::default($w,justify) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,maxlength) \
                         ::ms::default($w,padding) \
                         ::ms::default($w,placeholder) \
                         ::ms::default($w,placeholderforeground) \
                         ::ms::default($w,posthook) \
                         ::ms::default($w,prehook) \
                         ::ms::default($w,rows) \
                         ::ms::default($w,selectbackground) \
                         ::ms::default($w,selectborderwidth) \
                         ::ms::default($w,selectforeground) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,textvariable) \
                         ::ms::default($w,validate) \
                         ::ms::default($w,validatecommand) \
                         ::ms::default($w,values) \
                         ::ms::default($w,xscrollcommand);

    unset -nocomplain -- ::ms::managed_by($w,arrowcolor) \
                         ::ms::managed_by($w,arrowsize) \
                         ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,charwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,fieldbackground) \
                         ::ms::managed_by($w,focuscolor) \
                         ::ms::managed_by($w,focuswidth) \
                         ::ms::managed_by($w,font) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,insertcolor) \
                         ::ms::managed_by($w,insertwidth) \
                         ::ms::managed_by($w,justify) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,padding) \
                         ::ms::managed_by($w,placeholderforeground) \
                         ::ms::managed_by($w,rows) \
                         ::ms::managed_by($w,selectbackground) \
                         ::ms::managed_by($w,selectborderwidth) \
                         ::ms::managed_by($w,selectforeground);

    unset -nocomplain -- ::ms::style($w,widget)

    return ""
}

## Focus_In
#
# Manage the **FocusIn** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Focus_In { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::combobox::Pathname_Cmd $w state focus

    # Check the widget state.
    switch -- $::ms::current($w,state) {
        normal {
            # Select all the widget textarea characters.
            interp invokehidden {} $w selection range 0 end
        }
    }

    return ""
}

## Focus_Out
#
# Manage the **FocusOut** event.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Focus_Out { w } {
    # Check the contextual menu relative to this widget, if any.
    switch -- $::ms::current($w,cmenu) {
        ""      {}
        default {
            # If the contextual menu of the widget is open do not loose the focus (graphically),
            # remove the selection or validate the data.
            switch -- [_winfo exists $::ms::current($w,cmenu)] {
                1   { return "" }
            }
        }
    }

    # If the popdown window of the combobox is currently displayed do not loose the focus (graphically),
    # remove the selection or validate the data.
    switch -- [_winfo exists $w.popdown] {
        1   { return "" }
    }

    # Change the widget dynamic state to '!focus'.
    ::ms::combobox::Pathname_Cmd $w state !focus

    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { set value [interp invokehidden {} $w get] }
        normal {
            # Validate the widget string.
            set value [::ms::combobox::Validate_String $w]

            # Clear the widget field, insert the validated value and put the cursor at the end.
            interp invokehidden {} $w delete 0 end
            interp invokehidden {} $w set $value
            interp invokehidden {} $w icursor end
        }
    }

    # Remove the widget selection, if any.
    interp invokehidden {} $w selection clear

    # If 'value' is different than the previous registered one, register it
    # and launch the external procedure provided, if any.
    if { $value ne $::ms::data($w,current_value) } {
        set ::ms::data($w,current_index) [lsearch -exact $::ms::data($w,values) $value]
        set ::ms::data($w,current_value) $value

        ::ms::Execute_Widget_Cmd $w
    }

    # Cleaning.
    unset -nocomplain -- ::ms::temp($w,pending_execute_cmd)

    return ""
}

## KeyPress
#
# Manage the **Keypress** event on the widget.
# Some keys may be disabled depending on the datatype specified for the widget.
#
# Where:
#
# w     Should be the widget real address involved.
#
# key   Should be the key pressed.
#
# It doesn't return anything.
proc ::ms::combobox::KeyPress { w key } {
    # Enable only the keypress bindings that are needed for the 'datatype' provided and
    # disable everything else.
    switch -- $::ms::current($w,datatype) {
        alnum {
            switch -- $key {
                Caps_Lock   -
                KP_Decimal  -
                KP_Subtract {}
                default     {
                    if { ![regexp "\[0-9a-zA-Z .,\-\]" $key] } {
                        return -code break
                    }
                }
            }
        }
        alpha {
            switch -- $key {
                Caps_Lock {}
                default   {
                    if { ![regexp "\[a-zA-Z \]" $key] } {
                        return -code break
                    }
                }
            }
        }
        integer {
            switch -- $key {
                KP_Subtract {}
                default     {
                    if { ![regexp "\[0-9\-\]" $key] } {
                        return -code break
                    }
                }
            }
        }
        posinteger {
            if { ![regexp "\[0-9\]" $key] } {
                return -code break
            }
        }
        posreal {
            switch -- $key {
                KP_Decimal {}
                default    {
                    if { ![regexp "\[0-9.\]" $key] } {
                        return -code break
                    }
                }
            }
        }
        real {
            switch -- $key {
                KP_Decimal  -
                KP_Subtract {}
                default     {
                    if { ![regexp "\[0-9.\-\]" $key] } {
                        return -code break
                    }
                }
            }
        }
    }

    ::ttk::entry::Insert $w $key

    return ""
}

## Post
#
# Post the popdown window.
#
# Note: The following procedure is a modified version of the 'ttk::combobox::Post' procedure.
#       All credits goes to the original author/s.
#
# Where:
#
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Post { w } {
    # Note: This procedure have been highly influenced by many 'ttk::combobox' procedures.
    #       All credits goes to the original author/s.

    # Check if the popdown should not be displayed.
    if { $::ms::current($w,state) eq "disabled" } {
        return ""
    }

    # Safeguard.
    unset -nocomplain -- ::wait_for_user_response

    # Run the prehook callback, if any.
    switch -- $::ms::current($w,prehook) {
        ""      {}
        default {
            try {
                uplevel #0 [list $::ms::current($w,prehook) $w]
            } on error { errortext errorcode } {
                ::ms::Error "Invalid prehook command for '$w'." ""
            }
        }
    }

    ################################
    ##                            ##
    ##     CREATE THE POPDOWN     ##
    ##                            ##
    ################################

    set background        $::ms::styleopt($::ms::theme,Popdown,background)
    set bordercolor       $::ms::styleopt($::ms::theme,Popdown,bordercolor)
    set borderwidth       $::ms::styleopt($::ms::theme,Popdown,borderwidth)
    set cursor            $::ms::styleopt($::ms::theme,Popdown,cursor)
    set darkcolor         $::ms::styleopt($::ms::theme,Popdown,darkcolor)
    set font              $::ms::styleopt($::ms::theme,Popdown,font)
    set foreground        $::ms::styleopt($::ms::theme,Popdown,foreground)
    set justify           $::ms::styleopt($::ms::theme,Popdown,justify)
    set lightcolor        $::ms::styleopt($::ms::theme,Popdown,lightcolor)
    set padding           $::ms::styleopt($::ms::theme,Popdown,padding)
    set relief            $::ms::styleopt($::ms::theme,Popdown,relief)
    set selectbackground  $::ms::styleopt($::ms::theme,Popdown,selectbackground)
    set selectborderwidth $::ms::styleopt($::ms::theme,Popdown,selectborderwidth)
    set selectforeground  $::ms::styleopt($::ms::theme,Popdown,selectforeground)

    # Change the widget dynamic state to 'pressed'.
    ::ms::combobox::Pathname_Cmd $w state pressed

    ######################
    ##                  ##
    ##     TOPLEVEL     ##
    ##                  ##
    ######################

    _toplevel $w.popdown          -background $background \
                             -backgroundimage "" \
                                 -borderwidth 0 \
                                       -class ComboboxPopdown \
                                    -colormap {} \
                                   -container 0 \
                                      -cursor arrow \
                                      -height 0 \
                         -highlightbackground $bordercolor \
                              -highlightcolor $bordercolor \
                          -highlightthickness $borderwidth \
                                        -menu {} \
                                        -padx [list 0] \
                                        -pady [list 0] \
                                      -relief flat \
                                      -screen {} \
                                   -takefocus 0 \
                                        -tile 0 \
                                         -use {} \
                                      -visual {} \
                                       -width 0;

    # OS specific attributes.
    switch -- [_tk windowingsystem] {
        aqua    { _wm attributes $w.popdown -alpha 1.0 }
        win32   { _wm attributes $w.popdown -toolwindow 1 }
        default { _wm attributes $w.popdown -type combo }

    }

    # Common attributes.
    _wm group            $w.popdown $::ms::addr($w,toplevel)
    _wm overrideredirect $w.popdown true
    _wm resizable        $w.popdown 0 0
    _wm withdraw         $w.popdown

    ###################
    ##               ##
    ##     FRAME     ##
    ##               ##
    ###################

    # Set the popdown frame style.
    set ::ms::style($w,popdown_frame) [string cat "_sb=" $background \
                                                  "_bc=" $bordercolor \
                                                  "_dc=" $darkcolor \
                                                  "_lc=" $lightcolor \
                                                  ".TFrame"];

    # If needed, create the popdown frame style.
    if { $::ms::style($w,popdown_frame) ni $::ms::style($::ms::theme,created_by_mustang) } {
        _ttk_style configure $::ms::style($w,popdown_frame)  -background $background \
                                                            -bordercolor $bordercolor \
                                                              -darkcolor $darkcolor \
                                                             -lightcolor $lightcolor;

        # Add the popdown frame style to the theme styles list created by mustang.
        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,popdown_frame)
    }

    # Initialize the popdown frame mapping.
    set mapping [list ]

    # Check if a 'bordercolor' mapping exists for 'Popdown'.
    switch -- [info exists ::ms::stylemap($::ms::theme,Popdown,bordercolor)] {
        0   { lappend mapping -bordercolor [list pressed $bordercolor] }
        1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,Popdown,bordercolor) }
    }

    # Check if a 'darkcolor' mapping exists for 'Popdown'.
    switch -- [info exists ::ms::stylemap($::ms::theme,Popdown,darkcolor)] {
        0   { lappend mapping -darkcolor [list pressed $darkcolor] }
        1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,Popdown,darkcolor) }
    }

    # Check if a 'lightcolor' mapping exists for 'Popdown'.
    switch -- [info exists ::ms::stylemap($::ms::theme,Popdown,lightcolor)] {
        0   { lappend mapping -lightcolor [list pressed $lightcolor] }
        1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,Popdown,lightcolor) }
    }

    # If needed, create the popdown frame mapping.
    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
        _ttk_style map $::ms::style($w,popdown_frame) {*}$mapping

        # Add the popdown frame mapping to the stylemap list containing all the mappings
        # created by mustang for the current theme.
        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
    }

    # Create the popdown frame object.
    _ttk_frame $w.popdown.f -borderwidth 0 \
                                  -class TFrame \
                                 -cursor arrow \
                                 -height 0 \
                                -padding $padding \
                                 -relief flat \
                                  -style $::ms::style($w,popdown_frame) \
                              -takefocus 0 \
                                  -width 0;

    #####################
    ##                 ##
    ##     LISTBOX     ##
    ##                 ##
    #####################

    _listbox $w.popdown.f.lb         -activestyle none \
                                      -background $background \
                                     -borderwidth 0 \
                                          -cursor $cursor \
                                 -exportselection false \
                                            -font $font \
                                      -foreground $foreground \
                                          -height $::ms::current($w,rows) \
                             -highlightbackground $background \
                                  -highlightcolor $background \
                              -highlightthickness 0 \
                                         -justify $justify \
                                    -listvariable ::ms::data($w,values) \
                                          -relief flat \
                                -selectbackground $selectbackground \
                               -selectborderwidth $selectborderwidth \
                                -selectforeground $selectforeground \
                                      -selectmode browse \
                                         -setgrid 0 \
                                           -state normal \
                                       -takefocus 1 \
                                           -width 0 \
                                  -xscrollcommand {} \
                                  -yscrollcommand {};

    # Set the listbox bindtags.
    _bindtags $w.popdown.f.lb [list $w.popdown.f.lb Popdown Listbox $w.popdown.f all]

    ##############################
    ##                          ##
    ##     POPDOWN BINDINGS     ##
    ##                          ##
    ##############################

    # ButtonRelease events outside of the popdown window.
    switch -- [_tk windowingsystem] {
        aqua    { _bind $w.popdown <ButtonPress-2> [list ::ms::External_Click $w %X %Y] }
        default { _bind $w.popdown <ButtonPress-3> [list ::ms::External_Click $w %X %Y] }
    }
    _bind $w.popdown <ButtonPress-1> [list ::ms::External_Click $w %X %Y]

    # Map/Unmap
    _bind $w.popdown <Map>   { break }
    _bind $w.popdown <Unmap> { break }

    # Motion
    _bind $w.popdown <Motion> [list ::ms::combobox::Popdown_Motion $w %X %Y]

    # Scan
    _bind $w.popdown <<ScanMark>>    [list ::ms::Scan_Mark $w.popdown.f.lb %x %y]
    _bind $w.popdown <<ScanDrag>>    [list ::ms::Scan_Drag $w.popdown.f.lb %x %y]
    _bind $w.popdown <<ScanRelease>> [list ::ms::Scan_Release]

    # ArrowDown/ArrowUp
    _bind $w.popdown.f.lb <<NextLine>> [list ::ms::combobox::Popdown_ArrowDown  $w]
    _bind $w.popdown.f.lb <<PrevLine>> [list ::ms::combobox::Popdown_ArrowUp    $w]

    # Control-End/Control-Home
    _bind $w.popdown.f.lb <<LineEnd>>   [list ::ms::combobox::Popdown_End  $w]
    _bind $w.popdown.f.lb <<LineStart>> [list ::ms::combobox::Popdown_Home $w]

    # Escape
    _bind $w.popdown.f.lb <KeyPress-Escape> { set ::wait_for_user_response "Unpost"; break }

    # End/Home
    _bind $w.popdown.f.lb <<LineBottom>> [list ::ms::combobox::Popdown_End  $w]
    _bind $w.popdown.f.lb <<LineTop>>    [list ::ms::combobox::Popdown_Home $w]

    # FocusOut, *only* do this on Windows (see #1814778).
    # Dismiss the listbox when the user switches to a different application.
    switch -- [_tk windowingsystem] {
        win32 { _bind $w.popdown.f.lb <FocusOut> { set ::wait_for_user_response "Unpost"; break } }
    }

    # Motion
    _bind $w.popdown.f.lb <Motion> [list ::ms::combobox::Popdown_Hover $w %x %y]

    # PageDown/PageUp
    _bind $w.popdown.f.lb <<PageDown>> [list ::ms::combobox::Popdown_PageDown  $w]
    _bind $w.popdown.f.lb <<PageUp>>   [list ::ms::combobox::Popdown_PageUp    $w]

    # Selection
    _bind $w.popdown.f.lb <ButtonRelease-1>   [list ::ms::combobox::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-Return>   [list ::ms::combobox::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-KP_Enter> [list ::ms::combobox::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-space>    [list ::ms::combobox::Popdown_Select $w]

    # Shift-Tab/Tab
    switch -- [_tk windowingsystem] {
        win32   { _bind $w.popdown.f.lb <Shift-Tab> { ::ms::combobox::Popdown_Tab %W previous; break } }
        default {
            _bind $w.popdown.f.lb <ISO_Left_Tab>    { ::ms::combobox::Popdown_Tab %W previous; break }

            try {
                _bind $w.popdown.f.lb <hpBackTab>   { ::ms::combobox::Popdown_Tab %W previous; break }
            } on error {} {
                # Do nothing.
            }
        }
    }
    _bind $w.popdown.f.lb <Tab> { ::ms::combobox::Popdown_Tab %W next; break }

    # If the listbox can scroll vertically, move the listbox viewpoint by one unit up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f     <MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f.lb  <MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D units]

    # If the listbox can scroll horizontally, move the listbox viewpoint by one unit left or right
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f     <Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f.lb  <Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D units]

    # If the listbox can scroll vertically, move the listbox viewpoint by one page up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f     <Control-MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f.lb  <Control-MouseWheel> [list ::ms::combobox::Popdown_MouseWheel $w %x %y %D pages]

    # If the listbox can scroll horizontally, move the listbox viewpoint by one page left or right
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f     <Control-Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f.lb  <Control-Shift-MouseWheel> [list ::ms::combobox::Popdown_Shift_MouseWheel $w %x %y %D pages]

    # Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
    #       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

    # If the listbox can scroll vertically, move the listbox viewpoint by one unit up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D units]
    _bind $w.popdown.f     <TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D units]
    _bind $w.popdown.f.lb  <TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D units]

    # If the listbox can scroll vertically, move the listbox viewpoint by one page up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D pages]
    _bind $w.popdown.f     <Control-TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D pages]
    _bind $w.popdown.f.lb  <Control-TouchpadScroll> [list ::ms::combobox::Popdown_Touchpad $w %x %y %# %D pages]

    #############################
    ##                         ##
    ##     GRID EVERYTHING     ##
    ##                         ##
    #############################

    # Grid the elements of the popdown window.
    _grid $w.popdown.f   -padx [list 0] \
                         -pady [list 0] \
                       -sticky news;

    _grid $w.popdown.f.lb -column 0 \
                            -padx [list 3p 3p] \
                            -pady [list 3p 3p] \
                             -row 0 \
                          -sticky nsew;

    # Configure the grids rows and columns.
    _grid rowconfigure    $w.popdown 0 -weight 1
    _grid columnconfigure $w.popdown 0 -weight 1

    _grid columnconfigure $w.popdown.f 0 -weight 1
    _grid rowconfigure    $w.popdown.f 0 -weight 1

    #######################
    ##                   ##
    ##     SCROLLBAR     ##
    ##                   ##
    #######################

    if { $::ms::current($w,rows) < [llength $::ms::data($w,values)] } {
        _ttk_scrollbar $w.popdown.f.vsb     -class TScrollbar \
                                          -command [list $w.popdown.f.lb yview] \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

        $w.popdown.f.lb configure -yscrollcommand [list $w.popdown.f.vsb set]

        _bind $w.popdown.f.vsb <MouseWheel>         [list ::ms::combobox::Scrollbar_MouseWheel $w %D units]
        _bind $w.popdown.f.vsb <Control-MouseWheel> [list ::ms::combobox::Scrollbar_MouseWheel $w %D pages]

        _bind $w.popdown.f.vsb <TouchpadScroll>         [list ::ms::combobox::Scrollbar_Touchpad $w %# %D units]
        _bind $w.popdown.f.vsb <Control-TouchpadScroll> [list ::ms::combobox::Scrollbar_Touchpad $w %# %D pages]

        _grid $w.popdown.f.vsb -column 1 \
                                 -padx [list 0  3p] \
                                 -pady [list 3p 3p] \
                                  -row 0 \
                               -sticky ns;
    }

    #######################################
    ##                                   ##
    ##     SET THE POPDOWN SELECTION     ##
    ##                                   ##
    #######################################

    ::ms::combobox::Popdown_Autoselection $w

    ###############################
    ##                           ##
    ##     PLACE THE POPDOWN     ##
    ##                           ##
    ###############################

    update idletasks

    # Get the (x,y) absolute coordinate of the NW point of the combobox.
    set combobox_x [_winfo rootx $w]
    set combobox_y [_winfo rooty $w]

    # Get the width and height of the combobox.
    set combobox_height [_winfo height $w]
    set combobox_width  [_winfo width  $w]

    # Adjust the coordinates and dimensions by the 'postoffset' specified in the combobox style provided.
    set postoffset [_ttk_style lookup $::ms::current($w,style) -postoffset {} [list 0 0 0 0]]
    foreach var { combobox_x combobox_y combobox_width combobox_height } delta $postoffset {
        incr $var $delta
    }

    # Compute if the popdown will show below the combobox element or above it.
    set popdown_height [_winfo reqheight $w.popdown]
    if { [expr { $combobox_y+$combobox_height+$popdown_height+4 }] > [_winfo screenheight $w.popdown] } {
        # Above the combobox.
        set popdown_y [expr { $combobox_y-$popdown_height-4 }]
    } else {
        # Below the combobox.
        # This is the normal flow of the popdown window.
        set popdown_y [expr { $combobox_y+$combobox_height+4 }]
    }

    # Set the popdown geometry.
    _wm geometry $w.popdown ${combobox_width}x${popdown_height}+${combobox_x}+${popdown_y}

    #####################################
    ##                                 ##
    ##     POST THE POPDOWN WINDOW     ##
    ##                                 ##
    #####################################

    # Note: Need to set [wm transient] just before mapping the popdown
    #       instead of when it's created, in case a containing frame
    #       has been reparented [#1818441].
    #
    #       On Windows: setting [wm transient] prevents the parent
    #       toplevel from becoming inactive when the popdown is posted
    #       (Tk 8.4.8+)
    #
    #       On X11: WM_TRANSIENT_FOR on override-redirect windows
    #       may be used by compositing managers and by EWMH-aware
    #       window managers (even though the older ICCCM spec says
    #       it's meaningless).
    switch -- [_tk windowingsystem] {
        win32 -
        x11   { _wm transient $w.popdown $::ms::addr($w,toplevel) }
    }

    # Post the popdown window.
    _wm attributes $w.popdown -topmost 1
    _wm deiconify  $w.popdown
    _raise         $w.popdown

    # Focus on the 'popdown' object.
    _focus -force $w.popdown.f.lb

    # Get the widget current fieldbackground color for the focus dynamic state.
    set fieldbackground [_ttk_style lookup $::ms::current($w,style) -fieldbackground [list focus] $::ms::current($w,fieldbackground)]

    # Create/Update the sub-style for the fieldbackground.
    _ttk_style configure Fieldbackground.$::ms::style($w,widget) -fieldbackground $fieldbackground

    # Change momentarily the widget style to the sub-style.
    interp invokehidden {} $w configure -style Fieldbackground.$::ms::style($w,widget)

    ###############################
    ##                           ##
    ##     SET A GLOBAL GRAB     ##
    ##                           ##
    ###############################

    # Setting a global grab on the popdown window.
    _grab set -global $w.popdown

    # Waiting for '::wait_for_user_response'.
    vwait ::wait_for_user_response

    #######################################
    ##                                   ##
    ##     UNPOST THE POPDOWN WINDOW     ##
    ##                                   ##
    #######################################

    # Change the widget style back to its original style.
    interp invokehidden {} $w configure -style $::ms::style($w,widget)

    # Unpost the popdown window.
    ::ms::combobox::Unpost $w

    return ""
}

## Return
#
# Manage the **Return** keypress event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Return { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { set value [interp invokehidden {} $w get] }
        normal {
            # Validate the widget string.
            set value [::ms::combobox::Validate_String $w]

            # Clear the widget field, insert the validated value and put the cursor at the end.
            interp invokehidden {} $w delete 0 end
            interp invokehidden {} $w set $value
            interp invokehidden {} $w icursor end
        }
    }

    # Remove the widget selection, if any.
    interp invokehidden {} $w selection clear

    # If 'value' is different than the previous registered one, register it
    # and launch the external procedure provided, if any.
    if { $value ne $::ms::data($w,current_value) } {
        set ::ms::data($w,current_index) [lsearch -exact $::ms::data($w,values) $value]
        set ::ms::data($w,current_value) $value

        ::ms::Execute_Widget_Cmd $w
    }

    return ""
}

## Unpost
#
# Unpost the popdown window.
#
# Where:
#
# w   Should be the combobox real address involved.
#
# It doesn't return anything.
proc ::ms::combobox::Unpost { w } {
    # Release the grab.
    _grab release $w.popdown

    # Withdraw and destroy the popdown window.
    _wm withdraw $w.popdown
    _destroy $w.popdown

    # Run the posthook callback, if any.
    switch -- $::ms::current($w,posthook) {
        ""      {}
        default {
            try {
                uplevel #0 [list $::ms::current($w,posthook) $w]
            } on error { errortext errorcode } {
                ::ms::Error "Invalid posthook command for '$w'." ""
            }
        }
    }

    # Change the widget dynamic state to '!pressed'.
    ::ms::combobox::Pathname_Cmd $w state !pressed

    # Unset the toplevel temporary variables.
    unset -nocomplain -- ::ms::temp(toplevel,height) \
                         ::ms::temp(toplevel,width) \
                         ::ms::temp(toplevel,X,nw) \
                         ::ms::temp(toplevel,X,se) \
                         ::ms::temp(toplevel,Y,nw) \
                         ::ms::temp(toplevel,Y,se);

    # Focus on the combobox.
    _focus -force $w

    # Check the current combobox index.
    set current_index [interp invokehidden {} $w current]
    switch -- $current_index {
        ""      {}
        default {
            if { $current_index ne $::ms::data($w,current_index) } {
                set ::ms::data($w,current_index) $current_index
                set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $current_index]

                # Execute the external procedure provided, if any.
                switch -- $::ms::current($w,command) {
                    ""      {}
                    default {
                        try {
                            uplevel #0 [list $::ms::current($w,command) $w $::ms::data($w,current_value)]
                        } on error { errortext errorcode } {
                            ::ms::Error "$errortext" $caller_info
                        }
                    }
                }
            }
        }
    }

    return ""
}

###################################
##                               ##
##     VALIDATION PROCEDURES     ##
##                               ##
###################################

## Validate_KeyPress
#
# Limit the input keypresses in a combobox widget and set the widget state to 'invalid' or '!invalid'
# depending if there are illegal characters for the datatype specified or if the string is not contained
# inside any of the items provided by the ::ms::current($w,values) variable.
#
# Where:
#
# w        Should be the widget real address involved.
#
# string   Should be the string to check.
#
# It returns a boolean value ['0' or '1'] indicating if the string provided
# reached it's length limit or not.
proc ::ms::combobox::Validate_KeyPress { w string } {
    # Check if the character is allowed to be displayed or not.
    switch -- $::ms::current($w,maxlength) {
        0       {}
        default {
            # Check if the length of 'string' is bigger than the maxlength allowed.
            if { [string length $string] > $::ms::current($w,maxlength) } {
                # The character will not be inserted.
                return 0
            }
        }
    }

    # Remove any leading and trailing spaces from 'string'.
    set value [string trim $string]

    # Check 'value'.
    switch -- $value {
        ""  {
            # Change the widget dynamic state to '!invalid'.
            ::ms::combobox::Pathname_Cmd $w state !invalid

            return 1
        }
        default {
            # Note: Illegal datatype characters cannot be inserted directly through the keyboard,
            #       we made sure of that in the widget bindings section.
            #       Nonetheless, they can be inserted trough a paste or pasteselection event.
            #       If this is the case, we will let the illegal character be inserted but we will
            #       mark the string as invalid.

            # Depending on the widget datatype, check for illegal characters in 'value'.
            switch -- $::ms::current($w,datatype) {
                alnum {
                    # Check every character in 'value'.
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
                                    0   {
                                        # Change the widget dynamic state to 'invalid'.
                                        ::ms::combobox::Pathname_Cmd $w state invalid

                                        return 1
                                    }
                                }
                            }
                        }

                        incr i
                    }
                }
                alpha {
                    # Check every character in 'value'.
                    set i 0
                    while { $i < [string length $value] } {
                        set char [string index $value $i]
                        switch -- $char {
                            " "     {}
                            default {
                                switch -- [string is alpha $char] {
                                    0   {
                                        # Change the widget dynamic state to 'invalid'.
                                        ::ms::combobox::Pathname_Cmd $w state invalid

                                        return 1
                                    }
                                }
                            }
                        }

                        incr i
                    }
                }
                integer {
                    switch -- $value {
                        "-"     {}
                        default {
                            switch -- [string is integer $value] {
                                0   {
                                    # Change the widget dynamic state to 'invalid'.
                                    ::ms::combobox::Pathname_Cmd $w state invalid

                                    return 1
                                }
                            }
                        }
                    }
                }
                posinteger {
                    switch -- [string is integer $value] {
                        0   {
                            # Change the widget dynamic state to 'invalid'.
                            ::ms::combobox::Pathname_Cmd $w state invalid

                            return 1
                        }
                        1   {
                            if { $value < 0 } {
                                # Change the widget dynamic state to 'invalid'.
                                ::ms::combobox::Pathname_Cmd $w state invalid

                                return 1
                            }
                        }
                    }
                }
                posreal {
                    switch -- $value {
                        "."     {}
                        default {
                            switch -- [string is double $value] {
                                0   {
                                    # Change the widget dynamic state to 'invalid'.
                                    ::ms::combobox::Pathname_Cmd $w state invalid

                                    return 1
                                }
                                1   {
                                    if { $value < 0 } {
                                        # Change the widget dynamic state to 'invalid'.
                                        ::ms::combobox::Pathname_Cmd $w state invalid

                                        return 1
                                    }
                                }
                            }
                        }
                    }
                }
                real {
                    switch -- $value {
                        "-"     -
                        "."     {}
                        default {
                            switch -- [string is double $value] {
                                0   {
                                    # Change the widget dynamic state to 'invalid'.
                                    ::ms::combobox::Pathname_Cmd $w state invalid

                                    return 1
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    # Note: If we have arrived to this point, it means that no illegal characters have been found
    #       in the string examined but the string could still be invalid because it may not be contained
    #       inside the items of the list provided for the widget.

    #######################################
    ##                                   ##
    ##     ALPHABETIC INEXACT SEARCH     ##
    ##                                   ##
    #######################################

    # Check the datatype.
    switch -- $::ms::current($w,datatype) {
        integer    -
        posinteger -
        posreal    -
        real       { set values $::ms::data($w,values) }
        default    {
            # Trasform 'string' in lowercase characters for comparison reasons.
            set value [string tolower $value]
            set values $::ms::data($w,values,lowercase)
        }
    }

    # Compare the longest common characters found in 'values' that contains consecutive characters of
    # 'value' with 'value' itself and change the widget dynamic invalid state accordingly.
    set end [expr { [string length $value]-1 }]
    if { [string range [::tcl::prefix longest $values $value] 0 $end] eq $value } {
        ::ms::combobox::Pathname_Cmd $w state !invalid
    } else {
        ::ms::combobox::Pathname_Cmd $w state  invalid
    }

    return 1
}

## Validate_String
#
# Validate the string inside the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# Return the validated string.
proc ::ms::combobox::Validate_String { w } {
    ##############################
    ##                          ##
    ##     VALUE CORRECTION     ##
    ##                          ##
    ##############################

    # Get the widget string and remove any leading/trailing spaces from it.
    set value [string trim [interp invokehidden {} $w get]]

    # Clear 'string' from illegal characters, if any.
    set corrected_value ""
    switch -- $::ms::current($w,datatype) {
        alnum {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    " "     -
                    "."     -
                    ","     -
                    "-"     {}
                    default {
                        # Check if 'char' is an alphanumeric character.
                        switch -- [string is alnum $char] {
                            0   {
                                incr i
                                continue
                            }
                        }
                    }
                }

                # Add char to the 'corrected_value' string.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
        alpha {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    " "     {}
                    default {
                        # Check if 'char' is an alphabetic character.
                        switch -- [string is alnum $char] {
                            0   {
                                incr i
                                continue
                            }
                        }
                    }
                }

                # Add char to the 'corrected_value' string.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
        integer {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "-"     {}
                    default {
                        # Check if 'char' is an integer character.
                        switch -- [string is integer $char] {
                            0   {
                                incr i
                                continue
                            }
                        }
                    }
                }

                # Add char to the 'corrected_value' string.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
        posinteger {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                # Check if 'char' is an integer character.
                set char [string index $value $i]
                switch -- [string is integer $char] {
                    0   {
                        incr i
                        continue
                    }
                }

                # Add char to the 'corrected_value' string.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
        posreal {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "."     {}
                    default {
                        # Check if 'char' is an integer character.
                        switch -- [string is integer $char] {
                            0   {
                                incr i
                                continue
                            }
                        }
                    }
                }

                # Add char to the 'corrected_value' string.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
        real {
            # Check every character in 'value'.
            set i 0
            while { $i < [string length $value] } {
                set char [string index $value $i]
                switch -- $char {
                    "-"     -
                    "."     {}
                    default {
                        # Check if 'char' is an integer character.
                        switch -- [string is integer $char] {
                            0   {
                                incr i
                                continue
                            }
                        }
                    }
                }

                # Add char to the 'corrected_value' string.
                append corrected_value $char

                incr i
            }

            set value $corrected_value
        }
    }

    # Note: At this point, every illegal characters in string (for the datatype specified) have been stripped out.

    ########################
    ##                    ##
    ##     VALIDATION     ##
    ##                    ##
    ########################

    switch -- $value {
        ""      { set index $::ms::data($w,current_index) }
        default {
            switch -- $::ms::current($w,datatype) {
                alnum -
                alpha {
                    #######################################
                    ##                                   ##
                    ##     ALPHABETIC INEXACT SEARCH     ##
                    ##                                   ##
                    #######################################

                    # Trasform 'value' in lowercase characters for comparison reasons.
                    set value [string tolower $value]

                    # Find the closest match to value.
                    set i     0
                    set limit [string length $value]
                    while { $i < $limit } {
                        # Get the longest common characters in the lowercase list.
                        set longest [::tcl::prefix longest $::ms::data($w,values,lowercase) $value]

                        # Check the 'longest' variable.
                        switch -- $longest {
                            ""  {
                                # Remove the last character from value.
                                set value [string range $value 0 end-1]

                                incr i
                            }
                        }

                        break
                    }

                    # Check the resulting 'longest' value after the loop.
                    switch -- $longest {
                        ""      { set index $::ms::data($w,current_index) }
                        default {
                            # Get all the elements from the lowercase list that starts with the 'longest' value and sort it.
                            set prefix_list [lsort -dictionary [::tcl::prefix all $::ms::data($w,values,lowercase) $longest]]

                            # Get the index of the first element of 'prefix_list' relative to '::ms::data($w,values,lowercase)'.
                            set index [lsearch -exact $::ms::data($w,values,lowercase) [lindex $prefix_list 0]]
                            switch -- $index {
                                ""  { set index $::ms::data($w,current_index) }
                            }
                        }
                    }
                }
                integer    -
                posinteger -
                posreal    -
                real       {
                    # Beautify and correct 'value' depending on the datatype specified.
                    set value [::ms::Beautify_Input_Number $value $::ms::current($w,maxlength) $::ms::current($w,datatype)]

                    switch -- [string is double -strict $value] {
                        0   { set index $::ms::data($w,current_index) }
                        1   {
                            # Get the first and last elements of the ordered list.
                            set first [lindex $::ms::data($w,values) 0]
                            set last  [lindex $::ms::data($w,values) end]

                            # Check if 'value' is less than the first element or more of the last element.
                            if { $value <= $first } {
                                set index 0
                            } elseif { $value >= $last } {
                                set index [expr { [llength $::ms::data($w,values)]-1 }]
                            } else {
                                # 'value' is in between the first and last elements (both not included).

                                ######################################
                                ##                                  ##
                                ##     NUMERICAL INEXACT SEARCH     ##
                                ##                                  ##
                                ######################################

                                # Set the previous element as the first one.
                                set previous $first

                                # Find the closest match to 'value'.
                                set i 1
                                while { $i < [llength $::ms::data($w,values)] } {
                                    # Set the 'next' element.
                                    set next [lindex $::ms::data($w,values) $i]

                                    if { $value == $next } {
                                        # Set the index of the next element as the current index.
                                        set index [lsearch -exact $::ms::data($w,values) $next]
                                        break
                                    } elseif { $value < $next } {
                                        # Set the index that contains the closest match to 'value' between 'previous' and 'next' as the current index.
                                        if { [expr { $next-$value }] < [expr { $value-$previous }] } {
                                            set index [lsearch -exact $::ms::data($w,values) $next]
                                        } else {
                                            set index [lsearch -exact $::ms::data($w,values) $previous]
                                        }

                                        break
                                    }

                                    # Update the previous element for the next lap.
                                    set previous $next

                                    incr i
                                }
                            }
                        }
                    }
                }
                none {
                    # Trasform 'value' in lowercase characters for comparison reasons.
                    set value [string tolower $value]
                    if { $value in $::ms::data($w,values,lowercase) } {
                        set index [lsearch -exact $::ms::data($w,values,lowercase) $value]
                    } else {
                        set index $::ms::data($w,current_index)
                    }
                }
            }
        }
    }

    # Set the widget dynamic state to '!invalid'.
    ::ms::combobox::Pathname_Cmd $w state !invalid

    return [lindex $::ms::data($w,values) $index]
}

#####################################
##                                 ##
##     MOUSEWHEEL AND TOUCHPAD     ##
##                                 ##
#####################################

## MouseWheel
#
# If the widget is not in its disabled state and the list provided is not empty, scroll the items
# list without displaying the popdown window, otherwise try to find the innermost widget's scrollable
# parent with an active vertical scrollbar and move that scrollbar by one unit up or down (depending
# on the mousewheel direction). If none of the widget's parent meets the required condition,
# don't do anything.
#
# Where:
#
# w        Should be the widget real address involved.
#
# amount   Should be the delta value of a **MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#          *Amount* is normally delivered by the **MouseWheel** event with a value of
#          **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# It doesn't return anything.
proc ::ms::combobox::MouseWheel { w amount } {
    switch -- $::ms::current($w,state) {
        disabled {
            # Try to find a widget parent to scroll vertically, if any.
            ::ms::Scroll_Parent_Y $w $amount units
        }
        default {
            # Set the focus on the combobox entry.
            _focus -force $w

            # Check the scrollmode.
            switch -- $::ms::scrollmode {
                natural { set amount [expr { -1.0*$amount }] }
            }

            # Change the widget textarea value by scrolling the items list provided up or down
            # (depending on the scroll direction).
            if { $amount > 0 } {
                set index [expr { $::ms::data($w,current_index)-1 }]
            } else {
                set index [expr { $::ms::data($w,current_index)+1 }]
            }

            # Check the scrollstopper ('disabled' or 'enabled').
            switch -- $::ms::scrollstopper {
                disabled {
                    # If index is lesser than zero or bigger than the last available index, cycle trough.
                    if { $index < 0 } {
                        set index $::ms::data($w,last_available_index)
                    } elseif { $index > $::ms::data($w,last_available_index) } {
                        set index 0
                    }
                }
                enabled {
                    # If index is lesser than zero or bigger than the last available index, stop the scrolling.
                    if { $index < 0 } {
                        return ""
                    } elseif { $index > $::ms::data($w,last_available_index) } {
                        return ""
                    }
                }
            }

            # Update the current index and value.
            set ::ms::data($w,current_index) $index
            set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $index]

            # Clear the widget textarea, remove any previous selection and display the new widget value.
            interp invokehidden {} $w delete 0 end
            interp invokehidden {} $w selection clear
            interp invokehidden {} $w set $::ms::data($w,current_value)

            # If the widget is not in readonly state, select the combobox value.
            switch -- $::ms::current($w,state) {
                normal {
                    interp invokehidden {} $w selection range 0 end
                    interp invokehidden {} $w icursor end
                }
            }

            # Note: To avoid executing the associated widget command multiple times, we introduce a timer (50ms) before actually
            #       executing the command. This timer will be resetted if, while active, another mousewheel action on the widget
            #       asks to launch again the command.
            if { [info exists ::ms::temp($w,pending_execute_cmd)] } {
                after cancel $::ms::temp($w,pending_execute_cmd)
                unset -nocomplain -- ::ms::temp($w,pending_execute_cmd)
            }
            set ::ms::temp($w,pending_execute_cmd) [after 50 [list ::ms::Execute_Widget_Cmd $w]]
        }
    }

    return ""
}

## Shift_MouseWheel
#
# If the widget is in its **normal** state and has the focus, move the insert cursor by one character
# to the left or to the right (depending on the mousewheel direction), otherwise try to find the
# innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
# by one unit left or right (again, depending on the mousewheel direction). If none of the widget's
# parent meets the required condition, don't do anything.
#
# Where:
#
# w        Should be the widget real address involved.
#
# amount   Should be the delta value of a **MouseWheel** event.
#          The delta value represents the rotation units the mousewheel has been moved.
#          The sign of the value represents the direction the mousewheel was scrolled.
#          *Amount* is normally delivered by the **MouseWheel** event with a value of
#          **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# It doesn't return anything.
proc ::ms::combobox::Shift_MouseWheel { w amount } {
    switch -- $::ms::current($w,state) {
        normal {
            if { [_focus -displayof $w] eq $w } {
                # Get the current cursor position
                set index [interp invokehidden {} $w index insert]

                # Move the cursor by one character to the left or to the right (depending
                # on the mousewheel direction).
                if { $amount > 0 } {
                    interp invokehidden {} $w icursor $index+1
                } else {
                    interp invokehidden {} $w icursor $index-1
                }

                # Make the index character visible.
                ::ttk::entry::See $w $index

                return ""
            }
        }
    }

    # Try to find a widget parent to scroll horizontally, if any.
    ::ms::Scroll_Parent_X $w $amount units

    return ""
}

## Scrollbar_MouseWheel
#
# Scroll the listbox vertically by units (**MouseWheel**) or by pages (**Control-MouseWheel**).
#
# Where:
#
# w        Should be the widget real address involved.
#
# amount   Should be the delta value of a **MouseWheel**/**Control-MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#          *Amount* is normally delivered by the **MouseWheel**/**Control-MouseWheel**
#          event with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::combobox::Scrollbar_MouseWheel { w amount what } {
    # Check that 'amount' is an integer or a float.
    switch -- [string is double -strict $amount] {
        0   { set amount 120.0 }
        1   {
            if { $amount == 0 } {
                set amount 120
            } else {
                set amount [expr { $amount*1.0 }]
            }
        }
    }

    # Check the scrollmode.
    switch -- $::ms::scrollmode {
        natural { set amount [expr { -1.0*$amount }] }
    }

    # If possible, scroll the listbox vertically.
    try {
        $w.popdown.f.lb yview scroll [expr { -$amount*0.008333333333333333 }] $what
    } on error {} {
        # The popdown listbox cannot scroll vertically.
    }

    return ""
}

## Scrollbar_Touchpad
#
# Scroll the listbox vertically by units (**TouchpadScroll**) or by pages (**Control-TouchpadScroll**).
#
# Where:
#
# w         Should be the scrollable widget real address involved.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# amount    Should be the delta value of a **TouchpadScroll**/**Control-TouchpadScroll** event.
#           The delta value represents the rotation units the mouse wheel has been moved.
#           The sign of the value represents the direction the mouse wheel was scrolled.
#           *Amount* is normally delivered by the **TouchpadScroll**/**Control-TouchpadScroll**
#           event with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#           If the value provided as *amount* is not an integer or a float,
#           defaults to **+120.0**.
#
#           Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what      Should be a string that specifies the unit type.
#           Allowed values are the word **units** or **pages**.
#
#           If not provided, defaults to **units**.
#
# It doesn't return anything.
proc ::ms::combobox::Scrollbar_Touchpad { w counter amount { what units } } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # **TouchpadScroll** events can be generated about 60 times per second
    # during a two-finger gesture.
    # This allow the binding script to respond to every 5th **TouchpadScroll** event
    # by testing is the 'counter' is divisible by 5.
    if { [expr { $counter%5 }] != 0 } {
        return ""
    }

    # Translate 'amount' in 'delta_x' and 'delta_y'.
    lassign [::tk::PreciseScrollDeltas $amount] delta_x delta_y

    # Adjust 'delta_y' value, or the movement will be too slow.
    # 'delta_x' will be ignored.
    set delta_y [expr { $delta_y*30 }]

    # If there is a movement along the Y axis, launch '::ms::combobox::Popdown_Scrollbar_MouseWheel'.
    if { $delta_y != 0 } {
        ::ms::combobox::Popdown_Scrollbar_MouseWheel $w $delta_y $what
    }
}

## Touchpad
#
# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
#
#   1 - If the listbox can scroll horizontally, scroll it by units (**TouchpadScroll**) or by pages
#       (**Control-TouchpadScroll**), otherwise don't do any movement on the horizontal axis.
#
#   2 - If the listbox can scroll vertically, scroll it by units (**TouchpadScroll**) or by pages
#       (**Control-TouchpadScroll**), otherwise don't do any movement on the vertical axis.
#
# Where:
#
# w         Should be the scrollable widget real address involved.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# amount    Should be the delta value of a **TouchpadScroll**/**Control-TouchpadScroll** event.
#           The delta value represents the rotation units the mouse wheel has been moved.
#           The sign of the value represents the direction the mouse wheel was scrolled.
#           *Amount* is normally delivered by the **TouchpadScroll**/**Control-TouchpadScroll**
#           event with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#           If the value provided as *amount* is not an integer or a float,
#           defaults to **+120.0**.
#
#           Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what      Should be a string that specifies the unit type.
#           Allowed values are the word **units** or **pages**.
#           *Units* are used by the **TouchpadScroll** event while *pages* are used
#           by the **Control-TouchpadScroll** event.
#
#           If not provided, defaults to **units**.
#
# It doesn't return anything.
proc ::ms::combobox::Touchpad { w counter amount } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # **TouchpadScroll** events can be generated about 60 times per second
    # during a two-finger gesture.
    # This allow the binding script to respond to every 5th **TouchpadScroll** event
    # by testing is the 'counter' is divisible by 5.
    if { [expr { $counter%5 }] != 0 } {
        return ""
    }

    # Translate 'amount' in 'delta_x' and 'delta_y'.
    lassign [::tk::PreciseScrollDeltas $amount] delta_x delta_y

    # Adjust 'delta_x' and 'delta_y' values, or the movement will be too slow.
    set delta_x [expr { $delta_x*30 }]
    set delta_y [expr { $delta_y*30 }]

    # If there is a movement along the X axis, launch '::ms::combobox::MouseWheel'.
    if { $delta_x != 0 } {
        ::ms::combobox::MouseWheel $w $delta_x
    }

    # If there is a movement along the Y axis, launch '::ms::combobox::Shift_MouseWheel'.
    if { $delta_y != 0 } {
        ::ms::combobox::Shift_MouseWheel $w $delta_y
    }

    return ""
}

#############################################
##                                         ##
##     POPDOWN MOUSEWHEEL AND TOUCHPAD     ##
##                                         ##
#############################################

## Popdown_MouseWheel
#
# If the listbox can scroll vertically, scroll it by units (**MouseWheel**) or by pages
# (**Control-MouseWheel**), otherwise don't do anything.
#
# Where:
#
# w        Should be the widget real address involved.
#
# x, y     Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#          These values should be provided by the **MouseWheel**/**Control-MouseWheel** event.
#
# amount   Should be the delta value of a **MouseWheel**/**Control-MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#          *Amount* is normally delivered by the **MouseWheel**/**Control-MouseWheel** event
#          with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#          *Units* are used by the **MouseWheel** event while *pages* are used
#          by the **Control-MouseWheel** event.
#
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_MouseWheel { w x y amount { what units } } {
    # Check that 'amount' is an integer or a float.
    switch -- [string is double -strict $amount] {
        0   { set amount 120.0 }
        1   {
            if { $amount == 0 } {
                set amount 120
            } else {
                set amount [expr { $amount*1.0 }]
            }
        }
    }

    # Check the scrollmode.
    switch -- $::ms::scrollmode {
        natural { set amount [expr { -1.0*$amount }] }
    }

    # If possible, scroll the listbox vertically.
    try {
        $w.popdown.f.lb yview scroll [expr { -$amount*0.008333333333333333 }] $what
    } on error {} {
        # The popdown listbox cannot scroll vertically.
    }

    # Get the index of the current hovered row.
    set index [$w.popdown.f.lb index @$x,$y]

    # Select and activate the new index.
    $w.popdown.f.lb activate  $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    return -code break
}

## Popdown_Shift_MouseWheel
#
# If the listbox can scroll horizontally, scroll it by units (**Shift-MouseWheel**) or by pages
# (**Control-Shift-MouseWheel**), otherwise don't do anything.
#
# Where:
#
# w        Should be the widget real address involved.
#
# x, y     Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#          These values should be provided by the **Shift-MouseWheel**/**Control-Shift-MouseWheel**
#          event.
#
# amount   Should be the delta value of a **Shift-MouseWheel**/**Control-Shift-MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#          *Amount* is normally delivered by the **Shift-MouseWheel**/**Control-Shift-MouseWheel**
#          event with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_Shift_MouseWheel { w x y amount { what units } } {
    # Check that 'amount' is an integer or a float.
    switch -- [string is double -strict $amount] {
        0   { set amount 120.0 }
        1   {
            if { $amount == 0 } {
                set amount 120
            } else {
                set amount [expr { $amount*1.0 }]
            }
        }
    }

    # Check the scrollmode.
    switch -- $::ms::scrollmode {
        natural { set amount [expr { -1.0*$amount }] }
    }

    # If possible, scroll the listbox horizontally.
    try {
        $w.popdown.f.lb xview scroll [expr { -$amount*0.008333333333333333 }] $what
    } on error {} {
        # The popdown listbox cannot scroll horizontally.
    }

    # Get the index of the current hovered row.
    set index [$w.popdown.f.lb index @$x,$y]

    # Select and activate the new index.
    $w.popdown.f.lb activate $index
    $w.popdown.f.lb selection clear 0 end
    $w.popdown.f.lb selection set $index

    return -code break
}

## Popdown_Touchpad
#
# Manage the **TouchpadScroll** and **Control-TouchpadScroll** events on the popdown window.
#
# Where:
#
# w         Should be the scrollable widget real address involved.
#
# x, y      Should be the (x,y) mouse pointer relative coordinates at the time of the event.
#           These values should be provided by the **TouchpadScroll**/**Control-TouchpadScroll**
#           event.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# amount    Should be the delta value of a **TouchpadScroll**/**Control-TouchpadScroll** event.
#           The delta value represents the rotation units the mouse wheel has been moved.
#           The sign of the value represents the direction the mouse wheel was scrolled.
#           *Amount* is normally delivered by the **TouchpadScroll**/**Control-TouchpadScroll**
#           event with a value of **+120.0** or **-120.0**, depending on the scroll direction.
#
#           If the value provided as *amount* is not an integer or a float,
#           defaults to **+120.0**.
#
#           Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what      Should be a string that specifies the unit type.
#           Allowed values are the word **units** or **pages**.
#           *Units* are used by the **TouchpadScroll** event while *pages* are used
#           by the **Control-TouchpadScroll** event.
#
#           If not provided, defaults to **units**.
#
# It doesn't return anything.
proc ::ms::combobox::Popdown_Touchpad { w x y counter amount { what units } } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # **TouchpadScroll** events can be generated about 60 times per second
    # during a two-finger gesture.
    # This allow the binding script to respond to every 5th **TouchpadScroll** event
    # by testing is the 'counter' is divisible by 5.
    if { [expr { $counter%5 }] != 0 } {
        return ""
    }

    # Translate 'amount' in 'delta_x' and 'delta_y'.
    lassign [::tk::PreciseScrollDeltas $amount] delta_x delta_y

    # Adjust 'delta_x' and 'delta_y' values, or the movement will be too slow.
    set delta_x [expr { $delta_x*30 }]
    set delta_y [expr { $delta_y*30 }]

    # If there is a movement along the X axis, launch '::ms::combobox::Popdown_Shift_MouseWheel'.
    if { $delta_x != 0 } {
        ::ms::combobox::Popdown_Shift_MouseWheel $w $x $y $delta_x $what
    }

    # If there is a movement along the Y axis, launch '::ms::combobox::Popdown_MouseWheel'.
    if { $delta_y != 0 } {
        ::ms::combobox::Popdown_MouseWheel $w $x $y $delta_y $what
    }

    return ""
}

#*EOF*