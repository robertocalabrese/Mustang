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
package provide ::ms::canvas 0.1

##############################
##                          ##
##     _CANVAS BINDINGS     ##
##                          ##
##############################

# Activate/Deactivate
_bind _Canvas <Activate>   { ::ms::canvas::Pathname_Cmd %W state !background; break }
_bind _Canvas <Deactivate> { ::ms::canvas::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Canvas <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Canvas <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Canvas <Destroy> { ::ms::canvas::Destroy %W; break }

# FocusIn/FocusOut
_bind _Canvas <FocusIn>  { ::ms::canvas::Focus_In  %W; break }
_bind _Canvas <FocusOut> { ::ms::canvas::Focus_Out %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Canvas <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Canvas <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Canvas <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Canvas <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Canvas <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Canvas <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Canvas <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Canvas <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Canvas <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Canvas <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **canvas** package.
namespace eval ::ms::canvas {
    # Set the canvas 'non-styleable' canvas option list.
    set ::ms::canvas(non_styleable,options) [list class \
                                                  closeenough \
                                                  cmenu \
                                                  confine \
                                                  height \
                                                  insertofftime \
                                                  insertontime \
                                                  insertwidth \
                                                  scrollable \
                                                  scrollregion \
                                                  state \
                                                  style \
                                                  takefocus \
                                                  width \
                                                  xscrollcommand \
                                                  xscrollincrement \
                                                  yscrollcommand \
                                                  yscrollincrement];

    # Set the canvas 'styleable' canvas option list.
    set ::ms::canvas(styleable,options) [list background \
                                              bordercolor \
                                              borderwidth \
                                              cursor \
                                              darkcolor \
                                              insertbackground \
                                              insertborderwidth \
                                              lightcolor \
                                              relief \
                                              selectbackground \
                                              selectborderwidth \
                                              selectforeground \
                                              shellbackground];

    # Set the default 'non-styleable' canvas options values.
    set ::ms::default(canvas,class)            Canvas
    set ::ms::default(canvas,closeenough)      1.0
    set ::ms::default(canvas,cmenu)            {}
    set ::ms::default(canvas,confine)          1
    set ::ms::default(canvas,height)           [::ms::Convert_Measure 7c "" 300]
    set ::ms::default(canvas,insertofftime)    300
    set ::ms::default(canvas,insertontime)     600
    set ::ms::default(canvas,insertwidth)      2
    set ::ms::default(canvas,scrollable)       false
    set ::ms::default(canvas,scrollregion)     {}
    set ::ms::default(canvas,state)            normal
    set ::ms::default(canvas,style)            Canvas
    set ::ms::default(canvas,takefocus)        0
    set ::ms::default(canvas,width)            [::ms::Convert_Measure 10c "" 400]
    set ::ms::default(canvas,xscrollcommand)   {}
    set ::ms::default(canvas,xscrollincrement) 0
    set ::ms::default(canvas,yscrollcommand)   {}
    set ::ms::default(canvas,yscrollincrement) 0

    # Note: The default 'styleable' canvas options values are always defined inside the current theme.
}

# Rename the original Tk **canvas** command.
rename canvas _canvas

# Create an alias for the mustang **canvas** command.
interp alias {} canvas {} ::ms::canvas::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **canvas** widget command.
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
proc ::ms::canvas::Command { window { args "" } } {
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
            set ::ms::default($w,class)            $::ms::default(canvas,class)
            set ::ms::default($w,cmenu)            $::ms::default(canvas,cmenu)
            set ::ms::default($w,closeenough)      $::ms::default(canvas,closeenough)
            set ::ms::default($w,confine)          $::ms::default(canvas,confine)
            set ::ms::default($w,height)           $::ms::default(canvas,height)
            set ::ms::default($w,insertofftime)    $::ms::default(canvas,insertofftime)
            set ::ms::default($w,insertontime)     $::ms::default(canvas,insertontime)
            set ::ms::default($w,insertwidth)      $::ms::default(canvas,insertwidth)
            set ::ms::default($w,scrollable)       $::ms::default(canvas,scrollable)
            set ::ms::default($w,scrollregion)     $::ms::default(canvas,scrollregion)
            set ::ms::default($w,state)            $::ms::default(canvas,state)
            set ::ms::default($w,style)            $::ms::default(canvas,style)
            set ::ms::default($w,takefocus)        $::ms::default(canvas,takefocus)
            set ::ms::default($w,width)            $::ms::default(canvas,width)
            set ::ms::default($w,xscrollcommand)   $::ms::default(canvas,xscrollcommand)
            set ::ms::default($w,xscrollincrement) $::ms::default(canvas,xscrollincrement)
            set ::ms::default($w,yscrollcommand)   $::ms::default(canvas,yscrollcommand)
            set ::ms::default($w,yscrollincrement) $::ms::default(canvas,yscrollincrement)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)            $::ms::default(canvas,class)
            set ::ms::current($w,cmenu)            $::ms::default(canvas,cmenu)
            set ::ms::current($w,closeenough)      $::ms::default(canvas,closeenough)
            set ::ms::current($w,confine)          $::ms::default(canvas,confine)
            set ::ms::current($w,height)           $::ms::default(canvas,height)
            set ::ms::current($w,insertofftime)    $::ms::default(canvas,insertofftime)
            set ::ms::current($w,insertontime)     $::ms::default(canvas,insertontime)
            set ::ms::current($w,insertwidth)      $::ms::default(canvas,insertwidth)
            set ::ms::current($w,scrollable)       $::ms::default(canvas,scrollable)
            set ::ms::current($w,scrollregion)     $::ms::default(canvas,scrollregion)
            set ::ms::current($w,state)            $::ms::default(canvas,state)
            set ::ms::current($w,style)            $::ms::default(canvas,style)
            set ::ms::current($w,takefocus)        $::ms::default(canvas,takefocus)
            set ::ms::current($w,width)            $::ms::default(canvas,width)
            set ::ms::current($w,xscrollcommand)   $::ms::default(canvas,xscrollcommand)
            set ::ms::current($w,xscrollincrement) $::ms::default(canvas,xscrollincrement)
            set ::ms::current($w,yscrollcommand)   $::ms::default(canvas,yscrollcommand)
            set ::ms::current($w,yscrollincrement) $::ms::default(canvas,yscrollincrement)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)      canvas
            set ::ms::data($w,scrollx)        off
            set ::ms::data($w,scrolly)        off
            set ::ms::data($w,statespec)      $::ms::data(statespec,normal)
            set ::ms::data($w,xscrollcommand) {}
            set ::ms::data($w,yscrollcommand) {}

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
            #       To make a canvas styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **canvas** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)        Tk
            set ::ms::managed_by($w,bordercolor)       Tk
            set ::ms::managed_by($w,borderwidth)       Tk
            set ::ms::managed_by($w,cursor)            Tk
            set ::ms::managed_by($w,darkcolor)         Tk
            set ::ms::managed_by($w,insertbackground)  Tk
            set ::ms::managed_by($w,insertborderwidth) Tk
            set ::ms::managed_by($w,lightcolor)        Tk
            set ::ms::managed_by($w,relief)            Tk
            set ::ms::managed_by($w,selectbackground)  Tk
            set ::ms::managed_by($w,selectborderwidth) Tk
            set ::ms::managed_by($w,selectforeground)  Tk
            set ::ms::managed_by($w,shellbackground)   Tk

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
                    -closeenough {
                        switch -- [string is double -strict $value] {
                            0   { continue }
                        }

                        set ::ms::current($w,closeenough) $value
                    }
                    -confine {
                        switch -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,confine) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,confine) 1 }
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
                    -insertbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertbackground)    $value
                        set ::ms::managed_by($w,insertbackground) developer
                    }
                    -insertborderwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,insertborderwidth)    $value
                        set ::ms::managed_by($w,insertborderwidth) developer
                    }
                    -insertofftime {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value >= 0 } {
                                    set ::ms::current($w,insertofftime) $value
                                }
                            }
                        }
                    }
                    -insertontime {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,insertontime) $value
                                }
                            }
                        }
                    }
                    -insertwidth {
                        switch -- [string is integer -strict $value] {
                            1   {
                                if { $value > 0 } {
                                    set ::ms::current($w,insertwidth) $value
                                }
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
                    -scrollregion {
                        switch -- [llength $value] {
                            4   {
                                set scrollregion [list ]
                                foreach coordinate $value {
                                    set unit [string index $coordinate end]
                                    switch -- $unit {
                                        0   -
                                        1   -
                                        2   -
                                        3   -
                                        4   -
                                        5   -
                                        6   -
                                        7   -
                                        8   -
                                        9   {
                                            # The coordinate have no unit, its value is assumed to be in pixels.
                                            if { [string is double -strict $coordinate] && ( $coordinate >= 0 ) } {
                                                lappend scrollregion $coordinate
                                            } else {
                                                break
                                            }
                                        }
                                        i   -
                                        c   -
                                        m   -
                                        p   {
                                            set coordinate [string range $coordinate 0 end-1]

                                            if { [string is double -strict $coordinate] && ( $coordinate >= 0 ) } {
                                                switch -- $coordinate {
                                                    0       { lappend scrollregion $coordinate }
                                                    default { lappend scrollregion [string cat $coordinate $unit] }
                                                }
                                            } else { break }
                                        }
                                        default { break }
                                    }
                                }

                                switch -- [llength $scrollregion] {
                                    4   { set ::ms::current($w,scrollregion) $scrollregion }
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
                            normal   { set ::ms::current($w,state) $value }
                        }
                    }
                    -style {
                        if { $value in $::ms::style($::ms::theme,theme) } {
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
                    -xscrollcommand {
                        switch -- [llength $value] {
                            0   {}
                            2   {
                                set addr [lindex $value 0]
                                set cmd  [lindex $value 1]

                                # Get the 'addr' real address.
                                set result [::ms::Check_Pathname $addr invalid]
                                switch -- $result {
                                    invalid { continue }
                                    default { set addr [lindex $result 0] }
                                }

                                # Check that 'addr' corrisponds to a scrollbar widget with horizontal orientation.
                                if { $addr in $::ms::addr(scrollbar) } {
                                    switch -- $::ms::current($addr,orient) {
                                        vertical { continue }
                                    }
                                } else {
                                    continue
                                }

                                # Check the 'cmd' value.
                                switch -nocase -- $cmd {
                                    set     {}
                                    default { continue }
                                }

                                set ::ms::current($w,xscrollcommand) $value
                                set ::ms::data($w,xscrollcommand)    [list $addr $cmd]
                            }
                        }
                    }
                    -xscrollincrement {
                        switch -- [string is integer -strict $value] {
                            1   { set ::ms::current($w,xscrollincrement) $value }
                        }
                    }
                    -yscrollcommand {
                        switch -- [llength $value] {
                            0   {}
                            2   {
                                set addr [lindex $value 0]
                                set cmd  [lindex $value 1]

                                # Get the 'addr' real address.
                                set result [::ms::Check_Pathname $addr invalid]
                                switch -- $result {
                                    invalid { continue }
                                    default { set addr [lindex $result 0] }
                                }

                                # Check that 'addr' corrisponds to a scrollbar widget with vertical orientation.
                                if { $addr in $::ms::addr(scrollbar) } {
                                    switch -- $::ms::current($addr,orient) {
                                        horizontal { continue }
                                    }
                                } else {
                                    continue
                                }

                                # Check the 'cmd' value.
                                switch -nocase -- $cmd {
                                    set     {}
                                    default { continue }
                                }

                                set ::ms::current($w,yscrollcommand) $value
                                set ::ms::data($w,yscrollcommand)    [list $addr $cmd]
                            }
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
            foreach option $::ms::canvas(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Canvas,$option)

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

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'borderwidth', 'cursor', 'insertwidth', 'relief' and 'selectborderwidth' are not allowed to change if the statespec changes.

            # Set the canvas options.
            set canvas_options [list        -background $::ms::current($w,background) \
                                           -closeenough $::ms::current($w,closeenough) \
                                               -confine $::ms::current($w,confine) \
                                                -cursor $cursor \
                                                -height $::ms::current($w,height) \
                                      -insertbackground $::ms::current($w,insertbackground) \
                                     -insertborderwidth $::ms::current($w,insertborderwidth) \
                                         -insertofftime $::ms::current($w,insertofftime) \
                                          -insertontime $::ms::current($w,insertontime) \
                                           -insertwidth $::ms::current($w,insertwidth) \
                                                -offset 0,0 \
                                          -scrollregion $::ms::current($w,scrollregion) \
                                      -selectbackground $::ms::current($w,selectbackground) \
                                     -selectborderwidth $::ms::current($w,selectborderwidth) \
                                      -selectforeground $::ms::current($w,selectforeground) \
                                                 -state $::ms::current($w,state) \
                                             -takefocus $takefocus \
                                                 -width $::ms::current($w,width) \
                                        -xscrollcommand $::ms::data($w,xscrollcommand) \
                                      -xscrollincrement $::ms::current($w,xscrollincrement) \
                                        -yscrollcommand $::ms::data($w,yscrollcommand) \
                                      -yscrollincrement $::ms::current($w,yscrollincrement)];

            # Note: The '-bordercolor' option is not understanded by Tk canvases, but is made available trough
            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
            #       like it behaves in other widgets that has it and understands it.

            # Check the 'relief' type.
            switch -- $::ms::current($w,relief) {
                flat  -
                solid {
                    lappend canvas_options         -borderwidth 0 \
                                           -highlightbackground $::ms::current($w,bordercolor) \
                                                -highlightcolor $::ms::current($w,bordercolor) \
                                            -highlightthickness $::ms::current($w,borderwidth) \
                                                        -relief flat;
                }
                default {
                    lappend canvas_options         -borderwidth $::ms::current($w,borderwidth) \
                                           -highlightbackground $::ms::current($w,background) \
                                                -highlightcolor $::ms::current($w,background) \
                                            -highlightthickness 0 \
                                                        -relief $::ms::current($w,relief);
                }
            }

            # Check if the widget is scrollable or not.
            switch -- $::ms::current($w,scrollable) {
                false {
                    ###########################
                    ##                       ##
                    ##     SIMPLE CANVAS     ##
                    ##                       ##
                    ###########################

                    ####################
                    ##                ##
                    ##     CANVAS     ##
                    ##                ##
                    ####################

                    # Note: Tk canvases don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # Create the widget.
                    _canvas $w {*}$canvas_options

                    # Set the widget toplevel.
                    set ::ms::addr($w,toplevel) [_winfo toplevel $w]
                }
                true {
                    ###############################
                    ##                           ##
                    ##     SCROLLABLE CANVAS     ##
                    ##                           ##
                    ###############################

                    # Remove any provided or default 'xscrollcommand' or 'yscrollcommand' values and substitute them with 'auto'.
                    set ::ms::current($w,xscrollcommand) auto
                    set ::ms::current($w,yscrollcommand) auto

                    # Set the internal value for 'xscrollcommand' and 'yscrollcommand'.
                    set ::ms::data($w,xscrollcommand) [list $w.x set]
                    set ::ms::data($w,yscrollcommand) [list $w.y set]

                    # Check if the height provided is zero.
                    switch -- $::ms::current($w,height) {
                        0   { set ::ms::current($w,height) $::ms::default($w,height) }
                    }

                    # Check if the width provided is zero.
                    switch -- $::ms::current($w,width) {
                        0   { set ::ms::current($w,width) $::ms::default($w,width) }
                    }
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
proc ::ms::canvas::Pathname_Cmd { w cmd args } {}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any canvas widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::canvas::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*