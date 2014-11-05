import sys

sys.path.append('../')

from modules.primeImplicants import *

test_minterms = set(['0001', '0011', '0100', '0110', '1011', '0000', '1000', '1010', '1100', '1101'])


print 'Prime Implicants = ', find_prime_implicants(test_minterms)