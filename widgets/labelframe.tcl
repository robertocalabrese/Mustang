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
package provide ::ms::labelframe 0.1

##################################
##                              ##
##     _LABELFRAME BINDINGS     ##
##                              ##
##################################

# Activate/Deactivate
_bind _Labelframe <Activate>   { ::ms::labelframe::Pathname_Cmd %W state !background; break }
_bind _Labelframe <Deactivate> { ::ms::labelframe::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Labelframe <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Labelframe <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Delete
_bind _Labelframe <Destroy> { ::ms::labelframe::Destroy %W; break }

# Enter/Leave
_bind _Labelframe <Enter> { ::ms::labelframe::Hover %W %X %Y; break }
_bind _Labelframe <Leave> { ::ms::labelframe::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Labelframe <FocusIn>  { ::ms::labelframe::Focus_In  %W; break }
_bind _Labelframe <FocusOut> { ::ms::labelframe::Focus_Out %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Labelframe <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Labelframe <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Labelframe <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Labelframe <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Labelframe <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Labelframe <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **labelframe** package.
namespace eval ::ms::labelframe {
    # Set the labelframe 'non-styleable' labelframe option list.
    set ::ms::labelframe(non_styleable,options) [list class \
                                                      cmenu \
                                                      height \
                                                      scrollable \
                                                      state \
                                                      style \
                                                      takefocus \
                                                      text \
                                                      textvariable \
                                                      width \
                                                      xscrollincrement \
                                                      yscrollincrement];

    # Set the labelframe 'styleable' labelframe option list.
    set ::ms::labelframe(styleable,options) [list anchor \
                                                  background \
                                                  bordercolor \
                                                  borderwidth \
                                                  compound \
                                                  cursor \
                                                  darkcolor \
                                                  font \
                                                  foreground \
                                                  image \
                                                  lightcolor \
                                                  padding \
                                                  relief \
                                                  shellbackground];

    # Set the default 'non-styleable' labelframe options values.
    set ::ms::default(labelframe,class)            TLabelframe
    set ::ms::default(labelframe,cmenu)            {}
    set ::ms::default(labelframe,height)           500
    set ::ms::default(labelframe,scrollable)       false
    set ::ms::default(labelframe,state)            normal
    set ::ms::default(labelframe,style)            TLabelframe
    set ::ms::default(labelframe,takefocus)        0
    set ::ms::default(labelframe,text)             {}
    set ::ms::default(labelframe,textvariable)     {}
    set ::ms::default(labelframe,width)            500
    set ::ms::default(labelframe,xscrollincrement) 0
    set ::ms::default(labelframe,yscrollincrement) 0

    # Note: The default 'styleable' options values are always defined inside the current theme.
}

# Rename the original Tk **labelframe** and **ttk::labelframe** commands.
rename labelframe      _labelframe
rename ttk::labelframe _ttk_labelframe

# Create aliases for the mustang **labelframe** command.
interp alias {} labelframe      {} ::ms::labelframe::Command
interp alias {} ttk::labelframe {} ::ms::labelframe::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **labelframe** and **ttk::labelframe** widgets commands.
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
proc ::ms::labelframe::Command { window { args "" } } {
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
            set ::ms::default($w,class)            $::ms::default(labelframe,class)
            set ::ms::default($w,cmenu)            $::ms::default(labelframe,cmenu)
            set ::ms::default($w,height)           $::ms::default(labelframe,height)
            set ::ms::default($w,scrollable)       $::ms::default(labelframe,scrollable)
            set ::ms::default($w,state)            $::ms::default(labelframe,state)
            set ::ms::default($w,style)            $::ms::default(labelframe,style)
            set ::ms::default($w,takefocus)        $::ms::default(labelframe,takefocus)
            set ::ms::default($w,text)             $::ms::default(labelframe,text)
            set ::ms::default($w,textvariable)     $::ms::default(labelframe,textvariable)
            set ::ms::default($w,width)            $::ms::default(labelframe,width)
            set ::ms::default($w,xscrollincrement) $::ms::default(labelframe,xscrollincrement)
            set ::ms::default($w,yscrollincrement) $::ms::default(labelframe,yscrollincrement)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)            $::ms::default(labelframe,class)
            set ::ms::current($w,cmenu)            $::ms::default(labelframe,cmenu)
            set ::ms::current($w,height)           $::ms::default(labelframe,height)
            set ::ms::current($w,scrollable)       $::ms::default(labelframe,scrollable)
            set ::ms::current($w,state)            $::ms::default(labelframe,state)
            set ::ms::current($w,style)            $::ms::default(labelframe,style)
            set ::ms::current($w,takefocus)        $::ms::default(labelframe,takefocus)
            set ::ms::current($w,text)             $::ms::default(labelframe,text)
            set ::ms::current($w,textvariable)     $::ms::default(labelframe,textvariable)
            set ::ms::current($w,width)            $::ms::default(labelframe,width)
            set ::ms::current($w,xscrollincrement) $::ms::default(labelframe,xscrollincrement)
            set ::ms::current($w,yscrollincrement) $::ms::default(labelframe,yscrollincrement)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)  labelframe
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
            #       To make a labelframe styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **labelframe** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,anchor)          Tk
            set ::ms::managed_by($w,background)      Tk
            set ::ms::managed_by($w,bordercolor)     Tk
            set ::ms::managed_by($w,borderwidth)     Tk
            set ::ms::managed_by($w,compound)        Tk
            set ::ms::managed_by($w,cursor)          Tk
            set ::ms::managed_by($w,darkcolor)       Tk
            set ::ms::managed_by($w,font)            Tk
            set ::ms::managed_by($w,foreground)      Tk
            set ::ms::managed_by($w,image)           Tk
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
                    -anchor {
                        set value [string tolower $value]
                        switch -- $value {
                            ne      -
                            e       { set ::ms::current($w,anchor) ne }
                            nw      -
                            w       { set ::ms::current($w,anchor) nw }
                            n       -
                            ew      -
                            we      -
                            center  { set ::ms::current($w,anchor) n }
                            default { continue }
                        }

                        set ::ms::managed_by($w,anchor) developer
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
                            default {
                                switch -- $value {
                                    0   { continue }
                                }
                            }
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
                    -compound {
                        set value [string tolower $value]
                        switch -- $value {
                            bottom  -
                            center  -
                            image   -
                            left    -
                            none    -
                            right   -
                            text    -
                            top     {
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
                    -height {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                            default {
                                switch -- $value {
                                    0   { continue }
                                }
                            }
                        }

                        set ::ms::current($w,height) $value
                    }
                    -image {
                        switch -- [::ms::Check_Image $value] {
                            invalid { continue }
                        }

                        set ::ms::current($w,image)    $value
                        set ::ms::managed_by($w,image) developer
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
                            groove  -
                            raised  -
                            ridge   -
                            solid   -
                            sunken  {
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
                            # If not, create one by mirroring the current theme 'TLabelframe' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TLabelframe]
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
                    -width {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                            default {
                                switch -- $value {
                                    0   { continue }
                                }
                            }
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
            foreach option $::ms::labelframe(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TLabelframe,$option)

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

            set background  $::ms::styleopt($::ms::theme,TLabelframe.Label,background)
            set bordercolor $::ms::styleopt($::ms::theme,TLabelframe.Label,bordercolor)
            set borderwidth $::ms::styleopt($::ms::theme,TLabelframe.Label,borderwidth)
            set charwidth   $::ms::styleopt($::ms::theme,TLabelframe.Label,charwidth)
            set darkcolor   $::ms::styleopt($::ms::theme,TLabelframe.Label,darkcolor)
            set lightcolor  $::ms::styleopt($::ms::theme,TLabelframe.Label,lightcolor)
            set padding     $::ms::styleopt($::ms::theme,TLabelframe.Label,padding)
            set relief      $::ms::styleopt($::ms::theme,TLabelframe.Label,relief)

            # Check if '::ms::current($w,style).Label' exists among the styles known by the current theme.
            # If not, set it as 'TLabelframe.Label'.
            set labelframe_title_style [string cat $::ms::current($w,style) ".Label"]
            if { ($labelframe_title_style in $::ms::style($::ms::theme)) && ($labelframe_title_style ne "TLabelframe.Label") } {
                # Check if a layout exists for '::ms::current($w,style).Label'.
                # If not, create one by mirroring the 'TLabelframe.Label' layout for the current theme.
                if { $labelframe_title_style ni $::ms::layouts($::ms::theme) } {
                    _ttk_style layout $labelframe_title_style [_ttk_style layout TLabelframe.Label]
                }

                # Get the labelframe title style options, if any.
                foreach option [list  background \
                                     bordercolor \
                                     borderwidth \
                                       charwidth \
                                       darkcolor \
                                      lightcolor \
                                         padding \
                                          relief] {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$labelframe_title_style,$option)] {
                        1   { set $option $::ms::styleopt($::ms::theme,$labelframe_title_style,$option) }
                    }
                }
            }

            # Set the anchor variable.
            switch -- $::ms::current($w,anchor) {
                ne  { set anchor ne }
                nw  { set anchor nw }
                n   { set anchor center }
            }

            # Check if the height provided is zero.
            switch -- $::ms::current($w,height) {
                0   { set ::ms::current($w,height) $::ms::default($w,height) }
            }

            # Check if the width provided is zero.
            switch -- $::ms::current($w,width) {
                0   { set ::ms::current($w,width) $::ms::default($w,width) }
            }

            # Convert the current height and width in pixels.
            set ::ms::data($w,height) [::ms::Convert_Measure $::ms::current($w,height) "" $::ms::default($w,height)]
            set ::ms::data($w,width)  [::ms::Convert_Measure $::ms::current($w,width)  "" $::ms::default($w,width)]

            # Note: 'anchor', 'borderwidth', 'compound', 'cursor', 'font', 'padding' and 'relief'
            #       are not allowed to change if the statespec changes.

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false {
                    ###############################
                    ##                           ##
                    ##     SIMPLE LABELFRAME     ##
                    ##                           ##
                    ###############################

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

                    ###################
                    ##               ##
                    ##     TITLE     ##
                    ##               ##
                    ###################

                    # Set the title object style name.
                    set ::ms::style($w,title) [string cat "_bg=" $background \
                                                          "_bc=" $bordercolor \
                                                          "_dc=" $darkcolor \
                                                          "_fg=" $::ms::current($w,foreground) \
                                                          "_lc=" $lightcolor \
                                                          "." $labelframe_title_style];

                    # If needed, create the title object style name.
                    if { $::ms::style($w,title) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,title)  -background $background \
                                                                    -bordercolor $bordercolor \
                                                                      -darkcolor $darkcolor \
                                                                     -foreground $::ms::current($w,foreground) \
                                                                     -lightcolor $lightcolor;

                        # Add the title object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,title)
                    }

                    # Initialize the title object mapping.
                    set mapping [list ]

                    # background
                    # Check if a 'background' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,background)] {
                        0   { lappend mapping -background [list pressed $background] }
                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$labelframe_title_style,background) }
                    }

                    # bordercolor
                    # Check if a 'bordercolor' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor)] {
                        0   { lappend mapping -bordercolor [list pressed $bordercolor] }
                        1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor) }
                    }

                    # darkcolor
                    # Check if a 'darkcolor' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor)] {
                        0   { lappend mapping -darkcolor [list pressed $darkcolor] }
                        1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor) }
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
                    # Check if a 'lightcolor' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor)] {
                        0   { lappend mapping -lightcolor [list pressed $lightcolor] }
                        1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor) }
                    }

                    # If needed, create the title object mapping.
                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                        _ttk_style map $::ms::style($w,title) {*}$mapping

                        # Add the title object mapping to the stylemap list containing all the mappings
                        # created by mustang for the current theme.
                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                    }

                    # Create the title object.
                    _ttk_label $w.title       -anchor $anchor \
                                         -borderwidth $borderwidth \
                                               -class $::ms::current($w,class) \
                                            -compound $::ms::current($w,compound) \
                                              -cursor $::ms::current($w,cursor) \
                                                -font $::ms::current($w,font) \
                                               -image $::ms::current($w,image) \
                                             -justify left \
                                             -padding $padding \
                                              -relief $relief \
                                               -state $::ms::current($w,state) \
                                               -style $::ms::style($w,title) \
                                           -takefocus $::ms::current($w,takefocus) \
                                                -text "" \
                                        -textvariable $textvariable \
                                           -underline -1 \
                                               -width $charwidth \
                                          -wraplength 0;

                    # Pack the title object.
                    _pack $w.title -anchor $::ms::current($w,anchor) \
                                   -expand false \
                                     -fill none \
                                     -padx 0 \
                                     -pady 0 \
                                     -side top;

                    #######################
                    ##                   ##
                    ##     CONTAINER     ##
                    ##                   ##
                    #######################

                    # Set the container object style name.
                    set ::ms::style($w,container) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                              ".TFrame"];

                    # If needed, create the container object style name.
                    if { $::ms::style($w,container) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,container) -background $::ms::current($w,shellbackground)

                        # Add the container object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,container)
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

                    # Create the container object.
                    _ttk_frame $w.container -borderwidth 0 \
                                                  -class TFrame \
                                                 -cursor arrow \
                                                 -height 0 \
                                                -padding 0 \
                                                 -relief flat \
                                                  -style $::ms::style($w,container) \
                                              -takefocus 0 \
                                                  -width 0;

                    # Pack the container object.
                    _pack $w.container -anchor nw \
                                       -expand true \
                                         -fill both \
                                         -padx 0 \
                                         -pady 0 \
                                         -side top;

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
                    _ttk_frame $w.container.border -borderwidth $::ms::current($w,borderwidth) \
                                                         -class TFrame \
                                                        -cursor arrow \
                                                        -height 0 \
                                                       -padding 0 \
                                                        -relief $::ms::current($w,relief) \
                                                         -style $::ms::style($w,border) \
                                                     -takefocus 0 \
                                                         -width 0;

                    # Pack the border object.
                    _pack $w.container.border -anchor nw \
                                              -expand true \
                                                -fill both \
                                                -padx 0 \
                                                -pady 0 \
                                                -side top;

                    #####################
                    ##                 ##
                    ##     CONTENT     ##
                    ##                 ##
                    #####################

                    # Set the content object style name.
                    set ::ms::style($w,content) [string cat "_bg=" $::ms::current($w,background) \
                                                            "." $::ms::current($w,style)];

                    # If needed, create the content object style name.
                    if { $::ms::style($w,content) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,content) -background $::ms::current($w,background)

                        # Add the content object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,content)
                    }

                    # Initialize the content object mapping.
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

                    # If needed, create the content object mapping.
                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                        _ttk_style map $::ms::style($w,content) {*}$mapping

                        # Add the content object mapping to the stylemap list containing all the mappings
                        # created by mustang for the current theme.
                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                    }

                    # Create the content object.
                    _ttk_frame $w.container.border.content -borderwidth 0 \
                                                                 -class TFrame \
                                                                -cursor $::ms::current($w,cursor) \
                                                                -height $::ms::data($w,height) \
                                                               -padding 0 \
                                                                -relief flat \
                                                                 -style $::ms::style($w,content) \
                                                             -takefocus 0 \
                                                                 -width $::ms::data($w,width);

                    # Pack the content object.
                    _pack $w.container.border.content -anchor nw \
                                                      -expand true \
                                                        -fill both \
                                                        -padx 0 \
                                                        -pady 0 \
                                                        -side top;

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        TLabelFrame { bindtags $w [list $w _LabelFrame TLabelFrame $::ms::addr($w,toplevel) all] }
                        default     { bindtags $w [list $w $::ms::current($w,class) _LabelFrame TLabelFrame $::ms::addr($w,toplevel) all] }
                    }

                    # ButtonPress-1
                    _bind $w.title            <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }
                    _bind $w.container        <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }
                    _bind $w.container.border <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent [_winfo parent %W]]; break }

                    # Contextual menu
                    _bind $w.title                    <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }
                    _bind $w.container                <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }
                    _bind $w.container.border         <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent [_winfo parent %W]] %X %Y cmenu; break }
                    _bind $w.container.border.content <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %X %Y cmenu; break }

                    # Configure
                    _bind $w.container.border.content <Configure> { ::ms::labelframe::Configure [_winfo parent [_winfo parent [_winfo parent %W]]] %w %h; break }

                    # Enter/Leave
                    _bind $w.title                    <Enter> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.container                <Enter> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.container.border         <Enter> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.container.border.content <Enter> { ::ms::labelframe::Hover [_winfo parent [_winfo parent [_winfo parent %W]]] %X %Y; break }

                    _bind $w.title                    <Leave> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.container                <Leave> { ::ms::labelframe::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.container.border         <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.container.border.content <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent [_winfo parent %W]]] %X %Y; break }

                    # FocusIn/FocusOut
                    _bind $w.container.border.content <FocusIn>  { ::ms::labelframe::Focus_In  [_winfo parent [_winfo parent [_winfo parent %W]]]; break }
                    _bind $w.container.border.content <FocusOut> { ::ms::labelframe::Focus_Out [_winfo parent [_winfo parent [_winfo parent %W]]]; break }

                    # Mousewheel and Touchpad

                    # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container                <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }
                    _bind $w.container.border         <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent [_winfo parent %W]] %D units; break }
                    _bind $w.container.border.content <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent [_winfo parent [_winfo parent %W]]] %D units; break }

                    # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container                <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }
                    _bind $w.container.border         <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent [_winfo parent %W]] %D units; break }
                    _bind $w.container.border.content <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent [_winfo parent [_winfo parent %W]]] %D units; break }

                    # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one page up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container                <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }
                    _bind $w.container.border         <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent [_winfo parent %W]] %D pages; break }
                    _bind $w.container.border.content <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent [_winfo parent [_winfo parent %W]]] %D pages; break }

                    # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one page left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container                <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }
                    _bind $w.container.border         <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent [_winfo parent %W]] %D pages; break }
                    _bind $w.container.border.content <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent [_winfo parent [_winfo parent %W]]] %D pages; break }

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
                    _bind $w.container                <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }
                    _bind $w.container.border         <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent [_winfo parent %W]] %# %D units; break }
                    _bind $w.container.border.content <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent [_winfo parent [_winfo parent %W]]] %# %D units; break }

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
                    _bind $w.container                <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }
                    _bind $w.container.border         <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent [_winfo parent %W]] %# %D pages; break }
                    _bind $w.container.border.content <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent [_winfo parent [_winfo parent %W]]] %# %D pages; break }

                    # Add the labelframe to the related toplevel keyboard pages navigation bindings.
                    ::ms::Enable_Traversal $w

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses relative to its real address, 'w'.
                    # They will all point to the widget hull object short address.
                    set ::ms::addr($w,short)                          $short_addr
                    set ::ms::addr($w.title,short)                    $short_addr
                    set ::ms::addr($w.container,short)                $short_addr
                    set ::ms::addr($w.container.border,short)         $short_addr
                    set ::ms::addr($w.container.border.content,short) $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.title \
                                              $w.container \
                                              $w.container.border \
                                              $w.container.border.content;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.container.border

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.container.border.content

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.title \
                                                       $w.container \
                                                       $w.container.border \
                                                       $w.container.border.content];

                    # Add the widget address to the megawidget addresses list.
                    lappend ::ms::addr(megawidgets) $w

                    # Add the widget address to the megawidget container addresses list.
                    lappend ::ms::addr(megawidgets,containers) $w
                }
                true {
                    ###################################
                    ##                               ##
                    ##     SCROLLABLE LABELFRAME     ##
                    ##                               ##
                    ###################################

                    set ::ms::data($w,reqheight) $::ms::data($w,height)
                    set ::ms::data($w,reqwidth)  $::ms::data($w,width)

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

                    ###################
                    ##               ##
                    ##     TITLE     ##
                    ##               ##
                    ###################

                    # Set the title object style name.
                    set ::ms::style($w,title) [string cat "_bg=" $background \
                                                          "_bc=" $bordercolor \
                                                          "_dc=" $darkcolor \
                                                          "_fg=" $::ms::current($w,foreground) \
                                                          "_lc=" $lightcolor \
                                                          "." $labelframe_title_style];

                    # If needed, create the title object style name.
                    if { $::ms::style($w,title) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,title)  -background $background \
                                                                    -bordercolor $bordercolor \
                                                                      -darkcolor $darkcolor \
                                                                     -foreground $::ms::current($w,foreground) \
                                                                     -lightcolor $lightcolor;

                        # Add the title object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,title)
                    }

                    # Initialize the title object mapping.
                    set mapping [list ]

                    # background
                    # Check if a 'background' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,background)] {
                        0   { lappend mapping -background [list pressed $background] }
                        1   { lappend mapping -background $::ms::stylemap($::ms::theme,$labelframe_title_style,background) }
                    }

                    # bordercolor
                    # Check if a 'bordercolor' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor)] {
                        0   { lappend mapping -bordercolor [list pressed $bordercolor] }
                        1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$labelframe_title_style,bordercolor) }
                    }

                    # darkcolor
                    # Check if a 'darkcolor' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor)] {
                        0   { lappend mapping -darkcolor [list pressed $darkcolor] }
                        1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,darkcolor) }
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
                    # Check if a 'lightcolor' mapping exists for 'labelframe_title_style'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor)] {
                        0   { lappend mapping -lightcolor [list pressed $lightcolor] }
                        1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$labelframe_title_style,lightcolor) }
                    }

                    # If needed, create the title object mapping.
                    if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                        _ttk_style map $::ms::style($w,title) {*}$mapping

                        # Add the title object mapping to the stylemap list containing all the mappings
                        # created by mustang for the current theme.
                        lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                    }

                    # Create the title object.
                    _ttk_label $w.title       -anchor $anchor \
                                         -borderwidth $borderwidth \
                                               -class $::ms::current($w,class) \
                                            -compound $::ms::current($w,compound) \
                                              -cursor $::ms::current($w,cursor) \
                                                -font $::ms::current($w,font) \
                                               -image $::ms::current($w,image) \
                                             -justify left \
                                             -padding $padding \
                                              -relief $relief \
                                               -state $::ms::current($w,state) \
                                               -style $::ms::style($w,title) \
                                           -takefocus $::ms::current($w,takefocus) \
                                                -text "" \
                                        -textvariable $textvariable \
                                           -underline -1 \
                                               -width $charwidth \
                                          -wraplength 0;

                    # Pack the title object.
                    _pack $w.title -anchor $::ms::current($w,anchor) \
                                   -expand false \
                                     -fill none \
                                     -padx 0 \
                                     -pady 0 \
                                     -side top;

                    #######################
                    ##                   ##
                    ##     CONTAINER     ##
                    ##                   ##
                    #######################

                    # Set the container object style name.
                    set ::ms::style($w,container) [string cat "_sb=" $::ms::current($w,shellbackground) \
                                                              ".TFrame"];

                    # If needed, create the container object style name.
                    if { $::ms::style($w,container) ni $::ms::style($::ms::theme,created_by_mustang) } {
                        _ttk_style configure $::ms::style($w,container) -background $::ms::current($w,shellbackground)

                        # Add the container object style name to the theme styles list created by mustang.
                        lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,container)
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

                    # Create the container object.
                    _ttk_frame $w.container -borderwidth 0 \
                                                  -class TFrame \
                                                 -cursor arrow \
                                                 -height 0 \
                                                -padding 0 \
                                                 -relief flat \
                                                  -style $::ms::style($w,container) \
                                              -takefocus 0 \
                                                  -width 0;

                    # Pack the container object.
                    _pack $w.container -anchor nw \
                                       -expand true \
                                         -fill both \
                                         -padx 0 \
                                         -pady 0 \
                                         -side top;

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
                    _ttk_frame $w.container.border -borderwidth $::ms::current($w,borderwidth) \
                                                         -class TFrame \
                                                        -cursor arrow \
                                                        -height 0 \
                                                       -padding 0 \
                                                        -relief $::ms::current($w,relief) \
                                                         -style $::ms::style($w,border) \
                                                     -takefocus 0 \
                                                         -width 0;

                    # Grid the border object.
                    _grid $w.container.border -column 0 \
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
                    _ttk_frame $w.container.border.viewport -borderwidth 0 \
                                                                  -class TFrame \
                                                                 -cursor $::ms::current($w,cursor) \
                                                                 -height $::ms::data($w,height) \
                                                                -padding 0 \
                                                                 -relief flat \
                                                                  -style $::ms::style($w,content) \
                                                              -takefocus 0 \
                                                                  -width $::ms::data($w,width);

                    # Pack the viewport object.
                    _pack $w.container.border.viewport -anchor nw \
                                                       -expand true \
                                                         -fill both \
                                                         -padx 0 \
                                                         -pady 0 \
                                                         -side top;

                    # Create the content object.
                    _ttk_frame $w.container.border.viewport.content -borderwidth 0 \
                                                                          -class $::ms::current($w,class) \
                                                                         -cursor $::ms::current($w,cursor) \
                                                                         -height $::ms::data($w,height) \
                                                                        -padding $::ms::current($w,padding) \
                                                                         -relief flat \
                                                                          -style $::ms::style($w,content) \
                                                                      -takefocus $::ms::current($w,takefocus) \
                                                                          -width $::ms::data($w,width);

                    # Place the content object.
                    _place $w.container.border.viewport.content     -anchor nw \
                                                                -bordermode outside \
                                                                        -in $w.container.border.viewport \
                                                                 -relheight 1.0 \
                                                                  -relwidth 1.0 \
                                                                      -relx 0 \
                                                                      -rely 0;

                    # NOTE:  The widget's content is placed by the 'place' geometry manager.
                    #        The reasons around the 'place' choice is to intercepts any widget dimensions
                    #        changes or scrolls upon it.

                    ########################
                    ##                    ##
                    ##     SCROLLBARS     ##
                    ##                    ##
                    ########################

                    # Create the horizontal scrollbar address.
                    _ttk_scrollbar $w.container.x     -class TScrollbar \
                                                    -command "" \
                                                     -cursor arrow \
                                                     -orient horizontal \
                                                      -style TScrollbar \
                                                  -takefocus 0;

                    # Create the vertical scrollbar address.
                    _ttk_scrollbar $w.container.y     -class TScrollbar \
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
                        TLabelFrame { bindtags $w [list $w _LabelFrame TLabelFrame $::ms::addr($w,toplevel) all] }
                        default     { bindtags $w [list $w $::ms::current($w,class) _LabelFrame TLabelFrame $::ms::addr($w,toplevel) all] }
                    }

                    # ButtonPress-1
                    _bind $w.title            <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }
                    _bind $w.container        <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }
                    _bind $w.container.border <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent [_winfo parent %W]]; break }

                    _bind $w.container.x <ButtonPress-1>   { ::ms::labelframe::Scrollbar_ButtonPress [_winfo parent [_winfo parent %W]] horizontal %x %y; break }
                    _bind $w.container.x <B1-Motion>       { ::ms::labelframe::Scrollbar_Drag         [_winfo parent [_winfo parent %W]] horizontal %x %y; break }
                    _bind $w.container.x <ButtonRelease-1> { ::ms::labelframe::Scrollbar_ButtonRelease; break }

                    _bind $w.container.y <ButtonPress-1>   { ::ms::labelframe::Scrollbar_ButtonPress [_winfo parent [_winfo parent %W]] vertical %x %y; break }
                    _bind $w.container.y <B1-Motion>       { ::ms::labelframe::Scrollbar_Drag         [_winfo parent [_winfo parent %W]] vertical %x %y; break }
                    _bind $w.container.y <ButtonRelease-1> { ::ms::labelframe::Scrollbar_ButtonRelease; break }

                    # Contextual menu
                    _bind $w.title                             <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }
                    _bind $w.container                         <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y shell; break }
                    _bind $w.container.border                  <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent [_winfo parent %W]] %X %Y cmenu; break }
                    _bind $w.container.border.viewport.content <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %X %Y cmenu; break }

                    # Configure
                    _bind $w.container.border.viewport         <Configure> { ::ms::labelframe::Configure [_winfo parent [_winfo parent [_winfo parent %W]]] %w %h; break }
                    _bind $w.container.border.viewport.content <Configure> { update; break }

                    # Enter/Leave
                    _bind $w.title                             <Enter> { ::ms::labelframe::Pathname_Cmd [_winfo parent %W] state !hover; break }
                    _bind $w.container.border                  <Enter> { ::ms::labelframe::Pathname_Cmd [_winfo parent [_winfo parent %W]] state  hover; break }
                    _bind $w.container.border.viewport.content <Enter> { ::ms::labelframe::Pathname_Cmd [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] state  hover; break }
                    _bind $w.container.x                       <Enter> { ::ms::labelframe::Hover  [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.container.y                       <Enter> { ::ms::labelframe::Hover  [_winfo parent [_winfo parent %W]] %X %Y; break }

                    _bind $w.container.border                  <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.container.border.viewport.content <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %X %Y; break }
                    _bind $w.container.x                       <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }
                    _bind $w.container.y                       <Leave> { ::ms::labelframe::Hover [_winfo parent [_winfo parent %W]] %X %Y; break }

                    # FocusIn/FocusOut
                    _bind $w.container.border.viewport.content <FocusIn>  { ::ms::labelframe::Focus_In  [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]]; break }
                    _bind $w.container.border.viewport.content <FocusOut> { ::ms::labelframe::Focus_Out [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]]; break }

                    # Mousewheel and Touchpad

                    # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container <MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D units; break }

                    # If the widget's vertical scrollbar is active, move the widget's content zone by one unit
                    # up or down (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container.y                       <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent %W]] %D units; break }
                    _bind $w.container.border                  <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent %W]] %D units; break }
                    _bind $w.container.border.viewport.content <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %D units; break }

                    # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container <Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D units; break }

                    # If the widget's horizontal scrollbar is active, move the widget's content zone by one unit
                    # left or right (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container.x                       <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent %W]] %D units; break }
                    _bind $w.container.border                  <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent %W]] %D units; break }
                    _bind $w.container.border.viewport.content <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %D units; break }

                    # Try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one page up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container <Control-MouseWheel> { ::ms::Scroll_Parent_Y [_winfo parent %W] %D pages; break }

                    # If the widget's vertical scrollbar is active, move the widget's content zone by one page
                    # up or down (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one page up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container.y                       <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent %W]] %D pages; break }
                    _bind $w.container.border                  <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent %W]] %D pages; break }
                    _bind $w.container.border.viewport.content <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %D pages; break }

                    # Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one page left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X [_winfo parent %W] %D pages; break }

                    # If the widget's horizontal scrollbar is active, move the widget's content zone by one page
                    # left or right (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one page left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.container.x                       <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent %W]] %D pages; break }
                    _bind $w.container.border                  <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent %W]] %D pages; break }
                    _bind $w.container.border.viewport.content <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %D pages; break }

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
                    _bind $w.container <TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D units; break }

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
                    _bind $w.container.x                       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D units; break }
                    _bind $w.container.y                       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D units; break }
                    _bind $w.container.border                  <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D units; break }
                    _bind $w.container.border.viewport.content <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %# %D units; break }

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
                    _bind $w.container <Control-TouchpadScroll> { ::ms::Touchpad_Parent [_winfo parent %W] %# %D pages; break }

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
                    _bind $w.container.x                       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D pages; break }
                    _bind $w.container.y                       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D pages; break }
                    _bind $w.container.border                  <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent %W]] %# %D pages; break }
                    _bind $w.container.border.viewport.content <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent [_winfo parent [_winfo parent [_winfo parent %W]]]] %# %D pages; break }

                    # Add the labelframe to the related toplevel keyboard pages navigation bindings.
                    ::ms::Enable_Traversal $w

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Configure the internal widget rows and columns.
                    _grid rowconfigure    $w.container [list 0] -weight 1
                    _grid columnconfigure $w.container [list 0] -weight 1

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses relative to its real address, 'w'.
                    # They will all point to the widget hull object short address.
                    set ::ms::addr($w,short)                                   $short_addr
                    set ::ms::addr($w.title,short)                             $short_addr
                    set ::ms::addr($w.container,short)                         $short_addr
                    set ::ms::addr($w.container.border,short)                  $short_addr
                    set ::ms::addr($w.container.border.viewport,short)         $short_addr
                    set ::ms::addr($w.container.border.viewport.content,short) $short_addr
                    set ::ms::addr($w.container.x,short)                       $short_addr
                    set ::ms::addr($w.container.y,short)                       $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.title \
                                              $w.container \
                                              $w.container.border \
                                              $w.container.border.viewport \
                                              $w.container.border.viewport.content \
                                              $w.container.x \
                                              $w.container.y;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.container.border

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.container.border.viewport.content

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.title \
                                                       $w.container \
                                                       $w.container.border \
                                                       $w.container.border.viewport \
                                                       $w.container.border.viewport.content];

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
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::labelframe::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::labelframe::Pathname_Cmd $w]
            }

            # Add the widget address to the labelframe widgets real address list.
            lappend ::ms::addr(labelframe) $w

            # Add the widget address to the labelframe real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),labelframe,addrs) $w

            # Add the widget address to the labelframe real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),labelframe,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the labelframe classtype.
            if { $::ms::current($w,style) ni $::ms::style(labelframe) } {
                lappend ::ms::style(labelframe) $::ms::current($w,style)
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
proc ::ms::labelframe::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::labelframe(non_styleable,options)) || ($option in $::ms::labelframe(styleable,options))} {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid option, '$args'." $caller_info }
            }
        }
        configure {}
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

                    # Return the name of the object, or an empty string if there are no labelframe objects at the coordinates provided.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            if { $widget eq $w } {
                                return "Labelframe.hull"
                            } elseif { $widget eq "$w.title" } {
                                return "Labelframe.title"
                            } elseif { $widget eq "$w.container" } {
                                return "Labelframe.container"
                            } elseif { $widget eq "$w.container.border" } {
                                return "Labelframe.border"
                            } elseif { $widget eq "$w.container.border.content" } {
                                return "Labelframe.content"
                            } else {
                                return ""
                            }
                        }
                        true {
                            if { $widget eq $w } {
                                return "Labelframe.hull"
                            } elseif { $widget eq "$w.title" } {
                                return "Labelframe.title"
                            } elseif { $widget eq "$w.container" } {
                                return "Labelframe.container"
                            } elseif { $widget eq "$w.container.border" } {
                                return "Labelframe.border"
                            } elseif { $widget eq "$w.container.border.viewport.content" } {
                                return "Labelframe.content"
                            } elseif { $widget eq "$w.container.x" } {
                                return "Labelframe.hscrollbar"
                            } elseif { $widget eq "$w.container.y" } {
                                return "Labelframe.vscrollbar"
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

                    return [$::ms::addr($w,widget) instate $statespec]
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
                        $::ms::addr($w,widget) instate $statespec $script
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        see {
            # Synopsis:
            #
            # *window* **see** *widget*
            set widget $args

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
                # Check if the parent retrieved is equal to the labelframe address provided ('w').
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
                                $w.container.x set $::ms::data($w,xview1) $::ms::data($w,xview2)
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
                                $w.container.y set $::ms::data($w,yview1) $::ms::data($w,yview2)
                            }
                        }
                    }

                    # Scroll the 'content' object of the scrollablle labelframe, if needed.
                    switch -- $place_options {
                        ""      {}
                        default { _place configure $w.container.border.viewport.content {*}$place_options }
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
                0   { return [$::ms::addr($w,widget) state] }
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

                    # Propagate the new statespec to the widget's hull, container, title, border and content objects.
                    interp invokehidden {} $w state $statespec
                    $w.title state $statespec
                    $w.container state $statespec
                    $w.container.border state $statespec

                    return [$::ms::addr($w,widget) state $statespec]
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
        yview {}
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
# Update any labelframe widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::labelframe::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*