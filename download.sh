#!/bin/sh

cd _maxminddb_geolite2
rm *.mmdb
curl -O https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz
gunzip "GeoLite2-City.mmdb.gz"
cd ..

export PYTHONPATH=`pwd`:`pwd`/..
python -c "if 1:
    from geolite2 import geolite2;
    info = geolite2.get_info()
    print info.date.strftime('%Y.%m%d')
" > VERSION
