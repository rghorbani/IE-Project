# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
<<<<<<< HEAD

[:admin, :author, :contact, :user].each do |role|
  Role.find_or_create_by_name({ name: role }, without_protection: true)
end
=======
>>>>>>> c65f81f4d82ef87298bbcbc553797664478b880b
