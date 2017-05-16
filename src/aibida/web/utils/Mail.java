package aibida.web.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	private static String from="aibidaa@sina.com";
	private static String nickname="爱必达";
	private static String username="aibidaa@sina.com";
	private static String password="li202202";
	private static String host="smtp.sina.com";
	
	public static MimeMessage createMail(Session session,String emailgetter,String user) {
		//创建邮箱对象
		MimeMessage message=new MimeMessage(session);
		try {
			//指定邮件发件人
			message.setFrom(new InternetAddress(from,nickname));
			
			//指定邮件收件人
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailgetter));
			
			//邮件标题
			message.setSubject("用户注册邮件");
			
			//邮件的文本内容
			message.setContent("亲爱的"+user+"<br/>还差一步，就能成为爱必达的一员啦。<br/>快！点击下面这个链接激活吧。<br/><a href='http://123.206.184.220//Email?method=activemail&user="+user+"'	>点击此处激活</a>","text/html;charset=utf-8");
			//发送日期
			message.setSentDate(new Date());
			
			message.saveChanges();

		}catch (Exception e) {
			e.printStackTrace();
		}
		return message;

	}
	
	public static void sendMail(String emailgetter,String user) {
		Properties prop=new Properties();
		prop.setProperty("mail.host", host);
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");
		

		//1、创建session
		Session session=Session.getInstance(prop);
		//开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
		session.setDebug(true);
	
		//2、通过session得到transport对象
		Transport ts=null;
		try {
			ts=session.getTransport();
		}catch (NoSuchProviderException e) {
			e.printStackTrace();
		}
		
		//3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人
		try {
			ts.connect(host,username,password);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		
		//4、创建邮件
		Message message=createMail(session,emailgetter,user);
		
		//5、发送邮件
		try {
			Address[] address=message.getAllRecipients();
			ts.sendMessage(message, address);
		}catch(MessagingException e) {
			e.printStackTrace();
		}finally {
			try {
				ts.close();
			}catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}

}
