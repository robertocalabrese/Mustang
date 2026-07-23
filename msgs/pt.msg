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

namespace eval ::ms {
    # Errors
    ::msgcat::mcset  pt "Operating system not supported." "Sistema operacional não suportado."
    ::msgcat::mcset  pt "Missing colors." "Cores em falta."
    ::msgcat::mcset  pt "Missing themes." "Temas em falta."
    ::msgcat::mcset  pt "Quit the application." "Sai da programa."

    # Buttons
    ::msgcat::mcset  pt "abort" "abortar"
    ::msgcat::mcset  pt "about" "sobre"
    ::msgcat::mcset  pt "apply" "aplicar"
    ::msgcat::mcset  pt "back" "voltar"
    ::msgcat::mcset  pt "cancel" "cancelar"
    ::msgcat::mcset  pt "close" "fechar"
    ::msgcat::mcset  pt "continue" "continuar"
    ::msgcat::mcset  pt "copy" "copiar"
    ::msgcat::mcset  pt "cut" "recortar"
    ::msgcat::mcset  pt "delete" "excluir"
    ::msgcat::mcset  pt "edit" "editar"
    ::msgcat::mcset  pt "exit" "sair"
    ::msgcat::mcset  pt "help" "ajuda"
    ::msgcat::mcset  pt "ignore" "ignorar"
    ::msgcat::mcset  pt "no" "não"
    ::msgcat::mcset  pt "ok" "ok"
    ::msgcat::mcset  pt "open" "abrir"
    ::msgcat::mcset  pt "paste" "colar"
    ::msgcat::mcset  pt "quit" "encerrar"
    ::msgcat::mcset  pt "retry" "tentar novamente"
    ::msgcat::mcset  pt "save" "salvar"
    ::msgcat::mcset  pt "yes" "sim"
}

#*EOF*