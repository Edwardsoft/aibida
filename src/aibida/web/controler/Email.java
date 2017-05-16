package aibida.web.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aibida.web.dao.IUser;
import aibida.web.dao.impl.UserImpl;

/**
 * Servlet implementation class Email
 */
@WebServlet("/Email")
public class Email extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Email() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method=request.getParameter("method");
		String email=request.getParameter("email");
		if(method.equals("isused")) {
			IUser iuser=new UserImpl();
			boolean result=iuser.findUserByEmail(email);
			response.getWriter().write(result+"");
		}else if(method.equals("activemail")) {
			String username=request.getParameter("user");
			IUser iuser=new UserImpl();
			if(iuser.isCheck(username)) {
				response.sendRedirect("error.jsp");
			}else {
				iuser.activeUser(username);
				request.getRequestDispatcher("afteractived.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
