package bookae.community.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bookae.community.vo.CommunityVO;
import bookae.util.PagingVO;

public interface CommunityController {
	/*public ModelAndView community_list_view (HttpServletRequest request,
			HttpServletResponse response) throws Exception;*/
	public ModelAndView addArticle (@ModelAttribute("communityVO") CommunityVO communityVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView viewArticle (@RequestParam("board_num") int board_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView modCommunityForm (@RequestParam("board_num") int board_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public void delArticle (HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView modArticle (@ModelAttribute("communityVO") CommunityVO communityVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public void addLike(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public void delLike(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView boardList (PagingVO pagingVO, 
			@RequestParam(value="nowPage", required=false) String nowPage, 
			@RequestParam(value="head", required=false) String head,
			@RequestParam(value="search_community", required=false) String search_community, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView addParentComment (@ModelAttribute("communityVO") CommunityVO communityVO,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public void delComment (HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView modCommentPopup(@RequestParam("comment_num") int comment_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
