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
## SYNOPSIS:
#
#   color action ?value?...?value? ?option value?...?option value?
#
## DESCRIPTION:
#
#   The color command is used to deal with colors, in any form supported by Jay (See JAY SUPPORTED COLOR MODELS).
#   The command can have any of several forms, depending on the action argument:
#
#       color balance   colors tempK ?-depth value?
#           Color balance is the global adjustment of the intensities of the colors (via RGB) to render specific colors correctly,
#           particularly neutral colors.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               tempK           --> Should be a temperature value in Kelvins [1000K, 27000K] indicating the 'Correlated Color Temperature' (CCT)
#                                   of the white color to use. Temperature values that exceeds these limits will be truncated.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#           Returns a list containing the balanced hexadecimal color/s with the same depth as the color/s provided.
#
#       color bw   colors ?-depth value?
#           Compute which color ('black' or 'white') has the greatest contrast with the color/s provided.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#           Returns a list in which each index element is the color 'black' or 'white', depending on which one of these two colors has
#           the greatest contrast with the same indexed element provided.
#
#       color complement   colors ?-depth value?
#           Compute the related complement color/s of the color/s provided.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#           Returns a list containing the complement hexadecimal color/s with the same depth as the color/s provided.
#
#       color contrast   color1 color2 ?-depth value?
#           Compute the contrast between the two colors provided.
#
#               color1          --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by Jay.
#                                   It will be interpreted as the background color.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               color2          --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by Jay.
#                                   It will be interpreted as the foreground color.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#           Returns a dictionary containing the following keys:
#
#               -contrast --> The actual contrast [1.0,21.0] between the two colors provided.
#               -AA1      --> The text is a paragraph with a large font (more than 14 points).
#               -AA2      --> The text is a paragraph with a small font (less than 14 points).
#               -AAA1     --> The text is a title with a large font (more than 14 points).
#               -AAA2     --> The text is a title with a small font (less than 14 points).
#
#           AA1, AA2, AAA1 and AAA2 are scenarios that follows the 'WCAG 2.0' raccomandations for
#           color impaired people; their value can be either 'OK' or 'FAIL'.
#
#       color convert   colors ?-from value? ?-to value?
#           Convert the color/s provided from the color model specified in 'from' to the one specified in 'to'.
#
#               colors          --> Should be a list containing the color/s to convert in any of the color models supported by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               ?-from value?   --> Should be a string indicating the color model of the provided color/s.
#                                   Allowed color models are every color models supported by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#                                   If not provided defaults to 'HEX8'.
#
#               ?-to value?     --> Should be a string indicating the color model of the resulting color/s.
#                                   Allowed color models are every color models supported by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#                                   If not provided defaults to 'RGB8'.
#
#           Returns a list containing the converted colors.
#
#       color cooldown   colors amount ?-depth value?
#           Adjust the color/s provided so they will become more colder (via RGB).
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               amount          --> Should be a floating point value [0,100.0] indicating the amount of heat (with or without the %) to subtract.
#                                   If not provided defaults to '0'.
#
#                                   Note:  The amount is relative to the maximum value reachable by the red, green and blue channels.
#                                          For example:
#                                               1.0% in an RGB color model at 8  bit is '2.55'.
#                                               1.0% in an RGB color model at 12 bit is '40.95'.
#                                               1.0% in an RGB color model at 16 bit is '655.35'.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#           Returns a list containing the cooled down hexadecimal color/s with the same depth as the color/s provided.
#
#       color darken   colors amount ?-depth value? ?-via value?
#           Adjust the color/s provided so they will become more darker.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               amount          --> Should be a floating point value [0,100.0] indicating the amount of heat (with or without the %) to subtract.
#                                   If not provided defaults to '0'.
#
#                                   Note:  The amount is relative to the maximum value reachable by the red, green and blue channels for an RGB system,
#                                          the amount of the lightness in the other available vias.
#                                          For example:
#                                               1.0% in an RGB color system at 8  bit is '2.55'.
#                                               1.0% in an RGB color system at 12 bit is '40.95'.
#                                               1.0% in an RGB color system at 16 bit is '655.35'.
#                                               1.0% in an HSL, Lab, Luv, LCHab and LCHuv color system is '1.0'.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#               ?-via value?    --> Should be a string indicating the path to follow to achieve the result.
#                                   Allowed vias are:
#                                       RGB,
#                                       HSL,
#                                       Lab,
#                                       Luv,
#                                       LCHab,
#                                       LCHuv.
#                                   If not provided defaults to 'Lab'.
#
#           Returns a list containing the darken hexadecimal color/s with the same depth as the color/s provided.
#
#       color deficiency   colors ?-depth value? ?-severity value? ?-via value?
#           Compute the related vision deficiency colors (CVD) of the color/s provided.
#           The human eye has 3 cones, each one processing a specific light color (red, green or blue).
#           People can suffer of missing or damaged cone/s.
#
#               colors              --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                       For more info see JAY SUPPORTED COLOR MODELS.
#
#               ?-depth value?      --> Should be an integer value indicating the bit depth of the color/s provided.
#                                       Allowed values are:
#                                           8   --> 8 bit.
#                                           12  --> 10 bit.
#                                           16  --> 16 bit.
#                                       If not provided defaults to the value of the variable '::DEPTH'.
#
#               ?-severity value?   --> Should be a floating point value [0,100.0] indicating how much of the cone is damaged.
#                                       Meaningfull only for 'Protanomaly', 'Deuteranomaly' or 'Tritanomaly' vias.
#                                       If not provided defaults to '100.0'.
#
#               ?-via value?        --> Should be a string indicating the path to follow to achieve the result.
#                                       Allowed vias are:
#                                           Achromatic    --> No cones present.
#                                                             The person affected by this condition will process every color as a shade of gray.
#                                                             This case is also called 'Daltonism'.
#                                                             This is the default if the via option is not provided.
#
#                                           Deuteranomaly --> The green cone is damaged.
#                                                             The person affected by this condition will have a reduced sensitivity (severity) to green lights.
#
#                                           Deuteranopia  --> Only the red and blue cones are present.
#                                                             The person affected by this condition cannot process the green lights.
#
#                                           Green         --> Only the green cone is present.
#                                                             The person affected by this condition can process only the green lights.
#
#                                           Blue          --> Only the blue cone is present.
#                                                             The person affected by this condition can process only the blue lights.
#
#                                           Protanomaly   --> The red cone is damaged.
#                                                             The person affected by this condition will have a reduced sensitivity (severity) to red lights.
#
#                                           Protanopia    --> Only the green and blue cones are present.
#                                                             The person affected by this condition cannot process the red lights.
#
#                                           Red           --> Only the red cone is present.
#                                                             The person affected by this condition can process only the red lights.
#
#                                           Tritanomaly   --> The blue cone is damaged.
#                                                             The person affected by this condition will have a reduced sensitivity (severity) to blue lights.
#
#                                           Tritanopia    --> Only the red and green cones are present.
#                                                             The person affected by this condition cannot process the blue lights.
#
#               Returns a list containing the vision deficiencies hexadecimal color/s with the same depth as the color/s provided.
#
#       color desaturation   colors amount ?-depth value? ?-via value?
#           Adjust the color/s provided so they will become more desaturated.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               amount          --> Should be a floating point value [0,100.0] indicating the amount of saturation (with or without the %) to subtract.
#                                   If not provided defaults to '0'.
#
#                                   Note:  The amount is relative to the maximum value reachable by the saturation channel in all available vias.
#                                          For example 1.0% in an HSB, HSI, HSL and HSP color system is '1.0'.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#               ?-via value?    --> Should be a string indicating the path to follow to achieve the result.
#                                   Allowed vias are:
#                                       HSB,
#                                       HSI,
#                                       HSL,
#                                       HSP.
#                                   If not provided defaults to 'HSP'.
#
#           Returns a list containing the desaturated hexadecimal color/s with the same depth as the color/s provided.
#
#       color family   colors ?-depth value?
#           Return a list containing the families of the color/s provided.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#       color grey   colors ?-depth value? ?-via value?
#       color gray   colors ?-depth value? ?-via value?
#           Compute the related gray color/s of the color/s provided.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               ?-via value?    --> Should be a string indicating the path to follow to achieve the result.
#                                   Allowed vias are:
#                                       hevc         --> The resulting gray channels will have the same luma of the color provided.
#                                                        This is the default if the via option is not provided.
#                                       average      --> The resulting gray channels will be the average value of the color provided channels (red, green and blue).
#                                       blue         --> The resulting gray channels will be as the blue channel of the color provided.
#                                       desaturation --> The resulting gray channels will be a desaturation of the color provided channels (red, green and blue).
#                                       green        --> The resulting gray channels will be as the green channel of the color provided.
#                                       max          --> The resulting gray channels will be the maximum value of the color provided channels (red, green and blue).
#                                       min          --> The resulting gray channels will be the minimum value of the color provided channels (red, green and blue).
#                                       red          --> The resulting gray channels will be as the red channel of the color provided.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#           Returns a list containing the gray hexadecimal color/s with the same depth as the color/s provided.
#
#       color inverse   colors ?-depth value?
#           Compute the related inverse color/s of the color/s provided.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#           Returns a list containing the inverse hexadecimal color/s with the same depth as the color/s provided.
#
#       color lighten   colors amount ?-depth value? ?-via value?
#           Adjust the color/s provided so they will become more light.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               amount          --> Should be a floating point value [0,100.0] indicating the amount of heat (with or without the %) to subtract.
#                                   If not provided defaults to '0'.
#
#                                   Note:  The amount is relative to the maximum value reachable by the red, green and blue channels for an RGB system,
#                                          the amount of the lightness in the other available vias.
#                                          For example:
#                                               1.0% in an RGB color system at 8  bit is '2.55'.
#                                               1.0% in an RGB color system at 12 bit is '40.95'.
#                                               1.0% in an RGB color system at 16 bit is '655.35'.
#                                               1.0% in an HSL, Lab, Luv, LCHab and LCHuv color system is '1.0'.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#               ?-via value?    --> Should be a string indicating the path to follow to achieve the result.
#                                   Allowed vias are:
#                                       RGB,
#                                       HSL,
#                                       Lab,
#                                       Luv,
#                                       LCHab,
#                                       LCHuv.
#                                   If not provided defaults to 'Lab'.
#
#           Returns a list containing the lighten hexadecimal color/s with the same depth as the color/s provided.
#
#       color list   palette ?-family value?
#           Return a list containing all the colornames available for the palette and family provided.
#
#               palette         --> Should be a string indicating the palette involved.
#                                   Allowed values are every palette name contained in the variable '::PALETTES'.
#
#               ?-family value? --> Should be a string indicating the color family to retrieve.
#                                   Allowed values are:
#                                       all          --> Returns a list containing all the palette colornames.
#                                                        This is the default if the family option is not provided.
#                                       gray         --> -
#                                       grey         --> Returns a list containing all the palette colornames belonging to the 'gray' family (white and black included).
#                                       red          --> Returns a list containing all the palette colornames belonging to the 'red' family.
#                                       redorange    --> Returns a list containing all the palette colornames belonging to the 'redorange' family.
#                                       orange       --> Returns a list containing all the palette colornames belonging to the 'orange' family.
#                                       orangeyellow --> Returns a list containing all the palette colornames belonging to the 'orangeyellow' family.
#                                       yellow       --> Returns a list containing all the palette colornames belonging to the 'yellow' family.
#                                       yellowgreen  --> Returns a list containing all the palette colornames belonging to the 'yellowgreen' family.
#                                       green        --> Returns a list containing all the palette colornames belonging to the 'green' family.
#                                       greencyan    --> Returns a list containing all the palette colornames belonging to the 'greencyan' family.
#                                       cyan         --> Returns a list containing all the palette colornames belonging to the 'cyan' family.
#                                       cyanblue     --> Returns a list containing all the palette colornames belonging to the 'cyanblue' family.
#                                       blue         --> Returns a list containing all the palette colornames belonging to the 'blue' family.
#                                       bluepurple   --> Returns a list containing all the palette colornames belonging to the 'bluepurple' family.
#                                       purple       --> Returns a list containing all the palette colornames belonging to the 'purple' family.
#                                       purplered    --> Returns a list containing all the palette colornames belonging to the 'purplered' family.
#
#       color saturation   colors amount ?-depth value? ?-via value?
#           Adjust the color/s provided so they will become more saturated.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               amount          --> Should be a floating point value [0,100.0] indicating the amount of saturation (with or without the %) to add.
#                                   If not provided defaults to '0'.
#
#                                   Note:  The amount is relative to the maximum value reachable by the saturation channel in all available vias.
#                                          For example 1.0% in an HSB, HSI, HSL and HSP color system is '1.0'.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#               ?-via value?    --> Should be a string indicating the path to follow to achieve the result.
#                                   Allowed vias are:
#                                       HSB,
#                                       HSI,
#                                       HSL,
#                                       HSP.
#                                   If not provided defaults to 'HSP'.
#
#           Returns a list containing the saturated hexadecimal color/s with the same depth as the color/s provided.
#
#       color warmup   colors amount ?-depth value?
#           Adjust the color/s provided so they will become more hotter.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               amount          --> Should be a floating point value [0,100.0] indicating the amount of heat (with or without the %) to add.
#                                   If not provided defaults to '0'.
#
#                                   Note:  The amount is relative to the maximum value reachable by the red, green and blue channels.
#                                          For example:
#                                               1.0% in an RGB color system at 8  bit is '2.55'.
#                                               1.0% in an RGB color system at 12 bit is '40.95'.
#                                               1.0% in an RGB color system at 16 bit is '655.35'.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#           Returns a list containing the warmed up hexadecimal color/s with the same depth as the color/s provided.
#
#       color websafe   colors ?-depth value?
#           Compute the related websafe color/s of the color/s provided.
#
#               colors          --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames known by Jay.
#                                   For more info see JAY SUPPORTED COLOR MODELS.
#
#               ?-depth value?  --> Should be an integer value indicating the bit depth of the color/s provided.
#                                   Allowed values are:
#                                       8   --> 8 bit.
#                                       12  --> 10 bit.
#                                       16  --> 16 bit.
#                                   If not provided defaults to the value of the variable '::DEPTH'.
#
#           Returns a list containing the websafe hexadecimal color/s with the same depth as the color/s provided.
#
## JAY SUPPORTED COLOR MODELS:
#
#   HEX8        Indicates an 'hexadecimal' color model at 8 bit.
#               The 'HEX8' color can be provided as an hexadecimal color (with or without the '#') expressed in shortform (with just 3 hexadecimals),
#               longform (with 6 hexadecimals) or as a textual colorname known by Jay.
#               Every 'HEX8' color will always be returned as an hexadecimal color in it's longform, prepended with '#'.
#               Each HEX8 color ranges from [#000000,#ffffff].
#                   8   --> [#000000,#ffffff]
#                   12  --> [#000000000,#fffffffff]
#                   16  --> [#000000000000,#ffffffffffff]
#
#   HEX12       Indicates an 'hexadecimal' color model at 12 bits.
#               The 'HEX12' color can be provided as an hexadecimal color (with or without the '#') expressed in shortform (with just 3 hexadecimals),
#               longform (with 9 hexadecimals) or as a textual colorname known by Jay.
#               Every 'HEX12' color will always be returned as an hexadecimal color in it's longform, prepended with '#'.
#               Each HEX12 color ranges from [#000000000,#fffffffff].
#
#   HEX16       Indicates an 'hexadecimal' color model at 16 bits.
#               The 'HEX16' color can be provided as an hexadecimal color (with or without the '#') expressed in shortform (with just 3 hexadecimals),
#               longform (with 12 hexadecimals) or as a textual colorname known by Jay.
#               Every 'HEX16' color will always be returned as an hexadecimal color in it's longform, prepended with '#'.
#               Each HEX16 color ranges from [#000000000000,#ffffffffffff].
#
#   RGB8        Indicates an 'RGB' color model at 8 bit, where 'R' is the red component, 'G' is the green component and 'B' is the blue component.
#               The RGB color is a three element list containing (in order) the red, green and blue component.
#               Each RGB component ranges from [0,255] and is always expressed as integer.
#
#   RGB12       Indicates an 'RGB' color model at 12 bit, where 'R' is the red component, 'G' is the green component and 'B' is the blue component.
#               The RGB color is a three element list containing (in order) the red, green and blue component.
#               Each RGB component ranges from [0,4095] and is always expressed as integer.
#
#   RGB16       Indicates an 'RGB' color model at 16 bit, where 'R' is the red component, 'G' is the green component and 'B' is the blue component.
#               The RGB color is a three element list containing (in order) the red, green and blue component.
#               Each RGB component ranges from [0,65535] and is always expressed as integer.
#
#   rgb         Indicates an 'rgb' color model, where 'r' is the red component, 'g' is the green component and 'b' is the blue component.
#               The rgb color is a three element list containing (in order) the red, green and blue component.
#               Each RGB component ranges from [0,1.0] and is always expressed as floating point.
#
#   HSB         Indicates an 'HSB' color model, where 'H' is the hue component, 'S' is the saturation component and 'B' is brightness component.
#               The HSB color is a three element list containing (in order) the hue, saturation and brightness components.
#               The hue component ranges from [0,360.0[. '360.0' is not included.
#               The saturation component ranges from [0,100.0].
#               The brightness component ranges from [0,100.0].
#               Each HSB component is always expressed as floating point.
#
#   HSI         Indicates an 'HSI' color model, where 'H' is the hue component, 'S' is the saturation component and 'I' is intensity component.
#               The HSI color is a three element list containing (in order) the hue, saturation and intensity components.
#               The hue component ranges from [0,360.0[. '360.0' is not included.
#               The saturation component ranges from [0,100.0].
#               The intensity component ranges from [0,100.0].
#               Each HSI component is always expressed as floating point.
#
#   HSL         Indicates an 'HSL' color model, where 'H' is the hue component, 'S' is the saturation component and 'L' is lightness component.
#               The HSL color is a three element list containing (in order) the hue, saturation and lightness components.
#               The hue component ranges from [0,360.0[. '360.0' is not included.
#               The saturation component ranges from [0,100.0].
#               The lightness component ranges from [0,100.0].
#               Each HSL component is always expressed as floating point.
#
#   HSP         Indicates an 'HSP' color model, where 'H' is the hue component, 'S' is the saturation component and 'P' is perceived brightness component.
#               The HSP color is a three element list containing (in order) the hue, saturation and perceived brightness components.
#               The hue component ranges from [0,360.0[. '360.0' is not included.
#               The saturation component ranges from [0,100.0].
#               The perceived brightness component ranges from [0,100.0].
#               Each HSP component is always expressed as floating point.
#
#   XYZ         Indicates an 'XYZ' color model, where 'X', 'Y' and 'Z' are the tristimulus values, as defined in the CIEXYZ 1931 color space.
#               The XYZ color is a three element list containing (in order) the 'X', 'Y' and 'Z' component.
#               The 'X' component ranges from [0,0.96422].
#               The 'Y' component ranges from [0,1.0].
#               The 'Z' component ranges from [0,0.82521].
#               Each XYZ component is always expressed as floating point.
#
#   xyY         Indicates an 'xyY' color model, where 'x', 'y' are normalized 'X' and 'Y' tristimulus values as defined in the CIEXYZ 1931 color space,
#               while 'Y' is the actual 'Y' tristimulus value as defined in the CIEXYZ 1931 color space.
#               The xyY color is a three element list containing (in order) the 'x', 'y' and 'Y' component.
#               Each xyY component ranges from [0,1.0] and is always expressed as floating point.
#
#   Lab         Indicates a 'Lab' color model, where 'L' is the lightness component from black to white, 'a' is the lightness component from green to red
#               and 'b' is the lightness component from blue to yellow, as defined in the CIELab 1976 color space.
#               The Lab color is a three element list containing (in order) the 'L', 'a' and 'b' component.
#               The 'L' component ranges from [0,100.0].
#               The 'a' component ranges from [-128.0,127.0].
#               The 'b' component ranges from [-128.0,127.0].
#               Each Lab component is always expressed as floating point.
#
#   Luv         Indicates a 'Luv' color model, where 'L' is the lightness component from black to white, 'u' and 'v' are two parameters defined in the CIELuv 1976 color space
#               The Luv color is a three element list containing (in order) the 'L', 'u' and 'v' component.
#               The 'L' component ranges from [0,100.0].
#               The 'u' component ranges from [-134.0,220.0].
#               The 'v' component ranges from [-140.0,122.0].
#               Each Luv component is always expressed as floating point.
#
#   LCHab       Indicates an 'LCHab' color model (a cylindrical rappresentation of the 'Lab' color model), where 'L' is the lightness component, 'C' is the chroma component
#               and 'Hab' is the hue component.
#               The LCHab color is a three element list containing (in order) the 'L', 'C' and 'Hab' component.
#               The 'L' component ranges from [0,100.0].
#               The 'C' component ranges from [0,181.01933598375618].
#               The 'Hab' component ranges from [0,360.0[. '360.0' is not included.
#               Each LCHab component is always expressed as floating point.
#
#   LCHuv       Indicates an 'LCHuv' color model (a cylindrical rappresentation of the 'Luv' color model), where 'L' is the lightness component, 'C' is the chroma component
#               and 'Huv' is the hue component.
#               The LCHuv color is a three element list containing (in order) the 'L', 'C' and 'Huv' component.
#               The 'L' component ranges from [0,100.0].
#               The 'C' component ranges from [0,260.76809620810593].
#               The 'Huv' component ranges from [0,360.0[. '360.0' is not included.
#               Each LCHuv component is always expressed as floating point.
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
        balance    { return [::ms::color::Balance.tcl    $args] }
        bw         { return [::ms::color::Bw.tcl         $args] }
        complement { return [::ms::color::Complement.tcl $args] }
        contrast   { return [::ms::color::Contrast.tcl   $args] }
        convert    { return [::ms::color::Convert.tcl    $args] }
        cooldown   { return [::ms::color::Cooldown.tcl   $args] }
        darken     { return [::ms::color::Darken.tcl     $args] }
        deficiency { return [::ms::color::Deficiency.tcl $args] }
        desaturate { return [::ms::color::Desaturate.tcl $args] }
        family     { return [::ms::color::Family.tcl     $args] }
        gray       -
        grey       { return [::ms::color::Gray.tcl       $args] }
        inverse    { return [::ms::color::Inverse.tcl    $args] }
        lighten    { return [::ms::color::Lighten.tcl    $args] }
        list       { return [::ms::color::Colorlist.tcl  $args] }
        saturate   { return [::ms::color::Saturate.tcl   $args] }
        warmup     { return [::ms::color::Warmup.tcl     $args] }
        wcga2.0    { return [::ms::color::WCGA_2.0.tcl   $args] }
        websafe    { return [::ms::color::Websafe.tcl    $args] }
        default    { ::ms::Error "Invalid action, '$action'." $caller_info }
    }
}

