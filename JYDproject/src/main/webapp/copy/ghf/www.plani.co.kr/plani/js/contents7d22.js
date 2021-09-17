/**
 * #을 지운다.
 *
 * @param {string} href
 * @returns {string}
 */
function remove_hash(href) {
    return href.replace('#', '');
}

function experience_slider() {
    var $slider = $('.experience_slider');
    $slider.slick({
        infinite: true,
        slidesToShow:1,
        slidesToScroll: 1,
        dots: false,
        arrows: true,
        autoplay: true,
        autoplaySpeed: 3000,
        variableWidth:true,
        pauseOnDotsHover: false,
        pauseOnHover: true,
        focusOnSelect:true,
        cssEase: 'ease-out',
        prevArrow: $('.experience_slider_wrap .slider_btn .prev'),
        nextArrow: $('.experience_slider_wrap .slider_btn .next'),
        easing: 'ease',
        centerMode:true,
    });

    $(".program_sl").on('afterChange', function (event, slick, currentSlide, nextSlide) {
        $(".slick-slide").removeClass("focus");
        $(".slick-center").addClass("focus");
      });
    $(".slick-center").addClass("focus");
}

/**
 * 개발 코드와 연관이 있어서 코드 위치 변경함.
 *
 * 하단 실행부 코드에서 더 이상 호출되지 않음
 *
 * @location _modules/experience/views/experience/javascript/index.php
 */
function experience_tab() {
    $('.experience_tab > ul > li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('.experience_tab > ul > li').removeClass('active');
        $('.experience_contents > li').removeClass('active');

        $(this).addClass('active');
        $("#"+tab_id).addClass('active');

        return false;
    });
}

/**
 * 개발 코드와 연관이 있어서 코드 위치 변경함.
 *
 * 하단 실행부 코드에서 더 이상 호출되지 않음
 *
 * @location _modules/experience/views/experience/javascript/index.php
 */
function experience_contents() {
    $('.toggle_list .title').on('click',function(e){
        e.preventDefault();
        $(".toggle_list .title").next(".toggle_contents").slideUp();
        $(".toggle_list .title").parent().removeClass("active");

        if($(this).next(".toggle_contents").is(":hidden")){
            $(this).parent().addClass("active");
            $(this).next(".toggle_contents").slideDown();
        }else{
            $(this).parent().removeClass("active");
            $(this).next(".toggle_contents").slideUp();

        }

    });
}

function news_slider() {
    $('.news_slider').slick({
        vertical: true,
        verticalSwiping: true,
        autoplay: false,
        infinite: true,
        dots: true,
        appendDots:'.news_slider_dots',
        slidesToScroll: 1,
        slidesToShow:1,
        nextArrow: '.news_control .next',
        prevArrow: '.news_control .prev',
        autoplaySpeed: 2000,
        pauseOnHover: true,
        cssEase: 'ease-out',
        asNavFor: '.news_text_slider',
         responsive: [
            {
            breakpoint: 768,
            settings: {
                vertical: false,
                verticalSwiping: false,
                }
            }
        ]
    });


    //news_text_slider 
    $('.news_text_slider').slick({
        autoplay: false,
        slidesToScroll: 1,
        infinite: true,
        arrow: true,
        pauseOnHover: true,
        focusOnSelect:true,
        cssEase: 'ease-out',
        appendDots:'.news_slider_dots',
        nextArrow: '.news_control .next',
        prevArrow: '.news_control .prev',
        asNavFor: '.news_slider',
    });

}


// news
function news_page() {
    
    if ( window.location.pathname == '/news' ) {
        var root = document.documentElement;
        root.className += 'news_page';

        $('.logo a').children('img').attr('src','/plani/images/layout/logo_white.svg');

        if($('#header').hasClass('scrolled') === true) {
            $('.logo a').children('img').attr('src','/plani/images/layout/logo.svg');
        } else {
            $('.logo a').children('img').attr('src','/plani/images/layout/logo_white.svg');
        }
    }
}


function welfare_list() {
    $('.welfare_list .welfare_contents').on('click',function(){
        $(this).closest('li').toggleClass('active').siblings().removeClass('active');
        return false;
    });
}

