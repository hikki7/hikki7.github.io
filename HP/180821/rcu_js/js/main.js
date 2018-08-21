// DOM Content Loaded
$(function(){


    console.log('読み込んだよ');

    // スライドショー
    $('.slider').slick({
        arrows: false,
        autoplay: true,
        adaptiveHeight: true,
        dots: true
    });

    var modalImg=['img/works01.jpg','img/works02.png','img/works03.png'];
    for(var i=0;i<modalImg.length;i++){
        //キャシュの中に入ってる
        $('<img>').attr('scr',modalImg[i]);
    }

    // モーダル
    $('#works').find('section').on('click',function(){

        //sectionの何番目を押したか
        var index = $('#works').find('section').index(this);
        var modal = $('<div class="modal"><img src="'+ modalImg[index] +'" alt=""></div>');
        $('#overlay').html(modal);
        console.log(index);
        $('#overlay').css('display','block').addClass('fade-in');
        $('#overlay').on('click',function(){
            $(this).css('display','none').removeClass('fade-in');
        });
    });



    $(window).on('scroll',function(){
        // 上からのスクロール値
        var dy = $(this).scrollTop();
        // console.log(dy);

        // #works .containerの高さを取得
        var worksContainerTop = $('#works').find('.container').offset().top;
        // console.log(worksContainerTop);

        // スクロールが#works .containerのY座標を超えらたら
        if(dy >= worksContainerTop - $(window).height()){
            // sectionに.fade-inのクラスを追加する
            $('#works').find('section').addClass('fade-in');
        }
    });

});
