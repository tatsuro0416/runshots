FROM ruby:2.6.2
RUN apt-get update -qq &&  \
    apt-get install --no-install-recommends -y nodejs postgresql-client && \
    apt-get install -y vim

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