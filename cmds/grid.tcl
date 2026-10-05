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

## grid - Geometry manager that arranges widgets in a grid
#
#### SYNOPSIS:
#
# **grid** *window* ?*window*? ... ?*window*? ?*-option* *value*? ... ?*-option* *value*?
# **grid** **anchor** *window* ?*anchor*?
# **grid** **bbox** *window* ?*column* *row*? ?*column2* *row2*?
# **grid** **columnconfigure** *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
# **grid** **configure** *window* ?*window*? ... ?*window*? *-option* *value* ?*-option* *value*? ... ?*-option* *value*?
# **grid** **content** ?**short**? *window* ?*-option* *value*?
# **grid** **forget** *window* ?*window*? ... ?*window*?
# **grid** **info** ?**short**? *window*
# **grid** **location** *window* x y
# **grid** **propagate** *window* ?*boolean*?
# **grid** **remove** *window* ?*window*? ... ?*window*?
# **grid** **rowconfigure** *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
# **grid** **size** *window*
# **grid** **slaves** ?**short**? *window* ?*-option* *value*?
#
# Note: Each *window* pathname involved may be provided either as a short or as a real address.
#
#### DESCRIPTION:
#
# The **grid** command is used to communicate with the grid geometry manager that arranges widgets in rows
# and columns inside of another window, called the geometry container (or container window).
#
#### COMMAND:
#
# The *grid* command can have any of several forms, depending on the *action* argument.
# The *action* argument, when present, is always the first argument after the command itself.
# The legal forms are:
#
#   **grid** *window* ?*window*? ... ?*window*? ?*-option* *value*? ... ?*-option* *value*?
#      If the **grid** action is a window pathname, then the command is processed in the same way as **grid configure**.
#
#      Note: Differently from Tk, the **grid** command do not accepts shortforms ('-', 'x' and '^').
#
#   **grid** **anchor** *window* ?*anchor*?
#      The anchor value controls how to place the grid within *window* when no row/column has any weight.
#      See **THE GRID ALGORITHM** below for further details.
#      The default *anchor* is nw.
#
#   **grid** **bbox** *window* ?*column* *row*? ?*column2* *row2*?
#      With no arguments, the bounding box (in pixels) of the grid is returned.
#      The return value consists of 4 integers.
#      The first two are the pixel offset from the container window (x then y) of the top-left corner
#      of the grid, and the second two integers are the width and height of the grid, also in pixels.
#
#      If a single *column* and *row* is specified on the command line, then the bounding box for that
#      cell is returned, where the top left cell is numbered from zero.
#
#      If both *column* and *row* arguments are specified, then the bounding box spanning the rows
#      and columns indicated is returned.
#
#   **grid** **columnconfigure** *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
#      Query or set the column properties of the *index* column of the geometry container, *window*.
#      The valid options are **-minsize**, **-weight**, **-uniform** and **-pad**.
#
#      If one or more options are provided, then *index* may be given as a list of column indices to
#      which the configuration options will operate on.
#
#      Indices may be integers, window names or the keyword *all*.
#      For *all* the options apply to all columns currently occupied be content windows.
#
#      The **-minsize** option sets the minimum size, in screen units, that will be permitted for this column.
#
#      The **-weight** option (an integer value) sets the relative weight for apportioning any extra spaces
#      among columns.
#      A weight of zero (0) indicates the column will not deviate from its requested size.
#      A column whose weight is two will grow at twice the rate as a column of weight one when extra space
#      is allocated to the layout.
#
#      The **-uniform** option, when a non-empty value is supplied, places the column in a *uniform group*
#      with other columns that have the same value for **-uniform**.
#      The space for columns belonging to a uniform group is allocated so that their sizes are always in
#      strict proportion to their **-weight** values. See **THE GRID ALGORITHM** below for further details.
#
#      The **-pad** option specifies the number of screen units that will be added to the largest window
#      contained completely in that column when the grid geometry manager requests a size from the
#      containing window.
#
#      If only an option is specified, with no value, the current value of that option is returned.
#
#      If only *window* and *index* are specified, all the current settings are returned in a list of
#      "*-option* *value*" pairs.
#
#   **grid** **configure** *window* ?*window*? ... ?*window*? *-option* *value* ?*-option* *value*? ... ?*-option* *value*?
#      The arguments consist of a window pathname/s followed by pairs of arguments that specify how to manage
#      the content. The following options are supported:
#
#          **-column** *n*
#              Insert the window so that it occupies the *n*th column in the grid.
#              Column numbers start with "0".
#
#              If this option is not supplied, then the window is arranged just to the right of previous
#              window specified on this call to **grid**, or column "0" if it is the first window.
#
#          **-columnspan** *n*
#              Insert the window so that it occupies *n* columns in the grid.
#              The default is one column.
#
#          **-in** *container*
#              Insert the window in the container window given by *container*.
#              The default is the first window's parent window.
#
#          **-ipadx** *amount*
#              The *amount* specifies how much horizontal internal padding to leave on each side
#              of the content.
#
#              This is space is added inside the content border.
#              The *amount* must be a valid screen distance, such as 2 or .5c.
#              It defaults to 0.
#
#          **-ipady** *amount*
#              The *amount* specifies how much vertical internal padding to leave on the top and bottom
#              of the content.
#
#              This space is added inside the content border.
#              The *amount* defaults to 0.
#
#          **-padx** *amount*
#              The *amount* specifies how much horizontal external padding to leave on each side
#              of the content, in screen units.
#
#              This space is added outside the content border.
#
#              *Amount* may be a list of two values to specify padding for left and right separately.
#              The *amount* defaults to 0.
#
#          **-pady** *amount*
#              The *amount* specifies how much vertical external padding to leave on the top and bottom
#              of the content, in screen units.
#
#              This space is added outside the content border.
#
#              *Amount* may be a list of two values to specify padding for top and bottom separately.
#              The *amount* defaults to 0.
#
#          **-row** *n*
#              Insert the content so that it occupies the *n*th row in the grid.
#              Row numbers start with "0".
#
#              If this option is not supplied, then the content is arranged on the same row as the
#              previous content specified on this call to **grid**, or the next row after the highest
#              occupied row if this is the first content.
#
#          **-rowspan** *n*
#              Insert the content so that it occupies *n* rows in the grid.
#              The default is one row.
#
#          **-sticky** *style*
#              If a content's cell is larger than its requested dimensions, this option may be used to
#              position (or stretch) the content within its cell.
#
#              *Style* is a string that contains zero or more of the characters **n**, **s**, **e** or **w**.
#              The string can optionally contain spaces or commas, but they are ignored.
#
#              Each letter refers to a side (*north*, *south*, *east*, or *west*) that the content will
#              "stick" to. If both **n** and **s** (or **e** and **w**) are specified, the content will be
#              stretched to fill the entire height (or width) of its cavity.
#
#              The **-sticky** option subsumes the combination of **-anchor** and **-fill** that is used by [pack](/wiki/commands/pack.md).
#
#              The default is the empty string, which causes the content to be centered in its cavity,
#              at its requested size.
#
#      If the window is already managed by the grid geometry manager then any unspecified options for them
#      retain their previous values rather than receiving default values.
#
#      Note: Differently from Tk, the **grid configure** command do not accepts shortforms ('-', 'x' and '^').
#
#   **grid** **content** ?**short**? *window* ?*-option* *value*?
#      If no options are supplied, a list of all of the content in *window* is returned, most recently
#      managed first.
#
#      *Option* can be either **-row** or **-column** which causes only the content in the row (or column)
#      specified by value to be returned.
#
#      If the *short* option is provided the address returned will be a short address, otherwise it will be a real address.
#      If provided, the *short* option must be located just after the *content* action.
#
#   **grid** **forget** *window* ?*window*? ... ?*window*?
#      Removes each of the *window*s from grid for its container and unmaps their windows.
#
#      The content will no longer be managed by the grid geometry manager.
#      The configuration options for that window are forgotten, so that if the window is managed once more
#      by the grid geometry manager, the initial default settings are used.
#
#      If the last content window of the container becomes unmanaged, this will also send the virtual event
#      **<<NoManagedChild>>** to the container: the container may choose to resize itself (or otherwise respond)
#      to such a change.
#
#   **grid** **info** ?**short**? *window*
#      Returns a list whose elements are the current configuration state of the content given by *window* in the same
#      option-value form that might be specified to **grid configure**.
#      The first two elements of the list are "**-in** *container*" where *container* is the window's
#      container window.
#
#      If the *short* option is provided the '-in' address returned will be a short address, otherwise it will be a real address.
#      If provided, the *short* option must be located just after the *info* action.
#
#   **grid** **location** *window* x y
#      Given *x* and *y* values in screen units relative to *window*, the column and row number
#      at that *x* and *y* location is returned.
#
#      For locations that are above or to the left of the grid, **-1** is returned.
#
#   **grid** **propagate** *window* ?*boolean*?
#      If *boolean* has a true boolean value such as **1** or **on** then propagation is enabled for *window*,
#      which must be a window name (see **GEOMETRY PROPAGATION** below).
#      If *boolean* has a false boolean value then propagation is disabled for *window*.
#      In either of these cases an empty string is returned.
#
#      If *boolean* is omitted then the command returns **0** or **1** to indicate whether propagation
#      is currently enabled for window.
#
#      Propagation is enabled by default.
#
#   **grid** **remove** *window* ?*window*? ... ?*window*?
#      Removes each of the *window*s from grid for its container and unmaps their windows.
#      The content will no longer be managed by the grid geometry manager.
#
#      However, the configuration options for that window are remembered, so that if the content window is
#      managed once more by the grid geometry manager, the previous values are retained.
#
#      If the last content window of the container becomes unmanaged, this will also send the virtual event
#      **<<NoManagedChild>>** to the container; the container may choose to resize itself (or otherwise respond)
#      to such a change.
#
#   **grid** **rowconfigure** *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
#      Query or set the row properties of the index row of the geometry container, *window*.
#      The valid options are **-minsize**, **-weight**, **-uniform** and **-pad**.
#
#      If one or more options are provided, then *index* may be given as a list of row indices to which
#      the configuration options will operate on.
#
#      Indices may be integers, window names or the keyword *all*.
#      For *all* the options apply to all rows currently occupied be content windows.
#
#      The **-minsize** option sets the minimum size, in screen units, that will be permitted for this row.
#
#      The **-weight** option (an integer value) sets the relative weight for apportioning any extra
#      spaces among rows.
#      A weight of zero (0) indicates the row will not deviate from its requested size.
#      A row whose weight is two will grow at twice the rate as a row of weight one when extra space
#      is allocated to the layout.
#
#      The **-uniform** option, when a non-empty value is supplied, places the row in a *uniform group*
#      with other rows that have the same value for **-uniform**.
#      The space for rows belonging to a uniform group is allocated so that their sizes are always in strict
#      proportion to their -weight values. See THE GRID ALGORITHM below for further details.
#
#      The **-pad** option specifies the number of screen units that will be added to the largest window pathname
#      contained completely in that row when the grid geometry manager requests a size from the containing window.
#
#      If only an option is specified, with no value, the current value of that option is returned.
#      If only *window* and *index* are specified, all the current settings are returned in a list of
#      "*-option* *value*" pairs.
#
#   **grid** **size** *window*
#      Returns the size of the grid (in columns then rows) for *window*.
#
#      The **size** is determined either by the *content* occupying the largest row or column, or the largest
#      column or row with a **-minsize**, **-weight**, or **-pad** that is non-zero.
#
#   **grid** **slaves** ?**short**? *window* ?*-option* *value*?
#      Synonym for **grid content**.
#
#### THE GRID ALGORITHM:
#
# The grid geometry manager lays out its content in three steps.
# In the first step, the minimum size needed to fit all of the content is computed, then (if propagation is
# turned on), a request is made of the container window to become that size.
# In the second step, the requested size is compared against the actual size of the container.
# If the sizes are different, then spaces is added to or taken away from the layout as needed.
# For the final step, each content is positioned in its row(s) and column(s) based on the setting of
# its *sticky* flag.
#
# To compute the minimum size of a layout, the grid geometry manager first looks at all content whose
# **-columnspan** and **-rowspan** values are one, and computes the nominal size of each row or column
# to be either the *minsize* for that row or column, or the sum of the *pad*ding plus the size of the
# largest content, whichever is greater.
# After that the rows or columns in each uniform group adapt to each other.
# Then the content whose row-spans or column-spans are greater than one are examined.
# If a group of rows or columns need to be increased in size in order to accommodate these content,
# then extra space is added to each row or column in the group according to its *weight*.
# For each group whose weights are all zero, the additional space is apportioned equally.
#
# When multiple rows or columns belong to a uniform group, the space allocated to them is always in
# proportion to their weights. (A weight of zero is considered to be 1.) In other words, a row or column
# configured with **-weight 1 -uniform a** will have exactly the same size as any other row or column configured
# with **-weight 1 -uniform a**.
# A row or column configured with **-weight 2 -uniform b** will be exactly twice as large as one that is
# configured with **-weight 1 -uniform b**.
#
# More technically, each row or column in the group will have a size equal to *k*weight* for some constant *k*.
# The constant *k* is chosen so that no row or column becomes smaller than its minimum size.
# For example, if all rows or columns in a group have the same weight, then each row or column will have
# the same size as the largest row or column in the group.
#
# For containers whose size is larger than the requested layout, the additional space is apportioned according
# to the row and column weights.
# If all of the weights are zero, the layout is placed within its container according to the anchor value.
# For containers whose size is smaller than the requested layout, space is taken away from columns and rows
# according to their weights.
# However, once a column or row shrinks to its minsize, its weight is taken to be zero.
# If more space needs to be removed from a layout than would be permitted,
# as when all the rows or columns are at their minimum sizes, the layout is placed and clipped according
# to the *anchor* value.
#
#### GEOMETRY PROPAGATION:
#
# The grid geometry manager normally computes how large a container must be to just exactly meet the needs
# of its content, and it sets the requested width and height of the container to these dimensions.
# This causes geometry information to propagate up through a window hierarchy to a top-level window so that
# the entire sub-tree sizes itself to fit the needs of the leaf windows.
# However, the **grid propagate** command may be used to turn off propagation for one or more containers.
# If propagation is disabled then grid will not set the requested width and height of the container window.
# This may be useful if, for example, you wish for a container window to have a fixed size that you specify.
#
#### RESTRICTIONS ON CONTAINER WINDOWS:
#
# The container for each content must either be the content's parent (the default) or a descendant of
# the content's parent.
# This restriction is necessary to guarantee that the content can be placed over any part of its container
# that is visible without danger of the content being clipped by its parent.
# In addition, all content in one call to **grid** must have the same container.
#
#### STACKING ORDER:
#
# If the container for a content is not its parent then you must make sure that the content is higher in the
# stacking order than the container.
# Otherwise the container will obscure the content and it will appear as if the content has not been managed
# correctly. The easiest way to make sure the content is higher than the container is to create the container
# window first: the most recently created window will be highest in the stacking order.
#
#### CREDITS:
#
# The **grid** command is based on ideas taken from the **GridBag** geometry manager written by *Doug. Stein*,
# and the **blt_table** geometry manager, written by *George Howlett*.
#
#### EXAMPLE:
#
# A toplevel window containing a text widget and two scrollbars:
#
#   # Make the widgets
#   toplevel .t
#   text .t.txt -wrap none -xscroll {.t.h set} -yscroll {.t.v set}
#   scrollbar .t.v -orient vertical   -command {.t.txt yview}
#   scrollbar .t.h -orient horizontal -command {.t.txt xview}
#
#   # Lay them out
#   grid .t.txt .t.v .t.h -sticky nsew
#
#   # Tell the text widget to take all the extra room
#   grid rowconfigure    .t .t.txt -weight 1
#   grid columnconfigure .t .t.txt -weight 1
#
# Three widgets of equal width, despite their different "natural" widths:
#
#   button .b -text "Foo"
#   entry .e -textvariable foo ; set foo "Hello World!"
#   label .l -text "This is a fairly long piece of text"
#
#   grid .b .e .l -sticky ew
#   grid columnconfigure . "all" -uniform allTheSame
package provide ::ms::grid 0.1

