<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<input type="hidden" id="boardNo" value="${param.bno}">
<div class="container">
	<h2>게시판</h2>
		<table class="table table-striped">
			<tbody>
				<tr>
					<th colspan="3">제목 | ${photoDTO.title }</th>
				</tr>
				<tr>
					<th colspan="1">작성자 | ${photoDTO.name }</th>
					<th colspan="1">조회수 | ${photoDTO.countno }</th>
					<th colspan="1">작성일 | ${photoDTO.regdate }</th>
				</tr>
			</tbody>
		</table>
		<table class="table">
		<tr>
			<th colspan="3" class="active">내용</th>
		</tr>
		<tr>
			<td>${photoDTO.content}</td>
		</tr>
		<tr>
			<td>
				<div align="right">
					<a class="btn btn-default" type="button" id="list" href="photolist.do">목록</a>
				</div>
			</td>
		</tr>
	</table>
</div>