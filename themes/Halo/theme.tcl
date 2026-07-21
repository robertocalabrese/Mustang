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
# terms specified inset ::ms::metadata(Halo, this license.
package provide ttk::theme::Halo 0.1

# Set the theme metadata.
set ::ms::metadata(Halo,author)  "Roberto Calabrese a.k.a Kicka"
set ::ms::metadata(Halo,country) Italy
set ::ms::metadata(Halo,email)   robertocalabrese75@gmail.com
set ::ms::metadata(Halo,parent)  clam
set ::ms::metadata(Halo,year)    2025

# The Halo theme is a multi platform theme that works with every operating system.
namespace eval ttk::theme::Halo {
    style theme create "Halo" -parent "clam" -settings {
        # Note: For each style related to a TTK widget:
        #         **Layouts**   commands must be done before any other commands.
        #         **Elements**  commands must be done after the *layouts* commands.
        #         **Configure** commands must be done after *layouts* commands (or *elements* commands if present).
        #         **Map**       commands must be done after a *configure* commands.
        #
        #       For each style related to a classic widget:
        #         **Configure** commands must be done before any *map* commands.
        #         **Map**       commands must be done after a *configure* commands.

        ###################
        ##               ##
        ##     POINT     ##
        ##               ##
        ###################

        # Note: The default style "." is special and it is used as the theme root style on which
        #       the derived default styles are based.

        # Note: The "." widget will follow the Toplevel style unless it is associated to a different style.

        # Normal state
        style configure "."        -background Background \
                                  -bordercolor Bordercolor \
                                  -borderwidth 1 \
                                       -cursor arrow \
                                -insertofftime 300 \
                                 -insertontime 600 \
                                      -padding [list 0] \
                                       -relief solid \
                             -selectbackground White \
                            -selectborderwidth 0 \
                             -selectforeground TextAlternate;
    }
}

#*EOF*