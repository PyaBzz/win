Add-Type -AssemblyName 'PresentationFramework'
.".\Functions.ps1"

#==================  Disable automatic monitor turning off  ==================
$ShouldProceed = 'No'
$ShouldProceed = [System.Windows.MessageBox]::Show("Disable automatic monitor turning off?", "Please confirm", 'YesNo');

if ($ShouldProceed -eq 'Yes') {
    powercfg /SETACVALUEINDEX SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
}
else {
    Write-Output 'Skipped'  
} 

#==================  Remove Background Images  ==================
$ShouldProceed = [System.Windows.MessageBox]::Show("Remove lock screen and background of the login screen and wallpaper?", "Please confirm", 'YesNo');

if ($ShouldProceed -eq 'Yes') {
    reg import "..\RegistryTweaks\Backgrounds.reg"
}
else {
    Write-Output 'Skipped'  
} 

#==================  Tidy up Taskbar  ==================
$ShouldProceed = [System.Windows.MessageBox]::Show("Tidy up the taskbar?", "Please confirm", 'YesNo');

if ($ShouldProceed -eq 'Yes') {
    reg import "..\RegistryTweaks\Taskbar.reg"
    bazUnpin "Microsoft Edge"
    bazUnpin "Microsoft Store"
    bazUnpin "Store"
    bazUnpin "File Explorer"
    bazUnpin "Explorer"
    bazUnpin "Mail"
}
else {
    Write-Output 'Skipped'  
} 

#==================  Restart  ==================
$ShouldProceed = [System.Windows.MessageBox]::Show("Restart for the changes to take effect?", "Please confirm", 'YesNo');

if ($ShouldProceed -eq 'Yes') {
    shutdown /r /t 0
}
else {
    Write-Output 'Skipped'  
} 
