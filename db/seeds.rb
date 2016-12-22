
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# rails find the json file in db folder, and populate data
config_path = File.expand_path(File.join(File.dirname(__FILE__), "apidata.json"))
@petsStores = JSON.parse(File.read(config_path) do |f|
  f.each_line do |line|
    line
  end
end)
# response = HTTParty.get('https://api.rescuegroups.org/rest/?key=' + ENV['RESCUEGROUPS_KEY'] + '&type=animals&species=Dog&limit=100')
# render JSON: => response
  # testing --> puts "in initialize"
# getting pets from json
@AvaiblePets = @petsStores["pets"]["pet"]
  # testing -->puts "in create"
# putting each pet's data into the database
@AvaiblePets.each do |pet|
  Store.create(status: "Available",
  name: pet["name"],
  gender: pet["sex"],
  organisationid: pet["orgID"].to_i,
  age: rand(1..3),
  breed: pet["primaryBreed"],
  locationzip: pet["locationZipcode"].to_i,
  image: pet["pic1"] )
end

