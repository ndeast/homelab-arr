#!/bin/bash
apt-get update && apt-get install rsync
# prowlarr
rsync -a /mnt/configs/prowlarr/Backups/scheduled/* /mnt/data/backup/prowlarr/scheduled
rsync -a /mnt/configs/prowlarr/Backups/manual/* /mnt/data/backup/prowlarr/manual

# lidarr
rsync -a /mnt/configs/lidarr/Backups/scheduled/* /mnt/data/backup/lidarr/scheduled
rsync -a /mnt/configs/lidarr/Backups/manual/* /mnt/data/backup/lidarr/manual

# qbittorrent
docker stop qbittorrent
rsync -a /mnt/configs/qbittorrent/* /mnt/data/backup/qbittorrent/'qbittorrent'-`date +%Y%m%d`/
docker start qbittorrent