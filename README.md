### Docker Run
```
docker run \
--detach \
--name radarr \
--restart unless-stopped \
--publish 7878:7878 \
--volume radarr-config:/config \
--volume /mnt/media:/mnt/media \
--volume sabnzbd-data:/sabnzbd-data \
--volume transmission-data:/transmission-data \
bmoorman/radarr:latest
```

### Docker Compose
```
version: "3.7"
services:
  radarr:
    image: bmoorman/radarr:latest
    container_name: radarr
    restart: unless-stopped
    ports:
      - "7878:7878"
    volumes:
      - radarr-config:/config
      - /mnt/media:/mnt/media
      - sabnzbd-data:/sabnzbd-data
      - transmission-data:/transmission-data

volumes:
  radarr-config:
  sabnzbd-data:
  transmission-data:
```

### Environment Variables
|Variable|Description|Default|
|--------|-----------|-------|
|TZ|Sets the timezone|`America/Denver`|
