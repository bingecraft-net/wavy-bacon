#!/usr/bin/env zsh

seed="$1"

set -e

podman build -t wavy-bacon .
id=$(podman run -dip 25565:25565 wavy-bacon)
echo $id
if [ "$seed" != "" ]; then
  podman cp $seed $id:/home/minecraft/backups/
  podman exec $id tar xf /home/minecraft/backups/$seed
fi
podman exec -d $id start
