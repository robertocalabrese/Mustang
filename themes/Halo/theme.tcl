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

        # Note: 'charwidth', 'cursor', 'font', 'indicatorbackground', 'indicatorrelief', 'justify', 'padding',
        #       'shellbackground' and 'wraplength' will not follow any mapping rules.
        #       They are not supposed to change when the widget state changes.

        # Note: 'indicatorbackground', 'indicatorcolor', 'indicatorforeground' and 'indicatorrelief' are setted in a way
        #       that reflects the default checkbutton images colors.
        #       Due to the fact that the Halo theme uses images for the indicator, they are silently ignored when the
        #       Halo theme is in use.

        # Note: In mustang checkbuttons are megawidgets, but differently than other megawidgets their 'background' and
        #       'shellbackground' coincides.
        #       The correct option name to use as background inside a checkbutton style in mustang is '-shellbackground' and not
        #       '-background', nonetheless a '-background' option is setted as well for those widgets that are not created by mustang.

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
                                         -shellbackground Background \
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
    }
}

#*EOF*