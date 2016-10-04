import sys
sys.path.append("Python")
sys.path.append("Python/Entities")
import common_functions
import user

k = common_functions.Common_functions()
'''
ur = user.User()
ur.setUserId("6")
ur.setUserName("")
ur.setUserType("DIRECTOR")
ur.setPassword("")

k.insertIntoCsv("user.csv",ur)
'''
a = k.getFromCsv("user.csv",{})
print(a[0].user_name)