
# this is where I;ll create a few users :)
jojo = User.create(username: "Jojo", email: "jojo@gmail.com", password: "jojo")
dodo = User.create(username: "Dodo", email: "dodo@gmail.com", password: "dodo")
momo = User.create(username: "Momo", email: "momo@gmail.com", password: "momo")
bobo = User.create(username: "Bobo", email: "bobo@gmail.com", password: "bobo")

# ingredients of each users
jojo_pantry = ["chocolate", "strawberry", "carrot", "quinoa"]
  jojo_pantry.each do |f|
    Ingredient.create(name: f, quantity: "3 cups", user_id: 1)
  end

dodo_pantry = ["kale", "fish", "eggs", "quinoa"]
  dodo_pantry.each do |f|
    Ingredient.create(name: f, quantity: "3 cups", user_id: 2)
  end

momo_pantry = ["milk", "butter", "sugar", "flour"]
  momo_pantry.each do |f|
    Ingredient.create(name: f, quantity: "3 cups", user_id: 3)
  end

  jojo_recipe = Recipe.create(name: "Chocolate Pudding", user_id: 1, time: "20 minutes", description: "Off heat, whisk the half and half, sugar, arrowroot and salt in a large saucepan until the sugar starts to dissolve. Heat the mixture over medium-high heat and continue whisking. When it thickens to the consistency of heavy cream, just before it comes to a boil, turn off the heat but leave the pan on the burner. Add the chocolate, cover with a lid, and wait 30 seconds. Remove the lid and use an immersion blender or whisk to blend it very smooth. Blend in the vanilla. Divide the pudding to fill 4 6-ounce ramekins, or bowls. Let cool at room temperature until it sets, about 15 minutes, or cool to room temperature until ready to serve. For ginger or Mexican chocolate variations, mix respective ingredients with the sugar in step 1, and top with crystallized ginger or cacao nibs accordingly.")
