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

//nav位置加上捲動效果class
function ScrollAnime() {
	let scroll = Math.round($(window).scrollTop());
	let NavElem = $("#pc-nav li");
	$("#pc-nav li").removeClass('current');
	if (scroll >= elemTop[0] && scroll < elemTop[1]) {//.scroll-point 一個以上不到兩個
		$(NavElem[0]).addClass('current');//第一個li加上class
	}
	else if (scroll >= elemTop[1] && scroll < elemTop[2]) {
		$(NavElem[1]).addClass('current');
	}
	else if (scroll >= elemTop[2] && scroll < elemTop[3]) {
		$(NavElem[2]).addClass('current');
	}
	else if (scroll >= elemTop[3] && scroll < elemTop[4]) {
		$(NavElem[3]).addClass('current');
	}
	else if (scroll >= elemTop[4]) {
		$(NavElem[4]).addClass('current');
	}
}

//點擊nav出現緩滑動效果
$('#pc-nav a,#g-nav a').click(function () {
	let elmHash = $(this).attr('href');
	let headerH = $("#header").outerHeight(true);
	let pos = Math.round($(elmHash).offset().top - headerH);
	$('body,html').animate({ scrollTop: pos }, 500);
	return false;
});

/*===========================================================*/
/*點擊由上往下出現
/*===========================================================*/

$(".openbtn").click(function () {
	$(this).toggleClass('active');
	$("#g-nav").toggleClass('panelactive');
});

$("#g-nav a").click(function () {
	$(".openbtn").removeClass('active');
	$("#g-nav").removeClass('panelactive');
});


/*===========================================================*/
/*隨著高度滑動延伸bar長度
/*===========================================================*/

$('body').scrollgress({//指定bar位置
	height: '5px',
	color: '#399d6e',
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
//home-top設定
$('#home-top').click(function () {
	$('body,html').animate({
		scrollTop: 0
	}, 500);
	return false;
});


/*===========================================================*/
/*點選任意一個位置即會顯示隱藏的物件,再按一次則剛剛點選的消失換其他打開
/*===========================================================*/

$('.title').on('click', function () {
	$('.box').slideUp(400);

	let findElm = $(this).next(".box");

	if ($(this).hasClass('close')) {
		$(this).removeClass('close');
	} else {
		$('.close').removeClass('close');
		$(this).addClass('close');
		$(findElm).slideDown(400);
	}
});


/*===========================================================*/
/*news ticker 圖片輪播
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
		console.log('destroying');
	}
}


//字體漸變動畫
function fadeAnime() {
	$('.bgLRextendTrigger').each(function () {
		let elemPos = $(this).offset().top - 50;//上50px的位置
		let scroll = $(window).scrollTop();
		let windowHeight = $(window).height();
		if (scroll >= elemPos - windowHeight) {
			$(this).addClass('bgLRextend');
		} else {
			$(this).removeClass('bgLRextend');
		}
	});
	$('.bgappearTrigger').each(function () {
		let elemPos = $(this).offset().top ;
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
			$(Box).slideDown(400);
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
	arrows:true,
	autoplay: true,
	autoplaySpeed: 3000,
	speed: 6900,
	infinite: true,//loop
	pauseOnHover: false,//onMouse停止
	pauseOnFocus: false,//focus停止
	cssEase: 'ease',
	slidesToShow: 4,
	slidesToScroll: 1,
	responsive: [
		{
			breakpoint: 769,//769px以下
			settings: {
				slidesToShow: 2,
			}
		},
		{
			breakpoint: 426,//426px以下
			settings: {
				slidesToShow: 1,
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
		window.location.replace(location.href);
	}
});

//按鈕出現提示浮動
tippy('.cap', {
		placement: 'top',//出現位置
		animation: 'shift-away-subtle',
		theme: 'light-border',
		duration: 200,
	}
)


/*===========================================================*/
/*獨立tab menu*/
/*===========================================================*/

function GethashID (hashIDName){
	if(hashIDName){
		$('.tab li').find('a').each(function() { //取得tab裡的所有a tag
			let idName = $(this).attr('href');
			if(idName == hashIDName){
				let parentElm = $(this).parent();
				$('.tab li').removeClass("active");
				$(parentElm).addClass("active");
				$(".area").removeClass("is-active");
				$(hashIDName).addClass("is-active");
			}
		});
	}
}

//tab click
$('.tab a').on('click', function() {
	let idName = $(this).attr('href'); //取得tab裡的連結
	GethashID (idName);
	return false;
});

$(window).on('load', function () {
	$('.tab li:first-of-type').addClass("active");
	$('.area:first-of-type').addClass("is-active");
	let hashName = location.hash;
	GethashID (hashName);
});

$('.tab a').on('click', function() {
	let idName = $(this).attr('href');
	GethashID (idName);
	return false;
});

$(window).on('load', function () {
	let hashName = location.hash;
	GethashID(hashName);
});