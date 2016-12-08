FROM ruby:2.3

RUN apt-get update && \
    apt-get install -y build-essential \
                       ruby-dev
 
RUN gem install em-websocket \
                eventmachine \
                msgpack \
                json

RUN mkdir /websocket
WORKDIR /websocket

COPY app.rb /websocket

# When dynamically allocating and linking ports on the host side
# EXPOSE 9001

ENTRYPOINT ["ruby", "app.rb"]