var history_position = [];
function content_tab() {
    var parent = $('#branding');

    // branding 페이지가 아니면 실행하지 않도록 한다.
    // 왤까? brandingMenu가 모바일 메뉴를 건들긴 하지만
    // preventDefault 혹은 return false로
    // 이벤트를 막는 코드는 딱히 보이지 않는데...
    if (parent.length === 0) {
        return;
    }

    var btn = parent.find('.branding_tab > .tab_inner > a');
    var obj = parent.find('.branding_content .branding_story');
    var brandingMenu = $('.mobile_menu > ul > li > a').filter('.on').next();

    // 맨 처음 페이지가 보여지는 경우
    // 스크롤 이벤트 막기 위한 flag
    var isFirst = true;

    btn.on('click', function (event) {
        event.preventDefault();

        var t = $(this);
        var href = t.attr('href');

        btn.removeClass('on');
        t.addClass('on');

        // branding 현재 클릭된 메뉴와
        // 햄버거 메뉴 표시 동기화
        brandingMenu
            .find('a')
            .removeClass('on')
            .filter(function () {
                return $(this).attr('href').indexOf(remove_hash(href)) >= 0;
            })
            .addClass('on');

        var targetObj = obj.stop(1, 0).hide().filter(href);
        targetObj.stop(1, 0).fadeIn();

        if (isFirst) {
            isFirst = false;
            return;
        }

        var offset = targetObj.offset();

        $('html').stop().delay(200).animate({scrollTop : offset.top - $('#header').height() + $('.this').height()}, 600);

        // 페이지 보일때
        if (href === '#history') {
            history_position = re_size_content_tab();
            $('div.history_tab a.on').trigger('click');
        }

        // $('.space_slide').slick('setPosition');
        // $('.space_slide').slick('reInit');
    });

    /**
     * 햄버거 메뉴 Branding 항목에서
     * 다른 섹션을 클릭했을 때,
     * 현재 페이지가 Branding 페이지인 경우
     * 해당 링크들을 preventDefault 처리하여 이동하지 않게 하고,
     * 탭을 클릭한 것과 똑같은 효과로 동작하도록 하게 한다.
     */
    var $allMenu = $('.all_menu');
    brandingMenu.on('click', 'a', function (e) {
        e.preventDefault();

        var clickedBranding = $(this).attr('href');

        btn.each(function () {
            var $this = $(this);
            var targetBranding = remove_hash($this.attr('href'));

            if (clickedBranding.indexOf(targetBranding) < 0) {
                return; // continue
            }

            $allMenu.trigger('menu:close');
            $this.trigger('click');

            return false; // break
        })
    });
}

function mousescroll (){
 
    $(".scroll_wrap").on("mousewheel scroll", function(e){
        var ele_top = $(this).offset().top;
        $('.history_divide').removeClass('on');

        var history_tab_target_id = '';

        $('.history_divide').each(function(){
            var elementTop = $(this).offset().top,
              elementHeight = $(this).outerHeight();

            var gap = (ele_top - elementTop);
            if( Math.abs(gap) <= (elementHeight/2) ){
                $(this).addClass('on');
                history_tab_target_id = $(this).closest('div.divide_wrap').attr('id');
                return false;
            }
        });
  
        if(e.type=='mousewheel') {
            var history_tab_el = $('div.history_tab a[data-target-id="' + history_tab_target_id + '"]');
            history_tab_el.addClass('on');
            history_tab_el.siblings().removeClass('on');

            var history_img_el = $('div.history_img[data-target-id="' + history_tab_target_id + '"]');
            history_img_el.addClass('on');
            history_img_el.siblings().removeClass('on');
        }
    });
}

function history_tab_event (){
    $('div.history_tab a').on('click',function(e){
        e.preventDefault();
        var target_id = $(this).data('target-id');

        // if($(this).hasClass('on')){
        //     return false;
        // }

        $(this).siblings().removeClass('on');
        $(this).addClass('on');

        $('div.history_img').removeClass('on');
        $('div.history_img[data-target-id="'+target_id+'"]').addClass('on');

        
        $('.scroll_wrap .divide_wrap').removeClass('on');
        $('.scroll_wrap .divide_wrap[data-target-id="'+target_id+'"]').addClass('on');

        // 스크롤 이벤트
        var target_el = $('#'+target_id);
        if(target_el[0]!==undefined) {
            $('.scroll_wrap').animate({
                scrollTop: history_position[target_id]
            }, 500)
        }
          

    })
}

function re_size_content_tab() {
    // 첫 스크롤 영역 크기 다시 계산...
    $('div.divide_wrap').each(function (index, item) {
        history_position[$(this).attr('id')] = $(this).position().top;
    })
    var history_position_new = [];
    Object.keys(history_position).forEach(function (item, index) {
        var now_top = history_position[item];
        if (history_position['history01'] < 0) {
            history_position_new[item] = now_top + Math.abs(history_position['history01']);
        }
    })
    if (history_position['history01'] < 0) {
        history_position = history_position_new;
    }

    return history_position;

}

    $(window).resize(function(e){
        if(window.innerWidth > 768) {
            if(!$('.space_slide').hasClass('slick-initialized')){
                mobileOnlySlider();
            }

        }else{
            if($('.space_slide').hasClass('slick-initialized')){
                $('.space_slide').slick('unslick');
            }
        }
    });
    function mobileOnlySlider () {
    $ ( '.space_slide').slick ({
        autoplay: false,
                infinite: false,
                dots: false,
                slidesToScroll: 1,
                slidesToShow:1,
                autoplay:true,
                nextArrow: '.space_slide_arr .next',
                prevArrow: '.space_slide_arr .prev',
                autoplaySpeed: 2000,
                pauseOnHover: true,
                variableWidth: true,
                cssEase: 'ease-out',
                easing: 'ease',
        });
    }
   
