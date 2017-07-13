package DAO;

import java.util.List;

import DTO.EnterDTO;
import DTO.Round1DTO;


public interface EnterDAO {

	public int getenterCount(int mcn_no, int ent_enter)throws Exception;
	
	public List<EnterDTO> admin1roundlist(int mcn_no, int ent_enter)throws Exception;

	public int round1pointinsert2(Round1DTO round1DTO)throws Exception;

	public List<EnterDTO> enterlist()throws Exception;

	public int acmin1roundactive(EnterDTO enterDTO)throws Exception;
	
}
