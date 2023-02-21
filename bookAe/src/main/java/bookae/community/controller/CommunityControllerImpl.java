package bookae.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import bookae.community.service.CommunityService;
import bookae.member.controller.MemberController;

@Controller("communityController")
public class CommunityControllerImpl extends MultiActionController implements CommunityController{
	
	@Autowired
	private CommunityService communityService;
	
	@Override
	@RequestMapping(value="/community/community.do", method=RequestMethod.GET)
	public ModelAndView community_list_view(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		List communityList=communityService.community_list_view();
		ModelAndView mav=new ModelAndView("community/"+viewName);
		mav.addObject("communityList",communityList);
		mav.addObject("max_num",communityService.max_num());
		return mav;
	}
	
	@RequestMapping(value="/community/writeCommunity.do", method=RequestMethod.GET)
	public ModelAndView writeCommunityForm(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session=request.getSession();
		String viewName=getViewName(request);
		ModelAndView mav=new ModelAndView("community/"+viewName);
		System.out.println("writeCommunity.jsp 열기");
		return mav;
	}

	@Override
	@RequestMapping(value="/community/addArticle.do", method=RequestMethod.POST)
	public ModelAndView addArticle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		return null;
	}
	
	
	
	
	
	private String getViewName(HttpServletRequest request) throws Exception{
		String contextPath=request.getContextPath();//내 경로. 프로젝트 이름까지.
		String uri=(String)request.getAttribute("javax.servlet.include.request_uri");
		//url과 uri의 차이
		//url은 http://127.0.0.1:8090/member/join.do
		//uri는 /member/join.do
		System.out.println((String)request.getAttribute("javax.servlet.include.request_uri"));
		System.out.println(request.getRequestURI());
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
