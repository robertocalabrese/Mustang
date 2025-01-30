# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

###############################
##                           ##
##     DEPRECATED COMMAND    ##
##                           ##
###############################

proc ::tk_focusPrev { window } {
    chan puts stdout "The 'tk_focusPrev' command has been deprectaed by Mustang."
    chan puts stdout "Please, next time, use the 'focus prev' command instead."

    return [::focusPrev $window]
}

#*EOF*