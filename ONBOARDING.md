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

## Usage

Once onboarded, you can interact with Immortal Bot through OpenClaw commands:

### Run a governed task
```bash
openclaw run --agent immortal-bot --task "<describe your task here>"
```

The bot automatically invokes the QC→GATA→GATA PRIME pipeline before executing any significant action.

### Check agent status
```bash
openclaw status immortal-bot
```

### View audit trail
```bash
openclaw logs immortal-bot --tail 50
```

> **Note:** The bot operates in sandbox mode (`non-main`) by default. Promote to production only after GATA PRIME formal verification.

## Repository governance pipeline (high level)

The **QC→GATA→GATA PRIME** pipeline is mandatory for all autonomous agent actions:

1. **QC (Quality Control)**  
   Self-audit and static validation before any action. The bot checks planned code or commands against OpenClaw safety standards. Run locally with `bash ./qc_validate.sh`.

2. **GATA (Generalized Agent Test Automation)**  
   Automated simulation and stress tests in a sandboxed (`non-main`) environment. Tests for edge cases and unexpected failures; results are documented for future verification.

3. **GATA PRIME**  
   Advanced formal verification and certification standards for production-grade deployments. Requires a high-fidelity audit trail and semantic interoperability with other OpenClaw agents.

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

## Citing patent-free science principles

This project aligns with **‘A Framework for Patent-Free Science’**. If you reference this work in academic papers, reports, or derivative projects, please cite:

> *Immortal Bot* — BrewtaniusAI, [GitHub](https://github.com/BrewtaniusAI/immortal-bot)  
> Zenodo Dataset: [DOI 10.5281/zenodo.17053441](https://doi.org/10.5281/zenodo.17053441)

Or use the provided `CITATION.cff` file (parsed automatically by GitHub and Zenodo):

```bash
cat CITATION.cff
```

**Core principles you are citing:**
- **Open access**: All artefacts are publicly available with no access fees.
- **Reproducibility**: Contributions must include a Repro Pack (see above).
- **Non-commercial**: Downstream use must remain non-commercial per the project license.
- **Non-assert**: Contributors and users do not assert patents against this project or its users.

## Community guidelines

We are committed to an inclusive, respectful, and productive community. Please read and follow these guidelines:

1. **Be respectful.** Treat everyone with courtesy and professionalism. Harassment, discrimination, or personal attacks of any kind are not tolerated.

2. **Stay on topic.** Discussions, issues, and PRs should remain relevant to the project and its scientific/governance goals.

3. **Assume good faith.** When interpreting ambiguous messages, assume the best intent from fellow contributors.

4. **Honour lazy consensus.** Routine changes are open for 72 hours; governance or licensing changes are open for 7 days. Silence implies consent — speak up if you object.

5. **Keep it non-commercial.** Contributions must remain within the non-commercial terms of the license. Do not propose features that would benefit a proprietary or commercial product.

6. **Credit openly.** Acknowledge prior art and collaborators. Do not claim sole authorship of collectively produced work.

7. **Report concerns.** If you witness a violation of these guidelines, open an issue labelled `conduct` or contact a maintainer directly.

## Need help?
Open an issue and include:
- OS + version
- Node + npm versions
- OpenClaw version
- Output of `bash ./qc_validate.sh`