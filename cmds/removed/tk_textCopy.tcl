# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

############################
##                        ##
##     COMMAND REMOVED    ##
##                        ##
############################

rename tk_textCopy _tk_textCopy

proc tk_textCopy { window } {
    chan puts stdout "The 'tk_textCopy' command has been removed from Tk by Mustang. Ignoring."
    chan puts stdout "Please use the 'copy' command instead."

    return ""
}

#*EOF*