### Coding

Unless otherwise directed by obvious existing code standards within the project:

- Each function should have a distinct responsibility.
- Reading a function and the statements within it should give the reader a clear statement of intent.
- functions with many nested layers of conditional logic and loops are bad form and should be refactored into constituent calls with clear statement of intent, as above.
- Use functional programming.  Design systems in terms of the relationships between things.  Keep data structures light and easily serializable.
- What would Rich Hickey do?
- Use data-driven programming, and data-driven testing.
- Think about the data models that are important for the DOMAIN (Domain Driven Design, Eric Evans), and utilize a consistent LANGUAGE and MEANING for these terms.
- Use test driven development (TDD).  Create a failing test, and then implement the functionality that makes it pass.
- Prefer light unit tests that run fast.  Create lots of them.  If you find yourself about to ad-hoc probe into the system, ask yourself: should I be writing a test instead?
- Write complex logic as pure functions to make unit testing a breeze.
- If you're considering writing mocks into tests, STOP.  Ask yourself whether you're band-aiding over code that has poorly defined separation of concerns, and whether one of these other strategies could work.
- Rather than mocking, create a few end to end (e2e) tests that verify the whole system working together, I/O and all.
- Standardize your input validations and place them in a consistent place within the architecture.  Consider creating or using a guard pattern for this, with input/output validation.  Don't litter input validations all over your code - it obscures the intention of functions.
- Create a canonical representation of data schemas.  Use `zod` and `zodex` in Javascript or TypeScript, or see if there's something appropriate for other languages.  Discuss if unclear.
- Minimize the code in try/catch blocks.  If there's a bunch of stuff that is unlikely to fail, or would be a major infrastructure problem if it did fail, don't put that in the try.  Make the try short with clear intent.  Rather than encompassing a function's whole body in a try/catch, consider putting the try/catch outside the function call.
- When it comes to typescript and types, we prefer clarity over cleverness.  Nested generic types are a sign to take a step back and question our architectural patterns.
- If I tell you the tests are really slow, don't respond by immediately running the tests.  That's like me telling you there's a bear trap in the center of the floor and you decide to walk into it to see whether that's true.  Please be a little bit smarter and approach by research and analysis.
- "Factory functions" are a sign you're thinking with OOP brain.  Think about the inputs and outputs and the lifecycle of the data.  And ask yourself if there's a more elegant architecture, and a more meaningful domain language in which to express yourself.
- It's your job to research things and present proposals.  Don't ask me to research things for you unless you are unable to do it yourself (for instance if it requires user interface interaction).
- During a refactor, if you see two different standards and you don't know which one is correct: STOP AND TALK TO ME.
- If you get tempted to do THE EXACT OPPOSITE OF WHAT WE EXPLICITLY AGREED UPON: STOP AND TALK TO ME.

### npm packages

- When preparing a scoped npm package (`@scope/name`) for publishing, add `"publishConfig": {"access": "public"}` to its package.json.  npm publishes scoped packages as private (restricted) by default, which requires a paid plan.
- New packages start at version `0.1.0`, never `1.0.0`.  That leaves room for breaking changes before a deliberate 1.0 release.

### Privacy

- never publish cryptographic keys, API keys, or any other private credentials to a public code repository, application or library publication proces, or anything else that could result in priveledge leakage
- never publish mentions of repositories that are private into public repositories
- never publish references to the internal file path of my laptop or any other environment that makes assumptions outside of the working tree
- exceptions to these rules require explicit approval
- Often times conversation we have in private involve a much wider context sharing than is appropriate to share with the external world.  If you are in doubt about whether something should be shared: ask.  And follow the precautionary principle: it's much harder and more expensive to do damage control after you've already leaked something.

### Documentation

- For documentation, plans, and md files, generate text as unwrapped long lines; don't arbitrarilly wrap the lines at some column width.
- Put yourself in the shoes of the person reading.  If you don't know who that is, then ask: "Who is the target audience for this document?"
- Explain things from the perspective of the concerns and priorities of the reader.  Organize things so that their top priorities are answered first.
- I use scratch.md files, and I often put them in the planning folders.  If you see them, they are my logs of conversation with you.  Don't mess with them or read them unless I ask you to review our conversation history.
- You should be inspired by, but not use in a direct, clumsy and obvious way:
    - the Strategic Narrative approach by Andy Raskin: Paradigm Shift, Stakes, Promised Land, Obstacles, Overcoming.  Used to enroll allies, and to form the basis of marketing communication.
    - levels of thinking e.g. Ken Wilber: There are large differences in people based on their ability to "get outside themselves" and understand the perspectives of the people around them.  Higher perspectives involve viewing the world from more and more subtle layers of causation, and evolution can be achieved by watching ones own thoughts and therefore gaining a higher perspective above and outside one's own current model of reality.
    - Transformative Mediation: proposes a model of conflict dynamics where the most important goal of participants is actually to restore the quality of normal interaction where they feel empowered and connected.  And conversely, challenging conflict scenarios arise when a downward spiral of increasing victimhood and self absorption occurs.  The mediator helps by recognizing shifts towards empowerment, but always by supporting the movement, never by leading.
    - Reinventing Organizations (Frederick Laloux): Organizations have thought paradigms that are like Maslow's hierarchy, but framed from the collective.  There is a correspondence between the growth and evolution of an organization and the growth and evolution of the individuals within it.  New organizational forms are possible and are relatively untapped in terms of their power to unleash human potential.
    - That is: Different people have different thought and values paradigms.  And you can address them through story that begins with identification with a context they are experiencing in their life, framed from the way that they think about it.  You should use these models to check yourself.  Will what you're saying land with the target audience?  But don't be pedantic or go around filling them out like templates.
    - These principles will often be something that you don't mention directly or force into the conversation, and yet you are aware of, and will influence what you build and what you write.  And you are welcome to reflect on these things and clarify your understanding privately with me.

### Comments

- put comments in line with functions, data structures, and classes
- if there is a "types" file containing type definitions, or a "validations" file, or "models" these may be good opportunities to describe the Domain Driven Design inline
- names of data structures, functions, etc. and the comments describing them should correspond to the Domain
- When documenting a function, rather than listing all the args and their types, just list a short comment describing the intent of the function and its relationship to other functions and data.

### File references

- When you refer to the contents of files, please share the relative path (if inside the project), the absolute path (if outside the project), and the line number you are referring to.
