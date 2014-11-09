def get_essential(implicant_dict, terms_list):
	all_origins = [x for sublist in implicant_dict.values() for x in sublist]
	essential_implicants = []
	for term, origins in implicant_dict.iteritems():
		for origin in origins:
			if all_origins.count(origin) == 1 and origin in terms_list:
				essential_implicants.append((term,origin))
	return essential_implicants


def FindByValue(implicant_dict,inp): #Returns first key that contains value
	for index,i in enumerate(implicant_dict.values()):
		if inp in i:
			return implicant_dict.keys()[index]

def CleanDict(implicant_dict,terms_list,results): #Removes results from implicant_dict and terms_list
	aa = []
	for i in xrange(len(results)):
		aa += implicant_dict[results[i]]
		del implicant_dict[results[i]]
	aa =  [x for x in terms_list if x not in aa]
	return aa

def S_End(implicant_dict,value_ch): #Returns false if value does not exist in all entries in implicant dict
	for key,values in implicant_dict.iteritems():
		if value_ch not in values:
			return False
	return True

def Smallest(implicant_dict,value_ch): #Returns the key in implicant dict that has the value value_ch with most number of '-''
	tmp = []
	maxx = 0
	pntr = 0
	for key,values in implicant_dict.iteritems():
		if value_ch	in values:
			tmp.append(key)

	for i in range(len(tmp)):
		cur = tmp[i].count('-')
		if cur > maxx:
			maxx = cur
			pntr = i
	return tmp[pntr]


def Dominating(implicant_dict,terms_list):
	terms = [0] * (max(terms_list) + 1)
	result = []

	for key,values in implicant_dict.iteritems():
		for value in values:
			if value in terms_list:
				terms[value] = terms[value] + 1

	for i in xrange(len(terms)):
		if terms[i] == 1:
			result.append(FindByValue(implicant_dict,i))
	

	terms_list =  CleanDict(implicant_dict,terms_list,list(set(result)))

	# Loop below does not enter past the if statement since 1 is in two minterms and not all of them
	# maybe function in loop below should determine smallest term to be removed?


	for i in terms_list:
		# if S_End(implicant_dict,i):
		# result.append(FindByValue(implicant_dict,i))
		result.append(Smallest(implicant_dict,i))
		terms_list.remove(i)


	if terms_list != []:
		return list(set(result)) + Dominating(implicant_dict,terms_list)

	return list(set(result))