function clearHighlight(){
    $("div.currentPage").removeClass("currentPage");
}

function change_page() {
    var current_page = $(this);
    var target_block = $("div#letter-detail");
    
    function successCallback(data, textStatus) {
        target_block.replaceWith(data);
    }
    function errorCallback(request, textStatus, errorThrown) {
        alert('There was an error. Please try again.');
    }
    
    clearHighlight();
    
    $.ajax({
        'url': current_page.attr('href'),
        'type': 'POST',
        'data': '',
        'success': successCallback,
        'error': errorCallback
    });
    
    return false;
}

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
//    $("a.flojax").live("click", change_page);
});
