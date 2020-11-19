sources = []
columns = [:title, :url, :descrip, :image]

sources << {title: 'Aera dot', url: 'https://dot.asahi.com/', descrip: 'Aera Weekly Magazine', image: 'aera-dot.gif'}
sources << {title: 'Kyodo', url: 'https://www.47news.jp/', descrip: 'Kyodo News', image: 'https://nordot-res.cloudinary.com/c_limit,w_300,h_300,f_auto,q_auto:eco/ch/units/39166665832988672/profile_7.png'}
sources << {title: 'Mainichi', url: 'https://mainichi.jp/', descrip: 'Mainichi News', image: 'mainichi-square.png'}

Source.import columns, sources, validate: false

puts "There are now #{Source.count} rows in the sources table"