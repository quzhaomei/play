package websocket;


import java.util.HashMap;
import java.util.Map;

import play.libs.F.Callback;
import play.libs.F.Callback0;
import play.mvc.Controller;
import play.mvc.WebSocket;

/**
 * 点菜事件推送
 */
public class OrderNoticeSocket extends Controller{
	public static final String CLIENT="client";//点菜服务端
	public static final String SERVER="server";//订单显示端
	public static final Map<String, MyWebSocket<String>> SCOKET_MAP=
			new HashMap<String, MyWebSocket<String>>();
	public static WebSocket<String> index() {
		
		/**
		 * 传递新增的订单ID信息，再返回给订单显示端
		 */
		MyWebSocket<String> socket=
		   new MyWebSocket<String>() {
			@SuppressWarnings("rawtypes")
			MyWebSocket aim=this;
			
			
			@Override
			public void sendMsg(String data) {
				System.out.println("给服务端发送订单咯！");
				this.out.write(data);
			}
		   
		    public void onReady(WebSocket.In<String> in, 
		    		final WebSocket.Out<String> out) {
		    this.in=in;
		    this.out=out;
		    
		        in.onMessage(new Callback<String>() {
		           public void invoke(String event) {
		        	   System.out.println(event);
		        	   System.out.println("aim.name:"+aim.name);
		        	   if("login#000".equals(event)){
		        		   aim.name=CLIENT;
		        		   SCOKET_MAP.put(CLIENT, aim);
		        	   }else if("login#111".equals(event)){
		        		   aim.name=SERVER;
		        		   SCOKET_MAP.put(SERVER, aim);
		        	   }else if(CLIENT.equals(aim.name)&&
		        			   event.matches("\\d+")){//
		        		   System.out.println("匹配成功！准备发送");
		            	  MyWebSocket<String> server= SCOKET_MAP.get(SERVER);
		            	  System.out.println("server.name:"+server.name);
		            	  if(server!=null){
		            		  server.sendMsg(event);
		            	  }
		              }
		           } 
		        });
		        
		        in.onClose(new Callback0() {
					@Override
					public void invoke() throws Throwable {
						
					}
		        });
		    }

			
		};
		
		return socket;
}
}
