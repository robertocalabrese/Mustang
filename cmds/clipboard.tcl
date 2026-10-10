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

## clipboard - Manipulate the Tk clipboard.
#
#### SYNOPSIS:
#
# **clipboard** **append** ?**-displayof** *window*? ?**-type** *type*? ?**-format** *format*? ?**--**? *data*
# **clipboard** **clear** ?**-displayof** *window*?
# **clipboard** **get** ?**-displayof** *window*? ?**-type** *type*?
#
# Note: Each *window* pathname involved may be provided either as a short or as a real address.
#
#### DESCRIPTION:
#
# This command provides a Tcl interface to the Tk clipboard, which stores data for later retrieval using
# the selection mechanism (via the '**-selection CLIPBOARD**' option).
#
# In order to copy data into the clipboard, '**clipboard** **clear**' must be called, followed by a sequence
# of one or more calls to '**clipboard** **append**'.
#
# To ensure that the clipboard is updated atomically, all appends should be completed before returning to the event loop.
#
# The first argument of the **clipboard** command its called *action*, and it determines the format of the rest
# of the arguments and the behavior of the command.
#
#### COMMAND:
#
# The *clipboard* command can have any of several forms, depending on the *action* argument.
# The *action* argument is the first argument after the command itself.
# The legal forms are:
#
#   **clipboard** **append** ?**-displayof** *window*? ?**-type** *type*? ?**-format** *format*? ?**--**? *data*
#      Append *data* to the clipboard on *window*'s display in the form given by *type* with the representation given by *format*
#      and claim ownership of the clipboard on *window*'s display.
#
#      ?**-displayof** *window*?
#         If this option is omitted, the display of the application's main window (".") is used by default.
#         If this option is provided, *window* can either be a short or real address.
#
#      ?**-format** *format*?
#         The *format* argument specifies the representation that should be used to transmit the selection to the
#         requester (the second column of Table 2 of the **ICCCM**), and defaults to **STRING**.
#
#         If the *format* argument is **STRING**, the selection is transmitted as 8-bit ASCII characters.
#         If the *format* argument is **ATOM**, then the data is divided into fields separated by white space;
#         each field is converted to its atom value, and the 32-bit atom value is transmitted instead of the atom name.
#
#         The ?**-format format**? option is needed only for compatibility with clipboard requesters that do not use Tk.
#         If the Tk toolkit is being used as clipboard requester, the ?**-format format**? option is irrelevant.
#         That's because to retrieve the CLIPBOARD selection then the value is converted back to a string at the requesting end.
#
#      ?**-type** *type*?
#         Specifies the form in which the selection is to be returned (the desired 'target' for conversion,
#         in ICCCM terminology), and should be an atom name such as **STRING** or **FILE_NAME**;
#         see the Inter-Client Communication Conventions Manual for complete details.
#         All items appended to the clipboard with the same *type* must have the same *format*.
#         *type* defaults to **STRING**.
#
#      **--**
#         "--" may be specified to mark the end of options: the next argument will always be used as *data*.
#         This feature may be convenient if, for example, data starts with a "-".
#
#      *data*
#         The data to append to the clipboard.
#         For any other format, *data* is divided into fields separated by white space and each field is converted to
#         a 32-bit integer; an array of integers is transmitted to the selection requester.
#
#         Note that strings passed to '**clipboard** **append**' are concatenated before conversion, so the caller must take care
#         to ensure appropriate spacing across string boundaries.
#
#   **clipboard** **clear** ?**-displayof** *window*?
#      Claim ownership of the clipboard on window's display and removes any previous contents.
#      Returns an empty string.
#
#      ?**-displayof** *window*?
#         If this option is omitted, the display of the application's main window (".") is used by default.
#         If this option is provided, *window* can either be a short or real address.
#
#   **clipboard** **get** ?**-displayof** *window*? ?**-type** *type*?
#      Return data from the clipboard on window's display.
#
#      ?**-displayof** *window*?
#          If this option is omitted, the display of the application's main window (".") is used by default.
#          If this option is provided, *window* can either be a short or real address.
#
#      ?**-type** *type*?
#          Specifies the form in which the data is to be returned and should be an atom name such as **STRING** or **FILE_NAME**.
#          *type* defaults to **STRING**.
#
#          This command is equivalent to:
#
#             **selection get -selection CLIPBOARD**
#
#          Note that on modern X11 systems, the most useful type to retrieve for transferred strings is not **STRING**,
#          but rather **UTF8_STRING**.
package provide ::ms::clipboard 0.1

