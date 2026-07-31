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

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the widget.
                    switch -- $::ms::current($w,class) {
                        Canvas  { bindtags $w [list $w _Canvas Canvas $::ms::addr($w,toplevel) all] }
                        default { bindtags $w [list $w $::ms::current($w,class) _Canvas Canvas $::ms::addr($w,toplevel) all] }
                    }

                    # Configure
                    _bind $w <Configure> { ::ms::canvas::Configure %W; break }

                    # Enter/Leave
                    _bind $w <Enter> { ::ms::canvas::Pathname_Cmd %W state  hover; break }
                    _bind $w <Leave> { ::ms::canvas::Pathname_Cmd %W state !hover; break }

                    # Add the simple canvas to the related toplevel keyboard pages navigation bindings.
                    ::ms::Enable_Traversal $w

                    #####################
                    ##                 ##
                    ##     CLOSING     ##
                    ##                 ##
                    #####################

                    # Set the widget real address relative to its short address, 'short_addr'.
                    set ::ms::addr($short_addr,real) $w

                    # Set the widget short addresses of all the object composing the megawidget.
                    # They will all point to the widget hull object short address.
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
                    ##     CANVAS     ##
                    ##                ##
                    ####################

                    # Note: Tk Canvases don't understands styles, at least not natively.
                    #       No internal styles needs to be created.

                    # Create the widget.
                    _canvas $w.canvas {*}$canvas_options

                    # Grid the canvas object.
                    _grid $w.canvas -column 0 \
                                      -padx 0 \
                                      -pady 0 \
                                       -row 0 \
                                    -sticky nesw;

                    ########################
                    ##                    ##
                    ##     SCROLLBARS     ##
                    ##                    ##
                    ########################

                    # Create the horizontal scrollbar.
                    _ttk_scrollbar $w.x     -class TScrollbar \
                                          -command [list $w.canvas xview] \
                                           -cursor arrow \
                                           -orient horizontal \
                                            -style TScrollbar \
                                        -takefocus 0;

                    # Create the vertical scrollbar.
                    _ttk_scrollbar $w.y     -class TScrollbar \
                                          -command [list $w.canvas yview] \
                                           -cursor arrow \
                                           -orient vertical \
                                            -style TScrollbar \
                                        -takefocus 0;

                    ######################
                    ##                  ##
                    ##     BINDINGS     ##
                    ##                  ##
                    ######################

                    # Set the new bindtags for the widget container ('w').
                    switch -- $::ms::current($w,class) {
                        Canvas  { bindtags $w [list $w _Canvas Canvas $::ms::addr($w,toplevel) all] }
                        default { bindtags $w [list $w $::ms::current($w,class) _Canvas Canvas $::ms::addr($w,toplevel) all] }
                    }

                    # ButtonPress-1
                    _bind $w.canvas <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel [_winfo parent %W]; break }

                    _bind $w.x <ButtonPress-1>   { ::ms::canvas::Scrollbar_ButtonPress  [_winfo parent %W] horizontal %x %y; break }
                    _bind $w.x <B1-Motion>       { ::ms::canvas::Scrollbar_Drag         [_winfo parent %W] horizontal %x %y; break }
                    _bind $w.x <ButtonRelease-1> { ::ms::canvas::Scrollbar_ButtonRelease; break }

                    _bind $w.y <ButtonPress-1>   { ::ms::canvas::Scrollbar_ButtonPress  [_winfo parent %W] vertical %x %y; break }
                    _bind $w.y <B1-Motion>       { ::ms::canvas::Scrollbar_Drag         [_winfo parent %W] vertical %x %y; break }
                    _bind $w.y <ButtonRelease-1> { ::ms::canvas::Scrollbar_ButtonRelease; break }

                    # Contextual menu
                    _bind $w.canvas <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

                    # Configure
                    _bind $w.canvas <Configure> { ::ms::canvas::Configure [_winfo parent [_winfo parent %W]]; break }

                    # Enter/Leave
                    _bind $w               <Enter> { ::ms::canvas::Hover %W %X %Y; break }
                    _bind $w.canvas        <Enter> { ::ms::canvas::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.x             <Enter> { ::ms::canvas::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.y             <Enter> { ::ms::canvas::Hover [_winfo parent %W] %X %Y; break }

                    _bind $w               <Leave> { ::ms::canvas::Hover %W %X %Y; break }
                    _bind $w.canvas        <Leave> { ::ms::canvas::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.x             <Leave> { ::ms::canvas::Hover [_winfo parent %W] %X %Y; break }
                    _bind $w.y             <Leave> { ::ms::canvas::Hover [_winfo parent %W] %X %Y; break }

                    # FocusIn/FocusOut
                    _bind $w.canvas <FocusIn>  { ::ms::canvas::Focus_In  [_winfo parent %W]; break }
                    _bind $w.canvas <FocusOut> { ::ms::canvas::Focus_Out [_winfo parent %W]; break }

                    # Scan
                    _bind $w.canvas <<ScanMark>>    { ::ms::ScanMark [_winfo parent %W] %x %y; break }
                    _bind $w.canvas <<ScanDrag>>    { ::ms::ScanDrag [_winfo parent %W] %x %y; break }
                    _bind $w.canvas <<ScanRelease>> { ::ms::ScanRelease; break }

                    # Mousewheel and Touchpad

                    # If the widget's vertical scrollbar is active, move the canvas object by one unit up or down
                    # (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.y             <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }
                    _bind $w.canvas        <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

                    # If the widget's horizontal scrollbar is active, move the canvas object by one unit left or right
                    # (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.x             <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
                    _bind $w.canvas        <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

                    # If the widget's vertical scrollbar is active, move the canvas object by one page up or down
                    # (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    # and move that scrollbar by one page up or down (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.y             <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }
                    _bind $w.canvas        <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

                    # If the widget's horizontal scrollbar is active, move the canvas object by one page left or right
                    # (depending on the mousewheel direction).
                    # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    # and move that scrollbar by one page left or right (depending on the mousewheel direction).
                    # If none of the widget's parent meets the required condition, don't do anything.
                    _bind $w.x             <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
                    _bind $w.canvas        <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

                    # Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
                    #       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

                    # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
                    # These two planes may involve different widgets depending on the active scrollbars on them and on the
                    # touchpad direction.
                    #   1 - If the widget's horizontal scrollbar is active, move the canvas object by one unit left or right
                    #       (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    #       and move that scrollbar by one unit left or right (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
                    #
                    #   2 - If the widget's vertical scrollbar is active, move the canvas object by one unit up or down
                    #       (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    #       and move that scrollbar by one unit up or down (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
                    _bind $w.x             <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }
                    _bind $w.y             <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }
                    _bind $w.canvas        <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }

                    # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
                    # These two planes may involve different widgets depending on the active scrollbars on them and on the
                    # touchpad direction.
                    #   1 - If the widget's horizontal scrollbar is active, move the canvas object by one page left or right
                    #       (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
                    #       and move that scrollbar by one page left or right (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
                    #
                    #   2 - If the widget's vertical scrollbar is active, move the canvas object by one page up or down
                    #       (depending on the touchpad direction).
                    #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
                    #       and move that scrollbar by one page up or down (depending on the touchpad direction).
                    #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
                    _bind $w.x             <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }
                    _bind $w.y             <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }
                    _bind $w.canvas        <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }

                    # Add the widget to the related toplevel keyboard pages navigation bindings.
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
                    set ::ms::addr($w,short)        $short_addr
                    set ::ms::addr($w.canvas,short) $short_addr
                    set ::ms::addr($w.x,short)      $short_addr
                    set ::ms::addr($w.y,short)      $short_addr

                    # Add the widget real and short address into the list of all available real and short addresses.
                    lappend ::ms::addr(reals) $w \
                                              $w.canvas \
                                              $w.x \
                                              $w.y;

                    lappend ::ms::addr(shorts) $short_addr

                    # Set the border object (where the 'Enter' and 'Leave' event will happen).
                    set ::ms::addr($w,border) $w.canvas

                    # Set the actual widget address (the widget that the developer was intended to build).
                    set ::ms::addr($w,widget) $w.canvas

                    # Set the structure addresses.
                    # Is important to note that the scrollbar addresses must not be included.
                    set ::ms::addr($w,structure) [list $w \
                                                       $w.canvas];

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
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::canvas::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::canvas::Pathname_Cmd $w]
            }

            # Add the widget address to the canvas classtype widgets real address list.
            lappend ::ms::addr(canvas,classtype) $w

            # Add the widget address to the canvas classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),canvas,addrs) $w

            # Add the widget address to the canvas classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),canvas,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the canvas classtype.
            if { $::ms::current($w,style) ni $::ms::style(canvas,classtype) } {
                lappend ::ms::style(canvas,classtype) $::ms::current($w,style)
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
proc ::ms::canvas::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        addtag        -
        bbox          -
        bind          -
        canvasx       -
        canvasy       -
        coords        -
        dchars        -
        delete        -
        dtag          -
        find          -
        focus         -
        gettags       -
        icursor       -
        image         -
        imove         -
        index         -
        insert        -
        itemcget      -
        itemconfigure -
        lower         -
        move          -
        moveto        -
        postscript    -
        raise         -
        rchars        -
        rotate        -
        scale         -
        scan          -
        select        -
        type          {}
        cget {
            # Synopsis:
            #
            # *window* **cget** *option*
            switch -- [llength $args] {
                0   { ::ms::Error "Missing cget option." $caller_info }
                1   {
                    # Check if the option provided is a valid 'styleable' or 'non-styleable' option.
                    set option [string range $args 1 end]
                    if { ($option in $::ms::canvas(non_styleable,options)) || ($option in $::ms::canvas(styleable,options))} {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid option, '$args'." $caller_info }
            }
        }
        configure {}
        create {
            switch -- [llength $args] {
                0       -
                1       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    set type   [lindex  $args 0]
                    set coords [lindex  $args 1]
                    set args   [lremove $args 0 1]

                    # Check 'type'.
                    switch -- $type {
                        arc       -
                        bitmap    -
                        image     -
                        line      -
                        oval      -
                        polygon   -
                        rectangle -
                        text      -
                        window    {}
                        default   { ::ms::Error "Invalid option, '$type'." $caller_info }
                    }

                    # Check 'coords'.
                    switch -- [expr { [llength $coords]%2 }] {
                        0   {
                            foreach coord $coords {
                                switch -- [string index $coord end] {
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
                                        if { ![string is double -strict $coord] || ( $coord < 0 ) } {
                                            ::ms::Error "Invalid coordinate, '$coords'." $caller_info
                                        }
                                    }
                                    i   -
                                    c   -
                                    m   -
                                    p   {
                                        set coord [string range $coord 0 end-1]

                                        if { ![string is double -strict $coord] || ( $coord < 0 ) } {
                                            ::ms::Error "Invalid coordinate, '$coords'." $caller_info
                                        }
                                    }
                                    default { ::ms::Error "Invalid coordinate, '$coords'." $caller_info }
                                }
                            }
                        }
                        default { ::ms::Error "Invalid number of coordinates, '$coords'." $caller_info }
                    }

                    # Check that the remaining 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            ###############################################
                            ##                                           ##
                            ##     CHECK THE CREATE OPTIONS PROVIDED     ##
                            ##                                           ##
                            ###############################################

                            # Check the remaining widget's options, if any.
                            set new_args [list ]
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -activebackground   -
                                    -activefill         -
                                    -activeforeground   -
                                    -activeoutline      -
                                    -background         -
                                    -disabledbackground -
                                    -disabledfill       -
                                    -disabledforeground -
                                    -disabledoutline    -
                                    -fill               -
                                    -foreground         -
                                    -outline            {
                                        set result [::ms::Check_Color $value invalid]
                                        switch -- $result {
                                            invalid { ::ms::Error "'$value' is not a valid color." $caller_info }
                                            default { lappend new_args $option $result }
                                        }
                                    }
                                    -activebitmap           -
                                    -activedash             -
                                    -activeimage            -
                                    -activeoutlinestipple   -
                                    -activestipple          -
                                    -activewidth            -
                                    -anchor                 -
                                    -angle                  -
                                    -arrow                  -
                                    -arrowshape             -
                                    -bitmap                 -
                                    -capstyle               -
                                    -dash                   -
                                    -dashoffset             -
                                    -disabledbitmap         -
                                    -disableddash           -
                                    -disabledimage          -
                                    -disabledoutlinestipple -
                                    -disabledstipple        -
                                    -disabledwidth          -
                                    -extent                 -
                                    -font                   -
                                    -height                 -
                                    -image                  -
                                    -joinstyle              -
                                    -justify                -
                                    -offset                 -
                                    -outlineoffset          -
                                    -outlinestipple         -
                                    -start                  -
                                    -state                  -
                                    -stipple                -
                                    -style                  -
                                    -smooth                 -
                                    -splinesteps            -
                                    -tags                   -
                                    -text                   -
                                    -underline              -
                                    -width                  { lappend new_args $option $value }
                                    -window {
                                        # Get the 'window' real address.
                                        set result [::ms::Check_Pathname $window invalid]
                                        switch -- $result {
                                            invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                            default { lappend new_args -window [lindex $result 0] }
                                        }
                                    }
                                    default { ::ms::Error "Invalid create option, '$option'." $caller_info }
                                }
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }

                    switch -- $::ms::current($w,scrollable) {
                        false {
                            # Execute the command.
                            try {
                                interp invokehidden {} $w $cmd $type $coords {*}$new_args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                        true {
                            # Execute the command.
                            try {
                                $w.canvas $cmd $type $coords {*}$new_args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return $result
                            }
                        }
                    }
                }
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

                    # Compare the statespec provided with the current statespec of the widget.
                    set boolean 1
                    foreach state $statespec {
                        if { $state ni $::ms::data($w,statespec) } {
                            set boolean 0
                            break
                        }
                    }

                    return $boolean
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

                    # Compare the statespec provided with the current statespec of the widget.
                    foreach state $statespec {
                        if { $state ni $::ms::data($w,statespec) } {
                            return ""
                        }
                    }

                    # Execute the script.
                    try {
                        eval $script
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
                0   { return [lsort -increasing -dictionary $::ms::data($w,statespec)] }
                1   {
                    # Check the widget state.
                    switch -- $::ms::current($w,state) {
                        disabled { set statespec disabled }
                        normal {
                            # Check the 'statespec' provided.
                            set statespec $args
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
                        }
                    }

                    # Change the statespec and register the states that have changed.
                    set states_that_have_changed [list ]
                    foreach state $statespec {
                        if { $state ni $::ms::data($w,statespec) } {
                            # Note: The state analized is different than its equivalent currently active (old state).
                            #       For example 'disabled' (state) and '!disabled' (old state).

                            # Get the old state as the inverse of the new state.
                            switch -glob -- $state {
                                "!*"    { set old_state [string trimleft $state "!"] }
                                default { set old_state [string cat      "!" $state] }
                            }

                            # Update the current statespec old state with the new state.
                            set index [lsearch -exact $::ms::data($w,statespec) $old_state]

                            # No need to check if 'index' is '-1'.
                            set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) $index $index $state]

                            # Add the old state to the list containing the states that have changed.
                            lappend states_that_have_changed $old_state
                        }
                    }

                    #####################################
                    ##                                 ##
                    ##     UPDATE THE WIDGET STATE     ##
                    ##                                 ##
                    #####################################

                    # Note: 'borderwidth', 'cursor', 'insertwidth', 'relief' and 'selectborderwidth' are not allowed to change if the statespec changes.

                    # background
                    switch -- $::ms::managed_by($w,background) {
                        developer { set background $::ms::current($w,background) }
                        Tk        { set background [_ttk_style lookup $::ms::current($w,style) -background $::ms::data($w,statespec) $::ms::default($w,background)] }
                    }

                    # bordercolor
                    switch -- $::ms::managed_by($w,bordercolor) {
                        developer { set bordercolor $::ms::current($w,bordercolor) }
                        Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
                    }

                    # insertbackground
                    switch -- $::ms::managed_by($w,insertbackground) {
                        developer { set insertbackground $::ms::current($w,insertbackground) }
                        Tk        { set insertbackground [_ttk_style lookup $::ms::current($w,style) -insertbackground $::ms::data($w,statespec) $::ms::default($w,insertbackground)] }
                    }

                    # selectbackground
                    switch -- $::ms::managed_by($w,selectbackground) {
                        developer { set selectbackground $::ms::current($w,selectbackground) }
                        Tk        { set selectbackground [_ttk_style lookup $::ms::current($w,style) -selectbackground $::ms::data($w,statespec) $::ms::default($w,selectbackground)] }
                    }

                    # selectforeground
                    switch -- $::ms::managed_by($w,selectforeground) {
                        developer { set selectforeground $::ms::current($w,selectforeground) }
                        Tk        { set selectforeground [_ttk_style lookup $::ms::current($w,style) -selectforeground $::ms::data($w,statespec) $::ms::default($w,selectforeground)] }
                    }

                    # Set the canvas options.
                    set canvas_options [list       -background $background \
                                             -insertbackground $insertbackground \
                                             -selectbackground $selectbackground \
                                             -selectforeground $selectforeground];

                    # Note: The '-bordercolor' option is not understanded by Tk canvases, but is made available trough
                    #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                    #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                    #       like it behaves in other widgets that has it and understands it.

                    # Check the 'relief' type.
                    switch -- $::ms::current($w,relief) {
                        flat  -
                        solid {
                            lappend canvas_options -highlightbackground $bordercolor \
                                                        -highlightcolor $bordercolor;
                        }
                        default {
                            lappend canvas_options -highlightbackground $background \
                                                        -highlightcolor $background;
                        }
                    }

                    #####################################
                    ##                                 ##
                    ##     UPDATE THE WIDGET STATE     ##
                    ##                                 ##
                    #####################################

                    # Check if the widget is scrollable or not.
                    switch -- $::ms::current($w,scrollable) {
                        false {
                            ###########################
                            ##                       ##
                            ##     SIMPLE CANVAS     ##
                            ##                       ##
                            ###########################

                            # Note: Tk canvases don't understands styles, at least not natively.
                            #       No internal styles needs to be created.

                            # Apply the changes.
                            interp invokehidden {} $w configure {*}$canvas_options
                        }
                        true {
                            ###############################
                            ##                           ##
                            ##     SCROLLABLE CANVAS     ##
                            ##                           ##
                            ###############################

                            # Note: Canvases don't understands styles natively.

                            # Propagate the new statespec to the widget's hull and border objects.
                            interp invokehidden {} $w state $::ms::data($w,statespec)

                            # Apply the changes.
                            $w.canvas configure {*}$canvas_options
                        }
                    }

                    return $states_that_have_changed
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