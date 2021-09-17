$(function () {
    
	function visual() {
		$(".visual").slick({
			infinite: true,
			speed: 500,
			autoplaySpeed: 5000,
			fade: true,
			slidesToShow: 1,
			slidesToScroll: 1,
			dots: true,
			appendDots: '.auto_box',
			arrows: true,
			prevArrow: $('.circle_wrap .prev'),
			nextArrow: $('.circle_wrap .next'),
			autoplay: true,
			pauseOnDotsHover: false,
			pauseOnHover: false,
            asNavFor: '.tit_slide'
			
            
		});

        $('.tit_slide').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            asNavFor: '.visual',
            arrows:false,
            focusOnSelect: true,
            vertical: true,
            cssEase: 'cubic-bezier(0.645, 0.045, 0.355, 1.000)',
			verticalWidth:true
		
          });



		var time = 0;
		var interval;
		var timeSet;
		var duration = 5;
        

        $(".visual .slick-slide").addClass("active");

		$(".visual").on('afterChange', function (event, slick, currentSlide, nextSlide) {
			time = 0;
			duration = 5;
			$(".bar").addClass('full_bar');
			$(".full_bar").css({
				'animation-duration': '5s',
			})
			timeSet = setInterval(function () {
				duration--;
			}, 1000)
            $(".visual .slick-slide").removeClass("active");
            $(".visual .slick-active").addClass("active");
		});
		$(".visual").on('beforeChange', function (event, slick, currentSlide, nextSlide) {
			$(".bar").removeClass('full_bar');
			clearInterval(timeSet);

		});

       

        $('.circle_wrap .slick-arrow').on('click', function () {
            clearInterval(interval);
			$(".full_bar").css({
				'animation-duration': duration + time + 's',
			})
			duration = duration + time;
			time = 0;
			$(".bar").removeClass("stop");
            $(".arr_button .stop").removeClass("on");
			$(".arr_button .play").addClass("on");
            $('.visual').slick('slickPause');
        });
   
		$('.arr_button .stop').on('click', function () {
			$('.visual').slick('slickPause');
			$(".arr_button .play").addClass("on");
			$(".arr_button .stop").removeClass("on");
			$(".bar").addClass("stop");
            $(this).parent().parent().removeClass("on");
			
            $('.circle_wrap .slick-arrow').addClass("on");
		});

		$('.arr_button .play').on('click', function () {
			$('.visual').slick('slickPlay');
			$(".arr_button .stop").addClass("on");
			$(".arr_button .play").removeClass("on");
            $(this).parent().parent().addClass("on");

            $('.circle_wrap .slick-arrow').removeClass("on");
			
            clearInterval(interval);
			$(".full_bar").css({
				'animation-duration': duration + time + 's',
			})
			duration = duration + time;
			time = 0;
			$(".bar").removeClass("stop");
		});

	}

    function animation() {
		if($(window).width() > 1200){
			$('body').addClass('main_ani');
		}else {
			$('body').removeClass('main_ani');
            $('body').removeClass('ani');
		}

	}


    
        visual();
        animation(); 
        $(window).resize(function(){animation()}); 



});
