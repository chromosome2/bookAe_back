package bookae.member.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import bookae.member.dao.MemberDAO;
import bookae.member.vo.MemberVO;
import bookae.util.PagingVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int joinMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.joinMember(memberVO);
	}

	@Override
	public String loginMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.loginMember(memberVO);
	}

	@Override
	public String getJoinDate(String id) throws DataAccessException {
		return memberDAO.getJoinDate(id);
	}

	@Override
	public MemberVO getPrivacy(String id) throws DataAccessException {
		return memberDAO.getPrivacy(id);
	}

	@Override
	public String nicknameCheck(String nickname) throws DataAccessException {
		return memberDAO.nicknameCheck(nickname);
	}

	@Override
	public String idCheck(String id) throws DataAccessException {
		return memberDAO.idCheck(id);
	}

	@Override
	public void privacyChange(MemberVO memberVO) throws DataAccessException {
		memberDAO.privacyChange(memberVO);
		
	}

	@Override
	public int totalLikeArticle(String id) throws DataAccessException {
		return memberDAO.totalLikeArticle(id);
	}

	@Override
	public List<PagingVO> pagingLikeBoard(PagingVO pagingVO) throws DataAccessException {
		return memberDAO.pagingLikeBoard(pagingVO);
	}

	@Override
	public int totalMyArticle(String id) throws DataAccessException {
		return memberDAO.totalMyArticle(id);
	}

	@Override
	public List<PagingVO> pagingMyBoard(PagingVO pagingVO) throws DataAccessException {
		return memberDAO.pagingMyBoard(pagingVO);
	}
	

}
