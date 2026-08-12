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
package provide ::ms::palette 0.1

###############################
##                           ##
##     _PALETTE BINDINGS     ##
##                           ##
###############################

# Activate/Deactivate
_bind _Palette <Activate>   { ::ms::palette::Pathname_Cmd %W state !background; break }
_bind _Palette <Deactivate> { ::ms::palette::Pathname_Cmd %W state  background; break }

# ButtonPress-1
_bind _Palette <ButtonPress-1> { ::ms::Focus_The_Widget_Or_Its_Toplevel %W; break }

# Contextual menu
_bind _Palette <<ContextMenu>> { ::ms::Show_ContextMenu %W %X %Y shell; break }

# Destroy
_bind _Palette <Destroy> { ::ms::palette::Destroy %W; break }

# Enter
_bind _Palette <Enter> { ::ms::palette::Pathname_Cmd %W state !hover; break }

# FocusIn/FocusOut
_bind _Palette <FocusIn>  { ::ms::palette::FocusIn  %W; break }
_bind _Palette <FocusOut> { ::ms::palette::FocusOut %W; break }

# Mousewheel and Touchpad

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one unit up or down (depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, don't do anything.
_bind _Palette <MouseWheel> { ::ms::Scroll_Parent_Y %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one unit left or right (depending on the mousewheel direction).
# If none of the widget's parents meets the required condition, don't do anything.
_bind _Palette <Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D units; break }

# Try to find the innermost widget's scrollable parent with an active vertical scrollbar
# and move that scrollbar by one page up or down (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Palette <Control-MouseWheel> { ::ms::Scroll_Parent_Y %W %D pages; break }

# Try to find the innermost widget's scrollable parent with an active horizontal scrollbar
# and move that scrollbar by one page left or right (depending on the mousewheel direction).
# If none of the widget's parent meets the required condition, don't do anything.
_bind _Palette <Control-Shift-MouseWheel> { ::ms::Scroll_Parent_X %W %D pages; break }

# Note: **TouchpadScroll** and **Control-TouchpadScroll** only works on Windows and macOS.
#       On Linux they will be ignored and touchpads movements will be processed as mousewheel events.

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
_bind _Palette <TouchpadScroll> { ::ms::palette::Touchpad %W %# %D; break }

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
_bind _Palette <Control-TouchpadScroll> { ::ms::Touchpad_Parent %W %# %D pages; break }

# Create the mustang **palette** package.
namespace eval ::ms::palette {
    # Set the 'non styleable' palette option list.
    set ::ms::palette(non_styleable,options) [list class \
                                                   cmenu \
                                                   command \
                                                   exportselection \
                                                   maxlength \
                                                   placeholder \
                                                   posthook \
                                                   prehook \
                                                   state \
                                                   style \
                                                   takefocus \
                                                   textvariable \
                                                   values \
                                                   xscrollcommand];

    # Set the 'styleable' palette option list.
    set ::ms::palette(styleable,options) [list arrowcolor \
                                               arrowsize \
                                               background \
                                               bordercolor \
                                               charwidth \
                                               cursor \
                                               darkcolor \
                                               fieldbackground \
                                               focuscolor \
                                               focuswidth \
                                               font \
                                               foreground \
                                               insertcolor \
                                               insertwidth \
                                               justify \
                                               lightcolor \
                                               padding \
                                               placeholderforeground \
                                               rows \
                                               selectbackground \
                                               selectborderwidth \
                                               selectforeground \
                                               shellbackground];

    # Set the default 'non-styleable' palette options values.
    set ::ms::default(palette,class)           TPalette
    set ::ms::default(palette,cmenu)           {}
    set ::ms::default(palette,command)         {}
    set ::ms::default(palette,exportselection) 1
    set ::ms::default(palette,maxlength)       0
    set ::ms::default(palette,placeholder)     {}
    set ::ms::default(palette,posthook)        {}
    set ::ms::default(palette,prehook)         {}
    set ::ms::default(palette,state)           normal
    set ::ms::default(palette,style)           TPalette
    set ::ms::default(palette,takefocus)       1
    set ::ms::default(palette,textvariable)    {}
    set ::ms::default(palette,values)          [list Azure       #0080ff \
                                                     Blue        #0000ff \
                                                     Brown       #964b00 \
                                                     Cyan        #00ffff \
                                                     Green       #00ff00 \
                                                     Lime        #c0ff00 \
                                                     Magenta     #ff00ff \
                                                     "Navy Blue" #000080 \
                                                     Orange      #ffa500 \
                                                     Pink        #ff0080 \
                                                     Purple      #800080 \
                                                     Red         #ff0000 \
                                                     Violet      #8000ff \
                                                     Yellow      #ffff00];
    set ::ms::default(palette,xscrollcommand)  {}
}

# Create aliases for the mustang **palette** command.
interp alias {} palette {} ::ms::palette::Command

############################
##                        ##
##     WIDGET COMMAND     ##
##                        ##
############################

## Command
#
# Create the **palette** widgets command.
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
proc ::ms::palette::Command { window { args "" } } {
    # For the time being return the empty string.
    # Palettes are not covered until the new command is written.
    return ""
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
proc ::ms::palette::Pathname_Cmd { w cmd args } {}

#################################
##                             ##
##     WIDGET STYLE UPDATE     ##
##                             ##
#################################

## Style_Update
#
# Update any palette widget that have stylename as its style.
#
# Where:
#
# stylename     Should be a string that specifies the stylename that was updated.
#
# caller_info   Should be the information on the developer command that generated the call to this procedure.
#
# It doesn't return anything.
proc ::ms::palette::Style_Update { stylename caller_info } {}

######################################
##                                  ##
##     EVENT RELATED PROCEDURES     ##
##                                  ##
######################################

#*EOF*