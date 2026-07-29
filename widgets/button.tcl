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
package provide ::ms::button 0.1

##############################
##                          ##
##     _BUTTON BINDINGS     ##
##                          ##
##############################

# Activate/Deactivate
_bind _Button <Activate>   { ::ms::button::Pathname_Cmd %W state !background; break }
_bind _Button <Deactivate> { ::ms::button::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Button <ButtonPress-1> { ::ms::button::ButtonPress %W; break }

# Contextual menu
_bind _Button <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Button <Destroy> { ::ms::button::Destroy %W; break }

# Enter/Leave
_bind _Button <Enter> { ::ms::button::Pathname_Cmd %W state  hover; break }
_bind _Button <Leave> { ::ms::button::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Button <FocusIn>  { ::ms::button::Focus_In  %W; break }
_bind _Button <FocusOut> { ::ms::button::Focus_Out %W; break }

# Return/KP_Enter/space
_bind _Button <Return>   { ::ms::button::Invoke %W; break }
_bind _Button <KP_Enter> { ::ms::button::Invoke %W; break }
_bind _Button <space>    { ::ms::button::Invoke %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Button <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Button <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Button <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Button <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Button <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Button <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **button** package.
namespace eval ::ms::button {
    # Set the 'non styleable' button option list.
    set ::ms::button(non_styleable,options) [list class \
                                                  cmenu \
                                                  command \
                                                  default \
                                                  state \
                                                  style \
                                                  takefocus \
                                                  text \
                                                  textvariable \
                                                  underline];

    # Set the 'styleable' button option list.
    set ::ms::button(styleable,options) [list anchor \
                                              background \
                                              bordercolor \
                                              borderwidth \
                                              charwidth \
                                              compound \
                                              cursor \
                                              darkcolor \
                                              font \
                                              foreground \
                                              image \
                                              justify \
                                              lightcolor \
                                              padding \
                                              relief \
                                              shiftrelief];

    # Set the default 'non-styleable' button options values.
    set ::ms::default(button,class)        TButton
    set ::ms::default(button,cmenu)        {}
    set ::ms::default(button,command)      {}
    set ::ms::default(button,default)      normal
    set ::ms::default(button,state)        normal
    set ::ms::default(button,style)        TButton
    set ::ms::default(button,takefocus)    1
    set ::ms::default(button,text)         {}
    set ::ms::default(button,textvariable) {}
    set ::ms::default(button,underline)    -1

    # Note: The default 'styleable' button options values are always defined inside the current theme.
}

# Rename the original Tk **button** and **ttk::button** commands.
rename button      _button
rename ttk::button _ttk_button

# Create aliases for the mustang **button** command.
interp alias {} button      {} ::ms::button::Command
interp alias {} ttk::button {} ::ms::button::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::button** widget command.
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
proc ::ms::button::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(button,class)
            set ::ms::default($w,cmenu)        $::ms::default(button,cmenu)
            set ::ms::default($w,command)      $::ms::default(button,command)
            set ::ms::default($w,default)      $::ms::default(button,default)
            set ::ms::default($w,state)        $::ms::default(button,state)
            set ::ms::default($w,style)        $::ms::default(button,style)
            set ::ms::default($w,takefocus)    $::ms::default(button,takefocus)
            set ::ms::default($w,text)         $::ms::default(button,text)
            set ::ms::default($w,textvariable) $::ms::default(button,textvariable)
            set ::ms::default($w,underline)    $::ms::default(button,underline)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(button,class)
            set ::ms::current($w,cmenu)        $::ms::default(button,cmenu)
            set ::ms::current($w,command)      $::ms::default(button,command)
            set ::ms::current($w,default)      $::ms::default(button,default)
            set ::ms::current($w,state)        $::ms::default(button,state)
            set ::ms::current($w,style)        $::ms::default(button,style)
            set ::ms::current($w,takefocus)    $::ms::default(button,takefocus)
            set ::ms::current($w,text)         $::ms::default(button,text)
            set ::ms::current($w,textvariable) $::ms::default(button,textvariable)
            set ::ms::current($w,underline)    $::ms::default(button,underline)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) button

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
            #       To make a button styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **button** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,anchor)      Tk
            set ::ms::managed_by($w,background)  Tk
            set ::ms::managed_by($w,bordercolor) Tk
            set ::ms::managed_by($w,borderwidth) Tk
            set ::ms::managed_by($w,charwidth)   Tk
            set ::ms::managed_by($w,compound)    Tk
            set ::ms::managed_by($w,cursor)      Tk
            set ::ms::managed_by($w,darkcolor)   Tk
            set ::ms::managed_by($w,font)        Tk
            set ::ms::managed_by($w,foreground)  Tk
            set ::ms::managed_by($w,image)       Tk
            set ::ms::managed_by($w,justify)     Tk
            set ::ms::managed_by($w,lightcolor)  Tk
            set ::ms::managed_by($w,padding)     Tk
            set ::ms::managed_by($w,relief)      Tk
            set ::ms::managed_by($w,shiftrelief) Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -anchor {
                        set value [string tolower $value]
                        switch -- $value {
                            center -
                            e      -
                            n      -
                            ne     -
                            nw     -
                            s      -
                            se     -
                            sw     -
                            w      {
                                set ::ms::current($w,anchor)    $value
                                set ::ms::managed_by($w,anchor) developer
                            }
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
                    -compound {
                        set value [string tolower $value]
                        switch -- $value {
                            bottom -
                            center -
                            image  -
                            left   -
                            none   -
                            right  -
                            text   -
                            top    {
                                set ::ms::current($w,compound)    $value
                                set ::ms::managed_by($w,compound) developer
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
                    -darkcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,darkcolor)    $value
                        set ::ms::managed_by($w,darkcolor) developer
                    }
                    -default {
                        set value [string tolower $value]
                        switch -- $value {
                            active   -
                            disabled -
                            normal   { set ::ms::current($w,default) $value }
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
                    -image {
                        switch -- [::ms::Check_Image $value] {
                            invalid { continue }
                        }

                        set ::ms::current($w,image)    $value
                        set ::ms::managed_by($w,image) developer
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
                    -shiftrelief {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,shiftrelief)    $value
                        set ::ms::managed_by($w,shiftrelief) developer
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
                            # If not, create one by mirroring the current theme 'TButton' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TButton]
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
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::button(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TButton,$option)

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
            # This is not strictly needed for buttons, it's here mostly for coherence with the other widgets.
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

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'anchor', 'borderwidth', 'charwidth', 'compound', 'cursor', 'font', 'justify', padding' and
            #       'shiftrelief' are not allowed to change if the statespec changes.

            ####################
            ##                ##
            ##     BUTTON     ##
            ##                ##
            ####################

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_an="  $::ms::current($w,anchor) \
                                                   "_bg="  $::ms::current($w,background) \
                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                   "_bw="  $::ms::current($w,borderwidth) \
                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                   "_fn="  $::ms::current($w,font) \
                                                   "_fg="  $::ms::current($w,foreground) \
                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                   "_rl="  $::ms::current($w,relief) \
                                                   "_srl=" $::ms::current($w,shiftrelief) \
                                                   "." $::ms::current($w,style)];

            # If needed, create the widget style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)      -anchor $::ms::current($w,anchor) \
                                                              -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                             -borderwidth $::ms::current($w,borderwidth) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                                    -font $::ms::current($w,font) \
                                                              -foreground $::ms::current($w,foreground) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                                  -relief $::ms::current($w,relief) \
                                                             -shiftrelief $::ms::current($w,shiftrelief);

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

            # relief
            switch -- $::ms::managed_by($w,relief) {
                developer { lappend mapping -relief [list pressed $::ms::current($w,relief)] }
                Tk  {
                    # Check if a 'relief' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),relief)] {
                        1   { lappend mapping -relief $::ms::stylemap($::ms::theme,$::ms::current($w,style),relief) }
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

            # Create the button widget.
            _ttk_button $w        -class $::ms::current($w,class) \
                                -command $::ms::current($w,command) \
                               -compound $::ms::current($w,compound) \
                                 -cursor $cursor \
                                -default $::ms::current($w,default) \
                                  -image $::ms::current($w,image) \
                                -justify $::ms::current($w,justify) \
                                -padding $::ms::current($w,padding) \
                                  -state $::ms::current($w,state) \
                                  -style $::ms::style($w,widget) \
                              -takefocus $takefocus \
                                   -text "" \
                           -textvariable $textvariable \
                              -underline $::ms::current($w,underline) \
                                  -width $::ms::current($w,charwidth)

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TButton { bindtags $w [list $w _Button TButton $::ms::addr($w,toplevel) all] }
                default { bindtags $w [list $w $::ms::current($w,class) _Button TButton $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::button::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::button::Pathname_Cmd $w]
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

            # Add the widget address to the button widgets real address list.
            lappend ::ms::addr(button) $w

            # Add the widget address to the button real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),button,addrs) $w

            # Add the widget address to the button real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),button,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the button classtype.
            if { $::ms::current($w,style) ni $::ms::style(button) } {
                lappend ::ms::style(button) $::ms::current($w,style)
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
proc ::ms::button::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::button(non_styleable,options)) || ($option in $::ms::button(styleable,options))} {
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
                    foreach option $::ms::button(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::button(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::button(non_styleable,options)) || ($option in $::ms::button(styleable,options)) } {
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
                                    -anchor {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            center -
                                            e      -
                                            n      -
                                            ne     -
                                            nw     -
                                            s      -
                                            se     -
                                            sw     -
                                            w      {
                                                set ::ms::current($w,anchor)    $value
                                                set ::ms::managed_by($w,anchor) developer
                                            }
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
                                    -compound {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            bottom -
                                            center -
                                            image  -
                                            left   -
                                            none   -
                                            right  -
                                            text   -
                                            top    {
                                                set ::ms::current($w,compound)    $value
                                                set ::ms::managed_by($w,compound) developer
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
                                    -darkcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,darkcolor)    $value
                                        set ::ms::managed_by($w,darkcolor) developer
                                    }
                                    -default {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            active   -
                                            disabled -
                                            normal   { set ::ms::current($w,default) $value }
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
                                    -image {
                                        switch -- [::ms::Check_Image $value] {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,image)    $value
                                        set ::ms::managed_by($w,image) developer
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
                                    -shiftrelief {
                                        switch -- [string is integer -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,shiftrelief)    $value
                                        set ::ms::managed_by($w,shiftrelief) developer
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
                                            # If not, create one by mirroring the current theme 'TButton' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TButton]
                                            }

                                            # Remove the widget address from the button real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),button,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),button,addrs) [lremove $::ms::style($::ms::current($w,style),button,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,button,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the button classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),button,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(button) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(button) [lremove $::ms::style(button) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the button classtype.
                                            if { $value ni $::ms::style(button) } {
                                                lappend ::ms::style(button) $value
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
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::button(styleable,options) {
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
                            # This is not strictly needed for buttons, it's here mostly for coherence with the other widgets.
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

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'anchor', 'borderwidth', 'charwidth', 'compound', 'cursor', 'font', 'justify', padding' and
                            #       'shiftrelief' are not allowed to change if the statespec changes.

                            ####################
                            ##                ##
                            ##     BUTTON     ##
                            ##                ##
                            ####################

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_an="  $::ms::current($w,anchor) \
                                                                   "_bg="  $::ms::current($w,background) \
                                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                                   "_bw="  $::ms::current($w,borderwidth) \
                                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                                   "_fn="  $::ms::current($w,font) \
                                                                   "_fg="  $::ms::current($w,foreground) \
                                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                                   "_rl="  $::ms::current($w,relief) \
                                                                   "_srl=" $::ms::current($w,shiftrelief) \
                                                                   "." $::ms::current($w,style)];

                            # If needed, create the widget style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)      -anchor $::ms::current($w,anchor) \
                                                                              -background $::ms::current($w,background) \
                                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                                             -borderwidth $::ms::current($w,borderwidth) \
                                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                                                    -font $::ms::current($w,font) \
                                                                              -foreground $::ms::current($w,foreground) \
                                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                                                  -relief $::ms::current($w,relief) \
                                                                             -shiftrelief $::ms::current($w,shiftrelief);

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

                            # relief
                            switch -- $::ms::managed_by($w,relief) {
                                developer { lappend mapping -relief [list pressed $::ms::current($w,relief)] }
                                Tk  {
                                    # Check if a 'relief' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),relief)] {
                                        1   { lappend mapping -relief $::ms::stylemap($::ms::theme,$::ms::current($w,style),relief) }
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
                            interp invokehidden {} $w configure      -command $::ms::current($w,command) \
                                                                    -compound $::ms::current($w,compound) \
                                                                      -cursor $cursor \
                                                                     -default $::ms::current($w,default) \
                                                                       -image $::ms::current($w,image) \
                                                                     -justify $::ms::current($w,justify) \
                                                                     -padding $::ms::current($w,padding) \
                                                                       -state $::ms::current($w,state) \
                                                                       -style $::ms::style($w,widget) \
                                                                   -takefocus $takefocus \
                                                                        -text "" \
                                                                -textvariable $textvariable \
                                                                   -underline $::ms::current($w,underline) \
                                                                       -width $::ms::current($w,charwidth);

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
            try {
                interp invokehidden {} $w $cmd {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
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
        invoke {
            # Synopsis:
            #
            # *window* **invoke**
            try {
                uplevel #0 [list interp invokehidden {} $w invoke]
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
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
# Update any button widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::button::Style_Update { stylename caller_info } {
    # Update all the button widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,button,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::button(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TButton,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        # Check the widget state and set the relative cursor.
        # This is not strictly needed for buttons, it's here mostly for coherence with the other widgets.
        switch -- $::ms::current($w,state) {
            disabled { set cursor arrow }
            normal   { set cursor $::ms::current($w,cursor) }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'anchor', 'borderwidth', 'charwidth', 'compound', 'cursor', 'font', 'justify', padding' and
        #       'shiftrelief' are not allowed to change if the statespec changes.

        ####################
        ##                ##
        ##     BUTTON     ##
        ##                ##
        ####################

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_an="  $::ms::current($w,anchor) \
                                               "_bg="  $::ms::current($w,background) \
                                               "_bc="  $::ms::current($w,bordercolor) \
                                               "_bw="  $::ms::current($w,borderwidth) \
                                               "_dc="  $::ms::current($w,darkcolor) \
                                               "_fn="  $::ms::current($w,font) \
                                               "_fg="  $::ms::current($w,foreground) \
                                               "_lc="  $::ms::current($w,lightcolor) \
                                               "_rl="  $::ms::current($w,relief) \
                                               "_srl=" $::ms::current($w,shiftrelief) \
                                               "." $stylename];

        # If needed, create the widget style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)      -anchor $::ms::current($w,anchor) \
                                                          -background $::ms::current($w,background) \
                                                         -bordercolor $::ms::current($w,bordercolor) \
                                                         -borderwidth $::ms::current($w,borderwidth) \
                                                           -darkcolor $::ms::current($w,darkcolor) \
                                                                -font $::ms::current($w,font) \
                                                          -foreground $::ms::current($w,foreground) \
                                                          -lightcolor $::ms::current($w,lightcolor) \
                                                              -relief $::ms::current($w,relief) \
                                                         -shiftrelief $::ms::current($w,shiftrelief);

            # Add the widget style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
        }

        # Initialize the widget mapping.
        set mapping [list ]

        # background
        switch -- $::ms::managed_by($w,background) {
            developer { lappend mapping -background [list pressed $::ms::current($w,background)] }
            Tk  {
                # Check if a 'background' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,background)] {
                    1   { lappend mapping -background $::ms::stylemap($::ms::theme,$stylename,background) }
                }
            }
        }

        # bordercolor
        switch -- $::ms::managed_by($w,bordercolor) {
            developer { lappend mapping -bordercolor [list pressed $::ms::current($w,bordercolor)] }
            Tk  {
                # Check if a 'bordercolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,bordercolor)] {
                    1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$stylename,bordercolor) }
                }
            }
        }

        # darkcolor
        switch -- $::ms::managed_by($w,darkcolor) {
            developer { lappend mapping -darkcolor [list pressed $::ms::current($w,darkcolor)] }
            Tk  {
                # Check if a 'darkcolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,darkcolor)] {
                    1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$stylename,darkcolor) }
                }
            }
        }

        # foreground
        switch -- $::ms::managed_by($w,foreground) {
            developer { lappend mapping -foreground [list pressed $::ms::current($w,foreground)] }
            Tk  {
                # Check if a 'foreground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,foreground)] {
                    1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$stylename,foreground) }
                }
            }
        }

        # lightcolor
        switch -- $::ms::managed_by($w,lightcolor) {
            developer { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
            Tk  {
                # Check if a 'lightcolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,lightcolor)] {
                    1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$stylename,lightcolor) }
                }
            }
        }

        # relief
        switch -- $::ms::managed_by($w,relief) {
            developer { lappend mapping -relief [list pressed $::ms::current($w,relief)] }
            Tk  {
                # Check if a 'relief' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,relief)] {
                    1   { lappend mapping -relief $::ms::stylemap($::ms::theme,$stylename,relief) }
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
        interp invokehidden {} $w configure -compound $::ms::current($w,compound) \
                                              -cursor $cursor \
                                               -image $::ms::current($w,image) \
                                             -justify $::ms::current($w,justify) \
                                             -padding $::ms::current($w,padding) \
                                               -style $::ms::style($w,widget) \
                                               -width $::ms::current($w,charwidth)
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*