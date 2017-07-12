<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<div class="content">
		<c:forEach items="${round2DTO }" var="round2DTO" begin="0" end="0">
			<div>
				<c:choose>
					<c:when test="${round2DTO.ent_enter == 1 }">
						<h2 >${round2DTO.mcn_no }회대회 유치부 본선 점수 수정 </h2>
					</c:when>
					<c:when test="${round2DTO.ent_enter == 2 }">
						<h2 >${round2DTO.mcn_no }회대회 초등1~2 본산 점수 수정 </h2>
					</c:when>
					<c:when test="${round2DTO.ent_enter == 3 }">
						<h2 >${round2DTO.mcn_no }회대회 초등3~4 본산 점수 수정 </h2>
					</c:when>
					<c:when test="${round2DTO.ent_enter == 4 }">
						<h2 >${round2DTO.mcn_no }회대회 초등5~6 본산 점수 수정 </h2>
					</c:when>
				</c:choose>
			</div>
			<div style="margin: 10px;">
				<c:forEach items="${competition }" var="competition">
					<a href="admin2roundpointupdate.do?mcn_no=${competition.mcn_no }&ent_enter=${round2DTO.ent_enter }" id="aa" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
				</c:forEach>
			</div>
			<div style="margin: 10px;float: left;">
				<c:forEach items="${enterfield }" var="enterfield">
						<a href="admin2roundpointupdate.do?mcn_no=${round2DTO.mcn_no }&ent_enter=${enterfield.mef_idx }" id="aa" class="btn btn-warning btn-xs">${enterfield.mef_name }</a>
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
						<td>첫번째게임 점수</td>
						<td>두번째게임 점수</td>
						<td>세번째게임 점수</td>
						<td>네번째게임 점수</td>
						<td>수정버튼</td>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${round2DTO }" var="round2DTO">
					<form action="admin2roundpointupdatee.do" id="frm" name="frm" method="post">
					<tr>
						<td>${round2DTO.ent_name }</td>
						<td>${round2DTO.ent_birthday }</td>
						<td>
							<c:choose>
								<c:when test="${round2DTO.ent_enter == 1}">
									유치부
								</c:when>
								<c:when test="${round2DTO.ent_enter == 2}">
									초등1~2
								</c:when>
								<c:when test="${round2DTO.ent_enter == 3}">
									초등3~4
								</c:when>
								<c:when test="${round2DTO.ent_enter == 4}">
									초등5~6
								</c:when>
							</c:choose>	
						</td>
						<td>${round2DTO.ent_cname }</td>
						<td>
						<input type="text" id="m2_1roundpoint" name="m2_1roundpoint" value="${round2DTO.m2_1roundpoint }" style="width: 50px">
						<input type="text" id="m2_1time" name="m2_1time" value="${round2DTO.m2_1time }" style="width: 50px">
						</td>
						<td>
						<input type="text" id="m2_2roundpoint" name="m2_2roundpoint" value="${round2DTO.m2_2roundpoint }" style="width: 50px">
						<input type="text" id="m2_2time" name="m2_2time" value="${round2DTO.m2_2time }" style="width: 50px">
						</td>
						<td>
						<input type="text" id="m2_3roundpoint" name="m2_3roundpoint" value="${round2DTO.m2_3roundpoint }" style="width: 50px">
						<input type="text" id="m2_3time" name="m2_3time" value="${round2DTO.m2_3time }" style="width: 50px">
						</td>
						<td>
						<input type="text" id="m2_4roundpoint" name="m2_4roundpoint" value="${round2DTO.m2_4roundpoint }" style="width: 50px">
						<input type="text" id="m2_4time" name="m2_4time" value="${round2DTO.m2_4time }" style="width: 50px">
						<input type="hidden" id="mcn_no" name="mcn_no" value="${round2DTO.mcn_no }">
						<input type="hidden" id="ent_enter" name="ent_enter" value="${round2DTO.ent_enter }">
						<input type="hidden" id="m2_idx" name="m2_idx" value="${round2DTO.m2_idx }">
						</td>
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