import sys

sys.path.append('../')

from modules.primeImplicants import *

test_minterms = set(['0001', '0011', '0100', '0110', '1011', '0000', '1000', '1010', '1100', '1101'])

def test_implicants():
    assert get_prime_implicants(test_minterms) == ['01-0', '000-', '00-1', '-011', '110-', '101-', '10-0', '--00']
