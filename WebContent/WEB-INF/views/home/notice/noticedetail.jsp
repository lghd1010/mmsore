<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="container">
		<h2>공지사항</h2>
		<div class="content">
			<table class="table">
				<tr>
					<th class="active">제목</th>
					<td>${noticeDTO.title }</td>
					<th class="active">등록일</th>
					<td>${noticeDTO.regdate }</td>
					<th class="active">조회수</th>
					<td>${noticeDTO.countno }</td>
				</tr>
				<tr>
					<th class="active">내용</th>
					<td colspan="5">${noticeDTO.content }</td>
				</tr>
			</table>
		</div>
		<div align="center">
			<input class="btn btn-default" onclick="history.go(-1);" type="button" value="뒤로가기">
		</div>
	</div>