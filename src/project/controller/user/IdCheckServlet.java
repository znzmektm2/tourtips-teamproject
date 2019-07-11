package project.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import project.model.service.UserService;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/userIdCheck")
public class IdCheckServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String userId = request.getParameter("userId");
		PrintWriter out = response.getWriter();
		try {
			UserService.idCheck(userId);
		} catch (SQLException e) {
			out.println(e.getMessage());		
		}
	}
}
