#!/bin/bash
exec $(which mono) \
    /opt/Radarr/Radarr.exe \
    --data=/data \
    --nobrowser
