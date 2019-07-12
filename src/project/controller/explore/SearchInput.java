package project.controller.explore;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.controller.ModelAndView;
import project.model.dto.CityDTO;
import project.model.dto.PlaceDTO;

@WebServlet("/SearchInput")
public class SearchInput extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		

		String keyword = request.getParameter("keyWord");
		String path = "";
		
		Map<String, CityDTO> cityMap = (Map<String, CityDTO>) request.getServletContext().getAttribute("CityAll");
		Map<String, PlaceDTO> placeMap = (Map<String, PlaceDTO>) request.getServletContext().getAttribute("PlaceAll");
		
		for(String key : cityMap.keySet()) {
			System.out.println(keyword + " : " + cityMap.get(key).getName());
			if(cityMap.get(key).getName().contains(keyword)) {
				
				path = request.getServletContext().getContextPath() + "/dest/"+cityMap.get(key).getCityId();
				response.sendRedirect(path);
				return;
			}
		}
		for(String key : placeMap.keySet()) {
			System.out.println(keyword + " : " + placeMap.get(key).getName());
			if(placeMap.get(key).getName().contains(keyword)) {
				path = request.getServletContext().getContextPath() + "/dest/"+placeMap.get(key).getCityId() + "/" + placeMap.get(key).getId();
				System.out.println(path);
				response.sendRedirect(path);
				return;
			}	
		}
		path = request.getServletContext().getContextPath() + "/errorView/error.jsp";
		System.out.println(path);
		response.sendRedirect(path);
	}
}
