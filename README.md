### Usage
```
docker run \
--detach \
--name radarr \
--publish 7878:7878 \
--volume radarr-config:/config \
--volume /mnt/media:/mnt/media \
--volume sabnzbd-data:/sabnzbd-data \
--volume transmission-data:/transmission-data \
bmoorman/radarr:latest
```
