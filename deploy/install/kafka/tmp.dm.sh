echo `blkid /dev/vdb1 | awk '{print $2}' | sed 's/\"//g'` /data ext4 defaults 0 0 >> /etc/fstab

/usr/local/efak

vi /etc/profile
export KE_HOME=/usr/local/efak
export PATH=$PATH:$KE_HOME/bin