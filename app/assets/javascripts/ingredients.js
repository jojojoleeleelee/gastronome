// now, time to add previous ingred and next ingred
// challenges: if at the end, no more ingreds (no next button)
// if at beginning no previous ingreds

$(function() {
  addIngredNavEvent()
})

function addIngredNavEvent() {
  $("button#next-ingred").click(function(e) {
    console.log("Load Next Ingred")
    // debugger
    loadIngred(this, true)
  })
  $("button#previous-ingred").click(function(e){
    console.log("Load Previous Ingred")
    loadIngred(this, true)
  })
}

function loadIngred(button, next) {
  let ingredId = 0;
  if (next) {
    ingredId = parseInt(button.dataset.ingredId) + 1
  } else {
    ingredId = parseInt(button.dataset.ingredId) - 1
  }
  let url = $.get(`/ingreds/${ingredId}.json`)
  url.done(function(rec) {
    let id = rec["id"]
    console.log(rec)
    debugger
  })
}

class Ingred {

  constructor(id) {
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
    let ingred = ""
    // if (this.notFirst)
  }
}
