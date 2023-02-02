# TAG - Ticket And Goods (Team Project)

![Monosnap TAG : Ticket And Goods 2023-01-18 14-57-34](https://user-images.githubusercontent.com/103568737/213364351-fc8865c8-16a7-4f1c-875b-87fda278efb0.png)

> 내한공연의 티켓 예매와 오픈마켓 형식으로 공연 관련 상품을 판매하고 구매할 수 있는 쇼핑몰 웹 사이트입니다.

<br><br><br>

## 1. 팀원구성 및 본인 담당페이지 (총 4인)
[본인 담당페이지]
- #### 일반 / 판매자 회원가입 및 로그인 
  - `Ajax` , `jQuery` 를 이용한 비동기식 회원가입 구현
  - `Javacript` 유효성 검사 실시
  - `HttpSession` 으로 로그인 유지, `Cookie` 아이디 저장
- #### 공연 리스트 / 공연 상세 
  - 공연 리스트
    - 공연 전체, 예정 공연, 지난 공연 카테고리 분리
    - 공연 날짜 D-day 카운트
    - 공연 검색 기능
  - 공연 상세
    - 공연 날짜 달력에 표시
    - 선예매 기간 문구 노출
    - 좋아요 기능
- #### 상품 리스트 
  - 카테고리별 상품 목록, 공연별 상품 목록
  - 좋아요 기능
  - 상품 검색 기능
  - 페이징 
- #### 장바구니 
  - 선택 삭제
  - 수량 증가 시 상품 가격 증가와 총 주문금액 증가
  - 총 결제 금액 계산 (50,000원 이상 배송비 할인)

<br><br><br>

## 2. 개발 환경
- Service OS<br> <img src="https://img.shields.io/badge/Mac OS-000000?style=flat-square&logo=Apple&logoColor=white"/> <img src="https://img.shields.io/badge/Window OS-0078D6?style=flat-square&logo=Windows&logoColor=white"/>
- Language<br> <img src="https://img.shields.io/badge/Java 1.8-007396?style=flat-square&logo=Java&logoColor=white"/> <img src="https://img.shields.io/badge/JDK 17-007396?style=flat-square&logo=Java&logoColor=white"/>
- WAS<br> <img src="https://img.shields.io/badge/Apache Tomcat 9.0.58-F8DC75?style=flat-square&logo=Apache Tomcat&logoColor=black"/>
- DBMS<br> <img src="https://img.shields.io/badge/MariaDB-003545?style=flat-square&logo=MariaDB&logoColor=white"/>
- Spring Boot<br> <img src="https://img.shields.io/badge/Spring Boot 2.7.5-6DB33F?style=flat-square&logo=Spring Boot&logoColor=white"/> <img src="https://img.shields.io/badge/maven-C71A36?style=flat-square&logo=Apache Maven&logoColor=white"/> <img src="https://img.shields.io/badge/MyBatis-000000?style=flat-square&logo=Java&logoColor=white"/>
- Web Hosting<br> <img src="https://img.shields.io/badge/Cafe24-1578D3?style=flat-square&logo=Java&logoColor=white"/>

<br><br><br>

## 3. 개발 일정
### 2022.11.17 - 2022.12.27 (총 5주)
- **1week**: 주제선정, Database 테이블 설계
- **2week**: UI 가이드맵, 개발 환경 설정
- **3week**: Front-end, Back-end
- **4week**: Front-end, Back-end
- **5week**: 최종 테스트 및 수정, 호스팅

![졸업프로젝트ppt](https://user-images.githubusercontent.com/103568737/213367195-01f518d4-3c14-489a-9e0c-384db899a734.png)

<br><br>

## 4. 사이트맵
<br>

![졸업프로젝트ppt2](https://user-images.githubusercontent.com/103568737/213367200-321e600d-cf14-456d-8b90-1b12d3ecb025.png)

<br><br><br><br>

## 5. TAG 웹사이트 특징
- **일반회원**과 **판매자회원**이 분리되어있습니다.
- **판매자회원**은 마이페이지에서 굿즈 상품을 등록하고 상품관리, 주문관리, 답변문의를 처리할 수 있습니다.
- **일반회원**은 공연을 예매하고 공연 관련 상품을 구매할 수 있습니다. 부가 기능으로 관심 공연과 관심 상품을 등록할 수 있는 좋아요 기능이 있습니다.
- **일반회원**은 공연을 예매하고 해당 공연의 상품을 구매할 경우 15% 쿠폰이 발급됩니다.
- **공연페이지**에서는 해당 공연의 상세 정보를 확인할 수 있으며 공연 날짜를 보기 쉽도록 캘린더를 추가했습니다. 선예매 기간일 경우 별도로 선예매 기간 문구를 노출시켰습니다.
- #### 📍 일반회원과 판매자회원으로 회원가입 혹은 로그인을 해보세요!
  - 일반회원 : kangsun / 강선1234
  - 판매자회원 : privatecurve / 판매자1234

<br><br><br>

### TAG 더보기
[🔗 TAG 웹사이트 호스팅 링크 ↗](http://krhopy.cafe24.com) <br>
[🔗 TAG 포트폴리오 ↗](https://krhopy.github.io/Myportfolio/project-1.html) <br>
[🔗 DB 설계도 ↗](https://drive.google.com/file/d/1gu0M5L6syH60w94wfjl7lboml_Crzflb/view?usp=sharing) <br>
[🔗 TAG 제작 상세 PPT 링크 ↗](https://drive.google.com/file/d/1dUEhDUE2ZXzDfZvkGbDzDaq_Sfswl2zC/view?usp=sharing)
