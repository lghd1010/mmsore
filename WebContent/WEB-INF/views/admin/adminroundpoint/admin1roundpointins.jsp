<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<div class="content">
		<div style="margin: 5px">
			
				<c:forEach items="${enterDTO }" var="enterDTO" begin="0" end="0"> 
					<c:choose>
						<c:when test="${enterDTO.ent_enter == 1 }">
							<h2>${enterDTO.mcn_no }회 유치부 예선 점수등록</h2>
						</c:when>
						<c:when test="${enterDTO.ent_enter == 2 }">
							<h2>${enterDTO.mcn_no }회 초등1~2 예선  점수등록</h2>
						</c:when>
						<c:when test="${enterDTO.ent_enter == 3 }">
							<h2>${enterDTO.mcn_no }회 초등3~4 예선  점수등록</h2>
						</c:when>
						<c:when test="${enterDTO.ent_enter == 4 }">
							<h2>${enterDTO.mcn_no }회 초등5~6 예선  점수등록</h2>
						</c:when>
					</c:choose>
					<div style="margin-bottom: 10px">
						<c:forEach items="${competition }" var="competition"> 
							<a href="admin1roundpointins.do?mcn_no=${competition.mcn_no }&ent_enter=${enterDTO.ent_enter }" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
						</c:forEach>
					</div>
					<div>
						<c:forEach items="${enterfield }" var="enterfield">
							<a href="admin1roundpointins.do?mcn_no=${enterDTO.mcn_no }&ent_enter=${enterfield.mef_idx }" id="aa" class="btn btn-warning btn-xs">${enterfield.mef_name }</a>
						</c:forEach>
					</div>
				</c:forEach>
		</div>
		<table class="table table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<td>이름</td>
					<td>생년월일</td>
					<td>교육원</td>
					<td>참가부문</td>
					<td>1번게임 점수</td>
					<td>2번게임 점수</td>
					<td>3번게임 점수</td>
					<td>4번게임 점수</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${enterDTO }" var="enterDTO">
					<tr>
						<td>${enterDTO.ent_name }<input type="hidden" id="" name="" value="${enterDTO.ent_name }"></td>
						<td>${enterDTO.ent_birthday }<input type="hidden" id="" name="" value="${enterDTO.ent_birthday }"></td>
						<td>${enterDTO.ent_cname }<input type="hidden" id="" name="" value="${enterDTO.ent_cname }"></td>
						<td><c:choose>
								<c:when test="${enterDTO.ent_enter == 1}">
									유치부<input type="hidden" id="" name="" value="${enterDTO.ent_enter }">
								</c:when>
								<c:when test="${enterDTO.ent_enter == 2}">
									초등1~2<input type="hidden" id="" name="" value="${enterDTO.ent_enter }">
								</c:when>
								<c:when test="${enterDTO.ent_enter == 3}">
									초등3~4<input type="hidden" id="" name="" value="${enterDTO.ent_enter }">
								</c:when>
								<c:when test="${enterDTO.ent_enter == 4}">
									초등5~6<input type="hidden" id="" name="" value="${enterDTO.ent_enter }">
								</c:when>
							</c:choose>	</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>