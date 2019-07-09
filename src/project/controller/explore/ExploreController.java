package project.controller.explore;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.controller.Controller;
import project.controller.ModelAndView;
import project.model.dto.CityDTO;
import project.model.dto.PlaceDTO;
import project.model.dto.PopularLocationDTO;

public class ExploreController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		ModelAndView modelAndView = new ModelAndView();

		String[] location = req.getRequestURI().replace(req.getContextPath() + "/dest/", "").split("/");

		if (location.length == 1) {
			Map<String, CityDTO> map = (Map<String, CityDTO>) req.getServletContext().getAttribute("CityAll");
//			System.out.println(location[0].toUpperCase());
//			System.out.println(map.get(location[0].toUpperCase()));
			req.setAttribute("location", map.get(location[0].toUpperCase()));
			modelAndView.setPath("/city.jsp");
			
			/*Map<String, PopularLocationDTO> popularMap = (Map<String, PopularLocationDTO>) req.getServletContext().getAttribute("PopularAll");
			req.setAttribute("location", popularMap.get(location[0].toUpperCase()));*/
			
		} else if (location.length == 2) {
			Map<String, PlaceDTO> map = (Map<String, PlaceDTO>) req.getServletContext().getAttribute("PlaceAll");
			req.setAttribute("location", map.get(location[1].toUpperCase()));
			modelAndView.setPath("/place.jsp");
		} else {
			modelAndView.setPath(req.getRequestURI());
		}
		return modelAndView;
	}
}