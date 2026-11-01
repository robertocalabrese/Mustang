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
# **color** **balance** *colors* *tempK*
# **color** **bw** *colors*
# **color** **complement** *colors*
# **color** **contrast** *color1* *color2*
# **color** **convert** *colors* *from* *to*
# **color** **cold** *colors* *amount*
# **color** **dark** *colors* *amount*
# **color** **deficiency** *colors* *via* ?*severity*?
# **color** **desaturate** *colors* *amount*
# **color** **family** *colors*
# **color** **grey** *colors* *via*
# **color** **gray** *colors* *via*
# **color** **inverse** *colors*
# **color** **light** *colors* *amount*
# **color** **list** *palette* *family*
# **color** **saturate** *colors* *amount*
# **color** **hot** *colors* *amount*
# **color** **wcga2.0** *color1* *color2*
# **color** **websafe** *colors*
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
#   **color** **balance** *colors* *tempK*
#      Color balance is the global adjustment of the intensities of the colors (via *tempK*) to render specific colors correctly,
#      particularly neutral colors.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *tempK*    --> Should be a temperature value in Kelvins [1000K, 27000K] indicating the **Correlated Color Temperature** (CCT)
#                        of the white color to use. Temperature values that exceeds these limits will be truncated.
#
#      Returns a list containing the balanced hexadecimal colors relative to the colors provided.
#
#   **color** **bw** *colors*
#      Compute which color (**black** or **white**) has the greatest contrast with the colors provided.
#      Contrast range is [0,21].
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#      Returns a list in which each index element is the color **black** or **white**, depending on which one of these two colors has
#      the greatest contrast with the same indexed element provided.
#
#   **color** **complement** *colors*
#      Returns a list containing the hexadecimal complement colors of the hexadecimal colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#   **color** **contrast** *color1* *color2*
#      Returns the contrast value [0,21] between the two colors provided.
#
#         *color1*   --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by mustang.
#                        For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *color2*   --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by mustang.
#                        For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#   **color** **convert** *colors* *from* *to*
#      Convert the colors provided from the color model specified with the *from* option to the one specified with the *to* option.
#
#         *colors*   --> Should be a list containing the colors to convert expressed in the colormodel specified with
#                        the *from* option.
#
#         *from*     --> Should be a string indicating the color model of the provided colors.
#                        Allowed color models are every color models supported by mustang.
#                        For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *to*       --> Should be a string indicating the color model of the resulting colors.
#                        Allowed color models are every color models supported by mustang.
#                        For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#      Returns a list containing the converted colors channels.
#
#   **color** **cold** *colors* *amount*
#      Returns a list containing an hexadecimal colder color (by *amount*) for each of the hexadecimal colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *amount*   --> Should be a floating point value [0,100.0] indicating the amount of heat (with or without the '%')
#                        to subtract. If not provided defaults to **1%**.
#
#                        The amount value will be interpreted as percentage and will be relative to the maximum value
#                        reachable by 'RGB' channels [0,255].
#
#   **color** **dark** *colors* *amount*
#      Returns a list containing an hexadecimal darker color (by *amount*) for each of the hexadecimal colors provided.
#
#         *colors*  --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                       known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *amount*   --> Should be a floating point value [0,100.0] indicating the amount of blackness to add.
#
#                        The amount value will be interpreted as percentage.
#
#   **color** **deficiency** *colors* *via* ?*severity*?
#      Returns a list containing an hexadecimal vision deficiency color (**CVD**) for each of the hexadecimal colors provided.
#      The human eye has 3 cones, each one processing a specific light color (*red*, *green* or *blue*).
#      People can suffer of missing or damaged cone/s.
#
#         *colors*       --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                            known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *via*          --> Should be a string indicating the path to follow to achieve the result.
#                            Allowed values are:
#
#                               **achromatic**    --> No cones present.
#                                                     The person affected by this condition will process every color
#                                                     as a shade of gray. This case is also called *Daltonism*.
#
#                               **red**           --> Only the red cone is present.
#                                                     The person affected by this condition can process only the red lights.
#
#                               **green**         --> Only the green cone is present.
#                                                     The person affected by this condition can process only the green lights.
#
#                               **blue**          --> Only the blue cone is present.
#                                                     The person affected by this condition can process only the blue lights.
#
#                               **protanopia**    --> Only the green and blue cones are present.
#                                                     The person affected by this condition cannot process the red lights.
#
#                               **deuteranopia**  --> Only the red and blue cones are present.
#                                                     The person affected by this condition cannot process the green lights.
#
#                               **tritanopia**    --> Only the red and green cones are present.
#                                                     The person affected by this condition cannot process the blue lights.
#
#                               **protanomaly**   --> The red cone is damaged.
#                                                     The person affected by this condition will have a reduced sensitivity
#                                                     (*severity*) to red lights.
#
#                               **deuteranomaly** --> The green cone is damaged.
#                                                     The person affected by this condition will have a reduced sensitivity
#                                                     (*severity*) to green lights.
#
#                               **tritanomaly**   --> The blue cone is damaged.
#                                                     The person affected by this condition will have a reduced sensitivity
#                                                     (*severity*) to blue lights.
#
#         ?*severity*?   --> Should be a floating point value [0,100.0] indicating how much of the cone is damaged.
#                            Meaningfull only for **Protanomaly**, **Deuteranomaly** or **Tritanomaly** vias.
#                            If not provided defaults to '1.0%'.
#
#         Returns a list containing the vision deficiencies hexadecimal colors relative to the colors provided.
#
#   **color** **desaturate** *colors* *amount*
#      Returns a list containing an hexadecimal desaturated color (by *amount*) for each of the hexadecimal colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *amount*   --> Should be a floating point value [0,100.0] indicating the amount of saturation to subtract.
#
#                        The amount value will be interpreted as percentage and is relative to the maximum value reachable
#                        by the saturation [0,100.0].
#
#   **color** **family** *colors*
#      Return a list containing the families of the colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#   **color** **grey** *colors* *via*
#   **color** **gray** *colors* *via*
#      Returns a list containing an hexadecimal gray color (by *via*) for each of the hexadecimal colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *via*      --> Should be a string indicating the path to follow to achieve the result.
#                        Allowed values are:
#
#                           **average**    --> The color *average* channel value will be used as gray channel.
#                           **desaturate** --> The color *average value between the maximum and the minimum*
#                                              channel values will be used as gray channel.
#                           **red**        --> The color *red* channel will be used as gray channel.
#                           **green**      --> The color *green* channel will be used as gray channel.
#                           **blue**       --> The color *blue* channel will be used as gray channel.
#                           **max**        --> The color *maximum* channel value will be used as gray channel.
#                           **min**        --> The color *minimum* channel value will be used as gray channel.
#                           **hevc**       --> The color *luma* value will be used as gray channel.
#
#   **color** **inverse** *colors*
#      Returns a list containing the hexadecimal inverse colors of the hexadecimal colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#   **color** **light** *colors* *amount*
#      Returns a list containing an hexadecimal lighter color (by *amount*) for each of the hexadecimal colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *amount*   --> Should be a floating point value [0,100.0] indicating the amount of whiteness to add.
#
#                        The amount value will be interpreted as percentage and is relative to the maximum value reachable
#                        by the whiteness [0,100.0].
#
#   **color** **list** *palette* *family*
#      Return a list containing all the colornames available for the palette and family provided.
#
#         *palette*   --> Should be a string indicating the palette involved.
#                         Allowed values are every palette name contained in the variable '::PALETTES'.
#
#         *family*    --> Should be a string indicating the color family to retrieve.
#                         Allowed values are:
#
#                            **all**              --> Returns a list containing all the palette colornames no matter the families.
#                            **Gray** or **Grey** --> Returns a list containing all the palette colornames belonging to the 'Gray' family
#                                                     (*white* and *black* included).
#                            **Red**              --> Returns a list containing all the palette colornames belonging to the 'Red' family.
#                            **Red-Orange**       --> Returns a list containing all the palette colornames belonging to the 'Red-Orange' family.
#                            **Orange**           --> Returns a list containing all the palette colornames belonging to the 'Orange' family.
#                            **Orange-Yellow**    --> Returns a list containing all the palette colornames belonging to the 'Orange-Yellow' family.
#                            **Yellow**           --> Returns a list containing all the palette colornames belonging to the 'Yellow' family.
#                            **Yellow-Green**     --> Returns a list containing all the palette colornames belonging to the 'Yellow-Green' family.
#                            **Green**            --> Returns a list containing all the palette colornames belonging to the 'Green' family.
#                            **Green-Cyan**       --> Returns a list containing all the palette colornames belonging to the 'Green-Cyan' family.
#                            **Cyan**             --> Returns a list containing all the palette colornames belonging to the 'Cyan' family.
#                            **Cyan-Blue**        --> Returns a list containing all the palette colornames belonging to the 'Cyan-Blue' family.
#                            **Blue**             --> Returns a list containing all the palette colornames belonging to the 'Blue' family.
#                            **Blue-Purple**      --> Returns a list containing all the palette colornames belonging to the 'Blue-Purple' family.
#                            **Purple**           --> Returns a list containing all the palette colornames belonging to the 'Purple' family.
#                            **Purple-Red**       --> Returns a list containing all the palette colornames belonging to the 'Purple-Red' family.
#
#   **color** **saturate** *colors* *amount*
#      Returns a list containing an hexadecimal saturated color (by *amount*) for each of the hexadecimal colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *amount*   --> Should be a floating point value [0,100.0] indicating the amount of saturation to add.
#
#                        The amount value will be interpreted as percentage and is relative to the maximum value reachable
#                        by the saturation [0,100.0].
#
#   **color** **hot** *colors* *amount*
#      Returns a list containing an hexadecimal hotter color (by *amount*) for each of the hexadecimal colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *amount*   --> Should be a floating point value [0,100.0] indicating the amount of heat (with or without the '%')
#                        to subtract. If not provided defaults to **1%**.
#
#                        The amount value will be interpreted as percentage and will be relative to the maximum value
#                        reachable by 'RGB' channels [0,255].
#
#   **color** **wcga2.0** *color1* *color2*
#      Return the contrast result for the four scenarios depicted in the **WCGA 2.0** recommendations for color impaired people.
#
#         *color1*   --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by mustang.
#                        This color will be assumed to be used as *background* color.
#                        For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#         *color2*   --> Should be an hexadecimal color (with or without the '#') or a textual colorname known by mustang.
#                        This color will be assumed to be used as *foreground* color.
#                        For more info see **MUSTANG SUPPORTED COLORMODELS**.
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
#   **color** **websafe** *colors*
#      Returns a list containing an hexadecimal websafe color for each of the hexadecimal colors provided.
#
#         *colors*   --> Should be a list containing hexadecimal colors (with or without the '#') or textual colornames
#                        known by mustang. For more info see **MUSTANG SUPPORTED COLORMODELS**.
#
#### MUSTANG SUPPORTED COLORMODELS:
#
# **HEX**   Indicates an *hexadecimal* color model at 8 bit and can be provided either as a textual colorname
#           (that must be known by mustang) or as an hexadecimal color (with or without the '#') expressed in its
#           shortform (with just 3 hexadecimals) or in its longform (with 6 hexadecimals).
#           Multiple **HEX** values must be provided as element of a list.
#
#           Each hexadecimal color ranges from [#000000,#ffffff].
#
#           When returned, an **HEX** color will be in its longform, prepended with '#'.
#
#           Examples:
#
#              One input **HEX** color:
#                 color  --> #ffff00
#                 Input  --> [list #ffff00] or just #ffff00
#
#              Two input **HEX** colors:
#                 color1 --> #000000
#                 color2 --> #ffffff
#                 Input  --> [list #000000 #ffffff]
#
#              Three input **HEX** colors:
#                 color1 --> #ff0000
#                 color2 --> #00ff00
#                 color3 --> #0000ff
#                 Input  --> [list #ff0000 #00ff00 #0000ff]
#
#              and so on and so forth...
#
# **RGB**   Indicates an **RGB** color model at 8 bit, where *R*, *G* and *B* represents its *red*, *green* and *blue* channel.
#           They must be provided as list with at least 3 elements. Each elements must be an integer value that indicates
#           their channel values (in order, the *red*, *green* and *blue* values for each color).
#
#           Each channel ranges from [0,255].
#
#           Examples:
#
#              One input **RGB** color:
#                 color  --> red 40, green 172, blue 212
#                 Input  --> [list 40 172 212]
#
#              Two input **RGB** colors:
#                 color1 --> red 40, green 172, blue 212
#                 color2 --> red 57, green 65,  blue 65
#                 Input  --> [list 40 172 212 57 65 65]
#
#              Three input **RGB** colors:
#                 color1 --> red 40, green 172, blue 212
#                 color2 --> red 57, green 65,  blue 65
#                 color3 --> red 23, green 212, blue 120
#                 Input  --> [list 40 172 212 57 65 65 23 212 120]
#
#              and so on and so forth...
#
# **HSB**   Indicates an **HSB** color model, where *H*, *S* and *B* represents the *hue*, *saturation* and *brightness* channel.
#           They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#           their channel values (in order, the *hue*, *saturation* and *brightness* values for each color).
#
#           The *hue* channel ranges from [0,360.0[ with *360.0* not included, while the *saturation* and *brightness* channels
#           ranges from [0,100.0].
#
#           Examples:
#
#              One input **HSB** color:
#                 color  --> hue 120.0, saturation 25.0, brightness 70.0
#                 Input  --> [list 120.0 25.0 70.0]
#
#              Two input **HSB** colors:
#                 color1 --> hue 120.0, saturation 25.0, brightness 70.0
#                 color2 --> hue 60.0,  saturation 50.0, brightness 12.5
#                 Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5]
#
#              Three input **HSB** colors:
#                 color1 --> hue 120.0, saturation 25.0, brightness 70.0
#                 color2 --> hue 60.0,  saturation 50.0, brightness 12.5
#                 color3 --> hue 240.0, saturation 71.0, brightness 100.0
#                 Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5 240.0 71.0 100.0]
#
#              and so on and so forth...
#
# **HSP**   Indicates an **HSP** color model, where *H*, *S* and *P* represents the *hue*, *saturation* and *perceived brightness* channel.
#           They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#           their channel values (in order, the *hue*, *saturation* and *perceived brightness* values for each color).
#
#           The *hue* channel ranges from [0,360.0[ with *360.0* not included, while the *saturation* and *perceived brightness* channels
#           ranges from [0,100.0].
#
#           Examples:
#
#              One input **HSP** color:
#                 color  --> hue 120.0, saturation 25.0, perceived brightness 70.0
#                 Input  --> [list 120.0 25.0 70.0]
#
#              Two input **HSP** colors:
#                 color1 --> hue 120.0, saturation 25.0, perceived brightness 70.0
#                 color2 --> hue 60.0,  saturation 50.0, perceived brightness 12.5
#                 Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5]
#
#              Three input **HSP** colors:
#                 color1 --> hue 120.0, saturation 25.0, perceived brightness 70.0
#                 color2 --> hue 60.0,  saturation 50.0, perceived brightness 12.5
#                 color3 --> hue 240.0, saturation 71.0, perceived brightness 100.0
#                 Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5 240.0 71.0 100.0]
#
#              and so on and so forth...
#
# **HWB**   Indicates an **HWB** color model, where *H*, *W* and *B* represents the *hue*, *whiteness* and *blackness* channel.
#           They must be provided as a list with at least 3 elements. Each elements must be a floating point value that indicates
#           their channel values (in order, the *hue*, *whiteness* and *blackness* values for each color).
#
#           The *hue* channel ranges from [0,360.0[ with *360.0* not included, while the *whiteness* and *blackness* channels
#           ranges from [0,100.0].
#
#           Examples:
#
#              One input **HWB** color:
#                 color  --> hue 120.0, whiteness 25.0, blackness 70.0
#                 Input  --> [list 120.0 25.0 70.0]
#
#              Two input **HWB** colors:
#                 color1 --> hue 120.0, whiteness 25.0, blackness 70.0
#                 color2 --> hue 60.0,  whiteness 50.0, blackness 12.5
#                 Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5]
#
#              Three input **HWB** colors:
#                 color1 --> hue 120.0, whiteness 25.0, blackness 70.0
#                 color2 --> hue 60.0,  whiteness 50.0, blackness 12.5
#                 color3 --> hue 240.0, whiteness 71.0, blackness 100.0
#                 Input  --> [list 120.0 25.0 70.0 60.0 50.0 12.5 240.0 71.0 100.0]
#
#              and so on and so forth...
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
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set colors [lindex $args 0]
                    set tempK  [lindex $args 1]

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Check the 'tempK' provided.
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

                    # Execute the command.
                    return [::ms::color::Balance $hexadecimals $tempK]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        bw  {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   {
                    set colors $args

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Execute the command.
                    return [::ms::color::BW $hexadecimals]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        cold {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set colors [lindex $args 0]
                    set amount [lindex $args 1]

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Check the 'amount' provided.
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

                    # Execute the command.
                    return [::ms::color::Cold $hexadecimals $amount]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        complement {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   {
                    set colors $args

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Execute the command.
                    return [::ms::color::Complement $hexadecimals]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        contrast {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set color1 [lindex $args 0]
                    set color2 [lindex $args 1]

                    # Check the 'color1' provided.
                    set hex1 [::ms::Check_Hex $color1 invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid color, '$color1'." $caller_info }
                    }

                    # Check the 'color2' provided.
                    set hex2 [::ms::Check_Hex $color2 invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid color, '$color2'." $caller_info }
                    }

                    # Execute the command.
                    return [::ms::color::Contrast $hex1 $hex2]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        convert {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                3   {
                    set colors [lindex $args 0]
                    set from   [lindex $args 1]
                    set to     [lindex $args 2]

                    # Check the 'from' option provided.
                    switch -nocase -- $from {
                        HEX     -
                        RGB     -
                        HSB     -
                        HSP     -
                        HWB     {}
                        default { ::ms::Error "Invalid value, '$from'." $caller_info }
                    }

                    # Check the 'to' option provided.
                    switch -nocase -- $to {
                        HEX     -
                        RGB     -
                        HSB     -
                        HSP     -
                        HWB     {}
                        default { ::ms::Error "Invalid value, '$to'." $caller_info }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            return [::ms::color::Convert $colors $from $to $caller_info]
        }
        dark {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set colors [lindex $args 0]
                    set amount [lindex $args 1]

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Check the 'amount' provided.
                    set amount [string trimright $value %]
                    switch -- [string is double -strict $amount] {
                        0   { ::ms::Error "Invalid value, '$amount'." $caller_info }
                        1   {
                            if { $amount < 0 } {
                                set amount 0
                            } elseif { $amount > 100.0 } {
                                set amount 100.0
                            }
                        }
                    }

                    # Execute the command.
                    return [::ms::color::Dark $hexadecimals $amount]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        deficiency {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set colors   [lindex $args 0]
                    set via      [lindex $args 1]
                    set severity "1%"
                }
                3   {
                    set colors   [lindex $args 0]
                    set via      [lindex $args 1]
                    set severity [lindex $args 2]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Check the 'via' provided.
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

            # Check the 'severity' value.
            set severity [string trimright $value %]
            switch -- [string is double -strict $severity] {
                0   { ::ms::Error "Invalid value, '$severity'." $caller_info }
                1   {
                    if { $severity < 0 } {
                        set severity 0
                    } elseif { $severity > 100.0 } {
                        set severity 100.0
                    }
                }
            }

            # Execute the command.
            return [::ms::color::Deficiency $hexadecimals $via $severity]
        }
        desaturate {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set colors [lindex $args 0]
                    set amount [lindex $args 1]

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Check the 'amount' provided.
                    set amount [string trimright $value %]
                    switch -- [string is double -strict $amount] {
                        0   { ::ms::Error "Invalid value, '$amount'." $caller_info }
                        1   {
                            if { $amount < 0 } {
                                set amount 0
                            } elseif { $amount > 100.0 } {
                                set amount 100.0
                            }
                        }
                    }

                    # Execute the command.
                    return [::ms::color::Desaturate $hexadecimals $amount]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        family {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   {
                    set colors $args

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Execute the command.
                    return [::ms::color::Family $hexadecimals]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        gray -
        grey {
            # Set the default options for this action.
            set via hevc

            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set colors [lindex $args 0]
                    set via    [lindex $args 1]

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Check the 'via' provided.
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

                    # Execute the command.
                    return [::ms::color::Gray $hexadecimals $via]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        hot {
            switch -- [llength $args] {
                2   {
                    set colors [lindex $args 0]
                    set amount [lindex $args 1]

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Check the 'amount' provided.
                    set amount [string trimright $value %]
                    switch -- [string is double -strict $amount] {
                        0   { ::ms::Error "Invalid value, '$amount'." $caller_info }
                        1   {
                            if { $amount < 0 } {
                                set amount 0
                            } elseif { $amount > 100.0 } {
                                set amount 100.0
                            }
                        }
                    }

                    # Execute the command.
                    return [::ms::color::Hot $hexadecimals $amount]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        inverse {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   {
                    set colors $args

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Execute the command.
                    return [::ms::color::Inverse $hexadecimals]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        light {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set colors [lindex $args 0]
                    set amount [lindex $args 1]

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Check the 'amount' provided.
                    set amount [string trimright $value %]
                    switch -- [string is double -strict $amount] {
                        0   { ::ms::Error "Invalid value, '$amount'." $caller_info }
                        1   {
                            if { $amount < 0 } {
                                set amount 0
                            } elseif { $amount > 100.0 } {
                                set amount 100.0
                            }
                        }
                    }

                    # Execute the command.
                    return [::ms::color::Light $hexadecimals $amount]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        list {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set palette [lindex $args 0]
                    set family  [lindex $args 1]

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
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        saturate {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set colors [lindex $args 0]
                    set amount [lindex $args 1]

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    # Check the 'amount' provided.
                    set amount [string trimright $value %]
                    switch -- [string is double -strict $amount] {
                        0   { ::ms::Error "Invalid value, '$amount'." $caller_info }
                        1   {
                            if { $amount < 0 } {
                                set amount 0
                            } elseif { $amount > 100.0 } {
                                set amount 100.0
                            }
                        }
                    }

                    # Execute the command.
                    return [::ms::color::Saturate $hexadecimals $amount]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        wcga2.0 {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                2   {
                    set color1 [lindex $args 0]
                    set color2 [lindex $args 1]

                    # Check the 'color1' provided.
                    set hex1 [::ms::Check_Hex $color1 invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid color, '$color1'." $caller_info }
                    }

                    # Check the 'color2' provided.
                    set hex2 [::ms::Check_Hex $color2 invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid color, '$color2'." $caller_info }
                    }

                    # Compute the contrast between the two colors provided.
                    set contrast [::ms::color::Contrast $color1 $color2]

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
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        websafe {
            # Check the number of 'args' provided.
            switch -- [llength $args] {
                1   {
                    set colors $args

                    # Check the 'colors' provided.
                    foreach color $colors {
                        set result [::ms::Check_Hex $color invalid]
                        switch -- $result {
                            invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                            default { lappend hexadecimals $color }
                        }
                    }

                    return [::ms::color::Websafe $hexadecimals]
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
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
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Balance { hexadecimals tempK } {
    # Transform the hexadecimal colors into 'RGB' channels [0,255].
    set channels [::HEX_RGB $hexadecimals]

    # Get the 'RGB' channels [0,255] equivalent for the temperature provided.
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

    # Adjust the temperature 'RGB' channels [1,255] if exceeds their limits.
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

        # Adjust the balanced 'RGB' channels [0,255] if they exceeds their upper limit.
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

    # Transform the balanced 'RGB' channels [0,255] back into hexadecimal colors.
    return [::RGB_HEX $results]
}

## BW
#
# Compute, for each color provided, which color between **black** and **white** has more contrast with it.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# Returns a list in which each index element is the color **black** or **white**, depending on which one of
# these two colors has the greatest contrast with the same indexed element provided.
proc ::ms::color::BW { hexadecimals } {
    # A pre-computation has been made in order to increase the performance:
    #   1 / 255 = 0.00392156862745098

    # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
    set channels [::HEX_RGB $hexadecimals]

    # Trasform every 'RGB' channels [0,255] provided into 'rgb' channels [0,1.0].
    set rgbs [list ]
    foreach channel $channels {
        lappend rgbs [expr { $channel*0.00392156862745098 }]
    }

    # Execute the command.
    set results [list ]
    foreach { r g b } $rgbs {
        # Trasform the *non-linear* 'rgb' channels [0,1.0] into *linear* 'rgb' channels [0,1.0].
        set r_linear [::ms::color::Companding $r inverse]
        set g_linear [::ms::color::Companding $g inverse]
        set b_linear [::ms::color::Companding $b inverse]

        # Compute the luma of the *linear* 'rgb' channels [0,1.0].
        set a1   [expr { $::ms::Unadapted_Yr*$r_linear }]
        set a2   [expr { $::ms::Unadapted_Yg*$g_linear }]
        set a3   [expr { $::ms::Unadapted_Yb*$b_linear }]
        set luma [expr { $a1+$a2+$a3 }]

        # Confront the *linear* 'rgb' channels [0,1.0] contrast values [0,21] (against 'black' and 'white').
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
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Cold { hexadecimals amount } {
    # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
    set channels [::HEX_RGB $hexadecimals]

    # Transform the amount from [0,100] to [0,255].
    set amount [expr { round($amount*2.55) }]

    # Execute the command.
    set results [list ]
    foreach { red green blue } $channels {
        set blue [expr { round($blue+$amount) }]

        # Check that the 'blue' channel doesn't exceeds its upper limit.
        if { $blue > 255 } {
            set blue 255
        }

        lappend results $red $green $blue
    }

    # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
    return [::RGB_HEX $results]
}

## Companding
#
# Performs an **sRGB companding** or **sRGB inverse companding** operation.
#
# Where:
#
# channel   Depending on the **op** provided, should be the *non linear* channel value to compand (op=normal) or
#           the *linear* channel value to compand (op=inverse).
#
# op        Should be the operation type.
#           Allowed values are **normal** or **inverse**
#
#           If not provided, defaults to **normal**.
#

#
# Note: For info about companding operations visit [ICC 4.4 Specifications](https://www.color.org/specification/ICC.1-2022-05.p).
#
# Depending on the **op** provided, returns the sRGB companded *linear* channel (op=normal)
# or the sRGB inverse companded *non linear* channels (op=inverse).
proc ::ms::color::Companding { channel { op normal } } {
    # A pre-computation has been made in order to increase the performance:
    #    1.0/2.4 = 0.4166666666666667

    # Check the 'op' provided.
    switch -- $op {
        normal {
            if { $channel > 0.0031308 } {
                set channel [expr { (0.055*(pow($channel,0.4166666666666667)))+0.945 }]
            } else {
                set channel [expr { $channel*12.92 }]
            }
        }
        inverse {
            if { $channel > 0.04045 } {
                set channel [expr { pow(($channel+0.055)/1.055,2.4) }]
            } else {
                set channel [expr { $channel/12.92 }]
            }
        }
    }

    return $channel
}

## Complement
#
# Compute the complement colors of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Complement { hexadecimals } {
    # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
    set channels [::HEX_RGB $hexadecimals]

    # Execute the command.
    set results [list ]
    foreach { red green blue } $channels {
        set min [expr { min($red,$green,$blue) }]
        set max [expr { max($red,$green,$blue) }]
        set sum [expr { $min+$max }]

        set red   [expr { $sum-$red   }]
        set green [expr { $sum-$green }]
        set blue  [expr { $sum-$blue  }]

        lappend results $red $green $blue
    }

    # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
    return [::RGB_HEX $results]
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
# Returns the contrast value [0,21].
proc ::ms::color::Contrast { hex1 hex2 } {
    # A pre-computation has been made in order to increase the performance:
    #   1 / 255 = 0.00392156862745098

    # Transform the hexadecimal colors into 'RGB' channels [0,255].
    set RGB1 [::HEX_RGB $hex1]]
    set RGB2 [::HEX_RGB $hex2]]

    # Trasform the two 'RGB' channels [0,255] provided into 'rgb' *non linear* channels [0,1.0].
    foreach channel $RGB1 {
        lappend rgb1 [expr { $channel*0.00392156862745098 }]
    }

    foreach channel $RGB2 {
        lappend rgb2 [expr { $channel*0.00392156862745098 }]
    }

    # Trasform the *non-linear* 'rgb' channels [0,1.0] into *linear* 'rgb' channels [0,1.0].
    foreach { r1 g1 b1 } $rgb1 {
        set r1_linear [::ms::color::Companding $r1 inverse]
        set g1_linear [::ms::color::Companding $g1 inverse]
        set b1_linear [::ms::color::Companding $b1 inverse]
    }

    foreach { r2 g2 b2 } $rgb2 {
        set r2_linear [::ms::color::Companding $r2 inverse]
        set g2_linear [::ms::color::Companding $g2 inverse]
        set b2_linear [::ms::color::Companding $b2 inverse]
    }

    # Compute the 'luma' of the first color.
    set a1    [expr { $::ms::Unadapted_Yr*$r1_linear }]
    set a2    [expr { $::ms::Unadapted_Yg*$g1_linear }]
    set a3    [expr { $::ms::Unadapted_Yb*$b1_linear }]
    set luma1 [expr { $a1+$a2+$a3 }]

    # Compute the 'luma' of the second color.
    set b1    [expr { $::ms::Unadapted_Yr*$r2_linear }]
    set b2    [expr { $::ms::Unadapted_Yg*$g2_linear }]
    set b3    [expr { $::ms::Unadapted_Yb*$b2_linear }]
    set luma2 [expr { $b1+$b2+$b3 }]

    # Compute the contrast value [0,21].
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
    switch -nocase -- $from {
        HEX {
            # Check the 'colors' provided.
            foreach color $colors {
                set result [::ms::Check_Hex $color invalid]
                switch -- $result {
                    invalid { ::ms::Error "Invalid color, '$color'." $caller_info }
                    default { lappend hexadecimals $color }
                }
            }

            # Check the 'to' option.
            switch -nocase -- $to {
                HEX { return $hexadecimals }
                RGB { return [::HEX_RGB $hexadecimals] }
                HSB { return [::RGB_HSB [::HEX_RGB $hexadecimals]] }
                HSP { return [::RGB_HSP [::HEX_RGB $hexadecimals]] }
                HWB { return [::RGB_HWB [::HEX_RGB $hexadecimals]] }
            }
        }
        RGB {
            # Check the 'colors' provided.
            switch -- [expr { [llength $colors]%3 }] {
                0   {
                    foreach channel $colors {
                        switch -- [string is integer -strict $channel] {
                            0       { ::ms::Error "Invalid color channel, '$channel'." $caller_info }
                            default {
                                if { $channel < 0 } {
                                    set channel 0
                                } elseif { $channel > 255 } {
                                    set channel 255
                                }

                                lappend RGB $channel
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of color channels." $caller_info }
            }

            # Check the 'to' option.
            switch -nocase -- $to {
                HEX { return [::RGB_HEX $RGB] }
                RGB { return $RGB }
                HSB { return [::RGB_HSB $RGB] }
                HSP { return [::RGB_HSP $RGB] }
                HWB { return [::RGB_HWB $RGB] }
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
                                if { ($hue < 0) } {
                                    set hue [expr { $hue+360.0 }]
                                } elseif { $hue >= 360.0 } {
                                    set hue [expr { $hue-360.0 }]
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
            switch -nocase -- $to {
                HEX { return [::RGB_HEX [::HSB_RGB $HSB]] }
                RGB { return [::HSB_RGB $HSB] }
                HSB { return $HSB }
                HSP { return [::HSB_HSP $HSB] }
                HWB { return [::HSB_HWB $HSB] }
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
                                if { ($hue < 0) } {
                                    set hue [expr { $hue+360.0 }]
                                } elseif { $hue >= 360.0 } {
                                    set hue [expr { $hue-360.0 }]
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
            switch -nocase -- $to {
                HEX { return [::RGB_HEX [::HSP_RGB $HSP]] }
                RGB { return [::HSP_RGB $HSP] }
                HSB { return [::HSP_HSB $HSP] }
                HSP { return $HSP }
                HWB { return [::HSP_HWB $HSP] }
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
                                if { ($hue < 0) } {
                                    set hue [expr { $hue+360.0 }]
                                } elseif { $hue >= 360.0 } {
                                    set hue [expr { $hue-360.0 }]
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
            switch -nocase -- $to {
                HEX { return [::RGB_HEX [::HWB_RGB $HWB]] }
                RGB { return [::HWB_RGB $HWB] }
                HSB { return [::HWB_HSB $HWB] }
                HSP { return [::HWB_HSP $HWB] }
                HWB { return $HWB }
            }
        }
    }
}

## Dark
#
# Compute a darker version (by *amount*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of blackness to add [0,100].
#                This amount is evaluated as a percentage.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Dark { hexadecimals amount } {
    # Transform the hexadecimal colors provided into 'HWB' colors.
    set channels [::RGB_HWB [::HEX_RGB $hexadecimals]]

    # Execute the command.
    set results [list ]
    foreach { H W B } $channels {
        set B [expr { $B+$amount }]

        # Check if 'B' exceeds its upper limit
        if { $B > 100.0 } {
            set B 100.0
        }

        lappend results $H $W $B
    }

    # Transform the resulting 'HWB' colors back into hexadecimal colors.
    return [::RGB_HEX [::HWB_RGB $results]]
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
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Deficiency { hexadecimals via severity } {
    # Check the 'via' provided.
    switch -- $via {
        achromatic {
            # Note: All cones are missing or completely damaged.

            # A pre-computation has been made in order to increase the performance:
            #   1 / 255 = 0.00392156862745098

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Trasform every 'RGB' channels [0,255] provided into *non linear* 'rgb' channels [0,1.0].
            set rgbs [list ]
            foreach channel $channels {
                lappend rgbs [expr { $channel*0.00392156862745098 }]
            }

            # Execute the command.
            set results [list ]
            foreach { r g b } $channels {
                # Transform the 'rgb' non linear channels [0,1.0] into 'rgb' linear channels [0,1.0].
                set r_linear [::ms::color::Companding $r inverse]
                set g_linear [::ms::color::Companding $g inverse]
                set b_linear [::ms::color::Companding $b inverse]

                # Compute the 'luma' by taking in account the 'Unadapted Y' values for the current colorspace (sRGB D65).
                set a1   [expr { $::ms::Unadapted_Yr*$r_linear }]
                set a2   [expr { $::ms::Unadapted_Yg*$g_linear }]
                set a3   [expr { $::ms::Unadapted_Yb*$b_linear }]
                set luma [expr { $a1+$a2+$a3 }]

                # Transform the 'luma' into a *non linear* gray channel [0,1.0].
                set gray [::ms::color::Companding $luma normal]

                lappend results $gray $gray $gray
            }

            # Trasform every resulting *non linear* 'rgb' channels [0,1.0] back into 'RGB' channels [0,255].
            set GRAYs [list ]
            foreach channel $results {
                lappend GRAYs [expr { round($channel*255.0) }]
            }

            # Trasform every resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $GRAYs]
        }
        red {
            # Note: The red cone is the only cone present.

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                lappend results $red 0 0
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        green {
            # Note: The green cone is the only cone present.

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                lappend results 0 $green 0
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        blue {
            # Note: The blue cone is the only cone present.

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                lappend results 0 0 $blue
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        protanopia {
            # Note: The green and blue cone are present and working, while the red cone is missing or completely damaged.

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                lappend results 0 $green $blue
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        deuteranopia {
            # Note: The red and blue cone are present and working, while the green cone is missing or completely damaged.

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                lappend results $red 0 $blue
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        tritanopia {
            # Note: The red and green cone are present and working, while the red cone is missing or completely damaged.

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                lappend results $red $green 0
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        protanomaly   -
        deuteranomaly -
        tritanomaly   {
            # Note: Protanomaly   --> The cones are all present but the red cone is damaged by a certain severity degrees.
            #       Deuteranomaly --> The cones are all present but the green cone is damaged by a certain severity degrees.
            #       Tritanomaly   --> The cones are all present but the blue cone is damaged by a certain severity degrees.

            # A pre-computation has been made in order to increase the performance:
            #   1 / 255 = 0.00392156862745098

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Trasform every 'RGB' channels [0,255] provided into *non linear* 'rgb' channels [0,1.0].
            set rgbs [list ]
            foreach channel $channels {
                lappend rgbs [expr { $channel*0.00392156862745098 }]
            }

            # Execute the command.
            foreach { r g b } $channels {
                # Transform the *non linear* 'rgb' channels [0,1.0] into *linear* 'rgb' channels [0,1.0].
                set r_linear [::ms::color::Companding $r inverse]
                set g_linear [::ms::color::Companding $g inverse]
                set b_linear [::ms::color::Companding $b inverse]

                # Check the 'severity' value provided.
                if { $severity in [list 0 10.0 20.0 30.0 40.0 50.0 60.0 70.0 80.0 90.0 100.0] } {
                    ######################
                    ##                  ##
                    ##     SEVERITY     ##
                    ##                  ##
                    ######################

                    # Retrieve the matrix coefficients for the 'severity' provided.
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

                    # Compute the *linear* 'rgb' deficiency channels [0,1.0].
                    #
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

                            # Retrieve the matrix coefficients for the severity immediately inferior to the severity provided.
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

                            # Compute the *linear* 'rgb' inferior deficiency channels [0,1.0].
                            #
                            # | a1_inferior  b1_inferior  c1_inferior |   | r_linear |   | r_inferior |
                            # | a2_inferior  b2_inferior  c2_inferior | * | g_linear | = | g_inferior |
                            # | a3_inferior  b3_inferior  c3_inferior |   | b_linear |   | b_inferior |
                            set r_inferior [expr { ($a1_inferior*$r_linear) + ($b1_inferior*$g_linear) + ($c1_inferior*$b_linear) }]
                            set g_inferior [expr { ($a2_inferior*$r_linear) + ($b2_inferior*$g_linear) + ($c2_inferior*$b_linear) }]
                            set b_inferior [expr { ($a3_inferior*$r_linear) + ($b3_inferior*$g_linear) + ($c3_inferior*$b_linear) }]

                            ######################
                            ##                  ##
                            ##     SUPERIOR     ##
                            ##                  ##
                            ######################

                            # Retrieve the matrix coefficients for the severity immediately superior to the severity provided.
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

                            # Compute the *linear* 'rgb' superior deficiency channels [0,1.0].
                            #
                            # | a1_superior  b1_superior  c1_superior |   | r_linear |   | r_superior |
                            # | a2_superior  b2_superior  c2_superior | * | g_linear | = | g_superior |
                            # | a3_superior  b3_superior  c3_superior |   | b_linear |   | b_superior |
                            set r_superior [expr { ($a1_superior*$r_linear) + ($b1_superior*$g_linear) + ($c1_superior*$b_linear) }]
                            set g_superior [expr { ($a2_superior*$r_linear) + ($b2_superior*$g_linear) + ($c2_superior*$b_linear) }]
                            set b_superior [expr { ($a3_superior*$r_linear) + ($b3_superior*$g_linear) + ($c3_superior*$b_linear) }]

                            ######################
                            ##                  ##
                            ##     SEVERITY     ##
                            ##                  ##
                            ######################

                            # Compute the *linear* 'rgb' deficiency channels [0,1.0] at the 'severity' value provided trough a
                            # linear interpolation between the inferior and superior *linear* 'rgb' deficiency channels.
                            set r_severity [::lerp $severity $inferior_severity $superior_severity $r_inferior $r_superior]
                            set g_severity [::lerp $severity $inferior_severity $superior_severity $g_inferior $g_superior]
                            set b_severity [::lerp $severity $inferior_severity $superior_severity $b_inferior $b_superior]

                            break
                        }
                    }
                }

                # Transform the *linear* 'rgb' deficiency channels [0,1.0] into *non linear* 'rgb' deficiency channels [0,1.0].
                set r [::ms::color::Companding $r_severity normal]
                set g [::ms::color::Companding $g_severity normal]
                set b [::ms::color::Companding $b_severity normal]

                lappend results $r $g $b
            }

            # Trasform every resulting *non linear* 'rgb' deficiency channels [0,1.0] back into 'RGB' channels [0,255].
            set RGBs [list ]
            foreach channel $results {
                lappend RGBs [expr { round($channel*255.0) }]
            }

            # Trasform every resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $RGBs]
        }
    }
}

## Desaturate
#
# Compute a desaturated version (by *amount*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of saturation to subtract [0,100].
#                This amount is evaluated as a percentage.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Desaturate { hexadecimals amount } {
    # Transform the hexadecimal colors provided into 'HSB' colors.
    set channels [::RGB_HSB [::HEX_RGB $hexadecimals]]

    # Execute the command.
    set results [list ]
    foreach { H S B } $channels {
        set S [expr { $S-$amount }]

        # Check if 'S' exceeds its lower limit.
        if { $S < 0 } {
            set S 0
        }

        lappend results $H $S $B
    }

    # Transform the resulting 'HSB' colors back into hexadecimal colors.
    return [::RGB_HEX [::HSB_RGB $results]]
}

## Family
#
# Compute the family of each of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# Returns a list containing the family of each of the colors provided.
proc ::ms::color::Family { hexadecimals } {
    # A pre-computation has been made in order to increase the performance:
    #   1 / 255 = 0.00392156862745098

    # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
    set channels [::HEX_RGB $hexadecimals]

    # Trasform every 'RGB' channels [0,255] provided into *non linear* 'rgb' channels [0,1.0].
    set rgbs [list ]
    foreach channel $channels {
        lappend rgbs [expr { $channel*0.00392156862745098 }]
    }

    # Execute the command.
    set results [list ]
    foreach { r g b } $rgbs {
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
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Gray { hexadecimals via } {
    # Check the 'via' provided.
    switch -- $via {
        red {
            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                lappend results $red $red $red
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        green {
            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                lappend results $green $green $green
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        blue {
            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                lappend results $blue $blue $blue
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        max {
            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                set gray [expr { max($red,$green,$blue) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        min {
            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                set gray [expr { min($red,$green,$blue) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        average {
            # A pre-computation has been made in order to increase the performance:
            #   1 / 3 = 0.33333333333333333

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                set gray [expr { round(($red+$green+$blue)*0.33333333333333333) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        desaturate {
            # A pre-computation has been made in order to increase the performance:
            #   1 / 2 = 0.5

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Execute the command.
            set results [list ]
            foreach { red green blue } $channels {
                set min  [expr { min($red,$green,$blue) }]
                set max  [expr { max($red,$green,$blue) }]
                set gray [expr { round(($max+$min)*0.5) }]

                lappend results $gray $gray $gray
            }

            # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $results]
        }
        hevc {
            # Human Eye Vision Corrected gray.

            # A pre-computation has been made in order to increase the performance:
            #   1 / 255 = 0.00392156862745098

            # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
            set channels [::HEX_RGB $hexadecimals]

            # Trasform every 'RGB' channels [0,255] provided into *non linear* 'rgb' channels [0,1.0].
            set rgbs [list ]
            foreach channel $channels {
                lappend rgbs [expr { $channel*0.00392156862745098 }]
            }

            # Execute the command.
            set results [list ]
            foreach { r g b } $channels {
                # Transform the *non linear* 'rgb' channels [0,1.0] into *linear* 'rgb' channels [0,1.0].
                set r_linear [::ms::color::Companding $r inverse]
                set g_linear [::ms::color::Companding $g inverse]
                set b_linear [::ms::color::Companding $b inverse]

                # Compute the 'luma' by taking in account the 'Unadapted Y' values for the current colorspace (sRGB D65).
                set a1   [expr { ($::ms::Unadapted_Yr*$r_linear) }]
                set a2   [expr { ($::ms::Unadapted_Yg*$g_linear) }]
                set a3   [expr { ($::ms::Unadapted_Yb*$b_linear) }]
                set luma [expr { $a1+$a2+$a3 }]

                # Transform the 'luma' into a *non linear* gray channel [0,1.0].
                set gray [::ms::color::Companding $luma normal]

                lappend results $gray $gray $gray
            }

            # Trasform every resulting *non linear* 'rgb' gray channels [0,1.0] back into 'RGB' channels [0,255].
            set RGBs [list ]
            foreach channel $results {
                lappend RGBs [expr { round($channel*255.0) }]
            }

            # Trasform every resulting 'RGB' channels [0,255] back into hexadecimal colors.
            return [::RGB_HEX $RGBs]
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
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Hot { hexadecimals amount } {
    # Transform the amount from [0,100] to [0,255].
    set amount [expr { round($amount*2.55) }]

    # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
    set channels [::HEX_RGB $hexadecimals]

    # Execute the command.
    set results [list ]
    foreach { red green blue } $channels {
        set red [expr { $red+$amount }]

        # Check that the 'red' channel doesn't exceeds its upper limit.
        if { $red > 255 } {
            set red 255
        }

        lappend results $red $green $blue
    }

    # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
    return [::RGB_HEX $results]
}

## Inverse
#
# Compute the inverse colors of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Inverse { hexadecimals } {
    # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
    set channels [::HEX_RGB $hexadecimals]

    # Execute the command.
    set results [list ]
    foreach { red green blue } $channels {
        set red   [expr { 255-$red   }]
        set green [expr { 255-$green }]
        set blue  [expr { 255-$blue  }]

        lappend results $red $green $blue
    }

    # Transform the resulting 'RGB' channels [0,255] back into hexadecimal colors.
    return [::RGB_HEX $results]
}

## Light
#
# Compute a lighter version (by *amount*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of whiteness to add [0,100].
#                This amount is evaluated as a percentage.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Light { hexadecimals amount } {
    # Transform the hexadecimal colors provided into 'HWB' colors.
    set channels [::RGB_HWB [::HEX_RGB $hexadecimals]]

    # Execute the command.
    set results [list ]
    foreach { H W B } $channels {
        set W [expr { $W+$amount }]

        # Check if 'W' exceeds its upper limit.
        if { $W > 100.0 } {
            set W 100.0
        }

        lappend results $H $W $B
    }

    # Transform the resulting 'HWB' colors back into hexadecimal colors.
    return [::RGB_HEX [::HWB_RGB $results]]
}

## Saturate
#
# Compute a saturated version (by *amount*) of the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# amount         Should be a floating point value specifing the amount of saturation to add [0,100].
#                This amount is evaluated as a percentage.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Saturate { hexadecimals amount } {
    # Transform the hexadecimal colors provided into 'HSB' colors.
    set channels [::RGB_HSB [::HEX_RGB $hexadecimals]]

    # Execute the command.
    set results [list ]
    foreach { H S B } $channels {
        set S [expr { $S+$amount }]

        # Check if 'S' exceeds its upper limit.
        if { $S > 100.0 } {
            set S 100.0
        }

        lappend results $H $S $B
    }

    # Transform the resulting 'HSB' colors back into hexadecimal colors.
    return [::RGB_HEX [::HSB_RGB $results]]
}

## Websafe
#
# Compute the websafe colors relative to the colors provided.
#
# Where:
#
# hexadecimals   Should be a list containing hexadecimal colors expressed in their longform.
#
# Returns a list containing the resulting hexadecimal colors.
proc ::ms::color::Websafe { hexadecimals } {
    # Transform the hexadecimal colors provided into 'RGB' channels [0,255].
    set channels [::HEX_RGB $hexadecimals]

    # Execute the commands.
    set results [list ]
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

    # Transform the resulting 'RGB' colors [0,255] back into hexadecimal colors.
    return [::RGB_HEX $results]
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