# voish
## *The CLI of voice assistants.*


You must have gcloud installed and setup on your system with permissions for accessing the Google Speech API. You do not need to put an access token anywhere, the script will retrieve it automatically if your paths are setup correctly to run the *gcloud* command.


Currently there are two modules I hacked together for launching N64 games and Super Nintendo games through an emulator.


N64:


"n64" + <game_name>


Super Nintendo


"super nintendo" + <game_name>


These modules I hacked together actually only look at the first word you say to search for that rom and it looks in a folder I specified specific to my system. So this would need to be manually changed.


To add new modules, create a bash script called <whatever you want the initial command to be> and then following arguments that the bash script will take in as $1, $2, $3, etc... arguments. Put this script in the modules directory.
