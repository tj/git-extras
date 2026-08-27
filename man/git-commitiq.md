git-commitiq(1) -- semantic commit summaries as a git subcommand
==================================

## SYNOPSIS

`git commitiq` [git commit args...]  
`git commitiq commit` [git commit args]  
`git commitiq setup` [--provider <p>] [--api-key <key>] [--model <m>]  
`git commitiq config` <get|set|unset|list> [<key> [<val>]]  
`git commitiq notes-enable` [remote]  
`git commitiq push` [git push args]  
`git commitiq show` <sha>  
`git commitiq log`  

## DESCRIPTION

**git-commitiq** runs a normal `git commit` and then asks a configured LLM
(Anthropic, OpenAI, Gemini, Ollama, a local OpenAI-compatible endpoint, or a
local CLI tool) to produce a structured JSON summary of the diff. That summary
is attached to the commit as a [git note](https://git-scm.com/docs/git-notes)
(`refs/notes/commits`).

Because the notes ref is automatically configured on the first commit in a
repo, `git push` / `git fetch` will include the notes without any manual
setup step.

### Supported providers

  * **anthropic** - Claude models via the Anthropic Messages API
  * **openai** - GPT models via the OpenAI Chat Completions API
  * **gemini** - Gemini models via the Google Generative Language API
  * **ollama** - Local models served by Ollama (no API key needed)
  * **local** - Any local server with an OpenAI-compatible `/chat/completions` endpoint (e.g. LM Studio, LocalAI)
  * **cli** - Any local CLI tool that reads stdin and writes to stdout (e.g. `agy`, `claude`, `aichat`, `llm`)

## OPTIONS

  * `<git commit args>`:
    All arguments are forwarded to `git commit`. If the commit fails,
    no LLM call is made and no note is attached.

  * `setup [--provider <p>] [--api-key <key>] [--model <m>]`:
    Interactive setup wizard or non-interactive via flags.

  * `config get|set|unset|list`:
    Manage provider, model, api_key, endpoint, and command config values.

  * `notes-enable [remote]`:
    Configure the repository so `git push` / `git fetch` also syncs git
    notes. Called automatically on the first commitiq commit.

  * `push [args]`:
    Like `git push`, but also syncs `refs/notes/*` when appropriate.

  * `show <sha>`:
    Print the stored JSON summary for the given commit.

  * `log`:
    List commits that have a stored summary.

## JSON SCHEMA

The note attached to each commit is a single JSON object:

```json
{
  "type": "feat|fix|refactor|docs|chore|test|perf|build|ci|revert|style",
  "scope": "",
  "summary": "imperative summary under 60 characters",
  "description": "2-4 sentences on what changed and why it matters",
  "changed_files": ["exact file paths from the diff"],
  "breaking_change": false,
  "review_notes": ""
}
```

## EXAMPLES

Commit with an automatic summary:

```bash
$ git commitiq -m "fix login bug"
```

Set up Anthropic as the provider:

```bash
$ git commitiq setup --provider anthropic --api-key sk-ant-... --model claude-3-5-sonnet-latest
```

View a stored summary:

```bash
$ git commitiq show a1b2c3
```

Push commits and notes together:

```bash
$ git commitiq push origin main
```

## ENVIRONMENT

  * `ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, `GEMINI_API_KEY`, `GOOGLE_API_KEY`:
    API keys can be set via environment variables as an alternative to
    `git commitiq setup`.

  * `COMMITIQ_PROVIDER`:
    Force a specific provider (lowercase: `anthropic`, `openai`, etc.).

## FILES

  * `~/.commitiq/config`:
    Persistent configuration file (key=value format, permissions 600).

  * `.commitiq/.commitiq.log`:
    Per-repo log file for LLM request errors.

## AUTHOR

Written by commitiq contributors.

## REPORTING BUGS

<&lt;<https://github.com/tj/git-extras/issues>&gt;>

## SEE ALSO

<&lt;<https://github.com/tj/git-extras>&gt;>