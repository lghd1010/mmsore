<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="container" style="padding-left: 0px;padding-right: 0px">
		
		<div class="content" align="center">
			<h2>본선대회 결과</h2>
			<label>검색결과가 없다면, 입력하신정보가 맞는지 확인후 다시검색해 주시기 바랍니다.</label>
			<table class="table">
				<tr>
					<th class="active">이름</th>
					<th class="active">교육원</th>
					<th class="active">생년월일</th>
					<th class="active">참가부문</th>
				</tr>
				<c:forEach items="${entertestDTO }" var="entertestDTO">
				<tr>
					<td>${entertestDTO.ent_name }</td>
					<td>${entertestDTO.ent_cname }</td>
					<td>${entertestDTO.ent_birthday }</td>
					<td><c:choose>
							<c:when test="${entertestDTO.ent_enter == 1 }">
								유치부
							</c:when>
							<c:when test="${entertestDTO.ent_enter == 2 }">
								초등1~2
							</c:when>
							<c:when test="${entertestDTO.ent_enter == 3 }">
								초등3~4
							</c:when>
							<c:when test="${entertestDTO.ent_enter == 4 }">
								초등5~6
							</c:when>
						</c:choose></td>
				</tr>
				<c:choose>
					<c:when test="${entertestDTO.ent_enter == 1 }">
						<tr>
							<th class="active">아즈텍</th>
							<th class="active">칼라풀</th>
							<th class="active">아기돼지</th>
							<th class="active">컨티듀오</th>
						</tr>
						<tr>
							<td>${entertestDTO.m2_1roundpoint }점</td>
							<td>${entertestDTO.m2_2roundpoint }점(${entertestDTO.m2_1time }초)</td>
							<td>${entertestDTO.m2_3roundpoint }점(${entertestDTO.m2_2time }초)</td>
							<td>${entertestDTO.m2_4roundpoint }점</td>
						</tr>
					</c:when>
					<c:when test="${entertestDTO.ent_enter == 2 }">
						<tr>
							<th class="active">벌레총총</th>
							<th class="active">캐슬오브드림</th>
							<th class="active">이그니스</th>
							<th class="active">에스트리스</th>
						</tr>
						<tr>
							<td>${entertestDTO.m2_1roundpoint }점</td>
							<td>${entertestDTO.m2_2roundpoint }점(${entertestDTO.m2_1time }초)</td>
							<td>${entertestDTO.m2_3roundpoint }점</td>
							<td>${entertestDTO.m2_4roundpoint }점</td>
						</tr>
					</c:when>
					<c:when test="${entertestDTO.ent_enter == 3 }">
						<tr>
							<th class="active">넘버스</th>
							<th class="active">스퀘어스</th>
							<th class="active">인텔리전스 피라미드</th>
							<th class="active">디지털게임</th>
						</tr>
						<tr>
							<td>${entertestDTO.m2_1roundpoint }점(${entertestDTO.m2_1time }초)</td>
							<td>${entertestDTO.m2_2roundpoint }점</td>
							<td>${entertestDTO.m2_3roundpoint }점(${entertestDTO.m2_2time }초)</td>
							<td>${entertestDTO.m2_4roundpoint }점</td>
						</tr>
					</c:when>
					<c:when test="${entertestDTO.ent_enter == 4 }">
						<tr>
							<th class="active">칼라스</th>
							<th class="active">트라이앵글게임</th>
							<th class="active">쿼드라틱</th>
							<th class="active">링스</th>
						</tr>
						<tr>
							<td>${entertestDTO.m2_1roundpoint }점(${entertestDTO.m2_1time }초)</td>
							<td>${entertestDTO.m2_2roundpoint }점</td>
							<td>${entertestDTO.m2_3roundpoint }점(${entertestDTO.m2_2time }초)</td>
							<td>${entertestDTO.m2_4roundpoint }점</td>
						</tr>
					</c:when>
				</c:choose>
				
				<c:if test="${entertestDTO.m2_round_ck == 3 }">
				<table class="table">
					<tr>
						<td colspan="3" align="center"><h2>결승전 결과</h2></td>
					</tr>
					<c:forEach items="${round3DTO }" var="round3DTO">
						<c:choose>
							<c:when test="${round3DTO.m3_enter == 1 }">
								<tr>
									<td class="active" align="center">아기돼지</td>
									<td class="active" align="center">컨티뉴오</td>
								</tr>
								<tr>
									<td align="center">${round3DTO.m3_1roundpoint}점(${round3DTO.m3_1roundtime}초)</td>
									<td align="center">${round3DTO.m3_2roundpoint}점</td>
								</tr>	
							</c:when>
							<c:when test="${round3DTO.m3_enter == 2 }">
								<tr>
									<td class="active" align="center">캐슬오브드림</td>
									<td class="active" align="center">멘사 커넥션</td>
								</tr>	
								<tr>
									<td align="center">${round3DTO.m3_1roundpoint}점(${round3DTO.m3_1roundtime}초)</td>
									<td align="center">${round3DTO.m3_2roundpoint}점</td>
								</tr>
							</c:when>
							<c:when test="${round3DTO.m3_enter == 3 }">
								<tr>
									<td class="active" align="center">넘버스</td>
									<td class="active" align="center">멘사 커넥션</td>
								</tr>	
								<tr>
									<td align="center">${round3DTO.m3_1roundpoint}점(${round3DTO.m3_1roundtime}초)</td>
									<td align="center">${round3DTO.m3_2roundpoint}점</td>
								</tr>
							</c:when>
							<c:when test="${round3DTO.m3_enter == 4 }">
								<tr>
									<td class="active" align="center">쿼드라틱</td>
									<td class="active" align="center">멘사 커넥션</td>
								</tr>	
								<tr>
									<td align="center">${round3DTO.m3_1roundpoint}점(${round3DTO.m3_1roundtime}초)</td>
									<td align="center">${round3DTO.m3_2roundpoint}점</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</table>
				</c:if>
				</c:forEach>
			</table>
			<div align="center">
				<input class="btn btn-default" onclick="history.go(-1);" type="button" value="뒤로가기">
			</div>
		</div>
	</div>