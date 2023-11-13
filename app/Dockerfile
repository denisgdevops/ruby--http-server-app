# Use an official Ruby runtime as a parent image
FROM ruby:2.7

# Set the working directory to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container at /app
COPY Gemfile Gemfile.lock ./

# Install any dependencies
RUN gem install bundler

RUN  bundle install
COPY . /app


EXPOSE 8080

# Run webserver.rb when the container launches
CMD ["ruby", "http_server.rb"]
