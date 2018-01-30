package chatting;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket/chat")
public class ChatServer {

	private static List<ChatServer> clients = new ArrayList<ChatServer>();
	private Session session;
	private String name;
	private String[] splitMsg = null;
	
	public ChatServer() {
		String threadName = "Thread Name : " + Thread.currentThread().getName();
		System.out.println(threadName + " : 서버 시작");
	}

	@OnOpen
	public void start(Session session) {
		System.out.println("클라이언트 접속 : " + session);
		this.session = session;
		clients.add(this);
		String message = "채팅이 시작되었습니다.";
		broadcast(message);
	}

	@OnClose
	public void end() {
		clients.remove(this);
		String message = name + "님이 종료했습니다.";
		broadcast(message);
	}

	@OnMessage
	public void incoming(String msg) {
		if (msg == null || msg.trim().equals(""))
			return;
		
		splitMsg = msg.split(" : ");
		name = splitMsg[1];
		String message = msg;
		broadcast(message);
	}

	@OnError
	public void error(Throwable t) throws Throwable {
		System.out.println("에러발생 : " + t.toString());
	}

	public void broadcast(String message) {
		for (int i = 0; i < clients.size(); i++) {
			ChatServer client = clients.get(i);
			
			try {
				synchronized (client) {
					client.session.getBasicRemote().sendText(message);
				}
			} catch (IllegalStateException e) {
				// 메세지 송신중인 동시에 수신을 하는 경우
				// 강제로 스레드를 재워야함
				// 멈출 우려가 있다
				if (e.getMessage().indexOf("[TEXT_FULL_WRITING]") != -1) {
					new Thread() {
						public void run() {
							while (true) {
								try {
									client.session.getBasicRemote().sendText(message);
									break; // 없으면 infinite loop
								} catch (IllegalStateException ee) {
									try {
										Thread.sleep(1000);
									} catch (InterruptedException ie) {
										ie.printStackTrace();
									}
								} catch (IOException ie) {
									ie.printStackTrace();
								}
							}
						}
					}.start();
				}

			} catch (Exception e) {
				System.out.println("강제 종료 : " + e.getMessage());
				clients.remove(this);
				try {
					client.session.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}

				String msg = name + "강제 종료 했습니다.";
				broadcast(msg);
			}
		}
	}
} // class