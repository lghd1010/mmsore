<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <div class="wrapper">
   
      <div class="modal-dialog" id="dialog" role="dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="padding: 35px 50px;background-color: #FCD237">       <h4>
					<span class="glyphicon glyphicon-lock"></span> LOG-IN
                <img alt="" src="img/OP_login_logo.jpg" style="float: right;">
				</h4>
                <p>창의와 인성을 경비한 인재로 거듭나는</p>
                <p>멘사 마인드-스포츠 올림피아드 홈페이지에 오신것을 환영합니다</p>
                
			</div>
			<div class="modal-body" style="padding: 40px 50px;">

				  <form class="form-signin" action="login.do" method="post">      
					<div class="form-group">
						<label for="usrname"><span
							class="glyphicon glyphicon-user"></span> 아이디</label> <input type="text"
							class="form-control" id="m_id" name="m_id" 
							placeholder="Enter id">
					</div>
					<div class="form-group">
						<label for="psw"><span
							class="glyphicon glyphicon-eye-open"></span> 비밀번호</label> <input
							type="password" class="form-control" id="m_pass" name="m_pass" 
							placeholder="Enter password">
					</div>
					<button type="submit" class="btn btn-default btn-block" style="background-color: #FCD237;">
						<span class="glyphicon glyphicon-off"></span> 로그인
					</button>
				</form>
			</div>
				<div align="center">
				<p>
					아직 회원이 아니신가요? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="joinFrom.do">회원가입 ></a>
				</p>
				<!-- <p>
					아이디 / 비밀번호를 잊으셨나요? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="pwdSearch.do">비밀번호 찾기 ></a>
				</p> -->
				</div>
		</div>
	</div>
  </div>