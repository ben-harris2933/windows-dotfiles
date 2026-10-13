Write-Host @"

This script will setup your user environment with terminal-oriented programs. It will OVERWRITE the following files:
    1. $HOME\AppData\Local\nvim\*
    2. $HOME\.tmux.conf
    2. $PROFILE

"@

$confirm = Read-Host -Prompt "type 'y' to confirm)"
if ($confirm -eq "y")
{
  Write-Host -ForegroundColor Green "Executing setup script now..."
} else
{
  exit 1
}

$packages = @(
  # Essential Programs
  "Neovim.Neovim"              # Terminal editor
  "marlocarlo.psmux"           # Terminal multiplexer

  # Version control
  "Git.Git"                    # Git for version control
  "JesseDuffield.lazygit"      # TUI interface for Git

  # Improved existing programs
  "ajeetdsouza.zoxide"         # Better cd program
  "eza-community.eza"          # Better ls program
  "sharkdp.bat"                # Better cat program
  "sharkdp.fd"                 # Better find program

  # Fuzzy programs
  "BurntSushi.ripgrep.MSVC"    # Fuzzy finder for text
  "junegunn.fzf"               # Fuzzy finder for files/folders
)

foreach ($package in $packages) {
    if (winget list -e --id $package | Select-String $package) {
        Write-Host -ForegroundColor Green "$package already installed. Skipping..."
    } else {
        Write-Host -ForegroundColor Yellow "$package not installed. Installing..."
        winget install --id $package --source winget
    }
}

Write-Host -ForegroundColor Yellow "Syncing Neovim configuration directory..."
robocopy ./neovim "$HOME/AppData/Local/nvim" /MIR | Out-Null

Write-Host -ForegroundColor Yellow "Syncing Tmux configuration..."
Copy-Item -Force ./tmux/tmux.conf "$HOME/.tmux.conf"

Write-Host -ForegroundColor Yellow "Syncing PowerShell profile configuration..."
Copy-Item -Force ./Microsoft.PowerShell_profile.ps1 "$PROFILE"
