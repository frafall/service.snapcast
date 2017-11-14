################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2017-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

################################################################################
# Monitor Kodi for any start/end playing media events, disable the snapclient
# accordingly as the person in front of the Kodi box should have the ultimate 
# control of what is playing, not some1 remote (like on snapserver)
################################################################################

import os
import stat
import subprocess
import sys
import threading
import xbmc
import xbmcaddon
import xbmcgui

#
# I want snapclient started on Kodi start, to avoid sound mix we listen 
# to onPlayBackStarted/onPlayBackEnded to stop/start snapclient
#
# I could have integrated to JSON service in Snapcast, perhaps in future.
# But, I would like the person in front of the Kodi box to have ultimate control
# as I have kids in the house who finds it hilarious to break into my horror
# movie with some dance music.
#

def systemctl(command, service=None):
   if service is None:
       service = xbmcaddon.Addon().getAddonInfo('id')

   #xbmc.log("Snapcast systemctl(%s, %s)" % (command, service), level=xbmc.LOGNOTICE)
   subprocess.call(['systemctl', command, service])

class Monitor(xbmc.Monitor):

   def __init__(self, player):
      super(Monitor, self).__init__(self)
      self.player = player

   def onSettingsChanged(self):
      #xbmc.log("Snapcast event onSettingsChanged!", level=xbmc.LOGNOTICE)
      systemctl("restart") 

class Player(xbmc.Player):                                                      
                                                                    
   def __init__(self):                                              
      super(Player, self).__init__(self)                               

   def onStartup(self):
      #xbmc.log("Snapcast event onStartup!", level=xbmc.LOGNOTICE)
      systemctl("start") 

   def onShutdown(self):
      #xbmc.log("Snapcast event onShutdown!", level=xbmc.LOGNOTICE)
      systemctl("stop") 
                                                               
   def onPlayBackStarted(self):                                                 
      #xbmc.log("Snapcast event onPlayBackStarted!", level=xbmc.LOGNOTICE)
      systemctl("stop")

   def onPlayBackStopped(self):                                                 
      #xbmc.log("Snapcast event onPlayBackStopped!", level=xbmc.LOGNOTICE)
      systemctl("start")

   # 
   # Yatzee call addon will pause player on incoming call
   # can we mute the snapclient (or disable it) during call?
   #
   def onPlayBackPaused():
      xbmc.log("Snapcast event onPlayBackPaused!", level=xbmc.LOGNOTICE)

   def onPlayBackResumed():
      xbmc.log("Snapcast event onPlayBackResumed!", level=xbmc.LOGNOTICE)

if __name__ == '__main__':
   #xbmc.log("Initializing snapcast addon!", level=xbmc.LOGNOTICE)
   player = Player() 
   Monitor(player).waitForAbort()

