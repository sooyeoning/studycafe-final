

https://capsule-render.vercel.app/api?type=waving&color=auto&height=300&section=header&text=StudyCafe&fontSize=90

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

**FE** :  HTML5, CSS3, Javascript

**BE** :  Java, Spring Boot

**IDE** : STS4

**DB** : Mysql


### 📌 주요 기능

---
### 좌석권 구매/등록

- **한 지점당 한개의 좌석권만 등록가능/ 등록된 좌석권 사용만료 후 다른 좌석권 등록**

![13.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/09e98d33-8317-4626-9b92-027de5be0ab0/13.png)

- **좌석권 구매** : 좌석권 db 등록
- **좌석권 리스트 조회** : 사용자가 구매한 좌석권 목록 조회
    
    → 잔여시간 '00:00:00' 인 좌석권 : 지점 등록 불가
    

![14.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/332768ca-14eb-4e2a-b075-5bc57e014c63/14.png)

- **좌석권 지점 등록/수정**
    - 좌석권 등록 페이지로 이동 후 지점 등록/수정
    - 성공시: 좌석 예약 페이지로 이동
    - Exception 처리
        
        해당 지점에 등록된 좌석권 존재(ExistsRegisteredTicketForPlaceException) 
        
        → 오류 메시지 alert 
        

### 좌석예약

- **동시간에 한지점만 사용 가능**

![15.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/b745d4a8-2d47-4142-be19-a11f2c52e1e9/15.png)

- **비회원**
    - 지점별 좌석도 조회 : 지점별 좌석도, 예약된 좌석 조회
    - Exception 처리
        
        회원정보 없음(NotExistsLoginInformationException) → 서비스 제한(로그인 페이지로 이동)
        
- **회원**
    - **좌석도 조회**
        
        회원가입시 입력한 사용자의 사용지점의 좌석도(+예약된 좌석, 예약된 내 좌석) 조회
        
    
    ![16.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/723a03a3-c93e-46e4-9d1c-4baf1b4fa06d/16.png)
    
    ![17.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/abf419f3-d337-4075-aaa6-e29ff06ba255/17.png)
    
    - **좌석 예약**
    - Exception 처리
        
        이미 예약중인 좌석이 있는 경우(AlreadyReservedUserException) →  오류메시지 alert
        등록된 좌석권이 없는 경우(NotRegisteredTicketException) → 오류메시지 alert
        
    
    ![18.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/aeec03bf-f979-41c7-961d-b3c6914fb9fb/18.png)
    
    - **동시성 예약 문제 고려(@Transactional)**
        
        다른 회원이 해당 좌석을 이미 예약한 경우(AlreadyReservedSeatException) 
        
        →  서비스 제한(오류메시지 alert)
        
    
    ![19.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/7849846d-dc83-4de9-adc0-bd7b4abef4a8/19.png)
    
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

![1 - 복사본.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/79428e0c-c6b8-4d69-a5b0-ec4be6c8b523/1_-_%EB%B3%B5%EC%82%AC%EB%B3%B8.png)

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
        

![4.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/a28de373-179a-4a84-bc89-ecbde21d8401/4.png)

- **로그인**
    - 비밀번호 일치 확인(passwordEncoder 사용)
        
        입력된 아이디로 db 저장된 암호화된 비밀번호와 입력한 비밀번호 일치 확인
        
    - 비밀번호 숨김 기능
        
        기본 숨김으로 설정 → 아이콘 이용해 비밀번호 노출, 숨김 가능
        

![2.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/1db13d7e-f1c4-4691-a16b-5c62f7f89786/2.png)

- **아이디 찾기**
    - 유효 검사(@Valid 사용)  : 이름, 이메일
    - 이름, 이메일 일치 시 아이디 조회 가능
    - 부분 마스크처리: 마스킹된 아이디 노출

![3.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/0a1af04f-b234-40a7-ae32-50af713ceb6c/3.png)

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

![5.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/1b535647-b277-48b6-9b95-2af1c8f1ee91/5.png)

