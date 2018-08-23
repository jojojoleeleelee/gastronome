$(function() {
  $("#new-comment").on("submit", function(e) {
    e.preventDefault();
    var urlElement = e.action
    var url = this.action;
    console.log(this)
    const data = $(this).serialize();

  })
})
