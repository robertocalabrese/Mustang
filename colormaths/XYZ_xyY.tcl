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
package provide ::ms::XYZ_xyY 0.1

# Create the mustang **XYZ_xyY** package.
namespace eval ::ms::XYZ_xyY {}

# Create an alias for the mustang *XYZ_xyY* conversion command.
interp alias {} ::XYZ_xyY {} ::ms::XYZ_xyY::Conversion

## Conversion
#
# Transform **XYZ** colors into **xyY** colors, both in the PCS D50 space.
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
# Note:  For info about **XYZ** to **xyY** conversions visit [BruceLindbloom](http://www.brucelindbloom.com).
#
# Return a list containing the resulting **xyY** colors channels flattened together.
# Each **xyY** color will be represented by 3 channels values in the following order and ranges:
#   x --> x [0,1.0]
#   y --> y [0,1.0]
#   Y --> Y [0,1.0]
#
# Examples:
#
#   One output **xyY** color:
#       color    --> [list 1.0 0.5 0.7]
#       results  --> [list 1.0 0.5 0.7]
#
#   Two output **xyY** colors:
#       color1   --> [list 1.0 0.5 0.7]
#       color2   --> [list 0.5 0.8 0.8]
#       results  --> [list 1.0 0.5 0.7 0.5 0.8 0.8] <-- all colors channels will be flattened together.
#
#   Three output **xyY** colors:
#       color1   --> [list 1.0 0.5 0.7]
#       color2   --> [list 0.5 0.8 0.8]
#       color3   --> [list 0.2 0.2 0.1]
#       results  --> [list 1.0 0.5 0.7 0.5 0.8 0.8 0.2 0.2 0.1] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::XYZ_xyY::Conversion { channels } {
    foreach { X Y Z } $channels {
        if { $X == 0 && $Y == 0 && $Z == 0 } {
            # Set the x and y values as the D50 PCS Whitepoint xyY values.
            #
            # PCS.x D50 --> 0.345702914918791
            # PCS.y D50 --> 0.3585385966799326
            lappend results 0.345702914918791 0.3585385966799326 0
        } else {
            # Compute x [0,1.0] and y [0,1.0].
            set x [expr { $X/($X+$Y+$Z) }]
            set y [expr { $Y/($X+$Y+$Z) }]

            lappend results $x $y $Y
        }
    }

    return $results
}

#*EOF*