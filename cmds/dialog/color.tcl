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

# Symbols meanings that may be used by the command synopsis:
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

# Symbols meanings that may be used by the command infos:
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
package provide ::ms::dialog::color 0.1

# Create the mustang **dialog** package.
namespace eval ::ms::dialog::color {}

######################################
##                                  ##
##     COLOR CHOOSER PROCEDURES     ##
##                                  ##
######################################

## WM
#
# Construct the color chooser window.
#
# It doesn't return anything.
proc ::ms::dialog::color::WM { parent_toplevel } {
    toplevel .colorchooser     -class Toplevel \
                               -cmenu {} \
                              -height 0 \
                             -padding [list 2] \
                               -style Toplevel \
                           -takefocus 0 \
                               -title "Choose a color" \
                               -width 0;

    canvas .colorchooser.colorbox -closeenough 1.0 \
                                        -cmenu {} \
                                      -confine 1 \
                                       -height 360 \
                                       -relief sunken \
                                   -scrollable false \
                                        -state normal \
                                    -takefocus 0 \
                                        -width 360;

    canvas .colorchooser.hue_bar -closeenough 1.0 \
                                       -cmenu {} \
                                     -confine 1 \
                                      -height 360 \
                                      -relief sunken \
                                  -scrollable false \
                                       -state normal \
                                   -takefocus 0 \
                                       -width 20;

    canvas .colorchooser.triangle_marker_trough -closeenough 1.0 \
                                                      -cmenu {} \
                                                    -confine 1 \
                                                     -height [expr { 360+$::ms::data(colorchooser,triangle_marker,height) }] \
                                                     -relief flat \
                                                 -scrollable false \
                                                      -state normal \
                                                  -takefocus 0 \
                                                      -width [expr { $::ms::data(colorchooser,triangle_marker,width)+1 }];

    frame .colorchooser.preview_box  -background $::ms::data(colorchooser,hexadecimal) \
                                    -bordercolor $::ms::data(colorchooser,bordercolor) \
                                    -borderwidth 1 \
                                          -class Frame \
                                          -cmenu {} \
                                         -height 12m \
                                        -padding [list 0] \
                                         -relief flat \
                                     -scrollable false \
                                      -takefocus 0 \
                                          -width 20m;

    button .colorchooser.ok_button -charwidth 8 \
                                       -class TButton \
                                     -command [list ::ms::dialog::color:Button "ok"] \
                                    -compound none \
                                     -default normal \
                                        -font NormalFont \
                                       -image {} \
                                     -padding [list 2p 4p 2p 4p] \
                                       -state normal \
                                       -style TButton \
                                   -takefocus 1 \
                                        -text "Ok" \
                                   -underline -1;

    button .colorchooser.cancel_button -charwidth 8 \
                                           -class TButton \
                                         -command [list ::ms::dialog::color:Button "cancel"] \
                                        -compound none \
                                         -default normal \
                                            -font NormalFont \
                                           -image {} \
                                         -padding [list 2p 4p 2p 4p] \
                                           -state normal \
                                           -style TButton \
                                       -takefocus 1 \
                                            -text "Cancel" \
                                       -underline -1;

    frame .colorchooser.spacer      -class Frame \
                                    -cmenu {} \
                                   -height 10p \
                                  -padding [list 0] \
                                   -relief flat \
                               -scrollable false \
                                -takefocus 0 \
                                    -width 50p;

    label .colorchooser.red_label       -anchor w \
                                     -charwidth 3 \
                                         -class TLabel \
                                         -cmenu {} \
                                      -compound none \
                                          -font NormalFont \
                                         -image {} \
                                       -justify left \
                                       -padding [list 0 0] \
                                        -relief flat \
                                         -state normal \
                                         -style TLabel \
                                     -takefocus 0 \
                                          -text "R" \
                                  -textvariable {} \
                                     -underline -1 \
                                    -wraplength 0;

    spinbox .colorchooser.red_value        -charwidth 4 \
                                               -class TSpinbox \
                                               -cmenu {} \
                                             -command [list ::ms::dialog::color::RGB] \
                                            -datatype posinteger \
                                     -exportselection 0 \
                                                -font NormalFont \
                                                -from 0 \
                                           -increment 1 \
                                           -maxlength enabled \
                                         -placeholder "" \
                                               -state normal \
                                               -style TSpinbox \
                                           -takefocus 1 \
                                                  -to 255;

    label .colorchooser.green_label       -anchor w \
                                       -charwidth 3 \
                                           -class TLabel \
                                           -cmenu {} \
                                        -compound none \
                                            -font NormalFont \
                                           -image {} \
                                         -justify left \
                                         -padding [list 0 0] \
                                          -relief flat \
                                           -state normal \
                                           -style TLabel \
                                       -takefocus 0 \
                                            -text "G" \
                                    -textvariable {} \
                                       -underline -1 \
                                      -wraplength 0;

    spinbox .colorchooser.green_value       -charwidth 4 \
                                                -class TSpinbox \
                                                -cmenu {} \
                                              -command [list ::ms::dialog::color::RGB] \
                                             -datatype posinteger \
                                      -exportselection 1 \
                                                 -font NormalFont \
                                                 -from 0 \
                                            -increment 1 \
                                            -maxlength enabled \
                                          -placeholder "" \
                                                -state normal \
                                                -style TSpinbox \
                                            -takefocus 1 \
                                                   -to 255;

    label .colorchooser.blue_label       -anchor w \
                                      -charwidth 3 \
                                          -class TLabel \
                                          -cmenu {} \
                                       -compound none \
                                           -font NormalFont \
                                          -image {} \
                                        -justify left \
                                        -padding [list 0 0] \
                                         -relief flat \
                                          -state normal \
                                          -style TLabel \
                                      -takefocus 0 \
                                           -text "B" \
                                   -textvariable {} \
                                      -underline -1 \
                                     -wraplength 0;

    spinbox .colorchooser.blue_value       -charwidth 4 \
                                               -class TSpinbox \
                                               -cmenu {} \
                                             -command [list ::ms::dialog::color::RGB] \
                                            -datatype posinteger \
                                     -exportselection 1 \
                                                -font NormalFont \
                                                -from 0 \
                                           -increment 1 \
                                           -maxlength enabled \
                                         -placeholder "" \
                                               -state normal \
                                               -style TSpinbox \
                                           -takefocus 1 \
                                                  -to 255;

    label .colorchooser.hue_label       -anchor w \
                                     -charwidth 3 \
                                         -class TLabel \
                                         -cmenu {} \
                                      -compound none \
                                          -font NormalFont \
                                         -image {} \
                                       -justify left \
                                       -padding [list 0 0] \
                                        -relief flat \
                                         -state normal \
                                         -style TLabel \
                                     -takefocus 0 \
                                          -text "H" \
                                  -textvariable {} \
                                     -underline -1 \
                                    -wraplength 0;

    spinbox .colorchooser.hue_value       -charwidth 4 \
                                              -class TSpinbox \
                                              -cmenu {} \
                                            -command [list ::ms::dialog::color::HSB] \
                                           -datatype posinteger \
                                    -exportselection 0 \
                                               -font NormalFont \
                                               -from 0 \
                                          -increment 1 \
                                          -maxlength enabled \
                                            -padding [list 6p 3p] \
                                        -placeholder "" \
                                              -state normal \
                                              -style TSpinbox \
                                          -takefocus 1 \
                                                 -to 359;

    label .colorchooser.saturation_label       -anchor w \
                                            -charwidth 3 \
                                                -class TLabel \
                                                -cmenu {} \
                                             -compound none \
                                                 -font NormalFont \
                                                -image {} \
                                              -justify left \
                                              -padding [list 0 0] \
                                               -relief flat \
                                                -state normal \
                                                -style TLabel \
                                            -takefocus 0 \
                                                 -text "S" \
                                         -textvariable {} \
                                            -underline -1 \
                                           -wraplength 0;

    spinbox .colorchooser.saturation_value       -charwidth 4 \
                                                     -class TSpinbox \
                                                     -cmenu {} \
                                                   -command [list ::ms::dialog::color::HSB] \
                                                  -datatype posinteger \
                                           -exportselection 0 \
                                                      -font NormalFont \
                                                      -from 0 \
                                                 -increment 1 \
                                                 -maxlength enabled \
                                                   -padding [list 6p 3p] \
                                               -placeholder "" \
                                                     -state normal \
                                                     -style TSpinbox \
                                                 -takefocus 1 \
                                                        -to 100;

    label .colorchooser.brightness_label       -anchor w \
                                            -charwidth 3 \
                                                -class TLabel \
                                                -cmenu {} \
                                             -compound none \
                                                 -font NormalFont \
                                                -image {} \
                                              -justify left \
                                              -padding [list 0 0] \
                                               -relief flat \
                                                -state normal \
                                                -style TLabel \
                                            -takefocus 0 \
                                                 -text "B" \
                                         -textvariable {} \
                                            -underline -1 \
                                           -wraplength 0;

    spinbox .colorchooser.brightness_value       -charwidth 4 \
                                                     -class TSpinbox \
                                                     -cmenu {} \
                                                   -command [list ::ms::dialog::color::HSB] \
                                                  -datatype posinteger \
                                           -exportselection 0 \
                                                      -font NormalFont \
                                                      -from 0 \
                                                 -increment 1 \
                                                 -maxlength enabled \
                                                   -padding [list 6p 3p] \
                                               -placeholder "" \
                                                     -state normal \
                                                     -style TSpinbox \
                                                 -takefocus 1 \
                                                        -to 100;

    label .colorchooser.hex_label       -anchor w \
                                     -charwidth 3 \
                                         -class TLabel \
                                         -cmenu {} \
                                      -compound none \
                                          -font NormalFont \
                                         -image {} \
                                       -justify left \
                                       -padding [list 0 0] \
                                        -relief flat \
                                         -state normal \
                                         -style TLabel \
                                     -takefocus 0 \
                                          -text "#" \
                                  -textvariable {} \
                                     -underline -1 \
                                    -wraplength 0;

    entry .colorchooser.hex_value       -charwidth 7 \
                                            -class TEntry \
                                            -cmenu {} \
                                          -command [list ::ms::dialog::color::Hexadecimal] \
                                         -datatype hex \
                                  -exportselection 1 \
                                             -font NormalFont \
                                             -hash disabled \
                                          -justify left \
                                        -maxlength enabled \
                                          -padding [list 6p 3p] \
                                      -placeholder "" \
                                             -show {} \
                                            -state normal \
                                            -style TEntry \
                                        -takefocus 1;

    ##########################################################
    ##                                                      ##
    ##     CREATE AND POSITION THE COLOR CHOOSER IMAGES     ##
    ##                                                      ##
    ##########################################################

    .colorchooser.colorbox create   image 0 0 \
                                   -image $::ms::data(colorchooser,$::ms::data(colorchooser,hue),image) \
                                  -anchor nw \
                                    -tags colorbox;

    .colorchooser.hue_bar create   image 0 0 \
                                  -image $::ms::data(colorchooser,hue_bar,image) \
                                 -anchor nw \
                                   -tags hue_bar;

    .colorchooser.triangle_marker_trough create   image 1 0 \
                                                 -image marker \
                                                -anchor nw \
                                                  -tags triangle_marker;

    #############################################
    ##                                         ##
    ##     CREATE AND POSITION THE MARKERS     ##
    ##                                         ##
    #############################################

    # Trasform the 'saturation' and 'brightness' values into coordinates upon the colorbox image.
    set saturation [expr { round(360-$::ms::data(colorchooser,saturation)*3.6) }]
    set brightness [expr { round($::ms::data(colorchooser,brightness)*3.6) }]

    # Compute the NW (x1,y1) and SE (x2,y2) corners coordinates upon the colorbox image of the
    # square containing the circle marker.
    set x1 [expr { $brightness-$::ms::data(colorchooser,circle,radius) }]
    set y1 [expr { $saturation-$::ms::data(colorchooser,circle,radius) }]

    set x2 [expr { $brightness+$::ms::data(colorchooser,circle,radius) }]
    set y2 [expr { $saturation+$::ms::data(colorchooser,circle,radius) }]

    # Create and position the circle marker upon the colorbox.
    .colorchooser.colorbox create     oval $x1 $y1 $x2 $y2 \
                                  -outline $::ms::data(colorchooser,bordercolor) \
                                    -width 1 \
                                     -tags circle_marker;

    # Position the triangle marker upon its trough.
    .colorchooser.triangle_marker_trough moveto triangle_marker 1 $::ms::data(colorchooser,hue)

    #########################################
    ##                                     ##
    ##     SET THE TOPLEVEL ATTRIBUTES     ##
    ##                                     ##
    #########################################

    # Check the windowing system.
    switch -- $::ms::data(windowingsystem) {
        x11 { _wm attributes .colorchooser -type dialog }
    }

    _wm attributes .colorchooser -topmost 1
    _wm group      .colorchooser $parent_toplevel
    _wm transient  .colorchooser $parent_toplevel
    _wm resizable  .colorchooser 0 0
    _wm protocol   .colorchooser WM_DELETE_WINDOW [list ::ms::dialog::Cancel]

    ###################################################
    ##                                               ##
    ##     GRID THE COLOR CHOOSER WINDOW WIDGETS     ##
    ##                                               ##
    ###################################################

    # Grid
    _grid .colorchooser.colorbox     -row 0 \
                                  -column 0 \
                                    -padx [list $::ms::data(colorchooser,pad) 0] \
                                 -rowspan 8 \
                                  -sticky w;

    _grid .colorchooser.hue_bar     -row 0 \
                                 -column 2 \
                                   -padx [list 10p 0] \
                                -rowspan 8 \
                                 -sticky w;

    _grid .colorchooser.triangle_marker_trough     -row 0 \
                                                -column 3 \
                                                  -padx [list 0 10p] \
                                               -rowspan 8 \
                                                -sticky w;

    _grid .colorchooser.preview_box        -row 0 \
                                        -column 4 \
                                    -columnspan 3 \
                                          -pady [list $::ms::data(colorchooser,pad) 0] \
                                        -sticky nw;

    _grid .colorchooser.ok_button        -row 0 \
                                      -column 7 \
                                  -columnspan 4 \
                                        -padx [list 0 $::ms::data(colorchooser,pad)] \
                                        -pady [list $::ms::data(colorchooser,pad) 0] \
                                      -sticky ne;

    _grid .colorchooser.cancel_button        -row 1 \
                                          -column 7 \
                                      -columnspan 4 \
                                            -padx [list 0 $::ms::data(colorchooser,pad)] \
                                          -sticky ne;

    _grid .colorchooser.spacer    -row 3 \
                               -column 7 \
                               -sticky w;

    _grid .colorchooser.red_label    -row 4 \
                                  -column 4 \
                                  -sticky w;

    _grid .colorchooser.red_value    -row 4 \
                                  -column 6 \
                                  -sticky w;

    _grid .colorchooser.hue_label    -row 4 \
                                  -column 8 \
                                  -sticky w;

    _grid .colorchooser.hue_value    -row 4 \
                                  -column 10 \
                                    -padx [list 0 $::ms::data(colorchooser,pad)] \
                                  -sticky w;

    _grid .colorchooser.green_label    -row 5 \
                                    -column 4 \
                                    -sticky w;

    _grid .colorchooser.green_value    -row 5 \
                                    -column 6 \
                                    -sticky w;

    _grid .colorchooser.saturation_label    -row 5 \
                                         -column 8 \
                                         -sticky w;

    _grid .colorchooser.saturation_value    -row 5 \
                                         -column 10 \
                                           -padx [list 0 $::ms::data(colorchooser,pad)] \
                                         -sticky w;

    _grid .colorchooser.blue_label    -row 6 \
                                   -column 4 \
                                   -sticky w;

    _grid .colorchooser.blue_value    -row 6 \
                                   -column 6 \
                                   -sticky w;

    _grid .colorchooser.brightness_label    -row 6 \
                                         -column 8 \
                                         -sticky w;

    _grid .colorchooser.brightness_value    -row 6 \
                                         -column 10 \
                                           -padx [list 0 $::ms::data(colorchooser,pad)] \
                                         -sticky w;

    _grid .colorchooser.hex_label    -row 7 \
                                  -column 4 \
                                  -sticky w;

    _grid .colorchooser.hex_value        -row 7 \
                                      -column 6 \
                                  -columnspan 3 \
                                      -sticky w;

    # Set the focus on the Ok button.
    _focus -force .colorchooser.ok_button

    # Display the values.
    ::ms::dialog::color::Show

    update idletasks

    ######################
    ##                  ##
    ##     BINDINGS     ##
    ##                  ##
    ######################

    # ButtonPress-1
    .colorchooser.colorbox bind colorbox <ButtonPress-1> [list ::ms::dialog::color::Drag circle %y %x]
    .colorchooser.colorbox bind colorbox <B1-Motion>     [list ::ms::dialog::color::Drag circle %y %x]

    .colorchooser.hue_bar bind hue_bar <ButtonPress-1> [list ::ms::dialog::color::Drag triangle %y]
    .colorchooser.hue_bar bind hue_bar <B1-Motion>     [list ::ms::dialog::color::Drag triangle %y]

    .colorchooser.triangle_marker_trough bind triangle_marker <ButtonPress-1> [list ::ms::dialog::color::Drag triangle %y]
    .colorchooser.triangle_marker_trough bind triangle_marker <B1-Motion>     [list ::ms::dialog::color::Drag triangle %y]

    _bind .colorchooser.triangle_marker_trough <ButtonPress-1> [list ::ms::dialog::color::Drag triangle %y]
    _bind .colorchooser.triangle_marker_trough <B1-Motion>     [list ::ms::dialog::color::Drag triangle %y]

    # MouseWheel
    _bind .colorchooser.colorbox <MouseWheel>         [list ::ms::dialog::color::MouseWheel %D 1]
    _bind .colorchooser.colorbox <Control-MouseWheel> [list ::ms::dialog::color::MouseWheel %D 5]

    _bind .colorchooser.hue_bar <MouseWheel>         [list ::ms::dialog::color::MouseWheel %D 1]
    _bind .colorchooser.hue_bar <Control-MouseWheel> [list ::ms::dialog::color::MouseWheel %D 5]

    _bind .colorchooser.triangle_marker_trough <MouseWheel>         [list ::ms::dialog::color::MouseWheel %D 1]
    _bind .colorchooser.triangle_marker_trough <Control-MouseWheel> [list ::ms::dialog::color::MouseWheel %D 5]

    return ""
}

