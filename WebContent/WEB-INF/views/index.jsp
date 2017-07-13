<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="container" style="padding: 0px">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    	<!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	    </ol>

    	<!-- Wrapper for slides -->
	     <div class="carousel-inner">
	      <div class="item active">
		          <img src="img/web1111.jpg" alt="Chicago" style="width:100%;">
	      </div>
	
	      <div class="item">
	        <a href="http://mmso.co.kr/noticeDetail.do?bno=71"><img src="img/OP_main_renew20173.jpg" alt="Los Angeles" style="width:100%;"></a>
	      </div>
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>
  <div >
  	<a href="round2pass.do" class="btn btn-warning" style="width:100%;height: 55px;padding-top: 15px;margin-top:5px;">본선점수 확인하기</a>
  </div>
  <div class="content">
  	<div class="row" style="margin-bottom: 15px">
				<!-- 1. 검색 -->
				<div class="col-lg-4">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i><a href="noticeList.do"> 공지사항</a>
						</div>
						<!-- /.panel-heading -->
						<table class="table table-hover">
							<c:forEach items="${hnoticelist }" var="hnoticelist" begin="0" end="4">
								<c:choose>
								  	<c:when test="${fn:length(hnoticelist.title) > 30}">
										<tr align="left">
											<td><a href="noticedetail.do?boardno=${hnoticelist.boardno }"><c:out value="${fn:substring(hnoticelist.title,0,29)}"/>....</a></td>
										</tr>
									</c:when>
									<c:otherwise>
									<tr align="left">
											<td><a href="noticedetail.do?boardno=${hnoticelist.boardno }"><c:out value="${hnoticelist.title }"/></a></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>	
						</table>
					</div>
					<!-- 옆 -->
					<!-- /.panel -->
				</div>
				
				<div class="col-lg-4">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i>바로가기
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body"
							style="padding-top: 3px;padding-bottom: 3px;padding-left: 0px;padding-right: 0px;">
							<table align="center">
								<tr>
									<td><a href="http://mensaedu.com/"><img alt="멘사SG홈" src="img/OP_mensa.png" onmouseover="this.src='img/OP_mensa_2.png'"onmouseout="this.src='img/OP_mensa.png'"
											style="width: auto; height: auto; margin-left: 10px; margin-right: 10px; margin-top: 5px;padding-right: 30px;"></a></td>
									<td><a href="https://www.facebook.com/%EC%A3%BC%EB%A3%A8%EC%B8%A0%ED%85%9C-682816238526564/"><img alt="페이스북" src="img/OP_facebook.png" onmouseover="this.src='img/OP_facebook_2.png'"onmouseout="this.src='img/OP_facebook.png'"
											style="width: auto; height: auto; margin-left: 10px; margin-right: 10px; margin-top: 5px;padding-right: 30px;"></a></td>
									<td><a href="https://www.instagram.com/_rootstem_/"><img alt="인스타" src="img/OP_instar.png" onmouseover="this.src='img/OP_instar_2.png'"onmouseout="this.src='img/OP_instar.png'"
											style="width: auto; height: auto; margin-left: 10px; margin-right: 10px; margin-top: 5px"></a></td>
								</tr>
								<tr>
									<td><a href="https://story.kakao.com/ch/g-mensa"><img alt="카카오스토리" src="img/OP_cacao.png" onmouseover="this.src='img/OP_cacao_2.png'"onmouseout="this.src='img/OP_cacao.png'"
											style="width: auto; height: auto; margin-left: 10px; margin-right: 10px; margin-top: 5px; margin-bottom: 5px"></a></td>
									<td><a href="http://blog.naver.com/mensaedu"><img alt="블로그" src="img/OP_blog.png" onmouseover="this.src='img/OP_blog_2.png'"onmouseout="this.src='img/OP_blog.png'"
											style="width: auto; height: auto; margin-left: 10px; margin-right: 10px; margin-top: 5px; margin-bottom: 5px"></a></td>
									<td><a href="#"><img alt="모두" src="img/OP_moodoo.png" onmouseover="this.src='img/OP_moodoo_2.png'"onmouseout="this.src='img/OP_moodoo.png'"
											style="width: auto; height: auto; margin-left: 10px; margin-right: 10px; margin-top: 5px; margin-bottom: 5px"></a></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- 옆 -->
					<!-- /.panel -->
				</div>
				
				<div class="col-lg-4">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<i class="fa fa-bell fa-fw"></i>참가신청 동영상
						</div>
						<div class="panel-body" style="padding-bottom: 15px;">
							<div class="row">
								<a href="#" data-toggle="modal" data-target=".pop-up-1">
								<img src="img/12333.PNG" width="150" class="img-responsive img-rounded center-block" alt="" style="padding-bottom: 15px;padding-top: 45px;">
								</a>
								      
								<!--  Modal content for the mixer image example -->
								  <div class="modal fade pop-up-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel-1" aria-hidden="true">
								    <div class="modal-dialog modal-lg">
								      <div class="modal-content">
								
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								          <h4 class="modal-title" id="myLargeModalLabel-1">멘사 마인드 스포츠 올림피아드 예선 대회 참가 신청 안내방법</h4>
								        </div>
								        <div class="modal-body">
								        <iframe width="100%" height="484" src="https://www.youtube.com/embed/TBPxKSCEGU4" frameborder="0" allowfullscreen></iframe>
								        </div>
								      </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
								  </div><!-- /.modal mixer image -->
								</div>
						</div>
					</div>
					<!-- 옆 -->
					<!-- /.panel -->
				</div>
	</div>
  </div>
</div>
<style type="text/css">
	
	#pop{
		width:700px; height:400px; background:white; color:#fff; 
		position:absolute; text-align:center; 
		border:2px solid #000;
			}
	
	#pop_02{
		width:655px; height:970px; background:#3d3d3d; color:#fff; 
		position:absolute; top:70px; left:100px; text-align:center; 
		border:2px solid #000;
			}

	.close div{float:left; text-align:right;}
	#check{font-size:12px; font-family:'돋움'; padding-left:70px;}
	#close{font-size:13px; padding:5px; font-weight:bold;}

</style>
<div id="pop_02">
	<div style="height: 940px;;">
		<img id="img" src="img/asd.jpg" style="width:650px">
	</div>
	
	<div class="close2">
		<form name="pop_form">
		<div id="close2" style="width: 650px; margin:auto;" class="btn btn-info">close</div>
		</form>
	</div>
</div>

<script>
		cookiedata = document.cookie;    
		if ( cookiedata.indexOf("maindiv=done") < 0 ){      
			document.all['pop_02'].style.visibility = "visible";
			} 
			else {
				document.all['pop_02'].style.visibility = "hidden"; 
		}
</script>

<script>
			$(document).ready(function() {
				$('#close').click(function() {
					$('#pop').hide();
				});
			});
	</script>

	<script>
		$(document).ready(function() {
				$('#close2').click(function() {
					$('#pop_02').hide();
				});
			});
	</script>