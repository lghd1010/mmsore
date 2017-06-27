<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="css/styles.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="js/script.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<div id='cssmenu' style="z-index: 10; font-size: 15px">
			<ul>
				<li class='active'><a href='main.do'>Home</a></li>
				<li><a href='introduction.do'>주관사소개</a>
					<ul>
						<li><a href='introduction.do'>주관사소개</a>
						<li><a href='map.do'>오시는 길</a></li>
					</ul>
				<li><a href='mmso.do'>MMSO란?</a>
					<ul>
						<li><a href='mmso.do'>MMSO란?</a>
						<li><a href='goal.do'>대회 목표</a>
						<li><a href='effect.do'>대회 효과</a></li>
					</ul>
				<li><a href='noticeList.do'>명예전당</a>
					<ul>
						<li><a href='winnerK.do'>국내대회수상자</a>
						<li><a href='refereewinner.do'>우수심판</a>
					</ul></li>

				<li><a href='noticeList.do'>국내 MMSO</a>
					<ul>
						<li><a href='noticeList.do'>공지사항</a>
						<li><a href='javascript:btn_board()'>게시판</a>
						<li><a href='photoList.do'>사진첩</a> 
						<%--  <c:if test="${memberInfo.m_type == 2 || memberInfo.m_type == 1}">
						<li class='has-sub'><a href='entercomlist.do?memberno=${memberInfo.memberno }'>참가확인/대회 선택창</a>
							<ul>
								<li><a href='entercomlist.do?memberno=${memberInfo.memberno }'>참가확인/대회 선택창</a></li>
							</ul></li>
						</c:if> --%>
					</ul></li>
			<%-- <c:if test="${memberInfo.m_type==3}">
					<li class='has-sub'><a href='edustudentlist.do?mcn_no=15&ent_cname=${memberInfo.m_cname }'>교육원관리</a>
						<ul>
							<li><a href='edustudentlist.do?mcn_no=15&ent_cname=${memberInfo.m_cname }'>교육원관리</a></li>
							<!-- <li><a href='edustudentpointlist.do'>점수관리</a></li> -->
						</ul>
					</li>
				</c:if>
				<c:if test="${memberInfo.m_type==4 || memberInfo.m_type==5}">
					<li class='has-sub'><a href='branchedulist.do?b_idx=${memberInfo.b_idx }&mcn_no=15'>지사관리</a>
						<ul>
							<li><a href='branchedulist.do?b_idx=${memberInfo.b_idx }'>소속교육원 참가관리</a></li>
							<li><a href='branchedulist.do?b_idx=${memberInfo.b_idx }&mcn_no=15'>소속교육원 참가관리</a></li>
							<li class='has-sub'><a href='round1list.do?b_idx=${memberInfo.b_idx }&ent_enter=1'>점수관리</a>
								<ul>
									<li><a href='round1list.do?b_idx=${memberInfo.b_idx }&ent_enter=1'>예선 점수관리</a></li>
									<li><a href='round2lista.do?b_idx=${memberInfo.b_idx }&m2_enter=1&mcn_no=15'>본선 점수관리</a></li>
								</ul>
							</li>
							<li><a href='round1pointinsertfrom.do?b_idx=${memberInfo.b_idx }&ent_enter=1&mcn_no=15'>예선점수등록</a></li>
							
						</ul>
					</li>
				</c:if> --%>
				<%-- <c:if test="${memberInfo.m_type==5}"> --%>
				<li><a href='#'>관리자메뉴</a>
					<ul>
						<li class='has-sub'><a href='adminmemberinfolist.do'>메인관리</a>
							<ul>
								<li><a href='adminmemberinfolist.do'>회원목록</a></li>
								<li><a href='admincamplist.do'>캠프참가자확인</a></li>
							</ul>
						</li>
						<li class='has-sub'><a href='#'>사이트관리</a>
							<ul>
								<li><a href='adminentertestlist.do?mcn_no=15'>참가자 관리 페이지</a></li>
								<li><a href='round2list.do?mcn_no=15'>본선 참가자 관리</a></li>
								<li><a href='#'>결승 참가자 관리</a></li>
								<li><a href='adminrefereeList.do'>심판 관리</a></li>
								<li><a href='admineventlist.do'>종목 교구</a></li>
								<li><a href='adminaddlist.do'>대회관리</a></li>
							</ul>
							</li>
							<li class='has-sub'><a href='adminpointlist.do?cn_no=15'>점수관리</a>
							<ul>
								<li><a href='adminpointlist.do?mcn_no=15'>예선 점수관리</a></li>
								<li><a href='round2pointlist.do?m2_enter=1'>본선 점수관리</a></li>
								<li><a href='#'>결승 점수관리</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<%-- </c:if> --%>
			</ul>
		</div>
	</div>