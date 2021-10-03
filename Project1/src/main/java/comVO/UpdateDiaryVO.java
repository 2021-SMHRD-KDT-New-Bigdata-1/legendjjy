package comVO;

public class UpdateDiaryVO {
	private int diary_seq;
	private String diary_title;
	private String diary_image;
	private String diary_content;
	private String hash_tag;
	private String open_yn;
	private String comment_yn;
	
	public UpdateDiaryVO(int diary_seq, String diary_title, String diary_image, String diary_content,
			String hash_tag, String open_yn, String comment_yn) {
		super();
		this.diary_seq = diary_seq;
		this.diary_title = diary_title;
		this.diary_image = diary_image;
		this.diary_content = diary_content;
		this.hash_tag = hash_tag;
		this.open_yn = open_yn;
		this.comment_yn = comment_yn;
	}

	public int getDiary_seq() {
		return diary_seq;
	}

	public void setDiary_seq(int diary_seq) {
		this.diary_seq = diary_seq;
	}

	public String getDiary_title() {
		return diary_title;
	}

	public void setDiary_title(String diary_title) {
		this.diary_title = diary_title;
	}

	public String getDiary_image() {
		return diary_image;
	}

	public void setDiary_image(String diary_image) {
		this.diary_image = diary_image;
	}

	public String getDiary_content() {
		return diary_content;
	}

	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}

	public String getHash_tag() {
		return hash_tag;
	}

	public void setHash_tag(String hash_tag) {
		this.hash_tag = hash_tag;
	}

	public String getOpen_yn() {
		return open_yn;
	}

	public void setOpen_yn(String open_yn) {
		this.open_yn = open_yn;
	}

	public String getComment_yn() {
		return comment_yn;
	}

	public void setComment_yn(String comment_yn) {
		this.comment_yn = comment_yn;
	}
}
