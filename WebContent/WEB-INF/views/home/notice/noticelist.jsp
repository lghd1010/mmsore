<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="container">
		<h2>공지사항</h2>
			<div class="content">
				<div align="right">
				게시글 수 ${noticeCount }개
				</div>
				<table class="table table-bordered table-hover table-condensed">
					<thead align="center">
						<tr>
							<td class="active">번호</td>
							<td class="active">제목</td>
							<td class="active">글쓴이</td>
							<td class="active">등록일</td>
							<td class="active">조회수</td>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach items="${noticelist }" var="noticelist">
							<tr>
								<td>${noticelist.ROWNUM }</td>
								<td><a href="noticedetail.do?boardno=${noticelist.boardno }">${noticelist.title }</a></td>
								<td>${noticelist.name }</td>
								<td>${noticelist.regdate }</td>
								<td>${noticelist.countno }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			 <div style="text-align: center; clear: both;">
				<c:set var="pager" value="${pager.toString()}" />
				<ul class="pagination">${pager}</ul>
			</div>
			<div class="btn" align="right">
				<a href="noticewritefram.do" class="btn btn-info">글 쓰기</a>
			</div>
	</div>