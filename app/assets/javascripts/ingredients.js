// now, time to add previous ingredient and next ingredient
// challenges: if at the end, no more ingredients (no next button)
// if at beginning no previous ingredients

$(function() {
  addIngredientNavEvent()
})

function addIngredientNavEvent() {
  $("button#next-ingredient").click(function(e) {
    debugger
    console.log("Load Next Ingredient")

    loadIngredient(this, true)
  })
  $("button#previous-ingredient").click(function(e){
    console.log("Load Previous Ingredient")
    loadIngredient(this, true)
  })
}

function loadIngredient(button, next) {
  let ingredientId = 0;
  if (next) {
    ingredientId = parseInt(button.dataset.ingredientId) + 1
  } else {
    ingredientId = parseInt(button.dataset.ingredientId) - 1
  }
  let url = $.get(`/ingredients/${ingredientId}.json`)
  url.done(function(rec) {
    let id = rec["id"]
    console.log(rec)
    debugger
  })
}

class Ingredient {

  constructor(id) {
  // not first or not last?? notFirst notLast
  this.id = id;

  }

  display() {
    let ingredient = ""
    // if (this.notFirst)
  }
}
