package stream_uk;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
@Controller
public class WsConfig implements WebSocketConfigurer{

	@Autowired
	Handler handler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(handler, "/cht").addInterceptors(new HttpSessionHandshakeInterceptor()).setAllowedOrigins ( "*");
	}

	/*@Bean
    public WebSocketHandler myHandler() {
        return new Handler();
    }*/
}
