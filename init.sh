#!/bin/bash

apt-get update && apt-get upgrade -y

apt-get install rsync curl neovim -y

curl -sSL https://get.docker.com/ | sh

useradd -m -u 1006 -s /usr/bin/bash data

useradd -m -u 1007 -s /usr/bin/bash lidarr && usermod -aG data lidarr
useradd -m -u 1008 -s /usr/bin/bash prowlarr && usermod -aG data prowlarr
useradd -m -u 1009 -s /usr/bin/bash qbittorrent && usermod -aG data qbittorrent
useradd -m -u 1010 -s /usr/bin/bash sabnzbd && usermod -aG data sabnzbd


chown -R lidarr:lidarr /mnt/configs/lidarr
chown -R prowlarr:prowlarr /mnt/configs/prowlarr
chown -R qbittorrent:qbittorrent /mnt/configs/qbittorrent
chown -R sabnzbd:sabnzbd /mnt/configs/sabnzbd

(crontab -l 2>/dev/null; echo "0 3 * * SUN /root/homelab-arr/backup.sh") | crontab -


docker compose pull
docker compose up