package DAO;

import java.util.List;

import DTO.EduinfoDTO;
import DTO.MemberDTO;

public interface MemberDAO {

	public int memberinsert(MemberDTO member)throws Exception;

	public List<EduinfoDTO> getMcnameAjax(String string)throws Exception;

	public Integer CheckID(String m_id)throws Exception;

	public MemberDTO getMember(MemberDTO memberDTO)throws Exception;

	public int getmemberCount(String field, String query)throws Exception;

	public List<MemberDTO> adminmemberlist(int start, String field, String query, int pageSize)throws Exception;

}
