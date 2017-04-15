# Build:
# docker build -t ace3mod/jekyll .
#
# Run:
# docker run -it -p 4000:4000 -v $(pwd):/usr/src/app ace3mod/jekyll
# 
# Run with --incremental flag:
# docker run -it -p 4000:4000 -v $(pwd):/usr/src/app ace3mod/jekyll --incremental

FROM starefossen/github-pages:latest
MAINTAINER bux

COPY . /usr/src/app

VOLUME "/usr/src/app"

ENTRYPOINT ["jekyll", "serve", "--future", "--config", "_config_dev.yml", "-H", "0.0.0.0", "-P", "4000"]
