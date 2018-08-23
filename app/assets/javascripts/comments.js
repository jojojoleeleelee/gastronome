$(function() {
  $("#new-comment").on("submit", function(e) {
    e.preventDefault();
    var urlElement = e.action
    var url = this.action;
    console.log(this)
    const data = $(this).serialize();
    //debugger
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      dataType: "json",
      success: function(res) {
        $("#comment-text").val("");
        let newComment = new Comment(res.id, res.recipe_id, res.text);
        let formatComment = newComment.formatText();
        $(".commentsList").append(formatComment)
        $("#comment-submit").attr("disabled", false)
      }
    });
  });

  function Comment(id, recipeId, text) {
    this.id = id;
    this.recipeId = recipeId;
    this.text = text;
  }

  Comment.prototype.formatText = function() {
    let commentHtml = '';
    commentHtml += `<li>${this.text}</li>`
    return commentHtml;
  }
});
