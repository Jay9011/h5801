/**
 *  이메일 중복확인, 비밀번호 중복확인, 닉네임 중복확인 
 */

    // 핸드폰 숫자만 나오게 한후 -생성
    $(document).on("keyup", "#phoneNum", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^01.{1})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
    // 생년월일 숫자만 나오게 한후 -생성
    $(document).on("keyup", "#birth", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/,'$1-$2-$3').replace("--", "-")); });
  


function chknick(nick) {
	var httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = function() {
		if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
			if(httpRequest.responseText == 0){
				document.getElementById("chkNick").innerHTML = "사용할 수 있는 닉네임 입니다.";
				document.getElementById('chkNick').style.color = "blue";
			}else{
				document.getElementById("chkNick").innerHTML = "사용할 수 없는 닉네임 입니다.";
				document.getElementById('chkNick').style.color = "red";
			}
		}
	}
	httpRequest.open("GET","nickChk.ho?nick="+nick,true);
	httpRequest.send();
}//chknick() end

function chkemail(email) {
	var httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = function() {
		if(httpRequest.readyState == XMLHttpRequest.DONE && httpRequest.status == 200){
			if(httpRequest.responseText == 0){
				document.getElementById("chkEmail").innerHTML = "사용할 수 있는 이메일 입니다.";
				document.getElementById('chkEmail').style.color = "blue";
			}else{
				document.getElementById("chkEmail").innerHTML = "사용할 수 없는 이메일 입니다.";
				document.getElementById('chkEmail').style.color = "red";
			}
		}
	}
	httpRequest.open("GET","emailChk.ho?email="+email,true);
	httpRequest.send();
}//chkemail() end

// 비밀번호 중복확인
function chkPwd(){
	var frm = document.joinFrm;
	var pw1 = frm.pw.value;
	var pw2 = frm.pwchk.value;
	if(pw1 != pw2){
		document.getElementById('chkPW').style.color = "red";
		document.getElementById('chkPW').innerHTML = "동일한 암호를 입력하세요.";
	}else{
		   document.getElementById('chkPW').style.color = "blue";
		   document.getElementById('chkPW').innerHTML = "암호가 확인 되었습니다.";
	 }
}
