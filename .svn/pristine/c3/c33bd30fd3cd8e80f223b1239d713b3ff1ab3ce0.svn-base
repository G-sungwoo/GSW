$(function () {
	var main_spd = 4000;
	var main_cnt = $(".login_img ul li").length;

	if (main_cnt > 1) main_auto = setInterval(main_play,main_spd);

	$(".login_img ol li a").click(function(){
		var idx = $(this).parent("li").index();
		main_change(idx, "");
	})

	function main_play(){
		main_change("", "");
	}

	function main_change(idx, pointer){
		var old_idx = "";
		var main_cnt = $(".login_img ul li").length;

		if ($(".login_img ul li").is(":animated")) return;

		if(main_cnt > 1) clearInterval(main_auto);

		if (idx == "" && idx != "0") idx = $(".login_img ol li a.on").parent("li").index() + 1;
		if (idx >= main_cnt ) idx = 0;
		if (idx < 0) idx = main_cnt - 1;

		$(".login_img ul li").css("display","block");
		$(".login_img ul li").stop(true,true).fadeOut(800);
		$(".login_img ul li:eq("+idx+")").stop(true,true).fadeIn(500);

		$(" .login_img ol li a.on").removeClass("on");
		$(" .login_img ol li a:eq("+idx+")").addClass("on");
		if(main_cnt > 1) main_auto = setInterval(main_play,main_spd);
	}
})