FROM bmoorman/ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive \
    TARGETARCH

ENV RADARR_PORT=7878

WORKDIR /opt

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    jq \
    libicu66 \
    mediainfo \
 && if [ "${TARGETARCH}" = "amd64" ]; then arch=x64; else arch=${TARGETARCH}; fi \
 && fileUrl=$(curl --silent --location "https://api.github.com/repos/Radarr/Radarr/releases/latest" | jq --arg arch ${arch} --raw-output '.assets[] | select(.name | endswith("linux-core-" + $arch + ".tar.gz")) | .browser_download_url') \
 && curl --silent --location "${fileUrl}" | tar xz \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY radarr/ /etc/radarr/

VOLUME /config

EXPOSE ${RADARR_PORT}

CMD ["/etc/radarr/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --head --insecure --silent --show-error --fail "http://localhost:${RADARR_PORT}/" || exit 1
