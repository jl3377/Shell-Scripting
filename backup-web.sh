# DATOS
SERVIDOR=domain
FECHA=$(date +"%Y-%m-%d")_$(date +"%H-%M") # mm-dd-yyyy-hh.mm.ss
EMAIL=youremail@domain
ASUNTO="Backup WEB"
TMP=/home/backup/tmp
DIR=Backups

# DATOS WEBS
DOMINIOS=/var/www/vhosts

# DATOS FTP
NCFTP="/usr/bin/ncftpput"
FTP=192.168.1.155
FTP_USUARIO=user
FTP_CLAVE=*****
FTP_DESTINO="./$DIR/$SERVIDOR/WEB/"

for WEB in `ls -l $DOMINIOS/ | grep psaserv | awk {'print $9'}`
do

        FILE=$TMP/$FECHA-$WEB.tar.gz
    tar -czf $FILE $DOMINIOS/$WEB
    $NCFTP -m -u $FTP_USUARIO -p $FTP_CLAVE $FTP $FTP_DESTINO/$WEB/ $FILE
    rm -f $FILE

done

#mail -s "$ASUNTO - $FECHA - $SERVIDOR" $EMAIL < "/home/backup/msg.txt"
