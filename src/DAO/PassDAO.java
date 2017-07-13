package DAO;

import java.util.List;

import DTO.EnterDTO;

public interface PassDAO {

	public List<EnterDTO> round1passcheck(String field, String query, String field2, String query2, String field3, String query3, String field4, String query4)throws Exception;

	public List<EnterDTO> round2passcheck(String field, String query, String field2, String query2, String field3, String query3, String field4, String query4)throws Exception;

	public List<EnterDTO> round3result(String field, String query, String field2, String query2, String field3, String query3, String field4, String query4)throws Exception;

}
