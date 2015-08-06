# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# \copy words(word, gender, pic) FROM 'nouns.csv' WITH (FORMAT csv, HEADER true)
require 'csv'

csv_text = File.read('nouns.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Word.create!(row.to_hash)
end

end
