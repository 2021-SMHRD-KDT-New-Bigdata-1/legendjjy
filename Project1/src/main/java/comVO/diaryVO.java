package comVO;

public class diaryVO {
	
	private String title;
	private String content;
	private String imageURL;
	private String hash_tag;
	private String open_yn;
	private String commet_yn;
	
	public diaryVO(String title, String content, String imageURL, String hash_tag, String open_yn, String commet_yn) {
		super();
		this.title = title;
		this.content = content;
		this.imageURL = imageURL;
		this.hash_tag = hash_tag;
		this.open_yn = open_yn;
		this.commet_yn = commet_yn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
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

	public String getCommet_yn() {
		return commet_yn;
	}

	public void setCommet_yn(String commet_yn) {
		this.commet_yn = commet_yn;
	}
	
	
	
}
