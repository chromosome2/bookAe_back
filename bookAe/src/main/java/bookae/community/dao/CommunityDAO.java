package bookae.community.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CommunityDAO {
	public List community_list_view() throws DataAccessException;

}
