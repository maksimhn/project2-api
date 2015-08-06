require 'csv'

Word.destroy_all

csv_text = File.read('nouns.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Word.create!(row.to_hash)
end

