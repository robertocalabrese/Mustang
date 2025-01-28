# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

############################
##                        ##
##     COMMAND REMOVED    ##
##                        ##
############################

rename tk_popup _tk_popup

proc tk_popup { args } {
    chan puts stdout "The 'tk_popup' command has been removed from Tk by Mustang. Ignoring."
    chan puts stdout "Please use 'contextmenu' instead."

    return ""
}

#*EOF*