package bookae.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import bookae.member.vo.MemberVO;

public interface CommunityController {
	public ModelAndView community_list_view (HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView addArticle (HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
