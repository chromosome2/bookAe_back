package bookae.community.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("communityVO")
public class CommunityVO {
	//감상평 게시판
	private int board_num;
	private String board_title;
	private String id;
	private int board_like;
	private int board_view;
	private String board_genre;
	private Date board_date;
	private String board_content;
	private String nickname;
	private boolean likeIs;
	
	//댓글
	private int comment_num; //댓글 넘버
	private Date comment_date; //댓글 날짜
	private int comment_parent; //답글이 어디 소속인지
	private int comment_annot; //답글의 주인
	private String comment_content; //답글 내용
	private String annot_nickname; //답글 주인의 닉네임
	private int deleteis;
	
	//매거진 게시판
	private int magazine_num;
	private String magazine_title;
	private int magazine_view;
	private String magazine_genre;
	private Date magazine_date;
	private String magazine_content;
	private String magazine_image;
	
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public int getBoard_view() {
		return board_view;
	}
	public void setBoard_view(int board_view) {
		this.board_view = board_view;
	}
	public String getBoard_genre() {
		return board_genre;
	}
	public void setBoard_genre(String board_genre) {
		this.board_genre = board_genre;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public boolean getLikeIs() {
		return likeIs;
	}
	public void setLikeIs(boolean likeIs) {
		this.likeIs = likeIs;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public int getComment_parent() {
		return comment_parent;
	}
	public void setComment_parent(int comment_parent) {
		this.comment_parent = comment_parent;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getComment_annot() {
		return comment_annot;
	}
	public void setComment_annot(int comment_annot) {
		this.comment_annot = comment_annot;
	}
	public String getAnnot_nickname() {
		return annot_nickname;
	}
	public void setAnnot_nickname(String annot_nickname) {
		this.annot_nickname = annot_nickname;
	}
	public int getDeleteis() {
		return deleteis;
	}
	public void setDeleteis(int deleteis) {
		this.deleteis = deleteis;
	}
	public int getMagazine_num() {
		return magazine_num;
	}
	public void setMagazine_num(int magazine_num) {
		this.magazine_num = magazine_num;
	}
	public String getMagazine_title() {
		return magazine_title;
	}
	public void setMagazine_title(String magazine_title) {
		this.magazine_title = magazine_title;
	}
	public int getMagazine_view() {
		return magazine_view;
	}
	public void setMagazine_view(int magazine_view) {
		this.magazine_view = magazine_view;
	}
	public String getMagazine_genre() {
		return magazine_genre;
	}
	public void setMagazine_genre(String magazine_genre) {
		this.magazine_genre = magazine_genre;
	}
	public Date getMagazine_date() {
		return magazine_date;
	}
	public void setMagazine_date(Date magazine_date) {
		this.magazine_date = magazine_date;
	}
	public String getMagazine_content() {
		return magazine_content;
	}
	public void setMagazine_content(String magazine_content) {
		this.magazine_content = magazine_content;
	}
	public String getMagazine_image() {
		return magazine_image;
	}
	public void setMagazine_image(String magazine_image) {
		this.magazine_image = magazine_image;
	}
	
	
	

}
