package bookae.member.dao;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import bookae.member.vo.MemberVO;

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
	
	

}
