sources = []
columns = [:description, :constrained, :data_type, :min_value, :max_value]

sources << {description: "Show master warning", constrained: false, data_type: "boolean", min_value: nil, max_value: nil}

Setting.import columns, sources, validate: false

puts "There are now #{Source.count} rows in the sources table"