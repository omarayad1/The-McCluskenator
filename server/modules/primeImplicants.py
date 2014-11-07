from itertools import combinations

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
			# f = 1
		else:
			str1+= cur_char

	f = 0
	for i in xrange(len(inp)):
		cur_char=inp[i]
		if (cur_char == "-" and f == 0):
			str2 += "0"
			# f = 1
		else:
			str2+= cur_char
	if (inp == str2 and inp == str1):
		return 'NONE'
	else:
		return [str1,str2]



def PI(data):
	liist = list(get_prime_implicants(data))
	newlist1= [0]*len(liist)
	newlist0= [0]*len(liist)
	finallist = []

	for i in xrange(len(liist)):
		# while !('-' in a):
		a = perm(liist[i])
		newlist1[i]=int(a[0], 2)
		newlist0[i]=int(a[1], 2)

	for i in xrange(len(liist)):
		bb = [liist[i],newlist0[i],newlist1[i]]
		finallist.append(bb)

	print finallist


