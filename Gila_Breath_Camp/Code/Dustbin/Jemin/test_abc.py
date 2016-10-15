import sys
sys.path.append("Python")
sys.path.append("Python/Entities")
import common_functions
import applicant
import user

#ur = user.User()
ur = applicant.Applicant()
ur.setFirstName('KarthikYana')
ur.setLastName('LoveBirds')
ur.setGuardianFirstName('Chhotta')
ur.setGuardianLastName('Don')
ur.setGuardianContactNumber('1000000000')
ur.setApplicationDate('10/10/16')
ur.setEmergencyContact('9111111111')
ur.setAge('10')
ur.setGender('M')
ur.setAddress('abcde')
ur.setLegalForm('Y')
ur.setMedicalForm('N')
ur.setTribeId('1')
ur.setBunkhouseId('2')
ur.setHelmet('Y')
ur.setBoot('Y')
ur.setSleepingBag('N')
ur.setWaterBottle('Y')
ur.setSunscreen('Y')
ur.setBugsSpray('N')

cf = common_functions.Common_functions()
cf.insertIntoCsv('applicant.csv',ur)
