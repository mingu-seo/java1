// 댓글 부분 포커스일때 텍스트 삭제
function focusTextRemove(obj){
	var str = '';
	var name = jQuery(obj).attr("name");
	var val = jQuery(obj).val();
	
	if(name == "name") {
		str = "이름";
		if (str == val) {
			jQuery(obj).val("");
			return; 
		}else{
			return;
		}
	}else if(name == "password_temp") {
		str = "비밀번호";
		if (str == val) {
			jQuery(obj).css("display","none");
			jQuery(obj).parent().find("#password").remove();
			jQuery(obj).parent().append("<input type='password' name='password' id='password' class='focus_zone' title='비밀번호를 입력해주세요'>");
			jQuery("#password").bind("blur",function(){
				blurTextInsert(this);
			});
			jQuery("#password").focus();
			return; 
		}else{
			return;
		}
	}
}

// 댓글 부분 포커스잃었을때 텍스트 삽입
function blurTextInsert(obj){
	
	var str = '';
	var name = jQuery(obj).attr("name");
	if (jQuery(obj).val() == "") {
		if (name == "name") {
			str = "이름";
		}else if (name == "password") {
			jQuery(obj).remove();
			jQuery(obj).val("");
			jQuery("#password_temp").css("display","block");
		}
	}else{
		
		str = jQuery(obj).val();
		
	}
	jQuery(obj).val(str);
}

// 댓글 부분 포커스일때 텍스트 삭제
function focusAltRemove(obj){
	var str = '';
	var name = jQuery(obj).attr("name");
	var val = jQuery(obj).val();
	
	if(name == "image_alt") {
		str = "이미지입니다.";
		if (str == val) {
			jQuery(obj).val("");
			return; 
		}else{
			return;
		}
	}else if(name.indexOf("beforeimage") >= 0) {
		str = "치료 전 사진입니다.";
		if (str == val) {
			jQuery(obj).val("");
			return; 
		}else{
			return;
		}
	}else if(name.indexOf("afterimage") >= 0) {
		str = "치료 후 사진입니다.";
		if (str == val) {
			jQuery(obj).val("");
			return; 
		}else{
			return;
		}
	}
}

// 이미지 alt 부분 포커스잃었을때 텍스트 삽입
function blurAltInsert(obj){
	
	var str = '';
	var name = jQuery(obj).attr("name");
	if (jQuery(obj).val() == "") {
		if (name == "image_alt") {
			str = "이미지입니다.";
		}else if (name.indexOf("beforeimage") >= 0) {
			str = "치료 전 사진입니다.";
		}else if (name.indexOf("afterimage") >= 0) {
			str = "치료 후 사진입니다.";
		}
	}else{
		
		str = jQuery(obj).val();
		
	}
	jQuery(obj).val(str);
}

// FAQ 분류별 클릭시 노출시키기
jQuery(function(){
	jQuery(".faq_open").click(function(){
		if(jQuery(this).children("dd").css("display")=="none") {
			jQuery(this).children("dd").css("display","block");
		}else if(jQuery(this).children("dd").css("display")=="block") {
			jQuery(this).children("dd").css("display","none");
		}
		
	});
});

// 진료과목 selectbox 가져오기
function clinicSelectbox(hospital_fk,clinic_fk,type) {
	jQuery("#clinic_fk").load("clinicList.jsp?hospital_fk="+hospital_fk+"&clinic_fk="+clinic_fk+"&type="+type);
}

// 의료진 selectbox 가져오기
function doctorSelectbox(hospital_fk,clinic_fk,doctor_fk,type) {
	jQuery("#doctor_fk").load("doctorList.jsp?hospital_fk="+hospital_fk+"&clinic_fk="+clinic_fk+"&doctor_fk="+doctor_fk+"&type="+type);
}

// 의료진 사진 가져오기
function doctorPhoto(hospital_fk,clinic_fk) {
	jQuery("#doctorPhoto").load("doctorPhoto.jsp?hospital_fk="+hospital_fk+"&clinic_fk="+clinic_fk);
}

// 예약달력 가져오기
function calendarList(shospital_fk, smonth) {
	jQuery("#resertime_zone").load("calendarList.jsp?shospital_fk="+shospital_fk+"&smonth="+smonth);
}

