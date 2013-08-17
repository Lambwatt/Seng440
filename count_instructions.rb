def read_file(file_name)
	f=File.new(file_name, 'r')
	yield (f)
	ensure f.close	
end

def add_to_count(new_key, hash)
	if hash.has_key? new_key
		hash[new_key]+=1
	else
		hash[new_key]=1
	end
end

def merge_counts(count1, count2)
	hash ={}
	count1.each_key{|i|
		hash[i] = count1[i]
	}
	count2.each_key{|i|
		if hash.has_key? i
			hash[i]+=count2[i]
		else
			hash[i] = count2[i]
		end
	}
	return hash
end

def count(section, f_name, l_branches, iter)
	instructions = {};
	loop_instructions = {};
	in_func = false
	in_loop = false
	p "size of target: "+section.split("\n").size.to_s

	section.split("\n").each{|i|
		ins = i[/^[\s\.]*[A-Za-z0-9]*[\:\s]*/].strip
		#p ins
		unless in_func
			#"not in function"
			in_func=true if ins[0...-1]==f_name
		else	
			
			if ins=="" or ins == "stmfd"
				#p "hit empty or stmfd case."
				next
			elsif ins=="ldmfd"
				in_func=false
			else
				unless in_loop
					add_to_count(ins, instructions) unless ins[0]=="."
					in_loop = true if ins=="."+l_branches+":"
				else
					add_to_count(ins, loop_instructions) unless ins[0]=="."
					in_loop = false if i.match(/[\s]*ble[\s]*\.#{l_branches}/)
				end
			end	
		end
	}

	loop_instructions.each_key{|k|
		loop_instructions[k] *= iter.to_i
	}

	count = merge_counts(instructions, loop_instructions)
	count.each_key{|k|
		p ""+k+": "+count[k].to_s
	}
	p "program complete."
end

file_name = ARGV[0]
function_name = ARGV[1]
l_branches = ARGV[2]
iter = ARGV[3]
read_file(file_name){|f|
		count(f.read, function_name, l_branches, iter)
}
