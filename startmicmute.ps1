#----------------------------------------------------------------------------------------------#
#- intended for use with the "MicMute" program from https://sourceforge.net/projects/micmute/ -#
#- (made this since the program doesn't seem to be actively developed anymore and I liked it) -#
#----------------------------------------------------------------------------------------------#

##########################################################################################################################################################
####This script is a workaround to launch MicMute and kill it repeatedly a few times so that the program works as intended and the systray icon shows ####
####Script will only work as intended when you install MicMute to the default installation location (Program Files (x86), modify script for others    ####
##########################################################################################################################################################

#*** If you want to make a shortcut to run the script, follow this guide here, https://winaero.com/create-shortcut-ps1-powershell-file-windows-10/  
#all that will be in this github repo is the ps1 (powershell) script

#*** To add this as an entry in Task Scheduler, put the program as "powershell.exe" and then add the line below as the argument
# -ExecutionPolicy Bypass -Command " & 'C:\path\to\script\script.ps1'" -NoProfile -Noninteractive


#- elevate this script to admin level so that MicMute can detect the key shortcut in all programs (even those that are run as admin)

###### This first one below hides the console with the "-WindowStyle Hidden" parameter (second one commented out will show it)
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -WindowStyle Hidden -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

###### Uncomment one above and enable one below to show console when this runs (debugging purposes)
# if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    # exit;
# }

#- imports the wshell module to have gui dialogs pop up below
$wshell = New-Object -ComObject Wscript.Shell

# 0) initial run through that kills MicMute if detected (useful for running script after MicMute is already running), show a dialog that it is starting, then starts MicMute again
Get-Process Mic_Mute -ErrorAction SilentlyContinue | Stop-Process -PassThru
$Output = $wshell.Popup("MicMute is starting",0,"Please Wait",64+0)
& 'C:\Program Files (x86)\MicMute\mic_mute.exe'

# 1) kill MicMute if it is running, show a dialog that it has been killed 1 of 2 times, then restart it
Get-Process Mic_Mute -ErrorAction SilentlyContinue | Stop-Process -PassThru
$Output = $wshell.Popup("MicMute killed, pass 1/2",0,"MicMuteKilled 1/2",48+0)
& 'C:\Program Files (x86)\MicMute\mic_mute.exe'

# 2) kill MicMute if it is running, show a dialog that it has been killed 2 of 2 times, then restart it
Get-Process Mic_Mute -ErrorAction SilentlyContinue | Stop-Process -PassThru
$Output = $wshell.Popup("MicMute killed, pass 2/2",0,"MicMuteKilled 2/2",48+0)
& 'C:\Program Files (x86)\MicMute\mic_mute.exe'

#- Show a dialog once MicMute has been started
$Output = $wshell.Popup("MicMute was started successfully",0,"MicMute Started",64+0)

#Script by Success
#twitch.tv/successlive