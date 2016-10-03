'''
class Struct:
    def __init__(self, **entries): 
        self.__dict__.update(entries)

test=[]
user = [{'a':'1','b':'2','c':'3'},{'d':'4','e':'5','f':'6'},{'g':'7','h':'8','i':'9'}]
for i in user:
	test.append(Struct(**i))

print(test[0].a)
'''
user = [{'a':'1','b':'2','c':'3'},{'d':'4','e':'5','f':'6'},{'g':'7','h':'8','i':'9'}]
d = {'a':'1','b':'2','c':'3'}
def obj_dic(d):
    top = type('new', (object,), d)
    seqs = tuple, list, set, frozenset
    for i, j in d.items():
    	if isinstance(j, dict):
    	    setattr(top, i, obj_dic(j))
    	elif isinstance(j, seqs):
    	    setattr(top, i, 
    		    type(j)(obj_dic(sj) if isinstance(sj, dict) else sj for sj in j))
    	else:
    	    setattr(top, i, j)
    return top
for i in user:
	test.append(obj_dic(i))
print(test[0].a)