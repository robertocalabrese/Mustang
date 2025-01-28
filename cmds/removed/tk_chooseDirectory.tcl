# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

############################
##                        ##
##     COMMAND REMOVED    ##
##                        ##
############################

rename tk_chooseDirectory _tk_chooseDirectory

proc tk_chooseDirectory { args } {
    chan puts stdout "The 'tk_chooseDirectory' command has been removed from Tk by Mustang. Ignoring."
    chan puts stdout "Please use 'dialog directory' instead."

    return ""
}

#*EOF*