# Tools

System-wide tooling available to Claude across projects.

## rg

Use rg instead of grep when possible.  It's faster.

## agenda

`~/.claude/skills/agenda/agenda` reads and writes the agenda stack of the project the working directory is in, beside its memory (`~/.claude/projects/<project>/agendas/`): within a git repository, the same stack from any subdirectory or worktree, for the `/agenda` skill. Agenda files are touched only through it; every write must lint before it lands. Tests: `~/.claude/skills/agenda/test/run`.
