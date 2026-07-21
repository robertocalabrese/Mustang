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
package provide ::ms::HSP_rgb 0.1

# Create the mustang **HSP_rgb** package.
namespace eval ::ms::HSP_rgb {}

# Create an alias for the mustang **HSP_rgb** conversion command.
interp alias {} ::HSP_rgb {} ::ms::HSP_rgb::Conversion

## Conversion
#
# Transform **HSP** colors into **rgb** colors.
#
# Where:
#
# channels   Should be a list that specifies all the channels (flattened together) of the **HSP** colors to convert.
#            Each **HSP** color needs to be represented by 3 channels values in the following order and ranges:
#                H --> Hue                  [0,360.0[ or 'UNDEF' for gray colors (meaning 'undefined')
#                S --> Saturation           [0,100.0]
#                P --> Perceived Brightness [0,100.0]
#
#            Note that for hues, '360.0' is not included.
#
#            Attention, the input and output colors will not be checked.
#            Please, take the appropriate steps before and after using this procedure or use the **color** command instead.
#
#            Examples:
#
#                One input **HSP** color:
#                    color    --> [list 120 50 50]
#                    channels --> [list 120 50 50]
#
#                Two input **HSP** colors:
#                    color1   --> [list 120 50 50]
#                    color2   --> [list 57  80 80]
#                    channels --> [list 120 50 50 57 80 80] <-- all colors channels should be flattened together.
#
#                Three input **HSP** colors:
#                    color1   --> [list 120 50 50]
#                    color2   --> [list 57  80 80]
#                    color3   --> [list 270 20 90]
#                    channels --> [list 120 50 50 57 80 80 270 20 90] <-- all colors channels should be flattened together.
#
#                and so on and so forth...
#
# Some pre-computation have been made in order to increase the performance:
#   1 / 6   = 0.16666666666666666
#   2 / 6   = 0.3333333333333333
#   3 / 6   = 0.5
#   4 / 6   = 0.6666666666666666
#   5 / 6   = 0.8333333333333334
#   1 / 100 = 0.01
#   1 / 360 = 0.002777777777777778
#
# Note:  For info about the **HSP** color system visit [HSP](https://www.alienryderflex.com/hsp.html).
#        For info about unadapted values visit [BruceLindbloom](http://www.brucelindbloom.com).
#
#           unadapted_Yr = 0.21264461762001413 --> for the sRGB D65
#           unadapted_Yg = 0.7151663725690272  --> for the sRGB D65
#           unadapted_Yb = 0.07218900981095855 --> for the sRGB D65
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
proc ::ms::HSP_rgb::Conversion { channels } {
    foreach { hue saturation perceived_brightness } $channels {
        # Check if it's a gray.
        switch -nocase -- $hue {
            UNDEF {
                # It's a gray.
                set pb [expr { $perceived_brightness*0.01 }]; # range [0,1.0]

                lappend results $pb $pb $pb
            }
            default {
                set s  [expr { $saturation*0.01 }];           # range [0,1.0]
                set pb [expr { $perceived_brightness*0.01 }]; # range [0,1.0]

                # Transform the hue in sixtieths [0,6.0[.
                # Note that 6.0 is not included.
                set h [expr { $hue*0.016666666666666666 }]

                # Compute the hue sector [0,5].
                set sector [expr { int(floor($h)) }]

                # Compute the fractional part of the hue sector [0,1.0[.
                # Note that 1.0 is not included.
                set f [expr { $h-$sector }]

                # Check if the sector is an odd number.
                switch -- $sector {
                    1   -
                    3   -
                    5   { set f [expr { 1.0-$f }] }
                }

                # Compute minovermax [0,1.0].
                set k [expr (1.0-$s)]

                # Compute the rgb values [0,1.0].
                if { $k == 0 } {
                    switch -- $sector {
                        0   {
                            # hue < 60.0

                            set a1 [expr { $f*$f*0.7151663725690272 }]

                            set r [expr { sqrt(($pb*$pb)/($a1+0.21264461762001413)) }]
                            set g [expr { $r*$f }]
                            set b 0
                        }
                        1   {
                            # hue < 120.0

                            set a1 [expr { $f*$f*0.21264461762001413 }]

                            set g [expr { sqrt(($pb*$pb)/($a1+0.7151663725690272)) }]
                            set r [expr { $g*$f }]
                            set b 0
                        }
                        2   {
                            # hue < 180.0

                            set a1 [expr { $f*$f*0.07218900981095855 }]

                            set g [expr { sqrt(($pb*$pb)/($a1+0.7151663725690272)) }]
                            set b [expr { $g*$f }]
                            set r 0
                        }
                        3   {
                            # hue < 240.0

                            set a1 [expr { $f*$f*0.7151663725690272 }]

                            set b [expr { sqrt(($pb*$pb)/($a1+0.07218900981095855)) }]
                            set g [expr { $b*$f }]
                            set r 0
                        }
                        4   {
                            # hue < 300.0

                            set a1 [expr { $f*$f*0.21264461762001413 }]

                            set b [expr { sqrt(($pb*$pb)/($a1+0.07218900981095855)) }]
                            set r [expr { $b*$f }]
                            set g 0
                        }
                        5   {
                            # hue < 360.0

                            set a1 [expr { $f*$f*0.07218900981095855 }]

                            set r [expr { sqrt(($pb*$pb)/($a1+0.21264461762001413)) }]
                            set b [expr { $r*$f }]
                            set g 0
                        }
                    }
                } else {
                    # Compute j as the inverse of minovermax (k) [0,1.0].
                    set j [expr { 1.0/$k }]

                    switch -- $sector {
                        0   {
                            # hue < 60.0

                            set a1   [expr { 1.0+($f*($j-1.0)) }]
                            set a2   [expr { $j*$j*0.21264461762001413 }]
                            set a3   [expr { $a1*$a1*0.7151663725690272 }]
                            set sqrt [expr { sqrt($a2+$a3+0.07218900981095855) }]

                            set b [expr { $pb/$sqrt }]
                            set r [expr { $b*$j }]
                            set g [expr { $b+($f*($r-$b)) }]
                        }
                        1   {
                            # hue < 120.0

                            set a1   [expr { 1.0+($f*($j-1.0)) }]
                            set a2   [expr { $j*$j*0.7151663725690272 }]
                            set a3   [expr { $a1*$a1*0.21264461762001413 }]
                            set sqrt [expr { sqrt($a2+$a3+0.07218900981095855) }]

                            set b [expr { $pb/$sqrt }]
                            set g [expr { $b*$j }]
                            set r [expr { $b+($f*($g-$b)) }]
                        }
                        2   {
                            # hue < 180.0

                            set a1   [expr { 1.0+($f*($j-1.0)) }]
                            set a2   [expr { $j*$j*0.7151663725690272 }]
                            set a3   [expr { $a1*$a1*0.07218900981095855 }]
                            set sqrt [expr { sqrt($a2+$a3+0.21264461762001413) }]

                            set r [expr { $pb/$sqrt }]
                            set g [expr { $r*$j }]
                            set b [expr { $r+($f*($g-$r)) }]
                        }
                        3   {
                            # hue < 240.0

                            set a1   [expr { 1.0+($f*($j-1.0)) }]
                            set a2   [expr { $j*$j*0.07218900981095855 }]
                            set a3   [expr { $a1*$a1*0.7151663725690272 }]
                            set sqrt [expr { sqrt($a2+$a3+0.21264461762001413) }]

                            set r [expr { $pb/$sqrt }]
                            set b [expr { $r*$j }]
                            set g [expr { $r+($f*($b-$r)) }]
                        }
                        4   {
                            # hue < 300.0

                            set a1   [expr { 1.0+($f*($j-1.0)) }]
                            set a2   [expr { $j*$j*0.07218900981095855 }]
                            set a3   [expr { $a1*$a1*0.21264461762001413 }]
                            set sqrt [expr { sqrt($a2+$a3+0.7151663725690272) }]

                            set g [expr { $pb/$sqrt }]
                            set b [expr { $g*$j }]
                            set r [expr { $g+($f*($b-$g)) }]
                        }
                        5   {
                            # hue < 360.0

                            set a1   [expr { 1.0+($f*($j-1.0)) }]
                            set a2   [expr { $j*$j*0.21264461762001413 }]
                            set a3   [expr { $a1*$a1*0.07218900981095855 }]
                            set sqrt [expr { sqrt($a2+$a3+0.7151663725690272) }]

                            set g [expr { $pb/$sqrt }]
                            set r [expr { $g*$j }]
                            set b [expr { $g+($f*($r-$g)) }]
                        }
                    }
                }

                lappend results $r $g $b
            }
        }
    }

    return $results
}

#*EOF*