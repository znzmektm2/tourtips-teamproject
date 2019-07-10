package project.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.controller.explore.ExploreController;

import java.io.IOException;
import java.util.Map;

@SuppressWarnings("serial")
@WebServlet("/dest/*")
public class DispatcherServlet extends HttpServlet {

    Map<String, Controller> map;
    
    @SuppressWarnings("unchecked")
	@Override
    public void init() throws ServletException {

        ServletContext application = super.getServletContext();
        map = (Map<String, Controller>) application.getAttribute("map");
    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ModelAndView modelAndView = new ExploreController().handleRequest(req, resp);
		req.getRequestDispatcher(modelAndView.getPath()).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String key = req.getParameter("command");
//        if(key == null) key = "list";
//
//        Controller controller = map.get(key);
//
//        ModelAndView modelAndView = controller.handleRequest(req,resp);
//
//        if(modelAndView.isRedirect()) {
//            resp.sendRedirect(modelAndView.getPath());
//        } else {
//            req.getRequestDispatcher(modelAndView.getPath()).forward(req, resp);
//        }
	} 
}
