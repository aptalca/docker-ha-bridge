### Home Automation Bridge

Use Amazon Echo to voice control your home automation devices through http commands sent to your home automation controller or built-in direct control of the Harmony Hub and Nest.

This is a docker container for bwssystems' ha-bridge - https://github.com/bwssytems/ha-bridge

#### Install On unRaid:

On unRaid, install from the Community Applications and enter the app folder location, server IP and the port for the webUI Under advanced view. Note: If you change the port, you also have to change the WEBUI address in the "Additional Fields" at the bottom. 
  
After install, open the WebUI to add your Vera, Harmony and Nest settings.


#### Install On Other Platforms (like Ubuntu or Synology 5.2 DSM, etc.):

On other platforms, you can run this docker with the following command:

```docker run -d --name="Home-Automation-Bridge" --net="host" -e SERVERIP="192.168.X.X" -e SERVERPORT="XXXX" -v /path/to/config/:/config:rw -v /etc/localtime:/etc/localtime:ro aptalca/home-automation-bridge```

- Replace the SERVERIP variable (192.168.X.X) with your server's IP
- Replace the SERVERPORT variable (XXXX) with whichever port you choose for the web gui.
- Replace the "/path/to/config" with your choice of location

##### Optional Variables for the run command
- By default, this will install the version listed in the change log below, but if you want to run a different version (to go back to the previous version perhaps), include the following environment variable in your docker run command `-e VERSION="X.X.X"`
- Once installed, open the WebUI at `http://SERVERIP:SERVERPORT/` and enter your Vera, Harmony and Nest info.
  
#### Changelog: 
- 2016-04-28 - Update to ver 2.0.1
- 2016-03-29 - Update to ver 1.4.3
- 2016-03-26 - Update to ver 1.4.2
- 2016-03-19 - Update to ver 1.4.1 - Vera, Harmony and Nest settings are now managed through the WebUI
- 2016-02-03 - Update to ver 1.3.7 - Support for Nest added as well as support for multiple Veras and Harmonys
- 2015-12-16 - Update to ver 1.2.3
- 2015-12-07 - Update to ver 1.2.2
- 2015-12-04 - Update to ver 1.2.1
- 2015-11-19 - Update to ver 1.1.0
- 2015-11-13 - Update to ver 1.0.8
- 2015-11-04 - Update to ver 1.0.7 / Environment variables updated to include support for Harmony
- 2015-10-25 - Update to ver 0.4.10  
- 2015-09-15 - Update to ver 0.4.4 / Update variables for Harmony compatibility  
- 2015-09-01 - Update to ver 0.4.0  
- 2015-08-28 - Initial Release
