$(function() {
  alphabetizeComments()
})

function alphabetizeComments() {
  $("button#alph").click(function(e) {
    e.preventDefault()
    let recipeId = parseInt(this.dataset.recipeId)
    let comment = $.get(`/recipes/${recipeId}/comments.json`)
    comment.done(function(comments) {
      // debugger;
      let sorted = comments.sort(alphabetize)
      let format = sorted.map(comment => new Comment(comment.id, comment.recipeId, comment.content).formatText())
      $(".commentsList").html(format)
      })
    })
  }


  function alphabetize(a, b) {
  var textA = a.content.toUpperCase();
  var textB = b.content.toUpperCase();
  return (textA < textB) ? -1 : (textA > textB) ? 1 : 0;
    }
