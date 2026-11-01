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
package provide ::ms::RGB_HSP 0.1

# Create the mustang **RGB_HSP** package.
namespace eval ::ms::RGB_HSP {}

# Create an alias for the mustang **RGB_HSP** conversion command.
interp alias {} ::RGB_HSP {} ::ms::RGB_HSP::Conversion

## Conversion
#
# Transform **RGB** colors into **HSP** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **RGB** colors to convert.
#            Each **RGB** color needs to be represented by 3 channels values in the following order and ranges:
#               R --> red   [0,255]
#               G --> green [0,255]
#               B --> blue  [0,255]
#
#            Examples:
#
#               One input **RGB** color:
#                  color    --> [list 40 172 212]
#                  channels --> [list 40 172 212]
#
#               Two input **RGB** colors:
#                  color1   --> [list 40 172 212]
#                  color2   --> [list 57 65  65 ]
#                  channels --> [list 40 172 212 57 65 65] <-- all colors channels will be flattened together.
#
#               Three input **RGB** colors:
#                  color1   --> [list 40 172 212]
#                  color2   --> [list 57 65  65 ]
#                  color3   --> [list 23 212 120]
#                  channels --> [list 40 172 212 57 65 65 23 212 120] <-- all colors channels will be flattened together.
#
#               and so on and so forth...
#
# Note: For info about the **HSP** color system visit [HSP](https://www.alienryderflex.com/hsp.html).
#       For info about unadapted values visit [BruceLindbloom](http://www.brucelindbloom.com).
#
#          unadapted_Yr = 0.21264461762001413 --> for the 'sRGB D65' colormodel
#          unadapted_Yg = 0.7151663725690272  --> for the 'sRGB D65' colormodel
#          unadapted_Yb = 0.07218900981095855 --> for the 'sRGB D65' colormodel
#
# Return a list containing the resulting **HSP** colors channels flattened together.
# Each **HSP** color will be represented by 3 channels values in the following order and ranges:
#   H --> Hue                  [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#   S --> Saturation           [0,100.0]
#   P --> Perceived Brightness [0,100.0]
#
# Note that for hues, '360.0' is not included.
#
# Examples:
#
#   One output **HSP** color:
#      color    --> [list 120 50 50]
#      results  --> [list 120 50 50]
#
#   Two output **HSP** colors:
#      color1   --> [list 120 50 50]
#      color2   --> [list 57  80 80]
#      results  --> [list 120 50 50 57 80 80] <-- all colors channels will be flattened together.
#
#   Three output **HSP** colors:
#      color1   --> [list 120 50 50]
#      color2   --> [list 57  80 80]
#      color3   --> [list 270 20 90]
#      results  --> [list 120 50 50 57 80 80 270 20 90] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::RGB_HSP::Conversion { channels } {
    # A pre-computation has been made in order to increase the performance:
    #   1 / 255 = 0.00392156862745098

    # Trasform every 'RGB' channels provided into 'rgb' channels.
    set rgbs [list ]
    foreach channel $channels {
        lappend rgbs [expr { $channel*0.00392156862745098 }]
    }

    # Convert every 'rgb' color into an 'HSP' color.
    set results [list ]
    foreach { r g b } $rgbs {
        if { $r == $g && $r == $b } {
            # It's a gray.
            lappend results UNDEF 0 [expr { $r*100.0 }]
        } else {
            # Compute the perceived_brightness [0,100.0].
            set r_part [expr { $r*$r*$::ms::Unadapted_Yr }]
            set g_part [expr { $g*$g*$::ms::Unadapted_Yg }]
            set b_part [expr { $b*$b*$::ms::Unadapted_Yb }]

            set perceived_brightness [expr { (sqrt($r_part+$g_part+$b_part))*100.0 }]

            # Compute the hue [0,360.0[ and the saturation [0,100.0].
            # Note that in the hue 360.0 is not included.
            set max [expr { max($r,$g,$b) }]
            if { $r == $max } {
                if { $b < $g } {
                    set partial    [expr { ($g-$b)/($r-$b) }]
                    set hue        [expr { 60.0*$partial }]
                    set saturation [expr { (1.0-($b/$r))*100.0 }]
                } else {
                    # b >= g
                    set partial    [expr { ($b-$g)/($r-$g) }]
                    set hue        [expr { 360.0-(60*$partial) }]
                    set saturation [expr { (1.0-($g/$r))*100.0 }]
                }
            } elseif { $g == $max } {
                if { $r < $b } {
                    set partial    [expr { ($b-$r)/($g-$r) }]
                    set hue        [expr { 120.0+(60.0*$partial) }]
                    set saturation [expr { (1.0-($r/$g))*100.0 }]
                } else {
                    # r >= b
                    set partial    [expr { ($r-$b)/($g-$b) }]
                    set hue        [expr { 120.0-(60.0*$partial) }]
                    set saturation [expr { (1.0-($b/$g))*100.0 }]
                }
            } else {
                # b = max
                if { $g < $r } {
                    set partial    [expr { ($r-$g)/($b-$g) }]
                    set hue        [expr { 240.0+(60.0*$partial) }]
                    set saturation [expr { (1.0-($g/$b))*100.0 }]
                } else {
                    # g >= r
                    set partial    [expr { ($g-$r)/($b-$r) }]
                    set hue        [expr { 240.0-(60.0*$partial) }]
                    set saturation [expr { (1.0-($r/$b))*100.0 }]
                }
            }

            # Check that the 'hue' doesn't exceeds its limits.
            if { $hue >= 360.0 } {
                set hue [expr { $hue-360.0 }]
            } elseif { $hue < 0 } {
                set hue [expr { $hue+360.0 }]
            }

            lappend results $hue $saturation $perceived_brightness
        }
    }

    return $results
}

#*EOF*