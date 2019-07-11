package project.model.service;

import java.sql.SQLException;
import java.util.List;

import project.model.dao.CommentDAO;
import project.model.dao.CommentDAOImpl;
import project.model.dto.CommentDTO;

public class CommentServiceImpl implements CommentService {

	private CommentDAO dao = CommentDAOImpl.getInstance();

	private static CommentServiceImpl service = new CommentServiceImpl();

	public static CommentServiceImpl getInstance() {
		return service;
	}

	@Override
	public List<CommentDTO> selectByPlaceId(int placeId) throws SQLException {
		List<CommentDTO> list = dao.selectByPlaceId(placeId);
		return list;
	}

	@Override
	public int insert(CommentDTO comment) throws SQLException {
		int result = dao.insert(comment);
		return result;
	}

	@Override
	public int delete(String commentId) throws SQLException {
		int result = dao.delete(commentId);
		return result;
	}

	@Override
	public int[] ratings(int placeId) throws SQLException {
		int[] result = dao.ratings(placeId);
		return result;
	}
}
