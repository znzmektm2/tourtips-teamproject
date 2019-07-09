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

public class InsertController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "errorView/error.jsp";
		ModelAndView mv = new ModelAndView();

		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String returnURL = request.getParameter("returnURL");

		UserDTO user = new UserDTO(userId, password, name, email);

		try {
			UserService.insert(user);
			mv.setPath(returnURL);
			mv.setRedirect(true);
		} catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
			mv.setPath(url);
		}
		return mv;
	}

}