###############################
##                           ##
##     EVENTS PROCEDURES     ##
##                           ##
###############################

# Button
#
# Manages the 'cancel' and 'ok' buttons.
#
# It doesn't return anything.
proc ::ms::dialog::color:Button { response } {
    set ::wait_for_the_user_choice $response

    return ""
}

## Drag
#
# Drag either the colorbox circle marker or the hue triangle marker depending on the **type** provided.
#
# Where:
#
# type   Should be the object to drag.
#        Allowed values are **circle** or **triangle**.
#
# x,
# y      Should be the (x,y) coordinates of the mouse pointer at the time of the event.
#        The x coordinate is needed only for the *circle* type.
#
# It doesn't return anything.
proc ::ms::dialog::color::Drag { type y { x 0 } } {
    # Check the 'type' provided.
    switch -- $type {
        circle {
            # Check the coordinates provided.
            if { $x < 0 } {
                set ::ms::data(colorchooser,circle,x) 0
            } elseif { $x > 359 } {
                set ::ms::data(colorchooser,circle,x) 359
            } else {
                set ::ms::data(colorchooser,circle,x) [expr { round($x) }]
            }

            if { $y < 0 } {
                set ::ms::data(colorchooser,circle,y) 0
            } elseif { $y > 359 } {
                set ::ms::data(colorchooser,circle,y) 359
            } else {
                set ::ms::data(colorchooser,circle,y) [expr { round($y) }]
            }

            # Get the new top left corner of the square containing the colorbox circle marker.
            set x1 [expr { $::ms::data(colorchooser,circle,x)-$::ms::data(colorchooser,circle,radius) }]
            set y1 [expr { $::ms::data(colorchooser,circle,y)-$::ms::data(colorchooser,circle,radius) }]

            # Get the new bottom right corner of the square containing the colorbox circle marker.
            set x2 [expr { $::ms::data(colorchooser,circle,x)+$::ms::data(colorchooser,circle,radius) }]
            set y2 [expr { $::ms::data(colorchooser,circle,y)+$::ms::data(colorchooser,circle,radius) }]

            # Position the colorbox circle marker to the new coordinates.
            .colorchooser.colorbox coords circle_marker $x1 $y1 $x2 $y2

            # Trasform the 'saturation' and 'brightness' coordinates upon the colorbox image into the actual 'saturation' and 'brightness'.
            set ::ms::data(colorchooser,saturation) [expr { round((360-$::ms::data(colorchooser,circle,y))*$::ms::data(colorchooser,scale)) }]
            set ::ms::data(colorchooser,brightness) [expr { round($::ms::data(colorchooser,circle,x)*$::ms::data(colorchooser,scale)) }]
        }
        triangle {
            # Check the coordinate provided.
            if { $y < 0 } {
                set ::ms::data(colorchooser,hue) 0
            } elseif { $y > 359 } {
                set ::ms::data(colorchooser,hue) 359
            } else {
                set ::ms::data(colorchooser,hue) [expr { round($y) }]
            }

            # Change the colorbox image to reflect the new hue.
            .colorchooser.colorbox itemconfigure colorbox -image $::ms::data(colorchooser,$::ms::data(colorchooser,hue),image)

            # Position the hue bar triangle marker.
            .colorchooser.triangle_marker_trough moveto triangle_marker 1 $::ms::data(colorchooser,hue)
        }
    }

    # Transform the HSB channels into RGB channels [0,255].
    set RGB [::ms::dialog::color::HSB_RGB $::ms::data(colorchooser,hue) \
                                          $::ms::data(colorchooser,saturation) \
                                          $::ms::data(colorchooser,brightness)];

    set ::ms::data(colorchooser,red)   [lindex $RGB 0]
    set ::ms::data(colorchooser,green) [lindex $RGB 1]
    set ::ms::data(colorchooser,blue)  [lindex $RGB 2]

    # Transform the RGB channels [0,255] into an hexadecimal color (without the hash sign).
    set ::ms::data(colorchooser,hexadecimal) [format "%02x%02x%02x" $::ms::data(colorchooser,red) \
                                                                    $::ms::data(colorchooser,green) \
                                                                    $::ms::data(colorchooser,blue)];

    # Set and apply the new bordercolor of the colorbox circle marker.
    set bordercolor [::ms::Black_Or_White $::ms::data(colorchooser,hexadecimal)]
    .colorchooser.colorbox itemconfigure circle_marker -outline $bordercolor

    # Apply the new background and bordercolor to the preview color widget.
    .colorchooser.preview_box configure  -background $::ms::data(colorchooser,hexadecimal) \
                                        -bordercolor $bordercolor;

    # Display the values.
    ::ms::dialog::color::Show

    return ""
}

