#Requires -Version 3


<#
.Synopsis
  Closes all processes that have windows open or minimized on the desktop with a 5-minute pop-up
  warning.
.Description
  This script will generate a 5-minute warning pop-up that prompts the user to either cancel the
  window closing process or to begin the process immediately. If the prompt goes unanswered after
  5 minutes the script will stop all processes with open or minimized windows on the desktop. It
  ends by closing the process running this script including the pop-up.
.Notes
  Author:         Anthony Farina
  Creation Date:  06/10/2021
  Version:        1.0.3
#>


# Declare global variables.
$PROMPT_MESSAGE = @'
All windows will be closed in 5 minutes.
Click "OK" to close all windows now or
Click "Cancel" to keep all the windows open.
'@


# This function will close all active windows on the desktop before closing itself.
function Close-AllWindows {
    # Close all active windows. Close all windows that may ask to save work before closing.
    Get-Process | Where-Object { $_.MainWindowTitle -ne "" -and $_.ProcessName -ne "powershell" } | Stop-Process
    Get-Process | Where-Object { $_.MainWindowTitle -ne "" -and $_.ProcessName -ne "powershell" } | Stop-Process

    # Close all active PowerShell windows (including this process).
    (New-Object -ComObject Shell.Application).Windows() | ForEach-Object { $_.Quit() }
}


# Make a popup window to give the user a 5 minute warning. "OK" will close the
# windows immediately and "Cancel" will exit the script.
$Prompt = New-Object -ComObject Wscript.Shell
$Response = $Prompt.Popup($PROMPT_MESSAGE, 300, "Closing All Windows Warning", 1 + 64)

# Check if the user selected "OK" (1) or the popup timer expired (-1).
If ($Response -eq 1 -or $Response -eq -1) {
    Close-AllWindows
}
