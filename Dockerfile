# Use an official Ruby runtime as a parent image
FROM ruby:2.7

# Set the working directory to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container at /app
COPY Gemfile Gemfile.lock ./

# Install any dependencies
RUN gem install bundler
RUN bundle install

# Copy the rest of the application code
COPY . /app

# Make port 80 available to the world outside this container
EXPOSE 80

# Run webserver.rb when the container launches
CMD ["ruby", "http_server.rb"]

