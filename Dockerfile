FROM alpine:latest AS build
LABEL 	org.label-schema.maintainer="me codar nl" \
	org.label-schema.name="burp" \
	org.label-schema.description="Docker version of Burp based on Alpine Linux" \
	org.label-schema.version="1.0" \
	org.label-schema.vcs-url="https://github.com/githubcdr/docker-burp" \
	org.label-schema.schema-version="1.0"

WORKDIR	/tmp
RUN apk add --update --no-cache git ca-certificates alpine-sdk autoconf \
	   automake openssl openssl-dev uthash uthash-dev librsync librsync-dev acl-dev ncurses-dev zlib-dev \
	&& mkdir /app /conf \
	&& git clone git://github.com/grke/burp.git \
	&& cd burp \
	&& autoreconf -vif \
	&& sed -i '/LT_INIT(disable-static)/d' ./configure \
	&& ./configure --prefix=/app --sysconfdir=/conf \
	&& make \
	&& make install-strip \
	&& make install-configs

FROM alpine:latest
RUN mkdir /app /conf \
	&& apk add --update --no-cache bash librsync uthash openssl ca-certificates ncurses libacl
COPY --from=build /app /app
COPY --from=build /conf /conf

