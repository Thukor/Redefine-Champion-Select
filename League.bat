
::Make sure to change this to the path of your cloned version
set rcsPATH="C:\Users\Christian\Desktop\Redefine-Champion-Select"
cd /d %rcsPATH%

::Runs ruby script
ruby main.rb

::Only change this if your game directory is different than this
start "" "C:\Riot Games\League of Legends\lol.launcher.exe"