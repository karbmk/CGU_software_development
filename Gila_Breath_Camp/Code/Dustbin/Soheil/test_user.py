import sys
sys.path.append("Python/Entities")
import user
import os
Rohan = user.User()


Rohan.setUserId(12345)

print (Rohan.getUserId())


Karthik = user.User()

Karthik.setUserName("karthik-123")

print (Karthik.getUserName())

print (Rohan.__dict__)
print (Karthik.__dict__)
