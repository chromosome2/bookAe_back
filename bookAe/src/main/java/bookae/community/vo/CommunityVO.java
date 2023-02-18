package bookae.community.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("communityVO")
public class CommunityVO {
	private int board_num;
	private String board_title;
	private String id;
	private int board_like;
	private int board_view;
	private String board_genre;
	private Date board_date;
	private String board_content;
	private String board_pic_name;
	private int board_pic_size;
	private String nickname;
	
	private int commend_num;
	private Date commend_date;
	private int commend_parent;
	private String commend_content;
	
	
	
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
	public String getBoard_pic_name() {
		return board_pic_name;
	}
	public void setBoard_pic_name(String board_pic_name) {
		this.board_pic_name = board_pic_name;
	}
	public int getBoard_pic_size() {
		return board_pic_size;
	}
	public void setBoard_pic_size(int board_pic_size) {
		this.board_pic_size = board_pic_size;
	}
	public int getCommend_num() {
		return commend_num;
	}
	public void setCommend_num(int commend_num) {
		this.commend_num = commend_num;
	}
	public Date getCommend_date() {
		return commend_date;
	}
	public void setCommend_date(Date commend_date) {
		this.commend_date = commend_date;
	}
	public int getCommend_parent() {
		return commend_parent;
	}
	public void setCommend_parent(int commend_parent) {
		this.commend_parent = commend_parent;
	}
	public String getCommend_content() {
		return commend_content;
	}
	public void setCommend_content(String commend_content) {
		this.commend_content = commend_content;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	

}
