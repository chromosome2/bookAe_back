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
import bookae.util.PagingVO;

@Controller("communityController")
public class CommunityControllerImpl extends MultiActionController implements CommunityController{
	
	@Autowired
	private CommunityService communityService;
	
	//커뮤니티 목록 불러오기
	/*@Override
	@RequestMapping(value="/community/community.do", method=RequestMethod.GET)
	public ModelAndView community_list_view(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		
		//리스트 불러오기
		List communityList=communityService.community_list_view();
		List bestCommunityList=communityService.two_best_community_list();
		
		ModelAndView mav=new ModelAndView("community/"+viewName);
		mav.addObject("communityList",communityList);
		mav.addObject("bestCommunityList",bestCommunityList);
		mav.addObject("max_num",communityService.max_num());
		
		return mav;
	}*/
	

	@Override
	public ModelAndView searchBoardList(PagingVO pagingVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	//페이징 기능을 합친 게시글 가져오기
	@Override
	@RequestMapping(value="/community/community.do", method=RequestMethod.GET)
	public ModelAndView boardList(PagingVO pagingVO, String nowPage, String head, String search_community,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=getViewName(request);

		pagingVO=new PagingVO();
		
		//nowpage
		if(nowPage == null) {
			nowPage ="1";
		}
		pagingVO.setNowPage(Integer.parseInt(nowPage));
		
		//검색 키워드 가져오기
		if(head != null && search_community != null) {
			pagingVO.setHead(head);
			pagingVO.setSearch_community(search_community);
		}
		
		//max_num 세팅
		int max_num=communityService.max_num(pagingVO);
		pagingVO.setTotal(max_num);
		
		//pagingVO의 나머지값 계산
		pagingVO.calcLastPage(pagingVO.getTotal());
		pagingVO.calcStartEndPage(pagingVO.getNowPage());
		pagingVO.calcStartEnd(pagingVO.getNowPage());
		
		//페이징된 리스트 불러오기
		List communityList=communityService.pagingBoard(pagingVO);
		List bestCommunityList=communityService.two_best_community_list();
		
		
		ModelAndView mav=new ModelAndView("community/"+viewName);
		mav.addObject("max_num",max_num);
		mav.addObject("head",head);
		mav.addObject("keyword",search_community);
		mav.addObject("paging",pagingVO);
		mav.addObject("communityList",communityList);
		mav.addObject("bestCommunityList",bestCommunityList);
		
		return mav;
	}
	
	
	
	//글쓰기 폼 열기
	@RequestMapping(value="/community/writeCommunity.do", method=RequestMethod.GET)
	public ModelAndView writeCommunityForm(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session=request.getSession();
		String viewName=getViewName(request);
		ModelAndView mav=new ModelAndView("community/"+viewName);
		System.out.println("writeCommunity.jsp 열기");
		return mav;
	}

	//글쓰기 기능
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

	//게시글 하나 보기
	@Override
	@RequestMapping(value="/community/viewArticle.do", method=RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("board_num") int board_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=getViewName(request);
		
		//article의 정보 다 가져오기
		CommunityVO communityVO=communityService.viewArticle(board_num);
		
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

	//좋아요버튼 작업
	@SuppressWarnings("unchecked") // 노란경고 안뜨게
	@Override
	@RequestMapping(value="/community/addLike.do", method=RequestMethod.POST)
	public void addLike(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id=request.getParameter("id");
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		
		CommunityVO communityVO=new CommunityVO();
		communityVO.setId(id);
		communityVO.setBoard_num(board_num);
		
		int board_like=communityService.addLike(communityVO);//liketbl에 insert
		
		JSONObject json=new JSONObject();
		json.put("board_like", board_like);//json에 데이터 저장
		
		PrintWriter pw=response.getWriter();
		pw.println(json);//보내주기
		pw.flush();
		pw.close();
	}

	//싫어요버튼 작업
	@RequestMapping(value="/community/delLike.do", method=RequestMethod.POST)
	@Override
	public void delLike(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id=request.getParameter("id");
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		
		CommunityVO communityVO=new CommunityVO();
		communityVO.setId(id);
		communityVO.setBoard_num(board_num);
		
		int board_like=communityService.delLike(communityVO);//liketbl에 insert
		
		JSONObject json=new JSONObject();
		json.put("board_like", board_like);//json에 데이터 저장
		
		PrintWriter pw=response.getWriter();
		pw.println(json);//보내주기
		pw.flush();
		pw.close();
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