require 'socket'
server = TCPServer.new 4567

while session = server.accept
  request = session.gets
  puts request

  session.print "HTTP/1.1 200\n"
  session.print "Content-Type: application/javascript\n"
  session.print "Content-Length: 0\n"
  session.print "Content-Encoding: gzip\n"
  session.print "X-Accel-Redirect: /__sendfile/pre_gzipped_asset.js.gz\n"
  session.print "\n"

  session.close
end
