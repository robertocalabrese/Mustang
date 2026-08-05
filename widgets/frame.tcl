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
# *option*             --> A mandatory parameter that must be substituted with a proper value.
# **option**           --> The command name or a mandatory parameter that must be written verbatim.
#
# ?*option*?           --> An optional parameter that must be substituted with a proper value.
# ?**option**?         --> An optional parameter that must be written verbatim.
#
# ?*option* *value*?   --> An optional 'key-value' parameter that must be substituted with proper values.
# ?**option** *value*? --> An optional 'key-value' parameter where the former must be written verbatim and
#                          the latter must be substituted with a proper value.

# Symbols meanings that may be used by the widget infos:
#
# *text*               --> Italic.
# **text**             --> Bold.
# ***text***           --> Italic-bold
#
# ## text              --> Title.
# #### text            --> Chapter.
# ###### text          --> Sub-chapter.
#
# [text](https:\\...)  --> Link to an internet page.
# [text](/wiki/...)    --> Link to another file in the wiki.
package provide ::ms::frame 0.1

#############################
##                         ##
##     _FRAME BINDINGS     ##
##                         ##
#############################

# Activate/Deactivate
_bind _Frame <Activate>   { ::ms::frame::Pathname_Cmd %W state !background; break }
_bind _Frame <Deactivate> { ::ms::frame::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Frame <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Configure
_bind _Frame <Configure> { ::ms::frame::Configure %W %w %h; break }

# Destroy
_bind _Frame <Destroy> { ::ms::frame::Destroy %W; break }

# FocusIn/FocusOut
_bind _Frame <FocusIn>  { ::ms::frame::Focus_In  %W }
_bind _Frame <FocusOut> { ::ms::frame::Focus_Out %W }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Frame <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Frame <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Frame <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Frame <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Frame <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Frame <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **frame** package.
namespace eval ::ms::frame {
    # Set the 'non-styleable' frame option list.
    set ::ms::frame(non_styleable,options) [list class \
                                                 height \
                                                 cmenu \
                                                 scrollable \
                                                 state \
                                                 style \
                                                 takefocus \
                                                 width \
                                                 xscrollincrement \
                                                 yscrollincrement];

    # Set the 'styleable' frame option list.
    set ::ms::frame(styleable,options) [list background \
                                             bordercolor \
                                             borderwidth \
                                             cursor \
                                             darkcolor \
                                             lightcolor \
                                             padding \
                                             relief \
                                             shellbackground];

    # Set the default 'non-styleable' frame options values.
    set ::ms::default(frame,class)            TFrame
    set ::ms::default(frame,height)           0
    set ::ms::default(frame,cmenu)            {}
    set ::ms::default(frame,scrollable)       false
    set ::ms::default(frame,state)            normal
    set ::ms::default(frame,style)            TFrame
    set ::ms::default(frame,takefocus)        0
    set ::ms::default(frame,width)            0
    set ::ms::default(frame,xscrollincrement) 0
    set ::ms::default(frame,yscrollincrement) 0

    # Note: The default 'styleable' frame options values are always defined inside the current theme.
}

# Rename the original Tk **frame** and **ttk::frame** commands.
rename frame      _frame
rename ttk::frame _ttk_frame

# Create aliases for the mustang **frame** command.
interp alias {} frame      {} ::ms::frame::Command
interp alias {} ttk::frame {} ::ms::frame::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **frame** and **ttk::frame** widgets commands.
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
proc ::ms::frame::Command { window { args "" } } {
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
            set ::ms::default($w,class)            $::ms::default(frame,class)
            set ::ms::default($w,cmenu)            $::ms::default(frame,cmenu)
            set ::ms::default($w,height)           $::ms::default(frame,height)
            set ::ms::default($w,scrollable)       $::ms::default(frame,scrollable)
            set ::ms::default($w,state)            $::ms::default(frame,state)
            set ::ms::default($w,style)            $::ms::default(frame,style)
            set ::ms::default($w,takefocus)        $::ms::default(frame,takefocus)
            set ::ms::default($w,width)            $::ms::default(frame,width)
            set ::ms::default($w,xscrollincrement) $::ms::default(frame,xscrollincrement)
            set ::ms::default($w,yscrollincrement) $::ms::default(frame,yscrollincrement)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)            $::ms::default(frame,class)
            set ::ms::current($w,cmenu)            $::ms::default(frame,cmenu)
            set ::ms::current($w,height)           $::ms::default(frame,height)
            set ::ms::current($w,scrollable)       $::ms::default(frame,scrollable)
            set ::ms::current($w,state)            $::ms::default(frame,state)
            set ::ms::current($w,style)            $::ms::default(frame,style)
            set ::ms::current($w,takefocus)        $::ms::default(frame,takefocus)
            set ::ms::current($w,width)            $::ms::default(frame,width)
            set ::ms::current($w,xscrollincrement) $::ms::default(frame,xscrollincrement)
            set ::ms::current($w,yscrollincrement) $::ms::default(frame,yscrollincrement)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)  frame
            set ::ms::data($w,scrollx)    off
            set ::ms::data($w,scrolly)    off
            set ::ms::data($w,xview1)     0
            set ::ms::data($w,xview2)     1.0
            set ::ms::data($w,xview_diff) 1.0
            set ::ms::data($w,yview1)     0
            set ::ms::data($w,yview2)     1.0
            set ::ms::data($w,yview_diff) 1.0

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
            #       To make a frame styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **frame** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)      Tk
            set ::ms::managed_by($w,bordercolor)     Tk
            set ::ms::managed_by($w,borderwidth)     Tk
            set ::ms::managed_by($w,cursor)          Tk
            set ::ms::managed_by($w,darkcolor)       Tk
            set ::ms::managed_by($w,lightcolor)      Tk
            set ::ms::managed_by($w,padding)         Tk
            set ::ms::managed_by($w,relief)          Tk
            set ::ms::managed_by($w,shellbackground) Tk

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
                    -height {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,height) $value
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
                    -scrollable {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,scrollable) false }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,scrollable) true }
                        }
                    }
                    -shellbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,shellbackground)    $value
                        set ::ms::managed_by($w,shellbackground) developer
                    }
                    -state {}
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TFrame' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TFrame]
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
                    -width {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,width) $value
                    }
                    -xscrollincrement {
                        switch -- [string is integer -strict $value] {
                            1   { set ::ms::current($w,xscrollincrement) $value }
                        }
                    }
                    -yscrollincrement {
                        switch -- [string is integer -strict $value] {
                            1   { set ::ms::current($w,yscrollincrement) $value }
                        }
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::frame(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TFrame,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'borderwidth', 'cursor', 'padding' and 'relief' are not allowed to change
            #       if the statespec changes.

            # Check if the widget to create needs to be scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false {
                    ##########################
                    ##                      ##
                    ##     SIMPLE FRAME     ##
                    ##                      ##
                    ##########################

                    # Set the actual xscrollincrement and yscrollincrement.
                    set ::ms::current($w,xscrollincrement) 0
                    set ::ms::current($w,yscrollincrement) 0

                    ###################
                    ##               ##
                    ##     FRAME     ##
                    ##               ##
                    ###################

                    # Set the widget style name.
                    set ::ms::style($w,widget) [string cat "_bg=" $::ms::current($w,background) \
                                                           "_bc=" $::ms::current($w,bordercolor) \
                                                           "_dc=" $::ms::current($w,darkcolor) \
                                                           "_lc=" $::ms::current($w,lightcolor) \
                                                           "." $::ms::current($w,style)];

                    # If needed, create the widget style name.
                    if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                                     -bordercolor $::ms::current($w,bordercolor) \
                                                                       -darkcolor $::ms::current($w,darkcolor) \
                                                                      -lightcolor $::ms::current($w,lightcolor);

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

                    # Create the widget.
                    _ttk_frame $w -borderwidth $::ms::current($w,borderwidth) \
                                        -class $::ms::current($w,class) \
                                       -cursor $::ms::current($w,cursor) \
                                       -height $::ms::current($w,height) \
                                      -padding $::ms::current($w,padding) \
                                       -relief $::ms::current($w,relief) \
                                        -style $::ms::style($w,widget) \
                                    -takefocus $::ms::current($w,takefocus) \
                                        -width $::ms::current($w,width);

                    # Set the widget toplevel.
                    set ::ms::addr($w,toplevel) [_winfo toplevel $w]

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        TFrame  { bindtags $w [list $w _Frame TFrame $::ms::addr($w,toplevel) all] }
                        default { bindtags $w [list $w $::ms::current($w,class) _Frame TFrame $::ms::addr($w,toplevel) all] }
                    }

                    # Context menu
                    _bind $w <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

                    # Enter/Leave
                    _bind $w <Enter> { ::ms::frame::Pathname_Cmd %W state  hover; break }
                    _bind $w <Leave> { ::ms::frame::Pathname_Cmd %W state !hover; break }

                    # Add the simple frame to the related toplevel keyboard pages navigation bindings.
                    ::ms::Enable_Traversal $w

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short address relative to its real address, 'w'.
                    set ::ms::addr($w,short) $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals)  $w
                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w

                    # Set the structure address.
                    set ::ms::addr($w,structure) [list $w]
                }
                true {
                    ##############################
                    ##                          ##
                    ##     SCROLLABLE FRAME     ##
                    ##                          ##
                    ##############################

                    # Set the default height and width.
                    set ::ms::default($w,height) 500
                    set ::ms::default($w,width)  500

                    # Check if the height provided is zero.
                    switch -- $::ms::current($w,height) {
                        0   { set ::ms::current($w,height) $::ms::default($w,height) }
                    }

                    # Check if the width provided is zero.
                    switch -- $::ms::current($w,width) {
                        0   { set ::ms::current($w,width) $::ms::default($w,width) }
                    }

                    # Convert the current height and width in pixels.
                    set height [::ms::Convert_Measure $::ms::current($w,height) "" $::ms::default($w,height)]
                    set width  [::ms::Convert_Measure $::ms::current($w,width)  "" $::ms::default($w,width)]

                    set ::ms::data($w,height)    $height
                    set ::ms::data($w,reqheight) $height
                    set ::ms::data($w,width)     $width
                    set ::ms::data($w,reqwidth)  $width

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

                    ####################
                    ##                ##
                    ##     BORDER     ##
                    ##                ##
                    ####################

                    # Set the border object style name.
                    set ::ms::style($w,border) [string cat "_bg=" $::ms::current($w,background) \
                                                           "_bc=" $::ms::current($w,bordercolor) \
                                                           "_dc=" $::ms::current($w,darkcolor) \
                                                           "_lc=" $::ms::current($w,lightcolor) \
                                                           ".TFrame"];

                    # If needed, create the border object style name.
                    if { $::ms::style($w,border) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,border)  -background $::ms::current($w,background) \
                                                                     -bordercolor $::ms::current($w,bordercolor) \
                                                                       -darkcolor $::ms::current($w,darkcolor) \
                                                                      -lightcolor $::ms::current($w,lightcolor);

                        # Add the border object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,border)
                    }

                    # Initialize the border object mapping.
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

                    # If needed, create the border object mapping.
                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                        _ttk_style map $::ms::style($w,border) {*}$mapping

                        # Add the border object mapping to the stylemap list containing all the mappings
                        # created by mustang for the current theme.
                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                    }

                    # Create the border object.
                    _ttk_frame $w.border -borderwidth $::ms::current($w,borderwidth) \
                                               -class TFrame \
                                              -cursor arrow \
                                              -height 0 \
                                             -padding 0 \
                                              -relief $::ms::current($w,relief) \
                                               -style $::ms::style($w,border) \
                                           -takefocus 0 \
                                               -width 0;

                    # Grid the border object.
                    _grid $w.border -column 0 \
                                      -padx 0 \
                                      -pady 0 \
                                       -row 0 \
                                    -sticky nesw;

                                    ##################################
                    ##                              ##
                    ##     VIEWPORT AND CONTENT     ##
                    ##                              ##
                    ##################################

                    # Note: The viewport and the content objects will have the same style, '::ms::style($w,content)'.

                    # Set the content and viewport objects style name.
                    set ::ms::style($w,content) [string cat "_bg=" $::ms::current($w,background) \
                                                            "." $::ms::current($w,style)];

                    # If needed, create the content and viewport objects style name.
                    if { $::ms::style($w,content) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,content) -background $::ms::current($w,background)

                        # Add the content and viewport objects style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,content)
                    }

                    # Initialize the content and viewport objects mapping.
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

                    # If needed, create the content and viewport objects mapping.
                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                        _ttk_style map $::ms::style($w,content) {*}$mapping

                        # Add the content and viewport objects mapping to the stylemap list containing all the mappings
                        # created by mustang for the current theme.
                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                    }

                    # Create the viewport object.
                    _ttk_frame $w.border.viewport -borderwidth 0 \
                                                        -class TFrame \
                                                       -cursor $::ms::current($w,cursor) \
                                                       -height $::ms::data($w,height) \
                                                      -padding 0 \
                                                       -relief flat \
                                                        -style $::ms::style($w,content) \
                                                    -takefocus 0 \
                                                        -width $::ms::data($w,width);

                    # Pack the viewport object.
                    _pack $w.border.viewport -anchor nw \
                                             -expand true \
                                               -fill both \
                                               -padx 0 \
                                               -pady 0 \
                                               -side top;

                    # Create the content object.
                    _ttk_frame $w.border.viewport.content -borderwidth 0 \
                                                                -class $::ms::current($w,class) \
                                                               -cursor $::ms::current($w,cursor) \
                                                               -height $::ms::data($w,height) \
                                                              -padding $::ms::current($w,padding) \
                                                               -relief flat \
                                                                -style $::ms::style($w,content) \
                                                            -takefocus $::ms::current($w,takefocus) \
                                                                -width $::ms::data($w,width);

                    # Place the content object.
                    _place $w.border.viewport.content     -anchor nw \
                                                      -bordermode outside \
                                                              -in $w.border.viewport \
                                                       -relheight 1.0 \
                                                        -relwidth 1.0 \
                                                            -relx 0 \
                                                            -rely 0;

                    # Note: The widget's content is placed by the 'place' geometry manager.
                    #       The reasons around the 'place' choice is to intercepts any widget dimensions
                    #       changes or scrolls upon it.

                    ########################
                    ##                    ##
                    ##     SCROLLBARS     ##
                    ##                    ##
                    ########################

                    # Create the horizontal scrollbar address.
                    _ttk_scrollbar $w.x     -class TScrollbar \
                                          -command "" \
                                           -cursor arrow \
                                           -orient horizontal \
                                            -style TScrollbar \
                                        -takefocus 0;

                    # Create the vertical scrollbar address.
                    _ttk_scrollbar $w.y     -class TScrollbar \
                                          -command "" \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        TFrame  { bindtags $w [list $w _Frame TFrame $::ms::addr($w,toplevel) all] }
                        default { bindtags $w [list $w $::ms::current($w,class) _Frame TFrame $::ms::addr($w,toplevel) all] }
                    }

                    # ButtonPress-1
                    _bind $w.border                  <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }
                    _bind $w.border.viewport.content <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent [_winfo parent [_winfo parent %W]]]; break }

                    _bind $w.x <ButtonPress-1>   { ::ms::frame::Scrollbar_ButtonPress [_winfo parent %W] horizontal %x %y; break }
                    _bind $w.x <B1-Motion>       { ::ms::frame::Scrollbar_Drag        [_winfo parent %W] horizontal %x %y; break }
                    _bind $w.x <ButtonRelease-1> { ::ms::frame::Scrollbar_ButtonRelease; break }

                    _bind $w.y <ButtonPress-1>   { ::ms::frame::Scrollbar_ButtonPress [_winfo parent %W] vertical %x %y; break }
                    _bind $w.y <B1-Motion>       { ::ms::frame::Scrollbar_Drag        [_winfo parent %W] vertical %x %y; break }
                    _bind $w.y <ButtonRelease-1> { ::ms::frame::Scrollbar_ButtonRelease; break }

                    # Contextual menu
                    _bind $w                         <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }
                    _bind $w.border                  <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }
                    _bind $w.border.viewport.content <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent [_winfo parent [_winfo parent %W]]] %X %Y cmenu; break }

                    # Configure
                    _bind $w.border.viewport         <Configure> { ::ms::frame::Configure [_winfo parent [_winfo parent %W]] %w %h; break }
                    _bind $w.border.viewport.content <Configure> { update; break }

                    # Enter/Leave
                    _bind $w                         <Enter> { ::ms::frame::Hover %W %X %Y; break }
                    _bind $w.border                  <Enter> { ::ms::frame::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.border.viewport.content <Enter> { ::ms::frame::Hover [_winfo parent [_winfo parent [_winfo parent %W]]] %X %Y; break }
                    _bind $w.x                       <Enter> { ::ms::frame::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.y                       <Enter> { ::ms::frame::Hover [_winfo parent %W] %X %Y; break }

                    _bind $w                         <Leave> { ::ms::frame::Hover %W %X %Y; break }
                    _bind $w.border                  <Leave> { ::ms::frame::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.border.viewport.content <Leave> { ::ms::frame::Hover [_winfo parent [_winfo parent [_winfo parent %W]]] %X %Y; break }
                    _bind $w.x                       <Leave> { ::ms::frame::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.y                       <Leave> { ::ms::frame::Hover [_winfo parent %W] %X %Y; break }

                    # FocusIn/FocusOut
                    _bind $w.border.viewport.content <FocusIn>  { ::ms::frame::Focus_In  [_winfo parent [_winfo parent [_winfo parent %W]]]; break }
                    _bind $w.border.viewport.content <FocusOut> { ::ms::frame::Focus_Out [_winfo parent [_winfo parent [_winfo parent %W]]]; break }

                    # Mousewheel and Touchpad

                    # If the widget's vertical scrollbar is active, move the widget's content zone by one unit
                    # up or down (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.y                       <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }
                    _bind $w.border                  <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }
                    _bind $w.border.viewport.content <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent [_winfo parent %W]]] %D units; break }

                    # If the widget's horizontal scrollbar is active, move the widget's content zone by one unit
                    # left or right (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.x                       <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
                    _bind $w.border                  <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
                    _bind $w.border.viewport.content <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent [_winfo parent %W]]] %D units; break }

                    # If the widget's vertical scrollbar is active, move the widget's content zone by one page
                    # up or down (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one page up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.y                       <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }
                    _bind $w.border                  <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }
                    _bind $w.border.viewport.content <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent [_winfo parent %W]]] %D pages; break }

                    # If the widget's horizontal scrollbar is active, move the widget's content zone by one page
                    # left or right (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one page left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.x                       <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
                    _bind $w.border                  <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
                    _bind $w.border.viewport.content <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent [_winfo parent %W]]] %D pages; break }

                    # Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
                    #       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

                    # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
                    # These two planes may involve different widgets depending on the active scrollbars on them and on the
                    # touchpad direction.
                    #   1 - If the widget's horizontal scrollbar is active, move the widget's content zone by one unit
                    #       left or right (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    #       and move that scrollbar by one unit left or right (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
                    #
                    #   2 - If the widget's vertical scrollbar is active, move the widget's content zone by one unit
                    #       up or down (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    #       and move that scrollbar by one unit up or down (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
                    _bind $w.x                       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }
                    _bind $w.y                       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }
                    _bind $w.border                  <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }
                    _bind $w.border.viewport.content <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent [_winfo parent %W]]] %# %D units; break }

                    # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
                    # These two planes may involve different widgets depending on the active scrollbars on them and on the
                    # touchpad direction.
                    #   1 - If the widget's horizontal scrollbar is active, move the widget's content zone by one page
                    #       left or right (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    #       and move that scrollbar by one page left or right (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
                    #
                    #   2 - If the widget's vertical scrollbar is active, move the widget's content zone by one page
                    #       up or down (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    #       and move that scrollbar by one page up or down (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
                    _bind $w.x                       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }
                    _bind $w.y                       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }
                    _bind $w.border                  <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }
                    _bind $w.border.viewport.content <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent [_winfo parent %W]]] %# %D pages; break }

                    # Add the scrollable frame to the related toplevel keyboard pages navigation bindings.
                    ::ms::Enable_Traversal $w

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Configure the internal widget rows and columns.
                    _grid rowconfigure    $w [list 0] -weight 1
                    _grid columnconfigure $w [list 0] -weight 1

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses relative to its real address, 'w'.
                    # They will all point to the widget hull object short address.
                    set ::ms::addr($w,short)                         $short_addr
                    set ::ms::addr($w.border,short)                  $short_addr
                    set ::ms::addr($w.border.viewport,short)         $short_addr
                    set ::ms::addr($w.border.viewport.content,short) $short_addr
                    set ::ms::addr($w.x,short)                       $short_addr
                    set ::ms::addr($w.y,short)                       $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.border \
                                              $w.border.viewport \
                                              $w.border.viewport.content \
                                              $w.x \
                                              $w.y;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.border

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.border.viewport.content

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.border \
                                                       $w.border.viewport \
                                                       $w.border.viewport.content];

                    # Add the widget address to the megawidget addresses list.
                    lappend ::ms::addr(megawidgets) $w

                    # Add the widget address to the megawidget container addresses list.
                    lappend ::ms::addr(megawidgets,containers) $w

                    # Add the widget address to the scrollable megawidget addresses list.
                    lappend ::ms::addr(megawidgets,scrollable) $w
                }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::frame::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::frame::Pathname_Cmd $w]
            }

            # Add the widget address to the frame widgets real address list.
            lappend ::ms::addr(frame) $w

            # Add the widget address to the frame real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),frame,addrs) $w

            # Add the widget address to the frame real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),frame,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the frame classtype.
            if { $::ms::current($w,style) ni $::ms::style(frame) } {
                lappend ::ms::style(frame) $::ms::current($w,style)
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
proc ::ms::frame::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::frame(non_styleable,options)) || ($option in $::ms::frame(styleable,options))} {
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
                    foreach option $::ms::frame(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::frame(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::frame(non_styleable,options)) || ($option in $::ms::frame(styleable,options)) } {
                        return [list $::ms::default($w,$option) $::ms::current($w,$option)]
                    } else {
                        ::ms::Error "Invalid configure option, '$args'." $caller_info
                    }
                }
                default {
                    # Check that the command's 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Note: The widget new dimensions will be updated only if they phisically change
                            #       after the configure command was issued.
                            #
                            #       Their registration (if any) is done in the '::ms::frame::Configure' event procedure.
                            set ::ms::temp($w,height) $::ms::current($w,height)
                            set ::ms::temp($w,width)  $::ms::current($w,width)

                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the remaining widget's options, if any.
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
                                    -borderwidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,borderwidth)    $value
                                        set ::ms::managed_by($w,borderwidth) developer
                                    }
                                    -class {}
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
                                    -height {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                            default {
                                                # Check if the widget is scrollable or not.
                                                switch -- $::ms::current($w,scrollable) {
                                                    true {
                                                        switch -- $value {
                                                            0   { continue }
                                                        }
                                                    }
                                                }

                                                set ::ms::temp($w,height) $value
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
                                    -scrollable {}
                                    -shellbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,shellbackground)    $value
                                        set ::ms::managed_by($w,shellbackground) developer
                                    }
                                    -state {}
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Check if exists a layout for the style provided.
                                            # If not, create one by mirroring the current theme 'TFrame' layout.
                                            if { $value ni $::ms::layouts($::ms::theme) } {
                                                _ttk_style layout $value [_ttk_style layout TFrame]
                                            }

                                            # Remove the widget address from the frame real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),frame,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),frame,addrs) [lremove $::ms::style($::ms::current($w,style),frame,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,frame,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the frame classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),frame,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(frame) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(frame) [lremove $::ms::style(frame) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the frame classtype.
                                            if { $value ni $::ms::style(frame) } {
                                                lappend ::ms::style(frame) $value
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
                                    -width {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                            default {
                                                # Check if the widget is scrollable or not.
                                                switch -- $::ms::current($w,scrollable) {
                                                    true {
                                                        switch -- $value {
                                                            0   { continue }
                                                        }
                                                    }
                                                }

                                                set ::ms::temp($w,width) $value
                                            }
                                        }
                                    }
                                    -xscrollincrement {
                                        # Check if the widget is scrollable or not.
                                        switch -- $::ms::current($w,scrollable) {
                                            true {
                                                switch -- [string is integer -strict $value] {
                                                    1   { set ::ms::current($w,xscrollincrement) $value }
                                                }
                                            }
                                        }
                                    }
                                    -yscrollincrement {
                                        # Check if the widget is scrollable or not.
                                        switch -- $::ms::current($w,scrollable) {
                                            true {
                                                switch -- [string is integer -strict $value] {
                                                    1   { set ::ms::current($w,yscrollincrement) $value }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::frame(styleable,options) {
                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'borderwidth', 'cursor', 'padding' and 'relief' are not allowed to change
                            #       if the statespec changes.

                            # Check if the widget is scrollable or not.
                            switch -- $::ms::current($w,scrollable) {
                                false {
                                    ##########################
                                    ##                      ##
                                    ##     SIMPLE FRAME     ##
                                    ##                      ##
                                    ##########################
                                }
                                true {
                                    ##############################
                                    ##                          ##
                                    ##     SCROLLABLE FRAME     ##
                                    ##                          ##
                                    ##############################
                                }
                            }
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

                    # Return the name of the object, or an empty string if there are no frame objects at the coordinates provided.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            if { $widget eq $w } {
                                return "Frame"
                            } else {
                                return ""
                            }
                        }
                        true {
                            if { $widget eq $w } {
                                return "Frame.hull"
                            } elseif { $widget eq "$w.border" } {
                                return "Frame.border"
                            } elseif { $widget eq "$w.border.viewport.content" } {
                                return "Frame"
                            } elseif { $widget eq "$w.x" } {
                                return "Frame.hscrollbar"
                            } elseif { $widget eq "$w.y" } {
                                return "Frame.vscrollbar"
                            } else {
                                return ""
                            }
                        }
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

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { return [interp invokehidden {} $w instate $statespec] }
                        true  { return [$w.border.viewport.content instate $statespec] }
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

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            # Execute the command.
                            try {
                                interp invokehidden {} $w instate $statespec $script
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        true {
                            # Execute the command.
                            try {
                                $w.border.viewport.content instate $statespec $script
                            } on error {} {
                                ::ms::Error "Invalid script." $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        see {
            # Synopsis:
            #
            # *window* **see** *widget*

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false { return "" }
                true  { set widget $args }
            }

            # Get the 'widget' real address.
            set result [::ms::Check_Pathname $widget invalid]
            switch -- $result {
                invalid { return "" }
                default { set widget_real_pathname [lindex $result 0] }
            }

            # Get the parent address of the widget real pathname.
            set parent_addr [_winfo parent $widget_real_pathname]
            switch -- $parent_addr {
                ""  { return "" }
            }

            # Start a recursive loop until either we find 'w' as parent (direct or not) of 'widget' or
            # we have no more parents to check for.
            set i 0
            while { $i == 0 } {
                # Check if the parent retrieved is equal to the scrollable frame address provided ('w').
                if { $parent_addr eq $w } {
                    update idletasks

                    set place_options [list ]

                    ##################################
                    ##                              ##
                    ##     HORIZONTAL SCROLLBAR     ##
                    ##                              ##
                    ##################################

                    switch -- $::ms::data($w,scrollx) {
                        on  {
                            # Get the widget width and horizontal coordinates.
                            set width  [_winfo width $widget_real_pathname]
                            set x1     [_winfo x $widget_real_pathname]
                            set x2     [expr { $x1+$width }]

                            # Set the widget xview1 and xview2.
                            set xview1 [expr { ($x1*1.0)/$::ms::data($w,reqwidth) }]
                            set xview2 [expr { ($x2*1.0)/$::ms::data($w,reqwidth) }]

                            if { ($xview1 >= $::ms::data($w,xview1)) && ($xview2 <= $::ms::data($w,xview2)) } {
                                # Note: The width of the widget its already entirely visible.
                                #       There will be no movement along the 'X' axis.
                            } else {
                                # Compute the movement along the 'X' axis.
                                if { [expr { ($width*1.0)/$::ms::data($w,reqwidth) }] < $::ms::data($w,xview_diff) } {
                                    # Note: The width of the widget can be entirely visible.
                                    #       If possible, we will anchor its 'X' center to the 'X' center of the 'viewport' object.
                                    #       The widget will be completely visible along the 'X' axis.

                                    set x_center        [expr { round(floor($x1+($width/2.0))) }]
                                    set xview_center    [expr { ($x_center*1.0)/$::ms::data($w,reqwidth) }]
                                    set half_xview_diff [expr { $::ms::data($w,xview_diff)/2.0 }]

                                    # Compute the new 'viewport' xview1 and xview2.
                                    set ::ms::data($w,xview1) [expr { $xview_center-$half_xview_diff }]
                                    set ::ms::data($w,xview2) [expr { $xview_center+$half_xview_diff }]

                                    if { $::ms::data($w,xview1) < 0 } {
                                        # We are near the left limit of the 'X' axis.
                                        # Change the anchoring to the left of the 'X' axis.
                                        set ::ms::data($w,xview1) 0
                                        set ::ms::data($w,xview2) $::ms::data($w,xview_diff)
                                    } elseif { $::ms::data($w,xview2) > 1.0 } {
                                        # We are near the right limit of the 'X' axis.
                                        # Change the anchoring to the right of the 'X' axis.
                                        set ::ms::data($w,xview1) [expr { 1.0-$::ms::data($w,xview_diff) }]
                                        set ::ms::data($w,xview2) 1.0
                                    }
                                } else {
                                    # Note: The width of the widget cannot be entirely visible.
                                    #       We will anchor its 'X' west to the 'X' west of the 'viewport' object.
                                    #       The widget will be partially visible along the 'X' axis.

                                    # Compute the new 'viewport' xview1 and xview2.
                                    set ::ms::data($w,xview1) [expr { ($x1*1.0)/$::ms::data($w,reqwidth) }]
                                    set ::ms::data($w,xview2) [expr { $::ms::data($w,xview1)+$::ms::data($w,xview_diff) }]
                                }

                                # Compute the content scroll along the 'X' axis.
                                set x [expr { round(floor(-$::ms::data($w,xview1)*$::ms::data($w,reqwidth))) }]

                                # Horizontal scroll stopper.
                                set x_limit [expr { round(floor(($::ms::data($w,reqwidth)-($::ms::data($w,reqwidth)*$::ms::data($w,xview_diff)))*-1.0)) }]
                                if { $x < $x_limit } {
                                    set x $x_limit
                                }

                                # Register the 'content' object place 'x' coordinate to enforce.
                                lappend place_options -x $x

                                # Update the horizontal scrollbar thumb position.
                                $w.x set $::ms::data($w,xview1) $::ms::data($w,xview2)
                            }
                        }
                    }

                    ################################
                    ##                            ##
                    ##     VERTICAL SCROLLBAR     ##
                    ##                            ##
                    ################################

                    switch -- $::ms::data($w,scrolly) {
                        on  {
                            # Get the widget height and vertical coordinates.
                            set height [_winfo height $widget_real_pathname]
                            set y1     [_winfo y $widget_real_pathname]
                            set y2     [expr { $y1+$height }]

                            # Set the widget yview1 and yview2.
                            set yview1 [expr { ($y1*1.0)/$::ms::data($w,reqheight) }]
                            set yview2 [expr { ($y2*1.0)/$::ms::data($w,reqheight) }]

                            if { ($yview1 >= $::ms::data($w,yview1)) && ($yview2 <= $::ms::data($w,yview2)) } {
                                # Note: The height of the widget its already entirely visible.
                                #       There will be no movement along the 'Y' axis.
                            } else {
                                # Compute the movement along the 'Y' axis.
                                if { [expr { ($height*1.0)/$::ms::data($w,reqheight) }] < $::ms::data($w,yview_diff) } {
                                    # Note: The height of the widget can be entirely visible.
                                    #       If possible, we will anchor its 'Y' center to the 'Y' center of the 'viewport' object.
                                    #       The widget will be completely visible along the 'Y' axis.

                                    set y_center        [expr { round(floor($y1+($height/2.0))) }]
                                    set yview_center    [expr { ($y_center*1.0)/$::ms::data($w,reqheight) }]
                                    set half_yview_diff [expr { $::ms::data($w,yview_diff)/2.0 }]

                                    # Compute the new 'viewport' yview1 and yview2.
                                    set ::ms::data($w,yview1) [expr { $yview_center-$half_yview_diff }]
                                    set ::ms::data($w,yview2) [expr { $yview_center+$half_yview_diff }]

                                    if { $::ms::data($w,yview1) < 0 } {
                                        # We are near the upper limit of the 'Y' axis.
                                        # Change the anchoring to the top of the 'Y' axis.
                                        set ::ms::data($w,yview1) 0
                                        set ::ms::data($w,yview2) $::ms::data($w,yview_diff)
                                    } elseif { $::ms::data($w,yview2) > 1.0 } {
                                        # We are near the lower limit of the 'Y' axis.
                                        # Change the anchoring to the bottom of the 'Y' axis.
                                        set ::ms::data($w,yview1) [expr { 1.0-$::ms::data($w,yview_diff) }]
                                        set ::ms::data($w,yview2) 1.0
                                    }
                                } else {
                                    # Note: The height of the widget cannot be entirely visible.
                                    #       We will anchor its 'Y' north to the 'Y' north of the 'viewport' object.
                                    #       The widget will be partially visible along the 'Y' axis.

                                    # Compute the new 'viewport' yview1 and yview2.
                                    set ::ms::data($w,yview1) [expr { ($y1*1.0)/$::ms::data($w,reqheight) }]
                                    set ::ms::data($w,yview2) [expr { $::ms::data($w,yview1)+$::ms::data($w,yview_diff) }]
                                }

                                # Compute the content scroll along the 'Y' axis.
                                set y [expr { round(floor(-$::ms::data($w,yview1)*$::ms::data($w,reqheight))) }]

                                # Vertical scroll stopper.
                                set y_limit [expr { round(floor(($::ms::data($w,reqheight)-($::ms::data($w,reqheight)*$::ms::data($w,yview_diff)))*-1.0)) }]
                                if { $y < $y_limit } {
                                    set y $y_limit
                                }

                                # Register the 'content' object place 'y' coordinate to enforce.
                                lappend place_options -y $y

                                # Update the vertical scrollbar thumb position.
                                $w.y set $::ms::data($w,yview1) $::ms::data($w,yview2)
                            }
                        }
                    }

                    # Scroll the 'content' object of the scrollablle frame, if needed.
                    switch -- $place_options {
                        ""      {}
                        default { _place configure $w.border.viewport.content {*}$place_options }
                    }

                    break
                }

                # Continue the recursive loop, if needed.
                set parent_addr [_winfo parent $parent_addr]
                switch -- $parent_addr {
                    ""  { break }
                }
            }

            return ""
        }
        state {
            # Synopsis:
            #
            # *window* **state** ?*statespec*?
            switch -- [llength $args] {
                0   {
                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { return [interp invokehidden {} $w state] }
                        true  { return [$w.border.viewport.content state] }
                    }
                }
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

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false { return [interp invokehidden {} $w state $statespec] }
                        true  {
                            # Propagate the new statespec to the hull, border and content objects of
                            # the scrollable frame.
                            interp invokehidden {} $w state $statespec
                            $w.border state $statespec

                            return [$w.border.viewport.content state $statespec]
                        }
                    }
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
            # *window* **xview**
            # *window* **xview** **moveto** *fraction*
            # *window* **xview** **scroll** *number* *what*

            # Check if the widget has an active horizontal scrollbar.
            switch -- $::ms::data($w,scrollx) {
                on  {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    switch -nocase -- $subcommand {
                        ""     { return [list $::ms::data($w,xview1) $::ms::data($w,xview2)] }
                        moveto {
                            # Check the number of arguments provided (after the 'moveto' word).
                            switch -- [llength $args] {
                                1       {}
                                default { return "" }
                            }

                            # Check the fraction provided.
                            set fraction $args
                            switch -- [string is double -strict $fraction] {
                                0   { return "" }
                            }

                            # Check that fraction is inside its limits [0,1.0].
                            if { $fraction < 0 } {
                                set fraction 0
                            } elseif { $fraction > 1.0 } {
                                set fraction 1.0
                            }

                            # For performance reasons, we avoid the computation for the following cases:
                            if { $::ms::data($w,xview1) == $fraction } {
                                return ""
                            } elseif { ($::ms::data($w,xview2) == 1.0) && ($::ms::data($w,xview1) <= $fraction) } {
                                return ""
                            }

                            # Position the thumb with it's center placed at fraction.
                            set half_xview_diff       [expr { $::ms::data($w,xview_diff)/2.0 }]
                            set ::ms::data($w,xview1) [expr { $fraction-$half_xview_diff }]
                            set ::ms::data($w,xview2) [expr { $fraction+$half_xview_diff }]

                            if { $::ms::data($w,xview1) < 0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the left side of the scrollbar.
                                set ::ms::data($w,xview1) 0
                                set ::ms::data($w,xview2) $::ms::data($w,xview_diff)
                            } elseif { $::ms::data($w,xview2) > 1.0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the right side of the scrollbar.
                                set ::ms::data($w,xview1) [expr { 1.0-$::ms::data($w,xview_diff) }]
                                set ::ms::data($w,xview2) 1.0
                            }

                            # Compute the new horizontal coordinate of the content object.
                            set x [expr { round(floor(-$::ms::data($w,xview1)*$::ms::data($w,reqwidth))) }]

                            # Horizontal scroll stopper.
                            set x_limit [expr { round(floor(($::ms::data($w,reqwidth)-($::ms::data($w,reqwidth)*$::ms::data($w,xview_diff)))*-1.0)) }]
                            if { $x < $x_limit } {
                                set x $x_limit
                            }

                            # Move the content object horizontally.
                            _place configure $w.border.viewport.content -x $x

                            # Update the horizontal scrollbar thumb position.
                            $w.x set $::ms::data($w,xview1) $::ms::data($w,xview2)

                            return ""
                        }
                        scroll {
                            # Check the number of arguments provided (after the 'scroll' word).
                            switch -- [llength $args] {
                                2       {}
                                default { return "" }
                            }

                            # Check the 'number'.
                            set number [lindex $args 0]
                            switch -- [string is double -strict $number] {
                                0   { return "" }
                            }

                            # Check the 'what'.
                            switch -nocase -- [lindex $args 1] {
                                pages {
                                    # Note: A 'page' is 9/10 of the viewport width.
                                    set page   [expr { $::ms::data($w,width)*0.9 }]
                                    set amount [expr { $number*$page }]
                                }
                                units {
                                    if { $::ms::current($w,xscrollincrement) > 0 } {
                                        # Note: A 'unit' is '::ms::current($w,xscrollincrement)'.
                                        set unit   $::ms::current($w,xscrollincrement)
                                        set amount [expr { $number*$unit }]
                                    } else {
                                        # Note: A 'unit' is 1/10 of the viewport width.
                                        set unit   [expr { $::ms::data($w,width)*0.1 }]
                                        set amount [expr { $number*$unit }]
                                    }
                                }
                                default { return "" }
                            }

                            # Compute the fraction [0,1.0].
                            set fraction [expr { $::ms::data($w,xview1)+($amount/($::ms::data($w,reqwidth)*1.0)) }]
                            if { $fraction < 0 } {
                                set fraction 0
                            } elseif { $fraction > 1.0 } {
                                set fraction 1.0
                            }

                            # For performance reasons, we avoid the computation for the following cases:
                            if { $::ms::data($w,xview1) == $fraction } {
                                return ""
                            } elseif { ($::ms::data($w,xview2) == 1.0) && ($::ms::data($w,xview1) <= $fraction) } {
                                return ""
                            }

                            # Update the content area along the horizontal axis.
                            set ::ms::data($w,xview1) $fraction
                            set ::ms::data($w,xview2) [expr { $::ms::data($w,xview1)+$::ms::data($w,xview_diff) }]
                            if {$::ms::data($w,xview2) > 1.0} {
                                # Override the previous coordinates.
                                # Position the thumb on the right side of the scrollbar.
                                set ::ms::data($w,xview1) [expr { 1.0-$::ms::data($w,xview_diff) }]
                                set ::ms::data($w,xview2) 1.0
                            }

                            # Compute the new horizontal coordinate of the content object.
                            set x [expr { round(floor(-$::ms::data($w,xview1)*$::ms::data($w,reqwidth))) }]

                            # Horizontal scroll stopper.
                            set x_limit [expr { round(floor(($::ms::data($w,reqwidth)-($::ms::data($w,reqwidth)*$::ms::data($w,xview_diff)))*-1.0)) }]
                            if { $x < $x_limit } {
                                set x $x_limit
                            }

                            # Move the content object horizontally.
                            _place configure $w.border.viewport.content -x $x

                            # Update the horizontal scrollbar thumb position.
                            $w.x set $::ms::data($w,xview1) $::ms::data($w,xview2)

                            return ""
                        }
                        default { ::ms::Error "Invalid xview option, '$subcommand'." $caller_info }
                    }
                }
            }

            return ""
        }
        yview {
            # Synopsis:
            #
            # *window* **yview**
            # *window* **yview** **moveto** *fraction*
            # *window* **yview** **scroll** *number* *what*

            # Check if the widget has an active vertical scrollbar.
            switch -- $::ms::data($w,scrolly) {
                on  {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    switch -nocase -- $subcommand {
                        ""     { return [list $::ms::data($w,yview1) $::ms::data($w,yview2)] }
                        moveto {
                            # Check the number of arguments provided (after the 'moveto' word).
                            switch -- [llength $args] {
                                1       {}
                                default { return "" }
                            }

                            # Check the fraction provided.
                            set fraction $args
                            switch -- [string is double -strict $fraction] {
                                0   { return "" }
                            }

                            # Check that fraction is inside its limits [0,1.0].
                            if { $fraction < 0 } {
                                set fraction 0
                            } elseif { $fraction > 1.0 } {
                                set fraction 1.0
                            }

                            # For performance reasons, we avoid the computation for the following cases:
                            if { $::ms::data($w,yview1) == $fraction } {
                                return ""
                            } elseif { ($::ms::data($w,yview2) == 1.0) && ($::ms::data($w,yview1) <= $fraction) } {
                                return ""
                            }

                            # Position the thumb with it's center placed at fraction.
                            set half_yview_diff       [expr { $::ms::data($w,yview_diff)/2.0 }]
                            set ::ms::data($w,yview1) [expr { $fraction-$half_yview_diff }]
                            set ::ms::data($w,yview2) [expr { $fraction+$half_yview_diff }]

                            if { $::ms::data($w,yview1) < 0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the top side of the scrollbar.
                                set ::ms::data($w,yview1) 0
                                set ::ms::data($w,yview2) $::ms::data($w,yview_diff)
                            } elseif { $::ms::data($w,yview2) > 1.0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the bottom side of the scrollbar.
                                set ::ms::data($w,yview1) [expr { 1.0-$::ms::data($w,yview_diff) }]
                                set ::ms::data($w,yview2) 1.0
                            }

                            # Compute the new vertical coordinate of the content object.
                            set y [expr { round(floor(-$::ms::data($w,yview1)*$::ms::data($w,reqheight))) }]

                            # Vertical scroll stopper.
                            set y_limit [expr { round(floor(($::ms::data($w,reqheight)-($::ms::data($w,reqheight)*$::ms::data($w,yview_diff)))*-1.0)) }]
                            if { $y < $y_limit } {
                                set y $y_limit
                            }

                            # Move the content object vertically.
                            _place configure $w.border.viewport.content -y $y

                            # Update the vertical scrollbar thumb position.
                            $w.y set $::ms::data($w,yview1) $::ms::data($w,yview2)

                            return ""
                        }
                        scroll {
                            # Check the number of arguments provided (after the 'scroll' word).
                            switch -- [llength $args] {
                                2       {}
                                default { return "" }
                            }

                            # Check the 'number'.
                            set number [lindex $args 0]
                            switch -- [string is double -strict $number] {
                                0   { return "" }
                            }

                            # Check the 'what'.
                            switch -nocase -- [lindex $args 1] {
                                pages {
                                    # Note: A 'page' is 9/10 of the viewport height.
                                    set page   [expr { $::ms::data($w,height)*0.9 }]
                                    set amount [expr { $number*$page }]
                                }
                                units {
                                    if { $::ms::current($w,yscrollincrement) > 0 } {
                                        # Note: A 'unit' is '::ms::current($w,yscrollincrement)'.
                                        set unit   $::ms::current($w,yscrollincrement)
                                        set amount [expr { $number*$unit }]
                                    } else {
                                        # Note: A 'unit' is 1/10 of the viewport height.
                                        set unit   [expr { $::ms::data($w,height)*0.1 }]
                                        set amount [expr { $number*$unit }]
                                    }
                                }
                                default { return "" }
                            }

                            # Compute the fraction [0,1.0].
                            set fraction [expr { $::ms::data($w,yview1)+($amount/($::ms::data($w,reqheight)*1.0)) }]
                            if {$fraction < 0} {
                                set fraction 0
                            } elseif {$fraction > 1.0} {
                                set fraction 1.0
                            }

                            # For performance reasons, we avoid the computation for the following cases:
                            if { $::ms::data($w,yview1) == $fraction } {
                                return ""
                            } elseif { ($::ms::data($w,yview2) == 1.0) && ($::ms::data($w,yview1) <= $fraction) } {
                                return ""
                            }

                            # Update the content area along the vertical axis.
                            set ::ms::data($w,yview1) $fraction
                            set ::ms::data($w,yview2) [expr { $::ms::data($w,yview1)+$::ms::data($w,yview_diff) }]
                            if { $::ms::data($w,yview2) > 1.0 } {
                                # Override the previous coordinates.
                                # Position the thumb on the bottom side of the scrollbar.
                                set ::ms::data($w,yview1) [expr { 1.0-$::ms::data($w,yview_diff) }]
                                set ::ms::data($w,yview2) 1.0
                            }

                            # Compute the new vertical coordinate of the content object.
                            set y [expr { round(floor(-$::ms::data($w,yview1)*$::ms::data($w,reqheight))) }]

                            # Vertical scroll stopper.
                            set y_limit [expr { round(floor(($::ms::data($w,reqheight)-($::ms::data($w,reqheight)*$::ms::data($w,yview_diff)))*-1.0)) }]
                            if { $y < $y_limit } {
                                set y $y_limit
                            }

                            # Move the content object vertically.
                            _place configure $w.border.viewport.content -y $y

                            # Update the vertical scrollbar thumb position.
                            $w.y set $::ms::data($w,yview1) $::ms::data($w,yview2)

                            return ""
                        }
                        default { ::ms::Error "Invalid yview option, '$subcommand'." $caller_info }
                    }
                }
            }

            return ""
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
# Update any frame widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::frame::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*