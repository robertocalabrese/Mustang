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
proc ::ms::scale::Pathname_Cmd { w cmd args } {}

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
proc ::ms::scale::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*