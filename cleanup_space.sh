#!/bin/bash

echo cleanup journal older than a week
sudo journalctl --vacuum-time=7d

echo cleanup docker images
docker system prune -a -f

echo cleanup apt
sudo apt autoremove
sudo apt clean
