# shell-scripting

Doing backups from MySQL and Plesk files to external FTP 

# crontab -e
```sh
20      6       *       *       *       /home/backup/backup-mysql.sh day <br />
0       7       1       *       *       /home/backup/backup-web.sh month
```sh
