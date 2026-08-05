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
proc ::ms::frame::Pathname_Cmd { w cmd args } {}

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