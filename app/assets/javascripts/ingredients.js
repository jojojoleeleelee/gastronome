
$(function(){
  addIngredientNavigationEvent()
})

function addIngredientNavigationEvent() {
  $('button#next_ingred').click(function (e) {
    console.log("Load Next Ingredient ")
    loadIngredient(this, true)
  })

  $('button#previous_ingred').click(function (e) {
    console.log("Load Previous Ingredient ")
    loadIngredient(this, false)
  })
}

function loadIngredient(button, next){
  let ingredId = 0;
  if (next) {
    ingredId = parseInt(button.dataset.ingredId) + 1
  } else {
    ingredId = parseInt(button.dataset.ingredId) - 1
  }
  let posting = $.get(`/ingreds/${ingredId}.json`)
  posting.done(function (ingred) {
    let id = ingred["id"]
    let name = ingred["name"]
    let quantity = ingred["quantity"]


    ingred = new Ingredient(id, name, quantity)
    ingred.display()
    addIngredientNavigationEvent()
  })
}


class Ingredient {

  constructor(id, name, quantity) {
    this.id = id;
    this.name = name;
    this.quantity = quantity;
  }
}
