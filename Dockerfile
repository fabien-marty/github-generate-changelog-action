FROM alpine:latest

RUN apk add git curl
COPY download.sh /app/bin/

# Download version v0.7.1
RUN mkdir -p /app/bin && \
    cd /app/bin && \
    ./download.sh "https://api.github.com/repos/fabien-marty/github-next-semantic-version/releases/185363552" github-generate-changelog && \
    chmod +x github-generate-changelog

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]