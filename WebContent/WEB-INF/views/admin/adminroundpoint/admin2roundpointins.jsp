<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div class="container">
		<div class="content">
			<div style="margin: 5px">
				<c:forEach items="${enterDTO2 }" var="enterDTO2" begin="0" end="0"> 
					<c:choose>
						<c:when test="${enterDTO2.m1_enter == 1 }">
							<h2>${enterDTO2.mcn_no }회 유치부 본선 점수등록</h2>
						</c:when>
						<c:when test="${enterDTO2.m1_enter == 2 }">
							<h2>${enterDTO2.mcn_no }회 초등1~2 본선 점수등록</h2>
						</c:when>
						<c:when test="${enterDTO2.m1_enter == 3 }">
							<h2>${enterDTO2.mcn_no }회 초등3~4 본선 점수등록</h2>
						</c:when>
						<c:when test="${enterDTO2.m1_enter == 4 }">
							<h2>${enterDTO2.mcn_no }회 초등5~6 본선 점수등록</h2>
						</c:when>
					</c:choose>
					<div style="margin-bottom: 10px">
						<c:forEach items="${competition }" var="competition"> 
							<a href="admin2roundpointins.do?mcn_no=${competition.mcn_no }&ent_enter=${enterDTO2.m1_enter }" class="btn btn-warning btn-xs">${competition.mcn_name }</a>
						</c:forEach>
					</div>
					<div>
						<c:forEach items="${enterfield }" var="enterfield">
							<a href="admin2roundpointins.do?mcn_no=${enterDTO2.mcn_no }&ent_enter=${enterfield.mef_idx }" id="aa" class="btn btn-warning btn-xs">${enterfield.mef_name }</a>
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
						<td>두번째게임 점수(시간)</td>
						<td>세번째게임 점수(시간)</td>
						<td>네번째게임 점수(시간)</td>
						<td>등록버튼</td>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${enterDTO2 }" var="enterDTO2"> 
						<form action="admin2roundpointinsrt.do" id="frm" name="frm" method="post">
						<tr>
							<td>${enterDTO2.m1_name }<input type="hidden" id="m2_name" name="m2_name" value="${enterDTO2.m1_name }"></td>
							<td>${enterDTO2.m_birthday }<input type="hidden" id="m_birthday" name="m_birthday" value="${enterDTO2.m_birthday }"></td>
							<td><c:choose>
									<c:when test="${enterDTO2.m1_enter == 1}">
										유치부
										<input type="hidden" id="m2_enter" name="m2_enter" value="${enterDTO2.m1_enter }">
									</c:when>
									<c:when test="${enterDTO2.m1_enter == 2}">
										초등1~2
										<input type="hidden" id="m2_enter" name="m2_enter" value="${enterDTO2.m1_enter }">
									</c:when>
									<c:when test="${enterDTO2.m1_enter == 3}">
										초등3~4
										<input type="hidden" id="m2_enter" name="m2_enter" value="${enterDTO2.m1_enter }">
									</c:when>
									<c:when test="${enterDTO2.m1_enter == 4}">
										초등5~6
										<input type="hidden" id="m2_enter" name="m2_enter" value="${enterDTO2.m1_enter }">
									</c:when>
								</c:choose></td>
							<td>
								${enterDTO2.m1_cname }
								<input type="hidden" id="m2_cname" name="m2_cname" value="${enterDTO2.m1_cname }">
							</td>
							<td>
								<input type="text" id="m2_1roundpoint" name="m2_1roundpoint" style="width: 50px">
								<input type="text" id="m2_1time" name="m2_1time" style="width: 50px">
							</td>
							<td>
								<input type="text" id="m2_2roundpoint" name="m2_2roundpoint" style="width: 50px">
								<input type="text" id="m2_2time" name="m2_2time" style="width: 50px">
							</td>
							<td>
								<input type="text" id="m2_3roundpoint" name="m2_3roundpoint" style="width: 50px">
								<input type="text" id="m2_3time" name="m2_3time" style="width: 50px">
							</td>
							<td>
								<input type="text" id="m2_4roundpoint" name="m2_4roundpoint" style="width: 50px">
								<input type="text" id="m2_4time" name="m2_4time"   style="width: 50px">
								<input type="hidden" id="mcn_no" name="mcn_no" value="${enterDTO2.mcn_no }">
								<input type="hidden" id="ent_enter" name="ent_enter" value="${enterDTO2.m1_enter }">
								<input type="hidden" id="b_idx" name="b_idx" value="${enterDTO2.b_idx }" style="width: 50px">
								<input type="hidden" id="ent_idx" name="ent_idx"  value="${enterDTO2.ent_idx }"  style="width: 50px">
								<input type="hidden" id="m2_memberno" name="m2_memberno"  value="${enterDTO2.m1_memberno }"  style="width: 50px">
							</td>	
							<td>
								<input type="submit" id="btn" value="등록" class="btn btn-info btn-xs">
							</td>
						</tr>
						</form>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>