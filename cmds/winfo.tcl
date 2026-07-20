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

# Symbols meanings that may be used by the command synopsis:
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

# Symbols meanings that may be used by the command infos:
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
package provide ::ms::winfo 0.1

# Create the mustang **winfo** package.
namespace eval ::ms::winfo {}

# Rename the original Tk **winfo** command.
rename winfo _winfo

# Create an alias for the mustang **winfo** command.
interp alias {} winfo {} ::ms::winfo::Command

## Command
#
# Replace the Tk **winfo** command.
#
# Where:
#
# args   Should be the arguments of the **winfo** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::winfo::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        atom     -
        atomname {
            switch -- [llength $args] {
                1   {}
                3   {
                    # '-displayof'
                    switch -- [lindex $args 0] {
                        "-displayof" {
                            set window [lindex $args 1]

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
                                            set args [lreplace $args 1 1 $w]
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _winfo $action {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        children {
            # ATTENTION! Differently than others mustang commands, the **winfo children** command will **always**
            #            return real addresses, even if a short address was provided as input.
            #
            #            You can always ask if an address is a short or real address with **tk get addr**.
            #            You can always translate a real address into a short address using the **tk get short**
            #            command or a short address into a real address using the **tk get real** command.
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Execute the command.
                    try {
                        _winfo children $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        containing {
            # ATTENTION! Differently than others mustang commands, the **winfo containing** command will **always**
            #            return real addresses, even if a short address was provided as input.
            #
            #            You can always ask if an address is a short or real address with **tk get addr**.
            #            You can always translate a real address into a short address using the **tk get short**
            #            command or a short address into a real address using the **tk get real** command.
            switch -- [llength $args] {
                2   {}
                4   {
                    # '-displayof'
                    switch -- [lindex $args 0] {
                        "-displayof" {
                            set window [lindex $args 1]

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
                                            set args [lreplace $args 1 1 $w]
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _winfo containing {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        exists {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the 'window' real address.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { return 0 }
                        default { return 1 }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        interps {
            switch -- [llength $args] {
                0   {
                    # Execute the command.
                    try {
                        _winfo interps
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                2   {
                    # '-displayof'
                    switch -- [lindex $args 0] {
                        "-displayof" {
                            set window [lindex $args 1]

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
                                            set args [lreplace $args 1 1 $w]
                                        }
                                    }
                                }
                            }
                        }
                    }

                    # Execute the command.
                    try {
                        _winfo interps {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        parent {
            switch -- [llength $args] {
                1   {
                    set window $args

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
                        _winfo parent $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { parent } {
                        # Check the initial address type provided (short or real).
                        switch -- $type {
                            short {
                                if { $parent in $::ms::addr(reals) } {
                                    # 'parent' is the real address of a widget created by mustang.
                                    return $::ms::addr($parent,short)
                                } else {
                                    # 'parent' is the real address of a widget not created by mustang.
                                    return [::ms::Get_Short $parent]
                                }
                            }
                        }

                        return $parent
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        pathname {
            # ATTENTION! Differently than others mustang commands, the **winfo pathname** command will **always**
            #            return real addresses, even if a short address was provided as input.
            #
            #            You can always ask if an address is a short or real address with **tk get addr**.
            #            You can always translate a real address into a short address using the **tk get short**
            #            command or a short address into a real address using the **tk get real** command.
            switch -- [llength $args] {
                1   {}
                3   {
                    # '-displayof'
                    switch -- [lindex $args 0] {
                        "-displayof" {
                            set window [lindex $args 1]

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
                                            set args [lreplace $args 1 1 $w]
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _winfo pathname {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        fpixels -
        pixels  -
        rgb     {
            switch -- [llength $args] {
                2   {
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Execute the command.
                    try {
                        _winfo $action $w $args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        visualsavailable {}
        cells          -
        class          -
        colormapfull   -
        depth          -
        geometry       -
        height         -
        id             -
        ismapped       -
        manager        -
        name           -
        pointerx       -
        pointerxy      -
        pointery       -
        reqheight      -
        reqwidth       -
        rootx          -
        rooty          -
        screen         -
        screencells    -
        screendepth    -
        screenheight   -
        screenmmheight -
        screenmmwidth  -
        screenvisual   -
        screenwidth    -
        server         -
        toplevel       -
        viewable       -
        visual         -
        visualid       -
        vrootheight    -
        vrootwidth     -
        vrootx         -
        vrooty         -
        width          -
        x              -
        y              {}
        default { ::ms::Error "Invalid option, '$action'." $caller_info }
    }
}

#*EOF*