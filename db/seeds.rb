require "json"
require "open-uri"

puts "Cleaning database..."
Recipe.destroy_all

puts "Creating Recipes..."

categories = ["Breakfast", "Pasta", "Seafood", "Dessert"]

def recipe_builder(id)
 url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
 meals_serialized = URI.parse(url).read
 meal = JSON.parse(meals_serialized)["meals"][0]
 meal["strMeal"]

 Recipe.create!(
  name: meal["strMeal"],
  description: meal["strInstructions"],
  image_url: meal["strMealThumb"],
  rating: rand(2..5.0).floor(1)
 )
end

categories.each do |category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
  recipes_serialized = URI.parse(url).read
  recipes = JSON.parse(recipes_serialized)
  recipes["meals"].take(5).each do |recipe|
    recipe_builder(recipe["idMeal"])
  end
end

# Recipe.create!(
#   name: "Fried Rice",
#   description: "A quick and easy meal to whip up in 20 minutes",
#   image_url: "https://plus.unsplash.com/premium_photo-1694141252774-c937d97641da?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZnJpZWQlMjByaWNlfGVufDB8fDB8fHww",
#   rating: 7.2)
# puts "Created Friend Rice"

# Recipe.create!(
#   name: "English Breakfast",
#   description: "A hearty meal especially for those hungover Sundays",
#   image_url: "https://images.unsplash.com/photo-1668620588800-72da2244b89d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZW5nbGlzaCUyMGJyZWFrZmFzdHxlbnwwfHwwfHx8MA%3D%3D",
#   rating: 5)
# puts "Created English Breakfast"

# Recipe.create!(
#   name: "Brownies",
#   description: "A piece of chocolatey heaven",
#   image_url: "https://images.unsplash.com/photo-1515037893149-de7f840978e2?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YnJvd25pZXN8ZW58MHx8MHx8fDA%3D",
#   rating: 5)
# puts "Created Brownies"

# Recipe.create!(
#   name: "French toast",
#   description: "A nice afternoon snack",
#   image_url: "https://images.unsplash.com/photo-1631359544940-535dcc2dc72c?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZnJlbmNoJTIwdG9hc3R8ZW58MHx8MHx8fDA%3D",
#   rating: 2)
# puts "Created French toast"

# 3. Display a message 🎉
puts "Finished! Created #{Recipe.count} recipes."
