# plugin.service.snapcast - a Kodi addon running Snapcast
Run Snapcast as a Kodi addon. 

So far it's maily compiling it for Libreelec on the RPi3.

**Building**

I've built obn Libreelec 8.1.2:

* Clone the Libreelec 8.1.2 source from https://github.com/LibreELEC/LibreELEC.tv
* Clone https://github.com/frafall/plugin.service.snapcast and move the directories into LibreELEC.tv
* Build by 'scripts/build snapcast'

**TODO**

* Do the addon stuff to keep snapcast client running as a service
* For now I aim to use it on my digi+ interface, would be nice to use the Kodi HDMI audio
* Server integration is a whole different ballgame..but binary is compiled 
* The externals (git submodules) are hardcoded, improve..
