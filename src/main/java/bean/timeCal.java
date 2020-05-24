package bean;


public class timeCal {

	
	
	public static void main(String[] args) {
		
	}
	
	public String getHHMMSS(int s) {
		int h = 0;
		int m = 0;
		try {
			if(s>=3600) {
				h = s/ 3600;
				s = s - (h * 3600);
			}
			if(s>=60) {
				m = s/60;
				s = s-(m*60);
			}
		}catch (Exception e) {
			return "00:00:00";
		}
		String HMS = "";
		if(h<10) {
			HMS += "0" + h + ":";
		}else {
			HMS = h + ":";
		}
		if(m<10) {
			HMS += "0" + m;
		}else {
			HMS += m;
		}
		HMS += ":";
		if(s<10) {
			HMS += "0" + s;
		}else {
			HMS += s;
		}
		return HMS;
		
	}

}
