<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div class="container">
		<h2 align="center">회원가입</h2>
			<form class="form-horizontal" name="joinform" action="" method="post" onsubmit="return CheckForm();">
				<div class="content" align="center" >
				<input type="hidden" id="idCheckAt" value="N"/>
					<table class="table" style="width: 500px">
						<tr>
							<th class="active">회원정보</th>
							<td>
								<label class="radio-inline">
							      <input type="radio" id="m_no" name="m_no" value="1">학생
							    </label>
							    <label class="radio-inline">
							      <input type="radio" id="m_no" name="m_no" value="2">선생님
							    </label>
							    <label class="radio-inline">
							      <input type="radio" id="m_no" name="m_no" value="3">지사장님
							    </label>
							</td>
						</tr>
						<tr>
							<th class="active">아이디</th>
							<td><input type="text" id="m_id" name="m_id" placeholder="아이디 입력"></td>
						</tr>
						<tr>
							<th class="active">비밀번호</th>
							<td><input type="password" id="m_pass" name="m_pass" placeholder="비밀번호 입력"></td>
						</tr>
						<tr>
							<th class="active">비밀번호확인</th>
							<td><input type="password" id="m_pass_ck" name="m_pass_ck" placeholder="비밀번호한번더 입력"></td>
						</tr>
						<tr>
							<th class="active">이름</th>
							<td><input type="text" id="name" name="name" placeholder="이름 입력"></td>
						</tr>
						<tr>
							<th class="active">성별</th>
							<td>
								<select id="m_gender" name="m_gender">
									<option value="0">---성별을 선택해 주세요---</option>
									<option value="1">남자</option>
									<option value="2">여자</option>
								</select>
							</td>
						</tr>
						<tr>
							<th class="active">생년월일</th>
							<td><input type="text" id="datepicker_1" name="m_birthday" placeholder="생년월일 선택" readonly="readonly"></td>
						</tr>
						<tr>
							<th class="active">이메일</th>
							<td><input type="text" id="m_email" name="m_email" placeholder="이메일 입력"></td>
						</tr>
						<tr>
							<th class="active">전화번호</th>
							<td><input type="text" name="m_number" id="cellPhone" placeholder="전화번호 입력" maxlength="13" /></td>
						</tr>
						<tr>
							<th class="active">교육원</th>
							<td>
								<input type="text" name="m_cname" id="m_cname" onkeyup="joinAutoCompleteSub();" onblur="autoCompleteCheck();" placeholder="교육원이름 입력">
							<input type="hidden" name="b_idx" id="b_idx">
							<select id="m_cname_select" style="display: none">
								<c:forEach var="eduinfoDTO" items="${eduinfoDTO }" >
									<option value="${eduinfoDTO.e_name }">${eduinfoDTO.b_idx }</option>
								</c:forEach>
							</select>
							<label id="m_cname_label"></label>
							</td>
						</tr>
						<tr>
							<th class="active">학교/학년</th>
							<td>
								<input type="text" id="m_schoolname" name="m_schoolname" placeholder="학교 입력">
								<select id="m_class" name="m_class">
									<option value="7">선택</option>
									<option value="0">유치부</option>
									<option value="1">1학년</option>
									<option value="2">2학년</option>
									<option value="3">3학년</option>
									<option value="4">4학년</option>
									<option value="5">5학년</option>
									<option value="6">6학년</option>
								</select>
							</td>
						</tr>
					</table>
					<div>
						<input type="submit" value="asd">
					</div>
				</div>	
			</form>
			
<script>
	var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
	var re_email = /^(\w+)(((\.?)(\w+))*)[@](((\w+)[.])+)(\w{2,3})$/;  // 이메일 검사식 */
	var re_url = /^(\d+)+[0|1](\d)+([0|1|2|3]\d)$/;
	var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
	   
	var uid = document.getElementById("m_id");
	var upw = document.getElementById("m_pass");
	var upw2 = document.getElementById("m_pass_ck");
	var name2 = document.getElementById("name");
	var tel = document.getElementById("cellPhone");
	var gender = document.getElementById("m_gender");
	var birthday = document.getElementById("datepicker_1");
	var m_email = document.getElementById("m_email");
	var m_cname = document.getElementById("m_cname");
	var m_class = document.getElementById("m_class");
	var m_schoolname = document.getElementById("m_schoolname");

	function CheckForm() {
		var result= true;
		if(uid.value == "") {
			alert('유효한 아이디를 입력해 주세요');
			uid.focus();
			return false;
		}
		if(re_pw.test(upw.value) != true) { // 비밀번호 검사
			alert('유효한 비밀번호를 입력해 주세요');
			upw.focus();
			return false;
		}
		if(re_pw.test(upw.value) != re_pw.test(upw2.value)) { // 비밀번호 검사
			alert('입력한 비밀번호와 틀립니다.');
			upw2.focus();
			return false;
		}
		if(name2.value == "") { // 이름 검사
			alert('이름 을 입력해 주세요.');
			name2.focus();
			return false;
		}
		if(gender.value == 0) {
			alert('성별을 선택해 주세요');
			gender.focus();
			return false;
		}
		
		if(birthday.value == "") { // 이름 검사
			alert('생년월일을 선택해 주세요');
			birthday.focus();
			return false;
		}
		
		if(re_email.test(m_email.value) != true) { // 전화번호 검사
			alert('유효한이메일을 입력해 주세요.');
			m_email.focus();
			return false;
		}
		
		if(re_tel.test(tel.value) != true) { // 전화번호 검사
			alert('유효한 전화번호를 입력해 주세요.');
			tel.focus();
			return false;
		}
		
		if(m_cname.value == '') {
			alert('교육원 이름을 입력해 주세요');
			m_cname.focus();
			return false;
		}
		
		if(m_schoolname.value == '') {
			alert('학교/유치원 이름을 입력해 주세요');
			m_schoolname.focus();
			return false;
		}
		
		if(m_class.value == 7) {
			alert('학년을 선택해 주세요');
			m_class.focus();
			return false;
		}
		
		

		
	}
	$('#m_id, #m_pass').after('<strong></strong>');
</script>
	</div>