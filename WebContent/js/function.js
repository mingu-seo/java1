// 세로 중앙정렬
function verticalAlign(obj){
    result=(obj.offsetParent.offsetHeight - obj.offsetHeight)/2+"px";
    if(obj.readyState == "complete"){
        obj.style.marginTop="0";
        obj.style.marginTop=result;
    }else{
        return result;
    }
}

//max-width, max-height
function maxSize(obj,w,h){
    if(obj.readyState != "complete") return "auto";
    real_w=obj.offsetWidth;
    real_h=obj.offsetHeight;
    virt_w=obj.offsetWidth;
    virt_h=obj.offsetHeight;
    if(w>0 && virt_w>w){
        virt_w = w;
        virt_h = real_h * (virt_w/real_w);
    }
    if(h>0 && virt_h>h){
        virt_h = h;
        virt_w = real_w * (virt_h/real_h);
    }

    obj.style.width="0";
    obj.style.height="0";
    obj.style.width=virt_w+"px";
    obj.style.height=virt_h+"px";

}

//min-height
function min_height(obj,h){
    if(obj.readyState != "complete") return "auto";
    if(obj.offsetHeight<h){
        obj.style.height="0";
        obj.style.height=h+"px";
    }

}

//라디오,체크버튼 border 없애기
function input_nb(obj){
    obj.style.zIndex="1";
    if(obj.type.toLowerCase()=="radio" || obj.type.toLowerCase()=="image"

|| obj.type.toLowerCase()=="checkbox"){

        obj.style.border="0";

    }
}

function getOpener(objectId) {
	
	if(opener.document.getElementById && opener.document.getElementById(objectId)) {	// W3C DOM
		return opener.document.getElementById(objectId);		
	} else if(opener.document.all && opener.document.all(objectId)) {					// IE4
		return opener.document.all(objectId);
	} else if(opener.document.layers && opener.document.layers[objectId]) {			// NN4
		return opener.document.layer[objectId];
	} else {
		return false;
	}
}

function getObject(objectId) {
	
	if(document.getElementById && document.getElementById(objectId)) {	// W3C DOM
		return document.getElementById(objectId);		
	} else if(document.all && document.all(objectId)) {					// IE4
		return document.all(objectId);
	} else if(document.layers && document.layers[objectId]) {			// NN4
		return document.layer[objectId];
	} else {
		return false;
	}
}

function getName(objectId) {
	
	if(document.getElementByName && document.getElementByName(objectId)) {	// W3C DOM
		return document.getElementByName(objectId);		
	} else if(document.all && document.all(objectId)) {					// IE4
		return document.all(objectId);
	} else if(document.layers && document.layers[objectId]) {			// NN4
		return document.layer[objectId];
	} else {
		return false;
	}
}

// 테이블 보여줌
function ShowTable(sty){
	document.all[sty].style.display='';
}

// 테이블 숨김
function HideTable(sty){
	document.all[sty].style.display='none';
}

//플래시파일//

//flash
function flash_contents(file, width, height){
document.writeln("<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' width='"+width+"' height='"+height+"' title=''>");
document.writeln("<param name='movie' value='"+file+"' />");
document.writeln("<param name='quality' value='high' />");
document.writeln("<param name='wmode' value='transparent' />");
//document.writeln("<param name='swfversion' value='9.0.45.0' />");
document.writeln("<!-- This param tag prompts users with Flash Player 6.0 r65 and higher to download the latest version of Flash Player. Delete it if you don't want users to see the prompt. -->");
document.writeln("<!-- Next object tag is for non-IE browsers. So hide it from IE using IECC. --> ");
document.writeln("<!--[if !IE]>-->");
document.writeln("<object type='application/x-shockwave-flash' data='"+file+"' width='"+width+"' height='"+height+"'>");
document.writeln("<!--<![endif]-->");
document.writeln("<param name='quality' value='high' />");
document.writeln("<param name='wmode' value='transparent' />");
//document.writeln("<param name='swfversion' value='9.0.45.0' />");
document.writeln("<!-- The browser displays the following alternative content for users with Flash Player 6.0 and older. -->");
document.writeln("<div>");
document.writeln("<h4>Content on this page requires a newer version of Adobe Flash Player.</h4>");
document.writeln("<p><a href='http://www.adobe.com/go/getflashplayer'><img src='http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' width='112' height='33' /></a></p>");
document.writeln("</div>");
document.writeln("<!--[if !IE]>-->");
document.writeln("</object>");
document.writeln("<!--<![endif]-->");
document.writeln("</object>");

}

//flash
function flash(width, height,flash_name){
	document.writeln("<OBJECT classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' WIDTH='"+width+"' HEIGHT='"+height+"' ALIGN=''>");
	document.writeln("<PARAM NAME=movie value='"+flash_name+"' />");
	document.writeln("<PARAM NAME=quality VALUE=high>");
	document.writeln("<PARAM NAME=bgcolor VALUE=#FFFFFF>");
	document.writeln("<PARAM NAME=wmode VALUE=transparent> ");
	document.writeln("<embed src='"+flash_name+"' quality='high' bgcolor='#FFFFFF' width='"+width+"' height='"+height+"' align='middle' allowScriptAccess='sameDomain' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />");
	document.writeln("</OBJECT>");
}

//동영상
function tv_adplay(file, width, height, mediaName) {
	document.write('<OBJECT ID="'+mediaName+'" CLASSID="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6" width="'+width+'" height="'+height+'">')
	document.write('	<param name="autoStart" value="true">')
	document.write('	<param name="balance" value="0">')
	document.write('	<param name="enableContextMenu" value="">')
	document.write('	<param name="ShowControls" value="true">')
	document.write('	<param name="enabled" value="true">')
	document.write('	<param name="fullScreen" value="">')
	document.write('	<param name="mute" value="">')
	document.write('	<param name="playCount" value="1">')
	document.write('	<param name="rate" value="1.0">')
	document.write('	<param name="SAMIFileName" value="">')
	document.write('	<param name="SAMILang" value="">')
	document.write('	<param name="SAMIStyle" value="">')
	document.write('	<param name="stretchToFit" value="">')
	document.write('	<param name="URL" value="'+file+'">')
	document.write('	<param name="volume" value="50">')
	document.write('</OBJECT>')
}
	
//동영상 autosize
function tv_adplay_autosize(file, mediaName) {
	document.write('<OBJECT ID="'+mediaName+'" CLASSID="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">')
	document.write('	<param name="autoStart" value="true">')
	document.write('	<param name="balance" value="0">')
	document.write('	<param name="enableContextMenu" value="">')
	document.write('	<param name="ShowControls" value="true">')
	document.write('	<param name="enabled" value="true">')
	document.write('	<param name="fullScreen" value="">')
	document.write('	<param name="mute" value="">')
	document.write('	<param name="playCount" value="1">')
	document.write('	<param name="rate" value="1.0">')
	document.write('	<param name="SAMIFileName" value="">')
	document.write('	<param name="SAMILang" value="">')
	document.write('	<param name="SAMIStyle" value="">')
	document.write('	<param name="stretchToFit" value="">')
	document.write('	<param name="URL" value="'+file+'">')
	document.write('	<param name="volume" value="50">')
	document.write('	<param name="AutoSize" value="true">')
	document.write('</OBJECT>')
}
//--------------------------------------------------------------