// 예약시간 가져오기
function reserTimeList(hospital_fk,doctor_fk,reserdate,resertime,times) {
	jQuery("#reserTime_zone").load("timeList.jsp?hospital_fk="+hospital_fk+"&doctor_fk="+doctor_fk+"&reserdate="+reserdate+"&resertime="+resertime+"&times="+times);
}

// 전화 상담 시간 가져오기
function curTime(selectDay, type){
	type = type.length > 2 ? type.substr(0,2) : 0;
	jQuery("#curTimeList").load("curTimeList.jsp?selectDay="+selectDay+"&type="+type);
}

// 비밀번호 유효성체크
function validPassword(password) {
	var jQuerypass = password.val();
	var jQuerystr = /^[a-zA-Z0-9@]{6,12}$/;
	var jQuerystr2 = /(\w)\1\1\1/;
	var jQuerychk_num = jQuerypass.search(/[0-9]/g);
	var jQuerychk_eng = jQuerypass.search(/[a-z]/ig);
	var check = false;
	if (jQuerypass == "") {
		alert("비밀번호를 입력해 주세요.");
		password.focus();
	}else if(!jQuerystr.test(jQuerypass) || jQuerypass.indexOf(' ') > -1){
		alert("비밀번호는 영문+숫자 6~12자리를 입력해 주세요.");
		password.focus();
	}else if(jQuerystr2.test(jQuerypass)){
		alert("비밀번호에 반복되는 문자 및 숫자가 있습니다.");
		password.focus();
	}else if(jQuerychk_num < 0 || jQuerychk_eng < 0) {
		alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
		password.focus();
	}else{
		check = true;
	}
	return check;
}

// 비밀번호 유효성체크(비밀번호확인)
function validConfirmPassword(password, confirmPassword) {
	var jQuerypass = password.val();
	var jQueryconfirm = confirmPassword.val();
	var jQuerystr = /^[a-zA-Z0-9@]{6,12}$/;
	var jQuerystr2 = /(\w)\1\1\1/;
	var jQuerychk_num = jQuerypass.search(/[0-9]/g);
	var jQuerychk_eng = jQuerypass.search(/[a-z]/ig);
	var check = false;
	if (jQuerypass == "") {
		alert("비밀번호를 입력해 주세요.");
		password.focus();
	}else if (jQuerypass != jQueryconfirm) {
		alert("입력한 비밀번호가 서로 다릅니다.");
		confirmPassword.focus();
	}else if(!jQuerystr.test(jQuerypass) || jQuerypass.indexOf(' ') > -1){
		alert("비밀번호는 영문+숫자 6~12자리를 입력해 주세요.");
		password.focus();
	}else if(jQuerystr2.test(jQuerypass)){
		alert("비밀번호에 반복되는 문자 및 숫자가 있습니다.");
		password.focus();
	}else if(jQuerychk_num < 0 || jQuerychk_eng < 0) {
		alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
		password.focus();
	}else{
		check = true;
	}
	return check;
}

// 엔터키 이벤트
function entKeyEventListener(keycode, formID){
	if(keycode == 13){
		jQuery("#"+formID).submit();
	}
}

/* 테이블의 th를 더블클릭 했을 시 최대로 늘렸다 다시 줄여주게 하는 기능.
**	param : 늘릴 th가 들어 있는 테이블 선택자
*/
function strecthAndLessen( _this ){

	var thisTable = $(_this);	// th를 늘릴 테이블

//	$(".sub_wrap .table01 table th").dblclick(function(){
	$(thisTable).dblclick(function(){
		var c_index = $(this).index();
		if($(this).attr("class") == 'on'){
			$(this).removeAttr("class");
			$(this).removeAttr("style");
		}else{
		var tmText = "";
		$(this).parent().parent().find("tr").each(function(i){
			if(i > 0 && i < 11){
				var text = $(this).find("td").eq(c_index).text();
				if(tmText.length < text.length){
				tmText = text;	
				}
			}
		})
		$(this).attr("class","on");
		$(this).css("width",inputCount(tmText)+"px");
		}
	});	// 이벤트 end
}
