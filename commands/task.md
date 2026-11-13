---
disable-model-invocation: true
---

Please complete the following tasks:

$ARGUMENTS

If you are unclear about any aspect of the instructions, please ask before proceeding, but don't be pedantic or dive into extraneous details.  I trust you to accomplish the implementation, but we should talk if the specification is unclear.

If I say things like "Given..." I mean to hold this as an INVARIENT.  For instance "Given this config.yaml..." means don't change the config.yaml, and if it appears like the config.yaml needs to be changed, then speak to me about this and come to agreement before proceeding.

If I use imperative language like "Run the tests and fix any errors that come up." I am describing the OBJECTIVE.  Do your best to achieve the OBJECTIVE with the resources at your disposal, and only stop if your options are exhausted.  OBJECTIVE should only be considered complete if you have tested it, and you can point to tests showing that it is working correctly.

DO NOT implement OBJECTIVE through hacks, defensive coding, or code duplication of any kind.  If there are underlying problems with the implementation, i.e. places where the system is not delivering on its implicit promise, investigate the root cause of that problem and STOP AND TALK TO ME.  This is a sign that the INVARIENTS are faulty, and conversation is required before proceeding.

If this task implements a plan document, keep its status line current and delete it on done, by the plan document rules.

When you have completed OBJECTIVE or failed to complete OBJECTIVE because you don't have the necessary tools, information, or authority, then please report back your findings.

1. Was the OBJECTIVE completed?
2. What did you do and why? (be concise, summarize)
3. Did you learn anything about the code base that reveals deeper underlying issues? (again, be concise)
4. What next steps would you propose? (please include any production migration & deploy commands that should be run)

Leave the files uncommitted for me to review.  DO NOT RUN ANY GIT COMMANDS THAT MODIFY THE GIT REPOSITORY OR LOCAL FILES UNLESS SPECIFICALLY INSTRUCTED TO DO SO.  If these commands seem necessary, please ask for my assistance.

Thank you and best wishes as you accomplish this task.  We appreciate your contributions and we value your insights.
