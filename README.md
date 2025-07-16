# Dotfiles

Personal macOS development environment configuration using GNU Stow for symlink management.

## Quick Setup

```bash
# Clone repository
git clone <repo-url> ~/dotfiles
cd ~/dotfiles

# Install Homebrew dependencies
brew bundle

# Deploy configurations using Stow
stow .
```

## What's Included

### Shell & Terminal

- **Zsh** with Zinit plugin manager
- **Starship** prompt with custom configuration
- **Tmux** with session management via `sesh`
- **Ghostty** terminal emulator

### Development Tools

- **Git** configuration with aliases and diff-so-fancy
- **VS Code** extensions via Brewfile
- **Node.js** toolchain (nvm, bun, pnpm)
- **Development utilities** (bat, fzf, ripgrep, etc.)

### Key Features

- Automatic `.nvmrc` detection and switching
- Enhanced tmux session management with fuzzy finder
- Custom aliases for common commands
- Starship prompt with git integration
- Private environment variables via `~/.localrc`

## Manual Steps

1. **Tmux Plugin Manager**: Install TPM and plugins

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   # Press prefix + I in tmux to install plugins
   ```

2. **Private Config**: Create `~/.localrc` for environment variables
   ```bash
   touch ~/.localrc
   # Add your private environment variables here
   ```

## Key Bindings

### Tmux

- `Ctrl-a q` - Session switcher with fuzzy finder
- `Ctrl-a f` - Window switcher
- `Ctrl-a \` - Split horizontally
- `Ctrl-a -` - Split vertically

### Ghostty

- `F16` - Toggle quick terminal
- `Cmd+L` - Clear screen
- `Cmd+Backspace` - Clear line

## Customization

Configuration files are organized by application:

- Shell: `.zshrc`
- Git: `.gitconfig`
- Tmux: `.tmux.conf`
- Starship: `.config/starship.toml`
- Ghostty: `.config/ghostty/config`

The `.stow-local-ignore` file excludes `Brewfile` and `Raycast.rayconfig` from symlinking.
