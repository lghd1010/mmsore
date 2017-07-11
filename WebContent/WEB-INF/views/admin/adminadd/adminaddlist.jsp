<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<h2>대회목록</h2>
		<div class="content">
			<div>
				<c:forEach items="${competition }" var="competition">
					<a href="adminaddlsit.do?mcn_no=${competition.mcn_no }" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
				</c:forEach>
			</div>
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<td>No</td>
						<td>대회 횟차</td>
						<td>대회 이름</td>
						<td>접수시작일</td>
						<td>접수종료일</td>
						<td>대회일자</td>
						<td>대회장소</td>
						<td>대회참가비</td>
						<!-- <td>주최기관</td> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${addDTO }" var="addDTO">
						<tr>
							<td>${addDTO.ROWNUM }</td>
							<td>${addDTO.ma_comp_no }회</td>
							<td><a href="adminadddetaile.do?ma_idx=${addDTO.ma_idx }">${addDTO.ma_comname }</a></td>
							<td>${addDTO.ma_receipt_start }</td>
							<td>${addDTO.ma_receipt_end }</td>
							<td>${addDTO.ma_comdate }</td>
							<td>${addDTO.ma_complace }</td>
							<td>${addDTO.ma_comprice }원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="right">
				<c:forEach items="${addDTO }" var="addDTO" begin="0" end="0">
					<a href="adminaddins.do?mcn_no=${addDTO.ma_comp_no }" class="btn btn-info">등록</a>
				</c:forEach>
			</div>
		</div>
</div>