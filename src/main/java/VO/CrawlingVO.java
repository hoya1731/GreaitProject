package VO;
// 3.16 재봉 VO 자체수정 

public class CrawlingVO {
	private String age;
	private String imgSrc; 
	private String title; 
	private String dScore; 
	private String dNum; 
	private String dDate; 
    private String clipTitle;
    private String clipImg;
    private String photo;
     
	 public CrawlingVO() {
	
	 }
    
	public CrawlingVO(String age, String imgSrc, String title, String dScore, String dNum, String dDate) {
		this.age = age;
		this.imgSrc = imgSrc;
		this.title = title;
		this.dScore = dScore;
		this.dNum = dNum;
		this.dDate = dDate;
	}

	public CrawlingVO(String clipTitle, String clipImg) {
		this.clipTitle = clipTitle;
		this.clipImg = clipImg;
	}
	
	public CrawlingVO(String photo) {
		this.photo = photo;
	}

	public CrawlingVO(String age, String imgSrc, String title, String dScore, String dNum, String dDate,
			String clipTitle, String clipImg, String photo) {
		this.age = age;
		this.imgSrc = imgSrc;
		this.title = title;
		this.dScore = dScore;
		this.dNum = dNum;
		this.dDate = dDate;
		this.clipTitle = clipTitle;
		this.clipImg = clipImg;
		this.photo = photo;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getdScore() {
		return dScore;
	}

	public void setdScore(String dScore) {
		this.dScore = dScore;
	}

	public String getdNum() {
		return dNum;
	}

	public void setdNum(String dNum) {
		this.dNum = dNum;
	}

	public String getdDate() {
		return dDate;
	}

	public void setdDate(String dDate) {
		this.dDate = dDate;
	}

	public String getClipTitle() {
		return clipTitle;
	}

	public void setClipTitle(String clipTitle) {
		this.clipTitle = clipTitle;
	}

	public String getClipImg() {
		return clipImg;
	}

	public void setClipImg(String clipImg) {
		this.clipImg = clipImg;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

}