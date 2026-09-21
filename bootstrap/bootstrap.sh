#!/usr/bin/env bash
# computerstackgbt bootstrap for an existing Omarchy installation.
# Default: link the Codex layer only. Optional phases are explicit.
# Usage: bash bootstrap/bootstrap.sh [--dry-run] [--only codex|packages|runtimes|dotfiles|docker]
set -Eeuo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DRY_RUN=0
ONLY=codex

log() { printf '==> %s\n' "$*"; }
warn() { printf '!! %s\n' "$*" >&2; }
die() { warn "$*"; exit 1; }
have() { command -v "$1" >/dev/null 2>&1; }
run() {
  if (( DRY_RUN )); then printf 'would run:'; printf ' %q' "$@"; printf '\n'
  else "$@"
  fi
}

while (($#)); do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --only)
      (($# >= 2)) || die '--only needs a phase'
      case "$2" in codex|packages|runtimes|dotfiles|docker) ONLY="$2" ;; *) die "unknown phase: $2" ;; esac
      shift 2 ;;
    -h|--help) sed -n '2,4p' "$0"; exit 0 ;;
    *) die "unknown flag: $1" ;;
  esac
done

have omarchy && [[ -d /usr/share/omarchy ]] || die 'Omarchy is required'
log "Omarchy $(omarchy version) | phase: $ONLY | dry-run: $DRY_RUN"

link_item() {
  local src="$1" dst="$2"
  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    log "already linked: $dst"
  elif [[ "$dst" == "$HOME/.codex/AGENTS.md" && -f "$dst" && ! -s "$dst" ]]; then
    run mv "$dst" "$dst.bak.empty.$(date +%s)"
    run ln -s "$src" "$dst"
  elif [[ -e "$dst" || -L "$dst" ]]; then
    warn "kept existing file: $dst"
  else
    run mkdir -p "$(dirname "$dst")"
    run ln -s "$src" "$dst"
  fi
}

case "$ONLY" in
  codex)
    have codex || warn 'Codex is not on PATH; links can still be prepared'
    link_item "$REPO_DIR/codex/AGENTS.md" "$HOME/.codex/AGENTS.md"
    link_item "$REPO_DIR/codex/how-i-learn.md" "$HOME/.codex/how-i-learn.md"
    for src in "$REPO_DIR"/codex/agents/*.toml; do
      link_item "$src" "$HOME/.codex/agents/$(basename "$src")"
    done
    for src in "$REPO_DIR"/codex/skills/*; do
      [[ -d "$src" ]] || continue
      link_item "$src" "$HOME/.agents/skills/$(basename "$src")"
    done
    log 'Codex instructions, agents, and skills linked where no existing item conflicted'
    ;;
  packages)
    run omarchy pkg add git fzf zoxide atuin eza bat fd ripgrep sd git-delta jq yq tree shellcheck shfmt ruff prettier mise uv duckdb
    ;;
  runtimes)
    have mise || die 'mise is missing; install it before this phase'
    run mise use -g python@3.12
    log 'Existing Node and Codex versions are left as they are'
    ;;
  dotfiles)
    have git || die 'git is missing'
    git_include="$REPO_DIR/dotfiles/git/computerstackgbt.gitconfig"
    if git config --global --get-all include.path 2>/dev/null | grep -Fxq "$git_include"; then
      log 'Git include already registered'
    else
      run git config --global --add include.path "$git_include"
    fi
    ;;
  docker)
    warn 'Docker group membership gives root-equivalent access'
    run omarchy pkg add docker docker-compose docker-buildx
    run sudo systemctl enable --now docker
    run omarchy setup security sudoless docker
    ;;
esac

log 'Done. Existing ~/.codex/config.toml and ChatGPT app settings were not changed.'
