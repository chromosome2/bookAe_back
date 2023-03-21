package bookae.member.dao;

import java.sql.Date;

import org.springframework.dao.DataAccessException;

import bookae.member.vo.MemberVO;

public interface MemberDAO {
	public int joinMember(MemberVO memberVO) throws DataAccessException;
	public String loginMember(MemberVO memberVO) throws DataAccessException;
	public String getJoinDate(String id) throws  DataAccessException;
	public MemberVO getPrivacy(String id) throws  DataAccessException;
	public String nicknameCheck(String nickname) throws  DataAccessException;
	public String idCheck(String id) throws  DataAccessException;
}