## Balance
#
# Compute the balanced color/s (for the temperature provided) equivalent to the color/s provided.
#
# Where:
#
# hexadecimals   Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# tempK          Should be an integer [1000-27000] indicating the balancing temperature.
#                *tempK* must be provided in Kelvins.
#
# depth          Optional, should be an integer specifing the color depth of the colors provided.
#                Allowed values are **8**, **12** or **16**.
#
#                If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the words **black** or **white**, depending which one has more contrast with the relative color provided.
proc ::ms::color::Balance { hexadecimals tempK { depth "" } } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'tempK' provided.
    switch -- [string is integer -strict $tempK] {
        0   { ::ms::Error "Invalid value, '$tempK'." $caller_info }
        1   {
            # Truncate it if exceeds its limits [1000,27000].
            if { $tempK < 1000.0 } {
                set tempK 1000.0
            } elseif { $tempK > 27000.0 } {
                set tempK 27000.0
            }
        }
    }

    # Check the 'hexadecimals' provided.
    set HEXs [list ]
    foreach hexadecimal $hexadecimals {
        set result [::ms::Check_Hex $hexadecimal $colormodel invalid]
        switch -- $result {
            invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
            default { lappend HEXs $hexadecimal }
        }
    }

    # Transform the hexadecimal color/s (at whichever depth provided) into RGB color/s at 8 bit.
    switch -- $depth {
        8  { set channels [::HEX8_RGB8  $HEXs] }
        12 { set channels [::RGB12_RGB8 [::HEX12_RGB12 $HEXs]] }
        16 { set channels [::RGB16_RGB8 [::HEX16_RGB16 $HEXs]] }
    }

    # Get the RGB channels equivalent for the temperature provided.
    set tempK [expr {$tempK*0.01}]
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
    #        when we will divide for the temp_channel, we will have a problem.

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
    set results [list ]
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

    # Transform the balanced RGB channel/s at 8 bit back into hexadecimal color/s
    # with the same depth as the color/s provided.
    switch -- $depth {
        8  { return [::RGB8_HEX8   $results] }
        12 { return [::RGB12_HEX12 [::RGB8_RGB12 $results]] }
        16 { return [::RGB16_HEX16 [::RGB8_RGB16 $results]] }
    }
}

