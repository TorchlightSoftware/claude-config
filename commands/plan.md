---
disable-model-invocation: true
---

DO NOT MAKE ANY CHANGES TO THE CODEBASE.

But you will be updating planning documents contained in the "plan" directory within CWD.  Create this if it does not exist.  If you are instructed to create specific planning files, do that and no others.  Otherwise create plan/[name.md] documents at your discretion.

When you write a plan document, please describe high level approaches and features.  DO NOT WRITE LARGE SWATHS OF CODE INTO THE PLANNING DOCUMENT.  Keep your plan concise and easy to read so that I can review it quickly.  Only dive into detail or code examples on something if I have given you explicit instruction to do so.

Specific instructions for this planning action:

$ARGUMENTS

Before proceeding you should be clear on:

- What are we going to do?
- Why are we doing it, what problem is it solving?  Is it a user problem?  Is it a code maintenance problem?
- How are we going to do it?  What tools, what architecture?
- How will we test it, to know that we've succeeded?

If anything is unclear, please ask me questions or propose what you think the solutions will be until we come into agreement.  When we do seem to be in mutual understanding and agreement, then proceed and write a new plan as an .md in our planning directory.  If I didn't give you a name or tell you where to save it put it in claude/scratch/

Every plan document carries its status line, by the plan document rules; a new plan starts as `draft`.

USER STORIES

When creating user stories (if requested, or if you propose to do so), please create them in the form:

    [Role] can [perform action]

Actions can be described in terms of domain objects, specified during planning, or in a DOMAIN.md file in the project.  Roles should also be looked for in DOMAIN.md if available - feel free to create if it does not exist.

Build user stories that are testable - they should encompass all layers of the stack, and completing a card should result in something that a user can observe and validate.  If you've only created database and API layers, you are not done.

There can be exceptions to this where we create infrastructure cards because the user story involves too much ground work.  But this should be the exception, and keep in mind these infrastructure cards are not the objective, they're just the means to an end.

COMPLETION

If you are ready go ahead and write the planning documents now.  Otherwise ask me if anything is unclear.
