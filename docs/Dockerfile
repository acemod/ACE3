# Build:
# docker build -t ace3mod/jekyll .
#
# Run:
# docker run -p 4000:4000 -it ace3mod/jekyll

FROM starefossen/github-pages:latest
MAINTAINER bux

COPY . /usr/src/app

VOLUME "/usr/src/app"

CMD ["jekyll", "serve", "--future", "--incremental", "--config", "_config_dev.yml", "-H", "0.0.0.0", "-P", "4000"]
