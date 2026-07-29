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

# Set the mustang library folder and version number.
set ::ms_library $dir
set ::ms_version 0.1

# Instruct Tcl on how to deliver the mustang package.
package ifneeded mustang $::ms_version {
    package provide mustang $::ms_version

    # Load the mustang core system.
    package require ::ms

    # Load all the mustang commands.
    package require ::ms::bell
    package require ::ms::bind
    package require ::ms::bindtags
    package require ::ms::clipboard
    package require ::ms::color
    package require ::ms::copy
    package require ::ms::cut
    package require ::ms::destroy
    package require ::ms::dialog
    package require ::ms::event
    package require ::ms::focus
    package require ::ms::font
    package require ::ms::grab
    package require ::ms::grid
    package require ::ms::image
    package require ::ms::lower
    package require ::ms::option
    package require ::ms::pack
    package require ::ms::paste
    package require ::ms::place
    package require ::ms::raise
    package require ::ms::selection
    package require ::ms::style
    package require ::ms::tk
    package require ::ms::tkwait
    package require ::ms::winfo
    package require ::ms::wm

    # Note: Windows version of TK don't have the 'send' command.
    switch -nocase -glob -- $::tcl_platform(os) {
        "Win*"  {}
        default { package require ::ms::send }
    }

    # Load all the mustang widgets.
    package require ::ms::button
    package require ::ms::canvas
    package require ::ms::checkbutton
    package require ::ms::combobox
    package require ::ms::cmenu
    package require ::ms::crate
    package require ::ms::embed
    package require ::ms::entry
    package require ::ms::frame
    package require ::ms::label
    package require ::ms::labelframe
    package require ::ms::listbox
    package require ::ms::menu
    package require ::ms::menubutton
    package require ::ms::notebook
    package require ::ms::palette
    package require ::ms::progressbar
    package require ::ms::radiobutton
    package require ::ms::scale
    package require ::ms::scrollbar
    package require ::ms::separator
    package require ::ms::sizegrip
    package require ::ms::spinbox
    package require ::ms::text
    package require ::ms::toolbutton
    package require ::ms::toplevel
    package require ::ms::treeview

    # Note: Panedwindows are disabled for Windows and macOS systems.
    switch -nocase -glob -- $::tcl_platform(os) {
        Darwin  -
        "Win*"  {
            # Rename the original Tk **panedwindow** and **ttk::panedwindow** commands.
            rename panedwindow      _panedwindow
            rename ttk::panedwindow _ttk_panedwindow
        }
        default { package require ::ms::panedwindow }
    }

    # Mustang colormaths.
    package require ::ms::companding
    package require ::ms::inverse_companding
    package require ::ms::HEX8_HEX12
    package require ::ms::HEX8_HEX16
    package require ::ms::HEX8_RGB8
    package require ::ms::HEX12_HEX8
    package require ::ms::HEX12_HEX16
    package require ::ms::HEX12_RGB12
    package require ::ms::HEX16_HEX8
    package require ::ms::HEX16_HEX12
    package require ::ms::HEX16_RGB16
    package require ::ms::HSB_HSI
    package require ::ms::HSB_HSL
    package require ::ms::HSB_HSP
    package require ::ms::HSB_HWB
    package require ::ms::HSB_rgb
    package require ::ms::HSI_HSB
    package require ::ms::HSI_HSL
    package require ::ms::HSI_HSP
    package require ::ms::HSI_HWB
    package require ::ms::HSI_rgb
    package require ::ms::HSL_HSB
    package require ::ms::HSL_HSI
    package require ::ms::HSL_HSP
    package require ::ms::HSL_HWB
    package require ::ms::HSL_rgb
    package require ::ms::HSP_HSB
    package require ::ms::HSP_HSI
    package require ::ms::HSP_HSL
    package require ::ms::HSP_HWB
    package require ::ms::HSP_rgb
    package require ::ms::HWB_HSB
    package require ::ms::HWB_HSI
    package require ::ms::HWB_HSL
    package require ::ms::HWB_HSP
    package require ::ms::HWB_rgb
    package require ::ms::Lab_XYZ
    package require ::ms::Luv_XYZ
    package require ::ms::rgb_HSB
    package require ::ms::rgb_HSI
    package require ::ms::rgb_HSL
    package require ::ms::rgb_HSP
    package require ::ms::rgb_HWB
    package require ::ms::rgb_RGB8
    package require ::ms::rgb_RGB12
    package require ::ms::rgb_RGB16
    package require ::ms::rgb_XYZ
    package require ::ms::RGB8_HEX8
    package require ::ms::RGB8_rgb
    package require ::ms::RGB8_RGB12
    package require ::ms::RGB8_RGB16
    package require ::ms::RGB12_HEX12
    package require ::ms::RGB12_rgb
    package require ::ms::RGB12_RGB8
    package require ::ms::RGB12_RGB16
    package require ::ms::RGB16_HEX16
    package require ::ms::RGB16_rgb
    package require ::ms::RGB16_RGB8
    package require ::ms::RGB16_RGB12
    package require ::ms::xyY_XYZ
    package require ::ms::XYZ_Lab
    package require ::ms::XYZ_Luv
    package require ::ms::XYZ_rgb
    package require ::ms::XYZ_xyY

    # Start mustang.
    ::ms::Init

    # Remove the mustang init procedure.
    rename ::ms::Init ""
}

