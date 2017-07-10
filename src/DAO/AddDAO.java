package DAO;

import java.util.List;

import DTO.AddDTO;

public interface AddDAO {

	public List<AddDTO> admincompnolist()throws Exception;

	public int admincompnoinsert(AddDTO addDTO)throws Exception;

}
