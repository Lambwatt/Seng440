def read_file(fileName)
	f=open(filename, 'r')
	yield f.read
	ensure f.close	
end

def count(fileName,l_branches)
	instructions = {};
	file_read(fileName).split("\n"){|i|
		p i[/^[\s]*[A-Za-z]*[\s]*/]
	}
end

fileName = ARGV[0]
l_branches = ARGV[1...ARGV.length]
count(fileName, l_branches)
