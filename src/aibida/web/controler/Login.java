package aibida.web.controler;

import com.opensymphony.xwork2.ActionSupport;


public class Login extends ActionSupport {
	private static final long serialVersionUID = 1L;
       

	public String execute() throws Exception {
		return SUCCESS;
	}
	public String orLogin() {
		return "orLogin_S";
	}


}
