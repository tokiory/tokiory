---
name: mise
description: Guide for managing runtimes, tools, configuration, and tasks with mise. Use when users ask how to search/install/use/uninstall runtimes or tools, edit mise.toml, or define and run TOML-based tasks.
---

# mise Runtime and Task Management

## Overview

This skill helps with common `mise` workflows:
- Searching for available tools and runtime versions
- Installing tools/runtimes and adding them to config
- Using runtimes in project, global, or one-off contexts
- Understanding and editing `mise.toml`
- Uninstalling runtimes/tools cleanly
- Defining and running TOML-based tasks

Use this when the user is working with development toolchains (Node, Python, Go, etc.) through `mise`.

## Core Concepts

- `mise search`: find tools in registry
- `mise ls-remote`: list available runtime versions for a tool
- `mise install`: install runtime(s)
- `mise use`: install runtime(s) and write selection to config (`mise.toml` by default)
- `mise shell` / `mise exec`: use runtime(s) for current shell or one command
- `mise uninstall`: remove installed runtime(s) from disk
- `mise unuse`: remove runtime entries from config file
- `mise tasks` / `mise run`: list/manage/run tasks

## When to Use This Skill

Use this skill when users ask to:
- Find a runtime/tool version to install
- Add, pin, or switch runtime versions in a project
- Explain `mise.toml` layout and merge behavior
- Remove runtimes from machine and/or config
- Define project automation via `[tasks]` or `[tasks.<name>]`

## General Workflow

### 1) Search for a tool and runtime versions

Find tool names in the registry:

```bash
mise search node
mise registry node
```

- `mise search [NAME]` supports match types (`equal`, `contains`, `fuzzy`)
- `mise registry [NAME]` shows installable tools (optionally filtered by backend)

Find installable versions for a tool:

```bash
mise ls-remote node
mise ls-remote node@20
```

- `mise ls-remote [TOOL@VERSION] [PREFIX]` lists remote versions
- Useful for deciding whether to use pinned (`20.11.1`) or fuzzy (`20`) versions

### 2) Install runtime/tool

Install without writing config:

```bash
mise install node@20
mise install python@3.12
```

Install and save to config in one step:

```bash
mise use node@20
mise use python@3.12
```

Common patterns:

```bash
mise use --pin node@20      # save exact resolved version
mise use --fuzzy node@20    # save fuzzy version
mise use -g node@20         # write to global config
mise use -e dev node@20     # write to env-specific config (mise.dev.toml)
```

Notes:
- `mise install` only installs runtime(s)
- `mise use` installs runtime(s) and modifies config file

### 3) Use runtime(s)

Project/global usage via config:
- Put versions in `mise.toml` (or global config) and run commands normally after activation

Temporary usage in current shell session:

```bash
mise shell node@20
```

One-off command with explicit runtime(s):

```bash
mise exec node@20 -- node -v
mise x python@3.12 -- python -V
```

Inspect active/installed state:

```bash
mise ls
mise which node
mise where node
```

### 4) Configure with `mise.toml`

`mise.toml` is the main project config format. Common sections:
- `[tools]` for runtimes/tools
- `[env]` for environment variables
- `[tasks]` / `[tasks.<name>]` for tasks
- `[settings]` for mise behavior

Minimal example:

```toml
[env]
NODE_ENV = "production"

[tools]
node = "20"
python = "3.12"

[tasks.build]
run = "npm run build"
```

Common file locations (project scope):
- `mise.toml`
- `mise.local.toml` (local overrides; usually not committed)
- `.mise/config.toml`
- `.config/mise.toml`

Merge behavior highlights:
- Config is hierarchical: deeper directory config overrides parent config
- `[tools]`, `[env]`, `[settings]` merge additively with key overrides
- Individual tasks are replaced by task name when redefined

Useful commands:

```bash
mise config   # show loaded config/files
mise cfg      # inspect config resolution order
mise fmt      # format mise.toml
```

### 5) Uninstall runtime/tool

Remove installed versions from disk:

```bash
mise uninstall node@20
mise uninstall --all node
```

Remove tool/runtime entries from config:

```bash
mise unuse node@20
mise unuse -g node@20
```

Behavior:
- `mise uninstall`: disk cleanup (installed artifacts)
- `mise unuse`: config cleanup (`mise.toml` / selected config file)

If needed, prune unused installs:

```bash
mise prune
```

## TOML-based Tasks

Tasks can be simple or detailed.

Trivial form:

```toml
[tasks]
build = "cargo build"
test = "cargo test"
```

Detailed form:

```toml
[tasks.build]
description = "Build project"
run = "cargo build"
alias = "b"

[tasks.test]
depends = ["build"]
run = [
  "cargo test",
  "./scripts/test-e2e.sh",
]

[tasks.release]
confirm = "Are you sure?"
file = "scripts/release.sh"
```

Common task fields:
- `run`: string or array of commands
- `depends`: task dependencies to run first
- `description`, `alias`
- `dir`: working directory for task
- `env`: task-scoped environment variables
- `sources` / `outputs`: up-to-date checks
- `shell` or shebang in multiline `run`
- `file`: execute local or remote script
- `confirm`: prompt before running

Task commands:

```bash
mise tasks ls
mise tasks add build -- cargo build
mise run build
mise run test ::: lint
```

Argument recommendation:
- Prefer the `usage` field for task arguments
- Avoid deprecated Tera argument helpers (`arg()`, `option()`, `flag()`) in new configs

## Quick Command Reference

Search:

```bash
mise search <name>
mise registry <name>
mise ls-remote <tool>
```

Install/use:

```bash
mise install <tool@version>
mise use <tool@version>
mise shell <tool@version>
mise exec <tool@version> -- <command>
```

Uninstall/remove config:

```bash
mise uninstall <tool@version>
mise unuse <tool@version>
```

Tasks:

```bash
mise tasks ls
mise tasks add <task> -- <command>
mise run <task>
```

## Resources

- Configuration: https://mise.jdx.dev/configuration.html
- TOML tasks: https://mise.jdx.dev/tasks/toml-tasks.html
- Task configuration reference: https://mise.jdx.dev/tasks/task-configuration.html
