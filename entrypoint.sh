#!/bin/sh

set -eu

URL="https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/131/downloads/paper-1.21.1-131.jar"
SUM="dc7dd1b6a3093641f182e874e52637682e9fa9bbcc8025a1f761c5bbec2dd341"

if [ ! -f paper.jar ]; then
  curl $URL --output paper.jar
fi

echo "$SUM paper.jar" | sha256sum -c

if [ "$1" = "mc" ]; then
  java -Xms4G -Xmx4G -jar paper.jar --nogui
  exit 1
fi

exec "$@"
