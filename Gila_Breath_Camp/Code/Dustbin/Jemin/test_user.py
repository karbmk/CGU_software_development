import sys
sys.path.append("Python")
import common_functions

app = getFromCsv
app.setApplicantId('1')
app.setFirstName("Name to suna hi hga")
app.setLastName(" __|__")
app.setAge('Abhi to meri umar hi kya hai')
app.setSex("Mann to bhot h pr abhi nahi")
print (app.getApplicantId())
print (app.getFirstName())
print (app.getLastName())
print (app.getAge())
print (app.getSex())

print (app.__dict__)
k = Common_functions()
k.getFromCsv()
