package DAO;

import java.util.List;

import DTO.PhotoDTO;

public interface PhotoDAO {

	public int getphotoCount()throws Exception;

	public List<PhotoDTO> photoList(int start, String field, String query,
			int pageSize)throws Exception;

	public void PhotoCount(int boardno)throws Exception;

	public PhotoDTO photodtaile(int boardno);

	public int insert(PhotoDTO photoDTO)throws Exception;

}
