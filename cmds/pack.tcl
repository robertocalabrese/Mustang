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

# Symbols meanings that may be used by the widget synopsis:
#
# *option*             --> A mandatory parameter that must be substituted with a proper value.
# **option**           --> The command name or a mandatory parameter that must be written verbatim.
#
# ?*option*?           --> An optional parameter that must be substituted with a proper value.
# ?**option**?         --> An optional parameter that must be written verbatim.
#
# ?*option* *value*?   --> An optional 'key-value' parameter that must be substituted with proper values.
# ?**option** *value*? --> An optional 'key-value' parameter where the former must be written verbatim and
#                          the latter must be substituted with a proper value.

# Symbols meanings that may be used by the widget infos:
#
# *text*               --> Italic.
# **text**             --> Bold.
# ***text***           --> Italic-bold
#
# ## text              --> Title.
# #### text            --> Chapter.
# ###### text          --> Sub-chapter.
#
# [text](https:\\...)  --> Link to an internet page.
# [text](/wiki/...)    --> Link to another file in the wiki.

## pack - Geometry manager that packs around edges of cavity
#
#### SYNOPSYS
#
# **pack** *window* ?*-option* *value*? ... ?*-option* *value*?
# **pack** **configure** *window* ?*-option* *value*? ... ?*-option* *value*?
# **pack** **content** *window*
# **pack** **forget** *window* ?*window*? ... ?*window*?
# **pack** **info** *window*
# **pack** **propagate** *container* ?*boolean*?
# **pack** **slaves** *window*
#
# Note: Each *window* pathname involved may be provided either as a short or as a real address.
#       *Action*s that gives as a result a window pathname (or more than one), will always return the address as:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
#### DESCRIPTION
#
# The **pack** command is used to communicate with the packer, a geometry manager that arranges the children
# of a parent by packing them in order around the edges of the parent.
#
# The *pack* command can have any of several forms, depending on the *action* argument.
# The *action* argument is always the first argument after the command itself.
# The legal forms are:
#
#   **pack** *window* ?*window*? ... ?*window*? ?*-option* *value*? ... ?*-option* *value*?
#      If the first argument to **pack** is a window name (any value starting with '.'), then the command
#      is processed in the same way as **pack configure**.
#
#   **pack** **configure** *window* ?*window*? ... ?*window*? ?*-option* *value*? ... ?*-option* *value*?
#      The arguments consist of a window pathname followed by pairs of arguments that specify how to manage
#      the content. See **THE PACKER ALGORITHM** below for details on how the options are used by the packer.
#      The following options are supported:
#
#         **-after** *other*
#            *Other* must be the pathname of another window.
#            Use its container as the container for the content, and insert the content just after *other*
#            in the packing order.
#
#         **-anchor** *anchor*
#            *Anchor* must be a valid anchor position such as **n** or **sw**; it specifies where to position
#            each content in its parcel.
#            Defaults to **center**.
#
#         **-before** *other*
#            *Other* must be the pathname of another window.
#            Use its container as the container for the content, and insert the content just before *other*
#            in the packing order.
#
#         **-expand** *boolean*
#            Specifies whether the content should be expanded to consume extra space in their container.
#            *Boolean* may have any proper boolean value, such as **1** or **no**.
#            Defaults to '0'.
#
#         **-fill** *style*
#            If a content's parcel is larger than its requested dimensions, this option may be used to
#            stretch the content. *Style* must have one of the following values:
#
#               **none**
#                  Give the content its requested dimensions plus any internal padding requested with
#                  **-ipadx** or **-ipady**. This is the default.
#
#               **x**
#                  Stretch the content horizontally to fill the entire width of its parcel (except leave
#                  external padding as specified by **-padx**).
#
#               **y**
#                  Stretch the content vertically to fill the entire height of its parcel (except leave
#                  external padding as specified by **-pady**).
#
#               **both**
#                  Stretch the content both horizontally and vertically.
#
#         **-in** *container*
#            Insert the window at the end of the packing order for the container window given by *container*.
#
#         **-ipadx** *amount*
#            *Amount* specifies how much horizontal internal padding to leave on each side of the content.
#            Amount must be a valid screen distance, such as 2 or .5c.
#            It defaults to '0'.
#
#         **-ipady** *amount*
#            *Amount* specifies how much vertical internal padding to leave on each side of the content.
#            It defaults to '0'.
#
#         **-padx** *amount*
#            *Amount* specifies how much horizontal external padding to leave on each side of the content.
#            *Amount* may be a list of two values to specify padding for **left** and **right** separately.
#            *Amount* defaults to '0'.
#
#         **-pady** *amount*
#            *Amount* specifies how much vertical external padding to leave on each side of the content.
#            *Amount* may be a list of two values to specify padding for **top** and **bottom** separately.
#            *Amount* defaults to '0'.
#
#         **-side** *side*
#            Specifies which side of the container the content will be packed against.
#            Must be **left**, **right**, **top**, or **bottom**.
#            Defaults to **top**.
#
#      If no **-in**, **-after** or **-before** option is specified then each of the content will be inserted
#      at the end of the packing list for its parent unless it is already managed by the packer (in which case
#      it will be left where it is).
#
#      If one of these options is specified then all the content will be inserted at the specified point.
#
#      If any of the content are already managed by the geometry manager then any unspecified options for them
#      retain their previous values rather than receiving default values.
#
#   **pack** **content** *container*
#      Returns a list of all of the content windows in the packing order for *container*.
#      The order of the content windows in the list is the same as their order in the packing order.
#
#      If *container* has no content then an empty string is returned.
#
#   **pack** **forget** *window* ?*window*? ... ?*window*?
#   **pack** **remove** *window* ?*window*? ... ?*window*?
#      Removes each of the *window*s from the packing order for its container and unmaps their windows.
#      The content will no longer be managed by the packer.
#
#      If the last content window of the container becomes unmanaged, this will also send the virtual event
#      **<<NoManagedChild>>** to the container; the container may choose to resize itself (or otherwise respond)
#      to such a change.
#
#   **pack** **info** *window* ?*option*?
#      If *option* is not provided, returns a list whose elements are the current configuration state of the
#      content given by *window* in the same option-value form that might be specified to **pack configure**.
#      The first two elements of the list are "**-in** *container*" where *container* is the window's
#      container window. If *option* is provided, returns the current value for *option*.
#
#   **pack** **propagate** *container* ?*boolean*?
#      If *boolean* has a true boolean value such as **1** or **on** then propagation is enabled for *container*,
#      which must be a window name (see **GEOMETRY PROPAGATION** below).
#      If *boolean* has a false boolean value then propagation is disabled for *container*.
#      In either of these cases an empty string is returned.
#
#      If *boolean* is omitted then the command returns **0** or **1** to indicate whether propagation
#      is currently enabled for *container*.
#
#      Propagation is enabled by default.
#
#   **pack** **slaves** *container*
#      Synonym for **pack content**.
#
#### THE PACKER ALGORITHM
#
# For each container the packer maintains an ordered list of content windows called the *packing list*.
# The **-in**, **-after**, and **-before** configuration options are used to specify the container for
# each content and the content's position in the packing list.
# If none of these options is given for a content then the content is added to the end of the packing
# list for its parent.
#
# The packer arranges the content windows for a container by scanning the packing list in order.
# At the time it processes each content, a rectangular area within the container is still unallocated.
# This area is called the cavity; for the first content it is the entire area of the container.
#
# For each content the packer carries out the following steps:
#
#    1 - The packer allocates a rectangular parcel for the content along the side of the cavity given
#        by the content's **-side** option.
#
#        If the side is **top** or **bottom** then the width of the parcel is the width of the cavity
#        and its height is the requested height of the content plus the **-ipady** and **-pady** options.
#
#        If the side is **left** or **right** then the height of the parcel is the height of the cavity
#        and the width is the requested width of the content plus the **-ipadx** and **-padx** options.
#
#        The parcel may be enlarged further because of the **-expand** option (see **EXPANSION** below)
#
#    2 - The packer chooses the dimensions of the content.
#
#        The width will normally be the content's requested width plus twice its **-ipadx** option and
#        the height will normally be the content's requested height plus twice its **-ipady** option.
#
#        However, if the **-fill** option is **x** or **both** then the width of the content is expanded
#        to fill the width of the parcel, minus twice the **-padx** option.
#
#        If the **-fill** option is **y** or **both** then the height of the content is expanded to fill
#        the width of the parcel, minus twice the **-pady** option.
#
#    3 - The packer positions the content over its parcel.
#        If the content is smaller than the parcel then the **-anchor** option determines where in the
#        parcel the content will be placed.
#
#        If **-padx** or **-pady** is non-zero, then the given amount of external padding will always
#        be left between the content and the edges of the parcel.
#
# Once a given content has been packed, the area of its parcel is subtracted from the cavity,
# leaving a smaller rectangular cavity for the next content.
#
# If a content does not use all of its parcel, the unused space in the parcel will not be used by
# subsequent content.
#
# If the cavity should become too small to meet the needs of a content then the content will be given
# whatever space is left in the cavity.
#
# If the cavity shrinks to zero size, then all remaining content on the packing list will be unmapped
# from the screen until the container window becomes large enough to hold them again.
#
#### EXPANSION
#
# If a container window is so large that there will be extra space left over after all of its content
# have been packed, then the extra space is distributed uniformly among all of the content for which the
# **-expand** option is set.
# Extra horizontal space is distributed among the expandable content whose **-side** is **left** or **right**,
# and extra vertical space is distributed among the expandable content whose **-side** is **top** or **bottom**.
#
#### GEOMETRY PROPAGATION
#
# The packer normally computes how large a container must be to just exactly meet the needs of its content,
# and it sets the requested width and height of the container to these dimensions.
# This causes geometry information to propagate up through a window hierarchy to a top-level window so that
# the entire sub-tree sizes itself to fit the needs of the leaf windows.
# However, the **pack propagate** command may be used to turn off propagation for one or more containers.
# If propagation is disabled then the packer will not set the requested width and height of the packer.
# This may be useful if, for example, you wish for a container window to have a fixed size that you specify.
#
#### RESTRICTIONS ON CONTAINER WINDOWS
#
# The container for each content must either be the content's parent (the default) or a descendant of the
# content's parent.
# This restriction is necessary to guarantee that the content can be placed over any part of its container
# that is visible without danger of the content being clipped by its parent.
#
#### PACKING ORDER
#
# If the container for a content is not its parent then you must make sure that the content is higher in the
# stacking order than the container, otherwise the container will obscure the content and it will appear as if
# the content has not been packed correctly.
#
# The easiest way to make sure the content is higher than the container is to create the container window first.
# The most recently created window will be highest in the stacking order, or you can use the [raise](/wiki/commands/raise.md)
# and [lower](/wiki/commands/lower.md) commands to change the stacking order of either the container or the content.
#
#### EXAMPLE
#
# A toplevel window containing four labels and a text widgets:
#
#   # Make the widgets
#   label .t -text "This widget is at the top"    -bg red
#   label .b -text "This widget is at the bottom" -bg green
#   label .l -text "Left\nHand\nSide"
#   label .r -text "Right\nHand\nSide"
#   text .mid
#   .mid insert end "This layout is like Java's BorderLayout"
#
#   # Lay them out
#   pack .t   -side top    -fill x
#   pack .b   -side bottom -fill x
#   pack .l   -side left   -fill y
#   pack .r   -side right  -fill y
#   pack .mid -expand 1    -fill both
package provide ::ms::pack 0.1

