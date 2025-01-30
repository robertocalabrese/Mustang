# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

###############################
##                           ##
##     DEPRECATED COMMAND    ##
##                           ##
###############################

rename tk_textPaste _tk_textPaste

proc tk_textPaste { window } {
    chan puts stdout "The 'tk_textPaste' command has been deprectaed by Mustang."
    chan puts stdout "Please, next time, use the 'paste' command instead."

    return [paste $window]
}

#*EOF*