# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

############################
##                        ##
##     COMMAND REMOVED    ##
##                        ##
############################

rename tk_getSaveFile _tk_getSaveFile

proc tk_getSaveFile { args } {
    chan puts stdout "The 'tk_getSaveFile' command has been removed from Tk by Mustang. Ignoring."
    chan puts stdout "Please use the 'dialog saveFile' command instead."

    return ""
}

#*EOF*