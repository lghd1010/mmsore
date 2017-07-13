<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>
		<tiles:getAsString name="title"/>
</title>

<!-- 네이버 에디터 링크 -->
<script type="text/javascript" charset="utf-8" src="ROOT/navereditor/js/HuskyEZCreator.js"></script>

<!-- StyleSheet  Link 영역 -->
<link href='<tiles:getAsString name="css"/>' type="text/css" rel="stylesheet" />
</head>
<body>
	<!-- Header 영역 -->
	<tiles:insertAttribute name="header" />
	<!-- Visual 영역 -->
	<tiles:insertAttribute name="visual" />
	<!-- Main   영역  -->
	<div id="main">
		<div class="top-wrapper clear">
			<!-- Content 영역 -->
			<tiles:insertAttribute name="content" />
			<%-- <c:if test="${param.bno != null}">
				<jsp:include page="/WEB-INF/views/home/boardFree/freeMain.jsp"></jsp:include>
			</c:if> --%>
			<!-- Aside(Navi) 영역 -->
			<tiles:insertAttribute name="aside" />
		</div>
	</div>

	<!-- Footer 영역  -->
	<tiles:insertAttribute name="footer" />

	<!-- javascript 영역 -->
	<script type="text/javascript" src='<tiles:getAsString name="js"/>'></script>
</body>
</html>