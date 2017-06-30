package DAO;

import java.util.List;

import DTO.BranchDTO;

public interface BranchDAO {

	public List<BranchDTO> memberbranchlist()throws Exception;
}
