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
package provide ::ms::spinbox 0.1

###############################
##                           ##
##     _SPINBOX BINDINGS     ##
##                           ##
###############################

# Activate/Deactivate
_bind _Spinbox <Activate>   { ::ms::spinbox::Pathname_Cmd %W state !background; break }
_bind _Spinbox <Deactivate> { ::ms::spinbox::Pathname_Cmd %W state  background; break }

# Allowing some modifiers combination.
switch -- [_tk windowingsystem] {
    aqua {
        _bind _Spinbox <Option-KeyPress>         { # Enable binding }
        _bind _Spinbox <Option-Shift-KeyPress>   { # Enable binding }
        _bind _Spinbox <Control-KeyPress>        { # Enable binding }
        _bind _Spinbox <Control-Option-KeyPress> { # Enable binding }
        _bind _Spinbox <Control-Shift-KeyPress>  { # Enable binding }
        _bind _Spinbox <Command-KeyPress>        { # Enable binding }
        _bind _Spinbox <Command-Shift-KeyPress>  { # Enable binding }
    }
    default {
        _bind _Spinbox <Alt-KeyPress>           { # Enable binding }
        _bind _Spinbox <Alt-Shift-KeyPress>     { # Enable binding }
        _bind _Spinbox <Control-KeyPress>       { # Enable binding }
        _bind _Spinbox <Control-Alt-KeyPress>   { # Enable binding }
        _bind _Spinbox <Control-Shift-KeyPress> { # Enable binding }
        _bind _Spinbox <Meta-KeyPress>          { # Enable binding }
        _bind _Spinbox <Meta-Shift-KeyPress>    { # Enable binding }
    }
}

# Backspace/Delete keys
_bind _Spinbox <KeyPress-BackSpace> { # Enable binding }
_bind _Spinbox <KeyPress-Delete>    { # Enable binding }
_bind _Spinbox <KeyPress-KP_Delete> { ::ttk::entry::Delete %W; break }

# Buttonpress
_bind _Spinbox <ButtonPress-1>        { ::ms::spinbox::ButtonPress %W %x %y "";  break }
_bind _Spinbox <Shift-ButtonPress-1>  { ::ms::spinbox::ButtonPress %W %x %y "s"; break }
_bind _Spinbox <Double-ButtonPress-1> { ::ms::spinbox::ButtonPress %W %x %y "2"; break }
_bind _Spinbox <Triple-ButtonPress-1> { ::ms::spinbox::ButtonPress %W %x %y "3"; break }
_bind _Spinbox <ButtonRelease-1>      { ::ttk::CancelRepeat; break }
_bind _Spinbox <B1-Motion>            { ::ms::Drag %W %x %y; break }

_bind _Spinbox <Button-2>         { ::ms::Scan_Or_Paste %W %x "Button-2"; break }
_bind _Spinbox <B2-Motion>        { ::ms::Scan_Or_Paste %W %x "B2-Motion"; break }
_bind _Spinbox <ButtonRelease-2>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-2"; break }

_bind _Spinbox <Button-3>         { ::ms::Scan_Or_Paste %W %x "Button-3"; break }
_bind _Spinbox <B3-Motion>        { ::ms::Scan_Or_Paste %W %x "B3-Motion"; break }
_bind _Spinbox <ButtonRelease-3>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-3"; break }

# Contextual menu
_bind _Spinbox <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Clear/Copy/Cut/Paste
_bind _Spinbox <<Clear>> { ::ms::Clear %W; break }
_bind _Spinbox <<Copy>>  { ::ms::Copy  %W; break }
_bind _Spinbox <<Cut>>   { ::ms::Cut   %W; break }
_bind _Spinbox <<Paste>> { ::ms::Paste %W CLIPBOARD; break }

# Cursor management.
_bind _Spinbox <Motion> { ::ms::Set_Cursor %W %x %y; break }

# Destroy
_bind _Spinbox <Destroy> { ::ms::spinbox::Destroy %W; break }

# Enter/Leave
_bind _Spinbox <Enter> { ::ms::spinbox::Pathname_Cmd %W state  hover; break }
_bind _Spinbox <Leave> { ::ms::spinbox::Pathname_Cmd %W state !hover; break }

# Escape key
_bind _Spinbox <KeyPress-Escape> { ::ms::Escape %W; break }

# F keys
_bind _Spinbox <Fn-KeyPress> { # Enable binding }

# FocusIn/FocusOut
_bind _Spinbox <FocusIn>  { ::ms::spinbox::FocusIn  %W; break }
_bind _Spinbox <FocusOut> { ::ms::spinbox::FocusOut %W; break }

# Increment/Decrement keys.
_bind _Spinbox <<NextLine>> { ::ms::spinbox::Arrows %W incr 1x; break }
_bind _Spinbox <<PrevLine>> { ::ms::spinbox::Arrows %W decr 1x; break }

_bind _Spinbox <<NextPara>> { ::ms::spinbox::Arrows %W incr 2x; break }
_bind _Spinbox <<PrevPara>> { ::ms::spinbox::Arrows %W decr 2x; break }

_bind _Spinbox <<LineTop>>    { ::ms::spinbox::Home_End %W end; break }
_bind _Spinbox <<LineBottom>> { ::ms::spinbox::Home_End %W home; break }

# Insert cursor movements.
_bind _Spinbox <<LineEnd>>   { ::ttk::entry::Move %W end; break }
_bind _Spinbox <<LineStart>> { ::ttk::entry::Move %W home; break }
_bind _Spinbox <<NextChar>>  { ::ttk::entry::Move %W nextchar; break }
_bind _Spinbox <<NextWord>>  { ::ttk::entry::Move %W nextword; break }
_bind _Spinbox <<PrevChar>>  { ::ttk::entry::Move %W prevchar; break }
_bind _Spinbox <<PrevWord>>  { ::ttk::entry::Move %W prevword; break }

_bind _Spinbox <<SelectLineEnd>>   { ::ttk::entry::Extend %W end; break }
_bind _Spinbox <<SelectLineStart>> { ::ttk::entry::Extend %W home; break }
_bind _Spinbox <<SelectNextChar>>  { ::ttk::entry::Extend %W nextchar; break }
_bind _Spinbox <<SelectNextWord>>  { ::ttk::entry::Extend %W selectnextword; break }
_bind _Spinbox <<SelectPrevChar>>  { ::ttk::entry::Extend %W prevchar; break }
_bind _Spinbox <<SelectPrevWord>>  { ::ttk::entry::Extend %W prevword; break }

_bind _Spinbox <<SelectAll>>  { %W selection range 0 end; break }
_bind _Spinbox <<SelectNone>> { %W selection clear; break }

# Enabling only some keys depending on the datatype specified for the widget.
_bind _Spinbox <KeyPress> { ::ms::spinbox::KeyPress %W %A; break }

# Return
_bind _Spinbox <KeyPress-Return>   { ::ms::spinbox::Return %W; break }
_bind _Spinbox <KeyPress-KP_Enter> { ::ms::spinbox::Return %W; break }

# Tab/Shift-Tab keys
_bind _Spinbox <KeyPress-Tab> { # Enable binding }
switch -- [_tk windowingsystem] {
    x11 {
        _bind _Spinbox <KeyPress-ISO_Left_Tab> { # Enable binding }

        # This seems to be correct on *some* HP systems.
        catch { _bind _Spinbox <KeyPress-hpBackTab> { # Enable binding } }
    }
    aqua  { _bind _Spinbox <KeyPress-ISO_Left_Tab> { # Enable binding } }
    win32 { _bind _Spinbox <Shift-KeyPress-Tab>    { # Enable binding } }
}

# Enabling window traversal navigation.
_bind _Spinbox <<PageLeft>>  { # Enable binding }
_bind _Spinbox <<PageRight>> { # Enable binding }
_bind _Spinbox <<PageUp>>    { # Enable binding }
_bind _Spinbox <<PageDown>>  { # Enable binding }

# Mousewheel and Touchpad

# If the widget is in its **normal** or **readonly** state and the items list is not empty, scroll the items
# list without displaying the popdown window, otherwise try to find the innermost widget's scrollable parent
# with an active vertical scrollbar and move that scrollbar by one unit up or down (depending on the
# mousewheel direction). If none of the widget's parents meets the required condition, nothing will happen.
_bind _Spinbox <MouseWheel> { ::ms::spinbox::MouseWheel %W %D; break }

# If the widget is in its **normal** state and has the focus, move the insert cursor by one character
# towards the left or the right (depending on the direction of the mousewheel event), otherwise try to
# find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
# by one unit left or right (again, depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, nothing will happen.
_bind _Spinbox <Shift-MouseWheel> { ::ms::spinbox::Shift_MouseWheel %W %D; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Spinbox <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Spinbox <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - View the **Shift-MouseWheel** event.
#   2 - View the **MouseWheel** event.
_bind _Spinbox <TouchpadScroll> { ::ms::spinbox::Touchpad %W %# %D; break }

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
_bind _Spinbox <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **spinbox** package.
namespace eval ::ms::spinbox {
    # Set the 'non styleable' spinbox option list.
    set ::ms::spinbox(non_styleable,options) [list class \
                                                   cmenu \
                                                   command \
                                                   datatype \
                                                   decimals \
                                                   exportselection \
                                                   from \
                                                   increment \
                                                   invalidcommand \
                                                   maxlength \
                                                   placeholder \
                                                   state \
                                                   style \
                                                   takefocus \
                                                   textvariable \
                                                   to \
                                                   validate \
                                                   validatecommand \
                                                   values \
                                                   xscrollcommand];

    # Set the 'styleable' spinbox option list.
    set ::ms::spinbox(styleable,options) [list arrowcolor \
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
                                               selectbackground \
                                               selectborderwidth \
                                               selectforeground];

    # Set the default 'non-styleable' spinbox options values.
    set ::ms::default(spinbox,class)           TSpinbox
    set ::ms::default(spinbox,cmenu)           {}
    set ::ms::default(spinbox,command)         {}
    set ::ms::default(spinbox,datatype)        none
    set ::ms::default(spinbox,decimals)        1
    set ::ms::default(spinbox,exportselection) 1
    set ::ms::default(spinbox,from)            0
    set ::ms::default(spinbox,increment)       1
    set ::ms::default(spinbox,invalidcommand)  {}
    set ::ms::default(spinbox,maxlength)       0
    set ::ms::default(spinbox,placeholder)     {}
    set ::ms::default(spinbox,state)           normal
    set ::ms::default(spinbox,style)           TSpinbox
    set ::ms::default(spinbox,takefocus)       1
    set ::ms::default(spinbox,textvariable)    {}
    set ::ms::default(spinbox,to)              0
    set ::ms::default(spinbox,validate)        none
    set ::ms::default(spinbox,validatecommand) {}
    set ::ms::default(spinbox,values)          {}
    set ::ms::default(spinbox,xscrollcommand)  {}

    # Note: The default 'styleable' spinbox options values are always defined inside the current theme.
}

# Rename the original Tk **ttk::spinbox** command.
rename ttk::spinbox _ttk_spinbox

# Create aliases for the mustang **spinbox** command.
interp alias {} spinbox      {} ::ms::spinbox::Command
interp alias {} ttk::spinbox {} ::ms::spinbox::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **spinbox** and **ttk::spinbox** widgets commands.
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
proc ::ms::spinbox::Command { window { args "" } } {
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
            set ::ms::default($w,class)           $::ms::default(spinbox,class)
            set ::ms::default($w,cmenu)           $::ms::default(spinbox,cmenu)
            set ::ms::default($w,command)         $::ms::default(spinbox,command)
            set ::ms::default($w,datatype)        $::ms::default(spinbox,datatype)
            set ::ms::default($w,decimals)        $::ms::default(spinbox,decimals)
            set ::ms::default($w,exportselection) $::ms::default(spinbox,exportselection)
            set ::ms::default($w,from)            $::ms::default(spinbox,from)
            set ::ms::default($w,increment)       $::ms::default(spinbox,increment)
            set ::ms::default($w,invalidcommand)  $::ms::default(spinbox,invalidcommand)
            set ::ms::default($w,maxlength)       $::ms::default(spinbox,maxlength)
            set ::ms::default($w,placeholder)     $::ms::default(spinbox,placeholder)
            set ::ms::default($w,state)           $::ms::default(spinbox,state)
            set ::ms::default($w,style)           $::ms::default(spinbox,style)
            set ::ms::default($w,takefocus)       $::ms::default(spinbox,takefocus)
            set ::ms::default($w,textvariable)    $::ms::default(spinbox,textvariable)
            set ::ms::default($w,to)              $::ms::default(spinbox,to)
            set ::ms::default($w,validate)        $::ms::default(spinbox,validate)
            set ::ms::default($w,validatecommand) $::ms::default(spinbox,validatecommand)
            set ::ms::default($w,values)          $::ms::default(spinbox,values)
            set ::ms::default($w,xscrollcommand)  $::ms::default(spinbox,xscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)           $::ms::default(spinbox,class)
            set ::ms::current($w,cmenu)           $::ms::default(spinbox,cmenu)
            set ::ms::current($w,command)         $::ms::default(spinbox,command)
            set ::ms::current($w,datatype)        $::ms::default(spinbox,datatype)
            set ::ms::current($w,decimals)        $::ms::default(spinbox,decimals)
            set ::ms::current($w,exportselection) $::ms::default(spinbox,exportselection)
            set ::ms::current($w,from)            $::ms::default(spinbox,from)
            set ::ms::current($w,increment)       $::ms::default(spinbox,increment)
            set ::ms::current($w,invalidcommand)  $::ms::default(spinbox,invalidcommand)
            set ::ms::current($w,maxlength)       $::ms::default(spinbox,maxlength)
            set ::ms::current($w,placeholder)     $::ms::default(spinbox,placeholder)
            set ::ms::current($w,state)           $::ms::default(spinbox,state)
            set ::ms::current($w,style)           $::ms::default(spinbox,style)
            set ::ms::current($w,takefocus)       $::ms::default(spinbox,takefocus)
            set ::ms::current($w,textvariable)    $::ms::default(spinbox,textvariable)
            set ::ms::current($w,to)              $::ms::default(spinbox,to)
            set ::ms::current($w,validate)        $::ms::default(spinbox,validate)
            set ::ms::current($w,validatecommand) $::ms::default(spinbox,validatecommand)
            set ::ms::current($w,values)          $::ms::default(spinbox,values)
            set ::ms::current($w,xscrollcommand)  $::ms::default(spinbox,xscrollcommand)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) spinbox
            set ::ms::data($w,format)    "%.1f"

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
            #       To make a spinbox styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **spinbox** *window* **-background** red
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
                    -decimals {
                        switch -- [string is integer -strict $value] {
                            set ::ms::current($w,decimals) $value
                            set ::ms::data($w,format) "%.${value}f"
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
                    -from {
                        switch -- [string is double -strict $value] {
                            1   { set ::ms::current($w,from) $value }
                        }
                    }
                    -increment {
                        switch -- [string is double -strict $value] {
                            if { $value > 0 } {
                                set ::ms::current($w,increment) $value
                            }
                        }
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
                            # If not, create one by mirroring the current theme 'TSpinbox' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TSpinbox]
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
                                          write    [list ::ms::spinbox::Check_TextVariable $w]
                            }
                        }
                    }
                    -to {
                        switch -- [string is double -strict $value] {
                            1   { set ::ms::current($w,to) $value }
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
            foreach option $::ms::spinbox(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TSpinbox,$option)

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
                readonly {
                    # Check the windowing system.
                    switch -- [_tk windowingsystem] {
                        aqua    { set cursor hand1 }
                        default { set cursor arrow }
                    }
                    set takefocus $::ms::current($w,takefocus)
                }
                normal {
                    set cursor    $::ms::current($w,cursor)
                    set takefocus $::ms::current($w,takefocus)
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
                    set ::ms::current($w,validatecommand) [list ::ms::spinbox::Validate_KeyPress %W %P]

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
                            # Set the spinbox type to 'list'.
                            set ::ms::data($w,type) list

                            # Create a fictional list of alphanumeric values.
                            set number 1
                            while { $number < 51 } {
                                lappend ::ms::current($w,values) [string cat "Item-" $number]
                                incr number
                            }

                            # Register the sorted values
                            set ::ms::data($w,values) $::ms::current($w,values)

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::current($w,values)]

                            # Set the current value as the value corresponding to the first item in '::ms::data($w,values)'.
                            set ::ms::data($w,current_value) [lindex $::ms::data($w,values) 0]

                            # Ignore any 'decimals', from', 'increment' and 'to' values eventually provided.
                            set ::ms::current($w,decimals)  1
                            set ::ms::current($w,from)      0
                            set ::ms::current($w,increment) 1
                            set ::ms::current($w,to)        0

                            set ::ms::data($w,format) "%.1f"
                        }
                        integer {
                            # Set the spinbox type to 'incremental'.
                            set ::ms::data($w,type) incremental

                            # Set the list of values to the empty string.
                            set ::ms::data($w,values) [list ]

                            # Ignore any 'decimals' value provided.
                            set ::ms::current($w,decimals) 1
                            set ::ms::data($w,format)      "%.1f"

                            # Check the 'from' value.
                            switch -- $::ms::current($w,from) {
                                ""      { set ::ms::current($w,from) -9 }
                                default { set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }] }
                            }

                            # Check the 'to' value.
                            switch -- $::ms::current($w,to) {
                                ""      { set ::ms::current($w,to) 9 }
                                default { set ::ms::current($w,to) [expr { int($::ms::current($w,to)) }] }
                            }

                            # Check the 'increment' value.
                            switch -- $::ms::current($w,increment) {
                                ""      { set ::ms::current($w,increment) 1 }
                                default { set ::ms::current($w,increment) [expr { int($::ms::current($w,increment)) }] }
                            }

                            # Safeguard.
                            # Make sure that the 'from' value is not greater than the 'to' value.
                            if { $::ms::current($w,from) > $::ms::current($w,to) } {
                                # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                set ::ms::current($w,from) -9
                                set ::ms::current($w,to)    9
                            }

                            # Override any 'maxlength' provided.
                            set maxlength_from [string length $::ms::current($w,from)]
                            set maxlength_to   [string length $::ms::current($w,to)]
                            if { $maxlength_from > $maxlength_to } {
                                set ::ms::current($w,maxlength) $maxlength_from
                            } else {
                                set ::ms::current($w,maxlength) $maxlength_to
                            }

                            # Set the current value with the from value.
                            set ::ms::data($w,current_value) $::ms::current($w,from)
                        }
                        posinteger {
                            # Set the spinbox type to 'incremental'.
                            set ::ms::data($w,type) incremental

                            # Set the list of values to the empty string.
                            set ::ms::data($w,values) [list ]

                            # Ignore any 'decimals' value provided.
                            set ::ms::current($w,decimals) 1
                            set ::ms::data($w,format)      "%.1f"

                            # Check the 'from' value.
                            switch -- $::ms::current($w,from) {
                                ""      { set ::ms::current($w,from) 0 }
                                default { set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }] }
                            }

                            # Check the 'to' value.
                            switch -- $::ms::current($w,to) {
                                ""      { set ::ms::current($w,to) 9 }
                                default { set ::ms::current($w,to) [expr { int($::ms::current($w,to)) }] }
                            }

                            # Check the 'increment' value.
                            switch -- $::ms::current($w,increment) {
                                ""      { set ::ms::current($w,increment) 1 }
                                default { set ::ms::current($w,increment) [expr { int($::ms::current($w,increment)) }] }
                            }

                            # Safeguard.
                            # Make sure that the 'from' and 'to' value are both greater or equal to zero.
                            if { ($::ms::current($w,from) < 0) || ($::ms::current($w,to) < 0) } {
                                # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                set ::ms::current($w,from) 0
                                set ::ms::current($w,to)   9
                            }

                            # Safeguard.
                            # Make sure that the 'from' value is not greater than the 'to' value.
                            if { $::ms::current($w,from) > $::ms::current($w,to) } {
                                # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                set ::ms::current($w,from) 0
                                set ::ms::current($w,to)   9
                            }

                            # Override any 'maxlength' provided.
                            set ::ms::current($w,maxlength) [string length $::ms::current($w,to)]

                            # Set the current value with the from value.
                            set ::ms::data($w,current_value) $::ms::current($w,from)
                        }
                        posreal {
                            # Set the spinbox type to 'incremental'.
                            set ::ms::data($w,type) incremental

                            # Set the list of values to the empty string.
                            set ::ms::data($w,values) [list ]

                            # Check the 'from' value.
                            switch -- $::ms::current($w,from) {
                                ""      { set ::ms::current($w,from) 0 }
                                default {
                                    if { $::ms::current($w,from) != 0 } {
                                        set ::ms::current($w,from) [format $::ms::data($w,format) $::ms::current($w,from)]
                                    } else {
                                        set ::ms::current($w,from) 0
                                    }
                                }
                            }

                            # Check the 'to' value.
                            switch -- $::ms::current($w,to) {
                                ""      { set ::ms::current($w,to) 9.9 }
                                default {
                                    if { $::ms::current($w,to) != 0 } {
                                        set ::ms::current($w,to) [format $::ms::data($w,format) $::ms::current($w,to)]
                                    } else {
                                        set ::ms::current($w,to) 0
                                    }
                                }
                            }

                            # Safeguard.
                            # Make sure that the 'increment' value is a double.
                            set ::ms::current($w,increment) [expr { double($::ms::current($w,increment)) }]

                            # Safeguard.
                            # Make sure that the 'from' and 'to' value are both greater or equal to zero.
                            if { ($::ms::current($w,from) < 0) || ($::ms::current($w,to) < 0) } {
                                # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                set ::ms::current($w,from) 0
                                set ::ms::current($w,to)   9.9
                            }

                            # Make sure that the 'from' value is not greater than the 'to' value.
                            if { $::ms::current($w,from) > $::ms::current($w,to) } {
                                # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                set ::ms::current($w,from) 0
                                set ::ms::current($w,to)   9.9
                            }

                            # Override any 'maxlength' provided.
                            set ::ms::current($w,maxlength) [string length $::ms::current($w,to)]

                            # Set the current value with the 'from' value.
                            set ::ms::data($w,current_value) $::ms::current($w,from)
                        }
                        real {
                            # Set the spinbox type to 'incremental'.
                            set ::ms::data($w,type) incremental

                            # Set the list of values to the empty string.
                            set ::ms::data($w,values) [list ]

                            # Safeguard.
                            # Make sure that the 'from' and 'to' values respects the 'decimals' provided, if any.
                            if { $::ms::current($w,from) != 0 } {
                                set ::ms::current($w,from) [format $::ms::data($w,format) $::ms::current($w,from)]
                            } else {
                                set ::ms::current($w,from) 0
                            }

                            if { $::ms::current($w,to) != 0 } {
                                set ::ms::current($w,to) [format $::ms::data($w,format) $::ms::current($w,to)]
                            } else {
                                set ::ms::current($w,to) 0
                            }

                            # Safeguard.
                            # Make sure that the 'increment' value is a double.
                            set ::ms::current($w,increment) [expr { double($::ms::current($w,increment)) }]

                            # Safeguard.
                            # Make sure that the 'from' value is not greater than the 'to' value.
                            if { $::ms::current($w,from) > $::ms::current($w,to) } {
                                # Override the 'from' and 'to' values provided, and use the default ones for this datatype.
                                set ::ms::current($w,from) -9.9
                                set ::ms::current($w,to)    9.9
                            }

                            # Override any 'maxlength' provided.
                            set maxlength_from [string length $::ms::current($w,from)]
                            set maxlength_to   [string length $::ms::current($w,to)]
                            if { $maxlength_from > $maxlength_to } {
                                set ::ms::current($w,maxlength) $maxlength_from
                            } else {
                                set ::ms::current($w,maxlength) $maxlength_to
                            }

                            # Set the current value with the 'from' value.
                            set ::ms::data($w,current_value) $::ms::current($w,from)
                        }
                        default {
                            # Set the spinbox type to 'list'.
                            set ::ms::data($w,type) list

                            # Create a fictional list of alphabetic values.
                            lappend ::ms::current($w,values) Amsterdam Beijing        Cairo           Dublin    Freetown      Gibraltar \
                                                             Hanoi     Havana         Helsinki        Islamabad Jerusalem     Kabul \
                                                             Kingston  "Kuala Lumpur" "La Paz"        Lima      Lisbon        London \
                                                             Madrid    Manila         "Mexico City"   Minx      Monaco        Montevideo \
                                                             Moscow    Nairobi        "New Delhi"     Oslo      "Panama City" Paris \
                                                             Praga     Quito          Reykjavík       Riga      Rome          "San José" \
                                                             San Juan  "San Salvador" "Santo Domingo" Sarajevo  Seoul         Singapore \
                                                             Sofia     Stockholm      Taipei          Tallin    Tirana        Tokyo \
                                                             Tunis     Valletta       Vienna          Warsaw    Washigton     Zagreb;

                            # Register the sorted values
                            set ::ms::data($w,values) $::ms::current($w,values)

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::current($w,values)]

                            # Set the current value as the value corresponding to the first item in '::ms::data($w,values)'.
                            set ::ms::data($w,current_value) [lindex $::ms::data($w,values) 0]

                            # Ignore any 'decimals', from', 'increment' and 'to' values eventually provided.
                            set ::ms::current($w,decimals)  1
                            set ::ms::current($w,from)      0
                            set ::ms::current($w,increment) 1
                            set ::ms::current($w,to)        0

                            set ::ms::data($w,format) "%.1f"
                        }
                    }
                }
                default {
                    # Set the spinbox type to 'list'.
                    set ::ms::data($w,type) list

                    # Ignore any 'decimals', from', 'increment' and 'to' values eventually provided.
                    set ::ms::current($w,decimals)  1
                    set ::ms::current($w,from)      0
                    set ::ms::current($w,increment) 1
                    set ::ms::current($w,to)        0

                    set ::ms::data($w,format) "%.1f"

                    # Check the datatype.
                    switch -- $::ms::current($w,datatype) {
                        alnum {
                            # Check every characters in value.
                            foreach value $::ms::current($w,values) {
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
                            # Check every characters in value.
                            foreach value $::ms::current($w,values) {
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
                            # Check every numbers in value.
                            foreach value $::ms::current($w,values) {
                                switch -- [string is integer -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid integer value, 'value: $value'." $caller_info }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -integer $::ms::current($w,values)]

                            # Set the maxlength.
                            set maxlength_from [string length [lindex $::ms::data($w,values) 0]]
                            set maxlength_to   [string length [lindex $::ms::data($w,values) end]]

                            if { $maxlength_from > $maxlength_to } {
                                set ::ms::current($w,maxlength) $maxlength_from
                            } else {
                                set ::ms::current($w,maxlength) $maxlength_to
                            }
                        }
                        posinteger {
                            # Check every numbers in value.
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

                            # Set the maxlength.
                            set ::ms::current($w,maxlength) [string length [lindex $::ms::data($w,values) end]]
                        }
                        posreal {
                            # Check every numbers in value.
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

                            # Set the maxlength.
                            set maxlength 0
                            foreach number $::ms::data($w,values) {
                                set number_length [string length $number]
                                if { $number_length > $maxlength } {
                                    set maxlength $number_length
                                }
                            }

                            set ::ms::current($w,maxlength) $maxlength
                        }
                        real {
                            # Check every numbers in value.
                            foreach value $::ms::current($w,values) {
                                switch -- [string is double -strict $value] {
                                    0   { ::ms::Error "One of the values assigned to '$w' is not a valid real value, 'value: $value'." $caller_info }
                                }
                            }

                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -real $::ms::current($w,values)]

                            # Set the maxlength.
                            set maxlength 0
                            foreach number $::ms::data($w,values) {
                                set number_length [string length $number]
                                if { $number_length > $maxlength } {
                                    set maxlength $number_length
                                }
                            }

                            set ::ms::current($w,maxlength) $maxlength
                        }
                        none {
                            # Register the sorted values.
                            set ::ms::data($w,values) [lsort -dictionary $::ms::current($w,values)]

                            # Register the sorted values in lowercase characters.
                            set ::ms::data($w,values,lowercase) [string tolower $::ms::data($w,values)]
                        }
                    }

                    # Set the current value as the first one of '::ms::data($w,values)'.
                    set ::ms::data($w,current_value) [lindex $::ms::data($w,values) 0]
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

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify',
            #       'padding' and 'selectborderwidth' are not allowed to change if the statespec changes.

            #####################
            ##                 ##
            ##     SPINBOX     ##
            ##                 ##
            #####################

            # Agglomerate the padding values.
            set padding ""
            foreach pad $::ms::current($w,padding) {
                append padding "$pad" "-"
            }
            set padding [string trimright $padding "-"]

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

            # Create the spinbox widget.
            _ttk_spinbox $w           -class $::ms::current($w,class) \
                                    -command "" \
                                     -cursor $cursor \
                            -exportselection $::ms::current($w,exportselection) \
                                       -font $::ms::current($w,font) \
                                     -format $::ms::data($w,format) \
                                       -from $::ms::current($w,from) \
                                  -increment $::ms::current($w,increment) \
                             -invalidcommand $::ms::current($w,invalidcommand) \
                                    -justify $::ms::current($w,justify) \
                                -placeholder $::ms::current($w,placeholder) \
                                       -show "" \
                                      -state $::ms::current($w,state) \
                                      -style $::ms::style($w,widget) \
                                  -takefocus $takefocus \
                               -textvariable $::ms::current($w,textvariable) \
                                         -to $::ms::current($w,to) \
                                   -validate $::ms::current($w,validate) \
                            -validatecommand $::ms::current($w,validatecommand) \
                                     -values $::ms::data($w,values) \
                                      -width $::ms::current($w,charwidth) \
                                       -wrap 0 \
                             -xscrollcommand $::ms::current($w,xscrollcommand);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            # Set the current value in the spinbox entry.
            $w set $::ms::data($w,current_value)

            # Set the cursor at the end of the spinbox textarea.
            $w icursor end

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TSpinbox { bindtags $w [list $w _Spinbox TSpinbox $::ms::addr($w,toplevel) all] }
                default  { bindtags $w [list $w $::ms::current($w,class) _Spinbox TSpinbox $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::spinbox::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::spinbox::Pathname_Cmd $w]
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

            # Add the widget address to the spinbox widgets real address list.
            lappend ::ms::addr(spinbox) $w

            # Add the widget address to the spinbox classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),spinbox,addrs) $w

            # Add the widget address to the spinbox classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),spinbox,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the spinbox classtype.
            if { $::ms::current($w,style) ni $::ms::style(spinbox,classtype) } {
                lappend ::ms::style(spinbox,classtype) $::ms::current($w,style)
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
proc ::ms::spinbox::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::spinbox(non_styleable,options)) || ($option in $::ms::spinbox(styleable,options))} {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid option, '$args'." $caller_info }
            }
        }
        configure {}
        delete    -
        selection {
            # Synopsis:
            #
            # *window* **delete** *first* ?*last*?
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
        identify {
            # Synopsis:
            #
            # *window* **identify** **element** *x* *y*
            switch -- [llength $args] {
                3   {
                    # Check that the first argument of 'args' is the word 'element' or 'sash'.
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

                    # Check if the coordinates provided falls upon the widget.
                    try {
                        interp invokehidden {} $w identify $x $y
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -- $result {
                            textarea { set result "Spinbox.textarea" }
                        }

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
                enabled { chan puts stdout "'insert' is a deprecated mustang spinbox command. Use 'set' instead." }
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
            switch -- [llength $args] {
                0       { return [interp invokehidden {} $w $cmd] }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
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

                    # Execute the command.
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

                    # Execute the command.
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
                    set value $args

                    switch -- $::ms::data($w,type) {
                        incremental {
                            switch -- $::ms::current($w,datatype) {
                                integer    -
                                posinteger {
                                    switch -- [string is integer -strict $value] {
                                        0   { return "" }
                                    }

                                    if { ($value >= $::ms::current($w,from)) && ($value <= $::ms::current($w,to)) } {
                                        set ::ms::data($w,current_value) $value
                                    } else {
                                        return ""
                                    }
                                }
                                posreal    -
                                real       {
                                    switch -- [string is double -strict $value] {
                                        0   { return "" }
                                    }

                                    if { ($value >= $::ms::current($w,from)) && ($value <= $::ms::current($w,to)) } {
                                        set ::ms::data($w,current_value) [format $::ms::data($w,format) $value]
                                    } else {
                                        return ""
                                    }
                                }
                            }
                        }
                        default {
                            # Check the widget datatype.
                            switch -- $::ms::current($w,datatype) {
                                integer    -
                                posinteger { set index [lsearch -exact -integer $::ms::data($w,values) $value] }
                                real       -
                                posreal    { set index [lsearch -exact -real    $::ms::data($w,values) $value] }
                                default    { set index [lsearch -exact -nocase  $::ms::data($w,values) $value] }
                            }

                            # Check that the value provided exists inside '::ms::data($w,values)'.
                            switch -- $index {
                                -1      { return "" }
                                default { set ::ms::data($w,current_value) [lindex $::ms::data($w,values) $index] }
                            }
                        }
                    }

                    # Apply the changes.
                    interp invokehidden {} $w set $::ms::data($w,current_value)

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
        xview {}
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
# Update any spinbox widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::spinbox::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*