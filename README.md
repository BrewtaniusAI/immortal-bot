# Immortal Bot — OpenClaw Governance Agent

[![CI](https://github.com/BrewtaniusAI/immortal-bot/actions/workflows/ci.yml/badge.svg)](https://github.com/BrewtaniusAI/immortal-bot/actions/workflows/ci.yml)
[![Zenodo](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.17053441-blue)](https://doi.org/10.5281/zenodo.17053441)
[![License](https://img.shields.io/badge/license-Patent--Free-brightgreen)](#license)

**A governed OpenClaw-compatible agent implementing the QC → GATA → GATA PRIME governance pipeline.**

> Part of the [CollectiveOS](https://github.com/BrewtaniusAI) ecosystem — the governance enforcement layer for all autonomous actions.

---

## Overview

Immortal Bot is the governance backbone of the CollectiveOS stack. It enforces the three-stage QC → GATA → GATA PRIME pipeline, ensuring that every autonomous action undergoes quality control, automated testing, and formal verification before execution. The bot adheres to principles from *A Framework for Patent-Free Science* and the GOD FILE v∞.1 specification.

---

## Governance Pipeline

```
QC (Quality Control) → GATA (Testing) → GATA PRIME (Formal Verification)
```

### Pipeline Stages

| Stage | Purpose | Enforcement |
|-------|---------|-------------|
| **QC Gate** | Self-audit of planned code/commands | Compliance with OpenClaw safety standards |
| **GATA** | Sandboxed simulation and edge-case testing | Automated test execution and log documentation |
| **GATA PRIME** | Production-grade formal verification | High-fidelity audit trail and semantic interoperability |

### GOD FILE Add-Ons (AG-01 through AG-07)

| Add-On | Title | Enforcement |
|--------|-------|-------------|
| **AG-01** | Repository-Bound Intelligence | No trans-repo identity or memory persistence |
| **AG-02** | Evaluation-Before-Authority | No authority without passing evaluation harness |
| **AG-03** | Agent Version Mortality | No immortal agent versions; explicit deprecation required |
| **AG-04** | Tool Sovereignty Constraint | Explicit tool declaration with pre/post conditions |
| **AG-05** | Multi-Agent Containment Law | Role isolation; no plan+execute+validate in same lane |
| **AG-06** | Non-Proliferation Clause | Fork hazard classification and clean-room mirror rules |
| **AG-07** | Refusal Is First-Class | Refusal is success; tested refusal pathways required |

---

## Quickstart

```bash
# Validate governance payload
bash qc_validate.sh

# Run governance checks
python -m immortal_bot.validate
```

---

## Dashboard

Immortal Bot includes an AI-integrated **Liquid Glass** governance dashboard (`dashboard/index.html`) providing:

- Full QC → GATA → GATA PRIME pipeline visualization
- Real-time governance status monitoring (COMPLIANT / DRIFT / VIOLATION)
- GOD FILE Add-Ons viewer (AG-01 through AG-07)
- Proof Vault integrity inspection
- Safety boundary analysis
- Governance AI chat with context-aware responses
- Command palette (`Ctrl+K`) with fuzzy search
- EU AI Act transparency labels

Open `dashboard/index.html` in any browser to launch.

---

## Repository Structure

```
immortal-bot/
├── dashboard/                # Liquid Glass governance dashboard
│   └── index.html
├── .github/workflows/        # CI pipeline
├── AGENTS.md                 # Agent directives (QC → GATA → GATA PRIME)
├── GOVERNANCE.md             # Governance framework documentation
├── ONBOARDING.md             # Contributor onboarding guide
├── CONTRIBUTING.md           # Contribution guidelines
├── CITATION.cff              # Citation metadata
├── feature_flags.yml         # Feature lifecycle management
└── qc_validate.sh            # QC validation script
```

---

## Governance Workflow

- Use **Proposal (Lazy consensus)** issues for changes in direction
- Routine timebox: **72 hours**
- Governance/licensing/publication timebox: **7 days**

---

## Alignment

This project adheres to principles from [A Framework for Patent-Free Science](https://doi.org/10.5281/zenodo.17053441). By integrating open access, reproducibility, and collaborative principles into its governance, it aligns with ongoing efforts to promote non-commercial innovation.

---

## CollectiveOS Integration

- **Silence Clause** — If constraints cannot be verified, the system refuses and remains silent
- **ELFE Kernel** — Fixed-time convergence stability guarantees
- **Proof Vault** — WORM receipt logging for every governance action
- **Isomorphic Closure Invariant** — Root law enforcement across all layers

---

## License

Patent-free. See `CITATION.cff` for citation metadata.
