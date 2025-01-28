# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

############################
##                        ##
##     COMMAND REMOVED    ##
##                        ##
############################

rename tk_chooseColor _tk_chooseColor

proc tk_chooseColor { args } {
    chan puts stdout "The 'tk_chooseColor' command has been removed from Tk by Mustang. Ignoring."
    chan puts stdout "Please use the 'dialog color' command instead."

    return ""
}

#*EOF*