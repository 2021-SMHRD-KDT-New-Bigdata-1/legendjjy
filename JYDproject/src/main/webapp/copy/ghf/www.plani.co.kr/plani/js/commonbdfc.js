$(function () {
	$("#wrap").prepend("<div class='blind'></div>");

	function mobile_menu() { //모바일 메뉴, 전체메뉴
		var dep1btn = $(".mobile_menu>ul>li>a");
		var dep1fbtn = $(".mobile_menu>ul>li:first>a");
		var dep2con = $(".mobile_menu>ul>li>div");
		var dep2btn = $(".mobile_menu>ul>li>div>ul>li>a");
		var dep3con = $(".mobile_menu>ul>li>div>ul>li>div");
		var speed = 300;
		var main_page_chek = true;
		var last_focus = $(".mobile_menu>ul>li:last>.sub>ul>li:last>.depth>ul>li:last");
		var all_btn = $(".all_menu");


		$('.mobile_menu ul li').find('a').each(function (index, item) {
			var has_class_chk = $(item).hasClass('on');

			if (has_class_chk === true) {
				main_page_chek = false;
				return false;
			}
		});

		dep1btn.each(function () {
			if (!$(this).next().length) {
				$(this).addClass("empty");
			}
		});
		dep2btn.each(function () {
			if ($(this).hasClass("on")) {
				$(this).closest("div").show();
				$(this).closest("div").prev("a").addClass("on");
			}
			if (!$(this).next().length) {
				$(this).addClass("empty");
			}
		});
		dep1btn.on("click", function () {
			if ($(this).next("div").is(":hidden")) {
				dep1btn.removeClass("on");
				dep2con.hide();

				$(this).addClass("on").next("div").show();
			}
			if ($(this).next("div").length) { //하위메뉴가 있을 경우에만 버튼효과 무시
				return false;
			}
		});
		dep2btn.on("click", function () {
			if ($(this).next("div").is(":hidden")) {
				dep2btn.removeClass("on");
				dep3con.hide();

				$(this).addClass("on").next("div").slideDown(speed);


			} else {
				$(this).removeClass("on").next("div").slideUp(speed);
			}
			if ($(this).next("div").length) {
				return false;
			}
		});



		last_focus.focusout(function () { //전체 메뉴 마지막 포커스 일때 닫기로 포커스 이동
			all_btn.focus();
		});

	}


	function allmenu() { //전체메뉴 버튼
		var all_btn = $('.all_menu');
		var allBox = $('.mobile_wrap');

		var nav_bg = $('.nav_bg');
		var nav = $('#gnb_wrap>#gnb>ul>li>a');

		var $body = $('body');
		var $header = $('#header');
		var $gnb = $('#gnb');

		all_btn.off();
		all_btn.on('menu:close', function () {
		    var $this = $(this);

			$this.removeClass('on');
			allBox.removeClass('on');

			$this.find('>span').text('전체메뉴 열기');

			$header.removeClass('on');

			$body.removeClass('on ov active');

			$gnb.show();
		});

		all_btn.on('menu:open', function () {
			var $this = $(this);

			$this.addClass('on');
			allBox.addClass('on');

			$this.find('>span').text('전체메뉴 닫기');
			$body.addClass('ov');
			$header.addClass('on');
			$gnb.hide();
		});

		all_btn.on('click', function () {
			var $this = $(this);

			var eventName = $this.hasClass('on')
				? 'menu:close'
				: 'menu:open';

			$this.trigger(eventName);
		});

		$('.blind').on('click', function () {
			$(this).fadeOut();

			allBox.removeClass('on');
			all_btn.removeClass('on');

			$body.removeClass('on active ov');
			$header.removeClass('on active');

			$gnb.show();
		});
	}





	function scrollbar() { //스크롤바 커스텀
		$('.mobile_wrap .layout').mCustomScrollbar({});

	}

	function select() { //셀렉트 박스 커스텀
		$(".select_box .select").click(function () {
			var bt = $(this);
			var adDiv = bt.next("ul");

			if (adDiv.is(":hidden")) {
				adDiv.slideDown();
				bt.addClass("on");
			} else {
				adDiv.slideUp();
				bt.removeClass("on");
			}
		});
	}

	function topBtn() { //상단 탑 이동
		var btn = $(".page_topBtn>a");
		var headerH = $("#header").height();
		btn.parent().hide();

		$(document).on("scroll", function () {

			var scr = $(document).scrollTop();
			if (scr > headerH) {
				btn.parent().fadeIn(300, 'easeOutCubic');
			} else {
				btn.parent().fadeOut(300, 'easeOutCubic');
			}
		});

		btn.on("click", function () {
			$('html, body').animate({
				scrollTop: 0
			}, 400);

			return false;
		});
	}

	function headerfixed() { //헤더고정
		$(window).on("scroll", function () {
			var height = $("#header").height();
			var scroll = $(window).scrollTop();
			if (scroll >= height) {
				$("#header").addClass("scrolled");
			} else {
				$("#header").removeClass("scrolled");
			}
		});

	}

    

	mobile_menu(); //모바일 메뉴	
	allmenu(); //전체메뉴
	scrollbar();
	select(); //셀렉트 박스
	topBtn(); //상단 탑 이동
	headerfixed();//헤더고정

});
