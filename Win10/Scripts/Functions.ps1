Add-Type -AssemblyName 'PresentationFramework'

function PopupConfirm([string]$question) {
    $Local:ShouldProceed = 'No'
    $ShouldProceed = [System.Windows.MessageBox]::Show($question, "Please confirm", 'YesNo');
    
    if ($ShouldProceed -eq 'Yes') { $true } else { $false } 
}

function PromptConfirm([string]$question) {
    $Local:KeyOptions = 'y' , 'n'
    $Local:KeyInput = 'z'
    while ($Local:KeyOptions -notcontains $KeyInput.Character) {
        Write-Host $question "(y/n)" -ForegroundColor Yellow
        $KeyInput = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
    if ($KeyInput.Character -eq 'y') { $true } else { $false } 
}

function TaskbarUnpin([string]$appname) {
    $ErrorActionPreference = 'silentlycontinue'
    ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | Where-Object { $_.Name -eq $appname }).Verbs() | Where-Object { $_.Name.replace('&', '') -match 'Unpin from taskbar' } | ForEach-Object { $_.DoIt(); }
    $ErrorActionPreference = 'continue'
}
