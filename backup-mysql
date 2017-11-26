# DATOS
SERVIDOR=domain
FECHA=$(date +"%Y-%m-%d")_$(date +"%H-%M") # mm-dd-yyyy-hh.mm.ss
EMAIL=youremail@domain
ASUNTO="Backup SQL Diario"
TMP=/home/backup/tmp
BACKUP=Backups

# DATOS BD
BD_USUARIO=*****
BD_CLAVE=*****

# DATOS FTP
NCFTP="/usr/bin/ncftpput"
FTP=192.168.0.155
FTP_USUARIO=user
FTP_CLAVE=*****
FTP_DESTINO="./$BACKUP/$SERVIDOR/MySQL/"

for BD in `mysql -u$BD_USUARIO -p$BD_CLAVE -e "show databases" -B -N`
do
        FILE=$TMP/$FECHA-$BD.sql.gz
    mysqldump -u$BD_USUARIO -p$BD_CLAVE --opt $BD | gzip -9 > $FILE
    $NCFTP -m -u $FTP_USUARIO -p $FTP_CLAVE $FTP $FTP_DESTINO/$BD/ $FILE
    rm -f $FILE
done

#mail -s "$ASUNTO - $FECHA - $SERVIDOR" $EMAIL < "/home/backup/msg.txt"
