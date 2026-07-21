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
package provide ::ms::RGB16_RGB12 0.1

# Create the mustang **RGB16_RGB12** package.
namespace eval ::ms::RGB16_RGB12 {}

# Create an alias for the mustang **RGB16_RGB12** conversion command.
interp alias {} ::RGB16_RGB12 {} ::ms::RGB16_RGB12::Conversion

## Conversion
#
# Transform **RGB16** colors into **RGB12** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **RGB16** colors to convert.
#            Each **RGB16** color needs to be represented by 3 channels values in the following order and ranges:
#                R --> Red   [0,65535]
#                G --> Green [0,65535]
#                B --> Blue  [0,65535]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **RGB16** color:
#                    color    --> [list 4000 17200 21200]
#                    channels --> [list 4000 17200 21200]
#
#                Two input **RGB16** colors:
#                    color1   --> [list 4000 17200 21200]
#                    color2   --> [list 5700 6500  6500 ]
#                    channels --> [list 4000 17200 21200 5700 6500 6500] <-- all colors channels should be flattened together.
#
#                Three input **RGB16** colors:
#                    color1   --> [list 4000 17200 21200]
#                    color2   --> [list 5700 6500  6500 ]
#                    color3   --> [list 2300 21200 12000]
#                    channels --> [list 4000 17200 21200 5700 6500 6500 2300 21200 12000] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# A pre-computation has been made in order to increase the performance:
#   4095 / 65535 = 0.06248569466697185
#
# Return a list containing the resulting **RGB12** colors channels flattened together.
# Each **RGB12** color will be represented by 3 channels values in the following order and ranges:
#   R --> Red   [0,4095]
#   G --> Green [0,4095]
#   B --> Blue  [0,4095]
#
# Examples:
#
#   One output **RGB12** color:
#       color    --> [list 400 1720 2120]
#       results  --> [list 400 1720 2120]
#
#   Two output **RGB12** colors:
#       color1   --> [list 400 1720 2120]
#       color2   --> [list 570 650  650 ]
#       results  --> [list 400 1720 2120 570 650 650] <-- all colors channels will be flattened together.
#
#   Three output **RGB12** colors:
#       color1   --> [list 400 1720 2120]
#       color2   --> [list 570 650  650 ]
#       color3   --> [list 230 2120 1200]
#       results  --> [list 400 1720 2120 570 650 650 230 2120 1200] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::RGB16_RGB12::Conversion { channels } {
    foreach { red16 green16 blue16 } $channels {
        set red12   [expr { round($red16*0.06248569466697185) }]
        set green12 [expr { round($green16*0.06248569466697185) }]
        set blue12  [expr { round($blue16*0.06248569466697185) }]

        lappend results $red12 $green12 $blue12
    }

    return $results
}

#*EOF*
