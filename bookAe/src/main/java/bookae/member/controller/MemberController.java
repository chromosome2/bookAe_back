package bookae.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import bookae.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView joinMember (@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ModelAndView loginMember (@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