function active_source(source) {
	document.write(source);
}
//플래시파일//



function go(url)
{
	location.href=url;
}

// 각 달의 날수 처리
function fnLastDay ()
{
	var Index;
	var MaxIndex;
	var Year;
	var Month;
	var NewOption;
	
	Year = board.selYear.value;
	Month = board.selMonth.value;

	MaxIndex = board.selDay.length;
	
	for (Index = MaxIndex; Index  >= 28; Index--)
	{
		board.selDay.options [Index] = null;
	}
	
	switch (eval(Month))
	{
		case 1  :
		case 3  :
		case 5  :
		case 7  :
		case 8  :
		case 10 :
		case 12 :
			NewOption = new Option ("29", "29");
			board.selDay.options [28] = NewOption;
			NewOption = new Option ("30", "30");
			board.selDay.options [29] = NewOption;
			NewOption = new Option ("31", "31");
			board.selDay.options [30] = NewOption;
			
			break;
			
		case 4  :
		case 6  :
		case 9  :
		case 11 :
			NewOption = new Option ("29", "29");
			board.selDay.options [28] = NewOption;
			NewOption = new Option ("30", "30");
			board.selDay.options [29] = NewOption;

			break;
			
		case 2 :
			Index = Year % 4;
			
			if (Index == 0)
			// 윤년
			{
				Index = Year % 100;
				
				if (Index == 0)
				// 윤년 아님
				{
					Index = Year % 400;                        
					
					if (Index == 0)
					// 윤년
					{
						NewOption = new Option ("29", "29");
						board.selDay.options [28] = NewOption;                            
					}
					else
					// 윤년 아님
					{
					}                        
				}
				else
				// 윤년
				{
					NewOption = new Option ("29", "29");
					board.selDay.options [28] = NewOption;                        
				}
			}
			else
			// 윤년 아님
			{

			}
			break;
			
		default :
			break;
	}
	
	return true;
}

function returnURL(alertMessage, rurl) {
	sure = confirm(alertMessage);
	if (sure)
		location.href=rurl;
}

function Imgview () {
  document.all.tempImg.src = "";
  document.all.tempImg.src = document.board.imageFile.value;
}

function checkFileName(file){
	var extFile = file.split("\\");
	var ImgInfo = extFile[extFile.length-1];
	var ext = ImgInfo.split(".");
	if (!isKorean(ext[0])){
		alert("한글명은 허용하지 않습니다.");
	}
}

// 이미지 형식 제안 (jpg,gif)
function CheckImageFile(imageName) {
  var ImageFile = imageName;
  var extFile = ImageFile.split("\\");
  var ImgInfo = extFile[extFile.length-1];
  var ext = ImgInfo.split(".");
    if (ext[1].toUpperCase() == "JPG" || ext[1].toUpperCase() == "GIF" || ext[1].toUpperCase() == "PIN" || ext[1].toUpperCase() == "BMP") {
      if (isKorean(ext[0])) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
	}
}

function isValidDateFormat(input) {
    var format = /^(\d\d\d\d)-(\d\d)-(\d\d)$/;
    return isValidFormat(input,format);
}

/**
  * 입력값이 사용자가 정의한 포맷 형식인지 체크
  * 자세한 format 형식은 자바스크립트의 ''regular expression''을 참조
  */
 function isValidFormat(input,format) {
     if (input.value.search(format) != -1) {
         return true; //올바른 포맷 형식
     }
     return false;
 }


function isSelected(selObj){
	if (selObj.options[selObj.selectedIndex].value != "" ){
		return true;
	} else {
		return false;
	}
}

function hasCheckedRadio(input) {
    if (input.length > 1) {
        for (var inx = 0; inx < input.length; inx++) {
            if (input[inx].checked) return true;
        }
    } else {
        if (input.checked) return true;
    }
    return false;
}

function isEng(str) { 
  for(var i=0;i<str.length;i++){ 
    achar = str.charCodeAt(i);  
    if( achar > 128 ){  
      return false; 
    }  
  } 
  return true;  
} 

// 숫자만 받아서 아니면 메세지 보여 주는 
function onlyNumber(objEv) {
	if(!isNum(objEv)){
		alert("숫자만 입력가능합니다.");
		objEv.value = "";
		objEv.focus();
		return;
	}
}

function psnoCheck(it) {

	psnoTot = 0;
	psnoAdd = '234567892345';

	for(i=0;i<12;i++) {
		psnoTot = psnoTot + parseInt(it.substring(i,i+1))*parseInt(psnoAdd.substring(i,i+1));
	}
	psnoTot = 11 - (psnoTot%11);
	if (psnoTot==10) {
		psnoTot=0;
	} else if(psnoTot==11) {
		psnoTot=1;
	}
	if(parseInt(it.substring(12,13))!=psnoTot) return true
}

function delConfirm(alertMessage, rurl) {
	sure = confirm(alertMessage);
	if (sure)
		location.href=rurl;
}

function searchzipcode(zipname, addrname, addrname2, inputnext){
	var urlname = "/zipsearch/zipsearch.jsp?zipname="+zipname+"&addrname="+addrname+"&addrname2="+addrname2+"&inputnext="+inputnext;
	//window.open(urlname,"browse_org","height=240,width=400,menubar=no,directories=no,resizable=no,status=no,scrollbars=no");
	window.open(urlname,"browse_org","height=430,width=400,menubar=no,directories=no,resizable=no,status=no,scrollbars=no");
}

function searchzipcode2(zipname, addrname, addrname2, inputnext){
	var urlname = "/zipsearch/zipsearch2.jsp?zipname="+zipname+"&addrname="+addrname+"&addrname2="+addrname2+"&inputnext="+inputnext;
	//window.open(urlname,"browse_org","height=240,width=400,menubar=no,directories=no,resizable=no,status=no,scrollbars=no");
	window.open(urlname,"browse_org","height=430,width=400,menubar=no,directories=no,resizable=no,status=no,scrollbars=no");
}

function handlePress(obj, e) {
	var whichCode = (window.Event) ? e.which : e.keyCode;
	if ( String.fromCharCode(whichCode) < obj.length ) {
		obj.selectedIndex = String.fromCharCode(whichCode);
	}
}

function moveFocus(obj,length,nextval){
	onlyNumber(obj);
	if ( obj.value.length == length ){
		nextval.focus();
	}
}

function formattedMoney(v) {
	var format = "";
	var money = removeFormattedMoney(v);

	money = reverse(money);
	for(var i = money.length-1; i > -1; i--) {
		if((i+1)%3 == 0 && money.length-1 != i) format += ",";
			format += money.charAt(i);
		}
	return format;
}

function removeFormattedMoney(v) {
	var unformat = "";
	var money = getNumber(v);
	var arr = money.split(",");
	for(var i = 0; i < arr.length; i++) {
		unformat += arr[i];
	}
	return unformat;
}

function reverse(s) {
	var rev = "";

	for(var i = s.length-1; i >= 0 ; i--) {
		rev += s.charAt(i);
	}
	return rev;
}