/**
 * Branding 페이지에 진입했을 때, url에 tab query string이 있는 경우
 * 해당 query string 값을 href로 갖고 있는 링크 태그의 클릭 이벤트를 트리거하여
 * 바로 보여지도록 한다.
 *
 * 햄버거 메뉴에 있는 Branding의 각 섹션에 해당하는 2차 메뉴들은
 * CMS에서 외부링크로 지정된 메뉴들인데,
 * 이 링크값에 ?tab= 형식의 query string이 지정되어 있어야 한다.
 */
function branding_init() {
    var $branding = $('#branding');
    if ($branding.length === 0) {
        return;
    }

    var $menus = $branding.find('.branding_tab > .tab_inner > a');

    // 브라우저 reflow 문제가 있는 듯 하므로
    // 적당히 setTimeout으로 10ms 지연 시킨 뒤 실행시키도록 하자.
    setTimeout(function () {
        var $target = $menus.filter(function () {
            var href = remove_hash($(this).attr('href'));

            return location.href.indexOf(href) >= 0;
        });

        // ?tab= 이 없는 경우
        // 첫번째 탭 트리거
        if ($target.length === 0) {
            $target = $menus.eq(0);
        }

        $target.trigger('click');
    }, 10);

    /**
     * 메뉴 클릭시 컨테이너를 해당 메뉴 위치에 적절하게 스크롤한다.
     * 모바일에서만 동작하게 한다.
     */
    $menus.on('click', function () {
        if (window.innerWidth > 768) {
            return;
        }

        var $this = $(this);
        var $parent = $this.parent();

        var currentLeft = $this.position().left;
        var leftPadding = 20;
        var target = $parent[0].scrollLeft + currentLeft - leftPadding;

        $parent.animate({
            scrollLeft: target
        }, 500);
    });
}

// news

$(window).resize(function(e){
    if(window.innerWidth < 487) {
        if(!$('.worth_list').hasClass('slick-initialized')){
            worth_list();
        }

    }else{
        if($('.worth_list').hasClass('slick-initialized')){

            $('.worth_list').slick('unslick');
        }
    }
});

function worth_list(){
    var $status = $('.paging');
		var $slickElement = $('.worth_list');

		$slickElement.on('init reInit afterChange', function (event, slick, currentSlide) {
			var i = (currentSlide ? currentSlide : 0) + 1;
			var i_num = i;
			var slick_count_num =  slick.slideCount;

			$status.html('<strong>' + i_num + '</strong>' + '<i>' + '</i>' + '<span>' + slick_count_num + '</span>');

	});

    $ ( '.worth_list').slick ({
        autoplay: false,
        infinite: true,
        dots: false,
        slidesToScroll: 1,
        slidesToShow:1,
        nextArrow: '.worth .page_navi_next',
        prevArrow: '.worth .page_navi_prev',
        autoplaySpeed: 2000,
        pauseOnHover: true,
        // centerMode:true,
        // variableWidth:true,
        cssEase: 'ease-out',
        easing: 'ease',
        
    });


}


function history_tab() {
    if ($('#branding').length === 0) {
        return;
    }

    $(window).scroll(function() {
        var headerHeight = $("#header").height();
        if ($(this).scrollTop() >= Math.ceil($('.histoty_wrap').offset().top - headerHeight)) {
            $(".history_tab").addClass("fixed");
        } else {
            $(".history_tab").removeClass("fixed");
        }
    });
}

//실행부
$(function(){
    experience_slider();
    news_slider();
    welfare_list();
    history_tab_event();
    content_tab();
    mousescroll();
    news_page();
    if (window.innerWidth > 768) {
        mobileOnlySlider ();
    }
    branding_init();
    
    if (window.innerWidth < 487) {
        worth_list();
    }
    history_tab();
    
    

    // $(window).resize(function(){
    //     history_position = re_size_content_tab();
    //     var parent = $('#branding');
    //     var btn_on = parent.find('.branding_tab > a.on');

    //     if(btn_on.attr('href')=='#history') {
    //         $('div.history_tab a.on').trigger('click');
    //     }

    // });
})
