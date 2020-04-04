edict = File.read(Rails.root.join('lib', 'seeds', 'edict2-UTF8.txt'))
line_num = 0
entries = []
columns = [:base_word, :word, :reading, :definition, :priority, :grammar]
edict.each_line do |line|

	# cut the newline off
	line = line.chomp

	# split the line into its main components
	ary = line.split('/')

	# There is a space between the multiple word permutations and the reading
	first_part = ary[0].split(' ')

	# Sometimes there is no separate reading section, if this is the case take the first word
	if first_part[1].nil?
		reading = first_part[0].partition(';').first
	else
		# remove the brackets around the reading
		reading = first_part[1][1..-2]
	end

	# The words are stored at the first node
	word = first_part[0]

	# The main form of the word is stored in the first node
	base_word = first_part[0].partition(';').first

	# slice off priority code if there is one
	base_word.slice!("(P)")

	# cut off the first section that had word and reading
	ary.shift

	# cut off the last element which has a code we do not need
	ary.pop

	# convert the different definitions into a more readable format
	definition = ""
	ary.each_with_index { |part, i|
		definition = definition + part
		next_part = ary[i+1]

		# Finish the definition with a period
		if next_part.nil? 
			definition = definition + "."

		# Different definitions starts with a pos in parenthesis
		elsif next_part[0,1] == "("
			definition = definition + "; "

		# Seperate synonyms with a comma
		else
			definition = definition + ", "
		end
	}

	# prt means it is a particle, which is a grammar point
	if definition =~ /[(,]prt/
		grammar = true
	else
		grammar = false
	end

	# The P code means the word is priority or one of the 20,000 most common words in Japanese
	if word.include?("(P)") || definition.include?("(P)")
		priority = true
	else
		priority = false
	end

	# Slice off all the priority codes since that is now stored in the boolean variable
	word.slice!("(P)")
	definition.slice!("; (P)")
	reading.slice!("(P)")

	# Assign elements to new entry
    entries << {base_word: base_word, word: word, reading: reading, definition: definition, priority: priority, grammar: grammar}

	# puts "#{line_num += 1}  word #{word}, reading #{reading}, definition #{definition}, priority #{priority}"

end

Entry.import columns, entries, validate: false

puts "There are now #{Entry.count} rows in the entries table"