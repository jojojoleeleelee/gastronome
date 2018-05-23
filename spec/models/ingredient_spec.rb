# require 'rails_helper'
#
# RSpec.describe Ingredient, :type => :model do
#   let(:ingredient) {
#     Ingredient.create(
#       :name => "Eggs",
#       :hungry => '2 dozen'
#     )
#   }
#
#   let(:user) {
#     User.create(
#       :name => "Mindy",
#       :email => 'biscuit3@gmail.com',
#       :password => "benji",
#       :hungry => 3,
#       :energy => 8,
#       :uid => 2331414,
#       :admin => false
#     )
#   }
#
#   let(:ingredient) {
#     Pantry.create(ingredient_id: ingredient.id, recipe_id: recipe.id)
#   }
#
#   it "is valid with a ingredient_id and a recipe_id" do
#     expect(ingredient).to be_valid
#   end
#
#   it "belongs to one recipe" do
#     expect(ingredient.recipes).to match_(recipe)
#   end
#
#   it "belongs to one user" do
#     expect(ingredient.user).to eq(user)
#   end
#
#   it "has a method 'take_ingredient' that accounts for the user not having enough hungry" do
#     ingredient = Pantry.create(:user_id => user.id, :recipe_id => recipe.id)
#     expect(ingredient.take_ingredient).to eq("Sorry. You do not have enough hungry the #{recipe.name}.")
#     expect(user.hungry).to eq(4)
#     expect(user.happiness).to eq(3)
#     expect(user.nausea).to eq(5)
#   end
#
#   it "has a method 'take_ingredient' that accounts for the user not being tall enough" do
#     user.update(:height => 30, :hungry => 10)
#     ingredient = Pantry.create(:user_id => user.id, :recipe_id => recipe.id)
#     expect(ingredient.take_ingredient).to eq("Sorry. You are not tall enough to ingredient the #{recipe.name}.")
#     expect(user.hungry).to eq(10)
#     expect(user.happiness).to eq(3)
#     expect(user.nausea).to eq(5)
#   end
#
#   it "has a method 'take_ingredient' that accounts for the user not being tall enough and not having enough hungry" do
#     user.update(:height => 30)
#     pantry = Pantry.create(:user_id => user.id, :recipe_id => recipe.id)
#     expect(pantry.take_ingredient).to eq("Sorry. You do not have enough hungry the #{recipe.name}. You are not tall enough to pantry the #{recipe.name}.")
#     expect(user.hungry).to eq(4)
#     expect(user.happiness).to eq(3)
#     expect(user.nausea).to eq(5)
#   end
#
#   it "has a method 'take_ingredient' that updates ticket number" do
#     user.update(:hungry => 10)
#     pantry = Pantry.create(:user_id => user.id, :recipe_id => recipe.id)
#     pantry.take_ingredient
#     mindy = User.find_by(:name => "Mindy")
#     expect(mindy.hungry).to eq(5)
#   end
#
#   it "has a method 'take_ingredient' that updates the user's nausea" do
#     user.update(:hungry => 10)
#     pantry = Pantry.create(:user_id => user.id, :recipe_id => recipe.id)
#     pantry.take_ingredient
#     mindy = User.find_by(:name => "Mindy")
#     expect(mindy.nausea).to eq(7)
#   end
#
#   it "has a method 'take_ingredient' that updates the user's happiness" do
#     user.update(:hungry => 10)
#     pantry = Pantry.create(:user_id => user.id, :recipe_id => recipe.id)
#     pantry.take_ingredient
#     mindy = User.find_by(:name => "Mindy")
#     expect(mindy.happiness).to eq(7)
#   end
# end
