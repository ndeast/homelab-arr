#!/bin/bash

apt-get update && apt-get upgrade -y

apt-get install rsync curl neovim -y

curl -sSL https://get.docker.com/ | sh

useradd -m -u 1006 -s /usr/bin/bash data

useradd -m -u 1007 -s /usr/bin/bash lidarr && usermod -aG data lidarr
useradd -m -u 1008 -s /usr/bin/bash prowlarr && usermod -aG data prowlarr
useradd -m -u 1009 -s /usr/bin/bash qbittorrent && usermod -aG data qbittorrent
useradd -m -u 1010 -s /usr/bin/bash sabnzbd && usermod -aG data sabnzbd

mkdir -p /var/lib/configs/lidarr
mkdir -p /var/lib/configs/prowlarr
mkdir -p /var/lib/configs/qbittorrent
mkdir -p /var/lib/configs/sabnzbd

chown -R lidarr:data /var/lib/configs/lidarr
chown -R prowlarr:data /var/lib/configs/prowlarr
chown -R qbittorrent:data /var/lib/configs/qbittorrent
chown -R sabnzbd:data /var/lib/configs/sabnzbd


docker compose pull
docker compose up