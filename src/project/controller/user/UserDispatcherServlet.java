package project.controller.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.controller.Controller;
import project.controller.ModelAndView;


/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("/join")
public class UserDispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Map<String,Controller> map;

	@Override
	public void init() throws ServletException {
		ServletContext application = super.getServletContext();
		map = (Map<String, Controller>) application.getAttribute("actionMap");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("command");
		System.out.println(key);
		if(key == null) {
			key = "list";
		}
		System.out.println(key);
		Controller controller = map.get(key);
		ModelAndView mv = controller.handleRequest(request, response);
		
		if(mv.isRedirect()) {
			response.sendRedirect(mv.getPath());
		}else {
			request.getRequestDispatcher(mv.getPath()).forward(request, response);
		}
	}
}
