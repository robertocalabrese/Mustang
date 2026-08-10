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
package provide ::ms::listbox 0.1

###############################
##                           ##
##     _LISTBOX BINDINGS     ##
##                           ##
###############################

# Activate/Deactivate
_bind _Listbox <Activate>   { ::ms::listbox::Pathname_Cmd %W state !background; break }
_bind _Listbox <Deactivate> { ::ms::listbox::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Listbox <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Listbox <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Listbox <Destroy> { ::ms::listbox::Destroy %W; break }

# Enter/Leave
_bind _Listbox <Enter> { ::ms::listbox::Hover %W %X %Y; break }
_bind _Listbox <Leave> { ::ms::listbox::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Listbox <FocusIn>  { ::ms::listbox::Focus_In  %W; break }
_bind _Listbox <FocusOut> { ::ms::listbox::Focus_Out %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Listbox <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Listbox <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Listbox <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Listbox <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Listbox <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Listbox <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **listbox** package.
namespace eval ::ms::listbox {
    # Set the 'non-styleable' listbox option list.
    set ::ms::listbox(non_styleable,options) [list activestyle \
                                                   class \
                                                   cmenu \
                                                   exportselection \
                                                   selectmode \
                                                   setgrid \
                                                   state \
                                                   style \
                                                   takefocus \
                                                   values];

    # Set the 'styleable' listbox option list.
    set ::ms::listbox(styleable,options) [list background \
                                               bordercolor \
                                               borderwidth \
                                               columns \
                                               cursor \
                                               disabledforeground \
                                               font \
                                               foreground \
                                               justify \
                                               preselectbackground \
                                               preselectforeground \
                                               relief \
                                               rows \
                                               selectbackground \
                                               selectborderwidth \
                                               selectforeground \
                                               shellbackground];

    # Set the default 'non-styleable' listbox options values.
    set ::ms::default(listbox,activestyle)     underline
    set ::ms::default(listbox,class)           Listbox
    set ::ms::default(listbox,cmenu)           {}
    set ::ms::default(listbox,exportselection) 0
    set ::ms::default(listbox,selectmode)      browse
    set ::ms::default(listbox,setgrid)         0
    set ::ms::default(listbox,state)           normal
    set ::ms::default(listbox,style)           Listbox
    set ::ms::default(listbox,takefocus)       1
    set ::ms::default(listbox,values)          {}

    # Note: The default 'styleable' listbox options values are always defined inside the current theme.
}

# Rename the original Tk **listbox** command.
rename listbox _listbox

# Create an alias for the mustang **listbox** command.
interp alias {} listbox {} ::ms::listbox::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **listbox** widget command.
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
proc ::ms::listbox::Command { window { args "" } } {
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
            set ::ms::default($w,activestyle)     $::ms::default(listbox,activestyle)
            set ::ms::default($w,class)           $::ms::default(listbox,class)
            set ::ms::default($w,cmenu)           $::ms::default(listbox,cmenu)
            set ::ms::default($w,exportselection) $::ms::default(listbox,exportselection)
            set ::ms::default($w,selectmode)      $::ms::default(listbox,selectmode)
            set ::ms::default($w,setgrid)         $::ms::default(listbox,setgrid)
            set ::ms::default($w,state)           $::ms::default(listbox,state)
            set ::ms::default($w,style)           $::ms::default(listbox,style)
            set ::ms::default($w,takefocus)       $::ms::default(listbox,takefocus)
            set ::ms::default($w,values)          $::ms::default(listbox,values)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,activestyle)     $::ms::default(listbox,activestyle)
            set ::ms::current($w,class)           $::ms::default(listbox,class)
            set ::ms::current($w,cmenu)           $::ms::default(listbox,cmenu)
            set ::ms::current($w,exportselection) $::ms::default(listbox,exportselection)
            set ::ms::current($w,selectmode)      $::ms::default(listbox,selectmode)
            set ::ms::current($w,setgrid)         $::ms::default(listbox,setgrid)
            set ::ms::current($w,state)           $::ms::default(listbox,state)
            set ::ms::current($w,style)           $::ms::default(listbox,style)
            set ::ms::current($w,takefocus)       $::ms::default(listbox,takefocus)
            set ::ms::current($w,values)          $::ms::default(listbox,values)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype)         listbox
            set ::ms::data($w,listvariable)      {}
            set ::ms::data($w,preselected_index) ""
            set ::ms::data($w,statespec)         $::ms::data(statespec,normal)
            set ::ms::data($w,scrollx)           off
            set ::ms::data($w,scrolly)           off

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
            #       To make a listbox styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **listbox** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)          Tk
            set ::ms::managed_by($w,bordercolor)         Tk
            set ::ms::managed_by($w,borderwidth)         Tk
            set ::ms::managed_by($w,columns)             Tk
            set ::ms::managed_by($w,cursor)              Tk
            set ::ms::managed_by($w,disabledforeground)  Tk
            set ::ms::managed_by($w,font)                Tk
            set ::ms::managed_by($w,foreground)          Tk
            set ::ms::managed_by($w,justify)             Tk
            set ::ms::managed_by($w,preselectbackground) Tk
            set ::ms::managed_by($w,preselectforeground) Tk
            set ::ms::managed_by($w,relief)              Tk
            set ::ms::managed_by($w,rows)                Tk
            set ::ms::managed_by($w,selectbackground)    Tk
            set ::ms::managed_by($w,selectborderwidth)   Tk
            set ::ms::managed_by($w,selectforeground)    Tk
            set ::ms::managed_by($w,shellbackground)     Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -activestyle {
                        set value [string tolower $value]
                        switch -- $value {
                            dotbox    -
                            none      -
                            underline { set ::ms::current($w,activestyle) $value }
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
                    -columns {
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,columns)    $value
                                set ::ms::managed_by($w,columns) developer
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
                    -disabledforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,disabledforeground)    $value
                        set ::ms::managed_by($w,disabledforeground) developer
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
                    -preselectbackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,preselectbackground)    $value
                        set ::ms::managed_by($w,preselectbackground) developer
                    }
                    -preselectforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,preselectforeground)    $value
                        set ::ms::managed_by($w,preselectforeground) developer
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
                    -rows {
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,rows)    $value
                                set ::ms::managed_by($w,rows) developer
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
                    -selectmode {
                        set value [string tolower $value]
                        switch -- $value {
                            browse   -
                            extended -
                            multiple -
                            single   { set ::ms::current($w,selectmode) $value }
                        }
                    }
                    -setgrid {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,setgrid) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,setgrid) 1 }
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
                    -state {
                        set value [string tolower $value]
                        switch -- $value {
                            disabled {
                                set ::ms::current($w,state) disabled

                                # Set the widget dynamic state to 'disabled'
                                set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) 3 3 "disabled"]
                            }
                            normal { set ::ms::current($w,state) normal }
                        }
                    }
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
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
                    -values {
                        set value [string trim $value]

                        set ::ms::current($w,values)    $value
                        set ::ms::data($w,listvariable) $value
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::listbox(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Listbox,$option)

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

            # Note: 'background', 'borderwidth', 'columns', 'cursor', 'disabledforeground', 'font', 'foreground',
            #       'justify', 'preselectbackground', 'preselectforeground', 'relief', 'rows', 'selectbackground'
            #       and 'selectforeground' are not allowed to change if the statespec changes.

            # bordercolor
            switch -- $::ms::managed_by($w,bordercolor) {
                developer { set bordercolor $::ms::current($w,bordercolor) }
                Tk        { set bordercolor [_ttk_style lookup $stylename -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
            }

            # Set the listbox options.
            set listbox_options [list         -activestyle $::ms::current($w,activestyle) \
                                               -background $::ms::current($w,background) \
                                                   -cursor $cursor \
                                          -exportselection $::ms::current($w,exportselection) \
                                       -disabledforeground $::ms::current($w,disabledforeground) \
                                                     -font $::ms::current($w,font) \
                                               -foreground $::ms::current($w,foreground) \
                                                   -height $::ms::current($w,rows) \
                                                  -justify $::ms::current($w,justify) \
                                             -listvariable ::ms::data($w,listvariable) \
                                         -selectbackground $::ms::current($w,selectbackground) \
                                        -selectborderwidth $::ms::current($w,selectborderwidth) \
                                         -selectforeground $::ms::current($w,selectforeground) \
                                               -selectmode $::ms::current($w,selectmode) \
                                                  -setgrid $::ms::current($w,setgrid) \
                                                    -state $::ms::current($w,state) \
                                                -takefocus $takefocus \
                                                    -width $::ms::current($w,columns) \
                                           -xscrollcommand [list $w.x set] \
                                           -yscrollcommand [list $w.y set]];

            # Note: The '-bordercolor' option is not understanded by Tk listboxes, but is made available trough
            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
            #       like it behaves in other widgets that understands the bordercolor.

            # Check the 'relief' type.
            switch -- $::ms::current($w,relief) {
                flat  -
                solid {
                    lappend listbox_options         -borderwidth 0 \
                                            -highlightbackground $bordercolor \
                                                 -highlightcolor $bordercolor \
                                             -highlightthickness $::ms::current($w,borderwidth) \
                                                         -relief flat;
                }
                default {
                    lappend listbox_options         -borderwidth $::ms::current($w,borderwidth) \
                                            -highlightbackground $::ms::current($w,background) \
                                                 -highlightcolor $::ms::current($w,background) \
                                             -highlightthickness 0 \
                                                         -relief $::ms::current($w,relief);
                }
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

            #####################
            ##                 ##
            ##     LISTBOX     ##
            ##                 ##
            #####################

            # Note: Tk listboxes don't understands styles, at least not natively.
            #       No internal styles needs to be created.

            # Create the widget.
            _listbox $w.listbox {*}$listbox_options

            # Grid the listbox object.
            _grid $w.listbox -column 0 \
                               -padx 0 \
                               -pady 0 \
                                -row 0 \
                             -sticky nesw;

            # Check if the widget has values.
            switch -- $::ms::current($w,values) {
                ""      {}
                default {
                    # Select the first index of the listbox.
                    $w.listbox selection set 0

                    # Set the selection anchor to the first index.
                    $w.listbox selection anchor 0

                    # Activate the selected index.
                    $w.listbox activate 0
                }
            }

            #######################
            ##                   ##
            ##     SCROLLBAR     ##
            ##                   ##
            #######################

            # Create the horizontal scrollbar address.
            _ttk_scrollbar $w.x     -class TScrollbar \
                                  -command [list $w.listbox xview] \
                                   -cursor arrow \
                                   -orient horizontal \
                                    -style TScrollbar \
                                -takefocus 0;

            # Create the vertical scrollbar address.
            _ttk_scrollbar $w.y     -class TScrollbar \
                                  -command [list $w.listbox yview] \
                                   -cursor arrow \
                                   -orient vertical \
                                    -style TScrollbar \
                                -takefocus 0;

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Note: Differently than most other widgets, the listbox widget doesn't have a '-class' option in Tk.
            #       If a different class than 'Listbox' is provided, we need to adapt the bindtags.

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                Listbox { bindtags $w [list $w _Listbox Listbox $::ms::addr($w,toplevel) all] }
                default { bindtags $w [list $w $::ms::current($w,class) _Listbox Listbox $::ms::addr($w,toplevel) all] }
            }

            # ButtonPress-1
            _bind $w.listbox <ButtonPress-1> { ::ms::listbox::Begin_Select [_winfo parent %W] %x %y; break }
            _bind $w.listbox <B1-Motion>     { ::ms::listbox::B1_Motion    [_winfo parent %W] %x %y; break }

            _bind $w.x <ButtonPress-1>   { ::ms::listbox::Scrollbar_ButtonPress [_winfo parent %W] horizontal %x %y; break }
            _bind $w.x <B1-Motion>       { ::ms::listbox::Scrollbar_Drag        [_winfo parent %W] horizontal %x %y; break }
            _bind $w.x <ButtonRelease-1> { ::ms::listbox::Scrollbar_ButtonRelease; break }

            _bind $w.y <ButtonPress-1>   { ::ms::listbox::Scrollbar_ButtonPress [_winfo parent %W] vertical %x %y; break }
            _bind $w.y <B1-Motion>       { ::ms::listbox::Scrollbar_Drag        [_winfo parent %W] vertical %x %y; break }
            _bind $w.y <ButtonRelease-1> { ::ms::listbox::Scrollbar_ButtonRelease; break }

            # Contextual menu
            _bind $w.listbox <<ContextMenu>> { ::ms::Show_ContextMenu [_winfo parent %W] %X %Y cmenu; break }

            # Configure
            _bind $w.listbox <Configure> { ::ms::listbox::Configure [_winfo parent %W]; break }

            # Enter/Leave
            _bind $w.listbox <Enter> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.x       <Enter> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.y       <Enter> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }

            _bind $w.listbox <Leave> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.x       <Leave> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }
            _bind $w.y       <Leave> { ::ms::listbox::Hover [_winfo parent %W] %X %Y; break }

            # FocusIn/FocusOut
            _bind $w.listbox <FocusIn>  { ::ms::listbox::Focus_In  [_winfo parent %W]; break }
            _bind $w.listbox <FocusOut> { ::ms::listbox::Focus_Out [_winfo parent %W]; break }

            # Motion
            _bind $w.listbox <Motion> { ::ms::listbox::Motion [_winfo parent %W] %x %y; break }

            # Scan
            _bind $w.listbox <<ScanMark>>    { ::ms::Scan_Mark [_winfo parent %W] %x %y; break }
            _bind $w.listbox <<ScanDrag>>    { ::ms::Scan_Drag [_winfo parent %W] %x %y; break }
            _bind $w.listbox <<ScanRelease>> { ::ms::Scan_Release; break }

            # Select/Unselect one item.
            _bind $w.listbox <<ToggleSelection>> { ::ms::listbox::Select [_winfo parent %W]; break }

            # Select/Unselect all items.
            _bind $w.listbox <<SelectAll>>   { ::ms::listbox::Select_All   [_winfo parent %W]; break }
            _bind $w.listbox <<SelectNone>>  { ::ms::listbox::Unselect_All [_winfo parent %W]; break }

            # If the widget state is normal, start selecting from the active item row towards the top.
            _bind $w.listbox <<SelectPrevLine>> { ::ms::listbox::Extend_Up_Down [_winfo parent %W] -1; break }

            # If the widget state is normal, start selecting from the active item row towards the bottom.
            _bind $w.listbox <<SelectNextLine>> { ::ms::listbox::Extend_Up_Down [_winfo parent %W] 1; break }

            # If the widget state is normal, start selecting from the active item row to the very first item.
            _bind $w.listbox <<SelectLineTop>> { ::ms::listbox::Extend_Home_End [_winfo parent %W] home; break }

            # If the widget state is normal, start selecting from the active item row to the very last item.
            _bind $w.listbox <<SelectLineBottom>> { ::ms::listbox::Extend_Home_End [_winfo parent %W] end; break }

            # If the widget state is normal or the listbox has no values, move the active row item to the very
            # first item, if not don't do anything.
            _bind $w.listbox <<LineTop>>   { ::ms::listbox::Home [_winfo parent %W]; break }
            _bind $w.listbox <<LineStart>> { ::ms::listbox::Home [_winfo parent %W]; break }

            # If the widget state is normal or the listbox has no values, move the active row item to the very
            # last item, if not don't do anything.
            _bind $w.listbox <<LineBottom>> { ::ms::listbox::End [_winfo parent %W]; break }
            _bind $w.listbox <<LineEnd>>    { ::ms::listbox::End [_winfo parent %W]; break }

            # If the widget state is normal, move back the active row item by one row (note that row cycling is active).
            # In any other cases, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one unit towards the top.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<PrevLine>> { ::ms::listbox::Arrow_Up [_winfo parent %W]; break }

            # If the widget state is normal, move forward the active row item by one row (note that row cycling is active).
            # In any other cases, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one unit towards the bottom.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<NextLine>> { ::ms::listbox::Arrow_Down [_winfo parent %W]; break }

            # If the widget state is normal and the widget has an active horizontal scrollbar, move one unit towards the left.
            # In any other cases, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one unit towards the left.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<PrevChar>> { ::ms::listbox::Prev_Char [_winfo parent %W]; break }

            # If the widget state is normal and the widget has an active horizontal scrollbar, move one unit towards the right.
            # In any other cases, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one unit towards the right.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<NextChar>> { ::ms::listbox::Next_Char [_winfo parent %W]; break }

            # If the widget state is normal and the widget has an active horizontal scrollbar, move one page towards the left.
            # In any other cases, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one page towards the left.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<PageLeft>> { ::ms::listbox::PageLeft [_winfo parent %W]; break }

            # If the widget state is normal and the widget has an active horizontal scrollbar, move one page towards the right.
            # In any other cases, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one page towards the right.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<PageRight>> { ::ms::listbox::PageRight [_winfo parent %W]; break }

            # If the widget state is normal and the widget has an active vertical scrollbar, move one page towards the top.
            # In any other cases, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one page towards the top.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<PageUp>> { ::ms::listbox::PageUp [_winfo parent %W]; break }

            # If the widget state is normal and the widget has an active vertical scrollbar, move one page towards the bottom.
            # In any other cases, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one page towards the bottom.
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <<PageDown>> { ::ms::listbox::PageDown [_winfo parent %W]; break }

            # Disable the following bindings to prevent Tk to fire them up:
            _bind $w.listbox <<Copy>>                 { break }
            _bind $w.listbox <Control-KeyPress-space> { break }
            _bind $w.listbox <<NextWord>>             { break }
            _bind $w.listbox <<PrevWord>>             { break }

            # Mousewheel and Touchpad

            # If the widget's vertical scrollbar is active, move the listbox object by one unit up or down
            # (depending on the mousewheel direction).
            # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one unit up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }
            _bind $w.y       <MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D units; break }

            # If the widget's horizontal scrollbar is active, move the listbox object by one unit left or right
            # (depending on the mousewheel direction).
            # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one unit left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }
            _bind $w.x       <MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D units; break }

            # If the widget's vertical scrollbar is active, move the listbox object by one page up or down
            # (depending on the mousewheel direction).
            # Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            # and move that scrollbar by one page up or down (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }
            _bind $w.y       <Control-MouseWheel> { ::ms::Scroll_Widget_Y [_winfo parent %W] %D pages; break }

            # If the widget's horizontal scrollbar is active, move the listbox object by one page left or right
            # (depending on the mousewheel direction).
            # Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            # and move that scrollbar by one page left or right (depending on the mousewheel direction).
            # If none of the widget's parent meets the required condition, don't do anything.
            _bind $w.listbox <Control-Shift-MouseWheel> { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }
            _bind $w.x       <Control-MouseWheel>       { ::ms::Scroll_Widget_X [_winfo parent %W] %D pages; break }

            # Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
            #       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

            # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
            # These two planes may involve different widgets depending on the active scrollbars on them and on the
            # touchpad direction.
            #   1 - If the widget's horizontal scrollbar is active, move the listbox object by one unit left or right
            #       (depending on the touchpad direction).
            #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            #       and move that scrollbar by one unit left or right (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
            #
            #   2 - If the widget's vertical scrollbar is active, move the listbox object by one unit up or down
            #       (depending on the touchpad direction).
            #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            #       and move that scrollbar by one unit up or down (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
            _bind $w.listbox <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }
            _bind $w.x       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }
            _bind $w.y       <TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D units; break }

            # This binding movement will happen on two different planes, horizontal (1) and vertical (2).
            # These two planes may involve different widgets depending on the active scrollbars on them and on the
            # touchpad direction.
            #   1 - If the widget's horizontal scrollbar is active, move the listbox object by one page left or right
            #       (depending on the touchpad direction).
            #       Otherwise, try to find the innermost widget's scrollable parent with an active horizontal scrollbar
            #       and move that scrollbar by one page left or right (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
            #
            #   2 - If the widget's vertical scrollbar is active, move the listbox object by one page up or down
            #       (depending on the touchpad direction).
            #       Otherwise, try to find the innermost widget's scrollable parent with an active vertical scrollbar
            #       and move that scrollbar by one page up or down (depending on the touchpad direction).
            #       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
            _bind $w.listbox <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }
            _bind $w.x       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }
            _bind $w.y       <Control-TouchpadScroll> { ::ms::Touchpad_Widget [_winfo parent %W] %# %D pages; break }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Configure the internal widget rows and columns.
            _grid rowconfigure    $w [list 0] -weight 1
            _grid columnconfigure $w [list 0] -weight 1

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::listbox::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::listbox::Pathname_Cmd $w]
            }

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short addresses relative to its real address, 'w'.
            # They will all point to the widget hull object short address.
            set ::ms::addr($w,short)         $short_addr
            set ::ms::addr($w.listbox,short) $short_addr
            set ::ms::addr($w.x,short)       $short_addr
            set ::ms::addr($w.y,short)       $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals) $w \
                                      $w.listbox \
                                      $w.x \
                                      $w.y;

            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the listbox widgets real address list.
            lappend ::ms::addr(listbox) $w

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w.listbox

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w.listbox

            # Set the structure addresses.
            # Is important to note that the scrollbar addresses must not be included.
            set ::ms::addr($w,structure) [list $w \
                                               $w.listbox];

            # Add the widget address to the listbox classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),listbox,addrs) $w

            # Add the widget address to the listbox classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),listbox,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the listbox classtype.
            if { $::ms::current($w,style) ni $::ms::style(listbox,classtype) } {
                lappend ::ms::style(listbox,classtype) $::ms::current($w,style)
            }

            # Add the widget address to the megawidget addresses list.
            lappend ::ms::addr(megawidgets) $w

            # Add the widget address to the scrollable megawidget addresses list.
            lappend ::ms::addr(megawidgets,scrollable) $w

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
proc ::ms::listbox::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        activate {
            # Synopsis:
            #
            # *window* **activate** *index*

            # Check if there are items associated to the listbox.
            switch -- $::ms::current($w,values) {
                ""   { return "" }
            }

            try {
                $w.listbox activate $args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                # Register the new preselected index.
                set ::ms::data($w,preselected_index) $args

                return $result
            }
        }
        bbox         -
        curselection -
        delete       -
        get          -
        index        -
        insert       -
        itemcget     -
        nearest      -
        scan         -
        see          -
        size         {
            # Synopsis:
            #
            # *window* **bbox** *index*
            # *window* **curselection**
            # *window* **delete** *first* ?*last*?
            # *window* **get** *first* ?*last*?
            # *window* **index** *index*
            # *window* **insert** *index* ?*element* ... *element*?
            # *window* **itemcget** *index* *option*
            # *window* **nearest** *y*
            # *window* **scan** *option* *args*
            #    *window* **scan** **mark** *x* *y*
            #    *window* **scan** **dragto** *x* *y*
            # *window* **see** *index*
            # *window* **size**
            try {
                $w.listbox $cmd {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
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
                    if { ($option in $::ms::listbox(non_styleable,options)) || ($option in $::ms::listbox(styleable,options))} {
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
                    foreach option $::ms::listbox(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::listbox(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::listbox(non_styleable,options)) || ($option in $::ms::listbox(styleable,options)) } {
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

                            # Set a variable indicating if a new set of values have been provided.
                            set new_values false

                            ##################################################
                            ##                                              ##
                            ##     CHECK THE CONFIGURE OPTIONS PROVIDED     ##
                            ##                                              ##
                            ##################################################

                            # Check the remaining widget's options, if any.
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -activestyle {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            dotbox    -
                                            none      -
                                            underline { set ::ms::current($w,activestyle) $value }
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
                                    -class {}
                                    -cmenu {
                                        set value [string trim $value]
                                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                                            set ::ms::current($w,cmenu) $value
                                        }
                                    }
                                    -columns {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                set ::ms::current($w,columns)    $value
                                                set ::ms::managed_by($w,columns) developer
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
                                    -disabledforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,disabledforeground)    $value
                                        set ::ms::managed_by($w,disabledforeground) developer
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
                                            center  -
                                            left    -
                                            right   {
                                                set ::ms::current($w,justify)    $value
                                                set ::ms::managed_by($w,justify) developer
                                            }
                                        }
                                    }
                                    -preselectbackground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,preselectbackground)    $value
                                        set ::ms::managed_by($w,preselectbackground) developer
                                    }
                                    -preselectforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,preselectforeground)    $value
                                        set ::ms::managed_by($w,preselectforeground) developer
                                    }
                                    -relief {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            flat    -
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
                                    -rows {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                set ::ms::current($w,rows)    $value
                                                set ::ms::managed_by($w,rows) developer
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
                                    -selectmode {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            browse   -
                                            extended -
                                            multiple -
                                            single   { set ::ms::current($w,selectmode) $value }
                                        }
                                    }
                                    -setgrid {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,setgrid) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,setgrid) 1 }
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
                                    -state {
                                        set value [string tolower $value]
                                        switch -- $value {
                                            disabled {
                                                set ::ms::current($w,state) disabled

                                                # Set the widget dynamic state to 'disabled'
                                                set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) 3 3 "disabled"]
                                            }
                                            normal {
                                                set ::ms::current($w,state) normal

                                                # Set the widget dynamic state to '!disabled'
                                                set ::ms::data($w,statespec) [lreplace $::ms::data($w,statespec) 3 3 "!disabled"]
                                            }
                                        }
                                    }
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Remove the widget address from the listbox real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),listbox,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),listbox,addrs) [lremove $::ms::style($::ms::current($w,style),listbox,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,listbox,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the listbox classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),listbox,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(listbox,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(listbox,classtype) [lremove $::ms::style(listbox,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the listbox classtype.
                                            if { $value ni $::ms::style(listbox,classtype) } {
                                                lappend ::ms::style(listbox,classtype) $value
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
                                    -values {
                                        set value [string trim $value]

                                        set ::ms::current($w,values)    $value
                                        set ::ms::data($w,listvariable) $value

                                        set new_values true
                                    }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::listbox(styleable,options) {
                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            # Check the widget state and set the cursor, statespec and takefocus accordingly.
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

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'background', 'borderwidth', 'columns', 'cursor', 'disabledforeground', 'font', 'foreground',
                            #       'justify', 'preselectbackground', 'preselectforeground', 'relief', 'rows', 'selectbackground'
                            #       and 'selectforeground' are not allowed to change if the statespec changes.

                            # bordercolor
                            switch -- $::ms::managed_by($w,bordercolor) {
                                developer { set bordercolor $::ms::current($w,bordercolor) }
                                Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
                            }

                            # Set the listbox options.
                            set listbox_options [list        -activestyle $::ms::current($w,activestyle) \
                                                              -background $::ms::current($w,background) \
                                                                  -cursor $cursor \
                                                         -exportselection $::ms::current($w,exportselection) \
                                                      -disabledforeground $::ms::current($w,disabledforeground) \
                                                                    -font $::ms::current($w,font) \
                                                              -foreground $::ms::current($w,foreground) \
                                                                  -height $::ms::temp($w,rows) \
                                                                 -justify $::ms::current($w,justify) \
                                                        -selectbackground $::ms::current($w,selectbackground) \
                                                       -selectborderwidth $::ms::current($w,selectborderwidth) \
                                                        -selectforeground $::ms::current($w,selectforeground) \
                                                              -selectmode $::ms::current($w,selectmode) \
                                                                 -setgrid $::ms::current($w,setgrid) \
                                                                   -state $::ms::current($w,state) \
                                                               -takefocus $takefocus \
                                                                   -width $::ms::temp($w,columns)];

                            # Note: The '-bordercolor' option is not understanded by Tk listboxes, but is made available trough
                            #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                            #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                            #       like it behaves in other widgets that understands the bordercolor.

                            # Check the 'relief' type.
                            switch -- $::ms::current($w,relief) {
                                flat  -
                                solid {
                                    lappend listbox_options         -borderwidth 0 \
                                                            -highlightbackground $bordercolor \
                                                                 -highlightcolor $bordercolor \
                                                             -highlightthickness $::ms::current($w,borderwidth) \
                                                                         -relief flat;
                                }
                                default {
                                    lappend listbox_options         -borderwidth $::ms::current($w,borderwidth) \
                                                            -highlightbackground $::ms::current($w,background) \
                                                                 -highlightcolor $::ms::current($w,background) \
                                                             -highlightthickness 0 \
                                                                         -relief $::ms::current($w,relief);
                                }
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

                            # Apply the changes.
                            interp invokehidden {} $w configure -style $::ms::style($w,hull)

                            #####################
                            ##                 ##
                            ##     LISTBOX     ##
                            ##                 ##
                            #####################

                            # Note: Tk listboxes don't understands styles, at least not natively.
                            #       No internal styles needs to be created.

                            # Apply the changes.
                            $w.listbox configure {*}$listbox_options

                            # Check if there are any items associated to the listbox.
                            switch -- $::ms::current($w,values) {
                                ""      {}
                                default {
                                    # Recolor any index with the new default colors (background and foreground).
                                    set index 0
                                    while { $index < [$w.listbox size] } {
                                        $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                                        -foreground $::ms::current($w,foreground);

                                        incr index
                                    }

                                    # Check if a new set of values was provided.
                                    switch -- $new_values {
                                        false {
                                            # Recolor any previously selected indexes with the new selected colors (selectedbackground and selectedforeground).
                                            set selected_indexes [$w.listbox curselection]
                                            foreach index $selected_indexes {
                                                $w.listbox selection set $index
                                            }

                                            # Check if there is a preselected index.
                                            switch -- $::ms::data($w,preselected_index) {
                                                ""      {}
                                                default {
                                                    # If the preselected index is not also a selected index, recolor it with the new preselected colors
                                                    # (preselectedbackground and preselectedforeground).
                                                    if { $::ms::data($w,preselected_index) ni $selected_indexes } {
                                                        $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                                                                   -foreground $::ms::current($w,preselectforeground);

                                                        # Remove the active style.
                                                        $w.listbox configure -activestyle none
                                                    } else {
                                                        # Be sure that the active style is the one chosen by the developer.
                                                        $w.listbox configure -activestyle $::ms::current($w,activestyle)

                                                        # Activate the preselected index.
                                                        $w.listbox activate $::ms::data($w,preselected_index)
                                                    }
                                                }
                                            }
                                        }
                                        true {
                                            # Select the first index of the listbox.
                                            $w.listbox selection clear 0 end
                                            $w.listbox selection set 0

                                            # Set the selection anchor to the first index.
                                            $w.listbox selection anchor 0

                                            # Activate the selected index.
                                            $w.listbox activate 0

                                            # Adjust the listbox viewport.
                                            $w.listbox see 0
                                        }
                                    }
                                }
                            }

                            ########################
                            ##                    ##
                            ##     SCROLLBARS     ##
                            ##                    ##
                            ########################

                            # Update the scrollbars.
                            ::ms::listbox::Scrollbar_Update $w

                            ##################################################
                            ##                                              ##
                            ##     IF NEEDED, UPDATE THE WIDGET'S STATE     ##
                            ##                                              ##
                            ##################################################

                            # Note: There is no need to update the listbox object, it's a classic widget and
                            #       it was already been taking care of.

                            switch -- $::ms::current($w,state) {
                                disabled { interp invokehidden {} $w state [list disabled]  }
                                normal   { interp invokehidden {} $w state [list !disabled] }
                            }

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
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
        itemconfigure {
            # Synopsis:
            #
            # *window* **itemconfigure** *index* ?*option*? ?*value*? ?*option value* ... *option value*?
            set index  [lindex  $args 0]
            set args   [lremove $args 0]

            switch -- [llength $args] {
                0   -
                1   {
                    try {
                        $w.listbox itemconfigure $index {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default {
                    # Check that the remaining 'args' forms a valid 'option/value' list.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Remove any duplicated options (retain only the last ones).
                            set args [lsort -increasing -stride 2 -index 0 -unique $args]

                            ######################################################
                            ##                                                  ##
                            ##     CHECK THE ITEMCONFIGURE OPTIONS PROVIDED     ##
                            ##                                                  ##
                            ######################################################

                            # Check the remaining widget's options, if any.
                            set new_args [list ]
                            foreach { option value } $args {
                                switch -nocase -- $option {
                                    -background       -
                                    -foreground       -
                                    -selectbackground -
                                    -selectforeground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                            default { lappend new_args $option $value }
                                        }
                                    }
                                    default { ::ms::Error "Invalid itemconfigure option, '$option'." $caller_info }
                                }
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }

                    # Execute the command.
                    try {
                        $w.listbox itemconfigure $index {*}$new_args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return ""
                    }
                }
            }
        }
        selection {
            # Synopsis:
            #
            # *window* **selection** *option* *arg*
            #    *window* **selection** **anchor** *index*
            #    *window* **selection** **clear** *first* ?*last*?
            #    *window* **selection** **includes** *index*
            #    *window* **selection** **set** *first* ?*last*?

            # Check if there are items associated to the listbox.
            switch -- $::ms::current($w,values) {
                ""  { return "" }
            }

            try {
                $w.listbox selection {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                set subcommand [lindex  $args 0]
                set args       [lremove $args 0]

                switch -- $subcommand {
                    set {
                        # Set the new preselected index.
                        switch -- [llength $args] {
                            1   { set ::ms::data($w,preselected_index) [lindex $args 0] }
                            2   { set ::ms::data($w,preselected_index) [lindex $args 1] }
                        }
                    }
                    clear {
                        # Deselect the preselection of the indexes provided.
                        switch -- [llength $args] {
                            1   {
                                $w.listbox itemconfigure [lindex $args 0] -background $::ms::current($w,background) \
                                                                          -foreground $::ms::current($w,foreground);
                            }
                            2   {
                                set index [lindex $args 0]
                                while { $index < [expr { [lindex $args 1]+1 }] } {
                                    $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                                    -foreground $::ms::current($w,foreground);

                                    incr index
                                }
                            }
                        }
                    }
                }

                return $result
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

                    # Note: 'background', 'borderwidth', 'columns', 'cursor', 'disabledforeground', 'font', 'foreground',
                    #       'justify', 'preselectbackground', 'preselectforeground', 'relief', 'rows', 'selectbackground'
                    #       and 'selectforeground' are not allowed to change if the statespec changes.

                    # Note: Listboxes don't understands styles natively.

                    # bordercolor
                    switch -- $::ms::managed_by($w,bordercolor) {
                        developer { set bordercolor $::ms::current($w,bordercolor) }
                        Tk        { set bordercolor [_ttk_style lookup $::ms::current($w,style) -bordercolor $::ms::data($w,statespec) $::ms::default($w,bordercolor)] }
                    }

                    # Note: The '-bordercolor' option is not understanded by Tk listboxes, but is made available trough
                    #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
                    #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
                    #       like it behaves in other widgets that understands the bordercolor.

                    # Check the 'relief' type.
                    switch -- $::ms::current($w,relief) {
                        flat  -
                        solid {
                            set listbox_options [list -highlightbackground $bordercolor \
                                                           -highlightcolor $bordercolor];
                        }
                        default {
                            set listbox_options [list -highlightbackground $::ms::current($w,background) \
                                                           -highlightcolor $::ms::current($w,background)];
                        }
                    }

                    # Check the widget state and propagate the new statespec to the widget's hull and border objects..
                    interp invokehidden {} $w state $::ms::data($w,statespec)

                    # Configure the listbox object.
                    $w.listbox configure {*}$listbox_options

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
        xview {
            # Synopsis:
            #
            # *window* **xview**
            # *window* **xview** *index*
            # *window* **xview** **moveto** *fraction*
            # *window* **xview** **scroll** *number* *what*

            # Check if the widget has an active horizontal scrollbar.
            switch -- $::ms::data($w,scrollx) {
                on  {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    switch -nocase -- $subcommand {
                        ""     { return [$w.listbox xview] }
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

                            # Move the content object horizontally.
                            $w.listbox xview moveto $fraction

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
                                    set what   "pages"
                                    set number [expr { int($number) }]
                                }
                                pixels { set what "pixels" }
                                units {
                                    set what   "units"
                                    set number [expr { int($number) }]
                                }
                                default { return "" }
                            }

                            # Move the content object horizontally.
                            $w.listbox xview scroll $number $what

                            return ""
                        }
                        default {
                            set index $subcommand

                            # Move the content object horizontally.
                            try {
                                $w.listbox xview $index
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return ""
                            }
                        }
                    }
                }
            }
        }
        yview {
            # Synopsis:
            #
            # *window* **yview**
            # *window* **yview** *index*
            # *window* **yview** **moveto** *fraction*
            # *window* **yview** **scroll** *number* *what*

            # Check if the widget has an active vertical scrollbar.
            switch -- $::ms::data($w,scrolly) {
                on  {
                    set subcommand [lindex  $args 0]
                    set args       [lremove $args 0]

                    switch -nocase -- $subcommand {
                        ""     { return [$w.listbox yview] }
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

                            # Move the content object vertically.
                            $w.listbox yview moveto $fraction

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
                                    set what   "pages"
                                    set number [expr { int($number) }]
                                }
                                pixels { set what "pixels" }
                                units {
                                    set what   "units"
                                    set number [expr { int($number) }]
                                }
                                default { return "" }
                            }

                            # Move the content object vertically.
                            $w.listbox yview scroll $number $what

                            return ""
                        }
                        default {
                            set index $subcommand

                            # Move the content object vertically.
                            try {
                                $w.listbox yview $index
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                return ""
                            }
                        }
                    }
                }
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
# Update any listbox widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::listbox::Style_Update { stylename caller_info } {
    # Update all the listbox widgets that have stylename as a style.
    foreach w $::ms::style($stylename,listbox,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::listbox(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Listbox,$option)

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
            normal   { set cursor $::ms::current($w,cursor) }
        }

         #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'background', 'borderwidth', 'columns', 'cursor', 'disabledforeground', 'font', 'foreground',
        #       'justify', 'preselectbackground', 'preselectforeground', 'relief', 'rows', 'selectbackground'
        #       and 'selectforeground' are not allowed to change if the statespec changes.

        # bordercolor
        switch -- $::ms::managed_by($w,bordercolor) {
            developer { set bordercolor $::ms::current($w,bordercolor) }
            Tk        { set bordercolor [_ttk_style lookup $stylename -bordercolor $statespec $::ms::default($w,bordercolor)] }
        }

        # Set the listbox options.
        set listbox_options [list            -background $::ms::current($w,background) \
                                                 -cursor $cursor \
                                     -disabledforeground $::ms::current($w,disabledforeground) \
                                                   -font $::ms::current($w,font) \
                                             -foreground $::ms::current($w,foreground) \
                                                 -height $::ms::current($w,rows) \
                                                -justify $::ms::current($w,justify) \
                                       -selectbackground $::ms::current($w,selectbackground) \
                                      -selectborderwidth $::ms::current($w,selectborderwidth) \
                                       -selectforeground $::ms::current($w,selectforeground) \
                                                  -width $::ms::current($w,columns)];

        # Note: The '-bordercolor' option is not understanded by Tk listboxes, but is made available trough
        #       a carefull use of the '-borderwidth', '-highlightbackground', '-highlightcolor',
        #       '-highlightthickness' and '-relief' options in a way that make the bordercolor option behave
        #       like it behaves in other widgets that understands the bordercolor.

        # Check the 'relief' type.
        switch -- $::ms::current($w,relief) {
            flat  -
            solid {
                lappend listbox_options         -borderwidth 0 \
                                        -highlightbackground $bordercolor \
                                             -highlightcolor $bordercolor \
                                         -highlightthickness $::ms::current($w,borderwidth) \
                                                     -relief flat;
            }
            default {
                lappend listbox_options         -borderwidth $::ms::current($w,borderwidth) \
                                        -highlightbackground $::ms::current($w,background) \
                                             -highlightcolor $::ms::current($w,background) \
                                         -highlightthickness 0 \
                                                     -relief $::ms::current($w,relief);
            }
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

        # Apply the changes.
        interp invokehidden {} $w configure -style $::ms::style($w,hull)

        #####################
        ##                 ##
        ##     LISTBOX     ##
        ##                 ##
        #####################

        # Note: Tk listboxes don't understands styles, at least not natively.
        #       No internal styles needs to be created.

        # Apply the changes.
        $w.listbox configure {*}$listbox_options

        # Check if there are any items associated to the listbox.
        switch -- $::ms::current($w,values) {
            ""      {}
            default {
                # Recolor any index with the new default colors (background and foreground).
                set index 0
                while { $index < [$w.listbox size] } {
                    $w.listbox itemconfigure $index -background $::ms::current($w,background) \
                                                    -foreground $::ms::current($w,foreground);

                    incr index
                }

                # Recolor any previously selected indexes with the new selected colors (selectedbackground and selectedforeground).
                set selected_indexes [$w.listbox curselection]
                foreach index $selected_indexes {
                    $w.listbox selection set $index
                }

                # Check if there is a preselected index.
                switch -- $::ms::data($w,preselected_index) {
                    ""      {}
                    default {
                        # If the preselected index is not also a selected row, recolor it with the new preselected colors
                        # (preselectedbackground and preselectedforeground).
                        if { $::ms::data($w,preselected_index) ni $selected_indexes } {
                            $w.listbox itemconfigure $::ms::data($w,preselected_index) -background $::ms::current($w,preselectbackground) \
                                                                                       -foreground $::ms::current($w,preselectforeground);

                            # Remove the active style.
                            $w.listbox configure -activestyle none
                        } else {
                            # Be sure that the active style is the one chosen by the developer.
                            $w.listbox configure -activestyle $::ms::current($w,activestyle)

                            # Activate the preselected index.
                            $w.listbox activate $::ms::data($w,preselected_index)
                        }
                    }
                }
            }
        }

        ########################
        ##                    ##
        ##     SCROLLBARS     ##
        ##                    ##
        ########################

        # Update the scrollbars.
        ::ms::listbox::Scrollbar_Update $w
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*