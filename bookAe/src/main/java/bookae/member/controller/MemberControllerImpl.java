package bookae.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import bookae.member.service.MemberService;
import bookae.member.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl extends MultiActionController implements MemberController{
	
	@Autowired
	private MemberService memberService;
	HttpSession session;
	//프로젝트 내부 전체를 검색해서, 해당 타입의 인스턴스가 1개만 있는 경우 그 인스턴스를 자동으로 연결
	//autowired를 사용하면 set을 따로 안해줘도됨.
	@Autowired
	private MemberVO memberVO;
	
	//header.jsp에서 회원가입을 누르면 "${contextPath }/join/join.do"형식으로 요청이 들어옴.
	//value는 요청받을 url / method는 어떤 요청을 받을지.
	@RequestMapping(value="/join/joinForm.do", method=RequestMethod.GET)
	public ModelAndView joinForm(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		ModelAndView mav=new ModelAndView("join/"+viewName);
		System.out.println("joinForm.jsp 열기");
		return mav;
	}
	
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
	
	@RequestMapping(value="/join/joinComplete.do", method=RequestMethod.GET)
	public ModelAndView joinComplete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		ModelAndView mav=new ModelAndView("join/"+viewName);
		System.out.println("joinComplete.jsp 열기");
		return mav;
	}
	
	@RequestMapping(value="/login/loginComplete.do", method=RequestMethod.GET)
	public ModelAndView loginComplete(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		ModelAndView mav=new ModelAndView("login/"+viewName);
		mav.addObject("login_msg","success");
		System.out.println("loginComplete.jsp 열기");
		return mav;
	}

	@Override
	@RequestMapping(value="/join/joinMember.do", method=RequestMethod.POST)
	public ModelAndView joinMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		int result=memberService.joinMember(memberVO);
		ModelAndView mav=new ModelAndView("redirect:/join/joinComplete.do");;
		System.out.println("joinMember.do");
		return mav;
	}

	@Override
	@RequestMapping(value="/login/loginMember.do", method=RequestMethod.POST)
	public ModelAndView loginMember(MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String result=memberService.loginMember(memberVO);
		ModelAndView mav;
		session=request.getSession();
		if(result.equals("true")) {
			System.out.println("로그인 성공");
			mav=new ModelAndView("redirect:/login/loginComplete.do");
			session.setAttribute("isLogin", true);
			session.setAttribute("id", memberVO.getId());
		}else {
			System.out.println("로그인 안성공");
			mav=new ModelAndView("redirect:/login/loginForm.do");
			session.setAttribute("login_msg", "fail");
		}
		System.out.println("loginMember.do");
		return mav;
	}
	
	@RequestMapping(value="/login/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav=new ModelAndView("redirect:/");
		session.invalidate();
		if(session==null || !request.isRequestedSessionIdValid()) {
			System.out.println("logout 완료");
		}
		return mav;
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
