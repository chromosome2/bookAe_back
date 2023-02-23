package bookae.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import bookae.community.vo.CommunityVO;

@Repository("communityDAO")
public class CommunityDAOImpl implements CommunityDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CommunityVO> community_list_view() throws DataAccessException {
		List<CommunityVO> communityList=null;
		communityList=sqlSession.selectList("mapper.community.community_list_view");
		return communityList;
	}
	
	public int max_num() throws DataAccessException{
		int num =(int)sqlSession.selectOne("mapper.community.max_num");
		return num;
	}

	@Override
	public int addArticle(CommunityVO communityVO) throws DataAccessException {
		int result=sqlSession.insert("mapper.community.addArticle", communityVO);
		return result;
	}

	@Override
	public CommunityVO viewArticle(int board_num) throws DataAccessException {
		return (CommunityVO)sqlSession.selectOne("mapper.community.viewArticle", board_num);
	}

}
