package project.controller.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import project.model.dto.CommentDTO;
import project.model.dto.PlaceDTO;
import project.model.service.CommentService;
import project.model.service.CommentServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/CommentSelect")
public class CommentSelectByPlaceServlet extends HttpServlet {
	
	private CommentService service = CommentServiceImpl.getInstance();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PlaceDTO place = (PlaceDTO) request.getAttribute("location");
		List<CommentDTO> list = null;
		
		try {
			list = service.selectByPlaceId(place.getId());

			JSONArray jsonArr = JSONArray.fromObject(list);
	        response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	        out.println(jsonArr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
