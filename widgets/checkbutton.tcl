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
package provide ::ms::checkbutton 0.1

###################################
##                               ##
##     _CHECKBUTTON BINDINGS     ##
##                               ##
###################################

# Activate/Deactivate
_bind _Checkbutton <Activate>   { ::ms::radiobutton::Pathname_Cmd %W state !background; break }
_bind _Checkbutton <Deactivate> { ::ms::radiobutton::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Checkbutton <ButtonPress-1> { ::ms::checkbutton::ButtonPress %W; break }

# Contextual menu
_bind _Checkbutton <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Checkbutton <Destroy> { ::ms::radiobutton::Destroy %W; break }

# Enter/Leave
_bind _Checkbutton <Enter> { ::ms::radiobutton::Hover %W %X %Y; break }
_bind _Checkbutton <Leave> { ::ms::radiobutton::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Checkbutton <FocusIn>  { ::ms::radiobutton::Focus_In  %W; break }
_bind _Checkbutton <FocusOut> { ::ms::radiobutton::Focus_Out %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Checkbutton <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Checkbutton <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **checkbutton** package.
namespace eval ::ms::checkbutton {
    # Set the 'non styleable' checkbutton option list.
    set ::ms::checkbutton(non_styleable,options) [list class \
                                                       cmenu \
                                                       command \
                                                       offvalue \
                                                       onvalue \
                                                       state \
                                                       style \
                                                       takefocus \
                                                       text \
                                                       textvariable \
                                                       underline \
                                                       variable];

    # Set the 'styleable' checkbutton option list.
    set ::ms::checkbutton(styleable,options) [list charwidth \
                                                   cursor \
                                                   font \
                                                   foreground \
                                                   highlightcolor \
                                                   image \
                                                   indicatorbackground \
                                                   indicatorforeground \
                                                   indicatorrelief \
                                                   justify \
                                                   padding \
                                                   shellbackground \
                                                   spacer \
                                                   wraplength];

    # Set the default 'non-styleable' checkbutton options values.
    set ::ms::default(checkbutton,class)        TCheckbutton
    set ::ms::default(checkbutton,cmenu)        {}
    set ::ms::default(checkbutton,command)      {}
    set ::ms::default(checkbutton,offvalue)     0
    set ::ms::default(checkbutton,onvalue)      1
    set ::ms::default(checkbutton,state)        normal
    set ::ms::default(checkbutton,style)        TCheckbutton
    set ::ms::default(checkbutton,takefocus)    1
    set ::ms::default(checkbutton,text)         {}
    set ::ms::default(checkbutton,textvariable) {}
    set ::ms::default(checkbutton,underline)    -1
    set ::ms::default(checkbutton,variable)     {}

    # Note: The default 'styleable' checkbutton options values are always defined inside the current theme.
}

# Rename the original Tk **checkbutton** and **ttk::checkbutton** commands.
rename checkbutton      _checkbutton
rename ttk::checkbutton _ttk_checkbutton

# Create aliases for the mustang **checkbutton** command.
interp alias {} checkbutton      {} ::ms::checkbutton::Command
interp alias {} ttk::checkbutton {} ::ms::checkbutton::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **checkbutton** and **ttk::checkbutton** widgets commands.
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
proc ::ms::checkbutton::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(checkbutton,class)
            set ::ms::default($w,cmenu)        $::ms::default(checkbutton,cmenu)
            set ::ms::default($w,command)      $::ms::default(checkbutton,command)
            set ::ms::default($w,offvalue)     $::ms::default(checkbutton,offvalue)
            set ::ms::default($w,onvalue)      $::ms::default(checkbutton,onvalue)
            set ::ms::default($w,state)        $::ms::default(checkbutton,state)
            set ::ms::default($w,style)        $::ms::default(checkbutton,style)
            set ::ms::default($w,takefocus)    $::ms::default(checkbutton,takefocus)
            set ::ms::default($w,text)         $::ms::default(checkbutton,text)
            set ::ms::default($w,textvariable) $::ms::default(checkbutton,textvariable)
            set ::ms::default($w,underline)    $::ms::default(checkbutton,underline)
            set ::ms::default($w,variable)     $::ms::default(checkbutton,variable)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(checkbutton,class)
            set ::ms::current($w,cmenu)        $::ms::default(checkbutton,cmenu)
            set ::ms::current($w,command)      $::ms::default(checkbutton,command)
            set ::ms::current($w,offvalue)     $::ms::default(checkbutton,offvalue)
            set ::ms::current($w,onvalue)      $::ms::default(checkbutton,onvalue)
            set ::ms::current($w,state)        $::ms::default(checkbutton,state)
            set ::ms::current($w,style)        $::ms::default(checkbutton,style)
            set ::ms::current($w,takefocus)    $::ms::default(checkbutton,takefocus)
            set ::ms::current($w,text)         $::ms::default(checkbutton,text)
            set ::ms::current($w,textvariable) $::ms::default(checkbutton,textvariable)
            set ::ms::current($w,underline)    $::ms::default(checkbutton,underline)
            set ::ms::current($w,variable)     $::ms::default(checkbutton,variable)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) checkbutton

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
            #       To make a checkbutton styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **checkbutton** *window* **-shellbackground** red
            #       or
            #           *window* **configure** **-shellbackground** red
            set ::ms::managed_by($w,charwidth)           Tk
            set ::ms::managed_by($w,cursor)              Tk
            set ::ms::managed_by($w,font)                Tk
            set ::ms::managed_by($w,foreground)          Tk
            set ::ms::managed_by($w,highlightcolor)      Tk
            set ::ms::managed_by($w,image)               Tk
            set ::ms::managed_by($w,indicatorbackground) Tk
            set ::ms::managed_by($w,indicatorforeground) Tk
            set ::ms::managed_by($w,indicatorrelief)     Tk
            set ::ms::managed_by($w,justify)             Tk
            set ::ms::managed_by($w,padding)             Tk
            set ::ms::managed_by($w,shellbackground)     Tk
            set ::ms::managed_by($w,spacer)              Tk
            set ::ms::managed_by($w,wraplength)          Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -charwidth {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,charwidth)    $value
                        set ::ms::managed_by($w,charwidth) developer
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
                    -highlightcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,highlightcolor)    $value
                        set ::ms::managed_by($w,highlightcolor) developer
                    }
                    -image {
                        switch -- [::ms::Check_Image $value] {
                            invalid { continue }
                        }

                        set ::ms::current($w,image)    $value
                        set ::ms::managed_by($w,image) developer
                    }
                    -indicatorbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,indicatorbackground)    $value
                        set ::ms::managed_by($w,indicatorbackground) developer
                    }
                    -indicatorforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,indicatorforeground)    $value
                        set ::ms::managed_by($w,indicatorforeground) developer
                    }
                    -indicatorrelief {
                        set value [string tolower $value]
                        switch -- $value {
                            flat   -
                            groove -
                            raised -
                            ridge  -
                            solid  -
                            sunken {
                                set ::ms::current($w,indicatorrelief)    $value
                                set ::ms::managed_by($w,indicatorrelief) developer
                            }
                        }
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
                    -offvalue { set ::ms::current($w,offvalue) $value }
                    -onvalue { set ::ms::current($w,onvalue) $value }
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
                    -shellbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,shellbackground)    $value
                        set ::ms::managed_by($w,shellbackground) developer
                    }
                    -spacer {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,spacer)    $value
                        set ::ms::managed_by($w,spacer) developer
                    }
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            disabled -
                            normal   { set ::ms::current($w,state) $value }
                        }
                    }
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TCheckbutton' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TCheckbutton]
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
                    -text { set ::ms::current($w,text) $value }
                    -textvariable {
                        switch -- [info exists $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,textvariable) $value
                    }
                    -underline {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value >= -1 } {
                                    set ::ms::current($w,underline) $value
                                }
                            }
                        }
                    }
                    -variable {
                        switch -- [info exists $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,variable) $value
                    }
                    -wraplength {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,wraplength)    $value
                        set ::ms::managed_by($w,wraplength) developer
                    }
                }
            }

            # Check if a variable was provided.
            switch -- [llength $::ms::current($w,variable)] {
                0   {
                    # Depending on the address type provided, set the appropriate address.
                    switch -- $type {
                        real  { set ::ms::current($w,variable) $w }
                        short { set ::ms::current($w,variable) $short_addr }
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::checkbutton(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TCheckbutton,$option)

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
                    set cursor arrow

                    set ::ms::current($w,takefocus) 0
                }
                normal { set cursor $::ms::current($w,cursor) }
            }

            # Enable/Disable the widget automatic translation.
            switch -- $::ms::current($w,textvariable) {
                ""  {
                    switch -- [llength $::ms::current($w,text)] {
                        0       { set ::ms::data($w,translated_text) $::ms::current($w,text) }
                        default {
                            # Automatic translation: ON
                            set ::ms::data($w,translated_text) [::msgcat::mc {*}$::ms::current($w,text)]
                        }
                    }

                    set textvariable ::ms::data($w,translated_text)
                }
                default {
                    # Automatic translation: OFF
                    set textvariable $::ms::current($w,textvariable)
                }
            }

            # Get the padding data.
            switch -- [llength $::ms::current($w,padding)] {
                1   {
                    set pad_left   [lindex $::ms::current($w,padding) 0]
                    set pad_right  [lindex $::ms::current($w,padding) 0]
                    set pad_top    [lindex $::ms::current($w,padding) 0]
                    set pad_bottom [lindex $::ms::current($w,padding) 0]
                }
                2   {
                    set pad_left   [lindex $::ms::current($w,padding) 0]
                    set pad_top    [lindex $::ms::current($w,padding) 1]
                    set pad_right  [lindex $::ms::current($w,padding) 0]
                    set pad_bottom [lindex $::ms::current($w,padding) 1]
                }
                3   {
                    set pad_left   [lindex $::ms::current($w,padding) 0]
                    set pad_top    [lindex $::ms::current($w,padding) 1]
                    set pad_right  [lindex $::ms::current($w,padding) 2]
                    set pad_bottom [lindex $::ms::current($w,padding) 1]
                }
                4   {
                    set pad_left   [lindex $::ms::current($w,padding) 0]
                    set pad_top    [lindex $::ms::current($w,padding) 1]
                    set pad_right  [lindex $::ms::current($w,padding) 2]
                    set pad_bottom [lindex $::ms::current($w,padding) 3]
                }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'charwidth', 'cursor', 'font', 'indicatorbackground', 'indicatorrelief', 'justify', 'padding',
            #       'shellbackground', 'spacer' and 'wraplength' are not allowed to change if the statespec changes.

            ##################
            ##              ##
            ##     HULL     ##
            ##              ##
            ##################

            # Set the hull object style name.
            set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                 ".TFrame"];

            # If needed, create the hull object style name.
            if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,shellbackground)

                # Add the hull object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
            }

            # Create the hull object.
            _ttk_frame $w -borderwidth 0 \
                                -class TFrame \
                               -cursor $cursor \
                               -height 0 \
                              -padding 0 \
                               -relief flat \
                                -style $::ms::style($w,hull) \
                            -takefocus 0 \
                                -width 0;

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            #######################
            ##                   ##
            ##     INDICATOR     ##
            ##                   ##
            #######################

            # Note: The 'alt' engine use the option name 'indicatorcolor' instead of 'indicatorforeground' as the other engines do.
            #       Mustang will take care of setting both option names with the 'indicatorforeground' value so that no matter
            #       the engine used by the current theme, everything will work as expected by the developer.

            # Set the indicator object style name.
            set ::ms::style($w,indicator) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                      "_ib=" $::ms::current($w,indicatorbackground) \
                                                      "_if=" $::ms::current($w,indicatorforeground) \
                                                      "_ir=" $::ms::current($w,indicatorrelief) \
                                                      "." $::ms::current($w,style)];

            # If needed, create the indicator object style name.
            if { $::ms::style($w,indicator) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,indicator)          -background $::ms::current($w,shellbackground) \
                                                                -indicatorbackground $::ms::current($w,indicatorbackground) \
                                                                     -indicatorcolor $::ms::current($w,indicatorforeground) \
                                                                -indicatorforeground $::ms::current($w,indicatorforeground) \
                                                                    -indicatorrelief $::ms::current($w,indicatorrelief);

                # Add the indicator object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,indicator)
            }

            # Initialize the indicator object mapping.
            set mapping [list ]

            # indicatorcolor and indicatorforeground.
            switch -- $::ms::managed_by($w,indicatorforeground) {
                developer {
                    lappend mapping -indicatorcolor      [list pressed $::ms::current($w,indicatorforeground)]
                    lappend mapping -indicatorforeground [list pressed $::ms::current($w,indicatorforeground)]
                }
                Tk  {
                    # Check if a 'indicatorforeground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)] {
                        1   {
                            lappend mapping -indicatorcolor      $::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)
                            lappend mapping -indicatorforeground $::ms::stylemap($::ms::theme,$::ms::current($w,style),indicatorforeground)
                        }
                    }
                }
            }

            # If needed, create the indicator object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,indicator) {*}$mapping

                # Add the indicator object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the indicator object.
            _ttk_checkbutton $w.indicator        -class TCheckbutton \
                                               -command $::ms::current($w,command) \
                                              -compound left \
                                                -cursor $cursor \
                                                 -image $::ms::current($w,image) \
                                              -offvalue $::ms::current($w,offvalue) \
                                               -onvalue $::ms::current($w,onvalue) \
                                               -padding 0 \
                                                 -state $::ms::current($w,state) \
                                                 -style $::ms::style($w,indicator) \
                                             -takefocus $::ms::current($w,takefocus) \
                                                  -text "" \
                                          -textvariable "" \
                                             -underline -1 \
                                              -variable $::ms::current($w,variable);

            # Grid the indicator object.
            _grid $w.indicator -column 0 \
                                 -padx [list $pad_left 0] \
                                 -pady [list $pad_top 1m] \
                                  -row 0 \
                               -sticky w;

            ###################
            ##               ##
            ##     LABEL     ##
            ##               ##
            ###################

            # Set the label object style name.
            set ::ms::style($w,label) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                  "_fg=" $::ms::current($w,foreground) \
                                                  ".TLabel"];

            # If needed, create the label object style name.
            if { $::ms::style($w,label) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,label) -background $::ms::current($w,shellbackground) \
                                                            -foreground $::ms::current($w,foreground);

                # Add the label object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,label)
            }

            # Initialize the label object mapping.
            set mapping [list ]

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

            # If needed, create the label object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,label) {*}$mapping

                # Add the label object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the label object.
            _ttk_label $w.label       -anchor w \
                                 -borderwidth 0 \
                                       -class TLabel \
                                    -compound none \
                                      -cursor $cursor \
                                        -font $::ms::current($w,font) \
                                       -image [list ] \
                                     -justify $::ms::current($w,justify) \
                                     -padding 0 \
                                      -relief flat \
                                       -state $::ms::current($w,state) \
                                       -style $::ms::style($w,label) \
                                   -takefocus 0 \
                                        -text "" \
                                -textvariable $textvariable \
                                   -underline $::ms::current($w,underline) \
                                       -width $::ms::current($w,charwidth) \
                                  -wraplength $::ms::current($w,wraplength);

            # Grid the label object.
            _grid $w.label -column 1 \
                             -padx [list $::ms::current($w,spacer) $pad_right] \
                             -pady [list $pad_top 1m] \
                              -row 0 \
                           -sticky we;

            #######################
            ##                   ##
            ##     HIGHLIGHT     ##
            ##                   ##
            #######################

            # Set the highlight object style name.
            set ::ms::style($w,highlight) [string cat "_hc=" $::ms::current($w,highlightcolor) \
                                                      ".TFrame"];

            # If needed, create the highlight object style name.
            if { $::ms::style($w,highlight) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,highlight) -background $::ms::current($w,highlightcolor)

                # Add the highlight object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,highlight)
            }

            # Initialize the highlight object mapping.
            set mapping [list ]

            # highlightcolor
            switch -- $::ms::managed_by($w,highlightcolor) {
                developer { lappend mapping -background [list pressed $::ms::current($w,highlightcolor)] }
                Tk  {
                    # Check if a 'background' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),highlightcolor)] {
                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),highlightcolor) }
                    }
                }
            }

            # If needed, create the highlight object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,highlight) {*}$mapping

                # Add the highlight object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the highlight object.
            _ttk_frame $w.highlight -borderwidth 0 \
                                          -class TFrame \
                                         -cursor $cursor \
                                         -height 2 \
                                        -padding 0 \
                                         -relief flat \
                                          -style $::ms::style($w,highlight) \
                                      -takefocus 0 \
                                          -width 1;

            _grid $w.highlight -column 1 \
                                 -padx [list $::ms::current($w,spacer) $pad_right] \
                                 -pady [list 1m $pad_bottom] \
                                  -row 1 \
                               -sticky we;
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
proc ::ms::checkbutton::Pathname_Cmd { w cmd args } {}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any checkbutton widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::checkbutton::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*