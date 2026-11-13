# claude-config

This is one possible way to work with Claude Code: a set of commands that offer a design and implementation workflow.  Some goals:

- ability to get completely clear before beginning implementation
- have Claude maintain an "agenda" for you and talk about one topic at a time
- other guard rails for safe, predictable behavior
- "good" coding practices: review and feel free to change if you disagree

## The workflow

### 1. `/discuss` — explore before anything changes

Brainstorm, research and find the angles you hadn't considered. In this mode Claude changes no code. It searches the codebase, git history and the web, gathers evidence for its theories instead of guessing, tells you where your idea misunderstands the code or the tools, and keeps a list of proposals that waits for your go-ahead. Answers lead with the conclusion, not the story of how Claude got there.

Use it whenever you're not yet sure what you want: "why is this slow?", "how should tenants map to sites?", "is this library worth adopting?".

### 2. `/agenda` — organize and prioritize topic threads

When a discussion branches into more questions than you can hold in your head, `/agenda new` turns it into a list of topics. Each topic records its context, what's been agreed and what's still open, and whether the goal depends on it — the critical path. `/agenda next` picks the most important open topic and discusses just that one, and the agenda is updated after every decision.

The agenda survives compaction and new sessions, so you can come back tomorrow and pick up where you left off. Agendas stack: start a sub-discussion with `/agenda new` and `/agenda close` returns you to the one beneath. They're stored beside Claude's memory for the project, not in your repository.

### 3. `/plan` — for larger implementations

For feature sets and architecture that are too big to hold in one conversation, `/plan` writes markdown plans into the project's `plan/` directory: high-level approaches rather than code, user stories in the form "[Role] can [perform action]" that cut through every layer so a person can actually see them work. Before writing, Claude checks it can answer what, why, how and how we'll know it worked; if it can't, it asks.

Every plan carries a status line — draft, agreed, implemented or parked — so you can see at a glance what's settled. When a plan is built, it's deleted or trimmed to what's still open; anything worth keeping moves into the README or inline docs.

### 4. `/task` — build it, test it, leave it for review

Now Claude implements. It writes tests first, works until the objective is met and proven by tests, and stops to talk when it finds that something you asked it to hold fixed ("Given this config…") needs to change, rather than working around it. No hacks, no defensive patches over a problem it hasn't understood.

When it's done it reports four things: whether the objective was met, what it did and why, what it learned about deeper problems in the codebase, and what it would do next. The changes are left uncommitted, ready for you to review. When you're happy, `/commit` writes the message.

### Alongside

- `/refactor` — restructure code without changing behaviour; tests are checked before and must be in the same or better state after.
- `/commit` — commit with a terse, accurate summary of the changes.
- `standards.md` — the coding standards all of this works to: small functions with a clear intent, functional and data-driven design, test-driven development with fast unit tests, a canonical schema for data, comments in the language of the domain, and care with private information.

## Install

```
git clone <this repo> ~/claude-config
~/claude-config/install.sh
```

The shared files are symlinked into `~/.claude` (or `$CLAUDE_CONFIG_DIR`), so `git pull` updates them. Anything install replaces moves to `~/.claude.moved/<time>/`, so nothing is lost, and running it again is safe.

Some files are yours rather than shared. Install copies each from its `*.example` the first time and never overwrites it after:

- `CLAUDE.md` — chooses what Claude loads, as `@` imports. Remove `@commands.md` to take the standards without the commands.
- `personal.md` — how you like to work with Claude. The example is the author's; make it yours.
- `tools.local.md` — tools on your machine only: private repositories, service accounts.
- `settings.json` — Claude Code settings: model, editor mode, permissions.

If you already have a `CLAUDE.md` or `settings.json`, install keeps it and tells you which example to compare it with, so you can copy across what you want.

## Requirements

- bash; the 3.2 that macOS ships is enough.
- [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) for `/agenda`. install.sh warns if it's missing.
- [glow](https://github.com/charmbracelet/glow), optional: renders the agenda as formatted markdown in a terminal.

## Tests

- `test/install` — install.sh, against a throwaway home for each case.
- `skills/agenda/test/run` — the agenda script. Linux only: it relies on bash 4's `mapfile` and util-linux's `script`.
