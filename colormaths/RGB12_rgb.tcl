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
package provide ::ms::RGB12_rgb 0.1

# Create the mustang **RGB12_rgb** package.
namespace eval ::ms::RGB12_rgb {}

# Create an alias for the mustang **RGB12_rgb** conversion command.
interp alias {} ::RGB12_rgb {} ::ms::RGB12_rgb::Conversion

## Conversion
#
# Transform **RGB12** colors into **rgb** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **RGB12** colors to convert.
#            Each **RGB12** color needs to be represented by 3 channels values in the following order and ranges:
#                R --> Red   [0,4095]
#                G --> Green [0,4095]
#                B --> Blue  [0,4095]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **RGB12** color:
#                    color    --> [list 400 1720 2120]
#                    channels --> [list 400 1720 2120]
#
#                Two input **RGB12** colors:
#                    color1   --> [list 400 1720 2120]
#                    color2   --> [list 570 650  650 ]
#                    channels --> [list 400 1720 2120 570 650 650] <-- all colors channels should be flattened together.
#
#                Three input **RGB12** colors:
#                    color1   --> [list 400 1720 2120]
#                    color2   --> [list 570 650  650 ]
#                    color3   --> [list 230 2120 1200]
#                    channels --> [list 400 1720 2120 570 650 650 230 2120 1200] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# A pre-computation has been made in order to increase the performance:
#   1 / 4095 = 0.0002442002442002442
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
proc ::ms::RGB12_rgb::Conversion { channels } {
    foreach { red12 green12 blue12 } $channels {
        set r [expr { $red12*0.0002442002442002442 }]
        set g [expr { $green12*0.0002442002442002442 }]
        set b [expr { $blue12*0.0002442002442002442 }]

        lappend results $r $g $b
    }

    return $results
}

#*EOF*
