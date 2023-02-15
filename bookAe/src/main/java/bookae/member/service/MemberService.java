package bookae.member.service;

import org.springframework.dao.DataAccessException;

import bookae.member.vo.MemberVO;

public interface MemberService {
	public int joinMember(MemberVO memberVO) throws DataAccessException;
	public String loginMember(MemberVO memberVO) throws DataAccessException;

}
