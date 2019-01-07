/*=====================================================================================
' namespace : Gnb                                      
' 기     능 : 상단 메뉴 정의 함수
'======================================================================================*/
Gnb = {

	seIndex : null,

	Load : function(i) {
		if( i != null) {
			$("#gnb .menu_list li").eq(i).children("a").children("img").attr("src", $("#gnb .menu_list li").eq(i).children("a").children("img").attr("src").replace(/_off/g, "_on"));
			$("#gnb .submenu").eq(i).slideDown(300);
		}
	},

    depth01: null,

    Init: function() {

        var lnbVal = $("#GnbCode").val();
        if(lnbVal != '' && lnbVal != null) {
            Gnb.depth01 = lnbVal.split(':')[0];
        }
        if(Gnb.depth01 != null) {

            $(".menu_list li img").attr("src", function() {
                var index = $(".menu_list li img").index(this);
                var src = null;
                if(index == Gnb.depth01) {
                    src = $(".menu_list li img").eq(index).attr("src").replace(/_off/g, "_on");
                }else{
                    src = $(".menu_list li img").eq(index).attr("src").replace(/_on/g, "_off");
                }
                return src
            });

            /*var ts = $(".lnb ul").children("li").eq(Lnb.depth01);
            if($(ts).children("ul").css("display") == 'none') {
                $(".lnb ul").children("li").children("ul").hide();
                $(ts).children("ul").slideDown(function() {
                    $(this).children("li").eq(Lnb.depth02).children("a").children("img").attr("src", function() {
                        return $(this).attr("src").replace(/_off/g, "_on");
                    });
                });
            } else {
                $(ts).children("ul").children("li").eq(Lnb.depth02).children("a").children("img").attr("src", function() {
                    return $(this).attr("src").replace(/_off/g, "_on");
                });
            }*/
        }

    },

    /*'=================================================================
    ' 함수명 : Gnb.CreateGnb()
    ' 기  능 : 상단 메뉴 이벤트 생성처리
    '================================================================*/
	CreateGnb: function() {

        Gnb.Init();

		//Gnb.Load(Gnb.seIndex);
		
		//1차 메뉴 효과
		$("#gnb .menu_list li").hover(function() {
			
			//MouseOver 모든 1차 메뉴 이미지 초기화
			$("#gnb .menu_list li").each(function(index) {
				$(this).children("a").children("img").attr("src", $(this).children("a").children("img").attr("src").replace(/_on/g, "_off"));
			});
			//MouseOver 모든 2차 메뉴 숨기기
			$("#gnb .submenu").hide();

			//MouseOver 해당 1차 메뉴 이미지변경, 2차 메뉴 보이기
			var index = $("#gnb .menu_list li").index(this);
			$(this).children("a").children("img").attr("src", $(this).children("a").children("img").attr("src").replace(/_off/g, "_on"));
			$("#gnb .submenu").eq(index).slideDown(300);

		}, function() {
			
			//1차메뉴 MouseOut
			var index = $("#gnb .menu_list li").index(this);
			if($("#gnb .submenu").eq(index).attr("display") == "none") {
				$(this).children("a").children("img").attr("src", $(this).children("a").children("img").attr("src").replace(/_on/g, "_off"));
			}
	
		});

		//2차 메뉴 이미지 롤오버
		$("#gnb .submenu ul li").hover(function() {
			var index = $("#gnb .submenu ul li").index(this);
			$(this).children("a").children("img").attr("src", function() {
				return $(this).attr("src").replace(/_off/g, "_on");
			});
		}, function() {
			$(this).children("a").children("img").attr("src", function() {
				return $(this).attr("src").replace(/_on/g, "_off");
			});
		});


		//Gnb 빠져날올대 초기화 하기
		$("#gnb").hover(function() {
		}, function() {
			$("#gnb .menu_list li").each(function(index) {
				$(this).children("a").children("img").attr("src", $(this).children("a").children("img").attr("src").replace(/_on/g, "_off"));
			});
			$("#gnb .submenu").hide();

            Gnb.Init();
		});

		
	}
}
