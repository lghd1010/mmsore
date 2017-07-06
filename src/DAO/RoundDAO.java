package DAO;

import java.util.List;

import DTO.EnterDTO;
import DTO.Round1DTO;

public interface RoundDAO {

	public List<Round1DTO> round1pointlist(int mcn_no)throws Exception;
	
	public int getenterCount2(String field, String query, int mcn_no)throws Exception;

	public List<EnterDTO> admin2roundlist(int start, String field,
			String query, int pageSize, int mcn_no)throws Exception;

	public int getenterCount3(String field, String query, int mcn_no)throws Exception;

	public List<EnterDTO> admin3roundlist(int start, String field,
			String query, int pageSize, int mcn_no)throws Exception;

	public List<EnterDTO> competition()throws Exception;
	
	

}
