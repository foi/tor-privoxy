FROM dockage/alpine-openrc:3.6
MAINTAINER foi <foi@live.ru>

LABEL org.label-schema.name="tor-privoxy" \
      org.label-schema.vendor="foifirst" \
      org.label-schema.description="Docker Tor proxy (http and shell) built on Alpine Linux" \
      org.label-schema.vcs-url="https://github.com/foi/tor-privoxy" \
      org.label-schema.license="MIT"

ADD socat.rc /etc/init.d/socat
RUN apk --no-cache --update add tor privoxy socat \
    && mv /etc/tor/torrc.sample  /etc/tor/torrc \
    && echo "forward-socks5 / 0.0.0.0:9050 ." >> /etc/privoxy/config \
    && sed -i 's/listen-address\s*127.0.0.1:8118/listen-address 0.0.0.0:8118/g' /etc/privoxy/config \
    && sed -i 's/#SOCKSPort 192.168.0.1:9100/SOCKSPort 0.0.0.0:9050/g' /etc/tor/torrc \
    && sed -i 's/#ControlPort 9051/ControlPort 9052/g' /etc/tor/torrc \
    && echo "ExcludeNodes {ru},{ir},{iq},{cn}\nExcludeExitNodes {ru},{ir},{iq},{cn}" >> /etc/tor/torrc \
    && rc-update add tor \
    && rc-update add privoxy \
    && rc-update add socat

EXPOSE 9050/tcp 9051/tcp 8118/tcp
