# Home Automation Bridge

Use Amazon Echo to voice control your home automation devices (uses http commands between the echo and your home automation controller)

## Install On unRaid:

On unRaid, install from the Community Applications and enter the app folder location and the port for the webUI.


## Install On Other Platforms (like Ubuntu or Synology 5.2 DSM, etc.):

On other platforms, you can run this docker with the following command:

```docker run -d --name="Home-Automation-Bridge" --net="host" -e SERVERIP="192.168.X.X" -e SERVERPORT="XXXX" -v /path/to/config/:/config:rw -v /etc/localtime:/etc/localtime:ro aptalca/home-automation-bridge```

- Replace the SERVERIP variable (192.168.X.X) with your server's IP
- Replace the SERVERPORT variable (XXXX) with whichever port you choose.
- Replace the "/path/to/config" with your choice of location

#### Optional Variables for the run command
- Include your VERA IP as `-e VERAIP="X.X.X.X"`
- Include your Harmony IP as `-e HARMONYIP="X.X.X.X"`
- Include your Harmony username as `-e HARMONYUSER="yourusername"`
- Include your Harmony password as `-e HARMONYPWD="yourpassword"`
- By default, this will install the version listed in the change log below, but if you want to run a different version (to go back to the previous version perhaps), include the following environment variable in your docker run command `-e VERSION="X.X.X"`
- To turn off -Dupnp.strict include `-e UPNPSTRICT="false"` (Default is true)
- To turn on -Dtrace.upnp include `-e UPNPTRACE="true"` (Default is false)
  
You can access the WebUI at `http://SERVERIP:SERVERPORT/`  
It is much much easier to manage connected devices that way
  
## Changelog:  
- 2015-11-04 - Update to ver 1.0.7 / Environment variables updated to include support for Harmony
- 2015-10-25 - Update to ver 0.4.10  
- 2015-09-15 - Update to ver 0.4.4 / Update variables for Harmony compatibility  
- 2015-09-01 - Update to ver 0.4.0  
- 2015-08-28 - Initial Release
