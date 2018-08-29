$(function() {
  $("#new-comment").on("submit", function(e) {
    e.preventDefault();
    var url = this.action;
    console.log(this)
    const data = $(this).serialize();
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
      }
    });
  });
});


  // function Comment(id, recipeId, text) {
  //   this.id = id;
  //   this.recipe_id = recipeId;
  //   this.text = text;
  // }
  //
  class Comment {
    constructor(id, recipeId, text) {
      this.id = id;
      this.recipe_id = recipeId;
      this.text = text;
    }
    formatText() {
      let commentHtml = '';
      commentHtml += `<li style="text-align: left;">${this.text}</li>`
      return commentHtml;
    }
  }
  //
  // Comment.prototype.formatText = function() {
  //   let commentHtml = '';
  //   commentHtml += `<li style="text-align: left;">${this.text}</li>`
  //   return commentHtml;
  // }