## MouseWheel
#
# Manages the **MouseWheel** and **Control-MouseWheel** events upon the colorbox or the hue bar.
#
# Where:
#
# amount   Should be the delta value of a **MouseWheel** or **Control-MouseWheel** event.
#          The delta value represents the rotation units the mouse wheel has been moved.
#          The sign of the value represents the direction the mouse wheel was scrolled.
#
# speed    Should be a positive integer indicating how many hues to scroll per rotation unit.
#
# It doesn't return anything.
proc ::ms::dialog::color::MouseWheel { amount speed } {
    # Transform the 'amount' provided in hue's steps.
    if { $amount < 0 } {
        set amount $speed
    } else {
        set amount [expr { -$speed }]
    }

    # Check the 'scrollmode' value ('classic' or 'natural').
    switch -- $::ms::scrollmode {
        natural { set amount [expr { -1.0*$amount }] }
    }

    # Change the colorbox image.
    ::ms::dialog::color::Drag triangle [expr { $::ms::data(colorchooser,hue)+$amount}]
}

####################################
##                                ##
##     COLOR MATHS PROCEDURES     ##
##                                ##
####################################

## Hexadecimal
#
# Compute the color channels (red, green, blue, hue, saturation and brightness)
# starting from the hexadecimal value.
#
# Where:
#
# args   Should not be provided.
#        *Args* is composed by the widget address and the widget value that started the event.
#        They are passed automatically by the entry widget.
#        *Args* is not needed in this procedure.
#
# It doesn't return anything.
proc ::ms::dialog::color::Hexadecimal { args } {
    # Get the current hexadecimal value.
    set ::ms::data(colorchooser,hexadecimal) [.colorchooser.hex_value get]

    # Trasform the hexadecimal provided into RGB channels [0,255].
    scan $::ms::data(colorchooser,hexadecimal) "%02x%02x%02x" ::ms::data(colorchooser,red) \
                                                              ::ms::data(colorchooser,green) \
                                                              ::ms::data(colorchooser,blue);

    # Transform the RGB channels [0,255] into HSB channels.
    set HSB [::ms::dialog::color::RGB_HSB $::ms::data(colorchooser,red) \
                                          $::ms::data(colorchooser,green) \
                                          $::ms::data(colorchooser,blue)];

    set hue        [ expr { round([lindex $HSB 0]) }]
    set saturation [ expr { round([lindex $HSB 1]) }]
    set brightness [ expr { round([lindex $HSB 2]) }]

    # Check the HSB channels limits.
    if { $hue < 0 } {
        set ::ms::data(colorchooser,hue) [expr { 360-$hue }]
    } elseif { $hue > 359 } {
        set ::ms::data(colorchooser,hue) [expr { $hue-360 }]
    } else {
        set ::ms::data(colorchooser,hue) $hue
    }

    if { $saturation < 0 } {
        set ::ms::data(colorchooser,saturation) 0
    } elseif { $saturation > 100 } {
        set ::ms::data(colorchooser,saturation) 100
    } else {
        set ::ms::data(colorchooser,saturation) $saturation
    }

    if { $brightness < 0 } {
        set ::ms::data(colorchooser,brightness) 0
    } elseif { $brightness > 100 } {
        set ::ms::data(colorchooser,brightness) 100
    } else {
        set ::ms::data(colorchooser,brightness) $brightness
    }

    # Put the color on the wheel.
    ::ms::dialog::color::Set_Markers

    # Display the values.
    ::ms::dialog::color::Show
}

