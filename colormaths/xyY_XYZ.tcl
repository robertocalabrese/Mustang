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
package provide ::ms::xyY_XYZ 0.1

# Create the mustang **xyY_XYZ** package.
namespace eval ::ms::xyY_XYZ {}

# Create an alias for the mustang **xyY_XYZ** conversion command.
interp alias {} ::xyY_XYZ {} ::ms::xyY_XYZ::Conversion

## Conversion
#
# Transform **xyY** colors into **XYZ** colors, both in the PCS D50 space.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **xyY** colors to convert.
#            Each **xyY** color needs to be represented by 3 channels values in the following order and ranges:
#                x --> x [0,1.0]
#                y --> y [0,1.0]
#                Y --> Y [0,1.0]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **xyY** color:
#                    color    --> [list 1.0 0.5 0.7]
#                    channels --> [list 1.0 0.5 0.7]
#
#                Two input **xyY** colors:
#                    color1   --> [list 1.0 0.5 0.7]
#                    color2   --> [list 0.5 0.8 0.8]
#                    channels --> [list 1.0 0.5 0.7 0.5 0.8 0.8] <-- all colors channels should be flattened together.
#
#                Three input **xyY** colors:
#                    color1   --> [list 1.0 0.5 0.7]
#                    color2   --> [list 0.5 0.8 0.8]
#                    color3   --> [list 0.2 0.2 0.1]
#                    channels --> [list 1.0 0.5 0.7 0.5 0.8 0.8 0.2 0.2 0.1] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Note:  For info about **xyY** to **XYZ** conversions visit [BruceLindbloom](http://www.brucelindbloom.com).
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
proc ::ms::xyY_XYZ::Conversion { channels } {
    foreach { x y Y } $channels {
        if { $y == 0 } {
            lappend results 0 0 0
        } else {
            set k [expr { $Y/$y }]

            # Compute X [0,0.96419999999999995] and Z [0,0.82489999999999997].
            set X [expr { $x*$k }]
            set Z [expr { (1.0-$x-$y)*$k }]

            lappend results $X $Y $Z
        }
    }

    return $results
}

#*EOF*