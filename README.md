# SocialTap MCP Server

Live public social media data for Claude, ChatGPT, Cursor and any MCP client: posts, profiles, comments and transcripts from LinkedIn, Reddit, X (Twitter), Instagram, YouTube, TikTok, Facebook and 23 more platforms, read when your agent asks.

- **Server URL:** `https://socialtap.dev/mcp` (remote, Streamable HTTP). Nothing to install or run.
- **Sign-in:** your client opens a browser the first time (OAuth). No key in a config file, and no login to any social platform.
- **Read-only:** every data tool reads public data. It never posts or acts as anyone.
- **Docs:** [socialtap.dev/mcp](https://socialtap.dev/mcp/) · [For AI agents](https://socialtap.dev/docs/agents/) · [llms.txt](https://socialtap.dev/llms.txt)

## Connect

### Claude Code

```shell
claude mcp add --transport http socialtap https://socialtap.dev/mcp
```

([examples/claude-code/add.sh](examples/claude-code/add.sh))

### Claude Code (.mcp.json)

```json
{
  "mcpServers": {
    "socialtap": {
      "type": "http",
      "url": "https://socialtap.dev/mcp"
    }
  }
}
```

([examples/claude-code/.mcp.json](examples/claude-code/.mcp.json))

### Claude Desktop and claude.ai

```
Customize → Connectors → + Add → Add custom connector
Name: SocialTap
Remote MCP server URL: https://socialtap.dev/mcp
Continue, choose "Sign in now", then Add.
```

([examples/claude-desktop-and-claude-ai/steps.txt](examples/claude-desktop-and-claude-ai/steps.txt))

### Cursor (mcp.json)

```json
{
  "mcpServers": {
    "socialtap": {
      "url": "https://socialtap.dev/mcp"
    }
  }
}
```

([examples/cursor/mcp.json](examples/cursor/mcp.json))

### VS Code (mcp.json)

```json
{
  "servers": {
    "socialtap": {
      "type": "http",
      "url": "https://socialtap.dev/mcp"
    }
  }
}
```

([examples/vs-code/mcp.json](examples/vs-code/mcp.json))

### Codex

```shell
codex mcp add socialtap --url https://socialtap.dev/mcp
codex mcp login socialtap
```

([examples/codex/add.sh](examples/codex/add.sh))

### Codex (config.toml)

```toml
[mcp_servers.socialtap]
url = "https://socialtap.dev/mcp"
```

([examples/codex/config.toml](examples/codex/config.toml))

### ChatGPT

```
chatgpt.com/plugins → + → Add custom MCP server
Name: SocialTap
Server URL: https://socialtap.dev/mcp
Authentication: OAuth
Create, install it, then pick it with @ in a chat.
```

([examples/chatgpt/steps.txt](examples/chatgpt/steps.txt))

### Gemini CLI

```shell
gemini mcp add --transport http socialtap https://socialtap.dev/mcp
```

([examples/gemini-cli/add.sh](examples/gemini-cli/add.sh))

### Gemini CLI (settings.json)

```json
{
  "mcpServers": {
    "socialtap": {
      "httpUrl": "https://socialtap.dev/mcp"
    }
  }
}
```

([examples/gemini-cli/settings.json](examples/gemini-cli/settings.json))

### Windsurf (Devin)

```shell
devin mcp add -s user socialtap https://socialtap.dev/mcp
devin mcp login socialtap
```

([examples/windsurf-devin/add.sh](examples/windsurf-devin/add.sh))

### With an API key

```shell
claude mcp add --transport http socialtap https://socialtap.dev/mcp \
  --header "authorization: Bearer $SOCIALTAP_API_KEY"
```

([examples/with-an-api-key/add.sh](examples/with-an-api-key/add.sh))

Then sign in once, in each client's own way:

- **Claude Code**: run `/mcp`, pick `socialtap` and choose Authenticate. Until then its tools answer that you need to sign in.
- **Claude Desktop and claude.ai**: choose Sign in now when you add the connector. On Team and Enterprise plans an owner adds it under Organization settings → Connectors (Add → Custom → Web), then each member clicks Connect under Customize → Connectors.
- **Cursor**: sign in from the server's entry in Cursor Settings; your browser opens.
- **VS Code**: your browser opens on the first connection.
- **Codex**: run `codex mcp login socialtap`.
- **ChatGPT**: choose OAuth when you add the server; ChatGPT opens the sign-in. Custom MCP servers depend on your ChatGPT plan and workspace settings.
- **Gemini CLI**: run `/mcp auth socialtap`.
- **Windsurf (Devin)**: run `devin mcp login socialtap`.

## Tools

What a client lists by default:

| Tool | What it does |
| --- | --- |
| `find_endpoint` | Find which SocialTap tool and endpoint serves a need ("TikTok comments", "YouTube transcript") or a link: returns the best matches with the tool and arguments to call, the price, the parameters and an example result. |
| `get_post` | Public posts (videos, reels, shorts, photos, carousels, tweets and text) with their author, text, media, and views, likes and comments. |
| `list_posts` | The posts of a profile, a page per call: public posts (videos, reels, shorts, photos, carousels, tweets and text) with their author, text, media, and views, likes and comments. |
| `get_profile` | Public accounts (creators, channels, pages, companies, communities) with their bio, links, and follower and post counts. |
| `list_comments` | The comments of a post, a page per call: public comments and replies with their author, text, place in the thread, and like and reply counts. |
| `get_transcript` | Timed transcripts of public videos: the platform's caption track, or speech-to-text on the audio when there is none. |
| `get_engagement` | Engagement rate, average views, likes and comments, posting cadence and top post for an account, computed from its recent posts the same way on every platform. |
| `search` | Search a platform by query for ads, advertisers, albums, channels, comments, communities, events, groups, hashtags, issues, jobs, places, playlists, podcasts, posts, products, profiles, repositories, sounds, suggestions or top. |
| `call_endpoint` | Call any endpoint by the ID find_endpoint gives (tiktok.sound_posts), with the arguments it gives: the data the other tools here don't cover. |
| `search_docs` | Search the SocialTap docs (guides, the API reference, error codes, schemas, pricing) for a question or term: returns the best-matching sections with their page, a snippet and the path to read with read_doc. |
| `read_doc` | Read one SocialTap docs page as Markdown: a path from search_docs or llms.txt (/docs/pagination/), or a full docs URL. |
| `get_account` | Get the account, balance and calling key. |

Add `?tools=all` to the server URL to list every tool, or name toolsets: `data`, `docs`, `jobs`, `account`, `all`.

## Platforms

| Platform | Tools | Data |
| --- | ---: | --- |
| [LinkedIn MCP](https://socialtap.dev/mcp/linkedin/) | 18 | Posts, profiles, comments, transcripts and more |
| [Reddit MCP](https://socialtap.dev/mcp/reddit/) | 10 | Posts, profiles, comments, transcripts and more |
| [X (Twitter) MCP](https://socialtap.dev/mcp/x/) | 14 | Posts, profiles, comments, transcripts and more |
| [Instagram MCP](https://socialtap.dev/mcp/instagram/) | 24 | Posts, profiles, comments, transcripts and more |
| [YouTube MCP](https://socialtap.dev/mcp/youtube/) | 6 | Posts, profiles, comments, transcripts and more |
| [TikTok MCP](https://socialtap.dev/mcp/tiktok/) | 28 | Posts, profiles, comments, transcripts and more |
| [Facebook MCP](https://socialtap.dev/mcp/facebook/) | 20 | Posts, profiles, advertisers, comments and more |
| [Threads MCP](https://socialtap.dev/mcp/threads/) | 5 | Posts, profiles and comments |
| [GitHub MCP](https://socialtap.dev/mcp/github/) | 18 | Profiles, comments, repositories, issues and more |
| [Spotify MCP](https://socialtap.dev/mcp/spotify/) | 8 | Tracks, artists, playlists, albums and more |
| [Hacker News MCP](https://socialtap.dev/mcp/hackernews/) | 10 | Stories, users, comments and jobs |
| [Amazon MCP](https://socialtap.dev/mcp/amazon/) | 10 | Posts, profiles, playlists, products and more |
| [Apple Music MCP](https://socialtap.dev/mcp/applemusic/) | 7 | Tracks, artists, playlists and albums |
| [Pinterest MCP](https://socialtap.dev/mcp/pinterest/) | 10 | Pins, profiles, boards, topics and more |
| [Rumble MCP](https://socialtap.dev/mcp/rumble/) | 7 | Posts, profiles, comments, transcripts and more |
| [Google Ads Transparency Center MCP](https://socialtap.dev/mcp/google/) | 4 | Advertisers, ads and suggestions |
| [Bluesky MCP](https://socialtap.dev/mcp/bluesky/) | 5 | Posts, profiles and comments |
| [Twitch MCP](https://socialtap.dev/mcp/twitch/) | 5 | Videos, profiles, transcripts and livestreams |
| [Telegram MCP](https://socialtap.dev/mcp/telegram/) | 4 | Posts, channels and web results |
| [TikTok Shop MCP](https://socialtap.dev/mcp/tiktokshop/) | 4 | Products and reviews |
| [Kwai MCP](https://socialtap.dev/mcp/kwai/) | 3 | Posts and profiles |
| [Snapchat MCP](https://socialtap.dev/mcp/snapchat/) | 3 | Spotlights, profiles and comments |
| [SoundCloud MCP](https://socialtap.dev/mcp/soundcloud/) | 3 | Tracks and artists |
| [Truth Social MCP](https://socialtap.dev/mcp/truthsocial/) | 3 | Posts and profiles |
| [Kick MCP](https://socialtap.dev/mcp/kick/) | 2 | Posts and transcripts |
| [Komi MCP](https://socialtap.dev/mcp/komi/) | 1 | Pages |
| [Lnk.Bio MCP](https://socialtap.dev/mcp/linkbio/) | 1 | Profiles |
| [Linkme MCP](https://socialtap.dev/mcp/linkme/) | 1 | Profiles |
| [Linktree MCP](https://socialtap.dev/mcp/linktree/) | 1 | Profiles |
| [Pillar MCP](https://socialtap.dev/mcp/pillar/) | 1 | Pages |

## Example

> Get me the LinkedIn post at linkedin.com/feed/update/urn:li:activity:7522801130767224832.

The agent calls `get_post`:

```json
{
  "platform": "linkedin",
  "url": "https://www.linkedin.com/feed/update/urn:li:activity:7522801130767224832/"
}
```

and reads a recorded answer like this one (long text and lists shortened):

```json
{
  "credits_charged": 1,
  "data": {
    "platform": "linkedin",
    "id": "7522801130767224832",
    "url": "https://www.linkedin.com/feed/update/urn:li:activity:7522801130767224832",
    "type": "link",
    "title": "World Bank says ‘small AI’ could transform developing countries",
    "text": "Useful advice for farmers, in their own language, on a phone they already have in their p…",
    "published_at": "2026-11-01T23:25:56Z",
    "author": {
      "username": "williamhgates",
      "display_name": "Bill Gates"
    },
    "hashtags": [],
    "metrics": {
      "comment_count": 242,
      "like_count": 1344
    }
  },
  "meta": {
    "platform": "linkedin",
    "source": "page",
    "is_cached": false,
    "fetched_at": "2026-10-25T12:00:00Z",
    "input": {
      "kind": "post",
      "id": "7522801130767224832",
      "url": "https://www.linkedin.com/feed/update/urn:li:activity:7522801130767224832"
    }
  }
}
```

## Pricing

A tool call costs what the same API request costs, from 1 credit. Failed requests are free. Every account starts with 100 free credits. Listing the tools, `find_endpoint` and the docs tools are free and need no account. [Pricing](https://socialtap.dev/pricing/).

## MCP Registry

Listed in the official MCP Registry as `dev.socialtap/mcp`: [server.json](server.json).

## Without MCP

The same data is a REST API with one key and one JSON schema: [socialtap.dev/apis](https://socialtap.dev/apis/).

---

This repository is generated from the SocialTap catalog. Questions: support@socialtap.dev.
