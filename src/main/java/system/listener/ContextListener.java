package system.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class ContextListener implements ServletContextListener {


    public ContextListener() {
        
    }


    public void contextDestroyed(ServletContextEvent arg0)  { 
    	System.out.println("=======ServletContextListener destroyed======");
    }


    public void contextInitialized(ServletContextEvent event)  { 
    	System.out.println("=======ServletContextListener started======");
    	ServletContext ctx = event.getServletContext();
    	String ctxPath = ctx.getContextPath();
    	ctx.setAttribute("ctx", ctxPath);
    	System.out.println(ctxPath);
    }
	
}
