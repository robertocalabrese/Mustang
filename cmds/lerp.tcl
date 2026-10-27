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
package provide ::lerp 0.1

# Create the mustang **XYZ_rgb** package.
namespace eval ::ms::lerp {}

# Create an alias for the mustang **XYZ_rgb** conversion command.
interp alias {} ::lerp {} ::ms::lerp::Operation

# Operation
#
# Performs a linear interpolation.
#
# Where:
#
# value          Should be a double specifing the value in which calculate the function.
#
# value_min      Should be a double specifing the first allowed value immediately inferior to *value*.
#
# value_max      Should be a double specifing the first allowed value immediately superior to *value*.
#
# function_min   Should be a double specifing the value of the function at *value_min*.
#
# function_max   Should be a double specifing the value of the function at *value_max*.
#
# INFO: This is the precise method which guarantees **v** = **v1** when **t1** = **1**.
#       In mathematics, linear interpolation is a method of curve fitting using linear polynomials.
#       Linear interpolation is often used to fill the gaps in a table, approximating a value of some function f,
#       using two known values of that function at other points.
#
# EXAMPLE: Suppose that one has a table listing the population of some
#          country like this:
#
#             1970 - 500000  citizens.
#             1980 - 1000000 citizens.
#             1990 - 2000000 citizens.
#             2000 - 3000000 citizens.
#
#          and that one wanted to estimate the population in 1994.
#          Linear interpolation is an easy way to do this, just pass to the 'lerp' command this values:
#
#             value       will be 1994.
#             valueMin    will be 1990.
#             valueMax    will be 2000.
#             fuctionMin  will be 2000000.
#             fuctionMax  will be 3000000.
#
#          The result will be: 2400000.
#          This means that in 1994 the estimated population is 2400000.
#
# Returns the interpolated value of the function.
proc ::ms::lerp::Operation { value value_min value_max function_min function_max } {
    # Make sure that the values provided are doubles.
    set value_min [expr { double($value_min) }]
    set value_max [expr { double($value_max) }]
    set value     [expr { double($value) }]

    # Execute the command.
    set t1 [expr { ($value-$value_min)/($value_max-$value_min) }]
    set t0 [expr { 1.0-$t1 }]
    return [expr { ($t0*$function_min)+($t1*$function_max) }]
}

#*EOF*