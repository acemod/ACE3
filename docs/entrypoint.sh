#!/bin/sh

jekyll serve --future --config _config_dev.yml -H 0.0.0.0 -P 4000 ${JEKYLLARGS}
