package bookae.community.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import bookae.community.vo.CommunityVO;

public interface CommunityService {
	public List community_list_view() throws DataAccessException;
	public int max_num() throws DataAccessException;
	public int addArticle (CommunityVO communityVO) throws DataAccessException;
	public CommunityVO viewArticle (int board_num) throws DataAccessException;
	public boolean getLike(String id, int board_num) throws DataAccessException;
	public int addLike(CommunityVO communityVO) throws DataAccessException;
	public int delLike(CommunityVO communityVO) throws DataAccessException;

}
