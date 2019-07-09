package project.controller.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.controller.Controller;
import project.controller.ModelAndView;
import project.model.dto.UserDTO;
import project.model.service.UserService;

public class LoginController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String url = "errorView/error.jsp";
		ModelAndView mv = new ModelAndView();

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String returnURL = request.getParameter("returnURL");
		
		try {
			if (UserService.LogIn(userId, userPwd)) {
				UserDTO user = UserService.selectById(userId);
				HttpSession session = request.getSession();
				session.setAttribute("sessionUser", user);
				url = returnURL;
			}
		} catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		mv.setPath(url);
		mv.setRedirect(true);
		return mv;
	}
}
