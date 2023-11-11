# Require the 'socket' library to work with TCP sockets
require 'socket'

# Create a TCP server that listens on all available interfaces (0.0.0.0) and port 8080
server = TCPServer.new('0.0.0.0', 80)

# Infinite loop to continuously accept incoming connections
loop do
  # Accept a client connection
  client = server.accept

  begin
    # Read the client's request data, limited to 2048 bytes
    request = client.readpartial(2048)

    # Parse the first line of the HTTP request to extract method, path, and version
    method, path, version = request.lines[0].split

    # Print the request information to the console
    puts "#{method} #{path} #{version}"

    # Check if the requested path is "/healthcheck"
    if path == "/healthcheck"
      # If the path is "/healthcheck", set a response indicating success
      response = "HTTP/1.0 200 OK\r\n\r\nOK"
    else
      # For other paths, set a generic response
       response = "HTTP/1.0 200 OK\r\n\r\nWell, hello there!"
    end

    # Send the response back to the client
    client.write(response)
  rescue EOFError
    # Handle the case when the client closes the connection
    puts "Client closed the connection."
  ensure
    # Ensure that the client socket is closed, regardless of the outcome
    client.close
  end
end