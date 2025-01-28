# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

############################
##                        ##
##     COMMAND REMOVED    ##
##                        ##
############################

rename tk_messageBox _tk_messageBox

proc tk_messageBox { args } {
    chan puts stdout "The 'tk_messageBox' command has been removed from Tk by Mustang. Ignoring."
    chan puts stdout "Please use 'dialog message' instead."

    return ""
}

#*EOF*