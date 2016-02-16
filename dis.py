import dis, marshal

for(i = 0; i<= 16; i++):
	filename = str(i)+".py"
	code = open(filename,rb").read()[8:]
	code = marshal.loads(code)
	dis.dis(code)
