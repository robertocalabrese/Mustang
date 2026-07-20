# Copyright: 2025 Roberto Calabrese a.k.a. Kicka
#
# This file is part of "Mustang", a GUI toolkit for Tcl/Tk 9.0 and later
# (https://codeberg.org/kicka/Mustang).
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
package provide ::ms::XYZ_Luv 0.1

# Create the mustang **XYZ_Luv** package.
namespace eval ::ms::XYZ_Luv {}

# Create an alias for the mustang **XYZ_Luv** conversion command.
interp alias {} ::XYZ_Luv {} ::ms::XYZ_Luv::Conversion

## Conversion
#
# Transform **XYZ** colors into **Luv** colors, both in the PCS D50 space.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **XYZ** colors to convert.
#            Each **XYZ** color needs to be represented by 3 channels values in the following order and ranges:
#                X --> X [0,0.96419999999999995] --> PCS.X D50
#                Y --> Y [0,1.0]                 --> PCS.Y D50
#                Z --> Z [0,0.82489999999999997] --> PCS.Z D50
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **XYZ** color:
#                    color    --> [list 0.4 0.5 0.2]
#                    channels --> [list 0.4 0.5 0.2]
#
#                Two input **XYZ** colors:
#                    color1   --> [list 0.4 0.5 0.2]
#                    color2   --> [list 0.5 0.4 0.6]
#                    channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6] <-- all colors channels should be flattened together.
#
#                Three input **XYZ** colors:
#                    color1   --> [list 0.4 0.5 0.2]
#                    color2   --> [list 0.5 0.4 0.6]
#                    color3   --> [list 0.2 0.2 0.1]
#                    channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6 0.2 0.2 0.1] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# A pre-computation have been made in order to increase the performance:
#   1 / 3 = 0.3333333333333333
#
# Note:  For info about **XYZ** to **Luv** conversions visit [BruceLindbloom](http://www.brucelindbloom.com).
#
# Return a list containing the resulting **Luv** colors channels flattened together.
# Each **Luv** color will be represented by 3 channels values in the following order and ranges:
#   L --> Lightness [0,100.0]
#   u --> u         [-134.0,220.0]
#   v --> v         [-140.0,122.0]
#
# Examples:
#
#   One output **Luv** color:
#       color    --> [list 100 -50 50]
#       results  --> [list 100 -50 50]
#
#   Two output **Luv** colors:
#       color1   --> [list 100 -50 50]
#       color2   --> [list 57   80 80]
#       results  --> [list 100 -50 50 57 80 80] <-- all colors channels will be flattened together.
#
#   Three output **Luv** colors:
#       color1   --> [list 100 -50 50]
#       color2   --> [list 57   80 80]
#       color3   --> [list 23   20 12]
#       results  --> [list 100 -50 50 57 80 80 23 20 12] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::XYZ_Luv::Conversion { channels } {
    # CIE standard:
    #   k --> 903.3
    #   epsilon --> 0.008856

    foreach { X Y Z } $channels {
        if { $X == 0 && $Y == 0 && $Z == 0 } {
            lappend results 0 0 0
        } else {
            # Compute the lightness [0,100.0].
            #
            # Note that 'yr = Y/Y_ref = Y' because Y_ref = 1.0
            if { $Y > 0.008856 } {
                set L [expr { (116.0*(pow($Y,0.3333333333333333)))-16.0 }]
            } else {
                set L [expr { 903.3*$Y }]
            }

            # u1r = (4.0*X_ref)/(X_ref+(15.0*Y_ref)+(3.0*Z_ref)) = 0.20916649040886384
            # v1r = (9.0*Y_ref)/(X_ref+(15.0*Y_ref)+(3.0*Z_ref)) = 0.4880985308234222
            #
            # Note: X_ref = 0.96419999999999995  --> PCS.X D50
            #       Y_ref = 1.0                  --> PCS.Y D50
            #       Z_ref = 0.82489999999999997  --> PCS.Z D50

            # Compute u [-134.0,220.0] and v [-140.0,122.0].
            #
            # u = 13.0*L*(u1-u1r)
            # v = 13.0*L*(v1-v1r)
            set u1 [expr { (4.0*$X)/($X+(15.0*$Y)+(3.0*$Z)) }]
            set v1 [expr { (9.0*$Y)/($X+(15.0*$Y)+(3.0*$Z)) }]

            set u  [expr { 13.0*$L*($u1-0.20916649040886384) }]
            set v  [expr { 13.0*$L*($v1-0.4880985308234222) }]

            lappend results $L $u $v
        }
    }

    return $results
}

#*EOF*