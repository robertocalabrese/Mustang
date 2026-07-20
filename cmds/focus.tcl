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
package provide ::ms::focus 0.1

# Create the mustang **focus** package.
namespace eval ::ms::focus {}

# Rename the original Tk **focus** command.
rename focus _focus

# Create an alias for the mustang **focus** command.
interp alias {} focus {} ::ms::focus::Command

## Command
#
# Replace the Tk **focus** command.
#
# Where:
#
# args   Should be the arguments of the **focus** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::focus::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    switch -- [llength $args] {
        0   { return [_focus] }
        1   {
            set window $args

            # Get the 'window' real address.
            set result [::ms::Check_Pathname $window invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                default { set w [lindex $result 0] }
            }

            # Check if 'w' is the hull of a megawidget of some kind.
            if { $w in $::ms::addr(megawidgets) } {
                set w $::ms::addr($w,widget)
            }

            # Execute the command.
            _focus $w
        }
        2   {
            set action [lindex $args 0]
            set window [lindex $args 1]

            # Get the 'window' real address.
            set result [::ms::Check_Pathname $window invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                default {
                    set w    [lindex $result 0]
                    set type [lindex $result 1]
                }
            }

            # Check the 'action' value.
            switch -- $action {
                "-displayof" -
                "-lastfor"   {
                    set focus_address [_focus $action $w]

                    # Check the initial address type provided (short or real).
                    switch -- $type {
                        short {
                            if { $focus_address in $::ms::addr(reals) } {
                                # 'focus_address' is a real address of a widget created by mustang.
                                return $::ms::addr($focus_address,short)
                            } else {
                                # 'focus_address' is a real address of a widget not created by mustang.
                                return [::ms::Get_Short $focus_address]
                            }
                        }
                        default { return $focus_address }
                    }
                }
                "-force" {
                    # Check if 'w' is the hull of a megawidget of some kind.
                    if { $w in $::ms::addr(megawidgets) } {
                        set w $::ms::addr($w,widget)
                    }

                    _focus -force $w
                }
                "-next" {
                    # Get the next address relative to 'w'.
                    set next_address [::tk_focusNext $w]

                    # Check the initial address type provided (short or real).
                    switch -- $type {
                        short {
                            if { $next_address in $::ms::addr(reals) } {
                                # 'next_address' is a real address of a widget created by mustang.
                                return $::ms::addr($next_address,short)
                            } else {
                                # 'next_address' is a real address of a widget not created by mustang.
                                return [::ms::Get_Short $next_address]
                            }
                        }
                        default { return $next_address }
                    }
                }
                "-prev" {
                    # Get the previous address relative to 'w'.
                    set prev_address [::tk_focusPrev $w]

                    # Check the initial address type provided (short or real).
                    switch -- $type {
                        short {
                            if { $prev_address in $::ms::addr(reals) } {
                                # 'prev_address' is a real address of a widget created by mustang.
                                return $::ms::addr($prev_address,short)
                            } else {
                                # 'prev_address' is a real address of a widget not created by mustang.
                                return [::ms::Get_Short $prev_address]
                            }
                        }
                        default { return $prev_address }
                    }
                }
                default { ::ms::Error "Wrong option or option with no value." $caller_info }
            }
        }
        default { ::ms::Error "Invalid number of arguments." $caller_info }
    }

    return ""
}

###########################
##                       ##
##     TK PROCEDURES     ##
##                       ##
###########################

# Note: The following procedure were inspired by their Tk equivalent.
#       The procedures have been slighty modified to work with mustang.
#       All credits goes to the original author/s.

## Implicit (from the Tk 'focus.tcl' file, '::tk_focusFollowsMouse')
#
# Enforce the **implicit** focus model.
#
# Where:
#
# w        Should be the widget real address involved.
#
# detail   The *detail* field from the event.
#          For **FocusIn** and **FocusOut** events, the string can be one of the following:
#
#             NotifyAncestor
#             NotifyNonlinearVirtual
#             NotifyDetailNone
#             NotifyPointer
#             NotifyInferior
#             NotifyPointerRoot
#             NotifyNonlinear
#             NotifyVirtual
#
# It doesn't return anything.
proc ::ms::focus::Implicit { w detail } {
    switch -- $detail {
        NotifyAncestor  -
        NotifyNonlinear -
        NotifyInferior  {
            switch -- [::tk::FocusOK $w] {
                1   { _focus $w }
            }
        }
    }

    return ""
}

## tk_focusNext (from the Tk 'focus.tcl' file)
#
# This procedure returns the name of the next window after 'w' in 'focus order'
# (the window that should receive the focus next if Tab is typed in w).
# 'Next' is defined by a pre-order search of a top-level and its non-top-level
# descendants, with the stacking order determining the order of siblings.
# The **-takefocus** options on windows determine whether or not they should be skipped.
#
# Where:
#
# w   Should be the widget short or real address involved.
#
# Return the real address of the 'next' window after 'w' that can take the keyboard focus.
proc ::tk_focusNext { w } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Get the 'w' real address.
    set result [::ms::Check_Pathname $w invalid]
    switch -- $result {
        invalid { ::ms::Error "Invalid address, '$w'." $caller_info }
        default { set w [lindex $result 0] }
    }

    # Original procedure.
    set cur $w
    while { 1 } {
        # Descend to just before the first child of the current widget.
        set parent   $cur
        set children [_winfo children $cur]

        set i -1

        # Look for the next sibling that isn't a top-level.
        while { 1 } {
            incr i
            if { $i < [llength $children] } {
                set cur [lindex $children $i]
                if { [_winfo toplevel $cur] eq $cur } {
                    continue
                } else {
                    break
                }
            }

            # No more siblings, so go to the current widget's parent.
            # If it's a top-level, break out of the loop, otherwise
            # look for its next sibling.

            set cur $parent
            if { [_winfo toplevel $cur] eq $cur } {
                break
            }
            set parent   [_winfo parent $parent]
            set children [_winfo children $parent]

            set i [lsearch -exact $children $cur]
        }

        if { $w eq $cur || [::tk::FocusOK $cur] } {
            return $cur
        }
    }
}

#*EOF*