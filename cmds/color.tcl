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

# Symbols meanings that may be used by the command synopsis:
#
#   *option*             --> A mandatory parameter that must be substituted with a proper value.
#   **option**           --> The command name or a mandatory parameter that must be written verbatim.
#
#   ?*option*?           --> An optional parameter that must be substituted with a proper value.
#   ?**option**?         --> An optional parameter that must be written verbatim.
#
#   ?*option* *value*?   --> An optional 'key-value' parameter that must be substituted with proper values.
#   ?**option** *value*? --> An optional 'key-value' parameter where the former must be written verbatim and
#                            the latter must be substituted with a proper value.

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

## color - Adjust colors.
#
#### SYNOPSIS:
#
# **color** **balance** *colors* ?**-tempK** *value*? ?**-depth** *value*?
# **color** **bw** *colors* ?**-depth** *value*?
# **color** **complement** *colors* ?**-depth** *value*?
# **color** **contrast** *color1* *color2* ?**-depth** *value*?
# **color** **convert** *colors* **-from** *value* **-to** *value*
# **color** **cold** *colors* ?**-amount** *value*? ?**-depth** *value*?
# **color** **dark** *colors* ?**-amount** *value*? ?**-via** *value*? ?**-depth** *value*?
# **color** **deficiency** *colors* ?**-severity** *value*? ?**-via** *value*? ?**-depth** *value*?
# **color** **desaturate** *colors* ?**-amount** *value*? ?**-via** *value*? ?**-depth** *value*?
# **color** **family** *colors* ?**-depth** *value*?
# **color** **grey** *colors* ?**-via** *value*? ?**-depth** *value*?
# **color** **gray** *colors* ?**-via** *value*? ?**-depth** *value*?
# **color** **inverse** *colors* ?**-depth** *value*?
# **color** **light** *colors* ?**-amount** *value*? ?**-via** *value*? ?**-depth** *value*?
# **color** **list** *palette* ?family?
# **color** **saturate** *colors* ?**-amount** *value*? ?**-via** *value*? ?**-depth** *value*?
# **color** **hot** *colors* ?**-amount** *value*? ?**-depth** *value*?
# **color** **wcga2.0** *color1* *color2* ?**-depth** *value*?
# **color** **websafe** *colors* ?**-depth** *value*?
#
#### DESCRIPTION:
#
# The **color** command is used to perform several *action* with colors.
#
#### COMMAND:
#
# The *color* command can have any of several forms, depending on the *action* argument.
# The *action* argument is the first argument after the command itself.
# The legal forms are:
#
#   **color** **balance** *colors* ?**-tempK** *value*? ?**-depth** *value*?
#      Color balance is the global adjustment of the intensities of the colors (though *tempK*) to render specific colors correctly,
#      particularly neutral colors.
#
#         *colors*             --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                  known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-tempK** *value*? --> Should be a temperature value in Kelvins [1000K, 27000K] indicating the **Correlated Color
#                                  Temperature** (CCT) of the white color to use.
#                                  Temperature values that exceeds these limits will be truncated.
#
#                                  If not provided, defaults to **6500** Kelvins ('D65').
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#      Returns a list containing the balanced hexadecimal colors with the same depth as the colors provided.
#
#   **color** **bw** *colors* ?**-depth** *value*?
#      Compute which color (**black** or **white**) has the greatest contrast with the colors provided.
#      Contrast range is [0,21].
#
#         *colors*             --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                  known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#      Returns a list in which each index element is the color **black** or **white**, depending on which one of these two colors has
#      the greatest contrast with the same indexed element provided.
#
#   **color** **complement** *colors* ?**-depth** *value*?
#      Returns a list containing the hexadecimal complement colors of the hexadecimal colors provided.
#
#         *colors*             --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                  known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **contrast** *color1* *color2* ?**-depth** *value*?
#      Returns the contrast value [0,21] between the two colors provided.
#
#         color1               --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by mustang.
#                                  For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         color2               --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by mustang.
#                                  For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **convert** *colors* **-from** *value* **-to** *value*
#      Convert the colors provided from the color model specified with the *-from* option to the one specified with the *-to* option.
#
#         *colors*          --> Should be a list containing the colors to convert expressed in the colormodel specified with
#                               the *-from*- option.
#
#         **-from** *value* --> Should be a string indicating the color model of the provided colors.
#                               Allowed color models are every color models supported by mustang.
#                               For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#                               Attention, colormodels are case sensitive.
#
#         **-to** *value*   --> Should be a string indicating the color model of the resulting colors.
#                               Allowed color models are every color models supported by mustang.
#                               For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#                               Attention, colormodels are case sensitive.
#
#      Returns a list containing the converted colors channels.
#
#   **color** **cold** *colors* ?**-amount** *value*? ?**-depth** *value*?
#      Returns a list containing an hexadecimal colder color (by *amount*) for each of the hexadecimal colors provided.
#
#         *colors*              --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                   known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-amount** *value*? --> Should be a floating point value [0,100.0] indicating the amount of heat (with or without the '%')
#                                   to subtract. If not provided defaults to **1%**.
#
#                                   Note: The amount value is relative to the maximum value reachable by the *red*, *green* and
#                                         *blue* channels.
#
#                                         For example:
#                                            **1.0%** in the **RGB** color model at **8**  bit [0,255]   corresponds to **2.55**.
#                                            **1.0%** in the **RGB** color model at **12** bit [0,4095]  corresponds to **40.95**.
#                                            **1.0%** in the **RGB** color model at **16** bit [0,65535] corresponds to **655.35**.
#
#         ?**-depth** *value*?  --> Should be an integer value indicating the bit depth of the colors provided.
#                                   Allowed values are:
#
#                                      **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                      **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                      **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                   If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **dark** *colors* ?**-amount** *value*? ?**-via** *value*? ?**-depth** *value*?
#      Returns a list containing an hexadecimal darker color (by *amount* and *via*) for each of the hexadecimal colors provided.
#
#         *colors*              --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                   known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-amount** *value*? --> Should be a floating point value [0,100.0] indicating the amount of light (with or without the '%')
#                                   to subtract.
#
#                                   Note: The amount value is relative to the maximum value reachable by the *red*, *green* and
#                                         *blue* channels or by the **L** channel.
#
#                                         For example:
#                                            **1.0%** in the **RGB** color model at **8**  bit [0,255]   corresponds to **2.55**.
#                                            **1.0%** in the **RGB** color model at **12** bit [0,4095]  corresponds to **40.95**.
#                                            **1.0%** in the **RGB** color model at **16** bit [0,65535] corresponds to **655.35**.
#                                            **1.0%** in the **HSL**, **Lab**, **Luv**, **LCHab** and **LCHuv** color models
#                                                     corrisponds to **1.0** (**L** goes from [0,100.0]).
#
#                                   If not provided, defaults to **1%**.
#
#         ?**-via** *value*?    --> Should be a string indicating the path to follow to achieve the result.
#                                   Allowed values are:
#
#                                      **RGB**
#                                      **HSL**
#                                      **Lab**
#                                      **Luv**
#                                      **LCHab**
#                                      **LCHuv**
#
#                                   If not provided, defaults to **Lab**.
#
#         ?**-depth** *value*?  --> Should be an integer value indicating the bit depth of the colors provided.
#                                   Allowed values are:
#
#                                      **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                      **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                      **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                   If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **deficiency** *colors* ?**-via** *value*? ?**-severity** *value*? ?**-depth** *value*?
#      Returns a list containing an hexadecimal vision deficiency color (**CVD**) for each of the hexadecimal colors provided.
#      The human eye has 3 cones, each one processing a specific light color (*red*, *green* or *blue*).
#      People can suffer of missing or damaged cone/s.
#
#         *colors*                --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                     known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-via** *value*?      --> Should be a string indicating the path to follow to achieve the result.
#                                     Allowed values are:
#
#                                        **achromatic**    --> No cones present.
#                                                              The person affected by this condition will process every color
#                                                               as a shade of gray. This case is also called *Daltonism*.
#                                                              This is the default if the **via** option is not provided.
#
#                                        **red**           --> Only the red cone is present.
#                                                              The person affected by this condition can process only the red lights.
#
#                                        **green**         --> Only the green cone is present.
#                                                              The person affected by this condition can process only the green lights.
#
#                                        **blue**          --> Only the blue cone is present.
#                                                              The person affected by this condition can process only the blue lights.
#
#                                        **protanopia**    --> Only the green and blue cones are present.
#                                                              The person affected by this condition cannot process the red lights.
#
#                                        **deuteranopia**  --> Only the red and blue cones are present.
#                                                              The person affected by this condition cannot process the green lights.
#
#                                        **tritanopia**    --> Only the red and green cones are present.
#                                                              The person affected by this condition cannot process the blue lights.
#
#                                        **protanomaly**   --> The red cone is damaged.
#                                                              The person affected by this condition will have a reduced sensitivity
#                                                              (**severity**) to red lights.
#
#                                        **deuteranomaly** --> The green cone is damaged.
#                                                              The person affected by this condition will have a reduced sensitivity
#                                                              (**severity**) to green lights.
#
#                                        **tritanomaly**   --> The blue cone is damaged.
#                                                              The person affected by this condition will have a reduced sensitivity
#                                                              (**severity**) to blue lights.
#
#                                     If not provided, defaults to **achromatic**.
#
#         ?**-severity** *value*? --> Should be a floating point value [0,100.0] indicating how much of the cone is damaged.
#                                     Meaningfull only for 'Protanomaly', 'Deuteranomaly' or 'Tritanomaly' vias.
#                                     If not provided defaults to '100.0'.
#
#         ?**-depth** *value*?    --> Should be an integer value indicating the bit depth of the colors provided.
#                                     Allowed values are:
#
#                                        **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                        **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                        **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                     If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#         Returns a list containing the vision deficiencies hexadecimal colors with the same depth as the colors provided.
#
#   **color** **desaturate** *colors* ?**-amount** *value*? ?**-via** *value*? ?**-depth** *value*?
#      Returns a list containing an hexadecimal desaturated color (by *amount* and *via*) for each of the hexadecimal colors provided.
#
#         *colors*              --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                   known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-amount** *value*? --> Should be a floating point value [0,100.0] indicating the amount of saturation (with or without the '%')
#                                   to subtract.
#
#                                   Note: The amount value is relative to the maximum value reachable by the *red*, *green* and
#                                         *blue* channels or by the **L** channel.
#
#                                         For example:
#                                            **1.0%** in the **HSB**, **HSI**, **HSL** and **HSP** color models corrisponds to **1.0**
#                                                     (**S** goes from [0,100.0]).
#
#                                   If not provided, defaults to **1%**.
#
#         ?**-via** *value*?    --> Should be a string indicating the path to follow to achieve the result.
#                                   Allowed values are:
#
#                                      **HSB**
#                                      **HSI**
#                                      **HSL**
#                                      **HSP**
#
#                                   If not provided defaults to **HSB**.
#
#         ?**-depth** *value*?  --> Should be an integer value indicating the bit depth of the colors provided.
#                                   Allowed values are:
#
#                                      **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                      **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                      **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                   If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **family** *colors* ?**-depth** *value*?
#      Return a list containing the families of the colors provided.
#
#         *colors*             --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                  known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **grey** *colors* ?**-via** *value*? ?**-depth** *value*?
#   **color** **gray** *colors* ?**-via** *value*? ?**-depth** *value*?
#      Returns a list containing an hexadecimal gray color (by *via*) for each of the hexadecimal colors provided.
#
#         *colors*             --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                  known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-via** *value*?   --> Should be a string indicating the path to follow to achieve the result.
#                                  Allowed values are:
#
#                                     **average**    --> The color *average* channel value will be used as gray channel.
#                                     **desaturate** --> The color *average value between the maximum and the minimum*
#                                                        channel values will be used as gray channel.
#                                     **red**        --> The color *red* channel will be used as gray channel.
#                                     **green**      --> The color *green* channel will be used as gray channel.
#                                     **blue**       --> The color *blue* channel will be used as gray channel.
#                                     **max**        --> The color *maximum* channel value will be used as gray channel.
#                                     **min**        --> The color *minimum* channel value will be used as gray channel.
#                                     **hevc**       --> The color *luma* value will be used as gray channel.
#
#                                  If not provided, defaults to **average**
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **inverse** *colors* ?**-depth** *value*?
#      Returns a list containing the hexadecimal inverse colors of the hexadecimal colors provided.
#
#         *colors*             --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                  known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **light** *colors* ?**-amount** *value*? ?**-via** *value*? ?**-depth** *value*?
#      Returns a list containing an hexadecimal lighter color (by *amount* and *via*) for each of the hexadecimal colors provided.
#
#         *colors*              --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                   known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-amount** *value*? --> Should be a floating point value [0,100.0] indicating the amount of light (with or without the '%')
#                                   to add.
#
#                                   Note: The amount value is relative to the maximum value reachable by the *red*, *green* and
#                                         *blue* channels or by the **L** channel.
#
#                                         For example:
#                                            **1.0%** in the **RGB** color model at **8**  bit [0,255]   corresponds to **2.55**.
#                                            **1.0%** in the **RGB** color model at **12** bit [0,4095]  corresponds to **40.95**.
#                                            **1.0%** in the **RGB** color model at **16** bit [0,65535] corresponds to **655.35**.
#                                            **1.0%** in the **HSL**, **Lab**, **Luv**, **LCHab** and **LCHuv** color models
#                                                     corrisponds to **1.0** (**L** goes from [0,100.0]).
#
#                                   If not provided, defaults to **1%**.
#
#         ?**-via** *value*?    --> Should be a string indicating the path to follow to achieve the result.
#                                   Allowed values are:
#
#                                      **RGB**
#                                      **HSL**
#                                      **Lab**
#                                      **Luv**
#                                      **LCHab**
#                                      **LCHuv**
#
#                                   If not provided, defaults to **Lab**.
#
#         ?**-depth** *value*?  --> Should be an integer value indicating the bit depth of the colors provided.
#                                   Allowed values are:
#
#                                      **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                      **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                      **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                   If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **list** *palette* ?family?
#      Return a list containing all the colornames available for the palette and family provided.
#
#         palette  --> Should be a string indicating the palette involved.
#                      Allowed values are every palette name contained in the variable '::PALETTES'.
#
#         ?family? --> Should be a string indicating the color family to retrieve.
#                      Allowed values are:
#                         **all**              --> Returns a list containing all the palette colornames no matter the families.
#                         **Gray** or **Grey** --> Returns a list containing all the palette colornames belonging to the 'Gray' family
#                                                  (*white* and *black* included).
#                         **Red**              --> Returns a list containing all the palette colornames belonging to the 'Red' family.
#                         **Red-Orange**       --> Returns a list containing all the palette colornames belonging to the 'Red-Orange' family.
#                         **Orange**           --> Returns a list containing all the palette colornames belonging to the 'Orange' family.
#                         **Orange-Yellow**    --> Returns a list containing all the palette colornames belonging to the 'Orange-Yellow' family.
#                         **Yellow**           --> Returns a list containing all the palette colornames belonging to the 'Yellow' family.
#                         **Yellow-Green**     --> Returns a list containing all the palette colornames belonging to the 'Yellow-Green' family.
#                         **Green**            --> Returns a list containing all the palette colornames belonging to the 'Green' family.
#                         **Green-Cyan**       --> Returns a list containing all the palette colornames belonging to the 'Green-Cyan' family.
#                         **Cyan**             --> Returns a list containing all the palette colornames belonging to the 'Cyan' family.
#                         **Cyan-Blue**        --> Returns a list containing all the palette colornames belonging to the 'Cyan-Blue' family.
#                         **Blue**             --> Returns a list containing all the palette colornames belonging to the 'Blue' family.
#                         **Blue-Purple**      --> Returns a list containing all the palette colornames belonging to the 'Blue-Purple' family.
#                         **Purple**           --> Returns a list containing all the palette colornames belonging to the 'Purple' family.
#                         **Purple-Red**       --> Returns a list containing all the palette colornames belonging to the 'Purple-Red' family.
#
#                      If not provided, defaults to **all**.
#
#   **color** **saturate** *colors* ?**-amount** *value*? ?**-via** *value*? ?**-depth** *value*?
#      Returns a list containing an hexadecimal saturated color (by *amount* and *via*) for each of the hexadecimal colors provided.
#
#         *colors*              --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                   known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-amount** *value*? --> Should be a floating point value [0,100.0] indicating the amount of saturation (with or without the '%')
#                                   to add.
#
#                                   Note: The amount value is relative to the maximum value reachable by the *red*, *green* and
#                                         *blue* channels or by the **L** channel.
#
#                                         For example:
#                                            **1.0%** in the **HSB**, **HSI**, **HSL** and **HSP** color models corrisponds to **1.0**
#                                                     (**S** goes from [0,100.0]).
#
#                                   If not provided, defaults to **1%**.
#
#         ?**-via** *value*?    --> Should be a string indicating the path to follow to achieve the result.
#                                   Allowed values are:
#
#                                      **HSB**
#                                      **HSI**
#                                      **HSL**
#                                      **HSP**
#
#                                   If not provided defaults to **HSB**.
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **hot** *colors* ?**-amount** *value*? ?**-depth** *value*?
#      Returns a list containing an hexadecimal hotter color (by *amount*) for each of the hexadecimal colors provided.
#
#         *colors*              --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                   known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-amount** *value*? --> Should be a floating point value [0,100.0] indicating the amount of heat (with or without the '%')
#                                   to subtract. If not provided defaults to **1%**.
#
#                                   Note: The amount value is relative to the maximum value reachable by the *red*, *green* and
#                                         *blue* channels.
#
#                                         For example:
#                                            **1.0%** in the **RGB** color model at **8**  bit [0,255]   corresponds to **2.55**.
#                                            **1.0%** in the **RGB** color model at **12** bit [0,4095]  corresponds to **40.95**.
#                                            **1.0%** in the **RGB** color model at **16** bit [0,65535] corresponds to **655.35**.
#
#         ?**-depth** *value*?  --> Should be an integer value indicating the bit depth of the colors provided.
#                                   Allowed values are:
#
#                                      **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                      **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                      **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                   If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#   **color** **wcga2.0** *color1* *color2* ?**-depth** *value*?
#      Return the contrast result for the four scenarios depicted in the **WCGA 2.0** recommendations for color impaired people.
#
#         color1               --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by mustang.
#                                  This color will be assumed to be used as *background* color.
#                                  For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         color2               --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by mustang.
#                                  This color will be assumed to be used as *foreground* color.
#                                  For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#      Returns a dictionary containing the following keys and values:
#
#         **-AA1**  --> The text is a paragraph with a large font (more than 14 points).
#         **-AA2**  --> The text is a paragraph with a small font (less than 14 points).
#         **-AAA1** --> The text is a title with a large font (more than 14 points).
#         **-AAA2** --> The text is a title with a small font (less than 14 points).
#
#      **AA1**, **AA2**, **AAA1** and **AAA2** values can be either 'OK' or 'FAIL'.
#
#   **color** **websafe** *colors* ?**-depth** *value*?
#      Returns a list containing an hexadecimal websafe color for each of the hexadecimal colors provided.
#
#         *colors*             --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                                  known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         ?**-depth** *value*? --> Should be an integer value indicating the bit depth of the colors provided.
#                                  Allowed values are:
#
#                                     **8**   --> meaning 8  bit colors, with an hexadecimal range of [#000000,#ffffff].
#                                     **12**  --> meaning 10 bit colors, with an hexadecimal range of [#000000000,#fffffffff].
#                                     **16**  --> meaning 16 bit colors, with an hexadecimal range of [#000000000000,#ffffffffffff].
#
#                                  If not provided, defaults to the value of the variable **::ms::colordepth**.
#
#### MUSTANG SUPPORTED COLORMODELS:
#
# **HEX** or **HEX8**   Indicates an *hexadecimal* color model at 8 bit and can be provided either as a textual colorname
#                       (that must be known by mustang) or as an hexadecimal color (with or without the '#') expressed in its
#                       shortform (with just 3 hexadecimals) or in its longform (with 6 hexadecimals).
#                       Multiple **HEX8** values must be provided as element of a list.
#
#                       Each hexadecimal color ranges from [#000000,#ffffff].
#
#                       When returned, an **HEX8** color will be in its longform, prepended with '#'.
#
#                       Examples:
#
#                          One input **HEX8** color:
#                             color  --> #ffff00
#                             Input  --> [list #ffff00] or just #ffff00
#
#                          Two input **HEX8** colors:
#                             color1 --> #000000
#                             color2 --> #ffffff
#                             Input  --> [list #000000 #ffffff]
#
#                          Three input **HEX8** colors:
#                             color1 --> #ff0000
#                             color2 --> #00ff00
#                             color3 --> #0000ff
#                             Input  --> [list #ff0000 #00ff00 #0000ff]
#
#                          and so on and so forth...
#
# **HEX12**             Indicates an *hexadecimal* color model at 12 bit and can be provided either as a textual colorname
#                       (that must be known by mustang) or as an hexadecimal color (with or without the '#') expressed in its
#                       shortform (with just 3 hexadecimals) or in its longform (with 9 hexadecimals).
#                       Multiple **HEX12** values must be provided as element of a list.
#
#                       Each hexadecimal color ranges from [#000000000,#fffffffff].
#
#                       When returned, an **HEX12** color will be in its longform, prepended with '#'.
#
#                       Examples:
#
#                          One input **HEX12** color:
#                             color  --> #ffffff000
#                             Input  --> [list #ffffff000] or just #ffffff000
#
#                          Two input **HEX12** colors:
#                             color1 --> #000000000
#                             color2 --> #fffffffff
#                             Input  --> [list #000000000 #fffffffff]
#
#                          Three input **HEX12** colors:
#                             color1 --> #fff000000
#                             color2 --> #000fff000
#                             color3 --> #000000fff
#                             Input  --> [list #fff000000 #000fff000 #000000fff]
#
#                          and so on and so forth...
#
# **HEX16**             Indicates an *hexadecimal* color model at 16 bit and can be provided either as a textual colorname
#                       (that must be known by mustang) or as an hexadecimal color (with or without the '#') expressed in its
#                       shortform (with just 3 hexadecimals) or in its longform (with 12 hexadecimals).
#                       Multiple **HEX16** values must be provided as element of a list.
#
#                       Each hexadecimal color ranges from [#000000000000,#ffffffffffff].
#
#                       When returned, an **HEX16** color will be in its longform, prepended with '#'.
#
#                       Examples:
#
#                          One input **HEX16** color:
#                             color  --> #ffffffff0000
#                             Input  --> [list #ffffffff0000] or just #ffffffff0000
#
#                          Two input **HEX16** colors:
#                             color1 --> #000000000000
#                             color2 --> #ffffffffffff
#                             Input  --> [list #000000000000 #ffffffffffff]
#
#                          Three input **HEX16** colors:
#                             color1 --> #ffff00000000
#                             color2 --> #0000ffff0000
#                             color3 --> #00000000ffff
#                             Input  --> [list #ffff00000000 #0000ffff0000 #00000000ffff]
#
#                          and so on and so forth...
#
# **RGB** or **RGB8**   Indicates an **RGB** color model at 8 bit, where *R*, *G* and *B* represents its *red*, *green* and *blue* channel.
#                       They must be provided as list with at least 3 elements. Each elements must be an integer value that indicates
#                       their channel values (in order, the *red*, *green* and *blue* values for each color).
#
#                       Each channel ranges from [0,255].
#
#                       Examples:
#
#                          One input **RGB8** color:
#                             color  --> red 40, green 172, blue 212
#                             Input  --> [list 40 172 212]
#
#                          Two input **RGB8** colors:
#                             color1 --> red 40, green 172, blue 212
#                             color2 --> red 57, green 65,  blue 65
#                             Input  --> [list 40 172 212 57 65 65]
#
#                          Three input **RGB8** colors:
#                             color1 --> red 40, green 172, blue 212
#                             color2 --> red 57, green 65,  blue 65
#                             color3 --> red 23, green 212, blue 120
#                             Input  --> [list 40 172 212 57 65 65 23 212 120]
#
#                          and so on and so forth...
#
# **RGB12**             Indicates an **RGB** color model at 12 bit, where *R*, *G* and *B* represents its *red*, *green* and *blue* channel.
#                       They must be provided as list with at least 3 elements. Each elements must be an integer value that indicates
#                       their channel values (in order, the *red*, *green* and *blue* values for each color).
#
#                       Each channel ranges from [0,4095].
#
#                       Examples:
#
#                          One input **RGB12** color:
#                             color  --> red 40, green 1072, blue 2120
#                             Input  --> [list 40 1072 2120]
#
#                          Two input **RGB12** colors:
#                             color1 --> red 40, green 1072,   blue 2120
#                             color2 --> red 3557, green 4065, blue 165
#                             Input  --> [list 40 1072 2120 3557 4065 165]
#
#                          Three input **RGB12** colors:
#                             color1 --> red 40, green 1072,   blue 2120
#                             color2 --> red 3557, green 4065, blue 165
#                             color3 --> red 2300, green 2120, blue 1120
#                             Input  --> [list 40 1072 2120 3557 4065 165 2300 2212 1120]
#
#                          and so on and so forth...
#
# **RGB16**             Indicates an **RGB** color model at 16 bit, where *R*, *G* and *B* represents its *red*, *green* and *blue* channel.
#                       They must be provided as list with at least 3 elements. Each elements must be an integer value that indicates
#                       their channel values (in order, the *red*, *green* and *blue* values for each color).
#
#                       Each channel ranges from [0,65535].
#
#                       Examples:
#
#                          One input **RGB16** color:
#                             color  --> red 400, green 10720, blue 42120
#                             Input  --> [list 400 10720 42120]
#
#                          Two input **RGB16** colors:
#                             color1 --> red 400,   green 10720, blue 42120
#                             color2 --> red 13557, green 54065, blue 4165
#                             Input  --> [list 400 10720 42120 13557 54065 4165]
#
#                          Three input **RGB16** colors:
#                             color1 --> red 400,   green 10720, blue 42120
#                             color2 --> red 13557, green 54065, blue 4165
#                             color3 --> red 42300, green 62120, blue 31120
#                             Input  --> [list 400 10720 42120 13557 54065 4165 42300 62212 31120]
#
#                          and so on and so forth...
#
# **rgb**               Indicates an **rgb** color model, where *r*, *g* and *b* represents its *red*, *green* and *blue* channel.
#                       They must be provided as list with at least 3 elements. Each elements must be a floating point value
#                       that indicates their channel values (in order, the *red*, *green* and *blue* values for each color).
#
#                       Each channel ranges from [0,1.0].
#
#                       Examples:
#
#                          One input **rgb** color:
#                             color  --> red 0.4, green 0.25, blue 0.7
#                             Input  --> [list 0.4 0.25 0.7]
#
#                          Two input **rgb** colors:
#                             color1 --> red 0.4,  green 0.25, blue 0.7
#                             color2 --> red 0.13, green 0.5,  blue 0.4165
#                             Input  --> [list 0.4 0.25 0.7 0.13 0.5 0.4165]
#
#                          Three input **rgb** colors:
#                             color1 --> red 0.4,  green 0.25, blue 0.7
#                             color2 --> red 0.13, green 0.5,  blue 0.4165
#                             color3 --> red 0.8,  green 1.0,  blue 0.2
#                             Input  --> [list 0.4 0.25 0.7 0.13 0.5 0.4165 0.8 1.0 0.2]
#
#                          and so on and so forth...
#
# **HSB**               Indicates an **HSB** color model, where *H*, *S* and *B* represents the *hue*, *saturation* and *brightness* channel.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *hue*, *saturation* and *brightness* values for each color).
#
#                       The *hue* channel ranges from [0,360.0[ with *360.0* not included, while the *saturation* and *brightness* channels
#                       ranges from [0,100.0].
#
#                       Examples:
#
#                          One input **HSB** color:
#                             color  --> hue 120.0, saturation 25.0, brightness 70.0
#                             Input  --> [list 120.0 25.0 70.0]
#
#                          Two input **HSB** colors:
#                             color1 --> hue 120.0, saturation 25.0, brightness 70.0
#                             color2 --> hue 60.0,  saturation 50.0, brightness 12.5
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5]
#
#                          Three input **HSB** colors:
#                             color1 --> hue 120.0, saturation 25.0, brightness 70.0
#                             color2 --> hue 60.0,  saturation 50.0, brightness 12.5
#                             color3 --> hue 240.0, saturation 71.0, brightness 100.0
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5 240.0 71.0 100.0]
#
#                          and so on and so forth...
#
# **HSI**               Indicates an **HSI** color model, where *H*, *S* and *I* represents the *hue*, *saturation* and *intensity* channel.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *hue*, *saturation* and *intensity* values for each color).
#
#                       The *hue* channel ranges from [0,360.0[ with *360.0* not included, while the *saturation* and *intensity* channels
#                       ranges from [0,100.0].
#
#                       Examples:
#
#                          One input **HSI** color:
#                             color  --> hue 120.0, saturation 25.0, intensity 70.0
#                             Input  --> [list 120.0 25.0 70.0]
#
#                          Two input **HSI** colors:
#                             color1 --> hue 120.0, saturation 25.0, intensity 70.0
#                             color2 --> hue 60.0,  saturation 50.0, intensity 12.5
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5]
#
#                          Three input **HSI** colors:
#                             color1 --> hue 120.0, saturation 25.0, intensity 70.0
#                             color2 --> hue 60.0,  saturation 50.0, intensity 12.5
#                             color3 --> hue 240.0, saturation 71.0, intensity 100.0
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5 240.0 71.0 100.0]
#
#                          and so on and so forth...
#
# **HSL**               Indicates an **HSL** color model, where *H*, *S* and *L* represents the *hue*, *saturation* and *lightness* channel.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *hue*, *saturation* and *lightness* values for each color).
#
#                       The *hue* channel ranges from [0,360.0[ with *360.0* not included, while the *saturation* and *lightness* channels
#                       ranges from [0,100.0].
#
#                       Examples:
#
#                          One input **HSL** color:
#                             color  --> hue 120.0, saturation 25.0, lightness 70.0
#                             Input  --> [list 120.0 25.0 70.0]
#
#                          Two input **HSL** colors:
#                             color1 --> hue 120.0, saturation 25.0, lightness 70.0
#                             color2 --> hue 60.0,  saturation 50.0, lightness 12.5
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5]
#
#                          Three input **HSL** colors:
#                             color1 --> hue 120.0, saturation 25.0, lightness 70.0
#                             color2 --> hue 60.0,  saturation 50.0, lightness 12.5
#                             color3 --> hue 240.0, saturation 71.0, lightness 100.0
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5 240.0 71.0 100.0]
#
#                          and so on and so forth...
#
# **HSP**               Indicates an **HSP** color model, where *H*, *S* and *P* represents the *hue*, *saturation* and *perceived brightness* channel.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *hue*, *saturation* and *perceived brightness* values for each color).
#
#                       The *hue* channel ranges from [0,360.0[ with *360.0* not included, while the *saturation* and *perceived brightness* channels
#                       ranges from [0,100.0].
#
#                       Examples:
#
#                          One input **HSP** color:
#                             color  --> hue 120.0, saturation 25.0, perceived brightness 70.0
#                             Input  --> [list 120.0 25.0 70.0]
#
#                          Two input **HSP** colors:
#                             color1 --> hue 120.0, saturation 25.0, perceived brightness 70.0
#                             color2 --> hue 60.0,  saturation 50.0, perceived brightness 12.5
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5]
#
#                          Three input **HSP** colors:
#                             color1 --> hue 120.0, saturation 25.0, perceived brightness 70.0
#                             color2 --> hue 60.0,  saturation 50.0, perceived brightness 12.5
#                             color3 --> hue 240.0, saturation 71.0, perceived brightness 100.0
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5 240.0 71.0 100.0]
#
#                          and so on and so forth...
#
# **HWB**               Indicates an **HWB** color model, where *H*, *W* and *B* represents the *hue*, *whiteness* and *blackness* channel.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *hue*, *whiteness* and *blackness* values for each color).
#
#                       The *hue* channel ranges from [0,360.0[ with *360.0* not included, while the *whiteness* and *blackness* channels
#                       ranges from [0,100.0].
#
#                       Examples:
#
#                          One input **HWB** color:
#                             color  --> hue 120.0, whiteness 25.0, blackness 70.0
#                             Input  --> [list 120.0 25.0 70.0]
#
#                          Two input **HWB** colors:
#                             color1 --> hue 120.0, whiteness 25.0, blackness 70.0
#                             color2 --> hue 60.0,  whiteness 50.0, blackness 12.5
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5]
#
#                          Three input **HWB** colors:
#                             color1 --> hue 120.0, whiteness 25.0, blackness 70.0
#                             color2 --> hue 60.0,  whiteness 50.0, blackness 12.5
#                             color3 --> hue 240.0, whiteness 71.0, blackness 100.0
#                             Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5 240.0 71.0 100.0]
#
#                          and so on and so forth...
#
# **XYZ**               Indicates an **XYZ** color model, where *X*, *Y* and *Z* are the tristimulus values, as defined in the
#                       **CIEXYZ 1931** color space.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *X*, *Y* and *Z* values for each color).
#
#                       The *Y* channel ranges from [0,1.0], while the *X* and *Z* channels ranges from [0,1.999969482421875].
#
#                       Examples:
#
#                          One input **XYZ** color:
#                             color  --> X 0.4, Y 0.5, Z 0.2
#                             Input  --> [list 0.4 0.5 0.2]
#
#                          Two input **XYZ** colors:
#                             color1 --> X 0.4, Y 0.5, Z 0.2
#                             color2 --> X 0.5, Y 0.4, Z 0.6
#                             Input  --> [list 0.4 0.5 0.2 0.5 0.4 0.6]
#
#                          Three input **XYZ** colors:
#                             color1 --> X 0.4, Y 0.5, Z 0.2
#                             color2 --> X 0.5, Y 0.4, Z 0.6
#                             color3 --> X 0.2, Y 0.2, Z 0.1
#                             Input  --> [list 0.4 0.5 0.2 0.5 0.4 0.6 0.2 0.2 0.1]
#
#                          and so on and so forth...
#
# **xyY**               Indicates an **xyY** color model, where *x*, *y* are normalized *X* and *Y* tristimulus values as defined in the
#                       **CIEXYZ 1931** color space, while *Y* is the actual *Y* tristimulus value as defined in the **CIEXYZ 1931** color space.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *X*, *Y* and *Z* values for each color).
#
#                       The *xyY* channel ranges from [0,1.0].
#
#                       Examples:
#
#                          One input **xyY** color:
#                             color  --> x 1.0, y 0.5, Y 0.7
#                             Input  --> [list 1.0 0.5 0.7]
#
#                          Two input **xyY** colors:
#                             color1 --> x 1.0, y 0.5, Y 0.7
#                             color2 --> x 0.5, y 0.8, Y 0.8
#                             Input  --> [list 1.0 0.5 0.7 0.5 0.8 0.8]
#
#                          Three input **xyY** colors:
#                             color1 --> x 1.0, y 0.5, Y 0.7
#                             color2 --> x 0.5, y 0.8, Y 0.8
#                             color3 --> x 0.2, y 0.2, Y 0.1
#                             Input  --> [list 1.0 0.5 0.7 0.5 0.8 0.8 0.2 0.2 0.1]
#
#                          and so on and so forth...
#
# **Lab**               Indicates a **Lab** color model, where *L* is the lightness from black to white, *a* is the lightness from green to red
#                       and *b* is the lightness from blue to yellow, as defined in the **CIELab 1976** color space.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *L*, *a* and *b* values for each color).
#
#                       The *L* channel ranges from [0,100.0], the *a* channel ranges from [-128.0,127.0] and the *b* channel ranges from [-128.0,127.0].
#
#                       Example:
#
#                          One input **Lab** color:
#                             color  --> L 100, a -50, b 50
#                             Input  --> [list 100 -50 50]
#
#                          Two input **Lab** colors:
#                             color1 --> L 100, a -50, b 50
#                             color2 --> L 57,  a 80,  b 80
#                             Input  --> [list 100 -50 50 57 80 80]
#
#                          Three input **Lab** colors:
#                             color1 --> L 100, a -50, b 50
#                             color2 --> L 57,  a 80,  b 80
#                             color3 --> L 23,  a 20,  b 12
#                             Input  --> [list 100 -50 50 57 80 80 23 20 12]
#
#                          and so on and so forth...
#
# **Luv**               Indicates a **Luv** color model, where *L* is the lightness from black to white and *u* and *v* are two parameters
#                       defined in the **CIELuv 1976** color space.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *L*, *u* and *v* values for each color).
#
#                       The *L* channel ranges from [0,100.0], the *u* channel ranges from [-134.0,220.0] and the *v* channel ranges from [-140.0,122.0].
#
#                       Examples:
#
#                          One input **Luv** color:
#                             color  --> L 100, u -50, v 50
#                             Input  --> [list 100 -50 50]
#
#                          Two input **Luv** colors:
#                             color1 --> L 100, u -50, v 50
#                             color2 --> L 100, u -50, v 50
#                             Input  --> [list 100 -50 50 57 80 80]
#
#                          Three input **Luv** colors:
#                             color1 --> L 100, u -50, v 50
#                             color2 --> L 100, u -50, v 50
#                             color3 --> L 23,  u 20,  v 12
#                             Input  --> [list 100 -50 50 57 80 80 23 20 12]
#
#                          and so on and so forth...
#
# **LCHab**             Indicates an **LCHab** color model (a cylindrical rappresentation of the **Lab** color model),
#                       where *L* is the *lightness*, *C* is the *chroma* and *Hab* is the *hue*.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *L*, *u* and *v* values for each color).
#
#                       The *L* channel ranges from [0,100.0], the *C* channel ranges from [0,181.01933598375618] and the *Hab* channel ranges
#                       from [0,360.0[, with **360.0** not included.
#
#                       Examples:
#
#                          One input **LCHab** color:
#                             color  --> L 40, C 100, Hab 80
#                             Input  --> [list 40 100 80]
#
#                          Two input **LCHab** colors:
#                             color1 --> L 40, C 100, Hab 80
#                             color2 --> L 50, C 40,  Hab 60
#                             Input  --> [list 40 100 80 50 40 60]
#
#                          Three input **LCHab** colors:
#                             color1 --> L 40, C 100, Hab 80
#                             color2 --> L 50, C 40,  Hab 60
#                             color3 --> L 80, C 140, Hab 240
#                             Input  --> [list 40 100 80 50 40 60 80 140 240]
#
#                          and so on and so forth...
#
# **LCHuv**             Indicates an **LCHuv** color model (a cylindrical rappresentation of the **Luv** color model), where *L* is the
#                       *lightness*, *C* is the *chroma* and *Huv* is the *hue*.
#                       They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#                       their channel values (in order, the *L*, *u* and *v* values for each color).
#
#                       The *L* channel ranges from [0,100.0], the *C* channel ranges from [0,260.76809620810593] and the *Huv* channel ranges
#                       from [0,360.0[, with **360.0** not included.
#
#                       Examples:
#
#                          One input **LCHab** color:
#                             color  --> L 40, C 100, Hab 80
#                             Input  --> [list 40 100 80]
#
#                          Two input **LCHab** colors:
#                             color1 --> L 40, C 100, Hab 80
#                             color2 --> L 50, C 40,  Hab 60
#                             Input  --> [list 40 100 80 50 40 60]
#
#                          Three input **LCHab** colors:
#                             color1 --> L 40, C 100, Hab 80
#                             color2 --> L 50, C 40,  Hab 60
#                             color3 --> L 80, C 140, Hab 240
#                             Input  --> [list 40 100 80 50 40 60 80 140 240]
#
#                          and so on and so forth...
package provide ::ms::color 0.1

