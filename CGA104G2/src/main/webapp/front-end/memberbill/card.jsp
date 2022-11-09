<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<meta charset="UTF-8">
<title>刷卡頁面</title>
<!-- saved from url=(0054)https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut -->
<style>

</style>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/seller_template.dwt" codeOutsideHTMLIsLocked="false" --><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- SiteMap -->
    <meta name="google-site-verification" content="g1tlroYW-dChyLSinXJxV7BeP_T8nsDP1HpFSwORDgE" charset="UTF-8">
    
    <meta http-equiv="Content-Language" content="zh-TW">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=yes">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>選擇支付方式|綠界科技</title>

    <!-- FB share 用 請填入相關資訊 -->
    <meta property="og:url" content="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut">
    <meta property="og:title" content="綠界科技 ECPay">
    <meta property="og:description" content="綠界科技 ECPay 提供信用卡刷卡、超商代收及取貨付款、ATM轉帳...等多種金流收款服務，會員可於綠界網站建立收款網址或使用API程式串接，應用彈性，收款隔日起即撥款。支付找綠界，買賣無國界。">
    <meta property="og:site_name" content="綠界科技 ECPay">
    <meta property="og:image" content="https://www.ecpay.com.tw/Content/themes/WebStyle20131201/images/service/ecpay_fb.png">
    <meta property="og:image:secure_url" content="https://www.ecpay.com.tw/Content/themes/WebStyle20131201/images/service/ecpay_fb.png">
    <meta property="og:type" content="website"><!-- 網頁用website -->
    <!-- G+ share 用 請填入相關資訊 -->
    <meta itemprop="name" content="綠界科技 ECPay">
    <meta itemprop="image" content="https://www.ecpay.com.tw/Content/themes/WebStyle20131201/images/service/ecpay_fb.png">
    <meta itemprop="description" content="綠界科技 ECPay 提供信用卡刷卡、超商代收及取貨付款、ATM轉帳...等多種金流收款服務，會員可於綠界網站建立收款網址或使用API程式串接，應用彈性，收款隔日起即撥款。支付找綠界，買賣無國界。"><!-- G+用的網頁描述 -->
    <link rel="canonical" href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut">
    <link rel="shortcut icon" href="https://payment-stage.ecpay.com.tw/Content/themes/WebStyle201401/images/favicon.ico">
    <title>選擇支付方式|綠界科技</title>
    <!-- CSS -->
	<link href="./選擇支付方式_綠界科技_files/payment.css" rel="stylesheet">
	<link href="./選擇支付方式_綠界科技_files/pm_en.css" rel="stylesheet">
	<link href="./選擇支付方式_綠界科技_files/simplert.css" rel="stylesheet">


                              <script async="" src="./選擇支付方式_綠界科技_files/analytics.js.下載"></script><script>!function(e){var n="https://s.go-mpulse.net/boomerang/";if("False"=="True")e.BOOMR_config=e.BOOMR_config||{},e.BOOMR_config.PageParams=e.BOOMR_config.PageParams||{},e.BOOMR_config.PageParams.pci=!0,n="https://s2.go-mpulse.net/boomerang/";if(window.BOOMR_API_key="XCPKC-A9EMP-4ELDL-E9ER7-D4XA2",function(){function e(){if(!o){var e=document.createElement("script");e.id="boomr-scr-as",e.src=window.BOOMR.url,e.async=!0,i.parentNode.appendChild(e),o=!0}}function t(e){o=!0;var n,t,a,r,d=document,O=window;if(window.BOOMR.snippetMethod=e?"if":"i",t=function(e,n){var t=d.createElement("script");t.id=n||"boomr-if-as",t.src=window.BOOMR.url,BOOMR_lstart=(new Date).getTime(),e=e||d.body,e.appendChild(t)},!window.addEventListener&&window.attachEvent&&navigator.userAgent.match(/MSIE [67]\./))return window.BOOMR.snippetMethod="s",void t(i.parentNode,"boomr-async");a=document.createElement("IFRAME"),a.src="about:blank",a.title="",a.role="presentation",a.loading="eager",r=(a.frameElement||a).style,r.width=0,r.height=0,r.border=0,r.display="none",i.parentNode.appendChild(a);try{O=a.contentWindow,d=O.document.open()}catch(_){n=document.domain,a.src="javascript:var d=document.open();d.domain='"+n+"';void(0);",O=a.contentWindow,d=O.document.open()}if(n)d._boomrl=function(){this.domain=n,t()},d.write("<bo"+"dy onload='document._boomrl();'>");else if(O._boomrl=function(){t()},O.addEventListener)O.addEventListener("load",O._boomrl,!1);else if(O.attachEvent)O.attachEvent("onload",O._boomrl);d.close()}function a(e){window.BOOMR_onload=e&&e.timeStamp||(new Date).getTime()}if(!window.BOOMR||!window.BOOMR.version&&!window.BOOMR.snippetExecuted){window.BOOMR=window.BOOMR||{},window.BOOMR.snippetStart=(new Date).getTime(),window.BOOMR.snippetExecuted=!0,window.BOOMR.snippetVersion=12,window.BOOMR.url=n+"XCPKC-A9EMP-4ELDL-E9ER7-D4XA2";var i=document.currentScript||document.getElementsByTagName("script")[0],o=!1,r=document.createElement("link");if(r.relList&&"function"==typeof r.relList.supports&&r.relList.supports("preload")&&"as"in r)window.BOOMR.snippetMethod="p",r.href=window.BOOMR.url,r.rel="preload",r.as="script",r.addEventListener("load",e),r.addEventListener("error",function(){t(!0)}),setTimeout(function(){if(!o)t(!0)},3e3),BOOMR_lstart=(new Date).getTime(),i.parentNode.appendChild(r);else t(!1);if(window.addEventListener)window.addEventListener("load",a,!1);else if(window.attachEvent)window.attachEvent("onload",a)}}(),"".length>0)if(e&&"performance"in e&&e.performance&&"function"==typeof e.performance.setResourceTimingBufferSize)e.performance.setResourceTimingBufferSize();!function(){if(BOOMR=e.BOOMR||{},BOOMR.plugins=BOOMR.plugins||{},!BOOMR.plugins.AK){var n=""=="true"?1:0,t="",a="n74r4tyxjnmkmy2z5jga-f-fb008ea8e-clientnsv4-s.akamaihd.net",i="false"=="true"?2:1,o={"ak.v":"33","ak.cp":"1244136","ak.ai":parseInt("747465",10),"ak.ol":"0","ak.cr":56,"ak.ipv":4,"ak.proto":"h2","ak.rid":"3538ae14","ak.r":31213,"ak.a2":n,"ak.m":"dscb","ak.n":"essl","ak.bpcip":"111.249.30.0","ak.cport":50837,"ak.gh":"23.43.48.183","ak.quicv":"","ak.tlsv":"tls1.3","ak.0rtt":"","ak.csrc":"-","ak.acc":"","ak.t":"1666837068","ak.ak":"hOBiQwZUYzCg5VSAfCLimQ==nzBxgGUMw6u3W55QXY2gBCju8QJNCOe8jXXv/AjCb8bY6MyE+VyOHpzkbx/jUqBYq3TkpJP+DQPnwALYEkXbCloJ4UjC+fI1vFLo6w+BUdFyxyGfQlVtmjKEXr0bSYS8+Tz78YG/PJyCEHtizT0wKva3GfUHLDeDSmWq1aMDaA+EpqjFxGXLawuniFmDKNe8mrbDfkHO0o5YyDhS8qj7c8J0zmMH36M+OzE1uWfaNlCZXhXR1DhS/00Ev7SZVSHo7SLxxeQQLM7cNAy14McfzTsjFwO0WPj8iffn+E57dewnszssXlgnzYKPMeN6MtUbv/p6qc2A0/0i3R2ewrX3DywWnX6dWSpsV9T+85vi7pPGYVC8yPpFA/swM0dRcSxn1/kT9+JDVZoSNG4xWjNWU0//E6SPOqnEkIHR3w/WlY0=","ak.pv":"5","ak.dpoabenc":"","ak.tf":i};if(""!==t)o["ak.ruds"]=t;var r={i:!1,av:function(n){var t="http.initiator";if(n&&(!n[t]||"spa_hard"===n[t]))o["ak.feo"]=void 0!==e.aFeoApplied?1:0,BOOMR.addVar(o)},rv:function(){var e=["ak.bpcip","ak.cport","ak.cr","ak.csrc","ak.gh","ak.ipv","ak.m","ak.n","ak.ol","ak.proto","ak.quicv","ak.tlsv","ak.0rtt","ak.r","ak.acc","ak.t","ak.tf"];BOOMR.removeVar(e)}};BOOMR.plugins.AK={akVars:o,akDNSPreFetchDomain:a,init:function(){if(!r.i){var e=BOOMR.subscribe;e("before_beacon",r.av,null,null),e("onbeacon",r.rv,null,null),r.i=!0}return this},is_complete:function(){return!0}}}}()}(window);</script><link href="./選擇支付方式_綠界科技_files/XCPKC-A9EMP-4ELDL-E9ER7-D4XA2" rel="preload" as="script"><script id="boomr-scr-as" src="./選擇支付方式_綠界科技_files/XCPKC-A9EMP-4ELDL-E9ER7-D4XA2" async=""></script></head>
<body style="overflow: auto;">

    <!-- site-body start -->
    <div class="site-body">
        

<div class="site-main-wrapper">
	<div class="site-main">
		<a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut#" class="main-pic">
			<img src="./選擇支付方式_綠界科技_files/bn_950x200_02.jpg" alt="綠界科技ECPay">
		</a>
	</div>
</div>

<div id="ECPay" class="site-content-wrapper"><div class="site-content"><p class="provider">金流服務由綠界科技ECPay提供 Payment cashflow service provided by ECPay</p> <h3 class="content-title">訂單資訊 Order information</h3> <div class="order-table o-info-1"><dl><dt>訂單編號 Order number</dt> <dd>2210271016559668</dd></dl> <dl><dt>商店名稱 Merchant's name</dt> <dd>綠界測試店家</dd></dl></div> <div class="o-info-2" style="margin-bottom: 20px;"><p class="currency-type">單位 Unit：新台幣 NTD</p> <div class="order-table"><dl class="ot-title"><dd class="o-pd-name">商品明細 Merchandise detail</dd> <dd class="o-pd-total">小計 Subtotal</dd></dl> <dl><dd class="o-pd-name">管理費</dd> <dd class="o-pd-total">1,000</dd></dl></div> <div class="order-table ot-total"><dl class="o-sum"><dd class="o-other-name">實際付款金額 Actual payment amount</dd> <dd class="o-other-total">NT$1,000</dd></dl></div></div></div> <div role="modal" class="simplert"><div class="simplert__content simplert__content--radius"><div class="simplert__header"><!----> <div><!----> <!----> <!----> <!----> <!----></div> <b class="simplert__title"></b></div> <div class="simplert__body"><div></div></div> <div class="simplert__footer"><!----> <button id="btnClose" class="simplert__close simplert__close--radius">                                                                                                            </button></div></div></div></div>

<div class="site-content-wrapper scw-gray member-pay-wrap">

    <div class="site-content">
            <div class="member-pay">
                <h3 class="content-title">付款方式 Payment method</h3>
                <div id="AdDiv" class="ad"><div style=""></div> <div style="display: none;"></div></div>
                <div class="pay-tab-wrapper ptw-no-op">
                    <div id="ECTab" class="pay-tab-menu"><div class="pt-menu-btn">信用卡 Credit card</div> <ul class="pay-tab-list"><li title="Credit" class="active">信用卡 Credit card</li></ul></div>
                    <div class="pay-tab-content">

						<!-- 信用卡 -->

