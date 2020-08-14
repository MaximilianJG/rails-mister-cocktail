# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

require 'open-uri'
require 'json'
def api_call()
  url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
  ingredient = open(url).read
  return JSON.parse(ingredient)
end

puts "Creating Ingredient List"

api_call["drinks"].each do |single|
    ing = single.values[0]
 @ingredient = Ingredient.new(name: ing)
 @ingredient.save
end

puts "Ingredient list created"
