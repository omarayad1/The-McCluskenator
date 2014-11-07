

def combine(m, n):
    a = len(m)
    c = ''
    count = 0
    for i in xrange(a): 
        if(m[i] == n[i]):
            c += m[i]
        elif(m[i] != n[i]):
            c += '-'
            count += 1

    if(count > 1): 
        return None
    else:            
        return c

def get_prime_implicants(data):
    newList = list(data)
    size = len(newList)
    IM = []
    im = []
    im2 = []
    mark = [0]*size
    m = 0
    for i in xrange(size):
        for j in xrange(i+1, size):
            c = combine( str(newList[i]), str(newList[j]) )
            if c != None:
                im.append(str(c))
                mark[i] = 1
                mark[j] = 1
            else:
                continue

    mark2 = [0]*len(im)
    for p in xrange(len(im)):
        for n in range(p+1, len(im)):
            if( p != n and mark2[n] == 0):
                if( im[p] == im[n]):
                    mark2[n] = 1


    for r in xrange(len(im)):
        if(mark2[r] == 0):
            im2.append(im[r])

    for q in xrange(size):
        if( mark[q] == 0 ):
            IM.append( str(newList[q]) )
            m = m+1

    if(m == size or size == 1):
        return IM
    else:
        return IM + get_prime_implicants(im2)


def perm(inp):
	f = 0
	str1=''
	str2=''
	for i in xrange(len(inp)):
		cur_char=inp[i]
		if (cur_char == "-" and f == 0):
			str1 += "1"
			f = 1
		else:
			str1+= cur_char

	f = 0
	for i in xrange(len(inp)):
		cur_char=inp[i]
		if (cur_char == "-" and f == 0):
			str2 += "0"
			f = 1
		else:
			str2+= cur_char
	if (inp == str2 and inp == str1):
		return 'NONE'
	else:
		return [str1,str2]

def check(inp):
	for i in range(len(inp)):
		if '-' in inp[i]:
			return i
	return 'NONE'

def iter(inp):
	worklist = perm(inp)
	numlist = []
	chk = check(worklist)
	while chk!='NONE':
		a = perm(worklist[chk])
		worklist.append(a[0])
		worklist.append(a[1])
		worklist.pop(chk)
		chk = check(worklist)

	for i in xrange(len(worklist)):
		numlist.append(int(worklist[i],2))

	numlist.append(inp)
	numlist.reverse()

	return numlist



def PI(data):
	liist = list(get_prime_implicants(data))
	finallist = []

	for i in xrange(len(liist)):
		a = iter(liist[i])
		finallist.append(a)

	print finallist


