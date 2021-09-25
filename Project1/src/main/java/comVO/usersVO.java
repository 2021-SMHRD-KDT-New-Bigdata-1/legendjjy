package comVO;

public class usersVO {
	
	private String user_email;
	private String user_nick;
	private String admin_yn;
	
	public usersVO(String user_email, String user_nick, String admin_yn) {
		super();
		this.user_email = user_email;
		this.user_nick = user_nick;
		this.admin_yn = admin_yn;
		
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getAdmin_yn() {
		return admin_yn;
	}

	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}
	
}
