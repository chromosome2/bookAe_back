package bookae.community.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import bookae.community.service.CommunityService;
import bookae.community.vo.CommunityVO;
import bookae.member.controller.MemberController;

@Controller("communityController")
public class CommunityControllerImpl extends MultiActionController implements CommunityController{
	
	@Autowired
	private CommunityService communityService;
	@Autowired
	private CommunityVO communityVO;
	
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
	public ModelAndView addArticle(@ModelAttribute("communityVO") CommunityVO communityVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession(false);
		String id=(String)session.getAttribute("id");
		communityVO.setId(id);
		
		String[] eng_genre= {"LiberalArts","Novel","Poem","Food","Health","Hobby","Science","SelfImprovement","IT","History","etc"};
		String[] kor_genre= {"인문학","소설","시/에세이","요리","건강","취미/실용/스포츠","과학","자기계발","컴퓨터/IT","역사/문화","기타"};
		String genre=communityVO.getBoard_genre();
		for(int i=0; i<eng_genre.length; i++) {
			if(genre.equals(eng_genre[i])) {
				communityVO.setBoard_genre(kor_genre[i]);
			}
		}
		
		int result=communityService.addArticle(communityVO);
		ModelAndView mav=new ModelAndView("redirect:/community/community.do");
		System.out.println("addArticle 실행");
		return mav;
	}

	@Override
	@RequestMapping(value="/community/viewArticle.do", method=RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("board_num") int board_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		
		//article의 정보 다 가져오기
		communityVO=communityService.viewArticle(board_num);
		
		//로그인한 사람의 article like 여부
		HttpSession session=request.getSession(false);
		if(session==null || !request.isRequestedSessionIdValid() || session.getAttribute("isLogin")==null || session.getAttribute("id")==null) {
			communityVO.setLikeIs(false);
		}else {
			String log_id=(String)session.getAttribute("id");
			boolean likeIs=communityService.getLike(log_id, board_num);
			communityVO.setLikeIs(likeIs);
		}
		
		ModelAndView mav=new ModelAndView("community/"+viewName);
		mav.addObject("board", communityVO);
		System.out.println("viewArticle.jsp 열기");
		return mav;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/community/addLike.do", method=RequestMethod.POST)
	public void addLike(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id=request.getParameter("id");
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String tel="010-1111-2222";
		
		JSONObject json=new JSONObject();
		json.put("tel", tel);
		
		PrintWriter pw=response.getWriter();
		pw.println(json);
		pw.flush();
		pw.close();
		System.out.println(id+" "+board_num);
	}

	@ResponseBody
	@RequestMapping(value="/community/delLike.do", method=RequestMethod.POST)
	@Override
	public void delLike(@RequestBody Map<String, Object> likeInfo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		communityService.delLike(likeInfo);
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/community/test.do")
	public void test(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String name=request.getParameter("name");
		String tel="010-1111-1111";
		System.out.println(name+" "+tel);
		
		JSONObject json=new JSONObject();
		json.put("tel", tel);
		
		PrintWriter pw=response.getWriter();
		pw.println(json);
		pw.flush();
		pw.close();
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