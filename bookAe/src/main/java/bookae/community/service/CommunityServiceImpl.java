package bookae.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import bookae.community.dao.CommunityDAO;
import bookae.community.vo.CommunityVO;
import bookae.util.PagingVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private CommunityDAO communityDAO;

	@Override
	public List community_list_view() throws DataAccessException {
		return communityDAO.community_list_view();
	}
	
	public int totalArticle(PagingVO pagingVO) throws DataAccessException{
		return communityDAO.totalArticle(pagingVO);
	}

	@Override
	public int addArticle(CommunityVO communityVO) throws DataAccessException {
		return communityDAO.addArticle(communityVO);
	}

	@Override
	public CommunityVO viewArticle(int board_num) throws DataAccessException {
		return communityDAO.viewArticle(board_num);
	}

	@Override
	public boolean getLike(String id, int board_num) throws DataAccessException {
		return communityDAO.getLike(id, board_num);
	}

	@Override
	public int addLike(CommunityVO communityVO) throws DataAccessException {
		return communityDAO.addLike(communityVO);
		
	}

	@Override
	public int delLike(CommunityVO communityVO) throws DataAccessException {
		return communityDAO.delLike(communityVO);
	}

	@Override
	public List two_best_community_list() throws DataAccessException {
		return communityDAO.two_best_community_list();
	}

	@Override
	public List<PagingVO> pagingBoard(PagingVO pagingVO) throws DataAccessException {
		return communityDAO.pagingBoard(pagingVO);
	}

	@Override
	public void delArticle(CommunityVO communityVO) throws DataAccessException {
		communityDAO.delArticle(communityVO);
	}

	@Override
	public void modArticle(CommunityVO communityVO) throws DataAccessException {
		communityDAO.modArticle(communityVO);
		
	}

	@Override
	public List boardParentCommentList(int board_num) throws DataAccessException {
		return communityDAO.boardParentCommentList(board_num);
	}

	@Override
	public List boardChildCommentList(int board_num) throws DataAccessException {
		return communityDAO.boardChildCommentList(board_num);
	}

	@Override
	public int total_cntComment(int board_num) throws DataAccessException {
		return communityDAO.total_cntComment(board_num);
	}

	@Override
	public void addParentComment(CommunityVO communityVO) throws DataAccessException {
		communityDAO.addParentComment(communityVO);
		
	}

	@Override
	public void delComment(int comment_num) throws DataAccessException {
		communityDAO.delComment(comment_num);
		
	}

	@Override
	public CommunityVO getComment(int comment_num) throws DataAccessException {
		return communityDAO.getComment(comment_num);
	}

	@Override
	public void modComment(CommunityVO communityVO) throws DataAccessException {
		communityDAO.modComment(communityVO);
		
	}

	@Override
	public void replyComment(CommunityVO communityVO) throws DataAccessException {
		communityDAO.replyComment(communityVO);
		
	}

	@Override
	public int ReGetComment_parent(int comment_annot) throws DataAccessException {
		return communityDAO.ReGetComment_parent(comment_annot);
	}
	
	

}
