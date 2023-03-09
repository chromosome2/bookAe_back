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
	
	//커뮤니티 목록 불러오기
	@Override
	public List<CommunityVO> community_list_view() throws DataAccessException {
		List<CommunityVO> communityList=null;
		communityList=sqlSession.selectList("mapper.community.community_list_view");
		return communityList;
	}
	
	//커뮤니티 게시글 갯수 가져오기. max가 아니라 count가 더 적절한 말일듯 함.
	public int max_num() throws DataAccessException{
		int num =(int)sqlSession.selectOne("mapper.community.max_num");
		return num;
	}

	//게시글 작성
	@Override
	public int addArticle(CommunityVO communityVO) throws DataAccessException {
		int result=sqlSession.insert("mapper.community.addArticle", communityVO);
		return result;
	}

	//게시글 자세히 보기
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

	//좋아요 기능
	@Override
	public int addLike(CommunityVO communityVO) throws DataAccessException {
		//liketbl에 insert
		sqlSession.insert("mapper.community.addLike", communityVO);
		//like 갯수 가져오기
		int board_like=(int)sqlSession.selectOne("mapper.community.getBoardLike",communityVO.getBoard_num());
		return board_like;
	}
	
	//좋아요 취소 기능
	@Override
	public int delLike(CommunityVO communityVO) throws DataAccessException {
		//liketbl에 delete
		sqlSession.delete("mapper.community.delLike", communityVO);
		//like 갯수 가져오기
		int board_like=(int)sqlSession.selectOne("mapper.community.getBoardLike",communityVO.getBoard_num());
		return board_like;
	}

	//베스트 커뮤니티 리스트 두개 가져오기
	@Override
	public List two_best_community_list() throws DataAccessException {
		List<CommunityVO> bestCommunityList=null;
		bestCommunityList=sqlSession.selectList("mapper.community.two_best_community_list");
		return bestCommunityList;
	}

}
