<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container">
	<h2>대회 등록</h2>
		<div class="content">
		<c:forEach items="${competition }" var="competition" begin="0" end="0">
		<form action="adminaddinsert.do?mcn_no=${competition.mcn_no }" method="post">
		</c:forEach>
			<table class="table table-bordered table-hover table-condensed">
					<tr>
						<th class="active" style="width: 180px">대회횟차</th>
						<td colspan="4">
							<select id="ma_comp_no" name="ma_comp_no" class="form-control input-sm" style="width: 400px">
								<option value="0">선택해 주세요</option>
								<c:forEach items="${competition }" var="competition" >
									<option value="${competition.mcn_no }">${competition.mcn_name }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th class="active" >대회 이름</th>
						<td colspan="4"><input id="ma_comname" name="ma_comname" class="form-control input-sm" style="width: 400px"></td>
					</tr>
					<tr>
						<th class="active" >대회 접수 시작일</th>
						<td colspan="4"><input id="datepicker_1" name="ma_receipt_start" class="form-control input-sm" readonly="readonly" style="width: 400px"></td>
					</tr>
					<tr>
						<th class="active" >대회 접수 종료일</th>
						<td colspan="4"><input id="datepicker_2" name="ma_receipt_end" class="form-control input-sm" readonly="readonly" style="width: 400px"></td>
					</tr>
					<tr>
						<th class="active" >대회 일자</th>
						<td colspan="4"><input id="datepicker_3" name="ma_comdate" class="form-control input-sm" readonly="readonly" style="width: 400px"></td>
					</tr>
					<tr>
						<th class="active" >대회 장소</th>
						<td colspan="4"><input id="ma_complace" name="ma_complace" class="form-control input-sm" style="width: 400px"></td>
					</tr>
					<tr>
						<th class="active" >대회 접수비</th>
						<td colspan="4"><input type="number" min="0" id="ma_comprice" name="ma_comprice" class="form-control input-sm" style="width: 400px"></td>
					</tr>
					<tr>
						<th class="active" >유치부 교구</th>
						<td><input id="ma_u_event_1" name="ma_u_event_1" class="form-control input-sm"></td>
						<td><input id="ma_u_event_2" name="ma_u_event_2" class="form-control input-sm"></td>
						<td><input id="ma_u_event_3" name="ma_u_event_3" class="form-control input-sm"></td>
						<td><input id="ma_u_event_4" name="ma_u_event_4" class="form-control input-sm"></td>
					</tr>
					<tr>
						<th class="active" >초등1~2 교구</th>
						<td><input id="ma_e1_event_1" name="ma_e1_event_1" class="form-control input-sm"></td>
						<td><input id="ma_e1_event_2" name="ma_e1_event_2" class="form-control input-sm"></td>
						<td><input id="ma_e1_event_3" name="ma_e1_event_3" class="form-control input-sm"></td>
						<td><input id="ma_e1_event_4" name="ma_e1_event_4" class="form-control input-sm"></td>
					</tr>
					<tr>
						<th class="active" >초등3~4 교구</th>
						<td><input id="ma_e3_event_1" name="ma_e3_event_1" class="form-control input-sm"></td>
						<td><input id="ma_e3_event_2" name="ma_e3_event_2" class="form-control input-sm"></td>
						<td><input id="ma_e3_event_3" name="ma_e3_event_3" class="form-control input-sm"></td>
						<td><input id="ma_e3_event_4" name="ma_e3_event_4" class="form-control input-sm"></td>
					</tr>
					<tr>
						<th class="active" >초등5~6 교구</th>
						<td><input id="ma_e5_event_1" name="ma_e5_event_1" class="form-control input-sm"></td>
						<td><input id="ma_e5_event_2" name="ma_e5_event_2" class="form-control input-sm"></td>
						<td><input id="ma_e5_event_3" name="ma_e5_event_3" class="form-control input-sm"></td>
						<td><input id="ma_e5_event_4" name="ma_e5_event_4" class="form-control input-sm"></td>
					</tr>
					<tr>
						<th class="active">대회종류</th>
						<td colspan="4">
							<label class="radio-inline"><input type="radio" name="ma_comkind" value="1">예선</label>
							<label class="radio-inline"><input type="radio" name="ma_comkind" value="2">본선</label>
							<label class="radio-inline"><input type="radio" name="ma_comkind" value="3">결승</label>
						</td>
					</tr>
					<tr>
						<th class="active">주최 지사</th>
						<td colspan="4">
							<select  id="ma_host" name="ma_host" class="form-control input-sm" style="width: 400px">
								<option value="0">선택해 주세요</option>
								<c:forEach items="${branchDTO }" var="branchDTO">
									<option value="${branchDTO.b_idx }">${branchDTO.b_name }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th class="active" >참가비입금계좌</th>
						<td colspan="4"><input id="ma_account" name="ma_account" class="form-control input-sm" value="0" style="width: 400px"></td>
					</tr>
			</table>
			<div>
				<input type="submit" value="등록">
			</div>
			</form>
		</div>
</div>