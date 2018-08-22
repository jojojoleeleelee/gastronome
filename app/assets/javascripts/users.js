$(function(){
  $("a#signin").on("click", function(e){
    $.get(this.href).success(function(response){
      $(document).html(response)
    })
    e.preventDefault();
  })
})
