# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

############################
##                        ##
##     COMMAND REMOVED    ##
##                        ##
############################

rename tk_textCut _tk_textCut

proc tk_textCut { window } {
    chan puts stdout "The 'tk_textCut' command has been removed from Tk by Mustang. Ignoring."
    chan puts stdout "Please use the 'cut' command instead."

    return ""
}

#*EOF*