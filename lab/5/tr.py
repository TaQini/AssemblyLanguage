from sys import argv
def b(n):
	while(n<0):
		n+=0x100000000
	s = bin(n)[2:]
	if(len(s)>32):
		return s[1:]
	return s.rjust(32,'0')

def c(s):  
	k = b(s)
	ret = ""
	for i in range(len(k)):    
		if i%8==0:        
			ret += " "
		ret += k[i]
	return ret[1:]

magic = 0x7efefeff
word = 0x33323000
if len(argv)>1:
	word = eval(argv[1])
print "word\t"+c(word)
print "magic\t"+c(magic)
print "add\t"+c(word+magic)
print "~word\t"+c(~word)
print "xor\t"+c((word+magic)^(~word))
print "~magic\t"+c(~magic)
print "and\t"+c(((word+magic)^(~word)) & (~magic))
if "1" in c(((word+magic)^(~word)) & (~magic)):
	print "[!] zero is in string."
