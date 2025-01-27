## _ADD_SPACES_TO_A_STRING
#
# Dinamically add spaces to a string in a table, so that the next column will result vertically aligned.
#
# Where:
#
# STRING      Should be the string in which the spaces should be added.
#
# maxLength   Should be a positive integer that specifies the maximum length allowed for the string.
#
# gap         Should be a positive integer that specifies the column distancer (in space characters).
#             If not provided, defaults to '3'.
#
# Return a new string.
proc ::_ADD_SPACES_TO_A_STRING { STRING maxLength { gap 3 } } {}