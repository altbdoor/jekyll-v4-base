FROM ruby:3.2-alpine as builder

ENV JEKYLL_VERSION='4.3.2'
ENV MINIMA_VERSION='2.5.1'

RUN apk add build-base

RUN gem install "jekyll:$JEKYLL_VERSION" \
        "minima:$MINIMA_VERSION" \
        "jekyll-paginate-v2:3.0.0"

# ==========

FROM ruby:3.2-alpine as app

COPY --from=builder /usr/local/bundle /usr/local/bundle

WORKDIR /srv

EXPOSE 4000
