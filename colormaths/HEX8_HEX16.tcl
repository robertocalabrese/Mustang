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
package provide ::ms::HEX8_HEX16 0.1

# Create the mustang **HEX8_HEX16** package.
namespace eval ::ms::HEX8_HEX16 {}

# Create an alias for the mustang **HEX8_HEX16** conversion command.
interp alias {} ::HEX8_HEX16 {} ::ms::HEX8_HEX16::Conversion

## Conversion
#
# Transform **HEX8** colors into **HEX16** colors.
#
# Where:
#
# hexadecimals   Should be a list that specifies all the **HEX8** colors to convert.
#                Each **HEX8** color needs to be represented by six hexadecimals values in the range [#000000,#ffffff]
#                that specifies its 3 channels values (red, green and blue) in the following order and ranges:
#                    first two hexadecimals --> red   [00,ff]
#                    next  two hexadecimals --> green [00,ff]
#                    last  two hexadecimals --> blue  [00,ff]
#
#                Attention:
#                    - Each hexadecimal color must start with the '#' symbol.
#                    - Each hexadecimal letter must be lowercase.
#                    - Shortforms are not allowed.
#                    - Textual or theme colornames are not allowed.
#                    - For performance reasons, the input and output colors will not be checked.
#                      Please, take the appropriate steps before and after using this procedure or use
#                      the **color** command instead.
#
#                Examples:
#
#                    One input **HEX8** color:
#                        color        --> #ffff00
#                        hexadecimals --> [list #ffff00] or just #ffff00
#
#                    Two input **HEX8** colors:
#                        color1       --> #000000
#                        color2       --> #ffffff
#                        hexadecimals --> [list #000000 #ffffff]
#
#                    Three input **HEX8** colors:
#                        color1       --> #ff0000
#                        color2       --> #00ff00
#                        color3       --> #0000ff
#                        hexadecimals --> [list #ff0000 #00ff00 #0000ff]
#
#                    and so on and so forth...
#
# A pre-computation has been made in order to increase the performance:
#   65535 / 255 = 257
#
# Return a list containing the resulting **HEX16** colors channels flattened together.
# Each **HEX16** color will be represented by twelve hexadecimals values in the range [#000000000000,#ffffffffffff]
# that specifies its 3 channels values (red, green and blue) in the following order and ranges:
#     first four hexadecimals --> red   [0000,ffff]
#     next  four hexadecimals --> green [0000,ffff]
#     last  four hexadecimals --> blue  [0000,ffff]
#
# Examples:
#
#   One output **HEX16** color:
#       color        --> #ffffffff0000
#       hexadecimals --> [list #ffffffff0000]
#
#   Two output **HEX16** colors:
#       color1       --> #000000000000
#       color2       --> #ffffffffffff
#       hexadecimals --> [list #000000000000 #ffffffffffff]
#
#   Three output **HEX16** colors:
#       color1       --> #ffff00000000
#       color2       --> #0000ffff0000
#       color3       --> #00000000ffff
#       hexadecimals --> [list #ffff00000000 #0000ffff0000 #00000000ffff]
#
#   and so on and so forth...
proc ::ms::HEX8_HEX16::Conversion { hexadecimals } {
    foreach hexadecimal $hexadecimals {
        scan $hexadecimal "#%02x%02x%02x" red8 green8 blue8

        set red16   [expr { $red8*257 }]
        set green16 [expr { $green8*257 }]
        set blue16  [expr { $blue8*257 }]

        append results [format "#%04x%04x%04x" $red16 $green16 $blue16] " "
    }

    return [string trim $results]
}

#*EOF*
