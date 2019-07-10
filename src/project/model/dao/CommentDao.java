package project.model.dao;

import java.sql.SQLException;
import java.util.List;

import project.model.dto.CommentDTO;

public interface CommentDAO {

	/**
	 * SELECT * FROM COMMENTLIST WHERE PLACE_ID=?
	 * 
	 * @return
	 * @throws SQLException 
	 */
	List<CommentDTO> selectByPlaceId(int placeId) throws SQLException;

	/**
	 * INSERT INTO COMMENTLIST VALUES(SEQ_COMMENT_ID.NEXTVAL(), ?,?,?,?,SYSDATE);
	 * 
	 * @param comment
	 * @return
	 * @throws SQLException 
	 */
	int insert(CommentDTO comment) throws SQLException;

	/**
	 * DELETE COMMENTLIST WHERE COMMENT_ID=?
	 * @param commentId
	 * @return
	 * @throws SQLException 
	 */
	int delete(String commentId) throws SQLException;
	
}
