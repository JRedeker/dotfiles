# This is meant to be used only ONCE during setup of new windows box

# Install latest version of Powershell
winget install --id Microsoft.Powershell --source winget

# Upgrade any existing  WinGet packages
winget upgrade --all

# Install latest gsudo
winget install gerardog.gsudo

# Restart Shell

# Install Choco
gsudo Set-ExecutionPolicy AllSigned or Set-ExecutionPolicy Bypass -Scope Process
gsudo Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Restart Shell

# Install CascadiaCode Nerd Font for Starship
choco install cascadia-code-nerd-font

# Install Starship
winget install --id Starship.Starship
echo "Invoke-Expression (&starship init powershell)">> $PROFILE
starship preset nerd-font-symbols -o ~/.config/starship.toml


# Grab other dotfiles needed from this repository??

# Update all Choco apps
gsudo choco upgrade all -y

# Install WSL2
wsl --install

# Enable vm platform on windows
gsudo Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform