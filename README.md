# claude-config

A Claude Code setup you can install in one step: working standards, a set of slash commands for discussing, planning and carrying out work, and the `agenda` skill for keeping long discussions on track. It's one person's way of working, shared as is — take the parts you like and leave the rest.

## Install

```
git clone <this repo> ~/claude-config
~/claude-config/install.sh
```

Run it again any time; it only changes what isn't already in place. To update, `git pull` — the shared files are symlinks, so there is nothing to reinstall unless new files were added.

install.sh writes to `~/.claude`, or to `$CLAUDE_CONFIG_DIR` when that's set. Anything it replaces moves to `~/.claude.moved/<time>/`, outside the directories Claude Code loads from, so nothing is lost.

## What you get

Shared files are symlinked into `~/.claude` and stay in step with the repo:

- `standards.md` — coding, documentation, comments, privacy and file-reference standards.
- `commands.md` — the rules every command shares: how to report, how to research, watching for refactors, and plan document status lines.
- `commands/` — `/discuss`, `/plan`, `/task`, `/refactor`, `/commit`. Each holds only what's specific to its mode; they rely on `commands.md` for the rest.
- `skills/agenda` — `/agenda`, a stack of agendas that splits a long discussion into topics, each with its status, context, agreements and open questions. It stands alone: it works with or without the commands.
- `tools.md` — the tooling Claude can use across projects.

Per-user files are copied once from their `*.example` and are yours from then on; install never overwrites them:

- `CLAUDE.md` — chooses what to load, as `@` imports. Drop `@commands.md` to take the standards without the commands. An import of a file that doesn't exist is skipped silently.
- `personal.md` — how you like to work with Claude. The example is the author's; rewrite it as yours.
- `tools.local.md` — tooling on your machine only: private repositories, service accounts, instances.
- `settings.json` — Claude Code settings (model, editor mode, permissions). Copied rather than linked, because Claude Code rewrites it.

If you already have a `CLAUDE.md` or `settings.json`, install keeps it and names the example to compare it with: copy across the imports and settings you want.

## Requirements

- bash (the 3.2 that macOS ships is enough).
- [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) for the agenda skill. install.sh warns when it's missing but doesn't install it.
- [glow](https://github.com/charmbracelet/glow), optional: when installed, the agenda renders as formatted markdown in a terminal.

## Tests

- `test/install` — install.sh against a throwaway home for each case.
- `skills/agenda/test/run` — the agenda script. Linux only: it relies on bash 4's `mapfile` and util-linux's `script`.
