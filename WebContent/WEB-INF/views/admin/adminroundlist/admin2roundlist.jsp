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
		<div class="content">
			<div style="margin: 5px">
				<c:forEach items="${enterDTO2 }" var="enterDTO2" begin="0" end="0"> 
					<c:choose>
						<c:when test="${enterDTO2.m1_enter == 1 }">
							<h2>${enterDTO2.mcn_no }회 유치부 본선 참가자관리</h2>
						</c:when>
						<c:when test="${enterDTO2.m1_enter == 2 }">
							<h2>${enterDTO2.mcn_no }회 초등1~2 본선 참가자관리</h2>
						</c:when>
						<c:when test="${enterDTO2.m1_enter == 3 }">
							<h2>${enterDTO2.mcn_no }회 초등3~4 본선 참가자관리</h2>
						</c:when>
						<c:when test="${enterDTO2.m1_enter == 4 }">
							<h2>${enterDTO2.mcn_no }회 초등5~6 본선 참가자관리</h2>
						</c:when>
					</c:choose>
					<div style="margin-bottom: 10px">
						<c:forEach items="${competition }" var="competition"> 
							<a href="admin1roundlist.do?mcn_no=${competition.mcn_no }&ent_enter=${enterDTO2.m1_enter }" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
						</c:forEach>
					</div>
					<div>
						<c:forEach items="${enterfield }" var="enterfield">
							<a href="admin1roundlist.do?mcn_no=${enterDTO2.mcn_no }&ent_enter=${enterfield.mef_idx }" id="aa" class="btn btn-warning btn-xs">${enterfield.mef_name }</a>
						</c:forEach>
					</div>
				</c:forEach>
				<div align="right">
					예선전 신청 인원 : ${enterCount2 }명
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
					<c:forEach items="${enterDTO2 }" var="enterDTO2"> 
						<tr>
							<td>${enterDTO2.ROWNUM }</td>
							<td>${enterDTO2.m1_name }</td>
							<td>${enterDTO2.m_birthday }</td>
							<td><c:choose>
									<c:when test="${enterDTO2.m1_enter == 1}">
										유치부
									</c:when>
									<c:when test="${enterDTO2.m1_enter == 2}">
										초등1~2
									</c:when>
									<c:when test="${enterDTO2.m1_enter == 3}">
										초등3~4
									</c:when>
									<c:when test="${enterDTO2.m1_enter == 4}">
										초등5~6
									</c:when>
								</c:choose></td>
							<td>${enterDTO2.m1_cname }</td>
							<td>${enterDTO2.mcn_no }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
</body>
</html>