FROM alpine:latest

ADD ./disabled.sh /disabled.sh
CMD ["/disabled.sh"]
