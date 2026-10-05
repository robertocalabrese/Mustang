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

##  option — Add/retrieve window options to/from the option database
#
#### SYNOPSIS:
#
# **option** **add** *pattern* *value* ?*priority*?
# **option** **clear**
# **option** **get** *window* *name* *class*
# **option** **readfile** *fileName* ?*priority*?
#
# Note: the *window* pathname involved may be provided either as a short or as a real address.
#
#### DESCRIPTION:
#
# The option command allows you to add entries to the Tk option database or to retrieve options from the database.
#
#### COMMAND:
#
# The grab command can take any of the following forms:
#
#   **option** **add** *pattern* *value* ?*priority*?
#      The **option add** command adds a new option to the database.
#      *Pattern* contains the option being specified, and consists of names and/or classes separated by asterisks or dots, in the usual **X** format
#      (see **PATTERN FORMAT** below).
#      *Value* contains a text string to associate with pattern; this is the value that will be returned in calls to **Tk_GetOption** or by
#      invocations of the option get command.
#      If *priority* is specified, it indicates the priority level for this option (see **PRIORITY FORMAT** below).
#      *Priority* defaults to **interactive**.
#
#      This command always returns an empty string.
#
#   **option** **clear**
#      The **option clear** command clears the option database.
#      Default options (from the **RESOURCE_MANAGER** property or the **.Xdefaults** file) will be reloaded automatically the next time an option
#      is added to the database or removed from it.
#
#      This command always returns an empty string.
#
#   **option** **get** *window* *name* *class*
#      The **option get** command returns the value of the option specified for *window* under *name* and *class*.
#
#      If several entries in the option database match *window*, *name*, and *class*, then the command returns whichever was created with highest priority level.
#      If there are several matching entries at the same priority level, then it returns whichever entry was most recently entered into the option database.
#      If there are no matching entries, then the empty string is returned.
#
#   **option** **readfile** *fileName* ?*priority*?
#      The ** option readfile** command reads *fileName*, which should have the standard format for an **X** resource database such as **.Xdefaults**,
#      and adds all the options specified in that file to the option database.
#      If *priority* is specified, it indicates the priority level at which to enter the options (see **PRIORITY FORMAT** below).
#      *Priority* defaults to **interactive**.
#
#      The file is read through a channel which is in **utf-8** encoding, invalid byte sequences are automatically converted to valid ones.
#      This means that encodings like **ISO 8859-1** or **cp1252** with high probability will work as well, but this cannot be guaranteed.
#      This cannot be changed and setting the **encoding system** has no effect.
#
#      This command always returns an empty string.
#
#### PATTERN FORMAT:
#
# Patterns consist of a sequence of words separated by either periods, ".", or asterisks "*".
# The overall pattern may also be optionally preceded by an asterisk.
#
# Each word in the pattern conventionally starts with either an upper-case letter (in which case it denotes the class of either a widget or an option) or
# any other character, when it denotes the name of a widget or option.
# The last word in the pattern always indicates the option; the preceding ones constrain which widgets that option will be looked for in.
#
# When two words are separated by a period, the latter widget must be a direct child of the former (or the option must apply to only the indicated widgets).
# When two words are separated by an asterisk, any depth of widgets may lie between the former and latter widgets (and the option applies to all widgets that
# are children of the former widget).
#
# If the overall pattern is preceded by an asterisk, then the overall pattern applies anywhere it can throughout the whole widget hierarchy.
# Otherwise the first word of the pattern is matched against the name and class of the "." toplevel, which are usually set by options to wish.
#
#### PRIORITY FORMAT:
#
# The *priority* arguments to the option command are normally specified symbolically using one of the following values:
#
#   widgetDefault
#      Level 20. Used for default values *hard-coded* into widgets.
#
#   startupFile
#      Level 40. Used for options specified in *application-specific* startup files.
#
#   userDefault
#      Level 60. Used for options specified in *user-specific* defaults files, such as **.Xdefaults**, resource databases loaded into the **X** server,
#      or *user-specific* startup files.
#
#   interactive
#      Level 80. Used for options specified interactively after the application starts running.
#      If *priority* is not specified, it defaults to this level.
#
# Any of the above keywords may be abbreviated. In addition, priorities may be specified numerically using integers between **0** and **100**, inclusive.
# The numeric form is probably a bad idea except for new priority levels other than the ones given above.
#
#### EXAMPLES:
#
# Instruct every button in the application to have red text on it unless explicitly overridden,
# by setting the foreground for the Button class (note that on some platforms the option is ignored):
#
#   option add *Button.foreground red startupFile
#
# Allow users to control what happens in an entry widget when the Return key is pressed by specifying a script in the option database and
# add a default option for that which rings the bell:
#
#   entry .e
#   bind .e <Return> [option get .e returnCommand Command]
#   option add *.e.returnCommand bell widgetDefault
package provide ::ms::option 0.1

