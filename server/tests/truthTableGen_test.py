import sys

sys.path.append('../')

from modules.truthTableGen import TruthTable

def test_1():
	print "Testing With 2 bit truth table"
	a = TruthTable([0,1],[3],True,2)
	print "properties of the following table is [0,1] is true and [3] is a dont care term with min terms"
	assert a.table == {0: True, 1: True, 2: False, 3: None}

def test_2():
	print "Testing With 3 bit truth table"
	a = TruthTable([0,1,4],[3,6],True,3)
	print "properties of the following table is [0,1,4] is true and [3,6] is a dont care term with min terms"
	assert a.table == {0: True, 1: True, 2: False, 3: None, 4: True, 5: False, 6: None, 7: False}

def test_3():
	print "Testing With 3 bit truth table"
	a = TruthTable([0,1,4],[3,6],False,3)
	print "properties of the following table is [0,1,4] is true and [3,6] is a dont care term with max terms"
	print a.table
	assert a.table == {0: False, 1: False, 2: True, 3: None, 4: False, 5: True, 6: None, 7: True}
