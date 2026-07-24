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

## winfo - Return window-related information
#
#### SYNOPSIS
#
# **winfo** **atom** ?**-displayof** *window*? *name*
# **winfo** **atomname** ?**-displayof** *window*? *id*
# **winfo** **cells** *window*
# **winfo** **children** *window*
# **winfo** **class** *window*
# **winfo** **colormapfull** *window*
# **winfo** **containing** ?**-displayof** *window*? *rootX* *rootY*
# **winfo** **depth** *window*
# **winfo** **exists** *window*
# **winfo** **fpixels** *window* *number*
# **winfo** **geometry** *window*
# **winfo** **height** *window*
# **winfo** **id** *window*
# **winfo** **interps** ?**-displayof** *window*?
# **winfo** **ismapped** *window*
# **winfo** **manager** *window*
# **winfo** **name** *window*
# **winfo** **parent** *window*
# **winfo** **pathname** ?**-displayof** *window*? *id*
# **winfo** **pixels** *window* *number*
# **winfo** **pointerx** *window*
# **winfo** **pointerxy** *window*
# **winfo** **pointery** *window*
# **winfo** **reqheight** *window*
# **winfo** **reqwidth** *window*
# **winfo** **rgb** *window* *color*
# **winfo** **rootx** *window*
# **winfo** **rooty** *window*
# **winfo** **screen** *window*
# **winfo** **screencells** *window*
# **winfo** **screendepth** *window*
# **winfo** **screenheight** *window*
# **winfo** **screenmmheight** *window*
# **winfo** **screenmmwidth** *window*
# **winfo** **screenvisual** *window*
# **winfo** **screenwidth** *window*
# **winfo** **server** *window*
# **winfo** **toplevel** *window*
# **winfo** **viewable** *window*
# **winfo** **visual** *window*
# **winfo** **visualid** *window*
# **winfo** **visualsavailable** *window* ?*includeids*?
# **winfo** **vrootheight** *window*
# **winfo** **vrootwidth** *window*
# **winfo** **vrootx** *window*
# **winfo** **vrooty** *window*
# **winfo** **width** *window*
# **winfo** **x** *window*
# **winfo** **y** *window*
#
# Note: Each *window* pathname involved may be provided either as a short or as a real address.
#       *Action*s that gives as a result a window pathname (or more than one), will always return the address as:
#          - A short address, if the *window* provided as input is a short address.
#          - A real address, if the *window* provided as input is a real address.
#       Unless stated differently.
#       You can always convert a real address into a short address through the **tk get short** command.
#
#### DESCRIPTION
#
# The **winfo** command is used to retrieve information about windows managed by Tk.
# The *winfo* command can have any of several forms, depending on the *action* argument.
# The *action* argument is always the first argument after the command itself.
# The legal forms are:
#
#   **winfo** **atom** ?**-displayof** *window*? *name*
#      Returns a decimal string giving the integer identifier for the atom whose name is *name*.
#      If no atom exists with the name *name* then a new one is created.
#
#      If the **-displayof** option is given then the atom is looked up on the display
#      of *window*; otherwise it is looked up on the display of the application's main window.
#
#   **winfo** **atomname** ?**-displayof** *window*? *id*
#      Returns the textual name for the atom whose integer identifier is *id*.
#
#      If the **-displayof** option is given then the identifier is looked up on the display
#      of *window*; otherwise it is looked up on the display of the application's main window.
#
#      This command is the inverse of the **winfo atom** command.
#      It generates an error if no such atom exists.
#
#   **winfo** **cells** *window*
#      Returns a decimal string giving the number of cells in the color map for *window*.
#
#   **winfo** **children** *window*
#      Returns a list containing the pathnames of all the children of *window*.
#
#      Top-level windows are returned as children of their logical parents.
#
#      The list is in stacking order, with the lowest window first, except for Top-level windows
#      which are not returned in stacking order.
#
#      Use the **wm stackorder** command to query the stacking order of Top-level windows.
#
#      ATTENTION! Differently than others mustang commands, the **winfo children** command will **always**
#                 return real addresses, even if a short address was provided as input.
#
#                 You can always translate a real address into a short address using the **tk get short**
#                 command or a short address into a real address using the **tk get real** command.
#
#   **winfo** **class** *window*
#      Returns the class name for *window*.
#
#   **winfo** **colormapfull** *window*
#      Returns **1** if the colormap for *window* is known to be full, **0** otherwise.
#
#      The colormap for a window is "known" to be full if the last attempt to allocate a new color
#      on that window failed and this application has not freed any colors in the colormap since
#      the failed allocation.
#
#   **winfo** **containing** ?**-displayof** *window*? *rootX* *rootY*
#      Returns the pathname for the window containing the point given by *rootX* and *rootY*.
#
#      *RootX* and *rootY* are specified in screen units (i.e. any form acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html))
#      in the coordinate system of the root window (if a virtual-root window manager is in use then the
#      coordinate system of the virtual root window is used).
#
#      If the **-displayof** option is given then the coordinates refer to the screen containing *window*;
#      otherwise they refer to the screen of the application's main window.
#
#      If no window in this application contains the point then an empty string is returned.
#      An empty string is also returned if the point lies in the title bar or border of its highest containing
#      toplevel in this application. Note that with some window managers the borders may be invisible.
#
#      In selecting the containing window, children are given higher priority than parents and among siblings
#      the highest one in the stacking order is chosen.
#
#      ATTENTION! Differently than others mustang commands, the **winfo containing** command will **always**
#                 return real addresses, even if a short address was provided as input.
#
#                 You can always translate a real address into a short address using the **tk get short**
#                 command or a short address into a real address using the **tk get real** command.
#
#   **winfo** **depth** *window*
#      Returns a decimal string giving the depth of *window* (number of bits per pixel).
#
#   **winfo** **exists** *window*
#      Returns **1** if there exists a window named *window*, **0** if no such window exists.
#
#   **winfo** **fpixels** *window* *number*
#      Returns a floating-point value giving the number of pixels in *window* corresponding to the
#      distance given by number.
#
#      Number may be specified in any of the forms acceptable to [Tk_GetScreenMM](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html),
#      such as "2.0c" or "1i".
#
#      The return value may be fractional; for an integer value, use **winfo pixels**.
#
#   **winfo** **geometry** *window*
#      Returns the geometry for *window*, in the form *width***x***height***+***x***+***y*.
#      All dimensions are in pixels.
#
#   **winfo** **height** *window*
#      Returns a decimal string giving *window*'s height in pixels.
#      When a window is first created its height will be 1 pixel; the height will eventually be changed
#      by a geometry manager to fulfil the window's needs.
#
#      If you need the true height immediately after creating a widget, invoke **update** to force
#      the geometry manager to arrange it, or use **winfo reqheight** to get the *window*'s requested
#      height instead of its actual height.
#
#   **winfo** **id** *window*
#      Returns a hexadecimal string giving a low-level platform-specific identifier for *window*.
#
#      On Unix platforms, this is the X window identifier.
#      Under Windows, this is the Windows HWND.
#      On the Macintosh the value has no meaning outside Tk.
#
#   **winfo** **interps** ?**-displayof** *window*?
#      Returns a list whose members are the names of all Tcl interpreters (e.g. all Tk-based applications)
#      currently registered for a particular display.
#
#      If the **-displayof** option is given then the return value refers to the display of *window*;
#      otherwise it refers to the display of the application's main window.
#
#   **winfo** **ismapped** *window*
#      Returns **1** if *window* is currently mapped, **0** otherwise.
#
#   **winfo** **manager** *window*
#      Returns the name of the geometry manager currently responsible for *window*, or an empty
#      string if *window* is not managed by any geometry manager.
#
#      The name is usually the name of the Tcl command for the geometry manager, such as **pack**
#      or **place**. If the geometry manager is a widget, such as canvases or text, the name is the
#      widget's class command, such as **canvas**.
#
#   **winfo** **name** *window*
#      Returns *window*'s name (i.e. its name within its parent, as opposed to its full pathname).
#      The command **winfo name .** will return the name of the application.
#
#   **winfo** **parent** *window*
#      Returns the pathname of *pathname*'s parent, or an empty string if *pathname* is the main window
#      of the application.
#
#   **winfo** **pathname** ?**-displayof** *window*? *id*
#      Returns the pathname of the window whose X identifier is *id*.
#
#      *Id* must be a decimal, hexadecimal, or octal integer and must correspond to a window in the
#      invoking application.
#
#      If the **-displayof** option is given then the identifier is looked up on the display of *window*;
#      otherwise it is looked up on the display of the application's main window.
#
#      ATTENTION! Differently than others mustang commands, the **winfo pathname** command will **always**
#                 return real addresses, even if a short address was provided as input.
#
#                 You can always translate a real address into a short address using the **tk get short**
#                 command or a short address into a real address using the **tk get real** command.
#
#   **winfo** **pixels** *window* *number*
#      Returns the number of pixels in *window* corresponding to the distance given by *number*.
#
#      *Number* may be specified in any of the forms acceptable to [Tk_GetPixels](https://www.tcl-lang.org/man/tcl9.0/TkLib/GetPixels.html),
#      such as "2.0c" or "1i".
#
#      The result is rounded to the nearest integer value; for a fractional result, use **winfo fpixels**.
#
#   **winfo** **pointerx** *window*
#      If the mouse pointer is on the same screen as *window*, returns the pointer's x coordinate,
#      measured in pixels in the screen's root window.
#
#      If a virtual root window is in use on the screen, the position is measured in the virtual root.
#
#      If the mouse pointer is not on the same screen as window then **-1** is returned.
#
#   **winfo** **pointerxy** *window*
#      If the mouse pointer is on the same screen as *window*, returns a list with two elements,
#      which are the pointer's x and y coordinates measured in pixels in the screen's root window.
#
#      If a virtual root window is in use on the screen, the position is computed in the virtual root.
#
#      If the mouse pointer is not on the same screen as *window* then both of the returned
#      coordinates are **-1**.
#
#   **winfo** **pointery** *window*
#      If the mouse pointer is on the same screen as *window*, returns the pointer's y coordinate,
#      measured in pixels in the screen's root window.
#
#      If a virtual root window is in use on the screen, the position is computed in the virtual root.
#
#      If the mouse pointer is not on the same screen as *window* then **-1** is returned.
#
#   **winfo** **reqheight** *window*
#      Returns a decimal string giving *window*'s requested height, in pixels.
#      This is the value used by *window*'s geometry manager to compute its geometry.
#
#   **winfo** **reqwidth** *window*
#      Returns a decimal string giving *window*'s requested width, in pixels.
#      This is the value used by *window*'s geometry manager to compute its geometry.
#
#   **winfo** **rgb** *window* *color*
#      Returns a list containing three decimal values in the range 0 to 65535, which are the red,
#      green, and blue intensities that correspond to *color* in the window given by *window*.
#
#      *Color* may be specified in any of the forms acceptable for a color option.
#
#   **winfo** **rootx** *window*
#      Returns a decimal string giving the x-coordinate, in the root window of the screen,
#      of the upper-left corner of *window*'s border (or *window* if it has no border).
#
#   **winfo** **rooty** *window*
#      Returns a decimal string giving the y-coordinate, in the root window of the screen,
#      of the upper-left corner of *window*'s border (or *window* if it has no border).
#
#   **winfo** **screen** *window*
#      Returns the name of the screen associated with *window*, in the form **displayName**.**screenIndex**.
#
#   **winfo** **screencells** *window*
#      Returns a decimal string giving the number of cells in the default color map for *window*'s
#      screen.
#
#   **winfo** **screendepth** *window*
#      Returns a decimal string giving the depth of the root window of *window*'s screen (number of
#      bits per pixel).
#
#   **winfo** **screenheight** *window*
#      Returns a decimal string giving the height of *window*'s screen, in pixels.
#
#   **winfo** **screenmmheight** *window*
#      Returns a decimal string giving the height of *window*'s screen, in millimeters.
#
#   **winfo** **screenmmwidth** *window*
#      Returns a decimal string giving the width of *window*'s screen, in millimeters.
#
#   **winfo** **screenvisual** *window*
#      Returns one of the following strings to indicate the default visual class for *window*'s
#      screen: **directcolor**, **grayscale**, **pseudocolor**, **staticcolor**, **staticgray**,
#      or **truecolor**.
#
#   **winfo** **screenwidth** *window*
#      Returns a decimal string giving the width of *window*'s screen, in pixels.
#
#   **winfo** **server** *window*
#      Returns a string containing information about the server for *window*'s display.
#
#      The exact format of this string may vary from platform to platform.
#
#      For X servers the string has the form "**X***major***R***minor* *vendor* *vendorVersion*"
#      where *major* and *minor* are the version and revision numbers provided by the server (e.g., **X11R5**),
#      *vendor* is the name of the vendor for the server, and *vendorRelease* is an integer release number
#      provided by the server.
#
#   **winfo** **toplevel** *window*
#      Returns the pathname of the top-of-hierarchy window containing *window*.
#      In standard Tk this will always be a toplevel widget, but extensions may create other kinds of
#      top-of-hierarchy widgets.
#
#   **winfo** **viewable** *window*
#      Returns **1** if *window* and all of its ancestors up through the nearest toplevel window are mapped.
#      Returns **0** if any of these windows are not mapped.
#
#   **winfo** **visual** *window*
#      Returns one of the following strings to indicate the visual class for *window*: **directcolor**,
#      **grayscale**, **pseudocolor**, **staticcolor**, **staticgray**, or **truecolor**.
#
#   **winfo** **visualid** *window*
#      Returns the X identifier for the visual for *window*.
#
#   **winfo** **visualsavailable** *window* ?*includeids*?
#      Returns a list whose elements describe the visuals available for *window*'s screen.
#
#      Each element consists of a visual class followed by an integer depth.
#      The class has the same form as returned by winfo visual.
#      The depth gives the number of bits per pixel in the visual.
#
#      In addition, if the *includeids* argument is provided, then the depth is followed by the X identifier
#      for the visual.
#
#   **winfo** **vrootheight** *window*
#      Returns the height of the virtual root window associated with *window* if there is one;
#      otherwise returns the height of *window*'s screen.
#
#   **winfo** **vrootwidth** *window*
#      Returns the width of the virtual root window associated with *window* if there is one;
#      otherwise returns the width of *window*'s screen.
#
#   **winfo** **vrootx** *window*
#      Returns the x-offset of the virtual root window associated with *window*, relative to the root window
#      of its screen. This is normally either zero or negative. Returns **0** if there is no virtual root window
#      for *window*.
#
#   **winfo** **vrooty** *window*
#      Returns the y-offset of the virtual root window associated with *window*, relative to the root window
#      of its screen. This is normally either zero or negative. Returns **0** if there is no virtual root window
#      for *window*.
#
#   **winfo** **width** *window*
#      Returns a decimal string giving *window*'s width in pixels.
#
#      When a window is first created its width will be **1** pixel; the width will eventually be changed
#      by a geometry manager to fulfil the *window*'s needs.
#
#      If you need the true width immediately after creating a widget, invoke **update** to force the
#      geometry manager to arrange it, or use **winfo reqwidth** to get the *window*'s requested width
#      instead of its actual width.
#
#   **winfo** **x** *window*
#      Returns a decimal string giving the x-coordinate, in *window*'s parent, of the upper-left corner
#      of *window*'s border (or *window* if it has no border).
#
#   **winfo** **y** *window*
#      Returns a decimal string giving the y-coordinate, in *window*'s parent, of the upper-left corner
#      of *window*'s border (or *window* if it has no border).
package provide ::ms::winfo 0.1

