﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

<!-- ajaxSubmit 처리를 위한 링크 -->
<script src="http://malsup.github.com/jquery.form.js"></script>

	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<div id='cssmenu' style="z-index: 10; font-size: 15px">
			<ul>
				<li class='active'><a href='index.do'>Home</a></li>
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
				<li><a href='winnerK.do'>명예전당</a>
					<ul>
						<li><a href='winnerK.do'>국내대회수상자</a>
						<li><a href='refereewinner.do'>우수심판</a>
					</ul></li>

				<li><a href='noticeList.do'>국내 MMSO</a>
					<ul>
						<li><a href='noticelist.do'>공지사항</a>
						<!-- <li><a href='javascript:btn_board()'>게시판</a> -->
						<li><a href='photolist.do'>사진첩</a> 
						<%-- <c:if test="${memberInfo.m_type == 2 || memberInfo.m_type == 1}"> --%>
						<li><a href='enterlist.do?mcn_no=15'>대회 신청하기</a>
						</li>
						<%-- </c:if> --%>
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
				<c:if test="${memberInfo.m_type==5}">
				<li><a href='#'>관리자메뉴</a>
					<ul>
						<li class='has-sub'><a href='adminmemberlist.do'>회원관리</a>
							<ul>
								<li><a href='adminmemberlist.do'>회원목록</a></li>
							</ul>
						</li>
						<li class='has-sub'><a href='#'>대회관리</a>
							<ul>
								<li><a href='admin1roundlist.do?mcn_no=15&ent_enter=1'>예선참가자 관리</a></li>
								<li><a href='admin2roundlist.do?mcn_no=15&ent_enter=1'>본선참가자 관리</a></li>
								<li><a href='admin3roundlist.do?mcn_no=15&ent_enter=1'>결승 참가자 관리</a></li>
								<!-- <li><a href='#'>종목 교구</a></li> -->
								<li class='has-sub'><a href='#'>대회관리</a>
									<ul>
										<li><a href="adminaddlsit.do?mcn_no=15">대회관리</a></li>
										<li><a href="admincompnolist.do">대회 횟차관리</a></li>
									</ul>
								</li>
							</ul>
							</li>
							<li class='has-sub'><a href='#'>점수관리</a>
							<ul>
								<li><a href='admin1roundpointlist.do?mcn_no=15&ent_enter=1'>예선 점수관리</a></li>
								<li><a href='admin2roundpointlist.do?mcn_no=15&ent_enter=1'>본선 점수관리</a></li>
								<li><a href='admin3roundpointlist.do?mcn_no=15&ent_enter=1'>결승 점수관리</a></li>
							</ul>
						</li>
					</ul>
				</li>
				</c:if>
				<div align="right">
					<c:choose>
						<c:when test="${empty memberInfo}">

							<a type="button" href="login.do" class="btn btn-warning"
								id="myBtn" style="margin-right: 10px; margin-top: 10px"> <span
								class="glyphicon glyphicon-log-in"></span>로그인
							</a>
							<a type="button" href="joinform.do" class="btn btn-warning"
								id="Register" style="margin-right: 10px; margin-top: 10px">
								<span class="glyphicon glyphicon-user"></span> 회원가입
							</a>
						</c:when>
						<c:otherwise>
							<a type="button" href="memberdetail.do?mno=${memberInfo.memberno }" class="btn btn-warning" id="myBtn" style="margin-right: 10px; margin-top: 10px"> 
							<span class="glyphicon glyphicon-user"></span>
							 ${memberInfo.name } 
								<c:if test="${memberInfo.m_type==1}">
									<c:out value="일반회원" />
								</c:if> <c:if test="${memberInfo.m_type==2}">
									<c:out value=" " />
								</c:if> <c:if test="${memberInfo.m_type==3}">
									<c:out value="교육원장님" />
								</c:if> <c:if test="${memberInfo.m_type==4}">
									<c:out value="지사장님" />
								</c:if> <c:if test="${memberInfo.m_type==5}">
									<c:out value="관리자회원" />
								</c:if>
							</a>
							<!-- <li class="last"><a href="logout.do">로그아웃</a></li> -->
							<a type="button" href="logout.do" class="btn btn-warning"
								id="myBtn" style="margin-right: 10px; margin-top: 10px"> <span
								class="glyphicon glyphicon-log-in"></span>로그아웃
							</a>

						</c:otherwise>
					</c:choose>
				</div>
			</ul>
		</div>
	</div>