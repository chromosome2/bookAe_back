package bookae.community.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import bookae.community.vo.CommunityVO;
import bookae.util.PagingVO;

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
	
	//커뮤니티 게시글 총 갯수 가져오기.
	public int totalArticle(PagingVO pagingVO) throws DataAccessException{
		int totalArticle =(int)sqlSession.selectOne("mapper.community.totalArticle", pagingVO);
		return totalArticle;
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

	//페이징 후 게시글 가져오기
	@Override
	public List<PagingVO> pagingBoard(PagingVO pagingVO) throws DataAccessException {
		return sqlSession.selectList("mapper.community.pagingBoard", pagingVO);
	}

	//게시글 삭제
	@Override
	public void delArticle(CommunityVO communityVO) throws DataAccessException {
		//게시글과 관련된 정보 삭제
		//좋아요삭제
		sqlSession.delete("mapper.community.deleteLikeOfArticle",communityVO.getBoard_num());
		//댓글삭제
		sqlSession.delete("mapper.community.delCommentOfArticle", communityVO.getBoard_num());
		
		//게시글 삭제
		sqlSession.delete("mapper.community.delArticle",communityVO);
	}

	//게시글 수정
	@Override
	public void modArticle(CommunityVO communityVO) throws DataAccessException {
		sqlSession.update("mapper.community.modArticle",communityVO);
		
	}

	//부모 코멘트 가져오기
	@Override
	public List boardParentCommentList(int board_num) throws DataAccessException {
		return sqlSession.selectList("mapper.community.boardParentCommentList", board_num);
	}

	//자식 코멘트 가져오기
	@Override
	public List boardChildCommentList(int board_num) throws DataAccessException {
		return sqlSession.selectList("mapper.community.boardChildCommentList", board_num);
	}

	//총 코멘트 개수 세기
	@Override
	public int total_cntComment(int board_num) throws DataAccessException {
		return (int)sqlSession.selectOne("mapper.community.total_cntComment",board_num);
	}

	//댓글 작성
	@Override
	public void addParentComment(CommunityVO communityVO) throws DataAccessException {
		sqlSession.insert("mapper.community.addParentComment", communityVO);
		
	}

	//댓글 삭제
	@Override
	public void delComment(int comment_num) throws DataAccessException {
		//부모댓글인지 확인(부모댓글일시 관련 답글까지 삭제)
		int result=(int)sqlSession.selectOne("mapper.community.getComment_parent",comment_num);
		
		if(result==0) {
			System.out.println("부모댓글");
			//관련 답글 삭제
			sqlSession.delete("mapper.community.delReplyRelatedComment",comment_num);
			
			//댓글 삭제
			sqlSession.delete("mapper.community.delComment",comment_num);
		}else {//자식 댓일경우에는 삭제된 댓글이라고 update
			System.out.println("자식댓글");
			
			//자식댓글 삭제처리
			sqlSession.delete("mapper.community.delChildComment",comment_num);
		}
		
		
		
	}

	//코멘트 하나 가져오기
	@Override
	public CommunityVO getComment(int comment_num) throws DataAccessException {
		return (CommunityVO)sqlSession.selectOne("mapper.community.getComment", comment_num);
	}

	//코멘트 수정하기
	@Override
	public void modComment(CommunityVO communityVO) throws DataAccessException {
		sqlSession.update("mapper.community.modComment",communityVO);
		
	}

	//답글 추가 (자식 코멘트)
	@Override
	public void replyComment(CommunityVO communityVO) throws DataAccessException {
		sqlSession.insert("mapper.community.replyComment", communityVO);
		
	}
	
	//comment_parent 구해오기
	@Override
	public int ReGetComment_parent(int comment_annot) throws DataAccessException {
		return (int)sqlSession.selectOne("mapper.community.ReGetComment_parent", comment_annot);
	}

	//매거진개수
	@Override
	public int totalMagazine(PagingVO pagingVO) throws DataAccessException {
		int totalMagazine =(int)sqlSession.selectOne("mapper.community.totalMagazine", pagingVO);
		return totalMagazine;
	}

	//매거진목록
	@Override
	public List magazineList(PagingVO pagingVO) throws DataAccessException {
		return sqlSession.selectList("mapper.community.magazineList", pagingVO);
	}
	
	//매거진 작성
	@Override
	public int addMagazine(CommunityVO communityVO) throws DataAccessException {
		int result=sqlSession.insert("mapper.community.addMagazine", communityVO);
		return result;
	}

	//매거진 자세히 보기
	@Override
	public CommunityVO viewMagazine(int magazine_num) throws DataAccessException {
		//조회수업데이트
		sqlSession.update("mapper.community.updateMagazineView", magazine_num);
		CommunityVO magazine=(CommunityVO)sqlSession.selectOne("mapper.community.viewMagazine", magazine_num);
		return magazine;
	}

	@Override
	public List magazineList() throws DataAccessException {
		return sqlSession.selectList("mapper.community.RecentMagazineList");
	}

}
