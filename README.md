# Mac Setup
Updated: 2022/01/14

## System Preferences
- Dock & Menu Bar
  - Dock Size: smaller
  - [Check] Automatically hide and show the Dock
  - [Check] Automatically hide and show the menu bar on desktop
  - [Check] Automatically hide and show the menu bar on full screen
- Keyboard
  - Keyboard
    - Key Repeat: fast
    - Delay Until Repeat: short
  - Input Sources
    - Add
      - ABC
      - Zhuyin - Traditional
    - Settings
      - [Uncheck] Use the 中/英 key to switch to and from ABC
- Trackpad > Point & Click
  - [Check] Tap to click

## Applications
- [Chrome](https://www.google.com/chrome)
- [Xcode](https://apps.apple.com/tw/app/xcode/id497799835)
- [Grammarly](https://app.grammarly.com/apps)
- [Homebrew](https://brew.sh/)

## Fonts
- Fira Code, Hack Nerd Font, and Lato
  ```sh
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code font-hack-nerd-font font-lato
  ```

## Terminal Settings
- iTerm2
  ```sh
  brew install --cask iterm2
  ```
- Preferences > Profiles > Text > Font
  - Fira Code
  - Regular
  - 14
  - 100
  - 100
- Z shell (if zsh is not the default shell)
  ```sh
  chsh -s /bin/zsh
  ```
- [Zim](https://github.com/zimfw/zimfw)
  ```sh
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
  ```
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
  ```sh
  echo '\n# -------\n# thhuang\n# -------\nzmodule romkatv/powerlevel10k --use degit\n' >> ~/.zimrc
  zimfw install
  
  # configuration wizard
  p10k configure
  
  # configuration file
  vi ~/.p10k.zsh
  ```
- Preferences > Profiles > Colors > Color Presets
  - Download [Color Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)
    - [Neutron](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Neutron.itermcolors)
      - Preferences > Profiles > Colors > Color Presets > ANSI Colors > Black > Normal: 30% Gray
      - Preferences > Profiles > Colors > Color Presets > ANSI Colors > Black > Bright: 40% Gray
- Preferences > Profiles > Session
  - [Check] Status bar enabled
  - Configure Status Bar
    - Active Components
      - CPU Utilization
      - Memory Utilization
      - Network Throughput
    - Auto-Rainbow: Light Colors

## Command Line Tools
- htop
  ```sh
  brew install htop
  ```
- git
  - [Connect to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- neovim
  ```sh
  brew install neovim
  ```
  
## neovim
- Create config
  ```sh
  mkdir -p ~/.config/nvim
  touch ~/.config/nvim/init.vim
  ```
- Install [vim-plug](https://github.com/junegunn/vim-plug)
  ```sh
  sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  ```
- Create a file for plugins
  ```sh
  mkdir ~/.config/nvim/vim-plug
  touch ~/.config/nvim/vim-plug/plugins.vim
  ```
- Create a file for settings
  ```sh
  touch ~/.config/nvim/settings.vim
  ```
- Add the following to `~/.config/nvim/settings.vim
  ```vim
  set number
  set relativenumber
  set mouse=a
  set autoindent
  set tabstop=4
  set shiftwidth=4
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).

  inoremap jk <esc>
  ```
- Add the following to `~/.config/nvim/vim-plug/plugins.vim`
  ```vim
   call plug#begin('~/.config/nvim/autoload/plugged')

      "File system explorer
      Plug 'https://github.com/preservim/nerdtree'

      " Status bar
      Plug 'https://github.com/vim-airline/vim-airline'

      " Auto pairs for '(' '[' '{'
      Plug 'https://github.com/jiangmiao/auto-pairs'

      " Commenting with gcc & gc
      Plug 'https://github.com/tpope/vim-commentary'

  call plug#end()
  ```
- Add the following to `~/.config/nvim/init.vim`
  ```vim
  " Settings
  source $HOME/.config/nvim/settings.vim
  
  " Plugins
  source $HOME/.config/nvim/vim-plug/plugins.vim
  ```
