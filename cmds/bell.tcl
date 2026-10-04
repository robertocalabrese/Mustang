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

## bell - Ring the display bell.
#
#### SYNOPSIS:
#
# **bell**
# **bell** **-nice**
# **bell** **-displayof** *window*
# **bell** **-nice** **-displayof** *window*
#
#### DESCRIPTION:
#
# The following options are available:
#
#   ?**-displayof** *window*?
#      If this option is omitted, the display of the application's main window (".") is used by default.
#      If this option is provided, *window* can either be a short or real address.
#      The command uses the current *bell-related* settings for the display, which may be modified with programs such as **xset**.
#
#   **-nice**
#      If this option is not specified, this command resets the screen saver for the screen.
#      Some screen savers will ignore this, but others will reset so that the screen becomes visible again.
#
#### COMMAND:
#
# The *bell* command can have any of the following forms:
#
#   **bell**
#      Rings the bell of the screen where the main application (".") is displayed.
#      Returns an empty string.
#
#   **bell** **-nice**
#      Rings the display bell and reset the screen saver (if any and if supported by the screen saver).
#      Returns an empty string.
#
#   **bell** **-displayof** *window*
#      Rings the bell of the screen where *window* is displayed.
#      Returns an empty string.
#
#   **bell** **-nice** **-displayof** *window*
#      Rings the bell of the screen where *window* is displayed and reset the screen saver (if any and if supported by the screen saver).
#      Returns an empty string.
#
# The **bell** command returns an empty string.
package provide ::ms::bell 0.1

# Create the mustang **bell** package.
namespace eval ::ms::bell {}

# Rename the original Tk **bell** command.
rename bell _bell

# Create an alias for the mustang **bell** command.
interp alias {} bell {} ::ms::bell::Command

## Command
#
# Replace the Tk **bell** command.
#
# Where:
#
# args   Should be the arguments of the **bell** command.
#
# Return the empty string.
proc ::ms::bell::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **bell**
    # **bell** **-nice**
    # **bell** **-displayof** *window*
    # **bell** **-nice** **-displayof** *window*

    switch -- [llength $args] {
        0   -
        1   -
        2   -
        3   {
            # Check if a '-displayof' option was provided.
            set index [lsearch -exact $args "-displayof"]
            switch -- $index {
                -1      {}
                default {
                    # Check if the '-displayof' address is a valid address or not.
                    set addr [lindex $args $index+1]
                    set w    [::ms::Check_Pathname $addr invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                        default { set args [lreplace $args $index+1 $index+1 $w] }
                    }
                }
            }

            # Execute the command.
            try {
                _bell {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        default { ::ms::Error "Invalid number of arguments." $caller_info }
    }
}

#*EOF*