# PARAMETROS 
FECHA=$(date +"%m-%d-%Y")-$(date +"%H:%M:%S")
NUMERO=3

# DATOS CONEXION BASE DE DATOS 
BD=bd
BD_USUARIO=user
BD_CLAVE=*****

# CONSULTA IPS A LA BASE DE DATOS, TABLA DE EQUIPOS
IPS=$(echo "SELECT ip FROM ips where status = 1" | mysql $BD -u $BD_USUARIO -p$BD_CLAVE)
# echo $IPS

for IP in $IPS
do
    # ping -q -c$NUMERO $IP >> /dev/null
    PORCENTAJE=`ping -c$NUMERO $IP | grep packet | awk '{print $6}'`
    if [[ $PORCENTAJE == "100%" ]]; then
        echo "$IP no responde al ping. $PORCENTAJE paquetes perdidos"
    else 
        echo "$IP responde al ping. $PORCENTAJE paquetes perdidos"
    fi
    
    #if [ $? -eq 0 ]
    #then
    #echo "$FECHA $IP ok"
    #else
    #echo "$FECHA $IP no responde al ping"
    #fi
done
