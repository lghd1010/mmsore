<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<div class="content">
		<c:forEach items="${round3DTO }" var="round3DTO" begin="0" end="0">
			<div>
				<c:choose>
					<c:when test="${round3DTO.ent_enter == 1 }">
						<h2 >${round3DTO.mcn_no }회대회 유치부 결승 점수 수정 </h2>
					</c:when>
					<c:when test="${round3DTO.ent_enter == 2 }">
						<h2 >${round3DTO.mcn_no }회대회 초등1~2 결승 점수 수정 </h2>
					</c:when>
					<c:when test="${round3DTO.ent_enter == 3 }">
						<h2 >${round3DTO.mcn_no }회대회 초등3~4 결승 점수 수정 </h2>
					</c:when>
					<c:when test="${round3DTO.ent_enter == 4 }">
						<h2 >${round3DTO.mcn_no }회대회 초등5~6 결승 점수 수정 </h2>
					</c:when>
				</c:choose>
			</div>
			<div style="margin: 10px;">
				<c:forEach items="${competition }" var="competition">
					<a href="admin3roundpointlist.do?mcn_no=${competition.mcn_no }&ent_enter=${round3DTO.ent_enter }" id="aa" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
				</c:forEach>
			</div>
			<div style="margin: 10px;float: left;">
				<c:forEach items="${enterfield }" var="enterfield">
						<a href="admin3roundpointlist.do?mcn_no=${round3DTO.mcn_no }&ent_enter=${enterfield.mef_idx }" id="aa" class="btn btn-warning btn-xs">${enterfield.mef_name }</a>
				</c:forEach>
			</div>
			<div align="right" style="margin-top: 10px;float: left;">
				<a href="admin3roundpointins.do?mcn_no=${round3DTO.mcn_no }&ent_enter=${round3DTO.ent_enter }" class="btn btn-info">결승점수 등록</a>
				<a href="admin3roundpointupdate.do?mcn_no=${round3DTO.mcn_no }&ent_enter=${round3DTO.ent_enter }" class="btn btn-info">결승점수 수정</a>
			</div>
		</c:forEach>
		<table class="table table-bordered table-hover table-condensed">
			<thead>
					<tr>
						<td>이름</td>
						<td>생년월일</td>
						<td>참가부문</td>
						<td>교육원</td>
						<td>첫번째게임 점수</td>
						<td>두번째게임 점수</td>
						<td>총점</td>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${round3DTO }" var="round3DTO">
					<tr>
						<td>${round3DTO.ent_name }</td>
						<td>${round3DTO.ent_birthday }</td>
						<td>
							<c:choose>
								<c:when test="${round3DTO.ent_enter == 1}">
									유치부
								</c:when>
								<c:when test="${round3DTO.ent_enter == 2}">
									초등1~2
								</c:when>
								<c:when test="${round3DTO.ent_enter == 3}">
									초등3~4
								</c:when>
								<c:when test="${round3DTO.ent_enter == 4}">
									초등5~6
								</c:when>
							</c:choose>	
						</td>
						<td>${round3DTO.ent_cname }</td>
						<td>${round3DTO.m3_1roundpoint }점(${round3DTO.m3_1roundtime }초)</td>
						<td>${round3DTO.m3_2roundpoint }점</td>
						<td>${round3DTO.pointsum }점</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>