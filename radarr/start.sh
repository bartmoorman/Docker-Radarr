#!/bin/bash
exec $(which mono) \
    --debug \
    /opt/Radarr/Radarr.exe \
    -nobrowser \
    -data=/data
