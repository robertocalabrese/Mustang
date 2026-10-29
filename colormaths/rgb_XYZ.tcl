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
package provide ::ms::rgb_XYZ 0.1

# Create the mustang **rgb_XYZ** package.
namespace eval ::ms::rgb_XYZ {}

# Create an alias for the mustang **rgb_XYZ** conversion command.
interp alias {} ::rgb_XYZ {} ::ms::rgb_XYZ::Conversion

## Conversion
#
# Transform **rgb** colors into **XYZ** colors. The **XYZ** data will be relative to the PCS D50 space.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **rgb** colors to convert.
#            Each **rgb** color needs to be represented by 3 channels values in the following order and ranges:
#               r --> red   [0,1.0]
#               g --> green [0,1.0]
#               b --> blue  [0,1.0]
#
#            Examples:
#
#               One input **rgb** color:
#                  color    --> [list 0.4 0.5 0.2]
#                  channels --> [list 0.4 0.5 0.2]
#
#               Two input **rgb** colors:
#                  color1   --> [list 0.4 0.5 0.2]
#                  color2   --> [list 0.5 0.4 0.6]
#                  channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6] <-- all colors channels should be flattened together.
#
#               Three input **rgb** colors:
#                  color1   --> [list 0.4 0.5 0.2]
#                  color2   --> [list 0.5 0.4 0.6]
#                  color3   --> [list 0.2 0.2 0.1]
#                  channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6 0.2 0.2 0.1] <-- all colors channels should be flattened together.
#
#               and so on and so forth...
#
# Note: For info about **rgb** to **XYZ** conversions, RGB_XYZ matrices and chromatic adaptations visit [BruceLindbloom](http://www.brucelindbloom.com).
#       For info about companding operations visit [ICC 4.4 Specifications](https://www.color.org/specification/ICC.1-2022-05.p).
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
#      color    --> [list 0.4 0.5 0.2]
#      results  --> [list 0.4 0.5 0.2]
#
#   Two output **XYZ** colors:
#      color1   --> [list 0.4 0.5 0.2]
#      color2   --> [list 0.5 0.4 0.6]
#      results  --> [list 0.4 0.5 0.2 0.5 0.4 0.6] <-- all colors channels will be flattened together.
#
#   Three output **XYZ** colors:
#      color1   --> [list 0.4 0.5 0.2]
#      color2   --> [list 0.5 0.4 0.6]
#      color3   --> [list 0.2 0.2 0.1]
#      results  --> [list 0.4 0.5 0.2 0.5 0.4 0.6 0.2 0.2 0.1] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::rgb_XYZ::Conversion { channels } {
    foreach { r g b } $channels {
        # Trasform the *non-linear* rgb values into a *linear* rgb values [0,1.0].
        set r_linear [::companding $r inverse]
        set g_linear [::companding $g inverse]
        set b_linear [::companding $b inverse]

        # XYZ = RGB_XYZ matrix (already chromatically adapted) * rgb
        #
        # | a1  b1  c1 |   | r_linear |   | X |
        # | a2  b2  c2 | * | g_linear | = | Y |
        # | a3  b3  c3 |   | b_linear |   | Z |

        # Retrieve the RGB_XYZ coefficients for the current colorspace.
        set a1 [lindex $::ms::data(colorspace,$::ms::data(colorspace),RGB_XYZ) 0]
        set a2 [lindex $::ms::data(colorspace,$::ms::data(colorspace),RGB_XYZ) 1]
        set a3 [lindex $::ms::data(colorspace,$::ms::data(colorspace),RGB_XYZ) 2]
        set b1 [lindex $::ms::data(colorspace,$::ms::data(colorspace),RGB_XYZ) 3]
        set b2 [lindex $::ms::data(colorspace,$::ms::data(colorspace),RGB_XYZ) 4]
        set b3 [lindex $::ms::data(colorspace,$::ms::data(colorspace),RGB_XYZ) 5]
        set c1 [lindex $::ms::data(colorspace,$::ms::data(colorspace),RGB_XYZ) 6]
        set c2 [lindex $::ms::data(colorspace,$::ms::data(colorspace),RGB_XYZ) 7]
        set c3 [lindex $::ms::data(colorspace,$::ms::data(colorspace),RGB_XYZ) 8]

        # Transform the *linear* rgb values into XYZ values.
        set X [expr { ($a1*$r_linear) + ($b1*$g_linear) + ($c1*$b_linear) }]
        set Y [expr { ($a2*$r_linear) + ($b2*$g_linear) + ($c2*$b_linear) }]
        set Z [expr { ($a3*$r_linear) + ($b3*$g_linear) + ($c3*$b_linear) }]

        # Check that the resulting channels don't exceeds their limits.
        if { $X < 0 } {
            set X 0
        } elseif { $X > 1.999969482421875 } {
            set X 1.999969482421875
        }

        if { $Y < 0 } {
            set Y 0
        } elseif { $Y > 1.0 } {
            set Y 1.0
        }

        if { $Z < 0 } {
            set Z 0
        } elseif { $Z > 1.999969482421875 } {
            set Z 1.999969482421875
        }

        lappend results $X $Y $Z
    }

    return $results
}

#*EOF*