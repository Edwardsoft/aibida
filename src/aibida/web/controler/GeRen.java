package aibida.web.controler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aibida.web.dao.IEvaluate;
import aibida.web.dao.IOrder;
import aibida.web.dao.IVolunteerOrder;
import aibida.web.dao.impl.EvaluateImpl;
import aibida.web.dao.impl.OrderIpml;
import aibida.web.dao.impl.VolunteerOrderImpl;
import aibida.web.domain.Evaluate;
import aibida.web.domain.Order;
import aibida.web.domain.User;
import aibida.web.domain.VolunteerOrder;

/**
 * Servlet implementation class GeRen
 */
@WebServlet("/geren")
public class GeRen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeRen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getSession().getAttribute("user")==null) {
			request.getRequestDispatcher("user_error.jsp").forward(request, response);
		}
		User user=(User)request.getSession().getAttribute("user");
		int user_id=user.getId();
		IOrder iorder=new OrderIpml();
		ArrayList<Order> orders=iorder.getOrder(user_id);
		if(!orders.isEmpty()) {
			request.setAttribute("orders",orders);
		}
		IEvaluate ievaluate=new EvaluateImpl();
		ArrayList<Evaluate> evaluates=ievaluate.getAllEvaluate(user_id);
		if(!evaluates.isEmpty()) {
			request.setAttribute("evaluates",evaluates);
		}
		IVolunteerOrder iVolunteerOrder=new VolunteerOrderImpl();
		ArrayList<VolunteerOrder> volunteerOrders=iVolunteerOrder.getVolunteerOrders(user_id);
		if(!volunteerOrders.isEmpty()) {
			request.setAttribute("volunteerOrders",volunteerOrders);
		}
		request.getRequestDispatcher("geren.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
