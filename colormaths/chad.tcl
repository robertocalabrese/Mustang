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
package provide ::ms::chad 0.1

# Create the mustang **chad** package.
namespace eval ::ms::chad {}

# Create an alias for the mustang **chad** operation command.
interp alias {} ::chad {} ::ms::chad::Matrix

## Matrix
#
# Compute the chromatic adaptation matrix between two reference whites.
#
# Where:
#
# XYZ_Source        Should be the XYZ components of the source reference white.
#                   Its X and Z components should be in the range [0,1.999969482421875],
#                   while its Y component should be '1.0'.
#
# XYZ_Destination   Should be the XYZ components of the destination reference white.
#                   Its X and Z components should be in the range [0,1.999969482421875],
#                   while its Y component should be '1.0'.
#
# Note: This procedure will use internally the Bradford scaling matrix.
#       It's the same scaling matrix used by any ICC profile.
#
#       Bradford Matrix:
#
#       | bradford_scaling_a1  bradford_scaling_b1  bradford_scaling_c1 |   |  0.8951000   0.2664000  -0.1614000 |
#       | bradford_scaling_a2  bradford_scaling_b2  bradford_scaling_c2 | = | -0.7502000   1.7135000   0.0367000 |
#       | bradford_scaling_a3  bradford_scaling_b3  bradford_scaling_c3 |   |  0.0389000  -0.0685000   1.0296000 |
#
#       Bradford inverse scaling matrix:
#
#       | bradford_inverse_scaling_a1  bradford_inverse_scaling_b1  bradford_inverse_scaling_c1 |   |  0.9869929  -0.1470543  0.1599627 |
#       | bradford_inverse_scaling_a2  bradford_inverse_scaling_b2  bradford_inverse_scaling_c2 | = |  0.4323053   0.5183603  0.0492912 |
#       | bradford_inverse_scaling_a3  bradford_inverse_scaling_b3  bradford_inverse_scaling_c3 |   | -0.0085287   0.0400428  0.9684867 |
#
# Returns a list containing all the nine elements of the chromatic adaptation matrix computed,
# or the word **invalid** if it cannot be computed.
# The list will contain 9 elements positioned in the following way:
#
#   | a1 b1 c1 |
#   | a2 b2 c2 | --> [list a1 a2 a3 b1 b2 b3 c1 c2 c3]
#   | a3 b3 c3 |
proc ::ms::chad::Matrix { XYZ_source XYZ_destination } {
    # Check if the X source is in the right range, truncate if it's not.
    set X_source [lindex $XYZ_source 0]
    if { $X_source < 0 } {
        set X_source 0
    } elseif { $X_source > 1.999969482421875 } {
        set X_source 1.999969482421875
    }

    # Check that the Y source coordinate provided is '1.0'.
    set Y_source [lindex $XYZ_source 1]
    if { $Y_source != 1.0 } {
        switch -- $::DEBUG {
            1       -
            on      -
            true    -
            active  -
            enabled { puts stdout "...Whitepoint XYZ values should have Y = '1.0'." }
        }

        return invalid
    }

    # Check if the Z source is in the right range, truncate if it's not.
    set Z_source [lindex $XYZ_source 2]
    if { $Z_source < 0 } {
        set Z_source 0
    } elseif { $Z_source > 1.999969482421875 } {
        set Z_source 1.999969482421875
    }

    # Check if the X destination is in the right range, truncate if it's not.
    set X_destination [lindex $XYZ_destination 0]
    if { $X_destination < 0 } {
        set X_destination 0
    } elseif { $X_destination > 1.999969482421875 } {
        set X_destination 1.999969482421875
    }

    # Check that the Y destination coordinate provided is '1.0'.
    set Y_destination [lindex $XYZ_destination 1]
    if { $Y_destination != 1.0 } {
        switch -- $::DEBUG {
            1       -
            on      -
            true    -
            active  -
            enabled { puts stdout "...Whitepoint XYZ values should have Y = '1.0'." }
        }

        return invalid
    }

    # Check if the Z destination is in the right range, truncate if it's not.
    set Z_destination [lindex $XYZ_destination 2]
    if { $Z_destination < 0 } {
        set Z_destination 0
    } elseif { $Z_destination > 1.999969482421875 } {
        set Z_destination 1.999969482421875
    }

    # Transform the XYZ_source coordinates into a cone response domain [ρ_source, γ_source, β_source]
    #
    # | X_source |   | bradford_scaling_a1  bradford_scaling_b1  bradford_scaling_c1 |   | ro_Source    |
    # | Y_source | * | bradford_scaling_a2  bradford_scaling_b2  bradford_scaling_c2 | = | gamma_Source |
    # | Z_source |   | bradford_scaling_a3  bradford_scaling_b3  bradford_scaling_c3 |   | beta_Source  |
    set ro_Source    [expr { (0.8951*$X_source)+0.2664+(-0.1614*$Z_source) }]
    set gamma_Source [expr { (-0.7502*$X_source)+1.7135+(0.0367*$Z_source) }]
    set beta_Source  [expr { (0.0389*$X_source)-0.0685+(1.0296*$Z_source)  }]

    # Transform the XYZ_destination coordinates into a cone response domain [ρ_destination, γ_destination, β_destination]
    #
    # | X_destination |   | bradford_scaling_a1  bradford_scaling_b1  bradford_scaling_c1 |   | ro_Destination    |
    # | Y_destination | * | bradford_scaling_a2  bradford_scaling_b2  bradford_scaling_c2 | = | gamma_Destination |
    # | Z_destination |   | bradford_scaling_a3  bradford_scaling_b3  bradford_scaling_c3 |   | beta_Destination  |
    set ro_Destination    [expr { (0.8951*$X_destination)+0.2664+(-0.1614*$Z_destination) }]
    set gamma_Destination [expr { (-0.7502*$X_destination)+1.7135+(0.0367*$Z_destination) }]
    set beta_Destination  [expr { (0.0389*$X_destination)-0.0685+(1.0296*$Z_destination)  }]

    # Compute the intermediate matrix.
    #
    # | a1 b1 c1 |
    # | a2 b2 c2 |
    # | a3 b3 c3 |
    set a1 [expr { $ro_Destination/$ro_Source }]
    set a2 0
    set a3 0
    set b1 0
    set b2 [expr { $gamma_Destination/$gamma_Source }]
    set b3 0
    set c1 0
    set c2 0
    set c3 [expr { $beta_Destination/$beta_Source }]

    # Compute the chromatic adaptation matrix as product of three matrices:
    #
    #   Bradford inverse scaling matrix * Intermediate matrix * Bradford scaling matrix = chromatic adaptation matrix
    #
    #   | bradford_inverse_scaling_a1  bradford_inverse_scaling_b1  bradford_inverse_scaling_c1 |   | a1  b1  c1 |   | bradford_scaling_a1  bradford_scaling_b1  bradford_scaling_c1 |   | ca_a1  ca_b1  ca_c1 |
    #   | bradford_inverse_scaling_a2  bradford_inverse_scaling_b2  bradford_inverse_scaling_c2 | * | a2  b2  c2 | * | bradford_scaling_a2  bradford_scaling_b2  bradford_scaling_c2 | = | ca_a2  ca_b2  ca_c2 |
    #   | bradford_inverse_scaling_a3  bradford_inverse_scaling_b3  bradford_inverse_scaling_c3 |   | a3  b3  c3 |   | bradford_scaling_a3  bradford_scaling_b3  bradford_scaling_c3 |   | ca_a3  ca_b3  ca_c3 |
    #
    #   We will break the formula in two parts:
    #
    #       First Step:
    #
    #       Bradford inverse scaling matrix * Intermediate matrix = partial matrix
    #
    #       | bradford_inverse_scaling_a1  bradford_inverse_scaling_b1  bradford_inverse_scaling_c1 |   | a1  b1  c1 |   | partial1  partial2  partial3 |
    #       | bradford_inverse_scaling_a2  bradford_inverse_scaling_b2  bradford_inverse_scaling_c2 | * | a2  b2  c2 | = | partial4  partial5  partial6 |
    #       | bradford_inverse_scaling_a3  bradford_inverse_scaling_b3  bradford_inverse_scaling_c3 |   | a3  b3  c3 |   | partial7  partial8  partial9 |
    #
    #       Second Step:
    #
    #       partial matrix * Bradford scaling matrix = chromatic adaptation matrix
    #
    #       | partial1  partial2  partial3 |   | bradford_scaling_a1  bradford_scaling_b1  bradford_scaling_c1 |   | ca_a1  ca_b1  ca_c1 |
    #       | partial4  partial5  partial6 | * | bradford_scaling_a2  bradford_scaling_b2  bradford_scaling_c2 | = | ca_a2  ca_b2  ca_c2 |
    #       | partial7  partial8  partial9 |   | bradford_scaling_a3  bradford_scaling_b3  bradford_scaling_c3 |   | ca_a3  ca_b3  ca_c3 |

    # First step, compute the partial matrix.
    set partial1 [expr { 0.9869929*$a1  }]
    set partial2 [expr { -0.1470543*$b2 }]
    set partial3 [expr { 0.1599627*$c3  }]
    set partial4 [expr { 0.4323053*$a1  }]
    set partial5 [expr { 0.5183603*$b2  }]
    set partial6 [expr { 0.0492912*$c3  }]
    set partial7 [expr { -0.0085287*$a1 }]
    set partial8 [expr { 0.0400428*$b2  }]
    set partial9 [expr { 0.9684867*$c3  }]

    # Second step, compute the chromatic adaptation matrix.
    set ca_a1 [expr { (0.8951*$partial1)+(-0.7502*$partial2)+(0.0389*$partial3) }]
    set ca_b1 [expr { (0.2664*$partial1)+(1.7135*$partial2)+(-0.0685*$partial3) }]
    set ca_c1 [expr { (-0.1614*$partial1)+(0.0367*$partial2)+(1.0296*$partial3) }]
    set ca_a2 [expr { (0.8951*$partial4)+(-0.7502*$partial5)+(0.0389*$partial6) }]
    set ca_b2 [expr { (0.2664*$partial4)+(1.7135*$partial5)+(-0.0685*$partial6) }]
    set ca_c2 [expr { (-0.1614*$partial4)+(0.0367*$partial5)+(1.0296*$partial6) }]
    set ca_a3 [expr { (0.8951*$partial7)+(-0.7502*$partial8)+(0.0389*$partial9) }]
    set ca_b3 [expr { (0.2664*$partial7)+(1.7135*$partial8)+(-0.0685*$partial9) }]
    set ca_c3 [expr { (-0.1614*$partial7)+(0.0367*$partial8)+(1.0296*$partial9) }]

    return [list $ca_a1 $ca_a2 $ca_a3 $ca_b1 $ca_b2 $ca_b3 $ca_c1 $ca_c2 $ca_c3]
}