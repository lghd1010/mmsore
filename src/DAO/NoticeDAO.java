package DAO;

import java.util.List;

import DTO.NoticeDTO;

public interface NoticeDAO {

	public int getnoticeCount(String field, String query)throws Exception;

	public List<NoticeDTO> noticelist(int start, String field, String query,
			int pageSize)throws Exception;

	public NoticeDTO noticedetail(int boardno) throws Exception;

	public void noticeCount(int boardno)throws Exception;

	public int noticeInsert(NoticeDTO noticeDTO)throws Exception;

}
 