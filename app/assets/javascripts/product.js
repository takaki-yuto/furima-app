$(document).on('turbolinks:load',function(){
  $(".sub-image").click(function(){
    var srcUrl = $(this).attr('src');
    var idCount = $(this).attr('id');
    $("#main-image").attr('src',srcUrl);
    $(".sub-image").removeClass("active");
    $("#" + idCount).addClass("active");
  });
});