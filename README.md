# plugin.service.snapcast
Run Snapcast (client) as a Kodi addon/service. 

Snapcast 
========
Snapcast (https://github.com/badaix/snapcast) is a multi-room audio player.
This addon implementation installes the snapclient, ie the 'speaker' part,
as a Kodi service addon.

The addon will keep the snapclient running while Kodi is up but, as someone
uses Kodi to play anything the snapclient will be disabled.

Audio setup
-----------
The addon only instanciates snapclient running on the default alsa
interface. For this to work you will probably need to make the hdmi
interface visible in alsa.

1. To do this you need to edit config.txt:

   - mount -o remount,rw /flash
   - nano /flash/config.txt

2. Append the following line at the bottom:

   dtparam=audio=on

3. Save the file and

   - mount -o remount,ro /flash

4. Reboot, you should now see your interfaces when doing a 'aplay -L'
   or '.kodi/addons/service.snapcast/bin/snapclient -l'

In Libreelec 8.2 (perhaps before) you will get a mix of the snapcast
and kodi output.

Additional alsa interfaces
--------------------------
I run two snapclient instances, one for my HDMI and one for my Digi+ S/PDIF.
To enable additional instances you will manually add it, check out the sample
snapclient.service.sample file in .kodi/addons/service.snapcast/system.d

You can do something like:
- cd .kodi/addons/service.snapcast/system.d
- cp snapclient.service.sample snapclient.service
- systemd enable `pwd`/snapclient.service
- systemctl start snapclient.service

and do any configuration you want in the default/snapclient file.

Snapserver
----------
The snapserver is included, to run it check out the snapserver.service.sample
file in .kodi/addons/service.snapcast/system.d

You can do something like:
- cd .kodi/addons/service.snapcast/system.d
- cp snapserver.service.sample snapserver.service
- systemd enable `pwd`/snapserver.service
- systemctl start snapserver.service

and do any configuration you want in the default/snapserver file.

Thanks to Anton Voyl (awiouy) for the wrapping of Librespot
which I've used to learn about service addons.