## HSB
#
# Compute the color channels (hexadecimal, red, green, blue, hue, saturation and brightness)
# starting from an HSB channel.
#
# Where:
#
# args   Should not be provided.
#        *Args* is composed by the widget address and the widget value that started the event.
#        They are passed automatically by the spinbox widget.
#        *Args* is not needed in this procedure.
#
# It doesn't return anything.
proc ::ms::dialog::color::HSB { args } {
    # Get the current hue, saturation and brightness values.
    set ::ms::data(colorchooser,hue)        [.colorchooser.hue_value get]
    set ::ms::data(colorchooser,saturation) [.colorchooser.saturation_value get]
    set ::ms::data(colorchooser,brightness) [.colorchooser.brightness_value get]

    # Transform the HSB channels into RGB channels [0,255].
    set RGB [::ms::dialog::color::HSB_RGB $::ms::data(colorchooser,hue) \
                                          $::ms::data(colorchooser,saturation) \
                                          $::ms::data(colorchooser,brightness)];

    set ::ms::data(colorchooser,red)   [lindex $RGB 0]
    set ::ms::data(colorchooser,green) [lindex $RGB 1]
    set ::ms::data(colorchooser,blue)  [lindex $RGB 2]

    # Transform the RGB color at 8 bit [0,255] into a lowercase hexadecimal color at 8 bit with the hash sign.
    set ::ms::data(colorchooser,hexadecimal) [format "%02x%02x%02x" $::ms::data(colorchooser,red) \
                                                                    $::ms::data(colorchooser,green) \
                                                                    $::ms::data(colorchooser,blue)];

    # Put the color on the wheel.
    ::ms::dialog::color::Set_Markers

    # Display the values.
    ::ms::dialog::color::Show
}

