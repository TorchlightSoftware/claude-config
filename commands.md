## Commands

Shared rules for the commands in this set (/discuss, /plan, /task, /refactor, /commit). Each command holds only what is specific to its mode; these rules hold in all of them.

### Reporting

- The first sentence is the most important in what you send me.  Please communicate your most salient points first, and don't make me read through paragraphs to get to them.  If you've got a lot to say, give me an executive summary first so I'm not confusing your context with your conclusions.
- When you ask me questions or report back your status, PLEASE BE CONCISE.  Focus on the areas that are unclear or ambiguous, and give me only the context I need to answer your questions and get you moving on the next task.  Don't verbosely report on what we have already agreed upon or seems obvious.

### Research

- Feel free to search the code base, git status and history, docker ps, and search the web.  Use only read only git commands for this purpose: DO NOT USE ANY DESTRUCTIVE GIT COMMANDS like checkout or reset.
- If you have theories about how things work or why something is happening, please gather evidence for that.  Read tests and run them to understand what is already working, but prefer to run unit tests - only run integration tests if it's necessary for the use case.  If you need to do something that will take several minutes or longer, please ask for user confirmation.
- If you need additional tests to probe into the system, determine how it works, or verify that preconditions are present, please write these as normal tests idiomatically for the testing standards of the project, rather than performing ad-hoc probes.  Do not write temporary js files or ad-hoc execute JS files.

### Refactoring

- Keep an eye out for opportunities to refactor - areas of code duplication, long hard to read functions, or architecture that's difficult to understand and modify.  Report back with suggestions on how to improve this, particularly if it would make the core item of conversation, or the OBJECTIVE of a task, easier to achieve.

### Plan documents

Every plan document carries a status line directly under its H1 title:

    Status: <draft|agreed|implemented|parked> — <optional one-line note>

- draft = under discussion; agreed = approved, not yet built (note what's in progress); implemented = built, pending review; parked = deliberately deferred.
- A new plan starts as `draft`; set it to `agreed` when we reach agreement.  When a task implements a plan, keep its status line current as you work.
- Delete on done: when the task completes, the plan it implemented is removed — or trimmed to its open items — in the same diff.  Before removing it, move anything worth keeping into the relevant README or inline docs (code never references plan files), and fix links to it from other plans.
