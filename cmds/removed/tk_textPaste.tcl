# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

############################
##                        ##
##     COMMAND REMOVED    ##
##                        ##
############################

rename tk_textPaste _tk_textPaste

proc tk_textPaste { window } {
    chan puts stdout "The 'tk_textPaste' command has been removed from Tk by Mustang. Ignoring."
    chan puts stdout "Please use the 'paste' command instead."

    return ""
}

#*EOF*