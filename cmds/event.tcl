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
package provide ::ms::event 0.1

# Create the mustang **event** package.
namespace eval ::ms::event {}

# Rename the original Tk **event** command.
rename event _event

# Create an alias for the mustang **event** command.
interp alias {} event {} ::ms::event::Command

## Command
#
# Replace the Tk **event** command.
#
# Where:
#
# args   Should be the arguments of the **event** command.
#
# Depending on the *action* provided, the return value/s may vary.
proc ::ms::event::Command { args } {
    # For the time being we launch the Tk original command with one caveat,
    # the address provided must be a real address.
    # Short addresses are not covered until the new command is written.
    _event {*}$args
}

##############################################################################################
##                                                                                          ##
##     DEFINE/REDEFINE/REMOVE SOME TK VIRTUAL EVENTS BINDINGS ACROSS MULTIPLE PLATFORMS     ##
##                                                                                          ##
##############################################################################################

# Remove some virtual events previously defined by Tk.
_event delete <<Cut>>
_event delete <<Copy>>
_event delete <<Paste>>
_event delete <<PasteSelection>>

_event delete <<ToggleSelection>>

_event delete <<Undo>>
_event delete <<Redo>>

_event delete <<ContextMenu>>

_event delete <<PrevChar>>
_event delete <<NextChar>>

_event delete <<PrevWord>>
_event delete <<NextWord>>

_event delete <<PrevLine>>
_event delete <<NextLine>>

_event delete <<PrevPara>>
_event delete <<NextPara>>

_event delete <<LineStart>>
_event delete <<LineEnd>>

_event delete <<SelectAll>>
_event delete <<SelectNone>>

_event delete <<SelectPrevChar>>
_event delete <<SelectNextChar>>

_event delete <<SelectPrevWord>>
_event delete <<SelectNextWord>>

_event delete <<SelectPrevLine>>
_event delete <<SelectNextLine>>

_event delete <<SelectPrevPara>>
_event delete <<SelectNextPara>>

_event delete <<SelectLineStart>>
_event delete <<SelectLineEnd>>

