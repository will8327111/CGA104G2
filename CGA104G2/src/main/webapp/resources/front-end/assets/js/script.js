/*===========================================================*/
/*移動到特定位置換色*/
/*===========================================================*/

let elemTop = [];

//取得目的地
function PositionCheck() {
	//取得header高
	let headerH = $("#header").outerHeight(true);
	//設定跑到特定class位置 .scroll-point 
	$(".scroll-point").each(function (i) {//計算從top到.scroll-point的畫面距離
		elemTop[i] = Math.round(parseInt($(this).offset().top - headerH - 10)); //設定停留在目的地高-10的位置
	});
}

//ナビゲーションに現在地のクラスをつけるための設定
function ScrollAnime() {//スクロールした際のナビゲーションの関数にまとめる
	let scroll = Math.round($(window).scrollTop());
	let NavElem = $("#pc-nav li");//ナビゲーションのliの何番目かを定義するための準備
	$("#pc-nav li").removeClass('current');//全てのナビゲーションの現在地クラスを除去
	if (scroll >= elemTop[0] && scroll < elemTop[1]) {//.scroll-point 1つめ以上.scroll-point 2つめ未満
		$(NavElem[0]).addClass('current');//1つめのliに現在地クラスを付与
	}
	else if (scroll >= elemTop[1] && scroll < elemTop[2]) {//.scroll-point 2つめ以上.scroll-point 3つめ未満
		$(NavElem[1]).addClass('current');//2つめのliに現在地クラスを付与
	}
	else if (scroll >= elemTop[2] && scroll < elemTop[3]) {//.scroll-point 3つめ以上.scroll-point 4つめ未満
		$(NavElem[2]).addClass('current');//3つめのliに現在地クラスを付与
	}
	else if (scroll >= elemTop[3] && scroll < elemTop[4]) {//.scroll-point 4つめ以上.scroll-point 5つめ未満
		$(NavElem[3]).addClass('current');//4つめのliに現在地クラスを付与
	}
	else if (scroll >= elemTop[4]) {// .scroll-point 5つめ（area-5）以上
		$(NavElem[4]).addClass('current');//5つめのliに現在地クラスを付与
	}
}

//ナビゲーションをクリックした際のスムーススクロール
$('#pc-nav a,#g-nav a').click(function () {
	let elmHash = $(this).attr('href'); //hrefの内容を取得
	let headerH = $("#header").outerHeight(true);//追従するheader分の高さ（70px）を引く
	let pos = Math.round($(elmHash).offset().top - headerH);	//headerの高さを引き小数点を四捨五入
	$('body,html').animate({ scrollTop: pos }, 500);//取得した位置にスクロール※数値が大きいほどゆっくりスクロール
	return false;//リンクの無効化
});

/*===========================================================*/
/*機能編  5-1-12 クリックしたらナビが下から上に出現*/
/*===========================================================*/

$(".openbtn").click(function () {//ボタンがクリックされたら
	$(this).toggleClass('active');//ボタン自身に activeクラスを付与し
	$("#g-nav").toggleClass('panelactive');//ナビゲーションにpanelactiveクラスを付与
});

$("#g-nav a").click(function () {//ナビゲーションのリンクがクリックされたら
	$(".openbtn").removeClass('active');//ボタンの activeクラスを除去し
	$("#g-nav").removeClass('panelactive');//ナビゲーションのpanelactiveクラスも除去
});


/*===========================================================*/
/*機能編  9-1-5 スクロールをするとエリアの高さに合わせて線が伸びる*/
/*===========================================================*/

$('body').scrollgress({//バーの高さの基準となるエリア指定
	height: '5px',//バーの高さ
	color: '#399d6e',//バーの色
});

/*===========================================================*/
/*到達指定高度從右方出現*/
/*===========================================================*/

function PageTopAnime() {
	let scroll = $(window).scrollTop();
	if (scroll >= 200) {
		$('#page-top').removeClass('RightMove');
		$('#page-top').addClass('LeftMove');
	} else {
		if (
			$('#page-top').hasClass('LeftMove')) {
			$('#page-top').removeClass('LeftMove');
			$('#page-top').addClass('RightMove');
		}
	}
}

// #page-top設定
$('#page-top').click(function () {
	$('body,html').animate({
		scrollTop: 0//page最上方
	}, 500);//轉變速度
	return false;//連結無效化
});



/*===========================================================*/
/*點選任意一個位置即會顯示隱藏的物件,再按一次則剛剛點選的消失換其他打開*/
/*===========================================================*/

$('.title').on('click', function () {
	$('.box').slideUp(500);

	let findElm = $(this).next(".box");

	if ($(this).hasClass('close')) {
		$(this).removeClass('close');
	} else {
		$('.close').removeClass('close');
		$(this).addClass('close');
		$(findElm).slideDown(500);
	}
});


