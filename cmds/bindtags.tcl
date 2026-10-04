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

## bindtags - Determine which bindings apply to a window, and order of evaluation.
#
#### SYNOPSIS:
#
# **bindtags** ?**short**? *window*
# **bindtags** *window* *taglist*
#
#### DESCRIPTION:
#
# When a binding is created with the **[bind](/wiki/commands/bind.md)** command, it is associated either
# with a particular window such as **.a.b.c**, a class name such as **Button**, the keyword **all**,
# or any other string. All of these forms are called binding tags.
#
# Each window contains a list of binding tags that determine how events are processed for the window.
# When an event occurs in a window, it is applied to each of the window's tags in order: for each tag,
# the most specific binding that matches the given tag and event is executed.
#
# The **bindtags** command allows the binding tags for a window to be read and modified.
#
# See the **[bind](/wiki/commands/bind.md)** command for more information on the matching process.
#
# The following options are available:
#
#   *window*
#       It's the window address that will be associated with the binding tags.
#       It can either be a short or real address.
#
#   ?**short**?
#       Indicates if the taglist addresses returned should be short addresses (if the option *short* is present) or real addresses (if its not).
#
#   ?*taglist*?
#       If the *taglist* argument is specified to **bindtags**, then it must be a proper list;
#       the tags for window are changed to the elements of the list.
#       The elements of *taglist* may be arbitrary strings; however, any tag starting with a dot is treated
#       as a window address (either a short or real one); if no window by that name exists at the time an event is processed,
#       then the tag is ignored for that event.
#       The order of the elements in *tagList* determines the order in which binding scripts
#       are executed in response to events.
#
#       For example, the next command reverses the order in which the binding scripts will be evaluated for
#       a button named **.b** so that the **all** bindings are invoked first, following by the bindings for
#       the button's toplevel ("."), followed by the class bindings (**Button**), followed by the bindings for **.b**.
#
#          **bindtags .b { all . Button .b }**
#
#       If *taglist* is an empty list then the binding tags for *window* are returned to the default state described above.
#
#       By default, each window has four binding tags consisting of the name of the window,
#       the window's class name, the name of the window's nearest toplevel ancestor, and all, in that order.
#       Toplevel windows have only three tags by default, since the toplevel name is the same as that of the window.
#
#       If **bindtags** is invoked with only one argument, then the current set of binding tags for window
#       is returned as a list.
#       The **bindtags** command may be used to introduce arbitrary additional binding tags for a *window*,
#       or to remove standard tags. For example, the command:
#
#          **bindtags .b { .b TrickyButton . all }**
#
#       replaces the **Button** tag for **.b** with **TrickyButton**.
#
#       This means that the default widget bindings for buttons, which are associated with the **Button** tag,
#       will no longer apply to **.b**, but any bindings associated with **TrickyButton**
#       (perhaps some new button behavior) will apply.
#
#### COMMAND:
#
# The *bindtags* command can have any of the following forms:
#
#   **bindtags** ?**short**? *window*
#      Return the taglist associated with the *window* address.
#
#      If the *short* option is provided the taglist addresses returned will be short addresses, otherwise they will be real addresses.
#      If provided, the *short* option must be located just after the *bindtags* command.
#
#   **bindtags** *window* *taglist*
#      Set the bindtags for the *window* address as *taglist*.
package provide ::ms::bindtags 0.1

# Create the mustang **bindtags** package.
namespace eval ::ms::bindtags {}

# Rename the original Tk **bindtags** command.
rename bindtags _bindtags

# Create an alias for the mustang **bindtags** command.
interp alias {} bindtags {} ::ms::bindtags::Command

## Command
#
# Replace the Tk **bindtags** command.
#
# Where:
#
# args   Should be the arguments of the **bindtags** command.
#
# Depending on the number of arguments provided, the return value/s may vary.
proc ::ms::bindtags::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **bindtags** ?**short**? *window*
    # **bindtags** *window* *taglist*

    switch -- [llength $args] {
        1   {
            # Synopsis:
            #
            # **bindtags** ?**short**? *window*
            switch -- [llength $args] {
                1   {
                    set short 0
                    set addr  $args
                }
                2   {
                    set option [lindex $args 0]
                    set addr  [lindex $args 1]

                    # Check the 'short' option.
                    switch -- $option {
                        short   { set short 1 }
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check if 'addr' is a valid address or not.
            set w [::ms::Check_Pathname $addr invalid]
            switch -- $w {
                invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                default {
                    # Check if 'w' is a megawidget address.
                    if { $w in $::ms::addr(megawidgets) } {
                        set taglist [_bindtags $::ms::addr($w,widget)]
                    } else {
                        set taglist [_bindtags $w]
                    }
                }
            }

            # Check the 'short' option.
            switch -- $short {
                0   { return $taglist }
                1   {
                    set short_taglist [list ]
                    foreach w $taglist {
                        # Check if exists a short address for 'w'.
                        switch -- [info exists ::ms::addr($w,short)] {
                            0   { lappend short_taglist $w }
                            1   { lappend short_taglist $::ms::addr($w,short) }
                        }
                    }

                    return $short_taglist
                }
            }
        }
        2   {
            # Synopsis:
            #
            # **bindtags** *window* *taglist*
            set addr    [lindex $args 0]
            set taglist [lindex $args 1]

            # Check if 'addr' is a valid address or not.
            set w [::ms::Check_Pathname $addr invalid]
            switch -- $w {
                invalid { ::ms::Error "Invalid address, '$addr'." $caller_info }
                default {
                    # Check if 'w' is a megawidget address.
                    if { $w in $::ms::addr(megawidgets) } {
                        set w $::ms::addr($w,widget)
                    }
                }
            }

            # Convert any short address present in 'taglist'.
            set new_taglist [list ]
            foreach tag $taglist {
                # Check if 'tag' is a valid address or just a tag.
                set addr [::ms::Check_Pathname $tag invalid]
                switch -- $result {
                    invalid { lappend new_taglist $tag }
                    default { lappend new_taglist $addr }
                }
            }

            # Execute the command.
            return [_bindtags $w $new_taglist]
        }
        default { ::ms::Error "Invalid number of arguments." $caller_info }
    }
}

#*EOF*