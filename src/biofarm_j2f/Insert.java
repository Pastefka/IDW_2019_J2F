package biofarm_j2f;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		int farmerId = (int) session.getAttribute("farmerId");
		
		String pName = (String) request.getParameter("pname");
		int amount = Integer.parseInt((String)request.getParameter("pamount"));
		float price = Float.parseFloat((String)request.getParameter("pprice"));
		
		PostgresConnection conn = new PostgresConnection();
		int pId = conn.selectProductId(pName);
		if(pId != 0)
			conn.insertMyProduct(farmerId, pId, amount, price);		
		
		String encodedURL = response.encodeRedirectURL("dashboard_farmer.jsp");
		response.sendRedirect(encodedURL);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
