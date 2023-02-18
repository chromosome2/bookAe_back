package bookae.community.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CommunityService {
	public List community_list_view() throws DataAccessException;

}
