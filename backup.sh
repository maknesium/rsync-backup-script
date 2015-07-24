#!/bin/bash

##### SETUP ###############################
# specify the path TO WHERE the files should be backuped
BACKUP_PATH='/media/truecrypt3';

# text files with exclude entries to show which data should not be backuped (like tmp data or the download folder)
PATH_HOME_EXCLUDES='config/HOME_backup_excludes_demo.txt'
PATH_PRIVATE_DOCS_EXCLUDES='config/PRV_backup_excludes.txt'
###########################################

# checking if path exists, otherwise exit
if [ -d $BACKUP_PATH ]; then
    echo "Backing up to $BACKUP_PATH ...";
else
    echo "No directory $BACKUP_PATH found. Exiting...";
    exit 1;
fi

## get remote backups from remote servers (on local network or internet) and store the data to local disks

#first we retrieve database backups
#cd /home/user/Dev/server_dbbackup
#bash getbackups.sh

#first we retrieve file backups
#cd /home/user/Dev/server_filebackup
#bash getbackups.sh

# we now go into our home dir
cd /home/user

# short rsync explanation
# -v = verbose
# -a = archive mode
# -l = copy symlinks as symlinks (yep, we want this)
# -P = show progress during transfer
# -o = preserve owner (super-user only)
# -g = preserve group

# first, we save everything from laptop SSD to external drive
rsync -avlPog --delete --exclude-from $PATH_HOME_EXCLUDES /home/user/ $BACKUP_PATH/home_user/

# second, we save everything from laptop hd to external drive
#the --inplace option tells rsync to update the destination file in-place. (wich is a good idea for virtual machine images)
rsync -avlPog --delete --inplace --exclude-from $PATH_PRIVATE_DOCS_EXCLUDES /media/user/storage/ $BACKUP_PATH/storage/