## RGB
#
# Compute the hexadecimal color and the HSB channels starting from the RGB channels.
#
# Where:
#
# args   Should not be provided.
#        *Args* is composed by the widget address and the widget value that started the event.
#        They are passed automatically by the spinbox widget.
#        *Args* is not needed in this procedure.
#
# It doesn't return anything.
proc ::ms::dialog::color::RGB { args } {
    # Get the current red, green and blue values.
    set ::ms::data(colorchooser,red)   [.colorchooser.red_value   get]
    set ::ms::data(colorchooser,green) [.colorchooser.green_value get]
    set ::ms::data(colorchooser,blue)  [.colorchooser.blue_value  get]

    # Transform the RGB channels [0,255] into HSB channels.
    set HSB [::ms::dialog::color::RGB_HSB $::ms::data(colorchooser,red) \
                                          $::ms::data(colorchooser,green) \
                                          $::ms::data(colorchooser,blue)];

    set hue        [ expr { round([lindex $HSB 0]) }]
    set saturation [ expr { round([lindex $HSB 1]) }]
    set brightness [ expr { round([lindex $HSB 2]) }]

    # Check the HSB channels limits.
    if { $hue < 0 } {
        set ::ms::data(colorchooser,hue) [expr { 360-$hue }]
    } elseif { $hue > 359 } {
        set ::ms::data(colorchooser,hue) [expr { $hue-360 }]
    } else {
        set ::ms::data(colorchooser,hue) $hue
    }

    if { $saturation < 0 } {
        set ::ms::data(colorchooser,saturation) 0
    } elseif { $saturation > 100 } {
        set ::ms::data(colorchooser,saturation) 100
    } else {
        set ::ms::data(colorchooser,saturation) $saturation
    }

    if { $brightness < 0 } {
        set ::ms::data(colorchooser,brightness) 0
    } elseif { $brightness > 100 } {
        set ::ms::data(colorchooser,brightness) 100
    } else {
        set ::ms::data(colorchooser,brightness) $brightness
    }

    # Transform the RGB color at 8 bit [0,255] into a lowercase hexadecimal color at 8 bit with the hash sign.
    set ::ms::data(colorchooser,hexadecimal) [format "%02x%02x%02x" $::ms::data(colorchooser,red) \
                                                                    $::ms::data(colorchooser,green) \
                                                                    $::ms::data(colorchooser,blue)];

    # Put the color on the wheel.
    ::ms::dialog::color::Set_Markers

    # Display the values.
    ::ms::dialog::color::Show
}

