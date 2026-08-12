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
#   *option*             --> A mandatory parameter that must be substituted with a proper value.
#   **option**           --> The command name or a mandatory parameter that must be written verbatim.
#
#   ?*option*?           --> An optional parameter that must be substituted with a proper value.
#   ?**option**?         --> An optional parameter that must be written verbatim.
#
#   ?*option* *value*?   --> An optional 'key-value' parameter that must be substituted with proper values.
#   ?**option** *value*? --> An optional 'key-value' parameter where the former must be written verbatim and
#                            the latter must be substituted with a proper value.

# Symbols meanings that may be used by the widget infos:
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
package provide ::ms::notebook 0.1

################################
##                            ##
##     _NOTEBOOK BINDINGS     ##
##                            ##
################################

# Activate/Deactivate
_bind _Notebook <Activate>   { ::ms::notebook::Pathname_Cmd %W state !background; break  }
_bind _Notebook <Deactivate> { ::ms::notebook::Pathname_Cmd %W state  background; break  }

# ButtonPress-1
_bind _Notebook <ButtonPress-1> { ::ms::notebook::Select_Tab %W %x %y; break  }

# Configure
_bind _Notebook <Configure> { ::ms::notebook::Configure %W; break  }

# Contextual menu
_bind _Notebook <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break  }

# Cursor Management
_bind _Notebook <Motion> { ::ms::notebook::Set_Cursor   %W %x %y; break  }
_bind _Notebook <Enter>  { ::ms::notebook::Reset_Cursor %W; break  }
_bind _Notebook <Leave>  { ::ms::notebook::Reset_Cursor %W; break  }

# Destroy
_bind _Notebook <Destroy> { ::ms::notebook::Destroy %W; break  }

# Enter/Leave
_bind _Notebook <Enter> [list +::ms::notebook::Hover %W %X %Y]
_bind _Notebook <Leave> [list +::ms::notebook::Hover %W %X %Y]

