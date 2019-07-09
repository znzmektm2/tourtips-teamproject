package project.controller.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.controller.Controller;
import project.controller.ModelAndView;
import project.model.dto.UserDTO;
import project.model.service.JoinService;

public class SelectController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "errorView/error.jsp";
		
		try {
			List<UserDTO> list = JoinService.selectAll();
			request.setAttribute("list", list);
			url="joinView/list.jsp";
		} catch (SQLException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		ModelAndView mv = new ModelAndView();
		mv.setPath(url);
		return mv;
	}

}
