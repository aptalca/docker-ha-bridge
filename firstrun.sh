#!/bin/bash

#Get docker env timezone and set system timezone
echo "setting the correct local time"
echo $TZ > /etc/timezone
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure tzdata
cd /config

if [ ! -f /config/ha-bridge-"$VERSION".jar ]; then
  echo "Installing version '$VERSION'"
  wget https://github.com/bwssytems/ha-bridge/releases/download/v"$VERSION"/ha-bridge-"$VERSION".jar
else
  echo "Using existing version '$VERSION'"
fi
echo "Setting correct permissions"
chown -R nobody:users /config

#check to see if SERVERPORT variable is set, if not, set it to default
if [ -z "$SERVERPORT" ]; then
  echo "SERVERPORT environment not passed, using default port 8080"
  SERVERPORT=8080
fi

ADDPARAM="-Dupnp.config.address=$SERVERIP -Dserver.port=$SERVERPORT -Dupnp.strict=$UPNPSTRICT -Dtrace.upnp=$UPNPTRACE"
echo -e "Parameters used:\nServer IP : $SERVERIP\nServer Port : $SERVERPORT\nUpnp.Strict : $UPNPSTRICT\nTrace.upnp : $UPNPTRACE"

if [ ! $VERAIP="None" ]; then
  ADDPARAM+=" -Dvera.address=$VERAIP"
  echo "Vera connected at IP address : $VERAIP"
else
  echo "Vera not connected"
fi

if [ ! $HARMONYIP="None" ]; then
  ADDPARAM+=" -Dharmony.address=$HARMONYIP Dharmony.user=$HARMONYUSER -Dharmony.pwd=$HARMONYPWD"
  echo "Harmony connected at IP address : $HARMONYIP"
else
  echo "Harmony not connected"
fi

echo "Starting Home Automation Bridge"
/sbin/setuser nobody java -jar "$ADDPARAM" ha-bridge-"$VERSION".jar 2>&1 | tee /config/ha-bridge.log
