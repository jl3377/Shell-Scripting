IP="176.31.253.86"
CORREO="your@email"

PING=`nc -z -w 10 192.168.1.155 8122`
 
if [ $? -eq 0 ]; then
        echo "1"        
else
        echo "0"      
        echo "<b>$IP</b><br />$PING<br />" | mail -s "$(echo -e "$IP | No responde\nContent-Type: text/html")" $CORREO  
fi
