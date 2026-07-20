# Copyright: 2025 Roberto Calabrese a.k.a. Kicka
#
# This file is part of "Mustang", a GUI toolkit for Tcl/Tk 9.0 and later
# (https://codeberg.org/kicka/Mustang).
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
package provide ::ms::pack 0.1

# Create the mustang **pack** package.
namespace eval ::ms::pack {}

# Rename the original Tk **pack** command.
rename pack _pack

# Create an alias for the mustang **pack** command.
interp alias {} pack {} ::ms::pack::Command

## Command
#
# Replace the Tk **pack** command.
#
# Where:
#
# args   Should be the arguments of the **pack** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::pack::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        configure {
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                1       { return "" }
                default {
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the 'window' real address.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set addresses [lindex $result 0] }
                    }

                    # Check if there are other addresses.
                    set remaining_args $args
                    foreach arg $args {
                        switch -- [string index $arg 0] {
                            "." {
                                set window $arg

                                # Get the 'window' real address.
                                set result [::ms::Check_Pathname $window invalid]
                                switch -- $result {
                                    invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                    default {
                                        lappend addresses  [lindex  $result 0]
                                        set remaining_args [lremove $remaining_args 0]
                                    }
                                }
                            }
                            default { break }
                        }
                    }
                    set args $remaining_args

                    # Check the option/values in 'args'.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # '-after', '-before' and '-in'
                            foreach optionName [list "-after" "-before" "-in"] {
                                set index [lsearch -exact $args $optionName]
                                switch -- $index {
                                    -1      {}
                                    default {
                                        set window [lindex $args $index+1]

                                        switch -- $window {
                                            ""      {}
                                            default {
                                                # Get the real address associated with 'window'.
                                                set result [::ms::Check_Pathname $window invalid]
                                                switch -- $result {
                                                    invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                                    default {
                                                        set w    [lindex $result 0]
                                                        set type [lindex $result 1]

                                                        # Check the initial address type provided (short or real).
                                                        switch -- $type {
                                                            short {
                                                                # Substitute 'window' with its relative real address.
                                                                set args [lreplace $args $index+1 $index+1 $w]
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            # Execute the command.
                            try {
                                _pack configure {*}$addresses {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                # Note: The 'pack info' command returns an option/value list that
                                #       will always contain the '-in' option at index '0'.

                                foreach w $addresses {
                                    # Check if 'w' is a scrollable widget.
                                    if { $w in $::ms::addr(megawidgets,scrollable) } {
                                        # If its classtype is a listbox, canvas or text, update its scrollbar if needed.
                                        # The listbox is not a container, its scrollbar update needs to be launched each time it change
                                        # its placement on the screen.
                                        # For safeguarding we will do the same for canvas and text because even if they are containers,
                                        # they normally don't contain any widgets.
                                        switch -- $::ms::data($w,classtype) {
                                            canvas  -
                                            listbox -
                                            text    { [string cat "::ms::" $::ms::data($w,classtype) "::Scrollbar_Update"] $w }
                                        }
                                    }

                                    # Force the propagation inside any scrollable widget ancestor for each address provided, if any.
                                    ::ms::Scrollable_Widgets_Propagation_Mechanism [lindex [_pack info $w] 1]
                                }

                                return ""
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        content -
        slaves  {
            switch -- [llength $args] {
                1   {
                    set container $args

                    # Get the 'container' real address.
                    set result [::ms::Check_Pathname $container invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$container'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]
                        }
                    }

                    # Execute the command.
                    try {
                        _pack $action $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        # Check the initial address type provided (short or real).
                        switch -- $type {
                            short {
                                set shorts_result [list ]
                                foreach w $result {
                                    if { $w in $::ms::addr(reals) } {
                                        # 'w' is the real address of a widget created by mustang.
                                        lappend shorts_result $::ms::addr($w,short)
                                    } else {
                                        # 'w' is the real address of a widget not created by mustang.
                                        lappend shorts_result [::ms::Get_Short $w]
                                    }
                                }

                                return $shorts_result
                            }
                            default { return $result }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        forget -
        remove {
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    foreach window $args {
                        # Get the 'window' real address.
                        set result [::ms::Check_Pathname $window invalid]
                        switch -- $result {
                            invalid { break }
                            default { set w [lindex $result 0] }
                        }

                        # Note: The 'pack info' command returns an option/value list that
                        #       will always contain the '-in' option at index '0'.

                        set container [lindex [_pack info $w] 1]

                        # Forget/Remove the real address.
                        _pack $action $w

                        # Force the propagation inside any scrollable widget ancestor, if any.
                        ::ms::Scrollable_Widgets_Propagation_Mechanism $container
                    }

                    return ""
                }
            }
        }
        info {
            switch -- [llength $args] {
                1   {
                    set window [lindex $args 0]

                    # Get the 'window' real address.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]
                        }
                    }

                    # Execute the command.
                    try {
                        _pack info $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        # Check the initial address type provided (short or real).
                        switch -- $type {
                            short {
                                # Note: The 'pack info' command returns an option/value list that
                                #       will always contain the '-in' option at index '0'.

                                # '-in' address
                                set container [lindex $result 1]
                                if { $container in $::ms::addr(reals) } {
                                    # 'container' is the real address of a widget created by mustang.
                                    set result [lreplace $result $index+1 $index+1 $::ms::addr($container,short)]
                                } else {
                                    # 'container' is the real address of a widget not created by mustang.
                                    set result [lreplace $result $index+1 $index+1 [::ms::Get_Short $container]]
                                }
                            }
                        }

                        return $result
                    }
                }
                2   {
                    # Get the 'pathname' and 'optionName' provided.
                    set window     [lindex $args 0]
                    set optionName [lindex $args 1]

                    # Get the 'window' real address.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]
                        }
                    }

                    # Execute the command.
                    try {
                        _pack info $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -- $optionName {
                            "-in" {
                                # Check the initial address type provided (short or real).
                                switch -- $type {
                                    short {
                                        # Note: The 'pack info' command returns an option/value list that
                                        #       will always contain the '-in' option at index '0'.

                                        # '-in' address
                                        set container [lindex $result 1]
                                        if { $container in $::ms::addr(reals) } {
                                            # 'container' is the real address of a widget created by mustang.
                                            return $::ms::addr($container,short)
                                        } else {
                                            # 'container' is the real address of a widget not created by mustang.
                                            return [::ms::Get_Short $container]
                                        }
                                    }
                                    default { return [lindex $result 1] }
                                }
                            }
                            default {
                                set index [lsearch -exact $result $optionName]
                                switch -- $index {
                                    -1      { ::ms::Error "Invalid option name, '$optionName'." $caller_info }
                                    default { return [lindex $result $index+1] }
                                }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        propagate {}
        default {}
    }
}

#*EOF*