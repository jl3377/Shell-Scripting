# PARAMETROS 
FECHA=$(date +"%Y-%m-%d %H:%M:%S")
NUMERO=1

# DATOS CONEXION BASE DE DATOS 
BD=bd
BD_USUARIO=user
BD_CLAVE=*****

# ping -q -c$NUMERO $1 &> /dev/null
# sleep 5
PING=`ping -q -c$NUMERO $1`
 
if [ $? -eq 0 ]; then
        echo "1"        
else
        echo "0"
fi

# GUARDAR LOG DEL ESTADO 
echo "INSERT INTO logs (fecha, ip, registro) VALUES ('$FECHA', '$1', '$PING');" | mysql $BD -u $BD_USUARIO -p$BD_CLAVE;
