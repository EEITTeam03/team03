package system.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.AdminVO;
import com.memberinfo.model.MemberInfoVO;


@WebFilter(urlPatterns={"/start_reserve.jsp","/admin/*"})
public class LoginFilter implements Filter {


    public LoginFilter() {
        System.out.println("**********LoginFilter initialized**********");
    }


	public void destroy() {
		 System.out.println("**********LoginFilter destroyed**********");
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpReq =(HttpServletRequest) request;
		HttpServletResponse httpResp = (HttpServletResponse) response;
		
		//System.out.println(httpReq.getServletPath());
		String path = httpReq.getServletPath();
		String loginPath = "/adminLogin/adminLogin.jsp";
		
		//判斷是否要求後台資源
		if(path.startsWith("/admin/") ) {
			AdminVO	adminVO	 = (AdminVO) httpReq.getSession().getAttribute("admin");
			//判斷是否有登入
			//沒登入-->NULL
			if (adminVO==null) {
				//httpReq.getSession().setAttribute("adminTarget", httpReq.getRequestURI());
				httpResp.sendRedirect(httpReq.getContextPath()+loginPath);
				return;
			} 
		} else {
		
			MemberInfoVO member = (MemberInfoVO) httpReq.getSession().getAttribute("memberInfo");
			//判斷他是否有登入，如果沒有---->導向登入頁面
			if(member==null) {
				httpReq.getSession().setAttribute("target", httpReq.getContextPath()+"/start_reserve.jsp");
				httpResp.sendRedirect(httpReq.getContextPath()+"/login.jsp");
			}
	//		httpReq.getSession().setAttribute("orginURL", httpReq.getRequestURI());
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		
	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
