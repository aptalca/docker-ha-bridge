# Home Automation Bridge

Use Amazon Echo to voice control your home automation devices (uses http commands between the echo and your home automation controller)

## Install On unRaid:

On unRaid, install from the Community Applications and enter the app folder location and the port for the webUI.


## Install On Other Platforms (like Ubuntu or Synology 5.2 DSM, etc.):

On other platforms, you can run this docker with the following command:

```docker run -d --name="Home-Automation-Bridge" --net="host" -e SERVERIP="192.168.X.X" -e SERVERPORT="XXXX" -e VERAIP="192.168.X.X" -v /path/to/config/:/config:rw -v /etc/localtime:/etc/localtime:ro aptalca/home-automation-bridge```

- Replace the SERVERIP variable (192.168.X.X) with your server's IP
- Replace the SERVERPORT variable (XXXX) with whichever port you choose.
- Replace the VERAIP variable (192.168.X.X) with your Vera IP
- Replace the "/path/to/config" with your choice of location
- By default, this will install the latest version as of the latest update to this container, but if you want to run a different version (to go back to the previous version perhaps), include the following environment variable in your docker run command `-e VERSION="0.X.X"`
  
You can access the WebUI at `http://SERVERIP:SERVERPORT/`  
It is much much easier to manage connected devices that way
  
## Changelog:  
2015-09-01 - Update to ver 0.4.0  
2015-08-28 - Initial Release
