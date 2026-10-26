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

    # Set some default values.
    set amount   1
    set depth    $::ms::colordepth
    set severity 100
    set tempK    6500

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        balance {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   -
                5   {
                    set hexadecimals [lindex  $args 0]
                    set args         [lremove $args 0]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Balance $HEXs $tempK $depth]
        }
        bw  {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   {
                    set hexadecimals [lindex $args 0]
                    set option       [lindex $args 1]
                    set value        [lindex $args 2]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::BW $HEXs $depth]
        }
        complement {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   {
                    set hexadecimals [lindex $args 0]
                    set option       [lindex $args 1]
                    set value        [lindex $args 2]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Complement $HEXs $depth]
        }
        contrast {
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

            # Check the 'hexadecimals' provided.
            set hex1 [::ms::Check_Hex $color1 [string cat "HEX" $depth] invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid color, '$color1'." $caller_info }
            }

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
                                    HEX8    -
                                    HEX12   -
                                    HEX16   -
                                    RGB8    -
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
                                    HEX8    -
                                    HEX12   -
                                    HEX16   -
                                    RGB8    -
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
        cooldown {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   -
                5   {
                    set hexadecimals [lindex  $args 0]
                    set args         [lremove $args 0]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Cooldown $HEXs $amount $depth]
        }
        darken {
            # Set the default 'via' for this action.
            set via Lab

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   -
                5   -
                7   {
                    set hexadecimals [lindex  $args 0]
                    set args         [lremove $args 0]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Darken $HEXs $amount $via $depth]
        }
        deficiency {
            # Set the default 'via' for this action.
            set via achromatic

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   -
                5   -
                7   {
                    set hexadecimals [lindex  $args 0]
                    set args         [lremove $args 0]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Deficiency $HEXs $severity $via $depth]
        }
        desaturate {
            # Set the default 'via' for this action.
            set via HSB

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   -
                5   -
                7   {
                    set hexadecimals [lindex  $args 0]
                    set args         [lremove $args 0]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Desaturate $HEXs $amount $via $depth]
        }
        family {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   {
                    set hexadecimals [lindex $args 0]
                    set option       [lindex $args 1]
                    set value        [lindex $args 2]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Family $HEXs $depth]
        }
        gray -
        grey {
            # Set the default 'via' for this action.
            set via hevc

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   -
                5   {
                    set hexadecimals [lindex  $args 0]
                    set args         [lremove $args 0]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Gray $HEXs $via $depth]
        }
        inverse {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   {
                    set hexadecimals [lindex $args 0]
                    set option       [lindex $args 1]
                    set value        [lindex $args 2]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Inverse $HEXs $depth]
        }
        lighten {
            # Set the default 'via' for this action.
            set via Lab

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   -
                5   -
                7   {
                    set hexadecimals [lindex  $args 0]
                    set args         [lremove $args 0]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            return [::ms::color::Lighten $HEXs $amount $via $depth]
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
            # Set the default 'via' for this action.
            set via HSB

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   -
                5   -
                7   {
                    set hexadecimals [lindex  $args 0]
                    set args         [lremove $args 0]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Saturate $HEXs $amount $via $depth]
        }
        warmup {
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   -
                5   {
                    set hexadecimals [lindex  $args 0]
                    set args         [lremove $args 0]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Execute the command.
            return [::ms::color::Warmup $HEXs $amount $depth]
        }
        wcga2.0 {
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

            # Check the 'hexadecimals' provided.
            set hex1 [::ms::Check_Hex $color1 [string cat "HEX" $depth] invalid]
            switch -- $result {
                invalid { ::ms::Error "Invalid color, '$color1'." $caller_info }
            }

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
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   { set hexadecimals $args }
                3   {
                    set hexadecimals [lindex $args 0]
                    set option       [lindex $args 1]
                    set value        [lindex $args 2]

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

            # Check the 'hexadecimals' provided.
            set HEXs [list ]
            foreach hexadecimal $hexadecimals {
                set result [::ms::Check_Hex $hexadecimal [string cat "HEX" $depth] invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            return [::ms::color::Websafe $HEXs $depth]
        }
        default { ::ms::Error "Invalid action, '$action'." $caller_info }
    }
}

## Balance
#
# Compute the hexadecimals balanced color/s (for the temperature provided) relative to the color/s provided.
#
# Where:
#
# HEXs    Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# tempK   Should be an integer [1000-27000] indicating the balancing temperature.
#         *tempK* must be provided in Kelvins.
#
# depth   Should be an integer specifing the color depth in which the color/s provided are defined.
#         Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals balanced color/s (for the temperature provided) relative to the color/s provided.
proc ::ms::color::Balance { HEXs tempK depth } {
    # Transform the hexadecimal color/s (at whichever depth provided) into RGB color/s at 8 bit.
    switch -- $depth {
        8   { set channels [::HEX8_RGB8  $HEXs] }
        12  { set channels [::RGB12_RGB8 [::HEX12_RGB12 $HEXs]] }
        16  { set channels [::RGB16_RGB8 [::HEX16_RGB16 $HEXs]] }
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
        8   { return [::RGB8_HEX8   $results] }
        12  { return [::RGB12_HEX12 [::RGB8_RGB12 $results]] }
        16  { return [::RGB16_HEX16 [::RGB8_RGB16 $results]] }
    }
}

## BW
#
# Compute which color (between **black** or **white**) has more contrast with the color/s provided.
#
# Where:
#
# HEXs    Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth   Should be an integer specifing the color depth in which the color/s provided are defined.
#         Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the words **black** or **white**, depending which one has more contrast with the relative color provided.
proc ::ms::color::BW { HEXs depth } {
    # Transform the hexadecimal color/s provided into rgb color/s [0,1.0].
    switch -- $depth {
        8   { set channels [::RGB8_rgb  [::HEX8_RGB8   $HEXs]] }
        12  { set channels [::RGB12_rgb [::HEX12_RGB12 $HEXs]] }
        16  { set channels [::RGB16_rgb [::HEX16_RGB16 $HEXs]] }
    }

    # Execute the command.
    set results [list ]
    foreach { r g b } $channels {
        # Trasform the *non-linear* rgb value into a *linear* rgb one.
        set r_linear [::companding $r inverse]
        set g_linear [::companding $g inverse]
        set b_linear [::companding $b inverse]

        # Compute the luma of the rgb *linear* color.
        set luma [expr { ($::ms::data(colorspace,$::ms::colorspace,Yr)*$r_linear)+($::ms::data(colorspace,$::ms::colorspace,Yg)*$g_linear)+($::ms::data(colorspace,$::ms::colorspace,Yb)*$b_linear) }]

        # Confront the rgb *linear* color contrast values (against 'black' and 'white').
        if { [expr { ($luma+0.05)*20.0 }] > [expr { 1.05/($luma+0.05) }] } {
            lappend results black
        } else {
            lappend results white
        }
    }

    return $results
}

## Complement
#
# Compute the hexadecimals complement color/s relative to the color/s provided.
#
# Where:
#
# HEXs    Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth   Should be an integer specifing the color depth in which the color/s provided are defined.
#         Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals complements relative to the color/s provided.
proc ::ms::color::Complement { HEXs depth } {
    # Transform the hexadecimal color/s provided into RGB color/s.
    switch -- $depth {
        8   { set channels [::HEX8_RGB8   $HEXs] }
        12  { set channels [::HEX12_RGB12 $HEXs] }
        16  { set channels [::HEX16_RGB16 $HEXs] }
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
# color1   Should be the first hexadecimal color that will be involved in the process.
#          This color will be processed as the 'background' color.
#
# color2   Should be the second hexadecimal color that will be involved in the process.
#          This color will be processed as the 'foreground' color.
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns the contrast value [0,21] between the two colors provided.
proc ::ms::color::Contrast { color1 color2 depth } {
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
        set r1_linear [::companding $r1 inverse]
        set g1_linear [::companding $g1 inverse]
        set b1_linear [::companding $b1 inverse]
    }

    foreach { r2 g2 b2 } $rgb2 {
        set r2_linear [::companding $r2 inverse]
        set g2_linear [::companding $g2 inverse]
        set b2_linear [::companding $b2 inverse]
    }

    # Compute the two colors lumas.
    set luma1 [expr { ($::ms::data(colorspace,$::ms::colorspace,Yr)*$r1_linear)+($::ms::data(colorspace,$::ms::colorspace,Yg)*$g1_linear)+($::ms::data(colorspace,$::ms::colorspace,Yb)*$b1_linear) }]
    set luma2 [expr { ($::ms::data(colorspace,$::ms::colorspace,Yr)*$r2_linear)+($::ms::data(colorspace,$::ms::colorspace,Yg)*$g2_linear)+($::ms::data(colorspace,$::ms::colorspace,Yb)*$b2_linear) }]

    # Compute the contrast value.
    if { $luma1 > $luma2 } {
        return [expr { ($luma1+0.05)/($luma2+0.05) }]
    } else {
        return [expr { ($luma2+0.05)/($luma1+0.05) }]
    }
}

## Convert
#
# Covert the color/s provided from one colormodel to another.
#
# Where:
#
# colors        Should be a list containing all the colors to process, exspressed in the 'from' colormodel format.
#
# from          Should be a string indicating the colormodel format of the 'colors' provided.
#               Allowed colormodels are:
#
#                  **HEX8**
#                  **HEX12**
#                  **HEX16**
#                  **RGB8**
#                  **RGB12**
#                  **RGB16**
#                  **rgb**
#                  **HSB**
#                  **HSI**
#                  **HSL**
#                  **HSP**
#                  **HWB**
#                  **XYZ**
#                  **xyY**
#                  **Lab**
#                  **Luv**
#                  **LCHab**
#                  **LCHuv**
#
# to            Should be a string indicating the colormodel format of the resulting colors.
#               Allowed colormodels are:
#
#                  **HEX8**
#                  **HEX12**
#                  **HEX16**
#                  **RGB8**
#                  **RGB12**
#                  **RGB16**
#                  **rgb**
#                  **HSB**
#                  **HSI**
#                  **HSL**
#                  **HSP**
#                  **HWB**
#                  **XYZ**
#                  **xyY**
#                  **Lab**
#                  **Luv**
#                  **LCHab**
#                  **LCHuv**
#
# caller_info   Optional, should be the information upon the location of the command that generated the error.
#
#               If not provided, defaults to an empty string, meaning it will not provided any information
#               on the command that generated the error.
#
# Returns a list containing the resulting colors expressed in the 'to' colormodel format.
proc ::ms::color::Convert { colors from to { caller_info "" } } {
    # Check the 'from' option.
    switch -- $from {
        HEX8 {
            # Check the 'colors' provided.
            set HEXs [list ]
            foreach hexadecimal $colors {
                set result [::ms::Check_Hex $hexadecimal HEX8 invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return $HEXs }
                HEX12 { return [::HEX8_HEX12 $HEXs] }
                HEX16 { return [::HEX8_HEX16 $HEXs] }
                RGB8  { return [::HEX8_RGB8  $HEXs] }
                RGB12 { return [::RGB8_RGB12 [::HEX8_RGB8 $HEXs]] }
                RGB16 { return [::RGB8_RGB16 [::HEX8_RGB8 $HEXs]] }
                rgb   { return [::RGB8_rgb   [::HEX8_RGB8 $HEXs]] }
                HSB   { return [::rgb_HSB    [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]] }
                HSI   { return [::rgb_HSI    [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]] }
                HSL   { return [::rgb_HSL    [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]] }
                HSP   { return [::rgb_HSP    [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]] }
                HWB   { return [::rgb_HWB    [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]] }
                XYZ   { return [::rgb_XYZ    [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]] }
                xyY   { return [::XYZ_xyY    [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]]] }
                Lab   { return [::XYZ_Lab    [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]]] }
                Luv   { return [::XYZ_Luv    [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]]] }
                LCHab { return [::Lab_LCHab  [::XYZ_Lab   [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]]]] }
                LCHuv { return [::Luv_LCHuv  [::XYZ_Luv   [::rgb_XYZ   [::RGB8_rgb  [::HEX8_RGB8 $HEXs]]]]] }
            }
        }
        HEX12 {
            # Check the 'colors' provided.
            set HEXs [list ]
            foreach hexadecimal $colors {
                set result [::ms::Check_Hex $hexadecimal HEX12 invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::HEX12_HEX8  $HEXs] }
                HEX12 { return $HEXs }
                HEX16 { return [::HEX12_HEX16 $HEXs] }
                RGB8  { return [::RGB12_RGB8  [::HEX12_RGB12 $HEXs]] }
                RGB12 { return [::HEX12_RGB12 $HEXs] }
                RGB16 { return [::RGB12_RGB16 [::HEX12_RGB12 $HEXs]] }
                rgb   { return [::RGB12_rgb   [::HEX12_RGB12 $HEXs]] }
                HSB   { return [::rgb_HSB     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]] }
                HSI   { return [::rgb_HSI     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]] }
                HSL   { return [::rgb_HSL     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]] }
                HSP   { return [::rgb_HSP     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]] }
                HWB   { return [::rgb_HWB     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]] }
                XYZ   { return [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv     [::rgb_XYZ     [::RGB12_rgb   [::HEX12_RGB12 $HEXs]]]]] }
            }
        }
        HEX16 {
            # Check the 'colors' provided.
            set HEXs [list ]
            foreach hexadecimal $colors {
                set result [::ms::Check_Hex $hexadecimal HEX16 invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$hexadecimal'." $caller_info }
                    default { lappend HEXs $hexadecimal }
                }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::HEX16_HEX8  $HEXs] }
                HEX12 { return [::HEX16_HEX12 $HEXs] }
                HEX16 { return $HEXs }
                RGB8  { return [::RGB16_RGB8  [::HEX16_RGB16 $HEXs]] }
                RGB12 { return [::RGB16_RGB12 [::HEX16_RGB16 $HEXs]] }
                RGB16 { return [::HEX16_RGB16 $HEXs] }
                rgb   { return [::RGB16_rgb   [::HEX16_RGB16 $HEXs]] }
                HSB   { return [::rgb_HSB     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]] }
                HSI   { return [::rgb_HSI     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]] }
                HSL   { return [::rgb_HSL     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]] }
                HSP   { return [::rgb_HSP     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]] }
                HWB   { return [::rgb_HWB     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]] }
                XYZ   { return [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv     [::rgb_XYZ     [::RGB16_rgb   [::HEX16_RGB16 $HEXs]]]]] }
            }
        }
        RGB8 {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
                    foreach channel $colors {
                        switch -- [string is integer -strict $channel] {
                            0       { ::ms::Error "Invalid color channel, '$channel'." $caller_info }
                            default {
                                if { $channel < 0 } {
                                    set channel 0
                                } else if { $channel > 255 } {
                                    set channel 255
                                }

                                lappend channels $channel
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   $channels] }
                HEX12 { return [::RGB12_HEX12 [::RGB8_RGB12 $channels]] }
                HEX16 { return [::RGB16_HEX16 [::RGB8_RGB16 $channels]] }
                RGB8  { return $channels }
                RGB12 { return [::RGB8_RGB12  $channels] }
                RGB16 { return [::RGB8_RGB16  $channels] }
                rgb   { return [::RGB8_rgb    $channels] }
                HSB   { return [::rgb_HSB     [::RGB8_rgb   $channels]] }
                HSI   { return [::rgb_HSI     [::RGB8_rgb   $channels]] }
                HSL   { return [::rgb_HSL     [::RGB8_rgb   $channels]] }
                HSP   { return [::rgb_HSP     [::RGB8_rgb   $channels]] }
                HWB   { return [::rgb_HWB     [::RGB8_rgb   $channels]] }
                XYZ   { return [::rgb_XYZ     [::RGB8_rgb   $channels]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ    [::RGB8_rgb $channels]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ    [::RGB8_rgb $channels]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ    [::RGB8_rgb $channels]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab    [::rgb_XYZ  [::RGB8_rgb $channels]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv    [::rgb_XYZ  [::RGB8_rgb $channels]]]] }
            }
        }
        RGB12 {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
                    foreach channel $colors {
                        switch -- [string is integer -strict $channel] {
                            0       { ::ms::Error "Invalid color channel, '$channel'." $caller_info }
                            default {
                                if { $channel < 0 } {
                                    set channel 0
                                } else if { $channel > 4095 } {
                                    set channel 4095
                                }

                                lappend channels $channel
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::RGB12_RGB8  $channels]] }
                HEX12 { return [::RGB12_HEX12 $channels] }
                HEX16 { return [::RGB16_HEX16 [::RGB12_RGB16 $channels]] }
                RGB8  { return [::RGB12_RGB8  $channels] }
                RGB12 { return $channels }
                RGB16 { return [::RGB12_RGB16 $channels] }
                rgb   { return [::RGB12_rgb   $channels] }
                HSB   { return [::rgb_HSB     [::RGB12_rgb   $channels]] }
                HSI   { return [::rgb_HSI     [::RGB12_rgb   $channels]] }
                HSL   { return [::rgb_HSL     [::RGB12_rgb   $channels]] }
                HSP   { return [::rgb_HSP     [::RGB12_rgb   $channels]] }
                HWB   { return [::rgb_HWB     [::RGB12_rgb   $channels]] }
                XYZ   { return [::rgb_XYZ     [::RGB12_rgb   $channels]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ     [::RGB12_rgb $channels]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ     [::RGB12_rgb $channels]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ     [::RGB12_rgb $channels]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab     [::rgb_XYZ   [::RGB12_rgb $channels]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv     [::rgb_XYZ   [::RGB12_rgb $channels]]]] }
            }
        }
        RGB16 {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
                    foreach channel $colors {
                        switch -- [string is integer -strict $channel] {
                            0       { ::ms::Error "Invalid color channel, '$channel'." $caller_info }
                            default {
                                if { $channel < 0 } {
                                    set channel 0
                                } else if { $channel > 65535 } {
                                    set channel 65535
                                }

                                lappend channels $channel
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::RGB16_RGB8  $channels]] }
                HEX12 { return [::RGB12_HEX12 [::RGB16_RGB12 $channels]] }
                HEX16 { return [::RGB16_HEX16 $channels] }
                RGB8  { return [::RGB16_RGB8  $channels] }
                RGB12 { return [::RGB16_RGB12 $channels] }
                RGB16 { return $channels }
                rgb   { return [::RGB16_rgb   $channels] }
                HSB   { return [::rgb_HSB     [::RGB16_rgb   $channels]] }
                HSI   { return [::rgb_HSI     [::RGB16_rgb   $channels]] }
                HSL   { return [::rgb_HSL     [::RGB16_rgb   $channels]] }
                HSP   { return [::rgb_HSP     [::RGB16_rgb   $channels]] }
                HWB   { return [::rgb_HWB     [::RGB16_rgb   $channels]] }
                XYZ   { return [::rgb_XYZ     [::RGB16_rgb   $channels]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ     [::RGB16_rgb $channels]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ     [::RGB16_rgb $channels]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ     [::RGB16_rgb $channels]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab     [::rgb_XYZ   [::RGB16_rgb $channels]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv     [::rgb_XYZ   [::RGB16_rgb $channels]]]] }
            }
        }
        rgb {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
                    foreach channel $colors {
                        switch -- [string is integer -strict $channel] {
                            0       { ::ms::Error "Invalid color channel, '$channel'." $caller_info }
                            default {
                                if { $channel < 0 } {
                                    set channel 0
                                } else if { $channel > 1.0 } {
                                    set channel 1.0
                                }

                                lappend channels $channel
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  $channels]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 $channels]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 $channels]] }
                RGB8  { return [::rgb_RGB8    $channels] }
                RGB12 { return [::rgb_RGB12   $channels] }
                RGB16 { return [::rgb_RGB16   $channels] }
                rgb   { return $channels }
                HSB   { return [::rgb_HSB     $channels] }
                HSI   { return [::rgb_HSI     $channels] }
                HSL   { return [::rgb_HSL     $channels] }
                HSP   { return [::rgb_HSP     $channels] }
                HWB   { return [::rgb_HWB     $channels] }
                XYZ   { return [::rgb_XYZ     $channels] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   $channels]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   $channels]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   $channels]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ $channels]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ $channels]]] }
            }
        }
        HSB {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $hue $saturation $brightness
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSB_rgb $channels]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSB_rgb $channels]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSB_rgb $channels]]] }
                RGB8  { return [::rgb_RGB8    [::HSB_rgb   $channels]] }
                RGB12 { return [::rgb_RGB12   [::HSB_rgb   $channels]] }
                RGB16 { return [::rgb_RGB16   [::HSB_rgb   $channels]] }
                rgb   { return [::HSB_rgb     $channels] }
                HSB   { return $channels }
                HSI   { return [::HSB_HSI     $channels] }
                HSL   { return [::HSB_HSL     $channels] }
                HSP   { return [::HSB_HSP     $channels] }
                HWB   { return [::HSB_HWB     $channels] }
                XYZ   { return [::rgb_XYZ     [::HSB_rgb   $channels]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HSB_rgb $channels]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HSB_rgb $channels]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HSB_rgb $channels]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HSB_rgb $channels]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HSB_rgb $channels]]]] }
            }
        }
        HSI {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $hue $saturation $intensity
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSI_rgb $channels]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSI_rgb $channels]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSI_rgb $channels]]] }
                RGB8  { return [::rgb_RGB8    [::HSI_rgb   $channels]] }
                RGB12 { return [::rgb_RGB12   [::HSI_rgb   $channels]] }
                RGB16 { return [::rgb_RGB16   [::HSI_rgb   $channels]] }
                rgb   { return [::HSI_rgb     $channels] }
                HSB   { return [::HSI_HSB     $channels] }
                HSI   { return $channels }
                HSL   { return [::HSI_HSL     $channels] }
                HSP   { return [::HSI_HSP     $channels] }
                HWB   { return [::HSI_HWB     $channels] }
                XYZ   { return [::rgb_XYZ     [::HSI_rgb   $channels]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HSI_rgb $channels]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HSI_rgb $channels]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HSI_rgb $channels]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HSI_rgb $channels]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HSI_rgb $channels]]]] }
            }
        }
        HSL {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $hue $saturation $lightness
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $channels]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $channels]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $channels]]] }
                RGB8  { return [::rgb_RGB8    [::HSL_rgb   $channels]] }
                RGB12 { return [::rgb_RGB12   [::HSL_rgb   $channels]] }
                RGB16 { return [::rgb_RGB16   [::HSL_rgb   $channels]] }
                rgb   { return [::HSL_rgb     $channels] }
                HSB   { return [::HSL_HSB     $channels] }
                HSI   { return [::HSL_HSI     $channels] }
                HSL   { return $channels }
                HSP   { return [::HSL_HSP     $channels] }
                HWB   { return [::HSL_HWB     $channels] }
                XYZ   { return [::rgb_XYZ     [::HSL_rgb   $channels]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HSL_rgb $channels]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HSL_rgb $channels]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HSL_rgb $channels]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HSL_rgb $channels]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HSL_rgb $channels]]]] }
            }
        }
        HSP {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $hue $saturation $perceived_brightness
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSP_rgb $channels]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSP_rgb $channels]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSP_rgb $channels]]] }
                RGB8  { return [::rgb_RGB8    [::HSP_rgb   $channels]] }
                RGB12 { return [::rgb_RGB12   [::HSP_rgb   $channels]] }
                RGB16 { return [::rgb_RGB16   [::HSP_rgb   $channels]] }
                rgb   { return [::HSP_rgb     $channels] }
                HSB   { return [::HSP_HSB     $channels] }
                HSI   { return [::HSP_HSI     $channels] }
                HSL   { return [::HSP_HSL     $channels] }
                HSP   { return $channels }
                HWB   { return [::HSP_HWB     $channels] }
                XYZ   { return [::rgb_XYZ     [::HSP_rgb   $channels]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HSP_rgb $channels]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HSP_rgb $channels]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HSP_rgb $channels]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HSP_rgb $channels]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HSP_rgb $channels]]]] }
            }
        }
        HWB {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $hue $whiteness $blackness
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HWB_rgb $channels]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HWB_rgb $channels]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HWB_rgb $channels]]] }
                RGB8  { return [::rgb_RGB8    [::HWB_rgb   $channels]] }
                RGB12 { return [::rgb_RGB12   [::HWB_rgb   $channels]] }
                RGB16 { return [::rgb_RGB16   [::HWB_rgb   $channels]] }
                rgb   { return [::HWB_rgb     $channels] }
                HSB   { return [::HWB_HSB     $channels] }
                HSI   { return [::HWB_HSI     $channels] }
                HSL   { return [::HWB_HSL     $channels] }
                HSP   { return [::HWB_HSP     $channels] }
                HWB   { return $channels }
                XYZ   { return [::rgb_XYZ     [::HWB_rgb   $channels]] }
                xyY   { return [::XYZ_xyY     [::rgb_XYZ   [::HWB_rgb $channels]]] }
                Lab   { return [::XYZ_Lab     [::rgb_XYZ   [::HWB_rgb $channels]]] }
                Luv   { return [::XYZ_Luv     [::rgb_XYZ   [::HWB_rgb $channels]]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::rgb_XYZ [::HWB_rgb $channels]]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::rgb_XYZ [::HWB_rgb $channels]]]] }
            }
        }
        XYZ {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $X $Y $Z
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb $channels]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb $channels]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb $channels]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   $channels]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   $channels]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   $channels]] }
                rgb   { return [::XYZ_rgb     $channels] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   $channels]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   $channels]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   $channels]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   $channels]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   $channels]] }
                XYZ   { return $channels }
                xyY   { return [::XYZ_xyY     $channels] }
                Lab   { return [::XYZ_Lab     $channels] }
                Luv   { return [::XYZ_Luv     $channels] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   $channels]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   $channels]] }
            }
        }
        xyY {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $x $y $Y
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::xyY_XYZ $channels]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::xyY_XYZ $channels]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::xyY_XYZ $channels]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::xyY_XYZ $channels]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::xyY_XYZ $channels]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::xyY_XYZ $channels]]] }
                rgb   { return [::XYZ_rgb     [::xyY_XYZ   $channels]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::xyY_XYZ $channels]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::xyY_XYZ $channels]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::xyY_XYZ $channels]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::xyY_XYZ $channels]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::xyY_XYZ $channels]]] }
                XYZ   { return [::xyY_XYZ     $channels] }
                xyY   { return $channels }
                Lab   { return [::XYZ_Lab     [::xyY_XYZ   $channels]] }
                Luv   { return [::XYZ_Luv     [::xyY_XYZ   $channels]] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::xyY_XYZ $channels]]] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::xyY_XYZ $channels]]] }
            }
        }
        Lab {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $L $a $b
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ $channels]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ $channels]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ $channels]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::Lab_XYZ $channels]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::Lab_XYZ $channels]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::Lab_XYZ $channels]]] }
                rgb   { return [::XYZ_rgb     [::Lab_XYZ   $channels]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::Lab_XYZ $channels]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::Lab_XYZ $channels]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::Lab_XYZ $channels]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::Lab_XYZ $channels]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::Lab_XYZ $channels]]] }
                XYZ   { return [::XYZ_Lab     $channels] }
                xyY   { return [::XYZ_xyY     [::Lab_XYZ   $channels]] }
                Lab   { return $channels }
                Luv   { return [::XYZ_Luv     [::Lab_XYZ   $channels]] }
                LCHab { return [::Lab_LCHab   $channels] }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::Lab_XYZ $channels]]] }
            }
        }
        Luv {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $L $u $v
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Luv_XYZ $channels]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Luv_XYZ $channels]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Luv_XYZ $channels]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::Luv_XYZ $channels]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::Luv_XYZ $channels]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::Luv_XYZ $channels]]] }
                rgb   { return [::XYZ_rgb     [::Luv_XYZ   $channels]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::Luv_XYZ $channels]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::Luv_XYZ $channels]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::Luv_XYZ $channels]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::Luv_XYZ $channels]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::Luv_XYZ $channels]]] }
                XYZ   { return [::XYZ_Luv     $channels] }
                xyY   { return [::XYZ_xyY     [::Luv_XYZ   $channels]] }
                Lab   { return [::XYZ_Lab     [::Luv_XYZ   $channels]] }
                Luv   { return $channels }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::Luv_XYZ $channels]]] }
                LCHuv { return [::Luv_LCHuv   $channels] }
            }
        }
        LCHab {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $L $C $Hab
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]] }
                rgb   { return [::XYZ_rgb     [::Lab_XYZ   [::LCHab_Lab $channels]]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::Lab_XYZ   [::LCHab_Lab $channels]]]] }
                XYZ   { return [::Lab_XYZ     [::LCHab_Lab $channels]] }
                xyY   { return [::XYZ_xyY     [::Lab_XYZ   [::LCHab_Lab $channels]]] }
                Lab   { return [::LCHab_Lab   $channels] }
                Luv   { return [::XYZ_Luv     [::Lab_XYZ   [::LCHab_Lab $channels]]] }
                LCHab { return $channels }
                LCHuv { return [::Luv_LCHuv   [::XYZ_Luv   [::Lab_XYZ   [::LCHab_Lab $channels]]]] }
            }
        }
        LCHuv {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    set channels [list ]
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

                        lappend channels $L $C $Huv
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -- $to {
                HEX8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]]] }
                HEX12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]]] }
                HEX16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]]] }
                RGB8  { return [::rgb_RGB8    [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]] }
                RGB12 { return [::rgb_RGB12   [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]] }
                RGB16 { return [::rgb_RGB16   [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]] }
                rgb   { return [::XYZ_rgb     [::Luv_XYZ   [::LCHuv_Luv $channels]]] }
                HSB   { return [::rgb_HSB     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]] }
                HSI   { return [::rgb_HSI     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]] }
                HSL   { return [::rgb_HSL     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]] }
                HSP   { return [::rgb_HSP     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]] }
                HWB   { return [::rgb_HWB     [::XYZ_rgb   [::Luv_XYZ   [::LCHuv_Luv $channels]]]] }
                XYZ   { return [::Luv_XYZ     [::LCHuv_Luv $channels]] }
                xyY   { return [::XYZ_xyY     [::Luv_XYZ   [::LCHuv_Luv $channels]]] }
                Lab   { return [::XYZ_Lab     [::Luv_XYZ   [::LCHuv_Luv $channels]]] }
                Luv   { return [::LCHuv_Luv   $channels] }
                LCHab { return [::Lab_LCHab   [::XYZ_Lab   [::Luv_XYZ   [::LCHuv_Luv $channels]]]] }
                LCHuv { return $channels }
            }
        }
    }
}