## BW
#
# Compute which color (between **black** or **white**) has more contrast with the color/s provided.
#
# Where:
#
# hexadecimals   Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth          Optional, should be an integer specifing the color depth of the colors provided.
#                Allowed values are **8**, **12** or **16**.
#
#                If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the words **black** or **white**, depending which one has more contrast with the relative color provided.
proc ::ms::color::BW { hexadecimals { depth ""} } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'hexadecimals' provided.
    set HEXs [list ]
    foreach hexadecimal $hexadecimals {
        set result [::ms::Check_Hex $hexadecimal $colormodel invalid]
        switch -- $result {
            invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
            default { lappend HEXs $hexadecimal }
        }
    }

    # Transform the hexadecimal color/s provided into rgb color/s [0,1.0].
    switch -- $depth {
        8  { set channels [::RGB8_rgb  [::HEX8_RGB8   $HEXs]] }
        12 { set channels [::RGB12_rgb [::HEX12_RGB12 $HEXs]] }
        16 { set channels [::RGB16_rgb [::HEX16_RGB16 $HEXs]] }
    }

    # Execute the command.
    set results [list ]
    foreach { r g b } $channels {
        # Trasform the *non-linear* rgb value into a *linear* rgb one.
        set r_linear [::ms::companding::Operation $r inverse]
        set g_linear [::ms::companding::Operation $g inverse]
        set b_linear [::ms::companding::Operation $b inverse]

        # Compute the luma of the rgb *linear* color.
        set luma [expr { ($::ms::data(sRGB_D65,Yr)*$r_linear)+($::ms::data(sRGB_D65,Yg)*$g_linear)+($::ms::data(sRGB_D65,Yb)*$b_linear) }]

        # Confront the rgb *linear* color contrast values (against 'black' and 'white').
        if { [expr { ($luma+0.05)*20.0 }] > [expr { 1.05/($luma+0.05) }] } {
            lappend results black
        } else {
            lappend results white
        }
    }
}

