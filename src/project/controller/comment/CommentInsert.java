package project.controller.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.model.dto.CommentDTO;
import project.model.service.CommentService;
import project.model.service.CommentServiceImpl;

/**
 * Servlet implementation class CommentInsert
 */
@WebServlet("/CommentInsert")
public class CommentInsert extends HttpServlet {

	CommentService service = CommentServiceImpl.getInstance();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("CommentInsert called...");

		String userId = request.getParameter("userId");
		String placeId = request.getParameter("placeId");
		String context = request.getParameter("txtComment");
		int rating = Integer.parseInt(request.getParameter("rating"));
		
		CommentDTO comment = new CommentDTO(0, placeId, userId, context, rating, "");
		
		System.out.println(comment);
		
		try {
			int result = service.insert(comment);
			PrintWriter out = response.getWriter();
			out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
