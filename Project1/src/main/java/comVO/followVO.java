package comVO;

public class followVO {
	
	private int follow_seq;
	private String follow_email;
	
	public followVO(int follow_seq, String follow_email) {
		super();
		this.follow_seq = follow_seq;
		this.follow_email = follow_email;
	}
	
	public int getFollow_seq() {
		return follow_seq;
	}
	
	public void setFollow_seq(int follow_seq) {
		this.follow_seq = follow_seq;
	}
	
	public String getFollow_email() {
		return follow_email;
	}
	public void setFollow_email(String follow_email) {
		this.follow_email = follow_email;
	}

}
