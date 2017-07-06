<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>본선참가자관리</h2>
		<div class="content">
			<div style="margin: 5px">
				<c:forEach items="${competition }" var="competition"> 
					<a href="admin3roundlist.do?mcn_no=${competition.mcn_no }" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
				</c:forEach>
				<div align="right">
					예선전 신청 인원 : ${enterCount3 }명
				</div>
			</div>
			<table class="table table-bordered table-hover table-condensed">
				<thead align="center">
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>생년월일</td>
						<td>참가부문</td>
						<td>교육원</td>
						<td>참가대회횟차</td>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${enterDTO3 }" var="enterDTO3"> 
						<tr>
							<td>${enterDTO3.ROWNUM }</td>
							<td>${enterDTO3.m2_name }</td>
							<td>${enterDTO3.m_birthday }</td>
							<td><c:choose>
									<c:when test="${enterDTO3.m2_enter == 1}">
										유치부
									</c:when>
									<c:when test="${enterDTO3.m2_enter == 2}">
										초등1~2
									</c:when>
									<c:when test="${enterDTO3.m2_enter == 3}">
										초등3~4
									</c:when>
									<c:when test="${enterDTO3.m2_enter == 4}">
										초등5~6
									</c:when>
								</c:choose></td>
							<td>${enterDTO3.m2_cname }</td>
							<td>${enterDTO3.mcn_no }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
</body>
</html>