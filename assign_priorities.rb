duplicates = Entry.where(base_word: Entry.select(:base_word).group(:base_word).having("count(*) > 1")).reverse
primary_entries = {}
duplicates.each do |entry|
	if primary_entries[entry.base_word] == nil
		primary_entries[entry.base_word] = entry.id
	elsif primary_entries[entry.base_word] != nil && entry.priority
		primary_entries[entry.base_word] = entry.id
	end
end

duplicates.each do |entry|
	if entry.id != primary_entries[entry.base_word]
		entry.primary_id = primary_entries[entry.base_word]
	end
	entry.save
end


		