## Cooldown
#
# Compute the hexadecimals cooler color/s relative to the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# amount   Should be a floating point value specifing the amount of heat to subtract [0,100].
#          This amount is evaluated as a percentage.
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimal cooler color/s relative to the color/s provided.
proc ::ms::color::Cooldown { HEXs amount depth } {
    set results [list ]
    switch -- $depth {
        8   {
            # Transform the amount from [0,100] to [0,255].
            set amount [expr { round($amount*2.55) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX8_RGB8 $HEXs]

            # Execute the command.
            foreach { red green blue } $channels {
                set red  [expr { $red-$amount } ]
                set blue [expr { $blue+$amount }]

                # Check that the 'red' channel doesn't exceeds its lower limit.
                if { $red < 0 } {
                    set red 0
                }

                # Check that the 'blue' channel doesn't exceeds its upper limit.
                if { $blue > 255 } {
                    set blue 255
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB8_HEX8 $results]
        }
        12  {
            # Transform the amount from [0,100] to [0,4095].
            set amount [expr { round($amount*40.95) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX12_RGB12 $HEXs]

            # Execute the command.
            foreach { red green blue } $channels {
                set red  [expr { $red-$amount } ]
                set blue [expr { $blue+$amount }]

                # Check that the 'red' channel doesn't exceeds its lower limit.
                if { $red < 0 } {
                    set red 0
                }

                # Check that the 'blue' channel doesn't exceeds its upper limit.
                if { $blue > 4095 } {
                    set blue 4095
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB12_HEX12 $results]
        }
        16  {
            # Transform the amount from [0,100] to [0,65535].
            set amount [expr { round($amount*655.35) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX16_RGB16 $HEXs]

            # Execute the command.
            foreach { red green blue } $channels {
                set red  [expr { $red-$amount } ]
                set blue [expr { $blue+$amount }]

                # Check that the 'red' channel doesn't exceeds its lower limit.
                if { $red < 0 } {
                    set red 0
                }

                # Check that the 'blue' channel doesn't exceeds its upper limit.
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

## Darken
#
# Compute the hexadecimals darker color/s relative to the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# amount   Should be a floating point value specifing the amount of lightness to subtract [0,100].
#          This amount is evaluated as a percentage.
#
# via      Should be a string indicating the 'via' to use to achieve the results.
#          Allowed values are:
#
#             **RGB**
#             **HSL**
#             **Lab**
#             **Luv**
#             **LCHab**
#             **LCHuv**
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals darker color/s relative to the color/s provided.
proc ::ms::color::Darken { HEXs amount via depth } {
    set results [list ]
    switch -- $via {
        RGB {
            # Check the 'depth' provided.
            switch -- $depth {
                8   {
                    # Note:  RGB range [0,255].

                    # Transform the amount from [0,100] to [0,255].
                    set amount [expr { round($amount*2.55) }]

                    # Transform the hexadecimal color/s provided into RGB color/s.
                    set channels [::HEX8_RGB8 $HEXs]

                    # Execute the command.
                    foreach channel $channels {
                        set channel [expr { $channel-$amount }]

                        # Check if 'channel' exceeds its lower limit
                        if { $channel < 0 } {
                            set channel 0
                        }

                        lappend results $channel
                    }

                    # Transform the resulting RGB color/s back into hexadecimal color/s.
                    return [::RGB8_HEX8 $results]
                }
                12  {
                    # Note:  RGB range [0,4095].

                    # Transform the amount from [0,100] to [0,4095].
                    set amount [expr { round($amount*40.95) }]

                    # Transform the hexadecimal color/s provided into RGB color/s.
                    set channels [::HEX12_RGB12 $HEXs]

                    # Execute the command.
                    foreach channel $channels {
                        set channel [expr { $channel-$amount }]

                        # Check if 'channel' exceeds its lower limit
                        if { $channel < 0 } {
                            set channel 0
                        }

                        lappend results $channel
                    }

                    # Transform the resulting RGB color/s back into hexadecimal color/s.
                    return [::RGB12_HEX12 $results]
                }
                16  {
                    # Note:  RGB range [0,65535].

                    # Transform the amount from [0,100] to [0,65535].
                    set amount [expr { round($amount*655.35) }]

                    # Transform the hexadecimal color/s provided into RGB color/s.
                    set channels [::HEX16_RGB16 $HEXs]

                    # Execute the command.
                    foreach channel $channels {
                        set channel [expr { $channel-$amount }]

                        # Check if 'channel' exceeds its lower limit
                        if { $channel < 0 } {
                            set channel 0
                        }

                        lappend results $channel
                    }

                    # Transform the resulting RGB color/s back into hexadecimal color/s.
                    return [::RGB16_HEX16 $results]
                }
            }
        }
        HSL {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSL color/s.
            switch -- $depth {
                8   { set channels [::rgb_HSL [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12  { set channels [::rgb_HSL [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16  { set channels [::rgb_HSL [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation lightness } $channels {
                set lightness [expr { $lightness-$amount }]

                # Check if 'lightness' exceeds its lower limit
                if { $lightness < 0 } {
                    set lightness 0
                }

                lappend results $hue $saturation $lightness
            }

            # Transform the resulting HSL color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $results]]] }
            }
        }
        Lab {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into Lab color/s.
            switch -- $depth {
                8  { set channels [::XYZ_Lab [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]]] }
                12 { set channels [::XYZ_Lab [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $HEXs]]]] }
                16 { set channels [::XYZ_Lab [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $HEXs]]]] }
            }

            # Execute the command.
            foreach { lightness a b } $channels {
                set lightness [expr { $lightness-$amount }]

                # Check if 'lightness' exceeds its lower limit
                if { $lightness < 0 } {
                    set lightness 0
                }

                lappend results $lightness $a $b
            }

            # Transform the resulting Lab color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ $results]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ $results]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ $results]]]] }
            }
        }
        Luv {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into Luv color/s.
            switch -- $depth {
                8  { set channels [::XYZ_Luv [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]]] }
                12 { set channels [::XYZ_Luv [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $HEXs]]]] }
                16 { set channels [::XYZ_Luv [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $HEXs]]]] }
            }

            # Execute the command.
            foreach { lightness u v } $channels {
                set lightness [expr { $lightness-$amount }]

                # Check if 'lightness' exceeds its lower limit
                if { $lightness < 0 } {
                    set lightness 0
                }

                lappend results $lightness $u $v
            }

            # Transform the resulting Luv color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Luv_XYZ $results]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Luv_XYZ $results]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Luv_XYZ $results]]]] }
            }
        }
        LCHab {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into LCHab color/s.
            switch -- $depth {
                8  { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]]]] }
                12 { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $HEXs]]]]] }
                16 { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $HEXs]]]]] }
            }

            # Execute the command.
            foreach { lightness C Hab } $channels {
                set lightness [expr { $lightness-$amount }]

                # Check if 'lightness' exceeds its lower limit
                if { $lightness < 0 } {
                    set lightness 0
                }

                lappend results $lightness $C $Hab
            }

            # Transform the resulting LCHab color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
            }
        }
        LCHuv {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into LCHuv color/s.
            switch -- $depth {
                8  { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]]]] }
                12 { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $HEXs]]]]] }
                16 { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $HEXs]]]]] }
            }

            # Execute the command.
            foreach { lightness C Huv } $channels {
                set lightness [expr { $lightness-$amount }]

                # Check if 'lightness' exceeds its lower limit
                if { $lightness < 0 } {
                    set lightness 0
                }

                lappend results $lightness $C $Huv
            }

            # Transform the resulting LCHuv color/s back into hexadecimal color/s.
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
# Compute the hexadecimals deficiency color/s relative to the color/s provided.
#
# Where:
#
# HEXs       Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# severity   Should be a floating point value specifing how much of the eye cone is damaged.
#            This amount is always evaluated as a percentage.
#            It's only Meaningfull for 'Protanomaly', 'Deuteranomaly' or 'Tritanomaly' vias.
#
# via        Should be a string indicating the 'via' to use to achieve the results.
#            Allowed values are:
#
#               **achromatic**
#               **red**
#               **green**
#               **blue**
#               **protanomaly**
#               **deuteranomaly**
#               **tritanomaly**
#               **protanopia**
#               **deuteranopia**
#               **tritanopia**
#
# depth      Should be an integer specifing the color depth in which the color/s provided are defined.
#            Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals deficiency color/s relative to the color/s provided.
proc ::ms::color::Deficiency { hexadecimals severity via depth } {
    set results [list ]
    switch -- $via {
        achromatic {
            # Note: All cones are missing or completely damaged.

            # HEVC --> Human Eye Vision Corrected gray.

            # Transform the hexadecimal color/s provided into rgb non linear color/s.
            switch -- $depth {
                8  { set channels [::RGB8_rgb  [::HEX8_RGB8   $HEXs]] }
                12 { set channels [::RGB12_rgb [::HEX12_RGB12 $HEXs]] }
                16 { set channels [::RGB16_rgb [::HEX16_RGB16 $HEXs]] }
            }

            # Execute the command.
            foreach { r g b } $channels {
                # Transforming the rgb non linear channels into rgb linear channels.
                set r_linear [::companding $r inverse]
                set g_linear [::companding $g inverse]
                set b_linear [::companding $b inverse]

                # Compute the gray linear channel by taking in account the unadapted Y values for the current colorspace.
                set gray_linear [expr { ($::ms::data(colorspace,$::ms::colorspace,Yr)*$r_linear)+($::ms::data(colorspace,$::ms::colorspace,Yg)*$g_linear)+($::ms::data(colorspace,$::ms::colorspace,Yb)*$b_linear) }]

                # Transform the gray linear channel into a gray non linear one.
                set gray [::companding $gray_linear normal]

                lappend results $gray $gray $gray
            }

            # Transform the resulting rgb non linear color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  $results]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 $results]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 $results]] }
            }
        }
        red {
            # Note: The red cone is the only cone present.

            # Transform the hexadecimal color/s provided into rgb non linear color/s.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $HEXs] }
                12 { set channels [::HEX12_RGB12 $HEXs] }
                16 { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $red 0 0
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        green {
            # Note: The green cone is the only cone present.

            # Transform the hexadecimal color/s provided into rgb non linear color/s.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $HEXs] }
                12 { set channels [::HEX12_RGB12 $HEXs] }
                16 { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results 0 $green 0
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        blue {
            # Note: The blue cone is the only cone present.

            # Transform the hexadecimal color/s provided into rgb non linear color/s.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $HEXs] }
                12 { set channels [::HEX12_RGB12 $HEXs] }
                16 { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results 0 0 $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        Protanopia {
            # Note: The green and blue cone are present and working, while the red cone is missing or completely damaged.

            # Transform the hexadecimal color/s provided into rgb non linear color/s.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $HEXs] }
                12 { set channels [::HEX12_RGB12 $HEXs] }
                16 { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results 0 $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        Deuteranopia {
            # Note: The red and blue cone are present and working, while the green cone is missing or completely damaged.

            # Transform the hexadecimal color/s provided into rgb non linear color/s.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $HEXs] }
                12 { set channels [::HEX12_RGB12 $HEXs] }
                16 { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $red 0 $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        Tritanopia {
            # Note: The red and green cone are present and working, while the red cone is missing or completely damaged.

            # Transform the hexadecimal color/s provided into rgb non linear color/s.
            switch -- $depth {
                8  { set channels [::HEX8_RGB8   $HEXs] }
                12 { set channels [::HEX12_RGB12 $HEXs] }
                16 { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $red $green 0
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   $results] }
                12 { return [::RGB12_HEX12 $results] }
                16 { return [::RGB16_HEX16 $results] }
            }
        }
        Protanomaly   -
        Deuteranomaly -
        Tritanomaly   {
            # Note: Protanomaly   --> The cones are all present but the red cone is damaged by a certain severity degrees.
            #       Deuteranomaly --> The cones are all present but the green cone is damaged by a certain severity degrees.
            #       Tritanomaly   --> The cones are all present but the blue cone is damaged by a certain severity degrees.

            # Transform the hexadecimal color/s provided into rgb non linear color/s.
            switch -- $depth {
                8  { set channels [::RGB8_rgb  [::HEX8_RGB8   $HEXs]] }
                12 { set channels [::RGB12_rgb [::HEX12_RGB12 $HEXs]] }
                16 { set channels [::RGB16_rgb [::HEX16_RGB16 $HEXs]] }
            }

            # Compute the rgb non linear color/s.
            foreach { r g b } $channels {
                # Transforming the rgb non linear channels into rgb linear channels.
                set r_linear [::companding $r inverse]
                set g_linear [::companding $g inverse]
                set b_linear [::companding $b inverse]

                if { $severity in [list 0 10.0 20.0 30.0 40.0 50.0 60.0 70.0 80.0 90.0 100.0] } {
                    set cvd [dict get $::ms::table(cvd) $severity $via]

                    set r_severity [expr { ([lindex $cvd 0]*$r_linear)+([lindex $cvd 3]*$g_linear)+([lindex $cvd 6]*$b_linear) }]
                    set g_severity [expr { ([lindex $cvd 1]*$r_linear)+([lindex $cvd 4]*$g_linear)+([lindex $cvd 7]*$b_linear) }]
                    set b_severity [expr { ([lindex $cvd 2]*$r_linear)+([lindex $cvd 5]*$g_linear)+([lindex $cvd 8]*$b_linear) }]
                } else {
                    foreach superior_severity [list 10.0 20.0 30.0 40.0 50.0 60.0 70.0 80.0 90.0 100.0] {
                        if { $severity < $superior_severity } {
                            set inferior_severity [expr { $superior_severity-10.0 }]

                            # Get the matrix from the cvd table, for the severity immediately inferior to the severity provided.
                            set cvd_inferior [dict get $::ms::table(cvd) $inferior_severity $via]

                            # Get the matrix from the cvd table, for the severity immediately superior to the severity provided.
                            set cvd_superior [dict get $::ms::table(cvd) $superior_severity $via]

                            # Compute the rgb value at the inferior severity.
                            set r_inferior [expr { ([lindex $cvd_inferior 0]*$r_linear)+([lindex $cvd_inferior 3]*$g_linear)+([lindex $cvd_inferior 6]*$b_linear) }]
                            set g_inferior [expr { ([lindex $cvd_inferior 1]*$r_linear)+([lindex $cvd_inferior 4]*$g_linear)+([lindex $cvd_inferior 7]*$b_linear) }]
                            set b_inferior [expr { ([lindex $cvd_inferior 2]*$r_linear)+([lindex $cvd_inferior 5]*$g_linear)+([lindex $cvd_inferior 8]*$b_linear) }]

                            # Compute the rgb value at the superior severity.
                            set r_superior [expr { ([lindex $cvd_superior 0]*$r_linear)+([lindex $cvd_superior 3]*$g_linear)+([lindex $cvd_superior 6]*$b_linear) }]
                            set g_superior [expr { ([lindex $cvd_superior 1]*$r_linear)+([lindex $cvd_superior 4]*$g_linear)+([lindex $cvd_superior 7]*$b_linear) }]
                            set b_superior [expr { ([lindex $cvd_superior 2]*$r_linear)+([lindex $cvd_superior 5]*$g_linear)+([lindex $cvd_superior 8]*$b_linear) }]

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

            # Transform the resulting rgb non linear color/s back into hexadecimal color/s.
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
# Compute the hexadecimals desaturated color/s relative to the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# amount   Should be a floating point value specifing the amount of saturation to subtract [0,100].
#          This amount is evaluated as a percentage.
#
# via      Should be a string indicating the 'via' to use to achieve the results.
#          Allowed values are:
#
#             **HSB**
#             **HSI**
#             **HSL**
#             **HSP**
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals desaturated color/s relative to the color/s provided.
proc ::ms::color::Desaturate { HEXs amount via depth } {
    set results [list ]
    switch -- $via {
        HSB {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSB color/s.
            switch -- $depth {
                8  { set channels [::rgb_HSB [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12 { set channels [::rgb_HSB [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16 { set channels [::rgb_HSB [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation brightness } $channels {
                set saturation [expr { $saturation-$amount }]

                # Check if 'saturation' exceeds its lower limit.
                if { $saturation < 0 } {
                    set saturation 0
                }

                lappend results $hue $saturation $brightness
            }

            # Transform the resulting HSB color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSB_rgb $results]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSB_rgb $results]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSB_rgb $results]]] }
            }
        }
        HSI {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSI color/s.
            switch -- $depth {
                8  { set channels [::rgb_HSI [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12 { set channels [::rgb_HSI [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16 { set channels [::rgb_HSI [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation intensity } $channels {
                set saturation [expr { $saturation-$amount }]

                # Check if 'saturation' exceeds its lower limit.
                if { $saturation < 0 } {
                    set saturation 0
                }

                lappend results $hue $saturation $intensity
            }

            # Transform the resulting HSI color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSI_rgb $results]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSI_rgb $results]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSI_rgb $results]]] }
            }
        }
        HSL {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSL color/s.
            switch -- $depth {
                8  { set channels [::rgb_HSL [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12 { set channels [::rgb_HSL [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16 { set channels [::rgb_HSL [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation lightness } $channels {
                set saturation [expr { $saturation-$amount }]

                # Check if 'saturation' exceeds its lower limit.
                if { $saturation < 0 } {
                    set saturation 0
                }

                lappend results $hue $saturation $lightness
            }

            # Transform the resulting HSL color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $results]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $results]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $results]]] }
            }
        }
        HSP {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSP color/s.
            switch -- $depth {
                8  { set channels [::rgb_HSP [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12 { set channels [::rgb_HSP [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16 { set channels [::rgb_HSP [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation perceived_brightness } $channels {
                set saturation [expr { $saturation-$amount }]

                # Check if 'saturation' exceeds its lower limit.
                if { $saturation < 0 } {
                    set saturation 0
                }

                lappend results $hue $saturation $perceived_brightness
            }

            # Transform the resulting HSP color/s back into hexadecimal color/s.
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
# Compute the family of the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the family of the color/s provided.
proc ::ms::color::Family { hexadecimals depth } {
    # Transform the hexadecimal color/s provided into RGB color/s.
    switch -- $depth {
        8   { set channels [::RGB8_rgb  [::HEX8_RGB8   $HEXs]] }
        12  { set channels [::RGB12_rgb [::HEX12_RGB12 $HEXs]] }
        16  { set channels [::RGB16_rgb [::HEX16_RGB16 $HEXs]] }
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
# Compute the hexadecimals gray colors relative to the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# via      Should be a string indicating the 'via' to use to achieve the results.
#          Allowed values are:
#
#             **average**
#             **desaturation**
#             **hevc**
#             **max**
#             **min**
#             **red**
#             **green**
#             **blue**
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals gray relative to the color/s provided.
proc ::ms::color::Gray { HEXs via depth } {
    set results [list ]
    switch -- $via {
        red {
            # Transform the hexadecimal color/s provided into RGB color/s.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $HEXs] }
                12  { set channels [::HEX12_RGB12 $HEXs] }
                16  { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $red $red $red
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        green {
            # Transform the hexadecimal color/s provided into RGB color/s.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $HEXs] }
                12  { set channels [::HEX12_RGB12 $HEXs] }
                16  { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $green $green $green
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        blue {
            # Transform the hexadecimal color/s provided into RGB color/s.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $HEXs] }
                12  { set channels [::HEX12_RGB12 $HEXs] }
                16  { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                lappend results $blue $blue $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        max {
            # Transform the hexadecimal color/s provided into RGB color/s.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $HEXs] }
                12  { set channels [::HEX12_RGB12 $HEXs] }
                16  { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                set gray [expr { max($red,$green,$blue) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        min {
            # Transform the hexadecimal color/s provided into RGB color/s.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $HEXs] }
                12  { set channels [::HEX12_RGB12 $HEXs] }
                16  { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Execute the command.
            foreach { red green blue } $channels {
                set gray [expr { min($red,$green,$blue) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        average {
            # Transform the hexadecimal color/s provided into RGB color/s.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $HEXs] }
                12  { set channels [::HEX12_RGB12 $HEXs] }
                16  { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Note that for performance reasons instead of diving the sum by '3', we multiply it by '0.33333333333333333'.

            # Execute the command.
            foreach { red green blue } $channels {
                set gray [expr { round(($red+$green+$blue)*0.33333333333333333) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        desaturation {
            # Transform the hexadecimal color/s provided into RGB color/s.
            switch -- $depth {
                8   { set channels [::HEX8_RGB8   $HEXs] }
                12  { set channels [::HEX12_RGB12 $HEXs] }
                16  { set channels [::HEX16_RGB16 $HEXs] }
            }

            # Note that for performance reasons instead of diving the sum by '2', we multiply it by '0.5'.

            # Execute the command.
            foreach { red green blue } $channels {
                set min  [expr { min($red,$green,$blue) }]
                set max  [expr { max($red,$green,$blue) }]
                set gray [expr { round(($max+$min)*0.5) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   $results] }
                12  { return [::RGB12_HEX12 $results] }
                16  { return [::RGB16_HEX16 $results] }
            }
        }
        hevc {
            # Human Eye Vision Corrected gray.

            # Transform the RGB color/s into rgb color/s.
            switch -- $depth {
                8   { set channels [::RGB8_rgb  [::HEX8_RGB8   $HEXs]] }
                12  { set channels [::RGB12_rgb [::HEX12_RGB12 $HEXs]] }
                16  { set channels [::RGB16_rgb [::HEX16_RGB16 $HEXs]] }
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

            # Transform the gray rgb *non linear* color/s back into RGB color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  $results]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 $results]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 $results]] }
            }
        }
    }
}

## Inverse
#
# Compute the hexadecimal inverse color/s relative to the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals inverse color/s relative to the color/s provided.
proc ::ms::color::Inverse { HEXs depth } {
    set results [list ]
    switch -- $depth {
        8   {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX8_RGB8 $HEXs]

            # Execute the command.
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

            # Execute the command.
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

            # Execute the command.
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

## Lighten
#
# Compute the hexadecimal lighter color/s relative to the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# amount   Should be a floating point value specifing the amount of lightness to add [0,100].
#          This amount is evaluated as a percentage.
#
# via      Should be a string indicating the 'via' to use to achieve the results.
#          Allowed values are:
#
#             **RGB**
#             **HSL**
#             **Lab**
#             **Luv**
#             **LCHab**
#             **LCHuv**
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals lighter color/s relative to the color/s provided.
proc ::ms::color::Lighten { HEXs amount via depth } {
    set results [list ]
    switch -- $via {
        RGB {
            # Check the 'depth' provided.
            switch -- $depth {
                8   {
                    # Note:  RGB range [0,255].

                    # Transform the amount from [0,100] to [0,255].
                    set amount [expr { round($amount*2.55) }]

                    # Transform the hexadecimal color/s provided into RGB color/s.
                    set channels [::HEX8_RGB8 $HEXs]

                    # Execute the command.
                    foreach channel $channels {
                        set channel [expr { $channel+$amount }]

                        # Check if 'channel' exceeds its upper limit.
                        if { $channel > 255 } {
                            set channel 255
                        }

                        lappend results $channel
                    }

                    # Transform the resulting RGB color/s back into hexadecimal color/s.
                    return [::RGB8_HEX8 $results]
                }
                12  {
                    # Note:  RGB range [0,4095].

                    # Transform the amount from [0,100] to [0,4095].
                    set amount [expr { round($amount*40.95) }]

                    # Transform the hexadecimal color/s provided into RGB color/s.
                    set channels [::HEX12_RGB12 $HEXs]

                    # Execute the command.
                    foreach channel $channels {
                        set channel [expr { $channel+$amount }]

                        # Check if 'channel' exceeds its upper limit.
                        if { $channel > 4095 } {
                            set channel 4095
                        }

                        lappend results $channel
                    }

                    # Transform the resulting RGB color/s back into hexadecimal color/s.
                    return [::RGB12_HEX12 $results]
                }
                16  {
                    # Note:  RGB range [0,65535].

                    # Transform the amount from [0,100] to [0,65535].
                    set amount [expr { round($amount*655.35) }]

                    # Transform the hexadecimal color/s provided into RGB color/s.
                    set channels [::HEX16_RGB16 $HEXs]

                    # Execute the command.
                    foreach channel $channels {
                        set channel [expr { $channel+$amount }]

                        # Check if 'channel' exceeds its upper limit.
                        if { $channel > 65535 } {
                            set channel 65535
                        }

                        lappend results $channel
                    }

                    # Transform the resulting RGB color/s back into hexadecimal color/s.
                    return [::RGB16_HEX16 $results]
                }
            }
        }
        HSL {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSL color/s.
            switch -- $depth {
                8   { set channels [::rgb_HSL [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12  { set channels [::rgb_HSL [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16  { set channels [::rgb_HSL [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation lightness } $channels {
                set lightness [expr { $lightness+$amount }]

                # Check if 'lightness' exceeds its upper limit.
                if { $lightness > 100.0 } {
                    set lightness 100.0
                }

                lappend results $hue $saturation $lightness
            }

            # Transform the resulting HSL color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $results]]] }
            }
        }
        Lab {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into Lab color/s.
            switch -- $depth {
                8  { set channels [::XYZ_Lab [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]]] }
                12 { set channels [::XYZ_Lab [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $HEXs]]]] }
                16 { set channels [::XYZ_Lab [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $HEXs]]]] }
            }

            # Execute the command.
            foreach { lightness a b } $channels {
                set lightness [expr { $lightness+$amount }]

                # Check if 'lightness' exceeds its upper limit.
                if { $lightness > 100.0 } {
                    set lightness 100.0
                }

                lappend results $lightness $a $b
            }

            # Transform the resulting Lab color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ $results]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ $results]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ $results]]]] }
            }
        }
        Luv {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into Luv color/s.
            switch -- $depth {
                8  { set channels [::XYZ_Luv [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]]] }
                12 { set channels [::XYZ_Luv [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $HEXs]]]] }
                16 { set channels [::XYZ_Luv [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $HEXs]]]] }
            }

            # Execute the command.
            foreach { lightness u v } $channels {
                set lightness [expr { $lightness+$amount }]

                # Check if 'lightness' exceeds its upper limit.
                if { $lightness > 100.0 } {
                    set lightness 100.0
                }

                lappend results $lightness $u $v
            }

            # Transform the resulting Luv color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Luv_XYZ $results]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Luv_XYZ $results]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Luv_XYZ $results]]]] }
            }
        }
        LCHab {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into LCHab color/s.
            switch -- $depth {
                8  { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]]]] }
                12 { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $HEXs]]]]] }
                16 { set channels [::Lab_LCHab [::XYZ_Lab [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $HEXs]]]]] }
            }

            # Execute the command.
            foreach { lightness C Hab } $channels {
                set lightness [expr { $lightness+$amount }]

                # Check if 'lightness' exceeds its upper limit.
                if { $lightness > 100.0 } {
                    set lightness 100.0
                }

                lappend results $lightness $C $Hab
            }

            # Transform the resulting LCHab color/s back into hexadecimal color/s.
            switch -- $depth {
                8  { return [::RGB8_HEX8   [::rgb_RGB8  [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
                12 { return [::RGB12_HEX12 [::rgb_RGB12 [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
                16 { return [::RGB16_HEX16 [::rgb_RGB16 [::XYZ_rgb [::Lab_XYZ [::LCHab_Lab $results]]]]] }
            }
        }
        LCHuv {
            # Note:  Lightness range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into LCHuv color/s.
            switch -- $depth {
                8  { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]]]] }
                12 { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB12_rgb [::HEX12_RGB12 $HEXs]]]]] }
                16 { set channels [::Luv_LCHuv [::XYZ_Luv [::rgb_XYZ [::RGB16_rgb [::HEX16_RGB16 $HEXs]]]]] }
            }

            # Execute the command.
            foreach { lightness C Huv } $channels {
                set lightness [expr { $lightness+$amount }]

                # Check if 'lightness' exceeds its upper limit.
                if { $lightness > 100.0 } {
                    set lightness 100.0
                }

                lappend results $lightness $C $Huv
            }

            # Transform the resulting LCHuv color/s back into hexadecimal color/s.
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
# Compute the hexadecimals saturated color/s relative to the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# amount   Should be a floating point value specifing the amount of saturation to add [0,100].
#          This amount is evaluated as a percentage.
#
# via      Should be a string indicating the 'via' to use to achieve the results.
#          Allowed values are:
#
#             **HSB**
#             **HSI**
#             **HSL**
#             **HSP**
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals saturated color/s relative to the color/s provided.
proc ::ms::color::Saturate { HEXs amount via depth } {
    set results [list ]
    switch -- $via {
        HSB {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSB color/s.
            switch -- $depth {
                8   { set channels [::rgb_HSB [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12  { set channels [::rgb_HSB [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16  { set channels [::rgb_HSB [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation brightness } $channels {
                set saturation [expr { $saturation+$amount }]

                # Check if 'saturation' exceeds its upper limit.
                if { $saturation > 100.0 } {
                    set saturation 100.0
                }

                lappend results $hue $saturation $brightness
            }

            # Transform the resulting HSB color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSB_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSB_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSB_rgb $results]]] }
            }
        }
        HSI {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSI color/s.
            switch -- $depth {
                8   { set channels [::rgb_HSI [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12  { set channels [::rgb_HSI [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16  { set channels [::rgb_HSI [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation intensity } $channels {
                set saturation [expr { $saturation+$amount }]

                # Check if 'saturation' exceeds its upper limit.
                if { $saturation > 100.0 } {
                    set saturation 100.0
                }

                lappend results $hue $saturation $intensity
            }

            # Transform the resulting HSI color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSI_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSI_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSI_rgb $results]]] }
            }
        }
        HSL {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSL color/s.
            switch -- $depth {
                8   { set channels [::rgb_HSL [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12  { set channels [::rgb_HSL [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16  { set channels [::rgb_HSL [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation lightness } $channels {
                set saturation [expr { $saturation+$amount }]

                # Check if 'saturation' exceeds its upper limit.
                if { $saturation > 100.0 } {
                    set saturation 100.0
                }

                lappend results $hue $saturation $lightness
            }

            # Transform the resulting HSL color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSL_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSL_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSL_rgb $results]]] }
            }
        }
        HSP {
            # Note:  Saturation range [0,100].
            #        The percentual amount provided will be used as is.

            # Transform the hexadecimal color/s provided into HSP color/s.
            switch -- $depth {
                8   { set channels [::rgb_HSP [::RGB8_rgb  [::HEX8_RGB8   $HEXs]]] }
                12  { set channels [::rgb_HSP [::RGB12_rgb [::HEX12_RGB12 $HEXs]]] }
                16  { set channels [::rgb_HSP [::RGB16_rgb [::HEX16_RGB16 $HEXs]]] }
            }

            # Execute the command.
            foreach { hue saturation perceived_brightness } $channels {
                set saturation [expr { $saturation+$amount }]

                # Check if 'saturation' exceeds its upper limit.
                if { $saturation > 100.0 } {
                    set saturation 100.0
                }

                lappend results $hue $saturation $perceived_brightness
            }

            # Transform the resulting HSP color/s back into hexadecimal color/s.
            switch -- $depth {
                8   { return [::RGB8_HEX8   [::rgb_RGB8  [::HSP_rgb $results]]] }
                12  { return [::RGB12_HEX12 [::rgb_RGB12 [::HSP_rgb $results]]] }
                16  { return [::RGB16_HEX16 [::rgb_RGB16 [::HSP_rgb $results]]] }
            }
        }
    }
}

## Warmup
#
# Compute the hexadecimals warmer color/s relative to the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# amount   Should be a floating point value specifing the amount of heat to add [0,100].
#          This amount is evaluated as a percentage.
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimal warmer color/s relative to the color/s provided.
proc ::ms::color::Warmup { HEXs amount depth } {
    set results [list ]
    switch -- $depth {
        8   {
            # Transform the amount from [0,100] to [0,255].
            set amount [expr { round($amount*2.55) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX8_RGB8 $HEXs]

            # Execute the command.
            foreach { red green blue } $channels {
                set red  [expr { $red+$amount } ]
                set blue [expr { $blue-$amount }]

                # Check that the 'red' channel doesn't exceeds its upper limit.
                if { $red > 255 } {
                    set red 255
                }

                # Check that the 'blue' channel doesn't exceeds its lower limit.
                if { $blue < 0 } {
                    set blue 0
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB8_HEX8 $results]
        }
        12  {
            # Transform the amount from [0,100] to [0,4095].
            set amount [expr { round($amount*40.95) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX12_RGB12 $HEXs]

            # Execute the command.
            foreach { red green blue } $channels {
                set red  [expr { $red+$amount } ]
                set blue [expr { $blue-$amount }]

                # Check that the 'red' channel doesn't exceeds its upper limit.
                if { $red > 4095 } {
                    set red 4095
                }

                # Check that the 'blue' channel doesn't exceeds its lower limit.
                if { $blue < 0 } {
                    set blue 0
                }

                lappend results $red $green $blue
            }

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB12_HEX12 $results]
        }
        16  {
            # Transform the amount from [0,100] to [0,65535].
            set amount [expr { round($amount*655.35) }]

            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX16_RGB16 $HEXs]

            # Execute the command.
            foreach { red green blue } $channels {
                set red  [expr { $red+$amount } ]
                set blue [expr { $blue-$amount }]

                # Check that the 'red' channel doesn't exceeds its upper limit.
                if { $red > 65535 } {
                    set red 65535
                }

                # Check that the 'blue' channel doesn't exceeds its lower limit.
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

## Websafe
#
# Compute the hexadecimals websafe color/s relative to the color/s provided.
#
# Where:
#
# HEXs     Should be a list containing all the hexadecimal colors that will be involved in the process.
#
# depth    Should be an integer specifing the color depth in which the color/s provided are defined.
#          Allowed values are **8**, **12** or **16**.
#
# Returns a list containing the hexadecimals websafe color/s relative to the color/s provided.
proc ::ms::color::Websafe { hexadecimals { depth "" } } {
    set results [list ]
    switch -- $depth {
        8   {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX8_RGB8 $HEXs]

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

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB8_HEX8 $results]
        }
        12  {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX12_RGB12 $HEXs]

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

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB12_HEX12 $results]
        }
        16  {
            # Transform the hexadecimal color/s provided into RGB color/s.
            set channels [::HEX16_RGB16 $HEXs]

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

            # Transform the resulting RGB color/s back into hexadecimal color/s.
            return [::RGB16_HEX16 $results]
        }
    }
}

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