# Onboarding

Welcome to **Immortal Bot** — a governed OpenClaw-compatible agent built around a QC → GATA → GATA PRIME governance pipeline.

## Quickstart (users)

### Prerequisites
- Node.js + npm
- Bash (macOS/Linux; on Windows use WSL)
- Git

### Install OpenClaw
```bash
npm install -g openclaw@latest
```

### Clone into your OpenClaw workspace
```bash
mkdir -p ~/.openclaw/workspace
cd ~/.openclaw/workspace
git clone https://github.com/BrewtaniusAI/immortal-bot.git
cd immortal-bot
```

### Run onboard
```bash
openclaw onboard
```

## Repository governance pipeline (high level)

1. **QC (Quality Control)**  
   Static validation checks, repository policy checks, and “minimum bar” reproducibility checks.

2. **GATA (Generalized Agent Test Automation)**  
   Automated simulation/stress tests (to be implemented).

3. **GATA PRIME**  
   Advanced formal verification / certification standards (to be defined).

## QC: run validation locally

Run QC validation:
```bash
bash ./qc_validate.sh
```

If QC fails, fix issues locally and rerun until it passes before opening a PR.

## Contribution gate: OSNA-style non-assert pledge (required)

By contributing, you agree to an **Open Science Non-Assert (OSNA)-style** commitment: you will not assert patents against this project or downstream users for contributions and derivative works that are based on, derived from, or inspired by this repository.

This requirement is consistent with the repository license:
- `LICENSE` — **PATENT-FREE SCIENCE IN THE JANUS ERA License (v2.0)** (including “No Claim on Future Work” and non-commercial restriction)

### How to acknowledge the pledge
Include the following line in every PR description:

> I agree to the OSNA-style non-assert pledge for my contributions to this repository.

(If you need an organization-approved alternative statement, open an issue and propose wording.)

## How to contribute (contributors)

### 1) Read contributor guidance
- `CONTRIBUTING.md`
- `LICENSE`
- `TOOLS.md`
- `AGENTS.md` (if you are working on agent behavior/tooling)
- `SOUL.md` (project ethos / intent)

### 2) Pick an issue
Current project issues:
- #1 Defensive publication integration (Zenodo, DOI): https://github.com/BrewtaniusAI/immortal-bot/issues/1
- #2 Community forum/Founders Group setup: https://github.com/BrewtaniusAI/immortal-bot/issues/2
- #3 Draft HGSC (Human Global Science Collective) governance charter: https://github.com/BrewtaniusAI/immortal-bot/issues/3
- #4 First contribution call: Reproducible example (Repro Pack): https://github.com/BrewtaniusAI/immortal-bot/issues/4
- #5 Add onboarding instructions for project newcomers: https://github.com/BrewtaniusAI/immortal-bot/issues/5

### 3) Repro Pack (Reproducible Example) submission guide

A **Repro Pack** is a minimal, reproducible example that includes:
- Code
- Any required data (or a scripted download step)
- A deterministic environment definition
- A single command to run tests / demonstrate output

You can provide **Docker**, **Nix**, or **both**. For this project we prefer **both** when feasible.

#### Option A — Docker baseline
Include:
- `Dockerfile`
- A one-liner such as:
  ```bash
  docker build -t immortal-bot-repro .
  docker run --rm immortal-bot-repro
  ```

#### Option B — Nix baseline
Include:
- `flake.nix` (preferred) or `shell.nix`
- A one-liner such as:
  ```bash
  nix develop
  # then run the repro command
  ```

#### Acceptance criteria
- Works on a clean machine
- No secret tokens required
- Minimal steps, explicit versions
- Clear README snippet explaining expected output

## Need help?
Open an issue and include:
- OS + version
- Node + npm versions
- OpenClaw version
- Output of `bash ./qc_validate.sh`