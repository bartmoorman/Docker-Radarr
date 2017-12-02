### Usage
```
docker run \
--rm \
--detach \
--init \
--name radarr \
--hostname radarr \
--volume radarr-config:/config \
--volume /mnt/media:/mnt/media \
--volume sabnzbd-data:/sabnzbd-data \
--volume transmission-public-data:/transmission-public-data \
--volume transmission-private-data:/transmission-private-data \
--publish 7878:7878 \
bmoorman/radarr
```
