# Developer:  🆁🅾🅱🅴🆁🆃🅾  🅲🅰🅻🅰🅱🆁🅴🆂🅴
# City:       🅿🅰🅻🅴🆁🅼🅾, 🆂🅸🅲🅸🅻🆈
# Country:    🅸🆃🅰🅻🆈

############################
##                        ##
##     COMMAND REMOVED    ##
##                        ##
############################

rename tk_getOpenFile _tk_getOpenFile

proc tk_getOpenFile { args } {
    chan puts stdout "The 'tk_getOpenFile' command has been removed from Tk by Mustang. Ignoring."
    chan puts stdout "Please use the 'dialog openFile' command instead."

    return ""
}

#*EOF*