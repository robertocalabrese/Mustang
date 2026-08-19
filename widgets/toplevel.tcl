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
package provide ::ms::toplevel 0.1

################################
##                            ##
##     _TOPLEVEL BINDINGS     ##
##                            ##
################################

# Activate/Deactivate
_bind _Toplevel <Activate>   { ::ms::toplevel::Pathname_Cmd %W state !background; break }
_bind _Toplevel <Deactivate> { ::ms::toplevel::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Toplevel <ButtonPress-1> { ::ms::toplevel::Focus_Toplevel %W; break }

# Configure
_bind _Toplevel <Configure> { ::ms::toplevel::Configure %W; break }

# Contextual menu
_bind _Toplevel <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Toplevel <Destroy> { ::ms::toplevel::Destroy %W; break }

# Enter/Leave
_bind _Toplevel <Enter> { ::ms::toplevel::Hover %W %X %Y; break }
_bind _Toplevel <Leave> { ::ms::toplevel::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Toplevel <FocusIn>  { ::ms::toplevel::FocusIn  %W; break }
_bind _Toplevel <FocusOut> { ::ms::toplevel::FocusOut %W; break }

# Create the mustang **toplevel** package.
namespace eval ::ms::toplevel {
    # Set the 'non-styleable' toplevel option list.
    set ::ms::toplevel(non_styleable,options) [list class \
                                                    cmenu \
                                                    colormap \
                                                    container \
                                                    height \
                                                    menu \
                                                    screen \
                                                    state \
                                                    style \
                                                    takefocus \
                                                    title \
                                                    use \
                                                    visual \
                                                    width];

    # Set the 'styleable' toplevel option list.
    set ::ms::toplevel(styleable,options) [list background \
                                                backgroundimage \
                                                bordercolor \
                                                borderwidth \
                                                cursor \
                                                padding \
                                                relief \
                                                tile];

    # Set the default 'non-styleable' toplevel options values.
    set ::ms::default(toplevel,class)     Toplevel
    set ::ms::default(toplevel,cmenu)     {}
    set ::ms::default(toplevel,colormap)  {}
    set ::ms::default(toplevel,container) 0
    set ::ms::default(toplevel,height)    0
    set ::ms::default(toplevel,menu)      {}
    set ::ms::default(toplevel,screen)    {}
    set ::ms::default(toplevel,state)     normal
    set ::ms::default(toplevel,style)     Toplevel
    set ::ms::default(toplevel,takefocus) 0
    set ::ms::default(toplevel,title)     [string totitle [tk appname]]
    set ::ms::default(toplevel,use)       {}
    set ::ms::default(toplevel,visual)    {}
    set ::ms::default(toplevel,width)     0

    # Note: The default 'styleable' toplevel options values are always defined inside the current theme.
}

# Rename the original Tk **toplevel** command.
rename toplevel _toplevel

# Create an alias for the mustang **toplevel** command.
interp alias {} toplevel {} ::ms::toplevel::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **toplevel** widget command.
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
proc ::ms::toplevel::Command { window { args "" } } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Set the widget real and short addresses.
    # Toplevels have their short address always equal to their real address.
    set w          $window
    set short_addr $window

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
            set ::ms::default($w,class)     $::ms::default(toplevel,class)
            set ::ms::default($w,cmenu)     $::ms::default(toplevel,cmenu)
            set ::ms::default($w,colormap)  $::ms::default(toplevel,colormap)
            set ::ms::default($w,height)    $::ms::default(toplevel,height)
            set ::ms::default($w,menu)      $::ms::default(toplevel,menu)
            set ::ms::default($w,screen)    $::ms::default(toplevel,screen)
            set ::ms::default($w,state)     $::ms::default(toplevel,state)
            set ::ms::default($w,style)     $::ms::default(toplevel,style)
            set ::ms::default($w,takefocus) $::ms::default(toplevel,takefocus)
            set ::ms::default($w,title)     $::ms::default(toplevel,title)
            set ::ms::default($w,visual)    $::ms::default(toplevel,visual)
            set ::ms::default($w,width)     $::ms::default(toplevel,width)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)     $::ms::default(toplevel,class)
            set ::ms::current($w,cmenu)     $::ms::default(toplevel,cmenu)
            set ::ms::current($w,colormap)  $::ms::default(toplevel,colormap)
            set ::ms::current($w,height)    $::ms::default(toplevel,height)
            set ::ms::current($w,menu)      $::ms::default(toplevel,menu)
            set ::ms::current($w,screen)    $::ms::default(toplevel,screen)
            set ::ms::current($w,state)     $::ms::default(toplevel,state)
            set ::ms::current($w,style)     $::ms::default(toplevel,style)
            set ::ms::current($w,takefocus) $::ms::default(toplevel,takefocus)
            set ::ms::current($w,title)     $::ms::default(toplevel,title)
            set ::ms::current($w,visual)    $::ms::default(toplevel,visual)
            set ::ms::current($w,width)     $::ms::default(toplevel,width)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) toplevel
            set ::ms::data($w,statespec) $::ms::data(statespec,normal)

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
            #       To make a toplevel styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **toplevel** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)      Tk
            set ::ms::managed_by($w,backgroundimage) Tk
            set ::ms::managed_by($w,bordercolor)     Tk
            set ::ms::managed_by($w,borderwidth)     Tk
            set ::ms::managed_by($w,cursor)          Tk
            set ::ms::managed_by($w,padding)         Tk
            set ::ms::managed_by($w,relief)          Tk
            set ::ms::managed_by($w,tile)            Tk

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
                    -backgroundimage {
                        if { ($value eq "") || ($value in [image names]) } {
                            set ::ms::current($w,backgroundimage)    $value
                            set ::ms::managed_by($w,backgroundimage) developer
                        }
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
                    -colormap {
                        switch -nocase -- $value {
                            ""      -
                            "new"   {}
                            default {
                                switch -- [winfo exists $value] {
                                    0   { continue }
                                }
                            }
                        }

                        set ::ms::current($w,colormap) $value
                    }
                    -container {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,container) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,container) 1 }
                        }
                    }
                    -cursor {
                        set value [string tolower $value]
                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                            set ::ms::current($w,cursor)    $value
                            set ::ms::managed_by($w,cursor) developer
                        }
                    }
                    -height {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,height) $value
                    }
                    -menu {
                        if { $value eq "" } {
                            set ::ms::current($w,menu) $value
                        } elseif { ($value in $::ms::addr(menu)) && ([_winfo toplevel $value] eq $w) } {
                            set ::ms::current($w,menu) $value
                        }
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
                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                switch -- $pad_horizontal {
                                    invalid { continue }
                                }

                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                switch -- $pad_vertical {
                                    invalid { continue }
                                }

                                # If the '::DEBUG' variable is enabled, display the notificafion for the padding value ignored.
                                switch -nocase -- $::DEBUG {
                                    1       -
                                    on      -
                                    true    -
                                    active  -
                                    enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
                                }

                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
                            }
                            4   {
                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                switch -- $pad_horizontal {
                                    invalid { continue }
                                }

                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                switch -- $pad_vertical {
                                    invalid { continue }
                                }

                                # If the '::DEBUG' variable is enabled, display the notificafion for the padding values ignored.
                                switch -nocase -- $::DEBUG {
                                    1       -
                                    on      -
                                    true    -
                                    active  -
                                    enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
                                }

                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
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
                    -screen { set ::ms::current($w,screen) $value }
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
                    -tile {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,tile) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,tile) 1 }
                        }
                    }
                    -title { set ::ms::current($w,title) $value }
                    -use {
                        set value [string tolower $value]
                        switch -- $value {
                            ""      {}
                            default {
                                set prefix [string range $value 0 1]
                                set hex    [string range $value 2 end]

                                switch -- $prefix {
                                    "0x"    {}
                                    default { continue }
                                }

                                switch -- [string is xdigit -strict $hex] {
                                    0   { continue }
                                }
                            }
                        }

                        set ::ms::current($w,use) $value
                    }
                    -visual {
                        set value [string tolower $value]

                        # Check if it's the empty string.
                        switch -- $value {
                            ""  {
                                set ::ms::current($w,visual) ""
                                continue
                            }
                        }

                        # Check if it's the word 'default'.
                        if { $value eq "default" } {
                            set ::ms::current($w,visual) default
                            continue
                        }

                        # Check if it's an integer.
                        switch -- [string is integer -strict $value] {
                            1   {
                                set ::ms::current($w,visual) $value
                                continue
                            }
                        }

                        # Check if it's a class name with depth.
                        switch -- [llength $value] {
                            2   {
                                # Check the class name.
                                switch -- [lindex $value 0] {
                                    directcolor -
                                    grayscale   -
                                    greyscale   -
                                    pseudocolor -
                                    staticcolor -
                                    staticgray  -
                                    staticgrey  -
                                    truecolor   {
                                        # Check the depth.
                                        switch -- [lindex $value 1] {
                                            1   -
                                            2   -
                                            4   -
                                            8   -
                                            16  -
                                            32  -
                                            64  {
                                                set ::ms::current($w,visual) $value
                                                continue
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    -width {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,width) $value
                    }
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::toplevel(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Toplevel,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            # Set the internal '-padding' option to always show the horizontal and vertical padding.
            switch -- [llength $::ms::current($w,padding)] {
                1       { set ::ms::data($w,padding) [list $::ms::current($w,padding) $::ms::current($w,padding)] }
                default { set ::ms::data($w,padding) $::ms::current($w,padding) }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            ######################
            ##                  ##
            ##     TOPLEVEL     ##
            ##                  ##
            ######################

            # Note: Tk Toplevels don't understands styles, at least not natively.
            #       No internal styles needs to be created.

            # Note: 'backgroundimage', 'borderwidth', 'cursor', 'padding', 'relief' and 'tile' are not allowed to change
            #       if the statespec changes.

            # Set the toplevel options.
            set toplevel_options [list      -background $::ms::current($w,background) \
                                       -backgroundimage $::ms::current($w,backgroundimage) \
                                                 -class $::ms::current($w,class) \
                                              -colormap $::ms::current($w,colormap) \
                                             -container $::ms::current($w,container) \
                                                -cursor $::ms::current($w,cursor) \
                                                -height $::ms::current($w,height) \
                                                  -menu $::ms::current($w,menu) \
                                                  -padx [lindex $::ms::data($w,padding) 0] \
                                                  -pady [lindex $::ms::data($w,padding) 1] \
                                                -screen $::ms::current($w,screen) \
                                             -takefocus $::ms::current($w,takefocus) \
                                                  -tile $::ms::current($w,tile) \
                                                   -use $::ms::current($w,use) \
                                                -visual $::ms::current($w,visual) \
                                                 -width $::ms::current($w,width)];

            # Check the 'relief' type.
            switch -- $::ms::current($w,relief) {
                flat  -
                solid {
                    lappend toplevel_options         -borderwidth 0 \
                                             -highlightbackground $::ms::current($w,bordercolor) \
                                                  -highlightcolor $::ms::current($w,bordercolor) \
                                              -highlightthickness $::ms::current($w,borderwidth) \
                                                          -relief flat;
                }
                default {
                    lappend toplevel_options         -borderwidth $::ms::current($w,borderwidth) \
                                             -highlightbackground $::ms::current($w,background) \
                                                  -highlightcolor $::ms::current($w,background) \
                                              -highlightthickness 0 \
                                                          -relief $::ms::current($w,relief);
                }
            }

            # Create the widget.
            _toplevel $w {*}$toplevel_options

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) $w

            # Set the toplevel title, if any.
            switch -- $::ms::current($w,title) {
                ""      {}
                default { _wm title $w [::msgcat::mc "$::ms::current($w,title)"] }
            }

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                Toplevel { _bindtags $w [list $w _Toplevel Toplevel $::ms::addr($w,toplevel) all] }
                default  { _bindtags $w [list $w $::ms::current($w,class) _Toplevel Toplevel $::ms::addr($w,toplevel) all] }
            }

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the toplevel real address pathcommand.
            interp hide {} $w

            # Create an alias for the toplevel real pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::toplevel::Pathname_Cmd $w]

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short address relative to its real address, 'w'.
            set ::ms::addr($w,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals)  $w
            lappend ::ms::addr(shorts) $short_addr

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address.
            set ::ms::addr($w,widget) $w

            # Set the structure address.
            set ::ms::addr($w,structure) [list $w];

            # Add the widget address to the toplevel widgets real address list.
            lappend ::ms::addr(toplevel) $w

            # Add the widget address to the toplevel classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),toplevel,addrs) $w

            # Add the widget address to the toplevel classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),toplevel,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the toplevel classtype.
            if { $::ms::current($w,style) ni $::ms::style(toplevel,classtype) } {
                lappend ::ms::style(toplevel,classtype) $::ms::current($w,style)
            }

            # Toplevel short address are always equal to their real address.
            return $w
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
proc ::ms::toplevel::Pathname_Cmd { w cmd args } {
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
                    if { ($option in $::ms::toplevel(non_styleable,options)) || ($option in $::ms::toplevel(styleable,options)) } {
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
                    foreach option $::ms::toplevel(non_styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    # 'styleable' options.
                    foreach option $::ms::toplevel(styleable,options) {
                        lappend result [list $option $::ms::default($w,$option) $::ms::current($w,$option)]
                    }

                    return [lsort -dictionary -increasing -index 0 $result]
                }
                1   {
                    set option [string range $args 1 end]
                    if { ($option in $::ms::toplevel(non_styleable,options)) || ($option in $::ms::toplevel(styleable,options)) } {
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
                            #       Their registration (if any) is done in the '::ms::toplevel::Configure' event procedure.
                            set ::ms::temp($w,height) $::ms::current($w,height)
                            set ::ms::temp($w,width)  $::ms::current($w,width)

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
                                    -backgroundimage {
                                        if { ($value eq "") || ($value in [image names]) } {
                                            set ::ms::current($w,backgroundimage)    $value
                                            set ::ms::managed_by($w,backgroundimage) developer
                                        }
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
                                    -colormap  -
                                    -container {}
                                    -cursor {
                                        set value [string tolower $value]
                                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                                            set ::ms::current($w,cursor)    $value
                                            set ::ms::managed_by($w,cursor) developer
                                        } else {
                                            continue
                                        }
                                    }
                                    -height {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::temp($w,height) $value
                                    }
                                    -menu {
                                        if { $value eq "" } {
                                            set ::ms::current($w,menu) $value
                                        } elseif { ($value in $::ms::addr(menu)) && ([_winfo toplevel $value] eq $w) } {
                                            set ::ms::current($w,menu) $value
                                        }
                                    }
                                    -padding {
                                        switch -- [llength $value] {
                                            1   {
                                                set value [::ms::Check_Measure $value invalid]
                                                switch -- $value {
                                                    invalid { continue }
                                                }

                                                set ::ms::current($w,padding) [list $value $value]
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
                                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                                switch -- $pad_horizontal {
                                                    invalid { continue }
                                                }

                                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                                switch -- $pad_vertical {
                                                    invalid { continue }
                                                }

                                                # If the '::DEBUG' variable is enabled, display the notificafion for the padding value ignored.
                                                switch -nocase -- $::DEBUG {
                                                    1       -
                                                    on      -
                                                    true    -
                                                    active  -
                                                    enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
                                                }

                                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
                                            }
                                            4   {
                                                set pad_horizontal [::ms::Check_Measure [lindex $value 0] invalid]
                                                switch -- $pad_horizontal {
                                                    invalid { continue }
                                                }

                                                set pad_vertical [::ms::Check_Measure [lindex $value 1] invalid]
                                                switch -- $pad_vertical {
                                                    invalid { continue }
                                                }

                                                # If the '::DEBUG' variable is enabled, display the notificafion for the padding values ignored.
                                                switch -nocase -- $::DEBUG {
                                                    1       -
                                                    on      -
                                                    true    -
                                                    active  -
                                                    enabled { chan puts stdout "The toplevel '-padding' option can have a maximum of two values. Ignoring the rest." }
                                                }

                                                set ::ms::current($w,padding) [list $pad_horizontal $pad_vertical]
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
                                    -screen -
                                    -state  {}
                                    -style {
                                        if { $value in $::ms::style($::ms::theme) } {
                                            # Remove the widget address from the toplevel classtype real address list that contains all the
                                            # widgets addresses with style '::ms::current($w,style)'.
                                            set index [lsearch -exact $::ms::style($::ms::current($w,style),toplevel,addrs) $w]
                                            switch -- $index {
                                                -1      {}
                                                default { set ::ms::style($::ms::current($w,style),toplevel,addrs) [lremove $::ms::style($::ms::current($w,style),toplevel,addrs) $index] }
                                            }

                                            # Add the widget address to the address list that contains all the
                                            # widgets addresses with style 'value'.
                                            lappend ::ms::style($value,toplevel,addrs) $w

                                            # If needed, remove the '::ms::current($w,style)' from the list that contains the available styles
                                            # for the toplevel classtype.
                                            switch -- [llength $::ms::style($::ms::current($w,style),toplevel,addrs)] {
                                                0   {
                                                    set index [lsearch -exact $::ms::style(toplevel,classtype) $::ms::current($w,style)]
                                                    switch -- $index {
                                                        -1      {}
                                                        default { set ::ms::style(toplevel,classtype) [lremove $::ms::style(toplevel,classtype) $index] }
                                                    }
                                                }
                                            }

                                            # If needed, add 'value' to the available styles for the toplevel classtype.
                                            if { $value ni $::ms::style(toplevel,classtype) } {
                                                lappend ::ms::style(toplevel,classtype) $value
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
                                    -tile {
                                        switch -nocase -- $value {
                                            0        -
                                            no       -
                                            off      -
                                            false    -
                                            disabled { set ::ms::current($w,tile) 0 }
                                            1        -
                                            yes      -
                                            on       -
                                            true     -
                                            enabled  { set ::ms::current($w,tile) 1 }
                                        }
                                    }
                                    -title {
                                        set ::ms::current($w,title) $value

                                        _wm title $w [::msgcat::mc "$::ms::current($w,title)"]
                                    }
                                    -visual -
                                    -use    {}
                                    -width {
                                        set value [::ms::Check_Measure $value invalid]
                                        switch -- $value {
                                            invalid { continue }
                                        }

                                        set ::ms::temp($w,width) $value
                                    }
                                }
                            }

                            # Set the current option values for each styleable option managed by Tk.
                            foreach option $::ms::toplevel(styleable,options) {
                                switch -- $::ms::managed_by($w,$option) {
                                    Tk  {
                                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                                        }
                                    }
                                }
                            }

                            # Set the internal '-padding' option to always show the horizontal and vertical padding.
                            switch -- [llength $::ms::current($w,padding)] {
                                1       { set ::ms::data($w,padding) [list $::ms::current($w,padding) $::ms::current($w,padding)] }
                                default { set ::ms::data($w,padding) $::ms::current($w,padding) }
                            }

                            ##################################
                            ##                              ##
                            ##     CONFIGURE THE WIDGET     ##
                            ##                              ##
                            ##################################

                            ######################
                            ##                  ##
                            ##     TOPLEVEL     ##
                            ##                  ##
                            ######################

                            # Note: Toplevels don't understands styles natively.
                            #       No internal styles needs to be created.

                            # Note: 'backgroundimage', 'borderwidth', 'cursor', 'padding', 'relief' and 'tile' are not allowed to change
                            #       if the statespec changes.

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

                            # Configure the toplevel options.
                            set toplevel_options [list      -background $background \
                                                       -backgroundimage $::ms::current($w,backgroundimage) \
                                                                -cursor $::ms::current($w,cursor) \
                                                                -height $::ms::temp($w,height) \
                                                                  -menu $::ms::current($w,menu) \
                                                                  -padx [lindex $::ms::data($w,padding) 0] \
                                                                  -pady [lindex $::ms::data($w,padding) 1] \
                                                             -takefocus $::ms::current($w,takefocus) \
                                                                  -tile $::ms::current($w,tile) \
                                                                 -width $::ms::temp($w,width)];

                            # Check the 'relief' type
                            switch -- $::ms::current($w,relief) {
                                flat  -
                                solid {
                                    lappend toplevel_options         -borderwidth 0 \
                                                             -highlightbackground $bordercolor \
                                                                  -highlightcolor $bordercolor \
                                                              -highlightthickness $::ms::current($w,borderwidth) \
                                                                          -relief flat;
                                }
                                default {
                                    lappend toplevel_options         -borderwidth $::ms::current($w,borderwidth) \
                                                             -highlightbackground $background \
                                                                  -highlightcolor $background \
                                                              -highlightthickness 0 \
                                                                          -relief $::ms::current($w,relief);
                                }
                            }

                            # Apply the changes.
                            interp invokehidden {} $w configure {*}$toplevel_options

                            # Note: If width and/or height were provided by the developer, and these values were accepted by Tk,
                            #       then a configure event will be invoked by Tk ('::ms::toplevel::Configure').
                            #       After this event, their values will be registered.

                            update

                            # Cleaning.
                            unset -nocomplain -- ::ms::temp($w,height) \
                                                 ::ms::temp($w,width);

                            return ""
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

                    if { $widget eq $w } {
                        return "Toplevel.area"
                    } else {
                        ::ms::Error "Invalid coordinates." $caller_info
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

                    # Note: Toplevels don't understands styles natively.
                    #       No internal styles needs to be created.

                    # Note: 'backgroundimage', 'borderwidth', 'cursor', 'padding', 'relief' and 'tile' are not allowed to change
                    #       if the statespec changes.

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

                    # Set the toplevel options.
                    set toplevel_options [list -background $background]

                    # Check the 'relief' type.
                    switch -- $::ms::current($w,relief) {
                        flat  -
                        solid {
                            lappend toplevel_options         -borderwidth 0 \
                                                     -highlightbackground $bordercolor \
                                                          -highlightcolor $bordercolor \
                                                      -highlightthickness $::ms::current($w,borderwidth) \
                                                                  -relief flat;
                        }
                        default {
                            lappend toplevel_options         -borderwidth $::ms::current($w,borderwidth) \
                                                     -highlightbackground $background \
                                                          -highlightcolor $background \
                                                      -highlightthickness 0 \
                                                                  -relief $::ms::current($w,relief);
                        }
                    }

                    # Apply the changes.
                    interp invokehidden {} $w configure {*}$toplevel_options

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
# Update any toplevel widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::toplevel::Style_Update { stylename caller_info } {
    # Check the stylename padding, if any.
    set index [lsearch -exact $::ms::styleopt($::ms::theme,$stylename) "-padding"]
    switch -- $index {
        -1      {}
        default {
            switch -- [llength $::ms::styleopt($::ms::theme,$stylename,padding)] {
                3   -
                4   {
                    # Update the stylename padding option for the current theme.
                    set ::ms::styleopt($::ms::theme,$stylename)         [lreplace $::ms::styleopt($::ms::theme,$stylename) $index+1 $index+1 $::ms::styleopt($::ms::theme,$stylename,padding)]
                    set ::ms::styleopt($::ms::theme,$stylename,padding) [list [lindex $::ms::styleopt($::ms::theme,$stylename,padding) 0] [lindex $::ms::styleopt($::ms::theme,$stylename,padding) 1]]
                }
            }
        }
    }

    # Update all the toplevel widgets that have stylename as a style.
    foreach w $::ms::style($stylename,toplevel,addrs) {
        # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
        foreach option $::ms::toplevel(styleable,options) {
            set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Toplevel,$option)

            switch -- $::ms::managed_by($w,$option) {
                Tk  {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                        0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                        1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                    }
                }
            }
        }
    }

    return ""
}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*