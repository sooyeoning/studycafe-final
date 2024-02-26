<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<script src="/js/admin/updatePlaceFormSuccess.js"></script>

	<!-- header -->
	<nav class="navbar bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">스터디 카페를 찾는 이로운 방법</a>
		</div>
	</nav>

	<ul class="nav justify-content-end">
		<li class="nav-item"><a class="nav-link" href="/web/mypage/info"><c:out
					value="${userNickname}" />님</a></li>
		<li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
	</ul>

	<!-- body -->
	<!-- place/update/info -->
	<div class="g-3 align-items-center max-wd800 center border">

		<h5>장소 수정</h5>

		<form:form method="post" modelAttribute="updatePlaceModel"
			action="/place/update/info" class="max-wd600 center">

		<form:hidden path="id" value="${updatePlaceModel.id }" />

			<div class="max-wd800 center">
				<label for="name" class="form-label">장소명</label>
				<form:input type="text" class="form-control" id="name" path="placeDTO.name" 
				value="${placeDTO.name}" />
				<p style="color: red">
					<form:errors path="placeDTO.name" />
				</p>
			</div>

			<div class="max-wd800 center">
				<label for="address" class="form-label">주소</label>
				<form:input type="text" class="form-control" id="address"
					path="placeDTO.address" value="${placeDTO.address} "/>
				<p style="color: red">
					<form:errors path="placeDTO.address" />
				</p>
			</div>

			<div class="max-wd800 center">
				<label for="phone" class="form-label">매장번호</label>
				<form:input type="text" class="form-control" id="phone" 
				path="placeDTO.phone" value="${placeDTO.phone }"/>
				<p style="color: red">
					<form:errors path="placeDTO.phone" />
				</p>
			</div>

			<div class="max-wd800 center form-floating">
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
				<label for="areaCode">자치구 이름</label>
			</div>
			<p style="color: red">
				<form:errors path="placeDTO.areaCode" />
			</p>

			<hr class="max-wd800 center">
		<p class="max-wd800 center">가격 정보</p>
		
		<p class="max-wd800 center">일일 요금제</p>
		<div class="max-wd800 center">
			<label for="2hrs" class="form-label">2시간(원)</label>
			<form:hidden path="placeRateDTOList[0].rateId" value="1" />
			<form:input type="number" class="form-control" id="2Hrs"
				path="placeRateDTOList[0].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[0].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="4Hrs" class="form-label">4시간(원)</label>
			<form:hidden path="placeRateDTOList[1].rateId" value="2" />
			<form:input type="number" class="form-control" id="4Hrs"
				path="placeRateDTOList[1].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[1].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="6Hrs" class="form-label">6시간(원)</label>
			<form:hidden path="placeRateDTOList[2].rateId" value="3" />
			<form:input type="number" class="form-control" id="6Hrs"
				path="placeRateDTOList[2].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[2].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="12Hrs" class="form-label">12시간(원)</label>
			<form:hidden path="placeRateDTOList[3].rateId" value="4" />
			<form:input type="number" class="form-control" id="12Hrs"
				path="placeRateDTOList[3].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[3].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="1Hrs" class="form-label">연장 1시간(원)</label>
			<form:hidden path="placeRateDTOList[4].rateId" value="5" />
			<form:input type="number" class="form-control" id="1Hrs"
				path="placeRateDTOList[4].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[4].price" />
			</p>
		</div>

		<p>시간 충전권</p>
		<div class="max-wd800 center">
			<label for="charge10Hrs" class="form-label">10시간(원)</label>
			<form:hidden path="placeRateDTOList[5].rateId" value="6" />
			<form:input type="number" class="form-control" id="charge10Hrs"
				path="placeRateDTOList[5].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[5].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="charge30Hrs" class="form-label">30시간(원)</label>
			<form:hidden path="placeRateDTOList[6].rateId" value="7" />
			<form:input type="number" class="form-control" id="charge30Hrs"
				path="placeRateDTOList[6].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[6].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="charge50Hrs" class="form-label">50시간(원)</label>
			<form:hidden path="placeRateDTOList[7].rateId" value="8" />

			<form:input type="number" class="form-control" id="charge50Hrs"
				path="placeRateDTOList[7].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[7].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="charge100Hrs" class="form-label">100시간(원)</label>
			<form:hidden path="placeRateDTOList[8].rateId" value="9" />
			<form:input type="number" class="form-control" id="charge100Hrs"
				path="placeRateDTOList[8].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[8].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="charge150Hrs" class="form-label">150시간(원)</label>
			<form:hidden path="placeRateDTOList[9].rateId" value="10" />
			<form:input type="number" class="form-control" id="charge150Hrs"
				path="placeRateDTOList[9].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[9].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="charge200Hrs" class="form-label">200시간(원)</label>
			<form:hidden path="placeRateDTOList[10].rateId" value="11" />
			<form:input type="number" class="form-control" id="charge200Hrs"
				path="placeRateDTOList[10].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[10].price" />
			</p>
		</div>
		<p>기간 정기권</p>
		<div class="max-wd800 center">
			<label for="periodUnreserved1Weeks" class="form-label">1주
				자유석(원)</label>
			<form:hidden path="placeRateDTOList[11].rateId" value="12" />
			<form:input type="number" class="form-control"
				id="periodUnreserved1Weeks" path="placeRateDTOList[11].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[11].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="periodUnreserved2Weeks" class="form-label">2주
				자유석(원)</label>
			<form:hidden path="placeRateDTOList[12].rateId" value="13" />

			<form:input type="number" class="form-control"
				id="periodUnreserved2Weeks" path="placeRateDTOList[12].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[12].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="periodUnreserved4Weeks" class="form-label">4주
				자유석(원)</label>
			<form:hidden path="placeRateDTOList[13].rateId" value="14" />
			<form:input type="number" class="form-control"
				id="periodUnreserved4Weeks" path="placeRateDTOList[13].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[13].price" />
			</p>
		</div>
		<div class="max-wd800 center">
			<label for="periodReserved4Weeks" class="form-label">4주
				고정석(원)</label>
			<form:hidden path="placeRateDTOList[14].rateId" value="15" />
			<form:input type="number" class="form-control"
				id="periodReserved4Weeks" path="placeRateDTOList[14].price" />
			<p style="color: red">
				<form:errors path="placeRateDTOList[14].price" />
			</p>
		</div>

		<hr class="max-wd800 center">
		<div class="supply center max-wd800">
			<p>제공 유무</p>

			<label for="coffee">커피</label>
			<form:hidden path="placeServiceDTOList[0].serviceId" value="1" />
			<form:radiobutton path="placeServiceDTOList[0].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[0].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[0].pricePaid"
				value="${placeServiceDTOList[0].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[0].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="drinks">음료</label>
			<form:hidden path="placeServiceDTOList[1].serviceId" value="2" />
			<form:radiobutton path="placeServiceDTOList[1].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[1].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[1].pricePaid"
				value="${placeServiceDTOList[1].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[1].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="snack">간식</label>
			<form:hidden path="placeServiceDTOList[2].serviceId" value="3" />
			<form:radiobutton path="placeServiceDTOList[2].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[2].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[2].pricePaid"
				value="${ placeServiceDTOList[2].pricePaid}"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[2].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="printer">프린터</label>
			<form:hidden path="placeServiceDTOList[3].serviceId" value="4" />
			<form:radiobutton path="placeServiceDTOList[3].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[3].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[3].pricePaid"
				value="${ placeServiceDTOList[3].pricePaid}"
				placeholder="1장당 가격" />
			<form:radiobutton path="placeServiceDTOList[3].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="scanner">스캐너</label>
			<form:hidden path="placeServiceDTOList[4].serviceId" value="5" />
			<form:radiobutton path="placeServiceDTOList[4].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[4].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[4].pricePaid"
				value="${placeServiceDTOList[4].pricePaid }"
				placeholder="1장당 가격" />
			<form:radiobutton path="placeServiceDTOList[4].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="locker">사물함</label>
			<form:hidden path="placeServiceDTOList[5].serviceId" value="6" />
			<form:radiobutton path="placeServiceDTOList[5].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[5].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[5].pricePaid"
				value="${placeServiceDTOList[5].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[5].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="parking">주차</label>
			<form:hidden path="placeServiceDTOList[6].serviceId" value="7" />
			<form:radiobutton path="placeServiceDTOList[6].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[6].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[6].pricePaid"
				value="${placeServiceDTOList[6].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[6].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="meetingRoom">회의실</label>
			<form:hidden path="placeServiceDTOList[7].serviceId" value="8" />
			<form:radiobutton path="placeServiceDTOList[7].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[7].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[7].pricePaid"
				value="${placeServiceDTOList[7].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[7].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="blanket">담요</label>
			<form:hidden path="placeServiceDTOList[8].serviceId" value="9" />
			<form:radiobutton path="placeServiceDTOList[8].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[8].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[8].pricePaid"
				value="${placeServiceDTOList[8].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[8].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="bookstand">책 받침대</label>
			<form:hidden path="placeServiceDTOList[9].serviceId" value="10" />
			<form:radiobutton path="placeServiceDTOList[9].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[9].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[9].pricePaid"
				value="${placeServiceDTOList[9].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[9].feeStatus" value="N/A"
				label="미제공" />
			<br> 
			<label for="phoneCharger">핸드폰 충전기</label>
			<form:hidden path="placeServiceDTOList[10].serviceId" value="11" />
			<form:radiobutton path="placeServiceDTOList[10].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[10].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[10].pricePaid"
				value="${placeServiceDTOList[10].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[10].feeStatus"
				value="N/A" label="미제공" />
			<br> 
			<label for="lamp">스탠드</label>
			<form:hidden path="placeServiceDTOList[11].serviceId" value="12" />
			<form:radiobutton path="placeServiceDTOList[11].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[11].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[11].pricePaid"
				value="${placeServiceDTOList[11].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[11].feeStatus"
				value="N/A" label="미제공" />
			<br> 
			<label for="cushion">방석</label>
			<form:hidden path="placeServiceDTOList[12].serviceId" value="13" />
			<form:radiobutton path="placeServiceDTOList[12].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[12].feeStatus"
				value="paid" label="유료 제공" />
			<form:input type="number" path="placeServiceDTOList[12].pricePaid"
				value="${placeServiceDTOList[12].pricePaid }"
				placeholder="숫자만 적어주세요" />
			<form:radiobutton path="placeServiceDTOList[12].feeStatus"
				value="N/A" label="미제공" />
			<br> 
			<label for="wifi">와이파이</label>
			<form:hidden path="placeServiceDTOList[13].serviceId" value="14" />
			<form:radiobutton path="placeServiceDTOList[13].feeStatus"
				value="free" label="무료 제공" />
			<form:radiobutton path="placeServiceDTOList[13].feeStatus"
				value="N/A" label="미제공" />
			<br> 
			<label for="cafeteria">취식가능한 장소</label>
			<form:hidden path="placeServiceDTOList[14].serviceId" value="15" />
			<form:radiobutton path="placeServiceDTOList[14].feeStatus"
				value="free" label="제공" />
			<form:radiobutton path="placeServiceDTOList[14].feeStatus"
				value="N/A" label="미제공" />
			<br> 
			<label for="seperateRestroom">남/녀 화장실 구분</label>
			<form:hidden path="placeServiceDTOList[15].serviceId" value="16" />
			<form:radiobutton path="placeServiceDTOList[15].feeStatus"
				value="free" label="제공" />
			<form:radiobutton path="placeServiceDTOList[15].feeStatus"
				value="N/A" label="미제공" />
					
			<hr class="max-wd800 center">
			<p>대표이미지</p>
			<input type="file" name="thumbnail" id="thumbnail">
			<hr class="max-wd800 center">
			
			<p>상세이미지</p>
			<input type="file" name="multipartFiles" id="imageFile" multiple>
			<hr class="max-wd800 center">
			
			<p>가격표 이미지</p>
			<input type="file" name="price" id="price">
			<hr class="max-wd800 center">
			<div class="max-wd800 center">
				<button type="submit" class="submitBtn btn btn-outline-secondary">정보수정</button>
			</div>
		</form:form>

	</div>
</body>
</html>

<style>
.max-wd800 {
	max-width: 800px;
}

.center {
	margin: 1% auto;
}

.navbar-brand {
	margin: 0 auto;
}
</style>