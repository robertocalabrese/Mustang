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
package provide ::ms::rgb_RGB8 0.1

# Create the mustang **rgb_RGB8** package.
namespace eval ::ms::rgb_RGB8 {}

# Create an alias for the mustang **rgb_RGB8** conversion command.
interp alias {} ::rgb_RGB8 {} ::ms::rgb_RGB8::Conversion

## Conversion
#
# Transform **rgb** colors into **RGB8** colors.
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
# Return a list containing the resulting **RGB8** colors channels flattened together.
# Each **RGB8** color will be represented by 3 channels values in the following order and ranges:
#   R --> Red   [0,255]
#   G --> Green [0,255]
#   B --> Blue  [0,255]
#
# Examples:
#
#   One output **RGB8** color:
#       color    --> [list 40 172 212]
#       results  --> [list 40 172 212]
#
#   Two output **RGB8** colors:
#       color1   --> [list 40 172 212]
#       color2   --> [list 57 65  65 ]
#       results  --> [list 40 172 212 57 65 65] <-- all colors channels will be flattened together.
#
#   Three output **RGB8** colors:
#       color1   --> [list 40 172 212]
#       color2   --> [list 57 65  65 ]
#       color3   --> [list 23 212 120]
#       results  --> [list 40 172 212 57 65 65 23 212 120] <-- all colors channels will be flattened together.
#
#   and so on and so forth...
proc ::ms::rgb_RGB8::Conversion { channels } {
    foreach { r g b } $channels {
        set red8   [expr { round($r*255.0) }]
        set green8 [expr { round($g*255.0) }]
        set blue8  [expr { round($b*255.0) }]

        lappend results $red8 $green8 $blue8
    }

    return $results
}

#*EOF*