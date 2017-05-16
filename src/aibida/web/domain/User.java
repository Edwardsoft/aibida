package aibida.web.domain;


//�����û���
public class User {
	private int id;               //id号
	private String userName;      //用户名
	private String passWord;      //密码
	private String telephone;     //手机号ַ
	private String email;         //电子邮箱
	private int rank;             //积分
	private String qq;            //QQ
	private String wechat;        //微信
	private int isCheck;          //是否验证邮箱
	private String nickname;
	public int getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(int isCheck) {
		this.isCheck = isCheck;
	}

	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getMicroblog() {
		return microblog;
	}

	public void setMicroblog(String microblog) {
		this.microblog = microblog;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	private String microblog;         //微博号
	private String avatar;        //头像路径
	
	public User(){
		super();
	};
	
	public User(int id, String userName, String passWord, String telephone, String email,
			int rank,String qq,String wechat,String microblog,String avatar,int isCheck,String nickname) {
		super();
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.telephone = telephone;
		this.email = email;
		this.rank = rank;
		this.qq=qq;
		this.microblog=microblog;
		this.avatar=avatar;
		this.wechat=wechat;
		this.isCheck=isCheck;
		this.nickname=nickname;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}


	public String getQq() {
		return qq;
	}


	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
}
