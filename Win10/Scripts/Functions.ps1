Add-Type -AssemblyName 'PresentationFramework'

function PopupConfirm([string]$question) {
    $Local:ShouldProceed = 'No'
    $ShouldProceed = [System.Windows.MessageBox]::Show($question, "Please confirm", 'YesNo');
    
    if ($ShouldProceed -eq 'Yes') { $true } else { $false } 
}

function bazUnpin([string]$appname) {
    $ErrorActionPreference = 'silentlycontinue'
    ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | Where-Object { $_.Name -eq $appname }).Verbs() | Where-Object { $_.Name.replace('&', '') -match 'Unpin from taskbar' } | ForEach-Object { $_.DoIt(); }
    $ErrorActionPreference = 'continue'
}
