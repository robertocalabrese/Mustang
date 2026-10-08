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

## selection - Manipulate the X selection
#
#### SYNOPSIS:
#
# **selection** **clear** ?**-displayof** *window*? ?**-selection** *selection*?
# **selection** **get** ?**-displayof** *window*? ?**-selection** *selection*? ?**-type** *type*?
# **selection** **handle** ?**-selection** *selection*? ?**-type** *type*? ?**-format** *format*? *window* *command*
# **selection** **own** ?**short**? ?**-displayof** *window*? ?**-selection** *selection*?
# **selection** **own** ?-command command? ?**-selection** *selection*? *window*
#
# Note: Each *window* pathname involved may be provided either as a short or as a real address.
#
#### DESCRIPTION:
#
# This command provides a Tcl interface to the X selection mechanism and implements the full selection functionality described
# in the X Inter-Client Communication Conventions Manual (ICCCM).
#
# Note that for management of the **CLIPBOARD** selection (see below), the **clipboard** command may also be used.
#
#### COMMAND:
#
# The *selection* command can have any of several forms, depending on the *action* argument.
# The *action* argument is the first argument after the command itself.
# The legal forms are:
#
#   **selection** **clear** ?**-displayof** *window*? ?**-selection** *selection*?
#      If *selection* exists anywhere on *window*'s display, clear it so that no window owns the selection anymore.
#      *Selection* specifies the X selection that should be cleared, and should be an atom name such as **PRIMARY** or **CLIPBOARD**;
#      see the Inter-Client Communication Conventions Manual for complete details.
#      *Selection* defaults to **PRIMARY** and window defaults to “.”.
#      Returns an empty string.
#
#   **selection** **get** ?**-displayof** *window*? ?**-selection** *selection*? ?**-type** *type*?
#      Retrieves the value of selection from *window*'s display and returns it as a result.
#      *Selection* defaults to **PRIMARY** and window defaults to '.'.
#      *Type* specifies the form in which the selection is to be returned (the desired *target* for conversion, in ICCCM terminology),
#      and should be an atom name such as **STRING** or **FILE_NAME**; see the Inter-Client Communication Conventions Manual
#      for complete details. *Type* defaults to **STRING**.
#
#      The selection owner may choose to return the selection in any of several different representation formats, such as **STRING**,
#      **UTF8_STRING**, **ATOM**, **INTEGER**, etc. (this format is different than the selection type; see the ICCCM for all the
#      confusing details).
#      If the selection is returned in a non-string format, such as **INTEGER** or **ATOM**, the selection command converts it to
#      string format as a collection of fields separated by spaces: atoms are converted to their textual names, and anything else
#      is converted to hexadecimal integers.
#      Note that **selection get** does not retrieve the selection in the UTF8_STRING format unless told to.
#
#   **selection** **handle** ?**-selection** *selection*? ?**-type** *type*? ?**-format** *format*? *window* *command*
#      Creates a handler for selection requests, such that command will be executed whenever selection s is owned by *window*
#      and someone attempts to retrieve it in the form given by type *type* (e.g. *type* is specified in the **selection get** command).
#      *Selection* defaults to **PRIMARY**, *type* defaults to **STRING**, and *format* defaults to **STRING**.
#      If *command* is an empty string then any existing handler for *window*, *type*, and *selection* is removed.
#      Note that when the *selection* is handled as type **STRING** it is also automatically handled as *type* **UTF8_STRING** as well.
#
#      When *selection* is requested, *window* is the selection owner, and *type* is the requested type, *command* will be executed as
#      a Tcl command with two additional numbers appended to it (with space separators).
#      The two additional numbers are *offset* and *maxChars*: *offset* specifies a starting character position in the selection
#      and *maxChars* gives the maximum number of characters to retrieve.
#      The *command* should return a value consisting of at most *maxChars* of the *selection*, starting at position *offset*.
#      For very large selections (larger than *maxChars*) the *selection* will be retrieved using several invocations of *command*
#      with increasing *offset* values.
#      If *command* returns a string whose length is less than *maxChars*, the return value is assumed to include all of the remainder
#      of the *selection*; if the length of *command*'s result is equal to *maxChars* then *command* will be invoked again,
#      until it eventually returns a result shorter than *maxChars*.
#      The value of *maxChars* will always be relatively large (thousands of characters).
#
#      If *command* returns an error then the *selection* retrieval is rejected just as if the *selection* did not exist at all.
#
#      The *format* argument specifies the representation that should be used to transmit the selection to the requester (the second
#      column of Table 2 of the ICCCM), and defaults to **STRING**.
#      If *format* is **STRING**, the *selection* is transmitted as 8-bit ASCII characters (i.e. just in the form returned by command,
#      in the **system encoding**; the **UTF8_STRING** format always uses **UTF-8** as its encoding).
#      If *format* is **ATOM**, then the return value from *command* is divided into fields separated by white space;
#      each field is converted to its atom value, and the 32-bit atom value is transmitted instead of the atom name.
#      For any other *format*, the return value from *command* is divided into fields separated by white space and each field is
#      converted to a 32-bit integer; an array of integers is transmitted to the selection requester.
#
#      The *format* argument is needed only for compatibility with selection requesters that do not use Tk.
#      If Tk is being used to retrieve the *selection* then the value is converted back to a string at the requesting end,
#      so format is irrelevant.
#
#   **selection** **own** ?**short**? ?**-displayof** *window*? ?**-selection** *selection*?
#      Returns the pathname of the window in this application that owns *selection* on the display containing *window*,
#      or an empty string if no window in this application owns the *selection*.
#
#      If the *short* option is provided the address returned will be a short address, otherwise it will be a real address.
#      If provided, the *short* option must be located just after the *own* action.
#
#      *Selection* defaults to **PRIMARY** and window defaults to '.'.
#
#   **selection** **own** ?-command command? ?**-selection** *selection*? *window*
#      *Window* will become the new owner of *selection* on *window*'s display, returning an empty string as result.
#      The existing owner, if any, is notified that it has lost the selection.
#      If *command* is specified, it is a Tcl script to execute when some other window claims ownership of the *selection* away from *window*.
#      *Selection* defaults to **PRIMARY**.
#
#### WIDGET FACILITIES:
#
# The text, entry, listbox and spinbox widgets have the option **-exportselection**.
# If a widget has this option set to boolean **true**, then (in an unsafe interpreter) a selection made in the widget is automatically
# written to the **PRIMARY** selection.
#
# A **GUI** event, for example **PasteSelection**, can copy the PRIMARY selection to certain widgets.
# This copy is implemented by a widget binding to the event.
# The binding script makes appropriate calls to the selection command.
#
#### PORTABILITY ISSUES:
#
# On **X11**, the **PRIMARY** selection is a system-wide feature of the **X** server, allowing communication between different processes
# that are **X11** clients.
#
# On **Windows**, the **PRIMARY** selection is not provided by the system, but only by Tk, and so it is shared only between windows
# of a parent interpreter and its child interpreters.
# It is not shared between interpreters in different processes or different threads.
# Each parent interpreter has a separate **PRIMARY** selection that is shared only with its child interpreters which are not
# safe interpreters.
#
#### SECURITY:
#
# A safe interpreter cannot read from the **PRIMARY** selection because its selection command is hidden.
# For this reason the **PRIMARY** selection cannot be written to the Tk widgets of a safe interpreter.
#
# A Tk widget can have its option **-exportselection** set to boolean true, but in a safe interpreter this option has no effect: writing
# from the widget to the **PRIMARY** selection is disabled.
#
# These are security features.
# A safe interpreter may run untrusted code, and it is a security risk if this untrusted code can read or write the **PRIMARY**
# selection used by other interpreters.
package provide ::ms::selection 0.1

