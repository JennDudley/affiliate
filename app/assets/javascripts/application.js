var mouse_is_inside = false;

$(document).ready(function() {

    $(".bttn.header").click(function() {
    var loginBox = $("#login_box");
    alert(loginBox);
         if (loginBox.is(":visible"))
            loginBox.fadeOut("fast");
        else
            loginBox.fadeIn("fast");
        return false;
    });

	$("#login_box").hover(function(){ 
        mouse_is_inside=true; 
    }, function(){ 
        mouse_is_inside=false; 
    });

    $("body").click(function(){
        if(! mouse_is_inside) $("#login_box").fadeOut("fast");
    });

});