function isNumberOrComma(){
	if ( (event.keyCode == 46) ||  // DEL
       (event.keyCode == 8)  ||  // backspace
       (event.keyCode == 9)  ||  // tab
       (event.keyCode == 37) ||  // ← key
       (event.keyCode == 38) ||  // ↑ key
       (event.keyCode == 39) ||  // → key
       (event.keyCode == 40) ||  // ↓ key
       (event.keyCode == 35) ||  // HOME key
       (event.keyCode == 36) ||  // END key
       (event.keyCode == 13) ||  // Enter key
       
       (event.keyCode == 109) ||  // - key in 숫자패드
	   (event.keyCode == 189) ||  // - key in 키패드

	   (event.keyCode == 188)  ||  // comma
	   (event.keyCode == 17)  ||  // ctrl
	   (event.keyCode == 67)  ||  // c
	   (event.keyCode == 86)  ||  // v
	   (event.keyCode == 88)  ||  // v

       ( (event.keyCode >= 48) && (event.keyCode <= 57 ) ) || // 0 ~ 9
       ( (event.keyCode >= 96) && (event.keyCode <= 105 ) )   // 0 ~ 9 in 숫자패드
     )
    event.returnValue=true;
  else
    event.returnValue=false;
}

function isNumberOrDash(){
  if ( (event.keyCode == 46) ||  // DEL
       (event.keyCode == 8)  ||  // backspace
       (event.keyCode == 9)  ||  // tab
       (event.keyCode == 37) ||  // ← key
       (event.keyCode == 38) ||  // ↑ key
       (event.keyCode == 39) ||  // → key
       (event.keyCode == 40) ||  // ↓ key
       (event.keyCode == 35) ||  // HOME key
       (event.keyCode == 36) ||  // END key
       (event.keyCode == 13) ||  // Enter key

	   (event.keyCode == 188)  ||  // comma
	   (event.keyCode == 17)  ||  // ctrl
	   (event.keyCode == 67)  ||  // c
	   (event.keyCode == 86)  ||  // v
	   (event.keyCode == 88)  ||  // v
       
       (event.keyCode == 109) ||  // - key in 숫자패드
	   (event.keyCode == 189) ||  // - key in 키패드
       ( (event.keyCode >= 48) && (event.keyCode <= 57 ) ) || // 0 ~ 9
       ( (event.keyCode >= 96) && (event.keyCode <= 105 ) )   // 0 ~ 9 in 숫자패드
     )
    event.returnValue=true;
  else
    event.returnValue=false;
}

function isNumberOrPoint(){
  if ( (event.keyCode == 46) ||  // DEL
       (event.keyCode == 8)  ||  // backspace
       (event.keyCode == 9)  ||  // tab
       (event.keyCode == 37) ||  // ← key
       (event.keyCode == 38) ||  // ↑ key
       (event.keyCode == 39) ||  // → key
       (event.keyCode == 40) ||  // ↓ key
       (event.keyCode == 35) ||  // HOME key
       (event.keyCode == 36) ||  // END key
       (event.keyCode == 13) ||  // Enter key

	   (event.keyCode == 188)  ||  // comma
	   (event.keyCode == 17)  ||  // ctrl
	   (event.keyCode == 67)  ||  // c
	   (event.keyCode == 86)  ||  // v
	   (event.keyCode == 88)  ||  // v
       
       (event.keyCode == 110) ||  // . key
       ( (event.keyCode >= 48) && (event.keyCode <= 57 ) ) || // 0 ~ 9
       ( (event.keyCode >= 96) && (event.keyCode <= 105 ) )   // 0 ~ 9 in 숫자패드
     )
    event.returnValue=true;
  else
    event.returnValue=false;
}

function fnMaxReal(arg, max){
	arg.value = arg.value.trim();

	var str = arg.value;
	var sum = 0;

	var k;

	for(var i = 0; i < str.length; i++)	{
		k = str.charCodeAt(i) ; 

		if(k >= 48 && k <= 57){ 
			sum += 1;
		}
	}

	if (sum > max){
		alert ("입력할 수 있는 글자수를 넘었습니다.")
		arg.select();
		return false;
	}
	return true;
}

function chkFixReal(v, size, scale) {
	var index = v.value.indexOf(".");
	var num;
	var point;
	if ( index != -1 ) {
		num = v.value.substring(0,index);
		point = v.value.substring(index+1,v.value.length);
		if ( v.value > size ) {
			alert(size+"%를 넘을 수 없습니다.");
			v.value = "0";
			v.focus();
		}
		if ( point.length > scale ) {
			alert("소수점이하 "+scale+"자리까지만 입력 가능합니다.");
			v.value = "0";
			v.focus();
		}
	} else {
		if ( v.value > size ) {
			alert(size+"%를 넘을 수 없습니다.");
			v.value = "0";
			v.focus();
		}
	}
}

function getRealNumber(format) {
  var number="";
  for(var i=0; i < format.length; i++) {
    if(format.charAt(i) >= '0' && format.charAt(i) <= '9') number += format.charAt(i);
  }
  return eval(number);
}

function chkDateValidity(yearObj, monthObj, dateObj){
	var tmpDate = new Date(yearObj.value, monthObj.value-1, dateObj.value);
	if ( tmpDate.getYear() != yearObj.value || tmpDate.getMonth() != monthObj.value-1 || tmpDate.getDate() != dateObj.value) {
		return false;
	} else {
		return true;
	}
}

function setMoneyFormat( tmpObj ){
	var cruVal = formattedMoney(tmpObj);
	tmpObj.value = cruVal;
}
function getMoneyFormat( tmpObj ) {
	return formattedMoney(tmpObj);
}
function setRemainder (obj,nextVal){
	var tmp = 100 - obj.value;
	nextVal.value = tmp;
}

function setMoneyUpper(obj, bound){
	var tmp = removeFormattedMoney(obj);
	if ( tmp.length > bound ) {
		alert(bound+"자리수 이상 초과할 수 없습니다.");
		obj.value = "0";
		obj.focus();
	}
}
function chkFixReal(v, size, scale) {
	var index = v.value.indexOf(".");
	var num;
	var point;
	if ( index != -1 ) {
		num = v.value.substring(0,index);
		point = v.value.substring(index+1,v.value.length);
		if ( v.value > size ) {
			alert(size+"을 넘을 수 없습니다.");
			v.value = "0";
			v.focus();
		}
		if ( point.length > scale ) {
			alert("소수점이하 "+scale+"자리까지만 입력 가능합니다.");
			v.value = "0";
			v.focus();
		}
	} else {
		if ( v.value > size ) {
			alert(size+"을 넘을 수 없습니다.");
			v.value = "0";
			v.focus();
		}
	}
}

function toUpperCase() {
  if(!(event.keyCode < 97 || event.keyCode > 122)) {
    event.keyCode -= 32;
    event.returnValue=true;
  }
}
//사업자 등록번호
function cvtBNumber(obj){
	var exp = /-/g;
	var number = obj.value.replace(exp,"");
	var num = "";
	
	if ( number.length > 5 ) {
		num = number.substring(0,3) + "-" + number.substring(3,5) + "-" + number.substring(5);
	} else if ( number.length > 3 ) {
		num = number.substring(0,3) + "-" + number.substring(3);
	} else if ( number.length <= 3 ) {
		num = obj.value;
	}
	obj.value = num;
	
}