# Create the mustang **grid** package.
namespace eval ::ms::grid {}

# Rename the original Tk **grid** command.
rename grid _grid

# Create an alias for the mustang **grid** command.
interp alias {} grid {} ::ms::grid::Command

## Command
#
# Replace the Tk **grid** command.
#
# Where:
#
# args   Should be the arguments of the **grid** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::grid::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Synopsis:
    #
    # **grid** *window* ?*window*? ... ?*window*? ?*-option* *value*? ... ?*-option* *value*?
    # **grid** **anchor** *window* ?*anchor*?
    # **grid** **bbox** *window* ?*column* *row*? ?*column2* *row2*?
    # **grid** **columnconfigure** *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
    # **grid** **configure** *window* ?*window*? ... ?*window*? *-option* *value* ?*-option* *value*? ... ?*-option* *value*?
    # **grid** **content** ?**short**? *window* ?*-option* *value*?
    # **grid** **forget** *window* ?*window*? ... ?*window*?
    # **grid** **info** ?**short**? *window*
    # **grid** **location** *window* x y
    # **grid** **propagate** *window* ?*boolean*?
    # **grid** **remove** *window* ?*window*? ... ?*window*?
    # **grid** **rowconfigure** *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
    # **grid** **size** *window*
    # **grid** **slaves** ?**short**? *window* ?*-option* *value*?

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        anchor    -
        propagate {
            # Synopsis:
            #
            # **grid** **anchor**    *window*
            # **grid** **anchor**    *window* ?*anchor*?
            #
            # **grid** **propagate** *window*
            # **grid** **propagate** *window* ?*boolean*?
            switch -- [llength $args] {
                1   {
                    # Synopsis:
                    #
                    # **grid** **anchor**    *window*
                    # **grid** **propagate** *window*
                    set window $args

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid $action $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                2   {
                    # Synopsis:
                    #
                    # **grid** **anchor**    *window* ?*anchor*?
                    # **grid** **propagate** *window* ?*boolean*?
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid $action $w $args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        bbox {
            # Synopsis:
            #
            # **grid** **bbox** *window*
            # **grid** **bbox** *window* *column* *row*
            # **grid** **bbox** *window* *column* *row* *column2* *row2*
            switch -- [llength $args] {
                1   {
                    # Synopsis:
                    #
                    # **grid** **bbox** *window*
                    set window $args

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid bbox $w
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
                    # **grid** **bbox** *window* *column* *row*
                    # **grid** **bbox** *window* *column* *row* *column2* *row2*
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid bbox $w {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        columnconfigure -
        rowconfigure    {
            # Synopsis:
            #
            # **grid** **columnconfigure** *window* *index*
            # **grid** **columnconfigure** *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
            #
            # **grid** **rowconfigure**    *window* *index*
            # **grid** **rowconfigure**    *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
            switch -- [llength $args] {
                0   -
                1   { ::ms::Error "Invalid number of arguments." $caller_info }
                2   {
                    # Synopsis:
                    #
                    # **grid** **columnconfigure** *window* *index*
                    # **grid** **rowconfigure**    *window* *index*
                    set window  [lindex $args 0]
                    set indexes [lindex $args 1]

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Check if 'w' is a megawidget container.
                    if { $w in $::ms::addr(megawidgets,containers) } {
                        set w $::ms::addr($w,widget)
                    }

                    # Execute the command.
                    try {
                        _grid $action $w $indexes
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default {
                    # Synopsis:
                    #
                    # **grid** **columnconfigure** *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
                    # **grid** **rowconfigure**    *window* *index* ?*-option*? ?*value*? ?*-option* *value*? ... ?*-option* *value*?
                    set window  [lindex  $args 0]
                    set indexes [lindex  $args 1]
                    set args    [lremove $args 0 1]

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Check if 'w' is a megawidget container.
                    if { $w in $::ms::addr(megawidgets,containers) } {
                        set w $::ms::addr($w,widget)
                    }

                    # Check the option/values in 'args'.
                    switch -- [expr { [llength $args]%2 }] {
                        0   {
                            # Execute the command.
                            try {
                                _grid $action $w $indexes {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            }

                            # Check if 'w' is a scrollable widget.
                            if { $w in $::ms::addr(megawidgets,scrollable) } {
                                # If 'w' classtype is a canvas, listbox, scrollbar, text or treeview widgets, update its scrollbar if needed.
                                # The listbox, scrollbar and treeview widgets are not containers, their scrollbars update needs to be launched
                                # the moment they are positioned on screen.
                                # For safeguarding we will do the same for canvas and text widgets because even if they are containers,
                                # they normally don't contain any widgets (no harm will be done if they contains widgets).
                                switch -- $::ms::data($w,classtype) {
                                    canvas    -
                                    listbox   -
                                    scrollbar -
                                    text      -
                                    treeview  { [string cat "::ms::" $::ms::data($w,classtype) "::Scrollbar_Update"] $w }
                                }
                            }

                            # Get the grid container real address.
                            set in_addr_real [lindex [_grid info $w] 1]

                            # Force the propagation inside the grid container real address.
                            ::ms::Scrollable_Widgets_Propagation_Mechanism $in_addr_real

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        configure {
            # Note: Differently from Tk, the 'grid configure' command do not accepts
            #       shortforms ('-', 'x' and '^').

            # Synopsis:
            #
            # **grid** **configure** *window* ?*window*? ... ?*window*? *-option* *value* ?*-option* *value*? ... ?*-option* *value*?
            switch -- [llength $args] {
                0       -
                1       -
                2       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set addresses [list $w] }
                    }

                    # Check if there are other addresses.
                    set remaining_args $args
                    foreach arg $args {
                        switch -- [string index $arg 0] {
                            "." {
                                set window $arg

                                # Get the 'window' real address.
                                set w [::ms::Check_Pathname $window invalid]
                                switch -- $w {
                                    invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                    default {
                                        lappend addresses  $w
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
                            # '-in'
                            set index [lsearch -exact $args "-in"]
                            switch -- $index {
                                -1      { set in_addr_real [_winfo parent [lindex $addresses 0]] }
                                default {
                                    set in_addr [lindex $args $index+1]

                                    # Get the real address associated with 'in_addr'.
                                    set in_addr_real [::ms::Check_Pathname $in_addr invalid]
                                    switch -- $in_addr_real {
                                        invalid { ::ms::Error "Invalid address, 'in_addr'." $caller_info }
                                        default { set args [lreplace $args $index+1 $index+1 $in_addr_real] }
                                    }
                                }
                            }

                            # Execute the command.
                            try {
                                _grid configure {*}$addresses {*}$args
                            } on error { errortext errorcode } {
                                ::ms::Error "$errortext" $caller_info
                            }

                            # Check each address that has been configured.
                            foreach w $addresses {
                                # Check if 'w' is a scrollable widget.
                                if { $w in $::ms::addr(megawidgets,scrollable) } {
                                    # If 'w' classtype is a canvas, listbox, scrollbar, text or treeview widgets, update its scrollbar if needed.
                                    # The listbox, scrollbar and treeview widgets are not containers, their scrollbars update needs to be launched
                                    # the moment they are positioned on screen.
                                    # For safeguarding we will do the same for canvas and text widgets because even if they are containers,
                                    # they normally don't contain any widgets (no harm will be done if they contains widgets).
                                    switch -- $::ms::data($w,classtype) {
                                        canvas    -
                                        listbox   -
                                        scrollbar -
                                        text      -
                                        treeview  { [string cat "::ms::" $::ms::data($w,classtype) "::Scrollbar_Update"] $w }
                                    }
                                }
                            }

                            # Force the propagation inside the grid container ('in_addr_real').
                            ::ms::Scrollable_Widgets_Propagation_Mechanism $in_addr_real

                            return ""
                        }
                        default { ::ms::Error "Invalid number of arguments." $caller_info }
                    }
                }
            }
        }
        content -
        slaves  {
            # Synopsis:
            #
            # **grid** **content** *window*
            # **grid** **content** *window* ?*-option* *value*?
            # **grid** **content** ?**short**? *window*
            # **grid** **content** ?**short**? *window* ?*-option* *value*?
            #
            # **grid** **slaves**  *window*
            # **grid** **slaves**  *window* ?*-option* *value*?
            # **grid** **slaves**  ?**short**? *window*
            # **grid** **slaves**  ?**short**? *window* ?*-option* *value*?
            switch -- [llength $args] {
                1   {
                    # Synopsis:
                    #
                    # **grid** **content** *window*
                    # **grid** **slaves**  *window*
                    set window $args

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid $action $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                2   {
                    # Synopsis:
                    #
                    # **grid** **content** ?**short**? *window*
                    # **grid** **slaves**  ?**short**? *window*
                    set option [lindex $args 0]
                    set window [lindex $args 1]

                    # Check the 'short' option.
                    switch -- $option {
                        short   {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid $action $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        set short_result [list ]
                        foreach w $result {
                            # Check if exists a short address for 'w'.
                            switch -- [info exists ::ms::addr($w,short)] {
                                0   { lappend short_result $w }
                                1   { lappend short_result $::ms::addr($w,short) }
                            }
                        }

                        return $short_result
                    }
                }
                3   {
                    # Synopsis:
                    #
                    # **grid** **content** *window* ?*-option* *value*?
                    # **grid** **slaves**  *window* ?*-option* *value*?
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid $action $w {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                4   {
                    # Synopsis:
                    #
                    # **grid** **content** ?**short**? *window* ?*-option* *value*?
                    # **grid** **slaves**  ?**short**? *window* ?*-option* *value*?
                    set option [lindex $args 0]
                    set window [lindex $args 1]
                    set args   [lremove $args 0 1]

                    # Check the 'short' option.
                    switch -- $option {
                        short   {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid $action $w {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        set short_result [list ]
                        foreach w $result {
                            # Check if exists a short address for 'w'.
                            switch -- [info exists ::ms::addr($w,short)] {
                                0   { lappend short_result $w }
                                1   { lappend short_result $::ms::addr($w,short) }
                            }
                        }

                        return $short_result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        forget -
        remove {
            # Synopsis:
            #
            # **grid** **forget** *window* ?*window*? ... ?*window*?
            # **grid** **remove** *window* ?*window*? ... ?*window*?
            switch -- [llength $args] {
                0       { ::ms::Error "Invalid number of arguments." $caller_info }
                default {
                    foreach window $args {
                        # Get the 'window' real address.
                        set w [::ms::Check_Pathname $window invalid]
                        switch -- $w {
                            invalid { break }
                        }

                        # Forget/Remove the real address.
                        _grid $action $w

                        # Force the propagation inside any scrollable 'w' ancestor, if any.
                        ::ms::Scrollable_Widgets_Propagation_Mechanism $w
                    }

                    return ""
                }
            }
        }
        info {
            # Synopsis:
            #
            # **grid** **info** ?**short**? *window*
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the 'window' real address and type.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid info $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                2   {
                    set option [lindex $args 0]
                    set window [lindex $args 1]

                    # Check the 'short' option.
                    switch -- $option {
                        short   {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Get the 'window' real address and type.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid info $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        switch -- $result {
                            ""      { return "" }
                            default {
                                # Note: The 'grid info' command returns an option/value list that
                                #       will always contain the '-in' option value at index '1'.

                                set in_addr_real [lindex $result 1]

                                # Check if exists a short address for 'in_addr_real'.
                                switch -- [info exists ::ms::addr($in_addr_real,short)] {
                                    1   { set result [lreplace $result 1 1 $::ms::addr($in_addr_real,short)] }
                                }

                                return $result
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        location {
            # Synopsis:
            #
            # **grid** **location** *window* x y
            switch -- [llength $args] {
                3   {
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid location $w {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        size {
            # Synopsis:
            #
            # **grid** **size** *window*
            switch -- [llength $args] {
                1   {
                    set window [lindex $args 0]

                    # Get the 'window' real address.
                    set w [::ms::Check_Pathname $window invalid]
                    switch -- $w {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                    }

                    # Execute the command.
                    try {
                        _grid size $w
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
            # Note: Differently from Tk, the 'grid' command do not accepts
            #       shortforms ('-', 'x' and '^').

            # Synopsis:
            #
            # **grid** *window* ?*window*? ... ?*window*? ?*-option* *value*? ... ?*-option* *value*?
            set window $action

            # Get the 'window' real address.
            set w [::ms::Check_Pathname $window invalid]
            switch -- $w {
                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                default { set addresses [list $w] }
            }

            # Check if there are other addresses.
            set remaining_args $args
            foreach arg $args {
                switch -- [string index $arg 0] {
                    "." {
                        set window $arg

                        # Get the 'window' real address.
                        set w [::ms::Check_Pathname $window invalid]
                        switch -- $w {
                            invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                            default {
                                lappend addresses  $w
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
                    # Check if the '-in' option was provided.
                    set index [lsearch -exact $args "-in"]
                    switch -- $index {
                        -1      {}
                        default {
                            # '-in'
                            set in_addr [lindex $args $index+1]

                            # Get the 'in_addr' real address.
                            set in_addr_real [::ms::Check_Pathname $in_addr invalid]
                            switch -- $in_addr_real {
                                invalid { ::ms::Error "Invalid address, '$in_addr'." $caller_info }
                                default { set args [lreplace $args $index+1 $index+1 $in_addr_real] }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _grid {*}$addresses {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            }

            # Check each address that has been gridded.
            foreach w $addresses {
                # Check if 'w' is a scrollable widget.
                if { $w in $::ms::addr(megawidgets,scrollable) } {
                    # If 'w' classtype is a canvas, listbox, scrollbar, text or treeview widgets, update its scrollbar if needed.
                    # The listbox, scrollbar and treeview widgets are not containers, their scrollbars update needs to be launched
                    # the moment they are positioned on screen.
                    # For safeguarding we will do the same for canvas and text widgets because even if they are containers,
                    # they normally don't contain any widgets (no harm will be done if they contains widgets).
                    switch -- $::ms::data($w,classtype) {
                        canvas    -
                        listbox   -
                        scrollbar -
                        text      -
                        treeview  { [string cat "::ms::" $::ms::data($w,classtype) "::Scrollbar_Update"] $w }
                    }
                }
            }

            # Force the propagation inside the grid container ('in_addr_real').
            ::ms::Scrollable_Widgets_Propagation_Mechanism [lindex $addresses 0]

            return ""
        }
    }
}

#*EOF*