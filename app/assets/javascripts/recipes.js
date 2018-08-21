$(function(){
  $("#new_comment").on("submit", function(e){

    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        $("#comment_content").val("");
        var $ol = $("div.comments ol")
        $ol.append(response);
      }
    });

    e.preventDefault();
  })
});
// this is where the problem begins

function showComments(button){
  let recipeId = parseInt(button.dataset.recipeId)
  let posting = $.get(`/recipe/${recipeId}/comments.json`)
  posting.done(function(res){
    res.forEach(function(comment) {
      let id = comment['id']
      let content = comment['content']
      let recipe_id = comment['recipe_id']
      comment = new Comment(id, recipeId, content, recipe_id)
      comment.display()
    })
  })
}

$('button#show_comments').on('click', function(e) {
  console.log('help')
})


function hideComments() {
  let commentCount = $('article.message').length
  $('div#comments_index')[0].innerHTML = '';
  $('button#show_comments')[0].innerHTML = `Show Comments(${commentCount})`
}

class Comment {

  constructor(id, recipeId, content, recipe_id) {
    this.id = id;
    this.recipeId = recipeId;
    this.content = content;
    this.recipe_id = recipe_id;
  }

  display(){
    let comment = `<article id="comment-id-${this.id}" class="message"><div class="message-header">`
    comment += `<p><strong>${this.content}</strong></p>`

    comment += `</div></article><br>`
    $('div#comments_index').append(comment)
    $('button#show_comments')[0].innerHTML = "Hide Comments"
  }
}

//Another Recipe without page refresh, using AMS

$(function(){
  $("a.recipe-details").on("click", function(e){
    $.getJSON(this.href, function(data) {
      let recipeInfo = new Recipe(data.title, data.user_id, data.pic_url, data.ingred, data.description, data.cooked)
      let formatted = recipeInfo.formatRecipe();
      $('#recipe-info-' + data.id).html(formatted)
    })
    e.preventDefault();
  })

  function Recipe(title, user_id, pic_url, ingred, description, cooked) {
    this.title = title
    this.user_id = user_id
    this.pic_url = pic_url
    this.ingred = ingred
    this.description = description
    this.cooked = cooked
  }

  Recipe.prototype.formatRecipe = function(){
    let html = ''
    html += `<p>I'm a ${this.title}</p>`
    html += `<p>${this.user_id}</p>`
    html += `<p>${this.pic_url}</p>`
    html += `<p>${this.description}`
    html += `${this.cooked}</p>`
    html += `<p>${this.ingred}</p>`
    return html
  }

  $("a#new_recipe").on("click", function(e){
    $.get(this.href).success(function(response){
      $("div#addNew").html(response)
    })
    e.preventDefault();
  })
})
