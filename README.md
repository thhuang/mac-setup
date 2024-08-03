# Mac Setup

## System Preferences

- Dock & Menu Bar
  - Dock Size: smaller
  - [Check] Automatically hide and show the Dock
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
  - Keyboard Shortcuts > Input Sources
    - [Uncheck] Select the previous import source ^Space
- Trackpad > Point & Click
  - Tracking speed: faster
  - [Check] Tap to click

## Applications

- [Chrome](https://www.google.com/chrome)
- [Xcode](https://apps.apple.com/tw/app/xcode/id497799835)
- [Grammarly](https://app.grammarly.com/apps)
- [Homebrew](https://brew.sh/)

## Fonts

- Fira Code, Hack Nerd Font, Meslo Nerd Font, and Lato
  ```sh
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code font-hack-nerd-font font-meslo-lg-nerd-font font-lato
  ```

## Terminal Settings

- iTerm2
  ```sh
  brew install --cask iterm2
  ```
- Preferences > Profiles > Text > Font
  - MesloLGS Nerd Font Mono
  - Regular
  - 14
  - 100
  - 100
- Preferences > Profiles > Colors > Color Presets
  - Download color schemes
    - [Tokyonight - Night](misc/tokyonight-night.itermcolors)
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
- Preferences > Profiles > Keys
  - Left Option key: Esc+
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

- Pass the bad match onto the command
  ```sh
  echo '\nsetopt no_nomatch # use the command as is when pattern matching fails' >> ~/.zshrc
  ```

## Command Line Tools

- cmake
  ```sh
  brew install cmake
  ```
- wget
  ```sh
  brew install wget
  ```
- htop
  ```sh
  brew install htop
  ```
- ncdu
  ```sh
  brew install ncdu
  ```
- tree
  ```sh
  brew install tree
  ```
- ripgrep
  ```sh
  brew install ripgrep
  ```
- git
  - [Connect to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
  - Config
    ```sh
    git config --global user.email "tzhsn.huang@gmail.com"
    ```
- lazygit
  ```sh
  brew install lazygit
  ```
- xcode command line tools
  ```sh
  xcode-select --install
  ```
- neovim
  ```sh
  brew install neovim
  ```

## Programming Language Runtimes

- Go
  - Download the binary release and untar it
  - Move the `go` folder into `~/Development/libraries/`
    ```sh
    mv ~/Downloads/go ~/Development/libraries/.
    ```
- Lua
  - Formatter: `stylua`
    ```sh
    brew install stylua
    ```
- NVM, Node.js, NPM, & Yarn
  <!-- ```sh -->
  <!-- brew install node -->
  <!-- npm install -g npm -->
  <!-- npm install -g yarn -->
  <!-- ``` -->
  ```sh
  echo 'zmodule lukechilds/zsh-nvm\n' >> ~/.zimrc
  zimfw install
  nvm install node
  nvm use node
  npm install -g npm
  npm install -g yarn
  npm install -g prettier
  ```
- Rust
  ```sh
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

## neovim

Soft link [`.config/nvim`](.config/nvim) to `~/.config/nvim`

- [Language Server Protocol](https://github.com/williamboman/nvim-lsp-installer)
  - C++: `clangd`
    ```sh
    brew install clang-format
    ```
  - Go: `gopls`
  - JSON: `jsonls`
  - Lua: `sumneko_lua`
  - Python: `pyright`
  - Rust: `rust_analyzer`
