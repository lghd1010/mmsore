<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<h2>대회신청</h2>
		<div class="content">
			<table class="table table-bordered table-hover table-condensed">
				<thead align="center">
					<tr>
						<td>이름</td>
						<td>생년월일</td>
						<td>교육원</td>
						<td>성별</td>
						<td>연락처</td>
						<td>학교</td>
						<td>티셔츠</td>
					</tr>
				</thead>
				<tbody align="center">
					<tr>
						<td>${memberInfo.name }</td>
						<td>${memberInfo.m_birthday }</td>
						<td>${memberInfo.m_cname }</td>
						<td>${memberInfo.m_gender }</td>
						<td>${memberInfo.m_number }</td>
						<td>${memberInfo.m_schoolname }</td>
						<td>
							<select>
								<option></option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
</div>