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
package provide ::ms::checkbutton 0.1

###################################
##                               ##
##     _CHECKBUTTON BINDINGS     ##
##                               ##
###################################

# Activate/Deactivate
_bind _Checkbutton <Activate>   { ::ms::radiobutton::Pathname_Cmd %W state !background; break }
_bind _Checkbutton <Deactivate> { ::ms::radiobutton::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Checkbutton <ButtonPress-1> { ::ms::checkbutton::ButtonPress %W; break }

# Contextual menu
_bind _Checkbutton <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Checkbutton <Destroy> { ::ms::radiobutton::Destroy %W; break }

# Enter/Leave
_bind _Checkbutton <Enter> { ::ms::radiobutton::Hover %W %X %Y; break }
_bind _Checkbutton <Leave> { ::ms::radiobutton::Hover %W %X %Y; break }

# FocusIn/FocusOut
_bind _Checkbutton <FocusIn>  { ::ms::radiobutton::Focus_In  %W; break }
_bind _Checkbutton <FocusOut> { ::ms::radiobutton::Focus_Out %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Checkbutton <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Checkbutton <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Checkbutton <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **checkbutton** package.
namespace eval ::ms::checkbutton {
    # Set the 'non styleable' checkbutton option list.
    set ::ms::checkbutton(non_styleable,options) [list class \
                                                       cmenu \
                                                       command \
                                                       offvalue \
                                                       onvalue \
                                                       state \
                                                       style \
                                                       takefocus \
                                                       text \
                                                       textvariable \
                                                       underline \
                                                       variable];

    # Set the 'styleable' checkbutton option list.
    set ::ms::checkbutton(styleable,options) [list charwidth \
                                                   cursor \
                                                   font \
                                                   foreground \
                                                   highlightcolor \
                                                   image \
                                                   indicatorbackground \
                                                   indicatorforeground \
                                                   indicatorrelief \
                                                   justify \
                                                   padding \
                                                   shellbackground \
                                                   spacer \
                                                   wraplength];

    # Set the default 'non-styleable' checkbutton options values.
    set ::ms::default(checkbutton,class)        TCheckbutton
    set ::ms::default(checkbutton,cmenu)        {}
    set ::ms::default(checkbutton,command)      {}
    set ::ms::default(checkbutton,offvalue)     0
    set ::ms::default(checkbutton,onvalue)      1
    set ::ms::default(checkbutton,state)        normal
    set ::ms::default(checkbutton,style)        TCheckbutton
    set ::ms::default(checkbutton,takefocus)    1
    set ::ms::default(checkbutton,text)         {}
    set ::ms::default(checkbutton,textvariable) {}
    set ::ms::default(checkbutton,underline)    -1
    set ::ms::default(checkbutton,variable)     {}

    # Note: The default 'styleable' checkbutton options values are always defined inside the current theme.
}

# Rename the original Tk **checkbutton** and **ttk::checkbutton** commands.
rename checkbutton      _checkbutton
rename ttk::checkbutton _ttk_checkbutton

# Create aliases for the mustang **checkbutton** command.
interp alias {} checkbutton      {} ::ms::checkbutton::Command
interp alias {} ttk::checkbutton {} ::ms::checkbutton::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **checkbutton** and **ttk::checkbutton** widgets commands.
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
proc ::ms::checkbutton::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(checkbutton,class)
            set ::ms::default($w,cmenu)        $::ms::default(checkbutton,cmenu)
            set ::ms::default($w,command)      $::ms::default(checkbutton,command)
            set ::ms::default($w,offvalue)     $::ms::default(checkbutton,offvalue)
            set ::ms::default($w,onvalue)      $::ms::default(checkbutton,onvalue)
            set ::ms::default($w,state)        $::ms::default(checkbutton,state)
            set ::ms::default($w,style)        $::ms::default(checkbutton,style)
            set ::ms::default($w,takefocus)    $::ms::default(checkbutton,takefocus)
            set ::ms::default($w,text)         $::ms::default(checkbutton,text)
            set ::ms::default($w,textvariable) $::ms::default(checkbutton,textvariable)
            set ::ms::default($w,underline)    $::ms::default(checkbutton,underline)
            set ::ms::default($w,variable)     $::ms::default(checkbutton,variable)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(checkbutton,class)
            set ::ms::current($w,cmenu)        $::ms::default(checkbutton,cmenu)
            set ::ms::current($w,command)      $::ms::default(checkbutton,command)
            set ::ms::current($w,offvalue)     $::ms::default(checkbutton,offvalue)
            set ::ms::current($w,onvalue)      $::ms::default(checkbutton,onvalue)
            set ::ms::current($w,state)        $::ms::default(checkbutton,state)
            set ::ms::current($w,style)        $::ms::default(checkbutton,style)
            set ::ms::current($w,takefocus)    $::ms::default(checkbutton,takefocus)
            set ::ms::current($w,text)         $::ms::default(checkbutton,text)
            set ::ms::current($w,textvariable) $::ms::default(checkbutton,textvariable)
            set ::ms::current($w,underline)    $::ms::default(checkbutton,underline)
            set ::ms::current($w,variable)     $::ms::default(checkbutton,variable)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) checkbutton

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
            #       To make a checkbutton styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **checkbutton** *window* **-shellbackground** red
            #       or
            #           *window* **configure** **-shellbackground** red
            set ::ms::managed_by($w,charwidth)           Tk
            set ::ms::managed_by($w,cursor)              Tk
            set ::ms::managed_by($w,font)                Tk
            set ::ms::managed_by($w,foreground)          Tk
            set ::ms::managed_by($w,highlightcolor)      Tk
            set ::ms::managed_by($w,image)               Tk
            set ::ms::managed_by($w,indicatorbackground) Tk
            set ::ms::managed_by($w,indicatorforeground) Tk
            set ::ms::managed_by($w,indicatorrelief)     Tk
            set ::ms::managed_by($w,justify)             Tk
            set ::ms::managed_by($w,padding)             Tk
            set ::ms::managed_by($w,shellbackground)     Tk
            set ::ms::managed_by($w,spacer)              Tk
            set ::ms::managed_by($w,wraplength)          Tk
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
proc ::ms::checkbutton::Pathname_Cmd { w cmd args } {}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any checkbutton widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::checkbutton::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*