// now, time to add previous recipe and next recipe
// challenges: if at the end, no more recipes (no next button)
// if at beginning no previous recipes

$(function() {
  addRecipeNavEvent()
})

function addRecipeNavEvent() {
  $("button#next-recipe").click(function(e) {
    console.log("Load Next Recipe")
    loadRecipe(this, true)
  })
  $("button#previous-recipe").click(function(e){
    console.log("Load Previous Recipe")
    loadRecipe(this, true)
  })
}

function loadRecipe(button, next) {
  let recipeId = 0;
  if (next) {
    recipeId = parseInt(button.dataset.recipeId) + 1
  } else {
    recipeId = parseInt(button.dataset.recipeId) - 1
  }
  let url = $.get(`/recipes/${recipeId}.json`)
  url.done(function(rec) {
    let id = rec["id"]
    console.log(rec)
    debugger
  })
}

class Recipe {

  constructor(id, title, user_id, pic_url, ingred, description, cooked) {
  // not first or not last?? notFirst notLast
  this.id = id;
  this.title = title;
  this.user_id = user_id;
  this.pic_url = pic_url;
  this.ingred = ingred;
  this.description = description;
  this.cooked = cooked;
  }

  display() {
    let recipe = ""
    // if (this.notFirst)
  }
}
