# No longer using this, I now use https://github.com/SaifAqqad/AHK_MicMute instead

# micmute_pscript 

* Powershell companion script to make the "MicMute" program originally by mistificat0r on sourceforge work properly since it seems to not be updated any longer

  * This script is a workaround to launch MicMute and kill it repeatedly a few times so that the program works as intended and the systray icon shows
  * For use with the "MicMute" program from https://sourceforge.net/projects/micmute/
  * (made this since the program doesn't seem to be actively developed anymore and I liked it)



* Script will only work as intended when you install MicMute to the default installation location `(Program Files (x86)`. You will need to modify the script if you installed it in a different location

## Repo only contains the ps1 (powershell) script (anything else you must do yourself - I will NOT be providing any further support for this beyond the instructions in this readme)

- If you want to make a shortcut to run the script, follow this [guide here](https://winaero.com/create-shortcut-ps1-powershell-file-windows-10/),   

- To add this as an entry in Task Scheduler (to start on boot or login), put the program as `powershell.exe` and then add the line below as the argument
`-ExecutionPolicy Bypass -Command " & 'C:\path\to\script\script.ps1'" -NoProfile -Noninteractive`

#

While you're here I do mods for the Arkham Games and stream when I am working on them among other stuff so check me out [ on Twitch](https://rebrand.ly/successtwitch)

Hope this helps :D
