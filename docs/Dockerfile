# Build:
# docker build -t ace3mod/jekyll .
#
# Run:
# docker run -it ace3mod/jekyll

FROM starefossen/github-pages:onbuild
MAINTAINER bux

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN gem install --no-document \
  github-pages:91 \
  jekyll-github-metadata

ENTRYPOINT ["jekyll", "serve", "--future", "--incremental", "--config", "_config_dev.yml", "-H", "0.0.0.0", "-P", "4000"]