# Mustang core system.
package ifneeded ::ms $::ms_version [list source [file join $::ms_library "mustang.tcl"]]

# Mustang commands.
package ifneeded ::ms::bell      0.1 [list source [file join $::ms_library cmds "bell.tcl"]]
package ifneeded ::ms::bind      0.1 [list source [file join $::ms_library cmds "bind.tcl"]]
package ifneeded ::ms::bindtags  0.1 [list source [file join $::ms_library cmds "bindtags.tcl"]]
package ifneeded ::ms::clipboard 0.1 [list source [file join $::ms_library cmds "clipboard.tcl"]]
package ifneeded ::ms::color     0.1 [list source [file join $::ms_library cmds "color.tcl"]]
package ifneeded ::ms::copy      0.1 [list source [file join $::ms_library cmds "copy.tcl"]]
package ifneeded ::ms::cut       0.1 [list source [file join $::ms_library cmds "cut.tcl"]]
package ifneeded ::ms::destroy   0.1 [list source [file join $::ms_library cmds "destroy.tcl"]]
package ifneeded ::ms::dialog    0.1 [list source [file join $::ms_library cmds "dialog.tcl"]]
package ifneeded ::ms::event     0.1 [list source [file join $::ms_library cmds "event.tcl"]]
package ifneeded ::ms::focus     0.1 [list source [file join $::ms_library cmds "focus.tcl"]]
package ifneeded ::ms::font      0.1 [list source [file join $::ms_library cmds "font.tcl"]]
package ifneeded ::ms::grab      0.1 [list source [file join $::ms_library cmds "grab.tcl"]]
package ifneeded ::ms::grid      0.1 [list source [file join $::ms_library cmds "grid.tcl"]]
package ifneeded ::ms::image     0.1 [list source [file join $::ms_library cmds "image.tcl"]]
package ifneeded ::ms::lower     0.1 [list source [file join $::ms_library cmds "lower.tcl"]]
package ifneeded ::ms::option    0.1 [list source [file join $::ms_library cmds "option.tcl"]]
package ifneeded ::ms::pack      0.1 [list source [file join $::ms_library cmds "pack.tcl"]]
package ifneeded ::ms::paste     0.1 [list source [file join $::ms_library cmds "paste.tcl"]]
package ifneeded ::ms::place     0.1 [list source [file join $::ms_library cmds "place.tcl"]]
package ifneeded ::ms::raise     0.1 [list source [file join $::ms_library cmds "raise.tcl"]]
package ifneeded ::ms::selection 0.1 [list source [file join $::ms_library cmds "selection.tcl"]]
package ifneeded ::ms::style     0.1 [list source [file join $::ms_library cmds "style.tcl"]]
package ifneeded ::ms::tk        0.1 [list source [file join $::ms_library cmds "tk.tcl"]]
package ifneeded ::ms::tkwait    0.1 [list source [file join $::ms_library cmds "tkwait.tcl"]]
package ifneeded ::ms::winfo     0.1 [list source [file join $::ms_library cmds "winfo.tcl"]]
package ifneeded ::ms::wm        0.1 [list source [file join $::ms_library cmds "wm.tcl"]]

