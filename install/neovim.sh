# Install NeoVim
brew install neovim

# Install dependencies for the nvim configs, mainly LSPs and formatters

# Lua formatter, LSP and package manager
brew install stylua lua-language-server luarocks

# Go formatter and LSP
brew install goimports gofmt gopls templ

# LSP for HTML, CSS, JS
brew install vscode-langservers-extracted
brew install typescript-language-server

# PostCSS LSP (tailwind supports it)
npm install -g @tailwindcss/language-server

# CSS Modules LSP
npm install -g cssmodules-language-server

# Formatter for front-end stuff: HTML, CSS, JS, React, TS, etc.
brew install prettierd prettier

# Dockerfile LSP
brew install dockerfile-language-server

# PHP
npm install -g intelephense

# SQL formatter
brew install pgformatter sqlfluff


