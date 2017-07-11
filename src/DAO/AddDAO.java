package DAO;

import java.util.List;

import DTO.AddDTO;

public interface AddDAO {

	public List<AddDTO> admincompnolist()throws Exception;

	public int admincompnoinsert(AddDTO addDTO)throws Exception;

	public List<AddDTO> adminaddlist(int mcn_no)throws Exception;

	public int adminaddinsert(AddDTO addDTO)throws Exception;

	public AddDTO adminadddetaile(int ma_idx)throws Exception;

	public int adminaddupdate(AddDTO addDTO)throws Exception;

}
