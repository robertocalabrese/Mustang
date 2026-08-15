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
package provide ::ms::scale 0.1

#############################
##                         ##
##     _SCALE BINDINGS     ##
##                         ##
#############################

# Activate/Deactivate
_bind _Scale <Activate>   { ::ms::scale::Pathname_Cmd %W state !background; break }
_bind _Scale <Deactivate> { ::ms::scale::Pathname_Cmd %W state  background; break }

# Buttonpress-1
_bind _Scale <ButtonPress-1> { ::ms::scale::ButtonPress %W %x %y; break }

# Contextual menu
_bind _Scale <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Scale <Destroy> { ::ms::scale::Destroy %W; break }

# Enter/Leave
_bind _Scale <Enter> { ::ms::scale::Pathname_Cmd %W state  hover; break }
_bind _Scale <Leave> { ::ms::scale::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Scale <FocusIn>  { ::ms::scale::FocusIn  %W; break }
_bind _Scale <FocusOut> { ::ms::scale::FocusOut %W; break }

# PrevChar/NextChar
_bind _Scale <<PrevChar>> { ::ms::scale::Increment %W -1 1x; break }
_bind _Scale <<NextChar>> { ::ms::scale::Increment %W +1 1x; break }

# PrevLine/NextLine
_bind _Scale <<PrevLine>> { ::ms::scale::Increment %W -1 1x; break }
_bind _Scale <<NextLine>> { ::ms::scale::Increment %W +1 1x; break }

# PrevWord/NextWord
_bind _Scale <<PrevWord>> { ::ms::scale::Increment %W -1 2x; break }
_bind _Scale <<NextWord>> { ::ms::scale::Increment %W +1 2x; break }

# PrevPara/NexPara
_bind _Scale <<PrevPara>> { ::ms::scale::Increment %W -1 2x; break }
_bind _Scale <<NextPara>> { ::ms::scale::Increment %W +1 2x; break }

# Scan
_bind _Scale <<ScanMark>>    { ::ttk::scale::Jump    %W %x %y; break }
_bind _Scale <<ScanDrag>>    { ::ttk::scale::Drag    %W %x %y; break }
_bind _Scale <<ScanRelease>> { ::ttk::scale::Release %W %x %y; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scale <MouseWheel> { ::ms::scale::MouseWheel %W %D Y units 1x; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scale <Shift-MouseWheel> { ::ms::scale::MouseWheel %W %D X units 1x; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scale <Control-MouseWheel> { ::ms::scale::MouseWheel %W %D Y pages 2x; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Scale <Control-Shift-MouseWheel> { ::ms::scale::MouseWheel %W %D X pages 2x; break }

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
_bind _Scale <TouchpadScroll> { ::ms::scale::Touchpad %W %# %D units 1x; break }

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
_bind _Scale <Control-TouchpadScroll> { ::ms::scale::Touchpad %W %# %D pages 2x; break }

# Create the mustang **scale** package.
namespace eval ::ms::scale {
    # Set the 'non styleable' scale option list.
    set ::ms::scale(non_styleable,options) [list class \
                                                 cmenu \
                                                 command \
                                                 from \
                                                 increment \
                                                 length \
                                                 orient \
                                                 state \
                                                 style \
                                                 takefocus \
                                                 to \
                                                 value \
                                                 variable];

    # Set the 'styleable' scale option list.
    set ::ms::scale(styleable,options) [list background \
                                             bordercolor \
                                             borderwidth \
                                             cursor \
                                             darkcolor \
                                             gripsize \
                                             innercolor \
                                             lightcolor \
                                             outercolor \
                                             thickness \
                                             thumbrelief \
                                             troughcolor \
                                             troughrelief];

    # Set the default 'non-styleable' scale options values.
    set ::ms::default(scale,class)     TScale
    set ::ms::default(scale,cmenu)     {}
    set ::ms::default(scale,command)   {}
    set ::ms::default(scale,from)      0
    set ::ms::default(scale,increment) 1
    set ::ms::default(scale,length)    200
    set ::ms::default(scale,orient)    horizontal
    set ::ms::default(scale,state)     normal
    set ::ms::default(scale,style)     TScale
    set ::ms::default(scale,takefocus) 1
    set ::ms::default(scale,to)        1.0
    set ::ms::default(scale,value)     0
    set ::ms::default(scale,variable)  {}

    # Note: The default 'styleable' scale options values are always defined inside the current theme.
}

# Rename the original Tk **scale** and **ttk::scale** commands.
rename scale      _scale
rename ttk::scale _ttk_scale

# Create aliases for the mustang **scale** command.
interp alias {} scale      {} ::ms::scale::Command
interp alias {} ttk::scale {} ::ms::scale::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::scale** widget command.
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
proc ::ms::scale::Command { window { args "" } } {
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
            set ::ms::default($w,class)     $::ms::default(scale,class)
            set ::ms::default($w,cmenu)     $::ms::default(scale,cmenu)
            set ::ms::default($w,command)   $::ms::default(scale,command)
            set ::ms::default($w,from)      $::ms::default(scale,from)
            set ::ms::default($w,increment) $::ms::default(scale,increment)
            set ::ms::default($w,length)    $::ms::default(scale,length)
            set ::ms::default($w,orient)    $::ms::default(scale,orient)
            set ::ms::default($w,state)     $::ms::default(scale,state)
            set ::ms::default($w,style)     $::ms::default(scale,style)
            set ::ms::default($w,takefocus) $::ms::default(scale,takefocus)
            set ::ms::default($w,to)        $::ms::default(scale,to)
            set ::ms::default($w,value)     $::ms::default(scale,value)
            set ::ms::default($w,variable)  $::ms::default(scale,variable)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)     $::ms::default(scale,class)
            set ::ms::current($w,cmenu)     $::ms::default(scale,cmenu)
            set ::ms::current($w,command)   $::ms::default(scale,command)
            set ::ms::current($w,from)      $::ms::default(scale,from)
            set ::ms::current($w,increment) $::ms::default(scale,increment)
            set ::ms::current($w,length)    $::ms::default(scale,length)
            set ::ms::current($w,orient)    $::ms::default(scale,orient)
            set ::ms::current($w,state)     $::ms::default(scale,state)
            set ::ms::current($w,style)     $::ms::default(scale,style)
            set ::ms::current($w,takefocus) $::ms::default(scale,takefocus)
            set ::ms::current($w,to)        $::ms::default(scale,to)
            set ::ms::current($w,value)     $::ms::default(scale,value)
            set ::ms::current($w,variable)  $::ms::default(scale,variable)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) scale

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
            #       To make a scale styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **scale** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)   Tk
            set ::ms::managed_by($w,bordercolor)  Tk
            set ::ms::managed_by($w,borderwidth)  Tk
            set ::ms::managed_by($w,cursor)       Tk
            set ::ms::managed_by($w,darkcolor)    Tk
            set ::ms::managed_by($w,gripsize)     Tk
            set ::ms::managed_by($w,innercolor)   Tk
            set ::ms::managed_by($w,lightcolor)   Tk
            set ::ms::managed_by($w,outercolor)   Tk
            set ::ms::managed_by($w,thickness)    Tk
            set ::ms::managed_by($w,thumbrelief)  Tk
            set ::ms::managed_by($w,troughcolor)  Tk
            set ::ms::managed_by($w,troughrelief) Tk

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
                    -from {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,from) $value
                    }
                    -gripsize {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,gripsize)    $value
                        set ::ms::managed_by($w,gripsize) developer
                    }
                    -increment {
                        switch -- [string is double -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,increment) $value
                                }
                            }
                        }
                    }
                    -innercolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,innercolor)    $value
                        set ::ms::managed_by($w,innercolor) developer
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
                    -orient {
                        set value [string tolower $value]
                        switch -- $value {
                            horizontal -
                            vertical   { set ::ms::current($w,orient) $value }
                        }
                    }
                    -outercolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,outercolor)    $value
                        set ::ms::managed_by($w,outercolor) developer
                    }
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            disabled -
                            normal   { set ::ms::current($w,state) $value }
                        }
                    }
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
                    -thickness {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,thickness)    $value
                        set ::ms::managed_by($w,thickness) developer
                    }
                    -thumbrelief {
                        set value [string tolower $value]
                        switch -- $value {
                            flat   -
                            groove -
                            raised -
                            ridge  -
                            solid  -
                            sunken {
                                set ::ms::current($w,thumbrelief)    $value
                                set ::ms::managed_by($w,thumbrelief) developer
                            }
                        }
                    }
                    -to {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,to) $value
                    }
                    -troughcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,troughcolor)    $value
                        set ::ms::managed_by($w,troughcolor) developer
                    }
                    -troughrelief {
                        set value [string tolower $value]
                        switch -- $value {
                            flat   -
                            groove -
                            raised -
                            ridge  -
                            solid  -
                            sunken {
                                set ::ms::current($w,troughrelief)    $value
                                set ::ms::managed_by($w,troughrelief) developer
                            }
                        }
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
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::scale(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TScale,$option)

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
                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TScale]]
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'borderwidth', 'cursor', 'thumbrelief' and 'troughrelief' are not allowed to change if the statespec changes.

            ###################
            ##               ##
            ##     SCALE     ##
            ##               ##
            ###################

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                   "_gs="  $::ms::current($w,gripsize) \
                                                   "_ic="  $::ms::current($w,innercolor) \
                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                   "_oc="  $::ms::current($w,outercolor) \
                                                   "_tn="  $::ms::current($w,thickness) \
                                                   "_thr=" $::ms::current($w,thumbrelief) \
                                                   "_tc="  $::ms::current($w,troughcolor) \
                                                   "_tr="  $::ms::current($w,troughrelief) \
                                                   "." $parent_style];

            # If needed, create the widget style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)       -arrowsize $::ms::current($w,thickness) \
                                                                  -background $::ms::current($w,background) \
                                                                 -bordercolor $::ms::current($w,bordercolor) \
                                                                   -darkcolor $::ms::current($w,darkcolor) \
                                                                    -gripsize $::ms::current($w,gripsize) \
                                                                 -groovewidth $::ms::current($w,thickness) \
                                                                  -innercolor $::ms::current($w,innercolor) \
                                                                  -lightcolor $::ms::current($w,lightcolor) \
                                                                  -outercolor $::ms::current($w,outercolor) \
                                                                -sliderrelief $::ms::current($w,thumbrelief) \
                                                             -sliderthickness $::ms::current($w,thickness) \
                                                                 -troughcolor $::ms::current($w,troughcolor) \
                                                                -troughrelief $::ms::current($w,troughrelief);

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

            # innercolor
            switch -- $::ms::managed_by($w,innercolor) {
                developer { lappend mapping -innercolor [list pressed $::ms::current($w,innercolor)] }
                Tk  {
                    # Check if a 'innercolor' mapping exists for 'stylename'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),innercolor)] {
                        1   { lappend mapping -innercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),innercolor) }
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

            # outercolor
            switch -- $::ms::managed_by($w,outercolor) {
                developer { lappend mapping -outercolor [list pressed $::ms::current($w,outercolor)] }
                Tk  {
                    # Check if a 'outercolor' mapping exists for 'stylename'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),outercolor)] {
                        1   { lappend mapping -outercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),outercolor) }
                    }
                }
            }

            # troughcolor
            switch -- $::ms::managed_by($w,troughcolor) {
                developer { lappend mapping -troughcolor [list pressed $::ms::current($w,troughcolor)] }
                Tk  {
                    # Check if a 'troughcolor' mapping exists for '::ms::current($w,style)'.
                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),troughcolor)] {
                        1   { lappend mapping -troughcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),troughcolor) }
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

            # Create the scale widget.
            _ttk_scale $w     -class $::ms::current($w,class) \
                            -command $::ms::current($w,command) \
                             -cursor $cursor \
                               -from $::ms::current($w,from) \
                             -length $::ms::current($w,length) \
                             -orient $::ms::current($w,orient) \
                              -state $::ms::current($w,state) \
                              -style $::ms::style($w,widget) \
                          -takefocus $takefocus \
                                 -to $::ms::current($w,to) \
                              -value $::ms::current($w,value) \
                           -variable $::ms::current($w,variable);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TScale  { bindtags $w [list $w _Scale TScale $::ms::addr($w,toplevel) all] }
                default { bindtags $w [list $w $::ms::current($w,class) _Scale TScale $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::scale::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::scale::Pathname_Cmd $w]
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

            # Add the widget address to the scale widgets real address list.
            lappend ::ms::addr(scale) $w

            # Add the widget address to the scale classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),scale,addrs) $w

            # Add the widget address to the scale classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),scale,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the scale classtype.
            if { $::ms::current($w,style) ni $::ms::style(scale,classtype) } {
                lappend ::ms::style(scale,classtype) $::ms::current($w,style)
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
proc ::ms::scale::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::scale(non_styleable,options)) || ($option in $::ms::scale(styleable,options))} {
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
                    foreach option $::ms::scale(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::scale(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::scale(non_styleable,options)) || ($option in $::ms::scale(styleable,options)) } {
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
                                    -from {
                                        switch -- [string is double -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,from) $value
                                    }
                                    -gripsize {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,gripsize)    $value
                                        set ::ms::managed_by($w,gripsize) developer
                                    }
                                    -increment {
                                        switch -- [string is double -strict $value] {
                                            1   {
                                                if { $value > 0 } {
                                                    set ::ms::current($w,increment) $value
                                                }
                                            }
                                        }
                                    }
                                    -innercolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,innercolor)    $value
                                        set ::ms::managed_by($w,innercolor) developer
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
                                    -orient {}
                                    -outercolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,outercolor)    $value
                                        set ::ms::managed_by($w,outercolor) developer
                                    }
                                    -state {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            disabled -
                                            normal   { set ::ms::current($w,state) $value }
                                        }
                                    }
                                    -style {
                                        if { $value ni $::ms::style($::ms::theme) } {
                                            continue
                                        }

                                        # Remove the widget address from the scale real address list that contains all the
                                        # widgets addresses with style '::ms::current($w,style)'.
                                        set index [lsearch -exact $::ms::style($::ms::current($w,style),scale,addrs) $w]
                                        switch -- $index {
                                            -1      {}
                                            default { set ::ms::style($::ms::current($w,style),scale,addrs) [lremove $::ms::style($::ms::current($w,style),scale,addrs) $index] }
                                        }

                                        # Add the widget address to the address list that contains all the
                                        # widgets addresses with style 'value'.
                                        lappend ::ms::style($value,scale,addrs) $w

                                        # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                        # for the scale classtype.
                                        switch -- [llength $::ms::style($::ms::current($w,style),scale,addrs)] {
                                            0   {
                                                set index [lsearch -exact $::ms::style(scale,classtype) $::ms::current($w,style)]
                                                switch -- $index {
                                                    -1      {}
                                                    default { set ::ms::style(scale,classtype) [lremove $::ms::style(scale,classtype) $index] }
                                                }
                                            }
                                        }

                                        # If needed, add 'value' to the available styles for the scale classtype.
                                        if { $value ni $::ms::style(scale,classtype) } {
                                            lappend ::ms::style(scale,classtype) $value
                                        }

                                        # Update the current style associated with the widget with 'value'.
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
                                    -thickness {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,thickness)    $value
                                        set ::ms::managed_by($w,thickness) developer
                                    }
                                    -thumbrelief {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            flat   -
                                            groove -
                                            raised -
                                            ridge  -
                                            solid  -
                                            sunken {
                                                set ::ms::current($w,thumbrelief)    $value
                                                set ::ms::managed_by($w,thumbrelief) developer
                                            }
                                        }
                                    }
                                    -to {
                                        switch -- [string is double -strict $value] {
                                            0   { continue }
                                        }

                                        set ::ms::current($w,to) $value
                                    }
                                    -troughcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,troughcolor)    $value
                                        set ::ms::managed_by($w,troughcolor) developer
                                    }
                                    -troughrelief {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            flat   -
                                            groove -
                                            raised -
                                            ridge  -
                                            solid  -
                                            sunken {
                                                set ::ms::current($w,troughrelief)    $value
                                                set ::ms::managed_by($w,troughrelief) developer
                                            }
                                        }
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
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::scale(styleable,options) {
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
                                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TScale]]
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'borderwidth', 'cursor', 'thumbrelief' and 'troughrelief' are not allowed to change if the statespec changes.

                            ###################
                            ##               ##
                            ##     SCALE     ##
                            ##               ##
                            ###################

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                                   "_gs="  $::ms::current($w,gripsize) \
                                                                   "_ic="  $::ms::current($w,innercolor) \
                                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                                   "_oc="  $::ms::current($w,outercolor) \
                                                                   "_thr=" $::ms::current($w,thumbrelief) \
                                                                   "_tn="  $::ms::current($w,thickness) \
                                                                   "_tc="  $::ms::current($w,troughcolor) \
                                                                   "_tr="  $::ms::current($w,troughrelief) \
                                                                   "." $parent_style];

                            # If needed, create the widget style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)       -arrowsize $::ms::current($w,thickness) \
                                                                                  -background $::ms::current($w,background) \
                                                                                 -bordercolor $::ms::current($w,bordercolor) \
                                                                                   -darkcolor $::ms::current($w,darkcolor) \
                                                                                    -gripsize $::ms::current($w,gripsize) \
                                                                                  -innercolor $::ms::current($w,innercolor) \
                                                                                  -lightcolor $::ms::current($w,lightcolor) \
                                                                                  -outercolor $::ms::current($w,outercolor) \
                                                                                -sliderrelief $::ms::current($w,thumbrelief) \
                                                                             -sliderthickness $::ms::current($w,thickness) \
                                                                                 -troughcolor $::ms::current($w,troughcolor) \
                                                                                -troughrelief $::ms::current($w,troughrelief);

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

                            # innercolor
                            switch -- $::ms::managed_by($w,innercolor) {
                                developer { lappend mapping -innercolor [list pressed $::ms::current($w,innercolor)] }
                                Tk  {
                                    # Check if a 'innercolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),innercolor)] {
                                        1   { lappend mapping -innercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),innercolor) }
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

                            # outercolor
                            switch -- $::ms::managed_by($w,outercolor) {
                                developer { lappend mapping -outercolor [list pressed $::ms::current($w,outercolor)] }
                                Tk  {
                                    # Check if a 'outercolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),outercolor)] {
                                        1   { lappend mapping -outercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),outercolor) }
                                    }
                                }
                            }

                            # troughcolor
                            switch -- $::ms::managed_by($w,troughcolor) {
                                developer { lappend mapping -troughcolor [list pressed $::ms::current($w,troughcolor)] }
                                Tk  {
                                    # Check if a 'troughcolor' mapping exists for '::ms::current($w,style)'.
                                    switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),troughcolor)] {
                                        1   { lappend mapping -troughcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),troughcolor) }
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
                            interp invokehidden {} $w configure   -command $::ms::current($w,command) \
                                                                   -cursor $cursor \
                                                                     -from $::ms::current($w,from) \
                                                                   -length $::ms::current($w,length) \
                                                                    -state $::ms::current($w,state) \
                                                                    -style $::ms::style($w,widget) \
                                                                -takefocus $takefocus \
                                                                       -to $::ms::current($w,to) \
                                                                    -value $::ms::current($w,value) \
                                                                 -variable $::ms::current($w,variable);

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        coords -
        get    -
        set    {
            # Synopsis:
            #
            # *window* **coords** ?*value*?
            # *window* **get** ?*x* *y*?
            # *window* **set** *value*

            # Execute the command.
            try {
                interp invokehidden {} $w $cmd {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        identify {
            # Synopsis:
            #
            # *window* **identify** **element** *x* *y*
            switch -- [llength $args] {
                3   {
                    # Check that the first argument of 'args' is the word 'element' or 'sash'.
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

                    # Check if the coordinates provided falls upon the widget's sash.
                    try {
                        interp invokehidden {} $w identify element $x $y
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -- $result {
                            Scale.slider            { return "Scale.slider" }
                            Horizontal.Scale.trough { return "Scale.htrough" }
                            Vertical.Scale.trough   { return "Scale.vtrough" }
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
                0   {
                    switch -- [string last "." $::ms::current($w,style)] {
                        -1      { return [string cat [string totitle $::ms::current($w,orient)] "." $::ms::current($w,style)] }
                        default { return $::ms::current($w,style) }
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
# Update any scale widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::scale::Style_Update { stylename caller_info } {
    # Check if exists the horizontal and vertical layout for 'stylename'.
    foreach orient [list horizontal vertical] {
        # Check if 'stylename' has style children.
        set dir   [string totitle $orient]
        set index [string last "." $stylename]
        switch -- $index {
            -1      { set parent_style($orient) [string cat $dir "." $stylename] }
            default {
                # Check if the style child positioned at 'end-1' corresponds to the word 'Horizontal' or 'Vertical'.
                set children [split $stylename "."]
                if { [lindex $children end-1] eq $dir } {
                    set parent_style($orient) [string cat $dir "." [lindex $children end]]
                } else {
                    set parent_style($orient) $dir
                    foreach word $children {
                        switch -nocase -- $word {
                            Horizontal -
                            Vertical   { ::ms::Error "Invalid style name, '$stylename'." $caller_info }
                            default    { set parent_style($orient) [string cat $parent_style($orient) "." $word] }
                        }
                    }
                }
            }
        }

        # If the parent style layout is not known by mustang, set it as the current theme layout '$orient.TProgressbar'.
        if { $parent_style($orient) ni $::ms::layouts($::ms::theme) } {
            _ttk_style layout $parent_style($orient) [_ttk_style layout [string cat $dir "." TProgressbar]]
        }
    }

    # Update all the scale widgets addresses that have stylename as a style.
    foreach w $::ms::style($stylename,scale,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::scale(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TScale,$option)

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
        switch -- $::ms::current($w,state) {
            disabled { set cursor arrow }
            normal   { set cursor $::ms::current($w,cursor) }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'borderwidth', 'cursor', 'thumbrelief' and 'troughrelief' are not allowed to change if the statespec changes.

        ###################
        ##               ##
        ##     SCALE     ##
        ##               ##
        ###################

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                               "_bc="  $::ms::current($w,bordercolor) \
                                               "_dc="  $::ms::current($w,darkcolor) \
                                               "_gs="  $::ms::current($w,gripsize) \
                                               "_ic="  $::ms::current($w,innercolor) \
                                               "_lc="  $::ms::current($w,lightcolor) \
                                               "_oc="  $::ms::current($w,outercolor) \
                                               "_thr=" $::ms::current($w,thumbrelief) \
                                               "_tn="  $::ms::current($w,thickness) \
                                               "_tc="  $::ms::current($w,troughcolor) \
                                               "_tr="  $::ms::current($w,troughrelief) \
                                               "." $parent_style($::ms::current($w,orient))];

        # If needed, create the widget style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)       -arrowsize $::ms::current($w,thickness) \
                                                              -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                                -gripsize $::ms::current($w,gripsize) \
                                                             -groovewidth $::ms::current($w,thickness) \
                                                              -innercolor $::ms::current($w,innercolor) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                              -outercolor $::ms::current($w,outercolor) \
                                                            -sliderrelief $::ms::current($w,thumbrelief) \
                                                         -sliderthickness $::ms::current($w,thickness) \
                                                             -troughcolor $::ms::current($w,troughcolor) \
                                                            -troughrelief $::ms::current($w,troughrelief);

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

        # innercolor
        switch -- $::ms::managed_by($w,innercolor) {
            developer { lappend mapping -innercolor [list pressed $::ms::current($w,innercolor)] }
            Tk  {
                # Check if a 'innercolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,innercolor)] {
                    1   { lappend mapping -innercolor $::ms::stylemap($::ms::theme,$stylename,innercolor) }
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

        # outercolor
        switch -- $::ms::managed_by($w,outercolor) {
            developer { lappend mapping -outercolor [list pressed $::ms::current($w,outercolor)] }
            Tk  {
                # Check if a 'outercolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,outercolor)] {
                    1   { lappend mapping -outercolor $::ms::stylemap($::ms::theme,$stylename,outercolor) }
                }
            }
        }

        # troughcolor
        switch -- $::ms::managed_by($w,troughcolor) {
            developer { lappend mapping -troughcolor [list pressed $::ms::current($w,troughcolor)] }
            Tk  {
                # Check if a 'troughcolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,troughcolor)] {
                    1   { lappend mapping -troughcolor $::ms::stylemap($::ms::theme,$stylename,troughcolor) }
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
        interp invokehidden {} $w configure -cursor $cursor \
                                             -style $::ms::style($w,widget);
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
# Manage the **ButtonPress** event upon the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the mouse pointer (x,y) relative coordinates.
#        These value should be provided by the **ButtonPress** event.
#
# It doesn't return anything.
proc ::ms::scale::ButtonPress { w x y } {
    # Note: This procedure was inspired by the ttk::scale procedure 'Press'.
    #       The procedure have been slighty modified to work with mustang.
    #       All credits goes to the original author/s.

    # Check the widget's state.
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
        default {
            # Focus the scale if its not already focussed.
            interp invokehidden {} $w instate [list !focus] {
                _focus -force $w
            }

            set ::ttk::scale::State(dragging) 0

            # Set the current trough position.
            set current_pos [interp invokehidden {} $w get]

            # Check the scale element where the buttonpress happened.
            switch -glob -- [interp invokehidden {} $w identify element $x $y] {
                *track  -
                *trough {
                    # Get the trough position indicated by x and y.
                    set new_pos [interp invokehidden {} $w get $x $y]

                    # Check the '::ms::clickaction' variable.
                    switch -- $::ms::clickaction {
                        jump {
                            # Jump to the new coordinates.
                            interp invokehidden {} $w set $new_pos

                            set ::ttk::scale::State(dragging) 1
                            set ::ttk::scale::State(initial)  [$w get]
                        }
                        scroll {
                            # Scroll the widget's thumb towards the new coordinates.
                            if { ($new_pos <= $current_pos) || ($::ms::current($w,from) > $::ms::current($w,to)) } {
                                ::ttk::Repeatedly ::ms::scale::Increment $w -1 1x
                            } else {
                                ::ttk::Repeatedly ::ms::scale::Increment $w +1 1x
                            }
                        }
                    }
                }
                *slider {
                    # Register the draging initial position.
                    set ::ttk::scale::State(dragging) 1
                    set ::ttk::scale::State(initial)  $current_pos
                }
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
proc ::ms::scale::Destroy { w } {
    # Get the short address related to the widget real address.
    set short_addr $::ms::addr($w,short)

    # Destroy the aliased widget pathcommands.
    foreach token $::ms::data($w,token) {
        interp alias {} $token {}
    }

    # Remove the widget real address from the widgets real address list.
    set index [lsearch -exact $::ms::addr(reals) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(reals) [lremove $::ms::addr(reals) $index] }
    }

    # Remove the widget short address from the widgets short address list.
    set index [lsearch -exact $::ms::addr(shorts) $short_addr]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(shorts) [lremove $::ms::addr(shorts) $index] }
    }

    # Remove the widget address from the scale widgets real address list.
    set index [lsearch -exact $::ms::addr(scale) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(scale) [lremove $::ms::addr(scale) $index] }
    }

    # Remove the widget address from the scale classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),scale,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),scale,addrs) [lremove $::ms::class($::ms::current($w,class),scale,addrs) $index] }
    }

    # Remove the widget address from the scale classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),scale,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),scale,addrs) [lremove $::ms::style($::ms::current($w,style),scale,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the scale classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),scale,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(scale,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(scale,classtype) [lremove $::ms::style(scale,classtype) $index] }
            }
        }
    }

    # Destroy every widget's variables previously created.
    unset -nocomplain -- ::ms::addr($short_addr,real) \
                         ::ms::addr($w,short);

    unset -nocomplain -- ::ms::addr($w,border) \
                         ::ms::addr($w,structure) \
                         ::ms::addr($w,toplevel) \
                         ::ms::addr($w,widget);

    unset -nocomplain -- ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,command) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,from) \
                         ::ms::current($w,gripsize) \
                         ::ms::current($w,increment) \
                         ::ms::current($w,innercolor) \
                         ::ms::current($w,length) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,orient) \
                         ::ms::current($w,outercolor) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,thickness) \
                         ::ms::current($w,thumbrelief) \
                         ::ms::current($w,to) \
                         ::ms::current($w,troughcolor) \
                         ::ms::current($w,troughrelief) \
                         ::ms::current($w,value) \
                         ::ms::current($w,variable);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,command) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,from) \
                         ::ms::default($w,gripsize) \
                         ::ms::default($w,increment) \
                         ::ms::default($w,innercolor) \
                         ::ms::default($w,length) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,orient) \
                         ::ms::default($w,outercolor) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,thickness) \
                         ::ms::default($w,thumbrelief) \
                         ::ms::default($w,to) \
                         ::ms::default($w,troughcolor) \
                         ::ms::default($w,troughrelief) \
                         ::ms::default($w,value) \
                         ::ms::default($w,variable);

    unset -nocomplain -- ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,gripsize) \
                         ::ms::managed_by($w,innercolor) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,outercolor) \
                         ::ms::managed_by($w,thickness) \
                         ::ms::managed_by($w,thumbrelief) \
                         ::ms::managed_by($w,troughcolor) \
                         ::ms::managed_by($w,troughrelief);

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
proc ::ms::scale::FocusIn { w } {
    # Change the widget dynamic state to 'focus'.
    ::ms::scale::Pathname_Cmd $w state focus

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
proc ::ms::scale::FocusOut { w } {
    # Check the contextual menu associated with this widget, if any.
    switch -- $::ms::current($w,cmenu) {
        ""      {}
        default {
            # If the contextual menu of the widget is open do not loose the focus (graphically).
            switch -- [_winfo exists $::ms::current($w,cmenu)] {
                1   { return "" }
            }
        }
    }

    # Change the widget dynamic state to '!focus'.
    ::ms::scale::Pathname_Cmd $w state !focus

    return ""
}

#*EOF*