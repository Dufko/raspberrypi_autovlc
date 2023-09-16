# Download vlc and splash screen
echo "Installing vlc and splash screen"
sudo apt update
sudo apt install -y vlc --no-install-recommends --no-install-suggests
sudo apt -y install rpd-plym-splash

# Create mounting folder
echo "Creating mount points"
sudo mkdir /media/flashdisk

# Copy script that starts vlc
echo "Copying scripts"
cp ./start_vlc.sh ~/start_vlc.sh

# Systemctl service file creation
echo "Creating service file"
echo '[Unit]
Description=Custom VLC

[Install]
WantedBy=multi-user.target

' | sudo tee /etc/systemd/system/customvlc.service

echo "[Service]
User=$USER" | sudo tee -a /etc/systemd/system/customvlc.service

#echo "$USER" | sudo tee -a /etc/systemd/system/customvlc.service

echo "
Type=simple
ExecStart=/usr/bin/bash /home/$USER/start_vlc.sh
Restart=on-failure
" | sudo tee -a /etc/systemd/system/customvlc.service

sudo systemctl daemon-reload

echo "Now starting service"
read

sudo systemctl start customvlc.service
sudo systemctl enable customvlc.service

echo "Now in raspi-config enable readonly partition, splash screen, set bigger gpu memory and check for dots in output video"
read
