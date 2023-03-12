package bookae.util;

public class PagingVO {
	private int nowPage; //현재페이지
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private int total; //게시글 총 개수
	private int cntPerPage=8; //페이지당 글 개수
	private int lastPage; //마지막페이지
	private int start; //SQL쿼리에 쓸 rownum의 start
	private int end; //SQL쿼리에 쓸 rownum의 end
	
	private int cntPage=5; //페이지들을 몇개 보일건지
	
	private String head; //검색 select option
	private String search_community; //검색 키워드
	
	public PagingVO() {
		
	}
	
	//제일 마지막 페이지 계산
	public void calcLastPage(int total) {
		setLastPage((int)Math.ceil((double)total / (double)cntPerPage));
		//ex) total이 11, 8개씩 보여지고 싶다면, 11/8=1.3 => ceil은 올림 함수니까 2가 됨.
	}
	
	//시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage) {//현재페이지 몇개씩보여줄지
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		//현재페이지가 1, 한번에 보여지는 페이지갯수가 5, 1 / 5 = 0.2 => 1 ==> 1*5 = 5
		//현재페이지가 7, 한번에 보여지는 페이지갯수가 5, 7 / 5 = 1.4 => 2 ==> 2*5 = 10
		
		if(getLastPage() < getEndPage()) {//lastPage는 위 함수에서 구함
			setEndPage(getLastPage());
		}//lastpage가 2고, endpage가 5면 endpage=2
		//lastpage가 7고, endpage가 (현재페이지가 1이라) 5면 endpage=5
		
		setStartPage(getEndPage() - cntPage +1);
		//endpage가 5면, 5-5+1 = 1
		//endpage가 10이면, 10 -5 +1 =6
		//endpage가 7이면, 7 -5 +1 =3
		
		if(getStartPage() < 1) {
			setStartPage(1);
			//endpage가 5보다 작으면 startpage가 음수가 되어버리니까 이럴경우엔 1로 초기화.
		}
	}
	
	//DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage) {
		//nowPage가 4이고 cntPerPage가 8이라면
		setEnd(nowPage*cntPerPage);
		//4*8 =32
		setStart(getEnd() - cntPerPage +1);
		//32-8+1 = 25
		//=> 25번 게시글부터 32번 게시글까지
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getSearch_community() {
		return search_community;
	}

	public void setSearch_community(String search_community) {
		this.search_community = search_community;
	}

	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + ", head=" + head + ", search_community=" + search_community + "]";
	}

}
