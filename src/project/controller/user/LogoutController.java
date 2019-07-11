package project.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.controller.Controller;
import project.controller.ModelAndView;

public class LogoutController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "errorView/error.jsp";
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		try {
			session.invalidate();
			url = request.getContextPath() + "/index.jsp";
		}catch(Exception e) {
			//e.printStackTrace();
			request.setAttribute("erroMsg", e.getMessage());
		}
		
		mv.setPath(url);
		return mv;
	}

}
