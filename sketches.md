What on earth am I trying to build:
Gastronome - a recipe manager while making sure the ingredients in your pantry are utilized before it goes bad. Speaking of which, should I add expiration date for ingredients, then??

Oh Lordy...

Unlike my previous two projects, I feel utterly clueless as to where I should begin. But sentiments aside, it's time to roll up my sleeves and dive into this work.

So, to begin with - a few criterias I must achieve.
* authentication using Ominauth (google, specifically)
* JOIN table = recipe_ingredients.
* scope: ActiveRelations - AREL - perhaps ordered by preference or rating of the recipe? wait, wait, let me back up a bit.

Oh dear, I just hope I don't write spaghetti code...
***THE MODELS***
User:
username
email
password
admin
hungry
energy

(wondering, is the hungry and energy really necessary:)
I thought it'd be cool to have hunger and energy levels decrease after making a recipe. But this might be slightly impractical and cumbersome to implement.

Ingredient: - basically the food items the user has in his/her pantry
name
user_id (a carrot that belongs to Joe and a carrot that belongs to Anna is a diff. carrot)
quantity (1 bar of chocolate as opposed to 20 oz of chocolate)

Recipe:
name - e.g. chocolate pudding, deviled eggs
user_id - who made what and who's recipe does it belong to??
time - e.g. 20 minutes or 2 days(except no one would actually make anything that took two days)
description - this would be the instruction to make the recipe

RecipeIngredient:
ingredient_id
recipe_id
=== basically the way to join the two tables together. Ingredients can have a lotta recipes, carrot cake, carrot soup, carrot pickle, etc. And Recipes can have many ingredients - chocolate pudding would have chocolate, milk, egg yolks, maybe a touch of salt, etc etc.


*** USER CAN SIGN IN USING GOOGLE! Get that omniauth implemented!
Scopes: Maybe by how many times a user cooked the same recipe. Maybe they might have made chocolate pudding 41 times and cooked green curry only once. Then the user's recipe index could have the option of scoping the list of recipes by order of preference(frequency of completion). This... and/or by rating. speaking of which, should I let anyone see my pantry(ingredients) or should this be private? Maybe someone might want to keep their Jack Daniels in their cupboard a well-kept secret. Or their special caviar they bought from their honeymoon in France. Yeah, I feel like this stuff should be kept private. No one should know that I have 30 pounds of chocolate in my pantry. That'd be embarrassing.

So -- only users can see their own ingredients.
BUT the recipes that they create/post is public. So, Susan would know Joe made Chocolate cake 41 times. Still embarrassing, but oh well. Accountability is a good thing. Plus, maybe Susan can advise Joe on some indispensable tips to making the most exquisite chocolate cake.

This may be me being overtly ambitious, but honestly, who on earth has the time to fill in every single detailed instruction to their recipe? Nope. We live in a fast world, with impatient people. So SCRAPING TO THE RESCUE!

Websites I would like to scrape...

1. kitchn - looks like a lot of React/Javascript. Could be more complex that I'd like.
when I search quinoa carrot pepper I get zero results, though. Hmm.
https://www.thekitchn.com/search?q=quinoa+carrot+pepper
chocolate pudding is more promising:
https://www.thekitchn.com/search?q=chocolate+pudding

OR a website that is pretty...?
2. Bon Appetit (what's up with %20 after each keyword search query?)
when I search quinoa carrot pepper - this is what I get:
https://www.bonappetit.com/search/quinoa%20carrot%20pepper
3. Food52
In terms of sheer volume, this is the best option. I got 15,339 recipes matching "quinoa carrot rice"
https://food52.com/recipes/search?q=quinoa+carrot+rice
OKAY! I'm going with either Food52 or Bon Appetit. I'll decide later when I actually begin to scrape this.


***A possible problem with scraping***
should I scrape the whole entire page of the recipe?
For example, for FOOD52, there is a snippet of the recipe (optional)
and then a serving (e.g. serves: 2-4)
then a list of ingredients
and lastly a numerically divided... and rather comprehensive list of directions.
AND a photo too! (not always, but most of the time)
After I search, I should just grab the first three or else my already slow app will become even more unbearably slower. For example, the quinoa carrot rice search page put out 22 recipes in its first page... I don't want the app to be retrieving and scraping the detailed recipe of each and every one of those recipes. Yes, just three will do.
Let's try something with a typo... like instead of chocolate, our Mr. Joe is in a rush for his chocolate fix so he writes 'chocolat'. No worries, it still outputs 3,618 recipes
https://food52.com/recipes/search?q=chocolat
OR how about a REALLY BAD typo
like coclate instead of chocolate?
https://food52.com/recipes/search?q=cocloate
no worries, still got three recipes.
and what about super obscure ingredients... Like DURIAN
https://food52.com/recipes/search?q=durian
surprisingly works - got 10 recipes!
OR...... something crazy
like rabbit terrine pistachio
https://food52.com/recipes/search?q=rabbit+terrine+pistachio
I am getting a ton of irrelevent recipes like pistachio cake and summer squash couscous... and grilled aged cheddar cheese?? huh?
but I guess it'll work. Better than a blank page (nil must be avoided at all costs, even though I have to make orange-pistachio biscotti instead of my desired rabbit terrine with pistachio).
which makes me wonder... should I scrape google instead? Google would give me a legit rabbit terrine with pistachio recipe.
https://www.google.com/search?ei=0eQFW878MJXQ9AOIlZ34Cw&q=rabbit+terrine+with+pistachio&oq=rabbit+terrine&gs_l=psy-ab.1.0.35i39k1j0l7j0i22i30k1l2.786.3664.0.4584.17.12.5.0.0.0.148.1249.6j6.12.0....0...1.1.64.psy-ab..0.17.1304...0i131k1j0i20i264k1j0i20i263i264k1j0i20i263k1j0i10k1j0i22i10i30k1j33i160k1j0i13k1j0i13i30k1.0.yHAlvX3AyPA
It's just hella long... and possibly error-prone.
So yeah, Food52 it is!
I think I may be spending an inordinate amount of effort adding this added function of scraping websites... but hey. It's cool.

OK -
SOOO to simplify my babbling:
this would be the workflow of my hopefully functioning
Users: CREATE - sessions is instantiated