# Create the mustang **option** package.
namespace eval ::ms::option {}

# Rename the original Tk **option** command.
rename option _option

# Create an alias for the mustang **option** command.
interp alias {} option {} ::ms::option::Command

## Command
#
# Replace the Tk **option** command.
#
# Where:
#
# args   Should be the arguments of the **option** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::option::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **option** **add** *pattern* *value* ?*priority*?
    # **option** **clear**
    # **option** **get** *window* *name* *class*
    # **option** **readfile** *fileName* ?*priority*?

    # Separate the 'action' from the actual 'args'.
    set action [lindex   $args 0]
    set args   [lreplace $args 0 0]
    switch -- $action {
        add {
            # Synopsis:
            #
            # **option** **add** *pattern* *value*
            # **option** **add** *pattern* *value* *priority*
            switch -- [llength $args] {
                2   {
                    # Synopsis:
                    #
                    # **option** **add** *pattern* *value*
                    set pattern [lindex $args 0]
                    set value   [lindex $args 1]

                    # Execute the command.
                    try {
                        _option add $pattern $value
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                3   {
                    # Synopsis:
                    #
                    # **option** **add** *pattern* *value* *priority*
                    set pattern  [lindex $args 0]
                    set value    [lindex $args 1]
                    set priority [lindex $args 2]

                    # Execute the command.
                    try {
                        _option add $pattern $value $priority
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        clear {
            # Synopsis:
            #
            # **option** **clear**
            switch -- [llength $args] {
                0   {
                    # Synopsis:
                    #
                    # **option** **clear**

                    # Execute the command.
                    _option clear

                    return ""
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        get {
            # Synopsis:
            #
            # **option** **get** *window* *name* *class*
            switch -- [llength $args] {
                3   {
                    # Synopsis:
                    #
                    # **option** **get** *window* *name* *class*
                    set window [lindex $args 0]
                    set name   [lindex $args 1]
                    set class  [lindex $args 2]

                    # Check if 'window' is a valid address or not.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Check if 'w' is a megawidget.
                    if { $w in $::ms::addr(megawidgets) } {
                        set w $::ms::addr($w,widget)
                    }

                    try {
                        _option get $w $name $class
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        readfile {
            # Synopsis:
            #
            # **option** **readfile** *fileName*
            # **option** **readfile** *fileName* *priority*
            switch -- [llength $args] {
                1   {
                    # Synopsis:
                    #
                    # **option** **readfile** *fileName*
                    set filename $args

                    # Execute the command.
                    try {
                        _option readfile $filename
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                2   {
                    # Synopsis:
                    #
                    # **option** **readfile** *fileName* *priority*
                    set filename [lindex $args 0]
                    set priority [lindex $args 1]

                    # Execute the command.
                    try {
                        _option readfile $filename $priority
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        default { ::ms::Error "Invalid action, '$action'." $caller_info }
    }
}

#*EOF*