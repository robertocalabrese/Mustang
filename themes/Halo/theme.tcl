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

        ####################
        ##                ##
        ##     BUTTON     ##
        ##                ##
        ####################

        # Note: 'anchor', 'borderwidth', 'charwidth', 'compound', 'cursor', 'font', 'justify', 'padding' and
        #       'shiftrelief' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: The 'image' option supports mapping values but they need to be specified in the normal state declaration as a list.
        #       The first element is the the image name to use in the normal state. The rest of the list is a sequence of statespec/value
        #       pairs as per style map, specifying different images to use when the widget is in a particular state or combination of states.
        #
        #       Note that all images in the list should have the same size.
        #
        #       If an empty string is specified, it indicates that the widget has no image to display.
        #       The image specified should have been allready created at the time the widget is created.
        #
        #       Any 'image' mapping values specified with the style map command will be ignored by mustang.

        # Layout
        style layout TButton {
            Button.border -sticky nswe -children {
                Button.padding -sticky nswe -children {
                    Button.label -sticky nswe
                }
            }
        }

        # Normal state
        style configure TButton      -anchor center \
                                 -background ButtonBackground \
                                -bordercolor ButtonBorder \
                                -borderwidth 2 \
                                  -charwidth -8 \
                                   -compound none \
                                     -cursor arrow \
                                  -darkcolor ButtonBackground \
                                       -font NormalFont \
                                 -foreground ButtonText \
                                      -image {} \
                                    -justify left \
                                 -lightcolor ButtonBorder \
                                    -padding [list 4p 8p 4p 8p] \
                                     -relief sunken \
                                -shiftrelief -2;

        # Mapping
        style map TButton  -background [list {pressed !disabled} ButtonBackgroundPressed] \
                          -bordercolor [list          background BordercolorBackground \
                                                        disabled ButtonBackground] \
                            -darkcolor [list             pressed ButtonBackgroundPressed] \
                           -foreground [list            disabled ButtonTextDisabled \
                                                           focus Accent \
                                                           hover TextAlternate] \
                           -lightcolor [list            disabled ButtonBackground] \
                               -relief [list {pressed !disabled} raised];

        ####################
        ##                ##
        ##     CANVAS     ##
        ##                ##
        ####################

        # Note: The layout is useless because the canvas widget doesn't understand styles, at least not natively.

        # Note: 'shellbackground' is used by scrollable canvases and ignored by simple canvases.

        # Note: 'borderwidth', 'cursor' and 'relief' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # No layout

        # Normal state
        style configure Canvas        -background Background \
                                     -bordercolor Bordercolor \
                                     -borderwidth 0 \
                                          -cursor arrow \
                                -insertbackground Background7 \
                               -insertborderwidth 2 \
                                          -relief flat \
                                -selectbackground FieldbackgroundFocus \
                               -selectborderwidth 0 \
                                -selectforeground FieldbackgroundFocusText \
                                 -shellbackground Background;

        # Mapping
        style map Canvas -bordercolor [list background BordercolorBackground \
                                              disabled BordercolorDisabled \
                                                 hover Accent];

        #########################
        ##                     ##
        ##     CHECKBUTTON     ##
        ##                     ##
        #########################

        # Note: 'background', 'charwidth', 'cursor', 'font', 'indicatorbackground', 'indicatorrelief', 'justify', 'padding',
        #       and 'wraplength' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: 'indicatorbackground', 'indicatorcolor', 'indicatorforeground' and 'indicatorrelief' are setted in a way
        #       that reflects the default checkbutton images colors.
        #       Due to the fact that the Halo theme uses images for the indicator, they are silently ignored when the
        #       Halo theme is in use.

        # Note: Mustang do not use '-compound' or '-indicatormargin' (the latter is replaced by a combinatioon of '-padding' and 'spacer').
        #       Nonetheless, these options are setted as well for those widgets that are not created by mustang.

        # Note: The 'image' option supports mapping values but they need to be specified in the normal state declaration as a list.
        #       The first element is the the image name to use in the normal state. The rest of the list is a sequence of statespec/value
        #       pairs as per style map, specifying different images to use when the widget is in a particular state or combination of states.
        #
        #       Note that all images in the list should have the same size.
        #
        #       If an empty string is specified, it indicates that the widget has no image to display.
        #       The image specified should have been allready created at the time the widget is created.
        #
        #       Any 'image' mapping values specified with the style map command will be ignored by mustang.

        # Layout
        style layout TCheckbutton {
            Checkbutton.padding -sticky nswe -children {
                Checkbutton.indicator -side left -sticky {}
                Checkbutton.label -side left -sticky we
            }
        }

        # Elements
        # The first image normally represents the normal state, here is a decoy.
        style element create Checkbutton.indicator    image [list                      check_off \
                                                                  {disabled  selected} check_on_disabled \
                                                                  {disabled !selected} check_off_disabled \
                                                                   {pressed  selected} check_on_pressed \
                                                                   {pressed !selected} check_off_pressed \
                                                                     {focus  selected} check_on_hover \
                                                                     {focus !selected} check_off_hover \
                                                                     {hover  selected} check_on_hover \
                                                                     {hover !selected} check_off_hover \
                                                                              selected check_on \
                                                                             !selected check_off] \
                                                    -border 0 \
                                                    -height -1 \
                                                   -padding [list 0 0 1 0] \
                                                    -sticky {} \
                                                     -width -1;

        # Normal state
        style configure TCheckbutton          -background Background \
                                               -charwidth -10 \
                                                -compound left \
                                                  -cursor arrow \
                                                    -font NormalFont \
                                              -foreground Text \
                                          -highlightcolor Background \
                                                   -image {} \
                                     -indicatorbackground Background \
                                     -indicatorforeground Accent \
                                         -indicatormargin [list 1m 2m 0 1m] \
                                         -indicatorrelief flat \
                                                 -justify left \
                                                 -padding [list 1m 2m] \
                                                  -spacer $::ms::size(Halo,spacer) \
                                              -wraplength 0;

        # Mapping
        style map TCheckbutton          -foreground [list  disabled TextDisabled \
                                                           readonly TextReadonly \
                                                              hover Accent] \
                                    -highlightcolor [list  disabled Background \
                                                           readonly Background \
                                                            pressed HighlightAlternate \
                                                              focus Accent] \
                               -indicatorforeground [list  disabled BordercolorDisabled \
                                                           readonly TextReadonly \
                                                            pressed HighlightAlternate \
                                                              focus Highlight \
                                                              hover Accent \
                                                          alternate Accent \
                                                           selected Accent \
                                                          !selected BordercolorAlternate];

        ######################
        ##                  ##
        ##     COMBOBOX     ##
        ##                  ##
        ######################

        # Note: 'charwidth', 'cursor', 'focuswidth', 'font', 'insertwidth', 'justify', 'padding', 'rows'
        #       and 'selectborderwidth' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: 'focuscolor' and 'focuswidth' will not be used by the 'clam' engine.
        #       Instead the 'clam' engine will use a combination between 'bordercolor' and 'lightcolor'.
        #       In the other engines 'focuscolor' and 'focuswidth' will be used instead of 'bordercolor' and 'lightcolor'.

        # Layout
        style layout TCombobox {
            Entry.field -sticky nswe -children {
                Combobox.padding -sticky nswe -children {
                    Combobox.downarrow -side right -sticky ns
                    Combobox.line -side right -sticky ns
                    Combobox.textarea -sticky {}
                }
            }
        }

        # Elements
        style element create Combobox.line    image [list          spacer \
                                                          disabled spacer_disabled \
                                                           invalid spacer_invalid] \
                                            -border [list 0] \
                                           -padding [list 8 0] \
                                            -sticky ns;

        style element create Combobox.downarrow    image [list          arrow_down \
                                                               disabled arrow_down_disabled \
                                                                invalid arrow_down_invalid \
                                                                pressed arrow_down_pressed] \
                                                 -border [list 0] \
                                                 -sticky {};

        # Normal states
        style configure TCombobox            -arrowcolor Arrow \
                                              -arrowsize $::ms::size(Halo,arrow_down) \
                                             -background Background \
                                            -borderwidth 1 \
                                            -bordercolor Bordercolor \
                                              -charwidth 8 \
                                                 -cursor xterm \
                                              -darkcolor Background \
                                        -fieldbackground Fieldbackground \
                                             -focuscolor LightcolorAlternate \
                                              -focusfill FieldbackgroundFocus \
                                             -focuswidth 2 \
                                                   -font NormalFont \
                                             -foreground TextAlternate \
                                            -insertcolor TextAlternate \
                                            -insertwidth 2 \
                                                -justify left \
                                             -lightcolor LightcolorAlternate \
                                                -padding [list 4p 5p 4p 5p] \
                                  -placeholderforeground PlaceholderText \
                                             -postoffset [list 1 0 0 0] \
                                                   -rows 6 \
                                       -selectbackground White \
                                      -selectborderwidth 0 \
                                       -selectforeground TextAlternate;

        style configure Popdown         -background PopdownBackground \
                                       -bordercolor PopdownBordercolor \
                                       -borderwidth 1 \
                                            -cursor arrow \
                                         -darkcolor Darkcolor \
                                -disabledforeground TextDisabled \
                                              -font SmallerFont \
                                        -foreground TextAlternate \
                                           -justify left \
                                        -lightcolor Lightcolor \
                                           -padding [list 0] \
                                            -relief flat \
                                  -selectbackground Accent \
                                 -selectborderwidth 0 \
                                  -selectforeground AccentText;

        # Mapping
        style map TCombobox       -arrowcolor [list   disabled ArrowDisabled \
                                                       pressed ArrowPressed \
                                                       invalid Text \
                                                         hover Accent] \
                                  -background [list   disabled Background \
                                                      readonly Background \
                                                       invalid White \
                                                         focus Background \
                                                         hover Background] \
                                 -bordercolor [list background BordercolorBackground \
                                                      disabled Bordercolor \
                                                       invalid Text \
                                                         focus Accent \
                                                         hover Accent \
                                                       pressed HighlightAlternate \
                                                      readonly Bordercolor] \
                             -fieldbackground [list   disabled ArrowDisabled \
                                                      readonly ArrowDisabled \
                                                       invalid Invalid \
                                                         focus FieldbackgroundFocus] \
                                  -focuscolor [list   disabled Background \
                                                       invalid Text \
                                                         focus Accent \
                                                         hover Accent \
                                                      readonly Background] \
                                  -foreground [list   disabled TextAlternate \
                                                      readonly TextAlternate \
                                                       invalid White \
                                                         focus TextAlternate] \
                                  -lightcolor [list   disabled ArrowDisabled \
                                                       invalid Text \
                                                         focus Accent \
                                                         hover Accent \
                                                       pressed HighlightAlternate \
                                                      readonly ArrowDisabled] \
                            -selectforeground [list    invalid Invalid];

        ###################
        ##               ##
        ##     ENTRY     ##
        ##               ##
        ###################

        # Note: 'charwidth', 'cursor', 'focuswidth', 'font', 'insertwidth', 'justify', 'padding' and 'selectborderwidth'
        #       will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: 'focuscolor' and 'focuswidth' will not be used by the 'clam' engine.
        #       Instead the 'clam' engine will use a combination between 'bordercolor' and 'lightcolor'.
        #       In the other engines 'focuscolor' and 'focuswidth' will be used instead of 'bordercolor' and 'lightcolor'.

        # Layout
        style layout TEntry {
            Entry.field -sticky nswe -border 1 -children {
                Entry.padding -sticky nswe -children {
                    Entry.textarea -sticky nswe
                }
            }
        }

        # Normal state
        style configure TEntry            -background Background \
                                         -bordercolor Bordercolor \
                                           -charwidth 8 \
                                              -cursor xterm \
                                           -darkcolor Background \
                                     -fieldbackground Fieldbackground \
                                          -focuscolor LightcolorAlternate \
                                          -focuswidth 2 \
                                                -font NormalFont \
                                          -foreground TextAlternate \
                                         -insertcolor TextAlternate \
                                         -insertwidth 2 \
                                             -justify left \
                                          -lightcolor LightcolorAlternate \
                                             -padding [list 4p 5p 4p 5p] \
                               -placeholderforeground PlaceholderText \
                                    -selectbackground White \
                                   -selectborderwidth 0 \
                                    -selectforeground TextAlternate;

        # Mapping
        style map TEntry       -background [list   disabled Background \
                                                   readonly Background \
                                                    invalid White \
                                                      focus Background \
                                                      hover Background] \
                              -bordercolor [list background BordercolorBackground \
                                                   disabled Background \
                                                   readonly Background \
                                                    invalid Text \
                                                      focus Accent \
                                                      hover Accent] \
                               -focuscolor [list   disabled Background \
                                                   readonly Background \
                                                    invalid Text \
                                                      focus Accent \
                                                      hover Accent] \
                          -fieldbackground [list   disabled Background \
                                                   readonly Background \
                                                    invalid Invalid \
                                                      focus FieldbackgroundFocus] \
                               -foreground [list   disabled TextDisabled \
                                                   readonly Text \
                                                    invalid White \
                                                      focus TextAlternate] \
                               -lightcolor [list   disabled Background \
                                                   readonly Background \
                                                    invalid Text \
                                                      focus Accent \
                                                      hover Accent] \
                         -selectbackground [list   readonly FieldbackgroundFocus] \
                         -selectforeground [list   readonly TextAlternate \
                                                    invalid Invalid];

        ###################
        ##               ##
        ##     FRAME     ##
        ##               ##
        ###################

        # Note: 'shellbackground' is used exclusively by scrollable frames and ignored by simple frames.

        # Note: 'borderwidth', 'cursor', 'padding' and 'relief' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Layout
        style layout TFrame {
            Frame.border -sticky nsew
        }

        # Normal state
        style configure TFrame      -background Background \
                                   -bordercolor Bordercolor \
                                   -borderwidth 0 \
                                        -cursor arrow \
                                     -darkcolor Darkcolor \
                                    -lightcolor Lightcolor \
                                       -padding [list 0] \
                                        -relief flat \
                               -shellbackground Background;

        # Mapping
        style map TFrame -bordercolor [list background BordercolorBackground \
                                              disabled BordercolorDisabled \
                                                 hover Accent];

        ###################
        ##               ##
        ##     LABEL     ##
        ##               ##
        ###################

        # Note: 'anchor', 'borderwidth', 'compound', 'cursor', 'font', 'justify', 'padding', 'relief',
        #       'width' and 'wraplength' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: The 'image' option supports mapping values but they need to be specified in the normal state declaration as a list.
        #       The first element is the the image name to use in the normal state. The rest of the list is a sequence of statespec/value
        #       pairs as per style map, specifying different images to use when the widget is in a particular state or combination of states.
        #
        #       Note that all images in the list should have the same size.
        #
        #       If an empty string is specified, it indicates that the widget has no image to display.
        #       The image specified should have been allready created at the time the widget is created.
        #
        #       Any 'image' mapping values specified with the style map command will be ignored by mustang.

        # Layout
        style layout TLabel {
            Label.border -sticky nsew -border 1 -children {
                Label.padding -sticky nsew -border 1 -children {
                    Label.label -sticky nsew
                }
            }
        }

        # Normal state
        style configure TLabel      -anchor w \
                                -background Background \
                               -bordercolor Background \
                               -borderwidth 0 \
                                 -charwidth 0 \
                                  -compound none \
                                    -cursor arrow \
                                 -darkcolor Darkcolor \
                                      -font NormalFont \
                                -foreground Text \
                                     -image {} \
                                   -justify left \
                                -lightcolor Lightcolor \
                                   -padding [list 0] \
                                    -relief flat \
                                -wraplength 0;

        # Mapping
        style map TLabel -foreground [list disabled TextDisabled]

        ########################
        ##                    ##
        ##     LABELFRAME     ##
        ##                    ##
        ########################

        # Note: Not all possible anchor values are supported by the mustang labelframe.
        #       Only "n" or "center","e" or "ne","w" or "nw" are supported.

        # Note: 'anchor', 'borderwidth', 'compound', 'cursor', 'font', 'padding' and 'relief'
        #       will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: The 'image' option supports mapping values but they need to be specified in the normal state declaration as a list.
        #       The first element is the the image name to use in the normal state. The rest of the list is a sequence of statespec/value
        #       pairs as per style map, specifying different images to use when the widget is in a particular state or combination of states.
        #
        #       Note that all images in the list should have the same size.
        #
        #       If an empty string is specified, it indicates that the widget has no image to display.
        #       The image specified should have been allready created at the time the widget is created.
        #
        #       Any 'image' mapping values specified with the style map command will be ignored by mustang.

        # Note: 'labelmargins' and 'labeloutside' are ignored by mustang.
        #       They are here in case the developer needs to create a Tk labelframe widget.
        #       To specify the labelmargins use the 'padding' option in the TLabelframe.Label style.
        #       In mustang the label is always positioned outside the container ('labeloutside' true).

        # Layouts
        style layout TLabelframe {
            Labelframe.border -sticky nswe
        }

        style layout TLabelframe.Label {
            Label.border -sticky nsew -border 1 -children {
                Label.padding -sticky nsew -border 1 -children {
                    Label.label -sticky nsew
                }
            }
        }

        # Normal states
        style configure TLabelframe          -anchor n \
                                         -background Background \
                                        -bordercolor Bordercolor \
                                        -borderwidth 2 \
                                           -compound text \
                                             -cursor arrow \
                                          -darkcolor Darkcolor \
                                               -font BiggestFont \
                                         -foreground TextBig \
                                              -image {} \
                                       -labelmargins [list 5p 8p 5p 8p] \
                                       -labeloutside true \
                                         -lightcolor Lightcolor \
                                            -padding [list 4p 4p] \
                                             -relief solid \
                                    -shellbackground Background;

        style configure TLabelframe.Label  -background Background \
                                          -bordercolor Bordercolor \
                                          -borderwidth 0 \
                                            -charwidth 0 \
                                               -cursor arrow \
                                            -darkcolor Darkcolor \
                                           -lightcolor Lightcolor \
                                              -padding [list 8p 5p] \
                                               -relief solid;

        # Mappings
        style map TLabelframe -bordercolor [list background BordercolorBackground \
                                                   disabled BordercolorDisabled \
                                                      hover Accent] \
                               -foreground [list   disabled TextDisabled \
                                                      hover Accent];

        style map TLabelframe.Label -bordercolor [list background BordercolorBackground \
                                                         disabled BordercolorDisabled \
                                                            hover Accent];

        #####################
        ##                 ##
        ##     LISTBOX     ##
        ##                 ##
        #####################

        # Note: The layout is useless because the listbox widget doesn't understand styles, at least not natively.

        # Note: 'background', 'borderwidth', 'columns', 'cursor', 'disabledforeground', 'font', 'foreground', justify',
        #       'preselectbackground', 'preselectforeground', 'relief', 'rows', 'selectbackground' and 'selectforeground'
        #       will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # No layout

        # Normal state
        style configure Listbox          -background Background \
                                        -bordercolor Bordercolor \
                                        -borderwidth 2 \
                                            -columns 20 \
                                             -cursor arrow \
                                 -disabledforeground TextDisabled \
                                               -font BiggerFont \
                                         -foreground Text \
                                            -justify left \
                                -preselectbackground FieldbackgroundFocus \
                                -preselectforeground FieldbackgroundFocusText \
                                             -relief solid \
                                               -rows 10 \
                                   -selectbackground Accent \
                                  -selectborderwidth 0 \
                                   -selectforeground AccentText \
                                    -shellbackground Background;

        # Mapping
        style map Listbox -bordercolor [list background BordercolorBackground \
                                               disabled BordercolorDisabled \
                                                  hover Accent];

        ######################
        ##                  ##
        ##     NOTEBOOK     ##
        ##                  ##
        ######################

        # Note: The notebook client 'background' and 'cursor' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: The notebook tab 'compound', 'cursor', 'focuscolor', 'focussolid' and 'font' will not follow
        #       any mapping rules. They are not supposed to change when the widget state changes.

        # Note: The tab label padding is managed by the '::ms::Halo_NotebookTab_Fills' procedure.
        #       located at the end of this file.
        #       These paddings are relative to the notebook tab position and the tab state (normal or selected).

        # Layouts
        style layout TNotebook {
            Notebook.client -sticky nswe
        }

        style layout TNotebook.Tab {
            Notebook.tab -sticky nswe -children {
                Notebook.padding -side top -sticky nswe -children {
                    Notebook.focus -side top -sticky nswe -children {
                        Notebook.label -side top -sticky {}
                    }
                }
            }
        }

        # Normal states
        style configure TNotebook  -background Background \
                                  -bordercolor Bordercolor \
                                       -cursor arrow \
                                    -darkcolor Darkcolor \
                                   -lightcolor Lightcolor \
                                  -tabposition nw;

        style configure TNotebook.Tab  -background TabBackground \
                                      -bordercolor Bordercolor \
                                         -compound left \
                                           -cursor arrow \
                                       -focuscolor Background \
                                       -focussolid 1 \
                                             -font BiggerFont \
                                       -foreground TabForeground;

        # Mappings
        style map TNotebook.Tab -background [list           disabled TabBackgroundDisabled \
                                                            selected Background \
                                                  {active !selected} FieldbackgroundFocus \
                                                           !selected TabBackground] \
                                -foreground [list           disabled TabForegroundDisabled \
                                                            selected Accent \
                                                  {active !selected} FieldbackgroundFocusText \
                                                           !selected TabForeground];

        #####################
        ##                 ##
        ##     PALETTE     ##
        ##                 ##
        #####################

        # Note: 'charwidth', 'cursor', 'focuswidth', 'font', 'insertwidth', 'justify', 'padding', 'rows'
        #       and 'selectborderwidth' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: 'focuscolor' and 'focuswidth' will not be used by the 'clam' engine.
        #       Instead the 'clam' engine will use a combination between 'bordercolor' and 'lightcolor'.
        #       In the other engines 'focuscolor' and 'focuswidth' will be used instead of 'bordercolor' and 'lightcolor'.

        # Layout
        style layout TPalette {
            Entry.field -sticky nswe -children {
                Palette.padding -sticky nswe -children {
                    Palette.downarrow -side right -sticky ns
                    Palette.line -side right -sticky ns
                    Palette.textarea -sticky {}
                }
            }
        }

        # Elements
        style element create Palette.line     image [list            spacer \
                                                            disabled spacer_disabled \
                                                             invalid spacer_invalid] \
                                            -border [list 0] \
                                           -padding [list 8 0] \
                                            -sticky ns;

        style element create Palette.downarrow     image [list                   arrow_down \
                                                                        disabled arrow_down_disabled \
                                                                         invalid arrow_down_invalid \
                                                                         pressed arrow_down_pressed] \
                                                 -border [list 0] \
                                                 -sticky {};

        # Normal states
        style configure TPalette             -arrowcolor Arrow \
                                              -arrowsize $::ms::size(Halo,arrow_down) \
                                             -background Background \
                                            -borderwidth 1 \
                                            -bordercolor Bordercolor \
                                              -charwidth 8 \
                                                 -cursor arrow \
                                              -darkcolor Background \
                                        -fieldbackground Fieldbackground \
                                             -focuscolor LightcolorAlternate \
                                              -focusfill FieldbackgroundFocus \
                                             -focuswidth 2 \
                                                   -font NormalFont \
                                             -foreground TextAlternate \
                                            -insertcolor TextAlternate \
                                            -insertwidth 2 \
                                                -justify left \
                                             -lightcolor LightcolorAlternate \
                                                -padding [list 4p 5p 4p 5p] \
                                  -placeholderforeground PlaceholderText \
                                             -postoffset [list 1 0 0 0] \
                                                   -rows 6 \
                                       -selectbackground White \
                                      -selectborderwidth 0 \
                                       -selectforeground TextAlternate \
                                        -shellbackground Background;

        style configure Preview -borderwidth 1 \
                                     -height $::ms::size(Halo,preview_height) \
                                      -width $::ms::size(Halo,preview_width);

        # Mappings
        style map TPalette        -arrowcolor [list   disabled ArrowDisabled \
                                                       pressed ArrowPressed \
                                                       invalid Text \
                                                         hover Accent] \
                                  -background [list   disabled Background \
                                                      readonly Background \
                                                       invalid White \
                                                         focus Background \
                                                         hover Background] \
                                 -bordercolor [list background BordercolorBackground \
                                                      disabled Bordercolor \
                                                       invalid Text \
                                                         focus Accent \
                                                         hover Accent \
                                                       pressed HighlightAlternate \
                                                      readonly Bordercolor] \
                             -fieldbackground [list   disabled ArrowDisabled \
                                                      readonly ArrowDisabled \
                                                       invalid Invalid \
                                                         focus FieldbackgroundFocus] \
                                  -focuscolor [list   disabled Background \
                                                       invalid Text \
                                                         focus Accent \
                                                         hover Accent \
                                                      readonly Background] \
                                  -foreground [list   disabled TextAlternate \
                                                      readonly TextAlternate \
                                                       invalid White \
                                                         focus TextAlternate] \
                                  -lightcolor [list   disabled ArrowDisabled \
                                                       invalid Text \
                                                         focus Accent \
                                                         hover Accent \
                                                       pressed HighlightAlternate \
                                                      readonly ArrowDisabled] \
                            -selectforeground [list    invalid Invalid] \
                            -shellbackground  [list   disabled Background \
                                                      readonly Background \
                                                       invalid White \
                                                         focus Background \
                                                         hover Background];

        #########################
        ##                     ##
        ##     PANEDWINDOW     ##
        ##                     ##
        #########################

        # Note: 'borderwidth', 'cursor' and 'relief' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: In mustang panedwindows and sashes are disabled for Windows and macOS systems.
        #       See the panedwindow widget description for more infos.

        # Layout
        style layout TPanedwindow {
            Panedwindow.background -sticky {}
        }

        # Normal state
        style configure TPanedwindow      -background Background \
                                         -bordercolor Bordercolor \
                                         -borderwidth 2 \
                                              -cursor arrow \
                                           -darkcolor Darkcolor \
                                          -lightcolor Lightcolor \
                                              -relief solid;

        # Mapping
        style map TPanedwindow -bordercolor [list background Lightcolor \
                                                       hover Accent];

        ##################
        ##              ##
        ##     SASH     ##
        ##              ##
        ##################

        # Layouts
        style layout Horizontal.Sash {
            Sash.hsash -sticky nswe -children {
                Sash.hgrip -sticky nswe
            }
        }

        style layout Vertical.Sash {
            Sash.vsash -sticky nswe -children {
                Sash.vgrip -sticky nswe
            }
        }

        # Normal state
        style configure Sash   -bordercolor Sash \
                                  -gripsize $::ms::size(Halo,grip) \
                                -lightcolor Sash \
                             -sashthickness $::ms::size(Halo,sash);

        # Mapping
        style map Sash -bordercolor [list background Lightcolor \
                                               hover Accent] \
                        -lightcolor [list background Lightcolor \
                                               hover Accent];

        #########################
        ##                     ##
        ##     PROGRESSBAR     ##
        ##                     ##
        #########################

        # Note: 'anchor', 'borderwidth', 'cursor', 'font', 'justify', 'thickness', 'troughcolor' and 'wraplength'
        #       will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: 'sliderlength' (in the 'clam' engine) and 'barsize' (in the other engines) are ignored by mustang.
        #       They are here in case the developer needs to create a Tk scale widget.
        #       In mustang the developer should use the non styleable option 'length'.

        # Note: 'arrowsize' (in the 'clam' engine) is ignored by mustang.
        #       It's here in case the developer needs to create a Tk scale widget.
        #       In mustang the developer should use the styleable option 'thickness'.

        # Layouts
        style layout Horizontal.TProgressbar {
            Horizontal.Progressbar.trough -sticky nswe -children {
                Horizontal.Progressbar.pbar -side left -sticky ns
                Horizontal.Progressbar.ctext -expand 1 -sticky {}
            }
        }

        style layout Vertical.TProgressbar {
            Vertical.Progressbar.trough -sticky nswe -children {
                Vertical.Progressbar.pbar -side bottom -sticky we
            }
        }

        # Normal state
        style configure TProgressbar      -anchor center \
                                       -arrowsize 5 \
                                      -background ProgressbarBackground \
                                         -barsize 0 \
                                     -bordercolor Bordercolor \
                                     -borderwidth 2 \
                                          -cursor arrow \
                                       -darkcolor ProgressbarBackground \
                                            -font SmallerFont \
                                      -foreground ProgressbarText \
                                         -justify left \
                                      -lightcolor ProgressbarBackground \
                                    -sliderlength 0 \
                                       -thickness 5 \
                                     -troughcolor Background5 \
                                      -wraplength 0;

        # No mapping

        #########################
        ##                     ##
        ##     RADIOBUTTON     ##
        ##                     ##
        #########################

        # Note: 'background', 'charwidth', 'cursor', 'font', 'indicatorbackground', 'indicatorrelief', 'justify', 'padding',
        #       and 'wraplength' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: 'indicatorbackground', 'indicatorcolor', 'indicatorforeground' and 'indicatorrelief' are setted in a way
        #       that reflects the default radiobutton images colors.
        #       Due to the fact that the Halo theme uses images for the indicator, they are silently ignored when the
        #       Halo theme is in use.

        # Note: Mustang do not use '-compound' or '-indicatormargin' (the latter is replaced by a combinatioon of '-padding' and 'spacer').
        #       Nonetheless, these options are setted as well for those widgets that are not created by mustang.

        # Note: The 'image' option supports mapping values but they need to be specified in the normal state declaration as a list.
        #       The first element is the the image name to use in the normal state. The rest of the list is a sequence of statespec/value
        #       pairs as per style map, specifying different images to use when the widget is in a particular state or combination of states.
        #
        #       Note that all images in the list should have the same size.
        #
        #       If an empty string is specified, it indicates that the widget has no image to display.
        #       The image specified should have been allready created at the time the widget is created.
        #
        #       Any 'image' mapping values specified with the style map command will be ignored by mustang.

        # Layout
        style layout TRadiobutton {
            Radiobutton.padding -sticky nswe -children {
                Radiobutton.indicator -side left -sticky {}
                Radiobutton.label -side left -sticky we
            }
        }

        # Elements
        # The first image normally represents the normal state, here is a decoy.
        style element create Radiobutton.indicator    image [list                      radio_off \
                                                                  {disabled  selected} radio_on_disabled \
                                                                  {disabled !selected} radio_off_disabled \
                                                                   {pressed  selected} radio_on_pressed \
                                                                   {pressed !selected} radio_off_pressed \
                                                                     {focus  selected} radio_on_hover \
                                                                     {focus !selected} radio_off_hover \
                                                                     {hover  selected} radio_on_hover \
                                                                     {hover !selected} radio_off_hover \
                                                                              selected radio_on \
                                                                             !selected radio_off] \
                                                    -border 0 \
                                                    -height -1 \
                                                   -padding [list 0 0 1 0] \
                                                    -sticky {} \
                                                     -width -1;

        # Normal state
        style configure TRadiobutton          -background Background \
                                               -charwidth -10 \
                                                -compound left \
                                                  -cursor arrow \
                                                    -font NormalFont \
                                              -foreground Text \
                                          -highlightcolor Background \
                                                   -image {} \
                                     -indicatorbackground Background \
                                     -indicatorforeground Accent \
                                         -indicatormargin [list 1m 2m 0 1m] \
                                         -indicatorrelief flat \
                                                 -justify left \
                                                 -padding [list 1m 2m] \
                                                  -spacer $::ms::size(Halo,spacer) \
                                              -wraplength 0;

        # Mapping
        style map TRadiobutton          -foreground [list  disabled TextDisabled \
                                                           readonly TextReadonly \
                                                              hover Accent] \
                                    -highlightcolor [list  disabled Background \
                                                           readonly Background \
                                                            pressed HighlightAlternate \
                                                              focus Accent] \
                               -indicatorforeground [list  disabled BordercolorDisabled \
                                                           readonly TextReadonly \
                                                            pressed HighlightAlternate \
                                                              focus Highlight \
                                                              hover Accent \
                                                          alternate Accent \
                                                           selected Accent \
                                                          !selected BordercolorAlternate];

        ###################
        ##               ##
        ##     SCALE     ##
        ##               ##
        ###################

        # Note: 'cursor', 'gripsize' and 'troughrelief' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: 'bordercolor', 'borderwidth', 'darkcolor', 'gripsize', 'innercolor', lightcolor', 'outercolor', 'troughcolor'
        #       and 'troughrelief' are setted in a way that reflects the default thumb and trough images colors.
        #       These options are silently ignored when the Halo theme is in use due to the fact that it uses images
        #       instead of drawing the elements through its engine.

        # Note: 'gripsize' is only meaningfull for themes that uses the 'clam' engine.
        #       'innercolor' and 'outercolor' are only meaningfull for themes that use the 'default' engine.

        # Note: 'sliderlength' is ignored by mustang.
        #       It's here in case the developer needs to create a Tk scale widget.
        #       In mustang the developer should use the non styleable option 'length'.

        # Note: 'sliderrelief' is ignored by mustang.
        #       It's here in case the developer needs to create a Tk scale widget.
        #       In mustang the developer should use the styleable option 'thumbrelief'.

        # Layouts
        style layout Horizontal.TScale {
            Horizontal.Scale.padding -sticky nswe -children {
                Horizontal.Scale.trough -sticky we -children {
                    Horizontal.Scale.slider -side left -sticky {}
                }
            }
        }

        style layout Vertical.TScale {
            Vertical.Scale.padding -sticky nswe -children {
                Vertical.Scale.trough -sticky ns -children {
                    Vertical.Scale.slider -side top -sticky {}
                }
            }
        }

        # Elements
        # The first image represents the normal state.
        style element create Scale.slider    image [list          scale_thumb \
                                                         disabled scale_thumb_disabled \
                                                          pressed scale_thumb_pressed] \
                                           -border 1 \
                                          -padding 0 \
                                           -sticky nsew;

        style element create Horizontal.Scale.trough    image [list          scale_trough_horizontal \
                                                                    disabled scale_trough_horizontal_disabled \
                                                                       focus scale_trough_horizontal_focus] \
                                                      -border 1 \
                                                      -height 2 \
                                                     -padding [list 0 4] \
                                                      -sticky ew;

        style element create Vertical.Scale.trough    image [list          scale_trough_vertical \
                                                                  disabled scale_trough_vertical_disabled \
                                                                     focus scale_trough_vertical_focus] \
                                                    -border 1 \
                                                   -padding [list 4 0] \
                                                    -sticky ns \
                                                     -width 2;

        # Normal state
        style configure TScale   -background Background \
                                -bordercolor ScaleTrough \
                                -borderwidth 0 \
                                  -darkcolor Darkcolor \
                                     -cursor arrow \
                                   -gripsize 7.5p \
                                 -innercolor Accent \
                                 -lightcolor Lightcolor \
                                 -outercolor Background \
                               -sliderlength 22.5p \
                               -sliderrelief flat \
                                  -thickness 2 \
                                -thumbrelief flat \
                                -troughcolor ScaleTrough \
                               -troughrelief flat;

        # Mapping
        style map TScale  -innercolor [list disabled ScaleThumbDisabled \
                                             pressed HighlightAlternate] \
                         -troughcolor [list disabled ScaleTroughDisabled \
                                               focus Highlight];

        #######################
        ##                   ##
        ##     SCROLLBAR     ##
        ##                   ##
        #######################

        # Note: The scrollbar '-relief' option doesn't work on the 'clam' engine.
        #       A 'solid' relief is automatically applied to the scrollbar object by the 'clam' engine.
        #       It cannot be changed.

        # Set the gripcount relative to the operating system.
        switch -- [_tk windowingsystem] {
            win32   { set gripcount 0 }
            default { set gripcount 5 }
        }

        # Layouts
        style layout Horizontal.TScrollbar {
            Horizontal.Scrollbar.trough -sticky we -children {
                Horizontal.Scrollbar.thumb -expand 1 -sticky nswe -children {
                    Horizontal.Scrollbar.grip -sticky {}
                }
            }
        }

        style layout Vertical.TScrollbar {
            Vertical.Scrollbar.trough -sticky ns -children {
                Vertical.Scrollbar.thumb -expand 1 -sticky nswe -children {
                    Vertical.Scrollbar.grip -sticky {}
                }
            }
        }

        # Normal state
        style configure TScrollbar  -arrowcolor Arrow \
                                     -arrowsize $::ms::size(Halo,scrollbar) \
                                    -background ScrollbarBackground \
                                   -bordercolor ScrollbarBordercolor \
                                   -borderwidth 2 \
                                        -cursor arrow \
                                     -darkcolor Darkcolor \
                                    -foreground ScrollbarForeground \
                                     -gripcount $gripcount \
                                    -lightcolor Lightcolor \
                                        -relief solid \
                                   -troughcolor Background5 \
                                         -width $::ms::size(Halo,scrollbar);

        # No mapping

        #######################
        ##                   ##
        ##     SEPARATOR     ##
        ##                   ##
        #######################

        # Note: 'cursor' will not follow any mapping rules.
        #       It's not supposed to change when the widget state changes.

        # Layouts
        style layout Horizontal.TSeparator {
            Separator.separator -sticky we
        }

        style layout Vertical.TSeparator {
            Separator.separator -sticky ns
        }

        # Normal state
        style configure TSeparator -background Separator \
                                       -cursor arrow;

        # No mapping

        ######################
        ##                  ##
        ##     SIZEGRIP     ##
        ##                  ##
        ######################

        # Note: 'background' and 'cursor' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Layout
        style layout TSizegrip {
            Sizegrip.sizegrip -side bottom -sticky se
        }

        # Element
        # The first image represents the normal state.
        style element create Sizegrip.sizegrip image [list         sizegrip \
                                                           pressed sizegrip_pressed \
                                                             hover sizegrip_hover \
                                                            active sizegrip_hover] \
                                                      -border 1 \
                                                      -height -1 \
                                                     -padding 0 \
                                                      -sticky se \
                                                       -width -1;

        # Normal state
        style configure TSizegrip -background Background \
                                      -cursor bottom_right_corner;

        # No mapping

        #####################
        ##                 ##
        ##     SPINBOX     ##
        ##                 ##
        #####################

        # Layout
        style layout TSpinbox {
            Entry.field -sticky nswe -children {
                Spinbox.padding -sticky nswe -children {
                    Spinbox.arrows -side right -sticky ew -children {
                        Spinbox.uparrow -side top -sticky nswe
                        Spinbox.downarrow -side bottom -sticky nswe
                    }
                    Spinbox.line -side right -sticky ns
                    Spinbox.textarea -sticky {}
                }
            }
        }

        # Elements
        # The first image represents the normal state.
        style element create Spinbox.line    image [list                   spacer \
                                                         disabled spacer_disabled \
                                                          invalid spacer_invalid] \
                                           -border [list 0] \
                                          -padding [list 8 0] \
                                           -sticky ns;

        style element create Spinbox.downarrow   image [list                   arrow_down \
                                                             disabled arrow_down_disabled \
                                                               invalid arrow_down_invalid \
                                                               pressed arrow_down_pressed] \
                                               -border [list 0] \
                                              -padding [list 0 9 9 4] \
                                               -sticky s;

        style element create Spinbox.uparrow   image [list                   arrow_up \
                                                           disabled arrow_up_disabled \
                                                             invalid arrow_up_invalid \
                                                             pressed arrow_up_pressed] \
                                             -border [list 0] \
                                            -padding [list 0 9 9 4] \
                                             -sticky n;

        # Normal state
        style configure TSpinbox            -arrowcolor Arrow \
                                             -arrowsize $::ms::size(Halo,arrow_down) \
                                            -background Background \
                                           -borderwidth 1 \
                                           -bordercolor Bordercolor \
                                             -charwidth 8 \
                                                -cursor arrow \
                                             -darkcolor Background \
                                       -fieldbackground Fieldbackground \
                                            -focuscolor LightcolorAlternate \
                                             -focusfill FieldbackgroundFocus \
                                            -focuswidth 2 \
                                                  -font NormalFont \
                                            -foreground TextAlternate \
                                           -insertcolor TextAlternate \
                                           -insertwidth 2 \
                                               -justify left \
                                            -lightcolor LightcolorAlternate \
                                               -padding [list 4p 5p 4p 5p] \
                                 -placeholderforeground PlaceholderText \
                                      -selectbackground White \
                                     -selectborderwidth 0 \
                                      -selectforeground TextAlternate;

        # Mapping
        style map TSpinbox        -arrowcolor [list   disabled ArrowDisabled \
                                                       pressed ArrowPressed \
                                                       invalid Text \
                                                         hover Accent] \
                                  -background [list   disabled Background \
                                                      readonly Background \
                                                       invalid White \
                                                         focus Background \
                                                         hover Background] \
                                 -bordercolor [list background BordercolorBackground \
                                                      disabled Bordercolor \
                                                       invalid Text \
                                                         focus Accent \
                                                         hover Accent \
                                                       pressed HighlightAlternate \
                                                      readonly Bordercolor] \
                             -fieldbackground [list   disabled ArrowDisabled \
                                                      readonly ArrowDisabled \
                                                       invalid Invalid \
                                                         focus FieldbackgroundFocus] \
                                  -focuscolor [list   disabled Background \
                                                       invalid Text \
                                                         focus Accent \
                                                         hover Accent \
                                                      readonly Background] \
                                  -foreground [list   disabled TextAlternate \
                                                      readonly TextAlternate \
                                                       invalid White \
                                                         focus TextAlternate] \
                                  -lightcolor [list   disabled ArrowDisabled \
                                                       invalid Text \
                                                         focus Accent \
                                                         hover Accent \
                                                       pressed HighlightAlternate \
                                                      readonly ArrowDisabled] \
                            -selectforeground [list    invalid Invalid];

        ##################
        ##              ##
        ##     TEXT     ##
        ##              ##
        ##################

        # Note: The layout is useless because the text widget doesn't understand styles, at least not natively.

        # Note: 'borderwidth', 'columns', 'cursor', 'font', 'inactiveselectbackground', 'insertborderwidth', 'padding',
        #       'relief', 'rows' and 'selectborderwidth' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # No layout

        # Normal state
        style configure Text               -background Background \
                                          -bordercolor Background \
                                          -borderwidth 0 \
                                              -columns 80 \
                                               -cursor xterm \
                                                 -font BiggerFont \
                                           -foreground Text \
                             -inactiveselectbackground Background6 \
                                     -insertbackground Text \
                                    -insertborderwidth 0 \
                                              -padding [list 0] \
                                               -relief flat \
                                                 -rows 4 \
                                     -selectbackground FieldbackgroundFocus \
                                    -selectborderwidth 0 \
                                     -selectforeground FieldbackgroundFocusText \
                                      -shellbackground Background;

        # Mapping
        style map Text -bordercolor [list background BordercolorBackground \
                                            disabled BordercolorDisabled \
                                               hover Accent];

        ########################
        ##                    ##
        ##     TOOLBUTTON     ##
        ##                    ##
        ########################

        # Layout
        style layout Toolbutton {
            Toolbutton.border -sticky nswe -children {
                Toolbutton.padding -sticky nswe -children {
                    Toolbutton.label -sticky nswe
                }
            }
        }

        # Normal state
        style configure Toolbutton      -anchor center \
                                    -background Background \
                                   -bordercolor ButtonBorder \
                                   -borderwidth 2 \
                                     -charwidth -1 \
                                      -compound none \
                                        -cursor arrow \
                                     -darkcolor ButtonBackground \
                                          -font NormalFont \
                                    -foreground Text \
                                         -image {} \
                                       -justify left \
                                    -lightcolor ButtonBorder \
                                       -padding [list 4p 8p 4p 8p] \
                                        -relief solid \
                                   -shiftrelief -2;

        # Mapping
        style map Toolbutton -bordercolor [list background BordercolorBackground \
                                                  disabled ButtonBackground \
                                                     focus FieldbackgroundFocus \
                                                     hover Accent] \
                               -darkcolor [list    pressed ButtonBackgroundPressed] \
                              -foreground [list   disabled ButtonTextDisabled \
                                                   pressed Accent] \
                              -lightcolor [list   disabled ButtonBackground];

        ######################
        ##                  ##
        ##     TOPLEVEL     ##
        ##                  ##
        ######################

        # Note: The layout is useless because the toplevel widget doesn't understand styles, at least not natively.

        # Note: 'backgroundimage', 'borderwidth', 'cursor', 'padding', 'relief' and 'tile' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # No layout

        # Normal state
        style configure Toplevel      -background Background \
                                 -backgroundimage {} \
                                     -bordercolor Background \
                                     -borderwidth 0 \
                                          -cursor arrow \
                                         -padding [list 0] \
                                          -relief solid \
                                            -tile 0;

        ######################
        ##                  ##
        ##     TREEVIEW     ##
        ##                  ##
        ######################

        # Note: 'columnseparatorwidth', 'cursor', 'font', 'indent', 'justify', 'padding' and 'rowheight'
        #       will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Layouts
        style layout Treeview {
           Treeview.field -sticky nswe -children {
               Treeview.padding -sticky nswe -children {
                   Treeview.treearea -sticky nswe
               }
           }
        }

        style layout Heading {
           Treeheading.cell -sticky nswe
           Treeheading.border -sticky nswe -children {
               Treeheading.padding -sticky nswe -children {
                   Treeheading.image -side right -sticky {}
                   Treeheading.text -sticky we
               }
           }
        }

        style layout Item {
           Treeitem.padding -sticky nswe -children {
               Treeitem.indicator -side left -sticky {}
               Treeitem.image -side left -sticky {}
               Treeitem.text -side left -sticky {}
           }
        }

        style layout Row {
            Treeitem.row -sticky nsew
        }

        style layout Treeview.Separator {
            Treeitem.Separator -sticky nsew
        }

        style layout Cell {
            Treeheading.padding -sticky nswe -children {
                Treeitem.text -sticky nswe
            }
        }

        # Elements
        if { $::tcl_version >= 9.1 } {
            # The first image normally represents the normal state, here is a decoy.
            style element create Treeitem.indicator   image [list                 treeview_indicator_close \
                                                                    {!open focus} treeview_indicator_close_focus \
                                                                          {!open} treeview_indicator_close
                                                                     {open focus} treeview_indicator_open_focus \
                                                                           {open} treeview_indicator_open] \
                                                     -width [::ms::Convert_Measure $::ms::size(Halo,treeview_indicator) "" 14] \
                                                    -sticky w;
        }

        # Normal states
        style configure Treeview           -background Fieldbackground \
                                          -borderwidth 2 \
                                          -bordercolor Bordercolor \
                                 -columnseparatorwidth 2 \
                                               -cursor arrow \
                                            -darkcolor Background \
                                      -fieldbackground Fieldbackground \
                                           -focuscolor LightcolorAlternate \
                                           -focuswidth 2 \
                                                 -font NormalFont \
                                           -foreground TextAlternate \
                                               -indent 20p \
                                           -lightcolor LightcolorAlternate \
                                              -padding [list 2] \
                                            -rowheight [expr { [font metrics NormalFont -linespace]+10 }] \
                                                 -rows 5 \
                                      -shellbackground Background \
                                    -stripedbackground TreeviewStripe;

        style configure Cell -padding [list 2 0 0 0]

        style configure Heading  -background TreeviewHeading \
                                -bordercolor Accent \
                                -borderwidth 2 \
                                       -font BiggerFont \
                                    -padding [list 2.25p] \
                                     -relief raised;

        style configure Item       -foreground Red \
                             -indicatormargins [list 1.5p 1.5p 3p 1.5p] \
                                -indicatorsize $::ms::size(Halo,treeview_indicator) \
                                      -padding [list 0];

        style configure Row -background Fieldbackground

        style configure Treeview.Separator -background Accent

        # Mapping
        style map Treeview      -background [list   disabled Background \
                                                  background Lightcolor \
                                                    selected FieldbackgroundFocus] \
                               -bordercolor [list background BordercolorBackground \
                                                       focus Accent \
                                                       hover Accent] \
                           -fieldbackground [list background TreeviewFieldbackgroundBackground \
                                                    disabled TreeviewFieldbackgroundDisabled] \
                                -focuscolor [list   disabled Background \
                                                       focus Accent \
                                                       hover Accent] \
                                -foreground [list   disabled TextDisabled] \
                                -lightcolor [list   disabled Background \
                                                       focus Accent \
                                                       hover Accent];
    }
}

