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

###################################
##                               ##
##     SET THE THEMES COLORS     ##
##                               ##
###################################

# Note: Themes (and styles) should not have harcoded hexadecimal colors but theme color names instead.
#       The developer is free to:
#          - use any of these colors as he/she pleases.
#          - change the hexadecimals of any of these colors as he/she pleases.
#          - add new colornames as he/she pleases.
#       Howewer the developer is not allowed to change the names of allready establish colornames.

# Themes accented colors.
# These colors change only if the accent color change.
# The accent color order is blue, gray, green, orange, pink, purple, red and yellow.
set ::ms::color(accent) [list Accent                     #007aff #989898 #27cd41 #ff9500 #ff97d4 #af52de #ff3c2f #ffc726 \
                              AccentText                 #e2e3e4 #181818 #0b0b0b #232323 #3d3d3d #fdfdfd #f4f4f4 #454545 \
                              FieldbackgroundFocus       #bfdfff #e0e0e3 #c9f5bb #ffd5b0 #f4bbc9 #f8deff #ff9999 #fbefbb \
                              FieldbackgroundFocusText   #595959 #606060 #616161 #5d5d5d #4d4d4d #696969 #373737 #6c6c6c \
                              Highlight                  #9fbfdf #c0c0c3 #a9d59b #ffb540 #fc78b9 #9f42ce #ff686e #f7d63b \
                              HighlightText              #393939 #404040 #586155 #3e3e3e #272727 #eeeeee #161616 #4e4e4e \
                              HighlightAlternate         #0169d9 #6f6f73 #62ba46 #f7821b #fa6899 #953d96 #e0383e #f3b407 \
                              HighlightAlternateText     #d6d6d6 #efefef #121212 #191919 #191919 #e1e1e1 #eaeaea #333333 \
                              ProgressbarBackground      #1b9aff #989898 #27cd41 #ff9500 #ff97d4 #bf62ee #ff4860 #ffc726 \
                              ProgressbarText            #272822 #181818 #0b0b0b #232323 #3d3d3d #0e0e0e #020101 #454545];
# Themes colorschemed colors.
# These colors change only if the colorscheme change.
# The first column is relative to dark colorschemes, the second to light colorschemes.
set ::ms::color(colorscheme) [list ArrowDisabled              #dadada #d8d8d8 \
                                   Background                 #323232 #ececec \
                                   Background1                #3a3a3a #e4e4e4 \
                                   Background2                #424242 #dcdcdc \
                                   Background3                #4a4a4a #d8d8d8 \
                                   Background4                #525252 #cccccc \
                                   Background5                #5a5a5a #c4c4c4 \
                                   Background6                #626262 #bcbcbc \
                                   Background7                #6a6a6a #b4b4b4 \
                                   Bordercolor                #9a9a9a #b9b9b9 \
                                   BordercolorBackground      #dadada #d4d4d4 \
                                   BordercolorDisabled        #666666 #cccccc \
                                   BordercolorReadonly        #c4c4c4 #b4b4b4 \
                                   ButtonBackground           #ececec #d4d4d4 \
                                   ButtonBackgroundDisabled   #b4b4b4 #cdcdcd \
                                   ButtonBackgroundPressed    #fefefe #dadada \
                                   ButtonBorder               #ececec #b4b4b4 \
                                   ButtonTextDisabled         #949698 #8a8c8e \
                                   ButtonTextPressed          #5c5c5c #2c2c2c \
                                   PopdownBordercolor         #dadada #9e9a91 \
                                   Sash                       #cccccc #949494 \
                                   ScaleThumbDisabled         #6a6a6a #4f5152 \
                                   ScaleTroughDisabled        #848688 #cccccc \
                                   ScrollbarBordercolor       #5a5a5a #949494 \
                                   Separator                  #fafafa #999999 \
                                   Text                       #fefefe #1f1c1b \
                                   TextBig                    #fdfdfd #1f1f1e \
                                   TextDisabled               #666666 #b9b9b9 \
                                   TextReadonly               #d4d4d4 #777777];

# Theme fixed colors.
# These colors don't change no matter the colorscheme or the accent color in use.
set ::ms::color(fixed) [list Arrow                             #3c3c3c \
                             ArrowPressed                      #5f6162 \
                             BordercolorAlternate              #a4a6a8 \
                             ButtonText                        #545454 \
                             Darkcolor                         #dadada \
                             Fieldbackground                   #fefefe \
                             Invalid                           #f05466 \
                             Lightcolor                        #dadada \
                             LightcolorAlternate               #ffffff \
                             PlaceholderText                   #949494 \
                             PopdownBackground                 #ffffff \
                             Spacer                            #9e9a91 \
                             ScaleTrough                       #a4a6a8 \
                             ScrollbarBackground               #e6e6e6 \
                             ScrollbarForeground               #e6e6e6 \
                             TabBackground                     #b4b4b4 \
                             TabBackgroundDisabled             #c6c6c6 \
                             TabForeground                     #3e3e3e \
                             TabForegroundDisabled             #5e5e5e \
                             TextAlternate                     #1f1c1b \
                             TextDisabled                      #b9b9b9 \
                             TreeviewHeading                   #d4d4d4 \
                             TreeviewStripe                    #ececec \
                             TreeviewSeparator                 #b4b4b4 \
                             TreeviewFieldbackgroundBackground #ededed \
                             TreeviewFieldbackgroundDisabled   #e6e6e6];

#*EOF*