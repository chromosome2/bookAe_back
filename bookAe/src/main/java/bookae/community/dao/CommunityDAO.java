package bookae.community.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import bookae.community.vo.CommunityVO;
import bookae.util.PagingVO;

public interface CommunityDAO {
	public List community_list_view() throws DataAccessException;
	public List two_best_community_list() throws DataAccessException;
	public int totalArticle(PagingVO pagingVO) throws DataAccessException;
	public int addArticle (CommunityVO communityVO) throws DataAccessException;
	public void delArticle(CommunityVO communityVO) throws DataAccessException;
	public void modArticle(CommunityVO communityVO) throws DataAccessException;
	public CommunityVO viewArticle (int board_num) throws DataAccessException;
	public boolean getLike(String id, int board_num) throws DataAccessException;
	public int addLike(CommunityVO communityVO) throws DataAccessException;
	public int delLike(CommunityVO communityVO) throws DataAccessException;
	public List<PagingVO> pagingBoard(PagingVO pagingVO) throws DataAccessException;
	public List boardParentCommentList(int board_num) throws DataAccessException;
	public List boardChildCommentList(int board_num) throws DataAccessException;

}
