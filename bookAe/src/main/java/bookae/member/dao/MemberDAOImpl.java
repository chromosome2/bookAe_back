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

	@Override
	public int joinMember(MemberVO memberVO) throws DataAccessException {
		int result=sqlSession.insert("mapper.member.joinMember", memberVO);
		return result;
	}

	@Override
	public String loginMember(MemberVO memberVO) throws DataAccessException {
		String result=(String)sqlSession.selectOne("mapper.member.loginMember", memberVO);
		return result;
	}

	@Override
	public String getJoinDate(String id) throws DataAccessException {
		return (String)sqlSession.selectOne("mapper.member.getJoinDate",id);
	}
	
	

}
