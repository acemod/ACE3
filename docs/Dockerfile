FROM ghcr.io/github/pages-gem:latest
LABEL maintainer "bux"

ENV BUNDLE_GEMFILE=/src/site/Gemfile

COPY entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
