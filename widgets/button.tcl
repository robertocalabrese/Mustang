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
package provide ::ms::button 0.1

##############################
##                          ##
##     _BUTTON BINDINGS     ##
##                          ##
##############################

# Activate/Deactivate
_bind _Button <Activate>   { ::ms::button::Pathname_Cmd %W state !background; break }
_bind _Button <Deactivate> { ::ms::button::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Button <ButtonPress-1> { ::ms::button::ButtonPress %W; break }

# Contextual menu
_bind _Button <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y cmenu; break }

# Destroy
_bind _Button <Destroy> { ::ms::button::Destroy %W; break }

# Enter/Leave
_bind _Button <Enter> { ::ms::button::Pathname_Cmd %W state  hover; break }
_bind _Button <Leave> { ::ms::button::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Button <FocusIn>  { ::ms::button::Focus_In  %W; break }
_bind _Button <FocusOut> { ::ms::button::Focus_Out %W; break }

# Return/KP_Enter/space
_bind _Button <Return>   { ::ms::button::Invoke %W; break }
_bind _Button <KP_Enter> { ::ms::button::Invoke %W; break }
_bind _Button <space>    { ::ms::button::Invoke %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Button <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Button <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Button <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Button <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

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
_bind _Button <TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D units; break }

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
_bind _Button <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **button** package.
namespace eval ::ms::button {
    # Set the 'non styleable' button option list.
    set ::ms::button(non_styleable,options) [list class \
                                                  cmenu \
                                                  command \
                                                  default \
                                                  state \
                                                  style \
                                                  takefocus \
                                                  text \
                                                  textvariable \
                                                  underline];

    # Set the 'styleable' button option list.
    set ::ms::button(styleable,options) [list anchor \
                                              background \
                                              bordercolor \
                                              borderwidth \
                                              charwidth \
                                              compound \
                                              cursor \
                                              darkcolor \
                                              font \
                                              foreground \
                                              image \
                                              justify \
                                              lightcolor \
                                              padding \
                                              relief \
                                              shiftrelief];

    # Set the default 'non-styleable' button options values.
    set ::ms::default(button,class)        TButton
    set ::ms::default(button,cmenu)        {}
    set ::ms::default(button,command)      {}
    set ::ms::default(button,default)      normal
    set ::ms::default(button,state)        normal
    set ::ms::default(button,style)        TButton
    set ::ms::default(button,takefocus)    1
    set ::ms::default(button,text)         {}
    set ::ms::default(button,textvariable) {}
    set ::ms::default(button,underline)    -1

    # Note: The default 'styleable' button options values are always defined inside the current theme.
}

# Rename the original Tk **button** and **ttk::button** commands.
rename button      _button
rename ttk::button _ttk_button

# Create aliases for the mustang **button** command.
interp alias {} button      {} ::ms::button::Command
interp alias {} ttk::button {} ::ms::button::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Replace the Tk **ttk::button** widget command.
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
proc ::ms::button::Command { window { args "" } } {
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
            set ::ms::default($w,class)        $::ms::default(button,class)
            set ::ms::default($w,cmenu)        $::ms::default(button,cmenu)
            set ::ms::default($w,command)      $::ms::default(button,command)
            set ::ms::default($w,default)      $::ms::default(button,default)
            set ::ms::default($w,state)        $::ms::default(button,state)
            set ::ms::default($w,style)        $::ms::default(button,style)
            set ::ms::default($w,takefocus)    $::ms::default(button,takefocus)
            set ::ms::default($w,text)         $::ms::default(button,text)
            set ::ms::default($w,textvariable) $::ms::default(button,textvariable)
            set ::ms::default($w,underline)    $::ms::default(button,underline)

            # Set the current widget (not styleable) options.
            set ::ms::current($w,class)        $::ms::default(button,class)
            set ::ms::current($w,cmenu)        $::ms::default(button,cmenu)
            set ::ms::current($w,command)      $::ms::default(button,command)
            set ::ms::current($w,default)      $::ms::default(button,default)
            set ::ms::current($w,state)        $::ms::default(button,state)
            set ::ms::current($w,style)        $::ms::default(button,style)
            set ::ms::current($w,takefocus)    $::ms::default(button,takefocus)
            set ::ms::current($w,text)         $::ms::default(button,text)
            set ::ms::current($w,textvariable) $::ms::default(button,textvariable)
            set ::ms::current($w,underline)    $::ms::default(button,underline)

            # Set the widget variable needed for internal mechanisms.
            set ::ms::data($w,classtype) button

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
            #       To make a button styleable option managed by the developer, just set your desired value
            #       for that option through the create or configure command, like:
            #
            #           **button** *window* **-background** red
            #       or
            #           *window* **configure** **-background** red
            set ::ms::managed_by($w,anchor)      Tk
            set ::ms::managed_by($w,background)  Tk
            set ::ms::managed_by($w,bordercolor) Tk
            set ::ms::managed_by($w,borderwidth) Tk
            set ::ms::managed_by($w,charwidth)   Tk
            set ::ms::managed_by($w,compound)    Tk
            set ::ms::managed_by($w,cursor)      Tk
            set ::ms::managed_by($w,darkcolor)   Tk
            set ::ms::managed_by($w,font)        Tk
            set ::ms::managed_by($w,foreground)  Tk
            set ::ms::managed_by($w,image)       Tk
            set ::ms::managed_by($w,justify)     Tk
            set ::ms::managed_by($w,lightcolor)  Tk
            set ::ms::managed_by($w,padding)     Tk
            set ::ms::managed_by($w,relief)      Tk
            set ::ms::managed_by($w,shiftrelief) Tk
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
proc ::ms::button::Pathname_Cmd { w cmd args } {}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any button widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::button::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*