## HSB_RGB
#
# Transform **HSB** colors into **RGB** colors.
#
# Where:
#
# hue,
# saturation,
# brightness   Should be the channels of the **HSB** color to convert.
#              The **HSB** color needs to be represented by 3 channels values in the following order and ranges:
#                 H --> Hue        [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#                 S --> Saturation [0,100.0]
#                 B --> Brightness [0,100.0]
#
#              Note that for hues, '360.0' is not included.
#
# Return a list containing the resulting **RGB** color channels.
# The **RGB** color will be represented by 3 channels values in the following order and ranges:
#   R --> red   [0,255]
#   G --> green [0,255]
#   B --> blue  [0,255]
proc ::ms::dialog::color::HSB_RGB { hue saturation brightness } {
    # Some pre-computation have been made in order to increase the performance:
    #   6 / 360 = 0.016666666666666666
    #   1 / 100 = 0.01

    set s [expr { $saturation*0.01 }]; # range [0,1.0]
    set b [expr { $brightness*0.01 }]; # range [0,1.0]

    # Transform 'hue' in sixtieths [0,6.0[.
    # Note that '6.0' is not included.
    set h [expr { $hue*0.016666666666666666 }]

    # Compute the hue sector [0,5].
    set sector [expr { int(floor($h)) }]

    # Compute the fractional part of the hue sector [0,1.0[.
    # Note that '1.0' is not included.
    set f [expr { $h-$sector }]

    # Check if 'sector' is an even number.
    switch -- $sector {
        0   -
        2   -
        4   { set f [expr { 1.0-$f }] }
    }

    # Compute 'm' and 'n'.
    set m [expr { $b*(1.0-$s) }]
    set n [expr { $b*(1.0-($f*$s)) }]

    # Compute the 'rgb' channels [0,1.0].
    switch -- $sector {
        0   {
            # hue < 60.0

            set r $b
            set g $n
            set b $m
        }
        1   {
            # hue < 120.0

            set r $n
            set g $b
            set b $m
        }
        2   {
            # hue < 180.0

            set r $m
            set g $b
            set b $n
        }
        3   {
            # hue < 240.0

            set r $m
            set g $n
            set b $b
        }
        4   {
            # hue < 300.0

            set r $n
            set g $m
            set b $b
        }
        5   {
            # hue < 360.0

            set r $b
            set g $m
            set b $n
        }
    }

    # Trasform the resulting 'rgb' channels [0,1.0] into 'RGB' channels [0,255].
    set red   [expr { round($r*255.0) }]
    set green [expr { round($g*255.0) }]
    set blue  [expr { round($b*255.0) }]

    return [list $red $green $blue]
}

