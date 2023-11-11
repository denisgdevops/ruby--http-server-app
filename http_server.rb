# Require the 'socket' library to work with TCP sockets
require 'socket'

# Create a TCP server that listens on all available interfaces (0.0.0.0) and port 8080
server  = TCPServer.new('0.0.0.0', 80)


# Infinite loop to continuously accept incoming connections
loop {

    # Accept a client connection and read the request
  client  = server.accept
  request = client.readpartial(2048)
  
  # Parse the first line of the HTTP request to extract method, path, and version
  method, path, version = request.lines[0].split

   # Print the request information to the console
  puts "#{method} #{path} #{version}"

  # If the path is /healthcheck, return a 200 OK response with the body "OK"
  if path == "/healthcheck"
    client.write("OK")
  # If the path is /hello, return a 200 OK response with the body "Well, hello there!"
  else
    client.write("Well, hello there!")
  end

  # Close the client connection
  client.close
}
