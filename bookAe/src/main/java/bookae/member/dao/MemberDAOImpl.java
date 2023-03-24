package bookae.member.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import bookae.member.vo.MemberVO;
import bookae.util.PagingVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;

	//회원가입
	@Override
	public int joinMember(MemberVO memberVO) throws DataAccessException {
		int result=sqlSession.insert("mapper.member.joinMember", memberVO);
		return result;
	}

	//로그인결과
	@Override
	public String loginMember(MemberVO memberVO) throws DataAccessException {
		String result=(String)sqlSession.selectOne("mapper.member.loginMember", memberVO);
		return result;
	}

	//joindate가져오기
	@Override
	public String getJoinDate(String id) throws DataAccessException {
		return (String)sqlSession.selectOne("mapper.member.getJoinDate",id);
	}
	
	//개인정보 가져오기
	@Override
	public MemberVO getPrivacy(String id) throws DataAccessException {
		return (MemberVO)sqlSession.selectOne("mapper.member.getPrivacy",id);
	}

	//닉네임 중복 체크
	@Override
	public String nicknameCheck(String nickname) throws DataAccessException {
		return (String)sqlSession.selectOne("mapper.member.nicknameCheck",nickname);
	}

	//id 중복 체크
	@Override
	public String idCheck(String id) throws DataAccessException {
		return (String)sqlSession.selectOne("mapper.member.idCheck",id);
	}

	//개인정보 수정
	@Override
	public void privacyChange(MemberVO memberVO) throws DataAccessException {
		sqlSession.update("mapper.member.privacyChange",memberVO);
		
	}

	@Override
	public int totalLikeArticle(String id) throws DataAccessException {
		int totalArticle =(int)sqlSession.selectOne("mapper.community.totalLikeArticle", id);
		return totalArticle;
	}

	@Override
	public List pagingLikeBoard(PagingVO pagingVO) throws DataAccessException {
		return sqlSession.selectList("mapper.community.pagingLikeBoard", pagingVO);
	}

	@Override
	public int totalMyArticle(String id) throws DataAccessException {
		int totalArticle =(int)sqlSession.selectOne("mapper.community.totalMyArticle", id);
		return totalArticle;
	}

	@Override
	public List pagingMyBoard(PagingVO pagingVO) throws DataAccessException {
		return sqlSession.selectList("mapper.community.pagingMyBoard", pagingVO);
	}

	//내가 쓴 댓글 수 가져오기
	@Override
	public int totalMyComment(String id) throws DataAccessException {
		int totalComment =(int)sqlSession.selectOne("mapper.community.totalMyComment", id);
		return totalComment;
	}

	//내가 쓴 댓글 리스트 가져오기
	@Override
	public List myCommentList(PagingVO pagingVO) throws DataAccessException {
		return sqlSession.selectList("mapper.community.myCommentList", pagingVO);
	}

	@Override
	public String getNickname(String id) throws DataAccessException {
		return (String)sqlSession.selectOne("mapper.community.getNickname", id);
	}
	
	

}
