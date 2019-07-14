package project.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.xml.crypto.KeySelector.Purpose;

import project.controller.Controller;
import project.model.dto.CityDTO;
import project.model.dto.CommentDTO;
import project.model.dto.PlaceDTO;
import project.model.dto.PopularLocationDTO;
import project.model.service.CommentService;
import project.model.service.CommentServiceImpl;
import project.model.service.ProjectService;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

@WebListener()
public class InitialConfigListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
    	System.out.println("Server Starts: contextInitialized");
        /**
         * ActionMapping.properties에 저장된 Action 클래스들을 
         * 서버가 스타트될 때 사용할 객체를 생성해서 Map 에 저장
         */
        ServletContext application = sce.getServletContext();
        Map<String, Controller> map = new HashMap<>();

        ResourceBundle rb = ResourceBundle.getBundle(application.getInitParameter("fileName"));

        for (String key : rb.keySet()) {
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
        CommentService commentService = new CommentServiceImpl();
        Map<String, CityDTO> cityMap = service.selectAllCity();
        Map<String, PlaceDTO> placeMap = service.selectAllPlace();
        Map<String, List<PopularLocationDTO>> popularMap = service.selectAllPopular();
        
        List<CommentDTO> comments = commentService.selectAll();
        Map<String, PopularLocationDTO> popularPlacesMap = service.selectAllPopularByPlaceId();
        
        Map<String, List<Integer>> placeRatingMap = new HashMap<>();
        for(CommentDTO dto : comments) {
        	if(!placeRatingMap.containsKey(dto.getPlaceId())) {
        		placeRatingMap.put(dto.getPlaceId(), new ArrayList<>());
        	}
        	placeRatingMap.get(dto.getPlaceId()).add(dto.getRating());
        }
        
        Map<String, Float> ratingMap = new HashMap<>();
        Set<String> placeKeies = placeRatingMap.keySet();
        for(String key : placeKeies) {
        	List<Integer> ratings = placeRatingMap.get(key);
        	int sum = 0;
        	for(int i : ratings) {
        		sum += i;
        	}
        	float avg =  Math.round( sum * 10f / ratings.size() ) / 10f;
        	ratingMap.put(key, avg);
        }
        
        List<PopularLocationDTO> placeRatings = new ArrayList<>();
        for(PopularLocationDTO dto : popularPlacesMap.values()) {
        	Float avg = ratingMap.get(dto.getPlaceId());
        	dto.setAvg(avg == null ? 0f : avg.floatValue());
        	placeRatings.add(dto);
        }
        
        Collections.sort(placeRatings, new Comparator<PopularLocationDTO>() {
			@Override
			public int compare(PopularLocationDTO o1, PopularLocationDTO o2) {
				return Float.valueOf(o2.getAvg()).compareTo(Float.valueOf(o1.getAvg()));
			}
		});
        
        
        application.setAttribute("CityAll", cityMap);
        application.setAttribute("Cities", cityMap.values());
        application.setAttribute("PlaceAll", placeMap); 
        application.setAttribute("PopularAll", popularMap); 
        application.setAttribute("placeRatings", placeRatings); 

    }

    public void contextDestroyed(ServletContextEvent sce) {

    }
}
