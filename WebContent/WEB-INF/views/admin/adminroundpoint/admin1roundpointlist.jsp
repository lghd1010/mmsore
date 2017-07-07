<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<h2>예선점수</h2>
	<div class="content">
		<div style="margin: 10px">
			<c:forEach items="${competition }" var="competition">
				<a href="admin1roundpointlist.do?mcn_no=${competition.mcn_no }" id="aa" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
			</c:forEach>
		</div>
		<table class="table table-bordered table-hover table-condensed">
			<thead>
				<c:forEach items="${round1DTO }" var="round1DTO" begin="0" end="0">
					<tr>
						<td colspan="9"><h2>${round1DTO.mcn_no }회대회 예선 점수</h2></td>
					</tr>
					<tr>
						<td>이름</td>
						<td>생년월일</td>
						<td>참가부문</td>
						<td>교육원</td>
						<td>첫번째게임 점수</td>
						<td>두번째게임 점수</td>
						<td>세번째게임 점수</td>
						<td>네번째게임 점수</td>
						<td>본선참가버튼</td>
					</tr>
				</c:forEach>
			</thead>
			<tbody>
				<c:forEach items="${round1DTO }" var="round1DTO">
					<tr>
						<td>${round1DTO.ent_name }</td>
						<td>${round1DTO.ent_birthday }</td>
						<td>
							<c:choose>
								<c:when test="${round1DTO.ent_enter == 1}">
									유치부
								</c:when>
								<c:when test="${round1DTO.ent_enter == 2}">
									초등1~2
								</c:when>
								<c:when test="${round1DTO.ent_enter == 3}">
									초등3~4
								</c:when>
								<c:when test="${round1DTO.ent_enter == 4}">
									초등5~6
								</c:when>
							</c:choose>	
						</td>
						<td>${round1DTO.ent_cname }</td>
						<td>${round1DTO.m1_1roundpoint }</td>
						<td>${round1DTO.m1_2roundpoint }</td>
						<td>${round1DTO.m1_3roundpoint }</td>
						<td>${round1DTO.m1_4roundpoint }</td>
						<td>
							<c:choose>
								<c:when test="${round1DTO.m1_round_ck == 1}">
									<a href="" class="btn btn-info btn-xs">본선진출</a>
								</c:when>
								<c:when test="${round1DTO.m1_round_ck == 2}">
									<input type="button" disabled="disabled" class="btn btn-susses btn-xs" value="본선진출완료">
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>