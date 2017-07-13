<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
$(function() {
	for (var i = 1; i < 10; i++) {
		var date = document.getElementById('datepicker_' + i);

		$(date).datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					minDate : '-100y',
					yearRange : 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
					yearSuffix : '년'
				});
	}
});


$(function(){
	
	
	//계정신청 버큰 클릭
	$('#doJoin').on("click",function(){
		
		if($('#name').val() == ''){
			alert("이를을 입력해 주세요");
			return;
		}
	
		if($('#enter').val() == ''){
			alert("참가부문을 선택해 주세요");
			return;
		}
		
		if($('#datepicker_1').val() == ''){
			alert("생년월일을 선택해 주세요");
			return;
		}
		
		if($('#m_cname').val() == ''){
			alert("교육원이름을 입력해 주세요");
			return;
		}
		
		
		
		//전화번호, 우편번호 합치기
		
		$('#frm').attr('target', '_self');
		$('#frm').attr('action', 'round1passcheckSearch.do').submit();
		
	});
	
});

</script>
<script type="text/javascript">
$(function() {
	initialize();
});

function initialize () {
	joinAutoComplete();
}

function joinAutoCompleteSub () {
	$("#m_cname").on("keyup", "");
	if ( event.keyCode != 13 && event.keyCode != 38 && event.keyCode != 40 ) {
		$("#m_cname").on("keyup", joinAutoComplete());
	}
	/* getSelectValue(); */
}

function joinAutoComplete () {
	if ( event.keyCode != 13 && event.keyCode != 38 && event.keyCode != 40 ) {
		if ($("#m_cname").val().length > 0) {
			$.ajax({
				url : "joinAutoCompleteAjax.do",
				type : "POST",
				data : {
					"m_cname" : $("#m_cname").val()
				},
				success : function(responseData) {
					var Ca = /\+/g;
					var e_nameList = decodeURIComponent(responseData.jsonObject).split(",");
					$('#m_cname').autocomplete({source : e_nameList});
				}
			});
		}
	}
	autoCompleteCheck();
}

function autoCompleteCheck () {
	var tempName = $('#m_cname').val();
	$('#m_cname_select').val(tempName);
	
	var tempName2 = $('#m_cname_select option:selected').text();
	$('#b_idx').val(tempName2);
	
	/* if ( tempName == $('#m_cname_select').val() ) {
		$('#m_cname_label').attr("style", "color:green");
		$('#m_cname_label').text("인증");
	} else {
		$('#m_cname_label').attr("style", "color:red");
		$('#m_cname_label').text("없음");
	} */
}
</script>
<style type="text/css">
 @media screen and (max-width: 769px) {
                h2 {display: none};
            }
</style>

	<div class="container" style="padding-left: 0px;padding-right: 0px">
		
		<div class="content" align="center">
			<form action="" method="post" id="frm" name="frm">
			<img alt="" src="img/round1pass4.jpg" style="width: 100%">
			
			<div class="form-group" style="height: 70px">
		      <h2 align="right"><label class="col-sm-5 control-label" style="width: 146px;padding-top: 15px;padding-left: 39px;padding-right: 39px;padding-bottom: 15px;margin-left: 330px;">이름</label></h2>
		      <div class="col-sm-7" style="padding-top: 15px;">
		      	<input type="hidden" name="field" value="ent_name">
		        <input class="form-control" type="text" id="name" name="query" style="width: 370px" placeholder="이름을 입력해 주세요.">
		      </div>
		    </div>
		    <div class="form-group" style="height: 70px">
		      <h2 align="right"><label class="col-sm-5 control-label" style="width: 150px;padding: 15px;margin-left: 330px;">생년월일</label></h2>
		      <div class="col-sm-7" style="padding-top: 15px;">
		      	<input type="hidden" name="field3" value="ent_birthday" >
		        <input class="form-control" type="text" id="datepicker_1" name="query3" readonly="readonly" style="width: 370px" placeholder="생년월일을 선택해 주세요.">
		      </div>
		    </div>
		    <div class="form-group" style="height: 70px">
		      <h2 align="right"><label class="col-sm-5 control-label" style="width: 150px;padding: 15px;margin-left: 330px;">참가부문</label></h2>
		      <div class="col-sm-7" style="padding-top: 15px;">
		        <input type="hidden" name="field2" value="ent_enter">
				<select id="enter" class="form-control" name="query2" style="margin: 5px;width: 370px;">
					<option value="1">유치부</option>
					<option value="2">초등1~2</option>
					<option value="3">초등3~4</option>
					<option value="4">초등5~6</option>
				</select>
		      </div>
		    </div>
		    <div class="form-group" style="height: 70px">
		      <h2 align="right"><label class="col-sm-5 control-label" style="width: 150px;padding: 15px;margin-left: 330px;">교육원명</label></h2>
		      <div class="col-sm-7" style="padding-top: 15px;">
		        <input type="hidden" name="field4" value="ent_cname" >
			<input type="text" class="form-control" id="m_cname" name="query4" style="margin: 5px;width: 370px;" onkeyup="joinAutoCompleteSub();" onblur="autoCompleteCheck();" placeholder="교육원명을 입력해 주세요.">
			<input type="hidden" name="b_idx" id="b_idx">
						<select id="m_cname_select" style="display: none">
							<c:forEach var="eduinfoDTO" items="${eduinfoDTO }" >
								<option value="${eduinfoDTO.e_name }">${eduinfoDTO.b_idx }</option>
							</c:forEach>
						</select>
		      </div>
		    </div>
			<div>
			<input type="button" id="doJoin" class="btn btn-info" value="확인" style="margin: 5px">
			</div>
			</form>
		</div>
	</div>