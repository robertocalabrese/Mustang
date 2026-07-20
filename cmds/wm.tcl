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
package provide ::ms::wm 0.1

# Create the mustang **wm** package.
namespace eval ::ms::wm {}

# Rename the original Tk **wm** command.
rename wm _wm

# Create an alias for the mustang **wm** command.
interp alias {} wm {} ::ms::wm::Command

## Command
#
# Replace the Tk **wm** command.
#
# Where:
#
# args   Should be the arguments of the **wm** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::wm::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        colormapwindows {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the real address associated with 'window'.
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
                        _wm colormapwindows $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        # Check the initial address type provided (short or real).
                        switch -- $type {
                            short {
                                set short_result [list ]
                                foreach w $result {
                                    if { $w in $::ms::addr(reals) } {
                                        # 'w' is the real address of a widget created by mustang.
                                        lappend short_result $::ms::addr($w,short)
                                    } else {
                                        # 'w' is the real address of a widget not created by mustang.
                                        lappend short_result [::ms::Get_Short $w]
                                    }
                                }

                                # Remove any doubles.
                                set result [lsort -unique $short_result]
                            }
                        }

                        return $result
                    }
                }
                2   {
                    set window     [lindex $args 0]
                    set windowList [lindex $args 1]

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Iterate the 'windowList' list to substitute any window short address with their long counterpart.
                    set real_windowList [list ]
                    foreach window $windowList {
                        # Get the real address associated with 'window'.
                        set result [::ms::Check_Pathname $window invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            default { lappend real_windowList [lindex $result 0] }
                        }
                    }

                    # Execute the command.
                    try {
                        _wm colormapwindows $w $real_windowList
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        group      -
        iconwindow -
        transient  {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the real address associated with 'window'.
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
                        _wm $action $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { pathname } {
                        switch -- $pathname {
                            ""      { return "" }
                            default {
                                # Check the initial address type provided (short or real).
                                switch -- $type {
                                    short {
                                        if { $pathname in $::ms::addr(reals) } {
                                            # 'pathname' is the real address of a widget created by mustang.
                                            return $::ms::addr($pathname,short)
                                        } else {
                                            # 'pathname' is the real address of a widget not created by mustang.
                                            return [::ms::Get_Short $pathname]
                                        }
                                    }
                                }

                                return $pathname
                            }
                        }
                    }
                }
                2   {
                    set window   [lindex $args 0]
                    set pathname [lindex $args 1]

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    switch -- $pathname {
                        ""      {}
                        default {
                            # Get the real address associated with 'pathname'.
                            set result [::ms::Check_Pathname $pathname invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid address, '$pathname'." $caller_info }
                                default { set pathname [lindex $result 0] }
                            }
                        }
                    }

                    # Execute the command.
                    try {
                        _wm $action $w $pathname
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        manage {}
        stackorder {}
        aspect           -
        attribute        -
        attributes       -
        client           -
        command          -
        deiconify        -
        focusmodel       -
        forget           -
        frame            -
        geometry         -
        grid             -
        iconbitmap       -
        iconbitmap       -
        iconify          -
        iconmask         -
        iconname         -
        iconphoto        -
        iconposition     -
        maxsize          -
        minsize          -
        overrideredirect -
        positionfrom     -
        protocol         -
        resizable        -
        sizefrom         -
        state            -
        title            -
        withdraw         {}
        default { ::ms::Error "Invalid option, '$action'." $caller_info }
    }
}

#*EOF*