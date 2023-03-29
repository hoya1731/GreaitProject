package VO;

public class YoutubeCrawlingVO {
	private	String imgSrc;
	private String href;
	private String title;
	
	public YoutubeCrawlingVO() {
	}
	
	public YoutubeCrawlingVO(String imgSrc, String href, String title) {
		this.imgSrc = imgSrc;
		this.href = href;
		this.title = title;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}