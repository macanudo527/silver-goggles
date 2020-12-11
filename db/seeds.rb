# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# The edict file with the first lines of symbols removed.  The last few newlines have also been removed.
# Edict file should be converted to UTF8 for maximum compatiblity

namespace :db do
  namespace :seed do

    Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern

      task task_name => :environment do
        load('seeds/' + filename)
      end
    end

    task :all => :environment do
      Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |filename|
        load('seeds/' + filename)
      end
    end

  end
end


# require_relative('seeds/entry_seeds')
# require_relative('seeds/source_seeds')
# require_relative('seeds/setting_seeds')