package biofarm_j2f;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usr = request.getParameter("name");
		String pwd = request.getParameter("password");
		
		//Session
		HttpSession session = request.getSession(true);
		session.setMaxInactiveInterval(5 * 60);	
		session.setAttribute("usr", usr);
		session.setAttribute("pwd", pwd);
		
		PostgresConnection conn = new PostgresConnection();
		int userId = 0;
		
		userId = conn.CheckFarmerId(usr, pwd);
		String encodedURL = null;
		if(userId == 0) {
			userId = conn.CheckCustomerId(usr, pwd);
			if(userId != 0) {
				session.setAttribute("customerId", userId);
				encodedURL = response.encodeRedirectURL("dashboard_customer.jsp");	//TODO
				System.out.println("Customer");
			}
		}else if(userId != 0){
			session.setAttribute("farmerId", userId);
			encodedURL = response.encodeRedirectURL("dashboard_farmer.jsp");	//TODO
			System.out.println("Farmer");
			
		}
		if(userId == 0) {
			encodedURL = response.encodeRedirectURL("ups.html");
		}
		
		response.sendRedirect(encodedURL);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
