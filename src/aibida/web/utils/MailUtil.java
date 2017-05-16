package aibida.web.utils;

import java.net.URL;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;


public class MailUtil {
	public static void main(String[] args) {
		HtmlEmail email=new HtmlEmail();
		email.setHostName("smtp.163.com");
		email.setAuthentication("aibidaa@163.com", "Li202202");
		try {
			email.addTo("1240822303@qq.com","李巧巧");
			email.setFrom("aibidaa@163.com", "李巧巧");
			email.setSubject("第一封java邮件");
			
			URL url=new URL("http://www.apache.org/images/ac2004us_logo_only.gif");
			String cid=email.embed(url, "Apache logo");
			email.setHtmlMsg("<html>The apache logo -<img src=\"cid:"+cid+"\"><a href='http://localhost:8080/struts2_e25'>sdf.action</a> </html>");
			email.setTextMsg("Your email cilent does not support message");
			email.send();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
