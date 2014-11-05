class TruthTable(object):
	def __init__(self, terms, dontCares, type, number_of_bits):
		self.keys = [x for x in xrange((2 ** number_of_bits))]
		self.values = [False if type else True]*len(self.keys)
		for i in xrange(len(self.keys)):
			if i in dontCares:
				self.values[i] = None
			elif i in terms:
				self.values[i] = True if type else False
		self.table = {x:y for x,y in zip(self.keys,self.values)}