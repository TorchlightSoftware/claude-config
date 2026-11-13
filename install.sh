#!/usr/bin/env bash
# install.sh: puts claude-config into Claude Code's config directory (~/.claude, or $CLAUDE_CONFIG_DIR).
#
# Shared files are symlinked to this repo, so pulling the repo updates them. Whatever stood in their
# place moves to a backup beside the config directory (~/.claude.moved/<time>/), outside the
# directories Claude Code loads from.
# Per-user files are copied once from their *.example and never touched again; when one already
# exists, install says which example to compare it with.
# Safe to run again: links already in place are left alone.
set -euo pipefail

REPO=$(cd "$(dirname "$0")" && pwd)
CLAUDE_DIR=${CLAUDE_CONFIG_DIR:-$HOME/.claude}
BACKUP=$CLAUDE_DIR.moved/$(date +%Y%m%d-%H%M%S)

# The files every user shares, as paths relative to both the repo and the config directory.
shared() {
  printf '%s\n' standards.md commands.md tools.md skills/agenda
  (cd "$REPO" && printf '%s\n' commands/*.md)
}

# The files each user owns: CLAUDE.md chooses which of the shared files to import.
PER_USER=(CLAUDE.md personal.md tools.local.md settings.json)

# A per-user file's example in the repo: personal.md -> personal.example.md.
example() { echo "${1%.*}.example.${1##*.}"; }

# Whether a path in the config directory already links to its repo file.
linked() { [[ -L $CLAUDE_DIR/$1 && $(readlink "$CLAUDE_DIR/$1") == "$REPO/$1" ]]; }

# Moves whatever is at a config path, file, directory or link, into the backup.
move_aside() {
  mkdir -p "$(dirname "$BACKUP/$1")"
  mv "$CLAUDE_DIR/$1" "$BACKUP/$1"
  echo "moved $CLAUDE_DIR/$1 to $BACKUP/$1"
}

# Links a config path to its repo file, moving aside whatever was there.
link() {
  linked "$1" && return
  [[ -e $CLAUDE_DIR/$1 || -L $CLAUDE_DIR/$1 ]] && move_aside "$1"
  mkdir -p "$(dirname "$CLAUDE_DIR/$1")"
  ln -s "$REPO/$1" "$CLAUDE_DIR/$1"
  echo "linked $CLAUDE_DIR/$1"
}

# Copies a per-user file from its example, unless the user already has one.
copy_once() {
  local example; example=$(example "$1")
  if [[ -e $CLAUDE_DIR/$1 ]]; then
    echo "kept your $CLAUDE_DIR/$1; compare it with $REPO/$example and copy over what you want"
    return
  fi
  mkdir -p "$CLAUDE_DIR"
  cp "$REPO/$example" "$CLAUDE_DIR/$1"
  echo "created $CLAUDE_DIR/$1 from $example"
}

# The agenda skill needs ripgrep; install carries on without it, but says how to get it.
check_rg() {
  command -v rg >/dev/null && return
  local how='your package manager (the package is usually ripgrep)'
  [[ $(uname) == Darwin ]] && how='brew install ripgrep'
  echo "warning: rg (ripgrep) is not installed; the agenda skill needs it. Install it with $how."
}

check_rg
while read -r path; do link "$path"; done < <(shared)
for path in "${PER_USER[@]}"; do copy_once "$path"; done
