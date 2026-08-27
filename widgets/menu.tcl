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
package provide ::ms::menu 0.1

# Create the mustang **menu** package.
namespace eval ::ms::menu {
    # Set the 'non styleable' menu option list.
    set ::ms::menu(non_styleable,options) [list class \
                                                postcommand \
                                                state \
                                                style \
                                                takefocus];

    # Set the 'styleable' menu option list.
    set ::ms::menu(styleable,options) [list activebackground \
                                            activeborderwidth \
                                            activeforeground \
                                            activerelief \
                                            background \
                                            borderwidth \
                                            cursor \
                                            disabledforeground \
                                            font \
                                            foreground \
                                            relief \
                                            selectcolor];

    # Set the default 'non-styleable' menu options values.
    set ::ms::default(menu,class)       Menu
    set ::ms::default(menu,postcommand) {}
    set ::ms::default(menu,state)       normal
    set ::ms::default(menu,style)       Menu
    set ::ms::default(menu,takefocus)   0

    # Note: The default 'styleable' menu options values are always defined inside the current theme.
}

# Rename the original Tk **menu** command.
rename menu _menu

# Create an alias for the mustang **menu** command.
interp alias {} menu {} ::ms::menu::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **menu** widget command.
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
proc ::ms::menu::Command { window { args "" } } {
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
            set ::ms::default(menu,class)       $::ms::default(menu,class)
            set ::ms::default(menu,postcommand) $::ms::default(menu,postcommand)
            set ::ms::default(menu,state)       $::ms::default(menu,state)
            set ::ms::default(menu,style)       $::ms::default(menu,style)
            set ::ms::default(menu,takefocus)   $::ms::default(menu,takefocus)

            # Set the current widget (not styleable) options.
            set ::ms::current(menu,class)       $::ms::default(menu,class)
            set ::ms::current(menu,postcommand) $::ms::default(menu,postcommand)
            set ::ms::current(menu,state)       $::ms::default(menu,state)
            set ::ms::current(menu,style)       $::ms::default(menu,style)
            set ::ms::current(menu,takefocus)   $::ms::default(menu,takefocus)

            # Set the widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) menu

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
            #       To make a menu styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **menu** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,activebackground)   Tk
            set ::ms::managed_by($w,activeborderwidth)  Tk
            set ::ms::managed_by($w,activeforeground)   Tk
            set ::ms::managed_by($w,activerelief)       Tk
            set ::ms::managed_by($w,background)         Tk
            set ::ms::managed_by($w,borderwidth)        Tk
            set ::ms::managed_by($w,cursor)             Tk
            set ::ms::managed_by($w,disabledforeground) Tk
            set ::ms::managed_by($w,font)               Tk
            set ::ms::managed_by($w,foreground)         Tk
            set ::ms::managed_by($w,relief)             Tk
            set ::ms::managed_by($w,selectcolor)        Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -activebackground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,activebackground)    $value
                        set ::ms::managed_by($w,activebackground) developer
                    }
                    -activeborderwidth {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,activeborderwidth)    $value
                        set ::ms::managed_by($w,activeborderwidth) developer
                    }
                    -activeforeground {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,activeforeground)    $value
                        set ::ms::managed_by($w,activeforeground) developer
                    }
                    -background {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,background)    $value
                        set ::ms::managed_by($w,background) developer
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
                    -postcommand { set ::ms::current($w,postcommand) $value }
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
                    -selectcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,selectcolor)    $value
                        set ::ms::managed_by($w,selectcolor) developer
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
                }
            }

            # Set the default value for each styleable option and if the option is managed by Tk, set also its current value.
            foreach option $::ms::menu(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,Menu,$option)

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

            # Note: 'activebackground', 'activeborderwidth', 'activeforeground', 'activerelief', 'activerelief', 'background', 'borderwidth', 'cursor',
            #       'disabledbackground', 'font', 'foreground', 'relief' and 'selectcolor' are not allowed to change if the statespec changes.

            # Create the widget.
            menu $w   -activebackground $::ms::current($w,activebackground) \
                     -activeborderwidth $::ms::current($w,activeborderwidth) \
                      -activeforeground $::ms::current($w,activeforeground) \
                          -activerelief $::ms::current($w,activerelief) \
                            -background $::ms::current($w,background) \
                           -borderwidth $::ms::current($w,borderwidth) \
                                -cursor $::ms::current($w,cursor) \
                    -disabledforeground $::ms::current($w,disabledforeground) \
                                  -font $::ms::current($w,font) \
                            -foreground $::ms::current($w,foreground) \
                           -postcommand $::ms::current($w,postcommand) \
                                -relief $::ms::current($w,relief) \
                           -selectcolor $::ms::current($w,selectcolor) \
                             -takefocus $::ms::current($w,takefocus) \
                               -tearoff 0 \
                        -tearoffcommand {} \
                                 -title {} \
                                  -type menubar;

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            _bindtags $w [list $w $::ms::current($w,class) Menu $::ms::addr($w,toplevel) all]

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::menu::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::menu::Pathname_Cmd $w]
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

            # Add the widget address to the menu widgets real address list.
            lappend ::ms::addr(menu) $w

            # Add the widget address to the menu classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),menu,addrs) $w

            # Add the widget address to the menu classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),menu,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the menu classtype.
            if { $::ms::current($w,style) ni $::ms::style(menu,classtype) } {
                lappend ::ms::style(menu,classtype) $::ms::current($w,style)
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
proc ::ms::menu::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        activate {
            # Synopsis:
            #
            # *window* **activate** *index*
            switch -- [llength $args] {
                1   {
                    # Execute the command.
                    try {
                        $w $cmd $args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        add {}
        cget {}
        clone  -
        delete {}
        configure {}
        entrycget {}
        entryconfigure {}
        id          -
        index       -
        invoke      -
        postcascade -
        type        -
        xposition   -
        yposition   {}
        insert {}
        post {}
        style {}
        unpost {}
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
# Update any menu widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::menu::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*