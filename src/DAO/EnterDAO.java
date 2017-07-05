package DAO;

import java.util.List;

import DTO.EnterDTO;

public interface EnterDAO {

	public int getenterCount(String field, String query)throws Exception;

	public List<EnterDTO> admin1roundlist(int start, String field,
			String query, int pageSize)throws Exception;

}
