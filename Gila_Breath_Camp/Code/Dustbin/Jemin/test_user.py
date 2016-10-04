import sys
sys.path.append("Python/Entities")
import user
ur = user.User()
ur.setUserId('1')
ur.setUserName(" JEMIN GOHIL ")
ur.setUserType("Owner")
ur.setPassword('abcdef')
print(ur.getUserId())
print(ur.getUserName())
print(ur.getUserType())
print(ur.getPassword())

print(ur.__dict__)