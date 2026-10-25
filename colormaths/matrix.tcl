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
package provide ::ms::matrix 0.1

# Create the mustang **matrix** package.
namespace eval ::ms::matrix {}

# Create an alias for the mustang **inverse 3x3 matrix** operation command.
interp alias {} ::inverse_matrix {} ::ms::matrix::Inverse_3x3

## Inverse_3x3
#
# Inverts a 3x3 matrix, if possible.
#
# Where:
#
# a1,
# a2,
# a3,
# b1,
# b2,
# b3,
# c1,
# c2,
# c3    Should be the matrix elements to invert.
#       All elements of the matrix must be floating point values.
#       The matrix elements provided must respect the following form and positions:
#           | a1 b1 c1 |
#           | a2 b2 c2 | --> [list a1 a2 a3 b1 b2 b3 c1 c2 c3]
#           | a3 b3 c3 |
#
# Note:  For more info visit <https://www.mathsisfun.com/algebra/matrix-inverse-minors-cofactors-adjugate.html>.
#
# Returns a list containing the inverted matrix elements or the word **invalid** if it cannot be computed.
# The list will contain all the nine elements positioned in the following way:
#
#   | a1 b1 c1 |
#   | a2 b2 c2 | --> [list a1 a2 a3 b1 b2 b3 c1 c2 c3]
#   | a3 b3 c3 |
proc ::ms::matrix::Inverse_3x3 { a1 a2 a3 b1 b2 b3 c1 c2 c3 } {
    # Compute the matrix of Minors.
    set minor_a1 [expr { ($b2*$c3)-($b3*$c2) }]
    set minor_a2 [expr { ($b1*$c3)-($b3*$c1) }]
    set minor_a3 [expr { ($b1*$c2)-($b2*$c1) }]
    set minor_b1 [expr { ($a2*$c3)-($a3*$c2) }]
    set minor_b2 [expr { ($a1*$c3)-($a3*$c1) }]
    set minor_b3 [expr { ($a1*$c2)-($a2*$c1) }]
    set minor_c1 [expr { ($a2*$b3)-($a3*$b2) }]
    set minor_c2 [expr { ($a1*$b3)-($a3*$b1) }]
    set minor_c3 [expr { ($a1*$b2)-($a2*$b1) }]

    # Compute the matrix of cofactors.
    #
    # | cofactor_a1 cofactor_b1 cofactor_c1 |
    # | cofactor_a2 cofactor_b2 cofactor_c2 |
    # | cofactor_a3 cofactor_b3 cofactor_c3 |
    set cofactor_a1 $minor_a1
    set cofactor_a2 [expr { -1.0*$minor_a2 }]
    set cofactor_a3 $minor_a3
    set cofactor_b1 [expr { -1.0*$minor_b1 }]
    set cofactor_b2 $minor_b2
    set cofactor_b3 [expr { -1.0*$minor_b3 }]
    set cofactor_c1 $minor_c1
    set cofactor_c2 [expr { -1.0*$minor_c2 }]
    set cofactor_c3 $minor_c3

    # Compute the Adjugate, also called Adjoint.
    #
    # | adjugate_a1 adjugate_b1 adjugate_c1 |
    # | adjugate_a2 adjugate_b2 adjugate_c2 |
    # | adjugate_a3 adjugate_b3 adjugate_c3 |
    set adjugate_a1 $cofactor_a1
    set adjugate_a2 $cofactor_b1
    set adjugate_a3 $cofactor_c1
    set adjugate_b1 $cofactor_a2
    set adjugate_b2 $cofactor_b2
    set adjugate_b3 $cofactor_c2
    set adjugate_c1 $cofactor_a3
    set adjugate_c2 $cofactor_b3
    set adjugate_c3 $cofactor_c3

    # Compute the determinant of the initial matrix.
    set first  [expr { $a1*(($b2*$c3)-($c2*$b3)) }]
    set second [expr { $b1*(($a2*$c3)-($c2*$a3)) }]
    set third  [expr { $c1*(($a2*$b3)-($b2*$a3)) }]
    set det    [expr { $first-$second+$third     }]

    if { $det == 0 } {
        switch -nocase -- $::DEBUG {
            1       -
            on      -
            true    -
            active  -
            enabled {
                puts stdout "The resulting matrix determinant is '0'."
                puts stdout "Cannot compute the inverse matrix requested."
            }
        }

        return invalid
    }

    # Compute the inverse matrix.
    #
    # | inverse_a1 inverse_b1 inverse_c1 |
    # | inverse_a2 inverse_b2 inverse_c2 | = [list inverse_a1 inverse_a2 inverse_a3 inverse_b1 inverse_b2 inverse_b3 inverse_c1 inverse_c2 inverse_c3]
    # | inverse_a3 inverse_b3 inverse_c3 |
    return  [list [expr { $adjugate_a1/$det }] \
                  [expr { $adjugate_a2/$det }] \
                  [expr { $adjugate_a3/$det }] \
                  [expr { $adjugate_b1/$det }] \
                  [expr { $adjugate_b2/$det }] \
                  [expr { $adjugate_b3/$det }] \
                  [expr { $adjugate_c1/$det }] \
                  [expr { $adjugate_c2/$det }] \
                  [expr { $adjugate_c3/$det }]];
}