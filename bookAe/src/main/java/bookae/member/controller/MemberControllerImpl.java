package bookae.member.controller;


import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import bookae.community.service.CommunityService;
import bookae.member.service.MemberService;
import bookae.member.vo.MemberVO;
import bookae.util.PagingVO;

@Controller("memberController")
public class MemberControllerImpl extends MultiActionController implements MemberController{
	
	@Autowired
	private MemberService memberService;
	HttpSession session; // 이렇게 해도 에러 안나려나?
	
	//프로젝트 내부 전체를 검색해서, 해당 타입의 인스턴스가 1개만 있는 경우 그 인스턴스를 자동으로 연결
	//autowired를 사용하면 set을 따로 안해줘도됨.
	@Autowired
	private MemberVO memberVO;
	
	//header.jsp에서 회원가입을 누르면 "${contextPath }/join/join.do"형식으로 요청이 들어옴.
	//value는 요청받을 url / method는 어떤 요청을 받을지.
	//joinForm.jsp 열기
	@RequestMapping(value="/join/joinForm.do", method=RequestMethod.GET)
	public ModelAndView joinForm(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		ModelAndView mav=new ModelAndView("join/"+viewName);
		System.out.println("joinForm.jsp 열기");
		return mav;
	}
	
	//loginForm.jsp 열기
	@RequestMapping(value="/login/loginForm.do", method=RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		ModelAndView mav=new ModelAndView("login/"+viewName);
		session=request.getSession();
		if(session.getAttribute("login_msg")=="fail") {
			mav.addObject("login_msg","fail");
			session.removeAttribute("login_msg");
		}
		System.out.println("loginForm.jsp 열기");
		return mav;
	}
	