# FocusIn/FocusOut
_bind _Notebook <FocusIn>  { ::ms::notebook::FocusIn  %W; break }
_bind _Notebook <FocusOut> { ::ms::notebook::FocusOut %W; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Notebook <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Notebook <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Notebook <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Notebook <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one unit left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one unit up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Notebook <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

# This binding movement will happen on two different planes, horizontal (1) and vertical (2).
# These two planes may involve different widgets depending on the active scrollbars on them and on the
# touchpad direction.
#   1 - Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
#       and move that scrollbar by one page left or right (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the horizontal axis.
#
#   2 - Try to find the innermost widget's scrollable parent with an active vertical scrollbar
#       and move that scrollbar by one page up or down (depending on the touchpad direction).
#       If none of the widget's parent meets the required condition, don't do anything on the vertical axis.
_bind _Notebook <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **notebook** package.
namespace eval ::ms::notebook {
    # Set the 'non-styleable' notebook option list.
    set ::ms::notebook(non_styleable,options) [list class \
                                                    cmenu \
                                                    height \
                                                    state \
                                                    style \
                                                    takefocus \
                                                    width];

    # Set the 'styleable' notebook option list.
    set ::ms::notebook(styleable,options) [list background \
                                                bordercolor \
                                                cursor \
                                                darkcolor \
                                                lightcolor \
                                                tabposition];

    # Set the default 'non-styleable' notebook options values.
    set ::ms::default(notebook,class)     TNotebook
    set ::ms::default(notebook,cmenu)     {}
    set ::ms::default(notebook,height)    0
    set ::ms::default(notebook,state)     normal
    set ::ms::default(notebook,style)     TNotebook
    set ::ms::default(notebook,takefocus) 0
    set ::ms::default(notebook,width)     0

    # Note: The default 'styleable' notebook options values are always defined inside the current theme.
}

# Rename the original Tk **ttk::notebook** command.
rename ttk::notebook _ttk_notebook

# Create aliases for the mustang **notebook** command.
interp alias {} notebook      {} ::ms::notebook::Command
interp alias {} ttk::notebook {} ::ms::notebook::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::notebook** widget command.
#
# Where:
#
# window   Should be the widget pathname address to create.
#          This address should be unique and all the parents addresses should exists already.
#          *Window* can either be a real or short address.
#
# args     Should be one or more option-value pairs to configure various aspects of the widget.
#          Any acceptable widget options may be specified.
#          See 'WIDGET OPTIONS' above for more info.
#
# Returns the pathname of the new window created.
proc ::ms::notebook::Command { window { args "" } } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the 'window' address and set its real and short addresses.
    set addresses  [::ms::Check_Widget_Address $window $caller_info]
    set w          [lindex $addresses 0]
    set short_addr [lindex $addresses 1]

    # Check that the widget's 'args' forms a valid 'option/value' list.
    switch -- [expr { [llength $args]%2 }] {
        0   {
            # Remove any duplicated options (retain only the last ones).
            set args [lsort -increasing -stride 2 -index 0 -unique $args]

            ###############################################
            ##                                           ##
            ##     INITIALIZE THE WIDGET'S VARIABLES     ##
            ##                                           ##
            ###############################################

            # Set the default widget (not styleable) options.
            set ::ms::default($w,class)     $::ms::default(notebook,class)
            set ::ms::default($w,cmenu)     $::ms::default(notebook,cmenu)
            set ::ms::default($w,height)    $::ms::default(notebook,height)
            set ::ms::default($w,state)     $::ms::default(notebook,state)
            set ::ms::default($w,style)     $::ms::default(notebook,style)
            set ::ms::default($w,takefocus) $::ms::default(notebook,takefocus)
            set ::ms::default($w,width)     $::ms::default(notebook,width)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)     $::ms::default(notebook,class)
            set ::ms::current($w,cmenu)     $::ms::default(notebook,cmenu)
            set ::ms::current($w,height)    $::ms::default(notebook,height)
            set ::ms::current($w,state)     $::ms::default(notebook,state)
            set ::ms::current($w,style)     $::ms::default(notebook,style)
            set ::ms::current($w,takefocus) $::ms::default(notebook,takefocus)
            set ::ms::current($w,width)     $::ms::default(notebook,width)

            # Set some widget variables needed for internal mechanisms.
            set ::ms::data($w,classtype) notebook
            set ::ms::data($w,cursor)    ""

            # Set each styleable option to be managed by Tk.
            #
            # Note: developer --> The 'option' will be managed directly by the developer and will not follow
            #                     the relative style indications, mappings included.
            #
            #       Tk        --> The 'option' will be managed directly by Tk by following the relative
            #                     style indications, mappings included (unless stated otherwise in the 'option' info).
            #
            #       Each styleable option will always start as managed by Tk.
            #
            #       Once a styleable option is set to be managed by the developer, it will not be possible
            #       to change it back to be managed by Tk.
            #
            #       To make a notebook styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **notebook** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,background)  Tk
            set ::ms::managed_by($w,bordercolor) Tk
            set ::ms::managed_by($w,cursor)      Tk
            set ::ms::managed_by($w,darkcolor)   Tk
            set ::ms::managed_by($w,lightcolor)  Tk
            set ::ms::managed_by($w,tabposition) Tk

            #################################################
            ##                                             ##
            ##     CHECK THE WIDGET'S OPTIONS PROVIDED     ##
            ##                                             ##
            #################################################

            # Check the remaining options, if any.
            foreach { option value } $args {
                switch -nocase -- $option {
                    -background {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,background)    $value
                        set ::ms::managed_by($w,background) developer
                    }
                    -bordercolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,bordercolor)    $value
                        set ::ms::managed_by($w,bordercolor) developer
                    }
                    -class { set ::ms::current($w,class) $value }
                    -cmenu {
                        set value [string trim $value]
                        if { ($value eq "") || ($value in $::ms::addr(cmenu)) } {
                            set ::ms::current($w,cmenu) $value
                        }
                    }
                    -cursor {
                        set value [string tolower $value]
                        if { ($value eq "") || ($value in $::ms::machine(os,cursors)) } {
                            set ::ms::current($w,cursor)    $value
                            set ::ms::managed_by($w,cursor) developer
                        }
                    }
                    -darkcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,darkcolor)    $value
                        set ::ms::managed_by($w,darkcolor) developer
                    }
                    -height {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,height) $value
                    }
                    -lightcolor {
                        set value [::ms::Check_Color $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,lightcolor)    $value
                        set ::ms::managed_by($w,lightcolor) developer
                    }
                    -state {}
                    -style {
                        if { $value in $::ms::style($::ms::theme) } {
                            # Check if exists a layout for the style provided.
                            # If not, create one by mirroring the current theme 'TNotebook' layout.
                            if { $value ni $::ms::layouts($::ms::theme) } {
                                _ttk_style layout $value [_ttk_style layout TNotebook]
                            }

                            set ::ms::current($w,style) $value
                        }
                    }
                    -tabposition {
                        set value [string tolower $value]
                        switch -- $value {
                            e   -
                            en  -
                            es  -
                            n   -
                            ne  -
                            nw  -
                            s   -
                            se  -
                            sw  -
                            w   -
                            wn  -
                            ws  {
                                set ::ms::current($w,tabposition)    $value
                                set ::ms::managed_by($w,tabposition) developer
                            }
                            default { continue }
                        }
                    }
                    -takefocus {
                        switch -nocase -- $value {
                            0        -
                            no       -
                            off      -
                            false    -
                            disabled { set ::ms::current($w,takefocus) 0 }
                            1        -
                            yes      -
                            on       -
                            true     -
                            enabled  { set ::ms::current($w,takefocus) 1 }
                        }
                    }
                    -width {
                        set value [::ms::Check_Measure $value invalid]
                        switch -- $value {
                            invalid { continue }
                        }

                        set ::ms::current($w,width) $value
                    }
                }
            }

            # Set the default value for each of the notebook styleable options and if the option is managed by Tk, set also its current value.
            foreach option $::ms::notebook(styleable,options) {
                set ::ms::default($w,$option) $::ms::styleopt($::ms::theme,TNotebook,$option)

                switch -- $::ms::managed_by($w,$option) {
                    Tk  {
                        switch -- [info exists ::ms::styleopt($::ms::theme,$::ms::current($w,style),$option)] {
                            0   { set ::ms::current($w,$option) $::ms::default($w,$option) }
                            1   { set ::ms::current($w,$option) $::ms::styleopt($::ms::theme,$::ms::current($w,style),$option) }
                        }
                    }
                }
            }

            ###############################
            ##                           ##
            ##     CREATE THE WIDGET     ##
            ##                           ##
            ###############################

            # Note: The notebook client 'background' and 'cursor' are not allowed to change if the statespec changes.

            # Note: The notebook tabs 'compound', 'cursor', 'focuscolor', 'focussolid' and 'font' are not allowed
            #       to change if the statespec changes.

            ######################
            ##                  ##
            ##     NOTEBOOK     ##
            ##                  ##
            ######################

            set background  $::ms::styleopt($::ms::theme,TNotebook.Tab,background)
            set bordercolor $::ms::styleopt($::ms::theme,TNotebook.Tab,bordercolor)
            set compound    $::ms::styleopt($::ms::theme,TNotebook.Tab,compound)
            set cursor      $::ms::styleopt($::ms::theme,TNotebook.Tab,cursor)
            set focuscolor  $::ms::styleopt($::ms::theme,TNotebook.Tab,focuscolor)
            set focussolid  $::ms::styleopt($::ms::theme,TNotebook.Tab,focussolid)
            set font        $::ms::styleopt($::ms::theme,TNotebook.Tab,font)
            set foreground  $::ms::styleopt($::ms::theme,TNotebook.Tab,foreground)

            # Check if '::ms::current($w,style).Tab' exists among the styles known by the current theme.
            set notebook_tab_style [string cat $::ms::current($w,style) ".Tab"]
            if { ($notebook_tab_style in $::ms::style($::ms::theme)) && ($notebook_tab_style ne "TNotebook.Tab") } {
                # Check if a layout exists for '::ms::current($w,style).Tab'.
                # If not, create one by mirroring the 'TNotebook.Tab' layout for the current theme.
                if { $notebook_tab_style ni $::ms::layouts($::ms::theme) } {
                    _ttk_style layout $notebook_tab_style [_ttk_style layout TNotebook.Tab]
                }

                # Get the notebook tabs style extra options, if any.
                foreach option [list  background \
                                     bordercolor \
                                        compound \
                                          cursor \
                                      focuscolor \
                                      focussolid \
                                            font \
                                      foreground] {
                    switch -- [info exists ::ms::styleopt($::ms::theme,$notebook_tab_style,$option)] {
                        1   { set $option $::ms::styleopt($::ms::theme,$notebook_tab_style,$option) }
                    }
                }
            }

            # Register the tab cursor.
            set ::ms::data($w,cursor) $cursor

            # Set the notebook style name.
            set ::ms::style($w,widget) [string cat "_bg="  $::ms::current($w,background) \
                                                   "_bgt=" $background \
                                                   "_bc="  $::ms::current($w,bordercolor) \
                                                   "_bct=" $bordercolor \
                                                   "_cm="  $compound \
                                                   "_dc="  $::ms::current($w,darkcolor) \
                                                   "_fc="  $focuscolor \
                                                   "_fs="  $focussolid \
                                                   "_fn="  $font \
                                                   "_fg="  $foreground \
                                                   "_lc="  $::ms::current($w,lightcolor) \
                                                   "_tp="  $::ms::current($w,tabposition) \
                                                   "." $::ms::current($w,style)];

            # If needed, create the notebook style name.
            if { $::ms::style($w,widget) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,widget)  -background $::ms::current($w,background) \
                                                             -bordercolor $::ms::current($w,bordercolor) \
                                                               -darkcolor $::ms::current($w,darkcolor) \
                                                              -lightcolor $::ms::current($w,lightcolor) \
                                                             -tabposition $::ms::current($w,tabposition);

                # Add the widget style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,widget)
            }

            # Initialize the notebook mapping.
            set mapping [list ]

            # bordercolor
            # Check if a 'bordercolor' mapping exists for '::ms::current($w,style)'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor)] {
                0   { lappend mapping -bordercolor [list pressed $::ms::current($w,bordercolor)] }
                1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),bordercolor) }
            }

            # darkcolor
            # Check if a 'darkcolor' mapping exists for '::ms::current($w,style)'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor)] {
                0   { lappend mapping -darkcolor [list pressed $::ms::current($w,darkcolor)] }
                1   { lappend mapping -darkcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),darkcolor) }
            }

            # lightcolor
            # Check if a 'lightcolor' mapping exists for '::ms::current($w,style)'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor)] {
                0   { lappend mapping -lightcolor [list pressed $::ms::current($w,lightcolor)] }
                1   { lappend mapping -lightcolor $::ms::stylemap($::ms::theme,$::ms::current($w,style),lightcolor) }
            }

            # If needed, create the notebook mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,widget) {*}$mapping

                # Add the notebook mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Create the notebook object.
            _ttk_notebook $w     -class $::ms::current($w,class) \
                                -cursor $::ms::current($w,cursor) \
                                -height $::ms::current($w,height) \
                               -padding 0 \
                                 -style $::ms::style($w,widget) \
                             -takefocus $::ms::current($w,takefocus) \
                                 -width $::ms::current($w,width);

            # Set the widget toplevel.
            set ::ms::addr($w,toplevel) [_winfo toplevel $w]

            ##########################
            ##                      ##
            ##     NOTEBOOK.TAB     ##
            ##                      ##
            ##########################

            # Set the notebook tabs style name.
            set ::ms::style($w,tabs) [string cat $::ms::style($w,widget) ".Tab"]

            # If needed, create the notebook tabs style name.
            if { $::ms::style($w,tabs) ni $::ms::style($::ms::theme,created_by_mustang) } {
                _ttk_style configure $::ms::style($w,tabs)  -background $background \
                                                           -bordercolor $bordercolor \
                                                              -compound $compound \
                                                            -focuscolor $focuscolor \
                                                            -focussolid $focussolid \
                                                                  -font $font \
                                                            -foreground $foreground;

                # Add the notebook tabs style name to the theme styles list created by mustang.
                lappend ::ms::style($::ms::theme,created_by_mustang) $::ms::style($w,tabs)
            }

            # Initialize the notebook tabs mapping.
            set mapping [list ]

            # background
            # Check if a 'background' mapping exists for 'notebook_tab_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,background)] {
                0   { lappend mapping -background [list pressed $background] }
                1   { lappend mapping -background $::ms::stylemap($::ms::theme,$notebook_tab_style,background) }
            }

            # bordercolor
            # Check if a 'bordercolor' mapping exists for 'notebook_tab_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,bordercolor)] {
                0   { lappend mapping -bordercolor [list pressed $bordercolor] }
                1   { lappend mapping -bordercolor $::ms::stylemap($::ms::theme,$notebook_tab_style,bordercolor) }
            }

            # foreground
            # Check if a 'foreground' mapping exists for 'notebook_tab_style'.
            switch -- [info exists ::ms::stylemap($::ms::theme,$notebook_tab_style,foreground)] {
                0   { lappend mapping -foreground [list pressed $foreground] }
                1   { lappend mapping -foreground $::ms::stylemap($::ms::theme,$notebook_tab_style,foreground) }
            }

            # If needed, create the notebook tabs mapping.
            if { $mapping ni $::ms::stylemap($::ms::theme,created_by_mustang) } {
                _ttk_style map $::ms::style($w,tabs) {*}$mapping

                # Add the notebook tabs mapping to the stylemap list containing all the mappings
                # created by mustang for the current theme.
                lappend ::ms::stylemap($::ms::theme,created_by_mustang) $mapping
            }

            # Configure the tab fills for the tabposition specified in the relative Tab style
            # associated to '::ms::style($w,widget)', for the current theme.
            [string cat "::ms::" $::ms::theme "_NotebookTab_Fills"] $::ms::style($w,widget)

            ######################
            ##                  ##
            ##     BINDINGS     ##
            ##                  ##
            ######################

            # Set the new bindtags for the widget.
            switch -- $::ms::current($w,class) {
                TNotebook { bindtags $w [list $w _Notebook TNotebook $::ms::addr($w,toplevel) all] }
                default   { bindtags $w [list $w $::ms::current($w,class) _Notebook TNotebook $::ms::addr($w,toplevel) all] }
            }

            # Add the notebook to the related toplevel keyboard pages navigation bindings.
            ::ms::Enable_Traversal $w

            # Add the notebook to the related toplevel keyboard Tab and mnemonics navigation bindings.
            ::ms::notebook::Enable_Traversal $w

            #####################
            ##                 ##
            ##     CLOSING     ##
            ##                 ##
            #####################

            # Hide the widget pathcommand.
            interp hide {} $w

            # Create an alias for the widget pathcommand.
            lappend ::ms::data($w,token) [interp alias {} $w {} ::ms::notebook::Pathname_Cmd $w]

            # If needed, create an alias for the widget short address pathcommand.
            if { $short_addr ne $w } {
                lappend ::ms::data($w,token) [interp alias {} $short_addr {} ::ms::notebook::Pathname_Cmd $w]
            }

            # Set the border object (where the 'Enter' and 'Leave' event will happen).
            set ::ms::addr($w,border) $w

            # Set the actual widget address (the widget that the developer was intended to build).
            set ::ms::addr($w,widget) $w

            # Set the structure addresses.
            set ::ms::addr($w,structure) [list $w]

            # Set the widget real address relative to its short address, 'short_addr'.
            set ::ms::addr($short_addr,real) $w

            # Set the widget short addresses relative to its real address, 'w'.
            # They will all point to the widget hull object short address.
            set ::ms::addr($w,short)      $short_addr
            set ::ms::addr($w.tabs,short) $short_addr

            # Add the widget real and short address into the list of all available real and short addresses.
            lappend ::ms::addr(reals)  $w
            lappend ::ms::addr(shorts) $short_addr

            # Add the widget address to the notebook widgets real address list.
            lappend ::ms::addr(notebook) $w

            # Add the widget address to the notebook classtype real address list with class '::ms::current($w,class)'.
            lappend ::ms::class($::ms::current($w,class),notebook,addrs) $w

            # Add the widget address to the notebook classtype real address list with style '::ms::current($w,style)'.
            lappend ::ms::style($::ms::current($w,style),notebook,addrs) $w

            # If needed, add '::ms::current($w,style)' to the available styles for the notebook classtype.
            if { $::ms::current($w,style) ni $::ms::style(notebook,classtype) } {
                lappend ::ms::style(notebook,classtype) $::ms::current($w,style)
            }

            # Depending on the address type provided, return the widget real or short address.
            switch -- $type {
                real  { return $w }
                short { return $short_addr }
            }
        }
        default { ::ms::Error "Invalid number of arguments." $caller_info }
    }
}

