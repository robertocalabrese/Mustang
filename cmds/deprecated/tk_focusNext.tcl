# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

###############################
##                           ##
##     DEPRECATED COMMAND    ##
##                           ##
###############################

proc ::tk_focusNext { window } {
    chan puts stdout "The 'tk_focusNext' command has been deprectaed by Mustang."
    chan puts stdout "Please, next time, use the 'focus next' command instead."

    return [::focusNext $window]
}

#*EOF*