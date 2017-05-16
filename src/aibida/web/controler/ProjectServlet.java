package aibida.web.controler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aibida.web.dao.IEvaluate;
import aibida.web.dao.IItem;
import aibida.web.dao.IOrder;
import aibida.web.dao.IOrganazation;
import aibida.web.dao.IProject;
import aibida.web.dao.IUser;
import aibida.web.dao.impl.EvaluateImpl;
import aibida.web.dao.impl.ItemImpl;
import aibida.web.dao.impl.OrderIpml;
import aibida.web.dao.impl.OrganazationImpl;
import aibida.web.dao.impl.ProjectImpl;
import aibida.web.dao.impl.UserImpl;
import aibida.web.domain.Evaluate;
import aibida.web.domain.Item;
import aibida.web.domain.Order;
import aibida.web.domain.Organazation;
import aibida.web.domain.Project;
import aibida.web.domain.User;

/**
 * Servlet implementation class ProjectServlet
 */
@WebServlet("/ProjectServlet")
public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
