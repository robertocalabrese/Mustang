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
package provide ::ms::Luv_XYZ 0.1

# Create the mustang **Luv_XYZ** package.
namespace eval ::ms::Luv_XYZ {}

# Create an alias for the mustang **Luv_XYZ** conversion command.
interp alias {} ::Luv_XYZ {} ::ms::Luv_XYZ::Conversion

## Conversion
#
# Transform **Luv** colors into **XYZ** colors, both in the PCS D50 space.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **Luv** colors to convert.
#            Each **Luv** color needs to be represented by 3 channels values in the following order and ranges:
#                L --> Lightness [0,100.0]
#                u --> u         [-134.0,220.0]
#                v --> v         [-140.0,122.0]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **Luv** color:
#                    color    --> [list 100 -50 50]
#                    channels --> [list 100 -50 50]
#
#                Two input **Luv** colors:
#                    color1   --> [list 100 -50 50]
#                    color2   --> [list 57   80 80]
#                    channels --> [list 100 -50 50 57 80 80] <-- all colors channels should be flattened together.
#
#                Three input **Luv** colors:
#                    color1   --> [list 100 -50 50]
#                    color2   --> [list 57   80 80]
#                    color3   --> [list 23   20 12]
#                    channels --> [list 100 -50 50 57 80 80 23 20 12] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Some pre-computation have been made in order to increase the performance:
#   1 / 3     = 0.3333333333333333
#   1 / 116   = 0.008620689655172414
#   16 / 116  = 0.13793103448275862
#
# Note:  For info about **Luv** to **XYZ** conversions visit [BruceLindbloom](http://www.brucelindbloom.com).
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
proc ::ms::Luv_XYZ::Conversion { channels } {
    # CIE standard:
    #   k --> 903.3
    #   1/k --> 0.0011070519207350825
    #   epsilon --> 0.008856
    #   k*epsilon --> 7.9996247999999985

    foreach { L u v } $channels {
        if { $L == 0 && $u == 0 && $v == 0 } {
            lappend results 0 0 0
        } else {
            # Compute Y [0,1.0].
            if { $L > 7.9996247999999985 } {
                # Y = pow(((L+16.0)/116.0),3)
                set Y [expr { pow((($L*0.008620689655172414)+0.13793103448275862),3) }]
            } else {
                # Y = L/k
                set Y [expr { $L*0.0011070519207350825 }]
            }

            # u0 = (4.0*X_ref)/(X_ref+(15.0*Y_ref)+(3.0*Z_ref)) = 0.20916649040886384
            # v0 = (9.0*Y_ref)/(X_ref+(15.0*Y_ref)+(3.0*Z_ref)) = 0.4880985308234222
            #
            # Note: X_ref = 0.96419999999999995  --> PCS.X D50
            #       Y_ref = 1.0                  --> PCS.Y D50
            #       Z_ref = 0.82489999999999997  --> PCS.Z D50
            #
            # a = 0.3333333333333333*(((52.0*L)/(u+(13.0*L*u0)))-1.0)
            # b = -5.0*Y
            # c = -1.0/3.0 = -0.3333333333333333
            # d = Y*(((39.0*L)/(v+(13.0*L*v0)))-5.0)
            set a  [expr { 0.3333333333333333*(((52.0*$L)/($u+(2.71916437531523*$L)))-1.0) }]
            set b  [expr { -5.0*$Y }]
            set d  [expr { $Y*(((39.0*$L)/($v+(6.345280900704489*$L)))-5.0) }]

            # Compute X [0,0.96419999999999995] and Z [0,0.82489999999999997].
            #
            # X = (d-b)/(a-c)
            # Z = (X*a)+b
            set X  [expr { ($d-$b)/($a+0.3333333333333333) }]
            set Z  [expr { ($X*$a)+$b }]

            lappend results $X $Y $Z
        }
    }

    return $results
}

#*EOF*