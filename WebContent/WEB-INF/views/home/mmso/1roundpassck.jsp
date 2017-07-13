<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<
	<div class="container" style="padding-left: 0px;padding-right: 0px">
		
		<div class="content" align="center">
		<c:forEach var="entertestDTO" items="${entertestDTO }">
		
			<div>
				<img alt="" src="img/round1passcheck4.jpg" style="width: 100%">
			</div>
		<c:choose>
			<c:when test="${entertestDTO.m1_round_ck == 2}">
			<div class="title" style="width: 170px">
				<c:choose>
					<c:when test="${entertestDTO.ma_idx == 1 }">
						<img alt="" src="img/dksdid.jpg" style="width: 100%;height: auto;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 2 }">
						<img alt="" src="img/rudska.jpg" style="width: 100%;height: auto;" >
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 3 }">
						<img alt="" src="img/qntks.jpg" style="width: 100%;height: auto;" >
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 4 }">
						<img alt="" src="img/suwan.jpg" style="width: 100%;height: auto;" >
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 5 }">
						<img alt="" src="img/uesan.jpg" style="width: 100%;height: auto;" >
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 6 }">
						<img alt="" src="img/jonnam.jpg" style="width: 100%;height: auto;" >
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 7 }">
						<img alt="" src="img/jeju.jpg"  style="width: 100%;height: auto;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 8 }">
						<img alt="" src="img/ponktak.jpg" style="width: 100%;height: auto;" >
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 11 }">
						<img alt="" src="img/dagu.jpg" style="width: 100%;height: auto;" >
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 12 }">
						<img alt="" src="img/choingiu.jpg" style="width: 100%;height: auto;" >
					</c:when>
				</c:choose>
			</div>
			<table class="table" align="center">
				<tr>
					<td class="active" align="center"><h2>이름</h2></td>
					<td align="center"><h2>${entertestDTO.ent_name }</h2></td>
					<td class="active" align="center"><h2>생년월일</h2></td>
					<td align="center"><h2>${entertestDTO.ent_birthday }</h2></td>
				</tr>
				<tr>
					<td class="active" align="center"><h2>참가부문</h2></td>
					<td align="center"><h2>
					<c:choose>
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
						</c:choose>
				</h2></td>
					<td class="active" align="center"><h2>교육원명</h2></td>
					<td align="center"><h2>${entertestDTO.ent_cname }</h2></td>
				</tr>
			</table>
			<div>
				<img alt="" src="img/2roundture2.jpg" style="width: 100%">
			</div>
			</c:when>
			
			
			
			
			
			
			
			
			<c:when test="${entertestDTO.m1_round_ck == 1}">
			<div class="title" style="width: 0px;height: 0px">
				<c:choose>
					<c:when test="${entertestDTO.ma_idx == 1 }">
						<img alt="" src="img/dksdid.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 2 }">
						<img alt="" src="img/rudska.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 3 }">
						<img alt="" src="img/qntks.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 4 }">
						<img alt="" src="img/suwan.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 5 }">
						<img alt="" src="img/uesan.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 6 }">
						<img alt="" src="img/jonnam.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 7 }">
						<img alt="" src="img/jeju.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 8 }">
						<img alt="" src="img/ponktak.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 11 }">
						<img alt="" src="img/dagu.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
					<c:when test="${entertestDTO.ma_idx == 12 }">
						<img alt="" src="img/choingiu.jpg" style="position: relative;top: 360px;right: 95px;">
					</c:when>
				</c:choose>
			</div>
			<div>
				<img alt="" src="img/round1passcheck4.jpg" style="width: 100%">
			</div>
			<div class="name" style="position: relative;bottom: 185px;right: 135px;height: 0px">
				<h2>${entertestDTO.ent_name }</h2>
			</div>
			<div class="birthday" style="position: relative;bottom: 140px;right: 140px;height: 0px">
				<h2>${entertestDTO.ent_birthday }</h2>
			</div>
			<div class="enter" style="position: relative;bottom: 225px;left: 275px;height: 0px">
				<h2>
					<c:choose>
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
						</c:choose>
				</h2>
			</div>
			<div class="cname" style="position: relative;bottom: 185px;right: 0;left: 280px;height: 0px">
				<h2>${entertestDTO.ent_cname }</h2>
			</div>
			<div>
				<img alt="" src="img/2roundfalse2.jpg" style="width: 100%">
				</div>
			</c:when>
			<c:otherwise>
				ssss
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</div>
	</div>