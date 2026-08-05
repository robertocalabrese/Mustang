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
            set ::ms::default($w,class)           $::ms::default(entry,class)
            set ::ms::default($w,cmenu)           $::ms::default(entry,cmenu)
            set ::ms::default($w,command)         $::ms::default(entry,command)
            set ::ms::default($w,datatype)        $::ms::default(entry,datatype)
            set ::ms::default($w,decimals)        $::ms::default(entry,decimals)
            set ::ms::default($w,exportselection) $::ms::default(entry,exportselection)
            set ::ms::default($w,from)            $::ms::default(entry,from)
            set ::ms::default($w,hash)            $::ms::default(entry,hash)
            set ::ms::default($w,invalidcommand)  $::ms::default(entry,invalidcommand)
            set ::ms::default($w,maxlength)       $::ms::default(entry,maxlength)
            set ::ms::default($w,placeholder)     $::ms::default(entry,placeholder)
            set ::ms::default($w,show)            $::ms::default(entry,show)
            set ::ms::default($w,state)           $::ms::default(entry,state)
            set ::ms::default($w,style)           $::ms::default(entry,style)
            set ::ms::default($w,takefocus)       $::ms::default(entry,takefocus)
            set ::ms::default($w,textvariable)    $::ms::default(entry,textvariable)
            set ::ms::default($w,to)              $::ms::default(entry,to)
            set ::ms::default($w,validate)        $::ms::default(entry,validate)
            set ::ms::default($w,validatecommand) $::ms::default(entry,validatecommand)
            set ::ms::default($w,xscrollcommand)  $::ms::default(entry,xscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)           $::ms::default(entry,class)
            set ::ms::current($w,cmenu)           $::ms::default(entry,cmenu)
            set ::ms::current($w,command)         $::ms::default(entry,command)
            set ::ms::current($w,datatype)        $::ms::default(entry,datatype)
            set ::ms::current($w,decimals)        $::ms::default(entry,decimals)
            set ::ms::current($w,exportselection) $::ms::default(entry,exportselection)
            set ::ms::current($w,from)            $::ms::default(entry,from)
            set ::ms::current($w,hash)            $::ms::default(entry,hash)
            set ::ms::current($w,invalidcommand)  $::ms::default(entry,invalidcommand)
            set ::ms::current($w,maxlength)       $::ms::default(entry,maxlength)
            set ::ms::current($w,placeholder)     $::ms::default(entry,placeholder)
            set ::ms::current($w,show)            $::ms::default(entry,show)
            set ::ms::current($w,state)           $::ms::default(entry,state)
            set ::ms::current($w,style)           $::ms::default(entry,style)
            set ::ms::current($w,takefocus)       $::ms::default(entry,takefocus)
            set ::ms::current($w,textvariable)    $::ms::default(entry,textvariable)
            set ::ms::current($w,to)              $::ms::default(entry,to)
            set ::ms::current($w,validate)        $::ms::default(entry,validate)
            set ::ms::current($w,validatecommand) $::ms::default(entry,validatecommand)
            set ::ms::current($w,xscrollcommand)  $::ms::default(entry,xscrollcommand)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)     entry
            set ::ms::data($w,current_value) ""
            set ::ms::data($w,format)        "%.1f"

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
            #       To make a entry styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **entry** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
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
                                if { $value >= 0 } {
                                    set ::ms::current($w,charwidth)    $value
                                    set ::ms::managed_by($w,charwidth) developer
                                }
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
                            hex8       -
                            hex12      -
                            hex16      -
                            integer    -
                            posinteger -
                            posreal    -
                            real       -
                            none       { set ::ms::current($w,datatype) $value }
                            hex        { set ::ms::current($w,datatype) hex8 }
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
                    -hash {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,hash) no }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,hash) yes }
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
                    -show {
                        switch -- [string length $value] {
                            1   { set ::ms::current($w,show) $value }
                        }
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
                            # If not, create one by mirroring the current theme 'TEntry' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TEntry]
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
                            1   { set ::ms::current($w,textvariable) $value }
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
                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::entry(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TEntry,$option)

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
                    set cursor    arrow
                    set takefocus $::ms::current($w,takefocus)
                }
                normal   {
                    set cursor    $::ms::current($w,cursor)
                    set takefocus $::ms::current($w,takefocus)
                }
            }

            # Check the invalidcommand, validate, validatecommand and xscrollcommand options
            # relative to the datatype option provided.
            switch -- $::ms::current($w,datatype) {
                alnum      -
                alpha      -
                hex8       -
                hex12      -
                hex16      -
                integer    -
                posinteger -
                posreal    -
                real       {
                    set ::ms::current($w,invalidcommand)  {}
                    set ::ms::current($w,validate)        key
                    set ::ms::current($w,validatecommand) [list ::ms::entry::Validate_Keypress %W %P]

                    switch -- $::ms::current($w,maxlength) {
                        0       {}
                        default { set ::ms::current($w,xscrollcommand) {} }
                    }
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