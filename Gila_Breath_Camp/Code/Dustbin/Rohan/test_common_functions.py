import sys
sys.path.append("Python")
import common_functions

cf = common_functions.Common_functions()

data = cf.getFromCsv('applicant_old.csv',{'camp_time_slots':'2017-03-11 00:00:00.000000'})
print(data)

