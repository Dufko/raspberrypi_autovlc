sudo mount -o ro /dev/sda /media/flashdisk/ # or use lsblk to find path to correct device and change here
cvlc "/media/flashdisk/"  --playlist-autostart --loop --no-video-title-show 