	//joinComplete.jsp 열기
	@RequestMapping(value="/join/joinComplete.do", method=RequestMethod.GET)
	public ModelAndView joinComplete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		ModelAndView mav=new ModelAndView("join/"+viewName);
		System.out.println("joinComplete.jsp 열기");
		return mav;
	}
	
	//loginComplete.jsp 열기
	@RequestMapping(value="/login/loginComplete.do", method=RequestMethod.GET)
	public ModelAndView loginComplete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		ModelAndView mav=new ModelAndView("login/"+viewName);
		mav.addObject("login_msg","success");
		System.out.println("loginComplete.jsp 열기");
		return mav;
	}

	//회원가입. 멤버 insert하기
	@Override
	@RequestMapping(value="/join/joinMember.do", method=RequestMethod.POST)
	public ModelAndView joinMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		int result=memberService.joinMember(memberVO);
		ModelAndView mav=new ModelAndView("redirect:/join/joinComplete.do");
		System.out.println("joinMember.do");
		return mav;
	}

	//로그인하기
	@Override
	@RequestMapping(value="/login/loginMember.do", method=RequestMethod.POST)
	public ModelAndView loginMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String result;
		String admin;
		//관리자인지 확인
		if(memberVO.getId().equals("admin")) {
			result=memberService.loginAdmin(memberVO);
			admin="y";
		}else {
			result=memberService.loginMember(memberVO);
			admin="n";
		}
		ModelAndView mav;
		session=request.getSession();
		if(result.equals("true")) {
			System.out.println("로그인 성공");
			mav=new ModelAndView("redirect:/");
			if(admin.equals("n")) {//member일 경우
				session.setAttribute("isLogin", true);//session에 로그인 정보 추가.
				session.setAttribute("id", memberVO.getId());
			}
			session.setAttribute("admin", admin);
		}else {
			System.out.println("로그인 안성공");
			mav=new ModelAndView("redirect:/login/loginForm.do");
			session.setAttribute("login_msg", "fail");
		}
		System.out.println("loginMember.do");
		return mav;
	}
	
	//로그아웃하기
	@RequestMapping(value="/login/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav=new ModelAndView("redirect:/");
		session=request.getSession(false);
		session.invalidate();//session 비우기
		if(session==null || !request.isRequestedSessionIdValid()) {
			System.out.println("logout 완료");
		}
		return mav;
	}
	
	//myPageView.jsp 열기
	@RequestMapping(value="/myPage/myPagePrivacyCheck.do", method=RequestMethod.GET)
	public ModelAndView myPagePrivacyCheck(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		
		//session에서 id 얻어오기
		session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		//가입날짜정보 가져와서 계산하기
		int dayLeft=calDayLeft(id);
		
		ModelAndView mav=new ModelAndView("myPage/"+viewName);
		mav.addObject("dayLeft", dayLeft);
		
		System.out.println("myPageView.jsp 열기");
		return mav;
	}

	//마이페이지 비밀번호 맞는지 확인
	@Override
	@RequestMapping(value="/myPage/PwdCheck.do", method=RequestMethod.POST)
	public void pwdCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		memberVO.setId(id);
		memberVO.setPw(pw);
		
		//id와 가져온 pw로 비밀번호 맞는지 확인
		String result=memberService.loginMember(memberVO);
		
		//json설정
		JSONObject json=new JSONObject();
		json.put("result", result);
		
		PrintWriter pwt=response.getWriter();
		pwt.println(json);//보내주기
		pwt.flush();
		pwt.close();
	}
	
	//myPagePrivacy.jsp 열기
	@RequestMapping(value="/myPage/myPagePrivacy.do", method=RequestMethod.GET)
	public ModelAndView myPagePrivacy(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		
		//session에서 id 얻어오기
		session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		//가입날짜정보 가져와서 계산하기
		int dayLeft=calDayLeft(id);
		
		//개인정보 담아가기
		memberVO=memberService.getPrivacy(id);

		ModelAndView mav=new ModelAndView("myPage/"+viewName);
		mav.addObject("member",memberVO);
		mav.addObject("dayLeft",dayLeft);
		System.out.println("myPagePrivacy.jsp 열기");
		return mav;
	}
	
	//닉네임 중복 체크
	@Override
	@RequestMapping(value="/join/nicknameCheck.do", method=RequestMethod.POST)
	public void nicknameCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nickname=request.getParameter("nickname");
		
		//닉네임이 존재하는지
		String result=memberService.nicknameCheck(nickname);
		
		//json설정
		JSONObject json=new JSONObject();
		json.put("result", result);
		
		PrintWriter pwt=response.getWriter();
		pwt.println(json);//보내주기
		pwt.flush();
		pwt.close();
	}
	
	//아이디 중복 체크
	@Override
	@RequestMapping(value="/join/idCheck.do", method=RequestMethod.POST)
	public void idCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String result="false";
		
		//특수문자 검사
		if(!id.matches("[0-9|a-z|-|_]*")){
		  System.out.println("특수문자가 입력되었습니다.");
		  result="yesMark";
		}else {
			//id중복 체크
			result=memberService.idCheck(id);
		}
		
		//json설정
		JSONObject json=new JSONObject();
		json.put("result", result);
		
		PrintWriter pwt=response.getWriter();
		pwt.println(json);//보내주기
		pwt.flush();
		pwt.close();
	}

	//개인정보 수정
	@Override
	@RequestMapping(value="/myPage/privacyChange.do", method=RequestMethod.POST)
	public ModelAndView privacyChange(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		//개인정보 업데이트하기
		memberService.privacyChange(memberVO);
		
		ModelAndView mav=new ModelAndView("redirect:/myPage/myPagePrivacy.do");
		
		return mav;
	}

	
	//가입날짜정보 가져와서 계산하는 메소드
	private int calDayLeft(String id) {
		try {
			String joindate=memberService.getJoinDate(id); //change
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date join=sdf.parse(joindate);
			Date today=new Date();
			int dayLeft=(int)Math.ceil((double)(today.getTime() - join.getTime())/1000/(24*60*60));
			
			return dayLeft;
		}catch(Exception e) {
			System.out.println("날짜 계산 오류");
		}
		return -1;
	}
	
	//페이징 기능을 합친 myPageLike.jsp 열기
	@Override
	@RequestMapping(value="/myPage/myPageLike.do", method=RequestMethod.GET)
	public ModelAndView myPageLike(PagingVO pagingVO, String nowPage, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		
		pagingVO=new PagingVO();
		
		//session에서 id 얻어오기
		session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		pagingVO.setId(id);
		
		//가입날짜정보 가져와서 계산하기
		int dayLeft=calDayLeft(id);
		
		//필요한 게시글 가져오기
		//nowpage 세팅, 현재 보고있는 페이지 번호
		if(nowPage == null) {
			nowPage ="1";
		}
		pagingVO.setNowPage(Integer.parseInt(nowPage));
		
		//totalArticle 세팅, 게시글 개수 가져오기
		int totalArticle=memberService.totalLikeArticle(id);
		pagingVO.setTotalArticle(totalArticle);
		
		//pagingVO의 나머지값 계산
		pagingVO.calcLastPage(pagingVO.getTotalArticle());
		pagingVO.calcStartEndPage(pagingVO.getNowPage());
		pagingVO.calcStartEnd(pagingVO.getNowPage());
		
		//페이징된 리스트 불러오기
		List communityList=memberService.pagingLikeBoard(pagingVO);
		
		ModelAndView mav=new ModelAndView("myPage/"+viewName);
		mav.addObject("totalArticle",totalArticle);
		mav.addObject("paging",pagingVO);
		mav.addObject("communityList",communityList);
		mav.addObject("dayLeft",dayLeft);
		
		System.out.println("myPageLike.jsp 열기");
		return mav;
	}
	
	//페이징 기능을 합친 myPageArticle.jsp 열기
	@Override
	@RequestMapping(value="/myPage/myPageArticle.do", method=RequestMethod.GET)
	public ModelAndView myPageArticle(PagingVO pagingVO, String nowPage, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		
		pagingVO=new PagingVO();
		
		//session에서 id 얻어오기
		session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		pagingVO.setId(id);
		
		//가입날짜정보 가져와서 계산하기
		int dayLeft=calDayLeft(id);
		
		//필요한 게시글 가져오기
		//nowpage 세팅, 현재 보고있는 페이지 번호
		if(nowPage == null) {
			nowPage ="1";
		}
		pagingVO.setNowPage(Integer.parseInt(nowPage));
		
		//totalArticle 세팅, 게시글 개수 가져오기
		int totalArticle=memberService.totalMyArticle(id);
		pagingVO.setTotalArticle(totalArticle);
		
		//pagingVO의 나머지값 계산
		pagingVO.calcLastPage(pagingVO.getTotalArticle());
		pagingVO.calcStartEndPage(pagingVO.getNowPage());
		pagingVO.calcStartEnd(pagingVO.getNowPage());
		
		//페이징된 리스트 불러오기
		List communityList=memberService.pagingMyBoard(pagingVO);
		
		ModelAndView mav=new ModelAndView("myPage/"+viewName);
		mav.addObject("totalArticle",totalArticle);
		mav.addObject("paging",pagingVO);
		mav.addObject("communityList",communityList);
		mav.addObject("dayLeft",dayLeft);
		
		System.out.println("myPageArticle.jsp 열기");
		return mav;
	}

	//내가 쓴 댓글 보기
	@Override
	@RequestMapping(value="/myPage/myPageComment.do", method=RequestMethod.GET)
	public ModelAndView myCommentList(PagingVO pagingVO, String nowPage, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName=getViewName(request);
		
		//session에서 id 얻어오기
		session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		pagingVO.setId(id);
		
		//id로 닉네임 찾아오기
		String nickname=memberService.getNickname(id);
		
		
		//가입날짜정보 가져와서 계산하기
		int dayLeft=calDayLeft(id);
		
		//내가 쓴 댓글 가져오기
		//nowpage 세팅, 현재 보고있는 페이지 번호
		if(nowPage == null) {
			nowPage ="1";
		}
		pagingVO.setNowPage(Integer.parseInt(nowPage));
		
		//totalComment 세팅, 게시글 개수 가져오기
		int totalComment=memberService.totalMyComment(id);
		pagingVO.setTotalArticle(totalComment);
		
		//pagingVO의 나머지값 계산
		pagingVO.calcLastPage(pagingVO.getTotalArticle());
		pagingVO.calcStartEndPage(pagingVO.getNowPage());
		pagingVO.calcStartEnd(pagingVO.getNowPage());
		
		//페이징된 리스트 불러오기
		List commentList=memberService.myCommentList(pagingVO);
		
		ModelAndView mav=new ModelAndView("myPage/"+viewName);
		mav.addObject("totalComment",totalComment);
		mav.addObject("paging",pagingVO);
		mav.addObject("commentList",commentList);
		mav.addObject("dayLeft",dayLeft);
		mav.addObject("nickname",nickname);
		return mav;
	}

	//멤버관리
	@Override
	@RequestMapping(value="/admin/manageMember.do", method=RequestMethod.GET)
	public ModelAndView manageMember(PagingVO pagingVO, String nowPage, String head, String search_community,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=getViewName(request);
		
		//가입한 멤버 가져오기
		//nowpage 세팅, 현재 보고있는 페이지 번호
		if(nowPage == null) {
			nowPage ="1";
		}
		pagingVO.setNowPage(Integer.parseInt(nowPage));
		
		//검색 키워드 가져오기
		if(head != null && search_community != null) {
			//date sql문에 적용할 수 있게 바꿔주기
			if(head.equals("joindate")){
				search_community=search_community.substring(2,4)+"/"+search_community.substring(5,7)+"/"+search_community.substring(8);
			}
			pagingVO.setHead(head); //검색할 항목
			pagingVO.setSearch_community(search_community); //검색 키워드
		}
		
		//멤버 개수 가져오기
		int totalMember=memberService.totalMember(pagingVO);
		System.out.println(totalMember);
		pagingVO.setTotalArticle(totalMember);
		
		//pagingVO의 나머지값 계산
		pagingVO.calcLastPage(pagingVO.getTotalArticle());
		pagingVO.calcStartEndPage(pagingVO.getNowPage());
		pagingVO.calcStartEnd(pagingVO.getNowPage());
		
		//페이징된 멤버 리스트 불러오기
		List memberList=memberService.memberList(pagingVO);
		
		ModelAndView mav=new ModelAndView("admin/manage/"+viewName);
		mav.addObject("totalMember",totalMember);
		mav.addObject("head",head);
		mav.addObject("keyword",search_community);
		mav.addObject("paging",pagingVO);
		mav.addObject("memberList",memberList);
		return mav;
	}

	//멤버 삭제
	@Override
	@RequestMapping(value="/admin/delMember.do", method=RequestMethod.POST)
	public void delMember(String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		memberService.delMember(id);
		
		//json설정
		JSONObject json=new JSONObject();
		
		PrintWriter pwt=response.getWriter();
		pwt.println(json);//보내주기
		pwt.flush();
		pwt.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private String getViewName(HttpServletRequest request) throws Exception{
		String contextPath=request.getContextPath();//내 경로. 프로젝트 이름까지.
		String uri=(String)request.getAttribute("javax.servlet.include.request_uri");
		//url과 uri의 차이
		//url은 http://127.0.0.1:8090/member/join.do
		//uri는 /member/join.do
		if(uri == null || uri.trim().equals("")) {//uri가 비었다면
			uri=request.getRequestURI();//버전바뀌면서 getAttribute를 많이 쓰게됐나봄. 왜인지는 모르겠으나... 어쨌든 같은 값을 가져오는 함수인거 같음.
		}
		int begin=0, end;
		if(!((contextPath==null) || ("".equals(contextPath)))) {
			begin=contextPath.length();//contextPath의 값이 있다면 contextPath가 끝난 곳을 begin으로 잡음.
		}
		if(uri.indexOf(";")!= -1) {//';'가 있다면
			end=uri.indexOf(";");//찾은 위치를 end로
		}else if(uri.indexOf("?")!= -1) {
			end=uri.indexOf("?");
		}else {
			end=uri.length();
		}
		String fileName=uri.substring(begin,end);
		if(fileName.lastIndexOf(".") != -1) {
			//.do 앞에까지의 문자열을 구함
			fileName=fileName.substring(0, fileName.lastIndexOf("."));//확장자 제외
		}
		if(fileName.lastIndexOf("/") != -1) {
			fileName=fileName.substring(fileName.lastIndexOf("/"), fileName.length());
			//확장자 빼고 앞에 달린것들도 빼고 가져오기
		}
		return fileName;
	}
	
}
