<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>layout2</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<div class="wrap">
    <header>
		<div class="top_header">

	<!-- head menu S -->
		<%@ include file="../include/header.jsp" %>
	<!-- head menu E -->

		</div>
    </header>
    <nav>
	 	<div class="nav_left_space">&nbsp;</div>
		<div class="nav_center_space"> 
	
	<!-- nav menu S -->
		<%@ include file="../include/navmenu.jsp" %>
	<!-- nav menu E -->
		
		</div>
		<div class="nav_right_space">&nbsp;</div>
    </nav>

    <section>
       <article>
	<!-- 본문 S -->
<caption>
쇼핑몰관리 프로그램
</caption><br>
쇼핑몰에서 상품 정보,매출정보 데이터베이스를 구축하고 쇼핑몰관리를 위한 프로그램을 작성하는 프로그램이다.
프로그램작성순서<br>
1. 상품정보 테이블을 생성한다.<br>
2. 매출정보 테이블을 생성한다.<br>
3. 상품정보 입력 화면프로그램을 작성한다.<br>
4. 상품정보 조회/수정프로그램을 작성한다.<br>
5. 매출정보 조회프로그램을 작성한다.
    <!-- 본문 E -->
       </article>
    </section>
    <footer>
	<!-- footer area S -->
		<%@ include file="../include/footer.jsp" %>
	<!-- footer area E -->
    </footer>
</div>
</body>
</html>