#####################################
##                                 ##
##     WIDGET PATHNAME COMMAND     ##
##                                 ##
#####################################

## Pathname_Cmd
#
# This procedure replaces the Tk widget address command.
#
# Where:
#
# w      Should be the widget real address involved.
#
# cmd    Should be the widget command to use.
#        The aliased command will provided this data.
#
# args   Contains the options needed by the 'cmd', if any.
#        The aliased command will provided this data.
#
# Returned values depends on the 'cmd' provided.
proc ::ms::notebook::Pathname_Cmd { w cmd args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check the command provided.
    switch -nocase -- $cmd {
        add {
            # Synopsis:
            #
            # *window* **add** *subwindow* ?*option value*? ... ?*option value*?
            set subwindow [lindex  $args 0]
            set args      [lremove $args 0]

            # Get the 'subwindow' real address.
            set result [::ms::Check_Pathname $subwindow invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$subwindow'." $caller_info }
                default { set subwindow [lindex $result 0] }
            }

            # Check that the 'subwindow' provided is a direct child of the notebook widget.
            if { [_winfo parent $subwindow] ne $w } {
                return ""
            }

            # Check that the command 'args' forms a valid 'option/value' list.
            switch -- [expr { [llength $args]%2 }] {
                0       {}
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Register and remove the '-prehook' and '-posthook' tab options, if any.
            foreach word [list -posthook \
                                -prehook] {
                set option [string range $word 1 end]
                set index  [lsearch -exact $args $word]
                switch -- $index {
                    -1      { set ::ms::data($subwindow,$option) "" }
                    default {
                        set ::ms::data($subwindow,$option) [lindex $args $index+1]
                        set args [lremove $args $index $index+1]
                    }
                }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w add $subwindow {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        cget {
            # Synopsis:
            #
            # *window* **cget** *option*
            switch -- [llength $args] {
                0   { ::ms::Error "Missing cget option." $caller_info }
                1   {
                    # Check if the option provided is a valid 'styleable' or 'non-styleable' option.
                    set option [string range $args 1 end]
                    if { ($option in $::ms::notebook(non_styleable,options)) || ($option in $::ms::notebook(styleable,options))} {
                        return $::ms::current($w,$option)
                    } else {
                        ::ms::Error "Invalid option, '$args'." $caller_info
                    }
                }
                default { ::ms::Error "Invalid option, '$args'." $caller_info }
            }
        }
        configure {}
        forget {
            # Synopsis:
            #
            # *window* **forget** *tabid*

            # Check if the 'tabid' provided is a tab index.
            switch -- [string is integer -strict $args] {
                0   {
                    # Check if the 'tabid' provided is the word 'current'.
                    switch -nocase -- $args {
                        current { set tabid "current" }
                        default {
                            # Check if the 'tabid' provided is a short address.
                            set result [::ms::Check_Pathname $args invalid]
                            switch -- $result {
                                invalid {
                                    # Check if the 'tabid' provided is a positional specification of the form '@x,y'.
                                    switch -- [lindex $args 0] {
                                        "@" {
                                            set position [split [string range $args 1 end] ","]
                                            foreach coordinate $position {
                                                switch -- [string is integer -strict $coordinate] {
                                                    0   { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                                }
                                            }

                                            set tabid $args
                                        }
                                        default { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                    }
                                }
                                default { set tabid [lindex $result 0] }
                            }
                        }
                    }
                }
                1   { set tabid $args }
            }

            # Get the tabid address.
            set tabid_index [interp invokehidden {} $w index $tabid]
            set tabid_addr  [lindex [interp invokehidden {} $w tabs] $tabid_index]

            # Remove the '-posthook' and '-prehook' options.
            unset -nocomplain -- ::ms::data($tabid_addr,posthook) \
                                 ::ms::data($tabid_addr,prehook);

            # Execute the command.
            try {
                interp invokehidden {} $w forget $tabid
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        hide {
            # Synopsis:
            #
            # *window* **hide** *tabid*

            # Check if the 'tabid' provided is a tab index.
            switch -- [string is integer -strict $args] {
                0   {
                    # Check if the 'tabid' provided is the word 'current'.
                    switch -nocase -- $args {
                        current { set tabid "current" }
                        default {
                            # Check if the 'tabid' provided is a short address.
                            set result [::ms::Check_Pathname $args invalid]
                            switch -- $result {
                                invalid {
                                    # Check if the 'tabid' provided is a positional specification of the form '@x,y'.
                                    switch -- [lindex $args 0] {
                                        "@" {
                                            set position [split [string range $args 1 end] ","]
                                            foreach coordinate $position {
                                                switch -- [string is integer -strict $coordinate] {
                                                    0   { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                                }
                                            }

                                            set tabid $args
                                        }
                                        default { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                    }
                                }
                                default { set tabid [lindex $result 0] }
                            }
                        }
                    }
                }
                1   { set tabid $args }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w hide $tabid
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        identify {
            # Synopsis:
            #
            # *window* **identify** *component* *x* *y*
            #    *window* **identify** **element** *x* *y*
            #    *window* **identify** **tab** *x* *y*
             try {
                interp invokehidden {} $w $cmd {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                # Check the subcommand provided.
                switch -- [lindex $args 0] {
                    element {
                        switch -- $result {
                            label   { set result "Notebook.tab" }
                            default { set result "Notebook.client" }
                        }
                    }
                }

                return $result
            }
        }
        index {
            # Synopsis:
            #
            # *window* **index** *tabid*

            # Check if the 'tabid' provided is a tab index.
            switch -- [string is integer -strict $args] {
                0   {
                    # Check if the 'tabid' provided is the word 'end' or 'current'.
                    switch -nocase -- $args {
                        end     { set tabid "end" }
                        current { set tabid "current" }
                        default {
                            # Check if the 'tabid' provided is a short address.
                            set result [::ms::Check_Pathname $args invalid]
                            switch -- $result {
                                invalid {
                                    # Check if the 'tabid' provided is a positional specification of the form '@x,y'.
                                    switch -- [lindex $args 0] {
                                        "@" {
                                            set position [split [string range $args 1 end] ","]
                                            foreach coordinate $position {
                                                switch -- [string is integer -strict $coordinate] {
                                                    0   { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                                }
                                            }

                                            set tabid $args
                                        }
                                        default { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                    }
                                }
                                default { set tabid [lindex $result 0] }
                            }
                        }
                    }
                }
                1   { set tabid $args }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w index $tabid
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        insert {
            # Synopsis:
            #
            # *window* **insert** *pos* *subwindow* ?*option value*? ... ?*option value*?
            set pos       [lindex  $args 0]
            set subwindow [lindex  $args 1]
            set args      [lremove $args 0 1]

            # Check the tab position provided.
            switch -- [string is integer -strict $pos] {
                0   {
                    # Check if the 'pos' provided is the word 'end'.
                    switch -nocase -- $pos {
                        end     { set pos "end" }
                        default {
                            # Check if the 'pos' provided is a short address.
                            set result [::ms::Check_Pathname $pos invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid tab option, '$pos'." $caller_info }
                                default {
                                    # Check if the pos real address is an already managed subwindow.
                                    if { [lindex $result 0] ni [interp invokehidden {} $w tabs] } {
                                        ::ms::Error "Invalid tab option, '$pos'." $caller_info
                                    } else {
                                        set pos [lindex $result 0]
                                    }
                                }
                            }
                        }
                    }
                }
                1   {
                    if { $pos < 0 } {
                        ::ms::Error "Invalid tab option, '$pos'." $caller_info
                    }
                }
            }

            # Get the 'subwindow' real address.
            set result [::ms::Check_Pathname $subwindow invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid address, '$subwindow'." $caller_info }
                default { set subwindow [lindex $result 0] }
            }

            # Check that the 'subwindow' provided is a direct child of the notebook widget.
            if { [_winfo parent $subwindow] ne $w } {
                return ""
            }

            # Check that the command 'args' forms a valid 'option/value' list.
            switch -- [expr { [llength $args]%2 }] {
                0       {}
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Register and remove the '-prehook' and '-posthook' tab options, if any.
            foreach word [list -posthook \
                                -prehook] {
                set option [string range $word 1 end]
                set index  [lsearch -exact $args $word]
                switch -- $index {
                    -1      { set ::ms::data($subwindow,$option) "" }
                    default {
                        set ::ms::data($subwindow,$option) [lindex $args $index+1]
                        set args [lremove $args $index $index+1]
                    }
                }
            }

            # Execute the command.
            try {
                interp invokehidden {} $w insert $pos $subwindow {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok {} {
                return ""
            }
        }
        instate {
            # Synopsis:
            #
            # *window* **instate** *statespec* ?*script*?
            switch -- [llength $args] {
                0   { ::ms::Error "Missing statespec." $caller_info }
                1   {
                    set statespec $args

                    # Check the 'statespec' provided.
                    switch -- $statespec {
                        ""      -
                        normal  { set statespec $::ms::data(statespec,normal) }
                        default {
                            foreach state $statespec {
                                switch -- [::ms::Check_State $state] {
                                    invalid { ::ms::Error "Invalid statespec, '$state'." $caller_info }
                                }
                            }
                        }
                    }

                    # Execute the command.
                    return [interp invokehidden {} $w instate $statespec]
                }
                2   {
                    set statespec [lindex $args 0]
                    set script    [lindex $args 1]

                    # Check the 'statespec' provided.
                    switch -- $statespec {
                        ""      -
                        normal  { set statespec $::ms::data(statespec,normal) }
                        default {
                            foreach state $statespec {
                                switch -- [::ms::Check_State $state] {
                                    invalid { ::ms::Error "Invalid statespec, '$state'." $caller_info }
                                }
                            }
                        }
                    }

                    # Execute the command.
                    try {
                        interp invokehidden {} $w instate $statespec $script
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        select {
            # Synopsis:
            #
            # *window* **select** ?*tabid*?
            switch -- [llength $args] {
                0       { return [interp invokehidden {} $w select] }
                default {
                    # Check if the 'tabid' provided is a tab index.
                    switch -- [string is integer -strict $args] {
                        0   {
                            # Check if the 'tabid' provided is the word 'current'.
                            switch -nocase -- $args {
                                current { set tabid "current" }
                                default {
                                    # Check if the 'tabid' provided is a short address.
                                    set result [::ms::Check_Pathname $args invalid]
                                    switch -- $result {
                                        invalid {
                                            # Check if the 'tabid' provided is a positional specification of the form '@x,y'.
                                            switch -- [lindex $args 0] {
                                                "@" {
                                                    set position [split [string range $args 1 end] ","]
                                                    foreach coordinate $position {
                                                        switch -- [string is integer -strict $coordinate] {
                                                            0   { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                                        }
                                                    }

                                                    set tabid $args
                                                }
                                                default { ::ms::Error "Invalid tabid, '$args'." $caller_info }
                                            }
                                        }
                                        default { set tabid [lindex $result 0] }
                                    }
                                }
                            }
                        }
                        1   { set tabid $args }
                    }

                    # Execute the command.
                    try {
                        interp invokehidden {} $w select $tabid
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok {} {
                        return ""
                    }
                }
            }
        }
        state {}
        style {}
        tab {}
        tabs {}
        default { ::ms::Error "Invalid option, '$cmd'." $caller_info }
    }
}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any notebook widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::notebook::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*