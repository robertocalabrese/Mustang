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

## place - Geometry manager for fixed or rubber-sheet placement
#
#### SYNOPSIS:
#
# **place** *window* ?*-option* *value*? ... ?*-option* *value*?
# **place** **configure** *window* ?*-option* *value*? ... ?*-option* *value*?
# **place** **content** *container*
# **place** **forget** *window* ?*window*? ... ?*window*?
# **place** **info** *window*
# **place** **slaves** *container*
#
# Note: Each *window* pathname involved may be provided either as a short or as a real address.
#       *Action*s that gives as a result a window pathname (or more than one), will always return the address as:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#
#### DESCRIPTION:
#
# The placer is a geometry manager for Tk.
# It provides simple fixed placement of windows, where you specify the exact size and location of one window,
# called the content, within another window, called the container.
# The placer also provides rubber-sheet placement, where you specify the size and location of the content in
# terms of the dimensions of the container, so that the content changes size and location in response to changes
# in the size of the container.
#
# Lastly, the placer allows you to mix these styles of placement so that, for example, the content has a fixed
# width and height but is centered inside the container.
#
# The *place* command can have any of several forms, depending on the *action* argument.
# The *action* argument is always the first argument after the command itself.
# The legal forms are:
#
#   **place** *window* ?*option* *value*? ... ?*option* *value*?
#      Arrange for the placer to manage the geometry of a content whose pathname is *window*.
#      The remaining arguments consist of one or more option-value pairs that specify the way in which *window*'s
#      geometry is managed.
#      Option may have any of the values accepted by the place configure command.
#
#   **place** **configure** *window* ?*option* *value*? ... ?*option* *value*?
#      The arguments consist of a window pathname followed by pairs of arguments that specify how to manage
#      the content. The following options are supported:
#
#         **-anchor** *where*
#            *Where* specifies which point of *window* is to be positioned at the (x,y) location selected by
#            the *-x*, *-y*, *-relx*, and *-rely* options.
#            The anchor point is in terms of the outer area of *window* including its border, if any.
#            Thus if where is se then the lower-right corner of *window*'s border will appear at the given
#            (x,y) location in the container.
#            The anchor position defaults to **nw**.
#
#         **-bordermode** *mode*
#            *Mode* determines the degree to which borders within the container are used in determining the
#            placement of the content.
#
#            The default and most common value is **inside**.
#            In this case the placer considers the area of the container to be the innermost area of the container,
#            inside any border: an option of *-x* **0** corresponds to an x-coordinate just inside the border and
#            an option of *-relwidth* **1.0** means *window* will fill the area inside the container's border.
#
#            If mode is **outside** then the placer considers the area of the container to include its border;
#            this mode is typically used when placing *window* outside its container, as with the options
#            *-x* **0** *-y* **0** *-anchor* **ne**.
#
#            Lastly, mode may be specified as **ignore**, in which case borders are ignored: the area of the
#            container is considered to be its official X area, which includes any internal border but no
#            external border. A bordermode of ignore is probably not very useful.
#
#         **-height** *size*
#            *Size* specifies the height for *window* in screen units (i.e. any of the forms accepted by [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)).
#            The height will be the outer dimension of *window* including its border, if any.
#
#            If size is an empty string, or if no *-height* or *-relheight* option is specified, then the
#            height requested internally by the *window* will be used.
#
#         **-in** *container*
#            *Container* specifies the path name of the window relative to which *window* is to be placed.
#            *Container* must either be *window*'s parent or a descendant of *window*'s parent.
#
#            In addition, *container* and *window* must both be descendants of the same top-level window.
#            These restrictions are necessary to guarantee that *window* is visible whenever container is visible.
#            If this option is not specified then the other window defaults to *window*'s parent.
#
#         **-relheight** *size*
#            *Size* specifies the height for *window*.
#
#            In this case the height is specified as a floating-point number relative to the height of the
#            container: **0.5** means *window* will be half as high as the container, **1.0** means *window* will
#            have the same height as the container, and so on.
#
#            If both *-height* and *-relheight* are specified for a content, their values are summed.
#            For example, *-relheight* **1.0** *-height* **-2** makes the content **2** pixels shorter than
#            the container.
#
#         **-relwidth** *size*
#            *Size* specifies the width for *window*.
#
#            In this case the width is specified as a floating-point number relative to the width of the
#            container: **0.5** means *window* will be half as wide as the container, **1.0** means *window*
#            will have the same width as the container, and so on.
#
#            If both *-width* and *-relwidth* are specified for a content, their values are summed.
#            For example, *-relwidth* **1.0** *-width* **5** makes the content **5** pixels wider than
#            the container.
#
#         **-relx** *location*
#            *Location* specifies the x-coordinate within the container window of the anchor point for *window*.
#
#            In this case the location is specified in a relative fashion as a floating-point number: **0.0**
#            corresponds to the left edge of the container and **1.0** corresponds to the right edge of the container.
#            *Location* need not be in the range [0.0,1.0].
#
#            If both *-x* and *-relx* are specified for a content then their values are summed.
#            For example, *-relx* **0.5** *-x* **-2** positions the left edge of the content **2** pixels to the
#            left of the center of its container.
#
#         **-rely** *location*
#            *Location* specifies the y-coordinate within the container window of the anchor point for *window*.
#
#            In this case the value is specified in a relative fashion as a floating-point number: **0.0**
#            corresponds to the top edge of the container and **1.0** corresponds to the bottom edge of the container.
#            *Location* need not be in the range [0.0,1.0].
#
#            If both *-y* and *-rely* are specified for a content then their values are summed.
#            For example, *-rely* **0.5** *-x* **3** positions the top edge of the content **3** pixels below
#            the center of its container.
#
#         **-width** *size*
#            *Size* specifies the width for *window* in screen units (i.e. any of the forms accepted by [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html)).
#
#            The width will be the outer width of *window* including its border, if any.
#
#            If size is an empty string, or if no *-width* or *-relwidth* option is specified, then the width
#            requested internally by the window will be used.
#
#         **-x** *location*
#            *Location* specifies the x-coordinate within the container window of the anchor point for *window*.
#            The location is specified in screen units (i.e. any of the forms accepted by [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html))
#            and need not lie within the bounds of the container window.
#
#         **-y** *location*
#            *Location* specifies the y-coordinate within the container window of the anchor point for *window*.
#            The location is specified in screen units (i.e. any of the forms accepted by [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html))
#            and need not lie within the bounds of the container window.
#
#         If the same value is specified separately with two different options, such as *-x* and *-relx*,
#         then the most recent option is used and the older one is ignored.
#
#   **place** **forget** *window*
#   **place** **remove** *window*
#      Causes the placer to stop managing the geometry of *window*.
#      As a side effect of this command *window* will be unmapped so that it does not appear on the screen.
#      If *window* is not currently managed by the placer then the command has no effect.
#      This command returns an empty string.
#
#   **place** **info** *window* ?*option*?
#      If *option* is not provided, returns a list whose elements are the current configuration state of the
#      content given by *pathname* in the same option-value form that might be specified to **place configure**.
#      The first two elements of the list are "**-in** *container*" where *container* is the *pathname*'s
#      container window.
#
#      If *option* is provided, returns the current value for *option*.
#
#   **place** **content** *container*
#      Returns a list of all of the content windows in the packing order for *container*.
#      The order of the content windows in the list is the same as their order in the packing order.
#
#      If *container* has no content then an empty string is returned.
#
#   **place** **slaves** *container*
#      Synonym for **place content**.
#
# If the configuration of a window has been retrieved with **place info**, that configuration can be restored
# later by first using **place forget** to erase any existing information for the window and then invoking
# **place configure** with the saved information.
#
#### FINE POINTS:
#
# It is not necessary for the container window to be the parent of the content window.
# This feature is useful in at least two situations.
#
# First, for complex window layouts it means you can create a hierarchy of subwindows whose only purpose is
# to assist in the layout of the parent.
#
# The "long children" of the parent (i.e. the windows that are significant for the application's user interface)
# can be children of the parent yet be placed inside the windows of the geometry-management hierarchy.
# This means that the path names of the "long children" do not reflect the geometry-management hierarchy and users
# can specify options for the long children without being aware of the structure of the geometry-management hierarchy.
#
# A second reason for having a container different than the content's parent is to tie two siblings together.
# For example, the placer can be used to force a window always to be positioned centered just below one of its
# siblings by specifying the configuration
#
#    **-in** sibling **-relx** 0.5 **-rely** 1.0 **-anchor** n **-bordermode** outside
#
# Whenever the sibling is repositioned in the future, the content will be repositioned as well.
#
# Unlike many other geometry managers (such as the packer) the placer does not make any attempt to manipulate
# the geometry of the container windows or the parents of content windows (i.e. it does not set their requested sizes).
# To control the sizes of these windows, make them windows like frames and canvases that provide configuration options
# for this purpose.
package provide ::ms::place 0.1

