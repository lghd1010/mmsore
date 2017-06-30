$(function() {
	initialize();
});

function initialize () {
	datePicker();
	joinAutoComplete();
	autoHypenPhone();
}

function datePicker () {
	for (var i = 1; i < 10; i++) {
		var date = document.getElementById('datepicker_' + i);

		$(date).datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					minDate: '-100y', 
					 yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
					yearSuffix : '년'
				});
	}
}


function autoHypenPhone(str){
            str = /[^0-9]/g;
            var tmp = '';
            if( str.length < 4){
                return str;
            }else if(str.length < 7){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            }else if(str.length < 11){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            }else{              
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

var cellPhone = document.getElementById('cellPhone');
cellPhone.onkeyup = function(event){
        event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenPhone(_val) ;
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
	
	if ( tempName == $('#m_cname_select').val() ) {
		$('#m_cname_label').attr("style", "color:green");
		$('#m_cname_label').text("인증");
	} else {
		$('#m_cname_label').attr("style", "color:red");
		$('#m_cname_label').text("없음");
	}
}