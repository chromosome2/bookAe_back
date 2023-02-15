<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="sujin">
    <meta name="robots" content="all">
    <link rel="shortcut icon" href="../resources/images/그림2.ico">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/normalize.css">
    <link rel="stylesheet" href="../resources/css/community.css">
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/common.js"></script>
	<title>북愛 - 로그인 페이지</title>
</head>
<body>
	<!--건너뛰기 링크 시작-->
    <a id="skipNav" href="mainContents">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->

    <!--#wrapper 시작-->
    <div id="wrapper">
    
    	<jsp:include page="../common/headerOther.jsp"/>
    	
    	<!--감상평 게시판 시작-->
        <div class="communityMenu">
            <h2><img src="../resources/images/community.png" alt="게시판 로고" width="50">감상평 게시판</h2>
            <section>
                <form action="search_community.jsp" method="get" id="searchBook">
                    <select name="head">
                        <option value="title">전체</option>
                        <option value="name">제목</option>
                        <option value="writer">글쓴이</option>
                        <option value="naeyong">내용</option>
                    </select>
                    <input type="text" id="Search_community" name="Search_community" required>
                    <button type="submit">검색</button>
                </form>
                <table class="tableCommu">
                    <tr id="title">
                        <th>번호</th><th>제목</th><th>작성시간</th><th>글쓴이</th>
                    </tr>
                    <tr>
                        <td class="best">Best!</td><td><a href="#"><span class="genre">&lt;기타&gt;</span>「고양이 수제간식 레시피」, 모든 집사들이 읽어야 한다냥!! 츄릅츄릅(<span class="recommend">추천수</span>128)</a></td><td>2022-07-08</td><td>조꼬미</td>
                    </tr>
                    <tr>
                        <td class="best">Best!</td><td><a href="#"><span class="genre">&lt;인문&gt;</span>'정의란 무엇인가'에 끝내 답하지 못한 책, 「정의란 무엇인가」(<span class="recommend">추천수</span>87)</a></td><td>2022-07-10</td><td>니케</td>
                    </tr>
                    <tr>
                        <td>136</td><td><a href="#"><span class="genre">&lt;과학&gt;</span>드디어 그 유명한 「물고기는 존재하지 않는다」를 읽어보았다(<span class="recommend">추천수</span>3)</a></td><td>2022-07-11</td><td>꾸릉꾸루</td>
                    </tr>
                    <tr>
                        <td>135</td><td><a href="#"><span class="genre">&lt;고전&gt;</span>「데미안」, 말만 번지르르하지 내용은 영...(<span class="recommend">추천수</span>0)</a></td><td>2022-07-11</td><td>헤르만헤세</td>
                    </tr>
                    <tr>
                        <td>134</td><td><a href="#"><span class="genre">&lt;로맨스&gt;</span>「러브레터」, 재밌게 읽기에는 시대가 빠르게 변해버렸다.(<span class="recommend">추천수</span>15)</a></td><td>2022-07-11</td><td>곽팔두오른팔</td>
                    </tr>
                    <tr>
                        <td>133</td><td><a href="#"><span class="genre">&lt;자기계발&gt;</span>말 잘하고 싶어서 읽어보았다.「말 잘한다는 소리를 들으면 소원이 없겠다」(<span class="recommend">추천수</span>5)</a></td><td>2022-07-11</td><td>냐옹이</td>
                    </tr>
                    <tr>
                        <td>132</td><td><a href="#"><span class="genre">&lt;역사&gt;</span>「질병이 바꾼 세계의 역사」, 코로나19가 유행하는 지금 읽으면 좋은 책(<span class="recommend">추천수</span>20)</a></td><td>2022-07-11</td><td>북적북적</td>
                    </tr>
                    <tr>
                        <td>131</td><td><a href="#"><span class="genre">&lt;판타지&gt;</span>현생에 힘들다면「달러구트 꿈 백화점」(<span class="recommend">추천수</span>32)</a></td><td>2022-07-11</td><td>늙은베르테르</td>
                    </tr>
                    <tr>
                        <td>130</td><td><a href="#"><span class="genre">&lt;추리&gt;</span>「용의자 X의 헌신」아직 안 읽은 사람 없겠지만...(<span class="recommend">추천수</span>9)</a></td><td>2022-07-11</td><td>추리덕후</td>
                    </tr>
                    <tr>
                        <td>129</td><td><a href="#"><span class="genre">&lt;기타&gt;</span>「핏블리 운동 자세교정 전략집」읽어보긴했는데 솔직히(<span class="recommend">추천수</span>46)</a></td><td>2022-07-10</td><td>바로이거야</td>
                    </tr>
                    <tr>
                        <td>128</td><td><a href="#"><span class="genre">&lt;시&gt;</span>오늘의 하루를 마무리해주는 시.「하늘과 바람과 별과 시」(<span class="recommend">추천수</span>27)</a></td><td>2022-07-10</td><td>그대여내게로오</td>
                    </tr>
                    <tr>
                        <td>127</td><td><a href="#"><span class="genre">&lt;공포&gt;</span>「검은집」영화만 보고 소설은 안봤다면 추천!(<span class="recommend">추천수</span>12)</a></td><td>2022-07-10</td><td>알랑방구뿡뿡이</td>
                    </tr>
                </table>
                <a href="#" id="writeCom">글쓰기</a>
                <div class="page">
                    <a>&lt;</a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">&gt;</a>
                </div>
            </section>
        </div>
        <!--감상평 게시판 종료-->
        
        <jsp:include page="../common/footer.jsp"/>
        
    </div>
    <!--#wrapper 종료-->
</body>
</html>