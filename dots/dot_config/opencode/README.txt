=== Skills===
- ast-grep: ast-grep rules to perform structural code search and analysis.

- jq: JSON processing, parsing, and manipulation. Preferred for all JSON formatting, filtering, transformations, and analysis.

- mise: Managing runtimes, tools, configuration, and tasks with mise.


=== Agents ===
- chat [primary]: Chat with agent as in web version.
  Chat-only assistant mode - answers questions, explains concepts, helps with planning/decision-making. Does NOT inspect codebase or run shell commands unless explicitly asked.

- cli-query [primary, hidden]: Fast, direct query agent for terminal use.
  Provides immediate, concise answers without thinking steps or continuing dialogue. Uses github-copilot/gpt-5-mini with low temperature and minimal verbosity.


=== Models ===
- Primary: github-copilot/gpt-5.3-codex
  Used for main coding tasks and complex reasoning

- Quick queries: github-copilot/gpt-5-mini
  Used for fast, direct answers and busy work (cli-query agent)

**Note**
  Primary models are accessed through the `opencode-openai-codex-auth` plugin.

  Models like gpt-5-mini are free on copilot pro subscription, so we're using it for inline completion, CLI queries and inline prompting
