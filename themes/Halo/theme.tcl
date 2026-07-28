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
# terms specified inset ::ms::metadata(Halo, this license.
package provide ttk::theme::Halo 0.1

# Set the theme metadata.
set ::ms::metadata(Halo,author)  "Roberto Calabrese a.k.a Kicka"
set ::ms::metadata(Halo,country) Italy
set ::ms::metadata(Halo,email)   robertocalabrese75@gmail.com
set ::ms::metadata(Halo,parent)  clam
set ::ms::metadata(Halo,year)    2025

# Check the windowing system.
switch -- [_tk windowingsystem] {
    aqua  -
    win32 {
        set ::ms::size(Halo,arrow_down)         2.51m
        set ::ms::size(Halo,grip)               25.0m
        set ::ms::size(Halo,preview_height)     6.0m
        set ::ms::size(Halo,preview_width)      10.0m
        set ::ms::size(Halo,sash)               2.0m
        set ::ms::size(Halo,scrollbar)          3.0m
        set ::ms::size(Halo,spacer)             3.0m
        set ::ms::size(Halo,treeview_indicator) 4.0m

    }
    default {
        # In order to have the objects size at fixed millimeters we need to be take in account the current UI scale factor.
        set ::ms::size(Halo,arrow_down)         [string cat [expr { int(ceil(2.51*$::ms::scale*0.01)) }] "m"]
        set ::ms::size(Halo,grip)               [string cat [expr { int(ceil(25.0*$::ms::scale*0.01)) }] "m"]
        set ::ms::size(Halo,sash)               [string cat [expr { int(ceil(2.0*$::ms::scale*0.01))  }] "m"]
        set ::ms::size(Halo,scrollbar)          [string cat [expr { int(ceil(2.7*$::ms::scale*0.01))  }] "m"]
        set ::ms::size(Halo,spacer)             [string cat [expr { int(ceil(3.0*$::ms::scale*0.01))  }] "m"]
        set ::ms::size(Halo,treeview_indicator) [string cat [expr { int(ceil(4.0*$::ms::scale*0.01))  }] "m"]

        # Set the Preview dimensions with the golden ratio (width = height * 1.618).
        set ::ms::size(Halo,preview_height) [string cat [expr { int(ceil(6.0*$::ms::scale*0.01))  }] "m"]
        set ::ms::size(Halo,preview_width)  [string cat [expr { int(ceil(10.0*$::ms::scale*0.01)) }] "m"]
    }
}

# Set the Halo theme svg image dataset table array (3 columns).
# The first column of the table represents the svg input filenames without the extension.
# The second column of the table represents the colors of the svg input images.
# The third column of the table represents the colors of the svg output images.
#
# Note that all the original svg images are drawn with a blue accent color with a light colorscheme in mind.
set ::ms::svg(Halo,svg_dataset) [list arrow_down                          #424242 Arrow \
                                      arrow_down_disabled                 #d8d8d8 ArrowDisabled \
                                      arrow_down_hover                    #007aff Accent \
                                      arrow_down_invalid                  #fefefe Text \
                                      arrow_down_pressed                  #4f5152 ArrowPressed \
                                      arrow_up                            #424242 Arrow \
                                      arrow_up_disabled                   #d8d8d8 ArrowDisabled \
                                      arrow_up_hover                      #007aff Accent \
                                      arrow_up_invalid                    #fefefe Text \
                                      arrow_up_pressed                    #4f5152 ArrowPressed \
                                      check_off                           #a4a6a8 BordercolorAlternate \
                                      check_off_disabled                  #cccccc BordercolorDisabled \
                                      check_off_hover                     #007aff Accent \
                                      check_off_pressed                   #0169d9 HighlightAlternate \
                                      check_on                            #007aff Accent \
                                      check_on_disabled                   #cccccc BordercolorDisabled \
                                      check_on_hover                      #007aff Accent \
                                      check_on_pressed                    #0169d9 HighlightAlternate \
                                      radio_off                           #a4a6a8 BordercolorAlternate \
                                      radio_off_disabled                  #cccccc BordercolorDisabled \
                                      radio_off_hover                     #007aff Accent \
                                      radio_off_pressed                   #0169d9 HighlightAlternate \
                                      radio_on                            #007aff Accent \
                                      radio_on_disabled                   #cccccc BordercolorDisabled \
                                      radio_on_hover                      #007aff Accent \
                                      radio_on_pressed                    #0169d9 HighlightAlternate \
                                      scale_thumb                         #007aff Accent \
                                      scale_thumb_disabled                #4f5152 ScaleThumbDisabled \
                                      scale_thumb_pressed                 #0169d9 HighlightAlternate \
                                      scale_trough_horizontal             #a4a6a8 ScaleTrough \
                                      scale_trough_horizontal_disabled    #cccccc ScaleTroughDisabled \
                                      scale_trough_horizontal_focus       #9fbfdf Highlight \
                                      scale_trough_vertical               #a4a6a8 ScaleTrough \
                                      scale_trough_vertical_disabled      #cccccc ScaleTroughDisabled \
                                      scale_trough_vertical_focus         #9fbfdf Highlight \
                                      sizegrip                            #a4a6a8 BordercolorAlternate \
                                      sizegrip_hover                      #007aff Accent \
                                      sizegrip_pressed                    #0169d9 HighlightAlternate \
                                      spacer                              #9e9a91 Spacer \
                                      spacer_disabled                     #d8d8d8 ArrowDisabled \
                                      spacer_invalid                      #1f1c1b Text \
                                      treeview_indicator_close            #1f1c1b TextAlternate \
                                      treeview_indicator_close_focus      #007aff Accent \
                                      treeview_indicator_open             #1f1c1b TextAlternate \
                                      treeview_indicator_open_focus       #007aff Accent];

# Automatically load all the Halo svg images (if any) and re-color them relative to the current accent color and colorscheme.
::ms::Load_SVG_Images Halo

# The Halo theme is a multi platform theme that works with every operating system.
namespace eval ttk::theme::Halo {
    style theme create "Halo" -parent "clam" -settings {
        # Note: For each style related to a TTK widget:
        #         **Layouts**   commands must be done before any other commands.
        #         **Elements**  commands must be done after the *layouts* commands.
        #         **Configure** commands must be done after *layouts* commands (or *elements* commands if present).
        #         **Map**       commands must be done after a *configure* commands.
        #
        #       For each style related to a classic widget:
        #         **Configure** commands must be done before any *map* commands.
        #         **Map**       commands must be done after a *configure* commands.

        ###################
        ##               ##
        ##     POINT     ##
        ##               ##
        ###################

        # Note: The default style "." is special and it is used as the theme root style on which
        #       the derived default styles are based.

        # Note: The "." widget will follow the Toplevel style unless it is associated to a different style.

        # Normal state
        style configure "."        -background Background \
                                  -bordercolor Bordercolor \
                                  -borderwidth 1 \
                                       -cursor arrow \
                                -insertofftime 300 \
                                 -insertontime 600 \
                                      -padding [list 0] \
                                       -relief solid \
                             -selectbackground White \
                            -selectborderwidth 0 \
                             -selectforeground TextAlternate;
    }
}

#*EOF*