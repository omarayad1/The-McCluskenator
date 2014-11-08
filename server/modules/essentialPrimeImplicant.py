def get_essential(implicant_dict, terms_list):
	all_origins = [x for sublist in implicant_dict.values() for x in sublist]
	essential_implicants = []
	for term, origins in implicant_dict.iteritems():
		for origin in origins:
			if all_origins.count(origin) == 1 and origin in terms_list:
				essential_implicants.append((term,origin))
	return essential_implicants


def FindByKey(implicant_dict,inp):
	for index,i in enumerate(implicant_dict.values()):
		if inp in i:
			return implicant_dict.keys()[index]

def CleanDict(implicant_dict,terms_list,results):
	aa = []
	for i in xrange(len(results)):
		aa += implicant_dict[results[i]]
		del implicant_dict[results[i]]
	aa =  [x for x in terms_list if x not in aa]
	return aa

def S_End(implicant_dict,value_ch):
	for key,values in implicant_dict.iteritems():
		if value_ch not in values:
			return False
	return True


def Dominating(implicant_dict,terms_list):
	terms = [0] * (max(terms_list) + 1)
	result = []

	for key,values in implicant_dict.iteritems():
		for value in values:
			if value in terms_list:
				terms[value] = terms[value] + 1

	for i in xrange(len(terms)):
		if terms[i] == 1:
			result.append(FindByKey(implicant_dict,i))
	
	terms_list =  CleanDict(implicant_dict,terms_list,list(set(result)))

	for i in terms_list:
		if S_End(implicant_dict,i):
			result.append(FindByKey(implicant_dict,i))
			terms_list.remove(i)


	if terms_list != []:
		return list(set(result)) + Dominating(implicant_dict,terms_list)

	return list(set(result))


print Dominating({'-100': [4,12], '10--':[8,9,10,11], '1--0':[8,10,12,14], '1-1-':[10,11,14,15]}, [4,8,10,11,12,15])
print Dominating( {'0000': [0], '1-10':[10,14], '1-01':[9,13], '-11-':[6,7,14,15], '-1-1':[5,7,13,15]}, [0,5,6,7,9,10,13,14,15])
