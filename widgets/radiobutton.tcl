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
package provide ::ms::radiobutton 0.1

###################################
##                               ##
##     _RADIOBUTTON BINDINGS     ##
##                               ##
###################################

# Activate/Deactivate
_bind _Radiobutton <Activate>   { ::ms::radiobutton::Pathname_Cmd %W state !background; break }
_bind _Radiobutton <Deactivate> { ::ms::radiobutton::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Radiobutton <ButtonPress-1> { ::ms::radiobutton::ButtonPress %W; break }

# Contextual menu
_bind _Radiobutton <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Radiobutton <Destroy> { ::ms::radiobutton::Destroy %W; break }

# Enter/Leave
_bind _Radiobutton <Enter> { ::ms::radiobutton::Hover %W %X %Y; break }
_bind _Radiobutton <Leave> { ::ms::radiobutton::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Radiobutton <FocusIn>  { ::ms::radiobutton::FocusIn  %W; break }
_bind _Radiobutton <FocusOut> { ::ms::radiobutton::FocusOut %W; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Radiobutton <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Radiobutton <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Radiobutton <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Radiobutton <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Radiobutton <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Radiobutton <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **radiobutton** package.
namespace eval ::ms::radiobutton {
    # Set the 'non styleable' radiobutton option list.
    set ::ms::radiobutton(non_styleable,options) [list class \
                                                       cmenu \
                                                       command \
                                                       state \
                                                       style \
                                                       takefocus \
                                                       text \
                                                       textvariable \
                                                       underline \
                                                       value \
                                                       variable];

    # Set the 'styleable' radiobutton option list.
    set ::ms::radiobutton(styleable,options) [list charwidth \
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

    # Set the default 'non-styleable' radiobutton options values.
    set ::ms::default(radiobutton,class)        TRadiobutton
    set ::ms::default(radiobutton,cmenu)        {}
    set ::ms::default(radiobutton,command)      {}
    set ::ms::default(radiobutton,state)        normal
    set ::ms::default(radiobutton,style)        TRadiobutton
    set ::ms::default(radiobutton,takefocus)    1
    set ::ms::default(radiobutton,text)         {}
    set ::ms::default(radiobutton,textvariable) {}
    set ::ms::default(radiobutton,underline)    -1
    set ::ms::default(radiobutton,value)        {}
    set ::ms::default(radiobutton,variable)     {}

    # Note: The default 'styleable' radiobutton options values are always defined inside the current theme.
}

# Rename the original Tk **radiobutton** and **ttk::radiobutton** commands.
rename radiobutton      _radiobutton
rename ttk::radiobutton _ttk_radiobutton

# Create aliases for the mustang **radiobutton** command.
interp alias {} radiobutton      {} ::ms::radiobutton::Command
interp alias {} ttk::radiobutton {} ::ms::radiobutton::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **radiobutton** and **ttk::radiobutton** widgets commands.
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
proc ::ms::radiobutton::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(radiobutton,class)
            set ::ms::default($w,cmenu)        $::ms::default(radiobutton,cmenu)
            set ::ms::default($w,command)      $::ms::default(radiobutton,command)
            set ::ms::default($w,state)        $::ms::default(radiobutton,state)
            set ::ms::default($w,style)        $::ms::default(radiobutton,style)
            set ::ms::default($w,takefocus)    $::ms::default(radiobutton,takefocus)
            set ::ms::default($w,text)         $::ms::default(radiobutton,text)
            set ::ms::default($w,textvariable) $::ms::default(radiobutton,textvariable)
            set ::ms::default($w,underline)    $::ms::default(radiobutton,underline)
            set ::ms::default($w,value)        $::ms::default(radiobutton,value)
            set ::ms::default($w,variable)     $::ms::default(radiobutton,variable)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(radiobutton,class)
            set ::ms::current($w,cmenu)        $::ms::default(radiobutton,cmenu)
            set ::ms::current($w,command)      $::ms::default(radiobutton,command)
            set ::ms::current($w,state)        $::ms::default(radiobutton,state)
            set ::ms::current($w,style)        $::ms::default(radiobutton,style)
            set ::ms::current($w,takefocus)    $::ms::default(radiobutton,takefocus)
            set ::ms::current($w,text)         $::ms::default(radiobutton,text)
            set ::ms::current($w,textvariable) $::ms::default(radiobutton,textvariable)
            set ::ms::current($w,underline)    $::ms::default(radiobutton,underline)
            set ::ms::current($w,value)        $::ms::default(radiobutton,value)
            set ::ms::current($w,variable)     $::ms::default(radiobutton,variable)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) radiobutton

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
            #       To make a radiobutton styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **radiobutton** *window* **-shellbackground** red
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
                            # If not, create one by mirroring the current theme 'TRadiobutton' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TRadiobutton]
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
                            1   { set ::ms::current($w,textvariable) $value }
                        }
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
                    -value { set ::ms::current($w,value) $value }
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

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::radiobutton(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TRadiobutton,$option)

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

            # Enable/Disable the widget automatic translation.
            switch -- $::ms::current($w,textvariable) {
                ""  {
                    # Automatic translation: ON
                    set ::ms::data($w,translated_text) [::msgcat::mc {*}$::ms::current($w,text)]
                    set text_variable ::ms::data($w,translated_text)
                }
                default {
                    # Automatic translation: OFF
                    set text_variable $::ms::current($w,textvariable)
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
            _ttk_radiobutton $w.indicator        -class TRadiobutton \
                                               -command $::ms::current($w,command) \
                                              -compound left \
                                                -cursor $cursor \
                                                 -image $::ms::current($w,image) \
                                               -padding 0 \
                                                 -state $::ms::current($w,state) \
                                                 -style $::ms::style($w,indicator) \
                                             -takefocus $takefocus \
                                                  -text "" \
                                          -textvariable "" \
                                             -underline -1 \
                                                 -value $::ms::current($w,value) \
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
                                -textvariable $text_variable \
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

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TRadiobutton { bindtags $w [list $w _Radiobutton TRadiobutton $::ms::addr($w,toplevel) all] }
                default      { bindtags $w [list $w $::ms::current($w,class) _Radiobutton TRadiobutton $::ms::addr($w,toplevel) all] }
            }

            # ButtonPress-1
            _bind $w.highlight <ButtonPress-1> { ::ms::radiobutton::ButtonPress [_winfo parent %W]; break }
            _bind $w.indicator <ButtonPress-1> { ::ms::radiobutton::ButtonPress [_winfo parent %W]; break }
            _bind $w.label     <ButtonPress-1> { ::ms::radiobutton::ButtonPress [_winfo parent %W]; break }

            # Contextual menu
            _bind $w.highlight <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }
            _bind $w.indicator <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }
            _bind $w.label     <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

            # Enter/Leave
            _bind $w.highlight <Enter> { ::ms::radiobutton::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.indicator <Enter> { ::ms::radiobutton::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.label     <Enter> { ::ms::radiobutton::Hover [_winfo parent %W] %X %Y; break }

            _bind $w.highlight <Leave> { ::ms::radiobutton::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.indicator <Leave> { ::ms::radiobutton::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.label     <Leave> { ::ms::radiobutton::Hover [_winfo parent %W] %X %Y; break }

            # FocusIn/FocusOut
            _bind $w.highlight <FocusIn>  { ::ms::radiobutton::FocusIn  [_winfo parent %W]; break }
            _bind $w.indicator <FocusIn>  { ::ms::radiobutton::FocusIn  [_winfo parent %W]; break }
            _bind $w.label     <FocusIn>  { ::ms::radiobutton::FocusIn  [_winfo parent %W]; break }

            _bind $w.highlight <FocusOut> { ::ms::radiobutton::FocusOut [_winfo parent %W]; break }
            _bind $w.indicator <FocusOut> { ::ms::radiobutton::FocusOut [_winfo parent %W]; break }
            _bind $w.label     <FocusOut> { ::ms::radiobutton::FocusOut [_winfo parent %W]; break }

            # Return/KP_Enter
            _bind $w.indicator <Return>   { ::ms::radiobutton::Return [_winfo parent %W]; break }
            _bind $w.indicator <KP_Enter> { ::ms::radiobutton::Return [_winfo parent %W]; break }

            # Shift-Tab
            switch -- [_tk windowingsystem] {
                win32   { _bind $w.indicator <Shift-Tab> { ::tk::TabToWindow [tk_focusPrev [_winfo parent %W]]; break } }
                default {
                    _bind $w.indicator <ISO_Left_Tab> { ::tk::TabToWindow [tk_focusPrev [_winfo parent %W]]; break }

                    try {
                        _bind $w.indicator <hpBackTab> { ::tk::TabToWindow [tk_focusPrev [_winfo parent %W]]; break }
                    } on error {} {
                        # Do nothing.
                    }
                }
            }

            # Mousewheel and Touchpad

            # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.highlight <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }
            _bind $w.indicator <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }
            _bind $w.label     <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }

            # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.highlight <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }
            _bind $w.indicator <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }
            _bind $w.label     <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }

            # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one page up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.highlight <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }
            _bind $w.indicator <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }
            _bind $w.label     <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }

            # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one page left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.highlight <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }
            _bind $w.indicator <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }
            _bind $w.label     <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }

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
            _bind $w.highlight <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }
            _bind $w.indicator <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }
            _bind $w.label     <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }

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
            _bind $w.highlight <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }
            _bind $w.indicator <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }
            _bind $w.label     <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Configure the internal widget rows and columns.
            _grid rowconfigure $w [list 0] -weight 1
            _grid rowconfigure $w [list 1] -weight 0

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::radiobutton::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::radiobutton::Pathname_Cmd $w]
            }

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w.indicator

            # Set the structure addresses.
            set ::ms::addr($w,structure) [list $w \
                                               $w.highlight \
                                               $w.indicator \
                                               $w.label];

            # Add the widget address to the megawidget addresses list.
            lappend ::ms::addr(megawidgets) $w

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short addresses relative to its real address, 'w'.
            # They will all point to the widget hull object short address.
            set ::ms::addr($w,short)           $short_addr
            set ::ms::addr($w.indicator,short) $short_addr
            set ::ms::addr($w.label,short)     $short_addr
            set ::ms::addr($w.highlight,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals) $w \
                                      $w.highlight \
                                      $w.indicator \
                                      $w.label;

            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the radiobutton widgets real address list.
            lappend ::ms::addr(radiobutton) $w

            # Add the widget address to the radiobutton classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),radiobutton,addrs) $w

            # Add the widget address to the radiobutton classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),radiobutton,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the radiobutton classtype.
            if { $::ms::current($w,style) ni $::ms::style(radiobutton,classtype) } {
                lappend ::ms::style(radiobutton,classtype) $::ms::current($w,style)
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
proc ::ms::radiobutton::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        cget {
            # Synopsis:
            #
            # *window* **cget** *option*
            switch -- [llength $args] {
                0   { ::ms::Error "Missing cget option." $caller_info }
                1   {
                    # Check if the option provided is a valid 'styleable' or 'non-styleable' option.
                    set option [string range $args 1 end]
                    if { ($option in $::ms::radiobutton(non_styleable,options)) || ($option in $::ms::radiobutton(styleable,options))} {
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
                    foreach option $::ms::radiobutton(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::radiobutton(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::radiobutton(non_styleable,options)) || ($option in $::ms::radiobutton(styleable,options)) } {
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
                                    -charwidth {
                                        switch -- [string is integer -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,charwidth)    $value
                                        set ::ms::managed_by($w,charwidth) developer
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
                                    -indicatorforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,indicatorforeground)    $value
                                        set ::ms::managed_by($w,indicatorforeground) developer
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
                                            # If not, create one by mirroring the current theme 'TRadiobutton' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TRadiobutton]
                                            }

                                            # Remove the widget address from the radiobutton real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),radiobutton,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),radiobutton,addrs) [lremove $::ms::style($::ms::current($w,style),radiobutton,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,radiobutton,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the radiobutton classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),radiobutton,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(radiobutton,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(radiobutton,classtype) [lremove $::ms::style(radiobutton,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the radiobutton classtype.
                                            if { $value ni $::ms::style(radiobutton,classtype) } {
                                                lappend ::ms::style(radiobutton,classtype) $value
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
                                    -text { set ::ms::current($w,text) $value }
                                    -textvariable {
                                        switch -- [info exists $value] {
                                            1   { set ::ms::current($w,textvariable) $value }
                                        }
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
                                    -value { set ::ms::current($w,value) $value }
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

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::radiobutton(styleable,options) {
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

                            # Enable/Disable the widget automatic translation.
                            switch -- $::ms::current($w,textvariable) {
                                ""  {
                                    # Automatic translation: ON
                                    set ::ms::data($w,translated_text) [::msgcat::mc {*}$::ms::current($w,text)]
                                    set text_variable ::ms::data($w,translated_text)
                                }
                                default {
                                    # Automatic translation: OFF
                                    set text_variable $::ms::current($w,textvariable)
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

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

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

                            # Apply the changes.
                            interp invokehidden {} $w configure -cursor $cursor \
                                                                 -style $::ms::style($w,hull);

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

                            # Apply the changes.
                            $w.indicator configure   -command $::ms::current($w,command) \
                                                      -cursor $cursor \
                                                       -image $::ms::current($w,image) \
                                                       -state $::ms::current($w,state) \
                                                       -style $::ms::style($w,indicator) \
                                                   -takefocus $takefocus \
                                                       -value $::ms::current($w,value) \
                                                    -variable $::ms::current($w,variable);

                            _grid configure $w.indicator -padx [list $pad_left 0] \
                                                         -pady [list $pad_top 1m];

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

                            # Apply the changes.
                            $w.label configure       -cursor $cursor \
                                                       -font $::ms::current($w,font) \
                                                    -justify $::ms::current($w,justify) \
                                                      -state $::ms::current($w,state) \
                                                      -style $::ms::style($w,label) \
                                               -textvariable $text_variable \
                                                  -underline $::ms::current($w,underline) \
                                                      -width $::ms::current($w,charwidth) \
                                                 -wraplength $::ms::current($w,wraplength);

                            _grid configure $w.label -padx [list $::ms::current($w,spacer) $pad_right] \
                                                     -pady [list $pad_top 1m];

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

                            # Apply the changes.
                            $w.highlight configure -cursor $cursor \
                                                    -style $::ms::style($w,highlight);

                            _grid configure $w.highlight -padx [list $::ms::current($w,spacer) $pad_right] \
                                                         -pady [list 1m $pad_bottom];

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

                    # Return the name of the object, or an empty string if there are no checkbutton objects at the coordinates provided.
                    if { $widget eq $w } {
                        return "Radiobutton.hull"
                    } elseif { $widget eq "$w.indicator" } {
                        return "Radiobutton.indicator"
                    } elseif { $widget eq "$w.label" } {
                        return "Radiobutton.label"
                    } elseif { $widget eq "$w.highlight" } {
                        return "Radiobutton.highlight"
                    } else {
                        return ""
                    }
                }
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
        invoke {
            # Synopsis:
            #
            # *window* **invoke**
            switch -- $::ms::current($w,state) {
                normal {
                    # Execute the command.
                    try {
                        uplevel #0 [list $w.indicator invoke]
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                disabled { return "" }
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

                    # Propagate the new statespec to the hull, label, highlight and indicator objects of
                    # the radiobutton.
                    interp invokehidden {} $w state $statespec
                    $w.label state $statespec
                    $w.highlight state $statespec

                    return [$w.indicator state $statespec]
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
# Update any radiobutton widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::radiobutton::Style_Update { stylename caller_info } {
    # Update all the radiobutton widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,radiobutton,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::radiobutton(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TRadiobutton,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        # Check the widget state and set the cursor accordingly.
        switch -- $::ms::current($w,state) {
            disabled { set cursor arrow }
            normal   { set cursor $::ms::current($w,cursor) }
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

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

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

        # Apply the changes.
        interp invokehidden {} $w configure -cursor $cursor \
                                             -style $::ms::style($w,hull);

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

        # Apply the changes.
        $w.indicator configure -cursor $cursor \
                                -image $::ms::current($w,image) \
                                -style $::ms::style($w,indicator);

        _grid configure $w.indicator -padx [list $pad_left 0] \
                                     -pady [list $pad_top 1m];

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

        # Apply the changes.
        $w.label configure     -cursor $cursor \
                                 -font $::ms::current($w,font) \
                              -justify $::ms::current($w,justify) \
                                -style $::ms::style($w,label) \
                                -width $::ms::current($w,charwidth) \
                           -wraplength $::ms::current($w,wraplength);

        _grid configure $w.label -padx [list $::ms::current($w,spacer) $pad_right] \
                                 -pady [list $pad_top 1m];

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

        # Apply the changes.
        $w.highlight configure -cursor $cursor \
                                -style $::ms::style($w,highlight);

        _grid configure $w.highlight -padx [list $::ms::current($w,spacer) $pad_right] \
                                     -pady [list 1m $pad_bottom];
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*