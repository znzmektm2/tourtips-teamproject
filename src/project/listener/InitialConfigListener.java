package project.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import project.controller.Controller;
import project.model.service.ProjectService;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

@WebListener()
public class InitialConfigListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        /**
         * ActionMapping.properties에 저장된 Action 클래스들을 
         * 서버가 스타트될 때 사용할 객체를 생성해서 Map 에 저장
         */
        ServletContext application = sce.getServletContext();
        Map<String, Controller> map = new HashMap<>();

        ResourceBundle rb = ResourceBundle.getBundle(application.getInitParameter("fileName"));

        for (String key : rb.keySet()) {
            System.out.println(key + " = " + rb.getString(key));

            try {
                Controller classObj = (Controller) Class.forName(rb.getString(key)).newInstance();
                map.put(key, classObj);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        application.setAttribute("userActionMap", map);
        
        /**
         * 서버에 저장될 기본 정보 저장.
         */
        application.setAttribute("rootPath", application.getContextPath());
        ProjectService service = new ProjectService();
        application.setAttribute("CityAll", service.selectAllCity());
        application.setAttribute("PlaceAll", service.selectAllPlace());
        
    }

    public void contextDestroyed(ServletContextEvent sce) {

    }
}
