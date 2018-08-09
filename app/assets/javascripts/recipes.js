// Submit Comments via AJAX - Soon to be replaced by remote true
// $(function(){
//   $("#new_comment").on("submit", function(e){
//     // 1. we need the URL to submit the POST request too
//     // 2. we need the form data.
//
//     // Low level
//     $.ajax({
//       type: ($("input[name='_method']").val() || this.method),
//       url: this.action,
//       data: $(this).serialize();, // either JSON or querystring serializing
//       success: function(response){
//         $("#comment_content").val("");
//         var $ol = $("div.comments ol")
//         $ol.append(response);
//       }
//     });
//
//     // Send a POST request to the correct place that form would've gone too anyway
//     // along with the actual form data.
//     e.preventDefault();
//   })
// });


$('button#show_comments').click(function(e) {
  if ($('article.message').length) {
    hideComments()
  } else {
    showComments(this)
  }
})

function showComments(button) {
  let recipeId = parseInt(button.dataset.prayerId)
  let currenUser = button.dataset.currentUser
  let posting = $.get(`/recipe/${recipeId}/comments.json`)
  posting.done(function(response) {
    response.forEach(function(comment) {
      let id = comment['id']
      let content = comment['content']
      let time = comment['time']
      comment = new Comment(id, recipeId, content, time)
      comment.display()
    })
  })
}

function hideComments() {
  let commentCount = $('article.message').length
  $('div#comments_index')[0].innerHTML = '';
  $('button#show_comments')[0].innerHTML = `Show Comments(${commentCount})`
}

class Comment {

  constructor(id, prayerId, content, commenter, time, adminButtons) {
    this.id = id;
    this.prayerId = prayerId;
    this.content = content;
    this.commenter = commenter;
    this.time = time;
    this.adminButtons = adminButtons;
  }

  display(){
    let comment = `<article id="comment-id-${this.id}" class="message"><div class="message-header">`
    comment += `<p><strong>${this.commenter}</strong></p>`
    comment += `${this.time}`
    comment += `</div><div class="message-body">`
    comment += `<p>${this.content}</p><br>`

    comment += `</div></article><br>`
    $('div#comments_index').append(comment)
    $('button#show_comments')[0].innerHTML = "Hide Comments"
  }
}
