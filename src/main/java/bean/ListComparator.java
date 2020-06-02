package bean;

import java.util.Comparator;

public class ListComparator implements Comparator{

	@Override
	public int compare(Object o1, Object o2) {
		int cnt1 = ((OnAirVo)o1).getCnt();
		int cnt2 = ((OnAirVo)o2).getCnt();
		
		if(cnt1 < cnt2) {
			return 1;
		}else if(cnt1 > cnt2){
			return -1;
		}else {
			return 0;
		}
	
	}
	
	
	

}
