$(function(){

    console.log('読み込んだよ');

    $('.slider').slick({
        arrows: false,
        autoplay: true,
        adaptiveHeight: true,
        dots: true,
        fade: true
    });

    // modal
    var worksImgs = ['img/works01.jpg','img/works02.png','img/works03.png'];
    for (var i = 0; i < worksImgs.length; i++) {
        $("<img>").attr("src", worksImgs[i]);
    }
    $('#works').find('section').on('click',function(){
        var index = $('#works').find('section').index(this);
        var modal = $('<div class="modal"><img src="'+worksImgs[index]+'" alt="" width="800"></div>');
        $('#overlay').html(modal);
        $('#overlay').css('display','block').addClass('fade-in');
        $('#overlay').on('click',function(){
            $(this).css('display','none').removeClass('fade-in');
        })
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
