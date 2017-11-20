# service.snapcast
Run Snapcast (client) as a Kodi addon/service.

Snapcast
========
Snapcast (https://github.com/badaix/snapcast) is a multi-room audio player.
This addon implementation installes the snapclient, ie the 'speaker' part,
as a Kodi service addon.

The addon will keep the snapclient running while Kodi is up but, as someone
uses Kodi to play anything the snapclient will be disabled.

Installing the addon
--------------------
Most users will install the addon from a [prebuilt release](http://kodi.wiki/view/HOW-TO:Install_add-ons_from_zip_files):

* Download a relase [here](https://github.com/frafall/service.snapcast/releases), note: one of the service.snapcast-<version>.zip files, not the source.
* Copy it into the RPi filesystem
* Use Kodi to install from a .zip file

Audio setup
-----------
The addon only instanciates snapclient running on the default alsa
interface. For this to work you will probably need to make the hdmi
interface visible in alsa.

To do this you need to edit config.txt:
```sh
$  mount -o remount,rw /flash
$  nano /flash/config.txt
```
Append the following line at the bottom:
```sh
dtparam=audio=on
```
Save the file and remount:
```sh
$ mount -o remount,ro /flash
```
Reboot, you should now see your interfaces when doing a 'aplay -L' or '.kodi/addons/service.snapcast/bin/snapclient -l'

In Libreelec 8.2 (perhaps before) you will get a mix of the snapcast and kodi output, ie non-locking access to alsa device.

Additional alsa interfaces
--------------------------
I run two snapclient instances, one for my HDMI and one for my Digi+ S/PDIF.
To enable additional instances you will manually add it, check out the sample
snapclient.service.sample file in .kodi/addons/service.snapcast/system.d

You can do something like:
```sh
$ cd .kodi/addons/service.snapcast/system.d
$ cp snapclient.service.sample snapclient.service
$ systemd enable `pwd`/snapclient.service
$ systemctl start snapclient.service
```
and do any configuration you want in the default/snapclient file. Note that 
updating the addon will remove everything in the service.snapcast directory, ie take a backup.

Snapserver
----------
The snapserver is included, to run it check out the snapserver.service.sample
file in .kodi/addons/service.snapcast/system.d

You can do something like:
```sh
$ cd .kodi/addons/service.snapcast/system.d
$ cp snapserver.service.sample snapserver.service
$ systemd enable `pwd`/snapserver.service
$ systemctl start snapserver.service
```
and do any configuration you want in the default/snapserver file.

Compiling
---------
To compile this addon you need to:

Clone Libreelec:
```sh
$ git clone https://github.com/LibreELEC/LibreELEC.tv.git
```

Create submodule service.snapcast:
```sh
$ cd LibreELEC.tv/packages/addons/service
$ git submodule add https://github.com/frafall/service.snapcast.git snapcast
```
Build it:
```sh
$ cd Libreelec.tv
$ scripts/create_addon snapcast
```

Todo
----

 - Configuration in Kodi
 - Move defaults to persistent storage (through addon upgrades)
 - Look into 'native' Kodi audio integration. Kodi AirTunes uses a pipe and a play 
   command with pipe path url, can probably do the same.
 - Wish for metadata support in Snapcast to be able to display in Kodi.

**Thanks**

Thanks to Anton Voyl (awiouy) for the wrapping of Librespot
which I've used to learn about service addons.
