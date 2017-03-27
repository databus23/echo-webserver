#!/usr/local/bin/ruby
require "webrick"
require "socket"

server = WEBrick::HTTPServer.new(:Port => ENV.fetch("PORT", 80))
server.mount_proc("/") do |req,res| 
  res.body << req.request_line.chomp + "\n"
  res.body << "Server Hostname: #{Socket.gethostname}\n"
  res.body << "Local IP: #{req.addr[3]}\n"
  res.body << "Remote IP: #{req.peeraddr[3]}\n"
  res.body << "Request headers:\n"
  res.body << req.header.collect{|k,v| ("%-20s -> %s" % [k, v.join(",")])}.join("\n")
  res.body << "\n"
end
server.start
