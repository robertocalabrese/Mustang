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

            # Depending on the datatype provided override the maxlength option and, if needed,
            # check the 'from' and 'to' values.
            switch -- $::ms::current($w,datatype) {
                hex8 {
                    # Override any 'maxlength' provided.
                    switch -- $::ms::current($w,hash) {
                        no  { set ::ms::current($w,maxlength) 6 }
                        yes { set ::ms::current($w,maxlength) 7 }
                    }
                }
                hex12 {
                    # Override any 'maxlength' provided.
                    switch -- $::ms::current($w,hash) {
                        no  { set ::ms::current($w,maxlength) 9 }
                        yes { set ::ms::current($w,maxlength) 10 }
                    }
                }
                hex16 {
                    # Override any 'maxlength' provided.
                    switch -- $::ms::current($w,hash) {
                        no  { set ::ms::current($w,maxlength) 12 }
                        yes { set ::ms::current($w,maxlength) 13 }
                    }
                }
                integer {
                    # Safeguard.
                    # Make sure that the 'from' and 'to' values are integers.
                    set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }]
                    set ::ms::current($w,to)   [expr { int($::ms::current($w,to)) }]

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
                }
                posinteger {
                    # Safeguard.
                    # Make sure that the 'from' and 'to' values are integers.
                    set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }]
                    set ::ms::current($w,to)   [expr { int($::ms::current($w,to)) }]

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
                }
                posreal {
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
                }
                real {
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
                }
            }

            # Check the 'maxlength'.
            switch -- $::ms::current($w,maxlength) {
                0       {}
                default {
                    # Safeguard.
                    # Check that 'charwidth' is not inferior to 'maxlength'.
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

            # Note: 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify', 'padding'
            #       and 'selectborderwidth' are not allowed to change if the statespec changes.

            # Agglomerate the padding values.
            set padding ""
            foreach pad $::ms::current($w,padding) {
                append padding "$pad" "-"
            }
            set padding [string trimright $padding "-"]

            ###################
            ##               ##
            ##     ENTRY     ##
            ##               ##
            ###################

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
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
                _ttk_style configure $::ms::style($w,widget)             -background $::ms::current($w,background) \
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

            # Create the entry widget.
            _ttk_entry $w           -class $::ms::current($w,class) \
                                   -cursor $cursor \
                          -exportselection $::ms::current($w,exportselection) \
                                     -font $::ms::current($w,font) \
                           -invalidcommand $::ms::current($w,invalidcommand) \
                                  -justify $::ms::current($w,justify) \
                              -placeholder $::ms::current($w,placeholder) \
                                     -show $::ms::current($w,show) \
                                    -state $::ms::current($w,state) \
                                    -style $::ms::style($w,widget) \
                                -takefocus $takefocus \
                             -textvariable $::ms::current($w,textvariable) \
                                 -validate $::ms::current($w,validate) \
                          -validatecommand $::ms::current($w,validatecommand) \
                                    -width $::ms::current($w,charwidth) \
                           -xscrollcommand $::ms::current($w,xscrollcommand);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TEntry  { bindtags $w [list $w _Entry TEntry $::ms::addr($w,toplevel) all] }
                default { bindtags $w [list $w $::ms::current($w,class) _Entry TEntry $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::entry::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::entry::Pathname_Cmd $w]
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

            # Add the widget address to the entry widgets real address list.
            lappend ::ms::addr(entry) $w

            # Add the widget address to the entry classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),entry,addrs) $w

            # Add the widget address to the entry classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),entry,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the entry classtype.
            if { $::ms::current($w,style) ni $::ms::style(entry,classtype) } {
                lappend ::ms::style(entry,classtype) $::ms::current($w,style)
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
proc ::ms::entry::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        bbox      -
        delete    -
        get       -
        icursor   -
        identify  -
        index     -
        selection -
        validate  -
        xview     {}
        cget {
            # Synopsis:
            #
            # *window* **cget** *option*
            switch -- [llength $args] {
                0   { ::ms::Error "Missing cget option." $caller_info }
                1   {
                    # Check if the option provided is a valid 'styleable' or 'non-styleable' option.
                    set option [string range $args 1 end]
                    if { ($option in $::ms::entry(non_styleable,options)) || ($option in $::ms::entry(styleable,options))} {
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
                    foreach option $::ms::entry(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::entry(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::entry(non_styleable,options)) || ($option in $::ms::entry(styleable,options)) } {
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

                            # Set a variable that indicates if a new datatype has been provided or not.
                            set new_datatype false

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the widget options provided.
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
                                            none       {
                                                set ::ms::current($w,datatype) $value
                                                set new_datatype true
                                            }
                                            hex        {
                                                set ::ms::current($w,datatype) hex8
                                                set new_datatype true
                                            }
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
                                    -hash {}
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

                                            # Remove the widget address from the entry real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),entry,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),entry,addrs) [lremove $::ms::style($::ms::current($w,style),entry,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,entry,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the entry classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),entry,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(entry,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(entry,classtype) [lremove $::ms::style(entry,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the entry classtype.
                                            if { $value ni $::ms::style(entry,classtype) } {
                                                lappend ::ms::style(entry,classtype) $value
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

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::entry(styleable,options) {
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

                            # Check if a new datatype was provided.
                            switch -- $new_datatype {
                                true {
                                    # Remove any previously displayed value.
                                    interp invokehidden {} $w delete 0 end
                                    interp invokehidden {} $w selection clear
                                    interp invokehidden {} $w icursor 0

                                    # Set the new current value to the empty string.
                                    set ::ms::data($w,current_value) ""
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

                            # Depending on the datatype provided override the maxlength option and, if needed,
                            # check the 'from' and 'to' values.
                            switch -- $::ms::current($w,datatype) {
                                hex8 {
                                    # Override any 'maxlength' provided.
                                    switch -- $::ms::current($w,hash) {
                                        no  { set ::ms::current($w,maxlength) 6 }
                                        yes { set ::ms::current($w,maxlength) 7 }
                                    }
                                }
                                hex12 {
                                    # Override any 'maxlength' provided.
                                    switch -- $::ms::current($w,hash) {
                                        no  { set ::ms::current($w,maxlength) 9 }
                                        yes { set ::ms::current($w,maxlength) 10 }
                                    }
                                }
                                hex16 {
                                    # Override any 'maxlength' provided.
                                    switch -- $::ms::current($w,hash) {
                                        no  { set ::ms::current($w,maxlength) 12 }
                                        yes { set ::ms::current($w,maxlength) 13 }
                                    }
                                }
                                integer {
                                    # Safeguard.
                                    # Make sure that the 'from' and 'to' values are integers.
                                    set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }]
                                    set ::ms::current($w,to)   [expr { int($::ms::current($w,to)) }]

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
                                }
                                posinteger {
                                    # Safeguard.
                                    # Make sure that the 'from' and 'to' values are integers.
                                    set ::ms::current($w,from) [expr { int($::ms::current($w,from)) }]
                                    set ::ms::current($w,to)   [expr { int($::ms::current($w,to)) }]

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
                                }
                                posreal {
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
                                }
                                real {
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
                                }
                            }

                            # Check the 'maxlength'.
                            switch -- $::ms::current($w,maxlength) {
                                0       {}
                                default {
                                    # Safeguard.
                                    # Check that 'charwidth' is not inferior to 'maxlength'.
                                    if { $::ms::current($w,charwidth) < $::ms::current($w,maxlength) } {
                                        set ::ms::current($w,charwidth) $::ms::current($w,maxlength)
                                    }
                                }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', 'insertwidth', 'justify', 'padding'
                            #       and 'selectborderwidth' are not allowed to change if the statespec changes.

                            # Agglomerate the padding values.
                            set padding ""
                            foreach pad $::ms::current($w,padding) {
                                append padding "$pad" "-"
                            }
                            set padding [string trimright $padding "-"]

                            ###################
                            ##               ##
                            ##     ENTRY     ##
                            ##               ##
                            ###################

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
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
                                _ttk_style configure $::ms::style($w,widget)             -background $::ms::current($w,background) \
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
                            interp invokehidden {} $w configure          -cursor $cursor \
                                                                -exportselection $::ms::current($w,exportselection) \
                                                                           -font $::ms::current($w,font) \
                                                                 -invalidcommand $::ms::current($w,invalidcommand) \
                                                                        -justify $::ms::current($w,justify) \
                                                                    -placeholder $::ms::current($w,placeholder) \
                                                                           -show $::ms::current($w,show) \
                                                                          -state $::ms::current($w,state) \
                                                                          -style $::ms::style($w,widget) \
                                                                      -takefocus $takefocus \
                                                                   -textvariable $::ms::current($w,textvariable) \
                                                                       -validate $::ms::current($w,validate) \
                                                                -validatecommand $::ms::current($w,validatecommand) \
                                                                          -width $::ms::current($w,charwidth) \
                                                                 -xscrollcommand $::ms::current($w,xscrollcommand);

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
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
                enabled { chan puts stdout "'insert' is a deprecated entry command. Use 'set' instead." }
            }

            switch -- [llength $args] {
                2   {
                    set index  [lindex $args 0]
                    set string [lindex $args 1]

                    # Check the index value.
                    switch -- [string is integer -strict $index] {
                        0   { ::ms::Error "Invalid index, '$index'." $caller_info }
                    }

                    # Construct the new value that should be displayed inside the widget.
                    set value [interp invokehidden {} $w get]
                    if { $index < 1 } {
                        set value [string cat $string $value]
                    } elseif { $index >= [string length $value] } {
                        set value [string cat $value $string]
                    } else {
                        set value [string cat [string range $value 0 $index-1] $string [string range $value $index end]]
                    }

                    # Launch the 'set' command.
                    ::ms::entry::Pathname_Cmd $w set $value
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            return ""
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
            # *window* **set** *value*?
            switch -- [llength $args] {
                1   {
                    # Remove any consecutive whitespaces at the beginning or at the end of the current value.
                    set value [string trim $args]

                    # If the datatype is not 'none', 'alnum' or 'alpha' validate the current value.
                    switch -- $::ms::current($w,datatype) {
                        hex8  -
                        hex12 -
                        hex16 {
                            # Check if current value is the empty string.
                            switch -- $value {
                                ""  {
                                    # Clear the widget field.
                                    interp invokehidden {} $w delete    0 end
                                    interp invokehidden {} $w selection clear
                                }
                                default {
                                    # Check if the current value is a valid hexadecimal color.
                                    set value [::ms::Check_Hex $value $::ms::current($w,datatype) invalid]
                                    switch -- $value {
                                        invalid { set value $::ms::data($w,current_value) }
                                        default {
                                            # Check if the hash sign '#' should be included or not.
                                            switch -- $::ms::current($w,hash) {
                                                no  { set value [string trimleft $value "#"] }
                                            }
                                        }
                                    }

                                    # If the corrected value is different than the current value,
                                    # clear the widget field, insert the corrected value and position the cursor at the end.
                                    if { $value ne $args } {
                                        interp invokehidden {} $w delete    0 end
                                        interp invokehidden {} $w selection clear
                                        interp invokehidden {} $w insert    0 $value
                                        interp invokehidden {} $w icursor   end
                                    }
                                }
                            }
                        }
                        integer    -
                        posinteger {
                            # Check if current value is the empty string.
                            switch -- $value {
                                ""  {
                                    # Clear the widget field.
                                    interp invokehidden {} $w delete    0 end
                                    interp invokehidden {} $w selection clear
                                }
                                default {
                                    # Beautify 'value'.
                                    set value [::ms::Beautify_Input_Number $value $::ms::current($w,maxlength) $::ms::current($w,datatype)]

                                    # Check if 'value' is an integer.
                                    switch -- [string is integer -strict $value] {
                                        0   {
                                            set value $::ms::data($w,current_value)

                                            interp invokehidden {} $w delete    0 end
                                            interp invokehidden {} $w selection clear
                                            interp invokehidden {} $w insert    0 $value
                                            interp invokehidden {} $w icursor   end
                                        }
                                        1   {
                                            # Check 'value' against the 'from' and 'to' values.
                                            if { $value < $::ms::current($w,from) } {
                                                set value $::ms::current($w,from)
                                            } elseif { $value > $::ms::current($w,to) } {
                                                set value $::ms::current($w,to)
                                            }

                                            # Set the widget dynamic state as '!invalid'.
                                            ::ms::entry::Pathname_Cmd $w state !invalid

                                            # If the corrected value is different than the current value,
                                            # clear the widget field, insert the corrected value and position the cursor at the end.
                                            if { $value ne $args } {
                                                interp invokehidden {} $w delete    0 end
                                                interp invokehidden {} $w selection clear
                                                interp invokehidden {} $w insert    0 $value
                                                interp invokehidden {} $w icursor   end
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        posreal -
                        real    {
                            # Check if current value is the empty string.
                            switch -- $value {
                                ""  {
                                    # Clear the widget field.
                                    interp invokehidden {} $w delete    0 end
                                    interp invokehidden {} $w selection clear
                                }
                                default {
                                    # Beautify 'value'.
                                    set value [::ms::Beautify_Input_Number $value $::ms::current($w,maxlength) $::ms::current($w,datatype)]

                                    # Check if 'value' is a double.
                                    switch -- [string is double -strict $value] {
                                        0   {
                                            set value $::ms::data($w,current_value)

                                            interp invokehidden {} $w delete    0 end
                                            interp invokehidden {} $w selection clear
                                            interp invokehidden {} $w insert    0 $value
                                            interp invokehidden {} $w icursor   end
                                        }
                                        1   {
                                            # Check 'value' against the 'from' and 'to' values.
                                            if { $value < $::ms::current($w,from) } {
                                                set value $::ms::current($w,from)
                                            } elseif { $value > $::ms::current($w,to) } {
                                                set value $::ms::current($w,to)
                                            } else {
                                                set value [format $::ms::data($w,format) $value]
                                            }

                                            # Set the widget dynamic state as '!invalid'.
                                            ::ms::entry::Pathname_Cmd $w state !invalid

                                            # If the corrected value is different than the current value,
                                            # clear the widget field, insert the corrected value and position the cursor at the end.
                                            if { $value ne $args } {
                                                interp invokehidden {} $w delete    0 end
                                                interp invokehidden {} $w selection clear
                                                interp invokehidden {} $w insert    0 $value
                                                interp invokehidden {} $w icursor   end
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        default {
                            # Check if current value is the empty string.
                            switch -- $value {
                                ""  {
                                    # Clear the widget field.
                                    interp invokehidden {} $w delete    0 end
                                    interp invokehidden {} $w selection clear
                                }
                                default {
                                    # If the corrected value is different than the current value,
                                    # clear the widget field, insert the corrected value and position the cursor at the end.
                                    if { $value ne $args } {
                                        interp invokehidden {} $w delete    0 end
                                        interp invokehidden {} $w selection clear
                                        interp invokehidden {} $w insert    0 $value
                                        interp invokehidden {} $w icursor   end
                                    }
                                }
                            }
                        }
                    }

                    # If the current value is different than the previous registered one, register it
                    # and launch the external procedure provided, if any.
                    if { $value ne $::ms::data($w,current_value) } {
                        set ::ms::data($w,current_value) $value

                        ::ms::Execute_Widget_Cmd $w
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