/*===========================================================*/
/*news ticker
/*===========================================================*/

let slider;
let sliderFlag = false;
let breakpoint = 768;//畫面768px以下

function sliderSet() {
	let windowWidth = window.innerWidth;
	if (windowWidth >= breakpoint && !sliderFlag) {//768px以上slider會轉變成一行顯示
		slider = $('.slider').bxSlider({
			mode: 'vertical',//縦slide
			controls: false,//
			auto: 'true',//自動slide
			pager: false//去掉可選多page
		});
		sliderFlag = true;
	} else if (windowWidth < breakpoint && sliderFlag) {
		slider.destroySlider();
		sliderFlag = false;
	}
}


//漸變動畫
function fadeAnime() {
	// 左滑入
	$('.bgLRextendTrigger').each(function () {
		let elemPos = $(this).offset().top - 50;//上50px的位置
		let scroll = $(window).scrollTop();
		let windowHeight = $(window).height();
		if (scroll >= elemPos - windowHeight) {
			$(this).addClass('bgLRextend');// 進到畫面中加上class名 bgLRextend
		} else {
			$(this).removeClass('bgLRextend');// 離開画面移除bgLRextend
		}
	});
	$('.bgappearTrigger').each(function () {
		let elemPos = $(this).offset().top - 50;
		let scroll = $(window).scrollTop();
		let windowHeight = $(window).height();
		if (scroll >= elemPos - windowHeight) {
			$(this).addClass('bgappear');
		} else {
			$(this).removeClass('bgappear');
		}
	});
	// 從下方飄入
	$('.fadeUpTrigger').each(function () {
		let elemPos = $(this).offset().top - 50;//上面50px
		let scroll = $(window).scrollTop();
		let windowHeight = $(window).height();
		if (scroll >= elemPos - windowHeight) {
			$(this).addClass('fadeUp');
		} else {
			$(this).removeClass('fadeUp');
		}
	});

	// 往左切入
	$('.flipLeftTrigger').each(function () {
		let elemPos = $(this).offset().top - 50;
		let scroll = $(window).scrollTop();
		let windowHeight = $(window).height();
		if (scroll >= elemPos - windowHeight) {
			$(this).addClass('flipLeft');
		} else {
			$(this).removeClass('flipLeft');
		}
	});

}

//畫面size變動
$(window).on('resize', function () {
	sliderSet();
});

$(window).scroll(function () {
	PageTopAnime();
	PositionCheck();
	ScrollAnime();
	fadeAnime();
});

// page讀入即顯示
$(window).on('load', function () {

	$("#splash-logo").delay(1200).fadeOut('slow');//logo 1.2秒 fade out

	//lodaing後效果
	//由下往上背景色覆蓋
	$("#splash").delay(1500).fadeOut('slow', function () {
		$('body').addClass('appear');
		sliderSet();
		PositionCheck();
		ScrollAnime();
		PageTopAnime();

		//點選任意一個位置即會顯示隱藏的物件,再按一次則消失換其他打開
		$(".open").each(function (index, element) {
			let Title = $(element).children('.title');	//取得open class子要素的title
			$(Title).addClass('close');
			let Box = $(element).children('.box');
			$(Box).slideDown(500);
		});

	});

	$('.splashbg').on('animationend', function () {
		fadeAnime();
	});

});

/*===========================================================*/
/*複數圖片輪播*/
/*===========================================================*/

$('.slider2').slick({
	arrows: false,//左右の矢印はなし
	autoplay: true,//自動的に動き出すか。初期値はfalse。
	autoplaySpeed: 0,//自動的に動き出す待ち時間。初期値は3000ですが今回の見せ方では0
	speed: 6900,//スライドのスピード。初期値は300。
	infinite: true,//スライドをループさせるかどうか。初期値はtrue。
	pauseOnHover: false,//オンマウスでスライドを一時停止させるかどうか。初期値はtrue。
	pauseOnFocus: false,//フォーカスした際にスライドを一時停止させるかどうか。初期値はtrue。
	cssEase: 'linear',//動き方。初期値はeaseですが、スムースな動きで見せたいのでlinear
	slidesToShow: 4,//スライドを画面に4枚見せる
	slidesToScroll: 1,//1回のスライドで動かす要素数
	responsive: [
		{
			breakpoint: 769,//モニターの横幅が769px以下の見せ方
			settings: {
				slidesToShow: 2,//スライドを画面に2枚見せる
			}
		},
		{
			breakpoint: 426,//モニターの横幅が426px以下の見せ方
			settings: {
				slidesToShow: 1.5,//スライドを画面に1.5枚見せる
			}
		}
	]
});


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
	}
});