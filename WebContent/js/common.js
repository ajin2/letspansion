document.write('<script type="text/javascript" src="js/modify.js"></script>');	// 함수 리스트 호출
document.write(
"<!--[if lte IE 9]>"
+ "<script type='text/javascript' src='//cdnjs.cloudflare.com/ajax/libs/jquery-ajaxtransport-xdomainrequest/1.0.3/jquery.xdomainrequest.min.js'></script>" +
"<![endif]-->"
);

function fullPage(e){
$('#fullpage').fullpage({
	scrollingSpeed:900,
	navigation:true,
	slidesNavigation:true,
	navigationPosition:'right'
});
}		

$(document).ready(function(){
var ie = getInternetExplorerVersion();
if(ie == 8){alert("익스플로러 최신버전 업데이트를 권장합니다.");bug();}
//window
var dht = $(window).height();
var dwh = $(window).width();
	
//gnb
$(".gnb > ul > li").hover(function(){
	$(this).addClass("active");
	$(this).find("a").addClass("active");
	$(this).find("ul").slideDown(350);
},function(){
	$(this).removeClass("active");
	$(this).find("a").removeClass("active");
	$(this).find("ul").stop().slideUp(300);
});
//sns
$(".logon > ul > li").hover(function(){
	$(this).addClass("active");
	$(this).find("a").addClass("active");
	$(this).find("ul").slideDown(350);
},function(){
	$(this).removeClass("active");
	$(this).find("a").removeClass("active");
	$(this).find("ul").stop().slideUp(300);
});

//scroll
function play(){$('.scroll a img').animate({'top':"22px"},500,"swing").animate({'top':"12px"},500,"swing",play);}
function stop(){$('.scroll a img').stop(true,false).animate({'top':"12px"},500,"swing");}

$(".scroll a").hover(function(){play();
},function(){stop();});


//index
if($("body").is("#index") == true){
	function play_(){$('.mov_btn a img').animate({'top':"45px"},500,"swing").animate({'top':"37px"},500,"swing",play_);}
	function stop_(){$('.mov_btn a img').stop(true,false).animate({'top':"37px"},500,"swing");}
	$(".mov_txt img").delay(500).animate({"bottom":"0"},1200,"swing");
	$(".mov_btn a").delay(500).animate({"top":"0"},1200,"swing",function(){$(".mov_btn a img").fadeIn(500);});
	$(".mov_btn a").hover(function(){$(".scroll a").stop(true,false).animate({"bottom":"-55px"},350,"swing"); play_();
	},function(){$(".scroll a").animate({"left":"10px"},350,"swing"); stop_();});
	
	
	
		
//video
}else if($("body > div").is("#youtube") == true){
	$(".youtube").css("height",dht);

//villas_preview
}else if($("body").is("#villas_preview") == true){	
	$(window).scroll(function(){
			var this_ = $(document).scrollTop();
			var video = document.getElementById("myVideo");
			if(this_ === 0 || this_ < 10) video.play();
			else video.pause();
		});
		$(".villas_mov .scroll a").click(function(){
			var sht = $(window).height();
			$("html,body").stop().animate({scrollTop:sht},500); 
			
			return false;
		});
		
		$(".vpreview ul li").css("height",dht / 2);
		$(".vpreview ul li a").hover(function(){
			$(this).parent("li").find(".bg_3").stop().animate({"opacity":"0.3"},200);
			$(this).parent("li").find("div").css({
				"-moz-transform": "scale(1.1)",
				"-webkit-transform": "scale(1.1)",
				"-o-transform": "scale(1.1)",
				"-ms-transform": "scale(1.1)",
				"transform": "scale(1.1)"});
		},function(){
			$(this).parent("li").find(".bg_3").stop().animate({"opacity":"1"},200);
			$(".vpreview ul li div").css({
				"-moz-transform": "scale(1)",
				"-webkit-transform": "scale(1)",
				"-o-transform": "scale(1)",
				"-ms-transform": "scale(1)",
				"transform": "scale(1)"});
		});
		
		$(".villas_mov").css("height",dht);
		$(".vpreview").css("top",dht);
//villas
}else if($("body").is("#villas") == true){
	var val = location.href.substr(location.href.lastIndexOf('=') + 1);
		val = val.slice(-7, -5);
		val = val - 0;
		val = val - 1;
		
	if(val == (val)){
		var nums = location.href.substr(location.href.lastIndexOf('=') + 1);
		var nums = nums.slice(-7, -5); $("body").addClass("villas_" + nums);
		
		$(".villa_info_btn").append('<a href="#"><img src="http://gonylab3.speedgabia.com/privateus7/img/images/villa/villa_'+ nums +'_btn.png" alt="" width="380" height="200" /></a>');
		$(".villa_info > div").prepend("<h3>" + room_ttl[val] + "<span>- " + room_s_ttl[val] + " -</span></h3><ul class='check_info'></ul><ul class='reserve_btns'></ul>");
		for(key in room_infos[val]){
			brs = room_infos[val][key].replace(/\n/g, "<br />");	//정규식으로 단락나누기
			$(".check_info").append("<li><span>" + key + ' : </span><b>' + brs + "</b></li>");
		}
		
		$(".villa_info").append('<a href="#" class="close"><img src="http://gonylab3.speedgabia.com/privateus7/img/images/villa/close.png" alt="" width="50" height="50" /></a>');
		$(".villa_info > div").css({"margin-top":$(".villa_info > div").height() / -2, "margin-left":$(".villa_info > div").width() / -2});
		$(".reserve_btns").prepend("<li class='rtvn'><a href='reserve.html?reserve=tab01'>실시간예약</a></li><li class='rgvn'><a href='reserve.html?reserve=tab02'>예약안내</a></li>");
	}
	
	$(".villa_info_btn a").click(function(){
		$(".villa_info").stop(true,true).animate({"bottom":"0px"},250);
		$(".villa_info_btn").animate({"bottom":"-390px"},250);
		$(".villa_info > div").addClass("on");
			
		return false;
	});

	$(".close").click(function(){
		$(".villa_info").stop(true,true).animate({"bottom":"-100%"},250);
		$(".villa_info_btn").animate({"bottom":"30px"},250);
		$(".villa_info > div").removeClass("on");
		
		return false;
	});
	$(".check_info li").eq(0).find("span").css("display","block");
	$(".check_info li span,.check_txt li span").css("font-weight","bold");
	
//special
}else if($("body").is("#spc_preview") == true){
	$("#spc_preview .spreview ul li").css("height",dht / 2);
	$(".spreview ul li a").hover(function(){
		$(this).parent("li").find(".bg_3").stop().animate({"opacity":"0.3"},200);
		$(this).parent("li").find("div").css({
			"-moz-transform": "scale(1.1)",
			"-webkit-transform": "scale(1.1)",
			"-o-transform": "scale(1.1)",
			"-ms-transform": "scale(1.1)",
			"transform": "scale(1.1)"});
	},function(){
		$(this).parent("li").find(".bg_3").stop().animate({"opacity":"1"},200);
		$(".spreview ul li div").css({
			"-moz-transform": "scale(1)",
			"-webkit-transform": "scale(1)",
			"-o-transform": "scale(1)",
			"-ms-transform": "scale(1)",
			"transform": "scale(1)"});
	});	
	
//special
}else if($("body").is("#special") == true){	
	var val = location.href.substr(location.href.lastIndexOf('=') + 1);
		val = val.slice(-7, -5);
		val = val - 0;
		val = val - 1;
		
	if(val == (val)){
		var nums = location.href.substr(location.href.lastIndexOf('=') + 1);
		var nums = nums.slice(-7, -5); $("body").addClass("special_" + nums);
	
		$(".special_" + nums + " .special_info_btn a").append("<img src='http://gonylab3.speedgabia.com/privateus7/img/images/special/special_btn_"+ nums +".png' alt='"+ special_k_ttl[val] +"' />");
		stxt = special_txt[val].replace(/\n/g, "<br />");	//정규식으로 단락나누기
		
		$(".special_info > div").prepend("<h3>" + special_k_ttl[val] + "<span>- " + special_e_ttl[val] + " -</span></h3><p>" + stxt + "</p>");
	}
	
	$(".special_info > div").css({"margin-top":$(".special_info > div").height() / -2, "margin-left":$(".special_info > div").width() / -2});
	$(".special_info").append('<a href="#" class="close"><img src="http://gonylab3.speedgabia.com/privateus7/img/images/villa/close.png" alt="" width="50" height="50" /></a>');
	
	
	$(".special_info_btn a").click(function(){
		$(".special_info").stop(true,true).animate({"bottom":"0px"},250);
		$(".special_info_btn").animate({"bottom":"-210px"},250);
		$(".special_info > div").addClass("on");
			
		return false;
	});

	$(".close").click(function(){
		$(".special_info").stop(true,true).animate({"bottom":"-100%"},250);
		$(".special_info_btn").animate({"bottom":"30px"},250);
		$(".special_info > div").removeClass("on");
		
		return false;
	});
	
//reserve
}else if($("body").is("#reserve") == true){
	reserInfo(villa_Name);
	$("body#reserve .top_bg").css("height",dht / 10 * 6);
	
	$(window).scroll(function(){
		var this_ = $(document).scrollTop();
		var video = document.getElementById("myVideo");
		if(this_ === 0 || this_ < 100) video.play();
		else video.pause();
	});
	
	$(".snb li").click(function(){
		var idx = $(this).index();
		$(".snb li a").removeClass("active");
		$(this).find("a").addClass("active");
		if(idx == 0){
			$(".tab01").css("display","block");
			$(".tab02").css("display","none");
			$(".top_bg h3 span").text("실시간예약");
		}else{
			$(".tab01").css("display","none");
			$(".tab02").css("display","block");
			$(".top_bg h3 span").text("예약안내");
		}
		return false;
	});

}

//common
$(window).resize(function(){
var dht = $(window).height();
var dwh = $(window).width();
$(".youtube,.preview,.villas_mov").css("height",dht);
$(".vpreview").css("top",dht);
$(".vpreview ul li,.spreview ul li").css("height",dht / 2);
$("body#reserve .top_bg").css("height",dht / 10 * 6);
});
	
//footer
/*$("#footer .inner").append(
	"<address>" +
		"상호명:" + add01 + " / " +
		"대표자:" + add02 + " / " +
		"주소:" + add03 + " / " +
		"전화:" + add04 + "<br />" +
		"사업자번호:" + add05 + " / " +
		"통신판매업번호:" + add06 + " / " +
		"계좌번호:" + add07 + 
	"</address>"
);*/
});

function getInternetExplorerVersion() {    
var rv = -1; // Return value assumes failure.
if (navigator.appName == 'Microsoft Internet Explorer'){
	var ua = navigator.userAgent; 
	var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
	if (re.exec(ua) != null) rv = parseFloat(RegExp.$1);
}    
return rv; 
}