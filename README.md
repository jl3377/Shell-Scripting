# shell-scripting

Doing backups MySQL and Plesk files

# crontab -e

20      6       *       *       *       /home/backup/backup-mysql.sh day
0       7       1       *       *       /home/backup/backup-web.sh month
