# plugin.service.snapcast
Run Snapcast (client) as a Kodi addon/service. 

So far it's mainly compiling it for Libreelec on the RPi3.

**Goal**
To use Snapcast as the audio transport mechanism for my multiroom
audio, check out https://musingsofafragilemind.wordpress.com/

- Playing music from snapserver->net->snapclient-> digi+ or kodi-hdmi or both (config)
- Kodi local playing overrides (silences) snapclient if playing on hdmi

**Building**

I've built on Libreelec 8.1.2:

* Clone the Libreelec 8.1.2 source from https://github.com/LibreELEC/LibreELEC.tv
* Clone https://github.com/frafall/plugin.service.snapcast and move the directories into LibreELEC.tv
* Build by 'scripts/create_addon snapcast'

**TODO (not nessesary in order)**

  1. To be able to compile snapclient/snapserver for Libreelec
  2. Wrap snapclient in a Kodi service addon 
  3. Alsa configuration from Kodi
  4. Audio integration with Kodi (somehow?), using Digi+ for now
  5. Snapserver service?
  6. Any snapserver audio integration for Kodi audio output?

These may change (and probably will) 

**Notes**

* The externals (git submodules) are hardcoded, can we get tag 
  and use the Libreelec download mechanisms? 

Thanks to Anton Voyl (awiouy) for the wrapping of Librespot
whucg I've used to learn about service addons.
