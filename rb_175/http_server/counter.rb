require 'socket'

def parse_request_line(request_line)
  http_method, path, _ = request_line.split

  path, query_string = path.split("?")

  params = (query_string || "").split('&').each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  [http_method, path, params]
end

server = TCPServer.new('localhost', 3003)

loop do
  puts "Listening on port 3003"
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request_line(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i
  client.puts "<p>The current number is #{number}.</p>"
  client.puts "<a href='/?number=#{number+1}'>Count up by one!</a>"
  client.puts "<a href='/?number=#{number-1}'>Count down by one!</a>"

  client.puts "</body>"
  client.puts "</html>"

  client.close
end