# Halo_NotebookTab_Fills
#
# Sets the Halo notebook tab fills related to the notebook style provided.
#
# Where:
#
# style   Should be the notebook style (for example 'TNotebook') in which
#         the tab fills needs to be configured.
#
# Note:   Attention. Do not pass the notebook tab style (for example 'TNotebook.Tab') but
#         rather its related notebook style (for example 'TNotebook').
#
# Note:   This is a minor rewrite of the 'ttk::theme::clam::configureNotebookStyle' of the
#         official clam theme. All credits goes to the procedure author.
#
# It doesn't return anything.
proc ::ms::Halo_NotebookTab_Fills { style } {
    if { $style in [_ttk_style theme styles] } {
        # Constroct the notebook tab style.
        set tabs_style [string cat $style ".Tab"]

        # Note: The original code of the clam theme have different padding between the normal and
        #       the selected state for each tabposition.
        #       This is not the case for the Halo theme, howewer the check is done as it behaves like
        #       the clam theme so that a theme developer could easily change it at he/she pleases.

        # Check the tabposition for the style provided.
        switch -- [string index [_ttk_style lookup $style -tabposition {} nw] 0] {
            s   {
                # Tab fills for the normal state.
                _ttk_style configure $tabs_style -padding [list 5p 5p]

                # Tab fills for the selected state.
                _ttk_style map $tabs_style -padding [list selected [list 5p 5p]]
            }
            w   {
                # Tab fills for the normal state.
                _ttk_style configure $tabs_style -padding [list 5p 5p]

                # Tab fills for the selected state.
                _ttk_style map $tabs_style -padding [list selected [list 5p 5p]]
            }
            e   {
                # Tab fills for the normal state.
                _ttk_style configure $tabs_style -padding [list 5p 5p]

                # Tab fills for the selected state.
                _ttk_style map $tabs_style -padding [list selected [list 5p 5p]]
            }
            default {
                # Assume 'n'.

                # Tab fills for the normal state.
                _ttk_style configure $tabs_style -padding [list 5p 5p]

                # Tab fills for the selected state.
                _ttk_style map $tabs_style -padding [list selected [list 5p 5p]]
            }
        }
    }

    return ""
}

#*EOF*