/*===========================================================*/
/* moddal用法 */
/*===========================================================*/


//text
$(".info").modaal({
    overlay_close: true,//離開moddal區域要關閉嗎
    before_open: function () {
        $('html').css('overflow-y', 'hidden');
    },
    after_close: function () {//close後動作
        $('html').css('overflow-y', 'scroll');
    }
});

//確認用
$(".confirm").modaal({
    type: 'confirm',
    confirm_title: '要前往嗎?',
    confirm_button_text: '確定',
    confirm_cancel_button_text: '放棄',
    confirm_content: '請點選確定或放棄，不然畫面不會消失。',//畫面内容
});


//圖片
$(".gallery").modaal({
    type: 'image',
    overlay_close: true,
    before_open: function () {
        $('html').css('overflow-y', 'hidden');
    },
    after_close: function () {
        $('html').css('overflow-y', 'scroll');
    }
});

//動畫
$(".video-open").modaal({
    type: 'video',
    overlay_close: true,
    background: '#28BFE7',
    overlay_opacity: 0.8,
    before_open: function () {
        $('html').css('overflow-y', 'hidden');
    },
    after_close: function () {
        $('html').css('overflow-y', 'scroll');
    }
});

//iframe
$(".iframe-open").modaal({
    type: 'iframe',
    width: 800,//iframe寬
    height: 800,//iframe高
    overlay_close: true,
    before_open: function () {
        $('html').css('overflow-y', 'hidden');
    },
    after_close: function () {
        $('html').css('overflow-y', 'scroll');
        window.location.replace(location.href);
    }
});