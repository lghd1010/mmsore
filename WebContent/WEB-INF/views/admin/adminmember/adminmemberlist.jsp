<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div class="container">
		<h2>회원정보</h2>
		<div class="content">
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>생년월일</td>
						<td>전화번호</td>
						<td>교육원</td>
						<td>회원등급</td>
						<td>가입일</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberlist }" var="memberlist">
						<tr>
							<td>${memberlist.ROWNUM }</td>
							<td>${memberlist.name }</td>
							<td>${memberlist.m_birthday }</td>
							<td>${memberlist.m_number }</td>
							<td>${memberlist.m_cname }</td>
							<td>${memberlist.m_type }</td>
							<td>${memberlist.m_regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="text-align: center; clear: both;">
				<c:set var="pager" value="${pager.toString()}" />
				<ul class="pagination">${pager}</ul>
			</div>
	</div>