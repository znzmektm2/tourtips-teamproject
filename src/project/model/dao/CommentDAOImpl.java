package project.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.model.dto.CommentDTO;
import project.util.DbUtil;

public class CommentDAOImpl implements CommentDAO {
	private static CommentDAOImpl dao = new CommentDAOImpl();

	public static CommentDAOImpl getInstance() {
		return dao;
	}

	@Override
	public List<CommentDTO> selectByPlaceId(int placeId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CommentDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM COMMENTLIST WHERE PLACE_ID=? ORDER BY COMMENT_ID DESC";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, placeId);
			rs = ps.executeQuery();
			while (rs.next()) {
				CommentDTO co = new CommentDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getInt(5), rs.getString(6));
				list.add(co);
				System.out.println(co);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}

		return list;
	}

	@Override
	public int insert(CommentDTO comment) throws SQLException {
		Connection con = null;
		PreparedStatement ps =null;
		int result=0;
		
		String sql ="INSERT INTO COMMENTLIST VALUES(SEQ_COMMENT_ID.NEXTVAL,?,?,?,?,SYSDATE)";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);	
			ps.setString(1, comment.getPlaceId());
			ps.setString(2, comment.getUserId());
			ps.setString(3, comment.getContext());
			ps.setInt(4, comment.getRating());
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int delete(String commentId) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		
		String sql="DELETE COMMENTLIST WHERE COMMENT_ID=?";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, commentId);
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

//	@Override
//	public List<CommentDTO> selectAll() throws SQLException{
//		Connection con=null;
//		PreparedStatement ps=null;
//		ResultSet rs=null;
//		List<CommentDTO> list = new ArrayList<>();
//		String sql ="SELECT * FROM COMMENTLIST";
//		try {
//			con = DbUtil.getConnection();
//			ps = con.prepareStatement(sql);
//			rs = ps.executeQuery();
//			while(rs.next()) {
//				CommentDTO co =
//						new CommentDTO(rs.getInt(1),
//								rs.getString(2), rs.getString(3),
//								rs.getString(4), rs.getInt(5),
//								rs.getString(6));
//				list.add(co);
//			}
//		}finally{
//			DbUtil.dbClose(rs, ps, con);
//		}
//		
//		return list;
//	}
//
//	@Override
//	public CommentDTO selectByCommentId(String commentId) throws SQLException {
//		Connection con = null;
//		PreparedStatement ps =null;
//		ResultSet rs =null;
//		CommentDTO co =null;
//		String sql ="SELECT * FROM COMMENTLIST WHERE ID=?";
//		try {
//			con = DbUtil.getConnection();
//			ps = con.prepareStatement(sql);
//			rs = ps.executeQuery();
//			if(rs.next()) {
//				co = new CommentDTO(rs.getInt(1), rs.getString(2), rs.getString(3), 
//						rs.getString(4), rs.getInt(5), rs.getString(6));
//				
//			}
//			
//		}finally {
//			DbUtil.dbClose(rs, ps, con);
//		}
//		
//		return null;
//	}

}