# Define the new virtual events that will be present in mustang.
switch -- [tk windowingsystem] {
    "aqua" {
        # Note: On Darwin/Aqua, mouse buttons from left to right are 1,3,2.
        #       See https://support.apple.com/en-us/HT201236

        _event add <<Cut>>             <Command-KeyPress-x> <Command-KeyPress-X> <F2>
        _event add <<Copy>>            <Command-KeyPress-c> <Command-KeyPress-C> <F3>
        _event add <<Paste>>           <Command-KeyPress-v> <Command-KeyPress-V> <F4>
        _event add <<PasteSelection>>  <ButtonRelease-3>
        _event add <<ToggleSelection>> <ButtonPress-1> <Control-ButtonPress-1> <space> <Return> <KP_Enter>

        _event add <<Delete_Char>> <Fn-BackSpace>        <Control-KeyPress-d> <Control-KeyPress-D>
        _event add <<Delete_Word>> <Fn-Option-BackSpace> <Option-KeyPress-d>  <Option-KeyPress-D>

        _event add <<Undo>> <Command-KeyPress-z>       <Command-KeyPress-Z>
        _event add <<Redo>> <Shift-Command-KeyPress-z> <Shift-Command-KeyPress-Z>

        _event add <<ContextMenu>> <ButtonPress-2>

        _event add <<Scan_Mark>>    <ButtonPress-3>
        _event add <<Scan_Drag>>    <B3-Motion>
        _event add <<Scan_Release>> <ButtonRelease-3>

        _event add <<SelectAll>>  <Command-KeyPress-a>       <Command-KeyPress-A>
        _event add <<SelectNone>> <Command-Shift-KeyPress-a> <Command-Shift-KeyPress-A> <Clear>

        _event add <<PrevLine>>       <KeyPress-Up>       <Control-KeyPress-p>       <Control-KeyPress-P>
        _event add <<SelectPrevLine>> <Shift-KeyPress-Up> <Control-Shift-KeyPress-p> <Control-Shift-KeyPress-P>

        _event add <<NextLine>>       <KeyPress-Down>       <Control-KeyPress-n>       <Control-KeyPress-N>
        _event add <<SelectNextLine>> <Shift-KeyPress-Down> <Control-Shift-KeyPress-n> <Control-Shift-KeyPress-N>

        _event add <<PrevChar>>       <KeyPress-Left>       <Control-KeyPress-b>       <Control-KeyPress-B>
        _event add <<SelectPrevChar>> <Shift-KeyPress-Left> <Control-Shift-KeyPress-b> <Control-Shift-KeyPress-B>

        _event add <<NextChar>>       <KeyPress-Right>       <Control-KeyPress-f>       <Control-KeyPress-F>
        _event add <<SelectNextChar>> <Shift-KeyPress-Right> <Control-Shift-KeyPress-f> <Control-Shift-KeyPress-F>

        _event add <<PrevPara>>       <Option-KeyPress-Up>       <Option-Control-KeyPress-p>       <Option-Control-KeyPress-P>
        _event add <<SelectPrevPara>> <Option-Shift-KeyPress-Up> <Option-Control-Shift-KeyPress-p> <Option-Control-Shift-KeyPress-P>

        _event add <<NextPara>>       <Option-KeyPress-Down>       <Option-Control-KeyPress-n>       <Option-Control-KeyPress-N>
        _event add <<SelectNextPara>> <Option-Shift-KeyPress-Down> <Option-Control-Shift-KeyPress-n> <Option-Control-Shift-KeyPress-N>

        _event add <<PrevWord>>       <Option-KeyPress-Left>       <Option-Control-KeyPress-b>       <Option-Control-KeyPress-B>
        _event add <<SelectPrevWord>> <Option-Shift-KeyPress-Left> <Option-Control-Shift-KeyPress-b> <Option-Control-Shift-KeyPress-B>

        _event add <<NextWord>>       <Option-KeyPress-Right>       <Option-Control-KeyPress-f>       <Option-Control-KeyPress-F>
        _event add <<SelectNextWord>> <Option-Shift-KeyPress-Right> <Option-Control-Shift-KeyPress-f> <Option-Control-Shift-KeyPress-F>

        _event add <<LineTop>>       <Command-KeyPress-Home>       <Command-KeyPress-Up>       <Command-Control-KeyPress-a>       <Command-Control-KeyPress-A>
        _event add <<SelectLineTop>> <Command-Shift-KeyPress-Home> <Command-Shift-KeyPress-Up> <Command-Control-Shift-KeyPress-a> <Command-Control-Shift-KeyPress-A>

        _event add <<LineBottom>>       <Command-KeyPress-End>       <Command-KeyPress-Down>       <Command-Control-KeyPress-e>       <Command-Control-KeyPress-E>
        _event add <<SelectLineBottom>> <Command-Shift-KeyPress-End> <Command-Shift-KeyPress-Down> <Command-Control-Shift-KeyPress-e> <Command-Control-Shift-KeyPress-E>

        _event add <<LineStart>>       <KeyPress-Home>       <Command-KeyPress-Left>       <Control-KeyPress-a>       <Control-KeyPress-A>
        _event add <<SelectLineStart>> <Shift-KeyPress-Home> <Command-Shift-KeyPress-Left> <Control-Shift-KeyPress-a> <Control-Shift-KeyPress-A>

        _event add <<LineEnd>>       <KeyPress-End>       <Command-KeyPress-Right>       <Control-KeyPress-e>       <Control-KeyPress-E>
        _event add <<SelectLineEnd>> <Shift-KeyPress-End> <Command-Shift-KeyPress-Right> <Control-Shift-KeyPress-e> <Control-Shift-KeyPress-E>

        _event add <<PageUp>>    <KeyPress-Prior>         <Command-Control-KeyPress-Up>    <Command-KeyPress-p> <Command-KeyPress-P>
        _event add <<PageDown>>  <KeyPress-Next>          <Command-Control-KeyPress-Down>  <Command-KeyPress-n> <Command-KeyPress-N>
        _event add <<PageLeft>>  <Control-KeyPress-Prior> <Command-Control-KeyPress-Left>  <Command-KeyPress-b> <Command-KeyPress-B>
        _event add <<PageRight>> <Control-KeyPress-Next>  <Command-Control-KeyPress-Right> <Command-KeyPress-f> <Command-KeyPress-F>
    }
    "win32" {
        # Note: On Windows, mouse buttons from left to right are 1,2,3.

        _event add <<Cut>>             <Control-KeyPress-x> <Control-KeyPress-X> <F20>
        _event add <<Copy>>            <Control-KeyPress-c> <Control-KeyPress-C> <F16>
        _event add <<Paste>>           <Control-KeyPress-v> <Control-KeyPress-V> <F18>
        _event add <<PasteSelection>>  <ButtonRelease-2>
        _event add <<ToggleSelection>> <ButtonPress-1> <Control-ButtonPress-1> <space> <Return> <KP_Enter>

        _event add <<DeleteChar>> <Meta-KeyPress-d>       <Control-KeyPress-d>       <Control-KeyPress-D>
        _event add <<DeleteWord>> <Meta-Shift-KeyPress-d> <Control-Shift-KeyPress-d> <Control-Shift-KeyPress-D>

        _event add <<Undo>> <Control-KeyPress-z>       <Control-KeyPress-Z>
        _event add <<Redo>> <Control-Shift-KeyPress-z> <Control-Shift-KeyPress-Z>

        _event add <<ContextMenu>> <ButtonPress-3>

        _event add <<ScanMark>>    <ButtonPress-2>
        _event add <<ScanDrag>>    <B2-Motion>
        _event add <<ScanRelease>> <ButtonRelease-2>

        _event add <<SelectAll>>  <Control-KeyPress-a>       <Control-KeyPress-A>
        _event add <<SelectNone>> <Control-Shift-KeyPress-a> <Control-Shift-KeyPress-A> <Clear>

        _event add <<PrevLine>>       <KeyPress-Up>       <Control-KeyPress-h>       <Control-KeyPress-H>
        _event add <<SelectPrevLine>> <Shift-KeyPress-Up> <Control-Shift-KeyPress-h> <Control-Shift-KeyPress-H>

        _event add <<NextLine>>       <KeyPress-Down>       <Control-KeyPress-l>       <Control-KeyPress-L>
        _event add <<SelectNextLine>> <Shift-KeyPress-Down> <Control-Shift-KeyPress-l> <Control-Shift-KeyPress-L>

        _event add <<PrevChar>>       <KeyPress-Left>       <Control-KeyPress-j>       <Control-KeyPress-J>
        _event add <<SelectPrevChar>> <Shift-KeyPress-Left> <Control-Shift-KeyPress-j> <Control-Shift-KeyPress-J>

        _event add <<NextChar>>       <KeyPress-Right>       <Control-KeyPress-k>       <Control-KeyPress-K>
        _event add <<SelectNextChar>> <Shift-KeyPress-Right> <Control-Shift-KeyPress-k> <Control-Shift-KeyPress-K>

        _event add <<PrevPara>>       <Control-KeyPress-Up>       <Alt-KeyPress-h>       <Alt-KeyPress-H>
        _event add <<SelectPrevPara>> <Control-Shift-KeyPress-Up> <Alt-Shift-KeyPress-h> <Alt-Shift-KeyPress-H>

        _event add <<NextPara>>       <Control-KeyPress-Down>       <Alt-KeyPress-l>       <Alt-KeyPress-L>
        _event add <<SelectNextPara>> <Control-Shift-KeyPress-Down> <Alt-Shift-KeyPress-l> <Alt-Shift-KeyPress-L>

        _event add <<PrevWord>>       <Control-KeyPress-Left>       <Alt-KeyPress-j>       <Alt-KeyPress-J>
        _event add <<SelectPrevWord>> <Control-Shift-KeyPress-Left> <Alt-Shift-KeyPress-j> <Alt-Shift-KeyPress-J>

        _event add <<NextWord>>       <Control-KeyPress-Right>       <Alt-KeyPress-k>       <Alt-KeyPress-K>
        _event add <<SelectNextWord>> <Control-Shift-KeyPress-Right> <Alt-Shift-KeyPress-k> <Alt-Shift-KeyPress-K>

        _event add <<LineTop>>       <Control-KeyPress-Home>       <Alt-KeyPress-o>       <Alt-KeyPress-O>
        _event add <<SelectLineTop>> <Control-Shift-KeyPress-Home> <Alt-Shift-KeyPress-o> <Alt-Shift-KeyPress-O>

        _event add <<LineBottom>>       <Control-KeyPress-End>       <Alt-KeyPress-e>       <Alt-KeyPress-E>
        _event add <<SelectLineBottom>> <Control-Shift-KeyPress-End> <Alt-Shift-KeyPress-e> <Alt-Shift-KeyPress-E>

        _event add <<LineStart>>       <KeyPress-Home>       <Control-KeyPress-o>       <Control-KeyPress-O>
        _event add <<SelectLineStart>> <Shift-KeyPress-Home> <Control-Shift-KeyPress-o> <Control-Shift-KeyPress-O>

        _event add <<LineEnd>>       <KeyPress-End>       <Control-KeyPress-e>       <Control-KeyPress-E>
        _event add <<SelectLineEnd>> <Shift-KeyPress-End> <Control-Shift-KeyPress-e> <Control-Shift-KeyPress-E>

        _event add <<PageUp>>    <KeyPress-Prior>         <Control-KeyPress-Up>    <Control-Alt-KeyPress-Up>    <Control-Shift-KeyPress-h> <Control-Shift-KeyPress-H>
        _event add <<PageDown>>  <KeyPress-Next>          <Control-KeyPress-Down>  <Control-Alt-KeyPress-Down>  <Control-Shift-KeyPress-l> <Control-Shift-KeyPress-L>
        _event add <<PageLeft>>  <Control-KeyPress-Prior> <Control-KeyPress-Left>  <Control-Alt-KeyPress-Left>  <Control-Shift-KeyPress-j> <Control-Shift-KeyPress-J>
        _event add <<PageRight>> <Control-KeyPress-Next>  <Control-KeyPress-Right> <Control-Alt-KeyPress-Right> <Control-Shift-KeyPress-k> <Control-Shift-KeyPress-K>
    }
    default {
        # Note: On BSD, Linux and Darwin/X11 (the latter with recent XQuartz as the X server), mouse buttons
        #       from left to right are 1,2,3. Other X servers may differ.

        _event add <<Cut>>             <Control-KeyPress-x> <Control-KeyPress-X> <F20>
        _event add <<Copy>>            <Control-KeyPress-c> <Control-KeyPress-C> <F16>
        _event add <<Paste>>           <Control-KeyPress-v> <Control-KeyPress-V> <F18>
        _event add <<PasteSelection>>  <ButtonRelease-2>
        _event add <<ToggleSelection>> <ButtonPress-1> <Control-ButtonPress-1> <space> <Return> <KP_Enter>

        _event add <<DeleteChar>> <Meta-KeyPress-d>       <Meta-KeyPress-D>       <Control-KeyPress-d>       <Control-KeyPress-D>
        _event add <<DeleteWord>> <Meta-Shift-KeyPress-d> <Meta-Shift-KeyPress-D> <Control-Shift-KeyPress-d> <Control-Shift-KeyPress-D>

        _event add <<Undo>> <Control-KeyPress-z>       <Control-KeyPress-Z>
        _event add <<Redo>> <Control-Shift-KeyPress-z> <Control-Shift-KeyPress-Z>

        _event add <<ContextMenu>> <ButtonPress-3>

        _event add <<ScanMark>>    <ButtonPress-2>
        _event add <<ScanDrag>>    <B2-Motion>
        _event add <<ScanRelease>> <ButtonRelease-2>

        _event add <<SelectAll>>  <Control-KeyPress-a>       <Control-KeyPress-A>
        _event add <<SelectNone>> <Control-Shift-KeyPress-a> <Control-Shift-KeyPress-A> <Clear>

        _event add <<PrevLine>>       <KeyPress-Up>       <Control-KeyPress-h>       <Control-KeyPress-H>
        _event add <<SelectPrevLine>> <Shift-KeyPress-Up> <Control-Shift-KeyPress-h> <Control-Shift-KeyPress-H>

        _event add <<NextLine>>       <KeyPress-Down>       <Control-KeyPress-l>       <Control-KeyPress-L>
        _event add <<SelectNextLine>> <Shift-KeyPress-Down> <Control-Shift-KeyPress-l> <Control-Shift-KeyPress-L>

        _event add <<PrevChar>>       <KeyPress-Left>       <Control-KeyPress-j>       <Control-KeyPress-J>
        _event add <<SelectPrevChar>> <Shift-KeyPress-Left> <Control-Shift-KeyPress-j> <Control-Shift-KeyPress-J>

        _event add <<NextChar>>       <KeyPress-Right>       <Control-KeyPress-k>       <Control-KeyPress-K>
        _event add <<SelectNextChar>> <Shift-KeyPress-Right> <Control-Shift-KeyPress-k> <Control-Shift-KeyPress-K>

        _event add <<PrevPara>>       <Control-KeyPress-Up>       <Alt-KeyPress-h>       <Alt-KeyPress-H>
        _event add <<SelectPrevPara>> <Control-Shift-KeyPress-Up> <Alt-Shift-KeyPress-h> <Alt-Shift-KeyPress-H>

        _event add <<NextPara>>       <Control-KeyPress-Down>       <Alt-KeyPress-l>       <Alt-KeyPress-L>
        _event add <<SelectNextPara>> <Control-Shift-KeyPress-Down> <Alt-Shift-KeyPress-l> <Alt-Shift-KeyPress-L>

        _event add <<PrevWord>>       <Control-KeyPress-Left>       <Alt-KeyPress-j>       <Alt-KeyPress-J>
        _event add <<SelectPrevWord>> <Control-Shift-KeyPress-Left> <Alt-Shift-KeyPress-j> <Alt-Shift-KeyPress-J>

        _event add <<NextWord>>       <Control-KeyPress-Right>       <Alt-KeyPress-k>       <Alt-KeyPress-K>
        _event add <<SelectNextWord>> <Control-Shift-KeyPress-Right> <Alt-Shift-KeyPress-k> <Alt-Shift-KeyPress-K>

        _event add <<LineTop>>       <Control-KeyPress-Home>       <Alt-KeyPress-o>       <Alt-KeyPress-O>
        _event add <<SelectLineTop>> <Control-Shift-KeyPress-Home> <Alt-Shift-KeyPress-o> <Alt-Shift-KeyPress-O>

        _event add <<LineBottom>>       <Control-KeyPress-End>       <Alt-KeyPress-e>       <Alt-KeyPress-E>
        _event add <<SelectLineBottom>> <Control-Shift-KeyPress-End> <Alt-Shift-KeyPress-e> <Alt-Shift-KeyPress-E>

        _event add <<LineStart>>       <KeyPress-Home>       <Control-KeyPress-o>       <Control-KeyPress-O>
        _event add <<SelectLineStart>> <Shift-KeyPress-Home> <Control-Shift-KeyPress-o> <Control-Shift-KeyPress-O>

        _event add <<LineEnd>>       <KeyPress-End>       <Control-KeyPress-e>       <Control-KeyPress-E>
        _event add <<SelectLineEnd>> <Shift-KeyPress-End> <Control-Shift-KeyPress-e> <Control-Shift-KeyPress-E>

        _event add <<PageUp>>    <KeyPress-Prior>         <Control-KeyPress-Up>    <Control-Alt-KeyPress-Up>    <Control-Shift-KeyPress-h> <Control-Shift-KeyPress-H>
        _event add <<PageDown>>  <KeyPress-Next>          <Control-KeyPress-Down>  <Control-Alt-KeyPress-Down>  <Control-Shift-KeyPress-l> <Control-Shift-KeyPress-L>
        _event add <<PageLeft>>  <Control-KeyPress-Prior> <Control-KeyPress-Left>  <Control-Alt-KeyPress-Left>  <Control-Shift-KeyPress-j> <Control-Shift-KeyPress-J>
        _event add <<PageRight>> <Control-KeyPress-Next>  <Control-KeyPress-Right> <Control-Alt-KeyPress-Right> <Control-Shift-KeyPress-k> <Control-Shift-KeyPress-K>
    }
}

#*EOF*