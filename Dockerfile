FROM bmoorman/ubuntu

WORKDIR /opt

RUN apt-get update && \
    apt-get dist-upgrade --yes && \
    apt-get install --yes --no-install-recommends curl jq libmono-cil-dev libcurl3 mediainfo && \
    fileUrl=$(curl --silent --location "https://api.github.com/repos/Radarr/Radarr/releases" | jq -r '.[0].assets[] | select(.browser_download_url | contains("linux")) | .browser_download_url') && \
    curl --silent --location "${fileUrl}" | tar xz && \
    apt-get autoremove --yes --purge && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY radarr/ /etc/radarr/

VOLUME /data

CMD ["/etc/radarr/start.sh"]

EXPOSE 7878
