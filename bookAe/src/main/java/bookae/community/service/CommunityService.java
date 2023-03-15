package bookae.community.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import bookae.community.vo.CommunityVO;
import bookae.util.PagingVO;

public interface CommunityService {
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
	public int total_cntComment(int board_num) throws DataAccessException;
	public void addParentComment(CommunityVO communityVO) throws DataAccessException;
	public void delComment(int comment_num) throws DataAccessException;
	public CommunityVO getComment(int comment_num) throws DataAccessException;

}
