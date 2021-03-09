require 'socket'

def parse_request_line(request_line)
  http_method, path, _ = request_line.split

  path, query_string = path.split("?")

  params = { "rolls" => "1", "sides" => "6" }

  if query_string
    split_query_string = query_string.split('&')

    split_query_string.each do |param|
      key, value = param.split('=')
      params[key] = value
    end
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

  puts "Parsed:"
  puts http_method, path, params

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"
  client.puts "<h1>Rolls!</h1>"

  sides = params["sides"].to_i

  params["rolls"].to_i.times do
    client.puts "<p>#{rand(sides) + 1}</p>"
  end

  client.puts "</body>"

  client.close
end

