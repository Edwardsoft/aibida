package aibida.web.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aibida.web.dao.IVolunteer;
import aibida.web.dao.IVolunteerOrder;
import aibida.web.dao.impl.VolunteerImpl;
import aibida.web.dao.impl.VolunteerOrderImpl;
import aibida.web.domain.Volunteer;

/**
 * Servlet implementation class VolunteerOrderServlet
 */
@WebServlet("/VolunteerOrderServlet")
public class VolunteerOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method=request.getParameter("method");
		if(method==null) {
			
		}else if(method.equals("addVolunteerOrderServlet")) {
			int user_id=Integer.parseInt(request.getParameter("user_id"));
			int project_id=Integer.parseInt(request.getParameter("project_id"));
			int sex=Integer.parseInt(request.getParameter("sex"));
			String name=request.getParameter("name");
			String telephone=request.getParameter("telephone");
			IVolunteerOrder iVolunteerOrder=new VolunteerOrderImpl();
			IVolunteer iVolunteer=new VolunteerImpl();
			Volunteer volunteer=iVolunteer.getVolunteer(project_id);
			int type=volunteer.getType();
			iVolunteer.decreaseAmount(project_id, sex, type);
			iVolunteerOrder.addVolunteerOrder(user_id, project_id,name,telephone,sex);
			response.getWriter().write("true");
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
