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
	
	/**
	 * SELECT  COUNT(CASE WHEN RATING=1 THEN 1 END) ONE, COUNT(CASE WHEN RATING=2 THEN 1 END) TWO,
	 * COUNT(CASE WHEN RATING=3 THEN 1 END) THREE, COUNT(CASE WHEN RATING=4 THEN 1 END) FOUR,
	 * COUNT(CASE WHEN RATING=5 THEN 1 END) FIVE FROM COMMENTLIST WHERE PLACE_ID=1;
	 * @param placeId
	 * @return
	 * @throws SQLException
	 */
	int[] ratings(int placeId) throws SQLException;
	
	/**
	 * @return
	 * @throws SQLException 
	 */
	List<CommentDTO> selectAll() throws SQLException;
}
