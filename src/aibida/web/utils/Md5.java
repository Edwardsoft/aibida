package aibida.web.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;





	
public class Md5 {
	public static String EncodingByMd5(String str) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(str.getBytes());
			byte b[] = md5.digest();
			int i;
			StringBuffer buf = new StringBuffer("");  
            for (int offset = 0; offset < b.length; offset++) {  
                i = b[offset];  
                if (i < 0)  
                    i += 256;  
                if (i < 16)  
                    buf.append("0");  
                buf.append(Integer.toHexString(i));  
            } 
            System.out.println(buf.toString());
            return buf.toString();
		}catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
            return null;  
        }  
	}
}
