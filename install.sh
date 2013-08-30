# Clone dotfiles from GitHub into ~/.dotfiles
#git clone https://github.com/mcallan83/dotfiles.git ~/.dotfiles

# Create symbolic links to dotfiles in ~/.dotfiles
ln -s ~/.dotfiles/.slate ~/.slate
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile

# Run OSX Defaults
bash ~/.dotfiles/.osx

# KeyRemap4MacBook Config
mkdir -p ~/Library/Application\ Support/KeyRemap4MacBook
ln -s ~/.dotfiles/app_setting/keyremap4macbook/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml
