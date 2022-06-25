#!/bin/bash

newtabi(){  
  osascript \
    -e 'tell application "iTerm2" to tell current window to set newWindow to (create tab with default profile)'\
    -e "tell application \"iTerm2\" to tell current session of newWindow to write text \"${@}\""
}

#Install Xcode-Tools
xcode-select -p 1>/dev/null
RESULT=$?

if [ $RESULT -eq 0 ]; then
	echo -e "\n[-] Command Line Tools Already Installled"
else
	echo -e "\n[+] Installing Command Line Tools"
	xcode-select --install
	sudo xcode-select --switch /Library/Developer/CommandLineTools
fi


#Install Brew
which brew 1> /dev/null
RESULT=$?
if [ $RESULT -eq 0 ]; then
	echo -e "\n[-] Brew Already Installed"
else
	echo -e "\n[+] Installing brew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"	
fi

activeuser=$(id -F | tr '[:upper:]' '[:lower:]')
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$activeuser/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

#Install Cask
which cask 1> /dev/null
RESULT=$?
if [ $RESULT -eq 0 ]; then
	echo -e "\n[-] Cask Already Installed"
else
	echo -e "\n[+] Installing Cask"
	brew install cask
fi


mdfind -name "Visual Studio Code" | grep "Code" 1>/dev/null && RESULT=0 || RESULT=1
if [ $RESULT -eq 0 ]; then
	echo -e "\n[-] VSCode Already Installed"
else
	echo -e "\n[+] Installing VSCode"
	brew install --cask visual-studio-code
fi

mdfind "iTerm.app" | grep "iTerm.app" 1>/dev/null && RESULT=0 || RESULT=1
if [ $RESULT -eq 0 ]; then
	echo -e "\n[-] iTerm Already Installed"
else
	echo -e "\n[+] Installing iTerm"
	brew install --cask iterm2
fi

if [ -d ~/.oh-my-zsh ]; then
	echo -e "\n[-] oh-my-zsh Already Installed"
 else
 	echo -e "\n[+] Installing oh-my-zsh"
 	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &
fi


#brew install zsh-autosuggestions
cat ~/.zshrc | grep "zsh-autosuggestions.zsh" 1>/dev/null && RESULT=0 || RESULT=1
if [ $RESULT -eq 0 ]; then
	echo -e "\n[-] zsh-autosuggestions Already Installed on zshrc"
else
	echo -e "\n[+] Installing autosuggestions"
	brew install zsh-autosuggestions
	echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
fi

#brew install zsh-syntax-highlighting
cat ~/.zshrc | grep "zsh-syntax-highlighting.zsh" 1>/dev/null && RESULT=0 || RESULT=1
if [ $RESULT -eq 0 ]; then
	echo -e "\n[-] zsh-syntax-highlighting Already Installed on zshrc"
else
	echo -e "\n[+] Installing zsh-syntax-highlighting"
	brew install zsh-syntax-highlighting
	echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
fi

#brew install powerlevel10k
cat ~/.zshrc | grep "powerlevel10k" 1>/dev/null && RESULT=0 || RESULT=1
if [ $RESULT -eq 0 ]; then
	echo -e "\n[-] powerlevel10k Already Installed on zshrc"
else
	echo -e "\n[+] Installing powerlevel10k Theme"
	brew install romkatv/powerlevel10k/powerlevel10k
	echo "source $(brew --prefix powerlevel10k)/powerlevel10k.zsh-theme" >> ~/.zshrc
fi


echo -e "\n[+] Installing Nodejs"
brew install node
echo -e "\n[+] Installing NPX"
npm install -g npx
echo -e "\n[+] Installing Nodemon"
npm install -g nodemon
echo -e "\n[+] Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo -e "\n[+] Installing PM2"
npm install pm2@latest -g
echo -e "\n[+] Installing Pycharm"
brew install --cask pycharm
echo -e "\n[+] Accepting XCode License"
sudo xcodebuild -license accept
echo -e "\n[+] Installing Firefox"
brew install --cask firefox
echo -e "\n[+] Installing Chrome"
brew install --cask google-chrome
echo -e "\n[+] Installing Chromium"
brew install --cask chromium
echo -e "\n[+] Installing brave-browser"
brew install --cask brave-browser
echo -e "\n[+] Installing VLC"
brew install --cask vlc
echo -e "\n[+] Installing Sublime-Text"
brew install --cask sublime-text
echo -e "\n[+] Installing Fig Autocomplete"
brew install --cask fig
echo -e "\n[+] Installing Warp Terminal"
brew install --cask warp
echo -e "\n[+] Installing Notion"
brew install --cask notion
echo -e "\n[+] Installing Slack"
brew install --cask slack
echo -e "\n[+] Installing Discord"
brew install --cask discord
echo -e "\n[+] Installing Spotify"
brew install --cask spotify
echo -e "\n[+] Installing OBS"
brew install --cask obs
echo -e "\n[+] Installing OBS Websocket Plugin"
brew install --cask obs-websocket
echo -e "\n[+] Installing Micro"
brew install micro
echo -e "\n[+] Installing Git"
brew install git
echo -e "\n[+] Installing Telegram"
brew install --cask telegram
echo -e "\n[+] Installing Neovim"
brew install neovim
echo -e "\n[+] Installing NvChad"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
echo -e "\n[+] Installing Rust"
brew install rust
echo -e "\n[+] Installing Go"
brew install go
echo -e "\n[+] Installing Openjdk"
brew install openjdk
echo -e "\n[+] Installing Docker"
brew install --cask docker
echo -e "\n[+] Installing MariaDB"
brew install mariadb
echo -e "\n[+] Installing MongodDB-community"
brew tap mongodb/brew
brew update
brew install mongodb-community@5.0
echo -e "\n[+] Installing Figma"
brew install --cask figma
echo -e "\n[+] Installing Pyenv"
brew install pyenv
echo -e "\n[+] Installing ccat"
brew install ccat
echo -e "\n[+] Installing bat"
brew install bat
echo -e "\n[+] Installing btop"
brew install btop
echo -e "\n[+] Installing m-cli"
brew install m-cli
echo -e "\n[+] Installing wget"
brew install wget
echo -e "\n[+] Getting background"
wget https://raw.githubusercontent.com/linkfy/Mac-Dev-Setup/0dcba66eae43c3330e411bbe7d8c0c701726db27/Background.png -O Background.png
mv Background.png ~/Pictures/
echo -e "\n[+] Setting background"
m wallpaper ~/Pictures/Background.png
echo -e "\n[+] Cleanup"
brew cleanup
echo -e "\n\n[~] Done!"
