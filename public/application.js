$(document).ready(function(){
    $("div.page").hover(
          function () {
            $("div."+$(this).attr('class').split(" ")[0]).addClass('highlightLetter');
            $(this).addClass('highlightPage');
          }, 
          function () {
            $("div."+$(this).attr('class').split(" ")[0]).removeClass('highlightLetter');
            $(this).removeClass('highlightPage');
          }
        );
});
