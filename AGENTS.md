# AGENTS

## Repo Purpose
- This repo is a personal Linux workstation bootstrap + dotfiles repo (Arch/paru + GNOME/Niri tooling), not an app/library with build/test targets.

## High-Value Commands
- Full bootstrap: `./bootstrap.sh` (runs package install, extra package installers, postinstall system setup, then dotfile sync).
- Dotfiles sync only: `./config.sh`.
- Package install/update layer only: `./scripts/install.sh`.
- Post-install system changes only: `./scripts/postinstall.sh`.
- Ongoing machine updates: `./bin/mos-update`.

## Execution Constraints (Easy To Miss)
- Run scripts from repo root; many commands rely on relative paths like `./scripts/...`, `./bin/...`, `./config/...`, and `./wallpapers/...`.
- These scripts are intentionally machine-mutating (sudo, systemd enable, `chsh`, `/etc` writes, package install/remove). Do not run them casually in CI/sandbox.
- `bootstrap.sh` forcibly removes `jack` (`paru -Rdd`) before installing packages to avoid `pipewire-jack` conflicts.
- `config.sh` copies `bin/mos-*` into `~/.local/bin` and mirrors config into `~/.config/*`; treat it as deploy-to-home, not just local repo formatting.

## Structure Map
- `scripts/install.sh`: canonical package list (`pkgs`) and Arch/Flatpak install flow.
- `scripts/postinstall.sh`: host-level setup (zsh default shell, docker/libvirt groups + services, greetd config, GNOME gsettings).
- `config.sh`: syncs repo-managed config files into home directories and bootstraps tmux plugins.
- `bin/mos-pkg-*`: installers for AWS CLI, SAM CLI, DevPod.
- `bin/mos-gh-clone`: bulk clone helper using `gh` + `jq`, and sets per-repo local git identity.
- `config/`: source-of-truth dotfiles copied onto the machine.

## Editing & Verification
- No repo-native test/lint/typecheck pipeline is defined here; for script edits, prefer targeted checks like `bash -n <script>` (and `shellcheck` when available).
- Preserve idempotence patterns already used (for example: `[[ -f ... ]] || cp ...`, `|| true`, `--update=none`) unless intentionally changing behavior.
