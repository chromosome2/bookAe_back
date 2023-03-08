package bookae.community.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import bookae.community.vo.CommunityVO;

public interface CommunityDAO {
	public List community_list_view() throws DataAccessException;
	public int max_num() throws DataAccessException;
	public int addArticle (CommunityVO communityVO) throws DataAccessException;
	public CommunityVO viewArticle (int board_num) throws DataAccessException;
	public boolean getLike(String id, int board_num) throws DataAccessException;
	public void addLike(Map<String, Object> likeInfo) throws DataAccessException;
	public void delLike(Map<String, Object> likeInfo) throws DataAccessException;

}
