FROM bmoorman/ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

ENV RADARR_PORT=7878

WORKDIR /opt

RUN echo 'deb https://download.mono-project.com/repo/ubuntu stable-bionic main' > /etc/apt/sources.list.d/mono-official-stable.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6A19B38D3D831EF \
 && apt-get update \
 && apt-get install --yes --no-install-recommends \
    curl \
    jq \
    libmono-cil-dev \
    libcurl4 \
    mediainfo \
 && fileUrl=$(curl --silent --location "https://api.github.com/repos/Radarr/Radarr/releases" | jq --raw-output '.[0].assets[] | select(.name | contains("linux.tar.gz")) | .browser_download_url') \
 && curl --silent --location "${fileUrl}" | tar xz \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY radarr/ /etc/radarr/

VOLUME /config

EXPOSE ${RADARR_PORT}

CMD ["/etc/radarr/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --head --insecure --silent --show-error --fail "http://localhost:${RADARR_PORT}/" || exit 1
