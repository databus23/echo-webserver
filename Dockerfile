FROM ruby:alpine

ADD server.rb /server.rb

EXPOSE 80

CMD [ "/server.rb" ]
