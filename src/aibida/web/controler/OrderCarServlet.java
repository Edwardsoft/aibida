package aibida.web.controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aibida.web.dao.IItem;
import aibida.web.dao.impl.ItemImpl;
import aibida.web.domain.Item;

/**
 * Servlet implementation class OrderCarServlet
 */
@WebServlet("/OrderCarServlet")
public class OrderCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method=request.getParameter("method");
		if(method.equals("addCar")) {
			HashMap<String,String> orderCar=(HashMap<String, String>)request.getSession().getAttribute("orderCar");
			if(orderCar==null) {
				orderCar=new HashMap<String,String>();
				System.out.println("初始hashmap======"+orderCar);
			}
			System.out.println("fds"+orderCar.toString());
			String id=request.getParameter("id");
			String amount=request.getParameter("amount");
			System.out.println("id====="+id);
			System.out.println("amount======="+amount);
			System.out.println(orderCar.size());
			if(Integer.parseInt(amount)>0) {
				orderCar.put(id, amount);
				System.out.println("fds"+orderCar.toString());
				request.getSession().setAttribute("orderCar", orderCar);
			}else {
				orderCar.remove(id);
				request.getSession().setAttribute("orderCar", orderCar);
			}
			System.out.println(orderCar.size());
		}else if(method.equals("deleteOrderCar")){
			request.getSession().removeAttribute("orderCar");
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
