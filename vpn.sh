# PARAMETROS 
FECHA=$(date +"%Y-%m-%d %H:%M:%S")
VPN=$(/sbin/ifconfig tap0 | grep -cs "HWaddr")

# DATOS CONEXION BASE DE DATOS 
BD=bd
BD_USUARIO=user
BD_CLAVE=*****

#if [ "$(pidof vpnc)" ]; then

if [ $VPN == "1" ]; then
  REGISTRO="VPN OK"  
  ESTADO=1
else 
  REGISTRO="VPN ERROR (reconexión)"
  ESTADO=0
  sh /etc/vpnc/vpn.sh  
fi

# GUARDAR LOG DEL ESTADO 
echo "INSERT INTO vpn_logs (fecha, registro, estado) VALUES ('$FECHA', '$REGISTRO', '$ESTADO');" | mysql $BD -u $BD_USUARIO -p$BD_CLAVE;


