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
import net.sf.json.JSONObject;
import project.model.dto.CommentDTO;
import project.model.dto.PlaceDTO;
import project.model.service.CommentService;
import project.model.service.CommentServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/CommentSelectByPlace")
public class CommentSelectByPlaceServlet extends HttpServlet {

	private CommentService service = CommentServiceImpl.getInstance();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CommentSelectByPlaceServletCalled");
		String placeId = request.getParameter("placeId");

		try {
			List<CommentDTO> list = service.selectByPlaceId(Integer.parseInt(placeId));
			int[] rating = service.ratings(Integer.parseInt(placeId));
			
			JSONArray jsonArr = JSONArray.fromObject(list);
			JSONObject finalObj = new JSONObject();
			finalObj.put("list",jsonArr);
			finalObj.put("ratings", JSONArray.fromObject(rating));
			System.out.println(jsonArr);
			System.out.println(finalObj);
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(finalObj);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
