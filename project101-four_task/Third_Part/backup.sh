#!/bin/bash

# Check if we are root privilage or not
if [[ $UID -ne 0 ]]
then
  echo "Please use this bash script with root privilage"
  exit 
fi 

# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
backup_files="/home/ec2-user/data /etc /boot /usr"
# Where do we backup to. Please crete this file before execute this script
dest="/mnt/backup" 
# Create archive filename based on time
time="$(date + "%d %m %Y : %r")"
hostname="$(hostname -s)"
archive_file=$hostname-$time
# Print start status message.
echo "We will backup to $backup_files to $dest/$archive_file"
echo 

# Backup the files using tar.
tar -cvf $dest/$archive_file $backup_files

# Print end status message.
echo "Congrulations! Your Backup is ready"

# Long listing of files in $dest to check file sizes.
# According to the project this bash script will be executed in every 5 minutes via crontab.