// DOM Content Loaded
$(function(){

    console.log('読み込んだよ');

    //.nav-btnを押したら
    $('.nav-btn').on('click',function(){
        console.log('.nav-btnを押したよ');
        // noneの反対はblockのこと
        $('header').find('nav').css('display','block').addClass('fade-in');
    })

    //.close-btnを押したら
    $('.close-btn').on('click',function(){
        console.log('.close-btnを押したよ');
        $('header').find('nav').css('display','none').removeClass('fade-in');
    })

});
