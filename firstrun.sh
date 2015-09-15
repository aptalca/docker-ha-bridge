#!/bin/bash

#Get docker env timezone and set system timezone
echo "setting the correct local time"
echo $TZ > /etc/timezone
export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure tzdata
cd /config

if [ ! -f /config/ha-bridge-"$VERSION".jar ]; then
  echo "Installing version '$VERSION'"
  wget http://www.bwssystems.com/files/ha-bridge-"$VERSION".jar
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

/sbin/setuser nobody java -jar -Djava.net.preferIPv4Stack=true -Dupnp.config.address=$SERVERIP -Dserver.port=$SERVERPORT -Dvera.address=$VERAIP -Dupnp.strict=true -Dtrace.upnp=true -Dvtwo.compatibility=false ha-bridge-"$VERSION".jar 2>&1 | tee /config/ha-bridge.log
