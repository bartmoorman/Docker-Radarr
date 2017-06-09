### Build
```
docker build \
--tag radarr \
https://github.com/iVirus/Docker-Radarr.git
```

### Run
```
docker run \
--rm \
--detach \
-name radarr \
--network backend \
--volume /mnt/radarr:/data \
--volume /mnt/media:/media \
--volume /mnt/sabnzbd:/sabnzbd-data \
--volume transmission-public-data:/transmission-public-data \
--volume transmission-private-data:/transmission-private-data \
--publish 7878:7878 \
radarr
```
