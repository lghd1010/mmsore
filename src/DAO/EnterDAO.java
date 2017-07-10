package DAO;

import java.util.List;

import DTO.EnterDTO;


public interface EnterDAO {

	public int getenterCount(int mcn_no, int ent_enter)throws Exception;
	
	public List<EnterDTO> admin1roundlist(int mcn_no, int ent_enter)throws Exception;
	
}
