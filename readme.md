# rsync-backup-script

This bash script will help you to backup your data on \*nix sytems (like MacOS X, Linux, BSD, Solaris, ,...) with the help of the rsync tool.

The script is highly configurable and can be extended in many ways.

Personally, I use the backup script to

1. **get database and file backups from some servers I run on the internet**
2. **backup important data from my laptop's SSD to it's internal hard drive (in case either one fails one day)**
3. **backup all files from my laptop to my encrypted USB hard drive** 

see:
<a href="http://www.youtube.com/watch?feature=player_embedded&v=zTLP8Ge253o" target="_blank">
<img src="http://img.youtube.com/vi/zTLP8Ge253o/0.jpg" alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" />
</a>


## Installation

Drop the script to a folder in your path e.g. `/usr/local/sbin` or `/usr/local/bin` or `/usr/sbin` or `/usr/bin`

You can find out which directories are in your path by entering `echo $PATH` on the command line interface (CLI)


### Prerequisites

* bash (tested with version )
* rsync (tested with version )
* cron or other job scheduler if you want to schedule automatic backups

Most shared hosting machines will cover the above.

Install rsync on debian: apt-get install rsync
Install rsync on RHEL / Centos: yum -y install rsync


### Cronjob (optional) for automatic regular backups

On Unix/Linux based systems, you'd use cron to execute backup script if you don't want to do it manually. E.g. if our backup script should be run once a week (like every sunday night at 23:55h or 11.55pm), the cron file would have an entry like this:

<pre><code>
55 23 * * 0  backup.sh
</code></pre>