//법인등록번호
function cvtCNumber(obj){
	var exp = /-/g;
	var number = obj.value.replace(exp,"");
	var num = "";
	
	if ( number.length > 6 ) {
		num = number.substring(0,6) + "-" + number.substring(6);
	} else {
		num = obj.value;
	}
	obj.value = num;
	
}


function cvtDate(obj){
	var exp = /-/g;
	var number = obj.value.replace(exp,"");
	var num = "";
	
	if ( number.length > 6 ) {
		num = number.substring(0,4) + "-" + number.substring(4,6) + "-" + number.substring(6);
	} else if ( number.length > 4 ) {
		num = number.substring(0,4) + "-" + number.substring(4);
	} else if ( number.length <= 4 ) {
		num = obj.value;
	}
	obj.value = num;
}
function insertHyphen(target){
	var rev = reverse(target);
	var cnt = 0;
	if ( target.length%4 != 0 ) {
		cnt = Math.floor(target.length/4);
	} else {
		cnt = Math.floor(target.length/4)-1;
	}
	var result = "";
	if ( cnt > 0 ) {
		var token = new Array();
		for ( var i=0; i<=cnt; i++ ) {
			token[i] =  reverse(rev.substring(0,4));
			rev = rev.substring(4);
		}
		for ( var i=cnt; i>0; i-- ){
			result = result + token[i] + "-";
		}
		result += token[0];
		return result;

	} else {
		return target;
	}
}

function formSave(btn){
	if ( event.ctrlKey ) {
		if ( event.keyCode == 83 ){
			btn.click();
		}
	}
}

/**
 * 기능설명		: 문자열의 앞뒤 공백을 제거한다.
 * 사용예		: 문자열.trim()
 */
String.prototype.trim = function() { 
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
}

function setMoneyFormat2( tmpObj ){
	var cruVal = formattedMoney2(tmpObj);
	tmpObj.value = cruVal;
}

function formattedMoney2(v) {
	var format = "";
	var money = removeFormattedMoney2(v);
	var flag = "";

	if ( money.substring(0,1) == "-" ){
		flag ="-";
		money = money.substring(1);
	}
	
	money = reverse(money);
	
	for(var i = money.length-1; i > -1; i--) {
		if((i+1)%3 == 0 && money.length-1 != i) format += ",";
			format += money.charAt(i);
		}
	return flag+format;
	
}

function removeFormattedMoney2(v) {
	var unformat = "";
	var money = getNumber2(v);
	var flag = "";
	if ( money.substring(0,1) == "-" )	{
		flag = "-";
		money = money.substring(1);
	}
	var arr = money.split(",");
	for(var i = 0; i < arr.length; i++) {
		unformat += arr[i];
	}
	return flag+unformat;
}

function getNumber2(obj){
	var exp = /[^0-9-]/g;
	var number = obj.value.replace(exp,"");
	return number;
}

function addCommaPoint(obj,fLen){ 

	if(event.keyCode == 37 || event.keyCode == 39 ) {                                              
		return;
	}
	var fLen = fLen || 2; 
	var strValue = obj.value.replace(/,|\s+/g,'');
	var strBeforeValue = (strValue.indexOf('.') != -1)? strValue.substring(0,strValue.indexOf('.')) :strValue ;
	var strAfterValue  = (strValue.indexOf('.') != -1)? strValue.substr(strValue.indexOf('.'),fLen+1) : '' ;
	if(isNaN(strValue)){
		alert(strValue.concat(' -> 숫자가 아닙니다.'));
		return false;
	}
	var intLast =  strBeforeValue.length-1;
	var arrValue = new Array;
	var strComma = '';
	for(var i=intLast,j=0; i >= 0; i--,j++){ 
		if( j !=0 && j%3 == 0) {   
			strComma = ',';
		}else{
			strComma = '';
		}
		arrValue[arrValue.length] = strBeforeValue.charAt(i) + strComma  ;
	}
	obj.value=  arrValue.reverse().join('') +  strAfterValue; 
}

function autoSum(obj1, obj2, obj3){
	if ( obj1.value.length > 0 && obj2.value.length > 0 ) {
		obj3.value = Math.round(eval(removeFormattedMoney(obj1))+Math.round(removeFormattedMoney(obj2)));
		addCommaPoint(obj3);
	} else {
		obj3.value = "";
		addCommaPoint(obj3);
	}
}

function autoSend(obj1, obj2){
	if ( obj1.value.length > 0 ) {
		obj2.value = Math.round(eval(removeFormattedMoney(obj1)));
	} else {
		obj2.value = "";
	}
}

function taborder(arg,nextname,len) {
	if (arg.value.length==len) {
		nextname.focus() ;
		return;
  }
}    

// 2008-02-26 이후 사용한 스크립트

// 이메일 형식 체크
function isValidEmail(input) {
	var format = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;
	return isValidFormat(input,format);
}

// 이메일리스트 형식 체크
function isValidEmailing(input) {
    var mail = input.value;
	var splitStart;
	var splitEnd;
	mail = mail.replace(/ /gi,"");
	mail = mail.replace(/\n/gi,",");
	mail = mail.replace(/[;]/gi,",");
	var mailList = mail.split(",");
	var format = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/;

	for (var i = 0; i < mailList.length ; i++) {
		mail = mailList[i].trim();
		if (mail.length > 3) {
			if (mail.search(format) == -1) {
				return false;
			}
		}
	}
	return true;
}


// 날짜 시간 형식을 yyyy-MM-dd HH:mm:dd으로 변경한다.
function cvtDateTime(obj){
	var number = obj.value;
	var num = "";

	number = replace(number, "-", "");
	number = replace(number, ":", "");
	number = replace(number, " ", "");
	
	if ( number.length == 13 ) {
		num = number.substring(0,4) + "-" + number.substring(4,6) + "-" + number.substring(6, 8) +" "+ number.substring(8, 10) +":"+number.substring(10, 12)+":"+number.substring(12);
		obj.value = num;
	} else if ( number.length == 11 ) {
		num = number.substring(0,4) + "-" + number.substring(4,6) + "-" + number.substring(6, 8) +" "+ number.substring(8, 10) +":"+number.substring(10);
		obj.value = num;
	} else if ( number.length == 9 ) {
		num = number.substring(0,4) + "-" + number.substring(4,6) + "-" + number.substring(6, 8) +" "+ number.substring(8);
		obj.value = num;
	} else if ( number.length == 7 ) {
		num = number.substring(0,4) + "-" + number.substring(4,6) + "-" + number.substring(6);
		obj.value = num;
	} else if ( number.length == 5 ) {
		num = number.substring(0,4) + "-" + number.substring(4);
		obj.value = num;
	}
}

// 문자열 치환하기(문자열, 찾을문자열, 변경할문자열)
function replace(str,s,d){
 var i=0;

 while(i > -1){
  i = str.indexOf(s);
  str = str.substr(0,i) + d + str.substr(i+1,str.length);
 }
 return str;
}


