package DAO;

import java.util.List;

import DTO.EnterDTO;
import DTO.Round1DTO;
import DTO.Round2DTO;
import DTO.Round3DTO;

public interface RoundDAO {

	public List<Round1DTO> round1pointlist(int mcn_no, int ent_enter)throws Exception;
	
	public int getenterCount2(int mcn_no, int ent_enter)throws Exception;

	public List<EnterDTO> admin2roundlist(int mcn_no, int ent_enter)throws Exception;

	public int getenterCount3(int mcn_no, int ent_enter)throws Exception;

	public List<EnterDTO> admin3roundlist(int mcn_no, int ent_enter)throws Exception;

	public List<EnterDTO> competition()throws Exception;

	public List<Round2DTO> round2pointlist(int mcn_no, int ent_enter)throws Exception;

	public int admin1roundpointlistck(Round1DTO round1dto)throws Exception;

	public int admin1roundpointupdates(Round1DTO round1dto)throws Exception;

	public List<EnterDTO> enterfield()throws Exception;

	public int admin2roundpointupdatee(Round2DTO round2dto)throws Exception;

	public int admin2roundpointinsert(Round2DTO round2dto)throws Exception;

	public int admin2roundck(Round2DTO round2dto)throws Exception;

	public List<Round3DTO> round3pointlist(int mcn_no, int ent_enter)throws Exception;

	public int admin3roundpointupdate(Round3DTO round3dto)throws Exception;
	
	

}
