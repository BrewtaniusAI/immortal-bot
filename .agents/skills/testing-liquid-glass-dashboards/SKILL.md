# Testing CollectiveOS Liquid Glass Dashboards

## Overview
All CollectiveOS repos have standalone HTML dashboards using the "Liquid Glass" design system. These are static HTML files that can be tested via `file://` protocol — no server needed.

## Dashboard Locations
- **sfo-app** (Tier 1, most complex): `sfo_app/static/index.html` — 6 nav pages, API integration hooks
- **immortal-bot** (Tier 2): `dashboard/index.html` — QC→GATA→GATA PRIME governance pipeline
- **sentinel-engine-v2**: `dashboard/index.html` — Bevy ECS visualization
- **PAT**: `dashboard/index.html` — Provenance Audit Trail
- **constraint-engine**: `dashboard/index.html` — ELFE constraint visualization
- **collectiveos-onboarding-wizard**: `dashboard/index.html` — 5-step onboarding
- **aion-holodeck**: `dashboard/index.html` — Temporal simulation control
- **sovereign-ai-ide**: `dashboard/index.html` — IDE upgrade manager
- **welcome-to-working-copy**: `dashboard/index.html` — JS showcase
- **unified-framwork**: `dashboard/index.html` — Research paper viewer
- **Sprectral-Sandbox**: `dashboard/index.html` — Spec viewer
- **test-repo**: `dashboard/index.html` — Integration status page

## How to Open
```bash
google-chrome "file:///home/ubuntu/repos/{repo-name}/dashboard/index.html"
# For sfo-app specifically:
google-chrome "file:///home/ubuntu/repos/sfo-app/sfo_app/static/index.html"
```

## Shared Interactive Features to Test
All dashboards share these features (implemented in inline JS):

### 1. Sidebar Navigation
- Click nav buttons to switch pages
- Active button gets cyan left border and cyan text (#22d3ee)
- Only one page visible at a time (others hidden via `display:none`)
- Navigate function hides all `[id^="page-"]` divs and shows selected

### 2. Command Palette (Ctrl+K / ⌘K)
- Opens dark backdrop overlay with centered search box
- Type to filter commands (case-insensitive substring match)
- Press Escape to close
- **Known issue**: Clicking the dark backdrop does NOT close the palette (the `onclick="if(event.target===this)..."` pattern fails because a child div intercepts clicks). ESC always works.

### 3. AI Chat Sidebar
- Click the AI button at sidebar bottom (has pulsing dot + "AI" label)
- Panel slides in from right via CSS `translate-x-full` → `translate-x-0`
- Type a message and press Enter or click Send
- AI responds with canned keyword-matched responses after ~500ms delay
- Close via ✕ button
- **Known issue**: Incomplete HTML escaping — `&` not escaped to `&amp;` before `<` to `&lt;` in `sendChat()`

### 4. EU AI Act Transparency Labels
- Purple "AI" badges (`.ai-label` class) on AI-generated content sections
- Cyan/teal "AI MONITORED" labels on telemetry sections
- Required for EU AI Act Article 50 compliance

## Key AI Chat Keywords (per dashboard)

### sfo-app
- "avatar" or "mood" → response about calm state and Latencin levels
- "vcon" → response about virtual constructs
- "proof" or "vault" → response about hash-chained WORM log
- "drift" → response about constraint engine convergence
- Default fallback for unmatched queries

### immortal-bot
- "qc" → response about qc_validate.sh PASSED
- "safety" or "silence" → response about Silence Clause and AG-07
- "gata" → response about sandboxed testing
- "mortality" or "version" → response about AG-03 version termination

## Design System Verification Checklist
- [ ] Dark navy background (#05060a) — NOT white
- [ ] Glass-morphism cards with `backdrop-filter: blur(16px)`
- [ ] Tailwind CDN loaded (requires internet connection)
- [ ] Google Fonts loaded (Inter)
- [ ] Micro-animations: fade-in on page load, pulse-glow on status indicators
- [ ] Responsive grid: cards reflow on window resize

## CI Patterns
- Most repos use GitHub Actions for CI
- Dashboard PRs only add HTML files — CI should pass unless pre-existing build failures exist
- sentinel-engine-v2 has pre-existing Rust build failures (macOS curl + WASM incompatibility) unrelated to dashboard HTML

## Testing Tips
- Use `file://` protocol — no server needed for standalone dashboards
- Maximize browser window before recording: `wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz` (install wmctrl first: `sudo apt-get install -y wmctrl`)
- Test 3 representative dashboards (Tier 1 + Tier 2 + Tier 3) rather than all 12 for efficiency
- Command palette uses Ctrl+K on Linux (not ⌘K)
- AI chat responses are canned (keyword-matched in JS), not connected to real AI

## Devin Secrets Needed
None — dashboards are static HTML files opened via file:// protocol.
