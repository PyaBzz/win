.".\Functions.ps1"

#======================================================
$ShouldProceed = 'No'
$ShouldProceed = PopupConfirm("Disable automatic monitor turning off?");

if ($ShouldProceed) {
    powercfg /SETACVALUEINDEX SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
}
else {
    Write-Output 'Skipped'  
} 

#======================================================
$ShouldProceed = PopupConfirm("Remove background images?");

if ($ShouldProceed) {
    reg import "..\RegistryTweaks\Backgrounds.reg"
}
else {
    Write-Output 'Skipped'  
} 

#======================================================
$ShouldProceed = PopupConfirm("Clean-up the taskbar?");

if ($ShouldProceed) {
    reg import "..\RegistryTweaks\Taskbar.reg"
}
else {
    Write-Output 'Skipped'  
} 

#======================================================
$ShouldProceed = PopupConfirm("Restart for the changes to take effect?");

if ($ShouldProceed) {
    shutdown /r /t 0
}
else {
    Write-Output 'Skipped'  
} 
