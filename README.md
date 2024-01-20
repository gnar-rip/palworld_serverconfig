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
