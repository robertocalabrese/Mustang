# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

###############################
##                           ##
##     DEPRECATED COMMAND    ##
##                           ##
###############################

rename tk_textCopy _tk_textCopy

proc tk_textCopy { window } {
    chan puts stdout "The 'tk_textCopy' command has been deprectaed by Mustang."
    chan puts stdout "Please, next time, use the 'copy' command instead."

    return [copy $window]
}

#*EOF*