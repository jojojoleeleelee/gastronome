
$(function(){
  $("a#signup").on("click", function(e){
    $.get(this.href).success(function(response){
      $("div#access").html(response)
    })
    e.preventDefault();
  })
})
