---
description: A stack of agendas that splits a long discussion into topics, each with its status, context, agreements and open questions.
argument-hint: "[show | <n> | <n> delete | next | new | update | list | meta | close | force-close]"
disable-model-invocation: true
allowed-tools: Bash(${CLAUDE_SKILL_DIR}/agenda *)
---

DO NOT CHANGE THE CODE. The one change to the repository you may make is writing the planning documents `next` and `update` allow below. You touch agenda files only through the `agenda` script, never directly: not with Read, Edit or Write, and not with other shell commands.

/agenda $ARGUMENTS

What `agenda $0` printed as this command started:

!`${CLAUDE_SKILL_DIR}/agenda $0 2>&1 || true`

Agendas are a stack of markdown files beside your memory for this project (~/.claude/projects/<project>/agendas/<n>-<slug>.md); the highest n is the current agenda. When an agenda closes its file is deleted, so the one beneath it becomes current again.

## An agenda

An agenda has a title, the date it was created, its goal, and a summary: what we're discussing and why it matters. The goal is where the discussion is trying to get to, the outcome we measure it by: e.g. "Finalize the scraper's syntax so it can be implemented."

Its topics are numbered from 1, each with:

- **Title**: one short, plain clause naming the insight or question, e.g. "Precheck should hand the call its parsed arguments". No "so that", no reasons or qualifications after it: Context, Agreed and Open Questions hold those.
- **Status**: open | will plan | planned | dropped | will implement | implemented
- **Critical path**: yes when the goal can't be reached without deciding it; no otherwise
- **Depends on**: topic numbers, or none
- **Context**: what we know, one fact per item
- **Agreed**: one decision per item
- **Open Questions**: one question per item

Record decisions and questions, not transcript. A position is agreed only when we both hold it: what I intend; and what your research of the code, docs and tools reveals; line up. Where they don't, it's an open question, and say why. Update the agenda after every decision, before replying.

## The script

Run it as `${CLAUDE_SKILL_DIR}/agenda <command>` anywhere in the project: in a git repository, from any subdirectory or worktree; outside one, from the project's directory. A critical-path topic is decided when its status is anything but open. A write that would break the agenda is refused and changes nothing. Its help:

!`${CLAUDE_SKILL_DIR}/agenda help`

## Sub-Commands

- `show`, or no command, or after we resolve a topic and need to look for the next: relay the goal, the critical path and the table exactly as the script printed them; its status markers are the status colors. You see every open question; present only 1-3 of them, chosen as below, each under its topic's number and title as the script prints them, and say how many others remain.
- `new`: make a new agenda from the current conversation with `new`, then `add-topic` and `add`. Ask what the goal is if it isn't clear. Split the discussion into topics, record what's agreed and what's open, and reply with the index and the topic you recommend first, with a one-line reason. If another agenda is now beneath it, end with a one-line summary of that agenda.
- `update`: write the result of our discussion with the `agenda` script.  Perform the modifications within the current agenda.  Do not create a new agenda or close the current one.  Then write the planning documents for every topic at will plan, as below.
- `list`: relay the list the script printed.
- `meta`: relay the files the script printed.
- `<n> delete`: run `<n> delete` with the script, then relay what it printed. The topics after it now have new numbers.
- `<n>`: discuss only topic n of the current agenda. Research the code, docs and tools for evidence, but change no code; tell me where my ideas miss something; list your proposals, labeled as proposals, and wait for my approval before acting on them. When something is decided, update the agenda, and propose the next topic.
- `next` or `proceed`: first write the planning documents for every topic at will plan, as below; then choose the next topic as below, and proceed as though it was chosen with `<n>`.
- `close`: when the script closed the agenda, relay what it printed: the agenda beneath it is now the current one. When it refused, listing topics that are open, will plan or will implement, list them and confirm before closing; then run `force-close`, and relay what it printed.
- `force-close`: the script has already closed it; relay what it printed.

Choose what to discuss for the goal: open topics on the critical path first, and among them those other topics depend on. Topics off the critical path can wait; say so rather than raising them.

A topic that comes up mid-discussion goes to the end of the current agenda; decide whether it's on the critical path. Mention that you added it, but minimize your verbosity - don't unpack or go research it in detail.

`planned` means the topic was set aside into a plan document.

Planning documents: in `next` and `update`, a topic at will plan has an agreed plan, so write it without waiting to be asked. Write only what its Agreed items settle: a new plan, or changes to the stories, plans and backlog documents the topic names. Each plan carries a status line directly under its H1 title, `Status: <draft|agreed|implemented|parked> — <optional one-line note>`, and describes high-level approaches rather than code, long unwrapped lines, and links between documents kept current. Then set the topic to planned, and say in one line which documents you wrote. Open questions stay out of the documents, or appear in them as open; never write them up as decided. Outside `next` and `update`, write planning documents only when I ask.

Be concise: one topic per reply.  When you mention other related topics within the agenda, please refer to them by their titles, not simply by their numbers.  The agenda file is for YOU to keep track of the conversation, but it's unlikely that I will have it in front of me.  So it's still up to you to communicate in plain English.  Whenever you switch to a new topic, restate the current state of that topic: context, what has been agreed upon, and what remains as open questions.  Don't assume I have this information in my head.  Frame the open questions as open questions, not as decisions you have already made and are proposing to me.  If you have proposals, list them, but label them clearly as your proposals, and don't omit the context for why we were asking the question in the first place.
