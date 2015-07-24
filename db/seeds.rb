# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# bulk tranform strings to array
%w(asd dfgr kdn).each do |name|
  # every array value will becom a new email
  email = "#{name}@#{name}.com"
  # in case of existing email it skips this email; .exists? method takes a hash as a parameter
  next if User.exists? email: email
  User.create!(email: email, password: 'abc123', password_confirmation: 'abc123')
end
