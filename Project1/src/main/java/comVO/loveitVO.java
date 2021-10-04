package comVO;

public class loveitVO {

	private String diary_image;
	private String user_email;
	private String diary_content;
	private int hits;
	private String diary_date;
	
	public loveitVO(String diary_image, String user_email, String diary_content, int hits, String diary_date) {
		super();
		this.diary_image = diary_image;
		this.user_email = user_email;
		this.diary_content = diary_content;
		this.hits = hits;
		this.diary_date = diary_date;
	}
	
	public String getDiary_image() {
		return diary_image;
	}

	public void setDiary_image(String diary_image) {
		this.diary_image = diary_image;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getDiary_content() {
		return diary_content;
	}

	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getDiary_date() {
		return diary_date;
	}

	public void setDiary_date(String diary_date) {
		this.diary_date = diary_date;
	}

	
	
}