- **회원 중복확인**
    - 재로그인 : 로그인된 아이디에 맞는 비밀번호 재입력하여 로그인
    →  틀렸을 경우 : 오류메시지 전달
    - 성공시 마이페이지로 이동
    - 비밀번호 숨김 기능
        
        기본 숨김으로 설정 → 아이콘 이용해 비밀번호 노출, 숨김 가능
        

![6.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/46707537-753d-4d77-b48f-9a767bf8b56a/6.png)

- **회원 정보 수정**
    - 프로필 사진 변경
    - 중복(duplicate) 확인 : 닉네임
    - 정보 수정 : 이름, 닉네임, 관심 지역, 사용 지점

![7.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/108cb330-e4a0-4952-9bc9-f915dabb6581/7.png)

![8.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/aeac45bf-e990-4028-a6e9-48221be3ac0e/8.png)

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
        

![9.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/7a7f7b34-0645-4733-89d6-c44307ee0102/9.png)

![10.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/ee82cd95-595a-44c6-bc80-252dfeb85f19/10.png)

- **회원 탈퇴**
    - 재로그인 : 입력값이 로그인한 회원(아이디, 비밀번호)와 일치하는지 확인
    →  아이디 or 비밀번호가 틀렸을 경우 : 로그인한 회원정보와 다르다는 오류메시지 alert
    - 성공시 회원 탈퇴 페이지로 이동하여 탈퇴
    - 비밀번호 숨김 기능
        
        기본 숨김으로 설정 →  아이콘 이용해 비밀번호 노출, 숨김 가능
        
    

### 메인페이지(지점검색, 상세페이지)

![11.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/df04dfeb-860a-44f8-bcab-10b9cd3e7de4/11.png)

- **필터를 이용한 장소 조회**
    - 지점 검색 : 지역별, 시간별(좌석권), 지점명 선택하여 기본 검색
    - 지점 검색(상세 필터) : 사용자가 원하는 서비스 선택 후 검색
    - 좌석권이 저렴한 순서대로 지점 노출
    - 제공되는 서비스 무료/유료 여부 노출
    - 지점 클릭시 지점 상세페이지로 이동

![12.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/ef17120c-a0da-4490-86e5-b8c6bbad3463/12.png)

- **지점** **상세페이지**
    - 지점 사진 제공 : 장소 대표 사진, 상세 사진, 가격표 사진
    - 지점 위치를 지도로 제공(카카오 API 사용)
    - 지점 상세 정보 노출 : 주소, 전화번호/ 가격 정보/ 제공 서비스
    



### 관리자 페이지

![20.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/0914b7e5-7ca5-4149-b463-a626d6d99382/20.png)

- **장소 조회**
    - 지점 검색 : 지역별, 지점명 선택하여 기본 검색
    - 지점명 클릭시 장소 상세페이지로 이동

![21.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/1789ba3f-5296-42e2-bf84-aa11717f476f/21.png)

- **지점 상세페이지**
    - 지점 사진 제공 : 장소 대표 사진, 상세 사진, 가격표 사진
    - 지점 위치를 지도로 제공(카카오 API 사용)
    - 지점 상세 정보 노출 : 주소, 전화번호/ 가격 정보/ 제공 서비스

![22.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/d9f7aa2e-945c-4a19-8402-a8d0f89e3936/22.png)

- **지점 등록**
    - 유효 검사(@Valid 사용) : 기본정보(NotBlank), 가격정보(typeMismatch), 서비스 정보
    - 지점 대표 사진 등록

![23.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/cc71aef7-6bdb-46ed-a42c-8fb4e1e979a7/23.png)

- **지점 수정**
    - 지점 가격표 사진, 상세 사진 추가 등록
    - 기존 정보 제공 후 정보 수정
    

![24.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/b38975f6-25f7-45c2-9b61-77624f0669c6/4ff83148-00c3-47ec-95e7-38e23dd9edc2/24.png)

- **장소 삭제**

https://capsule-render.vercel.app/api?type=waving&color=auto&height=200&section=footer
