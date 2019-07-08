package project.controller.explore;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.controller.Controller;
import project.controller.ModelAndView;

public class ExploreController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		ModelAndView modelAndView = new ModelAndView();
		
		String[] location = req.getRequestURI().replace(req.getContextPath()+"/dest/", "").split("/");
		
		if(location.length == 1) {
			modelAndView.setPath("../city.jsp");
		} else if (location.length == 2) {
			System.out.println(req.getRequestURI());
			modelAndView.setPath("../../place.jsp");
			
		} else {
			modelAndView.setPath(req.getRequestURI());
			
		}
		return modelAndView;
	}

}