<script id="CreditData" type="text/javascript">
	var _CreditData = JSON.parse('{"UnionPay":0,"unionPayList":[{"PaymentTypeID":10021,"PaymentSubTypeID":1,"PaymentTypeName":"UnionPay","PaymentSubTypeName":"UnionPay","PaymentID":"10021@1@UnionPay_UnionPay","PaymentNotes":"銀聯","Notes":"銀聯","SystemBankName":"UnionPay","LowerLimitAMT":0,"UpperLimitAMT":0,"BankCode":null}],"defaultCard":0,"defaultCard4No":"****","defaultCard6No":"******","defaultCardBankName":null,"defaultCardBinCode":null,"memberCreditCardInfo":{"CName":"曾韻儒","CellPhone":"0918316990","StateCode":null},"BidingCard":0,"IsValidLastBindYYMM":false,"TradeInstmt":0,"Installment":0,"InstallmentAmount":1000,"CreditInstallments":[],"IsCardAvailableInstallmentsURL":null,"InstallmentsList":null,"RealMerchantID":2000132,"RedeemCount":0,"redeemInfoTW":null,"creditBonusUrl":null,"creditPay3D":false,"Taiwan3D":false,"Foreign3D":false,"isNotNeedCardHolder":1,"limitTaiwanCredit":"0","needOTPForAIO":1,"setMonth":10,"setYear":2022,"IsShowCellPhone":true,"isNotNeedCardHolderMail":1,"QuickPayID":18375,"Email":"yunru29@gmail.com","CountryCodeList":[{"CountryCode":"158","CountryName":"(TW) 台灣Taiwan"},{"CountryCode":"004","CountryName":"(AF) 阿富汗Afghanistan"},{"CountryCode":"248","CountryName":"(AX) 奧蘭Åland Islands"},{"CountryCode":"008","CountryName":"(AL) 阿爾巴尼亞Albania"},{"CountryCode":"012","CountryName":"(DZ) 阿爾及利亞Algeria"},{"CountryCode":"016","CountryName":"(AS) 美屬薩摩亞American Samoa"},{"CountryCode":"020","CountryName":"(AD) 安道爾Andorra"},{"CountryCode":"024","CountryName":"(AO) 安哥拉Angola"},{"CountryCode":"660","CountryName":"(AI) 安圭拉Anguilla"},{"CountryCode":"010","CountryName":"(AQ) 南極洲Antarctica"},{"CountryCode":"028","CountryName":"(AG) 安地卡及巴布達Antigua and Barbuda"},{"CountryCode":"032","CountryName":"(AR) 阿根廷Argentina"},{"CountryCode":"051","CountryName":"(AM) 亞美尼亞Armenia"},{"CountryCode":"533","CountryName":"(AW) 阿魯巴Aruba"},{"CountryCode":"036","CountryName":"(AU) 澳大利亞Australia"},{"CountryCode":"040","CountryName":"(AT) 奧地利Austria"},{"CountryCode":"031","CountryName":"(AZ) 亞塞拜然Azerbaijan"},{"CountryCode":"044","CountryName":"(BS) 巴哈馬Bahamas"},{"CountryCode":"048","CountryName":"(BH) 巴林Bahrain"},{"CountryCode":"050","CountryName":"(BD) 孟加拉國Bangladesh"},{"CountryCode":"052","CountryName":"(BB) 巴貝多Barbados"},{"CountryCode":"112","CountryName":"(BY) 白俄羅斯Belarus"},{"CountryCode":"056","CountryName":"(BE) 比利時Belgium"},{"CountryCode":"084","CountryName":"(BZ) 貝里斯Belize"},{"CountryCode":"204","CountryName":"(BJ) 貝南Benin"},{"CountryCode":"060","CountryName":"(BM) 百慕達Bermuda"},{"CountryCode":"064","CountryName":"(BT) 不丹Bhutan"},{"CountryCode":"068","CountryName":"(BO) 玻利維亞Bolivia"},{"CountryCode":"535","CountryName":"(BQ) 荷蘭加勒比區Bonaire, Sint Eustatius and Saba"},{"CountryCode":"070","CountryName":"(BA) 波赫Bosnia and Herzegovina"},{"CountryCode":"072","CountryName":"(BW) 波札那Botswana"},{"CountryCode":"074","CountryName":"(BV) 布韋島Bouvet Island"},{"CountryCode":"076","CountryName":"(BR) 巴西Brazil"},{"CountryCode":"086","CountryName":"(IO) 英屬印度洋領地British Indian Ocean Territory"},{"CountryCode":"096","CountryName":"(BN) 汶萊Brunei Darussalam"},{"CountryCode":"100","CountryName":"(BG) 保加利亞Bulgaria"},{"CountryCode":"854","CountryName":"(BF) 布吉納法索Burkina Faso"},{"CountryCode":"108","CountryName":"(BI) 蒲隆地Burundi"},{"CountryCode":"132","CountryName":"(CV) 維德角Cabo Verde"},{"CountryCode":"116","CountryName":"(KH) 柬埔寨Cambodia"},{"CountryCode":"120","CountryName":"(CM) 喀麥隆Cameroon"},{"CountryCode":"124","CountryName":"(CA) 加拿大Canada"},{"CountryCode":"136","CountryName":"(KY) 開曼群島Cayman Islands"},{"CountryCode":"140","CountryName":"(CF) 中非Central African Republic"},{"CountryCode":"148","CountryName":"(TD) 查德Chad"},{"CountryCode":"152","CountryName":"(CL) 智利Chile"},{"CountryCode":"156","CountryName":"(CN) 中國China"},{"CountryCode":"162","CountryName":"(CX) 聖誕島Christmas Island"},{"CountryCode":"166","CountryName":"(CC) 科科斯（基林）群島Cocos (Keeling) Islands"},{"CountryCode":"170","CountryName":"(CO) 哥倫比亞Colombia"},{"CountryCode":"174","CountryName":"(KM) 葛摩Comoros"},{"CountryCode":"178","CountryName":"(CG) 剛果Congo"},{"CountryCode":"180","CountryName":"(CD) 民主剛果Congo (Democratic Republic of the)"},{"CountryCode":"184","CountryName":"(CK) 庫克群島Cook Islands"},{"CountryCode":"188","CountryName":"(CR) 哥斯大黎加Costa Rica"},{"CountryCode":"384","CountryName":"(CI) 象牙海岸Côte d\u0027Ivoire"},{"CountryCode":"191","CountryName":"(HR) 克羅埃西亞Croatia"},{"CountryCode":"192","CountryName":"(CU) 古巴Cuba"},{"CountryCode":"531","CountryName":"(CW) 庫拉索Curaçao"},{"CountryCode":"196","CountryName":"(CY) 賽普勒斯Cyprus"},{"CountryCode":"203","CountryName":"(CZ) 捷克Czechia"},{"CountryCode":"208","CountryName":"(DK) 丹麥Denmark"},{"CountryCode":"262","CountryName":"(DJ) 吉布地Djibouti"},{"CountryCode":"212","CountryName":"(DM) 多米尼克Dominica"},{"CountryCode":"214","CountryName":"(DO) 多明尼加Dominican Republic"},{"CountryCode":"218","CountryName":"(EC) 厄瓜多Ecuador"},{"CountryCode":"818","CountryName":"(EG) 埃及Egypt"},{"CountryCode":"222","CountryName":"(SV) 薩爾瓦多El Salvador"},{"CountryCode":"226","CountryName":"(GQ) 赤道幾內亞Equatorial Guinea"},{"CountryCode":"232","CountryName":"(ER) 厄利垂亞Eritrea"},{"CountryCode":"233","CountryName":"(EE) 愛沙尼亞Estonia"},{"CountryCode":"748","CountryName":"(SZ) 史瓦帝尼Eswatini"},{"CountryCode":"231","CountryName":"(ET) 衣索比亞Ethiopia"},{"CountryCode":"238","CountryName":"(FK) 福克蘭群島Falkland Islands (Malvinas)"},{"CountryCode":"234","CountryName":"(FO) 法羅群島Faroe Islands"},{"CountryCode":"242","CountryName":"(FJ) 斐濟Fiji"},{"CountryCode":"246","CountryName":"(FI) 芬蘭Finland"},{"CountryCode":"250","CountryName":"(FR) 法國France"},{"CountryCode":"254","CountryName":"(GF) 法屬圭亞那French Guiana"},{"CountryCode":"258","CountryName":"(PF) 法屬玻里尼西亞French Polynesia"},{"CountryCode":"260","CountryName":"(TF) 法屬南方和南極洲領地French Southern Territories"},{"CountryCode":"266","CountryName":"(GA) 加彭Gabon"},{"CountryCode":"270","CountryName":"(GM) 甘比亞Gambia"},{"CountryCode":"268","CountryName":"(GE) 喬治亞Georgia"},{"CountryCode":"276","CountryName":"(DE) 德國Germany"},{"CountryCode":"288","CountryName":"(GH) 加納Ghana"},{"CountryCode":"292","CountryName":"(GI) 直布羅陀Gibraltar"},{"CountryCode":"300","CountryName":"(GR) 希臘Greece"},{"CountryCode":"304","CountryName":"(GL) 格陵蘭Greenland"},{"CountryCode":"308","CountryName":"(GD) 格瑞那達Grenada"},{"CountryCode":"312","CountryName":"(GP) 瓜德羅普Guadeloupe"},{"CountryCode":"316","CountryName":"(GU) 關島Guam"},{"CountryCode":"320","CountryName":"(GT) 瓜地馬拉Guatemala"},{"CountryCode":"831","CountryName":"(GG) 根西Guernsey"},{"CountryCode":"324","CountryName":"(GN) 幾內亞Guinea"},{"CountryCode":"624","CountryName":"(GW) 幾內亞比索Guinea-Bissau"},{"CountryCode":"328","CountryName":"(GY) 蓋亞那Guyana"},{"CountryCode":"332","CountryName":"(HT) 海地Haiti"},{"CountryCode":"334","CountryName":"(HM) 赫德島和麥克唐納群島Heard Island and McDonald Islands"},{"CountryCode":"336","CountryName":"(VA) 梵蒂岡Holy See"},{"CountryCode":"340","CountryName":"(HN) 宏都拉斯Honduras"},{"CountryCode":"344","CountryName":"(HK) 香港Hong Kong"},{"CountryCode":"348","CountryName":"(HU) 匈牙利Hungary"},{"CountryCode":"352","CountryName":"(IS) 冰島Iceland"},{"CountryCode":"356","CountryName":"(IN) 印度India"},{"CountryCode":"360","CountryName":"(ID) 印尼Indonesia"},{"CountryCode":"364","CountryName":"(IR) 伊朗Iran (Islamic Republic of)"},{"CountryCode":"368","CountryName":"(IQ) 伊拉克Iraq"},{"CountryCode":"372","CountryName":"(IE) 愛爾蘭Ireland"},{"CountryCode":"833","CountryName":"(IM) 曼島Isle of Man"},{"CountryCode":"376","CountryName":"(IL) 以色列Israel"},{"CountryCode":"380","CountryName":"(IT) 義大利Italy"},{"CountryCode":"388","CountryName":"(JM) 牙買加Jamaica"},{"CountryCode":"392","CountryName":"(JP) 日本Japan"},{"CountryCode":"832","CountryName":"(JE) 澤西Jersey"},{"CountryCode":"400","CountryName":"(JO) 約旦Jordan"},{"CountryCode":"398","CountryName":"(KZ) 哈薩克Kazakhstan"},{"CountryCode":"404","CountryName":"(KE) 肯亞Kenya"},{"CountryCode":"296","CountryName":"(KI) 吉里巴斯Kiribati"},{"CountryCode":"408","CountryName":"(KP) 北韓Korea (Democratic People\u0027s Republic of)"},{"CountryCode":"410","CountryName":"(KR) 韓國Korea (Republic of)"},{"CountryCode":"414","CountryName":"(KW) 科威特Kuwait"},{"CountryCode":"417","CountryName":"(KG) 吉爾吉斯Kyrgyzstan"},{"CountryCode":"418","CountryName":"(LA) 寮國Lao People\u0027s Democratic Republic"},{"CountryCode":"428","CountryName":"(LV) 拉脫維亞Latvia"},{"CountryCode":"422","CountryName":"(LB) 黎巴嫩Lebanon"},{"CountryCode":"426","CountryName":"(LS) 賴索托Lesotho"},{"CountryCode":"430","CountryName":"(LR) 賴比瑞亞Liberia"},{"CountryCode":"434","CountryName":"(LY) 利比亞Libya"},{"CountryCode":"438","CountryName":"(LI) 列支敦斯登Liechtenstein"},{"CountryCode":"440","CountryName":"(LT) 立陶宛Lithuania"},{"CountryCode":"442","CountryName":"(LU) 盧森堡Luxembourg"},{"CountryCode":"446","CountryName":"(MO) 澳門Macao"},{"CountryCode":"450","CountryName":"(MG) 馬達加斯加Madagascar"},{"CountryCode":"454","CountryName":"(MW) 馬拉威Malawi"},{"CountryCode":"458","CountryName":"(MY) 馬來西亞Malaysia"},{"CountryCode":"462","CountryName":"(MV) 馬爾地夫Maldives"},{"CountryCode":"466","CountryName":"(ML) 馬利Mali"},{"CountryCode":"470","CountryName":"(MT) 馬爾他Malta"},{"CountryCode":"584","CountryName":"(MH) 馬紹爾群島Marshall Islands"},{"CountryCode":"474","CountryName":"(MQ) 馬提尼克Martinique"},{"CountryCode":"478","CountryName":"(MR) 茅利塔尼亞Mauritania"},{"CountryCode":"480","CountryName":"(MU) 模里西斯Mauritius"},{"CountryCode":"175","CountryName":"(YT) 馬約特Mayotte"},{"CountryCode":"484","CountryName":"(MX) 墨西哥Mexico"},{"CountryCode":"583","CountryName":"(FM) 密克羅尼西亞聯邦Micronesia (Federated States of)"},{"CountryCode":"498","CountryName":"(MD) 摩爾多瓦Moldova (Republic of)"},{"CountryCode":"492","CountryName":"(MC) 摩納哥Monaco"},{"CountryCode":"496","CountryName":"(MN) 蒙古國Mongolia"},{"CountryCode":"499","CountryName":"(ME) 蒙特內哥羅Montenegro"},{"CountryCode":"500","CountryName":"(MS) 蒙特塞拉特Montserrat"},{"CountryCode":"504","CountryName":"(MA) 摩洛哥Morocco"},{"CountryCode":"508","CountryName":"(MZ) 莫三比克Mozambique"},{"CountryCode":"104","CountryName":"(MM) 緬甸Myanmar"},{"CountryCode":"516","CountryName":"(NA) 納米比亞Namibia"},{"CountryCode":"520","CountryName":"(NR) 諾魯Nauru"},{"CountryCode":"524","CountryName":"(NP) 尼泊爾Nepal"},{"CountryCode":"528","CountryName":"(NL) 荷蘭Netherlands"},{"CountryCode":"540","CountryName":"(NC) 新喀里多尼亞New Caledonia"},{"CountryCode":"554","CountryName":"(NZ) 紐西蘭New Zealand"},{"CountryCode":"558","CountryName":"(NI) 尼加拉瓜Nicaragua"},{"CountryCode":"562","CountryName":"(NE) 尼日Niger"},{"CountryCode":"566","CountryName":"(NG) 奈及利亞Nigeria"},{"CountryCode":"570","CountryName":"(NU) 紐埃Niue"},{"CountryCode":"574","CountryName":"(NF) 諾福克島Norfolk Island"},{"CountryCode":"807","CountryName":"(MK) 北馬其頓North Macedonia"},{"CountryCode":"580","CountryName":"(MP) 北馬里亞納群島Northern Mariana Islands"},{"CountryCode":"578","CountryName":"(NO) 挪威Norway"},{"CountryCode":"512","CountryName":"(OM) 阿曼Oman"},{"CountryCode":"586","CountryName":"(PK) 巴基斯坦Pakistan"},{"CountryCode":"585","CountryName":"(PW) 帛琉Palau"},{"CountryCode":"275","CountryName":"(PS) 巴勒斯坦Palestine, State of"},{"CountryCode":"591","CountryName":"(PA) 巴拿馬Panama"},{"CountryCode":"598","CountryName":"(PG) 巴布亞紐幾內亞Papua New Guinea"},{"CountryCode":"600","CountryName":"(PY) 巴拉圭Paraguay"},{"CountryCode":"604","CountryName":"(PE) 秘魯Peru"},{"CountryCode":"608","CountryName":"(PH) 菲律賓Philippines"},{"CountryCode":"612","CountryName":"(PN) 皮特肯群島Pitcairn"},{"CountryCode":"616","CountryName":"(PL) 波蘭Poland"},{"CountryCode":"620","CountryName":"(PT) 葡萄牙Portugal"},{"CountryCode":"630","CountryName":"(PR) 波多黎各Puerto Rico"},{"CountryCode":"634","CountryName":"(QA) 卡達Qatar"},{"CountryCode":"638","CountryName":"(RE) 留尼旺Réunion"},{"CountryCode":"642","CountryName":"(RO) 羅馬尼亞Romania"},{"CountryCode":"643","CountryName":"(RU) 俄羅斯Russian Federation"},{"CountryCode":"646","CountryName":"(RW) 盧安達Rwanda"},{"CountryCode":"652","CountryName":"(BL) 聖巴泰勒米Saint Barthélemy"},{"CountryCode":"654","CountryName":"(SH) 聖赫倫那、阿森松和特里斯坦-達庫尼亞Saint Helena, Ascension and Tristan da Cunha"},{"CountryCode":"659","CountryName":"(KN) 聖克里斯多福及尼維斯Saint Kitts and Nevis"},{"CountryCode":"662","CountryName":"(LC) 聖露西亞Saint Lucia"},{"CountryCode":"663","CountryName":"(MF) 法屬聖馬丁Saint Martin (French part)"},{"CountryCode":"666","CountryName":"(PM) 聖皮埃爾和密克隆Saint Pierre and Miquelon"},{"CountryCode":"670","CountryName":"(VC) 聖文森及格瑞那丁Saint Vincent and the Grenadines"},{"CountryCode":"882","CountryName":"(WS) 薩摩亞Samoa"},{"CountryCode":"674","CountryName":"(SM) 聖馬利諾San Marino"},{"CountryCode":"678","CountryName":"(ST) 聖多美普林西比Sao Tome and Principe"},{"CountryCode":"682","CountryName":"(SA) 沙烏地阿拉伯Saudi Arabia"},{"CountryCode":"686","CountryName":"(SN) 塞內加爾Senegal"},{"CountryCode":"688","CountryName":"(RS) 塞爾維亞Serbia"},{"CountryCode":"690","CountryName":"(SC) 塞席爾Seychelles"},{"CountryCode":"694","CountryName":"(SL) 獅子山Sierra Leone"},{"CountryCode":"702","CountryName":"(SG) 新加坡Singapore"},{"CountryCode":"534","CountryName":"(SX) 荷屬聖馬丁Sint Maarten (Dutch part)"},{"CountryCode":"703","CountryName":"(SK) 斯洛伐克Slovakia"},{"CountryCode":"705","CountryName":"(SI) 斯洛維尼亞Slovenia"},{"CountryCode":"090","CountryName":"(SB) 索羅門群島Solomon Islands"},{"CountryCode":"706","CountryName":"(SO) 索馬利亞Somalia"},{"CountryCode":"710","CountryName":"(ZA) 南非South Africa"},{"CountryCode":"239","CountryName":"(GS) 南喬治亞和南桑威奇群島South Georgia and the South Sandwich Islands"},{"CountryCode":"728","CountryName":"(SS) 南蘇丹South Sudan"},{"CountryCode":"724","CountryName":"(ES) 西班牙Spain"},{"CountryCode":"144","CountryName":"(LK) 斯里蘭卡Sri Lanka"},{"CountryCode":"729","CountryName":"(SD) 蘇丹Sudan"},{"CountryCode":"740","CountryName":"(SR) 蘇利南Suriname"},{"CountryCode":"744","CountryName":"(SJ) 斯瓦爾巴和揚馬延Svalbard and Jan Mayen"},{"CountryCode":"752","CountryName":"(SE) 瑞典Sweden"},{"CountryCode":"756","CountryName":"(CH) 瑞士Switzerland"},{"CountryCode":"760","CountryName":"(SY) 敘利亞Syrian Arab Republic"},{"CountryCode":"762","CountryName":"(TJ) 塔吉克Tajikistan"},{"CountryCode":"834","CountryName":"(TZ) 坦尚尼亞Tanzania, United Republic of"},{"CountryCode":"764","CountryName":"(TH) 泰國Thailand"},{"CountryCode":"626","CountryName":"(TL) 東帝汶Timor-Leste"},{"CountryCode":"768","CountryName":"(TG) 多哥Togo"},{"CountryCode":"772","CountryName":"(TK) 托克勞Tokelau"},{"CountryCode":"776","CountryName":"(TO) 東加Tonga"},{"CountryCode":"780","CountryName":"(TT) 千里達及托巴哥Trinidad and Tobago"},{"CountryCode":"788","CountryName":"(TN) 突尼西亞Tunisia"},{"CountryCode":"792","CountryName":"(TR) 土耳其Turkey"},{"CountryCode":"795","CountryName":"(TM) 土庫曼Turkmenistan"},{"CountryCode":"796","CountryName":"(TC) 特克斯與凱科斯群島Turks and Caicos Islands"},{"CountryCode":"798","CountryName":"(TV) 吐瓦魯Tuvalu"},{"CountryCode":"800","CountryName":"(UG) 烏干達Uganda"},{"CountryCode":"804","CountryName":"(UA) 烏克蘭Ukraine"},{"CountryCode":"784","CountryName":"(AE) 阿聯United Arab Emirates"},{"CountryCode":"826","CountryName":"(GB) 英國United Kingdom"},{"CountryCode":"840","CountryName":"(US) 美國United States"},{"CountryCode":"581","CountryName":"(UM) 美國本土外小島嶼United States Minor Outlying Islands"},{"CountryCode":"858","CountryName":"(UY) 烏拉圭Uruguay"},{"CountryCode":"860","CountryName":"(UZ) 烏茲別克Uzbekistan"},{"CountryCode":"548","CountryName":"(VU) 萬那杜Vanuatu"},{"CountryCode":"862","CountryName":"(VE) 委內瑞拉Venezuela (Bolivarian Republic of)"},{"CountryCode":"704","CountryName":"(VN) 越南Viet Nam"},{"CountryCode":"092","CountryName":"(VG) 英屬維京群島Virgin Islands (British)"},{"CountryCode":"850","CountryName":"(VI) 美屬維京群島Virgin Islands (U.S.)"},{"CountryCode":"876","CountryName":"(WF) 瓦利斯和富圖納Wallis and Futuna"},{"CountryCode":"732","CountryName":"(EH) 撒拉威阿拉伯民主共和國Western Sahara"},{"CountryCode":"887","CountryName":"(YE) 葉門Yemen"},{"CountryCode":"894","CountryName":"(ZM) 尚比亞Zambia"},{"CountryCode":"716","CountryName":"(ZW) 辛巴威Zimbabwe"}],"AreaList":null,"TownList":null,"CountryCode":null,"AreaID":null,"TownID":null,"ZipCode":null,"Address":null,"PreAddress":"","PreEmail":null,"PreStateCode":"","isNotNeedCardHolderAddress":1,"AsymmetryInstallmentsList":null,"CheckAsymmetryInstallmentsURL":null,"DreamInstallmentUrl":null,"BuyerInstallmentsList":[{"InstallmentNo":12,"InstallmentsName":"可分12期銀行(12Installment) Banks that accept payment in 12 installments","InstallmentsShortName":"中國信託,台新,玉山,富邦,遠...","InstallmentsOriName":"可分期銀行 Banks that accept installment payment:中國信託,台新,玉山,富邦,遠東,永豐,國泰世華,華南,日盛,樂天,安泰,聯邦,兆豐,台中商銀,上海銀行,凱基,匯豐,星展,新光,合庫,彰銀,一銀,元大,陽信,台灣企銀,華泰,三信商銀。","BuyerChargeFeeRate":6,"BuyerInstallmentLowerLimit":0}],"IsBuyerCardAvailableInstallmentsURL":"https://payment-stage.ecpay.com.tw/Cashier/CheckIsCardAvailableInstallments"}');
