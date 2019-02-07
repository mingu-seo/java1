<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/kcp/cfg/site_conf_inc.jsp" %>
<script type="text/javascript" src="<%= g_conf_js_url %>"></script>
	<div id="footer">
		<div class="size">
			<div class="inner">					
				<div class="address">
					<div class="f_logo">
						<a href="#;"><img class="footer_logo" src="/img/logofooter.png"></a>
					</div>
					<ul>
						<li>
							<span class="c_name">MOVIE</span>
						</li>
						<li>
							<span>경기도 고양시 일산동구 더조은컴퓨터학원</span>
							<span class="width100">Tel  :  031-111-2222</span>
						</li>
						<li>
							<span>대표이사 : 서민구</span>
							<span>사업자등록번호 : 123-45-67890</span>
						</li>
					</ul>
					<div class="copy">
						Copyright 2019 movie. All Rights Reserved
					</div>
					<div class="util">
						<a href="#;">개인정보취급방침</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
function showDialogue(movie_no) {
<% if (memberInfo == null) { %>
	alert("로그인 후 예매해 주세요");

<% } else { %>
	$.ajax({
		url: "/ticket/ticket_form.do",
		data : {"no": movie_no},
		success : function(data) {
			$("#ticket_dialogue").html(data);
			cal();
			$("#tk_count").change(function() {
				cal();
			});
			$("input[name='format']").click(function(){
				cal();
			})
		}
	})
	
	var maskHeight = $(document).height(); 
	var maskWidth = $(window).width();

	$('#mask').css({'width':maskWidth,'height':maskHeight}); 
	$('#mask').fadeTo("fast",0.8);

	var t_dialog = $("#ticket_dialogue");
	t_dialog.css({
		'position': 'fixed',
		'left': '50%',
		'top': '50%'
		});
	t_dialog.css({
		'margin-left': -t_dialog.outerWidth() / 2 + 'px',
		'margin-top': -t_dialog.outerHeight() / 2 + 'px'
	});
	t_dialog.show();
	
<% } %>	
}

function hideDialogue() {
	$("#ticket_dialogue").hide();
	$("#mask").hide();
}
function jsf__pay()
{
    try
    {
    	if(confirm("예매 하시겠습니까?")){
    		// 상품명값(good_name)
    		if ($("input[name='format']:checked").val()=="1") {
    			$("#good_name").val($("#movie_title").val()+" (2D)");
    		} else if ($("input[name='format']:checked").val()=="2") {
    			$("#good_name").val($("#movie_title").val()+" (3D)");
    		} else if ($("input[name='format']:checked").val()=="3") {
    			$("#good_name").val($("#movie_title").val()+" (4D)");
    		} else if ($("input[name='format']:checked").val()=="4") {
    			$("#good_name").val($("#movie_title").val()+" (IMAX)");
    		}
    		
    		
    		if ($("input[name='pay']:checked").val()=="1") {	// 사용자가 결제방식을 무통장입금을 선택한 경우
    			$("#popupFrm").attr("action","book.do");
    			$("#popupFrm").submit();
    		} else if ($("input[name='pay']:checked").val()=="2") { // 그렇지 않고, 결제방식을 신용카드로 선택한 경우
        		init_orderid();
        		$("#popupFrm").attr("action","/kcp/sample/pp_cli_hub.jsp");
    			var frm = document.popupFrm;
    			KCP_Pay_Execute( frm );
    			//alert("신용카드");
    		}
    	}
    }
    catch (e)
    {
        /* IE 에서 결제 정상종료시 throw로 스크립트 종료 */ 
    }
}        
function save(){
	
	if(confirm("예매 하시겠습니까?")){
		$("#popupFrm").submit();
	} 
	
}
function cal() {
	var tkcount = $("#tk_count").val();
	var format = $("input[name='format']:checked").val();
	var mypoint = $("#mypoint").val();
	mypoint=Number(mypoint);
	var usePoint = $("#usePoint").val();
	usePoint = Number(usePoint);
	
	if(usePoint>mypoint) {
		alert("사용 가능한 포인트는 최대 " + mypoint + "입니다.");
		
		usePoint = 0;
	}
	//console.log(tkcount);
	//console.log(format);
	
	console.log(usePoint);
	console.log(mypoint);
	
	var formatPrice = 0;
	if (format == "1") {
		formatPrice = 10000;
	} else if (format == "2") {
		formatPrice = 12000;
	} else if (format == "3") {
		formatPrice = 14000;
	} else if (format == "4") {
		formatPrice = 16000;
	}
	
	var totalPrice = formatPrice * tkcount - usePoint;
	console.log(totalPrice);
	$(".totalPrice").html(numberWithCommas(totalPrice)+"원");
	$("#price").val(totalPrice);
	$("#good_mny").val(totalPrice);
}

function save() {
	if (confirm("예매하시겠습니까?")) {
		$("#popupFrm").submit();
	}
}

function m_Completepayment( FormOrJson, closeEvent ) 
{
    var frm = document.popupFrm; 
    GetField( frm, FormOrJson ); 
    if( frm.res_cd.value == "0000" ){
	    alert("결제 승인 요청 전,\n\n반드시 결제창에서 고객님이 결제 인증 완료 후\n\n리턴 받은 ordr_chk 와 업체 측 주문정보를\n\n다시 한번 검증 후 결제 승인 요청하시기 바랍니다."); //업체 연동 시 필수 확인 사항.
        frm.submit(); 
    } else {
        alert( "[" + frm.res_cd.value + "] " + frm.res_msg.value );
        closeEvent();
    }
}

/* 주문번호 생성 예제 */
function init_orderid()
{
    var today = new Date();
    var year  = today.getFullYear();
    var month = today.getMonth() + 1;
    var date  = today.getDate();
    var time  = today.getTime();

    if(parseInt(month) < 10) {
        month = "0" + month;
    }

    if(parseInt(date) < 10) {
        date = "0" + date;
    }

    var order_idxx = "TEST" + year + "" + month + "" + date + "" + time;

    document.popupFrm.ordr_idxx.value = order_idxx;            
}

</script>
<div id="ticket_dialogue" class="dialogue_wr popupContent">
</div>
<div id="mask"></div>