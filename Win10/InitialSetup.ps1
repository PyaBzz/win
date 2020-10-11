.".\Scripts\Functions.ps1"

#======================================================
$ShouldProceed = PromptConfirm("Disable system restore?");

if ($ShouldProceed) {
    (Get-Partition).DriveLetter -match '^[A-Z]$' | ForEach-Object {
        Disable-ComputerRestore $_":\"
        Write-Host "Disabled on "$_":\"
    }
}
else {
    Write-Output 'Skipped'  
} 

#======================================================
$ShouldProceed = PromptConfirm("Disable automatic monitor turning off?");

if ($ShouldProceed) {
    powercfg /SETACVALUEINDEX SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
}
else {
    Write-Output 'Skipped'  
} 

#======================================================
$ShouldProceed = PromptConfirm("Remove background images?");

if ($ShouldProceed) {
    reg import ".\RegistryTweaks\Backgrounds.reg"
}
else {
    Write-Output 'Skipped'  
} 

#======================================================
$ShouldProceed = PromptConfirm("Clean-up the taskbar?");

if ($ShouldProceed) {
    Remove-Item "$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"
    reg import ".\RegistryTweaks\Taskbar.reg"
    TaskbarUnpin "Microsoft Edge"
    TaskbarUnpin "Microsoft Store"
    TaskbarUnpin "Store"
    TaskbarUnpin "File Explorer"
    TaskbarUnpin "Explorer"
    TaskbarUnpin "Mail"
}
else {
    Write-Output 'Skipped'  
}

#======================================================
$ShouldProceed = PromptConfirm("Disable scheduled disk defrag?");

if ($ShouldProceed) {
    if ((Get-ScheduledTask -TaskName 'ScheduledDefrag').State -eq 'Ready') {
        Write-Output "Task found. Disabling ..."
        Disable-ScheduledTask -TaskName 'ScheduledDefrag' -TaskPath '\Microsoft\Windows\Defrag'
    }
    else {
        Write-Output "Task not found or disabled."
        Get-ScheduledTask -TaskName 'ScheduledDefrag'
    }
}
else {
    Write-Output 'Skipped'  
} 

#======================================================
$ShouldProceed = PromptConfirm("Set updates to important/stable only?");

if ($ShouldProceed) {
    reg import ".\RegistryTweaks\Updates.reg"
}
else {
    Write-Output 'Skipped'  
} 

#======================================================
$ShouldProceed = PromptConfirm("Restart for the changes to take effect?");

if ($ShouldProceed) {
    shutdown /r /t 0
}
else {
    Write-Output 'Skipped'  
} 