# Create the mustang **color** package.
namespace eval ::ms::color {}

# Create an alias for the mustang **color** command.
interp alias {} color {} ::ms::color::Command

## Command
#
# Manipulate colors in several ways.
#
# Where:
#
# args   Should be the arguments of the **color** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::color::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Check if 'args' is an empty string.
    switch -- $args {
        ""  { ::ms::Error "Missing action." $caller_info }
    }

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        balance {
            # Set the default options for this action.
            set depth $::ms::colordepth
            set tempK 6500

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   -
                5   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -depth {
                                switch -- $value {
                                    8       -
                                    12      -
                                    16      { set depth $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            -tempK {
                                switch -- [string is integer -strict $value] {
                                    0   { ::ms::Error "Invalid value, '$value'." $caller_info }
                                    1   {
                                        # Truncate it if exceeds its limits [1000,27000].
                                        if { $value < 1000.0 } {
                                            set tempK 1000.0
                                        } elseif { $value > 27000.0 } {
                                            set tempK 27000.0
                                        } else {
                                            set tempK $value
                                        }
                                    }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Balance $hexadecimals $tempK $depth]
        }
        bw  {
            # Set the default options for this action.
            set depth $::ms::colordepth

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   {
                    set colors [lindex $args 0]
                    set option [lindex $args 1]
                    set value  [lindex $args 2]

                    # Check the 'option' provided.
                    switch -- $option {
                        -depth  {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Check the 'value' provided.
                    switch -- $value {
                        8       -
                        12      -
                        16      { set depth $value }
                        default { ::ms::Error "Invalid value, '$value'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::BW $hexadecimals $depth]
        }
        cold {
            # Set the default options for this action.
            set amount 1
            set depth  $::ms::colordepth

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   -
                5   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -amount {
                                set amount [string trimright $value %]
                                switch -- [string is double -strict $amount] {
                                    0   { ::ms::Error "Invalid value, '$value'." $caller_info }
                                    1   {
                                        if { $amount < 0 } {
                                            set amount 0
                                        } elseif { $amount > 100.0 } {
                                            set amount 100.0
                                        }
                                    }
                                }
                            }
                            -depth {
                                switch -- $value {
                                    8       -
                                    12      -
                                    16      { set depth $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Cold $hexadecimals $amount $depth]
        }
        complement {
            # Set the default options for this action.
            set depth $::ms::colordepth

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   {
                    set colors [lindex $args 0]
                    set option [lindex $args 1]
                    set value  [lindex $args 2]

                    # Check the 'option' provided.
                    switch -- $option {
                        -depth  {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Check the 'value' provided.
                    switch -- $value {
                        8       -
                        12      -
                        16      { set depth $value }
                        default { ::ms::Error "Invalid value, '$value'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Complement $hexadecimals $depth]
        }
        contrast {
            # Set the default options for this action.
            set depth $::ms::colordepth

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set color1 [lindex $args 0]
                    set color2 [lindex $args 1]
                }
                4   {
                    set color1 [lindex $args 0]
                    set color2 [lindex $args 1]
                    set option [lindex $args 2]
                    set value  [lindex $args 3]

                    # Check the 'option' provided.
                    switch -- $option {
                        -depth  {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Check the 'value' provided.
                    switch -- $value {
                        8       -
                        12      -
                        16      { set depth $value }
                        default { ::ms::Error "Invalid value, '$value'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'color1' provided.
            set hex1 [::ms::Check_Hex $color1 [string cat "HEX" $depth] invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid color, '$color1'." $caller_info }
            }

            # Check the 'color2' provided.
            set hex2 [::ms::Check_Hex $color2 [string cat "HEX" $depth] invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid color, '$color2'." $caller_info }
            }

            # Execute the command.
            return [::ms::color::Contrast $hex1 $hex2 $depth]
        }
        convert {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                5   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -from {
                                switch -- $value {
                                    HEX     -
                                    HEX8    { set from HEX8 }
                                    RGB     -
                                    RGB8    { set from RGB8 }
                                    HEX12   -
                                    HEX16   -
                                    RGB12   -
                                    RGB16   -
                                    rgb     -
                                    HSB     -
                                    HSI     -
                                    HSL     -
                                    HSP     -
                                    XYZ     -
                                    xyY     -
                                    Lab     -
                                    Luv     -
                                    LCHab   -
                                    LCHuv   { set from $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            -to {
                                switch -- $value {
                                    HEX     -
                                    HEX8    { set to HEX8 }
                                    RGB     -
                                    RGB8    { set to RGB8 }
                                    HEX12   -
                                    HEX16   -
                                    RGB12   -
                                    RGB16   -
                                    rgb     -
                                    HSB     -
                                    HSI     -
                                    HSL     -
                                    HSP     -
                                    XYZ     -
                                    xyY     -
                                    Lab     -
                                    Luv     -
                                    LCHab   -
                                    LCHuv   { set to $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            return [::ms::color::Convert $colors $from $to $caller_info]
        }
        dark {
            # Set the default options for this action.
            set amount 1
            set depth  $::ms::colordepth
            set via    Lab

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   -
                5   -
                7   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -amount {
                                set amount [string trimright $value %]
                                switch -- [string is double -strict $amount] {
                                    0   { ::ms::Error "Invalid value, '$value'." $caller_info }
                                    1   {
                                        if { $amount < 0 } {
                                            set amount 0
                                        } elseif { $amount > 100.0 } {
                                            set amount 100.0
                                        }
                                    }
                                }
                            }
                            -depth {
                                switch -- $value {
                                    8       -
                                    12      -
                                    16      { set depth $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            -via {
                                switch -nocase -- $via {
                                    RGB     { set via RGB   }
                                    HSL     { set via HSL   }
                                    Lab     { set via Lab   }
                                    Luv     { set via Luv   }
                                    LCHab   { set via LCHab }
                                    LCHuv   { set via LCHuv }
                                    default { ::ms::Error "Invalid value, '$via'." $caller_info }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Dark $hexadecimals $amount $via $depth]
        }
        deficiency {
            # Set the default options for this action.
            set severity 1
            set via      achromatic

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   -
                5   -
                7   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -severity {
                                set severity [string trimright $value %]
                                switch -- [string is double -strict $severity] {
                                    0   { ::ms::Error "Invalid value, '$value'." $caller_info }
                                    1   {
                                        if { $severity < 0 } {
                                            set severity 0
                                        } elseif { $severity > 100.0 } {
                                            set severity 100.0
                                        }
                                    }
                                }
                            }
                            -depth {
                                switch -- $value {
                                    8       -
                                    12      -
                                    16      { set depth $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            -via {
                                switch -nocase -- $via {
                                    achromatic    -
                                    red           -
                                    green         -
                                    blue          -
                                    protanomaly   -
                                    deuteranomaly -
                                    tritanomaly   -
                                    protanopia    -
                                    deuteranopia  -
                                    tritanopia    { set via [string tolower $value] }
                                    default       { ::ms::Error "Invalid value, '$via'." $caller_info }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Deficiency $hexadecimals $via $severity $depth]
        }
        desaturate {
            # Set the default options for this action.
            set amount 1
            set depth  $::ms::colordepth
            set via    HSB

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   -
                5   -
                7   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -amount {
                                set amount [string trimright $value %]
                                switch -- [string is double -strict $amount] {
                                    0   { ::ms::Error "Invalid value, '$value'." $caller_info }
                                    1   {
                                        if { $amount < 0 } {
                                            set amount 0
                                        } elseif { $amount > 100.0 } {
                                            set amount 100.0
                                        }
                                    }
                                }
                            }
                            -depth {
                                switch -- $value {
                                    8       -
                                    12      -
                                    16      { set depth $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            -via {
                                switch -nocase -- $via {
                                    HSB     { set via HSB }
                                    HSI     { set via HSI }
                                    HSL     { set via HSL }
                                    HSP     { set via HSP }
                                    default { ::ms::Error "Invalid value, '$via'." $caller_info }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Desaturate $hexadecimals $amount $via $depth]
        }
        family {
            # Set the default options for this action.
            set depth $::ms::colordepth

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   {
                    set colors [lindex $args 0]
                    set option [lindex $args 1]
                    set value  [lindex $args 2]

                    # Check the 'option' provided.
                    switch -- $option {
                        -depth  {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Check the 'value' provided.
                    switch -- $value {
                        8       -
                        12      -
                        16      { set depth $value }
                        default { ::ms::Error "Invalid value, '$value'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Family $hexadecimals $depth]
        }
        gray -
        grey {
            # Set the default options for this action.
            set depth $::ms::colordepth
            set via   hevc

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   -
                5   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -depth {
                                switch -- $value {
                                    8       -
                                    12      -
                                    16      { set depth $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            -via {
                                switch -nocase -- $via {
                                    average      -
                                    desaturation -
                                    hevc         -
                                    max          -
                                    min          -
                                    red          -
                                    green        -
                                    blue         { set via [string tolower $via] }
                                    default      { ::ms::Error "Invalid value, '$via'." $caller_info }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Gray $hexadecimals $via $depth]
        }
        hot {
            # Set the default options for this action.
            set amount 1
            set depth  $::ms::colordepth

            switch -- [llength $args] {
                1   { set colors $args }
                3   -
                5   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -amount {
                                set amount [string trimright $value %]
                                switch -- [string is double -strict $amount] {
                                    0   { ::ms::Error "Invalid value, '$value'." $caller_info }
                                    1   {
                                        if { $amount < 0 } {
                                            set amount 0
                                        } elseif { $amount > 100.0 } {
                                            set amount 100.0
                                        }
                                    }
                                }
                            }
                            -depth {
                                switch -- $value {
                                    8       -
                                    12      -
                                    16      { set depth $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Hot $hexadecimals $amount $depth]
        }
        inverse {
            # Set the default options for this action.
            set depth $::ms::colordepth

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   {
                    set colors [lindex $args 0]
                    set option [lindex $args 1]
                    set value  [lindex $args 2]

                    # Check the 'option' provided.
                    switch -- $option {
                        -depth  {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Check the 'value' provided.
                    switch -- $value {
                        8       -
                        12      -
                        16      { set depth $value }
                        default { ::ms::Error "Invalid value, '$value'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Inverse $hexadecimals $depth]
        }
        light {
            # Set the default options for this action.
            set amount 1
            set depth  $::ms::colordepth
            set via    Lab

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   -
                5   -
                7   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -amount {
                                set amount [string trimright $value %]
                                switch -- [string is double -strict $amount] {
                                    0   { ::ms::Error "Invalid value, '$value'." $caller_info }
                                    1   {
                                        if { $amount < 0 } {
                                            set amount 0
                                        } elseif { $amount > 100.0 } {
                                            set amount 100.0
                                        }
                                    }
                                }
                            }
                            -depth {
                                switch -- $value {
                                    8       -
                                    12      -
                                    16      { set depth $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            -via {
                                switch -nocase -- $via {
                                    RGB     { set via RGB   }
                                    HSL     { set via HSL   }
                                    Lab     { set via Lab   }
                                    Luv     { set via Luv   }
                                    LCHab   { set via LCHab }
                                    LCHuv   { set via LCHuv }
                                    default { ::ms::Error "Invalid value, '$via'." $caller_info }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            return [::ms::color::Light $hexadecimals $amount $via $depth]
        }
        list {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   {
                    set palette $args
                    set family  all
                }
                2   {
                    set palette [lindex $args 0]
                    set family  [lindex $args 1]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'palette' name provided.
            set palette_name [string tolower $palette]
            if { $palette_name ni $::ms::palette(names) } {
                ::ms::Error "Invalid palette name, '$palette'." $caller_info
            }

            # Check the 'family' name provided.
            switch -nocase -- $family {
                grey          -
                gray          { set family Gray          }
                red           { set family Red           }
                red-orange    { set family Red-Orange    }
                orange        { set family Orange        }
                orange-yellow { set family Orange-Yellow }
                yellow        { set family Yellow        }
                yellow-green  { set family Yellow-Green  }
                green         { set family Green         }
                green-cyan    { set family Green-Cyan    }
                cyan          { set family Cyan          }
                cyan-blue     { set family Cyan-Blue     }
                blue          { set family Blue          }
                blue-purple   { set family Blue-Purple   }
                purple        { set family Purple        }
                purple-red    { set family Purple-Red    }
                all           { set family all           }
                default       { ::ms::Error "Invalid family name, '$family'." $caller_info }
            }

            # Execute the command.
            return [lsort -dictionary -increasing -unique $::ms::palette($palette_name,$family,colornames)]
        }
        saturate {
            # Set the default options for this action.
            set amount 1
            set depth  $::ms::colordepth
            set via    HSB

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   -
                5   -
                7   {
                    set colors [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Check the 'args' provided.
                    foreach { option value } $args {
                        switch -- $option {
                            -amount {
                                set amount [string trimright $value %]
                                switch -- [string is double -strict $amount] {
                                    0   { ::ms::Error "Invalid value, '$value'." $caller_info }
                                    1   {
                                        if { $amount < 0 } {
                                            set amount 0
                                        } elseif { $amount > 100.0 } {
                                            set amount 100.0
                                        }
                                    }
                                }
                            }
                            -depth {
                                switch -- $value {
                                    8       -
                                    12      -
                                    16      { set depth $value }
                                    default { ::ms::Error "Invalid value, '$value'." $caller_info }
                                }
                            }
                            -via {
                                switch -nocase -- $via {
                                    HSB     { set via HSB }
                                    HSI     { set via HSI }
                                    HSL     { set via HSL }
                                    HSP     { set via HSP }
                                    default { ::ms::Error "Invalid value, '$via'." $caller_info }
                                }
                            }
                            default { ::ms::Error "Invalid option, '$option'." $caller_info }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Execute the command.
            return [::ms::color::Saturate $hexadecimals $amount $via $depth]
        }
        wcga2.0 {
            # Set the default options for this action.
            set depth $::ms::colordepth

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set color1 [lindex $args 0]
                    set color2 [lindex $args 1]
                }
                4   {
                    set color1 [lindex $args 0]
                    set color2 [lindex $args 1]
                    set option [lindex $args 2]
                    set value  [lindex $args 3]

                    # Check the 'option' provided.
                    switch -- $option {
                        -depth  {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Check the 'value' provided.
                    switch -- $value {
                        8       -
                        12      -
                        16      { set depth $value }
                        default { ::ms::Error "Invalid value, '$value'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'color1' provided.
            set hex1 [::ms::Check_Hex $color1 [string cat "HEX" $depth] invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid color, '$color1'." $caller_info }
            }

            # Check the 'color2' provided.
            set hex2 [::ms::Check_Hex $color2 [string cat "HEX" $depth] invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid color, '$color2'." $caller_info }
            }

            # Compute the contrast between the two colors provided.
            set contrast [::ms::color::Contrast $color1 $color2 $depth]

            # Check if there is enough contrast between the first color (the 'background') and
            # the second color (the 'foreground') provided, in the four WCGA 2.0 scenarios:
            #   AA1  --> The text is a paragraph with a large font (> 14 points).
            #               OK   --> for contrast >= 3.0,
            #               FAIL --> in any other cases.
            #   AA2  --> The text is a paragraph with a small font.
            #               OK   --> for contrast >= 4.5,
            #               FAIL --> in any other cases.
            #   AAA1 --> The text is a title with a large font (> 14 points).
            #               OK   --> for contrast >= 4.5,
            #               FAIL --> in any other cases.
            #   AAA2 --> The text is a title with a small font.
            #               OK   --> for contrast >= 7.0,
            #               FAIL --> in any other cases.
            if { $contrast < 3.0 } {
                return [list AA1 "FAIL" AA2 "FAIL" AAA1 "FAIL" AAA2 "FAIL"]
            } elseif { $contrast < 4.5 } {
                return [list AA1 "OK" AA2 "FAIL" AAA1 "FAIL" AAA2 "FAIL"]
            } elseif { $contrast < 7 } {
                return [list AA1 "OK" AA2 "OK" AAA1 "OK" AAA2 "FAIL"]
            } else {
                return [list AA1 "OK" AA2 "OK" AAA1 "OK" AAA2 "OK"]
            }
        }
        websafe {
            # Set the default options for this action.
            set depth $::ms::colordepth

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set colors $args }
                3   {
                    set colors [lindex $args 0]
                    set option [lindex $args 1]
                    set value  [lindex $args 2]

                    # Check the 'option' provided.
                    switch -- $option {
                        -depth  {}
                        default { ::ms::Error "Invalid option, '$option'." $caller_info }
                    }

                    # Check the 'value' provided.
                    switch -- $value {
                        8       -
                        12      -
                        16      { set depth $value }
                        default { ::ms::Error "Invalid value, '$value'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            return [::ms::color::Websafe $hexadecimals $depth]
        }
        default { ::ms::Error "Invalid action, '$action'." $caller_info }
    }
}

## Balance
#
# Compute a balanced version (by *tempK*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# tempK          Should be an integer [1000-27000] indicating the balancing temperature.
#                *tempK* must be provided in Kelvins.
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Balance { hexadecimals tempK depth } {
    # Transform the hexadecimal colors (at whichever depth provided) into RGB8 colors.
    switch -- $depth {
        8   { set channels [::HEX8_RGB8  $hexadecimals] }
        12  { set channels [::RGB12_RGB8 [::HEX12_RGB12 $hexadecimals]] }
        16  { set channels [::RGB16_RGB8 [::HEX16_RGB16 $hexadecimals]] }
    }

    # Get the RGB channels equivalent for the temperature provided.
    set tempK [expr { $tempK*0.01 }]
    if { $tempK <= 66.0 } {
        set temp_red 255
    } else {
        set temp_red [expr { 329.698727446*(pow(($tempK-60.0),-0.1332047592)) }]
    }

    if { $tempK <= 66.0 } {
        set temp_green [expr { -161.1195681661+(99.4708025861*log($tempK)) }]
    } else {
        set temp_green [expr { 288.1221695283*(pow(($tempK-60.0),-0.0755148492)) }]
    }

    if { $tempK <= 19.0 } {
        set temp_blue 0
    } elseif { $tempK < 66.0 } {
        set temp_blue [expr { -305.0447927307+(138.5177312231*log($tempK-10.0)) }]
    } else {
        set temp_blue 255
    }

    # Note:  In theory instead of '1' we should use '0' but then,
    #        when we will divide for the 'temp' channel we will have a problem.

    # Adjust the temperature RGB value if exceeds its limits [1,255].
    if { $temp_red < 1 } {
        set temp_red 1
    } elseif { $temp_red > 255 } {
        set temp_red 255
    }

    if { $temp_green < 1 } {
        set temp_green 1
    } elseif { $temp_green > 255 } {
        set temp_green 255
    }

    if { $temp_blue < 1 } {
        set temp_blue 1
    } elseif { $temp_blue > 255 } {
        set temp_blue 255
    }

    # Execute the command.
    foreach { red green blue } $channels {
        # | 255.0/temp_red  0                 0               |   | red   |   | balanced_red   |
        # | 0               255.0/temp_green  0               | * | green | = | balanced_green |
        # | 0               0                 255.0/temp_blue |   | blue  |   | balanced_blue  |

        set balanced_red   [expr { round(($red*255.0)/$temp_red)     }]
        set balanced_green [expr { round(($green*255.0)/$temp_green) }]
        set balanced_blue  [expr { round(($blue*255.0)/$temp_blue)   }]

        # Adjust the balanced RGB channels if they exceeds their limits [0,255].
        if { $balanced_red > 255 } {
            set balanced_red 255
        }

        if { $balanced_green > 255 } {
            set balanced_green 255
        }

        if { $balanced_blue > 255 } {
            set balanced_blue 255
        }

        lappend results $balanced_red $balanced_green $balanced_blue
    }

    # Transform the balanced RGB8 channels back into hexadecimal colors
    # with the same depth as the colors provided.
    switch -- $depth {
        8   { return [::RGB8_HEX8   $results] }
        12  { return [::RGB12_HEX12 [::RGB8_RGB12 $results]] }
        16  { return [::RGB16_HEX16 [::RGB8_RGB16 $results]] }
    }
}

## BW
#
# Compute, for each color provided, which color between **black** and **white** has more contrast with it.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list in which each index element is the color **black** or **white**, depending on which one of
# these two colors has the greatest contrast with the same indexed element provided.
proc ::ms::color::BW { hexadecimals depth } {
    # Transform the hexadecimal colors provided into rgb colors [0,1.0].
    switch -- $depth {
        8   { set channels [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]] }
        12  { set channels [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]] }
        16  { set channels [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]] }
    }

    # Execute the command.
    foreach { r g b } $channels {
        # Trasform the *non-linear* rgb value into a *linear* rgb one.
        set r_linear [::companding $r inverse]
        set g_linear [::companding $g inverse]
        set b_linear [::companding $b inverse]

        # Compute the luma of the rgb *linear* color.
        set a1   [expr { $::ms::data(colorspace,$::ms::colorspace,Yr)*$r_linear }]
        set a2   [expr { $::ms::data(colorspace,$::ms::colorspace,Yg)*$g_linear }]
        set a3   [expr { $::ms::data(colorspace,$::ms::colorspace,Yb)*$b_linear }]
        set luma [expr { $a1+$a2+$a3 }]

        # Confront the rgb *linear* color contrast values (against 'black' and 'white').
        if { [expr { ($luma+0.05)*20.0 }] > [expr { 1.05/($luma+0.05) }] } {
            lappend results black
        } else {
            lappend results white
        }
    }

    return $results
}

## Cold
#
# Compute a colder version (by *amount*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of heat to subtract [0,100].
#                This amount is evaluated as a percentage.
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Cold { hexadecimals amount depth } {
    # Check the color 'depth' provided.
    switch -- $depth {
        8   {
            # Set the maximum value for every channel.
            set upper_limit 255

            # Transform the amount from [0,100] to [0,255].
            set amount [expr { round($amount*2.55) }]

            # Transform the hexadecimal colors provided into RGB8 colors.
            set channels [::HEX8_RGB8 $hexadecimals]
        }
        12  {
            # Set the maximum value for every channel.
            set upper_limit 4095

            # Transform the amount from [0,100] to [0,4095].
            set amount [expr { round($amount*40.95) }]

            # Transform the hexadecimal colors provided into RGB12 colors.
            set channels [::HEX12_RGB12 $hexadecimals]
        }
        16  {
            # Set the maximum value for every channel.
            set upper_limit 65535

            # Transform the amount from [0,100] to [0,65535].
            set amount [expr { round($amount*655.35) }]

            # Transform the hexadecimal colors provided into RGB16 colors.
            set channels [::HEX16_RGB16 $hexadecimals]
        }
    }

    # Execute the command.
    foreach { red green blue } $channels {
        set red  [expr { $red-$amount  }]
        set blue [expr { $blue+$amount }]

        # Check that the 'red' channel doesn't exceeds its lower limit.
        if { $red < 0 } {
            set red 0
        }

        # Check that the 'blue' channel doesn't exceeds its upper limit.
        if { $blue > $upper_limit } {
            set blue $upper_limit
        }

        lappend results $red $green $blue
    }

    # Transform the resulting RGB colors back into hexadecimal colors
    # with the same color depth of the hexadecimal colors provided.
    switch -- $depth {
        8   { return [::RGB8_HEX8   $results] }
        12  { return [::RGB12_HEX12 $results] }
        16  { return [::RGB16_HEX16 $results] }
    }
}

## Complement
#
# Compute the complement colors of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Complement { hexadecimals depth } {
    # Transform the hexadecimal colors provided into RGB colors.
    switch -- $depth {
        8   { set channels [::HEX8_RGB8   $hexadecimals] }
        12  { set channels [::HEX12_RGB12 $hexadecimals] }
        16  { set channels [::HEX16_RGB16 $hexadecimals] }
    }

    # Execute the command.
    foreach { red green blue } $channels {
        set min [expr { min($red,$green,$blue) }]
        set max [expr { max($red,$green,$blue) }]
        set sum [expr { $min+$max }]

        set red   [expr { $sum-$red   }]
        set green [expr { $sum-$green }]
        set blue  [expr { $sum-$blue  }]

        lappend results $red $green $blue
    }

    # Transform the resulting RGB colors back into hexadecimal colors
    # with the same color depth of the hexadecimal colors provided.
    switch -- $depth {
        8   { return [::RGB8_HEX8   $results] }
        12  { return [::RGB12_HEX12 $results] }
        16  { return [::RGB16_HEX16 $results] }
    }
}

## Contrast
#
# Compute the contrast value [0,21] between the two colors provided.
#
# Where:
#
# hex1    Should be an hexadecimal color expressed in its longform.
#
# hex2    Should be an hexadecimal color expressed in its longform.
#
# depth   Should be an integer specifing the color depth in which the colors provided are defined.
#         Allowed values are **8**, **12** or **16**.
#
# Returns the contrast value [0,21].
proc ::ms::color::Contrast { hex1 hex2 depth } {
    # Transform the hexadecimal colors into rgb colors [0,1.0].
    switch -- $depth {
        8   {
            set rgb1 [::RGB8_rgb  [::HEX8_RGB8   $hex1]]
            set rgb2 [::RGB8_rgb  [::HEX8_RGB8   $hex2]]
        }
        12  {
            set rgb1 [::RGB12_rgb [::HEX12_RGB12 $hex1]]
            set rgb2 [::RGB12_rgb [::HEX12_RGB12 $hex2]]
        }
        16  {
            set rgb1 [::RGB16_rgb [::HEX16_RGB16 $hex1]]
            set rgb2 [::RGB16_rgb [::HEX16_RGB16 $hex2]]
        }
    }

    # Trasform the *non-linear* rgb1 values into a *linear* rgb1 ones.
    foreach { r1 g1 b1 } $rgb1 {
        set r1_linear [::companding $r1 inverse]
        set g1_linear [::companding $g1 inverse]
        set b1_linear [::companding $b1 inverse]
    }

    # Trasform the *non-linear* rgb2 values into a *linear* rgb2 ones.
    foreach { r2 g2 b2 } $rgb2 {
        set r2_linear [::companding $r2 inverse]
        set g2_linear [::companding $g2 inverse]
        set b2_linear [::companding $b2 inverse]
    }

    # Compute the luma of the first color.
    set a1    [expr { $::ms::data(colorspace,$::ms::colorspace,Yr)*$r1_linear }]
    set a2    [expr { $::ms::data(colorspace,$::ms::colorspace,Yg)*$g1_linear }]
    set a3    [expr { $::ms::data(colorspace,$::ms::colorspace,Yb)*$b1_linear }]
    set luma1 [expr { $a1+$a2+$a3 }]

    # Compute the luma of the second color.
    set b1    [expr { $::ms::data(colorspace,$::ms::colorspace,Yr)*$r2_linear }]
    set b2    [expr { $::ms::data(colorspace,$::ms::colorspace,Yg)*$g2_linear }]
    set b3    [expr { $::ms::data(colorspace,$::ms::colorspace,Yb)*$b2_linear }]
    set luma2 [expr { $b1+$b2+$b3 }]

    # Compute the contrast value.
    if { $luma1 > $luma2 } {
        return [expr { ($luma1+0.05)/($luma2+0.05) }]
    } else {
        return [expr { ($luma2+0.05)/($luma1+0.05) }]
    }
}

## Convert
#
# Covert the colors provided from one colormodel to another.
#
# Where:
#
# colors        Should be a list containing all the colors to convert.
#
# from          Should be a string indicating the colormodel format of the **colors** provided.
#               Allowed colormodels are every colormodel known by mustang.
#               See **MUSTANG SUPPORTED COLORMODELS** for more info.
#
# to            Should be a string indicating the colormodel format of the resulting colors.
#               Allowed colormodels are every colormodel known by mustang.
#               See **MUSTANG SUPPORTED COLORMODELS** for more info.
#
# caller_info   Optional, should be the information upon the location of the command that generated the error.
#
#               If not provided, defaults to an empty string, meaning it will not provided any information
#               on the command that generated the error.
#
# Returns a list containing the resulting colors expressed in the **to** colormodel format.
proc ::ms::color::Convert { colors from to { caller_info "" } } {
    # Check the 'from' option.
    switch -- $from {
        HEX8 {
            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color HEX8 invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return $hexadecimals }
                HEX12 { return [::HEX8_HEX12 $hexadecimals] }
                HEX16 { return [::HEX8_HEX16 $hexadecimals] }
                RGB8  { return [::HEX8_RGB8  $hexadecimals] }
                RGB12 { return [::RGB8_RGB12 [::HEX8_RGB8 $hexadecimals]] }
                RGB16 { return [::RGB8_RGB16 [::HEX8_RGB8 $hexadecimals]] }
                rgb   { return [::RGB8_rgb   [::HEX8_RGB8 $hexadecimals]] }
                HSB   { return [::rgb_HSB    [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]] }
                HSI   { return [::rgb_HSI    [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]] }
                HSL   { return [::rgb_HSL    [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]] }
                HSP   { return [::rgb_HSP    [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]] }
                HWB   { return [::rgb_HWB    [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]] }
                XYZ   { return [::rgb_XYZ    [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]] }
                xyY   { return [::XYZ_xyY    [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]]] }
                Lab   { return [::XYZ_Lab    [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]]] }
                Luv   { return [::XYZ_Luv    [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]]] }
                LCHab { return [::Lab_LCHab  [::XYZ_Lab   [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]]]] }
                LCHuv { return [::Luv_LCHuv  [::XYZ_Luv   [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $hexadecimals]]]]] }
            }
        }
        HEX12 {
            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color HEX12 invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::HEX12_HEX8  $hexadecimals] }
                HEX12 { return $hexadecimals }
                HEX16 { return [::HEX12_HEX16 $hexadecimals] }
                RGB8  { return [::RGB12_RGB8  [::HEX12_RGB12 $hexadecimals]] }
                RGB12 { return [::HEX12_RGB12 $hexadecimals] }
                RGB16 { return [::RGB12_RGB16 [::HEX12_RGB12 $hexadecimals]] }
                rgb   { return [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]] }
                HSB   { return [::rgb_HSB     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]] }
                HSI   { return [::rgb_HSI     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]] }
                HSL   { return [::rgb_HSL     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]] }
                HSP   { return [::rgb_HSP     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]] }
                HWB   { return [::rgb_HWB     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]] }
                XYZ   { return [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $hexadecimals]]]]] }
            }
        }
        HEX16 {
            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color HEX16 invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::HEX16_HEX8  $hexadecimals] }
                HEX12 { return [::HEX16_HEX12 $hexadecimals] }
                HEX16 { return $hexadecimals }
                RGB8  { return [::RGB16_RGB8  [::HEX16_RGB16 $hexadecimals]] }
                RGB12 { return [::RGB16_RGB12 [::HEX16_RGB16 $hexadecimals]] }
                RGB16 { return [::HEX16_RGB16 $hexadecimals] }
                rgb   { return [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]] }
                HSB   { return [::rgb_HSB     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]] }
                HSI   { return [::rgb_HSI     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]] }
                HSL   { return [::rgb_HSL     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]] }
                HSP   { return [::rgb_HSP     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]] }
                HWB   { return [::rgb_HWB     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]] }
                XYZ   { return [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $hexadecimals]]]]] }
            }
        }
        RGB8 {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach channel $colors {
                        switch -- [string is integer -strict $channel] {
                            0       { ::ms::Error "Invalid color channel, '$channel'." $caller_info }
                            default {
                                if { $channel < 0 } {
                                    set channel 0
                                } else if { $channel > 255 } {
                                    set channel 255
                                }

                                lappend RGB8 $channel
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   $RGB8] }
                HEX12 { return [::RGB12_HEX12 [::RGB8_RGB12 $RGB8]] }
                HEX16 { return [::RGB16_HEX16 [::RGB8_RGB16 $RGB8]] }
                RGB8  { return $RGB8 }
                RGB12 { return [::RGB8_RGB12  $RGB8] }
                RGB16 { return [::RGB8_RGB16  $RGB8] }
                rgb   { return [::RGB8_rgb    $RGB8] }
                HSB   { return [::rgb_HSB     [::RGB8_rgb   $RGB8]] }
                HSI   { return [::rgb_HSI     [::RGB8_rgb   $RGB8]] }
                HSL   { return [::rgb_HSL     [::RGB8_rgb   $RGB8]] }
                HSP   { return [::rgb_HSP     [::RGB8_rgb   $RGB8]] }
                HWB   { return [::rgb_HWB     [::RGB8_rgb   $RGB8]] }
                XYZ   { return [::rgb_XYZ     [::RGB8_rgb   $RGB8]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ    [::RGB8_rgb $RGB8]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ    [::RGB8_rgb $RGB8]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ    [::RGB8_rgb $RGB8]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab    [::rgb_XYZ  [::RGB8_rgb $RGB8]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv    [::rgb_XYZ  [::RGB8_rgb $RGB8]]]] }
            }
        }
        RGB12 {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach channel $colors {
                        switch -- [string is integer -strict $channel] {
                            0       { ::ms::Error "Invalid color channel, '$channel'." $caller_info }
                            default {
                                if { $channel < 0 } {
                                    set channel 0
                                } else if { $channel > 4095 } {
                                    set channel 4095
                                }

                                lappend RGB12 $channel
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::RGB12_RGB8  $RGB12]] }
                HEX12 { return [::RGB12_HEX12 $RGB12] }
                HEX16 { return [::RGB16_HEX16 [::RGB12_RGB16 $RGB12]] }
                RGB8  { return [::RGB12_RGB8  $RGB12] }
                RGB12 { return $RGB12 }
                RGB16 { return [::RGB12_RGB16 $RGB12] }
                rgb   { return [::RGB12_rgb   $RGB12] }
                HSB   { return [::rgb_HSB     [::RGB12_rgb   $RGB12]] }
                HSI   { return [::rgb_HSI     [::RGB12_rgb   $RGB12]] }
                HSL   { return [::rgb_HSL     [::RGB12_rgb   $RGB12]] }
                HSP   { return [::rgb_HSP     [::RGB12_rgb   $RGB12]] }
                HWB   { return [::rgb_HWB     [::RGB12_rgb   $RGB12]] }
                XYZ   { return [::rgb_XYZ     [::RGB12_rgb   $RGB12]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ     [::RGB12_rgb $RGB12]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ     [::RGB12_rgb $RGB12]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ     [::RGB12_rgb $RGB12]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab     [::rgb_XYZ   [::RGB12_rgb $RGB12]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv     [::rgb_XYZ   [::RGB12_rgb $RGB12]]]] }
            }
        }
        RGB16 {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach channel $colors {
                        switch -- [string is integer -strict $channel] {
                            0       { ::ms::Error "Invalid color channel, '$channel'." $caller_info }
                            default {
                                if { $channel < 0 } {
                                    set channel 0
                                } else if { $channel > 65535 } {
                                    set channel 65535
                                }

                                lappend RGB16 $channel
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::RGB16_RGB8  $RGB16]] }
                HEX12 { return [::RGB12_HEX12 [::RGB16_RGB12 $RGB16]] }
                HEX16 { return [::RGB16_HEX16 $RGB16] }
                RGB8  { return [::RGB16_RGB8  $RGB16] }
                RGB12 { return [::RGB16_RGB12 $RGB16] }
                RGB16 { return $RGB16 }
                rgb   { return [::RGB16_rgb   $RGB16] }
                HSB   { return [::rgb_HSB     [::RGB16_rgb   $RGB16]] }
                HSI   { return [::rgb_HSI     [::RGB16_rgb   $RGB16]] }
                HSL   { return [::rgb_HSL     [::RGB16_rgb   $RGB16]] }
                HSP   { return [::rgb_HSP     [::RGB16_rgb   $RGB16]] }
                HWB   { return [::rgb_HWB     [::RGB16_rgb   $RGB16]] }
                XYZ   { return [::rgb_XYZ     [::RGB16_rgb   $RGB16]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ     [::RGB16_rgb $RGB16]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ     [::RGB16_rgb $RGB16]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ     [::RGB16_rgb $RGB16]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab     [::rgb_XYZ   [::RGB16_rgb $RGB16]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv     [::rgb_XYZ   [::RGB16_rgb $RGB16]]]] }
            }
        }
        rgb {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach channel $colors {
                        switch -- [string is integer -strict $channel] {
                            0       { ::ms::Error "Invalid color channel, '$channel'." $caller_info }
                            default {
                                if { $channel < 0 } {
                                    set channel 0
                                } else if { $channel > 1.0 } {
                                    set channel 1.0
                                }

                                lappend rgb $channel
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  $rgb]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 $rgb]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 $rgb]] }
                RGB8  { return [::rgb_RGB8    $rgb] }
                RGB12 { return [::rgb_RGB12   $rgb] }
                RGB16 { return [::rgb_RGB16   $rgb] }
                rgb   { return $rgb }
                HSB   { return [::rgb_HSB     $rgb] }
                HSI   { return [::rgb_HSI     $rgb] }
                HSL   { return [::rgb_HSL     $rgb] }
                HSP   { return [::rgb_HSP     $rgb] }
                HWB   { return [::rgb_HWB     $rgb] }
                XYZ   { return [::rgb_XYZ     $rgb] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   $rgb]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   $rgb]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   $rgb]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ $rgb]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ $rgb]]] }
            }
        }
        HSB {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { hue saturation brightness } $colors {
                        # Check the 'hue'.
                        switch -- [string is double -strict $hue] {
                            0       { ::ms::Error "Invalid color hue, '$hue'." $caller_info }
                            default {
                                if { ($hue < 0) || ($hue >= 360.0) } {
                                    set hue 0
                                }
                            }
                        }

                        # Check the 'saturation'.
                        switch -- [string is double -strict $saturation] {
                            0       { ::ms::Error "Invalid color saturation, '$saturation'." $caller_info }
                            default {
                                if { $saturation < 0 } {
                                    set saturation 0
                                } elseif { $saturation > 100.0 } {
                                    set saturation 100.0
                                }
                            }
                        }

                        # Check the 'brightness'.
                        switch -- [string is double -strict $brightness] {
                            0       { ::ms::Error "Invalid color brightness, '$brightness'." $caller_info }
                            default {
                                if { $brightness < 0 } {
                                    set brightness 0
                                } elseif { $brightness > 100.0 } {
                                    set brightness 100.0
                                }
                            }
                        }

                        lappend HSB $hue $saturation $brightness
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSB_rgb $HSB]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSB_rgb $HSB]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSB_rgb $HSB]]] }
                RGB8  { return [::rgb_RGB8    [::HSB_rgb   $HSB]] }
                RGB12 { return [::rgb_RGB12   [::HSB_rgb   $HSB]] }
                RGB16 { return [::rgb_RGB16   [::HSB_rgb   $HSB]] }
                rgb   { return [::HSB_rgb     $HSB] }
                HSB   { return $HSB }
                HSI   { return [::HSB_HSI     $HSB] }
                HSL   { return [::HSB_HSL     $HSB] }
                HSP   { return [::HSB_HSP     $HSB] }
                HWB   { return [::HSB_HWB     $HSB] }
                XYZ   { return [::rgb_XYZ     [::HSB_rgb   $HSB]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HSB_rgb $HSB]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HSB_rgb $HSB]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HSB_rgb $HSB]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HSB_rgb $HSB]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HSB_rgb $HSB]]]] }
            }
        }
        HSI {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { hue saturation intensity } $colors {
                        # Check the 'hue'.
                        switch -- [string is double -strict $hue] {
                            0       { ::ms::Error "Invalid color hue, '$hue'." $caller_info }
                            default {
                                if { ($hue < 0) || ($hue >= 360.0) } {
                                    set hue 0
                                }
                            }
                        }

                        # Check the 'saturation'.
                        switch -- [string is double -strict $saturation] {
                            0       { ::ms::Error "Invalid color saturation, '$saturation'." $caller_info }
                            default {
                                if { $saturation < 0 } {
                                    set saturation 0
                                } elseif { $saturation > 100.0 } {
                                    set saturation 100.0
                                }
                            }
                        }

                        # Check the 'intensity'.
                        switch -- [string is double -strict $intensity] {
                            0       { ::ms::Error "Invalid color intensity, '$intensity'." $caller_info }
                            default {
                                if { $intensity < 0 } {
                                    set intensity 0
                                } elseif { $intensity > 100.0 } {
                                    set intensity 100.0
                                }
                            }
                        }

                        lappend HSI $hue $saturation $intensity
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSI_rgb $HSI]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSI_rgb $HSI]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSI_rgb $HSI]]] }
                RGB8  { return [::rgb_RGB8    [::HSI_rgb   $HSI]] }
                RGB12 { return [::rgb_RGB12   [::HSI_rgb   $HSI]] }
                RGB16 { return [::rgb_RGB16   [::HSI_rgb   $HSI]] }
                rgb   { return [::HSI_rgb     $HSI] }
                HSB   { return [::HSI_HSB     $HSI] }
                HSI   { return $HSI }
                HSL   { return [::HSI_HSL     $HSI] }
                HSP   { return [::HSI_HSP     $HSI] }
                HWB   { return [::HSI_HWB     $HSI] }
                XYZ   { return [::rgb_XYZ     [::HSI_rgb   $HSI]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HSI_rgb $HSI]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HSI_rgb $HSI]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HSI_rgb $HSI]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HSI_rgb $HSI]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HSI_rgb $HSI]]]] }
            }
        }
        HSL {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { hue saturation lightness } $colors {
                        # Check the 'hue'.
                        switch -- [string is double -strict $hue] {
                            0       { ::ms::Error "Invalid color hue, '$hue'." $caller_info }
                            default {
                                if { ($hue < 0) || ($hue >= 360.0) } {
                                    set hue 0
                                }
                            }
                        }

                        # Check the 'saturation'.
                        switch -- [string is double -strict $saturation] {
                            0       { ::ms::Error "Invalid color saturation, '$saturation'." $caller_info }
                            default {
                                if { $saturation < 0 } {
                                    set saturation 0
                                } elseif { $saturation > 100.0 } {
                                    set saturation 100.0
                                }
                            }
                        }

                        # Check the 'lightness'.
                        switch -- [string is double -strict $lightness] {
                            0       { ::ms::Error "Invalid color lightness, '$lightness'." $caller_info }
                            default {
                                if { $lightness < 0 } {
                                    set lightness 0
                                } elseif { $lightness > 100.0 } {
                                    set lightness 100.0
                                }
                            }
                        }

                        lappend HSL $hue $saturation $lightness
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $HSL]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $HSL]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $HSL]]] }
                RGB8  { return [::rgb_RGB8    [::HSL_rgb   $HSL]] }
                RGB12 { return [::rgb_RGB12   [::HSL_rgb   $HSL]] }
                RGB16 { return [::rgb_RGB16   [::HSL_rgb   $HSL]] }
                rgb   { return [::HSL_rgb     $HSL] }
                HSB   { return [::HSL_HSB     $HSL] }
                HSI   { return [::HSL_HSI     $HSL] }
                HSL   { return $HSL }
                HSP   { return [::HSL_HSP     $HSL] }
                HWB   { return [::HSL_HWB     $HSL] }
                XYZ   { return [::rgb_XYZ     [::HSL_rgb   $HSL]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HSL_rgb $HSL]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HSL_rgb $HSL]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HSL_rgb $HSL]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HSL_rgb $HSL]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HSL_rgb $HSL]]]] }
            }
        }
        HSP {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { hue saturation perceived_brightness } $colors {
                        # Check the 'hue'.
                        switch -- [string is double -strict $hue] {
                            0       { ::ms::Error "Invalid color hue, '$hue'." $caller_info }
                            default {
                                if { ($hue < 0) || ($hue >= 360.0) } {
                                    set hue 0
                                }
                            }
                        }

                        # Check the 'saturation'.
                        switch -- [string is double -strict $saturation] {
                            0       { ::ms::Error "Invalid color saturation, '$saturation'." $caller_info }
                            default {
                                if { $saturation < 0 } {
                                    set saturation 0
                                } elseif { $saturation > 100.0 } {
                                    set saturation 100.0
                                }
                            }
                        }

                        # Check the 'perceived_brightness'.
                        switch -- [string is double -strict $perceived_brightness] {
                            0       { ::ms::Error "Invalid color perceived_brightness, '$perceived_brightness'." $caller_info }
                            default {
                                if { $perceived_brightness < 0 } {
                                    set perceived_brightness 0
                                } elseif { $perceived_brightness > 100.0 } {
                                    set perceived_brightness 100.0
                                }
                            }
                        }

                        lappend HSP $hue $saturation $perceived_brightness
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSP_rgb $HSP]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSP_rgb $HSP]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSP_rgb $HSP]]] }
                RGB8  { return [::rgb_RGB8    [::HSP_rgb   $HSP]] }
                RGB12 { return [::rgb_RGB12   [::HSP_rgb   $HSP]] }
                RGB16 { return [::rgb_RGB16   [::HSP_rgb   $HSP]] }
                rgb   { return [::HSP_rgb     $HSP] }
                HSB   { return [::HSP_HSB     $HSP] }
                HSI   { return [::HSP_HSI     $HSP] }
                HSL   { return [::HSP_HSL     $HSP] }
                HSP   { return $HSP }
                HWB   { return [::HSP_HWB     $HSP] }
                XYZ   { return [::rgb_XYZ     [::HSP_rgb   $HSP]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HSP_rgb $HSP]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HSP_rgb $HSP]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HSP_rgb $HSP]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HSP_rgb $HSP]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HSP_rgb $HSP]]]] }
            }
        }
        HWB {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { hue whiteness blackness } $colors {
                        # Check the 'hue'.
                        switch -- [string is double -strict $hue] {
                            0       { ::ms::Error "Invalid color hue, '$hue'." $caller_info }
                            default {
                                if { ($hue < 0) || ($hue >= 360.0) } {
                                    set hue 0
                                }
                            }
                        }

                        # Check the 'whiteness'.
                        switch -- [string is double -strict $whiteness] {
                            0       { ::ms::Error "Invalid color whiteness, '$whiteness'." $caller_info }
                            default {
                                if { $whiteness < 0 } {
                                    set whiteness 0
                                } elseif { $whiteness > 100.0 } {
                                    set whiteness 100.0
                                }
                            }
                        }

                        # Check the 'blackness'.
                        switch -- [string is double -strict $blackness] {
                            0       { ::ms::Error "Invalid color blackness, '$blackness'." $caller_info }
                            default {
                                if { $blackness < 0 } {
                                    set blackness 0
                                } elseif { $blackness > 100.0 } {
                                    set blackness 100.0
                                }
                            }
                        }

                        lappend HWB $hue $whiteness $blackness
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HWB_rgb $HWB]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HWB_rgb $HWB]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HWB_rgb $HWB]]] }
                RGB8  { return [::rgb_RGB8    [::HWB_rgb   $HWB]] }
                RGB12 { return [::rgb_RGB12   [::HWB_rgb   $HWB]] }
                RGB16 { return [::rgb_RGB16   [::HWB_rgb   $HWB]] }
                rgb   { return [::HWB_rgb     $HWB] }
                HSB   { return [::HWB_HSB     $HWB] }
                HSI   { return [::HWB_HSI     $HWB] }
                HSL   { return [::HWB_HSL     $HWB] }
                HSP   { return [::HWB_HSP     $HWB] }
                HWB   { return $HWB }
                XYZ   { return [::rgb_XYZ     [::HWB_rgb   $HWB]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HWB_rgb $HWB]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HWB_rgb $HWB]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HWB_rgb $HWB]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HWB_rgb $HWB]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HWB_rgb $HWB]]]] }
            }
        }
        XYZ {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { X Y Z } $colors {
                        # Check the 'X'.
                        switch -- [string is double -strict $X] {
                            0       { ::ms::Error "Invalid color channel, '$X'." $caller_info }
                            default {
                                if { $X < 0 } {
                                    set X 0
                                } elseif { $X > 1.999969482421875 } {
                                    set X 1.999969482421875
                                }
                            }
                        }

                        # Check the 'Y'.
                        switch -- [string is double -strict $Y] {
                            0       { ::ms::Error "Invalid color channel, '$Y'." $caller_info }
                            default {
                                if { $Y < 0 } {
                                    set Y 0
                                } elseif { $Y > 1.0 } {
                                    set Y 1.0
                                }
                            }
                        }

                        # Check the 'Z'.
                        switch -- [string is double -strict $Z] {
                            0       { ::ms::Error "Invalid color channel, '$Z'." $caller_info }
                            default {
                                if { $Z < 0 } {
                                    set Z 0
                                } elseif { $Z > 1.999969482421875 } {
                                    set Z 1.999969482421875
                                }
                            }
                        }

                        lappend XYZ $X $Y $Z
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb $XYZ]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb $XYZ]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb $XYZ]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   $XYZ]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   $XYZ]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   $XYZ]] }
                rgb   { return [::XYZ_rgb     $XYZ] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   $XYZ]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   $XYZ]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   $XYZ]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   $XYZ]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   $XYZ]] }
                XYZ   { return $XYZ }
                xyY   { return [::XYZ_xyY     $XYZ] }
                Lab   { return [::XYZ_Lab     $XYZ] }
                Luv   { return [::XYZ_Luv     $XYZ] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   $XYZ]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   $XYZ]] }
            }
        }
        xyY {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { x y Y } $colors {
                        # Check the 'x'.
                        switch -- [string is double -strict $x] {
                            0       { ::ms::Error "Invalid color channel, '$x'." $caller_info }
                            default {
                                if { $x < 0 } {
                                    set x 0
                                } elseif { $x > 1.0 } {
                                    set x 1.0
                                }
                            }
                        }

                        # Check the 'y'.
                        switch -- [string is double -strict $y] {
                            0       { ::ms::Error "Invalid color channel, '$y'." $caller_info }
                            default {
                                if { $y < 0 } {
                                    set y 0
                                } elseif { $y > 1.0 } {
                                    set y 1.0
                                }
                            }
                        }

                        # Check the 'Y'.
                        switch -- [string is double -strict $Y] {
                            0       { ::ms::Error "Invalid color channel, '$Y'." $caller_info }
                            default {
                                if { $Y < 0 } {
                                    set Y 0
                                } elseif { $Y > 1.0 } {
                                    set Y 1.0
                                }
                            }
                        }

                        lappend xyY $x $y $Y
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::xyY_XYZ $xyY]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::xyY_XYZ $xyY]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::xyY_XYZ $xyY]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::xyY_XYZ $xyY]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::xyY_XYZ $xyY]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::xyY_XYZ $xyY]]] }
                rgb   { return [::XYZ_rgb     [::xyY_XYZ   $xyY]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::xyY_XYZ $xyY]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::xyY_XYZ $xyY]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::xyY_XYZ $xyY]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::xyY_XYZ $xyY]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::xyY_XYZ $xyY]]] }
                XYZ   { return [::xyY_XYZ     $xyY] }
                xyY   { return $xyY }
                Lab   { return [::XYZ_Lab     [::xyY_XYZ   $xyY]] }
                Luv   { return [::XYZ_Luv     [::xyY_XYZ   $xyY]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::xyY_XYZ $xyY]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::xyY_XYZ $xyY]]] }
            }
        }
        Lab {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { L a b } $colors {
                        # Check the 'L'.
                        switch -- [string is double -strict $L] {
                            0       { ::ms::Error "Invalid color channel, '$L'." $caller_info }
                            default {
                                if { $L < 0 } {
                                    set L 0
                                } elseif { $L > 1.0 } {
                                    set L 1.0
                                }
                            }
                        }

                        # Check the 'a'.
                        switch -- [string is double -strict $a] {
                            0       { ::ms::Error "Invalid color channel, '$a'." $caller_info }
                            default {
                                if { $a < -128.0 } {
                                    set a -128.0
                                } elseif { $a > 127.0 } {
                                    set a 127.0
                                }
                            }
                        }

                        # Check the 'b'.
                        switch -- [string is double -strict $b] {
                            0       { ::ms::Error "Invalid color channel, '$b'." $caller_info }
                            default {
                                if { $b < -128.0 } {
                                    set b -128.0
                                } elseif { $b > 127.0 } {
                                    set b 127.0
                                }
                            }
                        }

                        lappend Lab $L $a $b
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ $Lab]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ $Lab]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ $Lab]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::Lab_XYZ $Lab]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::Lab_XYZ $Lab]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::Lab_XYZ $Lab]]] }
                rgb   { return [::XYZ_rgb     [::Lab_XYZ   $Lab]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::Lab_XYZ $Lab]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::Lab_XYZ $Lab]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::Lab_XYZ $Lab]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::Lab_XYZ $Lab]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::Lab_XYZ $Lab]]] }
                XYZ   { return [::XYZ_Lab     $Lab] }
                xyY   { return [::XYZ_xyY     [::Lab_XYZ   $Lab]] }
                Lab   { return $Lab }
                Luv   { return [::XYZ_Luv     [::Lab_XYZ   $Lab]] }
                LCHab { return [::Lab_LCHab   $Lab] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::Lab_XYZ $Lab]]] }
            }
        }
        Luv {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { L u v } $colors {
                        # Check the 'L'.
                        switch -- [string is double -strict $L] {
                            0       { ::ms::Error "Invalid color channel, '$L'." $caller_info }
                            default {
                                if { $L < 0 } {
                                    set L 0
                                } elseif { $L > 1.0 } {
                                    set L 1.0
                                }
                            }
                        }

                        # Check the 'u'.
                        switch -- [string is double -strict $u] {
                            0       { ::ms::Error "Invalid color channel, '$u'." $caller_info }
                            default {
                                if { $u < -134.0 } {
                                    set u -134.0
                                } elseif { $u > 220.0 } {
                                    set u 220.0
                                }
                            }
                        }

                        # Check the 'v'.
                        switch -- [string is double -strict $v] {
                            0       { ::ms::Error "Invalid color channel, '$v'." $caller_info }
                            default {
                                if { $v < -140.0 } {
                                    set v -140.0
                                } elseif { $v > 122.0 } {
                                    set v 122.0
                                }
                            }
                        }

                        lappend Luv $L $u $v
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Luv_XYZ $Luv]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Luv_XYZ $Luv]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Luv_XYZ $Luv]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::Luv_XYZ $Luv]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::Luv_XYZ $Luv]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::Luv_XYZ $Luv]]] }
                rgb   { return [::XYZ_rgb     [::Luv_XYZ   $Luv]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::Luv_XYZ $Luv]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::Luv_XYZ $Luv]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::Luv_XYZ $Luv]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::Luv_XYZ $Luv]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::Luv_XYZ $Luv]]] }
                XYZ   { return [::XYZ_Luv     $Luv] }
                xyY   { return [::XYZ_xyY     [::Luv_XYZ   $Luv]] }
                Lab   { return [::XYZ_Lab     [::Luv_XYZ   $Luv]] }
                Luv   { return $Luv }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::Luv_XYZ $Luv]]] }
                LCHuv { return [::Luv_LCHuv   $Luv] }
            }
        }
        LCHab {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { L C Hab } $colors {
                        # Check the 'L'.
                        switch -- [string is double -strict $L] {
                            0       { ::ms::Error "Invalid color channel, '$L'." $caller_info }
                            default {
                                if { $L < 0 } {
                                    set L 0
                                } elseif { $L > 1.0 } {
                                    set L 1.0
                                }
                            }
                        }

                        # Check the 'C'.
                        switch -- [string is double -strict $C] {
                            0       { ::ms::Error "Invalid color channel, '$C'." $caller_info }
                            default {
                                if { $C < 0 } {
                                    set C 0
                                } elseif { $C > 100.0 } {
                                    set C 100.0
                                }
                            }
                        }

                        # Check the 'Hab'.
                        switch -- [string is double -strict $Hab] {
                            0       { ::ms::Error "Invalid color channel, '$Hab'." $caller_info }
                            default {
                                if { ($Hab < 0) || ($Hab >= 360.0) } {
                                    set Hab 0
                                }
                            }
                        }

                        lappend LCHab $L $C $Hab
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]] }
                rgb   { return [::XYZ_rgb     [::Lab_XYZ   [::LCHab_Lab $LCHab]]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]] }
                XYZ   { return [::Lab_XYZ     [::LCHab_Lab $LCHab]] }
                xyY   { return [::XYZ_xyY     [::Lab_XYZ   [::LCHab_Lab $LCHab]]] }
                Lab   { return [::LCHab_Lab   $LCHab] }
                Luv   { return [::XYZ_Luv     [::Lab_XYZ   [::LCHab_Lab $LCHab]]] }
                LCHab { return $LCHab }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::Lab_XYZ   [::LCHab_Lab $LCHab]]]] }
            }
        }
        LCHuv {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach { L C Hab } $colors {
                        # Check the 'L'.
                        switch -- [string is double -strict $L] {
                            0       { ::ms::Error "Invalid color channel, '$L'." $caller_info }
                            default {
                                if { $L < 0 } {
                                    set L 0
                                } elseif { $L > 1.0 } {
                                    set L 1.0
                                }
                            }
                        }

                        # Check the 'C'.
                        switch -- [string is double -strict $C] {
                            0       { ::ms::Error "Invalid color channel, '$C'." $caller_info }
                            default {
                                if { $C < 0 } {
                                    set C 0
                                } elseif { $C > 100.0 } {
                                    set C 100.0
                                }
                            }
                        }

                        # Check the 'Huv'.
                        switch -- [string is double -strict $Huv] {
                            0       { ::ms::Error "Invalid color channel, '$Huv'." $caller_info }
                            default {
                                if { ($Huv < 0) || ($Huv >= 360.0) } {
                                    set Huv 0
                                }
                            }
                        }

                        lappend LCHuv $L $C $Huv
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]] }
                rgb   { return [::XYZ_rgb     [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]] }
                XYZ   { return [::Luv_XYZ     [::LCHuv_Luv $LCHuv]] }
                xyY   { return [::XYZ_xyY     [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]] }
                Lab   { return [::XYZ_Lab     [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]] }
                Luv   { return [::LCHuv_Luv   $LCHuv] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::Luv_XYZ   [::LCHuv_Luv $LCHuv]]]] }
                LCHuv { return $channels }
            }
        }
    }
}

