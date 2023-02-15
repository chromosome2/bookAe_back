package bookae.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import bookae.member.dao.MemberDAO;
import bookae.member.vo.MemberVO;

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
	

}
