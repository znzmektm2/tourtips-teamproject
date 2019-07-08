package project.model.dao;

import java.util.List;

import project.model.dto.CommentDTO;

public interface CommentDao {

	/**
	 * SELECT * FROM COMMENTLIST;
	 * @return
	 */
	List<CommentDTO> selectAll();
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	CommentDTO selectByCommentId(String commentId);
	
	/**
	 * 
	 * @param comment
	 * @return
	 */
	int insert(CommentDTO comment);
	
	/**
	 * 
	 * @param comment
	 * @return
	 */
	int update(CommentDTO comment);
	
	/**
	 * 
	 * @param commentId
	 * @return
	 */
	int delete(String commentId);
	
}
