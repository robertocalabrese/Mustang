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
package provide ::ms::rgb_HWB 0.1

# Create the mustang **rgb_HWB** package.
namespace eval ::ms::rgb_HWB {}

# Create an alias for the mustang **rgb_HWB** conversion command.
interp alias {} ::rgb_HWB {} ::ms::rgb_HWB::Conversion

## Conversion
#
# Transform **rgb** colors into **HWB** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **rgb** colors to convert.
#            Each **rgb** color needs to be represented by 3 channels values in the following order and ranges:
#                r --> red   [0,1.0]
#                g --> green [0,1.0]
#                b --> blue  [0,1.0]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **rgb** color:
#                    color    --> [list 0.4 0.5 0.2]
#                    channels --> [list 0.4 0.5 0.2]
#
#                Two input **rgb** colors:
#                    color1   --> [list 0.4 0.5 0.2]
#                    color2   --> [list 0.5 0.4 0.6]
#                    channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6] <-- all colors channels should be flattened together.
#
#                Three input **rgb** colors:
#                    color1   --> [list 0.4 0.5 0.2]
#                    color2   --> [list 0.5 0.4 0.6]
#                    color3   --> [list 0.2 0.2 0.1]
#                    channels --> [list 0.4 0.5 0.2 0.5 0.4 0.6 0.2 0.2 0.1] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Note:  For info about the **HWB** color system visit [HWB](http://alvyray.com/Papers/CG/HWB_JGTv208.pdf).
#
# Return a list containing the resulting **HWB** colors channels flattened together.
# Each **HWB** color will be represented by 3 channels values in the following order and ranges:
#   H --> Hue       [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#   W --> Whiteness [0,100.0]
#   B --> Blackness [0,100.0]
#
# Note that for hues, '360.0' is not included.
#
# Examples:
#
#   One output **HWB** color:
#       color    --> [list 120 50 50]
#       results  --> [list 120 50 50]
#
#   Two output **HWB** colors:
#       color1   --> [list 120 50 50]
#       color2   --> [list 57  80 80]
#       results  --> [list 120 50 50 57 80 80] <-- all colors channels will be flattened together.
#
#   Three output **HWB** colors:
#       color1   --> [list 120 50 50]
#       color2   --> [list 57  80 80]
#       color3   --> [list 270 20 90]
#       results  --> [list 120 50 50 57 80 80 270 20 90] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::rgb_HWB::Conversion { channels } {
    foreach { r g b } $channels {
        # Compute the max and min value among r, g and b.
        set max [expr { max($r,$g,$b) }]
        set min [expr { min($r,$g,$b) }]

        # Compute the whiteness [0,100.0] and the blackness [0,100.0].
        set whiteness [expr { $min*100.0 }]
        set blackness [expr { 100.0-$whiteness }]

        if { $max == $min } {
            # It's a gray.
            lappend results UNDEF $whiteness $blackness
        } else {
            # Compute the hue [0,360.0[.
            # Note that in the hue 360.0 is not included.
            if { $r == $min } {
                set f [expr { $g-$b }]
                set i 3
            } elseif { $g == $min } {
                set f [expr { $b-$r }]
                set i 5
            } else {
                # b = min
                set f [expr { $r-$g }]
                set i 1
            }
            set hue [expr { (($i-$f)/($max-$min))*60.0 }]

            lappend results $hue $whiteness $blackness
        }
    }

    return $results
}

#*EOF*