## Dark
#
# Compute a darker version (by *amount* and *via*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of lightness to subtract [0,100].
#                This amount is evaluated as a percentage.
#
# via            Should be a string indicating the 'via' to use to achieve the results.
#                Allowed values are:
#
#                   **RGB**
#                   **HSL**
#                   **Lab**
#                   **Luv**
#                   **LCHab**
#                   **LCHuv**
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Dark { hexadecimals amount via depth } {
    # Check the 'via' provided.
    switch -- $via {
        RGB {
            # Check the color 'depth' provided.
            switch -- $depth {
                8   {
                    # Transform the amount from [0,100] to [0,255].
                    set amount [expr { round($amount*2.55) }]

                    # Transform the hexadecimal colors provided into RGB8 colors.
                    set channels [::HEX8_RGB8 $hexadecimals]
                }
                12  {
                    # Transform the amount from [0,100] to [0,4095].
                    set amount [expr { round($amount*40.95) }]

                    # Transform the hexadecimal colors provided into RGB12 colors.
                    set channels [::HEX12_RGB12 $hexadecimals]
                }
                16  {
                    # Transform the amount from [0,100] to [0,65535].
                    set amount [expr { round($amount*655.35) }]

                    # Transform the hexadecimal colors provided into RGB16 colors.
                    set channels [::HEX16_RGB16 $hexadecimals]
                }
            }

            # Execute the command.
            foreach channel $channels {
                set channel [expr { $channel-$amount }]

                # Check if 'channel' exceeds its lower limit
                if { $channel < 0 } {
                    set channel 0
                }

                lappend results $channel
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        HSL {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSL colors.
            switch -- $depth {
                8   { set channels [::rgb_HSL [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12  { set channels [::rgb_HSL [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16  { set channels [::rgb_HSL [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S L } $channels {
                set L [expr { $L-$amount }]

                # Check if 'L' exceeds its lower limit
                if { $L < 0 } {
                    set L 0
                }

                lappend results $H $S $L
            }

            # Transform the resulting HSL colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $results]]] }
            }
        }
        Lab {
            # Note:  'L' range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into Lab colors.
            switch -- $depth {
                8  { set channels [::XYZ_Lab [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]]] }
                12 { set channels [::XYZ_Lab [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]]] }
                16 { set channels [::XYZ_Lab [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]]] }
            }

            # Execute the command.
            foreach { L a b } $channels {
                set L [expr { $L-$amount }]

                # Check if 'L' exceeds its lower limit
                if { $L < 0 } {
                    set L 0
                }

                lappend results $L $a $b
            }

            # Transform the resulting Lab colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ $results]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ $results]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ $results]]]] }
            }
        }
        Luv {
            # Note:  'L' range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into Luv colors.
            switch -- $depth {
                8  { set channels [::XYZ_Luv [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]]] }
                12 { set channels [::XYZ_Luv [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]]] }
                16 { set channels [::XYZ_Luv [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]]] }
            }

            # Execute the command.
            foreach { L u v } $channels {
                set L [expr { $L-$amount }]

                # Check if 'L' exceeds its lower limit
                if { $L < 0 } {
                    set L 0
                }

                lappend results $L $u $v
            }

            # Transform the resulting Luv colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Luv_XYZ $results]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Luv_XYZ $results]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Luv_XYZ $results]]]] }
            }
        }
        LCHab {
            # Note:  'L' range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into LCHab colors.
            switch -- $depth {
                8  { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]]]] }
                12 { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]]]] }
                16 { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]]]] }
            }

            # Execute the command.
            foreach { L C Hab } $channels {
                set L [expr { $L-$amount }]

                # Check if 'L' exceeds its lower limit
                if { $L < 0 } {
                    set L 0
                }

                lappend results $L $C $Hab
            }

            # Transform the resulting LCHab colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
            }
        }
        LCHuv {
            # Note:  'L' range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into LCHuv colors.
            switch -- $depth {
                8  { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]]]] }
                12 { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]]]] }
                16 { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]]]] }
            }

            # Execute the command.
            foreach { L C Huv } $channels {
                set L [expr { $L-$amount }]

                # Check if 'L' exceeds its lower limit
                if { $L < 0 } {
                    set L 0
                }

                lappend results $L $C $Huv
            }

            # Transform the resulting LCHuv colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Luv_XYZ [::LCHuv_Luv $results]]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Luv_XYZ [::LCHuv_Luv $results]]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Luv_XYZ [::LCHuv_Luv $results]]]]] }
            }
        }
    }
}