# Create the mustang **pack** package.
namespace eval ::ms::pack {}

# Rename the original Tk **pack** command.
rename pack _pack

# Create an alias for the mustang **pack** command.
interp alias {} pack {} ::ms::pack::Command

## Command
#
# Replace the Tk **pack** command.
#
# Where:
#
# args   Should be the arguments of the **pack** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::pack::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        configure {
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                1       { return "" }
                default {
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the 'window' real address.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set addresses [lindex $result 0] }
                    }

                    # Check if there are other addresses.
                    set remaining_args $args
                    foreach arg $args {
                        switch -- [string index $arg 0] {
                            "." {
                                set window $arg

                                # Get the 'window' real address.
                                set result [::ms::Check_Pathname $window invalid]
                                switch -- $result {
                                    invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                    default {
                                        lappend addresses  [lindex  $result 0]
                                        set remaining_args [lremove $remaining_args 0]
                                    }
                                }
                            }
                            default { break }
                        }
                    }
                    set args $remaining_args

                    # Check the option/values in 'args'.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # '-after', '-before' and '-in'
                            foreach optionName [list "-after" "-before" "-in"] {
                                set index [lsearch -exact $args $optionName]
                                switch -- $index {
                                    -1      {}
                                    default {
                                        set window [lindex $args $index+1]

                                        switch -- $window {
                                            ""      {}
                                            default {
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
                                                                set args [lreplace $args $index+1 $index+1 $w]
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            # Execute the command.
                            try {
                                _pack configure {*}$addresses {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok { result } {
                                # Note: The 'pack info' command returns an option/value list that
                                #       will always contain the '-in' option at index '0'.

                                foreach w $addresses {
                                    # Check if 'w' is a scrollable widget.
                                    if { $w in $::ms::addr(megawidgets,scrollable) } {
                                        # If its classtype is a listbox, canvas or text, update its scrollbar if needed.
                                        # The listbox is not a container, its scrollbar update needs to be launched each time it change
                                        # its placement on the screen.
                                        # For safeguarding we will do the same for canvas and text because even if they are containers,
                                        # they normally don't contain any widgets.
                                        switch -- $::ms::data($w,classtype) {
                                            canvas  -
                                            listbox -
                                            text    { [string cat "::ms::" $::ms::data($w,classtype) "::Scrollbar_Update"] $w }
                                        }
                                    }

                                    # Force the propagation inside any scrollable widget ancestor for each address provided, if any.
                                    ::ms::Scrollable_Widgets_Propagation_Mechanism [lindex [_pack info $w] 1]
                                }

                                return ""
                            }
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        content -
        slaves  {
            switch -- [llength $args] {
                1   {
                    set container $args

                    # Get the 'container' real address.
                    set result [::ms::Check_Pathname $container invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$container'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]
                        }
                    }

                    # Execute the command.
                    try {
                        _pack $action $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        # Check the initial address type provided (short or real).
                        switch -- $type {
                            short {
                                set shorts_result [list ]
                                foreach addr $result {
                                    if { $addr in $::ms::addr(reals) } {
                                        lappend shorts_result $::ms::addr($addr,short)
                                    } else {
                                        lappend shorts_result $addr
                                    }
                                }

                                return $shorts_result
                            }
                            default { return $result }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        forget -
        remove {
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    foreach window $args {
                        # Get the 'window' real address.
                        set result [::ms::Check_Pathname $window invalid]
                        switch -- $result {
                            invalid { break }
                            default { set w [lindex $result 0] }
                        }

                        # Note: The 'pack info' command returns an option/value list that
                        #       will always contain the '-in' option at index '0'.

                        set container [lindex [_pack info $w] 1]

                        # Forget the real address.
                        _pack forget $w

                        # Force the propagation inside any scrollable widget ancestor, if any.
                        ::ms::Scrollable_Widgets_Propagation_Mechanism $container
                    }

                    return ""
                }
            }
        }
        info {
            switch -- [llength $args] {
                1   {
                    set window [lindex $args 0]

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
                        _pack info $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -- $result {
                            ""      {}
                            default {
                                # Check the initial address type provided (short or real).
                                switch -- $type {
                                    short {
                                        # Note: The 'pack info' command returns an option/value list that
                                        #       will always contain the '-in' option value at index '1'.

                                        set container [lindex $result 1]
                                        if { $container in $::ms::addr(reals) } {
                                            set result [lreplace $result 1 1 $::ms::addr($container,short)]
                                        }
                                    }
                                }
                            }
                        }

                        return $result
                    }
                }
                2   {
                    # Get the 'pathname' and 'optionName' provided.
                    set window     [lindex $args 0]
                    set optionName [lindex $args 1]

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
                        _pack info $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -- $result {
                            ""      { return "" }
                            default {
                                switch -- $optionName {
                                    "-in" {
                                        # Note: The 'pack info' command returns an option/value list that
                                        #       will always contain the '-in' option value at index '1'.

                                        set container [lindex $result 1]

                                        # Check the initial address type provided (short or real).
                                        switch -- $type {
                                            short {
                                                if { $container in $::ms::addr(reals) } {
                                                    return $::ms::addr($container,short)
                                                }
                                            }
                                        }

                                        return $container
                                    }
                                    default {
                                        set index [lsearch -exact $result $optionName]
                                        switch -- $index {
                                            -1      { ::ms::Error "Invalid option name, '$optionName'." $caller_info }
                                            default { return [lindex $result $index+1] }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        propagate {
            switch -- [llength $args] {
                1   -
                2   {
                    set container [lindex  $args 0]
                    set args      [lremove $args 0]

                    # Get the 'container' real address.
                    set result [::ms::Check_Pathname $container invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$container'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Execute the command.
                    try {
                        _pack propagate $w {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        default {
            set window $action

            # Get the 'window' real address.
            set result [::ms::Check_Pathname $window invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                default { set addresses [lindex $result 0] }
            }

            # Check if there are other addresses.
            set remaining_args $args
            foreach arg $args {
                switch -- [string index $arg 0] {
                    "." {
                        set window $arg

                        # Get the 'window' real address.
                        set result [::ms::Check_Pathname $window invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            default {
                                lappend addresses  [lindex  $result 0]
                                set remaining_args [lremove $remaining_args 0]
                            }
                        }
                    }
                    default { break }
                }
            }
            set args $remaining_args

            # Check the option/values in 'args'.
            switch -- [expr { [llength $args]%2 }] {
                0   {
                    # '-after', '-before' and '-in'
                    foreach optionName [list "-after" "-before" "-in"] {
                        set index [lsearch -exact $args $optionName]
                        switch -- $index {
                            -1      {}
                            default {
                                # Get the 'optionName' window provided.
                                set window [lindex $args $index+1]
                                switch -- $window {
                                   ""  { continue }
                                }

                                # Get the 'window' real address.
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
                                                set args [lreplace $args $index+1 $index+1 $w]
                                            }
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
                _pack {*}$addresses {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                # Note: The 'pack info' command returns an option/value list that
                #       will always contain the '-in' option at index '0'.

                foreach w $addresses {
                    # Check if 'w' is a scrollable widget.
                    if { $w in $::ms::addr(megawidgets,scrollable) } {
                        # If its classtype is a listbox, canvas or text, update its scrollbar if needed.
                        # The listbox and the treeview are not a container, its scrollbar update needs to be launched the
                        # moment they are positioned on screen.
                        # For safeguarding we will do the same for canvas and text because even if they are containers,
                        # they normally don't contain any widgets.
                        switch -- $::ms::data($w,classtype) {
                            canvas   -
                            listbox  -
                            text     -
                            treeview { [string cat "::ms::" $::ms::data($w,classtype) "::Scrollbar_Update"] $w }
                        }
                    }

                    # Force the propagation inside any scrollable widget ancestor for each address provided, if any.
                    ::ms::Scrollable_Widgets_Propagation_Mechanism [lindex [_pack info $w] 1]
                }
            }

            return ""
        }
    }
}

#*EOF*