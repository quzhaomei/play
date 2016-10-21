package websocket;

import play.mvc.WebSocket;
/**
 * 扩展原始WEBSOCKET功能
 * @author Administrator
 *
 * @param <T>
 */
public abstract class MyWebSocket<T> extends WebSocket<T> {
	public WebSocket.In<T> in;
	public WebSocket.Out<T> out;
	public String name;
	public abstract void sendMsg(T t);
}
