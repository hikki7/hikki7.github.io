$(function(){
    console.log('読み込んだよん');
    // スクロールしたらってやつ
    $(window).on('scroll',function(){
        // 上からのスクロール値
        var dy=$(this).scrollTop();
        // console.log(dy);

        //#works .containerの高さの取得
        var worksCantainerTop=$('#works').find('.container').offset().top;
        console.log(worksCantainerTop);

        if(dy>=worksCantainerTop-$(window).height()){
            $('#works').find('section').addClass('fade-in');
        }

    });
})
