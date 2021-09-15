#!/usr/bin/python3

from http.server import BaseHTTPRequestHandler, HTTPServer

class RelayServer(BaseHTTPRequestHandler):
    def do_GET(self):
        x, a, b, c = self.path.split("/")
        with open('/var/run/relay_server', 'w') as f:
            f.write(a + ',' + b + ',' + c + '\n')
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write("ok".encode("utf8"))

print("HTTP Server listening on port 8492")
HTTPServer(("0.0.0.0", 8492), RelayServer).serve_forever()
