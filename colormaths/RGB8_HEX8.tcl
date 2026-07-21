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
package provide ::ms::RGB8_HEX8 0.1

# Create the mustang **RGB8_HEX8** package.
namespace eval ::ms::RGB8_HEX8 {}

# Create an alias for the mustang **RGB8_HEX8** conversion command.
interp alias {} ::RGB8_HEX8 {} ::ms::RGB8_HEX8::Conversion

## Conversion
#
# Transform **RGB8** colors into **HEX8** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **RGB8** colors to convert.
#            Each **RGB8** color needs to be represented by 3 channels values in the following order and ranges:
#                R --> Red   [0,255]
#                G --> Green [0,255]
#                B --> Blue  [0,255]
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **RGB8** color:
#                    color    --> [list 40 172 212]
#                    channels --> [list 40 172 212]
#
#                Two input **RGB8** colors:
#                    color1   --> [list 40 172 212]
#                    color2   --> [list 57 65  65 ]
#                    channels --> [list 40 172 212 57 65 65] <-- all colors channels should be flattened together.
#
#                Three input **RGB8** colors:
#                    color1   --> [list 40 172 212]
#                    color2   --> [list 57 65  65 ]
#                    color3   --> [list 23 212 120]
#                    channels --> [list 40 172 212 57 65 65 23 212 120] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Return a list containing the resulting **HEX8** colors.
# Each **HEX8** color will be represented by six hexadecimals values in the range [#000000,#ffffff]
# that specifies its 3 channels values (red, green and blue) in the following order and ranges:
#     first two hexadecimals --> red   [00,ff]
#     next  two hexadecimals --> green [00,ff]
#     last  two hexadecimals --> blue  [00,ff]
#
# Examples:
#
#   One output **HEX8** color:
#       color    --> #ffff00
#       results  --> [list #ffff00] or just #ffff00
#
#   Two output **HEX8** colors:
#       color1   --> #000000
#       color2   --> #ffffff
#       results  --> [list #0000ff #ffffff]
#
#   Three output **HEX8** colors:
#       color1   --> #ff0000
#       color2   --> #00ff00
#       color3   --> #0000ff
#       results  --> [list #ff0000 #00ff00 #0000ff]
#
#   and so on and so forth...
proc ::ms::RGB8_HEX8::Conversion { channels } {
    foreach { red8 green8 blue8 } $channels {
        append results [format "#%02x%02x%02x" $red8 $green8 $blue8] " "
    }

    return [string trimright $results]
}

#*EOF*