# Note: Windows version of TK don't have the 'send' command.
switch -nocase -glob -- $::tcl_platform(os) {
    "Win*"  {}
    default { package ifneeded ::ms::send 0.1 [list source [file join $::ms_library cmds "send.tcl"]] }
}

# Mustang widgets.
package ifneeded ::ms::button      0.1 [list source [file join $::ms_library widgets "button.tcl"]]
package ifneeded ::ms::canvas      0.1 [list source [file join $::ms_library widgets "canvas.tcl"]]
package ifneeded ::ms::checkbutton 0.1 [list source [file join $::ms_library widgets "checkbutton.tcl"]]
package ifneeded ::ms::combobox    0.1 [list source [file join $::ms_library widgets "combobox.tcl"]]
package ifneeded ::ms::cmenu       0.1 [list source [file join $::ms_library widgets "cmenu.tcl"]]
package ifneeded ::ms::crate       0.1 [list source [file join $::ms_library widgets "crate.tcl"]]
package ifneeded ::ms::embed       0.1 [list source [file join $::ms_library widgets "embed.tcl"]]
package ifneeded ::ms::entry       0.1 [list source [file join $::ms_library widgets "entry.tcl"]]
package ifneeded ::ms::frame       0.1 [list source [file join $::ms_library widgets "frame.tcl"]]
package ifneeded ::ms::label       0.1 [list source [file join $::ms_library widgets "label.tcl"]]
package ifneeded ::ms::labelframe  0.1 [list source [file join $::ms_library widgets "labelframe.tcl"]]
package ifneeded ::ms::listbox     0.1 [list source [file join $::ms_library widgets "listbox.tcl"]]
package ifneeded ::ms::menu        0.1 [list source [file join $::ms_library widgets "menu.tcl"]]
package ifneeded ::ms::menubutton  0.1 [list source [file join $::ms_library widgets "menubutton.tcl"]]
package ifneeded ::ms::notebook    0.1 [list source [file join $::ms_library widgets "notebook.tcl"]]
package ifneeded ::ms::palette     0.1 [list source [file join $::ms_library widgets "palette.tcl"]]
package ifneeded ::ms::progressbar 0.1 [list source [file join $::ms_library widgets "progressbar.tcl"]]
package ifneeded ::ms::radiobutton 0.1 [list source [file join $::ms_library widgets "radiobutton.tcl"]]
package ifneeded ::ms::scale       0.1 [list source [file join $::ms_library widgets "scale.tcl"]]
package ifneeded ::ms::scrollbar   0.1 [list source [file join $::ms_library widgets "scrollbar.tcl"]]
package ifneeded ::ms::separator   0.1 [list source [file join $::ms_library widgets "separator.tcl"]]
package ifneeded ::ms::sizegrip    0.1 [list source [file join $::ms_library widgets "sizegrip.tcl"]]
package ifneeded ::ms::spinbox     0.1 [list source [file join $::ms_library widgets "spinbox.tcl"]]
package ifneeded ::ms::text        0.1 [list source [file join $::ms_library widgets "text.tcl"]]
package ifneeded ::ms::toolbutton  0.1 [list source [file join $::ms_library widgets "toolbutton.tcl"]]
package ifneeded ::ms::toplevel    0.1 [list source [file join $::ms_library widgets "toplevel.tcl"]]
package ifneeded ::ms::treeview    0.1 [list source [file join $::ms_library widgets "treeview.tcl"]]

# Note: Panedwindows are disabled for Windows and macOS systems.
switch -nocase -glob -- $::tcl_platform(os) {
    Darwin  -
    "Win*"  {}
    default { package ifneeded ::ms::panedwindow 0.1 [list source [file join $::ms_library widgets "panedwindow.tcl"]] }
}

