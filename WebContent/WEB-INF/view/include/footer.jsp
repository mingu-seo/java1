<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<div id="footer">
		<div class="size">
			<div class="inner">					
				<div class="address">
					<div class="f_logo">
						<a href="#;"><img class="footer_logo" src="/img/logo.png"></a>
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
}
</script>
<div id="ticket_dialogue" class="dialogue_wr popupContent">
</div>
<div id="mask"></div>