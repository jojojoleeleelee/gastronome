has_many relationship
User has_many Ingredients
User has_many Recipes

has_many through - one user submittable attribute:
Recipe.rating

Include sound validations for simple model objects

class level ActiveRecord scope method: model object, class method name and URL to see the working feature e.g. Recipe.rating URL: /recipes/rating


OR perhaps I should do Ingredient.rating...
or  Ingredient.comments

Things to add:

- AJAX comment on Recipe show page - hijack the post, append DOM
- NO refresh. Dynamic posting

things to accomplish within today:
1. Load Recipe comments on Recipe Show page using JSON backend and Active model serialization
2. One has_many relationship in info rendered via JSON and appended to the DOM - Recipe has many comments - JSON: /recipes/recipe_id/comments
3. Rails API and a form to create a resource and render the resonse without a page refresh - create comments on recipes??
4. translate JSON responses into js model objects (aren't these just the comments??)



-
