# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

###############################
##                           ##
##     DEPRECATED COMMAND    ##
##                           ##
###############################

rename tk_textCut _tk_textCut

proc tk_textCut { window } {
    chan puts stdout "The 'tk_textCut' command has been deprectaed by Mustang."
    chan puts stdout "Please, next time, use the 'cut' command instead."

    return [cut $window]
}

#*EOF*