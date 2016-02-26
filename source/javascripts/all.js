//= require jquery/dist/jquery
//= require what-input/what-input.min
//= require foundation-sites/dist/foundation.min

//= require app
//= require script

$(document).ready(function(){

    $(document).foundation({
        orbit: {
            timer: true,
            timer_speed: 2000,
            timer_paused_class: 'slider-pause',
            slide_number: true,
            pause_on_hover: false,
            animation_speed: 1000,
            navigation_arrows: true,
            variable_height: false,
            bullets: false
        }
    });

    $(".orbit-timer").click();

    $('#play').on('click', function(){
        $("#featured").siblings(".slider-pause").click();
    });

    $("#pause").click(function() {
        $("#featured").siblings(".orbit-timer").click();
    });

});