# Create the mustang **selection** package.
namespace eval ::ms::selection {}

# Rename the original Tk **selection** command.
rename selection _selection

# Create an alias for the mustang **selection** command.
interp alias {} selection {} ::ms::selection::Command

## Command
#
# Replace the Tk **selection** command.
#
# Where:
#
# args   Should be the arguments of the **selection** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::selection::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **selection** **clear** ?**-displayof** *window*? ?**-selection** *selection*?
    # **selection** **get** ?**-displayof** *window*? ?**-selection** *selection*? ?**-type** *type*?
    # **selection** **handle** ?**-selection** *selection*? ?**-type** *type*? ?**-format** *format*? *window* *command*
    # **selection** **own** ?**-displayof** *window*? ?**-selection** *selection*?
    # **selection** **own** ?-command command? ?**-selection** *selection*? *window*

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        clear {
            # Synopsis:
            #
            # **selection** **clear**
            #
            # **selection** **clear** **-displayof** *window*
            # **selection** **clear** **-selection** *selection*
            #
            # **selection** **clear** **-displayof** *window* **-selection** *selection*
            switch -- [llength $args] {
                0   {
                    # Synopsis:
                    #
                    # **selection** **clear**

                    # Execute the command.
                    _selection clear

                    return ""
                }
                2   -
                4   {
                    # Synopsis:
                    #
                    # **selection** **clear** **-displayof** *window*
                    # **selection** **clear** **-selection** *selection*
                    # **selection** **clear** **-displayof** *window* **-selection** *selection*

                    # Check if a '-displayof' option was provided.
                    set index [lsearch -exact $args "-displayof"]
                    switch -- $index {
                        -1      {}
                        default {
                            # Check if the '-displayof' address provided is a short or real address.
                            set addr [lindex $args $index+1]

                            # Check if 'addr' is a valid address or not.
                            set w [::ms::Check_Pathname $addr invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                                default { set args [lreplace $args $index+1 $index+1 $w] }
                            }
                        }
                    }

                    # Execute the command.
                    _selection clear {*}$args

                    return ""
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        get {
            # Synopsis:
            #
            # **selection** **get**
            #
            # **selection** **get** **-displayof** *window*
            # **selection** **get** **-selection** *selection*
            # **selection** **get** **-type** *type*
            #
            # **selection** **get** **-displayof** *window* **-selection** *selection*
            # **selection** **get** **-displayof** *window* **-type** *type*
            # **selection** **get** **-selection** *selection* **-type** *type*
            #
            # **selection** **get** **-displayof** *window* **-selection** *selection* **-type** *type*
            switch -- [llength $args] {
                0   {
                    # Synopsis:
                    #
                    # **selection** **get**

                    # Execute the command.
                    return [_selection get]
                }
                2   -
                4   -
                6   {
                    # Synopsis:
                    #
                    # **selection** **get** **-displayof** *window*
                    # **selection** **get** **-selection** *selection*
                    # **selection** **get** **-type** *type*
                    #
                    # **selection** **get** **-displayof** *window* **-selection** *selection*
                    # **selection** **get** **-displayof** *window* **-type** *type*
                    # **selection** **get** **-selection** *selection* **-type** *type*
                    #
                    # **selection** **get** **-displayof** *window* **-selection** *selection* **-type** *type*

                    # Check if a '-displayof' option was provided.
                    set index [lsearch -exact $args "-displayof"]
                    switch -- $index {
                        -1      {}
                        default {
                            # Check if the '-displayof' address provided is a short or real address.
                            set addr [lindex $args $index+1]

                            # Check if 'addr' is a valid address or not.
                            set w [::ms::Check_Pathname $addr invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                                default { set args [lreplace $args $index+1 $index+1 $w] }
                            }
                        }
                    }

                    # Execute the command.
                    return [_selection get {*}$args]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        handle {
            # Synopsis:
            #
            # **selection** **handle** *window* *command*
            #
            # **selection** **handle** ?**-selection** *selection*? *window* *command*
            # **selection** **handle** ?**-type** *type*? *window* *command*
            # **selection** **handle** ?**-format** *format*? *window* *command*
            #
            # **selection** **handle** ?**-selection** *selection*? ?**-type** *type*? *window* *command*
            # **selection** **handle** ?**-selection** *selection*? ?**-format** *format*? *window* *command*
            # **selection** **handle** ?**-type** *type*? ?**-format** *format*? *window* *command*
            #
            # **selection** **handle** ?**-selection** *selection*? ?**-type** *type*? ?**-format** *format*? *window* *command*
            switch -- [llength $args] {
                2   {
                    # Synopsis:
                    #
                    # **selection** **handle** *window* *command*
                    set window  [lindex $args 0]
                    set command [lindex $args 1]

                    # Check if 'window' is a valid address or not.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    return [_selection handle $w $command]
                }
                4   -
                6   -
                8   {
                    # Synopsis:
                    #
                    # **selection** **handle** ?**-selection** *selection*? ?**-type** *type*? ?**-format** *format*? *window* *command*
                    set window  [lindex  $args end-1]
                    set command [lindex  $args end]
                    set args    [lremove $args end-1 end]

                    # Check if 'window' is a valid address or not.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _selection handle {*}$args $w $command
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        own {
            # Synopsis:
            #
            # **selection** **own**
            # **selection** **own** **-displayof** *window*
            # **selection** **own** **-selection** *selection*
            # **selection** **own** **-displayof** *window* **-selection** *selection*
            #
            # **selection** **own** **short**
            # **selection** **own** **short** **-displayof** *window*
            # **selection** **own** **short** **-selection** *selection*
            # **selection** **own** **short** **-displayof** *window* **-selection** *selection*
            #
            # **selection** **own** *window*
            # **selection** **own** **-command** *command* *window*
            # **selection** **own** **-selection** *selection* *window*
            # **selection** **own** **-command** *command* **-selection** *selection* *window*
            switch -- [llength $args] {
                0   {
                    # Synopsis:
                    #
                    # **selection** **own**

                    # Execute the command.
                    try {
                        _selection own
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { addr } {
                        return $addr
                    }
                }
                1   {
                    # Synopsis:
                    #
                    # **selection** **own** **short**
                    # **selection** **own** *window*

                    # Check if 'args' is the short option.
                    switch -- $args {
                        short {
                            # Synopsis:
                            #
                            # **selection** **own** **short**

                            # Execute the command.
                            try {
                                _selection own
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { addr } {
                                # Check if exists a short address for 'addr'.
                                switch -- [info exists ::ms::addr($addr,short)] {
                                    0   { return $addr }
                                    1   { return $::ms::addr($addr,short) }
                                }
                            }
                        }
                        default {
                            # Synopsis:
                            #
                            # **selection** **own** *window*
                            set window $args

                            # Check if 'window' is a valid address or not.
                            set w [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }

                            # Execute the command.
                            try {
                                _selection own $w
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok {} {
                                return ""
                            }
                        }
                    }
                }
                2   -
                4   {
                    # Synopsis:
                    #
                    # **selection** **own** **-displayof** *window*
                    # **selection** **own** **-selection** *selection*
                    # **selection** **own** **-displayof** *window* **-selection** *selection*

                    # Check if a '-displayof' option was provided.
                    set index [lsearch -exact $args "-displayof"]
                    switch -- $index {
                        -1      {}
                        default {
                            # Check if the '-displayof' address provided is a short or real address.
                            set addr [lindex $args $index+1]

                            # Check if 'addr' is a valid address or not.
                            set w [::ms::Check_Pathname $addr invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                                default { set args [lreplace $args $index+1 $index+1 $w] }
                            }
                        }
                    }

                    # Execute the command.
                    try {
                        _selection own {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                3   -
                5   {
                    # Synopsis:
                    #
                    # **selection** **own** **short** **-displayof** *window*
                    # **selection** **own** **short** **-selection** *selection*
                    # **selection** **own** **short** **-displayof** *window* **-selection** *selection*
                    #
                    # **selection** **own** **-command** *command* *window*
                    # **selection** **own** **-selection** *selection* *window*
                    # **selection** **own** **-command** *command* **-selection** *selection* *window*
                    switch -- [lindex $args 0] {
                        short {
                            # Synopsis:
                            #
                            # **selection** **own** **short** **-displayof** *window*
                            # **selection** **own** **short** **-selection** *selection*
                            # **selection** **own** **short** **-displayof** *window* **-selection** *selection*
                            set args [lremove $args 0]

                            # Check if a '-displayof' option was provided.
                            set index [lsearch -exact $args "-displayof"]
                            switch -- $index {
                                -1      {}
                                default {
                                    # Check if the '-displayof' address provided is a short or real address.
                                    set addr [lindex $args $index+1]

                                    # Check if 'addr' is a valid address or not.
                                    set w [::ms::Check_Pathname $addr invalid]
                                    switch -- $w {
                                        invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                                        default { set args [lreplace $args $index+1 $index+1 $w] }
                                    }
                                }
                            }

                            # Execute the command.
                            try {
                                _selection own {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { addr } {
                                # Check if exists a short address for 'addr'.
                                switch -- [info exists ::ms::addr($addr,short)] {
                                    0   { return $addr }
                                    1   { return $::ms::addr($addr,short) }
                                }
                            }
                        }
                        default {
                            # Synopsis:
                            #
                            # **selection** **own** **-command** *command* *window*
                            # **selection** **own** **-selection** *selection* *window*
                            # **selection** **own** **-command** *command* **-selection** *selection* *window*
                            set window [lindex  $args end]
                            set args   [lremove $args end]

                            # Check if 'window' is a valid address or not.
                            set w [::ms::Check_Pathname $window invalid]
                            switch -- $w {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            }

                            # Execute the command.
                            try {
                                _selection own {*}$args $w
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok {} {
                                return ""
                            }
                        }
                    }
                }
            }
        }
        default { ::ms::Error "Invalid number of arguments." $caller_info }
    }
}

#*EOF*