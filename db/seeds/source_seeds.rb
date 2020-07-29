sources = []
columns = [:title, :url, :descrip, :image]

sources << {title: 'Aera dot', url: 'https://dot.asahi.com/', descrip: 'Aera Weekly Magazine', image: 'aera-dot.gif'}

Source.import columns, sources, validate: false

puts "There are now #{Source.count} rows in the sources table"