## Colorlist
#
# Return a list containing all the colornames available for the family and palette provided.
#
# Where:
#
# family    Should be a string specifing the family name.
#           Allowed values are:
#
#              **gray** or **grey**
#              **red**
#              **red-orange**
#              **orange**
#              **orange-yellow**
#              **yellow**
#              **yellow-green**
#              **green**
#              **green-cyan**
#              **cyan**
#              **cyan-blue**
#              **blue**
#              **blue-purple**
#              **purple**
#              **purple-red**
#              **all**
#
# palette   Optional, should be a string specifing the palette name.
#           If not provided, defaults to the 'mustang' palette.
#
# Returns a list containing all the colornames available for the family and palette provided.
proc ::ms::color::Colorlist { family { palette "" } } {
    # Check the 'palette' name provided.
    set palette_name [string tolower $palette]
    switch -- $palette_name {
        ""      { set palette_name mustang }
        default {
            if { $palette_name ni $::ms::palette(names) } {
                ::ms::Error "Invalid palette name, '$palette'." $caller_info
            }
        }
    }

    # Check the 'family' provided.
    switch -nocase -- $family {
        grey          -
        gray          { set family gray          }
        red           { set family red           }
        red-orange    { set family red-orange    }
        orange        { set family orange        }
        orange-yellow { set family orange-yellow }
        yellow        { set family yellow        }
        yellow-green  { set family yellow-green  }
        green         { set family green         }
        green-cyan    { set family green-cyan    }
        cyan          { set family cyan          }
        cyan-blue     { set family cyan-blue     }
        blue          { set family blue          }
        blue-purple   { set family blue-purple   }
        purple        { set family purple        }
        purple-red    { set family purple-red    }
        all           { set family all           }
        default       { ::ms::Error "Invalid family name, '$family'." $caller_info }
    }

    # Execute the command.
    return [lsort -dictionary -increasing -unique $::ms::palette($palette_name,$family,colornames)]
}

