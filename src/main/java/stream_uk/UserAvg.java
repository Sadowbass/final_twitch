package stream_uk;

import java.util.HashMap;
import java.util.Map;

public class UserAvg {

	Map<String, Integer>avg=new HashMap<String, Integer>();

	public void startAvg(String mid) {
		avg.put(mid, 0);
	}

	public void addAvg(String mid) { /*방송중인 스트리머방에 들어온 사람 숫자 추가해줄거임*/

		avg.put(mid, avg.get(mid)+1);
	}

	public void	subtractAvg(String mid) { /*방송중인 스트리머방에 나간 사람 빼줄거임*/
		avg.put(mid, avg.get(mid)-1);
	}

	public void deltAvg(String mid) {
		avg.remove(mid);
	}


}
