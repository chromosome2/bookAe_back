package bookae.community.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
		//조회수업데이트
		sqlSession.update("mapper.community.updateBoardView", board_num);
		//article 정보 가져오기
		CommunityVO article=(CommunityVO)sqlSession.selectOne("mapper.community.viewArticle", board_num);
		//article의 id정보로 닉네임 얻어오기
		String nickname=(String)sqlSession.selectOne("mapper.community.getNickname",article.getId());
		//like 갯수 가져오기
		int board_like=(int)sqlSession.selectOne("mapper.community.getBoardLike",board_num);
		
		article.setNickname(nickname);
		article.setBoard_like(board_like);
		return article;
	}
	
	//로그인한 사람의 좋아요 여부
	@Override
	public boolean getLike(String id, int board_num) throws DataAccessException {
		CommunityVO like=new CommunityVO();
		like.setId(id);
		like.setBoard_num(board_num);
		boolean likeIs=Boolean.parseBoolean((String)sqlSession.selectOne("mapper.community.likeIs",like));
		
		return likeIs;
		
	}

	@Override
	public void addLike(Map<String, Object> likeInfo) throws DataAccessException {
		sqlSession.insert("mapper.community.addLike", likeInfo);
	}
	
	@Override
	public void delLike(Map<String, Object> likeInfo) throws DataAccessException {
		sqlSession.delete("mapper.community.delLike", likeInfo);
	}

}