// 숫자만 입력 가능하도록 제한하기
function isNumber(){
  if ( (event.keyCode == 46) ||  // DEL
       (event.keyCode == 8)  ||  // backspace
       (event.keyCode == 9)  ||  // tab
       (event.keyCode == 37) ||  // ← key
       (event.keyCode == 38) ||  // ↑ key
       (event.keyCode == 39) ||  // → key
       (event.keyCode == 40) ||  // ↓ key
       (event.keyCode == 35) ||  // HOME key
       (event.keyCode == 36) ||  // END key
       (event.keyCode == 13) ||  // Enter key

	   (event.keyCode == 188)  ||  // comma
	   (event.keyCode == 17)  ||  // ctrl
	   (event.keyCode == 67)  ||  // c
	   (event.keyCode == 86)  ||  // x
	   (event.keyCode == 88)  ||  // v
       
       ( (event.keyCode >= 48) && (event.keyCode <= 57 ) ) || // 0 ~ 9
       ( (event.keyCode >= 96) && (event.keyCode <= 105 ) )   // 0 ~ 9 in 숫자패드
     )
    event.returnValue=true;
  else
    event.returnValue=false;
}

// 날짜와 시간이 존재하는 체크
function chkDateTime(obj) {
	var input = obj.value;
	input = replace(input, "-", "");
	input = replace(input, ":", "");
	input = replace(input, " ", "");
	var inputYear = input.substring(0, 4);
	var inputMonth = input.substring(4, 6) - 1;
	var inputDate = input.substring(6, 8);
	var inputHour = input.substring(8, 10);
	var inputMinute = input.substring(10, 12);
	var inputSecond = input.substring(12);
	var resultDate = new Date(inputYear, inputMonth, inputDate, inputHour, inputMinute, inputSecond);

	if (resultDate.getFullYear()	!= inputYear	||
		resultDate.getMonth()		!= inputMonth	||
		resultDate.getDate()		!= inputDate	||
		resultDate.getHours()		!= inputHour	||
		resultDate.getMinutes()		!= inputMinute	||
		resultDate.getSeconds()		!= inputSecond	) {
		return false;
	} else {
		return true;
	}
}

// 삭제 확인 하기
function delConfirm(alertMessage, rurl) {
	sure = confirm(alertMessage);
	if (sure)
		location.href=rurl;
}

// 복수의 체크박스 선택하기
function check(allChk, chkbox){
	if ( chkbox ) {
	    if ( chkbox.length ) {
	        for(var i = 0; i<chkbox.length; i++) {
	            chkbox[i].checked = allChk.checked;
	        }
	    } else {
	        chkbox.checked = allChk.checked;
	    }
    } else {
    	alert("선택할 항목이 없습니다.");
    }
}

// 체크박스가 하나라도 체크되어 있는지 확인
function isSeleted(objCheck){
	var count = 0;
	if ( objCheck ) {
		if(objCheck.name != undefined) {
			if (objCheck.checked ==true) {
				count=1;
			}
		} else {
			for (i=0; i<objCheck.length; i++) {
				if (objCheck[i].checked == true) {
					count=count+1; 
					break;
				}
			}
		}
    }
	if (count==0){
		return false;
	} else {
		return true;
	}
}

//이미지의 width를 전달 받은 값 보다 큰가 확인 한 후 크면 전달 받은 값으로 변경한다.
function imgReSize(img, width)	{
	var temp;
	temp	= new Image();
	temp.src=img.src;
	
	if( temp.width > width )	{
		img.width = width;
	}
}

// 팝업 관련 시작

function startTime(cName, cMain, layerTop, layerLeft, layerWidth, layerHeight, type) {

	cookieIndex = getCookie(cName);
	if ( !cookieIndex || type == "0") {     
		document.getElementById(cName).style.visibility = "visible";
	} else {
		document.getElementById(cName).style.visibility = "hidden";
	}

    document.getElementById(cName).style.top = layerTop+"px";
    document.getElementById(cName).style.left = layerLeft+"px";
    document.getElementById(cName).style.width = layerWidth+"px";
    document.getElementById(cMain).style.height = layerHeight+"px";
}

function setCookie( name, value ) {
	var expiredays = 1;			//공지창 하루 안띄우기 시간. 1은 하루임
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function closeLayer(cName, chkbox, type , pName) {
    if ( chkbox.checked ) {
		setCookie(cName, "os");
	}
	if (type == "1") {
		document.getElementById(pName).style.display = "none";
		document.getElementById(cName).style.visibility = "hidden";
	} else {
		window.close();
	}
}

isIE  = document.all;
isNN  = !document.all && document.getElementById;
isN4  = document.layers;

var max_zindex = 30;
function drag( mode,e,obj ) {
    if ( mode == 'start' ) {
		obj.offsetx = isIE ? event.clientX : e.clientX;
		obj.offsety = isIE ? event.clientY : e.clientY;

		obj.nowX    = parseInt(obj.style.left);
		obj.nowY    = parseInt(obj.style.top);
		obj.dragable = '1';

		var new_zindex = max_zindex + 1;
		obj.style.zIndex = new_zindex;
		max_zindex = new_zindex;
	} else if ( mode == 'move' ) {
		if ( obj.dragable == '1' ) {
			var x = isIE ? (obj.nowX + event.clientX - obj.offsetx) : (obj.nowX + e.clientX - obj.offsetx);
			var y = isIE ? (obj.nowY + event.clientY - obj.offsety) : (obj.nowY + e.clientY - obj.offsety);
			var max_winw = document.body.clientWidth - parseInt(obj.style.width);
			var max_winh = document.body.clientHeight - parseInt(obj.style.height);

			if ( x >= 0 && x <=max_winw ) obj.style.left = x;
			if ( y >= 0 && y <=max_winh ) obj.style.top  = y;
		}
	} else if ( mode == 'stop' ) {
		obj.dragable='0'
	}
}

function getCookie( name ) {
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length ) {
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
			endOfCookie = document.cookie.length;
			return unescape( document.cookie.substring( y, endOfCookie ) );
		}

		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 )
		break;
    }
    return "";
}

// 팝업 관련 끝

// 숫자 체크
function isNum(input) {
    var chars = "0123456789";
    return containsCharsOnly(input,chars);
}

// 라디오 버튼의 체크 된 항목의 값을 구한다.
function getRadioValue(obj){

	var result = "";
	
	var tmpRad = new Array();
	tmpRad = obj;
	
	for ( var i=0; i<tmpRad.length; i++ ){
		if ( tmpRad[i].checked ){
			result = tmpRad[i].value;
		} 
	}
	return result;
}

/**
* 입력값에 스페이스 이외의 의미있는 값이 있는지 체크
* ex) if (isEmpty(form.keyword)) {
*         alert("검색조건을 입력하세요.");
*     }
*/
function isEmpty(input) {
    if (input.value == null || input.value.replace(/ /gi,"") == "") {
		return true;
    }
    return false;
}

