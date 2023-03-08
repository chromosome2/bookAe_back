package bookae.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import bookae.community.dao.CommunityDAO;
import bookae.community.vo.CommunityVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private CommunityDAO communityDAO;

	@Override
	public List community_list_view() throws DataAccessException {
		return communityDAO.community_list_view();
	}
	
	public int max_num() throws DataAccessException{
		return communityDAO.max_num();
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
	public void addLike(Map<String, Object> likeInfo) throws DataAccessException {
		communityDAO.addLike(likeInfo);
		
	}

	@Override
	public void delLike(Map<String, Object> likeInfo) throws DataAccessException {
		communityDAO.delLike(likeInfo);
		
	}
	
	

}