</script>
<div id="Credit" class="pay-tab0"><div class="pay-main-content"><div class="pay-tab-form"><h4 class="scw-focus">※ 信用卡交易資訊 Credit Card Information</h4> <div class="ptf-card-type"><span class="cc-icon cc-visa"></span> <span class="cc-icon cc-mc"></span> <span class="cc-icon cc-jcb"></span> <span class="cc-icon cc-up"></span></div> <dl class="ptf-bs pfb-2" style=""><dt>刷卡方式  <br><span class="item-en">Credit card payment method</span><sup class="inp-required">*</sup></dt> <dd><div class="pay-tab-radio"><span style=""><input type="radio" value="Credit" id="bs_1" name="CreditMethod"> <label for="bs_1" class="radio-1">
							一次付清<span class="content-en">Lump sum payment</span></label></span> <span style="display: none;"><input type="radio" value="CreditInstallments" id="bs_2" name="CreditMethod"> <label for="bs_2" class="radio-1">
							分期 <span class="content-en">Installment</span></label></span> <span style="display: none;"><input type="radio" value="AsymmetryInstallments" id="bs_3" name="CreditMethod"> <label for="bs_3" class="radio-1">
							圓夢彈性分期 Flexible Installment
							<span class="ptr-tip">(僅限永豐卡交易)</span></label></span> <span style=""><input type="radio" value="BuyerInstallments" id="bs_4" name="CreditMethod"> <label for="bs_4" class="radio-1">
							消費自費分期<span class="content-en">Installment With Extra Fee</span></label></span></div></dd></dl> <div><dl class="ptf-bs" style="display: none;"><dt></dt> <dd><div><p class="warning wn-mrb">
							信用卡分期不接受<span style="color: red;">Visa金融卡、萬事達Debit金融卡</span>及<span style="color: red;">JCB Debit卡</span>。
