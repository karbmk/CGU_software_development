import sys
sys.path.append("Python")
sys.path.append("Python/Entities")
import common_functions
import user
import applicant

a = applicant.Applicant()

print(a.setAge('A'))

print(a.getAge())
