import httpbin;
import requests;
import std.experimental.logger;

version(vibeD) {
}
else {
    unittest {
        globalLogLevel(LogLevel.info);
        auto s = httpbinApp();
        scope (exit) {
            s.stop();
        }
        s.start();
        auto rq = Request();
        rq.keepAlive = false;
        auto rs = rq.get("http://localhost:8081/get");
        assert(rs.code == 200);
    }
}