Credit card installment payment does not accept <span style="color: red;">Visa debit card, Master debit card, and JCB Debit card</span>.
						</p></div> <div class="pay-tab-radio"><label class="pay-tab-select"><select id="selectBuyerInstallments"><option value="0" selected="selected">選擇分期期數 Select installments.</option> <option value="12">
									12期 Installments-作業處理費6% Payment Processing Fee
								</option></select></label> <!----> <!----></div> <div class="input-info-txt" style="">
						作業處理費 Payment Processing Fee = 60
					</div> <div class="pay-tip-2 pc-tip"><div><div><ul><li>您將收到兩筆信用卡交易，一筆為消費金額，一筆為作業處理費金額。 Your credit card will be billed for two items: one is the amount of the purchase, and the other is the Payment Processing Fee.</li> <li>
										可分12期銀行(12Installment) Banks that accept payment in 12 installments
										中國信託,台新,玉山,富邦,遠...<a href="javascript:void(0)" class="call-bank-pp">看更多</a> <div class="tip-popup bank-tip-popup">
											可分期銀行 Banks that accept installment payment:中國信託,台新,玉山,富邦,遠東,永豐,國泰世華,華南,日盛,樂天,安泰,聯邦,兆豐,台中商銀,上海銀行,凱基,匯豐,星展,新光,合庫,彰銀,一銀,元大,陽信,台灣企銀,華泰,三信商銀。
										</div></li></ul></div></div></div></dd></dl></div> <dl class="ptf-bs"><dt>信用卡類型 <br><span class="item-en">Credit card type</span><sup class="inp-required">*</sup></dt> <dd><label class="pay-tab-select"><select id="CreditPayType"><option value="Visa/Master/JCB">VISA / MasterCard / JCB</option> <option value="UnionPay">銀聯卡 UnionPay card</option></select></label> <!----></dd></dl> <!----> <dl><dt><label>信用卡卡號 <br> <span class="item-en">Credit card number</span><sup class="inp-required">*</sup></label></dt> <dd><ul class="pay-card-num"><li class="card-num"><input name="CardNo" type="hidden"> <input id="CCpart1" type="tel" maxlength="4" placeholder="" autocomplete="off" pattern="\d*"> -
						<input id="CCpart2" type="tel" maxlength="4" placeholder="" autocomplete="off" pattern="\d*"> -
						<input id="CCpart3" type="tel" maxlength="4" placeholder="" autocomplete="off" pattern="\d*"> -
						<input id="CCpart4" type="tel" maxlength="4" placeholder="" autocomplete="off" pattern="\d*"></li> <li class="card-type" style="display: none;"><span class=""></span> <span class="ptf-txt"><a></a></span></li></ul> <!----> <!----> <!----> <!----> <!----> <!----> <!----> <!----> <!----></dd></dl> <dl class="pay-card-date"><dt>卡片有效期限 <br><span class="item-en">Card valid thru</span><sup class="inp-required">*</sup></dt> <dd><input type="hidden" id="CreditDate"> <div><input type="tel" id="creditMM" placeholder="MM" maxlength="2" pattern="\d*"> <input type="tel" id="creditYY" placeholder="YY" maxlength="2" pattern="\d*"></div> <!----></dd> <dd class="pay-card-ccvb"><dl><dt>信用卡安全碼<br><span class="item-en">CVV Code</span><sup class="inp-required">*</sup></dt> <dd><input id="CreditBackThree" type="tel" maxlength="3" placeholder="" pattern="\d*"> <img src="./選擇支付方式_綠界科技_files/ccvb.png" class="p-ccvb-img"> <!----> <p class="pay-tip-2">此欄位為驗證之需，綠界科技不予以記錄 (This column is for verification use. ECPay does not record this column.)</p></dd></dl></dd></dl> <div class="pay-tab-check"><h4 class="scw-focus">※ 持卡人資料 Cardholder Information</h4> <input type="checkbox" id="card_rem" checked="checked"> <label for="card_rem" class="checkbox">
						記住本次付款人資訊 Remember Cardholder information
					</label></div> <dl><dt><label for="p_id">
					持卡人姓名 <br><span class="item-en">Cardholder name</span> <!----></label></dt> <dd><input id="CCHolderTemp" v="$v" placeholder="選填"> <!----> <!----> <div class="input-info-txt">請輸入卡片上的姓名 Please enter your name of credit card.</div></dd> <!----></dl> <dl class="ptf-dfe-phone"><dt><label for="p_mobile_num_4">
					手機號碼<br><span class="item-en">Mobile Number</span> <sup class="inp-required">*</sup> <a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" class="pay-note-link"></a></label></dt> <!----> <dd><input id="CellPhoneCheck" type="tel" v="[object Object]"> <!----> <!----></dd> <!----></dl> <dl><dt><label for="p_email">
					電子信箱   <br><span class="item-en">Email address</span> <!----> <a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" class="pay-note-link"></a></label></dt> <dd><input type="text" id="EmailTemp" v="$v" placeholder="選填"> <!----> <!----></dd> <!----></dl> <dl class="send-location"><dt><label for="p_mobile_num_4">
					帳單地址 <br><span class="item-en">Billing address</span> <!----> <a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" class="pay-note-link"></a></label></dt> <dd><div class="select-box"><div class="country-select"><label class="pay-tab-select"><select id="selectCountry"><option value="158">
									(TW)&nbsp;台灣Taiwan
								</option><option value="004">
									(AF)&nbsp;阿富汗Afghanistan
								</option><option value="248">
									(AX)&nbsp;奧蘭Åland Islands
								</option><option value="008">
									(AL)&nbsp;阿爾巴尼亞Albania
								</option><option value="012">
									(DZ)&nbsp;阿爾及利亞Algeria
								</option><option value="016">
									(AS)&nbsp;美屬薩摩亞American Samoa
								</option><option value="020">
									(AD)&nbsp;安道爾Andorra
								</option><option value="024">
									(AO)&nbsp;安哥拉Angola
								</option><option value="660">
									(AI)&nbsp;安圭拉Anguilla
								</option><option value="010">
									(AQ)&nbsp;南極洲Antarctica
								</option><option value="028">
									(AG)&nbsp;安地卡及巴布達Antigua and Barbuda
								</option><option value="032">
									(AR)&nbsp;阿根廷Argentina
								</option><option value="051">
									(AM)&nbsp;亞美尼亞Armenia
								</option><option value="533">
									(AW)&nbsp;阿魯巴Aruba
								</option><option value="036">
									(AU)&nbsp;澳大利亞Australia
								</option><option value="040">
									(AT)&nbsp;奧地利Austria
								</option><option value="031">
									(AZ)&nbsp;亞塞拜然Azerbaijan
								</option><option value="044">
									(BS)&nbsp;巴哈馬Bahamas
								</option><option value="048">
									(BH)&nbsp;巴林Bahrain
								</option><option value="050">
									(BD)&nbsp;孟加拉國Bangladesh
								</option><option value="052">
									(BB)&nbsp;巴貝多Barbados
								</option><option value="112">
									(BY)&nbsp;白俄羅斯Belarus
								</option><option value="056">
									(BE)&nbsp;比利時Belgium
								</option><option value="084">
									(BZ)&nbsp;貝里斯Belize
								</option><option value="204">
									(BJ)&nbsp;貝南Benin
								</option><option value="060">
									(BM)&nbsp;百慕達Bermuda
								</option><option value="064">
									(BT)&nbsp;不丹Bhutan
								</option><option value="068">
									(BO)&nbsp;玻利維亞Bolivia
								</option><option value="535">
									(BQ)&nbsp;荷蘭加勒比區Bonaire, Sint Eustatius and Saba
								</option><option value="070">
									(BA)&nbsp;波赫Bosnia and Herzegovina
								</option><option value="072">
									(BW)&nbsp;波札那Botswana
								</option><option value="074">
									(BV)&nbsp;布韋島Bouvet Island
								</option><option value="076">
									(BR)&nbsp;巴西Brazil
								</option><option value="086">
									(IO)&nbsp;英屬印度洋領地British Indian Ocean Territory
								</option><option value="096">
									(BN)&nbsp;汶萊Brunei Darussalam
								</option><option value="100">
									(BG)&nbsp;保加利亞Bulgaria
								</option><option value="854">
									(BF)&nbsp;布吉納法索Burkina Faso
								</option><option value="108">
									(BI)&nbsp;蒲隆地Burundi
								</option><option value="132">
									(CV)&nbsp;維德角Cabo Verde
								</option><option value="116">
									(KH)&nbsp;柬埔寨Cambodia
								</option><option value="120">
									(CM)&nbsp;喀麥隆Cameroon
								</option><option value="124">
									(CA)&nbsp;加拿大Canada
								</option><option value="136">
									(KY)&nbsp;開曼群島Cayman Islands
								</option><option value="140">
									(CF)&nbsp;中非Central African Republic
								</option><option value="148">
									(TD)&nbsp;查德Chad
								</option><option value="152">
									(CL)&nbsp;智利Chile
								</option><option value="156">
									(CN)&nbsp;中國China
								</option><option value="162">
									(CX)&nbsp;聖誕島Christmas Island
								</option><option value="166">
									(CC)&nbsp;科科斯（基林）群島Cocos (Keeling) Islands
								</option><option value="170">
									(CO)&nbsp;哥倫比亞Colombia
								</option><option value="174">
									(KM)&nbsp;葛摩Comoros
								</option><option value="178">
									(CG)&nbsp;剛果Congo
								</option><option value="180">
									(CD)&nbsp;民主剛果Congo (Democratic Republic of the)
								</option><option value="184">
									(CK)&nbsp;庫克群島Cook Islands
								</option><option value="188">
									(CR)&nbsp;哥斯大黎加Costa Rica
								</option><option value="384">
									(CI)&nbsp;象牙海岸Côte d'Ivoire
								</option><option value="191">
									(HR)&nbsp;克羅埃西亞Croatia
								</option><option value="192">
									(CU)&nbsp;古巴Cuba
								</option><option value="531">
									(CW)&nbsp;庫拉索Curaçao
								</option><option value="196">
									(CY)&nbsp;賽普勒斯Cyprus
								</option><option value="203">
									(CZ)&nbsp;捷克Czechia
								</option><option value="208">
									(DK)&nbsp;丹麥Denmark
								</option><option value="262">
									(DJ)&nbsp;吉布地Djibouti
								</option><option value="212">
									(DM)&nbsp;多米尼克Dominica
								</option><option value="214">
									(DO)&nbsp;多明尼加Dominican Republic
								</option><option value="218">
									(EC)&nbsp;厄瓜多Ecuador
								</option><option value="818">
									(EG)&nbsp;埃及Egypt
								</option><option value="222">
									(SV)&nbsp;薩爾瓦多El Salvador
								</option><option value="226">
									(GQ)&nbsp;赤道幾內亞Equatorial Guinea
								</option><option value="232">
									(ER)&nbsp;厄利垂亞Eritrea
								</option><option value="233">
									(EE)&nbsp;愛沙尼亞Estonia
								</option><option value="748">
									(SZ)&nbsp;史瓦帝尼Eswatini
								</option><option value="231">
									(ET)&nbsp;衣索比亞Ethiopia
								</option><option value="238">
									(FK)&nbsp;福克蘭群島Falkland Islands (Malvinas)
								</option><option value="234">
									(FO)&nbsp;法羅群島Faroe Islands
								</option><option value="242">
									(FJ)&nbsp;斐濟Fiji
								</option><option value="246">
									(FI)&nbsp;芬蘭Finland
								</option><option value="250">
									(FR)&nbsp;法國France
								</option><option value="254">
									(GF)&nbsp;法屬圭亞那French Guiana
								</option><option value="258">
									(PF)&nbsp;法屬玻里尼西亞French Polynesia
								</option><option value="260">
									(TF)&nbsp;法屬南方和南極洲領地French Southern Territories
								</option><option value="266">
									(GA)&nbsp;加彭Gabon
								</option><option value="270">
									(GM)&nbsp;甘比亞Gambia
								</option><option value="268">
									(GE)&nbsp;喬治亞Georgia
								</option><option value="276">
									(DE)&nbsp;德國Germany
								</option><option value="288">
									(GH)&nbsp;加納Ghana
								</option><option value="292">
									(GI)&nbsp;直布羅陀Gibraltar
								</option><option value="300">
									(GR)&nbsp;希臘Greece
								</option><option value="304">
									(GL)&nbsp;格陵蘭Greenland
								</option><option value="308">
									(GD)&nbsp;格瑞那達Grenada
								</option><option value="312">
									(GP)&nbsp;瓜德羅普Guadeloupe
								</option><option value="316">
									(GU)&nbsp;關島Guam
								</option><option value="320">
									(GT)&nbsp;瓜地馬拉Guatemala
								</option><option value="831">
									(GG)&nbsp;根西Guernsey
								</option><option value="324">
									(GN)&nbsp;幾內亞Guinea
								</option><option value="624">
									(GW)&nbsp;幾內亞比索Guinea-Bissau
								</option><option value="328">
									(GY)&nbsp;蓋亞那Guyana
								</option><option value="332">
									(HT)&nbsp;海地Haiti
								</option><option value="334">
									(HM)&nbsp;赫德島和麥克唐納群島Heard Island and McDonald Islands
								</option><option value="336">
									(VA)&nbsp;梵蒂岡Holy See
								</option><option value="340">
									(HN)&nbsp;宏都拉斯Honduras
								</option><option value="344">
									(HK)&nbsp;香港Hong Kong
								</option><option value="348">
									(HU)&nbsp;匈牙利Hungary
								</option><option value="352">
									(IS)&nbsp;冰島Iceland
								</option><option value="356">
									(IN)&nbsp;印度India
								</option><option value="360">
									(ID)&nbsp;印尼Indonesia
								</option><option value="364">
									(IR)&nbsp;伊朗Iran (Islamic Republic of)
								</option><option value="368">
									(IQ)&nbsp;伊拉克Iraq
								</option><option value="372">
									(IE)&nbsp;愛爾蘭Ireland
								</option><option value="833">
									(IM)&nbsp;曼島Isle of Man
								</option><option value="376">
									(IL)&nbsp;以色列Israel
								</option><option value="380">
									(IT)&nbsp;義大利Italy
								</option><option value="388">
									(JM)&nbsp;牙買加Jamaica
								</option><option value="392">
									(JP)&nbsp;日本Japan
								</option><option value="832">
									(JE)&nbsp;澤西Jersey
								</option><option value="400">
									(JO)&nbsp;約旦Jordan
								</option><option value="398">
									(KZ)&nbsp;哈薩克Kazakhstan
								</option><option value="404">
									(KE)&nbsp;肯亞Kenya
								</option><option value="296">
									(KI)&nbsp;吉里巴斯Kiribati
								</option><option value="408">
									(KP)&nbsp;北韓Korea (Democratic People's Republic of)
								</option><option value="410">
									(KR)&nbsp;韓國Korea (Republic of)
								</option><option value="414">
									(KW)&nbsp;科威特Kuwait
								</option><option value="417">
									(KG)&nbsp;吉爾吉斯Kyrgyzstan
								</option><option value="418">
									(LA)&nbsp;寮國Lao People's Democratic Republic
								</option><option value="428">
									(LV)&nbsp;拉脫維亞Latvia
								</option><option value="422">
									(LB)&nbsp;黎巴嫩Lebanon
								</option><option value="426">
									(LS)&nbsp;賴索托Lesotho
								</option><option value="430">
									(LR)&nbsp;賴比瑞亞Liberia
								</option><option value="434">
									(LY)&nbsp;利比亞Libya
								</option><option value="438">
									(LI)&nbsp;列支敦斯登Liechtenstein
								</option><option value="440">
									(LT)&nbsp;立陶宛Lithuania
								</option><option value="442">
									(LU)&nbsp;盧森堡Luxembourg
								</option><option value="446">
									(MO)&nbsp;澳門Macao
								</option><option value="450">
									(MG)&nbsp;馬達加斯加Madagascar
								</option><option value="454">
									(MW)&nbsp;馬拉威Malawi
								</option><option value="458">
									(MY)&nbsp;馬來西亞Malaysia
								</option><option value="462">
									(MV)&nbsp;馬爾地夫Maldives
								</option><option value="466">
									(ML)&nbsp;馬利Mali
								</option><option value="470">
									(MT)&nbsp;馬爾他Malta
								</option><option value="584">
									(MH)&nbsp;馬紹爾群島Marshall Islands
								</option><option value="474">
									(MQ)&nbsp;馬提尼克Martinique
								</option><option value="478">
									(MR)&nbsp;茅利塔尼亞Mauritania
								</option><option value="480">
									(MU)&nbsp;模里西斯Mauritius
								</option><option value="175">
									(YT)&nbsp;馬約特Mayotte
								</option><option value="484">
									(MX)&nbsp;墨西哥Mexico
								</option><option value="583">
									(FM)&nbsp;密克羅尼西亞聯邦Micronesia (Federated States of)
								</option><option value="498">
									(MD)&nbsp;摩爾多瓦Moldova (Republic of)
								</option><option value="492">
									(MC)&nbsp;摩納哥Monaco
								</option><option value="496">
									(MN)&nbsp;蒙古國Mongolia
								</option><option value="499">
									(ME)&nbsp;蒙特內哥羅Montenegro
								</option><option value="500">
									(MS)&nbsp;蒙特塞拉特Montserrat
								</option><option value="504">
									(MA)&nbsp;摩洛哥Morocco
								</option><option value="508">
									(MZ)&nbsp;莫三比克Mozambique
								</option><option value="104">
									(MM)&nbsp;緬甸Myanmar
								</option><option value="516">
									(NA)&nbsp;納米比亞Namibia
								</option><option value="520">
									(NR)&nbsp;諾魯Nauru
								</option><option value="524">
									(NP)&nbsp;尼泊爾Nepal
								</option><option value="528">
									(NL)&nbsp;荷蘭Netherlands
								</option><option value="540">
									(NC)&nbsp;新喀里多尼亞New Caledonia
								</option><option value="554">
									(NZ)&nbsp;紐西蘭New Zealand
								</option><option value="558">
									(NI)&nbsp;尼加拉瓜Nicaragua
								</option><option value="562">
									(NE)&nbsp;尼日Niger
								</option><option value="566">
									(NG)&nbsp;奈及利亞Nigeria
								</option><option value="570">
									(NU)&nbsp;紐埃Niue
								</option><option value="574">
									(NF)&nbsp;諾福克島Norfolk Island
								</option><option value="807">
									(MK)&nbsp;北馬其頓North Macedonia
								</option><option value="580">
									(MP)&nbsp;北馬里亞納群島Northern Mariana Islands
								</option><option value="578">
									(NO)&nbsp;挪威Norway
								</option><option value="512">
									(OM)&nbsp;阿曼Oman
								</option><option value="586">
									(PK)&nbsp;巴基斯坦Pakistan
								</option><option value="585">
									(PW)&nbsp;帛琉Palau
								</option><option value="275">
									(PS)&nbsp;巴勒斯坦Palestine, State of
								</option><option value="591">
									(PA)&nbsp;巴拿馬Panama
								</option><option value="598">
									(PG)&nbsp;巴布亞紐幾內亞Papua New Guinea
								</option><option value="600">
									(PY)&nbsp;巴拉圭Paraguay
								</option><option value="604">
									(PE)&nbsp;秘魯Peru
								</option><option value="608">
									(PH)&nbsp;菲律賓Philippines
								</option><option value="612">
									(PN)&nbsp;皮特肯群島Pitcairn
								</option><option value="616">
									(PL)&nbsp;波蘭Poland
								</option><option value="620">
									(PT)&nbsp;葡萄牙Portugal
								</option><option value="630">
									(PR)&nbsp;波多黎各Puerto Rico
								</option><option value="634">
									(QA)&nbsp;卡達Qatar
								</option><option value="638">
									(RE)&nbsp;留尼旺Réunion
								</option><option value="642">
									(RO)&nbsp;羅馬尼亞Romania
								</option><option value="643">
									(RU)&nbsp;俄羅斯Russian Federation
								</option><option value="646">
									(RW)&nbsp;盧安達Rwanda
								</option><option value="652">
									(BL)&nbsp;聖巴泰勒米Saint Barthélemy
								</option><option value="654">
									(SH)&nbsp;聖赫倫那、阿森松和特里斯坦-達庫尼亞Saint Helena, Ascension and Tristan da Cunha
								</option><option value="659">
									(KN)&nbsp;聖克里斯多福及尼維斯Saint Kitts and Nevis
								</option><option value="662">
									(LC)&nbsp;聖露西亞Saint Lucia
								</option><option value="663">
									(MF)&nbsp;法屬聖馬丁Saint Martin (French part)
								</option><option value="666">
									(PM)&nbsp;聖皮埃爾和密克隆Saint Pierre and Miquelon
								</option><option value="670">
									(VC)&nbsp;聖文森及格瑞那丁Saint Vincent and the Grenadines
								</option><option value="882">
									(WS)&nbsp;薩摩亞Samoa
								</option><option value="674">
									(SM)&nbsp;聖馬利諾San Marino
								</option><option value="678">
									(ST)&nbsp;聖多美普林西比Sao Tome and Principe
								</option><option value="682">
									(SA)&nbsp;沙烏地阿拉伯Saudi Arabia
								</option><option value="686">
									(SN)&nbsp;塞內加爾Senegal
								</option><option value="688">
									(RS)&nbsp;塞爾維亞Serbia
								</option><option value="690">
									(SC)&nbsp;塞席爾Seychelles
								</option><option value="694">
									(SL)&nbsp;獅子山Sierra Leone
								</option><option value="702">
									(SG)&nbsp;新加坡Singapore
								</option><option value="534">
									(SX)&nbsp;荷屬聖馬丁Sint Maarten (Dutch part)
								</option><option value="703">
									(SK)&nbsp;斯洛伐克Slovakia
								</option><option value="705">
									(SI)&nbsp;斯洛維尼亞Slovenia
								</option><option value="090">
									(SB)&nbsp;索羅門群島Solomon Islands
								</option><option value="706">
									(SO)&nbsp;索馬利亞Somalia
								</option><option value="710">
									(ZA)&nbsp;南非South Africa
								</option><option value="239">
									(GS)&nbsp;南喬治亞和南桑威奇群島South Georgia and the South Sandwich Islands
								</option><option value="728">
									(SS)&nbsp;南蘇丹South Sudan
								</option><option value="724">
									(ES)&nbsp;西班牙Spain
								</option><option value="144">
									(LK)&nbsp;斯里蘭卡Sri Lanka
								</option><option value="729">
									(SD)&nbsp;蘇丹Sudan
								</option><option value="740">
									(SR)&nbsp;蘇利南Suriname
								</option><option value="744">
									(SJ)&nbsp;斯瓦爾巴和揚馬延Svalbard and Jan Mayen
								</option><option value="752">
									(SE)&nbsp;瑞典Sweden
								</option><option value="756">
									(CH)&nbsp;瑞士Switzerland
								</option><option value="760">
									(SY)&nbsp;敘利亞Syrian Arab Republic
								</option><option value="762">
									(TJ)&nbsp;塔吉克Tajikistan
								</option><option value="834">
									(TZ)&nbsp;坦尚尼亞Tanzania, United Republic of
								</option><option value="764">
									(TH)&nbsp;泰國Thailand
								</option><option value="626">
									(TL)&nbsp;東帝汶Timor-Leste
								</option><option value="768">
									(TG)&nbsp;多哥Togo
								</option><option value="772">
									(TK)&nbsp;托克勞Tokelau
								</option><option value="776">
									(TO)&nbsp;東加Tonga
								</option><option value="780">
									(TT)&nbsp;千里達及托巴哥Trinidad and Tobago
								</option><option value="788">
									(TN)&nbsp;突尼西亞Tunisia
								</option><option value="792">
									(TR)&nbsp;土耳其Turkey
								</option><option value="795">
									(TM)&nbsp;土庫曼Turkmenistan
								</option><option value="796">
									(TC)&nbsp;特克斯與凱科斯群島Turks and Caicos Islands
								</option><option value="798">
									(TV)&nbsp;吐瓦魯Tuvalu
								</option><option value="800">
									(UG)&nbsp;烏干達Uganda
								</option><option value="804">
									(UA)&nbsp;烏克蘭Ukraine
								</option><option value="784">
									(AE)&nbsp;阿聯United Arab Emirates
								</option><option value="826">
									(GB)&nbsp;英國United Kingdom
								</option><option value="840">
									(US)&nbsp;美國United States
								</option><option value="581">
									(UM)&nbsp;美國本土外小島嶼United States Minor Outlying Islands
								</option><option value="858">
									(UY)&nbsp;烏拉圭Uruguay
								</option><option value="860">
									(UZ)&nbsp;烏茲別克Uzbekistan
								</option><option value="548">
									(VU)&nbsp;萬那杜Vanuatu
								</option><option value="862">
									(VE)&nbsp;委內瑞拉Venezuela (Bolivarian Republic of)
								</option><option value="704">
									(VN)&nbsp;越南Viet Nam
								</option><option value="092">
									(VG)&nbsp;英屬維京群島Virgin Islands (British)
								</option><option value="850">
									(VI)&nbsp;美屬維京群島Virgin Islands (U.S.)
								</option><option value="876">
									(WF)&nbsp;瓦利斯和富圖納Wallis and Futuna
								</option><option value="732">
									(EH)&nbsp;撒拉威阿拉伯民主共和國Western Sahara
								</option><option value="887">
									(YE)&nbsp;葉門Yemen
								</option><option value="894">
									(ZM)&nbsp;尚比亞Zambia
								</option><option value="716">
									(ZW)&nbsp;辛巴威Zimbabwe
								</option></select></label></div></div> <input type="text" id="Address" v="[object Object]" placeholder="選填" class="ifo-input ifi-addr"> <!----> <!----></dd> <!----></dl> <div style="display: none;"><div class="pay-tab-check"><h4 class="scw-focus">※ 作業處理費發票 Invoice for Payment Processing Fee</h4> <div class="input-info-txt">
					請務必確認資料正確性，發票一經開立不得要求更改 Please make sure the information is correct. Once the invoice is issued, it cannot be altered.
				</div></div> <dl><dt>開立類型<br class="clear"><span class="item-en">Invoice Recipient</span><sup class="inp-required">*</sup></dt> <dd><div class="pay-tab-radio"><input type="radio" value="1" id="ct_1" name="create_type"> <label for="ct_1" class="radio-1">
							個人<span class="content-en">Natural person</span></label> <input type="radio" value="2" id="ct_2" name="create_type"> <label for="ct_2" class="radio-1">
							公司行號<span class="content-en">Business entity</span></label> <input type="radio" value="3" id="ct_3" name="create_type"> <label for="ct_3" class="radio-1">
							捐贈<span class="content-en">Donate the invoice</span></label></div></dd></dl> <dl><dt><label for="p_id">選擇載具<br class="clear"><span class="item-en">Select carrier</span><sup class="inp-required">*</sup></label></dt> <dd><label class="pay-tab-select"><select id="InvoiceCarriersType"><option value="1" selected="selected">綠界會員載具 ECpay member carrier</option> <option value="3">手機條碼載具 Mobile barcode carrier</option> <option value="2">自然人憑證載具 Citizen Digital Certificate carrier</option> <option value="">不使用載具 Without carrier</option></select></label> <div class="pay-tab-check ptc-mg" style="display: none;"><input type="checkbox" id="InvoicePrint" name="InvoicePrint"> <label for="InvoicePrint" class="checkbox">
							索取紙本<span class="item-en">Request paper invoice</span></label></div></dd></dl> <dl style="display: none;"><dt><label for="p_mobile_num_4">
						載具編號 <br class="clear"><span class="item-en">Carrier number</span> <sup class="inp-required">*</sup></label></dt> <dd><input type="text" id="InvoiceCarriersNum" v="$v"> <!----> <!----></dd></dl> <dl style="display: none;"><dt><label for="p_mobile_num_4">
						捐贈碼 <br class="clear"><span class="item-en">Donation code</span><sup class="inp-required">*</sup></label></dt> <dd><div class="pay-tab-check ptc-mg"><input type="checkbox" name="defDonate" id="defDonate"> <label for="defDonate" class="checkbox">
							預設-OMG關懷社會愛心基金會 Default - OMG Love Foundation
						</label></div> <input type="text" inputmode="numeric" id="DonateCode" v="$v" placeholder="請輸入捐贈碼3-7位數 Please enter a donation code in 3-7 digits."> <div class="ptf-txt pft-inb"><a href="https://www.einvoice.nat.gov.tw/APCONSUMER/BTC603W/" target="_blank">捐贈碼查詢 Donation code inquiry</a></div> <!----> <!----></dd></dl> <dl style="display: none;"><dt><label for="p_id">發票抬頭<br class="clear"><span class="item-en">Company Name</span><sup class="inp-required">*</sup></label></dt> <dd><div class="pay-tab-check ptc-mg"><input type="checkbox" name="sInvtitle" id="sInvtitle"> <label for="sInvtitle" class="checkbox">
							同持卡人 <span class="item-en">Same as card holder's</span></label></div> <input type="text" id="InvoiceName" maxlength="20" v="$v"> <!----> <!----></dd></dl> <dl style="display: none;"><dt><label for="p_id">統一編號 <br class="clear"><span class="item-en">GUI number.</span><sup class="inp-required">*</sup></label></dt> <dd><input type="text" inputmode="numeric" id="InvoiceUnifiedBusinessNo" maxlength="8" v="$v"> <!----> <!----></dd></dl> <dl><dt><label for="p_id">發票手機號碼 <br class="clear"><span class="item-en">Mobile phone number for the invoice</span><sup class="inp-required">*</sup></label></dt> <dd><div class="pay-tab-check ptc-mg"><input type="checkbox" name="sphone" id="sphone" disabled="disabled"> <label for="sphone" class="checkbox">
							同持卡人手機 <span class="item-en">Same as card holder's mobile phone number</span></label></div> <input type="tel" id="InvoicePhone" v="$v"> <div class="input-info-txt">綠界科技將使用持卡人手機號碼為載具，為您自動對獎並發送中獎通知。 ECpay will use card holder's mobile phone number as a carrier and automatically send out the winning notice if the invoice number is a winning number.</div> <!----> <!----></dd></dl> <dl><dt><label for="p_id">發票電子信箱 <br class="clear"><span class="item-en">E-mail address for the invoice</span></label></dt> <dd><div class="pay-tab-check ptc-mg"><input type="checkbox" name="smail" id="smail" disabled="disabled"> <label for="smail" class="checkbox">
							同持卡人信箱 <span class="item-en">Same as card holder's E-mail address</span></label></div> <input type="email" id="InvoiceEmail" v="$v"> <!----></dd></dl> <dl class="send-location" style="display: none;"><dt><label for="p_id">寄送地址 <br class="clear"><span class="item-en">Delivery Address</span><sup class="inp-required">*</sup></label></dt> <dd><div class="pay-tab-check ptc-mg"><input type="checkbox" name="sBillAddr" id="sBillAddr" disabled="disabled"> <label for="sBillAddr" class="checkbox">
							同帳單地址 <span class="item-en">Same as billing address</span></label></div> <div class="select-box"><div class="country-select cts-mrg"><label class="pay-tab-select"><select id="selectInvCountry"><option value="158">
										(TW)&nbsp;台灣Taiwan
									</option><option value="004">
										(AF)&nbsp;阿富汗Afghanistan
									</option><option value="248">
										(AX)&nbsp;奧蘭Åland Islands
									</option><option value="008">
										(AL)&nbsp;阿爾巴尼亞Albania
									</option><option value="012">
										(DZ)&nbsp;阿爾及利亞Algeria
									</option><option value="016">
										(AS)&nbsp;美屬薩摩亞American Samoa
									</option><option value="020">
										(AD)&nbsp;安道爾Andorra
									</option><option value="024">
										(AO)&nbsp;安哥拉Angola
									</option><option value="660">
										(AI)&nbsp;安圭拉Anguilla
									</option><option value="010">
										(AQ)&nbsp;南極洲Antarctica
									</option><option value="028">
										(AG)&nbsp;安地卡及巴布達Antigua and Barbuda
									</option><option value="032">
										(AR)&nbsp;阿根廷Argentina
									</option><option value="051">
										(AM)&nbsp;亞美尼亞Armenia
									</option><option value="533">
										(AW)&nbsp;阿魯巴Aruba
									</option><option value="036">
										(AU)&nbsp;澳大利亞Australia
									</option><option value="040">
										(AT)&nbsp;奧地利Austria
									</option><option value="031">
										(AZ)&nbsp;亞塞拜然Azerbaijan
									</option><option value="044">
										(BS)&nbsp;巴哈馬Bahamas
									</option><option value="048">
										(BH)&nbsp;巴林Bahrain
									</option><option value="050">
										(BD)&nbsp;孟加拉國Bangladesh
									</option><option value="052">
										(BB)&nbsp;巴貝多Barbados
									</option><option value="112">
										(BY)&nbsp;白俄羅斯Belarus
									</option><option value="056">
										(BE)&nbsp;比利時Belgium
									</option><option value="084">
										(BZ)&nbsp;貝里斯Belize
									</option><option value="204">
										(BJ)&nbsp;貝南Benin
									</option><option value="060">
										(BM)&nbsp;百慕達Bermuda
									</option><option value="064">
										(BT)&nbsp;不丹Bhutan
									</option><option value="068">
										(BO)&nbsp;玻利維亞Bolivia
									</option><option value="535">
										(BQ)&nbsp;荷蘭加勒比區Bonaire, Sint Eustatius and Saba
									</option><option value="070">
										(BA)&nbsp;波赫Bosnia and Herzegovina
									</option><option value="072">
										(BW)&nbsp;波札那Botswana
									</option><option value="074">
										(BV)&nbsp;布韋島Bouvet Island
									</option><option value="076">
										(BR)&nbsp;巴西Brazil
									</option><option value="086">
										(IO)&nbsp;英屬印度洋領地British Indian Ocean Territory
									</option><option value="096">
										(BN)&nbsp;汶萊Brunei Darussalam
									</option><option value="100">
										(BG)&nbsp;保加利亞Bulgaria
									</option><option value="854">
										(BF)&nbsp;布吉納法索Burkina Faso
									</option><option value="108">
										(BI)&nbsp;蒲隆地Burundi
									</option><option value="132">
										(CV)&nbsp;維德角Cabo Verde
									</option><option value="116">
										(KH)&nbsp;柬埔寨Cambodia
									</option><option value="120">
										(CM)&nbsp;喀麥隆Cameroon
									</option><option value="124">
										(CA)&nbsp;加拿大Canada
									</option><option value="136">
										(KY)&nbsp;開曼群島Cayman Islands
									</option><option value="140">
										(CF)&nbsp;中非Central African Republic
									</option><option value="148">
										(TD)&nbsp;查德Chad
									</option><option value="152">
										(CL)&nbsp;智利Chile
									</option><option value="156">
										(CN)&nbsp;中國China
									</option><option value="162">
										(CX)&nbsp;聖誕島Christmas Island
									</option><option value="166">
										(CC)&nbsp;科科斯（基林）群島Cocos (Keeling) Islands
									</option><option value="170">
										(CO)&nbsp;哥倫比亞Colombia
									</option><option value="174">
										(KM)&nbsp;葛摩Comoros
									</option><option value="178">
										(CG)&nbsp;剛果Congo
									</option><option value="180">
										(CD)&nbsp;民主剛果Congo (Democratic Republic of the)
									</option><option value="184">
										(CK)&nbsp;庫克群島Cook Islands
									</option><option value="188">
										(CR)&nbsp;哥斯大黎加Costa Rica
									</option><option value="384">
										(CI)&nbsp;象牙海岸Côte d'Ivoire
									</option><option value="191">
										(HR)&nbsp;克羅埃西亞Croatia
									</option><option value="192">
										(CU)&nbsp;古巴Cuba
									</option><option value="531">
										(CW)&nbsp;庫拉索Curaçao
									</option><option value="196">
										(CY)&nbsp;賽普勒斯Cyprus
									</option><option value="203">
										(CZ)&nbsp;捷克Czechia
									</option><option value="208">
										(DK)&nbsp;丹麥Denmark
									</option><option value="262">
										(DJ)&nbsp;吉布地Djibouti
									</option><option value="212">
										(DM)&nbsp;多米尼克Dominica
									</option><option value="214">
										(DO)&nbsp;多明尼加Dominican Republic
									</option><option value="218">
										(EC)&nbsp;厄瓜多Ecuador
									</option><option value="818">
										(EG)&nbsp;埃及Egypt
									</option><option value="222">
										(SV)&nbsp;薩爾瓦多El Salvador
									</option><option value="226">
										(GQ)&nbsp;赤道幾內亞Equatorial Guinea
									</option><option value="232">
										(ER)&nbsp;厄利垂亞Eritrea
									</option><option value="233">
										(EE)&nbsp;愛沙尼亞Estonia
									</option><option value="748">
										(SZ)&nbsp;史瓦帝尼Eswatini
									</option><option value="231">
										(ET)&nbsp;衣索比亞Ethiopia
									</option><option value="238">
										(FK)&nbsp;福克蘭群島Falkland Islands (Malvinas)
									</option><option value="234">
										(FO)&nbsp;法羅群島Faroe Islands
									</option><option value="242">
										(FJ)&nbsp;斐濟Fiji
									</option><option value="246">
										(FI)&nbsp;芬蘭Finland
									</option><option value="250">
										(FR)&nbsp;法國France
									</option><option value="254">
										(GF)&nbsp;法屬圭亞那French Guiana
									</option><option value="258">
										(PF)&nbsp;法屬玻里尼西亞French Polynesia
									</option><option value="260">
										(TF)&nbsp;法屬南方和南極洲領地French Southern Territories
									</option><option value="266">
										(GA)&nbsp;加彭Gabon
									</option><option value="270">
										(GM)&nbsp;甘比亞Gambia
									</option><option value="268">
										(GE)&nbsp;喬治亞Georgia
									</option><option value="276">
										(DE)&nbsp;德國Germany
									</option><option value="288">
										(GH)&nbsp;加納Ghana
									</option><option value="292">
										(GI)&nbsp;直布羅陀Gibraltar
									</option><option value="300">
										(GR)&nbsp;希臘Greece
									</option><option value="304">
										(GL)&nbsp;格陵蘭Greenland
									</option><option value="308">
										(GD)&nbsp;格瑞那達Grenada
									</option><option value="312">
										(GP)&nbsp;瓜德羅普Guadeloupe
									</option><option value="316">
										(GU)&nbsp;關島Guam
									</option><option value="320">
										(GT)&nbsp;瓜地馬拉Guatemala
									</option><option value="831">
										(GG)&nbsp;根西Guernsey
									</option><option value="324">
										(GN)&nbsp;幾內亞Guinea
									</option><option value="624">
										(GW)&nbsp;幾內亞比索Guinea-Bissau
									</option><option value="328">
										(GY)&nbsp;蓋亞那Guyana
									</option><option value="332">
										(HT)&nbsp;海地Haiti
									</option><option value="334">
										(HM)&nbsp;赫德島和麥克唐納群島Heard Island and McDonald Islands
									</option><option value="336">
										(VA)&nbsp;梵蒂岡Holy See
									</option><option value="340">
										(HN)&nbsp;宏都拉斯Honduras
									</option><option value="344">
										(HK)&nbsp;香港Hong Kong
									</option><option value="348">
										(HU)&nbsp;匈牙利Hungary
									</option><option value="352">
										(IS)&nbsp;冰島Iceland
									</option><option value="356">
										(IN)&nbsp;印度India
									</option><option value="360">
										(ID)&nbsp;印尼Indonesia
									</option><option value="364">
										(IR)&nbsp;伊朗Iran (Islamic Republic of)
									</option><option value="368">
										(IQ)&nbsp;伊拉克Iraq
									</option><option value="372">
										(IE)&nbsp;愛爾蘭Ireland
									</option><option value="833">
										(IM)&nbsp;曼島Isle of Man
									</option><option value="376">
										(IL)&nbsp;以色列Israel
									</option><option value="380">
										(IT)&nbsp;義大利Italy
									</option><option value="388">
										(JM)&nbsp;牙買加Jamaica
									</option><option value="392">
										(JP)&nbsp;日本Japan
									</option><option value="832">
										(JE)&nbsp;澤西Jersey
									</option><option value="400">
										(JO)&nbsp;約旦Jordan
									</option><option value="398">
										(KZ)&nbsp;哈薩克Kazakhstan
									</option><option value="404">
										(KE)&nbsp;肯亞Kenya
									</option><option value="296">
										(KI)&nbsp;吉里巴斯Kiribati
									</option><option value="408">
										(KP)&nbsp;北韓Korea (Democratic People's Republic of)
									</option><option value="410">
										(KR)&nbsp;韓國Korea (Republic of)
									</option><option value="414">
										(KW)&nbsp;科威特Kuwait
									</option><option value="417">
										(KG)&nbsp;吉爾吉斯Kyrgyzstan
									</option><option value="418">
										(LA)&nbsp;寮國Lao People's Democratic Republic
									</option><option value="428">
										(LV)&nbsp;拉脫維亞Latvia
									</option><option value="422">
										(LB)&nbsp;黎巴嫩Lebanon
									</option><option value="426">
										(LS)&nbsp;賴索托Lesotho
									</option><option value="430">
										(LR)&nbsp;賴比瑞亞Liberia
									</option><option value="434">
										(LY)&nbsp;利比亞Libya
									</option><option value="438">
										(LI)&nbsp;列支敦斯登Liechtenstein
									</option><option value="440">
										(LT)&nbsp;立陶宛Lithuania
									</option><option value="442">
										(LU)&nbsp;盧森堡Luxembourg
									</option><option value="446">
										(MO)&nbsp;澳門Macao
									</option><option value="450">
										(MG)&nbsp;馬達加斯加Madagascar
									</option><option value="454">
										(MW)&nbsp;馬拉威Malawi
									</option><option value="458">
										(MY)&nbsp;馬來西亞Malaysia
									</option><option value="462">
										(MV)&nbsp;馬爾地夫Maldives
									</option><option value="466">
										(ML)&nbsp;馬利Mali
									</option><option value="470">
										(MT)&nbsp;馬爾他Malta
									</option><option value="584">
										(MH)&nbsp;馬紹爾群島Marshall Islands
									</option><option value="474">
										(MQ)&nbsp;馬提尼克Martinique
									</option><option value="478">
										(MR)&nbsp;茅利塔尼亞Mauritania
									</option><option value="480">
										(MU)&nbsp;模里西斯Mauritius
									</option><option value="175">
										(YT)&nbsp;馬約特Mayotte
									</option><option value="484">
										(MX)&nbsp;墨西哥Mexico
									</option><option value="583">
										(FM)&nbsp;密克羅尼西亞聯邦Micronesia (Federated States of)
									</option><option value="498">
										(MD)&nbsp;摩爾多瓦Moldova (Republic of)
									</option><option value="492">
										(MC)&nbsp;摩納哥Monaco
									</option><option value="496">
										(MN)&nbsp;蒙古國Mongolia
									</option><option value="499">
										(ME)&nbsp;蒙特內哥羅Montenegro
									</option><option value="500">
										(MS)&nbsp;蒙特塞拉特Montserrat
									</option><option value="504">
										(MA)&nbsp;摩洛哥Morocco
									</option><option value="508">
										(MZ)&nbsp;莫三比克Mozambique
									</option><option value="104">
										(MM)&nbsp;緬甸Myanmar
									</option><option value="516">
										(NA)&nbsp;納米比亞Namibia
									</option><option value="520">
										(NR)&nbsp;諾魯Nauru
									</option><option value="524">
										(NP)&nbsp;尼泊爾Nepal
									</option><option value="528">
										(NL)&nbsp;荷蘭Netherlands
									</option><option value="540">
										(NC)&nbsp;新喀里多尼亞New Caledonia
									</option><option value="554">
										(NZ)&nbsp;紐西蘭New Zealand
									</option><option value="558">
										(NI)&nbsp;尼加拉瓜Nicaragua
									</option><option value="562">
										(NE)&nbsp;尼日Niger
									</option><option value="566">
										(NG)&nbsp;奈及利亞Nigeria
									</option><option value="570">
										(NU)&nbsp;紐埃Niue
									</option><option value="574">
										(NF)&nbsp;諾福克島Norfolk Island
									</option><option value="807">
										(MK)&nbsp;北馬其頓North Macedonia
									</option><option value="580">
										(MP)&nbsp;北馬里亞納群島Northern Mariana Islands
									</option><option value="578">
										(NO)&nbsp;挪威Norway
									</option><option value="512">
										(OM)&nbsp;阿曼Oman
									</option><option value="586">
										(PK)&nbsp;巴基斯坦Pakistan
									</option><option value="585">
										(PW)&nbsp;帛琉Palau
									</option><option value="275">
										(PS)&nbsp;巴勒斯坦Palestine, State of
									</option><option value="591">
										(PA)&nbsp;巴拿馬Panama
									</option><option value="598">
										(PG)&nbsp;巴布亞紐幾內亞Papua New Guinea
									</option><option value="600">
										(PY)&nbsp;巴拉圭Paraguay
									</option><option value="604">
										(PE)&nbsp;秘魯Peru
									</option><option value="608">
										(PH)&nbsp;菲律賓Philippines
									</option><option value="612">
										(PN)&nbsp;皮特肯群島Pitcairn
									</option><option value="616">
										(PL)&nbsp;波蘭Poland
									</option><option value="620">
										(PT)&nbsp;葡萄牙Portugal
									</option><option value="630">
										(PR)&nbsp;波多黎各Puerto Rico
									</option><option value="634">
										(QA)&nbsp;卡達Qatar
									</option><option value="638">
										(RE)&nbsp;留尼旺Réunion
									</option><option value="642">
										(RO)&nbsp;羅馬尼亞Romania
									</option><option value="643">
										(RU)&nbsp;俄羅斯Russian Federation
									</option><option value="646">
										(RW)&nbsp;盧安達Rwanda
									</option><option value="652">
										(BL)&nbsp;聖巴泰勒米Saint Barthélemy
									</option><option value="654">
										(SH)&nbsp;聖赫倫那、阿森松和特里斯坦-達庫尼亞Saint Helena, Ascension and Tristan da Cunha
									</option><option value="659">
										(KN)&nbsp;聖克里斯多福及尼維斯Saint Kitts and Nevis
									</option><option value="662">
										(LC)&nbsp;聖露西亞Saint Lucia
									</option><option value="663">
										(MF)&nbsp;法屬聖馬丁Saint Martin (French part)
									</option><option value="666">
										(PM)&nbsp;聖皮埃爾和密克隆Saint Pierre and Miquelon
									</option><option value="670">
										(VC)&nbsp;聖文森及格瑞那丁Saint Vincent and the Grenadines
									</option><option value="882">
										(WS)&nbsp;薩摩亞Samoa
									</option><option value="674">
										(SM)&nbsp;聖馬利諾San Marino
									</option><option value="678">
										(ST)&nbsp;聖多美普林西比Sao Tome and Principe
									</option><option value="682">
										(SA)&nbsp;沙烏地阿拉伯Saudi Arabia
									</option><option value="686">
										(SN)&nbsp;塞內加爾Senegal
									</option><option value="688">
										(RS)&nbsp;塞爾維亞Serbia
									</option><option value="690">
										(SC)&nbsp;塞席爾Seychelles
									</option><option value="694">
										(SL)&nbsp;獅子山Sierra Leone
									</option><option value="702">
										(SG)&nbsp;新加坡Singapore
									</option><option value="534">
										(SX)&nbsp;荷屬聖馬丁Sint Maarten (Dutch part)
									</option><option value="703">
										(SK)&nbsp;斯洛伐克Slovakia
									</option><option value="705">
										(SI)&nbsp;斯洛維尼亞Slovenia
									</option><option value="090">
										(SB)&nbsp;索羅門群島Solomon Islands
									</option><option value="706">
										(SO)&nbsp;索馬利亞Somalia
									</option><option value="710">
										(ZA)&nbsp;南非South Africa
									</option><option value="239">
										(GS)&nbsp;南喬治亞和南桑威奇群島South Georgia and the South Sandwich Islands
									</option><option value="728">
										(SS)&nbsp;南蘇丹South Sudan
									</option><option value="724">
										(ES)&nbsp;西班牙Spain
									</option><option value="144">
										(LK)&nbsp;斯里蘭卡Sri Lanka
									</option><option value="729">
										(SD)&nbsp;蘇丹Sudan
									</option><option value="740">
										(SR)&nbsp;蘇利南Suriname
									</option><option value="744">
										(SJ)&nbsp;斯瓦爾巴和揚馬延Svalbard and Jan Mayen
									</option><option value="752">
										(SE)&nbsp;瑞典Sweden
									</option><option value="756">
										(CH)&nbsp;瑞士Switzerland
									</option><option value="760">
										(SY)&nbsp;敘利亞Syrian Arab Republic
									</option><option value="762">
										(TJ)&nbsp;塔吉克Tajikistan
									</option><option value="834">
										(TZ)&nbsp;坦尚尼亞Tanzania, United Republic of
									</option><option value="764">
										(TH)&nbsp;泰國Thailand
									</option><option value="626">
										(TL)&nbsp;東帝汶Timor-Leste
									</option><option value="768">
										(TG)&nbsp;多哥Togo
									</option><option value="772">
										(TK)&nbsp;托克勞Tokelau
									</option><option value="776">
										(TO)&nbsp;東加Tonga
									</option><option value="780">
										(TT)&nbsp;千里達及托巴哥Trinidad and Tobago
									</option><option value="788">
										(TN)&nbsp;突尼西亞Tunisia
									</option><option value="792">
										(TR)&nbsp;土耳其Turkey
									</option><option value="795">
										(TM)&nbsp;土庫曼Turkmenistan
									</option><option value="796">
										(TC)&nbsp;特克斯與凱科斯群島Turks and Caicos Islands
									</option><option value="798">
										(TV)&nbsp;吐瓦魯Tuvalu
									</option><option value="800">
										(UG)&nbsp;烏干達Uganda
									</option><option value="804">
										(UA)&nbsp;烏克蘭Ukraine
									</option><option value="784">
										(AE)&nbsp;阿聯United Arab Emirates
									</option><option value="826">
										(GB)&nbsp;英國United Kingdom
									</option><option value="840">
										(US)&nbsp;美國United States
									</option><option value="581">
										(UM)&nbsp;美國本土外小島嶼United States Minor Outlying Islands
									</option><option value="858">
										(UY)&nbsp;烏拉圭Uruguay
									</option><option value="860">
										(UZ)&nbsp;烏茲別克Uzbekistan
									</option><option value="548">
										(VU)&nbsp;萬那杜Vanuatu
									</option><option value="862">
										(VE)&nbsp;委內瑞拉Venezuela (Bolivarian Republic of)
									</option><option value="704">
										(VN)&nbsp;越南Viet Nam
									</option><option value="092">
										(VG)&nbsp;英屬維京群島Virgin Islands (British)
									</option><option value="850">
										(VI)&nbsp;美屬維京群島Virgin Islands (U.S.)
									</option><option value="876">
										(WF)&nbsp;瓦利斯和富圖納Wallis and Futuna
									</option><option value="732">
										(EH)&nbsp;撒拉威阿拉伯民主共和國Western Sahara
									</option><option value="887">
										(YE)&nbsp;葉門Yemen
									</option><option value="894">
										(ZM)&nbsp;尚比亞Zambia
									</option><option value="716">
										(ZW)&nbsp;辛巴威Zimbabwe
									</option></select></label></div></div> <input type="text" id="InvoiceAddress" v="[object Object]" class="ifo-input ifi-addr"> <!----> <!----></dd></dl></div></div> <div class="scw-btn-block"><div class="pay-tab-check add-cc-block" style="display: none;"><input type="checkbox" id="InstallmentTerm" name="InstallmentTerm"> <label id="labinstallmentTerm" for="InstallmentTerm" class="checkbox">
					本人申請使用消費自費分期服務，並已詳閱即同意<a href="https://www-stage.ecpay.com.tw/Service/pay_way_installment" target="_blank">本服務約定條款</a>所載規範及下列事項：<br>I am applying to use the service of Installment With Extra Fee and have perused the <a href="https://www-stage.ecpay.com.tw/Service/pay_way_installment" target="_blank">Agreement of the Service</a> and agree to its terms and conditions and the following matters:
				</label> <div class="pay-tip-2"><ul><li>本筆訂單付款完成日起算7日內，如與商店完成退貨及退款，綠界科技將不予收取作業處理費；如超過前述期日之退貨退款，本筆訂單僅就商家同意之消費金額退款，綠界科技將不退還作業處理費。<br>If the return and refund is completed with the vendor within 7 days from the date of payment for this order, ECpay will not charge the "Payment Processing Fees". If the return and refund is made beyond the aforementioned time period, only the amount agreed by the vendor will be refunded for this order, and ECpay will not return the Payment Processing Fee.</li> <li>完成退貨事宜後，同意授權綠界科技代為處理作業處理費電子發票作廢及銷貨退回證明單，以加速退款作業。<br>On completing the matter of return, in order to speed up the refund operation, I authorize ECpay to handle the invalidation of the E-invoice for Payment Processing Fee and the issuance of a sales return certificate.</li></ul></div></div></div> <div class="pay-tip"><h4>注意事項 Notice</h4> <ul><li class="">本次交易採用綠界科技金流機制進行付款，故信用卡交易帳單將顯示為綠界科技股份有限公司 The transaction applies ECPay cashflow mechanism for payment. Green World Fintech Service Company will be shown on credit card bill as seller of the transaction.</li> <li>非經持卡人同意，如有冒用他人卡片盜刷之行為，刑法最高判五年有期徒刑 Using other person's credit card without consent of the cardholder will be subject to maximum 5 years prison sentence per the Criminal Code.</li> <li>本頁面已使用256bitSSL安全加密機制 This page has applied 256-bit SSL security encryption mechanism.</li> <li>為確保網路交易安全，您同意本公司得就此筆交易向發卡銀行、收單銀行及持卡人核對是否屬實 In order to protect internet transaction security, you agree that the company may confirm the existence of this transaction with card issuing bank, acquiring bank, and cardholder.</li> <li class="">信用卡成功交易後否認，如經判定為本人或授權刷卡的行為，相關損失及費用須自行負擔 If a successful credit card transaction is denied but later confirmed to be executed by cardholder or authorized person, the cardholder shall bear related loss and expenses.</li></ul> <a href="javascript:;" class="pay-tip-more">更多</a></div> <div class="scw-btn-block"><a id="CreditPaySubmit" href="javascript:void(0);" class="btn ptl-log" style="margin-bottom: 20px;">立即付款 Pay now</a></div> <div class="content-txt-wrap ctw-center"><p class="red-tip">提醒您，綠界科技不承作投資、賭博、虛擬貨幣等商品交易代理收付，付款前請確認商品內容是否涉及上述商品類型，以避免遭受詐騙。<br>
Please be reminded that ECPay does not undertake the payment and collection of investments, gambling, or virtual currency transactions. Please check whether merchandise you purchased belong to above types of merchandise before paying to avoid scam.</p></div></div> <div role="modal" class="simplert"><div class="simplert__content simplert__content--radius"><div class="simplert__header"><!----> <div><!----> <!----> <!----> <!----> <!----></div> <b class="simplert__title"></b></div> <div class="simplert__body"><div></div></div> <div class="simplert__footer"><!----> <button id="btnClose" class="simplert__close simplert__close--radius">                                                                                                            </button></div></div></div></div>

<!--元件預先放Template-->
<div style="display:none;">
	<!-- 刷卡方式 -->
	<div id="cCardMethod">
		<dl class="ptf-bs pfb-2" v-show="shouldShowMethod">
			<dt>刷卡方式  <br><span class="item-en">Credit card payment method</span><sup class="inp-required">*</sup></dt>
			<dd>
				<div class="pay-tab-radio">
					<span v-show="shouldShowCreditRadio">
						<input type="radio" value="Credit" id="bs_1" name="CreditMethod" v-model="chkGroup" @change="onCeditChange($event)">
						<label for="bs_1" class="radio-1">
							一次付清<span class="content-en">Lump sum payment</span>
						</label>
					</span>
					<span v-show="shouldShowInsRadio">
						<input type="radio" value="CreditInstallments" id="bs_2" name="CreditMethod" v-model="chkGroup" @change="onCeditChange($event)">
						<label for="bs_2" class="radio-1">
							分期 <span class="content-en">Installment</span>
						</label>
					</span>
					<span v-show="shouldShowDreamRadio">
						<input type="radio" value="AsymmetryInstallments" id="bs_3" name="CreditMethod" v-model="chkGroup" @change="onCeditChange($event)">
						<label for="bs_3" class="radio-1">
							圓夢彈性分期 Flexible Installment
							<span class="ptr-tip">(僅限永豐卡交易)</span>
						</label>
					</span>
					<span v-show="shouldShowOwnInsRadio">
						<input type="radio" value="BuyerInstallments" id="bs_4" name="CreditMethod" v-model="chkGroup" @change="onCeditChange($event)">
						<label for="bs_4" class="radio-1">
							消費自費分期<span class="content-en">Installment With Extra Fee</span>
						</label>
					</span>
				</div>
			</dd>
		</dl>
	</div>

	<!--信用卡類型-->
	<div id="cCreditPayType">
		<dl v-if="showCreditPayTypeDiv" class="ptf-bs">
			<dt>信用卡類型 <br><span class="item-en">Credit card type</span><sup class="inp-required">*</sup></dt>
			<dd>
				<label class="pay-tab-select">
					<select id="CreditPayType" @change="onPayTypeChange($event)" :value="selectedValue">
						<option v-if="showCreditOption" value="Visa/Master/JCB">VISA / MasterCard / JCB</option>
						<option value="UnionPay">銀聯卡 UnionPay card</option>
					</select>
				</label>
				<div v-if="showUnionPayWarning" class="input-error-txt">銀聯卡僅支援一次付清付款 UnionPay card only supports lump sum payment.</div>
			</dd>
		</dl>
	</div>

	<!-- 紅利 -->
	<div id="cCreditRedeem">
		<dl v-if="showCreditRedeemDiv" class="ptf-bs">
			<dt>刷卡方式  <br><span class="item-en">Credit card payment method</span><sup class="inp-required">*</sup></dt>
			<dd>
				<div class="pay-tab-radio">
					<input type="radio" value="CreditRedeem" id="CreditRedeem" name="CreditRedeem" checked="checked">
					<label for="bs_3" class="radio-1">
						紅利折抵  <span class="content-en">Bonus redeemed for discount</span>
					</label>
				</div>
				<div class="pay-tip-2 pc-tip">
					<div>
						<p>1. 紅利不足時將自動改為一次付清交易(部分銀行信用卡紅利不足則交易失敗，實際結果由銀行判定) 1. Transaction will be changed to lump sum payment when there is no sufficient bonus.(Transaction might fail due to insufficient credit card bonus for credit card issued by certain banks. Actual result will be decided by the bank.)</p>
						<p>2.各銀行紅利折抵規則，詳細請見<a :href="getCreditBonusUrl()" target="_blank">紅利折抵辦法</a> 2. Please refer to <a :href="getCreditBonusUrl()" target="_blank"> rule of bonus redemption for discount</a> for each bank's bonus redemption rules.</p>
					</div>
				</div>
			</dd>
		</dl>
	</div>
	<!-- 信用卡卡號 -->
	<div id="cCreditNo">
		<dl v-if="showCreditNoDiv">
			<dt><label>信用卡卡號 <br> <span class="item-en">Credit card number</span><sup class="inp-required">*</sup></label></dt>
			<dd>
				<ul class="pay-card-num">
					<li class="card-num">
						<input name="CardNo" type="hidden" v-model.trim="$v.CardNo.$model">
						<card-one></card-one> -
						<card-two></card-two> -
						<card-three></card-three> -
						<card-four></card-four>
					</li>
					<li v-show="shouldShowCardInfo" class="card-type">
						<span :class="iconClass"></span>
						<span class="ptf-txt"><a>{{bankname}}</a></span>
					</li>
				</ul>
				<div v-if="!$v.CardNo.required &amp;&amp; $v.CardNo.$error" class="input-error-txt">請輸入信用卡卡號 Please enter credit card number.</div>
				<div v-if="!$v.CardNo.validatIsNum" class="input-error-txt">MasterCard/VISA/JCB信用卡的卡號格式有誤 Incorrect format for MasterCard/VISA/JCB credit card number</div>
				<div v-if="!$v.CardNo.validatIsSupportCreditCardType" class="input-error-txt">欲使用銀聯卡，請選擇信用卡類型為「銀聯卡」。 Please change credit card type to "UnionPay card" if you want to use UnionPay card.</div>
				<div v-if="!$v.CardNo.validatIsAvailableIssuingBank" class="input-error-txt">僅支援 Visa / Master / JCB Support Visa/Master/JCB card only</div>
				<div v-if="!$v.CardNo.validatOverSeasCard" class="input-error-txt">本公司不接受非台灣發行之信用卡交易，請重新輸入台灣發行之信用卡卡卡號。 The company does not accept credit card issued outside of Taiwan. Please enter credit card number issued in Taiwan.</div>
				<div v-if="showLimitTaiwanCreditDiv" class="input-info-txt">本交易不接受非台灣發行的信用卡。 The company does not accept credit card issued outside of Taiwan.</div>
				<div v-if="show3DMsg == 1" class="input-info-txt">本交易須通過Visa/MasterCard/JCB信用卡3D驗證 The transaction has to pass 3D verification by Visa, MasterCard, and JCB card.</div>
				<div v-if="show3DMsg == 2" class="input-info-txt">本交易若以台灣信用卡支付，須通過Visa/MasterCard/JCB信用卡3D驗證 3D verification by Visa, MasterCard, and JCB card should be passed if the transaction is paid by credit card issued in Taiwan.</div>
				<div v-if="show3DMsg == 3" class="input-info-txt">本交易若以非台灣信用卡支付，須通過Visa/MasterCard/JCB信用卡3D驗證 3D verification by Visa, MasterCard, and JCB card should be passed if the transaction is paid by credit card issued outside of Taiwan.</div>
			</dd>
		</dl>
	</div>

	<!-- 信用卡綁定 -->
	<div id="cCreditBinding">
		<dl v-if="showCreditBindingDiv">
			<dt>信用卡卡號 <br> <span class="item-en">Credit card number</span><sup class="inp-required">*</sup></dt>
			<dd class="pay-cardnum-singal">
				<div class="pcsg-menu-btn">
					<span :class="iconClass"></span>
					<span class="pcsg-txt">末四碼 Last four digits {{defaultcard4no}} {{bankname}}</span>
				</div>
				<div class="pay-btn-box">
					<a id="btnChangeBindingCard" class="btn pcn-btn btn-en" @click.prevent="useNewCard($event)" title="變更卡號">變更卡號
<br><span class="ben-txt">Change card detail</span></a>
					<a id="btnDelBindingCard" class="btn pcn-btn btn-en" @click.prevent="delBindingCard($event)" title="清除資料">清除資料 <br><span class="ben-txt">Clear data</span></a>
				</div>
			</dd>
		</dl>
	</div>

	<!-- 卡片有效期限 -->
	<div id="cCardCVV2">
		<dl v-if="showCardCvv2Div || sholdShowMMYY ||sholdShowCVV " class="pay-card-date">
			<dt v-if="sholdShowMMYY">卡片有效期限 <br><span class="item-en">Card valid thru</span><sup class="inp-required">*</sup></dt>
			<dd v-if="sholdShowMMYY">
				<input type="hidden" id="CreditDate" v-model.trim="$v.CreditDate.$model">
				<div>
					<input type="tel" id="creditMM" placeholder="MM" maxlength="2" pattern="\d*" v-model.trim="$v.creditMM.$model" @keyup="autoFocusNext($event),preCheckCreditDate($event)">
					<input type="tel" id="creditYY" placeholder="YY" maxlength="2" pattern="\d*" v-model.trim="$v.creditYY.$model" @keyup="checkCreditDate($event)">
				</div>
				<div v-if="$v.validationGroup.$error || $v.creditMM.$error || !$v.CreditDate.validDate" class="input-error-txt">信用卡[有效月年]期限錯誤 Incorrect credit card valid thru[month and year]!</div>
			</dd>
			<dd v-if="sholdShowCVV" class="pay-card-ccvb">
				<dl>
					<dt>信用卡安全碼<br><span class="item-en">CVV Code</span><sup class="inp-required">*</sup></dt>
					<dd>
						<input id="CreditBackThree" type="tel" maxlength="3" placeholder="" pattern="\d*" v-model.trim="$v.CreditBackThree.$model">
						<img src="./選擇支付方式_綠界科技_files/ccvb.png" class="p-ccvb-img">
						<div v-if="$v.CreditBackThree.$error" class="input-error-txt">MasterCard/VISA/JCB信用卡的卡片末3碼格式有誤 Incorrect format of 3-digit code of MasterCard/Visa/JCB card.</div>
						<p class="pay-tip-2">此欄位為驗證之需，綠界科技不予以記錄 (This column is for verification use. ECPay does not record this column.)</p>
					</dd>
				</dl>
			</dd>
		</dl>
	</div>

	<!-- 持卡人姓名 -->
	<div id="cCardHolder">
		<dl v-if="showCardHolderDiv">
			<dt>
				<label for="p_id">
					持卡人姓名 <br><span class="item-en">Cardholder name</span>
					<sup v-if="show3D" class="inp-required">*</sup>
				</label>
			</dt>
			<dd v-if="!showCName">
				<input id="CCHolderTemp" v-model.trim="$v.CCHolder.$model" v="$v" :placeholder="cplaceholder">
				<div v-if="!$v.CCHolder.required &amp;&amp; $v.CCHolder.$error" class="input-error-txt">請輸入卡片上的姓名 Please enter your name of credit card.</div>
				<div v-if="!$v.CCHolder.ccHolderReg &amp;&amp; $v.CCHolder.$error" class="input-error-txt">不可輸入數字及符號 Numeric characters and symbols are not allowed.</div>
				<div class="input-info-txt">請輸入卡片上的姓名 Please enter your name of credit card.</div>
			</dd>
			<dd v-if="showCName">
				{{cname}}
			</dd>
		</dl>
	</div>

	<!-- 手機號碼 -->
	<div id="cCellPhone" v-if="showCellPhoneDiv">
		<dl class="ptf-dfe-phone">
			<dt v-if="!showDefaultCellPhone">
				<label for="p_mobile_num_4">
					手機號碼<br><span class="item-en">Mobile Number</span>
					<sup class="inp-required">*</sup>
					<a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" class="pay-note-link" @click.prevent="alertCellPhoneMsg($event)"></a>
				</label>
			</dt>
			<dt v-if="showDefaultCellPhone">
				預設手機 <span class="item-en">Default cell phone</span>
				<sup class="inp-required">*</sup>
				<a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" class="pay-note-link" @click.prevent="alertCellPhoneMsg($event)"></a>
			</dt>
			<dd v-if="!showDefaultCellPhone">
				<input id="CellPhoneCheck" type="tel" v-model.trim="$v.CellPhoneCheck.$model" :v="$v">
				<div v-if="$v.CellPhoneCheck.$error &amp;&amp; !$v.CellPhoneCheck.required" class="input-error-txt">請輸入手機號碼 Please enter mobile phone number.</div>
				<div v-if="!$v.CellPhoneCheck.validCellPhone" class="input-error-txt">手機號碼格式輸入錯誤 Incorrect cell phone number format.</div>
			</dd>
			<dd v-if="showDefaultCellPhone">
				{{PrefixPhone}}xx-xxx-{{SuffixPhone}}
			</dd>
		</dl>
	</div>

	<!-- 電子信箱 -->
	<div id="cEmail" class="ptf-email">
		<dl>
			<dt>
				<label for="p_email">
					電子信箱   <br><span class="item-en">Email address</span>
					<sup v-if="showEmailDiv" class="inp-required">*</sup>
					<a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" class="pay-note-link" @click.prevent="alertEmailMsg($event)"></a>
				</label>
			</dt>
			<dd v-if="!showEmail">
				<input type="text" id="EmailTemp" v-model.trim="$v.EmailCheck.$model" v="$v" :placeholder="eplaceholder">
				<div v-if="$v.EmailCheck.$error &amp;&amp; !$v.EmailCheck.required" class="input-error-txt">電子信箱不可為空 Email address cannot be left blank</div>
				<div v-if="!$v.EmailCheck.validEmail &amp;&amp; $v.EmailCheck.$error" class="input-error-txt">請輸入正確的Email格式。                                                                                                                                             Incorrect format of email.      </div>
			</dd>
			<dd v-if="showEmail">
				{{email}}
			</dd>
		</dl>
	</div>

	<!--Address-->
	<div id="cCountryOption">
		<dl class="send-location" v-if="showAddressDiv">
			<dt>
				<label for="p_mobile_num_4">
					帳單地址 <br><span class="item-en">Billing address</span>
					<sup v-if="isShowAddr" class="inp-required">*</sup>
					<a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" class="pay-note-link" @click.prevent="alertAddressMsg($event)"></a>
				</label>
			</dt>
			<dd v-if="!showDefaultAddress">
				<div class="select-box">
					<div class="country-select">
						<label class="pay-tab-select">
							<select id="selectCountry" v-on:change="onCountryChange($event)" v-bind:value="selectedCValue">
								<option v-for="country in countrycodelist" v-bind:value="country.CountryCode">
									{{country.CountryName}}
								</option>
							</select>
						</label>
					</div>
				</div>
				<input type="text" id="Address" class="ifo-input ifi-addr" v-model.trim="$v.AddressCheck.$model" @blur="checkAddr($event)" :v="$v" :placeholder="addrplaceholder">
				<div v-if="$v.AddressCheck.$error &amp;&amp; !$v.AddressCheck.validAddrEmpty" class="input-error-txt">請輸入您的信用卡帳單地址 Please enter your credit card billing address</div>
				<div v-if="!$v.AddressCheck.validAddress" class="input-error-txt">請輸入正確的地址格式 Please enter your address for delivery.</div>
			</dd>
			<dd v-if="showDefaultAddress">
				{{PreStateCode}}{{PreAddress}}
				<a id="btnChangeAddress" class="btn pcn-btn btn-en" v-if="isAddrBinding" @click.prevent="useNewAddress($event)" title="變更地址">變更地址<br>change address</a>
			</dd>
		</dl>
	</div>

	<!-- 申請快捷支付 -->
	<div id="cCheckQuickCreditPay">
		<div>
			<div class="scw-btn-block" v-show="showCheckQuickCreditPayDiv">
				<div class="pay-tab-check add-cc-block">
					<input type="checkbox" id="CreditBinding" name="CreditBinding" @change="SetBindingCredit($event)" :checked="checkedValue" :disabled="disabledValue">
					<label id="labCreditBinding" for="CreditBinding" class="checkbox">
						同意申請本商店之快捷支付，下次購物時免輸入卡號 Agree the merchant's store to use fast payment so that card number will autofillon your next purchase.
						<div class="quick-pay-tip">
							<a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut#quick-pay-popup" data-effect="mfp-zoom-in" class="open-popup-link ql-m">快速結帳說明 Explanaing fast payment</a>
							<a href="javascript:;" class="qpt-link ql-pc">快速結帳說明 Explanaing fast payment</a>
							<div class="tip-popup qpt-popup">
								申請快捷支付，卡號資訊會記錄於綠界科技系統內，不會提供給店家。可於下次同店消費時，自動帶出您的卡號資訊快速結帳 If you apply fast payment, the card number will be recorded in ECPay system. The number will not be provided to the store. Next time if you purchase in the same store, your credit card number will be prompted for fast payment.
							</div>
						</div>
					</label>
				</div>
			</div>
			<div id="quick-pay-popup" class="quick-pay-popup mg-popup mfp-with-anim mfp-hide">
				<div class="pp-container">
					<h3 class="content-title">快速結帳說明 Explanaing fast payment</h3>
					<div class="qpp-content">
						申請快捷支付，卡號資訊會記錄於綠界科技系統內，不會提供給店家。可於下次同店消費時，自動帶出您的卡號資訊快速結帳 If you apply fast payment, the card number will be recorded in ECPay system. The number will not be provided to the store. Next time if you purchase in the same store, your credit card number will be prompted for fast payment.
					</div>
					<div class="mp-btn-block">
						<a href="javascript:;" class="btn popup-close">關閉 Turn off</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 分期下拉選單 -->
	<div id="cInstallmentOption">
		<div>
			<dl class="ptf-bs" v-show="isShowIns || isShowDreamInsment">
				<dt></dt>
				<dd>
					<div>
						<p class="warning wn-mrb" v-show="isShowInsment || isShowDreamInsment">
							信用卡分期不接受<span style="color: Red;">Visa金融卡、萬事達Debit金融卡</span>及<span style="color: Red;">JCB Debit卡</span>。
Credit card installment payment does not accept <span style="color: Red;">Visa debit card, Master debit card, and JCB Debit card</span>.
						</p>
					</div>
					<div v-show="isShowInsment" class="pay-tab-radio">
						<label class="pay-tab-select">
							<select id="selectInstallments" @change="onInstallmentsChange($event)" v-model="selected" v-bind:value="selectedValue">
								<option value="0" selected="selected">請選擇分期期數 Please select number of installments.</option>
								<option v-for="installment in installmentlist" v-bind:value="installment.InstallmentNo">
									{{ installment.InstallmentNo }}期 Installments
								</option>
							</select>
						</label>
						<div v-if="!$v.selectedInstalmentVal.validCreditInstallment" class="input-error-txt">不支援此銀行信用卡分期交易，請改用其他信用卡。 The installment plan is not available for the credit card issued by this bank. Please use another credit card and try again.</div>
						<div v-if="$v.selectedInstalmentVal.$error &amp;&amp; !$v.selectedInstalmentVal.validChangeInstallment" class="input-error-txt">請選擇分期期數 Please select number of installments.</div>
					</div>
					<div class="pay-tip-2 pc-tip" v-show="isShowInsment">
						<div>
							<div>
								<ul>
									<li v-for="installment in installmentlist" v-show="showInstallmentNotes == 0 || showInstallmentNotes == installment.InstallmentNo">
										{{installment.InstallmentsName}}
										{{installment.InstallmentsShortName}}<a class="call-bank-pp" href="javascript:void(0)">看更多</a>
										<div class="tip-popup bank-tip-popup">
											{{installment.InstallmentsOriName}}
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div v-show="isShowDreamInsment" class="pay-tab-radio">
						<label class="pay-tab-select">
							<select id="DreamIns" @change="onDreamInsChange($event)" v-model="selectedD" v-bind:value="selDValue">
								<option value="0" selected="selected">請選擇分期期數 Please select number of installments.</option>
								<option v-for="asyinstallment in asymmetryinstallmentlist" v-bind:value="asyinstallment.InstallmentNo">
									{{ asyinstallment.InstallmentNo }}期 Installments
								</option>
							</select>
						</label>
						<div v-if="!$v.selectedInstalmentVal.validAsymmetryInstallment" class="input-error-txt">不支援此銀行信用卡分期交易，請改用其他信用卡。 The installment plan is not available for the credit card issued by this bank. Please use another credit card and try again.</div>
						<div v-if="$v.selectedInstalmentVal.$error &amp;&amp; !$v.selectedInstalmentVal.validChangeAsymmetryInstallment" class="input-error-txt">請選擇分期期數 Please select number of installments.</div>
					</div>
					<div class="pay-tip-2 pc-tip">
						<div v-show="isShowDreamInsment" class="pay-tip-2">
							<p>限永豐信用卡 Credit cards issued by SinoPac Bank only.</p>
							<p>1. 當您使用非永豐信用卡時，將無法進行交易。It won't be able to conduct any transaction when using a credit card other than the one issued by SinoPac Bank.</p>
							<p>2. 圓夢彈性分期詳細說明，請見<a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" target="_blank">服務介紹頁</a>。Please refer to the <a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" target="_blank">introduction page</a> for detailed descriptions of Flexible Installment.</p>
						</div>

						<div class="pay-tip-2" v-show="isShowDreamInsment">
							範例說明(Example)
							<a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut" class="pay-note-link" @click.prevent="alertDreamInfo($event)"></a>
						</div>
						<input type="hidden" v-model.trim="$v.selectedInstalmentVal.$model" :v="$v">
					</div>
				</dd>
			</dl>
		</div>
	</div>

	<!-- 自費分期下拉選單 -->
	<div id="cBuyerInstallmentOption">
		<div>
			<dl class="ptf-bs" v-show="isShowBuyerIns">
				<dt></dt>
				<dd>
					<div>
						<p class="warning wn-mrb" v-show="isShowBInsment">
							信用卡分期不接受<span style="color: Red;">Visa金融卡、萬事達Debit金融卡</span>及<span style="color: Red;">JCB Debit卡</span>。
Credit card installment payment does not accept <span style="color: Red;">Visa debit card, Master debit card, and JCB Debit card</span>.
						</p>
					</div>
					<div v-show="isShowBInsment" class="pay-tab-radio">
						<label class="pay-tab-select">
							<select id="selectBuyerInstallments" @change="onBbuyerInsChange($event)" v-model="selectedB" v-bind:value="selectedBValue">
								<option value="0" selected="selected">選擇分期期數 Select installments.</option>
								<option v-for="binstallment in buyerinstallmentlist" v-bind:value="binstallment.InstallmentNo">
									{{ binstallment.InstallmentNo }}期 Installments-作業處理費{{binstallment.BuyerChargeFeeRate}}% Payment Processing Fee
								</option>
							</select>
						</label>
						<div v-if="!$v.selectedBInstalmentVal.validCreditBInstallment" class="input-error-txt">不支援此銀行信用卡分期交易，請改用其他信用卡。 The installment plan is not available for the credit card issued by this bank. Please use another credit card and try again.</div>
						<div v-if="$v.selectedBInstalmentVal.$error &amp;&amp; !$v.selectedBInstalmentVal.validChangeBInstallment" class="input-error-txt">請選擇分期期數 Please select number of installments.</div>
					</div>
					<div class="input-info-txt" v-show="isShowBInsment &amp;&amp; sFeeInfo">
						作業處理費 Payment Processing Fee = {{BuyerFee}}
					</div>
					<div class="pay-tip-2 pc-tip" v-show="isShowBInsment">
						<div>
							<div>
								<ul>
									<li>您將收到兩筆信用卡交易，一筆為消費金額，一筆為作業處理費金額。 Your credit card will be billed for two items: one is the amount of the purchase, and the other is the Payment Processing Fee.</li>
									<li v-for="binstallment in buyerinstallmentlist" v-show="showBInstallmentNotes == 0 || showBInstallmentNotes == binstallment.InstallmentNo">
										{{binstallment.InstallmentsName}}
										{{binstallment.InstallmentsShortName}}<a class="call-bank-pp" href="javascript:void(0)">看更多</a>
										<div class="tip-popup bank-tip-popup">
											{{binstallment.InstallmentsOriName}}
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</dd>
			</dl>
		</div>
	</div>

	<!-- 作業處理費發票 -->
	<div id="cBuyerInvoiceInfo">
		<div v-show="showInvoicediv">
			<div class="pay-tab-check">
				<h4 class="scw-focus">※ 作業處理費發票 Invoice for Payment Processing Fee</h4>

				<div class="input-info-txt">
					請務必確認資料正確性，發票一經開立不得要求更改 Please make sure the information is correct. Once the invoice is issued, it cannot be altered.
				</div>
			</div>
			<dl>
				<dt>開立類型<br class="clear"><span class="item-en">Invoice Recipient</span><sup class="inp-required">*</sup></dt>
				<dd>
					<div class="pay-tab-radio">
						<input type="radio" value="1" id="ct_1" name="create_type" v-model="InvoiceGroup" @change="onInvoiceChange($event)">
						<label for="ct_1" class="radio-1">
							個人<span class="content-en">Natural person</span>
						</label>
						<input type="radio" value="2" id="ct_2" name="create_type" v-model="InvoiceGroup" @change="onInvoiceChange($event)">
						<label for="ct_2" class="radio-1">
							公司行號<span class="content-en">Business entity</span>
						</label>
						<input type="radio" value="3" id="ct_3" name="create_type" v-model="InvoiceGroup" @change="onInvoiceChange($event)">
						<label for="ct_3" class="radio-1">
							捐贈<span class="content-en">Donate the invoice</span>
						</label>
					</div>
				</dd>
			</dl>
			<dl v-show="showCarrie">
				<dt><label for="p_id">選擇載具<br class="clear"><span class="item-en">Select carrier</span><sup class="inp-required">*</sup></label></dt>
				<dd>
					<label class="pay-tab-select">
						<select id="InvoiceCarriersType" @change="onCarriersChange($event)" v-model="selectedC" v-bind:value="selectedCValue">
							<option value="1" selected="selected">綠界會員載具 ECpay member carrier</option>
							<option value="3">手機條碼載具 Mobile barcode carrier</option>
							<option value="2">自然人憑證載具 Citizen Digital Certificate carrier</option>
							<option value="">不使用載具 Without carrier</option>
						</select>
					</label>
					<div class="pay-tab-check ptc-mg" v-show="showInvoicePrint">
						<input type="checkbox" id="InvoicePrint" name="InvoicePrint" @change="SetPrint($event)" :checked="checkedPValue" :disabled="disabledPValue">
						<label for="InvoicePrint" class="checkbox">
							索取紙本<span class="item-en">Request paper invoice</span>
						</label>
					</div>
				</dd>
			</dl>
			<dl v-show="showCarrieNum">
				<dt>
					<label for="p_mobile_num_4">
						載具編號 <br class="clear"><span class="item-en">Carrier number</span>
						<sup class="inp-required">*</sup>
					</label>
				</dt>
				<dd>
					<input type="text" id="InvoiceCarriersNum" v-model.trim="$v.CarriersNumCheck.$model" v="$v" @blur="checkInvCarrToUpper($event);">
					<div v-if="!$v.CarriersNumCheck.validCarriersNumEmpty &amp;&amp; $v.CarriersNumCheck.$error" class="input-error-txt">請輸入載具編號 Please enter carrier number.</div>
					<div v-if="!$v.CarriersNumCheck.validCarriersNum &amp;&amp; $v.CarriersNumCheck.$error" class="input-error-txt">格式有誤，請重新輸入 Format error; please re-enter.</div>
				</dd>
			</dl>
			<dl v-show="showDonate">
				<dt>
					<label for="p_mobile_num_4">
						捐贈碼 <br class="clear"><span class="item-en">Donation code</span><sup class="inp-required">*</sup>
					</label>
				</dt>
				<dd>
					<div class="pay-tab-check ptc-mg">
						<input type="checkbox" name="defDonate" id="defDonate" @change="SetDonate($event)" :checked="checkedDTValue">
						<label for="defDonate" class="checkbox">
							預設-OMG關懷社會愛心基金會 Default - OMG Love Foundation
						</label>
					</div>

					<input type="text" inputmode="numeric" id="DonateCode" v-model.trim="$v.DonateCheck.$model" v="$v" placeholder="請輸入捐贈碼3-7位數 Please enter a donation code in 3-7 digits." :disabled="disabledDValue">

					<div class="ptf-txt pft-inb">
						<a href="https://www.einvoice.nat.gov.tw/APCONSUMER/BTC603W/" target="_blank">捐贈碼查詢 Donation code inquiry</a>
					</div>
					<div v-if="!$v.DonateCheck.validDonateEmpty &amp;&amp; $v.DonateCheck.$error" class="input-error-txt">請輸入捐贈碼  Please enter the donation code.</div>
					<div v-if="!$v.DonateCheck.validDonate &amp;&amp; $v.DonateCheck.$error" class="input-error-txt">格式有誤，請重新輸入 Format error; please re-enter.</div>
				</dd>
			</dl>
			<dl v-show="showInvoiceName">
				<dt><label for="p_id">發票抬頭<br class="clear"><span class="item-en">Company Name</span><sup class="inp-required">*</sup></label></dt>
				<dd>
					<div class="pay-tab-check ptc-mg">
						<input type="checkbox" name="sInvtitle" id="sInvtitle" @change="SetInvtitle($event)" :checked="checkedTValue">
						<label for="sInvtitle" class="checkbox">
							同持卡人 <span class="item-en">Same as card holder's</span>
						</label>
					</div>
					<input type="text" id="InvoiceName" maxlength="20" v-model.trim="$v.InvNameCheck.$model" v="$v" :disabled="disabledNValue">
					<div v-if="!$v.InvNameCheck.validInvNameEmpty &amp;&amp; $v.InvNameCheck.$error" class="input-error-txt">請輸入發票抬頭 Please enter the name of the invoice recipient on the invoice.</div>
					<div v-if="!$v.InvNameCheck.validInvName &amp;&amp; $v.InvNameCheck.$error" class="input-error-txt">格式有誤，請重新輸入 Format error; please re-enter.</div>
				</dd>
			</dl>
			<dl v-show="showBusinessNo">
				<dt><label for="p_id">統一編號 <br class="clear"><span class="item-en">GUI number.</span><sup class="inp-required">*</sup></label></dt>
				<dd>
					<input type="text" inputmode="numeric" id="InvoiceUnifiedBusinessNo" maxlength="8" v-model.trim="$v.InvBNoCheck.$model" v="$v">
					<div v-if="!$v.InvBNoCheck.validInvBNoEmpty &amp;&amp; $v.InvBNoCheck.$error" class="input-error-txt">請輸入統一編號 Please enter GUI number.</div>
					<div v-if="!$v.InvBNoCheck.validInvBNo &amp;&amp; $v.InvBNoCheck.$error" class="input-error-txt">格式有誤，請重新輸入 Format error; please re-enter.</div>
				</dd>
			</dl>
			<dl>
				<dt><label for="p_id">發票手機號碼 <br class="clear"><span class="item-en">Mobile phone number for the invoice</span><sup class="inp-required">*</sup></label></dt>
				<dd>
					<div class="pay-tab-check ptc-mg">
						<input type="checkbox" name="sphone" id="sphone" @change="SetInvPhone($event)" :checked="checkedSPValue" :disabled="disabledPhValue">
						<label for="sphone" class="checkbox">
							同持卡人手機 <span class="item-en">Same as card holder's mobile phone number</span>
						</label>
					</div>
					<input type="tel" id="InvoicePhone" v-model.trim="$v.InvPhoneCheck.$model" v="$v" :disabled="disabledPhoneValue">
					<div v-show="showGwPhone" class="input-info-txt">綠界科技將使用持卡人手機號碼為載具，為您自動對獎並發送中獎通知。 ECpay will use card holder's mobile phone number as a carrier and automatically send out the winning notice if the invoice number is a winning number.</div>
					<div v-if="$v.InvPhoneCheck.$error &amp;&amp; !$v.InvPhoneCheck.validPhoneEmpty" class="input-error-txt">請輸入發票手機號碼 Please enter mobile phone number for the invoice.</div>
					<div v-if="!$v.InvPhoneCheck.validInvPhone" class="input-error-txt">請輸入正確的手機號碼 Please enter the correct mobile phone number.</div>
				</dd>
			</dl>
			<dl>
				<dt><label for="p_id">發票電子信箱 <br class="clear"><span class="item-en">E-mail address for the invoice</span></label></dt>
				<dd>
					<div class="pay-tab-check ptc-mg">
						<input type="checkbox" name="smail" id="smail" @change="SetInvEmail($event)" :checked="checkedEValue" :disabled="disabledCEValue">
						<label for="smail" class="checkbox">
							同持卡人信箱 <span class="item-en">Same as card holder's E-mail address</span>
						</label>
					</div>
					<input type="email" id="InvoiceEmail" v-model.trim="$v.InvEmailCheck.$model" v="$v" :disabled="disabledEValue">

					<div v-if="!$v.InvEmailCheck.validInvEmail &amp;&amp; $v.InvEmailCheck.$error" class="input-error-txt">請輸入正確的電子信箱 Please enter the correct E-mail address.</div>
				</dd>
			</dl>
			<dl class="send-location" v-show="showInvoiceAddr">
				<dt><label for="p_id">寄送地址 <br class="clear"><span class="item-en">Delivery Address</span><sup class="inp-required">*</sup></label></dt>
				<dd>
					<div class="pay-tab-check ptc-mg">
						<input type="checkbox" name="sBillAddr" id="sBillAddr" @change="SetInvAddr($event)" :checked="checkedAValue" :disabled="disabledAValue">
						<label for="sBillAddr" class="checkbox">
							同帳單地址 <span class="item-en">Same as billing address</span>
						</label>
					</div>
					<div class="select-box">
						<div class="country-select cts-mrg">
							<label class="pay-tab-select">
								<select id="selectInvCountry" v-on:change="onInvCountryChange($event)" v-bind:value="selectedInvCValue" :disabled="disabledCountryValue">
									<option v-for="country in countrycodelist" v-bind:value="country.CountryCode">
										{{country.CountryName}}
									</option>
								</select>
							</label>
						</div>
					</div>
					<input type="text" id="InvoiceAddress" class="ifo-input ifi-addr" v-model.trim="$v.InvAddressCheck.$model" @blur="checkInvAddr($event)" :v="$v" :disabled="disabledAddrValue">
					<div v-if="$v.InvAddressCheck.$error &amp;&amp; !$v.InvAddressCheck.validAddrEmpty" class="input-error-txt">請輸入寄送地址 Please enter address for delivery.</div>
					<div v-if="!$v.InvAddressCheck.validAddress" class="input-error-txt">請輸入正確的地址格式 Please enter your address for delivery.</div>
				</dd>
			</dl>
		</div>
	</div>

	<!-- 自費分期規範 -->
	<div id="cBuyerInstallemtNotice">
		<div class="scw-btn-block">
			<div class="pay-tab-check add-cc-block" v-show="showBuyerInsDiv">
				<input type="checkbox" id="InstallmentTerm" name="InstallmentTerm" @change="SetBNotice($event)" :checked="checkedBValue">
				<label id="labinstallmentTerm" for="InstallmentTerm" class="checkbox">
					本人申請使用消費自費分期服務，並已詳閱即同意<a href="https://www-stage.ecpay.com.tw/Service/pay_way_installment" target="_blank">本服務約定條款</a>所載規範及下列事項：<br>I am applying to use the service of Installment With Extra Fee and have perused the <a href="https://www-stage.ecpay.com.tw/Service/pay_way_installment" target="_blank">Agreement of the Service</a> and agree to its terms and conditions and the following matters:
				</label>
				<div class="pay-tip-2">
					<ul>
						<li>本筆訂單付款完成日起算7日內，如與商店完成退貨及退款，綠界科技將不予收取作業處理費；如超過前述期日之退貨退款，本筆訂單僅就商家同意之消費金額退款，綠界科技將不退還作業處理費。<br>If the return and refund is completed with the vendor within 7 days from the date of payment for this order, ECpay will not charge the "Payment Processing Fees". If the return and refund is made beyond the aforementioned time period, only the amount agreed by the vendor will be refunded for this order, and ECpay will not return the Payment Processing Fee.</li>
						<li>完成退貨事宜後，同意授權綠界科技代為處理作業處理費電子發票作廢及銷貨退回證明單，以加速退款作業。<br>On completing the matter of return, in order to speed up the refund operation, I authorize ECpay to handle the invalidation of the E-invoice for Payment Processing Fee and the issuance of a sales return certificate.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</div>
						<!-- 網路ATM -->

						<!-- ATM櫃員機 -->


						<!-- 超商條碼 -->

						<!-- 超商代碼 -->

                        <!-- Google Pay -->

                        <!-- Apple Pay -->


                        <!-- OPay -->
                    </div>
				</div>
			</div>
	</div>
</div>



<!--元件預先放Template-->
<div style="display:none;">
	<div id="cPopup">
		<div class="sc-bridge-block">
			<br><br>
			<img class="scb-pic1" src="./選擇支付方式_綠界科技_files/loading_allpay.png" alt="loading">
			<img class="scb-pic2" src="./選擇支付方式_綠界科技_files/loading.gif" alt="loading">
		</div>
		<div class="content-txt-wrap ctw-center">
			交易資料傳輸中… <br>
			請勿關閉視窗，以避免交易失敗！<br>
			Transaction data processing… DO NOT refresh or close the webpage.
			
		</div>
	</div>
</div>

<form action="https://payment-stage.ecpay.com.tw/Cashier/RetainPaymentType" id="PayForm" method="post"><input id="TradeAmount" name="TradeAmount" type="hidden" value="1000"> <input type="hidden" name="timeStamp" value="1666837068"> <input type="hidden" name="merchantId" id="merchantId" value="888888888"> <input type="hidden" name="merchantTradeNo" value="2210271016559668"> <input type="hidden" name="tradeType" value="aio"> <input type="hidden" name="mid" value="73cdcf780bcfb473e9078278d570c012"> <input type="hidden" name="allPayTradeID" value="2891175"> <input type="hidden" name="macValue" value="17c6d1e150bdec90b0fdea209ec15fc6"> <input type="hidden" name="PayerName" value="曾韻儒"> <input type="hidden" name="PayerCellPhone" value="0918316990"> <input type="hidden" name="IsBindingCredit" id="IsBindingCredit"> <input type="hidden" name="SetBindingCredit" id="SetBindingCredit"> <input type="hidden" name="paymentName" id="paymentName"> <input type="hidden" name="TradeTotalAMT" id="TradeTotalAMT" value="1000"> <input type="hidden" name="CardNo" id="CardNo" value="0"> <input type="hidden" name="CardValidMM" id="CardValidMM" value="0"> <input type="hidden" name="CardValidYY" id="CardValidYY" value="0"> <input type="hidden" name="CardAuthCode" id="CardAuthCode" value="0"> <input type="hidden" name="CreditCardID" id="CreditCardID" value="0"> <input type="hidden" name="TradeInstmt" id="TradeInstmt"> <input type="hidden" name="InstallmentAmount" id="InstallmentAmount"> <input type="hidden" name="Redeem" id="Redeem" value="0"> <input type="hidden" name="ChoosePayment" id="ChoosePayment" value="ALL"> <input type="hidden" name="CellPhone" id="CellPhone" value="0918316990"> <input type="hidden" name="UnionPay" id="UnionPay" value="0"> <input type="hidden" name="Remark" id="Remark"> <input type="hidden" name="CardHolder" id="CardHolder" value="曾韻儒"> <input type="hidden" name="PlatformID"> <input type="hidden" name="AllPayID"> <input type="hidden" name="AccountID"> <input type="hidden" name="IngronAuth"> <input type="hidden" name="EnableMobileServerCall"> <input type="hidden" name="EnableWebServerCall"> <input type="hidden" name="BankCode" id="BankCode"> <input type="hidden" name="Language" value="t"> <input type="hidden" name="paymentMethodToken" id="paymentMethodToken"> <input type="hidden" name="Email" id="Email" value="yunru29@gmail.com"> <input type="hidden" name="CountryCode" id="CountryCode" value="158"> <input type="hidden" name="ZipCode" id="ZipCode"> <input type="hidden" name="AreaID" id="AreaID"> <input type="hidden" name="Address" id="Address" value=""> <input type="hidden" name="IsRecord" id="IsRecord"> <input type="hidden" name="PreAddress" id="PreAddress"> <input type="hidden" name="BinCode" id="BinCode" value=""> <input type="hidden" name="BuyerTradeInstmt" id="BuyerTradeInstmt" value="12"> <input type="hidden" name="ParentPaymentType" id="ParentPaymentType" value="10000"> <input type="hidden" name="ParentInstallment" id="ParentInstallment" value=""> <input type="hidden" name="InvoiceType" id="InvoiceType" value="1"> <input type="hidden" name="InvoiceCarriersType" id="InvoiceCarriersType" value="1"> <input type="hidden" name="InvoiceCarriersNum" id="InvoiceCarriersNum"> <input type="hidden" name="InvoiceDonateCode" id="InvoiceDonateCode"> <input type="hidden" name="InvoicePrint" id="InvoicePrint"> <input type="hidden" name="InvoiceName" id="InvoiceName"> <input type="hidden" name="InvoiceUnifiedBusinessNo" id="InvoiceUnifiedBusinessNo"> <input type="hidden" name="InvoicePhone" id="InvoicePhone"> <input type="hidden" name="InvoiceEmail" id="InvoiceEmail"> <input type="hidden" name="InvoiceCountryCode" id="InvoiceCountryCode" value="158"> <input type="hidden" name="InvoiceAddress" id="InvoiceAddress"> <input type="hidden" name="Method" id="Method"></form>
    </div>
    <!-- site-body 內容  end -->
    <!-- footer start -->
<footer class="footer2">
	<div class="footer-content">
        <div class="certificate">
            <img src="./選擇支付方式_綠界科技_files/sectigo_trust_seal_md.png" class="ctf-img" alt="SSL Certificates">
            <p class="ctf-txt">SSL Certificate</p>
        </div>
		<div class="footer-logo">
			<a href="https://www.ecpay.com.tw/" title="綠界科技 ECPay">
				<img src="./選擇支付方式_綠界科技_files/eclogo_w.svg" alt="綠界科技 ECPay">
			</a>
		</div>
		<div class="copyright">
			<p>Copyright © 1996-2022 Green World FinTech Service Co., Ltd. All rights reserved.</p>
		</div>
	</div>
</footer>

    <!-- footer end -->

    <div class="white-overlay"></div><!-- 白色遮罩 -->
    <!-- 回頂部 -->
    <a href="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut#" class="scrollToTop visible"><span class="icon-ctrl t-icon"></span></a>
    <!--JS-->
	<script src="./選擇支付方式_綠界科技_files/jquery"></script>

	<script src="./選擇支付方式_綠界科技_files/magnific-popup"></script>

	<script src="./選擇支付方式_綠界科技_files/common"></script>



	

    <!--共用資料-->

	<script id="ECPayData" type="application/json">
        {"TradeTotalAMT":1000,"CurrentDomain":"https://payment-stage.ecpay.com.tw","isStage":true,"isLogin":"N","IsGwBuyer":true,"BarcodeChargeFee":0,"CVSChargeFee":0,"IsMobileAgent":false,"Language":"t"}
	</script>
	<script id="LangData" type="application/json">
        {"前往":"前往 Go to payment","立即付款":"立即付款 Pay now","其他金融機構":"其他金融機構","提醒您若您使用其他金融機構進行轉帳可至任一銀行之櫃員機操作另須支付跨行手續費15元":"提醒您！若您使用其他金融機構進行轉帳，可至任一銀行之櫃員機操作，另須支付跨行手續費 15 元。","請選取ATM銀行":"請選取ATM銀行。","請選取WebATM銀行":"請選取WebATM銀行。","本公司不接受國外信用卡交易請重新輸入非國外卡的信用卡卡號":"本公司不接受非台灣發行之信用卡交易，請重新輸入台灣發行之信用卡卡卡號。 The company does not accept credit card issued outside of Taiwan. Please enter credit card number issued in Taiwan.","台灣手機號碼請直接輸入手機區碼09例如0937123456謝謝":"台灣手機號碼請直接輸入手機區碼「09」例如：0937123456，謝謝","關閉":"關閉 Turn off","如欲清除留存卡號資料需完成此筆訂單交易後下次進入付款頁將不再顯示卡號資料":"如欲清除留存卡號資料，需完成此筆訂單交易後，下次進入付款頁將不再顯示卡號資料\u003cbr/\u003e If you clear credit card number information left in the system, after this transaction is completed, credit card information will not be shown next time when you enter payment page again.","您目前正在使用的是綠界科技的付款測試環境請消費者勿進行相關的付款動作以免影響權益":"您目前正在使用的是綠界科技的付款測試環境，請消費者勿進行相關的付款動作，以免影響權益！","您確定使用信用卡支付此筆訂單金額新台幣":"您確定使用信用卡，支付此筆訂單金額(新台幣)\u003cbr/\u003eYou have confirmed to pay for the order with this credt card in the amount of (NTD):","抱歉您的瀏覽器不支援GooglePay付款":"抱歉，您的瀏覽器不支援GooglePay付款!","請使用GooglePay綁定信用卡":"請使用Google Pay綁定信用卡","綠界科技貼心提醒您將跳轉至銀行頁面進行後續付款":"綠界科技貼心提醒您，將跳轉至銀行頁面進行後續付款!","取消":"取消 Cancel","確定":"確定 Confirm","信用卡卡片有效期限錯誤或已過期":"信用卡卡片有效期限錯誤或已過期，請點選變更卡號重新編輯後再付款。\u003cbr/\u003e\r\nValid thru date has expired or incorrect, please click tap \"Change card detail\"  to purchase.","更多":"更多","收合":"收合","持卡人資料有誤請點選變更卡號重新編輯後再付款":"持卡人資料有誤，請點選變更卡號重新編輯後再付款。\u003cbr/\u003e\r\nCardholder Information incorrect, please click tap \"Change card detail\" to purchase.","選填":"選填","若刷卡驗證採簡訊驗證簡訊將發送至您於發卡銀行留存的手機號碼":"若刷卡驗證採簡訊驗證，簡訊將發送至您於發卡銀行留存的手機號碼 If the credit card transaction adopts message verification, the message will be sent to the cell phone number left to your issuing bank.","若刷卡驗證採簡訊驗證系統將發送OTP密碼至您填寫的手機號碼":"若刷卡驗證採簡訊驗證，系統將發送OTP密碼至您填寫的手機號碼 If the credit card transaction adopts message verification, the system will send OTP password to the cell phone number you have entered.","僅供綠界科技備查及交易糾紛爭議使用非台灣手機號碼請加國碼":"僅供綠界科技備查及交易糾紛爭議使用，非台灣手機號碼請加國碼(如香港為852請輸入852123456789) For ECPay record and transaction disputes use only. Please add country code for cell phone number outside of Taiwan. (Ex. If your country is United States, the country code is 1. Please enter 1123456789.)","如欲接收此筆交易付款通知請輸入電子信箱":"如您有輸入電子信箱，後續將依據商店設定發送交易付款通知。The payment notification will according to the merchant’s setting and sent to this email.","建議填寫帳單地址以加速交易驗證流程":"建議填寫帳單地址以加速交易驗證流程 It is recommended to fill in the billing address to speed up the transaction verification process.","以上為範例說明僅供參考實際繳款金額悉依永豐銀行之信用卡對帳單為準":"※以上為範例說明僅供參考。實際繳款金額悉依商店商業商議條件及永豐銀行之信用卡對帳單為準。The above example is for reference only. The actual payment amount is subject to the commercial negotiation conditions of the  merchant credit and the card statement of SinoPac Bank.","圓夢範例":"小明在ECShop購買一隻30,000元的手機，並使用圓夢彈性分期付款，則小明前1~10期每期需支付300 元，後20期，每期需支付1,350元。If Xiao Ming purchased a NTD$30,000 mobile phone at ECShop and choosed the flexible installment payment method, he will need to pay NTD$300 per installment for the first 1 to 10 installments, and NTD$1,350 per installment for the next 20 installments.","請勾選同意使用消費自費分期服務說明":"請勾選同意使用消費自費分期服務說明。 Please mark the checkbox for the description on agreeing to use the service of Installment With Extra Fee."}
	</script>


	<script src="./選擇支付方式_綠界科技_files/vue"></script>

	<script src="./選擇支付方式_綠界科技_files/aio"></script>

	<script src="./選擇支付方式_綠界科技_files/_action"></script>


	

    <!--Google Analytics-->
    <script language="javascript" type="text/javascript">
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
     m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-71320942-1', 'auto');
        ga('require', 'displayfeatures');
        ga('send', 'pageview');

    </script>




</body></html>
</html>