$packages = @(
  "Git.Git"
  "JesseDuffield.lazygit"
  "Neovim.Neovim"
  "ajeetdsouza.zoxide"
  "eza-community.eza"
  "junegunn.fzf"
  "sharkdp.bat"
  "sharkdp.fd"
  "BurntSushi.ripgrep.MSVC"
  "JesseDuffield.lazygit"
)

foreach ($package in $packages) {
    if (winget list -e --id $package | Select-String $package) {
        Write-Host -ForegroundColor Green "$package already installed. Skipping..."
    } else {
        Write-Host -ForegroundColor Yellow "$package not installed. Installing..."
        winget install --id $package --source winget
    }
}
