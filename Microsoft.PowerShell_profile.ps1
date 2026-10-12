Set-Alias -Name v -Value "nvim"
Set-Alias -Name e -Value "eza"

# Initialize zoxide (smart cd'ing)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# CTRL+R for reverse command fuzzy history
function Invoke-FzfHistory {
    $command = (Get-Content (Get-PSReadlineOption).HistorySavePath | fzf)
    if ($command) {
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert($command)
    }
}
Set-PSReadLineKeyHandler -Key "Ctrl+r" -ScriptBlock { Invoke-FzfHistory }

# CTRL+t for fuzzy search for files/folders
function Invoke-FzfFileFolderFinder {
    fd --type file --follow --hidden --exclude .git |
    fzf --prompt 'Files> ' `
      --header-first `
      --header 'CTRL-S: Switch between Files/Directories' `
      --bind 'ctrl-s:transform:if not "%FZF_PROMPT%"=="Files> " (echo ^change-prompt^(Files^> ^)^+^reload^(fd --type file^)) else (echo ^change-prompt^(Directory^> ^)^+^reload^(fd --type directory^))' `
      --preview 'if "%FZF_PROMPT%"=="Files> " (bat --color=always {} --style=plain) else (eza -T --colour=always --icons=always {})'
}
Set-PSReadLineKeyHandler -Key "Ctrl+t" -ScriptBlock { Invoke-FzfFileFolderFinder }
