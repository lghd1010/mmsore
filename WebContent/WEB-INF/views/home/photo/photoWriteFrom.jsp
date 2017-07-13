<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
function CheckForm() {
	if (!$("#title").val()) {
		alert("제목을 입력해주세요.");
		return false;
	}
 	if ($()=="") {
		alert("본문을 입력해주세요.");
		return false;
	} 
}
</script>

	<form action="photoWrite.do" method="post" id="frm" onsubmit="return CheckForm();">
		<div class="container">
			<h2>게시판</h2>
			<table class="table">
				<tr>
					<th class="active">제목</th>
					<td><input type="text" id="title" name="title"
						style="WIDTH: 100%;"></td>
				</tr>
				<tr>
						<th class="active">작성자</th>
						<td><c:out value="${memberInfo.name}" /> <input
							type="hidden" name="name" value="${memberInfo.name}">
                    <input type="hidden" name="memberno" value="${memberInfo.memberno}"></td>
					</tr>
				<tr>
                    <th class="active">내용</th>
					<td colspan="2">
					<textarea id="editor" style="HEIGHT: 300px; WIDTH: 100%" rows="10" cols="30" name="content">
					</textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="text-align: center;">
							<input type="submit" value="등록" id="savebutton"
								class="btn btn-info"> <input class="btn btn-default"
								onclick="history.go(-1);" type="button" value="취소">
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>