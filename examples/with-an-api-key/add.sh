claude mcp add --transport http --scope user socialtap https://socialtap.dev/mcp \
  --header "Authorization: Bearer $SOCIALTAP_API_KEY"

codex mcp add socialtap --url https://socialtap.dev/mcp --bearer-token-env-var SOCIALTAP_API_KEY

grok mcp add --transport http socialtap https://socialtap.dev/mcp \
  --header 'Authorization: Bearer ${SOCIALTAP_API_KEY}'
