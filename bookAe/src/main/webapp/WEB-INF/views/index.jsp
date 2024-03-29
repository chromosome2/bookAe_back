<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="bookae.community.vo.CommunityVO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="sujin">
    <meta name="robots" content="all">
    <link rel="shortcut icon" href="resources/images/그림2.ico">
    <link rel="stylesheet" href="resources/css/common.css">
    <link rel="stylesheet" href="resources/css/normalize.css">
    <link rel="stylesheet" href="resources/css/index.css">
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    <script src="resources/js/index.js"></script>
    <script src="resources/js/common.js"></script>
	<title>북愛 - 메인 페이지</title>
</head>
<body>

	<!-- 데이터 가져오기 -->
	<%!
		/*SqlSession sqlSession;
	
		List<CommunityVO> RecentMagazineList=sqlSession.selectList("mapper.community.RecentMagazineList");
		int listSize=RecentMagazineList.size();*/
		
		//magazine_content에서 <img>태그 빼기
		/*for(CommunityVO m : RecentMagazineList){
			String magazine_content=m.getMagazine_content();
			String magazine_img;
			int begin, end;
			while(true){
				if(magazine_content.indexOf("<img src=")!=-1) {
					begin=magazine_content.indexOf("<img src=");
					magazine_img=magazine_content.substring(begin);
					end=magazine_img.indexOf(">");
					magazine_img=magazine_img.substring(0,end+1);
					magazine_content.replace(magazine_img,"");
					m.setMagazine_content(magazine_content);
				}else{
					break;
				}
			}
		}*/
		
	%>
    <!--건너뛰기 링크 시작-->
    <a id="skipNav" href="mainContents">본문 바로가기</a>
    <!--건너뛰기 링크 종료-->
    
    <!--#wrapper 시작-->
    <div id="wrapper">
        <jsp:include page="common/header.jsp"/>

        <!--mainContents 시작-->
        <div id="contentsArea">
            <!--이미지 배너-->
            <div class="overflowImage">
                <img id="whasalL" src="resources/images/whasal1.png" alt="ImageBannerPrev">
                <img id="whasalR" src="resources/images/whasal2.png" alt="ImageBannerNext">
                <div class="imageBanner">
                    <h2 class="hidden">이미지 배너</h2>
                    <img src="resources/images/banner1.png" alt="banner1">
                    <img src="resources/images/banner2.png" alt="banner2">
                    <img src="resources/images/banner3.png" alt="banner3">
                    <img src="resources/images/banner4.png" alt="banner4">
                    <img class="page1" src="resources/images/banner5.png" alt="banner5">
                </div>
            </div>
            <!--베스트셀러-->
            <div class="bestSellerBanner">
                <section id="BSday">
                    <h3><a class="btnDay" href="#BSday" onclick="return false">오늘의</a></h3>
                    <ul>
                        <li class="BS-title">베스트 셀러</li>
                        <li>
                            <a href="#">
                                <p class="rank_1">1</p>
                                <img src="resources/images/day1.jpg" alt="1등, 피라네시">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">피라네시</p>
                                <p class="bookAuthor">수재나 클라크</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <p class="rank_2">2</p>
                                <img src="resources/images/day2.jpg" alt="2등, 스토아적 삶의 권유">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">스토아적 삶의 권유</p>
                                <p class="bookAuthor">마르코스 바스케스</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <p class="rank_3">3</p>
                                <img src="resources/images/day3.jpg" alt="3등, 음식을 처방해 드립니다">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">음식을 처방해 드립니다</p>
                                <p class="bookAuthor">리나 네르트뷔 아우렐</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="etc">
                                <p class="rank">4</p>
                                <img src="resources/images/day4week1month4.jpg" alt="4등, 기특한 나">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">기특한 나</p>
                                <p class="bookAuthor">천선란</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="etc">
                                <p class="rank">5</p>
                                <img src="resources/images/day5week2.jpg" alt="5등, 시간을 찾아드립니다">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">시간을 찾아드립니다</p>
                                <p class="bookAuthor">애슐리 윌런스</p>
                            </a>
                        </li>
                    </ul>
                    <a href="#" class="more" title="오늘의 베스트셀러 더보기">더보기</a>
                </section>
                <section id="BSweek">
                    <h3><a class="btnWeek" href="#BSweek" onclick="return false">이번주의</a></h3>
                    <ul>
                        <li class="BS-title">베스트 셀러</li>
                        <li>
                            <a href="#">
                                <p class="rank_1">1</p>
                                <img src="resources/images/day4week1month4.jpg" alt="1등, 기특한 나">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">기특한 나</p>
                                <p class="bookAuthor">천선란</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <p class="rank_2">2</p>
                                <img src="resources/images/day5week2.jpg" alt="2등, 시간을 찾아드립니다">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">시간을 찾아드립니다</p>
                                <p class="bookAuthor">애슐리 윌런스</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <p class="rank_3">3</p>
                                <img src="resources/images/week3.jpg" alt="3등, 150년 하버드 글쓰기 비법">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">150년 하버드 글쓰기 비법</p>
                                <p class="bookAuthor">송숙희</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="etc">
                                <p class="rank">4</p>
                                <img src="resources/images/week4month3.jpg" alt="4등, 심리 읽어드립니다">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">심리 읽어드립니다</p>
                                <p class="bookAuthor">김경일</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="etc">
                                <p class="rank">5</p>
                                <img src="resources/images/week5month1.jpg" alt="5등, 나는 왜 혼자가 편할까?">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">나는 왜 혼자가 편할까?</p>
                                <p class="bookAuthor">오카다 다카시</p>
                            </a>
                        </li>
                    </ul>
                    <a href="#" class="more" title="이번주의 베스트셀러 더보기">더보기</a>
                </section>
                <section id="BSmonth">
                    <h3><a class="btnMonth" href="#BSmonth" onclick="return false">이번달의</a></h3>
                    <ul>
                        <li class="BS-title">베스트 셀러</li>
                        <li>
                            <a href="#">
                                <p class="rank_1">1</p>
                                <img src="resources/images/week5month1.jpg" alt="1등, 나는 왜 혼자가 편할까?">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">나는 왜 혼자가 편할까?</p>
                                <p class="bookAuthor">오카다 다카시</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <p class="rank_2">2</p>
                                <img src="resources/images/month2.jpg" alt="2등, 마음의 법칙">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">마음의 법칙</p>
                                <p class="bookAuthor">폴커 키츠</p>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <p class="rank_3">3</p>
                                <img src="resources/images/week4month3.jpg" alt="3등, 심리 읽어드립니다">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">심리 읽어드립니다</p>
                                <p class="bookAuthor">김경일</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="etc">
                                <p class="rank">4</p>
                                <img src="resources/images/day4week1month4.jpg" alt="4등, 기특한 나">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">기특한 나</p>
                                <p class="bookAuthor">천선란</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="etc">
                                <p class="rank">5</p>
                                <img src="resources/images/month5.jpg" alt="5등, 편애하는 문장들">
                                <div class="box">
                                    <div class="plus">
                                        <div></div>
                                        <p>보러가기</p>
                                        <span>&gt;</span>
                                    </div>
                                </div>
                                <p class="bookName">편애하는 문장들</p>
                                <p class="bookAuthor">이유미</p>
                            </a>
                        </li>
                    </ul>
                    <a href="#" class="more" title="이번달의 베스트셀러 더보기">더보기</a>
                </section>
            </div>
            <!--매거진-->
            <div id="magazineBanner">
                <h2>매거진</h2>
                <ul>
                	<!--<c:if test="${empty magazineList }">
                		
                    </c:if>
                    <c:if test="${!empty magazineList }">
	                    <c:forEach var="magazine" items="${magazineList }">
                			<li>
		                        <div>
		                            <a href="#"><span class="magazineImg">${magazine.magazine_image }</span></a>
		                            <span>&lt;${magazine.magazine_genre }&gt;</span>
		                            <h3><a href="#">${magazine.magazine_title}</a></h3>
		                            <p class="naeyoung"><a href="#"><span>${magazine.magazine_content}</span></a></p>
		                            <p class="plus">p</p>
		                        </div>
		                    </li>
                		</c:forEach>
                    </c:if>-->
                   <li>
                        <div>
                            <a href="#"><img src="resources/images/magazine1.jpg" alt="작가 이미예"></a>
                            <span>&lt;인터뷰&gt;</span>
                            <h3><a href="#">&lt;달러구트 꿈 백화점&gt;<br>작가 이미예 인터뷰</a></h3>
                            <p class="naeyoung"><a href="#">그는 이름만 대면 누구나 아는 기업의 직원이었다. 부유하지는 않지만 부족하지 않은 삶을 일구었다. 그랬던 그가 큰일을 냈다. 평화롭고 안정적인 직장 생활에 마침표를 찍기로 결심한 것이다. 그 길로 회사에 사표를 제출했다. 그리고 2년 뒤, 그는 베스트셀러 작가가 되었다.<br>이미예는 독자가 직접 발굴한 작가라는 점에서 특별하다. &lt;달러구트 꿈 백화점&gt;은 출판사를 통해 정식 출간되기 전에 작가가 크라우드 펀딩으로 독립 출판을 먼저 한 책이었다. 이 펀딩은 목표 대비 1,800%를 초과 달성하며 큰 성공을 거두었다. 그의 글을 알아본 독자들은 읽고 나면 기분이 좋아지는 글이라는 호평을 쏟아냈다. 이후 그는 출판사와 정식으로 전자책을 출간하여 리디북스에서 1위를 달성하였고 곧이어 낸 종이책은 11만 부를 판매하여 베스트셀러에 오른다.</a></p>
                            <p class="plus">p</p>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="#"><img src="resources/images/magazine2.png" alt="책 읽는 서울 광장"></a>
                            <span>&lt;행사&gt;</span>
                            <h3><a href="#">&#39;책 읽는 서울광장&#39;<br>북토크 행사에 참여해보다</a></h3>
                            <p class="naeyoung"><a href="#">서울시는 6월 한 달 동안 '책 읽는 서울광장'에서 인기 문학작가들이 참여하는 북토크 프로그램 '풀밭 위의 문학 산책'을 운영한다고 밝혔습니다. '풀밭 위의 문학 산책'은 매주 금요일 낮 12시, 토요일 오전 11시에 서울광장 동쪽에서 진행됩니다.<br>첫째 주에는 SF소설 '나인'을 주제로 작가 천선란과 작가이자 작곡가 겸 유튜버인 김겨울이 참여하고, '7년의 밤' 정유정 작가와 오은 시인이 함께하는 토크 콘서트가 열립니다.프로그램 참여를 원하는 시민은 서울도서관 홈페이지(lib.seoul.go.kr)에서 신청하면 됩니다.</a></p>
                            <p class="plus">p</p>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="#"><img src="resources/images/magazine3.jpg" alt="서울 국제도서전 포스터"></a>
                            <span>&lt;뉴스&gt;</span>
                            <h3><a href="#">‘서울국제도서전’<br>3년 만에 정상 개최</a></h3>
                            <p class="naeyoung"><a href="#">국내 최대 규모의 책 축제인 ‘서울국제도서전’이 내달 1일부터 5일까지 서울 코엑스에서 열린다. 이번 행사는 지난 2년간 코로나19로 축소 개최된 후 3년만에 정상적으로 열리는 행사로, 그 의미가 더욱 크다. 문화체육관광부는 30일 대한출판문화협회와 함께 제28회 서울국제도서전을 개최한다고 밝혔다. 올해 주빈국은 한국과 수교 60주년을 맞이한 콜롬비아다. 양국이 수교 60주년을 기념해 상대국 도서전의 주빈국으로 참가하기로 지난해 8월 합의함에 따라 한국은 지난 달 ‘보고타국제도서전’에 주빈국으로 참가한 바 있다. 올해 도서전의 주제는 ‘반걸음(One Small Step)’이다. 이는 세상을 바꾼 거대한 변화의 시작점은 기존의 고정관념을 깨고 용기 있게 나아간 ‘반걸음’이었다는 의미를 담고 있다.</a></p>
                            <p class="plus">p</p>
                        </div>
                    </li>
                </ul>
                <a href="${contextPath}/community/magazine.do" class="more" title="매거진 더보기">더보기</a>
            </div>
            <!--북애의 선택, 셀럽의 선택-->
            <div id="choice">
                <section class="bookaeChoice">
                    <h2>북애의 선택</h2>
                    <img src="resources/images/choice1.jpg" alt="벚꽃지는 계절에 그대를 그리워하네 표지">
                    <div class="naeyong">
                        <div class="naeCenter">
                            <h3>『벚꽃지는 계절에 그대를 그리워하네』</h3>
                            <p class="author">우타노 쇼고</p>
                            <p class="quotes"><span>"</span>꽃이 떨어진 후에도 벚나무는 살아 있어.<span>"</span></p>
                            <p class="recommend">벚꽃이 지고 난 뒤 시작되는 대반전의 드라마<br>어떤 트릭인지 알아도 모두가 속고 마는 반전!</p>
                            <a class="more" href="#">-자세히 보러가기-</a>
                        </div>
                    </div>
                </section>
                <section class="celebrityChoice">
                    <h2>셀럽의 선택</h2>
                    <p class="celebrityRecommend"><span>키커스</span>가 추천하는 최고의 책</p>
                    <img src="resources/images/choice2.jpg" alt="팍스 표지">
                    <div class="naeyong">
                        <div class="naeCenter">
                            <h3>『팍스』</h3>
                            <p class="author">사라 페니패커</p>
                            <p class="quotes"><span>"</span>인간 친구가 나를 찾으러 올 거예요.<span>"</span></p>
                            <p class="recommend">여우와 소년, 작고 평범한 존재가 보여준 강렬한 우정<br>
                                인간과 동물이 만들어 낸 위대한 가치</p>
                            <a class="more" href="#">-자세히 보러가기-</a>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!--mainContents 종료-->

        <jsp:include page="common/footer.jsp"/>

    </div>
    <!--#wrapper 종료-->
</body>
</html>