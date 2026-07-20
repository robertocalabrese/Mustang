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
package provide ::ms::Lab_XYZ 0.1

# Create the mustang **Lab_XYZ** package.
namespace eval ::ms::Lab_XYZ {}

# Create an alias for the mustang **Lab_XYZ** conversion command.
interp alias {} ::Lab_XYZ {} ::ms::Lab_XYZ::Conversion

## Conversion
#
# Transform **Lab** colors into **XYZ** colors, both in the PCS D50 space.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **Lab** colors to convert.
#            Each **Lab** color needs to be represented by 3 channels values in the following order and ranges:
#                L --> Lightness [0,100.0]
#                a --> a         [-128.0,127.0]
#                b --> b         [-128.0,127.0]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **Lab** color:
#                    color    --> [list 100 -50 50]
#                    channels --> [list 100 -50 50]
#
#                Two input **Lab** colors:
#                    color1   --> [list 100 -50 50]
#                    color2   --> [list 57   80 80]
#                    channels --> [list 100 -50 50 57 80 80] <-- all colors channels should be flattened together.
#
#                Three input **Lab** colors:
#                    color1   --> [list 100 -50 50]
#                    color2   --> [list 57   80 80]
#                    color3   --> [list 23   20 12]
#                    channels --> [list 100 -50 50 57 80 80 23 20 12] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Some pre-computation have been made in order to increase the performance:
#   1 / 116     = 0.008620689655172414
#   1 / 200     = 0.005
#   1 / 500     = 0.002
#   16 / 116    = 0.13793103448275862
#   116 / 903.3 = 0.12841802280526957
#   16 / 903.3  = 0.01771283073176132
#
# Note:  For info about **Lab** to **XYZ** conversions visit [BruceLindbloom](http://www.brucelindbloom.com).
#
# Return a list containing the resulting **XYZ** colors channels flattened together.
# Each **XYZ** color will be represented by 3 channels values in the following order and ranges:
#   X --> X [0,0.96419999999999995] --> PCS.X D50
#   Y --> Y [0,1.0]                 --> PCS.Y D50
#   Z --> Z [0,0.82489999999999997] --> PCS.Z D50
#
# Examples:
#
#   One output **XYZ** color:
#       color    --> [list 0.4 0.5 0.2]
#       results  --> [list 0.4 0.5 0.2]
#
#   Two output **XYZ** colors:
#       color1   --> [list 0.4 0.5 0.2]
#       color2   --> [list 0.5 0.4 0.6]
#       results  --> [list 0.4 0.5 0.2 0.5 0.4 0.6] <-- all colors channels will be flattened together.
#
#   Three output **XYZ** colors:
#       color1   --> [list 0.4 0.5 0.2]
#       color2   --> [list 0.5 0.4 0.6]
#       color3   --> [list 0.2 0.2 0.1]
#       results  --> [list 0.4 0.5 0.2 0.5 0.4 0.6 0.2 0.2 0.1] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::Lab_XYZ::Conversion { channels } {
    # CIE standard:
    #   k --> 903.3
    #   1/k --> 0.0011070519207350825
    #   epsilon --> 0.008856
    #   k*epsilon --> 7.9996247999999985

    foreach { L a b } $channels {
        # fy = (L+16.0)/116.0
        # fx = (a/500.0)+fy
        # fz = fy-(b/200.0)
        set fy [expr { ($L*0.008620689655172414)+0.13793103448275862 }]
        set fx [expr { ($a*0.002)+$fy }]
        set fz [expr { $fy-($b*0.005) }]

        # Compute xr [0,1.0].
        set xr [expr { $fx*$fx*$fx }]
        if { $xr <= 0.008856 } {
            # xr = ((116.0*X)-16.0)/k
            set xr [expr { (0.12841802280526957*$fx)-0.01771283073176132}]
        }

        # Compute yr [0,1.0].
        if { $L > 7.9996247999999985 } {
            # yr = pow(((L+16.0)/116.0),3) = pow(fy,3)
            set yr [expr { $fy*$fy*$fy }]
        } else {
            # yr = L/k
            set yr [expr { $L*0.0011070519207350825 }]
        }

        # Compute zr [0,1.0].
        set zr [expr { $fz*$fz*$fz }]
        if { $zr <= 0.008856 } {
            # zr = ((116.0*Z)-16.0)/k
            set zr [expr { (0.12841802280526957*$fz)-0.01771283073176132}]
        }

        # Compute X [0,0.96419999999999995] and Z [0,0.82489999999999997].
        #
        # X = xr * X_ref
        # Y = yr * Y_ref = yr
        # Z = zr * Z_ref
        #
        # Note: X_ref = 0.96419999999999995  --> PCS.X D50
        #       Y_ref = 1.0                  --> PCS.Y D50
        #       Z_ref = 0.82489999999999997  --> PCS.Z D50
        set X [expr { $xr*0.96419999999999995 }]
        set Z [expr { $zr*0.82489999999999997 }]

        lappend results $X $yr $Z
    }

    return $results
}

#*EOF*