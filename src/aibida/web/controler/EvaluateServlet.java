package aibida.web.controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aibida.web.dao.IEvaluate;
import aibida.web.dao.IOrder;
import aibida.web.dao.impl.EvaluateImpl;
import aibida.web.dao.impl.OrderIpml;
import aibida.web.domain.Evaluate;
import aibida.web.domain.Order;

/**
 * Servlet implementation class Evaluate
 */
@WebServlet("/EvaluateServlet")
public class EvaluateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvaluateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		if(method.equals("evaluate")) {
			int id=Integer.parseInt(request.getParameter("id"));
			IOrder iorder=new OrderIpml();
			Order order=iorder.getOrderByid(id);
			request.setAttribute("order", order);
			request.getRequestDispatcher("evaluate.jsp").forward(request, response);
		}else if(method.equals("addEvaluate")) {
			int order_id=Integer.parseInt(request.getParameter("order_id"));
			int point=Integer.parseInt(request.getParameter("point"));
			String evaluation=request.getParameter("evaluation");
			Evaluate evaluate=new Evaluate();   //
			evaluate.setOrder_id(order_id);     //
			evaluate.setPoint(point);
			evaluate.setEvaluation(evaluation);
			IEvaluate ievaluate=new EvaluateImpl();
			
			
			ievaluate.addEvaluate(evaluate);   //
			
			
			IOrder iorder=new OrderIpml();    //
			
			
			iorder.changeStatus(9, order_id);   //
			response.getWriter().write("true");
			
			
		}else if(method.equals("showevaluate")) {
			int order_id=Integer.parseInt(request.getParameter("order_id"));
			IEvaluate iEvaluate=new EvaluateImpl();
			Evaluate evaluate=iEvaluate.getEvaluate(order_id);
			request.setAttribute("evaluate", evaluate);
			request.getRequestDispatcher("showevaluate.jsp").forward(request, response);
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
