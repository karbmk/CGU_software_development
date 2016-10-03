class Struct:
    def __init__(self, **entries): 
        self.__dict__.update(entries)

args = {'Name': 'Rohan,Sawant', 'Id': '1', 'Date': '10-02-2016'}
user = Struct(**args)
print(user.Name)
