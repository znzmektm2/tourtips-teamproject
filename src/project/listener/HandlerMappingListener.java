package project.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import project.controller.Controller;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

@WebListener()
public class HandlerMappingListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        // 서버가 스타트될 때 사용할 객체를 생성해서 Map 에 저장
        ServletContext application = sce.getServletContext();
        Map<String, Controller> map = new HashMap<>();

        ResourceBundle rb = ResourceBundle.getBundle(application.getInitParameter("fileName"));

        for (String key : rb.keySet()) {
            System.out.println(key + " = " + rb.getString(key));

            try {
                // 문자열을 객체로 변환
                Controller classObj = (Controller) Class.forName(rb.getString(key)).newInstance();

                // map 에 저장
                map.put(key, classObj);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        application.setAttribute("map", map);
    }

    public void contextDestroyed(ServletContextEvent sce) {

    }
}