## Complement
#
# Compute the complements of the color/s provided.
#
# Where:
#
# hexadecimals   Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth          Optional, should be an integer specifing the color depth of the colors provided.
#                Allowed values are **8**, **12** or **16**.
#
#                If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the complements of the color/s provided.
proc ::ms::color::Complement { hexadecimals { depth ""} } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'hexadecimals' provided.
    set HEXs [list ]
    foreach hexadecimal $hexadecimals {
        set result [::ms::Check_Hex $hexadecimal $colormodel invalid]
        switch -- $result {
            invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
            default { lappend HEXs $hexadecimal }
        }
    }

    # Transform the hexadecimal color/s provided into RGB color/s.
    switch -- $depth {
        8  { set channels [::HEX8_RGB8   $HEXs] }
        12 { set channels [::HEX12_RGB12 $HEXs] }
        16 { set channels [::HEX16_RGB16 $HEXs] }
    }

    # Execute the command.
    set results [list ]
    foreach { red green blue } $channels {
        set min [expr { min($red,$green,$blue) }]
        set max [expr { max($red,$green,$blue) }]
        set sum [expr { $min+$max} ]

        set red   [expr {$sum-$red}]
        set green [expr {$sum-$green}]
        set blue  [expr {$sum-$blue}]

        lappend results $red $green $blue
    }

    # Transform the resulting RGB color/s back into hexadecimal color/s.
    switch -- $depth {
        8  { return [::RGB8_HEX8   $results] }
        12 { return [::RGB12_HEX12 $results] }
        16 { return [::RGB16_HEX16 $results] }
    }
}

## Contrast
#
# Compute the contrast value [0,21] between the two colors provided.
#
# Where:
#
# color1   Should be the first hexadecimal color that will be involved in the process.
#          This color will be processed as the 'background' color.
#
# color2   Should be the second hexadecimal color that will be involved in the process.
#          This color will be processed as the 'foreground' color.
#
# depth    Optional, should be an integer specifing the color depth of the colors provided.
#          Allowed values are **8**, **12** or **16**.
#
#          If not provided, defaults to the '::ms::colordepth' value.
#
# Returns the contrast value [0,21] between the two colors provided.
proc ::ms::color::Contrast { color1 color2 {depth ""} } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'hexadecimals' provided.
    set hex1 [::ms::Check_Hex $color1 $colormodel invalid]
    switch -- $result {
        invalid { ::ms::Error "Invalid color, '$color1'." $caller_info }
    }

    set hex2 [::ms::Check_Hex $color2 $colormodel invalid]
    switch -- $result {
        invalid { ::ms::Error "Invalid color, '$color2'." $caller_info }
    }

    # Transform the hexadecimal color/s into rgb colors [0,1.0].
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

    # Compute the luma of the first color.
    # Trasform the *non-linear* rgb values into a *linear* rgb ones.
    foreach { r1 g1 b1 } $rgb1 {
        set r1_linear [::ms::companding::Operation $r1 inverse]
        set g1_linear [::ms::companding::Operation $g1 inverse]
        set b1_linear [::ms::companding::Operation $b1 inverse]
    }

    foreach { r2 g2 b2 } $rgb2 {
        set r2_linear [::ms::companding::Operation $r2 inverse]
        set g2_linear [::ms::companding::Operation $g2 inverse]
        set b2_linear [::ms::companding::Operation $b2 inverse]
    }

    # Compute the two colors lumas.
    set luma1 [expr { ($::ms::data(sRGB_D65,Yr)*$r1_linear)+($::ms::data(sRGB_D65,Yg)*$g1_linear)+($::ms::data(sRGB_D65,Yb)*$b1_linear) }]
    set luma2 [expr { ($::ms::data(sRGB_D65,Yr)*$r2_linear)+($::ms::data(sRGB_D65,Yg)*$g2_linear)+($::ms::data(sRGB_D65,Yb)*$b2_linear) }]

    # Compute the contrast value.
    if { $luma1 > $luma2 } {
        return [expr { ($luma1+0.05)/($luma2+0.05) }]
    } else {
        return [expr { ($luma2+0.05)/($luma1+0.05) }]
    }
}

