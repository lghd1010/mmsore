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
	<h2>대회 횟차 관리</h2>
	<div class="content">
		<table class="table table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<td>대회 횟차</td>
					<td>대회 이름</td>
					<td>대회 등록일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${addDTO }" var="addDTO"> 
					<tr>
						<td>${addDTO.mcn_no }</td>
						<td>${addDTO.mcn_name }</td>
						<td>${addDTO.mcn_regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form action="admincompnoinsert.do" method="post">
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<td>대회 횟차</td>
						<td>대회 이름</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" id="mcn_no" name="mcn_no"></td>
						<td><input type="text" id="mcn_name" name="mcn_name"></td>
					</tr>
				</tbody>
			</table>
			<div class="btn">
				<input type="submit" value="등록">
			</div>
		</form>
	</div>
</div>
</body>
</html>