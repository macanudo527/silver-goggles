# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# The edict file with the first lines of symbols removed.  The last few newlines have also been removed.
# Edict file should be converted to UTF8 for maximum compatiblity

require_relative('seeds/entry_seeds')
require_relative('seeds/source_seeds')
require_relative('seeds/setting_seeds')