package bean;

import java.text.DecimalFormat;
import java.util.Calendar;

public class Page {
	//페이징 처리 위한 클래스  
	int totListSize; //검색된 결과의 전체 건수 ex) 101건의 데이터
	int totPage;// 만들어질 페이지의 갯수 ex) 101/10 -> 10페이지+1페이지 ->11페이지
	int listSize=5; //한 페이지 당 튜플 갯수 ex) 10
	int nowPage=1; //현재 페이지 
	int startNo; //한 페이지의 시작 no(튜플?) ->쿼리 날릴떄 사용 ex)1  
	int endNo;//한 페이지의 끝 no ->쿼리 날릴때 사용  ex)10
	int blockSize=5; //한번에 로딩되는 페이지 수? 페이지 아래에 <1 2 3 4 5 6 7 8 9 10>
	int startPage; //block의 시작 ex) 1->6->11 ... 
	int endPage;//block의 끝  ex)5 ->10 ->15...
	String findStr = "";
	String year;// 올해 년도 
	
	public Page() {}
	public Page(int tot, int now) {
		this.totListSize =tot;
		this.nowPage=now;
		pageCompute(); //객체 생성되는 순간 모든 필드 셋팅됨 
	}
	
	public void pageCompute() {
		//몇건의 튜플을 보여줄 것인지 계산 하는 로직
		totPage = (int)Math.ceil(totListSize/(double)listSize);
		endNo = nowPage*listSize; //첫페이지에서 10 둘째 페이지에서 20 ...
		startNo = endNo - listSize+1; //첫페이지에서 1 둘째 페이지에서 11 ...\
		if(endNo>totListSize) {
			endNo = totListSize; // 만약 전체 건수가 23건인경우 마지막 페이지에는 20~23까지의 튜플만 나와야 함
		}
		endPage = (int)Math.ceil(nowPage/(double)blockSize)*blockSize; //현재페이지가 1~5인경우 항상5, 6~10인경우 항상10이 나옴
		startPage = endPage-blockSize+1; // 현재페이지가 1~5인경우 항상 1, 6~10인경우 항상 6나옴
		
		if(endPage>totPage) {
			endPage =totPage;//만약 전체 페이지가 16페이지인경우 마지막 페이지는 16만 나와야 하기때문 
		}
		
		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		String year  = df.format(currentCalendar.get(Calendar.YEAR));
		this.year = year;
		
		
	}
	
	
	
	
	
	
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public int getBlockSize() {
		return blockSize;
	}
	
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
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
	public int getTotListSize() {
		return totListSize;
	}
	public void setTotListSize(int totListSize) {
		this.totListSize = totListSize;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
 	
	

}
