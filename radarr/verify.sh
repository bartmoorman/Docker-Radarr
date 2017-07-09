#!/bin/bash
doLog () {
    cat <<EOM>> /data/verify.log
-=-=-=-=-=-
[$1]
$(date)
-=-=-=-=-=-
Dst Path: $radarr_moviefile_path
Src Path: $radarr_moviefile_sourcepath

Dst SHA1: $radarr_moviefile_sha1
Src SHA1: $radarr_moviefile_sourcesha1
EOM
}

if [ "$radarr_eventtype" == "Download" ]; then
    radarr_moviefile_sha1=$(sha1sum "$radarr_moviefile_path" | awk '{print $1}')
    radarr_moviefile_sourcesha1=$(sha1sum "$radarr_moviefile_sourcepath" | awk '{print $1}')

    if [ "$radarr_moviefile_sha1" != "$radarr_moviefile_sourcesha1" ]; then
        doLog ERROR
    else
        doLog INFO
    fi
fi
