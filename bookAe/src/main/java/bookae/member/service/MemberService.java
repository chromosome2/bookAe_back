package bookae.member.service;

import java.sql.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import bookae.member.vo.MemberVO;
import bookae.util.PagingVO;

public interface MemberService {
	public int joinMember(MemberVO memberVO) throws DataAccessException;
	public String loginMember(MemberVO memberVO) throws DataAccessException;
	public String getJoinDate(String id) throws  DataAccessException;
	public MemberVO getPrivacy(String id) throws  DataAccessException;
	public String nicknameCheck(String nickname) throws  DataAccessException;
	public String idCheck(String id) throws  DataAccessException;
	public void privacyChange(MemberVO memberVO) throws  DataAccessException;
	public int totalLikeArticle(String id) throws DataAccessException;
	public List<PagingVO> pagingLikeBoard(PagingVO pagingVO) throws DataAccessException;
	public int totalMyArticle(String id) throws DataAccessException;
	public List<PagingVO> pagingMyBoard(PagingVO pagingVO) throws DataAccessException;

}
