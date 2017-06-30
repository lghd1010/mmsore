<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div class="container">
		<h2 align="center">회원가입</h2>
			<form action="" method="post" id="frm" name="frm" enctype="multipart/form-data">
				<div class="content" align="center" >
				<input type="hidden" id="idCheckAt" value="N"/>
					<table class="table" style="width: 500px">
						<tr>
							<th class="active">아이디</th>
							<td><input type="text" id="m_id" name="m_name" placeholder="아이디 입력"></td>
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
									<option value="">---성별을 선택해 주세요---</option>
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
								<input type="text" name="m_cname" id="m_cname" onkeyup="joinAutoCompleteSub();" onblur="autoCompleteCheck();">
							<input type="hidden" name="b_idx" id="b_idx">
							<select id="m_cname_select" style="display: none">
								<c:forEach var="eduinfoDTO" items="${eduinfoDTO }" >
									<option value="${eduinfoDTO.e_name }">${eduinfoDTO.b_idx }</option>
								</c:forEach>
							</select>
							</td>
						</tr>
					</table>
				</div>	
			</form>
	</div>