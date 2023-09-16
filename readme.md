# What this is
This is a script that creates a system service that starts on boot. This service starts script that mounts a drive and then starts vlc.

## Possible problems
Sometimes the video can contain green or red dots. This is caused by cable and is fixed in `/boot/config.txt` by setting `config_hdmi_boost=7`.
