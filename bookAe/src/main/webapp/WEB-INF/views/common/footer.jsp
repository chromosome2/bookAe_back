<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<!--footer 시작-->
        <footer id="footer">
            <div id="footerInner">
                <section class="guide">
                    <h2 class="hidden">사이트 이용안내</h2>
                    <ul>
                        <li><a href="#">회사 소개</a></li>
                        <li><a href="#">이용 약관</a></li>
                        <li><a href="#">개인정보취급방침</a></li>
                        <li><a href="#">공지사항</a></li>
                    </ul>
                </section>
                <address>
                    <span>㈜북애</span>
                    <span>대표이사: 조수진</span>
                    <span>서울특별시 종로구 미려빌딩6층</span>
                    <span>전화: 02-666-1717</span>
                    <span>E-MAIL: <a href="mailto:bookAe@bookAe.com">bookAe@bookAe.com</a></span>
                </address>
                <p class="copyright">Copyright since &copy; 2022 by BookAe CORPORATION ALL RIGHTS RESERVED.</p>
                <p class="relCite">
                    <select id='cite' name="relatedCite" onchange="citeIdong();">
                        <option value="no">관련 사이트</option>
                        <option value="kyobo">교보문고</option>
                        <option value="yes24">yes24</option>
                        <option value="aladin">알라딘</option>
                    </select>
                    <a class="btncite">이동</a>
                </p>
            </div>
        </footer>
        <!--footer 종료-->
