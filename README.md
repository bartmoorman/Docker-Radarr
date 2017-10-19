```
docker run \
--rm \
--detach \
--init \
--name radarr \
--network backend \
--volume /mnt/radarr-data:/data \
--volume /mnt/media:/media \
--volume /mnt/sabnzbd-data:/sabnzbd-data \
--volume transmission-public-data:/transmission-public-data \
--volume transmission-private-data:/transmission-private-data \
--publish 7878:7878 \
bmoorman/radarr
```