// 지원하는 이미지명의 기본유효성 확장자 및 한글 이미지명 체크
function checkImgFormat(input){

	if ( !input.value.match(/\.(gif|jpg|png|bmp)$/i) ) {
		alert("지원하지 않는 파일입니다.(지원 파일 :.jpg, .gif, .png, .bmp)");
		return true;
	}

	var extFile = input.value.split("\\");
	var ImgInfo = extFile[extFile.length-1];
	var ext = ImgInfo.split(".");
/*	if ( !isAlphaNum(ext[0]) ) {
		alert("이미지명은 영문, 숫자, -, _ 만 허용합니다.(공백 허용 않 함)");
		return true;
	}*/
}

// 팝업 관리에서 이미지명의 기본유효성 확장자 및 한글 이미지명 체크
function checkImgFormatPopup(input){

	if ( !input.value.match(/\.(gif|jpg)$/i) ) {
		alert("지원하지 않는 파일입니다.(지원 파일 :.jpg, .gif)");
		return true;
	}

	var extFile = input.value.split("\\");
	var ImgInfo = extFile[extFile.length-1];
	var ext = ImgInfo.split(".");
	if ( !isAlphaNum(ext[0]) ) {
		alert("이미지명은 영문, 숫자, -, _ 만 허용합니다.(공백 허용 않 함)");
		return true;
	}
}

// 지원하는 미디어의 기본유효성 확장자 및 한글 이미지명 체크
function checkMediaFormat(input){

	if ( !input.value.match(/\.(asf|wmv|avi|mpeg|mpg|wav|mp3|mid)$/i) ) {
		alert("지원하지 않는 파일입니다.(지원 파일 :.asf, .wmv, .avi. .mpeg, .mpg, .wav, mp3, .mid)");
		return true;
	}

	var extFile = input.value.split("\\");
	var ImgInfo = extFile[extFile.length-1];
	var ext = ImgInfo.split(".");
	if ( !isAlphaNum(ext[0]) ) {
		alert("미디어명은 영문, 숫자, -, _ 만 허용합니다.(공백 허용 않 함)");
		return true;
	}
}

// 입력값이 알파벳,숫자, -, _ 되어있는지 체크
function isAlphaNum(input) {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
    return containsCharsValueOnly(input,chars);
}

// input(object) 값이 chars으로만 이루어 졌는지 확인한다.
function containsCharsOnly(input,chars) {
    for (var inx = 0; inx < input.value.length; inx++) {
       if (chars.indexOf(input.value.charAt(inx)) == -1)
           return false;
    }
    return true;
}

// input(String 값) 값이 chars으로만 이루어 졌는지 확인한다.
function containsCharsValueOnly(input,chars) {
    for (var inx = 0; inx < input.length; inx++) {
       if (chars.indexOf(input.charAt(inx)) == -1)
           return false;
    }
    return true;
}

// select box의 option이 선택되어 있는지 확인
function selectBoxSelectedCheck(input) {
	var result = false;
	for (var i=0 ; i < input.options.length ; i++) {
		if (input.options[i].selected == true) {
			result = true;
		}
	}
	return result;
}

//------------------------- sms 부분 시작 -----------------------------
function addChar (ch){
	var f = document.frm;
	var t;
	var msglen;
	msglen = 0;
	f.tran_msg.value = f.tran_msg.value + ch;
	l = f.tran_msg.value.length;
	for(k=0;k<l;k++){
		t = f.tran_msg.value.charAt(k);
		if (escape(t).length > 4)
			msglen += 2;
		else
			msglen++;
	}
	f.msgLength.value = msglen;
}

/*
 * textarea 문자 길이 측정
 */

// 여러개 있을때 체크 하기
function chkLengthMulti(name) {

	var tmpStr, nStrLen, reserve;

	sInputStr = document.all[name].value;
	nStrLen = calculate_byte(sInputStr);

	if ( nStrLen > 2000 ) {
		tmpStr = Cut_Str(sInputStr,2000);
		reserve = nStrLen - 2000;

		alert("작성하신 문구는 " + reserve + "바이트가 초과되었습니다.(최대 2000Bytes)"); 

		// 2000byte에 맞게 입력내용 수정
		document.all[name].value = tmpStr;
		nStrLen = calculate_byte(tmpStr);
	}

	return;
}

function chkLength(frm) {
	var f = frm;
	var tmpStr, nStrLen, reserve;

	sInputStr = f.message.value;
	nStrLen = calculate_byte(sInputStr);

	if ( nStrLen > 80 ) {
		tmpStr = Cut_Str(sInputStr,80);
		reserve = nStrLen - 80;

		alert("작성하신 문구는 " + reserve + "바이트가 초과되었습니다.(최대 80Bytes)"); 

		// 80byte에 맞게 입력내용 수정
		f.message.value = tmpStr;
		nStrLen = calculate_byte(tmpStr);
		f.msgLength.value = nStrLen;
	} else {
		f.msgLength.value = nStrLen;
	}

	return;
}
// mms 여러개 있을때 체크 하기
function mmsChkLengthMulti(name) {

	var tmpStr, nStrLen, reserve;

	sInputStr = document.all[name].value;
	nStrLen = calculate_byte(sInputStr);

	if ( nStrLen > 2000 ) {
		tmpStr = Cut_Str(sInputStr,2000);
		reserve = nStrLen - 2000;

		alert("작성하신 문구는 " + reserve + "바이트가 초과되었습니다.(최대 2000Bytes)"); 

		// 80byte에 맞게 입력내용 수정
		document.all[name].value = tmpStr;
		nStrLen = calculate_byte(tmpStr);
	}

	return;
}

function mmsChkLength(frm) {
	var f = frm;
	var tmpStr, nStrLen, reserve;

	sInputStr = f.message.value;
	nStrLen = calculate_byte(sInputStr);
	

	if ( nStrLen > 2000 ) {
		tmpStr = Cut_Str(sInputStr,2000);
		reserve = nStrLen - 2000;

		alert("작성하신 문구는 " + reserve + "바이트가 초과되었습니다.(최대 2000Bytes)"); 

		// 80byte에 맞게 입력내용 수정
		f.message.value = tmpStr;
		nStrLen = calculate_byte(tmpStr);
		f.msgLength.value = nStrLen;
	} else {
		f.msgLength.value = nStrLen;
	}

	return;
}



function calculate_byte( sTargetStr ) {
	var sTmpStr, sTmpChar;
	var nOriginLen = 0;
	var nStrLength = 0;
	 
	sTmpStr = new String(sTargetStr);
	nOriginLen = sTmpStr.length;

	for ( var i=0 ; i < nOriginLen ; i++ ) {
		sTmpChar = sTmpStr.charAt(i);

		if (escape(sTmpChar).length > 4) {
			nStrLength += 2;
		} else if (sTmpChar!='\r') {
			nStrLength ++;
		}
	}
	
	return nStrLength; 
	
}
/*
 * textarea 문자 길이 측정 끝
 */

