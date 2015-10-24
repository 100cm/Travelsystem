/**
 * Created by icepoint on 8/18/15.
 */

function click_navbar(class_name){
    console.log(class_name);
    var li=$(class_name+' li');

    li.each(function(){
        $(this).click(function(){
            $(this).siblings().attr('class','not-active');

            $(this).attr('class' ,'active');
        })

    })



}

window.onload = function() {
    click_navbar(".navbar-left")

}

