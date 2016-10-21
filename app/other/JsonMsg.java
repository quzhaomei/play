package other;

public class JsonMsg {
	public Integer status;
	public String message;
	public Object data;
	public JsonMsg() {
		super();
	}
	public JsonMsg(Integer status, String message,Object data) {
		super();
		this.status = status;
		this.message = message;
		this.data=data;
	}
	
}
