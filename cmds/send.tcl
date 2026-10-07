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
## send - Execute a command in a different application
#
#### SYNOPSIS:
#
# **send** ?**-async**? ?**-displayof** *window*? ?**--**? *appName* *cmd* ?*arg*? ... ?*arg*?
#
# Note: The *window* pathname involved may be provided either as a short or as a real address.
#
#### DESCRIPTION:
#
# This command arranges for cmd (and args) to be executed in the application named by app.
# It returns the result or error from that command execution.
# *AppName* may be the name of any application whose main window is on the display containing the sender's main window;
# it need not be within the same process.
# If no *arg* arguments are present, then the *command* to be executed is contained entirely within the *cmd* argument.
# If one or more *args* are present, they are concatenated to form the *command* to be executed, just as for the **eval** command.
#
# If the initial arguments of the command begin with **-** they are treated as options.
#
# The following options are currently defined:
#
#   ?**-async**?
#      Requests asynchronous invocation.
#      In this case the send command will complete immediately without waiting for cmd to complete in the target application;
#      no result will be available and errors in the sent command will be ignored.
#      If the target application is in the same process as the sending application then the **-async** option is ignored.
#
#   ?**-displayof** *window*?
#      Specifies that the target application's main window is on the display of the window given by *window*,
#      instead of the display containing the application's main window.
#
#   ?**--**?
#      Serves no purpose except to terminate the list of options.
#      This option is needed only if app could contain a leading **-** character.
#
#### APPLICATION NAMES:
#
# The name of an application is set initially from the name of the program or script that created the application.
# You can query and change the name of an application with the tk appname command.
#
#### DISABLING SENDS:
#
# If the send command is removed from an application (e.g. with the command **rename send {}**) then the application will not respond
# to incoming send requests anymore, nor will it be able to issue outgoing requests.
# Communication can be reenabled by invoking the **tk appname** command.
#
#### SECURITY:
#
# The **send** command is potentially a serious security loophole.
# On **Unix**, any application that can connect to your **X** server can send scripts to your applications.
# These incoming scripts can use Tcl to read and write your files and invoke subprocesses under your name.
# Host-based access control such as that provided by **xhost** is particularly insecure, since it allows anyone with an account on particular
# hosts to connect to your server, and if disabled it allows anyone anywhere to connect to your server.
# In order to provide at least a small amount of security, Tk checks the access control being used by the server and rejects incoming sends
# unless (a) *xhost-style* access control is enabled (i.e. only certain hosts can establish connections) and (b) the list of enabled hosts is empty.
# This means that applications cannot connect to your server unless they use some other form of authorization such as that provide by xauth.
# Under **Windows**, send is currently disabled.
# Most of the functionality is provided by the **dde** command instead.

# Check the windowing system.
switch -- [_tk windowingsystem] {
    win32 { return }
}

package provide ::ms::send 0.1

# Create the mustang **send** package.
namespace eval ::ms::send {}

# Rename the original Tk **send** command.
rename send _send

# Create an alias for the mustang **send** command.
interp alias {} send {} ::ms::send::Command

## Command
#
# Replace the Tk **send** command.
#
# Where:
#
# args   Should be the arguments of the **send** command.
#
# Return the result or the error from the command execution.
proc ::ms::send::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **send** ?**-async**? ?**-displayof** *window*? ?**--**? *appName* *cmd* ?*arg*? ... ?*arg*?

    switch -- [llength $args] {
        0   -
        1   { ::ms::Error "Invalid number of arguments." $caller_info }
    }

    # Check if a '-displayof' option was provided.
    set index [lsearch -exact $args "-displayof"]
    switch -- $index {
        -1      {}
        default {
            # Check if the '-displayof' address provided is a short or long address.
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
        _send {*}$args
    } on error { errortext errorcode } {
        ::ms::Error "$errortext" $caller_info
    } on ok { result } {
        return $result
    }
}

#*EOF*