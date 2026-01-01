# Repository Guidelines

## Project Structure & Module Organization

- `script/init.sh` – bootstraps the environment; ensures `uv` and `ansible` are available, then runs `ansible-playbook init.yaml`.
- `init.yaml` – main Ansible play that orchestrates install and configure steps.
- `task/install/` – per‑OS installers:
  - `darwin/base.yaml` uses Homebrew packages.
  - `linux/*.yaml` download tarballs and symlink binaries into `~/.local/bin`.
- `task/configure/` – creates symlinks and templates for `shell`, `git`, `ghostty`, `k9s`, `zed`, and `nvim`.
- `config/` – actual dotfiles and app configs: `.profile`, `.rc`, `.rc.d/*`, plus `nvim/`, `zed/`, `ghostty/`, `k9s/`, `git/`.
