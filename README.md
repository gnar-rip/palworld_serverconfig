# palworld_serverconfig
A much easier to read server config for Palworld Dedicated Servers

Place this file in ~/.steam/SteamApps/common/PalServer/Pal/Saved/Config/LinuxServer and replace the file currently there.

!MAKE A BACKUP OF YOUR CONFIG FIRST!

How to set up a dedicated server on Linux for PalWorld

1. Create a user with a home directory named palworldserver, add a SECURE password to this account
  - useradd -m palworldserver
  - sudo passwd palwordserver
2. Switch to palworldserver
  - su - palwordserver
3. Run the following commands in /home/palworldserver
  - steamcmd +login anonymous +app_update 2394010 validate +quit
4. Change to the server directory
  - cd ~/.steam/SteamApps/common/PalServer
5. Start your server with ./PalServer.sh

Once your server has been ran once, you can shut it down and configure your options:

1. Stop your server
2. Refresh your server directory
3. cd to /Pal/Saved/Config/LinuxServer and either edit or replace PalWorldSettings.ini (If this directory doesnt exist, you need to run your server at least once)

IF YOU GET AN ERROR WHEN STARTING THE SERVER:

1. .steam/sdk64/steamclient.so: cannot open shared object file: No such file or directory
    - mkdir -p ~/.steam/sdk64/
    - steamcmd +login anonymous +app_update 1007 +quit
    - cd ~/.steam/SteamApps/common/'Steamworks SDK Redist'/linux64/ (This is how it formatted the directory on my linux, it may look different for you. It is in the common directory tho, you  will see it)
    - cp steamclient.so ~/.steam/sdk64 (You NEED to use the one from the linux64 folder, if you dont you will get a different error I will list below.)
    - Start your server

2. /home/palworldserver/.steam/sdk64/steamclient.so: wrong ELF class: ELFCLASS32
    - Please refer to the first error, step 4.
  
Admin Commands -
  - In game, press enter and type /adminpassword PASSWORD in the chat box. This will give you admin.

RCON Access:
  - Edit the PalServerSettings.ini file, and locate these two lines:
    - RCONEnabled=False,
      RCONPort=25575
  - Change False to True, and set the port to whatever port you want to use for RCON (Make sure to open this port through port forwarding!)
  - Nodecraft developed a RCON console here: https://adminpal.gg/


Memory Checker Service -
  - Im lazy and dont want to write a full install thing, so only mess with this if you know what youre doin. Put the service and the timer where they need to go, and put the check_memory.sh in your server root. You can run check_memory.sh manuall without using the service/timer. The timer is set to restart the server every 3 hours currently, if you open the timer with nano or another editor you can just change the 3 to whatever number suits you.
