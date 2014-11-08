def get_essential(implicant_dict, terms_list):
	all_origins = [x for sublist in implicant_dict.values() for x in sublist]
	essential_implicants = []
	for term, origins in implicant_dict.iteritems():
		for origin in origins:
			if all_origins.count(origin) == 1 and origin in terms_list:
				essential_implicants.append((term,origin))
	return essential_implicants