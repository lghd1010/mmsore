package DAO;

import java.util.List;

import DTO.EduinfoDTO;
import DTO.MemberDTO;

public interface MemberDAO {

	public int memberinsert(MemberDTO memberDTO)throws Exception;

	public List<EduinfoDTO> getMcnameAjax(String string)throws Exception;

	public Integer CheckID(String m_id)throws Exception;

}
