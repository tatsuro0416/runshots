FROM ruby:2.6.2
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y vim
RUN mkdir /runshots
WORKDIR /runshots
COPY Gemfile /runshots/Gemfile
COPY Gemfile.lock /runshots/Gemfile.lock
RUN bundle install
COPY . /runshots
RUN mkdir -p tmp/sockets
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]