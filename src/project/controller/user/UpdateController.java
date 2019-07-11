package project.controller.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.controller.Controller;
import project.controller.ModelAndView;
import project.model.dto.UserDTO;
import project.model.service.UserService;

public class UpdateController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/errorView/error.jsp";
		
		ModelAndView mv = new ModelAndView();
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("password");
		String userName = request.getParameter("name");
		String userEmail = request.getParameter("email");

		UserDTO user = new UserDTO(userId, userPwd, userName, userEmail);
		
		try {
			UserService.update(user);
			request.getSession().setAttribute("sessionUser", user);
			url = "/index.jsp";
			mv.setRedirect(true);
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("erorMsg", e.getMessage());
		}

		mv.setPath(url);

		return mv;
	}

}
