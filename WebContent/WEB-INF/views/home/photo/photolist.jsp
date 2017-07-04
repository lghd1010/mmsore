<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div class="container">
		<label><h2>사진게시판</h2></label>
		<div>
			<p align="right">
				▶Total :
				<c:out value="${getphotoCount}" />
				<br>
			</p>
		</div>
		<div class="row">
			<c:if test="${not empty getphotoCount}">
				<c:forEach var="list" items="${list}">
					<c:choose>
						<c:when test="${fn:length(list.title) > 30}">
							<div class="col-md-3">
								<a href="photodetail.do?bno=${list.boardno}" class="thumbnail" style="width: auto; height: 100%">
								<img src="${list.uploadfile}" alt="" style="width: auto; height: 150px">
								<c:out value="${fn:substring(list.title,0,29)}"/>....
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-md-3">
								<a href="photodetail.do?bno=${list.boardno}" class="thumbnail"
									style="width: auto; height: 100%"><img
									src="${list.uploadfile}" alt=""
									style="width: auto; height: 150px">
									<p>제목 : ${list.title}</p></a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
		</div>
		<c:if test="${memberInfo.m_type>=1}">
			<div align="right">
				<a type="button" class="btn btn-info" href="photoWriteFrom.do">사진등록</a>
			</div>
		</c:if>
		<div style="text-align: center; clear: both;">
			<c:set var="pager" value="${pager.toString()}" />
			<ul class="pagination">${pager}</ul>
		</div>
		<!--<div class="jb-center" align="center">
						<ul class="pagination">
							<li><a href="photoList.do?pg=1">1</a></li>
							<li><a href="photoList.do?pg=2">2</a></li>
							<li><a href="photoList.do?pg=3">3</a></li>
							<li><a href="photoList.do?pg=4">4</a></li>
							<li><a href="photoList.do?pg=5">5</a></li>
							<li><a href="photoList.do?pg=6">6</a></li>
							<li><a href="photoList.do?pg=7">7</a></li>
							<li><a href="photoList.do?pg=8">8</a></li>
							<li><a href="photoList.do?pg=9">9</a></li>
							<li><a href="photoList.do?pg=10">10</a></li>
						</ul>
					</div>-->
		<br />
		<div style="text-align: center;">
			<form action="photoSearch.do">
				<select id="select" name="field">
					<option value="title">제목</option>
					<option value="name">작성자</option>
				</select> <input type="text" name="query"> <input
					class="btn btn-primary" type="submit" value="검색">
			</form>
		</div>
	</div>