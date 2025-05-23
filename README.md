# 🛠️ dotbins Tool Collection

[![dotbins](https://img.shields.io/badge/powered%20by-dotbins-blue.svg?style=flat-square)](https://github.com/basnijholt/dotbins) [![Version](https://img.shields.io/badge/version-2.3.0-green.svg?style=flat-square)](https://github.com/basnijholt/dotbins/releases)

This directory contains command-line tools automatically managed by [dotbins](https://github.com/basnijholt/dotbins).

## 📋 Table of Contents

- [What is dotbins?](#-what-is-dotbins)
- [Installed Tools](#-installed-tools)
- [Tool Statistics](#-tool-statistics)
- [Shell Integration](#-shell-integration)
- [Installing and Updating Tools](#-installing-and-updating-tools)
- [Quick Commands](#-quick-commands)
- [Configuration File](#-configuration-file)
- [Additional Information](#ℹ️-additional-information)

## 📦 What is dotbins?

**dotbins** is a utility for managing CLI tool binaries in your dotfiles repository. It downloads and organizes binaries for popular command-line tools across multiple platforms (macOS, Linux) and architectures (amd64, arm64).

**Key features:**

- ✅ **Cross-platform support** - Manages tools for different OSes and CPU architectures
- ✅ **No admin privileges** - Perfect for systems where you lack sudo access
- ✅ **Version tracking** - Keeps track of installed tools with update timestamps
- ✅ **GitHub integration** - Automatically downloads from GitHub releases
- ✅ **Simple configuration** - YAML-based config with auto-detection capabilities

Learn more: [github.com/basnijholt/dotbins](https://github.com/basnijholt/dotbins)

## 🔍 Installed Tools

| Tool | Repository | Version | Updated | Platforms & Architectures |
| :--- | :--------- | :------ | :------ | :------------------------ |
| [fzf](https://github.com/junegunn/fzf) | junegunn/fzf | 0.62.0 | May 23, 2025 | linux (amd64) |
| [git-lfs](https://github.com/git-lfs/git-lfs) | git-lfs/git-lfs | 3.6.1 | May 23, 2025 | linux (amd64) |
| [gum](https://github.com/charmbracelet/gum) | charmbracelet/gum | 0.16.0 | May 23, 2025 | linux (amd64) |
| [hx](https://github.com/helix-editor/helix) | helix-editor/helix | 25.01.1 | May 23, 2025 | linux (amd64) |
| [lazygit](https://github.com/jesseduffield/lazygit) | jesseduffield/lazygit | 0.51.0 | May 23, 2025 | linux (amd64) |
| [starship](https://github.com/starship/starship) | starship/starship | 1.23.0 | May 23, 2025 | linux (amd64) |
| [yazi](https://github.com/sxyazi/yazi) | sxyazi/yazi | 25.4.8 | May 23, 2025 | linux (amd64) |
| [zesh](https://github.com/roberte777/zesh) | roberte777/zesh | zesh-v0.3.0 | May 23, 2025 | linux (amd64) |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | ajeetdsouza/zoxide | 0.9.7 | May 23, 2025 | linux (amd64) |

## 📊 Tool Statistics

<div align='center'><h3>📦 9 Tools | 💾 102.65 MB Total Size</h3></div>

| Tool | Total Size | Avg Size per Architecture |
| :--- | :-------- | :------------------------ |
| hx | 24.2 MB | 24.2 MB |
| lazygit | 20.81 MB | 20.81 MB |
| yazi | 15.76 MB | 15.76 MB |
| gum | 12.7 MB | 12.7 MB |
| git-lfs | 11.65 MB | 11.65 MB |
| starship | 11.34 MB | 11.34 MB |
| fzf | 3.7 MB | 3.7 MB |
| zesh | 1.28 MB | 1.28 MB |
| zoxide | 1.21 MB | 1.21 MB |

## 💻 Shell Integration

Add one of the following snippets to your shell configuration file to use the platform-specific binaries:

For **Bash**:
```bash
source $HOME/projekty/gitpod-dotfiles/shell/bash.sh
```

For **Zsh**:
```bash
source $HOME/projekty/gitpod-dotfiles/shell/zsh.sh
```

For **Fish**:
```fish
source $HOME/projekty/gitpod-dotfiles/shell/fish.fish
```

For **Nushell**:
```nu
source $HOME/projekty/gitpod-dotfiles/shell/nushell.nu
```

## 🔄 Installing and Updating Tools

### Install or update all tools
```bash
dotbins sync
```

### Install or update specific tools only
```bash
dotbins sync tool1 tool2
```

### Install or update for current platform only
```bash
dotbins sync --current
```

### Force reinstall of all tools
```bash
dotbins sync --force
```


## 🚀 Quick Commands

<details>
<summary>All available commands</summary>

```
dotbins list           # List all available tools
dotbins init           # Initialize directory structure
dotbins sync           # Install and update tools to their latest versions
dotbins readme         # Regenerate this README
dotbins status         # Show installed tool versions
dotbins get REPO       # Install tool directly to ~/.local/bin
```

For detailed usage information, run `dotbins --help` or `dotbins <command> --help`
</details>

## 📁 Configuration File

dotbins is configured using a YAML file (`dotbins.yaml`).
This configuration defines which tools to manage, their sources, and platform compatibility.

**Current Configuration:**

```yaml
# dotbins configuration for Gitpod
# See https://github.com/basnijholt/dotbins for more information

# Directory where tool binaries will be stored
#tools_dir: ~/.dotbins
tools_dir: ''

# Target platforms and architectures for which to download binaries
# These determine which system binaries will be downloaded and managed
platforms:
  linux:
    - amd64  # x86_64

# Tool definitions
# Format: tool_name: owner/repo or detailed configuration
tools:
  # Essential CLI tools with minimal configuration
  #bat: sharkdp/bat           # Syntax-highlighted cat replacement
  fzf:
    repo: junegunn/fzf
    shell_code:
      bash: eval "$(fzf --bash)"
  git-lfs: git-lfs/git-lfs
  gum: charmbracelet/gum
  hx: helix-editor/helix
  lazygit:
    repo: jesseduffield/lazygit
    shell_code:
      bash: alias lg="lazygit"
  starship:
    repo: starship/starship
    shell_code:
      bash: eval "$(starship init bash)"
  yazi: sxyazi/yazi
  zesh: roberte777/zesh
  zoxide:
    repo: ajeetdsouza/zoxide
    shell_code:
      bash: eval "$(zoxide init bash)"
  zoxide: ajeetdsouza/zoxide # Smarter cd command with frecency
# For more configuration options, visit:
# https://github.com/basnijholt/dotbins#gear-configuration
```

## ℹ️ Additional Information

* This README was automatically generated on May 23, 2025
* Current platform: **linux/amd64**
* For more information on dotbins, visit https://github.com/basnijholt/dotbins