function Cut_Str( sTargetStr , nMaxLen ) {
	var sTmpStr, sTmpChar, sDestStr;
	var nOriginLen = 0;
	var nStrLength = 0;
	var sDestStr = "";
	sTmpStr = new String(sTargetStr);
	nOriginLen = sTmpStr.length;

	for ( var i=0 ; i < nOriginLen ; i++ ) {
		sTmpChar = sTmpStr.charAt(i);

		if (escape(sTmpChar).length > 4) {
			nStrLength = nStrLength + 2;
		} else if (sTmpChar!='\r') {
			nStrLength ++;
		}

		if (nStrLength <= nMaxLen) {
			sDestStr = sDestStr + sTmpChar;
		} else {
			break;
		}

	}
	
	return sDestStr; 
	
}

function cvtPhoneNumberForTextArea(obj){
	if ( (event.keyCode == 46) ||  // DEL
       (event.keyCode == 8)  ||  // backspace
       (event.keyCode == 9)  ||  // tab
       (event.keyCode == 37) ||  // ← key
       (event.keyCode == 38) ||  // ↑ key
       (event.keyCode == 39) ||  // → key
       (event.keyCode == 40) ||  // ↓ key
       (event.keyCode == 35) ||  // HOME key
       (event.keyCode == 36) ||  // END key
       (event.keyCode == 13) ||  // Enter key

	   (event.keyCode == 17)  ||  // ctrl
	   (event.keyCode == 67)  ||  // c
	   (event.keyCode == 86)  ||  // v
	   (event.keyCode == 88)  ||  // v
       
       (event.keyCode == 109) ||  // - key in 숫자패드
	   (event.keyCode == 189)	  // - key in 키패드
    ){} else {
		var exp = /\s/g;
		var expDash = /-/g;
		var numbers = obj.value.split("\n");
		var result = "";
		var rowNumber;
		var rowReverse;
		var rowResult;
		for ( var i=0; i<numbers.length ; i++){
			rowNumber = "";
			rowReverse = "";
			rowResult = "";
			rowNumber = numbers[i].replace(exp,"");
			rowNumber = rowNumber.replace(expDash,"");
			if ( rowNumber.length > 2 ) {
				if ( rowNumber.substring(0,2) == "02" ) {
					rowResult = rowNumber.substring(0,2) + "-" + insertHyphen(rowNumber.substring(2));
				} else if ( rowNumber.length >= 3 && rowNumber.substring(0,2) != "02" ) {
					rowResult = rowNumber.substring(0,3)+"-"+insertHyphen(rowNumber.substring(3));
				}
			} else {
				rowResult = rowNumber;
			}
			numbers[i] = rowResult;
		}
		for ( var i=0; i<numbers.length ; i++){
			if ( numbers[i].length > 0 ) {
				if ( i < numbers.length-1 ) {
					result = result + numbers[i]+"\n";
				} else {
					result = result + numbers[i];
				}
			}
		}
		obj.value = result;
	}
}

//------------------------- sms 부분 끝 -----------------------------

// 오직 숫자만
function isOnlyNumber(obj){
	var exp = /[^0-9]/g;
	if ( exp.test(obj.value) ) {
		alert("숫자만 입력가능합니다.");
		obj.value = "";
		obj.focus();
	}
}

//숫자와 하이픈 표시
function isNumberOrHyphen(obj){
	var exp = /[^0-9-]/g;
	if ( exp.test(obj.value) ) {
		alert("숫자와 '-'만 입력가능합니다.");
		obj.value = "";
		obj.focus();
	}
}

function isNumberOrHyphen2(obj){
	var exp = /[^0-9,]/g;
	if ( exp.test(obj.value) ) {
		alert("숫자만 입력가능합니다.");
		obj.value = "";
		obj.focus();
	}
}


//숫자 하이픈, 엔터만 표시
function isNumberOrHyphenOrEnter(obj){
	var exp = /[^0-9-\r\n]/g;
	if ( exp.test(obj.value) ) {
		alert("숫자와 '-'와 엔터키만 가능합니다.");
		obj.value = "";
		obj.focus();
	}
}

// 숫자만 추출한다.
function getNumber(obj){
	var exp = /[^0-9]/g;
	var number = obj.value.replace(exp,"");
	return number;
}

// 전화번호에 하이픈 찍어주기
function cvtPhoneNumber(obj){
	var exp = /-/g;
	var number = obj.value.replace(exp,"");
	var revNumber = reverse(number);
	if ( obj.value.length > 2 ) {
		if ( number.substring(0,2) == "02" ){
			obj.value = number.substring(0,2)+"-"+insertHyphen(number.substring(2));
		} else if ( obj.value.length > 3 && number.substring(0,2) != "02" && number.substring(0,1) == "0" ) {
			obj.value = number.substring(0,3)+"-"+insertHyphen(number.substring(3));
		} else if (obj.value.length > 4 && number.substring(0,1) != "0") {
			obj.value = number.substring(0,4)+"-"+insertHyphen(number.substring(4));
		}
	}
}

// table 내의 rowspan 자동 처리
// tableId :  table id 
// rowIndex : table의 시작 row index(0부터 시작)
// cellIndex : 해당 row의 cell index(0부터 시작)
function cellMergeChk(tableObj, rowIndex, cellIndex) {
	var rowsCn = tableObj.rows.length;
	
	if(rowsCn-1 > rowIndex)
		cellMergeProcess(tableObj, rowIndex, cellIndex);
}

function cellMergeProcess(tableObj, rowIndex, cellIndex) {
	var flag = 0;
	var rowsCn = tableObj.rows.length;
	var compareCellsLen = tableObj.rows(rowIndex).cells.length;  //시작 row에 cell 개수

	//초기화
	var compareObj = tableObj.rows(rowIndex).cells(cellIndex);
	var compareValue = compareObj.innerHTML;
	var cn = 1;
	var delCells = new Array();
	var arrCellIndex = new Array();

	for(i=rowIndex+1; i < rowsCn; i++) {
		var cellsLen = tableObj.rows(i).cells.length;
		var bufCellIndex = cellIndex

		// 실질적인 row에 cellIndex를 구하자.
		if(compareCellsLen != cellsLen) {
			bufCellIndex = bufCellIndex - (compareCellsLen - cellsLen);
		}

		if (bufCellIndex < 0) {
			break;
		}

		cellObj = tableObj.rows(i).cells(bufCellIndex);

		if(compareValue == cellObj.innerHTML) {
			delCells[cn-1] = tableObj.rows(i);		// 삭제할 cell의 row를 저장한다.
			arrCellIndex[cn - 1] = bufCellIndex;	// 해당 row cell index를 저장한다.
			cn++;
			flag = 1;
		} else {
			compareObj.rowSpan = cn;				// 병합
			for(j=0; j < delCells.length; j++) {	// 삭제
				delCells[j].deleteCell(arrCellIndex[j]);
			}

			flag = 0;
			//초기화
			compareObj = cellObj;
			compareValue = cellObj.innerHTML;
			cn = 1;
			delCells = new Array();
			arrCellIndex = new Array();
		}
	}

	if (flag == 1) {
		compareObj.rowSpan = cn;					// 병합
		for(j=0; j < delCells.length; j++) {		// 삭제
			delCells[j].deleteCell(arrCellIndex[j]);
		}
	}

	function setZero(obj){
		if ( obj.value == "" ) {
			obj.value = "0";
		}
	}

	function initZero(obj){
		if ( obj.value == 0 ) {
			obj.value = "";
			obj.focus();
		}
	}
}    


