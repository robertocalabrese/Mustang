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

## lower — Change a window's position in the stacking order.
#
#### SYNOPSIS:
#
# **lower** *window* *?belowThis*?
#
# Note: *window* and *belowThis* pathnames involved may be provided either as a short or as a real address.
#
#### DESCRIPTION:
#
# If the *belowThis* argument is omitted then the command lowers window so that it is below all of its siblings in the stacking order
# (it will be obscured by any siblings that overlap it and will not obscure any siblings).
# If *belowThis* is specified then it must be the pathname of a window that is either a sibling of *window* or the descendant of a sibling of *window*.
# In this case the lower command will insert *window* into the stacking order just below *belowThis* (or the ancestor of *belowThis* that is a
# sibling of *window*); this could end up either raising or lowering window.
#
# All toplevel windows may be restacked with respect to each other, whatever their relative pathnames, but the window manager is not obligated
# to strictly honor requests to restack.
package provide ::ms::lower 0.1

# Create the mustang **lower** package.
namespace eval ::ms::lower {}

# Rename the original Tk **lower** command.
rename lower _lower

# Create an alias for the mustang **lower** command.
interp alias {} lower {} ::ms::lower::Command

## Command
#
# Replace the Tk **lower** command.
#
# Where:
#
# args   Should be the arguments of the **lower** command.
#
# Return the empty string.
proc ::ms::lower::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **lower** *window* ?*belowThis*?

    switch -- [llength $args] {
        1   {
            # Synopsis:
            #
            # **lower** *window*
            set window $args

            # Check if 'window' is a valid address or not.
            set w [::ms::Check_Pathname $window invalid]
            switch -- $w {
                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
            }

            # Execute the command.
            _lower $w

            return ""
        }
        2   {
            # Synopsis:
            #
            # **lower** *window* *belowThis*
            set window    [lindex $args 0]
            set belowThis [lindex $args 1]

            # Check if 'window' is a valid address or not.
            set w [::ms::Check_Pathname $window invalid]
            switch -- $w {
                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
            }

            # Check if 'belowThis' is a valid address or not.
            set below [::ms::Check_Pathname $belowThis invalid]
            switch -- $below {
                invalid { ::ms::Error "Invalid address, '$belowThis'." $caller_info }
            }

            # Execute the command.
            _lower $w $below

            return ""
        }
        default { ::ms::Error "Invalid number of arguments." $caller_info }
    }
}

#*EOF*