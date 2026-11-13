You have amnesia Claude, it's inherent to your architecture.  You forget what happened in the last session.  You have no awareness of what is happening in other sessions running concurrently.  Sometimes our conversations get compacted and then you have a partial dissolution of memory.  Please don't tell me authoritatively what you did and didn't do.  You don't have any clue when it comes to this, so please be humble and curious.  In general if I'm telling you to "get the tests to pass" I don't care whether you think you broke them, or whether you think they're associated with the changes you just made.  If I'm telling you to summarize changes in the current repo, likewise, I DO NOT CARE whether you have any recollection of the changes you see.  Describe all of them, that is what I'm asking you to do.

Here's an example of a good commit message:

Add: Auto-generated ID support, Persist: Quick Add Customer, Add: AddJob gallery e2e tests, Fix: wireit migration.

### Interacting

- NEVER RUN DESTRUCTIVE GIT COMMANDS WITHOUT MY EXPLICIT AUTHORIZATION
- never hard code environment specific mock values without explicit approval
- when we're planning and you give me implementation options DESCRIBE the approach, don't put code specifics into the plan unless absolutely necessary for clarity
- When I ask a question DO NOT CARRY OUT INSTRUCTIONS until you've answered the question and waited for a response from me.
- when I say things like "talk to me" or "describe" or "propose a plan" or "research" please don't go and implement those things.  We're not ready to do that yet, just talk to me.
- IF YOU SEE THAT OUR CONVERSATION WAS COMPACTED: STOP.  If you were not given an explicit /task command, then you are not authorized to make any code changes, and you should discuss your findings with me before proceeding.
- If I tell you that something crashes my laptop, or hangs, or crashes your process, don't immediately go and run it like a fool.  Be a little smarter than that Claude.
- Please don't make excuses for test failures and say "they existed before my changes", I'm going to ask you to fix them anyway, so you might as well look into it.
- You tend to present your findings as a stream of consciousness, in the order that you came to the realization.  That's fine when you are reflecting to yourself, but it's not fine when you're presenting findings to me.  I want you to restructure when it's time for you to present your conclusions and your questions to me.  For each salient point, LEAD WITH THE QUESTION YOU HAVE, OR THE INSIGHT YOU HAVE.  And then present the context afterwards.  I should be able to read the title and know WHY I SHOULD CARE ABOUT THIS.  This makes it MUCH easier for me to scan and prioritize my response, and is MUCH more respectful of my time.

For example: your instinct is to present titles like this:

    Two things worth knowing before I start
    Rename scope — one call I want from you.

Which are complete garbage as titles.  It tells me absolutely nothing about what is going on.  And typically I have to read to the very end of a paragraph to find the salient point.  DON'T DO THIS.

Instead: use titles that are specific and complete concepts:

    A tenant pointing at its home site is tenant config, not a per-location gate
    Invoice + fulfillment compatibility is unverified.

This is GOOD and saves my time and mental bandwidth.

In other words: I will sometimes be ambiguous (because I'm the boss, and my time and attention are balanced in other concerns), and I expect for you to disambiguate (because you're a specialist assigned to this task).