## RGB_HSB
#
# Transform **RGB** colors into **HSB** colors.
#
# Where:
#
# red,
# green,
# blue     Should be the channels of the **RGB** color to convert.
#          The **RGB** color needs to be represented by 3 channels values in the following order and ranges:
#             R --> red   [0,255]
#             G --> green [0,255]
#             B --> blue  [0,255]
#
# Return a list containing the resulting **HSB** color channels.
# The **HSB** color will be represented by 3 channels values in the following order and ranges:
#   H --> Hue        [0,360.0[
#   S --> Saturation [0,100.0]
#   B --> Brightness [0,100.0]
#
# Note that for hues, '360.0' is not included.
proc ::ms::dialog::color::RGB_HSB { red green blue } {
    # Trasform every 'RGB' channels [0,255] provided into 'rgb' channels [0,1.0].
    set r [expr { $red*0.00392156862745098   }]
    set g [expr { $green*0.00392156862745098 }]
    set b [expr { $blue*0.00392156862745098  }]

    if { $r == $g && $r == $b } {
        # It's a gray.
        return [list 0 0 [expr { $r*100.0 }]]
    } else {
        set min  [expr { min($r,$g,$b) }]
        set max  [expr { max($r,$g,$b) }]
        set diff [expr { $max-$min }]

        # Compute the brightness [0,100.0].
        set brightness [expr { $max*100.0 }]

        # Compute the saturation [0,100.0].
        set saturation [expr { ($diff/$max)*100.0 }]

        # Compute the hue [0,360.0[.
        # Note that 360.0 is not included.
        if { $r == $max } {
            set segment [expr { ($g-$b)/$diff }]
            if { $segment < 0 } {
                set hue [expr { (6.0+$segment)*60.0 }]
            } else {
                # segment >= 0
                set hue [expr { $segment*60.0 }]
            }
        } elseif { $g == $max } {
            set segment [expr { ($b-$r)/$diff }]
            set hue     [expr { (2.0+$segment)*60.0 }]
        } else {
            # b = max
            set segment [expr { ($r-$g)/$diff }]
            set hue     [expr { (4.0+$segment)*60.0 }]
        }
    }

    return [list $hue $saturation $brightness]
}

