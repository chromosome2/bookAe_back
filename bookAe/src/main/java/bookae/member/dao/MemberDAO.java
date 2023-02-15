package bookae.member.dao;

import org.springframework.dao.DataAccessException;

import bookae.member.vo.MemberVO;

public interface MemberDAO {
	public int joinMember(MemberVO memberVO) throws DataAccessException;
	public String loginMember(MemberVO memberVO) throws DataAccessException;
}
