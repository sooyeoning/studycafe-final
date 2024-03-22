<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 수정 화면</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
</head>

<body>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/js/imagePreview.js"></script>
 	<script src="/js/admin/updatePlaceForm.js"></script>
 
	<!-- header -->
	<%@ include file="../header.jsp" %>

	<!-- body -->
	<!-- place/update/info -->

		<form:form method="post" modelAttribute="updatePlaceModel"
			action="/place/update/info" class="max-wd600 center" encType="multipart/form-data">
			<h5 class="max-wd800 center">장소 수정</h5>

			<form:hidden path="id" value="${updatePlaceModel.id }" />

			<div class="max-wd800 center container pl-0">
				<div class="row">
					<div class="col-md-2">
						<label for="name" class="form-label">장소명</label>
					</div>
					<div class="col-md-8">
					<form:input type="text" class="form-control" id="name"
						path="placeDTO.name" value="${placeDTO.name}"/>
					<small class="col-red mb-10">
						<form:errors path="placeDTO.name" />
					</small>
					</div>
				</div>
			<hr class="max-wd800 center hr-gray">

				<div class="row">
					<div class="col-md-2">
						<label for="address" class="form-label">주소</label>
					</div>
					<div class="col-md-8">
					<form:input type="text" class="form-control" id="address"
						path="placeDTO.address" value="${placeDTO.address} "/>
						<small class="col-red">
							<form:errors path="placeDTO.address" />
						</small>
					</div>
				</div>
			<hr class="max-wd800 center hr-gray">

			<div class="row">
				<div class="col-md-2">
					<label for="phone" class="form-label">매장번호</label>
				</div>
				<div class="col-md-8">
					<form:input type="text" class="form-control" id="phone"
						path="placeDTO.phone" value="${placeDTO.phone}" />
					<small class="col-red">
						<form:errors path="placeDTO.phone" />
					</small>
				</div>
			</div>
			<hr class="max-wd800 center hr-gray">

			<div class="row">
				<div class="col-md-2">
					<label for="areaCode">자치구 이름</label>
				</div>	
				<div class="col-md-8">
					<form:select class="form-select" path="placeDTO.areaCode"
						id="areaCode" value="${placeDTO.areaCode }" aria-label="Default select example">
						<form:option value="01">강동구</form:option>
						<form:option value="02">송파구</form:option>
						<form:option value="03">강남구</form:option>
						<form:option value="04">서초구</form:option>
						<form:option value="05">관악구</form:option>
						<form:option value="06">동작구</form:option>
						<form:option value="07">영등포구</form:option>
						<form:option value="08">금천구</form:option>
						<form:option value="09">구로구</form:option>
						<form:option value="10">양천구</form:option>
						<form:option value="11">강서구</form:option>
					</form:select>
				</div>		
				<p class="col-red">
					<form:errors path="placeDTO.areaCode" />
				</p>
			</div>
		</div>
		
		<hr class="max-wd800 center hr-6gray">
		
		<div class="max-wd800 center container pl-0">
			<div class="row">
				<div class="col-md-2">
					<p>가격 정보</p>
				</div>
				<div class="col-md-8">
					<small style="color: blue;">해당 요금제가 없을 경우 0을 입력해주세요</small>				
				</div>
			</div>
			<hr class="max-wd800 center hr-gray">
				
		<div class="row">
				<div class="col-md-2">
					<p class="max-wd800 center">시간 충전권</p>
				</div>
				<div class="col-md-2 pl-0">
					<label for="charge10Hrs" class="form-label">10시간(원)</label>
				</div>
				<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[0].rateId" value="6" />
					<form:input type="number" class="form-control" id="charge10Hrs"
						path="placeRateDTOList[0].price" />
					<span class="input-group-text">원</span>
				</div>
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[0].price" />
					</small>
				<p></p>
				
				<!-- hr width 시간부터 -->
				<div class="col-md-2"></div>
				<div class="col-md-2 pl-0">
					<label for="charge30Hrs" class="form-label">30시간(원)</label>
				</div>
				<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[1].rateId" value="7" />
					<form:input type="number" class="form-control" id="charge30Hrs"
						path="placeRateDTOList[1].price" />
					<span class="input-group-text">원</span>
				</div>
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[1].price" />
					</small>
				<p></p>
				
			<!-- hr width 시간부터 -->
				<div class="col-md-2"></div>
				<div class="col-md-2 pl-0">
					<label for="charge50Hrs" class="form-label">50시간(원)</label>
				</div>
				<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[2].rateId" value="8" />
					<form:input type="number" class="form-control" id="charge50Hrs"
						path="placeRateDTOList[2].price"/>
					<span class="input-group-text">원</span>
				</div>
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[2].price" />
					</small>
				<p></p>
				
				<!-- hr width 시간부터 -->
				<div class="col-md-2"></div>
				<div class="col-md-2 pl-0">
					<label for="charge100Hrs" class="form-label">100시간(원)</label>
				</div>
				<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[3].rateId" value="9" />
					<form:input type="number" class="form-control" id="charge100Hrs"
						path="placeRateDTOList[3].price"/>
					<span class="input-group-text">원</span>
				</div>
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[3].price" />
					</small>
				<p></p>
				
				<!-- hr width 시간부터 -->
				<div class="col-md-2"></div>
				<div class="col-md-2 pl-0">
					<label for="charge150Hrs" class="form-label">150시간(원)</label>
				</div>
				<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[4].rateId" value="10" />
					<form:input type="number" class="form-control" id="charge150Hrs"
						path="placeRateDTOList[4].price"/>
					<span class="input-group-text">원</span>
				</div>
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[4].price" />
					</small>
				<p></p>
			
				<!-- hr width 시간부터 -->
				<div class="col-md-2"></div>
				<div class="col-md-2 pl-0">
					<label for="charge200Hrs" class="form-label">200시간(원)</label>
				</div>
					<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[5].rateId" value="11" />
					<form:input type="number" class="form-control" id="charge200Hrs"
						path="placeRateDTOList[5].price" />
					<span class="input-group-text">원</span>
				</div>
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[5].price" />
					</small>
			</div>
			
			<hr class="center hr-gray">
		
			<div class="row">
				<div class="col-md-2">
					<p>기간 정기권</p>
				</div>
				<div class="col-md-2 pl-0">
					<label for="periodUnreserved1Weeks" class="form-label">1주 자유석(원)</label>
				</div>
				<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[6].rateId" value="12" />
					<form:input type="number" class="form-control" id="periodUnreserved1Weeks"
						path="placeRateDTOList[6].price"/>
					<span class="input-group-text">원</span>
				</div>				
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[6].price" />
					</small>
				<p></p>
				
		
				<!-- hr width 시간부터 -->
				<div class="col-md-2">
				</div>
				<div class="col-md-2 pl-0">
					<label for="periodUnreserved2Weeks" class="form-label">2주
						자유석(원)</label>
				</div>
				<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[7].rateId" value="13" />
					<form:input type="number" class="form-control" id="periodUnreserved2Weeks"
						path="placeRateDTOList[7].price"/>
					<span class="input-group-text">원</span>
				</div>
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[7].price" />
					</small>
				<p></p>
				
				<!-- hr width 시간부터 -->
				<div class="col-md-2"></div>
				<div class="col-md-2 pl-0">
					<label for="periodUnreserved4Weeks" class="form-label">4주 자유석(원)</label>
				</div>
				<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[8].rateId" value="14" />
					<form:input type="number" class="form-control" id="periodUnreserved4Weeks"
						path="placeRateDTOList[8].price"/>
					<span class="input-group-text">원</span>
				</div>
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[8].price" />
					</small>
				<p></p>
			
			
				<!-- hr width 시간부터 -->
				<div class="col-md-2"></div>
				<div class="col-md-2 pl-0">
					<label for="periodReserved4Weeks" class="form-label">4주
						고정석(원)</label>
				</div>
				<div class="input-group" style="width: 50%;">
					<form:hidden path="placeRateDTOList[14].rateId" value="15" />
					<form:input type="number" class="form-control" id="periodReserved4Weeks"
						path="placeRateDTOList[14].price"/>
					<span class="input-group-text">원</span>
				</div>
					<small class="col-red ml-270">
						<form:errors path="placeRateDTOList[14].price" />
					</small>
				
			</div>
		<hr class="max-wd800 center hr-6gray">

		<div class="max-wd800 center container supply pl-0">
			<p>제공 유무</p>

			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="coffee">커피</label>
				</div>
				<form:hidden path="placeServiceDTOList[0].serviceId" value="1" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[0].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[0].feeStatus"
					value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[0].pricePaid" class="form-control" 
					value="${placeServiceDTOList[0].pricePaid }"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[0].feeStatus" value="N/A"
					label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[0].pricePaid" />
				</p>
			</div>
			<br>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="drinks">음료</label>
				</div>
				<form:hidden path="placeServiceDTOList[1].serviceId" value="2" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[1].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[1].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[1].pricePaid" class="form-control"
					value="${placeServiceDTOList[1].pricePaid}"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[1].feeStatus" value="N/A"
					label="미제공" checked="checked"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[1].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="snack">간식</label>
				</div>
				<form:hidden path="placeServiceDTOList[2].serviceId" value="3" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[2].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[2].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[2].pricePaid" class="form-control"
					value="${placeServiceDTOList[2].pricePaid}"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[2].feeStatus" value="N/A"
						label="미제공" />
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[2].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="printer">프린터</label>
				</div>
				<form:hidden path="placeServiceDTOList[3].serviceId" value="4" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[3].feeStatus"
					value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[3].feeStatus"
					value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">	
					<form:input type="number" path="placeServiceDTOList[3].pricePaid" class="form-control"
					value="${placeServiceDTOList[3].pricePaid}"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[3].feeStatus" value="N/A"
						label="미제공" />
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[3].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName"  for="scanner">스캐너</label>
				</div>
				<form:hidden path="placeServiceDTOList[4].serviceId" value="5" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[4].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[4].feeStatus"
					value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[4].pricePaid" class="form-control"
					value="${placeServiceDTOList[4].pricePaid}"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[4].feeStatus" value="N/A"
						label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[4].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="locker">사물함</label>
				</div>
					<form:hidden path="placeServiceDTOList[5].serviceId" value="6" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[5].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[5].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[5].pricePaid" class="form-control"
						value="${placeServiceDTOList[5].pricePaid}"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[5].feeStatus" value="N/A"
						label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[5].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="parking">주차</label>
				</div>
				<form:hidden path="placeServiceDTOList[6].serviceId" value="7" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[6].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[6].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[6].pricePaid" class="form-control"
						value="${placeServiceDTOList[6].pricePaid }"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[6].feeStatus" value="N/A"
						label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[6].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="meetingRoom">회의실</label>
				</div>
				<form:hidden path="placeServiceDTOList[7].serviceId" value="8" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[7].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[7].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">	
					<form:input type="number" path="placeServiceDTOList[7].pricePaid" class="form-control"
						value="${placeServiceDTOList[7].pricePaid }"/>
				</div>		
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[7].feeStatus" value="N/A"
						label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[7].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="blanket">담요</label>
				</div>
					<form:hidden path="placeServiceDTOList[8].serviceId" value="9" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[8].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[8].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[8].pricePaid" class="form-control"
						value="${placeServiceDTOList[8].pricePaid}"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[8].feeStatus" value="N/A"
						label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[8].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="bookstand">책 받침대</label>
				</div>
				<form:hidden path="placeServiceDTOList[9].serviceId" value="10" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[9].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[9].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[9].pricePaid" class="form-control"
						value="${placeServiceDTOList[9].pricePaid }"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[9].feeStatus" value="N/A"
						label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[9].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="phoneCharger">핸드폰 충전기</label>
				</div>
					<form:hidden path="placeServiceDTOList[10].serviceId" value="11" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[10].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[10].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[10].pricePaid" class="form-control"
						value="${placeServiceDTOList[10].pricePaid }"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[10].feeStatus"
						value="N/A" label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[10].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="lamp">스탠드</label>
				</div>
				<form:hidden path="placeServiceDTOList[11].serviceId" value="12" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[11].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[11].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[11].pricePaid" class="form-control"
						value="${placeServiceDTOList[11].pricePaid }"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[11].feeStatus"
						value="N/A" label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[11].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="cushion">방석</label>
				</div>
				<form:hidden path="placeServiceDTOList[12].serviceId" value="13" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[12].feeStatus"
						value="free" label="무료 제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[12].feeStatus"
						value="paid" label="유료 제공" />
				</div>
				<div class="col-md-2">
					<form:input type="number" path="placeServiceDTOList[12].pricePaid" class="form-control"
						value="${placeServiceDTOList[12].pricePaid }"/>
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[12].feeStatus"
						value="N/A" label="미제공"/>
				</div>
				<p class="col-red">
					<form:errors path="placeServiceDTOList[12].pricePaid" />
				</p>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="wifi">와이파이</label>
				</div>
				<form:hidden path="placeServiceDTOList[13].serviceId" value="14" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[13].feeStatus"
						value="free" label="제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[13].feeStatus"
						value="N/A" label="미제공"/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="cafeteria">취식가능한 장소</label>
				</div>
					<form:hidden path="placeServiceDTOList[14].serviceId" value="15" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[14].feeStatus"
						value="free" label="제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[14].feeStatus"
						value="N/A" label="미제공"/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label id="supplyName" for="seperateRestroom">남/녀 화장실 구분</label>
				</div>
				<form:hidden path="placeServiceDTOList[15].serviceId" value="16" />
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[15].feeStatus"
						value="free" label="제공" />
				</div>
				<div class="col-md-2">
					<form:radiobutton path="placeServiceDTOList[15].feeStatus"
						value="N/A" label="미제공"/>
				</div>
			</div>
		</div>
		
		<hr class="max-wd800 center hr-6gray">
		
		<div class="row">
			<div class="col-md-2">
				<p>대표이미지</p>
			</div>
			<div class="col-md-8">
				<c:choose>
					<c:when test="${empty updatePlaceModel.thumbnailImageDTO.uploadFileName} ">
						<img id="previewThumb" class="thumbnail" src="../images/noimage.jpg"/><br>
					</c:when>
					<c:otherwise>
						<img id="previewThumb" class="thumbnail" src="http://localhost:8080/mypage/${updatePlaceModel.thumbnailImageDTO.uploadFileName }"/><br>
					</c:otherwise>
				</c:choose>
				<input type="file" name="thumbnailImageDTO.file" id="thumbnail">
			</div>
		</div>	
		<hr class="max-wd800 center hr-gray">
		
		<div class="row">
			<div class="col-md-2">
				<p>상세이미지</p>
			</div>
			<div class="col-md-8">
				<input type="file" name="multipartFiles" id="subImage" multiple>
			
				<c:choose>
					<c:when test="${ empty updatePlaceModel.multipartFiles} ">
						<img id="previewSub" class="subImage" src="../images/noimage.jpg"/><br>
					</c:when>
					<c:otherwise>
						<div class="subImages"></div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
			
			<!-- 미리보기 -->
			<!-- 업로드 한 사진 가져오기 -->
		<hr class="max-wd800 center hr-gray">
			
		<div class="row">
			<div class="col-md-2">
				<p>가격표 이미지</p>
			</div>
			<div class="col-md-8">
				<c:choose>
					<c:when test="${empty updatePlaceModel.priceImageDTO.uploadFileName} ">
						<img id="previewPrice" class="price" src="../images/noimage.jpg"/><br>
					</c:when>
					<c:otherwise>
						<img id="previewPrice" class="price" src="http://localhost:8080/mypage/${updatePlaceModel.priceImageDTO.uploadFileName }"/><br>
					</c:otherwise>
				</c:choose>
				<input type="file" name="priceImageDTO.file" id="price">
			</div>
		</div>
			
		<div class="max-wd800 center">
			<button type="submit" class="submitBtn btn btn-outline-secondary">정보수정</button>
		</div>
		</form:form>

</body>
</html>

<style>
.hr-6gray{
border: 6px solid #dee2e6;
}
.hr-gray{
	border: 1px solid #dee2e6;
}
#suppplyName{
	width: 180px !important;
}
.pl-0{
	padding-left: 0px;
}
.max-wd800 {
	max-width: 800px;
}
.ml-270{
margin-left: 270px;}
.center {
	margin: 1% auto;
}

.col-red{
color: red;
}
.thumbnail {
	width: 300px;
	height: 300px;
	border: 1px solid gray;
}
.submitBtn{
	width: 200px;
 	height: 40px;
	background-color: white;
	border: 2px solid #20c997;
	border-radius: 10px;
	display: block;
	float: right;
	margin-top: 10px;
	margin-right: 10px;
}
#previewPrice, #previewSub, #previewThumb {
	width: 200px;
	height: 200px;
}
</style>