// sms 와 mms 통합
function selfchkLength(frm) {
	var f = frm;
	var tmpStr, nStrLen, reserve;
	var tmpN = 0;
	sInputStr = f.message.value;
	nStrLen = calculate_byte(sInputStr);


	if ( nStrLen > 80) {
		ShowBlend();
	} else {
		ReturnBlend();
	}

	if ( nStrLen > 2000 ) {
		tmpStr = Cut_Str(sInputStr,2000);
		reserve = nStrLen - 2000;

		alert("작성하신 문구는 " + reserve + "바이트가 초과되었습니다.(최대 2000Bytes)"); 

		// 2000byte에 맞게 입력내용 수정
		f.message.value = tmpStr;
		nStrLen = calculate_byte(tmpStr);
		f.msgLength.value = nStrLen;
	} else {
		f.msgLength.value = nStrLen;
	}

	return;
}

// 개인정보 필터
function filterInfo(contents) {

	// 개인정보 필터 방지
	var cellRegcnt = 0;
	var emailRegcnt = 0;
	var psnoRegcnt = 0;
	var totalRegcnt = 0;
	var RegMessage = "";
	var regCell = /\d{2,3}[-\.]\d{3,4}[-\.]\d{4}/g;								// 휴대폰번호 정규식
	var regEmail = /(\w+\.)*\w+@[\w+\.]+\w+/g;									// 이메일 정규식
	var regPsno = /\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])-[1-4]\d{6}/g;	// 주민등록번호 정규식
	var sure = true;;

	if(regCell.test(contents)) {
		cellRegcnt++;
		totalRegcnt++;
	}

	if(regEmail.test(contents)) {
		emailRegcnt++;
		totalRegcnt++;
	}

	if(regPsno.test(contents)) {
		psnoRegcnt++;
		totalRegcnt++;
	}

	if(totalRegcnt == 3 || totalRegcnt == 2) {

		RegMessage = "내용에 개인정보 관련 정보가 들어가있습니다.\n검색엔진에 노출 될 우려가 있습니다.\n개인정보관련 항목들은 해당란에 적는게 안전합니다.\n그래도 저장하시겠습니까?";	

	} else if(totalRegcnt == 1) {

		if(cellRegcnt > 0) {

			RegMessage = "내용에 개인정보 관련 정보가 들어가있습니다.\n검색엔진에 노출 될 우려가 있습니다.\n연락처 정보는 휴대폰 및 전화번호란에 적는게 안전합니다.\n그래도 저장하시겠습니까?";

		} else if(emailRegcnt > 0) {

			RegMessage = "내용에 개인정보 관련 정보가 들어가있습니다.\n검색엔진에 노출 될 우려가 있습니다.\n이메일 정보는 이메일란에 적는게 안전합니다.\n그래도 저장하시겠습니까?";

		} else if(psnoRegcnt > 0) {

			RegMessage = "내용에 개인정보 관련 정보가 들어가있습니다.\n검색엔진에 노출 될 우려가 있습니다.\n주민번호 정보는 내용란에 적지 않는게 안전합니다.\n그래도 저장하시겠습니까?";
		}
	}	

	if(totalRegcnt > 0) {
		sure = confirm(RegMessage);
	}

	return sure;
	
}


// 대문자 자동 변환
function upperCase(){
     document.getElementById("chkflag").value = document.getElementById("chkflag").value.toUpperCase();
}

// ajax로 페이지 호출해서 해당 id로 append (Jquery)
function getAjaxPage(reqPage, param1, param2, param3, innerId, msg) {
	$.ajax({ 
		  type: "GET", 
		  url: reqPage, 
		  async:true,
		  data:"param1="+param1+"&param2="+param2+"&param3="+param3,
		  dataType:"html",
		  success: function(html){
			  //$("#"+innerId).remove();
			  $("#"+innerId).html(html);
		  },
		  error : function(request, status, error) {
			  alert("code : "+request.status+"\r\nmessage : "+request.responseText);
		  }
	});
	
}

/*// 비밀번호 유효성체크
function validPassword(password) {
	var pass = password.value;
	var str = /^[a-zA-Z0-9]{6,12}$/;
	var str2 = /(\w)\1\1\1/;
	var chk_num = pass.search(/[0-9]/g);
	var chk_eng = pass.search(/[a-z]/ig);
	var check = false;
	if (pass == "") {
		alert("비밀번호를 입력해 주세요.");
		password.focus();
	}else if(!str.test(pass) || pass.indexOf(' ') > -1){
		alert("비밀번호는 영문+숫자 6~12자리를 입력해 주세요.");
		password.focus();
	}else if(str2.test(pass)){
		alert("비밀번호에 반복되는 문자 및 숫자가 있습니다.");
		password.focus();
	}else if(chk_num < 0 || chk_eng < 0) {
		alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
		password.focus();
	}else{
		check = true;
	}
	return check;
}

//비밀번호 유효성체크(비밀번호확인)
function validConfirmPassword(password, confirmPassword) {
	var pass = password.value;
	var confirm = confirmPassword.value;
	var str = /^[a-zA-Z0-9]{6,12}$/;
	var str2 = /(\w)\1\1\1/;
	var chk_num = pass.search(/[0-9]/g);
	var chk_eng = pass.search(/[a-z]/ig);
	var check = false;
	if (pass == "") {
		alert("비밀번호를 입력해 주세요.");
		password.focus();
	}else if (pass != confirm) {
		alert("입력한 비밀번호가 서로 다릅니다.");
		confirmPassword.focus();
	}else if(!str.test(pass) || pass.indexOf(' ') > -1){
		alert("비밀번호는 영문+숫자 6~12자리를 입력해 주세요.");
		password.focus();
	}else if(str2.test(pass)){
		alert("비밀번호에 반복되는 문자 및 숫자가 있습니다.");
		password.focus();
	}else if(chk_num < 0 || chk_eng < 0) {
		alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
		password.focus();
	}else{
		check = true;
	}
	return check;
}*/

// url, msg, where[sms:1, email:2]
function openPop(url, msg, whr){
	var height = whr == 1 ? 500: 800;
	var width = whr == 1 ? 589 : 1000;
	window.open(url, msg, "width="+width+", height="+height+", menubar=no, toolbar=no, location=no, resizable=yes, scrollbars=yes");
}


function setEditor(holder){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: holder,
		sSkinURI: "/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				//alert("아싸!");	
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	return oEditors;
}

/* 숫자입력단위 콤마(",") & 입력값 숫자체크 */

var SetComma = function(str) {
    var regMustNumberComma = /^[0-9|,]+$/;
    var regMustNoStartZero = /^[0]/;
    str = str.replace(/,/g,'');
    var retValue = "";
        for(var i = 1; i <= str.length; i++ ) {
            if( i > 1 && (i%3) == 1 )
                retValue = str.charAt(str.length - i) + "," + retValue;
            else
                retValue = str.charAt(str.length - i) + retValue;
        }
        if( regMustNoStartZero.test(retValue) == true) {
            return "0";
        }
        if( regMustNumberComma.test(retValue) == false ) {
            return "";
        }
        
        return retValue;

};


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}