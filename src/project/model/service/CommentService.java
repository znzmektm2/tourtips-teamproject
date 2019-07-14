package project.model.service;

import java.sql.SQLException;
import java.util.List;

import project.model.dto.CommentDTO;

public interface CommentService {

	List<CommentDTO> selectByPlaceId(int placeId) throws SQLException;

	int insert(CommentDTO comment) throws SQLException;

	int delete(String commentId) throws SQLException;
	
	int[] ratings(int placeId) throws SQLException;
	
	List<CommentDTO> selectAll();
}
