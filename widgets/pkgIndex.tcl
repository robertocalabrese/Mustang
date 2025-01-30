# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

# Safeguard.
set dir [file nativename $dir]

package ifneeded button      1.0 [list source [file join $dir widgets "button.tcl"]]
package ifneeded canvas      1.0 [list source [file join $dir widgets "canvas.tcl"]]
package ifneeded checkbutton 1.0 [list source [file join $dir widgets "checkbutton.tcl"]]
package ifneeded combobox    1.0 [list source [file join $dir widgets "combobox.tcl"]]
package ifneeded contextmenu 1.0 [list source [file join $dir widgets "contextmenu.tcl"]]
package ifneeded entry       1.0 [list source [file join $dir widgets "entry.tcl"]]
package ifneeded frame       1.0 [list source [file join $dir widgets "frame.tcl"]]
package ifneeded label       1.0 [list source [file join $dir widgets "label.tcl"]]
package ifneeded labelframe  1.0 [list source [file join $dir widgets "labelframe.tcl"]]
package ifneeded listbox     1.0 [list source [file join $dir widgets "listbox.tcl"]]
package ifneeded menu        1.0 [list source [file join $dir widgets "menu.tcl"]]
package ifneeded menubutton  1.0 [list source [file join $dir widgets "menubutton.tcl"]]
package ifneeded notebook    1.0 [list source [file join $dir widgets "notebook.tcl"]]
package ifneeded palette     1.0 [list source [file join $dir widgets "palette.tcl"]]
package ifneeded panedwindow 1.0 [list source [file join $dir widgets "panedwindow.tcl"]]
package ifneeded progressbar 1.0 [list source [file join $dir widgets "progressbar.tcl"]]
package ifneeded radiobutton 1.0 [list source [file join $dir widgets "radiobutton.tcl"]]
package ifneeded scale       1.0 [list source [file join $dir widgets "scale.tcl"]]
package ifneeded scrollbar   1.0 [list source [file join $dir widgets "scrollbar.tcl"]]
package ifneeded separator   1.0 [list source [file join $dir widgets "separator.tcl"]]
package ifneeded sizegrip    1.0 [list source [file join $dir widgets "sizegrip.tcl"]]
package ifneeded spinbox     1.0 [list source [file join $dir widgets "spinbox.tcl"]]
package ifneeded text        1.0 [list source [file join $dir widgets "text.tcl"]]
package ifneeded toplevel    1.0 [list source [file join $dir widgets "toplevel.tcl"]]
package ifneeded treeview    1.0 [list source [file join $dir widgets "treeview.tcl"]]

#*EOF*
