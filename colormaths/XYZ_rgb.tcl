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
package provide ::ms::XYZ_rgb 0.1

# Create the mustang **XYZ_rgb** package.
namespace eval ::ms::XYZ_rgb {}

# Create an alias for the mustang **XYZ_rgb** conversion command.
interp alias {} ::XYZ_rgb {} ::ms::XYZ_rgb::Conversion

## Conversion
#
# Transform **XYZ** colors into **rgb** colors. The **XYZ** data will be relative to the PCS D50 space.
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
# Note:  For info about **XYZ** to **rgb** conversions, XYZ_RGB matrices and chromatic adaptations visit [BruceLindbloom](http://www.brucelindbloom.com).
#        For info about companding operations visit [ICC 4.4 Specifications](https://www.color.org/specification/ICC.1-2022-05.p).
#
# Return a list containing the resulting **rgb** colors channels flattened together.
# Each **rgb** color will be represented by 3 channels values in the following order and ranges:
#   r --> red   [0,1.0]
#   g --> green [0,1.0]
#   b --> blue  [0,1.0]
#
# Examples:
#
#   One output **rgb** color:
#       color    --> [list 0.4 0.5 0.2]
#       results  --> [list 0.4 0.5 0.2]
#
#   Two output **rgb** colors:
#       color1   --> [list 0.4 0.5 0.2]
#       color2   --> [list 0.5 0.4 0.6]
#       results  --> [list 0.4 0.5 0.2 0.5 0.4 0.6] <-- all colors channels will be flattened together.
#
#   Three output **rgb** colors:
#       color1   --> [list 0.4 0.5 0.2]
#       color2   --> [list 0.5 0.4 0.6]
#       color3   --> [list 0.2 0.2 0.1]
#       results  --> [list 0.4 0.5 0.2 0.5 0.4 0.6 0.2 0.2 0.1] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::XYZ_rgb::Conversion { channels } {
    foreach { X Y Z } $channels {
        # rgb = sRGB D65 XYZ_RGB matrix (allready chromatically adapted from D50 to D65) * XYZ
        #
        #   | r |   | 3.134274306471669   -1.617274016967423   -0.4907348029960735 |   | X |
        #   | g | = | -0.978795574325203  1.916161596468483    0.03345405023031962 | * | Y |
        #   | b |   | 0.071978551323668   -0.2289898906034097  1.4057483687096277  |   | Z |

        # Transform the XYZ values into linear rgb values.
        set r [expr { (3.134274306471669*$X)+(-1.617274016967423*$Y)+(-0.4907348029960735*$Z) }]
        set g [expr { (-0.978795574325203*$X)+(1.916161596468483*$Y)+(0.03345405023031962*$Z) }]
        set b [expr { (0.071978551323668*$X)+(-0.2289898906034097*$Y)+(1.4057483687096277*$Z) }]

        # Trasform the linear rgb values into non-linear rgb values [0,1.0].
        foreach channel [list $r $g $b] {
            lappend results [companding $channel]
        }
    }

    return $results
}

#*EOF*