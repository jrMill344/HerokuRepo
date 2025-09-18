# Use Ruby 3.2.2 base image (prebuilt)
FROM ruby:3.2.2

# Set working directory inside container
WORKDIR /csce431/test_app

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs yarn build-essential libpq-dev curl git && \
    rm -rf /var/lib/apt/lists/*

# Copy Gemfile and Gemfile.lock first (for caching)
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the app
COPY . .

# Expose Rails default port
EXPOSE 3000

# Default command to run Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
