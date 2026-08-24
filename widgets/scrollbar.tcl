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
package provide ::ms::scrollbar 0.1

#################################
##                             ##
##     _SCROLLBAR BINDINGS     ##
##                             ##
#################################

# ButtonPress-1 (Scroll/Jump/Drag)
bind _Scrollbar <Button-1>        { ::ms::scrollbar::ButtonPress1 %W %x %y; break }
bind _Scrollbar <ButtonRelease-1> { ::ms::scrollbar::ButtonRelease1; break }
bind _Scrollbar <B1-Motion>       { ::ms::scrollbar::Drag %W %x %y; break }

# ButtonPress-2 (Jump only)
bind _Scrollbar <Button-2>        { ::ms::scrollbar::ButtonPress2 %W %x %y; break }
bind _Scrollbar <ButtonRelease-2> { break }
bind _Scrollbar <B2-Motion>       { break }

# ButtonPress-3 (Jump only)
bind _Scrollbar <Button-3>        { ::ms::scrollbar::ButtonPress2 %W %x %y; break }
bind _Scrollbar <ButtonRelease-3> { break }
bind _Scrollbar <B3-Motion>       { break }

# Destroy
_bind _Scrollbar <Destroy> { ::ms::scrollbar::Destroy %W; break }

# Enter/Leave
_bind _Scrollbar <Enter> { ::ms::frame::Pathname_Cmd %W state  hover; break }
_bind _Scrollbar <Leave> { ::ms::frame::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Scrollbar <FocusIn>  { ::ms::frame::Pathname_Cmd %W state  focus; break }
_bind _Scrollbar <FocusOut> { ::ms::frame::Pathname_Cmd %W state !focus; break }

# Mousewheel and Touchpad

# Move the widget's content address by one unit up or down (depending on the mousewheel direction).
_bind _Scrollbar <MouseWheel> { ::ms::scrollbar::Scroll %W %D units; break }

# Move the widget's content address by one unit left or right (depending on the mousewheel direction).
_bind _Scrollbar <Shift-MouseWheel> { ::ms::scrollbar::Scroll %W %D units; break }

# Move the widget's content address by one page up or down (depending on the mousewheel direction).
_bind _Scrollbar <Control-MouseWheel> { ::ms::scrollbar::Scroll %W %D pages; break }

# Move the widget's content address by one page left or right (depending on the mousewheel direction).
_bind _Scrollbar <Control-Shift-MouseWheel> { ::ms::scrollbar::Scroll %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

_bind _Scrollbar <TouchpadScroll>         { ::ms::scrollbar::Touchpad %W %# %D units; break }
_bind _Scrollbar <Control-TouchpadScroll> { ::ms::scrollbar::Touchpad %W %# %D pages; break }

# Create the mustang **scrollbar** package.
namespace eval ::ms::scrollbar {
    # Set the 'non-styleable' scrollbar option list.
    set ::ms::scrollbar(non_styleable,options) [list class \
                                                     command \
                                                     orient \
                                                     state \
                                                     style \
                                                     takefocus];

    # Set the 'styleable' scrollbar option list.
    set ::ms::scrollbar(styleable,options) [list arrowcolor \
                                                 arrowsize \
                                                 background \
                                                 bordercolor \
                                                 borderwidth \
                                                 cursor \
                                                 darkcolor \
                                                 foreground \
                                                 gripcount \
                                                 lightcolor \
                                                 relief \
                                                 troughcolor];

    # Set the default 'non-styleable' scrollbar options values.
    set ::ms::default(scrollbar,class)     TScrollbar
    set ::ms::default(scrollbar,command)   {}
    set ::ms::default(scrollbar,orient)    vertical
    set ::ms::default(scrollbar,state)     normal
    set ::ms::default(scrollbar,style)     TScrollbar
    set ::ms::default(scrollbar,takefocus) 0

    # Note: The default 'styleable' scrollbar options values are always defined inside the current theme.
}

# Rename the original Tk **scrollbar** and **ttk::scrollbar** commands.
rename scrollbar      _scrollbar
rename ttk::scrollbar _ttk_scrollbar

# Create an alias for the mustang **scrollbar** and **::ttk::scrollbar** commands.
interp alias {} scrollbar      {} ::ms::scrollbar::Command
interp alias {} ttk::scrollbar {} ::ms::scrollbar::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **::ttk::scrollbar** command.
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
proc ::ms::scrollbar::Command { window { args "" } } {
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
            set ::ms::default($w,class)     $::ms::default(scrollbar,class)
            set ::ms::default($w,command)   $::ms::default(scrollbar,command)
            set ::ms::default($w,orient)    $::ms::default(scrollbar,orient)
            set ::ms::default($w,state)     $::ms::default(scrollbar,state)
            set ::ms::default($w,style)     $::ms::default(scrollbar,style)
            set ::ms::default($w,takefocus) $::ms::default(scrollbar,takefocus)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)     $::ms::default(scrollbar,class)
            set ::ms::current($w,command)   $::ms::default(scrollbar,command)
            set ::ms::current($w,orient)    $::ms::default(scrollbar,orient)
            set ::ms::current($w,state)     $::ms::default(scrollbar,state)
            set ::ms::current($w,style)     $::ms::default(scrollbar,style)
            set ::ms::current($w,takefocus) $::ms::default(scrollbar,takefocus)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) scrollbar

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
            #       To make a scrollbar styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **scrollbar** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,arrowcolor)  Tk
            set ::ms::managed_by($w,arrowsize)   Tk
            set ::ms::managed_by($w,background)  Tk
            set ::ms::managed_by($w,bordercolor) Tk
            set ::ms::managed_by($w,borderwidth) Tk
            set ::ms::managed_by($w,cursor)      Tk
            set ::ms::managed_by($w,darkcolor)   Tk
            set ::ms::managed_by($w,foreground)  Tk
            set ::ms::managed_by($w,gripcount)   Tk
            set ::ms::managed_by($w,lightcolor)  Tk
            set ::ms::managed_by($w,relief)      Tk
            set ::ms::managed_by($w,troughcolor) Tk

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
                    -borderwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,borderwidth)    $value
                        set ::ms::managed_by($w,borderwidth) developer
                    }
                    -class { set ::ms::current($w,class) $value }
                    -cmd     -
                    -command {
                        # Check if 'value' is the empty string.
                        switch -- [string trim $value] {
                            ""      {}
                            default {
                                set value [string tolower $value]
                                switch -- [llength $value] {
                                    2   {
                                        # Check the first argument of 'value' (the address of the widget in which the scrollbar will act upon).
                                        set address [lindex $value 0]
                                        set result  [::ms::Check_Pathname $address invalid]
                                        switch -- $result {
                                            invalid { continue }
                                        }

                                        # Check the second argument of 'value' (the command, 'xview' or 'yview').
                                        set cmd [string tolower [lindex $value 1]]
                                        switch -- $cmd {
                                            xview   -
                                            yview   { set ::ms::current($w,command) [list $address $cmd] }
                                        }
                                    }
                                }
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
                    -foreground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,foreground)    $value
                        set ::ms::managed_by($w,foreground) developer
                    }
                    -gripcount {
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,gripcount)    $value
                                set ::ms::managed_by($w,gripcount) developer
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
                    -orient {
                        set value [string tolower $value]
                        switch -- $value {
                            horizontal -
                            vertical   { set ::ms::current($w,orient) $value }
                        }
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
                    -state {}
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
                    -troughcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,troughcolor)    $value
                        set ::ms::managed_by($w,troughcolor) developer
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::scrollbar(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TScrollbar,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            # Check the '-command' option provided.
            switch -- $::ms::current($w,command) {
                ""      {}
                default {
                    # Check that the command provided is in sync with the widget orientation.
                    switch -- $::ms::current($w,orient) {
                        horizontal {
                            switch -- [lindex $::ms::current($w,command) 1] {
                                yview { set ::ms::current($w,command) "" }
                            }
                        }
                        vertrical {
                            switch -- [lindex $::ms::current($w,command) 1] {
                                xview { set ::ms::current($w,command) "" }
                            }
                        }
                    }
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
                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TScrollbar]]
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: 'arrowsize', 'borderwidth', 'cursor', 'gripcount', 'relief' and 'troughcolor' are not allowed to change
            #       if the statespec changes.

            #######################
            ##                   ##
            ##     SCROLLBAR     ##
            ##                   ##
            #######################

            # Set the widget style name.
            set ::ms::style($w,widget) [string cat "_ac=" $::ms::current($w,arrowcolor) \
                                                   "_as=" $::ms::current($w,arrowsize) \
                                                   "_bg=" $::ms::current($w,background) \
                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                   "_bw=" $::ms::current($w,borderwidth) \
                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                   "_fg=" $::ms::current($w,foreground) \
                                                   "_gc=" $::ms::current($w,gripcount) \
                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                   "_rl=" $::ms::current($w,relief) \
                                                   "_tc=" $::ms::current($w,troughcolor) \
                                                   "." $parent_style];

            # If needed, create the widget style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)  -arrowcolor $::ms::current($w,arrowcolor) \
                                                               -arrowsize $::ms::current($w,arrowsize) \
                                                              -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                             -borderwidth $::ms::current($w,borderwidth) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                              -foreground $::ms::current($w,foreground) \
                                                               -gripcount $::ms::current($w,gripcount) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                                  -relief $::ms::current($w,relief) \
                                                             -troughcolor $::ms::current($w,troughcolor);

                # Add the widget style name to the theme styles list created by mustang.
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

            # If needed, create the widget mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,widget) {*}$mapping

                # Add the widget mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the widget.
            _ttk_scrollbar $w     -class $::ms::current($w,class) \
                                -command $::ms::current($w,command) \
                                 -cursor $::ms::current($w,cursor) \
                                 -orient $::ms::current($w,orient) \
                                  -style $::ms::style($w,widget) \
                              -takefocus $::ms::current($w,takefocus);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                Scrollbar { _bindtags $w [list $w _Scrollbar TScrollbar $::ms::addr($w,toplevel) all] }
                default   { _bindtags $w [list $w $::ms::current($w,class) _Scrollbar TScrollbar $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the scrollbar real address pathcommand.
            interp hide {} $w

            # Create an alias for the scrollbar real pathcommand.
            lappend ::ms::token($w) [interp alias {} $w {} ::ms::scrollbar::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::scrollbar::Pathname_Cmd $w]
            }

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w

            # Set the structure address.
            set ::ms::addr($w,structure) [list $w]

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short address relative to its real address, 'w'.
            set ::ms::addr($w,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals)  $w
            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the scrollbar widgets real address list.
            lappend ::ms::addr(scrollbar) $w

            # Add the widget address to the scrollbar classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),scrollbar,addrs) $w

            # Add the widget address to the scrollbar classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),scrollbar,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the scrollbar classtype.
            if { $::ms::current($w,style) ni $::ms::style(scrollbar,classtype) } {
                lappend ::ms::style(scrollbar,classtype) $::ms::current($w,style)
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
proc ::ms::scrollbar::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        activate {
            # Synopsis:
            #
            # *window* **activate** ?*element*?

            # Note: This command does nothing.
            #       It's here only to avoid an error in case a classic scrollbar was created.

            switch -- [llength $args] {
                0       -
                1       { return "" }
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
                    if { ($option in $::ms::scrollbar(non_styleable,options)) || ($option in $::ms::scrollbar(styleable,options)) } {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
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
                    foreach option $::ms::scrollbar(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::scrollbar(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::scrollbar(non_styleable,options)) || ($option in $::ms::scrollbar(styleable,options)) } {
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
                                    -borderwidth {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,borderwidth)    $value
                                        set ::ms::managed_by($w,borderwidth) developer
                                    }
                                    -class {}
                                    -cmd     -
                                    -command {
                                        # Check if 'value' is the empty string.
                                        switch -- [string trim $value] {
                                            ""      {}
                                            default {
                                                set value [string tolower $value]
                                                switch -- [llength $value] {
                                                    2   {
                                                        # Check the first argument of 'value' (the address of the widget in which the scrollbar will act upon).
                                                        set address [lindex $value 0]
                                                        set result  [::ms::Check_Pathname $address invalid]
                                                        switch -- $result {
                                                            invalid { continue }
                                                        }

                                                        # Check that the second argument of 'value' (the command, 'xview' or 'yview') is in sync with the widget orientation.
                                                        set cmd [string tolower [lindex $value 1]]
                                                        switch -- $::ms::current($w,orient) {
                                                            horizontal {
                                                                switch -- $cmd {
                                                                    xview { set ::ms::current($w,command) [list $address $cmd] }

                                                                }
                                                            }
                                                            vertrical {
                                                                switch -- $cmd {
                                                                    yview { set ::ms::current($w,command) [list $address $cmd] }

                                                                }
                                                            }
                                                        }
                                                    }
                                                }
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
                                    -foreground {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,foreground)    $value
                                        set ::ms::managed_by($w,foreground) developer
                                    }
                                    -gripcount {
                                        switch -- [string is integer -strict $value] {
                                            1   {
                                                set ::ms::current($w,gripcount)    $value
                                                set ::ms::managed_by($w,gripcount) developer
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
                                    -orient {}
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
                                    -state {}
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Remove the widget address from the scrollbar classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),scrollbar,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),scrollbar,addrs) [lremove $::ms::style($::ms::current($w,style),scrollbar,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,scrollbar,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the scrollbar classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),scrollbar,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(scrollbar,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(scrollbar,classtype) [lremove $::ms::style(scrollbar,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the scrollbar classtype.
                                            if { $value ni $::ms::style(scrollbar,classtype) } {
                                                lappend ::ms::style(scrollbar,classtype) $value
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
                                    -troughcolor {
                                        set value [::ms::Check_Color $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::current($w,troughcolor)    $value
                                        set ::ms::managed_by($w,troughcolor) developer
                                    }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::scrollbar(styleable,options) {
                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
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
                                _ttk_style layout $parent_style [_ttk_style layout [string cat $orient "." TScrollbar]]
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            # Note: 'arrowsize', 'borderwidth', 'cursor', 'gripcount', 'relief' and 'troughcolor' are not allowed to change
                            #       if the statespec changes.

                            #######################
                            ##                   ##
                            ##     SCROLLBAR     ##
                            ##                   ##
                            #######################

                            # Set the widget style name.
                            set ::ms::style($w,widget) [string cat "_ac=" $::ms::current($w,arrowcolor) \
                                                                   "_as=" $::ms::current($w,arrowsize) \
                                                                   "_bg=" $::ms::current($w,background) \
                                                                   "_bc=" $::ms::current($w,bordercolor) \
                                                                   "_bw=" $::ms::current($w,borderwidth) \
                                                                   "_dc=" $::ms::current($w,darkcolor) \
                                                                   "_fg=" $::ms::current($w,foreground) \
                                                                   "_gc=" $::ms::current($w,gripcount) \
                                                                   "_lc=" $::ms::current($w,lightcolor) \
                                                                   "_rl=" $::ms::current($w,relief) \
                                                                   "_tc=" $::ms::current($w,troughcolor) \
                                                                   "." $parent_style];

                            # If needed, create the widget style name.
                            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                                _ttk_style configure $::ms::style($w,widget)  -arrowcolor $::ms::current($w,arrowcolor) \
                                                                               -arrowsize $::ms::current($w,arrowsize) \
                                                                              -background $::ms::current($w,background) \
                                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                                             -borderwidth $::ms::current($w,borderwidth) \
                                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                                              -foreground $::ms::current($w,foreground) \
                                                                               -gripcount $::ms::current($w,gripcount) \
                                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                                                  -relief $::ms::current($w,relief) \
                                                                             -troughcolor $::ms::current($w,troughcolor);

                                # Add the widget style name to the theme styles list created by mustang.
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

                            # If needed, create the widget mapping.
                            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                                _ttk_style map $::ms::style($w,widget) {*}$mapping

                                # Add the widget mapping to the stylemap list containing all the mappings
                                # created by mustang for the current theme.
                                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure   -command $::ms::current($w,command) \
                                                                   -cursor $::ms::current($w,cursor) \
                                                                    -style $::ms::style($w,widget) \
                                                                -takefocus $::ms::current($w,takefocus);

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        delta    -
        fraction {
            # Synopsis:
            #
            # *window* **delta** *deltaX* *deltaY*
            # *window* **fraction** *x* *y*
            switch -- [llength $args] {
                2   {
                    # Execute the command.
                    try {
                        interp invokehidden {} $w $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        get {
            # Synopsis:
            #
            # *window* **get**
            switch -- [llength $args] {
                0       { return [interp invokehidden {} $w get] }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        identify {
            # Synopsis:
            #
            # *window* **identify** *x* *y*
            # *window* **identify** **element** *x* *y*
            switch -- [llength $args] {
                2   {
                    set x [lindex $args 0]
                    set y [lindex $args 1]

                    # Check that the coordinates provided are valid.
                    switch -- [string is integer -strict $x] {
                        0   { ::ms::Error "Invalid coordinate, '$x'." $caller_info }
                    }

                    switch -- [string is integer -strict $y] {
                        0   { ::ms::Error "Invalid coordinate, '$y'." $caller_info }
                    }
                }
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
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w identify element $x $y
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                switch -glob -- $result {
                    *downarrow  { return "Scrollbar.downarrow" }
                    *leftarrow  { return "Scrollbar.leftarrow" }
                    *rightarrow { return "Scrollbar.rightarrow" }
                    *uparrow    { return "Scrollbar.uparrow" }
                    *grip       { return "Scrollbar.grip" }
                    *thumb      { return "Scrollbar.thumb" }
                    *trough     { return "Scrollbar.trough" }
                    default     { return ""}
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

                    # Execute the command.
                    return [interp invokehidden {} $w instate $statespec]
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
                        ::ms::Error "Invalid script." $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        moveto {
            # Synopsis:
            #
            # *window* **moveto** *fraction*
            switch -- [llength $args] {
                1   {
                    # Check the argument provided (fraction).
                    set fraction $args
                    if { ($fraction < 0) || ($fraction > 1.0) } {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }

                    # Check the command associated with the widget.
                    switch -- $::ms::current($w,command) {
                        ""      { return "" }
                        default {
                            # Execute the command.
                            try {
                                {*}$::ms::current($w,command) moveto $fraction
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok {} {
                                return ""
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        set {
            # Synopsis:
            #
            # *window* **set** *first* *last*
            switch -- [llength $args] {
                2   {
                    # Execute the command.
                    try {
                        interp invokehidden {} $w $cmd {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        scroll {
            # Synopsis:
            #
            # *window* **scroll** *number* *what*
            switch -- [llength $args] {
                2   {
                    set number [lindex $args 0]
                    set what   [lindex $args 1]

                    # Check 'number'.
                    switch -- [string is integer -strict $number] {
                        0   { ::ms::Error "Invalid option, '$args'." $caller_info }
                    }

                    # Check 'what'.
                    switch -- $what {
                        units   -
                        pages   {}
                        default { ::ms::Error "Invalid option, '$args'." $caller_info }
                    }

                    # Check the command associated with the widget.
                    switch -- $::ms::current($w,command) {
                        ""      { return "" }
                        default {
                            # Execute the command.
                            try {
                                {*}$::ms::current($w,command) scroll $number $what
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok {} {
                                return ""
                            }
                        }
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
# Update any scrollbar widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::scrollbar::Style_Update { stylename caller_info } {
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

        # If the parent style layout is not known by mustang, set it as the current theme layout '$orient.TScrollbar'.
        if { $parent_style($orient) ni $::ms::layouts($::ms::theme) } {
            _ttk_style layout $parent_style($orient) [_ttk_style layout [string cat $dir "." TScrollbar]]
        }
    }

    # Update all the scrollbar widgets that have stylename as a style.
    foreach w $::ms::style($stylename,scrollbar,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::scrollbar(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TScrollbar,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$stylename,$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$stylename,$option) }
                    }
                }
            }
        }

        #####################################
        ##                                 ##
        ##     UPDATE THE WIDGET STYLE     ##
        ##                                 ##
        #####################################

        # Note: 'arrowsize', 'borderwidth', 'cursor', 'gripcount', 'relief' and 'troughcolor' are not allowed to change
        #       if the statespec changes.

        #######################
        ##                   ##
        ##     SCROLLBAR     ##
        ##                   ##
        #######################

        # Set the widget style name.
        set ::ms::style($w,widget) [string cat "_ac=" $::ms::current($w,arrowcolor) \
                                               "_as=" $::ms::current($w,arrowsize) \
                                               "_bg=" $::ms::current($w,background) \
                                               "_bc=" $::ms::current($w,bordercolor) \
                                               "_bw=" $::ms::current($w,borderwidth) \
                                               "_dc=" $::ms::current($w,darkcolor) \
                                               "_fg=" $::ms::current($w,foreground) \
                                               "_gc=" $::ms::current($w,gripcount) \
                                               "_lc=" $::ms::current($w,lightcolor) \
                                               "_rl=" $::ms::current($w,relief) \
                                               "_tc=" $::ms::current($w,troughcolor) \
                                               "." $parent_style];

        # If needed, create the widget style name.
        if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
            _ttk_style configure $::ms::style($w,widget)  -arrowcolor $::ms::current($w,arrowcolor) \
                                                           -arrowsize $::ms::current($w,arrowsize) \
                                                          -background $::ms::current($w,background) \
                                                         -bordercolor $::ms::current($w,bordercolor) \
                                                         -borderwidth $::ms::current($w,borderwidth) \
                                                           -darkcolor $::ms::current($w,darkcolor) \
                                                          -foreground $::ms::current($w,foreground) \
                                                           -gripcount $::ms::current($w,gripcount) \
                                                          -lightcolor $::ms::current($w,lightcolor) \
                                                              -relief $::ms::current($w,relief) \
                                                         -troughcolor $::ms::current($w,troughcolor);

            # Add the widget style name to the theme styles list created by mustang.
            lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
        }

        # Initialize the widget mapping.
        set mapping [list ]

        # arrowcolor
        switch -- $::ms::managed_by($w,arrowcolor) {
            developer { lappend mapping -arrowcolor [list pressed $::ms::current($w,arrowcolor)] }
            Tk  {
                # Check if a 'arrowcolor' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,arrowcolor)] {
                    1   { lappend mapping -arrowcolor $::ms::stylemap($::ms::theme,$stylename,arrowcolor) }
                }
            }
        }

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

        # foreground
        switch -- $::ms::managed_by($w,foreground) {
            developer { lappend mapping -foreground [list pressed $::ms::current($w,foreground)] }
            Tk  {
                # Check if a 'foreground' mapping exists for 'stylename'.
                switch -- [info exists ::ms::stylemap($::ms::theme,$stylename,foreground)] {
                    1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$stylename,foreground) }
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

        # If needed, create the widget mapping.
        if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
            _ttk_style map $::ms::style($w,widget) {*}$mapping

            # Add the widget mapping to the stylemap list containing all the mappings
            # created by mustang for the current theme.
            lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
        }

        # Apply the changes.
        interp invokehidden {} $w configure -cursor $::ms::current($w,cursor) \
                                             -style $::ms::style($w,widget);
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

## ButtonPress1
#
# Manage the **ButtonPress-1** event on the widget ('scroll', 'jump' or 'drag').
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer coordinates of the event.
#        These values should be provided by the **ButtonPress-1** event.
#
# It doesn't return anything.
proc ::ms::scrollbar::ButtonPress1 { w x y }  {
    set ::ms::temp(xpress) $x
    set ::ms::temp(ypress) $y

    set views [interp invokehidden {} $w get]
    set view1 [lindex $views 0]
    set view2 [lindex $views 1]

    switch -nocase -glob -- [interp invokehidden {} $w identify $x $y] {
        "*uparrow"   -
        "*leftarrow" {
            # Scroll the thumb by one page towards the top or towards the left (depending on the widget orientation).
            ::ms::scrollbar::Pathname_Cmd $w scroll -1 pages

            set ::ms::temp(drag_allowed) no
        }
        "*downarrow"  -
        "*rightarrow" {
            # Scroll the thumb by one page towards the bottom or towards the right  (depending on the widget orientation).
            ::ms::scrollbar::Pathname_Cmd $w scroll 1 pages

            set ::ms::temp(drag_allowed) no
        }
        "*grip"  -
        "*thumb" {
            set ::ms::temp(drag_allowed) yes

            # Compute the fraction for the center of the thumb.
            set ::ms::temp(fraction) [expr { ($view2+$view1)*0.5 }]
        }
        "*trough" {
            # Get the fraction for the center of the thumb.
            set ::ms::temp(fraction) [interp invokehidden {} $w fraction $x $y]

            # Check the clickaction variable.
            switch -nocase -- $::ms::clickaction {
                jump {
                    # Jump to the location on the scrollbar that was clicked.
                    ::ms::scrollbar::Pathname_Cmd $w moveto $::ms::temp(fraction)

                    set ::ms::temp(drag_allowed) no
                }
                scroll {
                    if { $::ms::temp(fraction) < $view1 } {
                        # The User has click on the left or top trough  (depending on the widget orientation).

                        # Scroll the thumb by one page towards the left or towards the top (depending on the widget orientation).
                        ::ms::scrollbar::Pathname_Cmd $w scroll -1 pages

                        set ::ms::temp(drag_allowed) yes
                    } elseif { $::ms::temp(fraction) > $view2 } {
                        # The User has click on the right or bottom trough (depending on the widget orientation).

                        # Scroll the thumb by one page towards the right or towards the bottom (depending on the widget orientation).
                        ::ms::scrollbar::Pathname_Cmd $w scroll 1 pages

                        set ::ms::temp(drag_allowed) yes
                    } else {
                        # The User has click on the thumb (???).

                        set ::ms::temp(drag_allowed) no
                    }
                }
            }
        }
    }

    return ""
}

## ButtonPress2
#
# Manage the **ButtonPress-2/3** event on the widget ('jump').
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer coordinates of the event.
#        These values should be provided by the **ButtonPress-2/3** event.
#
# It doesn't return anything.
proc ::ms::scrollbar::ButtonPress2 { w x y }  {
    set views [interp invokehidden {} $w get]
    set view1 [lindex $views 0]
    set view2 [lindex $views 1]

    switch -nocase -glob -- [interp invokehidden {} $w identify $x $y] {
        "*trough" {
            # Get the fraction for the center of the thumb.
            set ::ms::temp(fraction) [interp invokehidden {} $w fraction $x $y]

            # Jump to the location on the scrollbar that was clicked.
            ::ms::scrollbar::Pathname_Cmd $w moveto $::ms::temp(fraction)

            set ::ms::temp(drag_allowed) no
        }
    }

    return ""
}

## ButtonRelease1
#
# Manage the **ButtonRelease** event on the widget.
#
# It doesn't return anything.
proc ::ms::scrollbar::ButtonRelease1 {} {
    unset -nocomplain -- ::ms::temp(drag_allowed) \
                         ::ms::temp(fraction) \
                         ::ms::temp(xpress) \
                         ::ms::temp(ypress);

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
proc ::ms::scrollbar::Destroy { w } {
    # Get the short address related to the widget real address.
    set short_addr $w

    # Destroy the aliased command.
    interp alias {} $::ms::data($w,token) {}

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

    # Remove the widget address from the scrollbar widgets real address list.
    set index [lsearch -exact $::ms::addr(scrollbar) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::addr(scrollbar) [lremove $::ms::addr(scrollbar) $index] }
    }

    # Remove the widget address from the scrollbar classtype real address list with class '::ms::current($w,class)'.
    set index [lsearch -exact $::ms::class($::ms::current($w,class),scrollbar,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::class($::ms::current($w,class),scrollbar,addrs) [lremove $::ms::class($::ms::current($w,class),scrollbar,addrs) $index] }
    }

    # Remove the widget address from the scrollbar classtype real address list with style '::ms::current($w,style)'.
    set index [lsearch -exact $::ms::style($::ms::current($w,style),scrollbar,addrs) $w]
    switch -- $index {
        -1      {}
        default { set ::ms::style($::ms::current($w,style),scrollbar,addrs) [lremove $::ms::style($::ms::current($w,style),scrollbar,addrs) $index] }
    }

    # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles for the scrollbar classtype.
    switch -- [llength $::ms::style($::ms::current($w,style),scrollbar,addrs)] {
        0   {
            set index [lsearch -exact $::ms::style(scrollbar,classtype) $::ms::current($w,style)]
            switch -- $index {
                -1      {}
                default { set ::ms::style(scrollbar,classtype) [lremove $::ms::style(scrollbar,classtype) $index] }
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

    unset -nocomplain -- ::ms::current($w,arrowcolor) \
                         ::ms::current($w,arrowsize) \
                         ::ms::current($w,background) \
                         ::ms::current($w,bordercolor) \
                         ::ms::current($w,borderwidth) \
                         ::ms::current($w,class) \
                         ::ms::current($w,command) \
                         ::ms::current($w,cursor) \
                         ::ms::current($w,darkcolor) \
                         ::ms::current($w,foreground) \
                         ::ms::current($w,gripcount) \
                         ::ms::current($w,lightcolor) \
                         ::ms::current($w,orient) \
                         ::ms::current($w,relief) \
                         ::ms::current($w,state) \
                         ::ms::current($w,style) \
                         ::ms::current($w,takefocus) \
                         ::ms::current($w,troughcolor);

    unset -nocomplain -- ::ms::data($w,classtype) \
                         ::ms::data($w,token);

    unset -nocomplain -- ::ms::default($w,arrowcolor) \
                         ::ms::default($w,arrowsize) \
                         ::ms::default($w,background) \
                         ::ms::default($w,bordercolor) \
                         ::ms::default($w,borderwidth) \
                         ::ms::default($w,class) \
                         ::ms::default($w,command) \
                         ::ms::default($w,cursor) \
                         ::ms::default($w,darkcolor) \
                         ::ms::default($w,foreground) \
                         ::ms::default($w,gripcount) \
                         ::ms::default($w,lightcolor) \
                         ::ms::default($w,orient) \
                         ::ms::default($w,relief) \
                         ::ms::default($w,state) \
                         ::ms::default($w,style) \
                         ::ms::default($w,takefocus) \
                         ::ms::default($w,troughcolor);

    unset -nocomplain -- ::ms::managed_by($w,arrowcolor) \
                         ::ms::managed_by($w,arrowsize) \
                         ::ms::managed_by($w,background) \
                         ::ms::managed_by($w,bordercolor) \
                         ::ms::managed_by($w,borderwidth) \
                         ::ms::managed_by($w,cursor) \
                         ::ms::managed_by($w,darkcolor) \
                         ::ms::managed_by($w,foreground) \
                         ::ms::managed_by($w,gripcount) \
                         ::ms::managed_by($w,lightcolor) \
                         ::ms::managed_by($w,relief) \
                         ::ms::managed_by($w,troughcolor);

    unset -nocomplain -- ::ms::style($w,widget)
}

## Drag
#
# Manage the **B1-Motion** event on the widget.
#
# Where:
#
# w      Should be the widget real address involved.
#
# x, y   Should be the (x,y) mouse pointer coordinates of the event.
#        These values should be provided by the **Motion** event.
#
# It doesn't return anything.
proc ::ms::scrollbar::Drag { w x y } {
    # Safeguard.
    # Check if drag operations are allowed or not.
    switch -- [info exists ::ms::temp(drag_allowed)] {
        0   { return "" }
        1   {
            switch -- $::ms::temp(drag_allowed) {
                no  { return "" }
            }
        }
    }

    # Compute 'delta_x' and 'delta_y'.
    set delta_x [expr { $x-$::ms::temp(xpress) }]
    set delta_y [expr { $y-$::ms::temp(ypress) }]

    # Compute the 'fraction' after the drag movement.
    set delta    [interp invokehidden {} $w delta $delta_x $delta_y]
    set fraction [expr { $::ms::temp(fraction)+$delta }]

    # Move the scrollbar to 'fraction'.
    ::ms::scrollbar::Pathname_Cmd $w moveto $fraction

    return ""
}

## Scroll
#
# Scrolls the address linked to the widget along the X or Y axis (depending on the widget orientation axis).
#
# Where:
#
# w        Should be the widget real address involved.
#
# amount   Should be the delta value of a **MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#          *Amount* is normally delivered by the **MouseWheel** event with a value of
#          **+120.0** or **-120.0**, depending on the scroll direction.
#
#          If the value provided as *amount* is not an integer or a float,
#          defaults to **+120.0**.
#
#          Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what     Should be a string that specifies the unit type.
#          Allowed values are the word **units** or **pages**.
#          If not provided, defaults to **units**.
#
# Note: 1.0/120.0 = 0.008333333333333333
#
# It doesn't return anything.
proc ::ms::scrollbar::Scroll { w amount { what units } } {
    # Check that 'amount' is an integer or a float.
    switch -- [string is double -strict $amount] {
        0   { set amount 120.0 }
        1   {
            if { $amount == 0 } {
                set amount 120
            } else {
                set amount [expr { $amount*1.0 }]
            }
        }
    }

    # Check the scrollmode.
    switch -- $::ms::scrollmode {
        natural { set amount [expr { -1.0*$amount }] }
    }
    set amount [expr { -$amount*0.008333333333333333 }]

    # Scroll the scrollbar by 'amount' of 'what'.
    ::ms::scrollbar::Pathname_Cmd $w scroll $amount $what

    return ""
}

## Touchpad
#
# Move the address linked to the widget along the X or Y axis (depending on the widget orientation axis).
#
# Where:
#
# w         Should be the scrollable widget real address involved.
#
# counter   Should be the *serial* field of a **TouchpadScroll** event (**%#**).
#
# amount    Should be the delta value of a **TouchpadScroll** event.
#           The delta value represents the rotation units the mouse wheel has been moved.
#           The sign of the value represents the direction the mouse wheel was scrolled.
#           *Amount* is normally delivered by the **TouchpadScroll** event with a value of
#           **+120.0** or **-120.0**, depending on the scroll direction.
#
#           If the value provided as *amount* is not an integer or a float,
#           defaults to **+120.0**.
#
#           Note: **0** is not allowed. If provided, it will be changed to **+120.0**.
#
# what      Should be a string that specifies the unit type.
#           Allowed values are the word **units** or **pages**.
#           If not provided, defaults to **units**.
#
# It doesn't return anything.
proc ::ms::scrollbar::Touchpad { w counter amount { what units } } {
    # Acknowledgment: This code is taken (and adapted) from the 'Recent improvements
    #                 on Tk 9' pdf paper by 'Csaba Nemethi'.

    # <TouchpadScroll> events can be generated about 60 times per second
    # during a two-finger gesture.
    # This code allows the binding script to respond to every 5th <TouchpadScroll> event
    # by testing if the 'counter' is divisible by 5.
    if { [expr { $counter%5 }] != 0 } {
        return ""
    }

    # Translate 'amount' in 'delta_x' and 'delta_y'.
    lassign [::tk::PreciseScrollDeltas $amount] delta_x delta_y

    # Check the 'what' provided.
    switch -- $what {
        units {
            # Adjust 'delta_x' and 'delta_y' values, or the movement will be too slow.
            set delta_x [expr { $delta_x*30 }]
            set delta_y [expr { $delta_y*30 }]
        }
    }

    # Set the right delta relative to the widget orientation axis.
    switch -- $::ms::current($w,orient) {
        horizontal {
            # Check if there was a movement along the X axis.
            if { $delta_x != 0 } {
                # Move the horizontal scrollbar by 'delta_x' of 'what'.
                ::ms::scrollbar::Scroll $w $delta_x $what
            }

            # Check if there was a movement along the Y axis.
            if { $delta_y != 0 } {
                # Move the parent widget by 'delta_y' of 'what'.
                ::ms::Scroll_Parent_Y $w $delta_y $what
            }
        }
        vertical {
            # Check if there was a movement along the X axis.
            if { $delta_x != 0 } {
                # Move the parent widget by 'delta_x' of 'what'.
                ::ms::Scroll_Parent_X $w $delta_x $what
            }

            # Check if there was a movement along the Y axis.
            if { $delta_y != 0 } {
                # Move the vertical scrollbar by 'delta_y' of 'what'.
                ::ms::scrollbar::Scroll $w $delta_y $what
            }
        }
    }

    return ""
}

#*EOF*