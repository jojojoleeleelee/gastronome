// now, time to add previous ingredient and next ingredient
// challenges: if at the end, no more ingredients (no next button)
// if at beginning no previous ingredients

$(function() {
  addIngredientNavEvent()
})

function addIngredientNavEvent() {
  $("button#next-ingredient").click(function(e) {
    // debugger
    console.log("Load Next Ingredient")
    loadIngredient(this, true)
  })
  $("button#previous-ingredient").click(function(e){
    console.log("Load Previous Ingredient")
    loadIngredient(this, false)
  })
}

function loadIngredient(button, next) {
  let ingredientId = 0;
  if (next) {
    ingredientId = parseInt(button.dataset.ingredientId) + 1
  } else {
    ingredientId = parseInt(button.dataset.ingredientId) - 1
  }
  let posting = $.get(`/ingredients/${ingredientId}.json`)
  posting.done(function(ingred) {
    let id = ingred["id"]
    let name = ingred["name"]
    let created_at = ingred["created_at"]
    let notFirst = ingred["notFirst"]
    let notLast = ingred["notLast"]
  debugger;
    ingredient = new Ingredient(id, name, created_at, notFirst, notLast)
    ingredient.display();
    addIngredientNavEvent();
  })
}

class Ingredient {

  constructor(id, name, created_at, notFirst, notLast) {
  // how to determine not first or not last?? notFirst notLast
  this.id = id;
  this.name = name;
  this.created_at = created_at;
  this.notFirst = notFirst;
  this.notLast = notLast;
  }

  display() {
    let ingredient = ""
    if (this.notFirst) {
      ingredient += `<button id='previous-ingredient' data-ingredient-id="${this.id}" style='float:right;'>PREVIOUS</button>`
    }
    if (this.notLast) {
      ingredient += `<button id='next-ingredient' data-ingredient-id="${this.id}" style='float:left;'>NEXT</button>`
    }
    ingredient += `<h1><em>${this.name}.upcase </em></h1>`
    ingredient += `<h2>${this.quantity}</h2>`
    ingredient += `<h2>Date added: ${this.created_at}.strftime('%m/%d/%Y') </h2><br>`

    $("div#ingredient")[0].innerHTML = ingredient
  }
}
