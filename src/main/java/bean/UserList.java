package bean;

public class UserList {
	String status;
	String streamer;
	String mid;

	public UserList() {
		System.out.println("userlist constructor");
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStreamer() {
		return streamer;
	}
	public void setStreamer(String streamer) {
		this.streamer = streamer;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
}