## Cooldown
#
# Compute the cooler version of the color/s provided.
#
# Where:
#
# hexadecimals   Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# amount         Should be the amount of cool to achieve.
#                This amount is always evaluated as a percentage [0,100%] and can be provided with or without the '%' symbol.
#
# depth          Optional, should be an integer specifing the color depth of the colors provided.
#                Allowed values are **8**, **12** or **16**.
#
#                If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the cooled down color/s equivalent to the color/s provided.
proc ::ms::color::Cooldown { hexadecimals amount { depth "" } } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'amount' provided.
    set amount_value [string trimright $amount %]
    switch -- [string is double -strict $amount] {
        0   { ::ms::Error "Invalid value, '$amount'." $caller_info }
        1   {
            if { $amount_value < 0 } {
                set amount_value 0
            } elseif { $amount_value > 100.0 } {
                set amount_value 100.0
            }
        }
    }
    set amount $amount_value

    # Check the 'hexadecimals' provided.
    set HEXs [list ]
    foreach hexadecimal $hexadecimals {
        set result [::ms::Check_Hex $hexadecimal $colormodel invalid]
        switch -- $result {
            invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
            default { lappend HEXs $hexadecimal }
        }
    }

    # Execute the command.
    set results [list ]
    switch -- $colormodel {
        HEX8 {
            # Transform the amount from [0,100] to [0,255].
            set amount [expr { round($amount*2.55) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX8_RGB8 $HEXs]

            # Compute the hotter color/s.
            foreach { red green blue } $channels {
                set red  [expr { $red-$amount } ]
                set blue [expr { $blue+$amount }]

                if { $red < 0 } {
                    set red 0
                }

                if { $blue > 255 } {
                    set blue 255
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB8_HEX8 $results]
        }
        HEX12 {
            # Transform the amount from [0,100] to [0,4095].
            set amount [expr { round($amount*40.95) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX12_RGB12 $HEXs]

            # Compute the hotter color/s.
            foreach { red green blue } $channels {
                set red  [expr { $red-$amount } ]
                set blue [expr { $blue+$amount }]

                if { $red < 0 } {
                    set red 0
                }

                if { $blue > 4095 } {
                    set blue 4095
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB12_HEX12 $results]
        }
        HEX16 {
            # Transform the amount from [0,100] to [0,65535].
            set amount [expr { round($amount*655.35) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX16_RGB16 $HEXs]

            # Compute the hotter color/s.
            foreach { red green blue } $channels {
                set red  [expr { $red-$amount } ]
                set blue [expr { $blue+$amount }]

                if { $red < 0 } {
                    set red 0
                }

                if { $blue > 65535 } {
                    set blue 65535
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB16_HEX16 $results]
        }
    }
}

## Family
#
# Compute the family of the color/s provided.
#
# Where:
#
# hexadecimals   Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth          Optional, should be an integer specifing the color depth of the colors provided.
#                Allowed values are **8**, **12** or **16**.
#
#                If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the family of the color/s provided.
proc ::ms::color::Family { hexadecimals { depth "" } } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'hexadecimals' provided.
    set HEXs [list ]
    foreach hexadecimal $hexadecimals {
        set result [::ms::Check_Hex $hexadecimal $colormodel invalid]
        switch -- $result {
            invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
            default { lappend HEXs $hexadecimal }
        }
    }

    # Transform the hexadecimal color/s provided into RGB color/s.
    switch -- $depth {
        8  { set channels [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
        12 { set channels [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
        16 { set channels [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
    }

    # Execute the command.
    set results [list ]
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
# Compute the gray equivalent/s of the color/s provided.
#
# Where:
#
# hexadecimals   Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# via            Should be a string indicating the 'via' to use to achieve the results.
#                Allowed values are:
#
#                   **average**
#                   **desaturation**
#                   **hevc**
#                   **max**
#                   **min**
#                   **red**
#                   **green**
#                   **blue**
#
# depth          Optional, should be an integer specifing the color depth of the colors provided.
#                Allowed values are **8**, **12** or **16**.
#
#                If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the family of the color/s provided.
proc ::ms::color::Gray { hexadecimals via { depth "" } } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'via' provided.
    switch -- $via {
        average      -
        desaturation -
        hevc         -
        max          -
        min          -
        red          -
        green        -
        blue         {}
        default      { ::ms::Error "Invalid value, '$via'." $caller_info }
    }

    # Check the 'hexadecimals' provided.
    set HEXs [list ]
    foreach hexadecimal $hexadecimals {
        set result [::ms::Check_Hex $hexadecimal $colormodel invalid]
        switch -- $result {
            invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
            default { lappend HEXs $hexadecimal }
        }
    }

    # Transform the hexadecimal color/s provided into RGB color/s.
    switch -- $depth {
        8  { set channels [::HEX8_RGB8   $HEXs] }
        12 { set channels [::HEX12_RGB12 $HEXs] }
        16 { set channels [::HEX16_RGB16 $HEXs] }
    }

    # Execute the command.
    set results [list ]
    switch -- $via {
        average {
            # Note that for performance reasons instead of diving the sum by '3', we multiply it by '0.33333333333333333'.
            foreach { red green blue } $channels {
                set gray [expr { round(($red+$green+$blue)*0.33333333333333333) }]

                lappend results $gray $gray $gray
            }
        }
        blue {
            foreach { red green blue } $channels {
                lappend results $blue $blue $blue
            }
        }
        desaturation {
            # Note that for performance reasons instead of diving the sum by '2', we multiply it by '0.5'.
            foreach { red green blue } $channels {
                set min  [expr { min($red,$green,$blue) }]
                set max  [expr { max($red,$green,$blue) }]
                set gray [expr { round(($max+$min)*0.5) }]

                lappend results $gray $gray $gray
            }
        }
        green {
            foreach { red green blue } $channels {
                lappend results $green $green $green
            }
        }
        hevc {
            # HEVC --> Human Eye Vision Corrected gray.

            # Transform the RGB color/s into rgb color/s.
            switch -- $depth {
                8  { set rgbs [::RGB8_rgb  $channels] }
                12 { set rgbs [::RGB12_rgb $channels] }
                16 { set rgbs [::RGB16_rgb $channels] }
            }

            # Compute the gray rgb *linear* color/s.
            set gray [list ]
            foreach { r g b } $rgbs {
                set r_linear [::ms::companding::Operation $r inverse]
                set g_linear [::ms::companding::Operation $g inverse]
                set b_linear [::ms::companding::Operation $b inverse]

                # Compute the *linear* gray.
                set gray_linear [expr { ($::ms::data(sRGB_D65,Yr)*$r_linear)+($::ms::data(sRGB_D65,Yg)*$g_linear)+($::ms::data(sRGB_D65,Yb)*$b_linear) }]

                # Trasform the *linear* gray into *non-linear* gray.
                set gray [::ms::companding::Operation $gray_linear normal]

                lappend grays $gray $gray $gray
            }

            # Transform the gray rgb *non linear* color/s back into RGB color/s.
            switch -- $depth {
                8  { set results [::rgb_RGB8  $grays] }
                12 { set results [::rgb_RGB12 $grays] }
                16 { set results [::rgb_RGB16 $grays] }
            }
        }
        max {
            foreach { red green blue } $channels {
                set gray [expr { max($red,$green,$blue) }]

                lappend results $gray $gray $gray
            }
        }
        min {
            foreach { red green blue } $channels {
                set gray [expr { min($red,$green,$blue) }]

                lappend results $gray $gray $gray
            }
        }
        red {
            foreach { red green blue } $channels {
                lappend results $red $red $red
            }
        }
    }

    # Transform the resulting RGB color/s back into hexadecimal color/s.
    switch -- $depth {
        8  { return [::RGB8_HEX8   $results] }
        12 { return [::RGB12_HEX12 $results] }
        16 { return [::RGB16_HEX16 $results] }
    }
}

## Inverse
#
# Compute the inverse of the color/s provided.
#
# Where:
#
# hexadecimals   Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth          Optional, should be an integer specifing the color depth of the colors provided.
#                Allowed values are **8**, **12** or **16**.
#
#                If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the inverse of the color/s provided.
proc ::ms::color::Inverse { hexadecimals { depth ""} } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'hexadecimals' provided.
    set HEXs [list ]
    foreach hexadecimal $hexadecimals {
        set result [::ms::Check_Hex $hexadecimal $colormodel invalid]
        switch -- $result {
            invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
            default { lappend HEXs $hexadecimal }
        }
    }

    # Execute the command.
    set results [list ]
    switch -- $depth {
        8   {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX8_RGB8 $HEXs]

            # Compute the inverse color/s.
            foreach { red green blue } $channels {
                set red   [expr { 255-$red }]
                set green [expr { 255-$green }]
                set blue  [expr { 255-$blue }]

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB8_HEX8 $results]
        }
        12  {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX12_RGB12 $HEXs]

            # Compute the inverse color/s.
            foreach { red green blue } $channels {
                set red   [expr { 4095-$red }]
                set green [expr { 4095-$green }]
                set blue  [expr { 4095-$blue }]

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB12_HEX12 $results]
        }
        16  {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX16_RGB16 $HEXs]

            # Compute the inverse color/s.
            foreach { red green blue } $channels {
                set red   [expr { 65535-$red }]
                set green [expr { 65535-$green }]
                set blue  [expr { 65535-$blue }]

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB16_HEX16 $results]
        }
    }
}

## Warmup
#
# Compute the hotter version of the color/s provided.
#
# Where:
#
# hexadecimals   Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# amount         Should be the amount of hot to achieve.
#                This amount is always evaluated as a percentage [0,100%] and can be provided with or without the '%' symbol.
#
# depth          Optional, should be an integer specifing the color depth of the colors provided.
#                Allowed values are **8**, **12** or **16**.
#
#                If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the warmup color/s equivalent to the color/s provided.
proc ::ms::color::Warmup { hexadecimals amount { depth "" } } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'amount' provided.
    set amount_value [string trimright $amount %]
    switch -- [string is double -strict $amount] {
        0   { ::ms::Error "Invalid value, '$amount'." $caller_info }
        1   {
            if { $amount_value < 0 } {
                set amount_value 0
            } elseif { $amount_value > 100.0 } {
                set amount_value 100.0
            }
        }
    }
    set amount $amount_value

    # Check the 'hexadecimals' provided.
    set HEXs [list ]
    foreach hexadecimal $hexadecimals {
        set result [::ms::Check_Hex $hexadecimal $colormodel invalid]
        switch -- $result {
            invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
            default { lappend HEXs $hexadecimal }
        }
    }

    # Execute the command.
    set results [list ]
    switch -- $colormodel {
        HEX8 {
            # Transform the amount from [0,100] to [0,255].
            set amount [expr { round($amount*2.55) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX8_RGB8 $HEXs]

            # Compute the hotter color/s.
            foreach { red green blue } $channels {
                set red  [expr { $red+$amount } ]
                set blue [expr { $blue-$amount }]

                if { $red > 255 } {
                    set red 255
                }

                if { $blue < 0 } {
                    set blue 0
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB8_HEX8 $results]
        }
        HEX12 {
            # Transform the amount from [0,100] to [0,4095].
            set amount [expr { round($amount*40.95) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX12_RGB12 $HEXs]

            # Compute the hotter color/s.
            foreach { red green blue } $channels {
                set red  [expr { $red+$amount } ]
                set blue [expr { $blue-$amount }]

                if { $red > 4095 } {
                    set red 4095
                }

                if { $blue < 0 } {
                    set blue 0
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB12_HEX12 $results]
        }
        HEX16 {
            # Transform the amount from [0,100] to [0,65535].
            set amount [expr { round($amount*655.35) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX16_RGB16 $HEXs]

            # Compute the hotter color/s.
            foreach { red green blue } $channels {
                set red  [expr { $red+$amount } ]
                set blue [expr { $blue-$amount }]

                if { $red > 65535 } {
                    set red 65535
                }

                if { $blue < 0 } {
                    set blue 0
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB16_HEX16 $results]
        }
    }
}

## WCGA_2.0
#
# Compute the WCGA 2.0 scenarios between the two colors provided.
#
# WCGA 2.0 scenarios explained:
#
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
#
# Where:
#
# color1   Should be the first hexadecimal color that will be involved in the process.
#          This color will be processed as the 'background' color.
#
# color2   Should be the second hexadecimal color that will be involved in the process.
#          This color will be processed as the 'foreground' color.
#
# depth    Optional, should be an integer specifing the color depth of the colors provided.
#          Allowed values are **8**, **12** or **16**.
#
#          If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the WCGA 2.0 scenarios results of the contrast between the two colors provided.
proc ::ms::color::WCGA_2.0 { color1 color2 { depth "" } } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'hexadecimals' provided.
    set hex1 [::ms::Check_Hex $color1 $colormodel invalid]
    switch -- $result {
        invalid { ::ms::Error "Invalid color, '$color1'." $caller_info }
    }

    set hex2 [::ms::Check_Hex $color2 $colormodel invalid]
    switch -- $result {
        invalid { ::ms::Error "Invalid color, '$color2'." $caller_info }
    }

    # Transform the hexadecimal color/s into rgb colors [0,1.0].
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

    # Compute the luma of the first color.
    # Trasform the *non-linear* rgb values into a *linear* rgb ones.
    foreach { r1 g1 b1 } $rgb1 {
        set r1_linear [::ms::companding::Operation $r1 inverse]
        set g1_linear [::ms::companding::Operation $g1 inverse]
        set b1_linear [::ms::companding::Operation $b1 inverse]
    }

    foreach { r2 g2 b2 } $rgb2 {
        set r2_linear [::ms::companding::Operation $r2 inverse]
        set g2_linear [::ms::companding::Operation $g2 inverse]
        set b2_linear [::ms::companding::Operation $b2 inverse]
    }

    # Compute the two colors lumas.
    set luma1 [expr { ($::ms::data(sRGB_D65,Yr)*$r1_linear)+($::ms::data(sRGB_D65,Yg)*$g1_linear)+($::ms::data(sRGB_D65,Yb)*$b1_linear) }]
    set luma2 [expr { ($::ms::data(sRGB_D65,Yr)*$r2_linear)+($::ms::data(sRGB_D65,Yg)*$g2_linear)+($::ms::data(sRGB_D65,Yb)*$b2_linear) }]

    # Compute the contrast value.
    if { $luma1 > $luma2 } {
        set contrast [expr { ($luma1+0.05)/($luma2+0.05) }]
    } else {
        set contrast [expr { ($luma2+0.05)/($luma1+0.05) }]
    }

    # Compute if there is enough contrast between the first color (the 'background') and
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

## Websafe
#
# Compute the websafe version of the color/s provided.
#
# Where:
#
# hexadecimals   Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth          Optional, should be an integer specifing the color depth of the colors provided.
#                Allowed values are **8**, **12** or **16**.
#
#                If not provided, defaults to the '::ms::colordepth' value.
#
# Returns a list containing the websafe color/s equivalent to the color/s provided.
proc ::ms::color::Websafe { hexadecimals { depth "" } } {
    # Check the 'depth' provided, if any.
    switch -- $depth {
        ""  {
            # Set the 'colormodel'.
            switch -- $::ms::colordepth {
                8   { set colormodel HEX8 }
                12  { set colormodel HEX12 }
                16  { set colormodel HEX16 }
            }
        }
        8       { set colormodel HEX8 }
        12      { set colormodel HEX12 }
        16      { set colormodel HEX16 }
        default { ::ms::Error "Invalid value, '$depth'." $caller_info }
    }

    # Check the 'hexadecimals' provided.
    set HEXs [list ]
    foreach hexadecimal $hexadecimals {
        set result [::ms::Check_Hex $hexadecimal $colormodel invalid]
        switch -- $result {
            invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
            default { lappend HEXs $hexadecimal }
        }
    }

    # Execute the command.
    set results [list ]
    switch -- $colormodel {
        HEX8 {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX8_RGB8 $HEXs]

            # Compute the websafe color/s.
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

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB8_HEX8 $results]
        }
        HEX12 {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX12_RGB12 $HEXs]

            # Compute the websafe color/s.
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

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB12_HEX12 $results]
        }
        HEX16 {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX16_RGB16 $HEXs]

            # Compute the websafe color/s.
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

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB16_HEX16 $results]
        }
    }
}















# sRGB D65 Unadapted values.
set ::ms::data(sRGB_D65,Yr) 0.212656
set ::ms::data(sRGB_D65,Yg) 0.715158
set ::ms::data(sRGB_D65,Yb) 0.072186

# sRGB D65 RGB_XYZ matrix.
#
# | 0.43603515625       0.3851165771484375  0.1430511474609375 |   | a1 b1 c1 |
# | 0.2224884033203125  0.7169036865234375  0.06060791015625   | = | a2 b2 c2 | = [list a1 a2 a3 b1 b2 b3 c1 c2 c3]
# | 0.013916015625      0.0970611572265625  0.7139129638671875 |   | a3 b3 c3 |
set ::ms::data(sRGB_D65,RGB_XYZ) [list 0.43603515625 \
                                       0.2224884033203125 \
                                       0.013916015625 \
                                       0.3851165771484375 \
                                       0.7169036865234375 \
                                       0.0970611572265625 \
                                       0.1430511474609375 \
                                       0.06060791015625 \
                                       0.7139129638671875];

# sRGB D65 XYZ_RGB matrix.
#
# | 3.134274306471669   -1.617274016967423   -0.4907348029960735 |   | a1 b1 c1 |
# | -0.978795574325203  1.916161596468483    0.03345405023031962 | = | a2 b2 c2 | = [list a1 a2 a3 b1 b2 b3 c1 c2 c3]
# | 0.071978551323668   -0.2289898906034097  1.4057483687096277  |   | a3 b3 c3 |
set ::ms::data(sRGB_D65,XYZ_RGB) [list 3.134274306471669 \
                                       -0.978795574325203 \
                                       0.071978551323668 \
                                       -1.617274016967423 \
                                       1.916161596468483 \
                                       -0.2289898906034097 \
                                       -0.4907348029960735 \
                                       0.03345405023031962 \
                                       1.4057483687096277];

# Note:  CVD matrix coefficients for Protanomaly, Deuteranomaly and Tritanomaly (ordered by severity [0,100%]):
#           | a1 b1 c1 |
#           | a2 b2 c2 | = [list a1 a2 a3 b1 b2 b3 c1 c2 c3]
#           | a3 b3 c3 |

# Protanomaly CVD matrices                            a1        a2        a3        b1       b2        b3        c1       c2       c3
dict set ::ms::table(cvd) 0     Protanomaly     [list 1.0       0         0         0        1.0       0         0        0        1.0]
dict set ::ms::table(cvd) 10.0  Protanomaly     [list 0.856167  0.029342 -0.002880  0.182038 0.955115 -0.001563 -0.038205 0.015544 1.004443]
dict set ::ms::table(cvd) 20.0  Protanomaly     [list 0.734766  0.051840 -0.004928  0.334872 0.919198 -0.004209 -0.069637 0.028963 1.009137]
dict set ::ms::table(cvd) 30.0  Protanomaly     [list 0.630323  0.069181 -0.006308  0.465641 0.890046 -0.007724 -0.095964 0.040773 1.014032]
dict set ::ms::table(cvd) 40.0  Protanomaly     [list 0.539009  0.082546 -0.007136  0.579343 0.866121 -0.011959 -0.118352 0.051332 1.019095]
dict set ::ms::table(cvd) 50.0  Protanomaly     [list 0.458064  0.092785 -0.007494  0.679578 0.846313 -0.016807 -0.137642 0.060902 1.024301]
dict set ::ms::table(cvd) 60.0  Protanomaly     [list 0.385450  0.100526 -0.007442  0.769005 0.829802 -0.022190 -0.154455 0.069673 1.029632]
dict set ::ms::table(cvd) 70.0  Protanomaly     [list 0.319627  0.106241 -0.007025  0.849633 0.815969 -0.028051 -0.169261 0.077790 1.035076]
dict set ::ms::table(cvd) 80.0  Protanomaly     [list 0.259411  0.110296 -0.006276  0.923008 0.804340 -0.034346 -0.182420 0.085364 1.040622]
dict set ::ms::table(cvd) 90.0  Protanomaly     [list 0.203876  0.112975 -0.005222  0.990338 0.794542 -0.041043 -0.194214 0.092483 1.046265]
dict set ::ms::table(cvd) 100.0 Protanomaly     [list 0.152286  0.114503 -0.003882  1.052583 0.786281 -0.048116 -0.204868 0.099216 1.051998]

# Deuteranomaly CVD matrices                          a1        a2        a3        b1       b2        b3        c1       c2       c3
dict set ::ms::table(cvd) 0     Deuteranomaly   [list 1.0       0         0         0        1.0       0         0        0        1.0]
dict set ::ms::table(cvd) 10.0  Deuteranomaly   [list 0.866435  0.049567 -0.003453  0.177704 0.939063  0.007233 -0.044139 0.011370 0.996220]
dict set ::ms::table(cvd) 20.0  Deuteranomaly   [list 0.760729  0.090568 -0.006027  0.319078 0.889315  0.013325 -0.079807 0.020117 0.992702]
dict set ::ms::table(cvd) 30.0  Deuteranomaly   [list 0.675425  0.125303 -0.007950  0.433850 0.847755  0.018572 -0.109275 0.026942 0.989378]
dict set ::ms::table(cvd) 40.0  Deuteranomaly   [list 0.605511  0.155318 -0.009376  0.528560 0.812366  0.023176 -0.134071 0.032316 0.986200]
dict set ::ms::table(cvd) 50.0  Deuteranomaly   [list 0.547494  0.181692 -0.010410  0.607765 0.781742  0.027275 -0.155259 0.036566 0.983136]
dict set ::ms::table(cvd) 60.0  Deuteranomaly   [list 0.498864  0.205199 -0.011131  0.674741 0.754872  0.030969 -0.173604 0.039929 0.980162]
dict set ::ms::table(cvd) 70.0  Deuteranomaly   [list 0.457771  0.226409 -0.011595  0.731899 0.731012  0.034333 -0.189670 0.042579 0.977261]
dict set ::ms::table(cvd) 80.0  Deuteranomaly   [list 0.422823  0.245752 -0.011843  0.781057 0.709602  0.037423 -0.203881 0.044646 0.974421]
dict set ::ms::table(cvd) 90.0  Deuteranomaly   [list 0.392952  0.263559 -0.011910  0.823610 0.690210  0.040281 -0.216562 0.046232 0.971630]
dict set ::ms::table(cvd) 100.0 Deuteranomaly   [list 0.367322  0.280085 -0.011820  0.860646 0.672501  0.042940 -0.227968 0.047413 0.968881]

# Tritanomaly CVD matrices                            a1        a2        a3        b1       b2        b3        c1       c2       c3
dict set ::ms::table(cvd) 0     Tritanomaly     [list 1.0       0         0         0        1.0       0         0        0        1.0]
dict set ::ms::table(cvd) 10.0  Tritanomaly     [list 0.926670  0.021191  0.008437  0.092514 0.964503  0.054813 -0.019184 0.014306 0.936750]
dict set ::ms::table(cvd) 20.0  Tritanomaly     [list 0.895720  0.029997  0.013027  0.133330 0.945400  0.104707 -0.029050 0.024603 0.882266]
dict set ::ms::table(cvd) 30.0  Tritanomaly     [list 0.905871  0.026856  0.013410  0.127791 0.941251  0.148296 -0.033662 0.031893 0.838294]
dict set ::ms::table(cvd) 40.0  Tritanomaly     [list 0.948035  0.014364  0.010853  0.089490 0.946792  0.193991 -0.037526 0.038844 0.795156]
dict set ::ms::table(cvd) 50.0  Tritanomaly     [list 1.017277 -0.006113  0.006379  0.027029 0.958479  0.248708 -0.044306 0.047634 0.744913]
dict set ::ms::table(cvd) 60.0  Tritanomaly     [list 1.104996 -0.032137  0.001336 -0.046633 0.971635  0.317922 -0.058363 0.060503 0.680742]
dict set ::ms::table(cvd) 70.0  Tritanomaly     [list 1.193214 -0.058496 -0.002346 -0.109812 0.979410  0.403492 -0.083402 0.079086 0.598854]
dict set ::ms::table(cvd) 80.0  Tritanomaly     [list 1.257728 -0.078003 -0.003316 -0.139648 0.975409  0.501214 -0.118081 0.102594 0.502102]
dict set ::ms::table(cvd) 90.0  Tritanomaly     [list 1.278864 -0.084748 -0.000989 -0.125333 0.957674  0.601151 -0.153531 0.127074 0.399838]
dict set ::ms::table(cvd) 100.0 Tritanomaly     [list 1.255528 -0.078411  0.004733 -0.076749 0.930809  0.691367 -0.178779 0.147602 0.303900]

#*EOF*