# Create the mustang **place** package.
namespace eval ::ms::place {}

# Rename the original Tk **place** command.
rename place _place

# Create an alias for the mustang **place** command.
interp alias {} place {} ::ms::place::Command

## Command
#
# Replace the Tk **place** command.
#
# Where:
#
# args   Should be the arguments of the **place** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::place::Command { args } {
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
                        default { set w [lindex $result 0] }
                    }

                    # Check the option/values in 'args'.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # '-in'
                            set index [lsearch -exact $args "-in"]
                            switch -- $index {
                                -1      {}
                                default {
                                    set container [lindex $args $index+1]

                                    # Get the 'container' real address.
                                    set result [::ms::Check_Pathname $container invalid]
                                    switch -- $result {
                                        invalid { ::ms::Error "Invalid address, '$container'." $caller_info }
                                        default {
                                            set w    [lindex $result 0]
                                            set type [lindex $result 1]

                                            # Check the initial address type provided (short or real).
                                            switch -- $type {
                                                short {
                                                    # Substitute 'container' with its relative real address.
                                                    set args [lreplace $args $index+1 $index+1 $w]
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            # Execute the command.
                            try {
                                _place configure $w {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            } on ok {} {
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
                    set container [lindex $args 0]

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
                        _grid $action $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        # Check the initial address type provided (short or real).
                        switch -- $type {
                            short {
                                set shorts_result [list ]
                                foreach addr $result {
                                    switch -- [info exists ::ms::addr($addr,short)] {
                                        0   { lappend shorts_result $addr }
                                        1   { lappend shorts_result $::ms::addr($addr,short) }
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

                        # Forget the real address.
                        _place forget $w
                    }

                    return ""
                }
            }
        }
        info {
            switch -- [llength $args] {
                1   {
                    set window $args

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
                        _place info $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -- $result {
                            ""      {}
                            default {
                                # Check the initial address type provided (short or real).
                                switch -- $type {
                                    short {
                                        # Note: The 'place info' command returns an option/value list that
                                        #       will always contain the '-in' option value at index '1'.

                                        set container [lindex $result 1]
                                        switch -- [info exists ::ms::addr($container,short)] {
                                            1   { set result [lreplace $result 1 1 $::ms::addr($container,short)] }
                                        }
                                    }
                                }
                            }
                        }

                        return $result
                    }
                }
                2   {
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
                        _place info $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -- $result {
                            ""      { return "" }
                            default {
                                switch -- $optionName {
                                    "-in" {
                                        # Note: The 'place info' command returns an option/value list that
                                        #       will always contain the '-in' option value at index '1'.

                                        set container [lindex $result 1]

                                        # Check the initial address type provided (short or real).
                                        switch -- $type {
                                            short {
                                                switch -- [info exists ::ms::addr($container,short)] {
                                                    1   { return $::ms::addr($container,short) }
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
        default {
            set window $action

            # Get the 'window' real address.
            set result [::ms::Check_Pathname $window invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                default { set w [lindex $result 0] }
            }

            # Check the option/values in 'args'.
            switch -- [expr { [llength $args]%2 }] {
                0   {
                    # Check if the '-in' option was provided.
                    set index [lsearch -exact $args "-in"]
                    switch -- $index {
                        -1      {}
                        default {
                            # '-in'
                            set container [lindex $args $index+1]

                            # Get the 'container' real address.
                            set result [::ms::Check_Pathname $container invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid address, '$container'." $caller_info }
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
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _place $w {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
    }
}

#*EOF*