## Deficiency
#
# Compute a deficiency version (by *severity* and *via*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# via            Should be a string indicating the 'via' to use to achieve the results.
#                Allowed values are:
#
#                   **achromatic**
#                   **red**
#                   **green**
#                   **blue**
#                   **protanomaly**
#                   **deuteranomaly**
#                   **tritanomaly**
#                   **protanopia**
#                   **deuteranopia**
#                   **tritanopia**
#
# severity       Should be a floating point value specifing how much of the eye cone is damaged.
#                This amount is always evaluated as a percentage.
#                It's only Meaningfull for 'Protanomaly', 'Deuteranomaly' or 'Tritanomaly' vias.
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Deficiency { hexadecimals via severity depth } {
    # Check the 'via' provided.
    switch -- $via {
        achromatic {
            # Note: All cones are missing or completely damaged.

            # HEVC --> Human Eye Vision Corrected gray.

            # Transform the hexadecimal colors provided into rgb non linear colors.
            switch -- $depth {
                8  { set channels [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]] }
                12 { set channels [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]] }
                16 { set channels [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]] }
            }

            # Execute the command.
            foreach { r g b } $channels {
                # Transforming the rgb non linear channels into rgb linear channels.
                set r_linear [::companding $r inverse]
                set g_linear [::companding $g inverse]
                set b_linear [::companding $b inverse]

                # Compute the gray linear channel (the 'luma') by taking in account the unadapted Y values for the current colorspace.
                set a1   [expr { $::ms::data(colorspace,$::ms::colorspace,Yr)*$r_linear }]
                set a2   [expr { $::ms::data(colorspace,$::ms::colorspace,Yg)*$g_linear }]
                set a3   [expr { $::ms::data(colorspace,$::ms::colorspace,Yb)*$b_linear }]
                set luma [expr { $a1+$a2+$a3 }]

                # Transform the gray linear channel into a gray non linear one.
                set gray [::companding $luma normal]

                lappend results $gray $gray $gray
            }

            # Transform the resulting rgb non linear colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  $results]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 $results]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 $results]] }
            }
        }
        red {
            # Note: The red cone is the only cone present.

            # Transform the hexadecimal colors provided into rgb non linear colors.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $hexadecimals] }
                12 { set channels [::HEX12_RGB12 $hexadecimals] }
                16 { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $red 0 0
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        green {
            # Note: The green cone is the only cone present.

            # Transform the hexadecimal colors provided into rgb non linear colors.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $hexadecimals] }
                12 { set channels [::HEX12_RGB12 $hexadecimals] }
                16 { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results 0 $green 0
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        blue {
            # Note: The blue cone is the only cone present.

            # Transform the hexadecimal colors provided into rgb non linear colors.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $hexadecimals] }
                12 { set channels [::HEX12_RGB12 $hexadecimals] }
                16 { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results 0 0 $blue
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        protanopia {
            # Note: The green and blue cone are present and working, while the red cone is missing or completely damaged.

            # Transform the hexadecimal colors provided into rgb non linear colors.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $hexadecimals] }
                12 { set channels [::HEX12_RGB12 $hexadecimals] }
                16 { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results 0 $green $blue
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        deuteranopia {
            # Note: The red and blue cone are present and working, while the green cone is missing or completely damaged.

            # Transform the hexadecimal colors provided into rgb non linear colors.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $hexadecimals] }
                12 { set channels [::HEX12_RGB12 $hexadecimals] }
                16 { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $red 0 $blue
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        tritanopia {
            # Note: The red and green cone are present and working, while the red cone is missing or completely damaged.

            # Transform the hexadecimal colors provided into rgb non linear colors.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $hexadecimals] }
                12 { set channels [::HEX12_RGB12 $hexadecimals] }
                16 { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $red $green 0
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        protanomaly   -
        deuteranomaly -
        tritanomaly   {
            # Note: Protanomaly   --> The cones are all present but the red cone is damaged by a certain severity degrees.
            #       Deuteranomaly --> The cones are all present but the green cone is damaged by a certain severity degrees.
            #       Tritanomaly   --> The cones are all present but the blue cone is damaged by a certain severity degrees.

            # Transform the hexadecimal colors provided into rgb non linear colors.
            switch -- $depth {
                8  { set channels [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]] }
                12 { set channels [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]] }
                16 { set channels [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]] }
            }

            # Compute the rgb non linear colors.
            foreach { r g b } $channels {
                # Transforming the rgb non linear channels into rgb linear channels.
                set r_linear [::companding $r inverse]
                set g_linear [::companding $g inverse]
                set b_linear [::companding $b inverse]

                if { $severity in [list 0 10.0 20.0 30.0 40.0 50.0 60.0 70.0 80.0 90.0 100.0] } {
                    ######################
                    ##                  ##
                    ##     SEVERITY     ##
                    ##                  ##
                    ######################

                    set cvd [dict get $::ms::table(cvd) $via $severity]
                    set a1  [lindex $cvd 0]
                    set a2  [lindex $cvd 1]
                    set a3  [lindex $cvd 2]
                    set b1  [lindex $cvd 3]
                    set b2  [lindex $cvd 4]
                    set b3  [lindex $cvd 5]
                    set c1  [lindex $cvd 6]
                    set c2  [lindex $cvd 7]
                    set c3  [lindex $cvd 8]

                    # | a1  b1  c1 |   | r_linear |   | r_severity |
                    # | a2  b2  c2 | * | g_linear | = | g_severity |
                    # | a3  b3  c3 |   | b_linear |   | b_severity |

                    set r_severity [expr { ($a1*$r_linear) + ($b1*$g_linear) + ($c1*$b_linear) }]
                    set g_severity [expr { ($a2*$r_linear) + ($b2*$g_linear) + ($c2*$b_linear) }]
                    set b_severity [expr { ($a3*$r_linear) + ($b3*$g_linear) + ($c3*$b_linear) }]
                } else {
                    foreach superior_severity [list 10.0 20.0 30.0 40.0 50.0 60.0 70.0 80.0 90.0 100.0] {
                        if { $severity < $superior_severity } {
                            ######################
                            ##                  ##
                            ##     INFERIOR     ##
                            ##                  ##
                            ######################

                            set inferior_severity [expr { $superior_severity-10.0 }]

                            # Get the matrix from the cvd table, for the severity immediately inferior to the severity provided.
                            set cvd_inferior [dict get $::ms::table(cvd) $via $inferior_severity]
                            set a1_inferior  [lindex $cvd_inferior 0]
                            set a2_inferior  [lindex $cvd_inferior 1]
                            set a3_inferior  [lindex $cvd_inferior 2]
                            set b1_inferior  [lindex $cvd_inferior 3]
                            set b2_inferior  [lindex $cvd_inferior 4]
                            set b3_inferior  [lindex $cvd_inferior 5]
                            set c1_inferior  [lindex $cvd_inferior 6]
                            set c2_inferior  [lindex $cvd_inferior 7]
                            set c3_inferior  [lindex $cvd_inferior 8]

                            # | a1_inferior  b1_inferior  c1_inferior |   | r_linear |   | r_inferior |
                            # | a2_inferior  b2_inferior  c2_inferior | * | g_linear | = | g_inferior |
                            # | a3_inferior  b3_inferior  c3_inferior |   | b_linear |   | b_inferior |

                            # Compute the rgb value at the inferior severity.
                            set r_inferior [expr { ($a1_inferior*$r_linear) + ($b1_inferior*$g_linear) + ($c1_inferior*$b_linear) }]
                            set g_inferior [expr { ($a2_inferior*$r_linear) + ($b2_inferior*$g_linear) + ($c2_inferior*$b_linear) }]
                            set b_inferior [expr { ($a3_inferior*$r_linear) + ($b3_inferior*$g_linear) + ($c3_inferior*$b_linear) }]

                            ######################
                            ##                  ##
                            ##     SUPERIOR     ##
                            ##                  ##
                            ######################

                            # Get the matrix from the cvd table, for the severity immediately superior to the severity provided.
                            set cvd_superior [dict get $::ms::table(cvd) $via $superior_severity]
                            set a1_superior  [lindex $cvd_superior 0]
                            set a2_superior  [lindex $cvd_superior 1]
                            set a3_superior  [lindex $cvd_superior 2]
                            set b1_superior  [lindex $cvd_superior 3]
                            set b2_superior  [lindex $cvd_superior 4]
                            set b3_superior  [lindex $cvd_superior 5]
                            set c1_superior  [lindex $cvd_superior 6]
                            set c2_superior  [lindex $cvd_superior 7]
                            set c3_superior  [lindex $cvd_superior 8]

                            # | a1_superior  b1_superior  c1_superior |   | r_linear |   | r_superior |
                            # | a2_superior  b2_superior  c2_superior | * | g_linear | = | g_superior |
                            # | a3_superior  b3_superior  c3_superior |   | b_linear |   | b_superior |

                            # Compute the rgb value at the superior severity.
                            set r_superior [expr { ($a1_superior*$r_linear) + ($b1_superior*$g_linear) + ($c1_superior*$b_linear) }]
                            set g_superior [expr { ($a2_superior*$r_linear) + ($b2_superior*$g_linear) + ($c2_superior*$b_linear) }]
                            set b_superior [expr { ($a3_superior*$r_linear) + ($b3_superior*$g_linear) + ($c3_superior*$b_linear) }]

                            ######################
                            ##                  ##
                            ##     SEVERITY     ##
                            ##                  ##
                            ######################

                            # Compute the rgb value at severity with a linear interpolation between the inferior and superior rgbs.
                            set r_severity [::lerp $severity $inferior_severity $superior_severity $r_inferior $r_superior]
                            set g_severity [::lerp $severity $inferior_severity $superior_severity $g_inferior $g_superior]
                            set b_severity [::lerp $severity $inferior_severity $superior_severity $b_inferior $b_superior]

                            break
                        }
                    }
                }

                # Transform the rgb linear channel into rgb non linear one.
                set r [::companding $r_severity normal]
                set g [::companding $g_severity normal]
                set b [::companding $b_severity normal]

                lappend results $r $g $b
            }

            # Transform the resulting rgb non linear colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  $results]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 $results]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 $results]] }
            }
        }
    }
}

## Desaturate
#
# Compute a desaturated version (by *amount* and *via*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of saturation to subtract [0,100].
#                This amount is evaluated as a percentage.
#
# via            Should be a string indicating the 'via' to use to achieve the results.
#                Allowed values are:
#
#                   **HSB**
#                   **HSI**
#                   **HSL**
#                   **HSP**
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Desaturate { hexadecimals amount via depth } {
    # Check the 'via' provided.
    switch -- $via {
        HSB {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSB colors.
            switch -- $depth {
                8  { set channels [::rgb_HSB [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12 { set channels [::rgb_HSB [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16 { set channels [::rgb_HSB [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S B } $channels {
                set S [expr { $S-$amount }]

                # Check if 'S' exceeds its lower limit.
                if { $S < 0 } {
                    set S 0
                }

                lappend results $H $S $B
            }

            # Transform the resulting HSB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSB_rgb $results]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSB_rgb $results]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSB_rgb $results]]] }
            }
        }
        HSI {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSI colors.
            switch -- $depth {
                8  { set channels [::rgb_HSI [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12 { set channels [::rgb_HSI [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16 { set channels [::rgb_HSI [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S I } $channels {
                set S [expr { $S-$amount }]

                # Check if 'S' exceeds its lower limit.
                if { $S < 0 } {
                    set S 0
                }

                lappend results $H $S $I
            }

            # Transform the resulting HSI colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSI_rgb $results]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSI_rgb $results]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSI_rgb $results]]] }
            }
        }
        HSL {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSL colors.
            switch -- $depth {
                8  { set channels [::rgb_HSL [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12 { set channels [::rgb_HSL [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16 { set channels [::rgb_HSL [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S L } $channels {
                set S [expr { $S-$amount }]

                # Check if 'S' exceeds its lower limit.
                if { $S < 0 } {
                    set S 0
                }

                lappend results $H $S $L
            }

            # Transform the resulting HSL colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $results]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $results]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $results]]] }
            }
        }
        HSP {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSP colors.
            switch -- $depth {
                8  { set channels [::rgb_HSP [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12 { set channels [::rgb_HSP [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16 { set channels [::rgb_HSP [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S P } $channels {
                set S [expr { $S-$amount }]

                # Check if 'S' exceeds its lower limit.
                if { $S < 0 } {
                    set S 0
                }

                lappend results $H $S $P
            }

            # Transform the resulting HSP colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSP_rgb $results]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSP_rgb $results]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSP_rgb $results]]] }
            }
        }
    }
}

## Family
#
# Compute the family of each of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the family of each of the colors provided.
proc ::ms::color::Family { hexadecimals depth } {
    # Transform the hexadecimal colors provided into RGB colors.
    switch -- $depth {
        8   { set channels [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]] }
        12  { set channels [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]] }
        16  { set channels [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]] }
    }

    # Execute the command.
    foreach { r g b } $channels {
        if { ($red == $green) && ($red == $blue) } {
            lappend results Gray
        } else {
            set min  [expr { min($r,$g,$b) }]
            set max  [expr { max($r,$g,$b) }]
            set diff [expr { $max-$min }]

            # Compute the color's hue.
            if { $r == $max } {
                set segment [expr { ($g-$b)/$diff }]
                if { $segment < 0 } {
                    set hue [expr { (6.0+$segment)*60.0 }]
                } else {
                    set hue [expr { $segment*60.0 }]
                }
            } elseif { $g == $max } {
                set hue [expr { (2.0+(($b-$r)/$diff))*60.0 }]
            } else {
                set hue [expr { (4.0+(($r-$g)/$diff))*60.0 }]
            }

            # Adjust the hue value if exceeds its limits [0,360[.
            if { $hue < 0 } {
                set hue [expr { $hue+360.0 }]
            } elseif { $hue >= 360.0 } {
                set hue [expr { $hue-360.0 }]
            }

            # Compute the color's family.
            foreach { family treshold } [list Red           11.0 \
                                              Red-Orange    21.0 \
                                              Orange        41.0 \
                                              Orange-Yellow 51.0 \
                                              Yellow        61.0 \
                                              Yellow-Green  81.0 \
                                              Green         141.0 \
                                              Green-Cyan    171.0 \
                                              Cyan          201.0 \
                                              Cyan-Blue     221.0 \
                                              Blue          241.0 \
                                              Blue-Purple   281.0 \
                                              Purple        321.0 \
                                              Purple-Red    351.0 \
                                              Red           360.0] {
                if { $hue < $treshold } {
                    lappend results $family
                }
            }
        }
    }

    return $results
}

## Gray
#
# Compute a gray version (by *via*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# via            Should be a string indicating the 'via' to use to achieve the results.
#                Allowed values are:
#
#                   **average**
#                   **desaturate**
#                   **hevc**
#                   **max**
#                   **min**
#                   **red**
#                   **green**
#                   **blue**
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Gray { hexadecimals via depth } {
    # Check the 'via' provided.
    switch -- $via {
        red {
            # Transform the hexadecimal colors provided into RGB colors.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $hexadecimals] }
                12  { set channels [::HEX12_RGB12 $hexadecimals] }
                16  { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $red $red $red
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        green {
            # Transform the hexadecimal colors provided into RGB colors.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $hexadecimals] }
                12  { set channels [::HEX12_RGB12 $hexadecimals] }
                16  { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $green $green $green
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        blue {
            # Transform the hexadecimal colors provided into RGB colors.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $hexadecimals] }
                12  { set channels [::HEX12_RGB12 $hexadecimals] }
                16  { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $blue $blue $blue
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        max {
            # Transform the hexadecimal colors provided into RGB colors.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $hexadecimals] }
                12  { set channels [::HEX12_RGB12 $hexadecimals] }
                16  { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                set gray [expr { max($red,$green,$blue) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        min {
            # Transform the hexadecimal colors provided into RGB colors.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $hexadecimals] }
                12  { set channels [::HEX12_RGB12 $hexadecimals] }
                16  { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                set gray [expr { min($red,$green,$blue) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        average {
            # Transform the hexadecimal colors provided into RGB colors.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $hexadecimals] }
                12  { set channels [::HEX12_RGB12 $hexadecimals] }
                16  { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Note that for performance reasons instead of diving the sum by '3', we multiply it by '0.33333333333333333'.

            # Execute the command.
            foreach { red green blue } $channels {
                set gray [expr { round(($red+$green+$blue)*0.33333333333333333) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        desaturate {
            # Transform the hexadecimal colors provided into RGB colors.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $hexadecimals] }
                12  { set channels [::HEX12_RGB12 $hexadecimals] }
                16  { set channels [::HEX16_RGB16 $hexadecimals] }
            }

            # Note that for performance reasons instead of diving the sum by '2', we multiply it by '0.5'.

            # Execute the command.
            foreach { red green blue } $channels {
                set min  [expr { min($red,$green,$blue) }]
                set max  [expr { max($red,$green,$blue) }]
                set gray [expr { round(($max+$min)*0.5) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        hevc {
            # Human Eye Vision Corrected gray.

            # Transform the RGB colors into rgb colors.
            switch -- $depth {
                8   { set channels [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]] }
                12  { set channels [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]] }
                16  { set channels [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]] }
            }

            # Execute the command.
            set gray [list ]
            foreach { r g b } $channels {
                set r_linear [::companding $r inverse]
                set g_linear [::companding $g inverse]
                set b_linear [::companding $b inverse]

                set gray_r_linear [expr { ($::ms::data(colorspace,$::ms::colorspace,Yr)*$r_linear) }]
                set gray_g_linear [expr { ($::ms::data(colorspace,$::ms::colorspace,Yg)*$g_linear) }]
                set gray_b_linear [expr { ($::ms::data(colorspace,$::ms::colorspace,Yb)*$b_linear) }]
                set gray          [::companding [expr { $gray_r_linear+$gray_g_linear+$gray_b_linear }] normal]

                lappend results $gray $gray $gray
            }

            # Transform the gray rgb *non linear* colors back into RGB colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  $results]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 $results]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 $results]] }
            }
        }
    }
}

## Hot
#
# Compute a hotter version (by *amount*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of heat to add [0,100].
#                This amount is evaluated as a percentage.
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Hot { hexadecimals amount depth } {
    # Check the color 'depth' provided.
    switch -- $depth {
        8   {
            # Set the maximum value for every channel.
            set upper_limit 255

            # Transform the amount from [0,100] to [0,255].
            set amount [expr { round($amount*2.55) }]

            # Transform the hexadecimal colors provided into RGB8 colors.
            set channels [::HEX8_RGB8 $hexadecimals]
        }
        12  {
            # Set the maximum value for every channel.
            set upper_limit 4095

            # Transform the amount from [0,100] to [0,4095].
            set amount [expr { round($amount*40.95) }]

            # Transform the hexadecimal colors provided into RGB12 colors.
            set channels [::HEX12_RGB12 $hexadecimals]
        }
        16  {
            # Set the maximum value for every channel.
            set upper_limit 65535

            # Transform the amount from [0,100] to [0,65535].
            set amount [expr { round($amount*655.35) }]

            # Transform the hexadecimal colors provided into RGB16 colors.
            set channels [::HEX16_RGB16 $hexadecimals]
        }
    }

    # Execute the command.
    foreach { red green blue } $channels {
        set red  [expr { $red+$amount  }]
        set blue [expr { $blue-$amount }]

        # Check that the 'red' channel doesn't exceeds its upper limit.
        if { $red > $upper_limit } {
            set red $upper_limit
        }

        # Check that the 'blue' channel doesn't exceeds its lower limit.
        if { $blue < 0 } {
            set blue 0
        }

        lappend results $red $green $blue
    }

    # Transform the resulting RGB colors back into hexadecimal colors
    # with the same color depth of the hexadecimal colors provided.
    switch -- $depth {
        8   { return [::RGB8_HEX8   $results] }
        12  { return [::RGB12_HEX12 $results] }
        16  { return [::RGB16_HEX16 $results] }
    }
}

## Inverse
#
# Compute the inverse colors of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Inverse { hexadecimals depth } {
    # Check the color 'depth' provided.
    switch -- $depth {
        8   {
            # Set the maximum value for every channel.
            set upper_limit 255

            # Transform the hexadecimal colors provided into RGB8 colors.
            set channels [::HEX8_RGB8 $hexadecimals]
        }
        12  {
            # Set the maximum value for every channel.
            set upper_limit 4095

            # Transform the hexadecimal colors provided into RGB12 colors.
            set channels [::HEX12_RGB12 $hexadecimals]
        }
        16  {
            # Set the maximum value for every channel.
            set upper_limit 65535

            # Transform the hexadecimal colors provided into RGB16 colors.
            set channels [::HEX16_RGB16 $hexadecimals]
        }
    }

    # Execute the command.
    foreach { red green blue } $channels {
        set red   [expr { $upper_limit-$red   }]
        set green [expr { $upper_limit-$green }]
        set blue  [expr { $upper_limit-$blue  }]

        lappend results $red $green $blue
    }

    # Transform the resulting RGB colors back into hexadecimal colors
    # with the same color depth of the hexadecimal colors provided.
    switch -- $depth {
        8   { return [::RGB8_HEX8   $results] }
        12  { return [::RGB12_HEX12 $results] }
        16  { return [::RGB16_HEX16 $results] }
    }
}

## Light
#
# Compute a lighter version (by *amount* and *via*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of lightness to add [0,100].
#                This amount is evaluated as a percentage.
#
# via            Should be a string indicating the 'via' to use to achieve the results.
#                Allowed values are:
#
#                   **RGB**
#                   **HSL**
#                   **Lab**
#                   **Luv**
#                   **LCHab**
#                   **LCHuv**
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Light { hexadecimals amount via depth } {
    # Check the 'via' provided.
    switch -- $via {
        RGB {
            # Check the color 'depth' provided.
            switch -- $depth {
                8   {
                    # Set the maximum value for every channel.
                    set upper_limit 255

                    # Transform the amount from [0,100] to [0,255].
                    set amount [expr { round($amount*2.55) }]

                    # Transform the hexadecimal colors provided into RGB8 colors.
                    set channels [::HEX8_RGB8 $hexadecimals]
                }
                12  {
                    # Set the maximum value for every channel.
                    set upper_limit 4095

                    # Transform the amount from [0,100] to [0,4095].
                    set amount [expr { round($amount*40.95) }]

                    # Transform the hexadecimal colors provided into RGB12 colors.
                    set channels [::HEX12_RGB12 $hexadecimals]
                }
                16  {
                    # Set the maximum value for every channel.
                    set upper_limit 65535

                    # Transform the amount from [0,100] to [0,65535].
                    set amount [expr { round($amount*655.35) }]

                    # Transform the hexadecimal colors provided into RGB colors.
                    set channels [::HEX16_RGB16 $hexadecimals]
                }
            }

            # Execute the command.
            foreach channel $channels {
                set channel [expr { $channel+$amount }]

                # Check if 'channel' exceeds its upper limit.
                if { $channel > $upper_limit } {
                    set channel $upper_limit
                }

                lappend results $channel
            }

            # Transform the resulting RGB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        HSL {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSL colors.
            switch -- $depth {
                8   { set channels [::rgb_HSL [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12  { set channels [::rgb_HSL [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16  { set channels [::rgb_HSL [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S L } $channels {
                set L [expr { $L+$amount }]

                # Check if 'L' exceeds its upper limit.
                if { $L > 100.0 } {
                    set L 100.0
                }

                lappend results $H $S $L
            }

            # Transform the resulting HSL colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $results]]] }
            }
        }
        Lab {
            # Note:  'L' range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into Lab colors.
            switch -- $depth {
                8  { set channels [::XYZ_Lab [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]]] }
                12 { set channels [::XYZ_Lab [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]]] }
                16 { set channels [::XYZ_Lab [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]]] }
            }

            # Execute the command.
            foreach { L a b } $channels {
                set L [expr { $L+$amount }]

                # Check if 'L' exceeds its upper limit.
                if { $L > 100.0 } {
                    set L 100.0
                }

                lappend results $L $a $b
            }

            # Transform the resulting Lab colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ $results]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ $results]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ $results]]]] }
            }
        }
        Luv {
            # Note:  'L' range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into Luv colors.
            switch -- $depth {
                8  { set channels [::XYZ_Luv [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]]] }
                12 { set channels [::XYZ_Luv [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]]] }
                16 { set channels [::XYZ_Luv [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]]] }
            }

            # Execute the command.
            foreach { L u v } $channels {
                set L [expr { $L+$amount }]

                # Check if 'L' exceeds its upper limit.
                if { $L > 100.0 } {
                    set L 100.0
                }

                lappend results $L $u $v
            }

            # Transform the resulting Luv colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Luv_XYZ $results]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Luv_XYZ $results]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Luv_XYZ $results]]]] }
            }
        }
        LCHab {
            # Note:  'L' range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into LCHab colors.
            switch -- $depth {
                8  { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]]]] }
                12 { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]]]] }
                16 { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]]]] }
            }

            # Execute the command.
            foreach { L C Hab } $channels {
                set L [expr { $L+$amount }]

                # Check if 'L' exceeds its upper limit.
                if { $L > 100.0 } {
                    set L 100.0
                }

                lappend results $L $C $Hab
            }

            # Transform the resulting LCHab colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
            }
        }
        LCHuv {
            # Note:  'L' range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into LCHuv colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]]]] }
                12 { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]]]] }
                16 { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]]]] }
            }

            # Execute the command.
            foreach { L C Huv } $channels {
                set L [expr { $L+$amount }]

                # Check if 'L' exceeds its upper limit.
                if { $L > 100.0 } {
                    set L 100.0
                }

                lappend results $L $C $Huv
            }

            # Transform the resulting LCHuv colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Luv_XYZ [::LCHuv_Luv $results]]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Luv_XYZ [::LCHuv_Luv $results]]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Luv_XYZ [::LCHuv_Luv $results]]]]] }
            }
        }
    }
}

## Saturate
#
# Compute a saturated version (by *amount* and *via*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of saturation to add [0,100].
#                This amount is evaluated as a percentage.
#
# via            Should be a string indicating the 'via' to use to achieve the results.
#                Allowed values are:
#
#                   **HSB**
#                   **HSI**
#                   **HSL**
#                   **HSP**
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Saturate { hexadecimals amount via depth } {
    # Check the 'via' provided.
    switch -- $via {
        HSB {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSB colors.
            switch -- $depth {
                8   { set channels [::rgb_HSB [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12  { set channels [::rgb_HSB [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16  { set channels [::rgb_HSB [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S B } $channels {
                set S [expr { $S+$amount }]

                # Check if 'S' exceeds its upper limit.
                if { $S > 100.0 } {
                    set S 100.0
                }

                lappend results $H $S $B
            }

            # Transform the resulting HSB colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSB_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSB_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSB_rgb $results]]] }
            }
        }
        HSI {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSI colors.
            switch -- $depth {
                8   { set channels [::rgb_HSI [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12  { set channels [::rgb_HSI [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16  { set channels [::rgb_HSI [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S I } $channels {
                set S [expr { $S+$amount }]

                # Check if 'S' exceeds its upper limit.
                if { $S > 100.0 } {
                    set S 100.0
                }

                lappend results $H $S $I
            }

            # Transform the resulting HSI colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSI_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSI_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSI_rgb $results]]] }
            }
        }
        HSL {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSL colors.
            switch -- $depth {
                8   { set channels [::rgb_HSL [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12  { set channels [::rgb_HSL [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16  { set channels [::rgb_HSL [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S L } $channels {
                set S [expr { $S+$amount }]

                # Check if 'S' exceeds its upper limit.
                if { $S > 100.0 } {
                    set S 100.0
                }

                lappend results $H $S $L
            }

            # Transform the resulting HSL colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $results]]] }
            }
        }
        HSP {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal colors provided into HSP colors.
            switch -- $depth {
                8   { set channels [::rgb_HSP [::RGB8_rgb  [::HEX8_RGB8   $hexadecimals]]] }
                12  { set channels [::rgb_HSP [::RGB12_rgb [::HEX12_RGB12 $hexadecimals]]] }
                16  { set channels [::rgb_HSP [::RGB16_rgb [::HEX16_RGB16 $hexadecimals]]] }
            }

            # Execute the command.
            foreach { H S P } $channels {
                set S [expr { $S+$amount }]

                # Check if 'S' exceeds its upper limit.
                if { $S > 100.0 } {
                    set S 100.0
                }

                lappend results $H $S $P
            }

            # Transform the resulting HSP colors back into hexadecimal colors
            # with the same color depth of the hexadecimal colors provided.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSP_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSP_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSP_rgb $results]]] }
            }
        }
    }
}

## Websafe
#
# Compute the websafe colors relative to the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# depth          Should be an integer specifing the color depth in which the colors provided are defined.
#                Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Websafe { hexadecimals { depth "" } } {
    # Check the color 'depth' provided.
    switch -- $depth {
        8   {
            # Transform the hexadecimal colors provided into RGB8 colors.
            set channels [::HEX8_RGB8 $hexadecimals]

            # Execute the commands.
            foreach channel $channels {
                if { $channel <= 25 } {
                    set channel 0
                } elseif { $channel <= 76 } {
                    set channel 51
                } elseif { $channel <= 127 } {
                    set channel 102
                } elseif { $channel <= 178 } {
                    set channel 153
                } elseif { $channel <= 229 } {
                    set channel 204
                } else {
                    set channel 255
                }

                lappend results $channel
            }

            # Transform the resulting RGB8 colors back into hexadecimal colors.
            return [::RGB8_HEX8 $results]
        }
        12  {
            # Transform the hexadecimal colors provided into RGB12 colors.
            set channels [::HEX12_RGB12 $hexadecimals]

            # Execute the commands.
            foreach channel $channels {
                if { $channel <= 409 } {
                    set channel 0
                } elseif { $channel <= 1228 } {
                    set channel 819
                } elseif { $channel <= 2047 } {
                    set channel 1638
                } elseif { $channel <= 2866 } {
                    set channel 2457
                } elseif { $channel <= 3685 } {
                    set channel 3276
                } else {
                    set channel 4095
                }

                lappend results $channel
            }

            # Transform the resulting RGB12 colors back into hexadecimal colors.
            return [::RGB12_HEX12 $results]
        }
        16  {
            # Transform the hexadecimal colors provided into RGB16 colors.
            set channels [::HEX16_RGB16 $hexadecimals]

            # Execute the commands.
            foreach channel $channels {
                if { $channel <= 6553 } {
                    set channel 0
                } elseif { $channel <= 19660 } {
                    set channel 13107
                } elseif { $channel <= 32767 } {
                    set channel 26214
                } elseif { $channel <= 45874 } {
                    set channel 39321
                } elseif { $channel <= 58981 } {
                    set channel 52428
                } else {
                    set channel 65535
                }

                lappend results $channel
            }

            # Transform the resulting RGB16 colors back into hexadecimal colors.
            return [::RGB16_HEX16 $results]
        }
    }
}

# CVD matrix coefficients for 'protanomaly', 'deuteranomaly' and 'tritanomaly' (ordered by severity [0,100%]):
#
# | a1  b1  c1 |
# | a2  b2  c2 | = [list a1  a2  a3  b1  b2  b3  c1  c2  c3]
# | a3  b3  c3 |

# Protanomaly CVD matrices                        a1        a2         a3        b1        b2         b3         c1        c2        c3
dict set ::ms::table(cvd) protanomaly 0     [list 1.0       0          0         0         1.0        0          0         0         1.0]
dict set ::ms::table(cvd) protanomaly 10.0  [list 0.856167  0.029342  -0.002880  0.182038  0.955115  -0.001563  -0.038205  0.015544  1.004443]
dict set ::ms::table(cvd) protanomaly 20.0  [list 0.734766  0.051840  -0.004928  0.334872  0.919198  -0.004209  -0.069637  0.028963  1.009137]
dict set ::ms::table(cvd) protanomaly 30.0  [list 0.630323  0.069181  -0.006308  0.465641  0.890046  -0.007724  -0.095964  0.040773  1.014032]
dict set ::ms::table(cvd) protanomaly 40.0  [list 0.539009  0.082546  -0.007136  0.579343  0.866121  -0.011959  -0.118352  0.051332  1.019095]
dict set ::ms::table(cvd) protanomaly 50.0  [list 0.458064  0.092785  -0.007494  0.679578  0.846313  -0.016807  -0.137642  0.060902  1.024301]
dict set ::ms::table(cvd) protanomaly 60.0  [list 0.385450  0.100526  -0.007442  0.769005  0.829802  -0.022190  -0.154455  0.069673  1.029632]
dict set ::ms::table(cvd) protanomaly 70.0  [list 0.319627  0.106241  -0.007025  0.849633  0.815969  -0.028051  -0.169261  0.077790  1.035076]
dict set ::ms::table(cvd) protanomaly 80.0  [list 0.259411  0.110296  -0.006276  0.923008  0.804340  -0.034346  -0.182420  0.085364  1.040622]
dict set ::ms::table(cvd) protanomaly 90.0  [list 0.203876  0.112975  -0.005222  0.990338  0.794542  -0.041043  -0.194214  0.092483  1.046265]
dict set ::ms::table(cvd) protanomaly 100.0 [list 0.152286  0.114503  -0.003882  1.052583  0.786281  -0.048116  -0.204868  0.099216  1.051998]

# Deuteranomaly CVD matrices                        a1        a2         a3        b1        b2        b3         c1        c2        c3
dict set ::ms::table(cvd) deuteranomaly 0     [list 1.0       0          0         0         1.0       0          0         0         1.0]
dict set ::ms::table(cvd) deuteranomaly 10.0  [list 0.866435  0.049567  -0.003453  0.177704  0.939063  0.007233  -0.044139  0.011370  0.996220]
dict set ::ms::table(cvd) deuteranomaly 20.0  [list 0.760729  0.090568  -0.006027  0.319078  0.889315  0.013325  -0.079807  0.020117  0.992702]
dict set ::ms::table(cvd) deuteranomaly 30.0  [list 0.675425  0.125303  -0.007950  0.433850  0.847755  0.018572  -0.109275  0.026942  0.989378]
dict set ::ms::table(cvd) deuteranomaly 40.0  [list 0.605511  0.155318  -0.009376  0.528560  0.812366  0.023176  -0.134071  0.032316  0.986200]
dict set ::ms::table(cvd) deuteranomaly 50.0  [list 0.547494  0.181692  -0.010410  0.607765  0.781742  0.027275  -0.155259  0.036566  0.983136]
dict set ::ms::table(cvd) deuteranomaly 60.0  [list 0.498864  0.205199  -0.011131  0.674741  0.754872  0.030969  -0.173604  0.039929  0.980162]
dict set ::ms::table(cvd) deuteranomaly 70.0  [list 0.457771  0.226409  -0.011595  0.731899  0.731012  0.034333  -0.189670  0.042579  0.977261]
dict set ::ms::table(cvd) deuteranomaly 80.0  [list 0.422823  0.245752  -0.011843  0.781057  0.709602  0.037423  -0.203881  0.044646  0.974421]
dict set ::ms::table(cvd) deuteranomaly 90.0  [list 0.392952  0.263559  -0.011910  0.823610  0.690210  0.040281  -0.216562  0.046232  0.971630]
dict set ::ms::table(cvd) deuteranomaly 100.0 [list 0.367322  0.280085  -0.011820  0.860646  0.672501  0.042940  -0.227968  0.047413  0.968881]

# Tritanomaly CVD matrices                        a1         a2         a3         b1        b2        b3         c1        c2        c3
dict set ::ms::table(cvd) tritanomaly 0     [list 1.0        0          0          0         1.0       0          0         0         1.0]
dict set ::ms::table(cvd) tritanomaly 10.0  [list 0.926670   0.021191   0.008437   0.092514  0.964503  0.054813  -0.019184  0.014306  0.936750]
dict set ::ms::table(cvd) tritanomaly 20.0  [list 0.895720   0.029997   0.013027   0.133330  0.945400  0.104707  -0.029050  0.024603  0.882266]
dict set ::ms::table(cvd) tritanomaly 30.0  [list 0.905871   0.026856   0.013410   0.127791  0.941251  0.148296  -0.033662  0.031893  0.838294]
dict set ::ms::table(cvd) tritanomaly 40.0  [list 0.948035   0.014364   0.010853   0.089490  0.946792  0.193991  -0.037526  0.038844  0.795156]
dict set ::ms::table(cvd) tritanomaly 50.0  [list 1.017277  -0.006113   0.006379   0.027029  0.958479  0.248708  -0.044306  0.047634  0.744913]
dict set ::ms::table(cvd) tritanomaly 60.0  [list 1.104996  -0.032137   0.001336  -0.046633  0.971635  0.317922  -0.058363  0.060503  0.680742]
dict set ::ms::table(cvd) tritanomaly 70.0  [list 1.193214  -0.058496  -0.002346  -0.109812  0.979410  0.403492  -0.083402  0.079086  0.598854]
dict set ::ms::table(cvd) tritanomaly 80.0  [list 1.257728  -0.078003  -0.003316  -0.139648  0.975409  0.501214  -0.118081  0.102594  0.502102]
dict set ::ms::table(cvd) tritanomaly 90.0  [list 1.278864  -0.084748  -0.000989  -0.125333  0.957674  0.601151  -0.153531  0.127074  0.399838]
dict set ::ms::table(cvd) tritanomaly 100.0 [list 1.255528  -0.078411   0.004733  -0.076749  0.930809  0.691367  -0.178779  0.147602  0.303900]

#*EOF*