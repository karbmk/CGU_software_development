import sys
sys.path.append("Python")
sys.path.append("Python/Entities")
import common_functions
import user
import applicant

a = applicant.Applicant()

#print(a.setAge('A'))

#print(a.getAge())

cf = common_functions.Common_functions()

print(cf.str_to_date("2016-11-21 00:35:28.438843"))

