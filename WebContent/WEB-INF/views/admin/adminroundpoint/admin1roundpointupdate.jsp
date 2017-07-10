<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<div class="content">
		<c:forEach items="${round1DTO }" var="round1DTO" begin="0" end="0">
			<c:choose>
				<c:when test="${round1DTO.ent_enter == 1 }">
					<h2>${round1DTO.mcn_no }회대회 유치부 예선 점수 수정 </h2>
				</c:when>
				<c:when test="${round1DTO.ent_enter == 2 }">
					<h2>${round1DTO.mcn_no }회대회 초등1~2 예선 점수 수정 </h2>
				</c:when>
				<c:when test="${round1DTO.ent_enter == 3 }">
					<h2>${round1DTO.mcn_no }회대회 초등3~4 예선 점수 수정 </h2>
				</c:when>
				<c:when test="${round1DTO.ent_enter == 4 }">
					<h2>${round1DTO.mcn_no }회대회 초등5~6 예선 점수 수정 </h2>
				</c:when>
			</c:choose>		
			<div style="margin: 10px">
								<c:forEach items="${competition }" var="competition">
									<a href="admin1roundpointupdate.do?mcn_no=${competition.mcn_no }&ent_enter=${round1DTO.ent_enter }" id="aa" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
								</c:forEach>
							</div>
							
							<div style="margin: 10px">
								<c:forEach items="${enterfield }" var="enterfield">
										<a href="admin1roundpointupdate.do?mcn_no=${round1DTO.mcn_no }&ent_enter=${enterfield.mef_idx }" id="aa" class="btn btn-warning btn-xs">${enterfield.mef_name }</a>
								</c:forEach>
							</div>	
		</c:forEach>
		<table class="table table-bordered table-hover table-condensed">
			<thead>
				<c:forEach items="${round1DTO }" var="round1DTO" begin="0" end="0">
					<tr>
						<td>이름</td>
						<td>생년월일</td>
						<td>참가부문</td>
						<td>교육원</td>
						<td>첫번째게임 점수</td>
						<td>두번째게임 점수</td>
						<td>세번째게임 점수</td>
						<td>네번째게임 점수</td>
						<td>점수 수정버튼</td>
					</tr>
				</c:forEach>
			</thead>
			<tbody>
				<c:forEach items="${round1DTO }" var="round1DTO">
					<form action="admin1roundpointupdates.do?mcn_no=${round1DTO.mcn_no }&ent_enter=${round1DTO.ent_enter }" method="post">
					<tr>
						<td><input type="hidden" name="m1_idx" value="${round1DTO.m1_idx }">${round1DTO.ent_name }</td>
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
						<td style="width: 120px"><input type="text" id="m1_1roundpoint" name="m1_1roundpoint" value="${round1DTO.m1_1roundpoint }" style="width: 50%"></td>
						<td style="width: 120px"><input type="text" id="m1_2roundpoint" name="m1_2roundpoint" value="${round1DTO.m1_2roundpoint }" style="width: 50%"></td>
						<td style="width: 120px"><input type="text" id="m1_3roundpoint" name="m1_3roundpoint" value="${round1DTO.m1_3roundpoint }" style="width: 50%"></td>
						<td style="width: 120px"><input type="text" id="m1_4roundpoint" name="m1_4roundpoint" value="${round1DTO.m1_4roundpoint }" style="width: 50%"></td>
						<td>
							<input type="submit" id="btn" class="btn btn-info btn-xs" value="수정">
						</td>
					</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>