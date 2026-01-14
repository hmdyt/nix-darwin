# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概要

macOS (Apple Silicon) 向けの nix-darwin + home-manager 設定リポジトリ。

## よく使うコマンド

```bash
# 設定を適用（ビルド＆スイッチ）
make
# または: sudo darwin-rebuild switch --flake .

# フォーマット
nix fmt

# flake.lock を更新
nix flake update
```

## アーキテクチャ

```
flake.nix              # エントリーポイント、inputs定義、overlay設定
├── configuration.nix  # システム設定（homebrew casks、macOS defaults、launchd）
├── home.nix           # ユーザー設定（CLIツール、シェル、dotfiles）
└── pkgs/              # カスタムパッケージ（node2nixで生成）
```

- **configuration.nix**: Homebrew casks、Dock/Finder/Trackpad設定、Touch ID sudo、NASマウントdaemon
- **home.nix**: CLIパッケージ、zsh/starship/fzf、git、VSCode、Karabiner設定、SSH
- **pkgs/**: overlayで追加するカスタムパッケージ（difitはnode2nixでビルド）
