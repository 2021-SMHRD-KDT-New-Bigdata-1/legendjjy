package comVO;

public class commentVO {

	private int reply_seq;
	private int diary_seq;
	private String comment_conter;
	private int comment_date;
	private String user_email;

	public commentVO(int reply_seq, int diary_seq, String comment_conter, int comment_date, String user_email) {
		super();
		this.reply_seq = reply_seq;
		this.diary_seq = diary_seq;
		this.comment_conter = comment_conter;
		this.comment_date = comment_date;
		this.user_email = user_email;
	}
	
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	public int getDiary_seq() {
		return diary_seq;
	}
	public void setDiary_seq(int diary_seq) {
		this.diary_seq = diary_seq;
	}
	public String getComment_conter() {
		return comment_conter;
	}
	public void setComment_conter(String comment_conter) {
		this.comment_conter = comment_conter;
	}
	public int getComment_date() {
		return comment_date;
	}
	public void setComment_date(int comment_date) {
		this.comment_date = comment_date;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	
	
}
