
### 🖥️ 프로젝트 소개

---

### 주제: 스터디 카페 서비스 비교 & 좌석 예약 서비스

저는 지금까지 다양한 자격증과 시험을 준비하는 데 많은 노력과 시간을 투자해왔습니다.
이 과정에서 스터디카페를 자주 이용했으나, 같은 프랜차이즈 지점이라도 각 지점마다 제공되는 서비스의 차이와 이용권을 별도로 구매해야하는 불편함을 경험했습니다.

이러한 불편함을 해소하고자, 나만의 스터디카페 서비스를 개발하였습니다. 이 서비스는 사용자 편의성을 최우선으로 고려하여, 사용자가 원하는 서비스를 선택하여 검색해볼 수 있습니다. 또한, 단일 이용권으로 여러 지점을 이용할 수 있어 사용자들이 편리하게 서비스를 이용할 수 있도록 구성되었습니다.

사용자 입장에서 느낀 불편함을 바탕으로 한 이 서비스는 사용자들에게 보다 효과적이고 편리한 학습환경을 제공할 것입니다.

### 🧑‍🤝‍🧑 멤버 구성

---

김수연

### 🕰️ 개발기간

---

23.11.10 ~ ing

### ⚙️ 개발환경

---

FE : 
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
<img src="https://img.shields.io/badge/css3-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white">  
BE : 
<img src="https://img.shields.io/badge/java-16A5F3?style=for-the-badge&logo=logoColor=white">
<img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
<img src="https://img.shields.io/badge/maven-0C2340?style=for-the-badge&logo=logoColor=white">  
IDE : <img src="https://img.shields.io/badge/sts4-6DB33F?style=for-the-badge&logo=spring&logoColor=white">  
DB : <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">  
![studycafe_db](https://github.com/sooyeoning/studycafe-final/assets/135004060/2b1804d2-6e47-47a3-bb03-319b08d3e176)


### 📌 주요 기능

---
### 좌석권 구매/등록

- **한 지점당 한개의 좌석권만 등록가능/ 등록된 좌석권 사용만료 후 다른 좌석권 등록**

![13](https://github.com/sooyeoning/studycafe-final/assets/135004060/bf0bef1f-c710-460c-b075-59d00a11ae5d)
- **좌석권 구매** : 좌석권 db 등록
- **좌석권 리스트 조회** : 사용자가 구매한 좌석권 목록 조회
    
    → 잔여시간 '00:00:00' 인 좌석권 : 지점 등록 불가
    

![14](https://github.com/sooyeoning/studycafe-final/assets/135004060/699a0771-97f0-425a-91b6-127887eca1de)
- **좌석권 지점 등록/수정**
    - 좌석권 등록 페이지로 이동 후 지점 등록/수정
    - 성공시: 좌석 예약 페이지로 이동
    - Exception 처리
        
        해당 지점에 등록된 좌석권 존재(ExistsRegisteredTicketForPlaceException) 
        
        → 오류 메시지 alert 
        

### 좌석예약

- **동시간에 한지점만 사용 가능**

![15](https://github.com/sooyeoning/studycafe-final/assets/135004060/a133c4fa-984d-4d5e-a338-de0151b25ab6)
- **비회원**
    - 지점별 좌석도 조회 : 지점별 좌석도, 예약된 좌석 조회
    - Exception 처리
        
        회원정보 없음(NotExistsLoginInformationException) → 서비스 제한(로그인 페이지로 이동)
        
- **회원**
    - **좌석도 조회**
        
        회원가입시 입력한 사용자의 사용지점의 좌석도(+예약된 좌석, 예약된 내 좌석) 조회
        
    
   ![16](https://github.com/sooyeoning/studycafe-final/assets/135004060/1ed960fc-b6d7-4370-8452-e9a48a325159)
   ![17](https://github.com/sooyeoning/studycafe-final/assets/135004060/fea5800f-12b5-4d8d-b173-e5ccde10d0b7)
    
    - **좌석 예약**
    - Exception 처리
        
        이미 예약중인 좌석이 있는 경우(AlreadyReservedUserException) →  오류메시지 alert
        등록된 좌석권이 없는 경우(NotRegisteredTicketException) → 오류메시지 alert
        
    
    ![18](https://github.com/sooyeoning/studycafe-final/assets/135004060/9662dbae-4d1d-46ca-afd1-422b6d328053)    
    - **동시성 예약 문제 고려(@Transactional)**
        
        다른 회원이 해당 좌석을 이미 예약한 경우(AlreadyReservedSeatException) 
        
        →  서비스 제한(오류메시지 alert)
        
    
    ![19](https://github.com/sooyeoning/studycafe-final/assets/135004060/bde1d1e7-145a-48cc-875e-17115e478738)
    
    - **좌석 반납**
    - **좌석권 사용기간 만료에 따른 자동반납**
        - **Scheduler 사용** : 시간 충전권(주기: 5분당 1번), 기간권(주기: 하루 1번)
        - 시간 충전권
            
            좌석 예약중인 좌석권의 잔여시간 수정(잔여시간-이용시간) 
            
            → 잔여시간이 '00:00:00'일 경우 좌석 자동 반납
            
        - 기간권
            
            좌석 예약중인 좌석권의 만료날짜와 현재 날짜 비교 
            
            → 잔여 기간이 없을 경우 자동 반납
            
### 회원가입 & 로그인 & 아이디 찾기/ 비밀번호 찾기

![1 - 복사본](https://github.com/sooyeoning/studycafe-final/assets/135004060/9e27b50f-9be9-4951-9c32-9a8393a1bbd5)
- **회원가입**
    - 유효 검사(@Valid 사용)
        
        이메일(형식: [xxx@xxx.xxx](mailto:xxx@xxx.xxx)), 아이디(형식: 8~30자리), 비밀번호, 주소, 닉네임, 이름
        
    - 중복(duplicate) 검사 : 닉네임, 아이디, 이메일
    - 중복(double) 확인 : 비밀번호, 비밀번호 확인 입력값 동일한지 확인
    - 유효한 이메일 검사
        
        작성한 이메일주소로 인증번호 전달 → 전달받은 인증번호 확인
        
    - 비밀번호 암호화 후 db 저장 (spring-security-crypto 사용)
    - 비밀번호 숨김 기능
        
        기본 숨김으로 설정 → 아이콘 이용해 비밀번호 노출, 숨김 가능
        

![4](https://github.com/sooyeoning/studycafe-final/assets/135004060/8d33bacf-08d9-4d8d-b268-b38ef7c81702)

- **로그인**
    - 비밀번호 일치 확인(passwordEncoder 사용)
        
        입력된 아이디로 db 저장된 암호화된 비밀번호와 입력한 비밀번호 일치 확인
        
    - 비밀번호 숨김 기능
        
        기본 숨김으로 설정 → 아이콘 이용해 비밀번호 노출, 숨김 가능
        

![2](https://github.com/sooyeoning/studycafe-final/assets/135004060/c979b380-b82f-4ee6-adfb-6a830a804db2)

- **아이디 찾기**
    - 유효 검사(@Valid 사용)  : 이름, 이메일
    - 이름, 이메일 일치 시 아이디 조회 가능
    - 부분 마스크처리: 마스킹된 아이디 노출

![3](https://github.com/sooyeoning/studycafe-final/assets/135004060/fdd7fdb0-2975-47e1-afb0-fb34bc2337c1)

- **비밀번호 찾기**
    - 유효 검사(@Valid 사용)  : 아이디, 이메일
    - 가입여부 확인
        
        입력한 아이디, 이메일이 db에 존재하는지 확인 
        
        → 틀렸을 경우 : 존재하지 않는다는 오류메시지 alert
        
    - 이메일 동일성 확인
        
        입력한 아이디로 찾은 이메일과 입력한 이메일 동일한지 확인
        → 틀렸을 경우 : 아이디와 맞지 않는 이메일 주소 오류메시지 alert
        
    - 아이디 동일성 확인
        
        입력한 이메일로 찾은 아이디와 입력한 아이디 동일한지 확인
        → 틀렸을 경우 : 이메일 주소와 맞지 않는 아이디 오류메시지 alert
        
    - 임시 비밀번호 생성하여 이메일로 전달
    

### 마이페이지

![5](https://github.com/sooyeoning/studycafe-final/assets/135004060/a5aa40d8-c85b-4621-8c39-e750c6717cc7)

- **회원 중복확인**
    - 재로그인 : 로그인된 아이디에 맞는 비밀번호 재입력하여 로그인
    →  틀렸을 경우 : 오류메시지 전달
    - 성공시 마이페이지로 이동
    - 비밀번호 숨김 기능
        
        기본 숨김으로 설정 → 아이콘 이용해 비밀번호 노출, 숨김 가능
        

![6](https://github.com/sooyeoning/studycafe-final/assets/135004060/6081e740-e011-4e68-a314-fa80380522b9)

- **회원 정보 수정**
    - 프로필 사진 변경
    - 중복(duplicate) 확인 : 닉네임
    - 정보 수정 : 이름, 닉네임, 관심 지역, 사용 지점

![7](https://github.com/sooyeoning/studycafe-final/assets/135004060/c2423082-db6b-4706-b7eb-19eeb94aef8a)

![8](https://github.com/sooyeoning/studycafe-final/assets/135004060/adfb693c-2479-49c8-ab01-1f574521fd0c)

- **회원 비밀번호 수정**
    - 비밀번호 수정 : 현재 비밀번호, 새 비밀번호
    - 동일성 확인
        
        회원 아이디에 맞는 db 비밀번호 조회 →  입력된 현재 비밀번호와 일치하는지 확인
        
    - 동일성 확인
        
        입력된 새 비밀번호와 현재 비밀번호가 일치하는지 확인
        →  일치하는 경우 : 오류메시지 전달
        
    - 중복(double) 확인 : 새 비밀번호, 새 비밀번호 확인 입력값이 동일한지 확인
    - 비밀번호 숨김 기능
        
        기본 숨김으로 설정 →  아이콘 이용해 비밀번호 노출, 숨김 가능
        

![9](https://github.com/sooyeoning/studycafe-final/assets/135004060/d6c85f57-b06c-4b2f-9248-4c651f0f84e8)

![10](https://github.com/sooyeoning/studycafe-final/assets/135004060/97a4aee1-7038-47ee-bfee-ae1e61bd071d)

- **회원 탈퇴**
    - 재로그인 : 입력값이 로그인한 회원(아이디, 비밀번호)와 일치하는지 확인
    →  아이디 or 비밀번호가 틀렸을 경우 : 로그인한 회원정보와 다르다는 오류메시지 alert
    - 성공시 회원 탈퇴 페이지로 이동하여 탈퇴
    - 비밀번호 숨김 기능
        
        기본 숨김으로 설정 →  아이콘 이용해 비밀번호 노출, 숨김 가능
        
    

### 메인페이지(지점검색, 상세페이지)

![11](https://github.com/sooyeoning/studycafe-final/assets/135004060/ab0277c1-7292-466c-97d1-7d860d8e3c1f)

- **필터를 이용한 장소 조회**
    - 지점 검색 : 지역별, 시간별(좌석권), 지점명 선택하여 기본 검색
    - 지점 검색(상세 필터) : 사용자가 원하는 서비스 선택 후 검색
    - 좌석권이 저렴한 순서대로 지점 노출
    - 제공되는 서비스 무료/유료 여부 노출
    - 지점 클릭시 지점 상세페이지로 이동

![12](https://github.com/sooyeoning/studycafe-final/assets/135004060/05fa0ab4-1f0a-42f7-a70f-565ebbbc9040)

- **지점** **상세페이지**
    - 지점 사진 제공 : 장소 대표 사진, 상세 사진, 가격표 사진
    - 지점 위치를 지도로 제공(카카오 API 사용)
    - 지점 상세 정보 노출 : 주소, 전화번호/ 가격 정보/ 제공 서비스
    



### 관리자 페이지

![20](https://github.com/sooyeoning/studycafe-final/assets/135004060/1691a2a2-433f-40d7-822f-76445e2a1629)

- **장소 조회**
    - 지점 검색 : 지역별, 지점명 선택하여 기본 검색
    - 지점명 클릭시 장소 상세페이지로 이동

![21](https://github.com/sooyeoning/studycafe-final/assets/135004060/5e437f2f-1a01-4774-afa5-e5f01e769898)

- **지점 상세페이지**
    - 지점 사진 제공 : 장소 대표 사진, 상세 사진, 가격표 사진
    - 지점 위치를 지도로 제공(카카오 API 사용)
    - 지점 상세 정보 노출 : 주소, 전화번호/ 가격 정보/ 제공 서비스

![22](https://github.com/sooyeoning/studycafe-final/assets/135004060/aa1c521c-40b6-4854-9ac7-832f32361ae9)

- **지점 등록**
    - 유효 검사(@Valid 사용) : 기본정보(NotBlank), 가격정보(typeMismatch), 서비스 정보
    - 지점 대표 사진 등록

![23](https://github.com/sooyeoning/studycafe-final/assets/135004060/081a519d-42bc-4af5-aa5a-35ee88ca5d2c)

- **지점 수정**
    - 지점 가격표 사진, 상세 사진 추가 등록
    - 기존 정보 제공 후 정보 수정
    

![24](https://github.com/sooyeoning/studycafe-final/assets/135004060/4bdc6aca-5b45-4b6b-a354-46c7330a225e)

- **장소 삭제**

