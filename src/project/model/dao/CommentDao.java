package project.model.dao;

import java.util.List;

import project.model.dto.CommentDTO;

public interface CommentDAO {

	/**
	 * SELECT * FROM COMMENTLIST
	 * 
	 * @return
	 */
	List<CommentDTO> selectAll();

	/**
	 * SELECT * FROM COMMENTLIST WHERE ID=?
	 * 
	 * @param commentId
	 * @return
	 */
	CommentDTO selectByCommentId(String commentId);

	/**
	 * INSERT INTO COMMENTLIST(COMMENT_ID, CITY_ID, USER_ID, CONTEXT, RATING,
	 * DATE_CREATED) VALUES(SEQ_COMMENT_ID.NEXTVAL(), ?,?,?,?,SYSDATE);
	 * 
	 * @param comment
	 * @return
	 */
	int insert(CommentDTO comment);

	/**
	 * UPDATE COMMENTLIST SET CONTEXT = ? WHERE COMMENT_ID = ?
	 * @param comment
	 * @return
	 */
	int update(CommentDTO comment);

	/**
	 * DELETE COMMENTLIST WHERE COMMENT_ID = ?
	 * @param commentId
	 * @return
	 */
	int delete(String commentId);

}
