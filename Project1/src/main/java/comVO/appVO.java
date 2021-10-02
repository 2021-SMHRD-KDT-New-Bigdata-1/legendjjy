package comVO;

public class appVO {
	
	private int app_seq;
	private String user_email;
	private String require;
	private int design;
	private String date;
	
	public appVO(int app_seq, String user_email, String require, int design, String date) {
		super();
		this.app_seq = app_seq;
		this.user_email = user_email;
		this.require = require;
		this.design = design;
		this.date = date;
	}

	public int getApp_seq() {
		return app_seq;
	}

	public void setApp_seq(int app_seq) {
		this.app_seq = app_seq;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getRequire() {
		return require;
	}

	public void setRequire(String require) {
		this.require = require;
	}

	public int getDesign() {
		return design;
	}

	public void setDesign(int design) {
		this.design = design;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
