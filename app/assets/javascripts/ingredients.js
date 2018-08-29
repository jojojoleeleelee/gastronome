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
  // debugger;
  // getJSON
  let posting = $.get(`/ingredients/${ingredientId}.json`)
  posting.done(function(ingred) {
      // debugger;
    let id = ingred["id"]
    let name = ingred["name"]
    let created_at = ingred["created_at"]
    let notFirst = ingred["is_not_first"]
    let notLast = ingred["is_not_last"]

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
    let date = (this.created_at).slice(0, 10)
    let newName = (this.name).toUpperCase()

    ingredient += `<h1><em> ${newName} </em></h1>`
    // debugger;
    if (this.quantity !== undefined) {
    ingredient += `<h2>${this.quantity}</h2>`
    }

    ingredient += `<h2>Date added: ${date} </h2><br>`
    ingredient += `<br><br><h2><small>Back to</small><sup><a href="/recipes/index"> PANTRY</a></sup></h2><br><br>`

    if (this.notFirst) {
      ingredient += `<button id='previous-ingredient' data-ingredient-id="${this.id}" style='float:right;'>PREVIOUS</button>`
    }
    if (this.notLast) {
      ingredient += `<button id='next-ingredient' data-ingredient-id="${this.id}" style='float:left;'>NEXT</button>`
    }
    $("div#ingredient")[0].innerHTML = ingredient
  }
}
