import sys
sys.path.append("Python")
sys.path.append("Python/Entities")
import common_functions
import user

ur = user.User()
ur.setUserId('8')
ur.setUserName('replace new1')

ur_dict = [ur.__dict__]
ur_dict.append({'password': '', 'user_type': '', 'user_name': 'replace new2', 'user_id': '10'})
cf = common_functions.Common_functions()
cf.updateIntoCsv('user.csv',ur_dict,"user_id")

