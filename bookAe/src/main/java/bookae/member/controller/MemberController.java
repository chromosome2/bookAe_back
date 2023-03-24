package bookae.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bookae.member.vo.MemberVO;
import bookae.util.PagingVO;

public interface MemberController {
	public ModelAndView joinMember (@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView loginMember (@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public void pwdCheck (HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public void nicknameCheck(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	public void idCheck(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	public ModelAndView privacyChange (@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView myPageLike (PagingVO pagingVO, 
			@RequestParam(value="nowPage", required=false) String nowPage, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView myPageArticle (PagingVO pagingVO, 
			@RequestParam(value="nowPage", required=false) String nowPage, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView myCommentList (PagingVO pagingVO, 
			@RequestParam(value="nowPage", required=false) String nowPage, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView manageMember (PagingVO pagingVO, 
			@RequestParam(value="nowPage", required=false) String nowPage, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
