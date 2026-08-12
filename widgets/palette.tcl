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
package provide ::ms::palette 0.1

###############################
##                           ##
##     _PALETTE BINDINGS     ##
##                           ##
###############################

# Activate/Deactivate
_bind _Palette <Activate>   { ::ms::palette::Pathname_Cmd %W state !background; break }
_bind _Palette <Deactivate> { ::ms::palette::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Palette <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Palette <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Palette <Destroy> { ::ms::palette::Destroy %W; break }

# Enter
_bind _Palette <Enter> { ::ms::palette::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Palette <FocusIn>  { ::ms::palette::FocusIn  %W; break }
_bind _Palette <FocusOut> { ::ms::palette::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, don't do anything.
_bind _Palette <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, don't do anything.
_bind _Palette <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Palette <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Palette <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

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
_bind _Palette <TouchpadScroll> { ::ms::palette::Touchpad %W %# %D; break }

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
_bind _Palette <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **palette** package.
namespace eval ::ms::palette {
    # Set the 'non styleable' palette option list.
    set ::ms::palette(non_styleable,options) [list class \
                                                   cmenu \
                                                   command \
                                                   exportselection \
                                                   maxlength \
                                                   placeholder \
                                                   posthook \
                                                   prehook \
                                                   state \
                                                   style \
                                                   takefocus \
                                                   textvariable \
                                                   values \
                                                   xscrollcommand];

    # Set the 'styleable' palette option list.
    set ::ms::palette(styleable,options) [list arrowcolor \
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
                                               selectforeground \
                                               shellbackground];

    # Set the default 'non-styleable' palette options values.
    set ::ms::default(palette,class)           TPalette
    set ::ms::default(palette,cmenu)           {}
    set ::ms::default(palette,command)         {}
    set ::ms::default(palette,exportselection) 1
    set ::ms::default(palette,maxlength)       0
    set ::ms::default(palette,placeholder)     {}
    set ::ms::default(palette,posthook)        {}
    set ::ms::default(palette,prehook)         {}
    set ::ms::default(palette,state)           normal
    set ::ms::default(palette,style)           TPalette
    set ::ms::default(palette,takefocus)       1
    set ::ms::default(palette,textvariable)    {}
    set ::ms::default(palette,values)          [list Azure       #0080ff \
                                                     Blue        #0000ff \
                                                     Brown       #964b00 \
                                                     Cyan        #00ffff \
                                                     Green       #00ff00 \
                                                     Lime        #c0ff00 \
                                                     Magenta     #ff00ff \
                                                     "Navy Blue" #000080 \
                                                     Orange      #ffa500 \
                                                     Pink        #ff0080 \
                                                     Purple      #800080 \
                                                     Red         #ff0000 \
                                                     Violet      #8000ff \
                                                     Yellow      #ffff00];
    set ::ms::default(palette,xscrollcommand)  {}
}

# Create aliases for the mustang **palette** command.
interp alias {} palette {} ::ms::palette::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Create the **palette** widgets command.
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
proc ::ms::palette::Command { window { args "" } } {
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
            set ::ms::default($w,class)           $::ms::default(palette,class)
            set ::ms::default($w,cmenu)           $::ms::default(palette,cmenu)
            set ::ms::default($w,command)         $::ms::default(palette,command)
            set ::ms::default($w,exportselection) $::ms::default(palette,exportselection)
            set ::ms::default($w,maxlength)       $::ms::default(palette,maxlength)
            set ::ms::default($w,placeholder)     $::ms::default(palette,placeholder)
            set ::ms::default($w,posthook)        $::ms::default(palette,posthook)
            set ::ms::default($w,prehook)         $::ms::default(palette,prehook)
            set ::ms::default($w,state)           $::ms::default(palette,state)
            set ::ms::default($w,style)           $::ms::default(palette,style)
            set ::ms::default($w,takefocus)       $::ms::default(palette,takefocus)
            set ::ms::default($w,textvariable)    $::ms::default(palette,textvariable)
            set ::ms::default($w,values)          $::ms::default(palette,values)
            set ::ms::default($w,xscrollcommand)  $::ms::default(palette,xscrollcommand)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)           $::ms::default(palette,class)
            set ::ms::current($w,cmenu)           $::ms::default(palette,cmenu)
            set ::ms::current($w,command)         $::ms::default(palette,command)
            set ::ms::current($w,exportselection) $::ms::default(palette,exportselection)
            set ::ms::current($w,maxlength)       $::ms::default(palette,maxlength)
            set ::ms::current($w,placeholder)     $::ms::default(palette,placeholder)
            set ::ms::current($w,posthook)        $::ms::default(palette,posthook)
            set ::ms::current($w,prehook)         $::ms::default(palette,prehook)
            set ::ms::current($w,state)           $::ms::default(palette,state)
            set ::ms::current($w,style)           $::ms::default(palette,style)
            set ::ms::current($w,takefocus)       $::ms::default(palette,takefocus)
            set ::ms::current($w,textvariable)    $::ms::default(palette,textvariable)
            set ::ms::current($w,values)          $::ms::default(palette,values)
            set ::ms::current($w,xscrollcommand)  $::ms::default(palette,xscrollcommand)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)    palette
            set ::ms::data($w,colornames)   [list ]
            set ::ms::data($w,hexadecimals) [list ]

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
            #       To make a palette styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **palette** *window* **-background** red
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
            set ::ms::managed_by($w,shellbackground)       Tk

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
                    -shellbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,shellbackground)    $value
                        set ::ms::managed_by($w,shellbackground) developer
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
                            # If not, create one by mirroring the current theme 'TPalette' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TPalette]
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
                                          write    [list ::ms::palette::Return $w]
                            }
                        }
                    }
                    -values { set ::ms::current($w,values) $value }
                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::palette(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TPalette,$option)

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

            # If the maxlength is not zero check that the charwidth is not less of it.
            switch -- $::ms::current($w,maxlength) {
                0       {}
                default {
                    if { $::ms::current($w,charwidth) < $::ms::current($w,maxlength) } {
                        set ::ms::current($w,charwidth) $::ms::current($w,maxlength)
                    }

                    # Ignore the xscrollcommand provided, if any.
                    set ::ms::current($w,xscrollcommand) {}
                }
            }

            # Check that the values provided forms a valid list of values (they must be divisible by two).
            set value_length [llength $::ms::current($w,values)]
            switch -- [expr { $value_length%2 }] {
                0   {
                    # Check if an empty list was provided.
                    switch -- $value_length {
                        0   {
                            set ::ms::current($w,values) $::ms::default(palette,values)

                            # Initialize the colornames and hexadecimal lists.
                            set ::ms::data($w,colornames)   [list ]
                            set ::ms::data($w,hexadecimals) [list ]

                            # Add the colorname and its hexadecimal value in their relative lists.
                            foreach { colorname hex } $values {
                                lappend ::ms::data($w,colornames)   $colorname
                                lappend ::ms::data($w,hexadecimals) $hex
                            }
                        }
                        default {
                            # Sort the values.
                            set values [lsort -dictionary -stride 2 -index 0 $::ms::current($w,values)]

                            # Initialize the colornames and hexadecimal lists.
                            set ::ms::data($w,colornames)   [list ]
                            set ::ms::data($w,hexadecimals) [list ]

                            # Check the value list.
                            foreach { colorname hex } $values {
                                # Check every character in colorname.
                                set i 0
                                while { $i < [string length $colorname] } {
                                    set char [string index $colorname $i]
                                    switch -- $char {
                                        " "     -
                                        "-"     {}
                                        default {
                                            switch -- [string is alnum $char] {
                                                0   { ::ms::Error "'$colorname' is not a valid colorname." $caller_info }
                                            }
                                        }
                                    }

                                    incr i
                                }

                                # Check the hexadecimal color value.
                                set hex [::ms::Check_Color $hex invalid]
                                switch -- $hex {
                                    invalid { ::ms::Error "'$hex' is not a valid hexadecimal color." $caller_info }
                                }

                                # Add the colorname and its hexadecimal value in their relative lists.
                                lappend ::ms::data($w,colornames)   $colorname
                                lappend ::ms::data($w,hexadecimals) $hex
                            }
                        }
                    }

                    # Set the current index as the first one of the colorname list.
                    set ::ms::data($w,current_index) 0

                    # Set the current colorname value.
                    set ::ms::data($w,current_value) [lindex $::ms::data($w,colornames) $::ms::data($w,current_index)]

                    # Set the current hexadecimal value.
                    set ::ms::data($w,current_hex) [lindex $::ms::data($w,hexadecimals) $::ms::data($w,current_index)]

                    # Set the last available index.
                    set ::ms::data($w,last_available_index) [expr { [llength $::ms::data($w,colornames)]-1 }]

                    # Set the lowercase '::ms::data($w,colornames)' list.
                    set ::ms::data($w,colornames,lowercase) [string tolower $::ms::data($w,colornames)]
                }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', insertwidth', 'justify',
            #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

            ##################
            ##              ##
            ##     HULL     ##
            ##              ##
            ##################

            # Set the hull object style.
            set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                 ".TFrame"];

            # If needed, create the hull object style.
            if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,shellbackground)

                # Add the hull object style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
            }

            # Initialize the hull object mapping.
            set mapping [list ]

            # shellbackground
            switch -- $::ms::managed_by($w,shellbackground) {
                developer { lappend mapping -background [list pressed $::ms::current($w,shellbackground)] }
                Tk  {
                    # Check if a 'shellbackground' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground)] {
                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground) }
                    }
                }
            }

            # If needed, create the hull object mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,hull) {*}$mapping

                # Add the hull object mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the hull object.
            _ttk_frame $w -borderwidth 0 \
                                -class TFrame \
                               -cursor arrow \
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
            ##     COMBOBOX      ##
            ##                   ##
            #######################

            # Agglomerate the padding values.
            set padding ""
            foreach pad $::ms::current($w,padding) {
                append padding "$pad" "-"
            }
            set padding [string trimright $padding "-"]

            # Set the widget style.
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

            # If needed, create the widget style.
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

                # Add the widget object style name to the theme styles list created by mustang.
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

            # Create the palette widget.
            _ttk_combobox $w.combobox           -class $::ms::current($w,class) \
                                               -cursor $cursor \
                                      -exportselection $::ms::current($w,exportselection) \
                                                 -font $::ms::current($w,font) \
                                       -invalidcommand {} \
                                               -height $::ms::current($w,rows) \
                                              -justify $::ms::current($w,justify) \
                                          -placeholder $::ms::current($w,placeholder) \
                                          -postcommand {} \
                                                 -show "" \
                                                -state $::ms::current($w,state) \
                                                -style $::ms::style($w,widget) \
                                            -takefocus $takefocus \
                                         -textvariable $::ms::current($w,textvariable) \
                                             -validate key \
                                      -validatecommand [list ::ms::palette::Validate_KeyPress $w %P] \
                                               -values $::ms::data($w,colornames) \
                                                -width $::ms::current($w,charwidth) \
                                       -xscrollcommand $::ms::current($w,xscrollcommand);

            # Set the current index in the combobox object.
            $w.combobox current $::ms::data($w,current_index)

            # Set the cursor at the end of the combobox textarea.
            $w.combobox icursor end

            # Pack the combobox object.
            pack $w.combobox -expand true \
                               -fill x \
                               -padx [list 0 3p] \
                               -pady 0 \
                               -side left;

            ######################
            ##                  ##
            ##     PREVIEW      ##
            ##                  ##
            ######################

            # Set the bordercolor of the preview object (black or white).
            switch -- [string length $::ms::data($w,current_hex)] {
                10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
                13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
                default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
            }

            # Create the preview object.
            _frame $w.preview          -background $::ms::data($w,current_hex) \
                                  -backgroundimage "" \
                                      -borderwidth 0 \
                                            -class Frame \
                                         -colormap "" \
                                        -container 0 \
                                           -cursor arrow \
                                           -height $::ms::styleopt($::ms::theme,Preview,height) \
                              -highlightbackground $bordercolor \
                                   -highlightcolor $bordercolor \
                               -highlightthickness $::ms::styleopt($::ms::theme,Preview,borderwidth) \
                                             -padx 0 \
                                             -pady 0 \
                                           -relief flat \
                                        -takefocus 0 \
                                             -tile 0 \
                                           -visual "" \
                                            -width $::ms::styleopt($::ms::theme,Preview,width);

            # Pack the preview object.
            pack $w.preview -expand false \
                              -fill none \
                              -padx [list 3p 0] \
                              -pady 0 \
                              -side left;

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TPalette { bindtags $w [list $w _Palette TPalette $::ms::addr($w,toplevel) all] }
                default  { bindtags $w [list $w $::ms::current($w,class) _Palette TPalette $::ms::addr($w,toplevel) all] }
            }

            # Buttonpress-1
            _bind $w.combobox <ButtonPress-1>        { ::ms::palette::ButtonPress [_winfo parent %W] %x %y "" ; break }
            _bind $w.combobox <Shift-ButtonPress-1>  { ::ms::palette::ButtonPress [_winfo parent %W] %x %y "s"; break }
            _bind $w.combobox <Double-ButtonPress-1> { ::ms::palette::ButtonPress [_winfo parent %W] %x %y "2"; break }
            _bind $w.combobox <Triple-ButtonPress-1> { ::ms::palette::ButtonPress [_winfo parent %W] %x %y "3"; break }
            _bind $w.combobox <B1-Motion>            { ::ms::Drag %W %x %y; break }

            _bind $w.preview  <ButtonPress-1>        { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }

            _bind $w.combobox <Button-2>         { ::ms::Scan_Or_Paste %W %x "Button-2"; break }
            _bind $w.combobox <B2-Motion>        { ::ms::Scan_Or_Paste %W %x "B2-Motion"; break }
            _bind $w.combobox <ButtonRelease-2>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-2"; break }

            _bind $w.combobox <Button-3>         { ::ms::Scan_Or_Paste %W %x "Button-3"; break }
            _bind $w.combobox <B3-Motion>        { ::ms::Scan_Or_Paste %W %x "B3-Motion"; break }
            _bind $w.combobox <ButtonRelease-3>  { ::ms::Scan_Or_Paste %W %x "ButtonRelease-3"; break }

            # Contextual menu
            _bind $w.combobox <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }
            _bind $w.preview  <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }

            # ClearCopy/Cut/Paste
            _bind $w.combobox <<Clear>> { ::ms::Clear [winfo parent %W]; break }
            _bind $w.combobox <<Copy>>  { ::ms::Copy  [winfo parent %W]; break }
            _bind $w.combobox <<Cut>>   { ::ms::Cut   [winfo parent %W]; break }
            _bind $w.combobox <<Paste>> { ::ms::Paste [winfo parent %W] CLIPBOARD; break }

            # Cursor management.
            _bind $w.combobox <Motion> { ::ms::Set_Cursor %W %x %y; break }

            # Enter/Leave
            _bind $w.combobox <Enter> { ::ms::palette::Pathname_Cmd [_winfo parent %W] state  hover; break }
            _bind $w.combobox <Leave> { ::ms::palette::Pathname_Cmd [_winfo parent %W] state !hover; break }

            # FocusIn/FocusOut
            _bind $w.combobox <FocusIn>  { ::ms::palette::FocusIn  [_winfo parent %W]; break }
            _bind $w.combobox <FocusOut> { ::ms::palette::FocusOut [_winfo parent %W]; break }

            # Enable only the keypress bindings that are needed and disable everything else.
            _bind $w.combobox <KeyPress> {
                switch -- %A {
                    Caps_Lock   -
                    KP_Subtract {}
                    default     {
                        if { ![regexp "\[0-9a-zA-Z \-\]" %A] } {
                            break
                        }
                    }
                }

                ::ttk::entry::Insert %W %A

                break
            }

            # Re-enable some keys.
            _bind $w.combobox <KeyPress-space>       { ::ttk::entry::Insert %W " "; break }
            _bind $w.combobox <KeyPress-Caps_Lock>   { # Enable binding }
            _bind $w.combobox <KeyPress-KP_Subtract> { ::ttk::entry::Insert %W "-"; break }

            # Insert cursor movements.
            _bind $w.combobox <<LineEnd>>   { ::ttk::entry::Move %W end; break }
            _bind $w.combobox <<LineStart>> { ::ttk::entry::Move %W home; break }
            _bind $w.combobox <<NextChar>>  { ::ttk::entry::Move %W nextchar; break }
            _bind $w.combobox <<NextLine>>  { ::ms::palette::Post [_winfo parent %W]; break }
            _bind $w.combobox <<NextWord>>  { ::ttk::entry::Move %W nextword; break }
            _bind $w.combobox <<PrevChar>>  { ::ttk::entry::Move %W prevchar; break }
            _bind $w.combobox <<PrevWord>>  { ::ttk::entry::Move %W prevword; break }

            _bind $w.combobox <<SelectLineEnd>>   { ::ttk::entry::Extend %W end; break }
            _bind $w.combobox <<SelectLineStart>> { ::ttk::entry::Extend %W home; break }
            _bind $w.combobox <<SelectNextChar>>  { ::ttk::entry::Extend %W nextchar; break }
            _bind $w.combobox <<SelectNextWord>>  { ::ttk::entry::Extend %W selectnextword; break }
            _bind $w.combobox <<SelectPrevChar>>  { ::ttk::entry::Extend %W prevchar; break }
            _bind $w.combobox <<SelectPrevWord>>  { ::ttk::entry::Extend %W prevword; break }

            _bind $w.combobox <<SelectAll>>  { %W selection range 0 end; break }
            _bind $w.combobox <<SelectNone>> { %W selection clear; break }

            # Backspace/Delete keys
            _bind $w.combobox <KeyPress-BackSpace> { ::ttk::entry::Backspace %W; break }
            _bind $w.combobox <KeyPress-Delete>    { ::ttk::entry::Delete %W; break }
            _bind $w.combobox <KeyPress-KP_Delete> { ::ttk::entry::Delete %W; break }

            # Escape
            _bind $w.combobox <KeyPress-Escape> { ::ms::Escape %W; break }

            # F keys
            _bind $w.combobox <Fn-KeyPress> { # Enable binding }

            # Return
            _bind $w.combobox <KeyPress-Return>   { ::ms::palette::Return [_winfo parent %W]; break }
            _bind $w.combobox <KeyPress-KP_Enter> { ::ms::palette::Return [_winfo parent %W]; break }

            # Tab/Shift-Tab keys
            _bind $w.combobox <KeyPress-Tab> { # Enable binding }
            switch -- [_tk windowingsystem] {
                x11 {
                    _bind $w.combobox <KeyPress-ISO_Left_Tab> { # Enable binding }

                    # This seems to be correct on *some* HP systems.
                    catch { _bind $w.combobox <KeyPress-hpBackTab> { # Enable binding } }
                }
                aqua  { _bind $w.combobox <KeyPress-ISO_Left_Tab> { # Enable binding } }
                win32 { _bind $w.combobox <Shift-KeyPress-Tab>    { # Enable binding } }
            }

            # Enabling window traversal navigation.
            _bind $w.combobox <<PageLeft>>  { # Enable binding }
            _bind $w.combobox <<PageRight>> { # Enable binding }
            _bind $w.combobox <<PageUp>>    { # Enable binding }
            _bind $w.combobox <<PageDown>>  { # Enable binding }

            # Allowing some modifiers combination.
            _bind $w.combobox <Alt-KeyPress>           { # Enable binding }
            _bind $w.combobox <Alt-Shift-KeyPress>     { # Enable binding }
            _bind $w.combobox <Control-KeyPress>       { # Enable binding }
            _bind $w.combobox <Control-Alt-KeyPress>   { # Enable binding }
            _bind $w.combobox <Control-Shift-KeyPress> { # Enable binding }
            _bind $w.combobox <Meta-KeyPress>          { # Enable binding }
            _bind $w.combobox <Meta-Shift-KeyPress>    { # Enable binding }

            # Note: At this point we have every keypress disabled except the ones allowed and the ones that were re-enabled.

            # Mousewheel and Touchpad

            # If the widget is in its **normal** or **readonly** state and the items list is not empty, scroll the items
            # list without displaying the popdown window, otherwise try to find the innermost widget's scrollable parent
            # with an active vertical scrollbar and move that scrollbar by one unit up or down (depending on the
            # mousewheel direction). If none of the widget's parents meets the required condition, nothing will happen.
            _bind $w.combobox <MouseWheel> [list ::ms::palette::MouseWheel $w %D]

            # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
            # If none of the widget's parents meets the required condition, don't do anything.
            _bind $w.preview <MouseWheel> [list ::ms::Scroll_Parent_Y $w %D units]

            # If the widget is in its **normal** state and has the focus, move the insert cursor by one character
            # towards the left or the right (depending on the direction of the mousewheel event), otherwise try to
            # find the innermost widget's scrollable parent with an active horizontal scrollbar and move that scrollbar
            # by one unit left or right (again, depending on the mousewheel direction).
            # If none of the widget's parents meets the required condition, nothing will happen.
            _bind $w.combobox <Shift-MouseWheel> [list ::ms::palette::Shift_MouseWheel $w %D]

            # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
            # If none of the widget's parents meets the required condition, don't do anything.
            _bind $w.preview <Shift-MouseWheel> [list ::ms::Scroll_Parent_X $w %D units]

            # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one page up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.combobox <Control-MouseWheel> [list ::ms::Scroll_Parent_Y $w %D pages]
            _bind $w.preview  <Control-MouseWheel> [list ::ms::Scroll_Parent_Y $w %D pages]

            # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one page left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.combobox <Control-Shift-MouseWheel> [list ::ms::Scroll_Parent_X $w %D pages]
            _bind $w.preview  <Control-Shift-MouseWheel> [list ::ms::Scroll_Parent_X $w %D pages]

            # Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
            #       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

            # This binding movement will happen on two different planes, horizontal and vertical.
            # These two planes may involve different widgets depending on the active scrollbars on them and on the
            # touchpad direction.
            #   1 - View the '$w.combobox' **Mousewheel** event.
            #   2 - View the '$w.combobox' **Shift-Mousewheel** event.
            _bind $w.combobox <TouchpadScroll> [list ::ms::palette::Touchpad $w %# %D]

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
            _bind $w.preview <TouchpadScroll> [list ::ms::palette::Touchpad $w %# %D]

            # This binding movement will happen on two different planes, horizontal and vertical.
            # These two planes may involve different widgets depending on the active scrollbars on them and on the
            # touchpad direction.
            #   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            #       and move that scrollbar by one page left or right (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
            #
            #   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
            #       and move that scrollbar by one page up or down (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
            _bind $w.combobox <Control-TouchpadScroll> [list ::ms::Touchpad_Parent $w %# %D pages]
            _bind $w.preview  <Control-TouchpadScroll> [list ::ms::Touchpad_Parent $w %# %D pages]

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::palette::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::palette::Pathname_Cmd $w]
            }

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w.combobox

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w.combobox

            # Set the structure addresses.
            set ::ms::addr($w,structure) [list $w \
                                               $w.preview \
                                               $w.combobox];

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short addresses relative to its real address, 'w'.
            # They will all point to the widget hull object short address.
            set ::ms::addr($w,short)          $short_addr
            set ::ms::addr($w.preview,short)  $short_addr
            set ::ms::addr($w.combobox,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals) $w \
                                      $w.preview \
                                      $w.combobox;

            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the palette widgets real address list.
            lappend ::ms::addr(palette) $w

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w.combobox

            # Add the widget address to the palette classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),palette,addrs) $w

            # Add the widget address to the palette classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),palette,addrs) $w

            # Add the widget address to the megawidget addresses list.
            lappend ::ms::addr(megawidgets) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the palette classtype.
            if { $::ms::current($w,style) ni $::ms::style(palette,classtype) } {
                lappend ::ms::style(palette,classtype) $::ms::current($w,style)
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
proc ::ms::palette::Pathname_Cmd { w cmd args } {
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
                        $w.combobox $cmd $args
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
                    if { ($option in $::ms::palette(non_styleable,options)) || ($option in $::ms::palette(styleable,options))} {
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
                    foreach option $::ms::palette(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::palette(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::palette(non_styleable,options)) || ($option in $::ms::palette(styleable,options)) } {
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

                            # Set a variable that indicates if new valid list of values have been provided or not.
                            set new_values false

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
                                    -shellbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,shellbackground)    $value
                                        set ::ms::managed_by($w,shellbackground) developer
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
                                            # If not, create one by mirroring the current theme 'TPalette' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TPalette]
                                            }

                                            # Remove the widget address from the palette real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),palette,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),palette,addrs) [lremove $::ms::style($::ms::current($w,style),palette,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,palette,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the palette classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),palette,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(palette,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(palette,classtype) [lremove $::ms::style(palette,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the palette classtype.
                                            if { $value ni $::ms::style(palette,classtype) } {
                                                lappend ::ms::style(palette,classtype) $value
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
                                                                     write    [list ::ms::palette::Return $w];
                                                    }
                                                }

                                                # Set the new current textvariable.
                                                set ::ms::current($w,textvariable) $value

                                                # Set a trace in order to perform a validation (if needed) whenever the developer
                                                # changes the value of the variable name provided.
                                                trace add variable $value \
                                                          write    [list ::ms::palette::Return $w];
                                            }
                                        }
                                    }
                                    -values {
                                        switch -- [llength $value] {
                                            0       { ::ms::Error "An empty list of values was assigned to '$w'." $caller_info }
                                            default {
                                                # Check that the values provided forms a valid list of values (they must be divisible by two).
                                                set value_length [llength $value]
                                                switch -- [expr { $value_length%2 }] {
                                                    0   {
                                                        # Set the new current list of values.
                                                        set ::ms::current($w,values) $value

                                                        # Sort the values.
                                                        set values [lsort -dictionary -stride 2 -index 0 $::ms::current($w,values)]

                                                        # Initialize the colornames and hexadecimal lists.
                                                        set ::ms::data($w,colornames)   [list ]
                                                        set ::ms::data($w,hexadecimals) [list ]

                                                        # Check the value list.
                                                        foreach { colorname hex } $values {
                                                            # Check every character in colorname.
                                                            set i 0
                                                            while { $i < [string length $colorname] } {
                                                                set char [string index $colorname $i]
                                                                switch -- $char {
                                                                    " "     -
                                                                    "-"     {}
                                                                    default {
                                                                        switch -- [string is alnum $char] {
                                                                            0   { ::ms::Error "'$colorname' is not a valid colorname." $caller_info }
                                                                        }
                                                                    }
                                                                }

                                                                incr i
                                                            }

                                                            # Check the hexadecimal color value.
                                                            set hex [::ms::Check_Color $hex invalid]
                                                            switch -- $hex {
                                                                invalid { ::ms::Error "'$hex' is not a valid hexadecimal color." $caller_info }
                                                            }

                                                            # Add the colorname and its hexadecimal value in their relative lists.
                                                            lappend ::ms::data($w,colornames)   $colorname
                                                            lappend ::ms::data($w,hexadecimals) $hex
                                                        }

                                                        # Set the current index as the first one of the colorname list.
                                                        set ::ms::data($w,current_index) 0

                                                        # Set the current colorname value.
                                                        set ::ms::data($w,current_value) [lindex $::ms::data($w,colornames) $::ms::data($w,current_index)]

                                                        # Set the current hexadecimal value.
                                                        set ::ms::data($w,current_hex) [lindex $::ms::data($w,hexadecimals) $::ms::data($w,current_index)]

                                                        # Set the last available index.
                                                        set ::ms::data($w,last_available_index) [expr { [llength $::ms::data($w,colornames)]-1 }]

                                                        # Set the lowercase '::ms::data($w,colornames)' list.
                                                        set ::ms::data($w,colornames,lowercase) [string tolower $::ms::data($w,colornames)]

                                                        # Register the fact that a new valid list of values was provided.
                                                        set new_values true
                                                    }
                                                    default { ::ms::Error "An invalid list of values was assigned to '$w', '$value'." $caller_info }
                                                }
                                            }
                                        }
                                    }
                                    -xscrollcommand { set ::ms::current($w,xscrollcommand) $value }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::palette(styleable,options) {
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

                            # If the maxlength is not zero check that the charwidth is not less of it.
                            switch -- $::ms::current($w,maxlength) {
                                0       {}
                                default {
                                    if { $::ms::current($w,charwidth) < $::ms::current($w,maxlength) } {
                                        set ::ms::current($w,charwidth) $::ms::current($w,maxlength)
                                    }

                                    # Ignore the xscrollcommand provided, if any.
                                    set ::ms::current($w,xscrollcommand) {}
                                }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', insertwidth', 'justify',
                            #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

                            ##################
                            ##              ##
                            ##     HULL     ##
                            ##              ##
                            ##################

                            # Set the hull object style.
                            set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                                 ".TFrame"];

                            # If needed, create the hull object style.
                            if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,shellbackground)

                                # Add the hull object style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
                            }

                            # Initialize the hull object mapping.
                            set mapping [list ]

                            # shellbackground
                            switch -- $::ms::managed_by($w,shellbackground) {
                                developer { lappend mapping -background [list pressed $::ms::current($w,shellbackground)] }
                                Tk  {
                                    # Check if a 'shellbackground' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground)] {
                                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground) }
                                    }
                                }
                            }

                            # If needed, create the hull object mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,hull) {*}$mapping

                                # Add the hull object mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure -style $::ms::style($w,hull)

                            #######################
                            ##                   ##
                            ##     COMBOBOX      ##
                            ##                   ##
                            #######################

                            # Agglomerate the padding values.
                            set padding ""
                            foreach pad $::ms::current($w,padding) {
                                append padding "$pad" "-"
                            }
                            set padding [string trimright $padding "-"]

                            # Set the combobox object style name.
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

                            # If needed, create the combobox object style name.
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

                                # Add the widget object style name to the theme styles list created by mustang.
                                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
                            }

                            # Initialize the combobox object mapping.
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

                            # If needed, create the combobox object mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,widget) {*}$mapping

                                # Add the combobox object mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            $w.combobox configure          -cursor $cursor \
                                                  -exportselection $::ms::current($w,exportselection) \
                                                             -font $::ms::current($w,font) \
                                                          -justify $::ms::current($w,justify) \
                                                      -placeholder $::ms::current($w,placeholder) \
                                                            -state $::ms::current($w,state) \
                                                            -style $::ms::style($w,widget) \
                                                        -takefocus $takefocus \
                                                     -textvariable $::ms::current($w,textvariable) \
                                                           -values $::ms::data($w,colornames) \
                                                            -width $::ms::current($w,charwidth) \
                                                   -xscrollcommand $::ms::current($w,xscrollcommand);

                            ######################
                            ##                  ##
                            ##     PREVIEW      ##
                            ##                  ##
                            ######################

                            # Check if a new list of values was provided.
                            switch -- $new_values {
                                true {
                                    # Apply the changes to the combobox object.
                                    $w.combobox current $::ms::data($w,current_index)

                                    # Set the bordercolor of the preview object (black or white).
                                    switch -- [string length $::ms::data($w,current_hex)] {
                                        10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
                                        13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
                                        default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
                                    }

                                    # Apply the changes to the preview object.
                                    $w.preview configure          -background $::ms::data($w,current_hex) \
                                                         -highlightbackground $bordercolor \
                                                              -highlightcolor $bordercolor;
                                }
                            }

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
                    # Find the value in '::ms::data($w,colornames)' that corrisponds to the current index
                    # displayed in the palette entry.
                    set value [lindex $::ms::data($w,colornames) $::ms::data($w,current_index)]

                    # Return the index equivalent to '::ms::data($w,current_index)' in '::ms::current($w,values)'.
                    return [lsearch -exact $::ms::current($w,values) $value]
                }
                1   {
                    # Check that the argument provided is an integer.
                    switch -- [string is integer $args] {
                        0   { ::ms::Error "The argument provided is not an index, '$args'" $caller_info }
                    }

                    # Find the index in '::ms::data($w,colornames)' that corrisponds to the index provided
                    # for '::ms::current($w,values)'.
                    set value [lindex $::ms::current($w,values) $args]
                    switch -- $value {
                        ""      {}
                        default {
                            # Get the new index.
                            set index [lsearch -exact -nocase $::ms::data($w,colornames) $value]

                            # Update the current index, value and preview color.
                            set ::ms::data($w,current_index) $index
                            set ::ms::data($w,current_value) $value
                            set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $index]

                            # Apply the changes to the combobox object.
                            $w.combobox current $index

                            # Set the bordercolor of the preview object (black or white).
                            switch -- [string length $::ms::data($w,current_hex)] {
                                10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
                                13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
                                default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
                            }

                            # Apply the changes to the preview object.
                            $w.preview configure          -background $::ms::data($w,current_hex) \
                                                 -highlightbackground $bordercolor \
                                                      -highlightcolor $bordercolor;
                        }
                    }

                    return ""
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
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
                        $w.combobox $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
            }
        }
        get      -
        validate {
            # Synopsis:
            #
            # *window* **get**
            # *window* **validate**
            return [$w.combobox $cmd]
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

                    # Return the name of the object, or an empty string if there are no canvas objects at the coordinates provided.
                    if { $widget eq $w } {
                        return "Palette.hull"
                    } elseif { $widget eq "$w.preview" } {
                        return "Palette.preview"
                    } elseif { $widget eq "$w.combobox" } {
                        try {
                            interp invokehidden {} $w identify element $x $y
                        } on error { errortext errorcode } {
                            ::ms::Error "$errortext" $caller_info
                        } on ok { result } {
                            switch -nocase -- $result {
                                textarea { return "Palette.textarea"  }
                                default  { return "Palette.downarrow" }
                            }
                        }
                    } else {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
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
                enabled { chan puts stdout "'insert' is a deprecated mustang palette command. Use 'set' instead." }
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
                                interp invokehidden {} $w.combobox insert $index $string
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
                        $w.combobox instate $statespec
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
                        $w.combobox instate $statespec $script
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
                    # Check that the value provided exists inside the '::ms::data($w,colornames)' list.
                    set index [lsearch -exact -nocase $::ms::data($w,colornames) $args]
                    switch -- $index {
                        -1      {}
                        default {
                            # Update the current index, value and preview color.
                            set ::ms::data($w,current_index) $index
                            set ::ms::data($w,current_value) [lindex $::ms::data($w,colornames)   $index]
                            set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $index]

                            # Apply the changes to the combobox object.
                            $w.combobox current $index

                            # Set the bordercolor of the preview object (black or white).
                            switch -- [string length $::ms::data($w,current_hex)] {
                                10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
                                13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
                                default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
                            }

                            # Apply the changes to the preview object.
                            $w.preview configure          -background $::ms::data($w,current_hex) \
                                                 -highlightbackground $bordercolor \
                                                      -highlightcolor $bordercolor;
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
                0   { return [$w.combobox state] }
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
                    ##     APPLY THE NEW STATESPEC     ##
                    ##                                 ##
                    #####################################

                    return [$w.combobox state $statespec]
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
                0   { return [$w.combobox xview] }
                1   -
                2   -
                3   {
                    try {
                        $w.combobox $cmd {*}$args
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
# Update any palette widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::palette::Style_Update { stylename caller_info } {
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

    # Update all the palette widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,palette,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::palette(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TPalette,$option)

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
            readonly {
                # Check the windowing system.
                switch -- [_tk windowingsystem] {
                    aqua    { set cursor hand1 }
                    default { set cursor arrow }
                }
            }
            normal { set cursor $::ms::current($w,cursor) }
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

        # Note: 'arrowsize', 'charwidth', 'cursor', 'focuswidth', 'font', 'insertcolor', insertwidth', 'justify',
        #       'padding', 'rows' and 'selectborderwidth' are not allowed to change if the statespec changes.

        ##################
        ##              ##
        ##     HULL     ##
        ##              ##
        ##################

        # Set the hull object style.
        set ::ms::style($w,hull) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                             ".TFrame"];

        # If needed, create the hull object style.
        if { $::ms::style($w,hull) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,hull) -background $::ms::current($w,shellbackground)

            # Add the hull object style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,hull)
        }

        # Initialize the hull object mapping.
        set mapping [list ]

        # shellbackground
        switch -- $::ms::managed_by($w,shellbackground) {
            developer { lappend mapping -background [list pressed $::ms::current($w,shellbackground)] }
            Tk  {
                # Check if a 'shellbackground' mapping exists for '::ms::current($w,style)'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground)] {
                    1   { lappend mapping -background $::ms::stylemap($::ms::theme,$::ms::current($w,style),shellbackground) }
                }
            }
        }

        # If needed, create the hull object mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,hull) {*}$mapping

            # Add the hull object mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        interp invokehidden {} $w configure -style $::ms::style($w,hull)

        #######################
        ##                   ##
        ##     COMBOBOX      ##
        ##                   ##
        #######################

        # If the palette popdown is currently displayed, release the grab.
        switch -- [winfo exists $w.popdown] {
            1   { set ::wait_for_user_response "Unpost" }
        }

        # Agglomerate the padding values.
        set padding ""
        foreach pad $::ms::current($w,padding) {
            append padding "$pad" "-"
        }
        set padding [string trimright $padding "-"]

        # Set the widget style.
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

        # If needed, create the widget style.
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

            # Add the widget object style name to the theme styles list created by mustang.
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
        $w.combobox configure      -cursor $cursor \
                                     -font $::ms::current($w,font) \
                                  -justify $::ms::current($w,justify) \
                              -placeholder $::ms::current($w,placeholder) \
                                    -style $::ms::style($w,widget) \
                                    -width $::ms::current($w,charwidth);

        ######################
        ##                  ##
        ##     PREVIEW      ##
        ##                  ##
        ######################

        # Apply the changes to the preview object.
        $w.preview configure             -height $::ms::styleopt($::ms::theme,Preview,height) \
                             -highlightthickness $::ms::styleopt($::ms::theme,Preview,borderwidth) \
                                          -width $::ms::styleopt($::ms::theme,Preview,width);
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
proc ::ms::palette::ButtonPress { w x y mode } {
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
        readonly { ::ms::palette::Post $w }
        normal   {
            # Check the cursor location.
            switch -- [$w.combobox identify element $x $y] {
                "textarea" {
                    # Focus the palette if its not already focussed.
                    $w.combobox instate [list !focus] {
                        _focus -force $w.combobox
                    }

                    # Check the press type.
                    switch -- $mode {
                        s       { ::ttk::entry::Shift-Press $w.combobox $x }
                        2       { ::ttk::entry::Select $w.combobox $x word }
                        3       { ::ttk::entry::Select $w.combobox $x line }
                        default {
                            $w.combobox icursor [::ttk::entry::ClosestGap $w.combobox $x]
                            $w.combobox selection clear

                            # Set up for future drag, double-click, triple-click or quadruple-click.
                            set ::ttk::entry::State(x)          $x
                            set ::ttk::entry::State(selectMode) char
                            set ::ttk::entry::State(anchor)     [$w.combobox index insert]
                        }
                    }
                }
                default { ::ms::palette::Post $w }
            }
        }
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
proc ::ms::palette::Destroy { w } {
    # Get the short address related to the widget real address.
    set short_addr $::ms::addr($w,short)

    # Destroy the aliased widget pathcommands.
    foreach token $::ms::data($w,token) {
        interp alias {} $token {}
    }

    # Remove all the objects real addresses from the list of all available real addresses.
    foreach object [list $w \
                         $w.preview \
                         $w.combobox] {
        set index [lsearch -exact $::ms::addr(reals) $object]
        switch -- $index {
            -1      {}
            default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
        }
    }

    # Remove the widget short address from the widgets short address list.
    set index [lsearch -exact $::ms::addr(shorts) $short_addr]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(shorts) [lremove $::ms::addr(shorts) $index] }
    }

    # Remove the widget address from the palette widgets real address list.
    set index [lsearch -exact $::ms::addr(palette) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(palette) [lremove $::ms::addr(palette) $index] }
    }

    # Remove the widget address from the palette classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),palette,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),palette,addrs) [lremove $::ms::class($::ms::current($w,class),palette,addrs) $index] }
    }

    # Remove the widget address from the palette classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),palette,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),palette,addrs) [lremove $::ms::style($::ms::current($w,style),palette,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the palette classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),palette,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(palette,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(palette,classtype) [lremove $::ms::style(palette,classtype) $index] }
            }
        }
    }

    # Remove the widget address from the megawidget real address list.
    set index [lsearch -exact $::ms::addr(megawidgets) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(megawidgets) [lremove $::ms::addr(megawidgets) $index] }
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
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,exportselection) \
                         ::ms::current($w,fieldbackground) \
                         ::ms::current($w,focuscolor) \
                         ::ms::current($w,focuswidth) \
                         ::ms::current($w,font) \
                         ::ms::current($w,foreground) \
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
                         ::ms::current($w,selectbackground) \
                         ::ms::current($w,selectborderwidth) \
                         ::ms::current($w,selectforeground) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,textvariable) \
                         ::ms::current($w,values) \
                         ::ms::current($w,xscrollcommand);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,colornames) \
                         ::ms::data($w,colornames,lowercase) \
                         ::ms::data($w,current_index) \
                         ::ms::data($w,current_hex) \
                         ::ms::data($w,current_value) \
                         ::ms::data($w,hexadecimals) \
                         ::ms::data($w,last_available_index) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,arrowcolor) \
                         ::ms::default($w,arrowsize) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,charwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,exportselection) \
                         ::ms::default($w,fieldbackground) \
                         ::ms::default($w,focuscolor) \
                         ::ms::default($w,focuswidth) \
                         ::ms::default($w,font) \
                         ::ms::default($w,foreground) \
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
                         ::ms::default($w,selectbackground) \
                         ::ms::default($w,selectborderwidth) \
                         ::ms::default($w,selectforeground) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,textvariable) \
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

## FocusIn
#
# Manage the **FocusIn** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::palette::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::palette::Pathname_Cmd $w state focus

    # Check the widget stateis in its normal state, s
    switch -- $::ms::current($w,state) {
        normal {
            # Select all the widget textarea characters.
            $w.combobox selection range 0 end
        }
    }

    return ""
}

## FocusOut
#
# Manage the **FocusOut** event on the widget.
#
# Where:
#
# w   Should be the widget real address involved.
#
# It doesn't return anything.
proc ::ms::palette::FocusOut { w } {
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

    # If the popdown window of the palette is currently displayed do not remove the selection
    # or validate the data.
    switch -- [_winfo exists $w.popdown] {
        1   { return "" }
    }

    # Change the widget dynamic state to '!focus'.
    ::ms::palette::Pathname_Cmd $w state !focus

    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { set value [interp invokehidden {} $w get] }
        normal {
            # Validate the widget string.
            set value [::ms::palette::Validate_String $w]

            # Clear the widget field, insert the validated value and put the cursor at the end.
            $w.combobox delete 0 end
            $w.combobox set $value
            $w.combobox icursor end
        }
    }

    # Remove the widget selection, if any.
    $w.combobox selection clear

    # Check the widget value.
    if { $value ne $::ms::data($w,current_value) } {
        # Update the current values.
        set ::ms::data($w,current_value) $value
        set ::ms::data($w,current_index) [lsearch -exact $::ms::data($w,colornames) $value]
        set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $::ms::data($w,current_index)]

        # Set the bordercolor of the preview object.
        switch -- [string length $::ms::data($w,current_hex)] {
            10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $::ms::data($w,current_hex) \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;

        ::ms::Execute_Widget_Cmd $w
    } else {
        # Set the bordercolor of the preview object.
        switch -- [string length $::ms::data($w,current_hex)] {
            10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $::ms::data($w,current_hex) \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;
    }

    # Cleaning.
    unset -nocomplain -- ::ms::temp($w,pending_execute_cmd)

    return ""
}

## Motion
#
# Manage the **Motion** event.
#
# Where:
#
# w      Should be the widget real address involved.
#
# X, Y   Should be the (x,y) mouse pointer absolute coordinates at the time of the event.
#        These values should be provided by the **Motion** event.
#
# It doesn't return anything.
proc ::ms::palette::Motion { w X Y } {
    switch -- [info exists ::ms::temp(toplevel_height)] {
        0   {
            update idletasks

            # Get the toplevel north-west (nw) root coordinates.
            set ::ms::temp(toplevel,X,nw) [_winfo rootx $::ms::addr($w,toplevel)]
            set ::ms::temp(toplevel,Y,nw) [_winfo rooty $::ms::addr($w,toplevel)]

            # Get the toplevel dimensions.
            set ::ms::temp(toplevel,height) [_winfo height $::ms::addr($w,toplevel)]
            set ::ms::temp(toplevel,width)  [_winfo width  $::ms::addr($w,toplevel)]

            # Get the toplevel south-east (se) root coordinates.
            set ::ms::temp(toplevel,X,se) [expr { $::ms::temp(toplevel,X,nw)+$::ms::temp(toplevel,width) }]
            set ::ms::temp(toplevel,Y,se) [expr { $::ms::temp(toplevel,Y,nw)+$::ms::temp(toplevel,height) }]
        }
    }

    if { ($X <= $::ms::temp(toplevel,X,nw)) || ($X >= $::ms::temp(toplevel,X,se)) || ($Y <= $::ms::temp(toplevel,Y,nw)) || ($Y >= $::ms::temp(toplevel,Y,se)) } {
        # The mouse cursor is outside the address.

        set ::wait_for_user_response "Unpost"
    }

    return ""
}

## Post
#
# Post the popdown window.
#
# Note: The following procedure is a modified version of the 'ttk::palette::Post' procedure.
#       All credits goes to the original author/s.
#
# Where:
#
# w   Should be the palette real address involved.
#
# It doesn't return anything.
proc ::ms::palette::Post { w } {
    # Note: This procedure have been highly influenced by many 'ttk::palette' procedures.
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
    ::ms::palette::Pathname_Cmd $w state pressed

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
    _wm group $w.popdown $::ms::addr($w,toplevel)
    _wm overrideredirect $w.popdown true
    _wm resizable $w.popdown 0 0
    _wm withdraw $w.popdown

    ###################
    ##               ##
    ##     FRAME     ##
    ##               ##
    ###################

    # Set the popdown frame style.
    set popdown_frame [string cat "_sb=" $background \
                                  "_bc=" $bordercolor \
                                  "_dc=" $darkcolor \
                                  "_lc=" $lightcolor \
                                  ".TFrame"];

    # If needed, create the popdown frame style.
    if { $popdown_frame ni $::ms::style($::ms::theme,created_by_mustang) } {
        _ttk_style configure $popdown_frame  -background $background \
                                            -bordercolor $bordercolor \
                                              -darkcolor $darkcolor \
                                             -lightcolor $lightcolor;
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
        _ttk_style map $popdown_frame {*}$mapping

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
                                  -style $popdown_frame \
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
                                    -listvariable ::ms::data($w,colornames) \
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
    _bind $w.popdown <Motion> [list ::ms::palette::Motion $w %X %Y]

    # Scan
    _bind $w.popdown <<ScanMark>>    [list ::ms::Scan_Mark $w.popdown.f.lb %x %y]
    _bind $w.popdown <<ScanDrag>>    [list ::ms::Scan_Drag $w.popdown.f.lb %x %y]
    _bind $w.popdown <<ScanRelease>> [list ::ms::Scan_Release]

    # ArrowDown/ArrowUp
    _bind $w.popdown.f.lb <<NextLine>> [list ::ms::palette::Popdown_Arrow_Down  $w]
    _bind $w.popdown.f.lb <<PrevLine>> [list ::ms::palette::Popdown_Arrow_Up    $w]

    # Control-End/Control-Home
    _bind $w.popdown.f.lb <<LineEnd>>   [list ::ms::palette::Popdown_End  $w]
    _bind $w.popdown.f.lb <<LineStart>> [list ::ms::palette::Popdown_Home $w]

    # Escape
    _bind $w.popdown.f.lb <KeyPress-Escape> { set ::wait_for_user_response "Unpost"; break }

    # End/Home
    _bind $w.popdown.f.lb <<LineBottom>> [list ::ms::palette::Popdown_End  $w]
    _bind $w.popdown.f.lb <<LineTop>>    [list ::ms::palette::Popdown_Home $w]

    # FocusOut, *only* do this on Windows (see #1814778).
    # Dismiss the listbox when the user switches to a different application.
    switch -- [_tk windowingsystem] {
        win32 { _bind $w.popdown.f.lb <FocusOut> { set ::wait_for_user_response "Unpost"; break } }
    }

    # Motion
    _bind $w.popdown.f.lb <Motion> [list ::ms::palette::Popdown_Hover $w %x %y]

    # PageDown/PageUp
    _bind $w.popdown.f.lb <<PageDown>> [list ::ms::palette::Popdown_PageDown  $w]
    _bind $w.popdown.f.lb <<PageUp>>   [list ::ms::palette::Popdown_PageUp    $w]

    # Selection
    _bind $w.popdown.f.lb <ButtonRelease-1>   [list ::ms::palette::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-Return>   [list ::ms::palette::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-KP_Enter> [list ::ms::palette::Popdown_Select $w]
    _bind $w.popdown.f.lb <KeyPress-space>    [list ::ms::palette::Popdown_Select $w]

    # Shift-Tab/Tab
    switch -- [_tk windowingsystem] {
        win32   { _bind $w.popdown.f.lb <Shift-Tab> { ::ms::palette::Popdown_Tab %W previous; break } }
        default {
            _bind $w.popdown.f.lb <ISO_Left_Tab>    { ::ms::palette::Popdown_Tab %W previous; break }

            try {
                _bind $w.popdown.f.lb <hpBackTab>   { ::ms::palette::Popdown_Tab %W previous; break }
            } on error {} {
                # Do nothing.
            }
        }
    }
    _bind $w.popdown.f.lb <Tab> { ::ms::palette::Popdown_Tab %W next; break }

    # If the listbox can scroll vertically, move the listbox viewpoint by one unit up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f     <MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f.lb  <MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D units]

    # If the listbox can scroll horizontally, move the listbox viewpoint by one unit left or right
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f     <Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D units]
    _bind $w.popdown.f.lb  <Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D units]

    # If the listbox can scroll vertically, move the listbox viewpoint by one page up or down
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f     <Control-MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f.lb  <Control-MouseWheel> [list ::ms::palette::Popdown_MouseWheel $w %x %y %D pages]

    # If the listbox can scroll horizontally, move the listbox viewpoint by one page left or right
    # (depending on the mousewheel direction), otherwise don't do anything.
    _bind $w.popdown       <Control-Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f     <Control-Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D pages]
    _bind $w.popdown.f.lb  <Control-Shift-MouseWheel> [list ::ms::palette::Popdown_Shift_MouseWheel $w %x %y %D pages]

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

    if { $::ms::current($w,rows) < [llength $::ms::data($w,colornames)] } {
        _ttk_scrollbar $w.popdown.f.vsb     -class TScrollbar \
                                          -command [list $w.popdown.f.lb yview] \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

        $w.popdown.f.lb configure -yscrollcommand [list $w.popdown.f.vsb set]

        _bind $w.popdown.f.vsb <MouseWheel>         [list ::ms::combobox::Scrollbar_Mousewheel $w %D units]
        _bind $w.popdown.f.vsb <Control-MouseWheel> [list ::ms::combobox::Scrollbar_Mousewheel $w %D pages]

        _bind $w.popdown.f.vsb <TouchpadScroll>         [list ::ms::combobox::Scrollbar_TouchpadScroll $w %# %D units]
        _bind $w.popdown.f.vsb <Control-TouchpadScroll> [list ::ms::combobox::Scrollbar_TouchpadScroll $w %# %D pages]

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

    ::ms::palette::Popdown_AutoSelection $w

    ###############################
    ##                           ##
    ##     PLACE THE POPDOWN     ##
    ##                           ##
    ###############################

    update idletasks

    # Get the (x,y) absolute coordinate of the NW point of the palette.
    set palette_x [_winfo rootx $w]
    set palette_y [_winfo rooty $w]

    # Get the width and height of the palette.
    set palette_height [_winfo height $w.combobox]
    set palette_width  [_winfo width  $w.combobox]

    # Adjust the coordinates and dimensions by the 'postoffset' specified in the palette style provided.
    set postoffset [_ttk_style lookup $::ms::current($w,style) -postoffset {} [list 0 0 0 0]]
    foreach var { palette_x palette_y palette_width palette_height } delta $postoffset {
        incr $var $delta
    }

    # Compute if the popdown will show below the palette element or above it.
    set popdown_height [_winfo reqheight $w.popdown]
    if { [expr { $palette_y+$palette_height+$popdown_height+4 }] > [_winfo screenheight $w.popdown] } {
        # Above the palette.
        set popdown_y [expr { $palette_y-$popdown_height-4 }]
    } else {
        # Below the palette.
        # This is the normal flow of the popdown window.
        set popdown_y [expr { $palette_y+$palette_height+4 }]
    }

    # Set the popdown geometry.
    _wm geometry $w.popdown ${palette_width}x${popdown_height}+${palette_x}+${popdown_y}

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
    _wm attribute $w.popdown -topmost 1
    _wm deiconify $w.popdown
    _raise $w.popdown

    # Focus on the 'popdown' object.
    _focus -force $w.popdown.f.lb

    # Get the combobox current fieldbackground color for the focus dynamic state.
    set fieldbackground [_ttk_style lookup $::ms::current($w,style) -fieldbackground [list focus] $::ms::current($w,fieldbackground)]

    # Create/Update the sub-style for the fieldbackground.
    _ttk_style configure Fieldbackground.$::ms::style($w,widget) -fieldbackground $fieldbackground

    # Change momentarily the combobox style to the sub-style.
    $w.combobox configure -style Fieldbackground.$::ms::style($w,widget)

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

    # Change the combobox style back to its original style.
    $w.combobox configure -style $::ms::style($w,widget)

    # Unpost the popdown window.
    ::ms::palette::Unpost $w

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
proc ::ms::palette::Return { w } {
    # Check the widget state.
    switch -- $::ms::current($w,state) {
        disabled { return "" }
        readonly { set value [interp invokehidden {} $w get] }
        normal {
            # Validate the widget string.
            set value [::ms::palette::Validate_String $w]

            # Clear the widget field, insert the validated value and put the cursor at the end.
            $w.combobox delete 0 end
            $w.combobox set $value
            $w.combobox icursor end
        }
    }

    # Remove the widget selection, if any.
    $w.combobox selection clear

    # Check the widget value.
    if { $value ne $::ms::data($w,current_value) } {
        # Update the current values.
        set ::ms::data($w,current_value) $value
        set ::ms::data($w,current_index) [lsearch -exact $::ms::data($w,colornames) $value]
        set ::ms::data($w,current_hex)   [lindex $::ms::data($w,hexadecimals) $::ms::data($w,current_index)]

        # Set the bordercolor of the preview object.
        switch -- [string length $::ms::data($w,current_hex)] {
            10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $::ms::data($w,current_hex) \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;

        ::ms::Execute_Widget_Cmd $w
    } else {
        # Set the bordercolor of the preview object.
        switch -- [string length $::ms::data($w,current_hex)] {
            10      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 12] }
            13      { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 16] }
            default { set bordercolor [::ms::palette::Black_Or_White $::ms::data($w,current_hex) 8 ] }
        }

        # Apply the changes to the preview object.
        $w.preview configure          -background $::ms::data($w,current_hex) \
                             -highlightbackground $bordercolor \
                                  -highlightcolor $bordercolor;
    }

    return ""
}

#*EOF*