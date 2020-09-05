FROM alpine
RUN apk --no-cache add curl
COPY wait-for-cmd.sh /
ENTRYPOINT ["/wait-for-cmd.sh"]