# Create the mustang **clipboard** package.
namespace eval ::ms::clipboard {}

# Rename the original Tk **clipboard** command.
rename clipboard _clipboard

# Create an alias for the mustang **clipboard** command.
interp alias {} clipboard {} ::ms::clipboard::Command

## Command
#
# Replace the Tk **clipboard** command.
#
# Where:
#
# args   Should be the arguments of the **clipboard** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::clipboard::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **clipboard** **append** ?**-displayof** *window*? ?**-type** *type*? ?**-format** *format*? ?**--**? *data*
    # **clipboard** **clear**  ?**-displayof** *window*?
    # **clipboard** **get**    ?**-displayof** *window*? ?**-type** *type*?

    # Check if 'args' is an empty string.
    switch -- $args {
        ""  { ::ms::Error "Missing action." $caller_info }
    }

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        append {
            # Synopsis:
            #
            # **clipboard** *append* *data*
            # **clipboard** *append* ?**-displayof** *window*? ?**-type** *type*? ?**-format** *format*? ?--? *data*
            switch -- [llength $args] {
                0   { ::ms::Error "Invalid number of arguments." $caller_info }
                1   {
                    # Synopsis:
                    #
                    # **clipboard** *append* *data*
                    set data $args

                    # Execute the command.
                    _clipboard append $data

                    return ""
                }
                default {
                    # Check if a '-displayof' option was provided.
                    set index [lsearch -exact $args "-displayof"]
                    switch -- $index {
                        -1      {}
                        default {
                            # Check if the '-displayof' address provided is a valid address or not.
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
                        _clipboard append {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
            }
        }
        clear {
            # Synopsis:
            #
            # **clipboard** *clear*
            # **clipboard** *clear* **-displayof** *window*
            switch -- [llength $args] {
                0   {
                    # Synopsis:
                    #
                    # **clipboard** *clear*
                    return [_clipboard clear]
                }
                2   {
                    # Synopsis:
                    #
                    # **clipboard** *clear* **-displayof** *window*

                    # Check that a '-displayof' option was provided.
                    set option [lindex $args 0]
                    switch -- $option {
                        -displayof {
                            # Check if the '-displayof' address provided is a valid address or not.
                            set addr [lindex $args $index+1]
                            set w    [::ms::Check_Pathname $addr invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                            }
                        }
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Execute the command.
                    _clipboard clear -displayof $w

                    return ""
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        get {
            # Synopsis:
            #
            # **clipboard** *get*
            # **clipboard** *get* **-displayof** *window*
            # **clipboard** *get* **-type** *type*
            # **clipboard** *get* **-displayof** *window* **-type** *type*
            switch -- [llength $args] {
                0   {
                    # Synopsis:
                    #
                    # **clipboard** *get*
                    return [_clipboard get]
                }
                2   -
                4   {
                    # Synopsis:
                    #
                    # **clipboard** *get* **-displayof** *window*
                    # **clipboard** *get* **-type** *type*
                    # **clipboard** *get* **-displayof** *window* **-type** *type*

                    # Check if a '-displayof' option was provided.
                    set index [lsearch -exact $args "-displayof"]
                    switch -- $index {
                        -1      {}
                        default {
                            # Check if the '-displayof' address provided is a valid address or not.
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
                        _clipboard get {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        default { ::ms::Error "Invalid action, '$action'." $caller_info }
    }
}

#*EOF*