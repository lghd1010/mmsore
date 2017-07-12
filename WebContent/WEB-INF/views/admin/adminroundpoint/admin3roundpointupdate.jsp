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
						<h2 >${round3DTO.mcn_no }회대회 유치부 결승 점수  </h2>
					</c:when>
					<c:when test="${round3DTO.ent_enter == 2 }">
						<h2 >${round3DTO.mcn_no }회대회 초등1~2 결승 점수  </h2>
					</c:when>
					<c:when test="${round3DTO.ent_enter == 3 }">
						<h2 >${round3DTO.mcn_no }회대회 초등3~4 결승 점수  </h2>
					</c:when>
					<c:when test="${round3DTO.ent_enter == 4 }">
						<h2 >${round3DTO.mcn_no }회대회 초등5~6 결승 점수  </h2>
					</c:when>
				</c:choose>
			</div>
			<div style="margin: 10px;">
				<c:forEach items="${competition }" var="competition">
					<a href="admin3roundpointupdate.do?mcn_no=${competition.mcn_no }&ent_enter=${round3DTO.ent_enter }" id="aa" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
				</c:forEach>
			</div>
			<div style="margin: 10px;float: left;">
				<c:forEach items="${enterfield }" var="enterfield">
						<a href="admin3roundpointupdate.do?mcn_no=${round3DTO.mcn_no }&ent_enter=${enterfield.mef_idx }" id="aa" class="btn btn-warning btn-xs">${enterfield.mef_name }</a>
				</c:forEach>
			</div>
		</c:forEach>
		<table class="table table-bordered table-hover table-condensed">
			<thead>
					<tr>
						<td>이름</td>
						<td>생년월일</td>
						<td>참가부문</td>
						<td>교육원</td>
						<td>첫번째게임 점수(시간)</td>
						<td>두번째게임 점수</td>
						<td>수정버튼</td>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${round3DTO }" var="round3DTO">
					<form action="admin3roundpointupdatee.do?mcn_no=${round3DTO.mcn_no }&ent_enter=${round3DTO.ent_enter }&m3_idx=${round3DTO.m3_idx }" id="frm" name="frm" method="post">
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
						<td>
							<input type="text" id="m3_1roundpoint" name="m3_1roundpoint" value="${round3DTO.m3_1roundpoint }">
							<input type="text" id="m3_1roundtime" name="m3_1roundtime" value="${round3DTO.m3_1roundtime }">
						</td>
						<td><input type="text" id="m3_2roundpoint" name="m3_2roundpoint" value="${round3DTO.m3_2roundpoint }">
					
						<td><input type="submit" class="btn btn-info btn-xs" value="수정"></td>
					</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>