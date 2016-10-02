class User(object):

	def __init__(self):	
		self.user_id = 0
		self.user_name = ''

	def setUserId(self,user_id):
		self.user_id = user_id

	def getUserId(self):
		return self.user_id

	def setUserName(self,user_name):
		self.user_name = user_name

	def getUserName(self):
		return self.user_name
