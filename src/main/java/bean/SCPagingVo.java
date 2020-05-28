package bean;

public class SCPagingVo {
    int totListSize; //검색된 전체 결과의 건수
    int totPage; //페이지 수
    int listSize = 16; //표시될 항목 수 n개씩 표현
    int blockSize = 5;
    int nowPage = 1; //현재페이지
    int startNo;
    int endNo;
    int startBlock;
    int endBlock;
    int endPage;
    int startPage;

    public SCPagingVo() {
    }

    public SCPagingVo(int tot, int now) {
        this.totListSize = tot;
        this.nowPage = now;
        // pageCompute();
    }

    public void pageCompute() {
        totPage = (int) Math.ceil(totListSize / (double) listSize);
        endNo = nowPage * listSize;
        startNo = endNo - listSize + 1;

        if (endNo > totListSize) {
            endNo = totListSize;
        }
        //
        endPage = (int) Math.ceil(nowPage / (double) blockSize) * blockSize;
        startPage = endPage - blockSize + 1;

        if (endPage > totPage) endPage = totPage;
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
    public int getBlockSize() {
        return blockSize;
    }
    public void setBlockSize(int blockSize) {
        this.blockSize = blockSize;
    }
    public int getStartBlock() {
        return startBlock;
    }
    public void setStartBlock(int startBlock) {
        this.startBlock = startBlock;
    }
    public int getEndBlock() {
        return endBlock;
    }
    public void setEndBlock(int endBlock) {
        this.endBlock = endBlock;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
}
