<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<div class="content">
		<div style="margin: 5px">
			<c:forEach items="${enterDTO3 }" var="enterDTO3" begin="0" end="0">
				<c:choose>
					<c:when test="${enterDTO3.m2_enter == 1 }">
						<h2>${enterDTO3.mcn_no }회 유치부 결승 점수등록</h2>
					</c:when>
					<c:when test="${enterDTO3.m2_enter == 2 }">
						<h2>${enterDTO3.mcn_no }회 초등1~2 결승 점수등록</h2>
					</c:when>
					<c:when test="${enterDTO3.m2_enter == 3 }">
						<h2>${enterDTO3.mcn_no }회 초등3~4 결승 점수등록</h2>
					</c:when>
					<c:when test="${enterDTO3.m2_enter == 4 }">
						<h2>${enterDTO3.mcn_no }회 초등5~6 결승 점수등록</h2>
					</c:when>
				</c:choose>
				<div style="margin-bottom: 10px">
					<c:forEach items="${competition }" var="competition"> 
						<a href="admin3roundpointins.do?mcn_no=${competition.mcn_no }&ent_enter=${enterDTO3.m1_enter }" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
					</c:forEach>
				</div>
				<div>
					<c:forEach items="${enterfield }" var="enterfield">
						<a href="admin3roundpointins.do?mcn_no=${enterDTO3.mcn_no }&ent_enter=${enterfield.mef_idx }" id="aa" class="btn btn-warning btn-xs">${enterfield.mef_name }</a>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
		
		<table class="table table-bordered table-hover table-condensed">
			<thead align="center">
				<tr>
					<td>이름</td>
					<td>생년월일</td>
					<td>참가부문</td>
					<td>교육원</td>
					<td>첫번째게임 점수(시간)</td>
					<td>두번째게임 점수</td>
					<td>등록버튼</td>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${enterDTO3 }" var="enterDTO3">
				<form action="admin3roundpointinsert.do" id="frm" name="frm" method="post">
					<tr>
						<td><input type="hidden" id="m3_name" name="m3_name" value="${enterDTO3.m2_name }">${enterDTO3.m2_name }</td>
						<td><input type="hidden" id="m_birthday" name="m_birthday" value="${enterDTO2.m_birthday }">${enterDTO3.m_birthday }</td>
						<td><c:choose>
									<c:when test="${enterDTO3.m2_enter == 1}">
										유치부
										<input type="hidden" id="m3_enter" name="m3_enter" value="${enterDTO3.m2_enter }">
									</c:when>
									<c:when test="${enterDTO3.m2_enter == 2}">
										초등1~2
										<input type="hidden" id="m3_enter" name="m3_enter" value="${enterDTO3.m2_enter }">
									</c:when>
									<c:when test="${enterDTO3.m2_enter == 3}">
										초등3~4
										<input type="hidden" id="m3_enter" name="m3_enter" value="${enterDTO3.m2_enter }">
									</c:when>
									<c:when test="${enterDTO3.m2_enter == 4}">
										초등5~6
										<input type="hidden" id="m3_enter" name="m3_enter" value="${enterDTO3.m2_enter }">
									</c:when>
								</c:choose></td>
						<td>
							${enterDTO3.m2_cname }
							<input type="hidden" id="m3_cname" name="m3_cname" value="${enterDTO3.m2_cname }">
						</td>
						<td>
							<input type="text" id="m3_1roundpoint" name="m3_1roundpoint" style="width: 50px">
							<input type="text" id="m3_1roundtime" name="m3_1roundtime" style="width: 50px">
						</td>
						<td>
							<input type="text" id="m3_2roundpoint" name="m2_3roundpoint" style="width: 50px">
							<input type="hidden" id="b_idx" name="b_idx" value="${enterDTO3.b_idx }">
							<input type="hidden" id="ent_idx" name="ent_idx" value="${enterDTO3.ent_idx }">
							<input type="hidden" id="m3_memberno" name="m3_memberno" value="${enterDTO3.m2_memberno }">
							<input type="hidden" id="mcn_no" name="mcn_no" value="${enterDTO3.mcn_no }">
							<input type="hidden" id="ent_enter" name="ent_enter" value="${enterDTO3.m2_enter }">
						</td>
						<td><input type="submit" class="btn btn-info btn-xs" value="등록"></td>
					</tr>
				</form>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</div>