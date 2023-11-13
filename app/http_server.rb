# Require the 'socket' library to work with TCP sockets
require 'socket'

require 'logger'

# Create a TCP server that listens on all available interfaces (0.0.0.0) and port 8080
server = TCPServer.new('0.0.0.0', 8080)

# Infinite loop to continuously accept incoming connections
loop do

  logger.info("ruby application Started successfully....") # Log the response information
  # Accept a connection
  client = server.accept

  begin

    request = client.readpartial(2048)

    method, path, version = request.lines[0].split

    puts "#{method} #{path} #{version}"

    if path == "/healthcheck"
     
      response = "HTTP/1.0 200 OK\r\n\r\nOK"
    else
    
       response = "HTTP/1.0 200 OK\r\n\r\nWell, hello there!"
    end

    client.write(response)
  rescue EOFError

    puts "Client closed the connection."
  ensure

    client.close
  end
end