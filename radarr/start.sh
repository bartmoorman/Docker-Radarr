#!/bin/bash
exec $(which mono) \
    /opt/Radarr/Radarr.exe \
    --data=/config \
    --nobrowser
