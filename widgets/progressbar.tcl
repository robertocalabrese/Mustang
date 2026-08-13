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
package provide ::ms::progressbar 0.1

###################################
##                               ##
##     _PROGRESSBAR BINDINGS     ##
##                               ##
###################################

# Activate/Deactivate
_bind _Progressbar <Activate>   { ::ms::progressbar::Pathname_Cmd %W state !background; break }
_bind _Progressbar <Deactivate> { ::ms::progressbar::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Progressbar <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Progressbar <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Progressbar <Destroy> { ::ms::progressbar::Destroy %W; break }

# Enter/Leave
_bind _Progressbar <Enter> { ::ms::progressbar::Pathname_Cmd %W state  hover; break }
_bind _Progressbar <Leave> { ::ms::progressbar::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Progressbar <FocusIn>  { ::ms::progressbar::FocusIn  %W; break }
_bind _Progressbar <FocusOut> { ::ms::progressbar::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Progressbar <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Progressbar <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Progressbar <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Progressbar <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Progressbar <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Progressbar <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **progressbar** package.
namespace eval ::ms::progressbar {
    # Set the 'non styleable' progressbar option list.
    set ::ms::progressbar(non_styleable,options) [list class \
                                                       cmenu \
                                                       length \
                                                       maximum \
                                                       mode \
                                                       orient \
                                                       phase \
                                                       state \
                                                       style \
                                                       takefocus \
                                                       text \
                                                       textvariable \
                                                       value \
                                                       variable];

    # Set the 'styleable' progressbar option list.
    set ::ms::progressbar(styleable,options) [list anchor \
                                                   background \
                                                   bordercolor \
                                                   borderwidth \
                                                   cursor \
                                                   darkcolor \
                                                   font \
                                                   foreground \
                                                   justify \
                                                   lightcolor \
                                                   thickness \
                                                   troughcolor \
                                                   wraplength];

    # Set the default 'non-styleable' progressbar options values.
    set ::ms::default(progressbar,class)        TProgressbar
    set ::ms::default(progressbar,cmenu)        {}
    set ::ms::default(progressbar,length)       75p
    set ::ms::default(progressbar,maximum)      100.0
    set ::ms::default(progressbar,mode)         determinate
    set ::ms::default(progressbar,orient)       horizontal
    set ::ms::default(progressbar,phase)        0
    set ::ms::default(progressbar,state)        normal
    set ::ms::default(progressbar,style)        TProgressbar
    set ::ms::default(progressbar,takefocus)    1
    set ::ms::default(progressbar,text)         {}
    set ::ms::default(progressbar,textvariable) {}
    set ::ms::default(progressbar,value)        0.0
    set ::ms::default(progressbar,variable)     {}

    # Note: The default 'styleable' progressbar options values are always defined inside the current theme.
}

# Rename the original Tk **ttk::progressbar** command.
rename ttk::progressbar _ttk_progressbar

# Create aliases for the mustang **progressbar** command.
interp alias {} progressbar      {} ::ms::progressbar::Command
interp alias {} ttk::progressbar {} ::ms::progressbar::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::progressbar** widget command.
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
proc ::ms::progressbar::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(progressbar,class)
            set ::ms::default($w,cmenu)        $::ms::default(progressbar,cmenu)
            set ::ms::default($w,length)       $::ms::default(progressbar,length)
            set ::ms::default($w,maximum)      $::ms::default(progressbar,maximum)
            set ::ms::default($w,mode)         $::ms::default(progressbar,mode)
            set ::ms::default($w,orient)       $::ms::default(progressbar,orient)
            set ::ms::default($w,phase)        $::ms::default(progressbar,phase)
            set ::ms::default($w,state)        $::ms::default(progressbar,state)
            set ::ms::default($w,style)        $::ms::default(progressbar,style)
            set ::ms::default($w,takefocus)    $::ms::default(progressbar,takefocus)
            set ::ms::default($w,text)         $::ms::default(progressbar,text)
            set ::ms::default($w,textvariable) $::ms::default(progressbar,textvariable)
            set ::ms::default($w,value)        $::ms::default(progressbar,value)
            set ::ms::default($w,variable)     $::ms::default(progressbar,variable)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(progressbar,class)
            set ::ms::current($w,cmenu)        $::ms::default(progressbar,cmenu)
            set ::ms::current($w,length)       $::ms::default(progressbar,length)
            set ::ms::current($w,maximum)      $::ms::default(progressbar,maximum)
            set ::ms::current($w,mode)         $::ms::default(progressbar,mode)
            set ::ms::current($w,orient)       $::ms::default(progressbar,orient)
            set ::ms::current($w,phase)        $::ms::default(progressbar,phase)
            set ::ms::current($w,state)        $::ms::default(progressbar,state)
            set ::ms::current($w,style)        $::ms::default(progressbar,style)
            set ::ms::current($w,takefocus)    $::ms::default(progressbar,takefocus)
            set ::ms::current($w,text)         $::ms::default(progressbar,text)
            set ::ms::current($w,textvariable) $::ms::default(progressbar,textvariable)
            set ::ms::current($w,value)        $::ms::default(progressbar,value)
            set ::ms::current($w,variable)     $::ms::default(progressbar,variable)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) progressbar

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
            #       To make a progressbar styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **progressbar** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,anchor)      Tk
            set ::ms::managed_by($w,background)  Tk
            set ::ms::managed_by($w,bordercolor) Tk
            set ::ms::managed_by($w,borderwidth) Tk
            set ::ms::managed_by($w,cursor)      Tk
            set ::ms::managed_by($w,darkcolor)   Tk
            set ::ms::managed_by($w,font)        Tk
            set ::ms::managed_by($w,foreground)  Tk
            set ::ms::managed_by($w,justify)     Tk
            set ::ms::managed_by($w,lightcolor)  Tk
            set ::ms::managed_by($w,thickness)   Tk
            set ::ms::managed_by($w,troughcolor) Tk
            set ::ms::managed_by($w,wraplength)  Tk

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
                    -class { set ::ms::current($w,class) $value }
                    -cmenu {
                        set value [string trim $value]
                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                            set ::ms::current($w,cmenu) $value
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
                    -length {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,length) $value
                    }
                    -lightcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,lightcolor)    $value
                        set ::ms::managed_by($w,lightcolor) developer
                    }
                    -maximum {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,maximum) $value
                                }
                            }
                        }
                    }
                    -mode {
                        set value [string tolower $value]
                        switch -- $value {
                            determinate   -
                            indeterminate { set ::ms::current($w,orient) $value }
                        }
                    }
                    -orient {
                        set value [string tolower $value]
                        switch -- $value {
                            horizontal -
                            vertical   { set ::ms::current($w,orient) $value }
                        }
                    }
                    -phase {
                        switch -- [string is integer -strict $value] {
                            0   { continue }
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,phase) $value
                                }
                            }
                        }
                    }
                    -state {}
                    -style {
                        if { $value ni $::ms::style($::ms::theme) } {
                            continue
                        }

                        set ::ms::current($w,style) $value
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
                    -thickness {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,thickness)    $value
                        set ::ms::managed_by($w,thickness) developer
                    }
                    -troughcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,troughcolor)    $value
                        set ::ms::managed_by($w,troughcolor) developer
                    }
                    -value {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,value) $value
                    }
                    -variable {
                        switch -- [info exists $value] {
                            1   { set ::ms::current($w,variable) $value }
                        }
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
            foreach option $::ms::progressbar(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TProgressbar,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            # Enable/Disable the widget automatic translation.
            switch -- $::ms::current($w,textvariable) {
                ""  {
                    # Automatic translation: ON
                    set ::ms::data($w,translated_text) [::msgcat::mc {*}$::ms::current($w,text)]
                    set text_variable $::ms::data($w,translated_text)
                }
                default {
                    # Automatic translation: OFF
                    set text_variable [set $::ms::current($w,textvariable)]
                }
            }

            # Check if the style provided has children.
            set orient [string totitle $::ms::current($w,orient)]
            set index  [string last "." $::ms::current($w,style)]
            switch -- $index {
                -1      { set parent_style [string cat $orient "." $::ms::current($w,style)] }
                default {
                    # Check if the style child positioned at 'end-1' corresponds to the word 'Horizontal' or 'Vertical'.
                    set children [split $::ms::current($w,style) "."]
                    if { [lindex $children end-1] eq $orient } {
                        set parent_style [string cat $orient "." [lindex $children end]]
                    } else {
                        set parent_style $orient
                        foreach word $children {
                            switch -nocase -- $word {
                                Horizontal -
                                Vertical   { ::ms::Error "Invalid style name, '$::ms::current($w,style)'." $caller_info }
                                default    { set parent_style [string cat $parent_style "." $word] }
                            }
                        }
                    }
                }
            }

            # If the parent style layout is not known by mustang, set it as the current theme layout orientation.
            if { $parent_style ni $::ms::layouts($::ms::theme) } {
                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TProgressbar]]
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'anchor', 'borderwidth', 'cursor', 'font', 'justify', 'thickness', 'troughcolor' and 'wraplength' are not allowed
            #       to change if the statespec changes.

            #########################
            ##                     ##
            ##     PROGRESSBAR     ##
            ##                     ##
            #########################

            # Note: 'arrowsize' is only understood by the clam engine while 'thickness' is understood by the other engines.

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                   "_bw=" $::ms::current($w,borderwidth) \
                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                   "_tn=" $::ms::current($w,thickness) \
                                                   "_tc=" $::ms::current($w,troughcolor) \
                                                   "." $parent_style];

            # If needed, create the widget style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)   -arrowsize $::ms::current($w,thickness) \
                                                              -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                             -borderwidth $::ms::current($w,borderwidth) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                               -thickness $::ms::current($w,thickness) \
                                                             -troughcolor $::ms::current($w,troughcolor);

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

            # If needed, create the widget mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,widget) {*}$mapping

                # Add the widget mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the progressbar widget.
            _ttk_progressbar $w     -anchor $::ms::current($w,anchor) \
                                     -class $::ms::current($w,class) \
                                    -cursor $::ms::current($w,cursor) \
                                      -font $::ms::current($w,font) \
                                -foreground $::ms::current($w,foreground) \
                                   -justify $::ms::current($w,justify) \
                                    -length $::ms::current($w,length) \
                                   -maximum $::ms::current($w,maximum) \
                                      -mode $::ms::current($w,mode) \
                                    -orient $::ms::current($w,orient) \
                                     -phase $::ms::current($w,phase) \
                                     -style $::ms::style($w,widget) \
                                 -takefocus $::ms::current($w,takefocus) \
                                      -text $text_variable \
                                     -value $::ms::current($w,value) \
                                  -variable $::ms::current($w,variable) \
                                -wraplength $::ms::current($w,wraplength);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TProgressbar { bindtags $w [list $w _Progressbar TProgressbar $::ms::addr($w,toplevel) all] }
                default      { bindtags $w [list $w $::ms::current($w,class) _Progressbar TProgressbar $::ms::addr($w,toplevel) all] }
            }

            # Add the progressbar to the related toplevel keyboard pages navigation bindings.
            ::ms::Enable_Traversal $w

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::progressbar::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::progressbar::Pathname_Cmd $w]
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

            # Add the widget address to the progressbar widgets real address list.
            lappend ::ms::addr(progressbar) $w

            # Add the widget address to the progressbar classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),progressbar,addrs) $w

            # Add the widget address to the progressbar classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),progressbar,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the progressbar classtype.
            if { $::ms::current($w,style) ni $::ms::style(progressbar,classtype) } {
                lappend ::ms::style(progressbar,classtype) $::ms::current($w,style)
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
proc ::ms::progressbar::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::progressbar(non_styleable,options)) || ($option in $::ms::progressbar(styleable,options))} {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid option, '$args'." $caller_info }
            }
        }
        configure {}
        identify {}
        instate {}
        start -
        step  {}
        state {}
        stop {}
        style {}
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
# Update any progressbar widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::progressbar::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*