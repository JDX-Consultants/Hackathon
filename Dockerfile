# Base image:
FROM ruby:2.3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/hackathon
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Gems:
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
# RUN gem install puma
RUN bundle install

COPY config/puma.rb config/puma.rb

# Copy the main application.
COPY . .

RUN mkdir -p $RAILS_ROOT/tmp/pids && mkdir -p $RAILS_ROOT/tmp/sockets

ENV RAILS_ENV production
ENV RACK_ENV production
ENV SECRET_KEY_BASE b0e9558ca9115824b934c0bf1b54b7d3e4a8af71c7457174d9e3036546f31cdd68024d0e6f6ee6d14912bedd820cd838f195c9da23b375b539fd982c401d5068

# Precompile Rails assets
RUN bundle exec rake assets:precompile

EXPOSE 80:3000

# The default command that gets ran will be to start the Puma server.
CMD bundle exec rake db:migrate && bundle exec puma -C config/puma.rb
