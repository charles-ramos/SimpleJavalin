package server;

import io.javalin.Javalin;
public class Server {

    private static final int port = 9443;
    public static void main(String[] args) {
        var app = Javalin.create(conf -> {
                    conf.bundledPlugins.enableDevLogging();
                    conf.jetty.defaultPort = port;
            })
                .get("/", ctx -> ctx.result("Hello World"))
                .start(port);
    }
}