# Mustang colormaths.
package ifneeded ::ms::companding         0.1 [list source [file join $::ms_library colormaths "companding.tcl"]]
package ifneeded ::ms::inverse_companding 0.1 [list source [file join $::ms_library colormaths "inverse_companding.tcl"]]
package ifneeded ::ms::HEX8_HEX12         0.1 [list source [file join $::ms_library colormaths "HEX8_HEX12.tcl"]]
package ifneeded ::ms::HEX8_HEX16         0.1 [list source [file join $::ms_library colormaths "HEX8_HEX16.tcl"]]
package ifneeded ::ms::HEX8_RGB8          0.1 [list source [file join $::ms_library colormaths "HEX8_RGB8.tcl"]]
package ifneeded ::ms::HEX12_HEX8         0.1 [list source [file join $::ms_library colormaths "HEX12_HEX8.tcl"]]
package ifneeded ::ms::HEX12_HEX16        0.1 [list source [file join $::ms_library colormaths "HEX12_HEX16.tcl"]]
package ifneeded ::ms::HEX12_RGB12        0.1 [list source [file join $::ms_library colormaths "HEX12_RGB12.tcl"]]
package ifneeded ::ms::HEX16_HEX8         0.1 [list source [file join $::ms_library colormaths "HEX16_HEX8.tcl"]]
package ifneeded ::ms::HEX16_HEX12        0.1 [list source [file join $::ms_library colormaths "HEX16_HEX12.tcl"]]
package ifneeded ::ms::HEX16_RGB16        0.1 [list source [file join $::ms_library colormaths "HEX16_RGB16.tcl"]]
package ifneeded ::ms::HSB_HSI            0.1 [list source [file join $::ms_library colormaths "HSB_HSI.tcl"]]
package ifneeded ::ms::HSB_HSL            0.1 [list source [file join $::ms_library colormaths "HSB_HSL.tcl"]]
package ifneeded ::ms::HSB_HSP            0.1 [list source [file join $::ms_library colormaths "HSB_HSP.tcl"]]
package ifneeded ::ms::HSB_HWB            0.1 [list source [file join $::ms_library colormaths "HSB_HWB.tcl"]]
package ifneeded ::ms::HSB_rgb            0.1 [list source [file join $::ms_library colormaths "HSB_rgb.tcl"]]
package ifneeded ::ms::HSI_HSB            0.1 [list source [file join $::ms_library colormaths "HSI_HSB.tcl"]]
package ifneeded ::ms::HSI_HSL            0.1 [list source [file join $::ms_library colormaths "HSI_HSL.tcl"]]
package ifneeded ::ms::HSI_HSP            0.1 [list source [file join $::ms_library colormaths "HSI_HSP.tcl"]]
package ifneeded ::ms::HSI_HWB            0.1 [list source [file join $::ms_library colormaths "HSI_HWB.tcl"]]
package ifneeded ::ms::HSI_rgb            0.1 [list source [file join $::ms_library colormaths "HSI_rgb.tcl"]]
package ifneeded ::ms::HSL_HSB            0.1 [list source [file join $::ms_library colormaths "HSL_HSB.tcl"]]
package ifneeded ::ms::HSL_HSI            0.1 [list source [file join $::ms_library colormaths "HSL_HSI.tcl"]]
package ifneeded ::ms::HSL_HSP            0.1 [list source [file join $::ms_library colormaths "HSL_HSP.tcl"]]
package ifneeded ::ms::HSL_HWB            0.1 [list source [file join $::ms_library colormaths "HSL_HWB.tcl"]]
package ifneeded ::ms::HSL_rgb            0.1 [list source [file join $::ms_library colormaths "HSL_rgb.tcl"]]
package ifneeded ::ms::HSP_HSB            0.1 [list source [file join $::ms_library colormaths "HSP_HSB.tcl"]]
package ifneeded ::ms::HSP_HSI            0.1 [list source [file join $::ms_library colormaths "HSP_HSI.tcl"]]
package ifneeded ::ms::HSP_HSL            0.1 [list source [file join $::ms_library colormaths "HSP_HSL.tcl"]]
package ifneeded ::ms::HSP_HWB            0.1 [list source [file join $::ms_library colormaths "HSP_HWB.tcl"]]
package ifneeded ::ms::HSP_rgb            0.1 [list source [file join $::ms_library colormaths "HSP_rgb.tcl"]]
package ifneeded ::ms::HWB_HSB            0.1 [list source [file join $::ms_library colormaths "HWB_HSB.tcl"]]
package ifneeded ::ms::HWB_HSI            0.1 [list source [file join $::ms_library colormaths "HWB_HSI.tcl"]]
package ifneeded ::ms::HWB_HSL            0.1 [list source [file join $::ms_library colormaths "HWB_HSL.tcl"]]
package ifneeded ::ms::HWB_HSP            0.1 [list source [file join $::ms_library colormaths "HWB_HSP.tcl"]]
package ifneeded ::ms::HWB_rgb            0.1 [list source [file join $::ms_library colormaths "HWB_rgb.tcl"]]
package ifneeded ::ms::Lab_XYZ            0.1 [list source [file join $::ms_library colormaths "Lab_XYZ.tcl"]]
package ifneeded ::ms::Luv_XYZ            0.1 [list source [file join $::ms_library colormaths "Luv_XYZ.tcl"]]
package ifneeded ::ms::rgb_HSB            0.1 [list source [file join $::ms_library colormaths "rgb_HSB.tcl"]]
package ifneeded ::ms::rgb_HSI            0.1 [list source [file join $::ms_library colormaths "rgb_HSI.tcl"]]
package ifneeded ::ms::rgb_HSL            0.1 [list source [file join $::ms_library colormaths "rgb_HSL.tcl"]]
package ifneeded ::ms::rgb_HSP            0.1 [list source [file join $::ms_library colormaths "rgb_HSP.tcl"]]
package ifneeded ::ms::rgb_HWB            0.1 [list source [file join $::ms_library colormaths "rgb_HWB.tcl"]]
package ifneeded ::ms::rgb_RGB8           0.1 [list source [file join $::ms_library colormaths "rgb_RGB8.tcl"]]
package ifneeded ::ms::rgb_RGB12          0.1 [list source [file join $::ms_library colormaths "rgb_RGB12.tcl"]]
package ifneeded ::ms::rgb_RGB16          0.1 [list source [file join $::ms_library colormaths "rgb_RGB16.tcl"]]
package ifneeded ::ms::rgb_XYZ            0.1 [list source [file join $::ms_library colormaths "rgb_XYZ.tcl"]]
package ifneeded ::ms::RGB8_HEX8          0.1 [list source [file join $::ms_library colormaths "RGB8_HEX8.tcl"]]
package ifneeded ::ms::RGB8_rgb           0.1 [list source [file join $::ms_library colormaths "RGB8_rgb.tcl"]]
package ifneeded ::ms::RGB8_RGB12         0.1 [list source [file join $::ms_library colormaths "RGB8_RGB12.tcl"]]
package ifneeded ::ms::RGB8_RGB16         0.1 [list source [file join $::ms_library colormaths "RGB8_RGB16.tcl"]]
package ifneeded ::ms::RGB12_HEX12        0.1 [list source [file join $::ms_library colormaths "RGB12_HEX12.tcl"]]
package ifneeded ::ms::RGB12_rgb          0.1 [list source [file join $::ms_library colormaths "RGB12_rgb.tcl"]]
package ifneeded ::ms::RGB12_RGB8         0.1 [list source [file join $::ms_library colormaths "RGB12_RGB8.tcl"]]
package ifneeded ::ms::RGB12_RGB16        0.1 [list source [file join $::ms_library colormaths "RGB12_RGB16.tcl"]]
package ifneeded ::ms::RGB16_HEX16        0.1 [list source [file join $::ms_library colormaths "RGB16_HEX16.tcl"]]
package ifneeded ::ms::RGB16_rgb          0.1 [list source [file join $::ms_library colormaths "RGB16_rgb.tcl"]]
package ifneeded ::ms::RGB16_RGB8         0.1 [list source [file join $::ms_library colormaths "RGB16_RGB8.tcl"]]
package ifneeded ::ms::RGB16_RGB12        0.1 [list source [file join $::ms_library colormaths "RGB16_RGB12.tcl"]]
package ifneeded ::ms::xyY_XYZ            0.1 [list source [file join $::ms_library colormaths "xyY_XYZ.tcl"]]
package ifneeded ::ms::XYZ_Lab            0.1 [list source [file join $::ms_library colormaths "XYZ_Lab.tcl"]]
package ifneeded ::ms::XYZ_Luv            0.1 [list source [file join $::ms_library colormaths "XYZ_Luv.tcl"]]
package ifneeded ::ms::XYZ_rgb            0.1 [list source [file join $::ms_library colormaths "XYZ_rgb.tcl"]]
package ifneeded ::ms::XYZ_xyY            0.1 [list source [file join $::ms_library colormaths "XYZ_xyY.tcl"]]

#*EOF*