#################################
##                             ##
##     INTERNAL PROCEDURES     ##
##                             ##
#################################

## Set_Markers
#
# Position the circle and triangle markers objects
#
# It doesn't return anything.
proc ::ms::dialog::color::Set_Markers {} {
    # Trasform the 'saturation' and 'brightness' values into coordinates upon the colorbox image.
    set saturation [expr { round(360-$::ms::data(colorchooser,saturation)*3.6) }]
    set brightness [expr { round($::ms::data(colorchooser,brightness)*3.6) }]

    # Compute the NW (x1,y1) and SE (x2,y2) coordinates upon the colorbox image of the square containing the circle marker.
    set x1 [expr { $brightness-$::ms::data(colorchooser,circle,radius) }]
    set y1 [expr { $saturation-$::ms::data(colorchooser,circle,radius) }]

    set x2 [expr { $brightness+$::ms::data(colorchooser,circle,radius) }]
    set y2 [expr { $saturation+$::ms::data(colorchooser,circle,radius) }]

    # Change the colorbox image to reflect the new hue.
    .colorchooser.colorbox itemconfigure colorbox -image $::ms::data(colorchooser,$::ms::data(colorchooser,hue),image)

    # Position the circle marker to the new coordinates.
    .colorchooser.colorbox coords circle_marker $x1 $y1 $x2 $y2

    # Set the new circle marker bordercolor.
    set bordercolor [::ms::Black_Or_White $::ms::data(colorchooser,hexadecimal)]

    # Apply the new bordercolor to the circle marker.
    .colorchooser.colorbox itemconfigure circle_marker -outline $bordercolor

    # Apply the new background and bordercolor to the preview color.
    .colorchooser.preview_box configure  -background $::ms::data(colorchooser,hexadecimal) \
                                        -bordercolor $bordercolor;

    # Position the triangle marker upon its trough.
    .colorchooser.triangle_marker_trough moveto triangle_marker 1 $::ms::data(colorchooser,hue)

    return ""
}

## Show
#
# Display the red, green, blue, hue, saturation, brightness and hexadecimal values.
#
# It doesn't return anything.
proc ::ms::dialog::color::Show {} {
    .colorchooser.red_value        set $::ms::data(colorchooser,red)
    .colorchooser.green_value      set $::ms::data(colorchooser,green)
    .colorchooser.blue_value       set $::ms::data(colorchooser,blue)
    .colorchooser.hue_value        set $::ms::data(colorchooser,hue)
    .colorchooser.saturation_value set $::ms::data(colorchooser,saturation)
    .colorchooser.brightness_value set $::ms::data(colorchooser,brightness)
    .colorchooser.hex_value        set $::ms::data(colorchooser,hexadecimal)
}

#*EOF*