# Create the mustang **winfo** package.
namespace eval ::ms::winfo {}

# Rename the original Tk **winfo** command.
rename winfo _winfo

# Create an alias for the mustang **winfo** command.
interp alias {} winfo {} ::ms::winfo::Command

## Command
#
# Replace the Tk **winfo** command.
#
# Where:
#
# args   Should be the arguments of the **winfo** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::winfo::Command { args } {
    # Get the caller information.
    set caller_info [info frame -1]

    # Separate the 'action' from the actual 'args'.
    set action [lindex  $args 0]
    set args   [lremove $args 0]
    switch -- $action {
        atom     -
        atomname {
            switch -- [llength $args] {
                1   {}
                3   {
                    # '-displayof'
                    switch -- [lindex $args 0] {
                        "-displayof" {
                            set window [lindex $args 1]

                            # Get the real address associated with 'window'.
                            set result [::ms::Check_Pathname $window invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                default {
                                    set w    [lindex $result 0]
                                    set type [lindex $result 1]

                                    # Check the initial address type provided (short or real).
                                    switch -- $type {
                                        short {
                                            # Substitute 'window' with its relative real address.
                                            set args [lreplace $args 1 1 $w]
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _winfo $action {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        children {
            # ATTENTION! Differently than others mustang commands, the **winfo children** command will **always**
            #            return real addresses, even if a short address was provided as input.
            #
            #            You can always ask if an address is a short or real address with **tk get addr**.
            #            You can always translate a real address into a short address using the **tk get short**
            #            command or a short address into a real address using the **tk get real** command.
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Execute the command.
                    try {
                        _winfo children $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        containing {
            # ATTENTION! Differently than others mustang commands, the **winfo containing** command will **always**
            #            return real addresses, even if a short address was provided as input.
            #
            #            You can always ask if an address is a short or real address with **tk get addr**.
            #            You can always translate a real address into a short address using the **tk get short**
            #            command or a short address into a real address using the **tk get real** command.
            switch -- [llength $args] {
                2   {}
                4   {
                    # '-displayof'
                    switch -- [lindex $args 0] {
                        "-displayof" {
                            set window [lindex $args 1]

                            # Get the real address associated with 'window'.
                            set result [::ms::Check_Pathname $window invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                default {
                                    set w    [lindex $result 0]
                                    set type [lindex $result 1]

                                    # Check the initial address type provided (short or real).
                                    switch -- $type {
                                        short {
                                            # Substitute 'window' with its relative real address.
                                            set args [lreplace $args 1 1 $w]
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _winfo containing {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        exists {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the 'window' real address.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { return 0 }
                        default { return 1 }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        interps {
            switch -- [llength $args] {
                0   {
                    # Execute the command.
                    try {
                        _winfo interps
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                2   {
                    # '-displayof'
                    switch -- [lindex $args 0] {
                        "-displayof" {
                            set window [lindex $args 1]

                            # Get the real address associated with 'window'.
                            set result [::ms::Check_Pathname $window invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                default {
                                    set w    [lindex $result 0]
                                    set type [lindex $result 1]

                                    # Check the initial address type provided (short or real).
                                    switch -- $type {
                                        short {
                                            # Substitute 'window' with its relative real address.
                                            set args [lreplace $args 1 1 $w]
                                        }
                                    }
                                }
                            }
                        }
                    }

                    # Execute the command.
                    try {
                        _winfo interps {*}$args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        parent {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the 'window' real address.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default {
                            set w    [lindex $result 0]
                            set type [lindex $result 1]
                        }
                    }

                    # Execute the command.
                    try {
                        _winfo parent $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { parent } {
                        # Check the initial address type provided (short or real).
                        switch -- $type {
                            short {
                                switch -- [info exists ::ms::addr($parent,short)] {
                                    0   { return $parent }
                                    1   { return $::ms::addr($parent,short) }
                                }
                            }
                            default { return $parent }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        pathname {
            # ATTENTION! Differently than others mustang commands, the **winfo pathname** command will **always**
            #            return real addresses, even if a short address was provided as input.
            #
            #            You can always ask if an address is a short or real address with **tk get addr**.
            #            You can always translate a real address into a short address using the **tk get short**
            #            command or a short address into a real address using the **tk get real** command.
            switch -- [llength $args] {
                1   {}
                3   {
                    # '-displayof'
                    switch -- [lindex $args 0] {
                        "-displayof" {
                            set window [lindex $args 1]

                            # Get the real address associated with 'window'.
                            set result [::ms::Check_Pathname $window invalid]
                            switch -- $result {
                                invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                                default {
                                    set w    [lindex $result 0]
                                    set type [lindex $result 1]

                                    # Check the initial address type provided (short or real).
                                    switch -- $type {
                                        short {
                                            # Substitute 'window' with its relative real address.
                                            set args [lreplace $args 1 1 $w]
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _winfo pathname {*}$args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        fpixels -
        pixels  -
        rgb     {
            switch -- [llength $args] {
                2   {
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Execute the command.
                    try {
                        _winfo $action $w $args
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        visualsavailable {
            switch -- [llength $args] {
                1   {}
                2   {
                    set window [lindex  $args 0]
                    set args   [lremove $args 0]

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }

            # Execute the command.
            try {
                _winfo visualsavailable $w $args
            } on error { errortext errorcode } {
                ::ms::Error "$errortext" $caller_info
            } on ok { result } {
                return $result
            }
        }
        cells          -
        class          -
        colormapfull   -
        depth          -
        geometry       -
        height         -
        id             -
        ismapped       -
        manager        -
        name           -
        pointerx       -
        pointerxy      -
        pointery       -
        reqheight      -
        reqwidth       -
        rootx          -
        rooty          -
        screen         -
        screencells    -
        screendepth    -
        screenheight   -
        screenmmheight -
        screenmmwidth  -
        screenvisual   -
        screenwidth    -
        server         -
        toplevel       -
        viewable       -
        visual         -
        visualid       -
        vrootheight    -
        vrootwidth     -
        vrootx         -
        vrooty         -
        width          -
        x              -
        y              {
            switch -- [llength $args] {
                1   {
                    set window $args

                    # Get the real address associated with 'window'.
                    set result [::ms::Check_Pathname $window invalid]
                    switch -- $result {
                        invalid { ::ms::Error "Invalid address, '$window'." $caller_info }
                        default { set w [lindex $result 0] }
                    }

                    # Execute the command.
                    try {
                        _winfo $action $w
                    } on error { errortext errorcode } {
                        ::ms::Error "$errortext" $caller_info
                    } on ok { result } {
                        return $result
                    }
                }
                default { ::ms::Error "Invalid number of arguments." $caller_info }
            }
        }
        default { ::ms::Error "Invalid option, '$action'." $caller_info }
    }
}

#*EOF*